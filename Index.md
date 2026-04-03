<div style="font-family:'Segoe UI',sans-serif;background:#0d1117;color:#e6edf3;border-radius:16px;overflow:hidden;border:1px solid #30363d;margin-bottom:2rem;"> <!-- HERO --> <div style="background:linear-gradient(135deg,#0d1117 0%,#161b22 40%,#1a2332 100%);padding:2.5rem 2.5rem 2rem;border-bottom:1px solid #30363d;"> <div style="display:inline-flex;align-items:center;gap:6px;background:rgba(88,166,255,0.1);border:1px solid rgba(88,166,255,0.3);color:#58a6ff;font-family:monospace;font-size:0.7rem;padding:4px 10px;border-radius:4px;letter-spacing:0.1em;text-transform:uppercase;margin-bottom:1rem;">⬡ Knowledge Hub · IT Support</div> <div style="font-size:2rem;font-weight:800;margin:0 0 0.4rem;color:#58a6ff;">Windows Incident Index</div> <div style="color:#8b949e;font-family:monospace;font-size:0.85rem;">Triage → Diagnostic Guide → Incident Report → Resolution</div> <div style="display:flex;gap:1.5rem;margin-top:1.2rem;flex-wrap:wrap;"> <span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Platform: Windows 10 / 11</span> <span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Scope: Field Support · Enterprise</span> <span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Tools: CMD · WinRE · Medicat USB</span> <span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Format: DIAG · Incident Reports</span> </div> </div> <!-- HOW TO USE --> <div style="padding:1.4rem 2.5rem;border-bottom:1px solid #30363d;background:rgba(88,166,255,0.03);"> <div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:0.75rem;">How to use this index</div> <div style="display:flex;gap:2rem;flex-wrap:wrap;"> <div style="font-size:0.8rem;color:#8b949e;line-height:1.6;"><span style="color:#ffa657;font-weight:700;">DIAG files</span> — Reusable diagnostic playbooks. Start here when a new ticket matches a known symptom pattern.</div> <div style="font-size:0.8rem;color:#8b949e;line-height:1.6;"><span style="color:#3fb950;font-weight:700;">Incident Reports</span> — One file per resolved case. Link a report back to the DIAG file it followed.</div> </div> </div> </div>

---

## ⚡ Quick Triage — Start Here

```mermaid
flowchart TD
    classDef start  fill:#1a2332,color:#58a6ff,stroke:#58a6ff,stroke-width:2px
    classDef check  fill:#161b22,color:#e6edf3,stroke:#30363d,stroke-width:1.5px
    classDef diag   fill:#1c2a1e,color:#3fb950,stroke:#238636,stroke-width:2px
    classDef warn   fill:#2a1f10,color:#ffa657,stroke:#d4720c,stroke-width:2px
    classDef crit   fill:#2a1010,color:#f78166,stroke:#c0392b,stroke-width:2px

    START([🖥️ Windows Problem]):::start

    START --> Q1{Machine freezes\nor won't boot?}:::check
    START --> Q2{Blue screen\nwith stop code?}:::check
    START --> Q3{Desktop loads but\napps or updates broken?}:::check
    START --> Q4{Printer or\nperipheral issue?}:::check

    Q1 -- YES --> DIAG1([📋 DIAG — Post-Boot Freeze\nDell · All Windows]):::diag
    Q2 -- YES --> BSOD([📋 BSOD Table →\nDIAG Post-Boot Freeze §BSOD]):::warn
    Q3 -- YES --> DIAG2([📋 Windows Repair & Recovery\nCorruption · Updates · Explorer]):::diag
    Q4 -- YES --> TBD1([📋 Coming soon — Printer DIAG]):::warn
```

---

## 📋 Diagnostic Playbooks

> [!tip] One DIAG file per **symptom category** — not per machine or case. Each DIAG file is a reusable fault tree with escalation paths.

