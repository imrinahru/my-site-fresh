---
title: XFab Laser Cutting Pre-Training
tags:
  - xfab
  - laser-cutting
  - training
date: 2025-09-29
draft: true
---

# XFab Laser Cutting Pre-Training

## File Requirements
- Laser Cutters require **RGB files**.
- **¼” margin** around your file.
- All **CUT** objects no closer than **1/8” apart**.
- If objects are for assembly:
  - Account for **tolerances** and **Laser Kerf**.
  - Use actual measured material thickness.
  - Example: *Desired length - 0.05mm* for acrylic.

> [!NOTE] Kerf & Tolerance  
> Ask XFab staff for the specific kerf value for each machine.

---

## Bed Sizes at 300DPI
| Machine | Bed Size (inches) | Dimensions (px)       |
|---------|------------------|------------------------|
| SP100   | 24 × 12           | 7200 × 3600 px         |
| SP300   | 28 × 17           | 8400 × 5100 px         |
| SP500   | 48 × 27           | 14400 × 8100 px        |

---

## Artwork Preparation Checklist
- [ ] Convert text to outlines: *Right-click > Create Outlines > Ungroup*  
- [ ] Ungroup everything and release clipping masks.  
- [ ] Set **Line Weights & Colours** correctly (see table below).  
- [ ] Stroke alignment: **Center Align** in *Properties > Stroke*.  
- [ ] Flatten transparency: *Object > Flatten Transparency*.  
- [ ] Raster objects: **True Black Fill (0,0,0)**, remove stroke.  

| Operation   | RGB Colour          | Line Weight          |
|-------------|---------------------|----------------------|
| CUT         | (255, 0, 0) Red      | 0.01 pt              |
| ETCH        | (0, 0, 255) Blue     | 0.01 pt              |
| ENGRAVE     | (0, 0, 0) Black      | *No stroke, fill only*|

🎥 [Difference between Cut, Etch, Engrave, Mark](https://www.youtube.com/watch?v=OZco6mOwDrs)

---

## Printing Setup

### Step 1: Illustrator → Print
1. **Printer**: Trotec Engraver  
2. **Range**: Select artboard → one at a time.  
3. **Media Size**: Matches bed size.  
4. **Preview Box**: Ensure file fits and is not scaled.  
5. Click **Setup** → Printer Preferences.

### Step 2: Printer Preferences  
- **Process mode**: Standard  
- **Resolution**: 600dpi  
- **Cut Line**: None  
- **Halftone**: Color (RED for Trotec)  
- **Invert**: Off  
- **Flip Vertically**: Off  
- **Flip Horizontally**: Off (Mirror in Illustrator if needed)  
- **Enhance Geometries**: On  
- **Inner geometries first**: On  

Click **Print → Print** to send job to Job Control.

---

## Job Control Settings
- Jobs appear by *Name, Date, Time* in queue.
- Double-click a job → Positions in **Top Left Corner**.
- Use **Eye (WYSIWYG)** to preview linework.

### Apply Material Settings
1. Go to **Settings Tab > Material Template Setup**.  
2. Select material type from **XFAB grouping**.  
3. Confirm material settings via Toolbar above Calculation Tab.  

> [!CAUTION]  
> Ask XFab staff before changing material settings.

---

## Machine Power-On Sequences

| Machine       | Steps                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **SP100**      | 1. Flip power switch (back-left). <br> 2. Wait for **2 BEEPS** or 15 sec before opening lid.                                                           |
| **SP300**      | 1. Flip power switch. <br> 2. Turn **Key Switch** clockwise, let it return. <br> 3. Wait for **1 long beep** or 15 sec before opening lid.               |
| **SP500**      | 1. Turn **Main Switch** clockwise. <br> 2. Turn **Key Switch** clockwise. <br> 3. Wait for **1 long beep** or **Red Lamp ON** before opening lid.        |

---

## Cutting Workflow

1. Place material on **laser vector grid** → Secure with tape if needed.  
2. For **acrylic with plastic film**:  
   - Remove film if **engraving**.  
   - Keep on if only **cut/etch**.  
3. Use **Manual Focusing Tool**:  
   - Position laser head, place tool on lens lip.  
   - Slowly raise bed using **Z-axis control** until tool drops slightly → Bed is focused.  
4. **Connect Computer → Laser** via USB.  
5. Confirm **Material Settings** are correct.  
6. Review **Safe Operating Procedure**.  
7. Press **Play** → Observe first minute carefully:  
   - Cutting through material  
   - No flames, no smoke buildup  
8. After cutting:  
   - Wait **2 min** for fumes to clear before opening lid.  
   - Remove materials carefully → Vacuum small pieces.  

---

## Additional Resources
- [Trotec: Material Parameters Setup](https://www.troteclaser.com/en/helpcenter/software/ruby/setting-up-and-managing-material-parameters)

