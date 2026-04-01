---
title: Network Diagnosing Handbook
tags: [networking, troubleshooting, IT-support]
author: Jael
version: "1.0"
updated: 2026-03-25
---

<div style="background:linear-gradient(135deg,#0e1118,#141820);border:1px solid #1e2a3a;border-top:3px solid #00e5ff;border-radius:6px;padding:32px 36px 28px;margin-bottom:8px;position:relative;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#00e5ff;letter-spacing:4px;text-transform:uppercase;margin-bottom:8px;">// Field Operations Reference &middot; v1.0 &middot; March 2026</div>
<div style="font-family:'Segoe UI',sans-serif;font-size:42px;font-weight:900;color:#eef4ff;letter-spacing:-1px;line-height:1.05;text-transform:uppercase;margin-bottom:10px;">Network <span style="color:#00e5ff;">Diagnosing</span> Handbook</div>
<div style="font-size:14px;color:#5a7a9a;margin-bottom:18px;line-height:1.6;">A structured field reference for physical and logical network fault isolation &mdash; built from real troubleshooting experience in Adelaide, AU.</div>
<div style="display:flex;flex-wrap:wrap;gap:20px;font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;">
<div>AUTHOR <span style="color:#00e5ff;">Jael</span></div>
<div>DOMAIN <span style="color:#00e5ff;">IT Support / Networking</span></div>
<div>STATUS <span style="color:#00e5ff;">Active</span></div>
<div>REPO <a href="https://github.com/YOUR-USERNAME/network-handbook" style="color:#00e5ff;text-decoration:none;">github.com/YOUR-USERNAME/network-handbook</a></div>
</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #00e5ff;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 01 &mdash; Core Methodology</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Diagnostic Order</div>
<div style="font-size:14px;color:#c8d8e8;margin-bottom:12px;line-height:1.7;">Never touch a keyboard before completing a full physical survey. Correct diagnostic sequence follows the OSI model from Layer 1 upward &mdash; physical first, software last.</div>

<div style="border-left:3px solid #00e5ff;background:rgba(0,229,255,0.05);padding:12px 16px;margin-bottom:14px;font-family:'Courier New',monospace;font-size:12px;color:#00e5ff;line-height:1.8;border-radius:0 4px 4px 0;">&#9888; RULE #1 &mdash; Eyes before hands. Hands before keyboard. Survey the full environment before running a single command.</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">01</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Environment Survey</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Walk the entire room. Identify ALL devices: modems, routers, switches, wall sockets. Ask &ldquo;What changed recently?&rdquo; before touching anything.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">02</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Identify Internet Source</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Is it NBN (FTTC/FTTN/HFC/FTTP), ADSL/VDSL phone line, or cable? This determines required hardware before diagnosing anything else.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">03</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Physical Cable Verification</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Trace every cable. WAN port = internet IN. LAN ports = devices OUT. Wrong port is the #1 field mistake and costs hours if missed.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">04</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Read Device Lights</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Check all indicator lights on modem and router before any commands. Lights give instant hardware status &mdash; faster than any terminal output.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">05</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Local Network &mdash; Inbound Signal</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Run ipconfig. Ping the default gateway. 169.254.x.x = DHCP failure. 192.168.x.x = local network working.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;border-bottom:none;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">06</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Internet Reachability &mdash; Outbound Signal</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">Ping 8.8.8.8 to test internet. Ping google.com to test DNS. If 8.8.8.8 fails but gateway pings &mdash; WAN is broken, not local network.</div></div>
</div>

<div style="display:grid;grid-template-columns:50px 1fr;background:#141820;border:1px solid #1e2a3a;">
<div style="display:flex;align-items:center;justify-content:center;font-family:'Courier New',monospace;font-size:18px;font-weight:bold;color:#00e5ff;background:rgba(0,229,255,0.05);border-right:1px solid #1e2a3a;padding:14px 0;">07</div>
<div style="padding:12px 16px;"><div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">ISP / Line Escalation</div><div style="font-size:13px;color:#c8d8e8;line-height:1.6;">If all local steps pass but internet fails &mdash; fault is upstream. Call ISP with: &ldquo;DSL cannot sync&rdquo; or &ldquo;WAN IP showing 0.0.0.0&rdquo;.</div></div>
</div>