<div style="font-family:'Segoe UI',sans-serif;display:grid;grid-template-columns:1fr 1fr;gap:0.75rem;margin:1rem 0;"> <div style="background:#161b22;border:1px solid #30363d;border-top:3px solid #f78166;border-radius:10px;padding:1.2rem;"> <div style="font-family:monospace;font-size:0.62rem;letter-spacing:0.12em;text-transform:uppercase;color:#f78166;margin-bottom:0.5rem;">FREEZE · CRASH · NO BOOT</div> <div style="font-weight:700;font-size:0.95rem;margin-bottom:0.4rem;color:#e6edf3;">Post-Boot Freeze</div> <div style="font-size:0.78rem;color:#8b949e;line-height:1.5;margin-bottom:0.75rem;">Freeze ~60s after boot. Covers ePSA, Safe Mode, WinRE offline logs, MemTest86, driver isolation, OS repair escalation. Includes BSOD stop code table.</div> <div style="display:flex;gap:0.4rem;flex-wrap:wrap;margin-bottom:0.7rem;"> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(247,129,102,0.12);color:#f78166;border:1px solid rgba(247,129,102,0.25);">High Severity</span> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(88,166,255,0.1);color:#58a6ff;border:1px solid rgba(88,166,255,0.2);">Dell · All Windows</span> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(48,54,61,0.6);color:#8b949e;border:1px solid #30363d;">No internet required</span> </div> <div style="font-family:monospace;font-size:0.75rem;color:#58a6ff;">→ [[DIAG_dell_post_boot_freeze]]</div> </div> <div style="background:#161b22;border:1px solid #30363d;border-top:3px solid #58a6ff;border-radius:10px;padding:1.2rem;"> <div style="font-family:monospace;font-size:0.62rem;letter-spacing:0.12em;text-transform:uppercase;color:#58a6ff;margin-bottom:0.5rem;">CORRUPTION · UPDATES · DESKTOP</div> <div style="font-weight:700;font-size:0.95rem;margin-bottom:0.4rem;color:#e6edf3;">Windows Repair & Recovery</div> <div style="font-size:0.78rem;color:#8b949e;line-height:1.5;margin-bottom:0.75rem;">Desktop not loading, update failures, corrupted system files. Covers SFC → DISM pipeline, update cache flush, explorer.exe recovery. Event IDs 41 and 6008.</div> <div style="display:flex;gap:0.4rem;flex-wrap:wrap;margin-bottom:0.7rem;"> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(63,185,80,0.1);color:#3fb950;border:1px solid rgba(63,185,80,0.2);">Resolved</span> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(88,166,255,0.1);color:#58a6ff;border:1px solid rgba(88,166,255,0.2);">All Windows</span> <span style="font-family:monospace;font-size:0.65rem;padding:2px 7px;border-radius:3px;background:rgba(48,54,61,0.6);color:#8b949e;border:1px solid #30363d;">Internet optional</span> </div> <div style="font-family:monospace;font-size:0.75rem;color:#58a6ff;">→ [[Windows_Incident_Management]]</div> </div> <div style="background:#161b22;border:1px dashed #30363d;border-radius:10px;padding:1.2rem;opacity:0.5;"> <div style="font-family:monospace;font-size:0.62rem;letter-spacing:0.12em;text-transform:uppercase;color:#8b949e;margin-bottom:0.5rem;">DRIVER · DEVICE</div> <div style="font-weight:700;font-size:0.95rem;margin-bottom:0.4rem;color:#8b949e;">Printer & Peripheral Failures</div> <div style="font-size:0.78rem;color:#8b949e;line-height:1.5;margin-bottom:0.75rem;">Spooler corruption, USB not detected, driver rollback. Brother, Canon, Konica Minolta. Coming soon.</div> <div style="font-family:monospace;font-size:0.75rem;color:#8b949e;">→ [[DIAG_printer_peripheral]] · not yet created</div> </div> <div style="background:#161b22;border:1px dashed #30363d;border-radius:10px;padding:1.2rem;opacity:0.5;"> <div style="font-family:monospace;font-size:0.62rem;letter-spacing:0.12em;text-transform:uppercase;color:#8b949e;margin-bottom:0.5rem;">NETWORK · CONNECTIVITY</div> <div style="font-weight:700;font-size:0.95rem;margin-bottom:0.4rem;color:#8b949e;">Network & DNS Failures</div> <div style="font-size:0.78rem;color:#8b949e;line-height:1.5;margin-bottom:0.75rem;">No internet, adapter reset, DNS flush, TP-Link / DSL modem diagnostics. Coming soon.</div> <div style="font-family:monospace;font-size:0.75rem;color:#8b949e;">→ [[DIAG_network_connectivity]] · not yet created</div> </div> </div>

