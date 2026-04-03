# 🧰 DIAG-KIT — Field Diagnostic Reference

---

## 📑 INDEX — Jump to Any Tool

> [!info] 📦 01 — System Health
> [[#HWiNFO64]] — Deep hardware sensors
> [[#CPU-Z]] — CPU · RAM · Board ID
> [[#Speccy]] — Quick hardware summary

> [!tip] 🌐 02 — Network
> [[#Angry IP Scanner]] — Scan all devices on LAN
> [[#CurrPorts]] — Live connections on this PC
> [[#Wireshark Portable]] — Deep packet capture
> [[#WifiInfoView]] — Wi-Fi signal strength and channel scan
> [[#ManageEngine NetFlow Analyzer Free|ManageEngine NetFlow]] — Bandwidth monitor (installer only)

> [!warning] 💾 03 — Storage
> [[#CrystalDiskInfo]] — SMART disk health
> [[#WinDirStat]] — Visual space map

> [!example] 🔬 04 — Windows Integrity (Sysinternals)
> [[#Autoruns]] — Everything that runs at startup
> [[#Process Explorer]] — Advanced Task Manager
> [[#Process Monitor]] — File · Registry · Network events
> [[#TCPView]] — Live network connections
> [[#RAMMap]] — Memory usage breakdown
> [[#VMMap]] — Per-process memory map
> [[#Sigcheck]] — File signature + VirusTotal
> [[#AccessChk and AccessEnum]] — Permissions audit
> [[#Handle]] — "File is in use" solver
> [[#Strings]] — Extract text from binaries
> [[#Sysmon]] — Persistent system event logging
> [[#PsTools Suite]] — Remote management
> [[#DiskView and Diskmon]] — Disk sector map + activity
> [[#BGInfo]] — System info on desktop
> [[#ProcDump]] — Capture crash dumps
> [[#RDCMan]] — Remote Desktop manager
> [[#ADExplorer]] — Active Directory browser
> [[#ZoomIt]] — Screen zoom + annotation
> [[#Other Sysinternals Tools]]

> [!danger] 🛡️ 05 — Malware
> [[#AdwCleaner]] — Adware · PUPs · Browser hijacks
> [[#ESET Online Scanner]] — Full deep AV scan

> [!abstract] 🥾 07 — Boot Tools
> [[#Medicat]] — Bootable rescue toolkit

---

## ⚡ Symptom → Tool Quick Lookup

> [!tip] Start here — find the right tool for the symptom in front of you

| Symptom | First tool | Folder |
|---|---|---|
| Machine slow, fan screaming | [[#HWiNFO64]] | 01 |
| "What hardware does this have?" | [[#CPU-Z]] or [[#Speccy]] | 01 |
| Can't reach internet | [[#Angry IP Scanner]] → [[#CurrPorts]] | 02 |
| Weak Wi-Fi / poor signal | [[#WifiInfoView]] | 02 |
| Suspicious outbound traffic | [[#CurrPorts]] → [[#Wireshark Portable|Wireshark]] | 02 |
| Disk is full, don't know why | [[#WinDirStat]] | 03 |
| Disk making noise / S.M.A.R.T. warning | [[#CrystalDiskInfo]] | 03 |
| Something weird starts at boot | [[#Autoruns]] | 04 |
| Unknown process eating CPU/RAM | [[#Process Explorer]] | 04 |
| "A file keeps getting modified" | [[#Process Monitor]] | 04 |
| Live connections look suspicious | [[#TCPView]] | 04 |
| Machine feels slow despite enough RAM | [[#RAMMap]] | 04 |
| File won't delete — "in use" error | [[#Handle]] | 04 |
| Verify if an EXE is legitimate | [[#Sigcheck]] | 04 |
| Pop-ups / browser hijacked | [[#AdwCleaner]] | 05 |
| Deeper malware suspected | [[#ESET Online Scanner]] | 05 |
| Windows won't boot at all | [[#Medicat]] | 07 |
| Suspect bad RAM causing crashes | [[#Medicat|Medicat → MemTest86]] | 07 |

---

## 🔁 Diagnosis Workflow


![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Diag_Kit.png)


---

# 📁 01 — System Health

## HWiNFO64

> [!success] ✅ When to use
> - Machine is **overheating** or shutting down randomly
> - CPU feels throttled — fast on paper, slow in practice
> - Checking **real-time temperatures** (CPU, GPU, NVMe, VRM)
> - Verifying **fan speeds** and **voltages**
> - Diagnosing **battery health** on laptops

> [!info] 📋 Prerequisites — none
> Just run the exe. No install, no internet needed.
> Choose **"Sensors only"** at the startup dialog for fastest access to live readings.

<div style="background:#1a2a3a; border-left:4px solid #4a90d9; padding:12px; border-radius:4px; margin:10px 0">
<strong>Which exe to run?</strong><br>
→ <code>HWiNFO64.exe</code> — modern 64-bit Windows <em>(use this 99% of the time)</em><br>
→ <code>HWiNFO32.exe</code> — 32-bit Windows XP/Vista machines<br>
→ <code>HWiNFO_ARM64.exe</code> — Surface Pro / Snapdragon laptops
</div>

**What it does:** The deepest hardware monitor available. Reads every sensor on the board — CPU temps per-core, VRM temps, fan RPM, voltages, battery wear level, GPU memory junction temp, NVMe drive temps, and hundreds more readings in real-time.

**Key workflow:**
1. Launch → choose **Sensors-only**
2. Scroll through — any reading shown in **red** has exceeded its threshold
3. Watch `CPU Package Power` — if it equals the CPU's rated TDP, the CPU is being thermally throttled (it's too hot to run at full speed)
4. Check `Battery` section → `Battery Wear Level` shows degradation percentage

| | Linux | macOS |
|---|---|---|
| Equivalent | `lm-sensors` + `psensor` GUI | `iStatMenus` (paid) / GPU Monitor |
| Command | `sensors` | Activity Monitor → Energy tab |

---

## CPU-Z

> [!success] ✅ When to use
> - Need to know **exact RAM spec** before buying an upgrade
> - Verify if **XMP/EXPO** is actually enabled (RAM running at advertised speed)
> - Identify an **unknown CPU or motherboard** model
> - Check how many **RAM slots are used** vs available

> [!info] 📋 Prerequisites — none
> Run as standard user. Instant results, no internet needed.

**What it does:** Identifies the exact CPU model, motherboard, RAM spec (speed, timings, slots used), and GPU. Lightweight and fast.

**Key tab to check:** `Memory` → DRAM Frequency × 2 = actual running speed. If that doesn't match the sticker on your RAM kit, XMP is **not** enabled in BIOS.

| | Linux | macOS |
|---|---|---|
| Equivalent | `dmidecode` / `lshw` | System Information (Apple menu → About This Mac → More Info) |
| Command | `sudo dmidecode -t memory` | `system_profiler SPHardwareDataType` |

---

## Speccy

> [!success] ✅ When to use
> - Quick **hardware inventory** — one clean summary page
> - Need to **send specs to someone** (File → Save as Text/XML)
> - Non-technical client needs to read out their specs to you over the phone

> [!info] 📋 Prerequisites — none
> Run as standard user. No internet needed.

**What it does:** One-page hardware summary — OS, CPU, RAM, motherboard, storage, GPU. Less deep than HWiNFO but far faster to read at a glance.

| | Linux | macOS |
|---|---|---|
| Equivalent | `inxi -Fxz` | System Information.app |

---

---

# 📁 02 — Network

## Angry IP Scanner

> [!success] ✅ When to use
> - **Map every device** on a client's network
> - Find out if a **specific IP is alive**
> - Identify **rogue or unknown devices** on the LAN
> - Find a device's **hostname and open ports**

> [!warning] 📋 Prerequisites — you need the network range first
> Before scanning, you must know **what IP range to scan**. Do this first:
>
> **On Windows** — open CMD and run:
> ```
> ipconfig
> ```
> Look for `IPv4 Address` (e.g. `192.168.1.45`) and `Subnet Mask` (e.g. `255.255.255.0`).
> A subnet mask of `255.255.255.0` means your range is `192.168.1.1 – 192.168.1.254`.
>
> **On Linux:**
> ```
> ip a
> ```
> **On macOS:**
> ```
> ifconfig en0
> ```
> The number after the `/` in the IP (e.g. `192.168.1.45/24`) tells you the range. `/24` = last octet varies = scan `192.168.1.1–254`.

**Workflow:**
1. Run → enter range (e.g. `192.168.1.1 - 192.168.1.254`)
2. Click **Start** → green rows = live hosts
3. Right-click any host → **Open Ports** to see what's listening

> [!tip] Angry IP Scanner is cross-platform — it also runs natively on Linux and macOS (Java-based)

| | Linux | macOS |
|---|---|---|
| Equivalent | Angry IP (same app) / `nmap` | Angry IP (same app) |
| Command | `nmap -sn 192.168.1.0/24` | same |

---

## CurrPorts

> [!success] ✅ When to use
> - Something on **this machine** is making suspicious outbound connections
> - Find **which process is using a specific port**
> - Kill a network connection without Task Manager
> - Investigate what an unknown process is connecting to

> [!info] 📋 Prerequisites
> Run as **Administrator** to see connections from all processes (including system services).
> Standard user run will only show your own user's connections — you'll miss the important ones.

**What it does:** Lists every open TCP/UDP connection on the local machine — with process name, PID, remote IP/hostname, and port. Like `netstat` but visual, sortable, and updated live.

**Red flags to look for:**
- Connections to foreign IPs from `svchost.exe`, `explorer.exe`, or processes with no icon
- Processes connecting on unusual high-numbered ports (50000+) to residential IPs
- Same process opening many connections simultaneously

**Tip:** Right-click any connection → **Copy Selected Items** to paste into your notes.

| | Linux | macOS |
|---|---|---|
| Equivalent | `ss` / `nethogs` | `lsof -i` |
| Command | `sudo ss -tulnp` | `sudo lsof -i -n -P` |

---

## Wireshark Portable

> [!success] ✅ When to use
> - **Intermittent connection drops** — capture during the drop event, look for TCP resets
> - **Slow network** — find retransmissions and timeouts that indicate packet loss
> - **Suspected data exfiltration** — see what data is actually leaving the machine
> - **DNS failures** — watch for failed lookups causing app errors
> - **VoIP / video call quality issues** — check for jitter and packet loss

> [!warning] 📋 Prerequisites — Npcap driver required
> Wireshark needs a capture driver to work.
> - On first launch, it will offer to install **Npcap** — **allow it** (requires Admin)
> - Without Npcap, you can open saved `.pcap` files but cannot do live capture
> - You also need to know **which network interface to capture on** — see below

> [!info] 📋 How to find your active network interface
> In Wireshark's main screen, each interface shows a live activity graph (squiggly line).
> **The one with activity = the one to select.** Usually named:
> - `Ethernet` or `Local Area Connection` → wired
> - `Wi-Fi` or `Wireless Network Connection` → wireless
> If unsure, run `ipconfig` first and match the IP to the interface name shown in Wireshark.

**Essential capture filters (type in the filter bar, press Enter):**

```
dns                          → only DNS traffic — find failed lookups
http                         → only web traffic (unencrypted)
ip.addr == 192.168.1.100     → only traffic to/from a specific IP
tcp.analysis.retransmission  → packet loss indicator
tcp.flags.reset == 1         → connections being killed (firewall / blocked)
```

> [!warning] Wireshark captures ALL traffic — including passwords on unencrypted connections. Use responsibly and only on networks you own or are authorized to test.

| | Linux | macOS |
|---|---|---|
| Equivalent | Wireshark (native install) | Wireshark (native install) |
| Command | `sudo tcpdump -i eth0 -w capture.pcap` | `sudo tcpdump -i en0 -w capture.pcap` |

---

## WifiInfoView

> [!success] ✅ When to use
> - Client complains of **slow or dropping Wi-Fi** — verify if it's a signal problem
> - Find **channel congestion** — too many nearby networks on the same channel causing interference
> - Check **signal strength (dBm) and quality** at the client's location vs. closer to the router
> - Identify the **router's band** (2.4 GHz vs. 5 GHz) and confirm the device is on the right one
> - Quick scan before pulling out Wireshark for a connection drop investigation

**What it does:** Lists every Wi-Fi network visible to the adapter — SSID, BSSID (MAC), signal strength in dBm and percentage, channel, frequency band, security type, and router manufacturer. Updates live. No install required — single `.exe`, runs as standard user.

**Key columns to read:**

| Column | What to look for |
|---|---|
| Signal Quality % | Below 50% = weak — move closer or investigate obstacles |
| RSSI (dBm) | −50 to −65 = good · −70 to −80 = marginal · below −80 = poor |
| Channel | If multiple networks share the same channel → interference. Switch router to a less-used channel |
| PHY Type | 802.11ac or 802.11ax = 5 GHz capable. If client is on 802.11n only → possibly stuck on 2.4 GHz |

**Workflow:**
1. Run `WifiInfoView.exe` — no install, no admin required
2. Find the client's network (SSID) in the list
3. Note the **Signal Quality** and **RSSI** — if marginal, test from different locations
4. Check the **Channel** column — look for 3+ networks on the same channel (interference)
5. If the client's router supports 5 GHz but the device shows 2.4 GHz, reconnect to the 5 GHz SSID

> [!tip] WifiInfoView is passive — it only reads beacon frames already being broadcast. It does not send any packets and requires no special permissions.

| | Linux | macOS |
|---|---|---|
| Equivalent | `nmcli dev wifi` / `iwlist scan` | `airport -s` (built-in) |
| Command | `nmcli dev wifi list` | `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s` |

---

## ManageEngine NetFlow Analyzer Free

> [!warning] ⚠️ Not a portable tool — installer only
> `ManageEngine_NetFlowAnalyzer_Free_64bit.exe` → Windows installer (sets up a local web server, not portable)
> `ManageEngine_NetFlowAnalyzer_Free_64bit.bin` → Linux installer
>
> These are kept here as reference installers for **persistent bandwidth monitoring** on a fixed machine. For field diagnosis, use **Wireshark + CurrPorts** instead.

---

---

# 📁 03 — Storage

## CrystalDiskInfo

> [!success] ✅ When to use
> - Machine is **slow to boot** or apps take forever to load
> - Hard drive is **making clicking or grinding noises**
> - Getting **read errors, blue screens, or file corruption**
> - Preventive check — inspect health before trusting a used machine
> - Check **NVMe/SSD temperatures**

> [!info] 📋 Prerequisites — none
> Run as standard user. Results appear instantly.

<div style="background:#1a2a1a; border-left:4px solid #4ad94a; padding:12px; border-radius:4px; margin:10px 0">
<strong>Which exe to run?</strong><br>
→ <code>DiskInfo64.exe</code> — standard 64-bit Windows <em>(use this 99% of the time)</em><br>
→ <code>DiskInfo32.exe</code> — 32-bit Windows machines<br>
→ <code>DiskInfoA64.exe</code> — ARM64 (Surface, Snapdragon laptops)
</div>

**What it does:** Reads S.M.A.R.T. data — the disk's internal health log that every drive keeps on itself. Shows the overall verdict and individual health attributes.

**Health verdict — what the colors mean:**

<div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:8px; margin:10px 0">
<div style="background:#1a3a1a; border:1px solid #4ad94a; border-radius:6px; padding:10px; text-align:center">
<strong style="color:#90ff90">🔵 Good</strong><br>Drive is healthy
</div>
<div style="background:#3a3a1a; border:1px solid #d9d94a; border-radius:6px; padding:10px; text-align:center">
<strong style="color:#ffff90">🟡 Caution</strong><br>Watch it — aging or minor issues
</div>
<div style="background:#3a1a1a; border:1px solid #d94a4a; border-radius:6px; padding:10px; text-align:center">
<strong style="color:#ff9090">🔴 Bad</strong><br>Back up immediately — replace now
</div>
</div>

**Critical SMART attributes to check:**

| Attribute | What it means | Action |
|---|---|---|
| `Reallocated Sectors Count` | Bad sectors the drive moved data away from | Any value > 0: back up now |
| `Pending Sector Count` | Sectors about to fail (can't be read) | Any value > 0: back up immediately |
| `Uncorrectable Sector Count` | Data that could not be recovered | Any value > 0: drive is failing |
| `Power On Hours` | Total lifetime runtime | > 30,000 hrs on HDD = aging |
| `Temperature` | Drive temp in °C | > 55°C = cooling problem |

| | Linux | macOS |
|---|---|---|
| Equivalent | `smartmontools` | `smartmontools` / Disk Utility (basic) |
| Command | `sudo smartctl -a /dev/sda` | `sudo smartctl -a /dev/disk0` |

---

## WinDirStat

> [!success] ✅ When to use
> - Disk is **full and you don't know why**
> - Need to find **large files or folders** to reclaim space
> - Spot leftover **installer files, Windows.old, game caches, old backups**

> [!info] 📋 Prerequisites — none
> Run as **Administrator** to scan system folders (C:\Windows, C:\Program Files).
> Standard user will miss protected folders.

<div style="background:#2a1a0a; border-left:4px solid #d9904a; padding:12px; border-radius:4px; margin:10px 0">
<strong>Which exe to run?</strong><br>
→ <code>WinDirStat.exe</code> — 64-bit Windows <em>(use this)</em><br>
→ <code>WinDirStat86.exe</code> — 32-bit machines<br>
→ <code>WinDirStatarm.exe</code> — ARM64
</div>

**What it does:** Scans a drive and renders a **treemap** — every file is a colored rectangle where size = file size on disk. You see at a glance where all the space is going.

**How to read the treemap:**
- **Large single rectangle** = one big file eating space
- **Many small same-colored rectangles** = lots of files of the same type
- **Click any rectangle** → it highlights that file in the folder tree above

| | Linux | macOS |
|---|---|---|
| Equivalent | `ncdu` (terminal) / `Baobab` (GUI) | `GrandPerspective` / `DiskInventoryX` |
| Command | `ncdu /` | — |

---

---

# 📁 04 — Windows Integrity (Sysinternals Suite)

> [!note] About Sysinternals
> Made by Mark Russinovich, acquired by Microsoft. Every tool goes deeper than what Windows built-in tools expose. These are the tools that professional incident responders use.

> [!tip] 32-bit vs 64-bit — always run 64
> Every tool comes in pairs: `Tool.exe` (32-bit) and `Tool64.exe` (64-bit).
> **Always run the 64-bit version** on modern Windows unless the machine is 32-bit.

---

## Autoruns

> [!success] ✅ When to use
> - Something **launches at startup** that shouldn't be there
> - Machine is **slow to boot** and you suspect startup clutter
> - Investigating **suspected malware** — this is the single best first tool
> - Auditing what a machine runs automatically (scheduled tasks, services, drivers)

> [!warning] 📋 Prerequisites
> Run as **Administrator** — otherwise you won't see system-level startup entries.
> Optional but powerful: requires **internet** to submit hashes to VirusTotal.

**What it does:** Shows **everything** that runs automatically on Windows — Registry Run keys, Scheduled Tasks, Browser extensions, Services, Drivers, Codecs, Winlogon hooks, and 15+ more locations. Far more complete than `msconfig` or Task Manager startup tab.

**Color coding in Autoruns:**

<div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:8px; margin:10px 0">
<div style="background:#1a2a1a; border:1px solid #4a4a4a; border-radius:6px; padding:10px">
<strong style="color:#cccccc">⬜ White (normal)</strong><br>Signed Microsoft entry — safe
</div>
<div style="background:#3a3a1a; border:1px solid #d9d94a; border-radius:6px; padding:10px">
<strong style="color:#ffff90">🟡 Yellow</strong><br>File not found — orphaned entry, safe to delete
</div>
<div style="background:#1a3a1a; border:1px solid #4ad94a; border-radius:6px; padding:10px">
<strong style="color:#90ff90">🟢 Pink/Light</strong><br>Unsigned or third-party — investigate
</div>
</div>

**Malware-hunting workflow:**
1. Run → `Options → Scan Options → Check VirusTotal.com` ✔
2. `Options → Hide Microsoft Entries` — strips the noise
3. Look for **red entries** (VirusTotal hit) → remove immediately
4. Investigate **unsigned yellow entries** — Google the filename
5. **Uncheck** to disable (reversible) · **Delete** to remove permanently

| | Linux | macOS |
|---|---|---|
| Equivalent | `systemd-analyze blame` / `crontab -l` | `LoginItems` in System Settings / `LaunchAgents` folders |
| Command | `systemctl list-unit-files --state=enabled` | `launchctl list` |

---

## Process Explorer

> [!success] ✅ When to use
> - An **unknown process** is eating CPU or RAM
> - **Verify if a process is legitimate** — right-click → Check VirusTotal
> - Understand **parent/child process relationships** (what launched what)
> - Find which process has a **specific DLL loaded**
> - Replace Task Manager entirely on any machine you're working on

> [!info] 📋 Prerequisites
> Run as **Administrator** to see all system processes.
> Standard user will see user-space processes only.

**What it does:** Advanced Task Manager with a process tree view showing parent-child relationships, colored by process type, with CPU/RAM graphs and VirusTotal integration.

**Key things to check:**
- Anything running **from a temp folder** (`%AppData%\Temp`, `C:\Users\...\AppData`) = suspicious
- Processes with **no icon, no description, no company name** = investigate
- Right-click → **Properties → Strings** tab to see readable text inside the binary

| | Linux | macOS |
|---|---|---|
| Equivalent | `htop` / `btop` | Activity Monitor (built-in) |
| Command | `htop` or `ps aux` | — |

---

## Process Monitor

> [!success] ✅ When to use
> - "**A file keeps getting modified** and I don't know what's doing it"
> - **App crashes on launch** — see exactly which file or registry key it can't access
> - **ACCESS DENIED errors** — find exactly which permission is blocking what
> - Track every file, registry, and network operation an app makes
> - Deep malware behavior analysis

> [!warning] 📋 Prerequisites — filters are mandatory
> Procmon generates **thousands of events per second**. You MUST set filters immediately or the output is unmanageable.
>
> **Immediately after launching:**
> 1. Click the filter icon → Add filter: `Process Name → is → [app you're watching]`
> 2. Or filter by: `Result → is → ACCESS DENIED` to find permission problems instantly
> 3. Or filter by: `Path → contains → C:\path\you\care\about`

**What it does:** Records every file system, registry, and network event on the system in real time. The most powerful diagnostic tool for "something mysterious is happening" problems.

| | Linux | macOS |
|---|---|---|
| Equivalent | `strace` / `inotifywait` | `fs_usage` / `dtruss` |
| Command | `strace -p PID` or `inotifywait -r /path` | `sudo fs_usage -f filesys` |

---

## TCPView

> [!success] ✅ When to use
> - Live view of **all connections on this machine** with process names
> - Watching **new connections appear in real time** (green flash = new, red = closed)
> - Quick check before pulling out Wireshark

> [!info] 📋 Prerequisites
> Run as **Administrator** to see all process connections.

**What it does:** Like CurrPorts (folder 02) but from Sysinternals. Shows all TCP/UDP connections with process names, updated live. Color-coded: green = new connection, red = just closed.

**Companion tool:** `tcpvcon64.exe` is the command-line version — useful for scripted output.

| | Linux | macOS |
|---|---|---|
| Equivalent | `ss -tulnp` / `nethogs` | `lsof -i` |
| Command | `sudo ss -tulnp` | `sudo lsof -i -n -P` |

---

## RAMMap

> [!success] ✅ When to use
> - Machine feels **sluggish despite having enough RAM**
> - Want to understand how Windows is **distributing physical memory**
> - Large file cache is consuming RAM that apps need

> [!info] 📋 Prerequisites — none
> Run as Administrator for full visibility.

**What it does:** Shows exactly how Windows is using physical RAM broken down by category — Active, Standby (file cache), Free, Modified, etc. The `Standby` list is RAM used as disk cache — Windows reclaims it automatically, but RAMMap lets you flush it manually if needed.

| | Linux | macOS |
|---|---|---|
| Equivalent | `free -h` / `/proc/meminfo` | Activity Monitor → Memory tab |
| Command | `cat /proc/meminfo` | — |

---

## VMMap

> [!success] ✅ When to use
> - A specific **app is leaking memory** over time
> - Diagnosing virtual memory allocation for a process
> - Deep dive requested by a developer for a crash report

> [!info] 📋 Prerequisites
> Launch VMMap first, then select the process to analyze from the dialog.

**What it does:** Shows the full virtual address space of a single process — heap, stack, mapped files, private data. Useful for memory leak analysis.

---

## Sigcheck

> [!success] ✅ When to use
> - Verify if an **EXE is legitimately signed** by the company it claims
> - Submit a **suspicious file to VirusTotal** without uploading it to a browser
> - Scan a whole **folder of executables** for unsigned or untrusted files

> [!info] 📋 Prerequisites
> Requires **internet** to submit to VirusTotal.
> Run from command line (CMD or PowerShell).

```cmd
rem Check a single file against VirusTotal
sigcheck64.exe -vt C:\path\to\suspicious.exe

rem Scan a folder and show only unsigned files
sigcheck64.exe -u -e C:\Windows\System32

rem Recursive scan of a directory
sigcheck64.exe -vt -r C:\Users\Suspicious\AppData\
```

| | Linux | macOS |
|---|---|---|
| Equivalent | `sha256sum` + manual VT lookup | `codesign -v file` |
| Command | `sha256sum file.bin` | `codesign --verify --verbose file.app` |

---

## AccessChk and AccessEnum

> [!success] ✅ When to use
> - Service or app is **failing due to permission errors**
> - Audit **who can write to a sensitive folder or registry key**
> - Check if a service account has **more permissions than it should**

> [!info] 📋 Prerequisites
> Run from command line as Administrator.

```cmd
rem Check what permissions "Users" group has on a folder
accesschk64.exe -d "C:\Program Files\SomeApp"

rem Check permissions on a service
accesschk64.exe -c servicename

rem Find all services any user can modify (privilege escalation check)
accesschk64.exe -uwcqv "Everyone" *
```

`AccessEnum.exe` is the GUI version — scans a folder tree and highlights permission deviations.

---

## Handle

> [!success] ✅ When to use
> - Getting **"file is in use by another process"** error and can't delete/move a file
> - Need to know **exactly which process has a file locked**

> [!info] 📋 Prerequisites
> Run from **Administrator command prompt**.

```cmd
rem Find what has a specific file open
handle64.exe C:\path\to\locked\file.txt

rem Find all open handles for a specific process
handle64.exe -p processname.exe
```

Once you know the PID, you can kill the process in Process Explorer or Task Manager.

---

## Strings

> [!success] ✅ When to use
> - Quick inspection of an **unknown or suspicious EXE**
> - Extract URLs, IPs, registry keys, or filenames hidden inside a binary
> - Initial triage before sending a file to a malware analyst

> [!info] 📋 Prerequisites
> Run from command line.

```cmd
rem Extract all readable strings and search for URLs
strings64.exe suspicious.exe | findstr "http"

rem Search for IP addresses
strings64.exe suspicious.exe | findstr "[0-9][0-9]*\.[0-9]"

rem Save all strings to a file for review
strings64.exe suspicious.exe > output.txt
```

---

## Sysmon

> [!success] ✅ When to use
> - Setting up **persistent monitoring** on a machine you want to watch over time
> - Client machine you want to **log all process creation and network connections**
> - Feeding logs into a SIEM or security monitoring tool

> [!warning] ⚠️ This is a service, not a one-time scan tool
> Sysmon installs as a Windows service and writes detailed events to the Windows Event Log. It runs continuously in the background.
> - **Install:** `Sysmon64.exe -accepteula -i`
> - **Uninstall:** `Sysmon64.exe -u`
> Use only when you intend to leave it running. Not needed for one-time field visits.

---

## PsTools Suite

> [!success] ✅ When to use
> - Manage **multiple machines without RDP**
> - Run commands on a remote PC over the **LAN**
> - Collect info from machines **without walking to them**

> [!warning] 📋 Prerequisites
> - Requires **Admin credentials** on the remote machine
> - Remote machine must have **File and Printer Sharing** enabled
> - Run from an **Administrator command prompt**

| Tool | Command example | What it does |
|---|---|---|
| `PsExec64.exe` | `PsExec64 \\PC-NAME cmd.exe` | Open CMD on remote machine |
| `PsInfo64.exe` | `PsInfo64 \\PC-NAME` | Dump OS/hardware info remotely |
| `PsList64.exe` | `PsList64 \\PC-NAME` | List running processes remotely |
| `PsKill64.exe` | `PsKill64 \\PC-NAME processname` | Kill a process remotely |
| `PsService64.exe` | `PsService64 \\PC-NAME query servicename` | Query/start/stop services remotely |
| `PsLoggedon64.exe` | `PsLoggedon64 \\PC-NAME` | Who is logged on remotely |
| `PsLogList64.exe` | `PsLogList64 \\PC-NAME -e System` | Dump Event Log from remote machine |
| `PsShutdown64.exe` | `PsShutdown64 \\PC-NAME -r` | Reboot remote machine |
| `PsPing64.exe` | `PsPing64 8.8.8.8:80` | TCP ping with latency stats |

---

## DiskView and Diskmon

**DiskView (`DiskView64.exe`)** — Visual map of disk sectors. Shows which files occupy which physical sectors. Useful for understanding fragmentation.

**Diskmon (`Diskmon64.exe`)** — Monitors hard disk activity in real time. Shows disk I/O load as it happens.

> [!success] ✅ When to use DiskView
> Disk is being accessed heavily and you want to see which files are in use.

> [!success] ✅ When to use Diskmon
> Machine feels slow and you suspect constant disk thrashing — Diskmon shows if the disk is being hammered.

---

## BGInfo

> [!success] ✅ When to use
> - Working on **shared servers** or multiple machines — always know which one you're on
> - Deploy on client machines so **hostname, IP, and OS version** are always visible on the desktop

**What it does:** Overlays system info (hostname, IP address, OS version, RAM, uptime) directly on the Windows desktop wallpaper. Updates automatically on logon.

---

## ProcDump

> [!success] ✅ When to use
> - App **crashes intermittently** and you need a memory dump to send to a developer
> - Capture the state of a process at the moment it crashes

```cmd
rem Capture dump when a process crashes
procdump64.exe -ma -e AppName.exe

rem Capture dump when CPU exceeds 90% for 5 seconds
procdump64.exe -ma -c 90 -s 5 AppName.exe
```

---

## RDCMan

> [!success] ✅ When to use
> - Managing **multiple servers or remote machines** via RDP
> - Need to switch between many RDP sessions quickly without juggling separate windows

**What it does:** Organizes multiple Remote Desktop connections into a tree, lets you connect to many machines in one window, and saves credentials per-server.

---

## ADExplorer

> [!success] ✅ When to use
> - Working in a **Windows domain environment**
> - Need to browse **Active Directory** structure (users, groups, OUs, GPOs)
> - **Snapshot** AD state before and after a change to compare differences

> [!info] 📋 Prerequisites
> Machine must be **joined to a domain** or you need domain credentials.

---

## ZoomIt

> [!success] ✅ When to use
> - **Remote support sessions** — zoom in to show the user exactly what you're pointing at
> - **Presentations** — draw annotations on screen

Default shortcut: `Ctrl+1` to zoom, scroll wheel to zoom in/out, `Ctrl+2` to draw on screen.

---

## Other Sysinternals Tools

| Tool | What it does | When to use |
|---|---|---|
| `Contig64.exe` | Defrag a single file | `Contig64 -a bigfile.vhd` to analyze, remove `-a` to defrag |
| `du64.exe` | Command-line folder size | `du64 -l 2 C:\Users` — sizes 2 levels deep |
| `streams64.exe` | Find NTFS alternate data streams | Malware hiding data — `streams64 -r C:\Users\Suspicious` |
| `sdelete64.exe` | Secure file deletion | Wipe sensitive data before disposal |
| `whois64.exe` | Domain registration lookup | `whois64 suspicious-domain.com` |
| `RAMMap64.exe` | Memory distribution breakdown | Machine slow despite enough RAM |
| `Coreinfo64.exe` | CPU feature flags | Virtualization support, security features |
| `Cacheset64.exe` | Adjust file system cache size | Server memory tuning |
| `LoadOrd64.exe` | Driver load order | Boot performance / driver conflict analysis |
| `portmon.exe` | Serial/parallel port monitor | Diagnosing legacy hardware communication |
| `NotMyFault64.exe` | Deliberately crash the system | Test that crash dump settings work (do not use carelessly) |
| `disk2vhd64.exe` | Convert physical disk to VHD | Create a VM from a physical machine |

---

---

# 📁 05 — Malware

## AdwCleaner

> [!success] ✅ When to use
> - Browser **homepage or search engine changed** without permission
> - **Pop-up ads** appearing in the browser
> - A **new toolbar** appeared that you didn't install
> - Slow browser with random redirects
> - **Always run this first** before ESET — it's fast (2 min) and handles the most common cases

> [!info] 📋 Prerequisites
> Run as **Administrator**.
> Close all browser windows before scanning.
> No internet required.

**What it does:** Targets adware, browser hijackers, PUPs (Potentially Unwanted Programs), malicious scheduled tasks, and bad browser extensions. Very fast and focused.

**Workflow:**
1. Run as Administrator → **Scan Now**
2. Wait ~2 minutes
3. Review findings → **uncheck** anything you want to keep
4. Click **Quarantine** ← use this, not Delete (quarantine is reversible)
5. Reboot when prompted — this is required, don't skip it

| | Linux | macOS |
|---|---|---|
| Equivalent | Malware far less common — `rkhunter` for rootkits | `Malwarebytes for Mac` (free tier) |
| Command | `sudo rkhunter --check` | — |

---

## ESET Online Scanner

> [!success] ✅ When to use
> - **After AdwCleaner** if you still suspect infection
> - **Second-opinion scan** alongside any installed AV
> - Machine with **no installed AV** — verify it's clean
> - Deep investigation after a suspected breach

> [!warning] 📋 Prerequisites — internet required
> Downloads ~150–200MB of virus definitions on first run. Requires a working internet connection.
> Run as **Administrator**.
> Scan time: **30–90 minutes** on a typical machine.

**Workflow:**
1. Run as Administrator
2. Accept terms → choose **Full Scan**
3. Enable **"Detection of Potentially Unwanted Applications"** ← important, check this box
4. Enable **"Scan archives"** for thorough results
5. Wait for scan to complete
6. Review findings → remove all detections

| | Linux | macOS |
|---|---|---|
| Equivalent | `ClamAV` (free, open source) | `Malwarebytes for Mac` / `ClamXAV` |
| Command | `sudo clamscan -r --bell /home` | — |

---

---

# 📁 07 — Boot Tools

## Medicat

> [!success] ✅ When to use Medicat instead of this drive's tools
> - **Windows won't boot** at all → boot Medicat → Mini Windows PE → access files
> - **Suspect bad RAM causing crashes** → boot Medicat → MemTest86 (runs outside OS)
> - **Need to clone or image a disk** → Clonezilla
> - **Need to partition a disk** → GParted
> - **Suspect a rootkit at boot level** → scan from clean Medicat environment, not from inside the infected OS

**Medicat components reference:**

| Tool | What it does | When to use |
|---|---|---|
| **MemTest86** | RAM stress test — fully independent of OS | Unexplained BSODs, crashes, memory errors |
| **Mini Windows 10 PE** | Boot into clean Windows environment | OS won't start, need to recover files |
| **GParted** | Partition editor | Resize, create, delete partitions |
| **Clonezilla** | Disk imaging and cloning | Full disk backup before repair, migration |
| **Offline AV scanners** | Scan from outside the OS | Boot-level malware, rootkits |

> [!tip] Rule of thumb
> If the problem could be **below** the OS (RAM, firmware, boot sector, rootkit) → use Medicat.
> If the problem is **inside** a running Windows → use this drive's tools.

---

---

## 🗂️ OS Compatibility Matrix

| Tool | Windows | Linux | macOS |
|---|:---:|:---:|:---:|
| HWiNFO64 | ✅ | ❌ | ❌ |
| CPU-Z | ✅ | ❌ | ❌ |
| Speccy | ✅ | ❌ | ❌ |
| Angry IP Scanner | ✅ | ✅ | ✅ |
| CurrPorts | ✅ | ❌ | ❌ |
| WifiInfoView | ✅ | ❌ | ❌ |
| Wireshark Portable | ✅ | ❌* | ❌* |
| CrystalDiskInfo | ✅ | ❌ | ❌ |
| WinDirStat | ✅ | ❌ | ❌ |
| Sysinternals Suite | ✅ | ❌ | ❌ |
| AdwCleaner | ✅ | ❌ | ❌ |
| ESET Online Scanner | ✅ | ❌ | ❌ |

*Wireshark runs natively on Linux/macOS but requires a separate installation — the portable version on this drive is Windows only.

---

*Last updated: 2026-04-01 | Drive: DIAG-KIT 114.6 GB exFAT*