<div style="border-left:3px solid #ff6b35;background:rgba(255,107,53,0.07);padding:12px 16px;margin-top:14px;font-family:'Courier New',monospace;font-size:12px;color:#ff6b35;line-height:1.8;border-radius:0 4px 4px 0;">&#128161; 3 QUESTIONS AT EVERY JOB START:<br>1. &ldquo;What is the internet source?&rdquo; (phone line / NBN / cable)<br>2. &ldquo;What changed recently?&rdquo;<br>3. &ldquo;Are there any other networking devices in the building?&rdquo;</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #ff6b35;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 02 &mdash; Physical Layer</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Connection Architecture</div>

<div style="background:#141820;border:1px solid #1e2a3a;padding:28px 36px;margin-bottom:14px;border-radius:4px;">
<div style="font-family:'Courier New',monospace;font-size:12px;color:#c8d8e8;line-height:2;white-space:pre-wrap;"><span style="color:#5a7a9a;"># ADSL/VDSL Phone Line Setup</span>
TELEPHONE WALL SOCKET
      | [phone cable RJ11]
<span style="color:#ffaa00;">DSL MODEM</span>  &lt;-- REQUIRED — router cannot decode phone line
      | [ethernet RJ45]
<span style="color:#00e5ff;">TP-LINK WAN PORT</span>  &lt;-- must be WAN, not LAN ports
      | [ethernet RJ45]
PC / DEVICES via LAN ports 1-4

<span style="color:#5a7a9a;"># NBN Setup</span>
NBN CONNECTION BOX
      | [ethernet]
<span style="color:#00e5ff;">TP-LINK WAN PORT</span>
      | [ethernet]
PC / DEVICES

<span style="color:#ff3b5c;"># Standard TP-Link AC routers have NO built-in DSL modem</span>
<span style="color:#ff3b5c;"># A phone line CANNOT plug directly into a TP-Link WAN port</span>
<span style="color:#00ff88;"># Fix: modem-router combo (Archer VR600) OR separate DSL modem</span></div>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
<div style="background:#141820;border:1px solid #1e2a3a;padding:16px;">
<div style="font-size:12px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:2px;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #1e2a3a;">&#10003; Correct Port Usage</div>
<div style="font-size:13px;color:#c8d8e8;line-height:2;"><span style="color:#00e5ff;">&rarr;</span> Internet source cable &rarr; WAN port (leftmost)<br><span style="color:#00e5ff;">&rarr;</span> PC and devices &rarr; LAN ports 1, 2, 3, or 4<br><span style="color:#00e5ff;">&rarr;</span> DSL/phone line &rarr; modem DSL port only<br><span style="color:#00e5ff;">&rarr;</span> Secure cable makes an audible click<br><span style="color:#00e5ff;">&rarr;</span> Link light ON confirms physical connection</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;padding:16px;">
<div style="font-size:12px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:2px;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #1e2a3a;">&#10007; Common Physical Mistakes</div>
<div style="font-size:13px;color:#c8d8e8;line-height:2;"><span style="color:#00e5ff;">&rarr;</span> PC cable in WAN instead of LAN<br><span style="color:#00e5ff;">&rarr;</span> Phone line directly into router WAN<br><span style="color:#00e5ff;">&rarr;</span> Nothing feeding the WAN port at all<br><span style="color:#00e5ff;">&rarr;</span> Loose or internally damaged cable<br><span style="color:#00e5ff;">&rarr;</span> Power cycle done in wrong order</div>
</div>
</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #00ff88;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 03 &mdash; Indicator Lights</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Router &amp; Modem Light Status</div>

