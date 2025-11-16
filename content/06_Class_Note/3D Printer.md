---
title: 3D Printing Pre-Training
tags:
  - 3d-printing
  - prusa
  - training
date: 2025-09-29
draft: true
---

# 3D Printing Pre-Training

## File Preparation
- Start with a **3D model in STL format**.
- Use **PrusaSlicer** (recommended for Prusa printers) to:
  - Import your STL file.
  - Adjust print settings: *layer height, infill, supports, brim, etc.*
  - Export the file as **G-code**.

---

## Hardware & File Transfer
| Printer Model      | File Transfer Method   |
|--------------------|-------------------------|
| **Prusa Mini**      | USB Drive               |
| **Prusa MK3S+**     | SD Card                 |

---

## Print Settings Overview

### Supports
- Required for **overhangs > 45°** or complex geometries.
- Add/adjust in **Supports Menu** in PrusaSlicer.

### Brim
- A thin, single-layer outline around the part.
- Helps with **bed adhesion** to prevent warping.
- Can be toggled in the **Build Plate Adhesion** settings.

### Infill
- Controls internal density of the part.
- Higher infill = stronger part but longer print time.
- **15% infill** works well for most non-functional prints.

| Setting         | Purpose                                    | Typical Value           |
|-----------------|--------------------------------------------|--------------------------|
| **Layer Height** | Controls print resolution                  | 0.2mm (standard quality) |
| **Infill**       | Strength vs. weight tradeoff               | 15% (non-functional)     |
| **Supports**     | Needed for overhangs > 45°                 | Auto or as required       |
| **Brim**         | Improves adhesion to the build plate        | Enabled for small parts   |

---

## Printing Workflow

1. **Prepare Model**  
   - Export STL → Import into PrusaSlicer → Adjust settings → Export G-code.  

2. **Transfer to Printer**  
   - **USB** for Prusa Mini or **SD Card** for MK3S+.  

3. **Set Print Parameters** on Printer Screen  
   - Confirm bed and nozzle temperature for chosen material (PLA, PETG, etc.).  

4. **Start Print & Monitor First Layers**  
   - Watch the first 2–3 layers to ensure adhesion.  
   - Cancel early if adhesion fails, then clean plate and restart.  

5. **Remove Finished Print**  
   - Let the bed cool before removal to prevent damage.  
   - Use a scraper gently if necessary.  

---

## Tips for Success
- **Bed Leveling:** Run automatic leveling before long prints.
- **Filament Check:** Always ensure correct material loaded and dry.
- **Part Orientation:** Print large flat areas facing the bed for stability.
- **Supports Removal:** Consider post-processing time when enabling supports.

---

## Additional Resources
- [PrusaSlicer Documentation](https://help.prusa3d.com/category/prusaslicer_204)
- [3D Printing Basics by Prusa](https://www.prusa3d.com/)



STL file
Slicer software
- Drag and drop the model
- click-on: turns green
- split to parts on the upper middle, delete unneeded one, split 2, then select 1 to delete
- think about orientation
- design so that either: no support needed, or: where to add support
- Rotate button
- place on face button on the left hand, click on it, it will snap onto bed
- drop down on the side: select support
- click slice now button for update
- bottom left hand side, switch between different views
- reduce the amount of support
- paint on support, paint on the model, triangle, only select the triangle in my model
- support enforcer's only
- setting, support material, grid/organic, better for organic model for removal
- an arch will be squashed a bit, if no support is added
- Corner can start to lift, add one layer thick base
- Infill is 50% as standard
	- wavy is higher quality

- Change the bed, transfer the setting
- filament setting
	- generic PLA
	- tpu: squishy
	- petg: stronger
- Export G-Code, save the file in Pulsa Mini, name the file so that you can fint it
- print in place, and the angle is less than 45

FDM: plastic
SLA: resin upside down
SLS: nylon powder