---

## 🗂️ Incident Reports

> [!info] Each row = one resolved case. Severity, root cause, and DIAG file used — quick scan before opening the full report.

|Date|Severity|Machine|Symptom|Root Cause|DIAG Used|Report|
|---|---|---|---|---|---|---|
|2026-03-25|🟡 Med|Dell DESKTOP-HTVN0BQ|Freeze ~60s after boot|FS corruption + corrupted `MicrosoftEdgeElevationService`|[[DIAG_dell_post_boot_freeze]]|[[INC_2026-03-25_dell_freeze]]|
|2026-03-30|🔴 High|Dell DESKTOP-HTVN0BQ|Hard freeze before login — WinRE only|Corrupted `TrustedInstaller` / Windows Modules Installer|[[DIAG_dell_post_boot_freeze]]|[[INC_2026-03-30_dell_freeze_recurrence]]|
|—|🟡 Med|Windows PC (client)|Desktop not loading after shutdown|Corrupted update cache + dirty shutdowns (Event ID 41 / 6008)|[[Windows_Incident_Management]]|[[Windows_Incident_Management]]|

> [!tip] Naming convention for new reports: `INC_YYYY-MM-DD_short_description.md`

---

## 🔑 Repair Command Cheatsheet

<div style="font-family:'Segoe UI',sans-serif;background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;margin:1rem 0;"> <div style="padding:0.6rem 1rem;background:#1c2128;border-bottom:1px solid #30363d;font-family:monospace;font-size:0.65rem;letter-spacing:0.12em;text-transform:uppercase;color:#8b949e;">Quick Reference — CMD as Administrator</div> <div style="padding:1rem;display:grid;grid-template-columns:1fr 1fr;gap:0.5rem;"> <div style="background:#0d1117;border:1px solid rgba(63,185,80,0.2);border-radius:6px;padding:0.6rem 0.8rem;"> <div style="font-family:monospace;font-size:0.65rem;color:#3fb950;margin-bottom:0.3rem;">FILE SYSTEM</div> <div style="font-family:monospace;font-size:0.75rem;color:#e6edf3;line-height:1.8;">chkdsk C: /f /r<br>sfc /scannow<br>DISM /Online /Cleanup-Image /RestoreHealth</div> </div> <div style="background:#0d1117;border:1px solid rgba(88,166,255,0.2);border-radius:6px;padding:0.6rem 0.8rem;"> <div style="font-family:monospace;font-size:0.65rem;color:#58a6ff;margin-bottom:0.3rem;">UPDATE CACHE FLUSH</div> <div style="font-family:monospace;font-size:0.75rem;color:#e6edf3;line-height:1.8;">net stop wuauserv bits cryptsvc msiserver<br>rd /s /q C:\Windows\SoftwareDistribution<br>net start wuauserv bits cryptsvc msiserver</div> </div> <div style="background:#0d1117;border:1px solid rgba(255,166,87,0.2);border-radius:6px;padding:0.6rem 0.8rem;"> <div style="font-family:monospace;font-size:0.65rem;color:#ffa657;margin-bottom:0.3rem;">SAFE MODE / BOOT</div> <div style="font-family:monospace;font-size:0.75rem;color:#e6edf3;line-height:1.8;">bcdedit /set {default} safeboot minimal<br>bcdedit /deletevalue {default} safeboot<br>bcdedit /set {default} bootlog yes</div> </div> <div style="background:#0d1117;border:1px solid rgba(210,168,255,0.2);border-radius:6px;padding:0.6rem 0.8rem;"> <div style="font-family:monospace;font-size:0.65rem;color:#d2a8ff;margin-bottom:0.3rem;">OFFLINE LOGS (WinRE)</div> <div style="font-family:monospace;font-size:0.75rem;color:#e6edf3;line-height:1.8;">wevtutil qe /lf:true C:\Windows\...\System.evtx<br>/q:"*[System[(Level=1 or Level=2)]]"<br>/c:20 /rd:true /f:text</div> </div> </div> </div>