<table style="width:100%;border-collapse:collapse;font-size:13px;">
<thead>
<tr>
<th style="background:#141820;border:1px solid #1e2a3a;padding:9px 12px;text-align:left;font-size:11px;font-weight:700;color:#5a7a9a;text-transform:uppercase;letter-spacing:2px;">Light</th>
<th style="background:#141820;border:1px solid #1e2a3a;padding:9px 12px;text-align:left;font-size:11px;font-weight:700;color:#5a7a9a;text-transform:uppercase;letter-spacing:2px;">State</th>
<th style="background:#141820;border:1px solid #1e2a3a;padding:9px 12px;text-align:left;font-size:11px;font-weight:700;color:#5a7a9a;text-transform:uppercase;letter-spacing:2px;">Meaning</th>
<th style="background:#141820;border:1px solid #1e2a3a;padding:9px 12px;text-align:left;font-size:11px;font-weight:700;color:#5a7a9a;text-transform:uppercase;letter-spacing:2px;">Action</th>
</tr>
</thead>
<tbody>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>Power</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00ff88;margin-right:6px;vertical-align:middle;"></span><span style="color:#00ff88;font-weight:600;">Solid Green</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Router operating normally</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#5a7a9a;">None</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>Power</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#2a3a4a;border:1px solid #3a4a5a;margin-right:6px;vertical-align:middle;"></span>Off</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">No power to router</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Check adapter and socket</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>Internet</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00ff88;margin-right:6px;vertical-align:middle;"></span><span style="color:#00ff88;font-weight:600;">Solid Green</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Internet connected &#10003;</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#5a7a9a;">None</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>Internet</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#ffaa00;margin-right:6px;vertical-align:middle;"></span><span style="color:#ffaa00;font-weight:600;">Solid Orange</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">WAN connected, no internet</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Check ISP credentials / PPPoE</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>Internet</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#2a3a4a;border:1px solid #3a4a5a;margin-right:6px;vertical-align:middle;"></span>Off</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">No WAN connection at all</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Check WAN cable and modem</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>WAN / LAN</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00ff88;margin-right:6px;vertical-align:middle;"></span><span style="color:#00ff88;font-weight:600;">Solid / Blinking</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Physical link and traffic</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#5a7a9a;">None</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>WAN / LAN</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#2a3a4a;border:1px solid #3a4a5a;margin-right:6px;vertical-align:middle;"></span>Off</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">No physical connection</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Try different cable or port</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>DSL (modem)</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00ff88;margin-right:6px;vertical-align:middle;"></span><span style="color:#00ff88;font-weight:600;">Solid Green</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Line synced with ISP &#10003;</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#5a7a9a;">None</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>DSL (modem)</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#ffe566;margin-right:6px;vertical-align:middle;"></span><span style="color:#ffaa00;font-weight:600;">Blinking</span></td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Trying to sync, not connected</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Wait 2 min then call ISP</td></tr>
<tr><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;"><strong>DSL (modem)</strong></td><td style="border:1px solid #1e2a3a;padding:9px 12px;"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#2a3a4a;border:1px solid #3a4a5a;margin-right:6px;vertical-align:middle;"></span>Off</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">No signal on phone line</td><td style="border:1px solid #1e2a3a;padding:9px 12px;color:#c8d8e8;">Check phone cable, call ISP</td></tr>
</tbody>
</table>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #00e5ff;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 04 &mdash; Command Reference</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Windows Diagnostic Commands</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:14px;">
<div style="background:#141820;border:1px solid #1e2a3a;padding:14px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;">IP &amp; Adapter Info</div>
<div style="font-size:12px;line-height:2.1;"><span style="color:#00e5ff;font-family:'Courier New',monospace;">ipconfig /all</span><span style="color:#5a7a9a;float:right;">Full adapter + IP</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">ipconfig /release</span><span style="color:#5a7a9a;float:right;">Drop DHCP lease</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">ipconfig /renew</span><span style="color:#5a7a9a;float:right;">Request new IP</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">ipconfig /flushdns</span><span style="color:#5a7a9a;float:right;">Clear DNS cache</span></div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;padding:14px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;">Connectivity Tests</div>
<div style="font-size:12px;line-height:2.1;"><span style="color:#00e5ff;font-family:'Courier New',monospace;">ping 192.168.1.1</span><span style="color:#5a7a9a;float:right;">Test router</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">ping 8.8.8.8</span><span style="color:#5a7a9a;float:right;">Test internet</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">ping google.com</span><span style="color:#5a7a9a;float:right;">Test DNS</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">tracert 8.8.8.8</span><span style="color:#5a7a9a;float:right;">Map route</span></div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;padding:14px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;">Stack Reset</div>
<div style="font-size:12px;line-height:2.1;"><span style="color:#00e5ff;font-family:'Courier New',monospace;">netsh winsock reset</span><span style="color:#5a7a9a;float:right;">Socket layer</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">netsh int ip reset</span><span style="color:#5a7a9a;float:right;">TCP/IP stack</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">netsh advfirewall set allprofiles state off</span></div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;padding:14px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;">Interface Control</div>
<div style="font-size:12px;line-height:2.1;"><span style="color:#00e5ff;font-family:'Courier New',monospace;">netsh interface show interface</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">set address "Ethernet" static ...</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">set address "Ethernet" dhcp</span><br><span style="color:#00e5ff;font-family:'Courier New',monospace;">nslookup google.com</span></div>
</div>
</div>

