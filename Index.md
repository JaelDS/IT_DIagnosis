<div style="font-family:'Segoe UI',sans-serif;background:#0d1117;color:#e6edf3;border-radius:16px;overflow:hidden;border:1px solid #30363d;margin-bottom:2rem;">
<div style="background:linear-gradient(135deg,#0d1117 0%,#161b22 40%,#1a2332 100%);padding:2.5rem 2.5rem 2rem;border-bottom:1px solid #30363d;">
<div style="display:inline-flex;align-items:center;gap:6px;background:rgba(88,166,255,0.1);border:1px solid rgba(88,166,255,0.3);color:#58a6ff;font-family:monospace;font-size:0.7rem;padding:4px 10px;border-radius:4px;letter-spacing:0.1em;text-transform:uppercase;margin-bottom:1rem;">⬡ Knowledge Hub · IT Support</div>
<div style="font-size:2rem;font-weight:800;margin:0 0 0.4rem;color:#58a6ff;">IT Support Knowledge Hub</div>
<div style="color:#8b949e;font-family:monospace;font-size:0.85rem;">Identify → Diagnose → Repair → Document</div>
<div style="display:flex;gap:2rem;margin-top:1.2rem;flex-wrap:wrap;">
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Scope: Windows · Linux · Printers · Network · Email · Security</span>
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> DIAG — playbooks &nbsp;|&nbsp; INC — incident reports &nbsp;|&nbsp; REF — handbooks &amp; references</span>
</div>
</div>
</div>

---

## ⚡ Quick Triage

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Index_Diag.png)

---

## 📋 Playbooks & Guides

### 🖥️ System — Freeze / Crash / No Boot

| File | Platform | Covers |
|---|---|---|
| [[DIAG/DIAG dell post boot freeze\|Post-Boot Freeze — Dell]] | Windows 10/11 | Freeze ~60s after boot, BSOD stop codes, ePSA diagnostics, Safe Mode, WinRE offline logs, MemTest86, driver isolation, OS repair |
| [[DIAG/DIAG nobara sleep freeze bluetooth mx ergo\|Sleep Freeze & Bluetooth — Nobara Linux]] | Nobara / Fedora Linux | System freeze on wake from sleep (s2idle fix), Bluetooth mouse dropouts (USB power management) |

### 🖨️ Printing & Scanning

| File | Platform | Covers |
|---|---|---|
| [[DIAG/DIAG brother printer not printing\|Printer Not Printing — Brother / Canon]] | Windows | Print spooler reset, driver reinstall, network IP lookup via `arp -a`, printer web interface, phone setup (iPrint&Scan, AirPrint, Mopria) |
| [[REF/Copy Machines Maintenance\|Copy Machine Maintenance — Konica Minolta C25]] | Hardware | Scanner roller cleaning, carriage rail lubrication, service mode access, scan registration calibration, maintenance schedule |

### 🌐 Network & Internet

| File | Covers |
|---|---|
| [[REF/Network_Diagnosing_Handbook\|Network Diagnosing Handbook]] | Physical and logical fault isolation — DNS, IP conflicts, routing, Wi-Fi drops, modem/router diagnostics, cable and hardware checks |

### ✉️ Email & Browser

| File | Covers |
|---|---|
| [[INC/Email Support\|Email Support — Incident]] | Thunderbird/POP3 misconfiguration (TPG → The Messaging Company), fake security popups, Edge browser notification hijack |

### 🛡️ Security & Malware

> [!warning] 📌 Malware Handbook — Pending
> Most recent incident was a malware diagnosis. This section will be completed once current restructuring is finished. A placeholder row exists in the Incident Log below.

---

## 🗂️ Incident Log

> One row per resolved case. Open the linked file for the full diagnosis and resolution steps.

