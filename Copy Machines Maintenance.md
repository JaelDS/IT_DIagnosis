---
title: Konica Minolta bizhub C25 — Service & Maintenance Guide
tags:
  - maintenance
  - copier
  - konica-minolta
  - bizhub-c25
  - incident-report
date: 2026-03-24
status: partial-service
model: bizhub C25 (A2YF)
year: 2011
---

<style>
.badge {
  display: inline-block;
  padding: 2px 10px;
  border-radius: 12px;
  font-size: 0.72em;
  font-weight: 600;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  vertical-align: middle;
}
.badge-fixed    { background: #d1fae5; color: #065f46; border: 1px solid #6ee7b7; }
.badge-open     { background: #fee2e2; color: #991b1b; border: 1px solid #fca5a5; }
.badge-partial  { background: #dbeafe; color: #1e40af; border: 1px solid #93c5fd; }
.badge-pending  { background: #fef3c7; color: #92400e; border: 1px solid #fcd34d; }
.badge-critical { background: #fce7f3; color: #9d174d; border: 1px solid #f9a8d4; }
</style>

# 🖨️ Konica Minolta bizhub C25 — Service & Maintenance Guide

> **How to use this document:** Each section has a diagram followed by a plain-language explanation of what you're looking at and what to do. You don't need to be a technician to follow this — think of it as a visual map of your machine.

---

## 📋 Machine Information

| Field | Detail |
|-------|--------|
| **Make** | Konica Minolta |
| **Model** | bizhub C25 |
| **Part Number** | A2YF |
| **Year** | 2011 |
| **Type** | Color MFP — Print / Copy / Scan / Fax |
| **Print Speed** | 24 ppm A4 (colour & mono) |
| **Resolution** | 600 × 600 dpi |
| **Firmware** | Field Service Ver 1.1 — May 2011 |
| **Service Date** | March 2026 |
| **Overall Status** | <span class="badge badge-pending">Partial Service</span> |

---

## 🗺️ Diagram 1 — What the Machine Looks Like From the Outside

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Copy_Machine_Scheme.png)

### 🔍 Diagram Review & Accuracy Notes

> [!warning] Accuracy Note — Size & Proportions
> The diagram shows a machine that looks larger than the actual bizhub C25. The real C25 is a **compact desktop unit** — smaller and lighter than what is depicted here. The proportions are exaggerated. However, **all the labelled parts exist in the correct relative positions**, so use this as a general map, not a to-scale representation.

> [!bug] Diagram Error — Duplicate Labels
> Gemini repeated two labels by mistake:
> - "USB / interface ports" appears twice — there is only **one interface panel** on the left side
> - "Front door / front cover" appears twice — there is only **one front door**
> Ignore the duplicates.

### 📖 Plain Language Explanation — What Each Part Does

Think of this machine as having **three zones stacked on top of each other:**

**Zone 1 — Top (Scanning)**
The top section is all about reading documents you want to copy or scan.
- **ADF lid** — This is the lid you lift to place documents flat, OR you can load a stack of pages into the top slot and it will feed them through automatically (that's the "automatic document feeder" — ADF). It's like a mouth that eats your documents one by one.
- **Flatbed glass** — The flat glass surface under the ADF lid. When you lift the lid and place a document face-down on this glass, the machine reads it by shining a light underneath and moving a sensor across it.

**Zone 2 — Middle (Control + Output)**
- **Control panel** — The buttons and small screen where you tell the machine what to do (copy, scan, how many copies, etc.)
- **Paper output tray** — Where your finished copies or printed pages land after they come out.

**Zone 3 — Bottom (Paper supply)**
- **Paper input tray** — The drawer at the bottom where you load your blank paper. Pull it out, stack your paper in, push it back in.
- **Front door** — The large panel on the front that opens to give you access to toner cartridges, the imaging units, and internal components when something needs to be replaced or cleaned.
- **USB / interface ports** — The panel on the side with ports to connect a USB stick or a computer cable.

---

## ⚙️ Diagram 2 — What's Inside the Machine (The Engine)

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Copy_Machine_Internal_Scheme.png)

### 🔍 Diagram Review & Accuracy Notes

> [!tip] Accuracy — Good Overall
> This is the most technically accurate diagram. The positions of the toner cartridges (C, M, Y, K), imaging units, fuser, transfer belt and waste toner bottle are correctly represented for the C25 layout. Use this with confidence.

> [!bug] Minor Label Error
> The label "To" in the paper path area is incomplete — it should read "Paper path to fuser unit". Ignore the incomplete label and follow the orange dashed arrow instead.

### 📖 Plain Language Explanation — The Printing Process

This diagram shows the inside of the machine as if you cut it in half and looked at the cross-section. Here's what happens every time you print or copy, in order:

**Step 1 — Paper enters**
A blank sheet is pulled from the **paper input tray** at the bottom. Follow the orange dashed arrows — that's the paper's journey.

**Step 2 — Toner is applied**
The paper passes through the **imaging units** (the 4 round drums at the bottom — C = Cyan/blue, M = Magenta/pink, Y = Yellow, K = Black). Each drum rolls toner onto the paper in its colour. Together they create any colour combination.

Above each drum is a **toner cartridge** — these are the replaceable ink supplies. When a cartridge runs out, you swap it for a new one (you can do this yourself without a technician).

**Step 3 — Toner is transferred to paper via the belt**
The **transfer belt unit** (the wide flat belt in the middle) carries the toner image and presses it onto the paper as it passes through.

**Step 4 — Toner is fused (melted) onto the paper**
The paper then enters the **fuser unit** at the top. This is essentially a very hot pair of rollers that melt the toner permanently into the paper fibres. This is why paper feels warm when it comes out.

> [!danger] Fuser Unit Warning
> The fuser runs at extremely high temperatures — do not touch it when the machine has been on. Always wait at least 30 minutes after powering off before touching anything near the fuser. The diagram correctly shows the ⚠️ warning symbol here.

**Step 5 — Leftover toner is collected**
Any toner that didn't stick to the paper gets collected in the **waste toner bottle** (the tall container at the bottom right). When this fills up the machine will warn you and stop printing. It needs to be replaced.

**Step 6 — Paper exits**
The paper travels up and out to the output tray.

---

## 📄 Diagram 3 — How Paper Travels Through the Machine

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Paper_Feed_Transport_Path.png)

### 🔍 Diagram Review & Accuracy Notes

> [!tip] Accuracy — Conceptually Correct
> The paper path direction and roller positions are accurate for the C25. The orange arrows correctly show the paper travelling upward from Tray 1/2 through the transfer zone and fuser to the output tray.

> [!warning] Duplex Path Note
> The cyan dashed circle shows the duplex (double-sided) path. The C25 does support duplex printing but the exact internal routing of the duplex path may look slightly different on your specific unit. If you're troubleshooting a double-sided jam, look for paper caught in the lower-rear area of the machine — that's where the duplex reversal happens.

> [!bug] Minor Label Issue
> "Tray 1 pickup/feed roller" appears labelled twice on opposite sides — one label points to the top of Tray 1 and one to the side. This is just a Gemini duplication error. There is one set of feed rollers per tray.

### 📖 Plain Language Explanation — The Roller System

Every time a page goes through this machine, it passes through **a series of rubber rollers** — each one's job is to grip the paper and pass it to the next stage. Think of it like a conveyor belt made of rubber wheels.

**Tray 1 & Tray 2 — Pickup Rollers**
These are the first rollers the paper touches. They're at the front of the paper tray. Their job is to pick up one sheet at a time. If your paper is jamming at the start, or if you're getting double-feeds (two pages at once), these rollers are usually the culprit — they need cleaning or eventual replacement.

**Paper Registration Roller**
This is a clever roller that briefly pauses the paper and then releases it at the exact right moment so it arrives at the toner drums in perfect timing. If this roller is dirty or worn, your image can appear shifted or skewed.

**Transfer Belt & Transfer Zone**
The paper passes through here to pick up the toner image (as explained in Diagram 2).

**Fuser Unit**
Hot rollers that melt the toner onto the page.

**Paper Exit Rollers**
The final set of rollers that push the finished page out onto the output tray.

**Roller Lifespan — What to Know**
All rollers in this machine are rated for approximately **300,000 pages** before replacement. For an average office printing 50 pages a day, that's roughly **16 years of use** — so roller replacement is rare. However, cleaning them regularly keeps them grippy and prevents jams and misfeeds.

---

## 🔬 Diagram 4 — The Scanner & ADF in Detail (Your Main Issue)

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Scanner_ADF.png)

### 🔍 Diagram Review & Accuracy Notes

> [!tip] Accuracy — Best Diagram of the Set
> This is the most useful and accurate diagram for your current maintenance needs. The exploded view correctly shows all the key components you need to interact with. The carriage rod highlighted in orange/red is accurate and directly relevant to INC-001 (the noise).

> [!bug] Minor Label Error — "Nail"
> The label "Scanner carriage rod / nail" is incorrect. The word "nail" is a mistranslation/hallucination by Gemini. The correct term is simply **scanner carriage rod** or **carriage rail**. There is no nail — it's a smooth metal rod.

> [!warning] Real C25 May Look Slightly Different
> The ADF in this diagram appears slightly larger than the actual C25 ADF. On your machine, the ADF assembly is quite compact. The **rollers inside may be harder to see** — you may need to open the small inner flap of the ADF to expose them. Don't force anything — if it doesn't open easily, check if there's a small tab or lever to release it.

### 📖 Plain Language Explanation — The Scanner System

The scanner is essentially a **camera on a rail**. Here's how it works and what you need to maintain:

**The ADF (top section — grey lid)**
When you load pages into the top slot, the ADF's job is to feed them one by one across the slit scan glass (see below). Two rollers are responsible for this:
- **ADF pickup roller** — Grabs the first page from the stack. Small rubber roller. If it's shiny and glazed, it will slip and misfeed.
- **ADF separation roller** — Sits below/beside the pickup roller. Makes sure only ONE page goes through at a time by pushing back any extras. If this wears out you get double-feeds.
- **What you did:** ✅ Both of these were cleaned with isopropyl alcohol. Good work — this was the right first step.

**The Slit Scan Glass (the narrow glass strip)**
When the ADF feeds pages, they pass over this thin strip of glass rather than the big main glass. The scanner underneath reads through it. If this gets a smudge or debris on it, you'll see a **long dark line** running down all your copies. Clean it with a dry lint-free cloth — never use wet cloths on this.

**The Platen Glass (the big flat glass)**
This is the glass you place documents on when you lift the lid. The scanner reads from below. Fingerprints, smudges and dust on this glass cause blurry or uneven copies. Clean with a glass-appropriate lint-free cloth.

**The Scanner Carriage & Carriage Rod — ⚠️ YOUR PENDING ACTION**
This is the root cause of your squelching noise. Under the platen glass, there is a **moving lamp unit** (the carriage) that slides back and forth on a **metal rod** every time you scan. On startup, it quickly moves to its home position — that movement is what makes the noise when the rod is dry.

The rod runs horizontally across the full width of the machine. Your next step is to:
1. Open the front door and/or unscrew the scanner bed to access underneath it
2. Locate this rod — it will have the carriage (a small box/lamp unit) sitting on it
3. Wipe the rod clean with a dry cloth
4. Apply a thin coat of **white lithium grease** along its full length
5. Manually slide the carriage back and forth a few times to spread the grease

---

## 🧭 Diagram 5 — How to Navigate the Service Menu

![External Component Overview|](https://raw.githubusercontent.com/JaelDS/IT_DIagnosis/main/img/Maintenance_Diagram.png)

### 🔍 Diagram Review & Accuracy Notes

> [!danger] ⚠️ CORRECTION — Service Mode Access Code is WRONG in This Diagram
> The diagram states the code is **"00000000 (8 zeros)"** — this is **incorrect for the bizhub C25 (2011 model)**.
>
> The actual method to enter service mode on the C25 is a **button sequence**, not a typed number:
>
> **Press these buttons one at a time, in order:**
> `Stop` → `0` → `0` → `Stop` → `0` → `1`
>
> Notes on this:
> - `Stop` is the red Stop/Reset button on the control panel
> - The numbers `0`, `0`, `0`, `1` are pressed on the numeric keypad
> - You may need to first navigate to a **counter or machine info screen** before this sequence works
> - If the sequence doesn't work, try: `Utility` → find the counter screen → then enter the sequence
> - You confirmed you successfully used a **6-digit** type password — so if your machine has an admin password set, it may prompt for that instead. The factory default admin password on the C25 is typically **`000000` (6 zeros)** — which matches what you experienced.
>
> **Alternatives if the above doesn't work:**
> - Try `Utility` → `Administrator Settings` → enter `000000` (6 zeros) as admin password → look for Maintenance or Service menu
> - If someone has changed the admin password, you will need the new password — there is no workaround without the service manual procedure

> [!tip] Menu Paths Are Accurate
> Once you're inside the service/admin menu, the navigation paths shown in the diagram (PRN TEST PATTERN, SCAN TEST, ADJUST/SETTING, etc.) are accurate. The flowchart structure and available options are correct.

### 📖 Plain Language Explanation — What Service Mode Is

Think of service mode as the machine's **hidden settings menu** — the one that Konica Minolta intended for their technicians, not regular users. It gives you access to things like:

- **Running a test print** without needing to scan anything — the machine prints a pattern from its own memory so you can see if the printer engine is working correctly
- **Adjusting the scan registration** — this is how you fixed the skewed image issue (INC-002). You essentially told the machine "your idea of where the left edge of the page is needs to shift slightly"
- **Checking counters** — how many pages the machine has printed in its lifetime. Useful for knowing how much wear the parts have
- **Error code history** — a log of every fault the machine has encountered, with codes you can look up

**Why it matters for your maintenance:**
After you lubricate the scanner carriage rail (the pending action), you should come back here and **run a SCAN TEST** and then do a **PRN TEST PATTERN** print to confirm everything is working correctly.

---

## 🗓️ Maintenance Checklist — This Service Visit

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | ADF Pickup Roller — Clean | <span class="badge badge-fixed">Done</span> | Wiped with IPA, full rotation coverage |
| 2 | ADF Separation Roller — Clean | <span class="badge badge-fixed">Done</span> | Wiped with IPA |
| 3 | Scanner Registration Calibration | <span class="badge badge-fixed">Done</span> | Skew corrected, test copy passed |
| 4 | Scanner Carriage Rail — Lubricate | <span class="badge badge-open">Not Done</span> | Blocked: screwdriver + grease needed |
| 5 | Flatbed Glass — Deep Clean | <span class="badge badge-partial">Partial</span> | Surface wiped; full access needs scanner disassembly |
| 6 | Transfer Belt — Inspect & Clean | <span class="badge badge-open">Not Done</span> | Visible in photo, not cleaned |
| 7 | Tray 1 & 2 Feed Rollers — Clean | <span class="badge badge-pending">Pending</span> | Due every 300,000 page counts |
| 8 | Laser Lens / Print Head Glass — Clean | <span class="badge badge-pending">Pending</span> | Requires Part No. A0VDF2C553DA tool |
| 9 | Waste Toner Bottle — Check | <span class="badge badge-pending">Pending</span> | Not checked this visit |
| 10 | Internal Engine Test Print | <span class="badge badge-pending">Recommended</span> | Service Mode → FUNCTION → PRN TEST PATTERN |

---

## 🐛 Incident Log

### INC-001 — Squelching Noise on Scan Startup <span class="badge badge-open">Pending</span>

**What happened:** Every time a scan or copy starts, the machine makes a wet squelching noise before any paper moves.

**Why it happens:** Under the flatbed glass, a lamp unit slides along a metal rod to find its starting position. That rod has dried out — there's no lubrication left so the lamp unit drags instead of gliding.

**What was done:** ADF rollers were cleaned (not the cause, but good maintenance). Carriage rod identified as root cause.

**What still needs doing:** Lubricate the carriage rod with white lithium grease. Blocked by lack of screwdriver and grease on the day.

---

### INC-002 — Slightly Skewed Copies from Flatbed <span class="badge badge-fixed">Resolved</span>

**What happened:** Copies made from the flatbed glass were coming out at a very slight angle — not perfectly straight on the paper.

**Why it happened:** The machine's internal setting for where the "start of the page" is was slightly off. This is called the scan registration offset.

**What was done:** Adjusted the registration offset via the admin/service menu. Test copy came out perfectly straight. ✅

**Note for next visit:** After lubricating the carriage rod, re-run this calibration — the mechanical change may shift the baseline slightly.

---

## 🛠️ Next Service Visit — Action Plan

> [!danger] Priority 1 — Carriage Rod Lubrication (Fixes the noise)
> **Tools you need to bring:**
> - Phillips head screwdriver (medium, PH2)
> - White lithium grease (available at any hardware store — Bunnings in AU stocks it)
> - Lint-free cloths
>
> **What to do:**
> 1. Power off the machine and unplug it
> 2. Open the front door (as in your earlier photo)
> 3. Look for screws holding the scanner bed — unscrew to lift the flatbed glass assembly
> 4. The horizontal metal rod running across the width of the machine is what you want
> 5. Wipe the rod clean with a dry cloth
> 6. Apply a thin line of white lithium grease along its full length
> 7. Slide the carriage back and forth by hand 3–4 times to spread it
> 8. Reassemble, power on, and test

> [!info] Priority 2 — Re-run Scanner Calibration
> After lubricating the rod, run the calibration again to make sure alignment is still correct.
> **Path:** Service Mode → ADJUST/SETTING → Scanner → Registration

> [!note] Priority 3 — Laser Lens Clean
> The laser lens cleaning tool (Part No. **A0VDF2C553DA**) should be sourced and used. Access through the front cover using the slot/wand on the inside panel.

> [!note] Priority 4 — Tray Feed Rollers
> Pull each paper tray out fully, wipe the rubber rollers with IPA-dampened cloth, rotate them fully. Let dry before reinserting.

> [!tip] Priority 5 — Test Print After All Work
> Service Mode → FUNCTION → PRN TEST PATTERN → Load A4 in Tray 1. This confirms the engine is printing cleanly without needing to scan anything.

---

## 🛒 Shopping List — What to Buy Before Next Visit

| Item | Where to Get It (AU) | Est. Cost |
|------|----------------------|-----------|
| Phillips screwdriver PH2 | Bunnings / Kmart / any hardware | $5–15 |
| White lithium grease (tube or spray) | Bunnings — look for WD-40 White Lithium or Inox | $8–15 |
| Isopropyl alcohol (IPA) 70–99% | Bunnings / Chemist Warehouse / Jaycar | $5–10 |
| Lint-free microfibre cloths | Bunnings / supermarket / Kmart | $5–10 |
| Laser lens cleaning tool (A0VDF2C553DA) | Search on eBay AU or Amazon AU | $10–25 |

---

## ⏱️ Periodic Replacement Schedule

| Component | Replace Every | Notes |
|-----------|---------------|-------|
| Toner cartridges (C, M, Y, K) | ~2,000 images | Machine will warn you when low — you can replace these yourself |
| Tray 1 & 2 feed rollers | 300,000 pages | Clean regularly; only replace if cracked or hard |
| Transfer roller | Service schedule | Technician level |
| Transfer belt unit | Service schedule | Technician level |
| Fuser unit | Service schedule | ⚠️ Do NOT touch when hot — technician level |
| Waste toner bottle | When full | Machine warns you — you can replace this yourself |

---

## 🔧 Service Mode Quick Reference

> [!info] Correct Access Method for bizhub C25 (2011)
> Press these buttons **one at a time** on the control panel:
>
> **`Stop` → `0` → `0` → `Stop` → `0` → `1`**
>
> If this doesn't work, try:
> - `Utility` → scroll to Admin or Maintenance → enter admin password `000000` (6 zeros)
> - Or try the sequence from a counter/machine info screen

| Menu Path | What It Does |
|-----------|-------------|
| `FUNCTION → PRN TEST PATTERN` | Prints a test page from the engine — no document needed |
| `FUNCTION → SCAN TEST` | Moves the scanner carriage so you can check for noise/smoothness |
| `ADJUST/SETTING → Scanner → Registration` | Adjusts the scan alignment — fixes skewed copies |
| `COUNTER → TOTAL PRINT` | Shows total lifetime page count |
| `COUNTER → SUPPLIES STATUS` | Shows toner levels |
| `REPORT → ERROR CODE LIST` | Shows history of faults with codes |
| `CLEAR DATA → SRAM CLEAR` | ⚠️ Factory reset — only use if instructed |

---

## 🎥 Reference Videos

| # | Title | Link |
|---|-------|------|
| 1 | bizhub C25 Maintenance #1 | [▶ Watch](https://youtube.com/shorts/5i5RnnkNzo0?si=yCrsHyt1hnImFItz) |
| 2 | bizhub C25 Service Walkthrough | [▶ Watch](https://youtu.be/zs9QZie_Lck?si=q4YBO9xyaPvoZjM3) |
| 3 | bizhub C25 Maintenance #2 | [▶ Watch](https://youtube.com/shorts/w_-ujmHhHhU?si=8eWfA2VqSWLAogUp) |
| 4 | bizhub C25 Maintenance #3 | [▶ Watch](https://youtube.com/shorts/63bDdqvLKcg?si=Noe6I9XWbpRV6QrI) |

## 📚 Technical Documentation

| Resource | Link |
|----------|------|
| Official Service Manual | [ManualsLib](https://www.manualslib.com/manual/989541/Konica-Minolta-Bizhub-C25.html) |
| Service Mode List (Page 166) | [ManualsLib p.166](https://www.manualslib.com/manual/989541/Konica-Minolta-Bizhub-C25.html?page=166) |
| Cleaning Parts List (Page 83) | [ManualsLib p.83](https://www.manualslib.com/manual/989541/Konica-Minolta-Bizhub-C25.html?page=83) |
| Test Print Procedure (Page 200) | [ManualsLib p.200](https://www.manualslib.com/manual/989541/Konica-Minolta-Bizhub-C25.html?page=200) |
| Error Codes (Page 205) | [ManualsLib p.205](https://www.manualslib.com/manual/989541/Konica-Minolta-Bizhub-C25.html?page=205) |
| Service Mode (printcopy.info) | [printcopy.info](https://printcopy.info/?mod=ts&brand=Konica-Minolta&model=bizhub+C25) |

---

> [!example] 📁 GitHub Image Hosting — How to Set Up
> To make your diagrams always display in this document:
> 1. Create a GitHub repository (e.g. `bizhub-c25-maintenance`)
> 2. Upload all 5 diagram images into an `images/` folder
> 3. Replace `YOUR-USERNAME/YOUR-REPO` in the image URLs above with your actual GitHub username and repository name
> 4. The final URL format will look like:
>    `https://raw.githubusercontent.com/jael-username/bizhub-c25-maintenance/main/images/Copy_Machine_Scheme.png`

---

*Konica Minolta bizhub C25 (A2YF) · Service & Maintenance Guide · March 2026*