<div style="background:#080b10;border:1px solid #1e2a3a;border-left:3px solid #00e5ff;border-radius:0 4px 4px 0;padding:14px 18px;font-family:'Courier New',monospace;font-size:12px;line-height:1.9;color:#a8d8a8;white-space:pre-wrap;"><span style="color:#5a7a9a;"># Reading your IPv4 address:</span>
<span style="color:#ff3b5c;">169.254.x.x</span>  -->  APIPA -- no DHCP response. Router unreachable or DHCP disabled.
<span style="color:#00ff88;">192.168.x.x</span>  -->  Connected to router successfully
<span style="color:#00ff88;">10.x.x.x    </span>  -->  Connected to router (alternate subnet)
<span style="color:#ff3b5c;">0.0.0.0     </span>  -->  No network connection at all

Default Gateway <span style="color:#ffaa00;">blank       </span>  -->  Router not found
Default Gateway <span style="color:#00ff88;">192.168.x.1 </span>  -->  Use this IP to access admin panel in browser</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #ff3b5c;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 05 &mdash; Lessons Learned &mdash; Adelaide, March 2026</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Real Field Experience</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #00ff88;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#10003;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">Physical verification works</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">Checking physical connections and port placement correctly identified the WAN port error. No software command could have found this.</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #00ff88;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#10003;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">Layer-by-layer approach</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">Pinging gateway first (inbound), then 8.8.8.8 (outbound) correctly isolated whether the problem was local or ISP-side.</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #ff3b5c;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#10007;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">Commands before physical</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">Running ipconfig and netsh before verifying cables cost 30+ minutes. The WAN port error was visible immediately but not looked for first.</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #ff3b5c;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#10007;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">No environment survey</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">The Origin modem was in the house the entire session. One question would have saved nearly an hour.</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #ffaa00;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#9888;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">Router is not a modem-router</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">A standard TP-Link AC router cannot decode DSL signals. Phone lines need a DSL modem upstream. Now permanently understood.</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;border-top:2px solid #ffaa00;padding:16px;">
<div style="font-size:18px;margin-bottom:6px;">&#9888;</div>
<div style="font-size:13px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:5px;">Know when to escalate</div>
<div style="font-size:12px;color:#c8d8e8;line-height:1.6;">When DSL blinks and WAN IP = 0.0.0.0 after all local checks pass &mdash; document and hand off to ISP. Onsite work is complete.</div>
</div>
</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-left:3px solid #00e5ff;border-radius:0 6px 6px 0;padding:26px 30px;margin-bottom:8px;">
<div style="font-family:'Courier New',monospace;font-size:10px;color:#ff6b35;letter-spacing:4px;text-transform:uppercase;margin-bottom:4px;">// 06 &mdash; Honest Self-Assessment</div>
<div style="font-size:26px;font-weight:800;color:#eef4ff;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">Skill Ratings &mdash; March 2026</div>