| Date | Sev | Device / OS | Symptom | Root Cause | File |
|---|---|---|---|---|---|
| 2026-03-21 | 🟡 Med | Windows PC | Emails not received + fake antivirus popups | TPG outsourced email to new provider; Edge notification permissions hijacked by adware | [[INC/Email Support\|Email Support]] |
| 2026-03-24 | 🟡 Med | Konica C25 | Squelching noise on scan + skewed copies | Dry scanner carriage rod; miscalibrated scan registration offset | [[REF/Copy Machines Maintenance\|Copy Machine Maint.]] |
| 2026-03-25 | 🔴 High | Dell · Windows | Freeze ~60s after boot | FS corruption masking corrupted `MicrosoftEdgeElevationService` | [[DIAG/DIAG dell post boot freeze\|Dell Freeze DIAG]] |
| 2026-03-26 | 🔴 High | Windows · Brother HL-L2400DW | Printer not printing, queue blank | Corrupted print spooler — silent failure with no Event Viewer logs | [[DIAG/DIAG brother printer not printing\|Printer DIAG]] |
| 2026-03-27 | 🟡 Med | Windows · Canon MG3660 | Printer not printing, drivers missing | Missing drivers + corrupted Windows files + full Temp folder blocking DISM | [[DIAG/DIAG brother printer not printing\|Printer DIAG]] |
| 2026-03-28 | 🟡 Med | Nobara Linux | System freeze on wake + Bluetooth dropouts | AMD iGPU incompatible with S3 deep sleep; USB power management killing BT adapter | [[DIAG/DIAG nobara sleep freeze bluetooth mx ergo\|Nobara DIAG]] |
| 2026-03-30 | 🔴 High | Dell · Windows | Hard freeze before login — WinRE only | Corrupted `TrustedInstaller` / Windows Modules Installer | [[DIAG/DIAG dell post boot freeze\|Dell Freeze DIAG]] |
| — | 🟡 Med | Windows PC | Desktop not loading after shutdown | Corrupted update cache + dirty shutdowns (Event ID 41 / 6008) | [[INC/Windows Incident Management\|Windows Repair]] |
| 📌 Recent | 🔴 High | — | Malware diagnosis | Pending — handbook in progress | — |

---

## 🔑 Quick Commands

```cmd
:: ── Windows File System Repair ──────────────────────────────
chkdsk C: /f /r
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth

:: ── Windows Update Cache Flush ──────────────────────────────
net stop wuauserv bits cryptsvc msiserver
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv bits cryptsvc msiserver

:: ── Safe Mode Toggle ─────────────────────────────────────────
bcdedit /set {default} safeboot minimal
bcdedit /deletevalue {default} safeboot

:: ── Print Spooler Reset ──────────────────────────────────────
sc.exe config Spooler start= disabled
sc.exe stop Spooler
del /q /f /s "%SystemRoot%\System32\spool\PRINTERS\*"
sc.exe config Spooler start= auto
sc.exe start Spooler

:: ── Network ──────────────────────────────────────────────────
ipconfig /all
ipconfig /flushdns
arp -a
ping [ip-address]
```

---

## 🔴 BSOD Quick Reference

| Stop Code | Likely Cause | Section |
|---|---|---|
| `PAGE_FAULT_IN_NONPAGED_AREA` | Bad RAM or faulty driver | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — RAM / Drivers]] |
| `WHEA_UNCORRECTABLE_ERROR` | CPU, RAM, or motherboard | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — RAM]] |
| `MEMORY_MANAGEMENT` | Direct RAM failure | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — RAM]] |
| `KERNEL_DATA_INPAGE_ERROR` | RAM or storage | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — RAM / Storage]] |
| `CRITICAL_PROCESS_DIED` | OS corruption or disk failure | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — OS Repair]] |
| `IRQL_NOT_LESS_OR_EQUAL` | Faulty driver | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — Drivers]] |
| `DPC_WATCHDOG_VIOLATION` | Storage or NIC driver | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — Drivers / Storage]] |
| `VIDEO_TDR_FAILURE` | GPU driver or hardware | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — GPU]] |
| `NTFS_FILE_SYSTEM` | Filesystem corruption | [[DIAG/DIAG dell post boot freeze\|Dell Freeze — Storage]] |

---

## 🧰 Field Tool Kit

→ [[REF/DIAG-KIT-GUIDE|DIAG-KIT Field Guide]] — Full symptom-to-tool lookup table, drive structure, and reference for all diagnostic tools (HWiNFO64, CrystalDiskInfo, Sysinternals suite, Medicat, AdwCleaner, ESET, Wireshark, and more).

---

<div style="font-family:'Segoe UI',sans-serif;background:#161b22;border:1px solid #30363d;border-radius:10px;padding:1.2rem 1.5rem;margin-top:1rem;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:0.5rem;">
<div style="font-family:monospace;font-size:0.68rem;color:#8b949e;">IT Support Knowledge Hub · Updated: 2026-04-02</div>
<div style="display:flex;gap:0.5rem;flex-wrap:wrap;">
<span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(63,185,80,0.1);border:1px solid rgba(63,185,80,0.25);color:#3fb950;">3 DIAG playbooks</span>
<span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(210,168,255,0.1);border:1px solid rgba(210,168,255,0.25);color:#d2a8ff;">2 incident reports</span>
<span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(88,166,255,0.1);border:1px solid rgba(88,166,255,0.25);color:#58a6ff;">3 REF files</span>
<span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(255,166,87,0.1);border:1px solid rgba(255,166,87,0.25);color:#ffa657;">1 handbook pending</span>
</div>
</div>
