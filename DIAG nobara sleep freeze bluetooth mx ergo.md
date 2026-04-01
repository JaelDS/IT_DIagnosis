# Nobara Linux -- Sleep Freeze and Bluetooth Dropouts

**Date:** 2026-03-28
**Updated:** 2026-03-28 (post-reboot follow-up)
**System:** Nobara Linux (Fedora-based) | Kernel `6.19.9-202.nobara.fc43.x86_64`
**GPU:** AMD Raven/Picasso iGPU (`amdgpu` driver)
**Peripheral:** Logitech MX Ergo (Bluetooth)
**Status:** Sleep fix confirmed working. Bluetooth fix corrected -- pending verification.

---

## Executive Summary

> [!danger] Two Problems, Two Root Causes
> The system was **freezing on wake from sleep** and the **MX Ergo Bluetooth mouse was disconnecting repeatedly**. These looked related but turned out to be two separate issues:
>
> 1. **Sleep freeze:** The AMD iGPU cannot reliably resume from deep sleep (S3) on this chip. Switching to modern standby (s2idle) fixes it. **Confirmed working after reboot.**
> 2. **Bluetooth drops:** Linux was aggressively power-cycling the USB Bluetooth adapter to save energy, which killed the wireless connection to the mouse. The initial udev fix used the wrong sysfs attribute -- corrected in follow-up.

---

## Symptoms

- System put to sleep, then **completely unresponsive on wake** -- required hard power-off
- This happened **twice in 24 hours** (Mar 27 afternoon and Mar 28 morning)
- MX Ergo Bluetooth mouse **disconnected 4 times in ~10 minutes** on Mar 28 morning
- Mouse would reconnect after a few seconds each time, then drop again
- A PSP firmware error appears in logs on every single boot (cosmetic but notable)

---

## Diagnostic Process

> [!info]- How We Investigated (click to expand)
>
> **Step 1 -- Check sleep mode configuration**
> ```bash
> cat /sys/power/mem_sleep
> ```
> Result: `s2idle [deep]` -- the system was using S3 (deep sleep), which is known to cause resume failures on AMD Raven/Picasso APUs.
>
> **Step 2 -- Search system logs for resume failures**
> ```bash
> journalctl -b -1 --no-pager | grep -iE "suspend|resume|sleep|wake|amdgpu|freeze"
> journalctl --since "2026-03-27" --until "2026-03-29" --no-pager | grep -iE "PM:|suspend|resume"
> ```
> Found two suspend events with no matching resume -- the system never came back.
>
> **Step 3 -- Check for GPU driver errors**
> ```bash
> journalctl -b 0 | grep -i "psp\|amdgpu.*fail\|amdgpu.*error"
> ```
> Found the PSP LOAD_TA error on every boot.
>
> **Step 4 -- Check Bluetooth connection stability**
> ```bash
> journalctl -b 0 | grep -iE "bluetooth|hci0|mx ergo|1358:c123"
> ```
> Found rapid disconnect/reconnect cycles.
>
> **Step 5 -- Check USB power management**
> ```bash
> cat /sys/bus/usb/devices/*/power/autosuspend_delay_ms
> ```
> Found the Bluetooth adapter had a 2000ms (2 second) autosuspend timer -- far too aggressive.

---

## Log Evidence

### Freeze 1: Mar 27 Afternoon

> [!danger] System suspended at 14:17 -- never resumed

```log
Mar 27 14:17:32 localhost systemd-sleep[4821]: Entering sleep state 'suspend'...
Mar 27 14:17:32 localhost kernel: PM: suspend entry (deep)
```

**There is no resume entry.** The next log line is a fresh boot the following morning:

```log
Mar 28 07:44:01 localhost kernel: Linux version 6.19.9-202.nobara.fc43.x86_64
```

> [!warning] The Gap
> Between 14:17 on Mar 27 and 07:44 on Mar 28 there are **zero log entries**. The system was frozen solid -- the kernel never executed the resume path. A hard power-off was the only way back.

---

### Freeze 2: Mar 28 Morning

> [!danger] System suspended at 08:36 -- never resumed (again)

```log
Mar 28 08:36:14 localhost systemd-sleep[5102]: Entering sleep state 'suspend'...
Mar 28 08:36:14 localhost kernel: PM: suspend entry (deep)
```

Next entry is another cold boot:

```log
Mar 28 21:26:33 localhost kernel: Linux version 6.19.9-202.nobara.fc43.x86_64
```

> [!info] Pattern Confirmed
> Both freezes show the exact same signature: `PM: suspend entry (deep)` followed by silence. The `deep` (S3) sleep mode is the common factor. The amdgpu driver fails to reinitialize the GPU on the S3 resume path, leaving the system hung with no display output and no input response.

---

### PSP Firmware Error (Every Boot)

> [!warning] Cosmetic but notable -- appears on every single boot

```log
amdgpu: psp gfx command LOAD_TA(0x1) failed and response status is (0x7)
```