---

## 🔴 BSOD Stop Code Index

|Stop Code|Likely Cause|Go To|
|---|---|---|
|`PAGE_FAULT_IN_NONPAGED_AREA`|Bad RAM or faulty driver|[[DIAG_dell_post_boot_freeze#B2 — RAM]] · [[DIAG_dell_post_boot_freeze#D — Drivers]]|
|`WHEA_UNCORRECTABLE_ERROR`|CPU, RAM, or motherboard|[[DIAG_dell_post_boot_freeze#B2 — RAM]] · [[DIAG_dell_post_boot_freeze#B6 — CPU & Motherboard]]|
|`MEMORY_MANAGEMENT`|Direct RAM failure|[[DIAG_dell_post_boot_freeze#B2 — RAM]]|
|`KERNEL_DATA_INPAGE_ERROR`|RAM or storage|[[DIAG_dell_post_boot_freeze#B2 — RAM]] · [[DIAG_dell_post_boot_freeze#B3 — Storage]]|
|`CRITICAL_PROCESS_DIED`|OS corruption or disk failure|[[DIAG_dell_post_boot_freeze#E — Software & Malware]] · [[DIAG_dell_post_boot_freeze#F — OS Repair]]|
|`IRQL_NOT_LESS_OR_EQUAL`|Faulty driver|[[DIAG_dell_post_boot_freeze#D — Drivers]]|
|`SYSTEM_SERVICE_EXCEPTION`|Corrupt driver or system file|[[DIAG_dell_post_boot_freeze#D — Drivers]]|
|`DPC_WATCHDOG_VIOLATION`|Storage or NIC driver|[[DIAG_dell_post_boot_freeze#D — Drivers]] · [[DIAG_dell_post_boot_freeze#B3 — Storage]]|
|`VIDEO_TDR_FAILURE`|GPU driver or hardware|[[DIAG_dell_post_boot_freeze#B5 — GPU]]|
|`NTFS_FILE_SYSTEM`|Disk / filesystem corruption|[[DIAG_dell_post_boot_freeze#B3 — Storage]]|

---

## 🧰 Tools at a Glance

|Tool|Purpose|Access|Internet|
|---|---|---|---|
|**Dell ePSA / SupportAssist**|Tests CPU, RAM, disk, fans|F12 → Diagnostics|No|
|**MemTest86**|Thorough multi-pass RAM test|Medicat USB|No|
|**CrystalDiskInfo**|SMART drive health|Medicat → Hiren's PE|No|
|**HWiNFO64**|Temps, voltages, sensors|Medicat → Hiren's PE|No|
|**Windows Memory Diagnostic**|Basic RAM check|`mdsched.exe`|No|
|**SFC**|Repairs Windows protected files|CMD (Admin)|No|
|**DISM**|Repairs Windows component store|CMD (Admin)|Offline: No|
|**Event Viewer**|System error and crash logs|`eventvwr.msc`|No|
|**Malwarebytes Portable**|Malware scan|Medicat → Hiren's PE|No|

---

<div style="font-family:'Segoe UI',sans-serif;background:#161b22;border:1px solid #30363d;border-radius:10px;padding:1.2rem 1.5rem;margin-top:1rem;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:0.5rem;"> <div style="font-family:monospace;font-size:0.68rem;color:#8b949e;">Windows Incident Index · IT Support KB</div> <div style="display:flex;gap:0.5rem;flex-wrap:wrap;"> <span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(63,185,80,0.1);border:1px solid rgba(63,185,80,0.25);color:#3fb950;">2 DIAG files active</span> <span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(88,166,255,0.1);border:1px solid rgba(88,166,255,0.25);color:#58a6ff;">3 incidents logged</span> <span style="font-family:monospace;font-size:0.65rem;padding:3px 10px;border-radius:12px;background:rgba(255,166,87,0.1);border:1px solid rgba(255,166,87,0.25);color:#ffa657;">2 DIAG files pending</span> </div> </div>