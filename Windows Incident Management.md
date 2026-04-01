<div style="font-family:'Segoe UI',sans-serif;background:#0d1117;color:#e6edf3;border-radius:16px;overflow:hidden;border:1px solid #30363d;margin-bottom:2rem;">
<!-- HERO -->
<div style="background:linear-gradient(135deg,#0d1117 0%,#161b22 40%,#1a2332 100%);padding:2.5rem 2.5rem 2rem;border-bottom:1px solid #30363d;">
<div style="display:inline-flex;align-items:center;gap:6px;background:rgba(88,166,255,0.1);border:1px solid rgba(88,166,255,0.3);color:#58a6ff;font-family:monospace;font-size:0.7rem;padding:4px 10px;border-radius:4px;letter-spacing:0.1em;text-transform:uppercase;margin-bottom:1rem;">◉ Incident Report · IT Support</div>
<div style="font-size:2rem;font-weight:800;margin:0 0 0.4rem;color:#58a6ff;">Windows Repair &amp; Recovery</div>
<div style="color:#8b949e;font-family:monospace;font-size:0.85rem;">Desktop failure → log diagnosis → file repair → full system recovery</div>
<div style="display:flex;gap:1.5rem;margin-top:1.2rem;flex-wrap:wrap;">
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Platform: Windows PC</span>
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Tools: CMD · PowerShell · Event Viewer</span>
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Status: Resolved</span>
<span style="font-family:monospace;font-size:0.72rem;color:#8b949e;"><span style="color:#58a6ff;">◈</span> Secondary: mySigen App</span>
</div>
</div>
<!-- SECTION 01 TIMELINE -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">01 — Incident Timeline</div>
<div style="padding-left:1.5rem;border-left:3px solid #58a6ff;margin-bottom:1.2rem;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">🖥️ Desktop Not Showing on PC</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">The screen was not displaying the desktop. The machine was power cycled — the power source was physically shut down and turned back on. After the reboot, the desktop became accessible and troubleshooting could begin.</div>
</div>
<div style="padding-left:1.5rem;border-left:3px solid #3fb950;margin-bottom:1.2rem;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">⚡ Power Cycled — Machine Restored Access</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">The power source was fully shut down and restarted. This cleared the hardware state and allowed the OS to boot normally. CMD as Administrator was accessible immediately after the reboot — no Safe Mode was needed.</div>
</div>
<div style="padding-left:1.5rem;border-left:3px solid #d2a8ff;margin-bottom:1.2rem;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">🔍 Log Analysis via Event Viewer</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">Opened eventvwr.msc and filtered for Critical and Error events. Found repeated failed Windows updates and unexpected shutdowns pointing to corrupted system files.</div>
</div>
<div style="padding-left:1.5rem;border-left:3px solid #f78166;margin-bottom:1.2rem;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">⚠️ Root Cause — Corrupted Files</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">Event IDs 41 and 6008 confirmed dirty shutdowns. Bad update cache had corrupted core Windows components causing both the desktop failure and ongoing update failures.</div>
</div>
<div style="padding-left:1.5rem;border-left:3px solid #3fb950;margin-bottom:1.2rem;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">✅ Repair Executed — System Restored</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">Ran SFC and DISM as Administrator. Corrupted files detected and restored. All pending updates installed successfully. System rebooted cleanly.</div>
</div>
<div style="padding-left:1.5rem;border-left:3px solid #58a6ff;">
<div style="font-weight:700;font-size:0.92rem;margin-bottom:0.25rem;color:#e6edf3;">🌿 mySigen App Not Showing Data</div>
<div style="font-size:0.81rem;color:#8b949e;line-height:1.55;">Secondary issue unrelated to Windows. Solar energy app lost its data feed after the power reset. Resolved by power cycling the Sigen Energy Gateway and waiting for reconnection.</div>
</div>
</div>
<!-- SECTION 02 COMMANDS -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">02 — Commands Used &amp; What They Do</div>
<table style="width:100%;border-collapse:separate;border-spacing:0 0.6rem;">
<tr>
<td style="width:50%;vertical-align:top;padding-right:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">STOP SERVICES</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(255,166,87,0.15);color:#ffa657;font-weight:700;">Step 1</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">net stop wuauserv<br>net stop bits<br>net stop cryptsvc<br>net stop msiserver</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Pauses Windows Update services so locked files can be safely deleted without errors.</div>
</div>
</div>
</td>
<td style="width:50%;vertical-align:top;padding-left:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">CLEAR UPDATE CACHE</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(247,129,102,0.15);color:#f78166;font-weight:700;">Step 2</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">rd /s /q C:\Windows\SoftwareDistribution<br>rd /s /q C:\Windows\System32\catroot2</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Deletes corrupted update files. Windows rebuilds this folder automatically from scratch.</div>
</div>
</div>
</td>
</tr>
<tr>
<td style="width:50%;vertical-align:top;padding-right:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">★ SFC SCAN — KEY FIX</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(63,185,80,0.15);color:#3fb950;font-weight:700;">Primary Repair</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">sfc /scannow</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Scans every protected Windows file and replaces corrupted ones from internal backup. This was the primary fix. Takes 5–10 mins. Do not close the window.</div>
</div>
</div>
</td>
<td style="width:50%;vertical-align:top;padding-left:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">DISM IMAGE REPAIR</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(63,185,80,0.15);color:#3fb950;font-weight:700;">Step 5</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">DISM /Online /Cleanup-Image /CheckHealth<br>DISM /Online /Cleanup-Image /ScanHealth<br>DISM /Online /Cleanup-Image /RestoreHealth</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Goes deeper than SFC. Repairs the Windows OS image by downloading clean files from Microsoft. Run in this exact order. Takes 15–20 mins.</div>
</div>
</div>
</td>
</tr>
<tr>
<td style="width:50%;vertical-align:top;padding-right:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">RESTART SERVICES</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(88,166,255,0.15);color:#58a6ff;font-weight:700;">Step 3</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">net start wuauserv<br>net start bits<br>net start cryptsvc<br>net start msiserver</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Restarts paused services. Windows now rebuilds the update cache fresh and resumes normally.</div>
</div>
</div>
</td>
<td style="width:50%;vertical-align:top;padding-left:0.5rem;">
<div style="background:#161b22;border:1px solid #30363d;border-radius:10px;overflow:hidden;">
<div style="display:flex;justify-content:space-between;align-items:center;padding:0.6rem 0.8rem;background:#1c2128;border-bottom:1px solid #30363d;">
<span style="font-family:monospace;font-size:0.7rem;font-weight:700;color:#e6edf3;">EXPLORER RESTART</span>
<span style="font-family:monospace;font-size:0.6rem;padding:2px 6px;border-radius:3px;background:rgba(88,166,255,0.15);color:#58a6ff;font-weight:700;">Quick Fix</span>
</div>
<div style="padding:0.8rem;">
<div style="font-family:monospace;font-size:0.75rem;color:#3fb950;background:rgba(63,185,80,0.05);border:1px solid rgba(63,185,80,0.15);border-radius:6px;padding:0.6rem 0.8rem;margin-bottom:0.6rem;line-height:1.6;">taskkill /f /im explorer.exe<br>start explorer.exe</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.5;">Instantly restarts the Windows desktop shell. Use this first when desktop disappears — no reboot needed, takes under 5 seconds.</div>
</div>
</div>
</td>
</tr>
</table>
</div>
<!-- SECTION 03 EVENT LOG TABLE -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">03 — Event Log Reference</div>
<table style="width:100%;border-collapse:collapse;font-size:0.8rem;">
<thead>
<tr>
<th style="font-family:monospace;font-size:0.65rem;text-transform:uppercase;letter-spacing:0.1em;color:#8b949e;text-align:left;padding:0.5rem 0.75rem;border-bottom:1px solid #30363d;">Event ID</th>
<th style="font-family:monospace;font-size:0.65rem;text-transform:uppercase;letter-spacing:0.1em;color:#8b949e;text-align:left;padding:0.5rem 0.75rem;border-bottom:1px solid #30363d;">Severity</th>
<th style="font-family:monospace;font-size:0.65rem;text-transform:uppercase;letter-spacing:0.1em;color:#8b949e;text-align:left;padding:0.5rem 0.75rem;border-bottom:1px solid #30363d;">Meaning</th>
<th style="font-family:monospace;font-size:0.65rem;text-transform:uppercase;letter-spacing:0.1em;color:#8b949e;text-align:left;padding:0.5rem 0.75rem;border-bottom:1px solid #30363d;">Location</th>
</tr>
</thead>
<tbody>
<tr style="background:rgba(255,255,255,0.01);">
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.72rem;background:#1c2128;border:1px solid #30363d;border-radius:4px;padding:2px 6px;color:#58a6ff;">ID 41</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.6rem;padding:2px 7px;border-radius:3px;background:rgba(247,129,102,0.15);color:#f78166;font-weight:700;">CRITICAL</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);color:#8b949e;">System not shut down cleanly — power loss or hard freeze</td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);font-family:monospace;font-size:0.72rem;color:#8b949e;">Logs → System</td>
</tr>
<tr>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.72rem;background:#1c2128;border:1px solid #30363d;border-radius:4px;padding:2px 6px;color:#58a6ff;">ID 6008</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.6rem;padding:2px 7px;border-radius:3px;background:rgba(247,129,102,0.15);color:#f78166;font-weight:700;">CRITICAL</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);color:#8b949e;">Previous shutdown was unexpected — confirms abnormal shutdown</td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);font-family:monospace;font-size:0.72rem;color:#8b949e;">Logs → System</td>
</tr>
<tr style="background:rgba(255,255,255,0.01);">
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.72rem;background:#1c2128;border:1px solid #30363d;border-radius:4px;padding:2px 6px;color:#58a6ff;">ID 1074</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.6rem;padding:2px 7px;border-radius:3px;background:rgba(88,166,255,0.15);color:#58a6ff;font-weight:700;">INFO</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);color:#8b949e;">A program or Windows initiated a planned restart</td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);font-family:monospace;font-size:0.72rem;color:#8b949e;">Logs → System</td>
</tr>
<tr>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.72rem;background:#1c2128;border:1px solid #30363d;border-radius:4px;padding:2px 6px;color:#58a6ff;">ID 7034</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);"><span style="font-family:monospace;font-size:0.6rem;padding:2px 7px;border-radius:3px;background:rgba(255,166,87,0.15);color:#ffa657;font-weight:700;">WARNING</span></td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);color:#8b949e;">A Windows service crashed unexpectedly and terminated</td>
<td style="padding:0.6rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.5);font-family:monospace;font-size:0.72rem;color:#8b949e;">Logs → System</td>
</tr>
<tr style="background:rgba(255,255,255,0.01);">
<td style="padding:0.6rem 0.75rem;"><span style="font-family:monospace;font-size:0.72rem;background:#1c2128;border:1px solid #30363d;border-radius:4px;padding:2px 6px;color:#58a6ff;">WER</span></td>
<td style="padding:0.6rem 0.75rem;"><span style="font-family:monospace;font-size:0.6rem;padding:2px 7px;border-radius:3px;background:rgba(255,166,87,0.15);color:#ffa657;font-weight:700;">WARNING</span></td>
<td style="padding:0.6rem 0.75rem;color:#8b949e;">Windows Error Reporting — app or shell crash recorded</td>
<td style="padding:0.6rem 0.75rem;font-family:monospace;font-size:0.72rem;color:#8b949e;">Logs → Application</td>
</tr>
</tbody>
</table>
<div style="margin-top:1rem;font-size:0.77rem;color:#8b949e;font-family:monospace;background:#161b22;border:1px solid #30363d;border-radius:6px;padding:0.6rem 0.9rem;">💡 Open: Win + R → <span style="color:#58a6ff;">eventvwr.msc</span> → Windows Logs → System → Filter Current Log → tick Critical + Error</div>
</div>
<!-- SECTION 04 REPAIR FLOW -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">04 — Full Repair Flow</div>
<table style="width:100%;border-collapse:collapse;">
<tr>
<td style="width:2px;background:linear-gradient(180deg,#3fb950,#30363d);padding:0;vertical-align:top;"></td>
<td style="padding:0 0 1.5rem 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#3fb950;background:#0d1117;border:2px solid #3fb950;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">01</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">Power Cycled the Machine</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">The power source was physically shut down and turned back on. After the reboot, Windows loaded normally and the desktop became accessible — no recovery environment or Safe Mode was required.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ Desktop accessible after power cycle</span>
<div style="margin-top:0.6rem;font-size:0.75rem;color:#8b949e;background:rgba(88,166,255,0.05);border:1px solid rgba(88,166,255,0.2);border-left:3px solid #58a6ff;border-radius:4px;padding:0.5rem 0.75rem;"><span style="color:#58a6ff;font-weight:700;">💡 Alternative if desktop is still missing:</span> Force-restart 3 times → Windows Recovery → Troubleshoot → Startup Settings → press 4 for Safe Mode. Use this when a normal boot does not restore the desktop.</div>
</td>
</tr>
<tr>
<td style="width:2px;background:linear-gradient(180deg,#3fb950,#30363d);padding:0;vertical-align:top;"></td>
<td style="padding:0 0 1.5rem 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#3fb950;background:#0d1117;border:2px solid #3fb950;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">02</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">Opened CMD as Administrator</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">After the reboot, CMD was opened successfully with Administrator rights: Search → cmd → right-click → Run as Administrator. The title bar confirmed "Administrator: Command Prompt" and all repair commands were accepted without issue.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ Full elevated access granted</span>
</td>
</tr>
<tr>
<td style="width:2px;background:linear-gradient(180deg,#3fb950,#30363d);padding:0;vertical-align:top;"></td>
<td style="padding:0 0 1.5rem 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#3fb950;background:#0d1117;border:2px solid #3fb950;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">03</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">Stopped Services &amp; Cleared Cache</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">Stopped wuauserv, bits, cryptsvc, msiserver. Deleted the SoftwareDistribution folder where bad update files were stored. Removed the source of corruption.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ Corrupted update cache removed</span>
</td>
</tr>
<tr>
<td style="width:2px;background:linear-gradient(180deg,#58a6ff,#30363d);padding:0;vertical-align:top;"></td>
<td style="padding:0 0 1.5rem 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#58a6ff;background:#0d1117;border:2px solid #58a6ff;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">04</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">★ Ran SFC /scannow — Primary Fix</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">The key command. Windows scanned all protected system files, found corrupted ones, and automatically restored them from its internal backup. Took 5–10 minutes.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ Corrupted files detected and restored</span>
</td>
</tr>
<tr>
<td style="width:2px;background:linear-gradient(180deg,#3fb950,#30363d);padding:0;vertical-align:top;"></td>
<td style="padding:0 0 1.5rem 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#3fb950;background:#0d1117;border:2px solid #3fb950;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">05</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">Ran DISM RestoreHealth</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">Ran CheckHealth → ScanHealth → RestoreHealth in order. Repaired the Windows OS image and downloaded any missing components directly from Microsoft servers.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ Windows image fully repaired</span>
</td>
</tr>
<tr>
<td style="width:2px;padding:0;vertical-align:top;"></td>
<td style="padding:0 0 0 1.5rem;vertical-align:top;">
<div style="display:inline-block;font-family:monospace;font-size:0.6rem;color:#3fb950;background:#0d1117;border:2px solid #3fb950;border-radius:50%;width:20px;height:20px;text-align:center;line-height:18px;font-weight:700;margin-bottom:0.4rem;">06</div>
<div style="font-weight:700;font-size:0.9rem;margin-bottom:0.2rem;color:#e6edf3;">Reinstalled All Updates &amp; Rebooted</div>
<div style="font-size:0.8rem;color:#8b949e;line-height:1.5;margin-bottom:0.35rem;">Opened Windows Update and installed all pending updates. With cache cleared and files restored, all installed cleanly. Final reboot confirmed desktop loading normally with no new errors in Event Viewer.</div>
<span style="font-family:monospace;font-size:0.68rem;color:#3fb950;background:rgba(63,185,80,0.08);border:1px solid rgba(63,185,80,0.2);padding:2px 8px;border-radius:4px;">✓ System fully operational</span>
</td>
</tr>
</table>
</div>
<!-- SECTION 05 KEY LEARNINGS -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">05 — Key Learnings</div>
<table style="width:100%;border-collapse:separate;border-spacing:0.5rem;">
<tr>
<td style="vertical-align:top;background:#161b22;border:1px solid #30363d;border-top:3px solid #58a6ff;border-radius:10px;padding:1.1rem;width:50%;">
<div style="font-size:1.3rem;margin-bottom:0.5rem;">🧩</div>
<div style="font-weight:700;font-size:0.85rem;margin-bottom:0.4rem;color:#e6edf3;">Desktop = explorer.exe Shell</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.55;">The Windows desktop is a program called explorer.exe. When it crashes, wallpaper, taskbar and icons disappear but the OS keeps running. Restart it instantly from Task Manager — no reboot needed.</div>
</td>
<td style="vertical-align:top;background:#161b22;border:1px solid #30363d;border-top:3px solid #3fb950;border-radius:10px;padding:1.1rem;width:50%;">
<div style="font-size:1.3rem;margin-bottom:0.5rem;">🔑</div>
<div style="font-weight:700;font-size:0.85rem;margin-bottom:0.4rem;color:#e6edf3;">Admin Privileges Are Essential</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.55;">CMD must be run as Administrator for repair commands to work. Without it, sfc /scannow is silently rejected. Always confirm "Administrator:" appears in the title bar first.</div>
</td>
</tr>
<tr>
<td style="vertical-align:top;background:#161b22;border:1px solid #30363d;border-top:3px solid #ffa657;border-radius:10px;padding:1.1rem;width:50%;">
<div style="font-size:1.3rem;margin-bottom:0.5rem;">📋</div>
<div style="font-weight:700;font-size:0.85rem;margin-bottom:0.4rem;color:#e6edf3;">Event Viewer Tells the Story</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.55;">Every crash and failed update is logged with a timestamp. Event IDs 41 and 6008 mean dirty shutdowns. Reading logs tells you when and why something broke before you touch a single command.</div>
</td>
<td style="vertical-align:top;background:#161b22;border:1px solid #30363d;border-top:3px solid #d2a8ff;border-radius:10px;padding:1.1rem;width:50%;">
<div style="font-size:1.3rem;margin-bottom:0.5rem;">🔄</div>
<div style="font-weight:700;font-size:0.85rem;margin-bottom:0.4rem;color:#e6edf3;">SFC Before DISM</div>
<div style="font-size:0.78rem;color:#8b949e;line-height:1.55;">Always run sfc /scannow first — it's fast and fixes most corruption. Only run DISM if SFC reports it couldn't fix everything. DISM downloads from Microsoft so it takes much longer.</div>
</td>
</tr>
</table>
</div>
<!-- SECTION 06 PREVENTION -->
<div style="padding:2rem 2.5rem;border-bottom:1px solid #30363d;">
<div style="font-family:monospace;font-size:0.65rem;letter-spacing:0.15em;text-transform:uppercase;color:#8b949e;margin-bottom:1.5rem;border-bottom:1px solid #30363d;padding-bottom:0.5rem;">06 — Prevention Checklist</div>
<table style="width:100%;border-collapse:collapse;">
<tr><td style="padding:0.5rem 0;border-bottom:1px solid rgba(48,54,61,0.4);vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.4);font-size:0.83rem;color:#8b949e;line-height:1.4;">Never force-shut down while Windows Update is actively installing — let it finish even if it takes over an hour</td></tr>
<tr><td style="padding:0.5rem 0;border-bottom:1px solid rgba(48,54,61,0.4);vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.4);font-size:0.83rem;color:#8b949e;line-height:1.4;">Run <span style="font-family:monospace;color:#58a6ff;font-size:0.8rem;">sfc /scannow</span> once a month from an elevated CMD as a routine health check</td></tr>
<tr><td style="padding:0.5rem 0;border-bottom:1px solid rgba(48,54,61,0.4);vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.4);font-size:0.83rem;color:#8b949e;line-height:1.4;">If updates are stuck for more than 2 hours with no progress, only then force restart — not before</td></tr>
<tr><td style="padding:0.5rem 0;border-bottom:1px solid rgba(48,54,61,0.4);vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.4);font-size:0.83rem;color:#8b949e;line-height:1.4;">Keep the PowerShell repair script saved locally so it can be run immediately if this happens again</td></tr>
<tr><td style="padding:0.5rem 0;border-bottom:1px solid rgba(48,54,61,0.4);vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;border-bottom:1px solid rgba(48,54,61,0.4);font-size:0.83rem;color:#8b949e;line-height:1.4;">For mySigen: if data stops displaying, power cycle the Sigen Gateway — wait 60 seconds before turning back on</td></tr>
<tr><td style="padding:0.5rem 0;vertical-align:top;width:24px;"><span style="display:inline-block;width:18px;height:18px;border-radius:4px;border:1.5px solid #3fb950;color:#3fb950;font-size:0.65rem;font-weight:700;text-align:center;line-height:17px;">✓</span></td><td style="padding:0.5rem 0 0.5rem 0.75rem;font-size:0.83rem;color:#8b949e;line-height:1.4;">Check Event Viewer after any abnormal shutdown to catch early signs of corruption before they become bigger failures</td></tr>
</table>
</div>
<!-- FOOTER -->
<div style="padding:1.2rem 2.5rem;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:0.5rem;">
<div style="font-family:monospace;font-size:0.68rem;color:#8b949e;">IT Incident Report · Windows Repair Session</div>
<div style="display:inline-flex;align-items:center;gap:6px;background:rgba(63,185,80,0.1);border:1px solid rgba(63,185,80,0.3);color:#3fb950;font-family:monospace;font-size:0.68rem;padding:4px 12px;border-radius:20px;font-weight:700;">● RESOLVED</div>
</div>
</div>