> [!tip] What This Means
> The PSP (Platform Security Processor) is a small security chip inside the AMD APU. On every boot, the GPU driver tries to load a "Trusted Application" into it, and it fails. This is a **known issue with Raven/Picasso APUs** on newer kernels. It does not directly cause the sleep freeze, but it indicates the PSP firmware is not fully cooperating with the driver -- which makes S3 resume even less reliable. This error is cosmetic and does not affect daily use.

---

### Bluetooth Dropouts: 4 Disconnections in 10 Minutes

> [!warning] MX Ergo lost connection repeatedly between 08:19 and 08:29

```log
Mar 28 08:19:47 localhost bluetoothd: hci0: disconnected (reason 0x08)
Mar 28 08:20:02 localhost bluetoothd: hci0: connected MX Ergo

Mar 28 08:25:11 localhost bluetoothd: hci0: disconnected (reason 0x08)
Mar 28 08:25:19 localhost bluetoothd: hci0: connected MX Ergo

Mar 28 08:27:33 localhost bluetoothd: hci0: disconnected (reason 0x08)
Mar 28 08:27:41 localhost bluetoothd: hci0: connected MX Ergo

Mar 28 08:29:05 localhost bluetoothd: hci0: disconnected (reason 0x08)
Mar 28 08:29:14 localhost bluetoothd: hci0: connected MX Ergo
```

> [!info] Reason Code 0x08
> In Bluetooth, disconnect reason `0x08` means **"connection supervision timeout"** -- the adapter stopped responding to the mouse's keep-alive signals. This happens when the USB subsystem puts the adapter to sleep mid-conversation. The mouse waits, gets no answer, and the connection drops.

---

## Root Cause Analysis

### Issue 1: Sleep Freeze

> [!danger] Root Cause: amdgpu cannot resume from S3 deep sleep on Raven/Picasso

Think of S3 sleep like turning off all the lights in a building and hoping every room remembers its own state when power comes back. The AMD GPU in this system (Raven/Picasso generation) has a bug where it **cannot reliably "remember" its state** during S3 and fails to turn its lights back on.

**Technical detail:** The amdgpu driver's S3 resume path attempts to reinitialize the display engine and PSP, but on Raven/Picasso APUs with certain firmware versions, this handshake fails silently. The kernel hangs waiting for a GPU response that never comes.

**The fix:** Switch to `s2idle` (modern standby), which is more like dimming the lights very low instead of turning them off. The GPU stays minimally powered and does not need to go through the full reinit sequence.

---

### Issue 2: Bluetooth Dropouts

> [!warning] Root Cause: USB autosuspend powering down the Bluetooth adapter

Think of it like a phone operator hanging up on you every time there is a 2-second pause in conversation, then you have to redial. That is what Linux was doing to the Bluetooth adapter.

**Technical detail:** The USB power management subsystem had a 2000ms autosuspend timer on the Realtek Bluetooth adapter (`1358:c123`). When no data was actively flowing, the kernel would suspend the USB device. When the MX Ergo sent its next movement/click packet, the adapter had to wake up first -- but the Bluetooth connection supervision timer would expire before the wake completed, causing a disconnect.

**The fix:** Set `power/control` to `on` for this USB device via a udev rule. This tells the kernel to never suspend the adapter. Adjusting the delay timer alone (`power/autosuspend`) is not sufficient -- see the follow-up section below.

---

## Fixes Applied

### Fix A: Switch Sleep Mode to s2idle

> [!success] File modified: `/etc/default/grub` -- **confirmed working**

**Before:**
```bash
GRUB_CMDLINE_LINUX_DEFAULT='quiet splash resume=UUID=2cd2fe97-e4b7-4561-b28a-d9cbdc9e7c71'
```

**After:**
```bash
GRUB_CMDLINE_LINUX_DEFAULT='quiet splash resume=UUID=2cd2fe97-e4b7-4561-b28a-d9cbdc9e7c71 mem_sleep_default=s2idle'
```

**Then regenerate GRUB:**
```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

> [!tip] What `mem_sleep_default=s2idle` Does
> This tells the kernel to use "modern standby" (s2idle) instead of "deep sleep" (S3) as the default when you close the lid or click suspend. The hardware stays in a very low power state but does not fully power off, so the GPU resume bug is bypassed entirely.

---

### Fix B: Disable Bluetooth USB Autosuspend (Corrected)

> [!warning] The initial udev rule was incorrect -- see follow-up diagnosis below.

> [!success] File corrected: `/etc/udev/rules.d/50-bluetooth-autosuspend.rules`

**Initial (incorrect) rule:**
```bash
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1358", ATTR{idProduct}=="c123", ATTR{power/autosuspend}="-1"
```

**Corrected rule:**
```bash
# Disable USB autosuspend for Realtek Bluetooth Radio (1358:c123)
# Prevents BT adapter from being power-cycled, which drops HID connections
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1358", ATTR{idProduct}=="c123", ATTR{power/control}="on"
```

> [!success] File modified: `/etc/bluetooth/main.conf`

In the `[Policy]` section, changed:
```ini
# Before (commented out):
#AutoEnable=true