<div style="margin-bottom:10px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">Persistence</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:90%;height:100%;background:linear-gradient(90deg,#00ff88,#00e5ff);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">9/10</span></div>

<div style="margin-bottom:10px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">ISP Knowledge</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:80%;height:100%;background:linear-gradient(90deg,#00ff88,#00e5ff);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">8/10</span></div>

<div style="margin-bottom:10px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">Command Knowledge</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:70%;height:100%;background:linear-gradient(90deg,#00e5ff,#ffaa00);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">7/10</span></div>

<div style="margin-bottom:10px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">Physical Skills</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:70%;height:100%;background:linear-gradient(90deg,#00e5ff,#ffaa00);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">7/10</span></div>

<div style="margin-bottom:10px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">Diagnostic Order</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:50%;height:100%;background:linear-gradient(90deg,#ffaa00,#ff3b5c);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">5/10</span></div>

<div style="margin-bottom:14px;display:grid;grid-template-columns:155px 1fr 42px;align-items:center;gap:12px;"><span style="font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;text-transform:uppercase;">Env. Survey</span><div style="height:5px;background:#141820;border:1px solid #1e2a3a;border-radius:3px;overflow:hidden;"><div style="width:40%;height:100%;background:linear-gradient(90deg,#ffaa00,#ff3b5c);border-radius:3px;"></div></div><span style="font-family:'Courier New',monospace;font-size:12px;color:#eef4ff;text-align:right;">4/10</span></div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
<div style="background:#141820;border:1px solid #1e2a3a;padding:16px;">
<div style="font-size:12px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:2px;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #1e2a3a;">Strengths</div>
<div style="font-size:13px;color:#c8d8e8;line-height:2;"><span style="color:#00e5ff;">&rarr;</span> Never gave up under field pressure<br><span style="color:#00e5ff;">&rarr;</span> Correct layered OSI diagnostic logic<br><span style="color:#00e5ff;">&rarr;</span> Good instinct for ISP escalation<br><span style="color:#00e5ff;">&rarr;</span> Captured evidence with photos<br><span style="color:#00e5ff;">&rarr;</span> Understood inbound vs outbound signal</div>
</div>
<div style="background:#141820;border:1px solid #1e2a3a;padding:16px;">
<div style="font-size:12px;font-weight:700;color:#eef4ff;text-transform:uppercase;letter-spacing:2px;margin-bottom:10px;padding-bottom:8px;border-bottom:1px solid #1e2a3a;">Focus Areas</div>
<div style="font-size:13px;color:#c8d8e8;line-height:2;"><span style="color:#00e5ff;">&rarr;</span> Survey full environment before starting<br><span style="color:#00e5ff;">&rarr;</span> Physical confirmed before any commands<br><span style="color:#00e5ff;">&rarr;</span> Ask 3 key questions at every job start<br><span style="color:#00e5ff;">&rarr;</span> Know modem vs router difference<br><span style="color:#00e5ff;">&rarr;</span> Find gateway IP before pinging</div>
</div>
</div>
</div>

<div style="background:#0e1118;border:1px solid #1e2a3a;border-radius:4px;padding:16px 26px;display:flex;justify-content:space-between;align-items:center;font-family:'Courier New',monospace;font-size:11px;color:#5a7a9a;">
<div>NETWORK DIAGNOSING HANDBOOK &middot; v1.0 &middot; March 2026 &mdash; <a href="https://github.com/YOUR-USERNAME/network-handbook" style="color:#00e5ff;text-decoration:none;">github.com/YOUR-USERNAME/network-handbook</a></div>
<div>Adelaide, AU</div>
</div>