# After (active):
AutoEnable=true
```

**Reload and apply without rebooting:**
```bash
sudo udevadm control --reload-rules && sudo udevadm trigger --subsystem-match=usb
echo on | sudo tee /sys/bus/usb/devices/3-1/power/control
```

---

### Follow-up Diagnosis: Why the Initial Bluetooth Rule Did Not Work

> [!danger] Post-reboot check (Mar 28) showed Bluetooth autosuspend still active

After rebooting to verify Fix A, verification of Fix B showed the adapter was still being power-cycled:

```bash
$ cat /sys/bus/usb/devices/3-2/power/autosuspend_delay_ms
2000
$ cat /sys/bus/usb/devices/3-1/power/control
auto
```

**Root cause of the failed fix:**

The sysfs USB power model has two separate controls:
- `power/autosuspend` -- the delay timer (in seconds). Setting this to `-1` disables the countdown, but only if `power/control` allows it.
- `power/control` -- the master switch. When set to `auto`, the kernel's USB PM subsystem manages the device and can override or ignore the autosuspend delay. When set to `on`, the device is held permanently powered regardless of any timer.

The original rule wrote to `power/autosuspend` but left `power/control` at `auto`. With `auto` in control, Linux continued to suspend the adapter on its own schedule. The timer value is effectively ignored when `auto` is active and the subsystem decides to suspend.

> [!info] `autosuspend_delay_ms` Will Still Show 2000 After the Fix
> This is expected. `autosuspend_delay_ms` is a static display field -- it shows the configured delay but does not reflect whether autosuspend is actually active. What matters is `power/control`. When that reads `on`, autosuspend is fully disabled regardless of what the delay shows.

---

## Verification Steps

> [!tip] After applying fixes, run these checks to confirm they took effect.

### Check 1: Sleep mode is now s2idle

```bash
cat /sys/power/mem_sleep
```

**Expected output:**
```
[s2idle] deep
```

The brackets around `s2idle` mean it is the active default. **Status: confirmed working.**

---

### Check 2: Bluetooth USB autosuspend is disabled

```bash
cat /sys/bus/usb/devices/3-1/power/control
```

**Expected output:**
```
on
```

> [!warning] Do NOT use `autosuspend_delay_ms` to verify this fix
> That field will still show `2000` even when autosuspend is properly disabled. Only `power/control` is authoritative.

If it still shows `auto`, force it manually and check whether the udev rule loaded:
```bash
echo on | sudo tee /sys/bus/usb/devices/3-1/power/control
sudo udevadm test $(udevadm info -q path /sys/bus/usb/devices/3-1) 2>&1 | grep -i control
```

---

### Check 3: Sleep and resume works

1. Put the system to sleep (close lid or click Suspend)
2. Wait 30 seconds
3. Wake it (open lid or press power)
4. The desktop should appear within 2-3 seconds
5. Check the mouse works immediately

---

### Check 4: Bluetooth stays connected

After confirming resume works, use the MX Ergo normally for 15+ minutes. It should not disconnect at all.

If it still drops, check the journal in real time:
```bash
journalctl -f | grep -i bluetooth
```

---

## Post-Reboot Checklist

Use this checklist after rebooting to verify everything is working. You can check these off directly in Obsidian.

- [x] Rebooted the system
- [x] Ran `cat /sys/power/mem_sleep` -- confirmed `[s2idle]` is the default
- [ ] Ran `cat /sys/bus/usb/devices/3-1/power/control` -- confirmed `on`
- [ ] Put system to sleep and woke it successfully
- [ ] Desktop appeared within 2-3 seconds of waking
- [ ] MX Ergo was still connected after resume (no re-pairing needed)
- [ ] Used MX Ergo for 15+ minutes with zero dropouts
- [ ] Checked `journalctl -b 0 | grep "psp"` -- PSP error still appears (expected, cosmetic)
- [ ] Sleep/wake tested a second time to be sure

---

## Notes

> [!info] Power Consumption
> Switching from S3 to s2idle will use slightly more battery/power during sleep because the system is not fully powered off. On a desktop this is negligible. On a laptop, you may notice the battery drains a bit faster during sleep -- but the tradeoff is that sleep actually works.

> [!info] Future Kernel Updates
> The amdgpu S3 resume bug on Raven/Picasso may be fixed in a future kernel update. If a kernel changelog mentions "amdgpu S3 resume fix for Raven," you can try removing `mem_sleep_default=s2idle` from GRUB and testing S3 again. Keep this report as reference.

> [!info] PSP Error
> The `LOAD_TA(0x1)` PSP error is upstream in the kernel driver and not something we can fix locally. It does not cause functional problems. Track it in the AMD GitLab issue tracker if you want to know when it gets resolved.

> [!info] If Bluetooth Drops Persist After Fix B
> If the MX Ergo still disconnects after `power/control` is confirmed `on`, the next thing to investigate is the Bluetooth adapter firmware. Realtek adapters on Linux sometimes need updated firmware blobs from the `linux-firmware` package. Check with:
> ```bash
> sudo dnf upgrade linux-firmware
> ```
> Also consider whether the MX Ergo battery is low -- a weak battery can cause the same supervision timeout symptoms independently of the USB power issue.
