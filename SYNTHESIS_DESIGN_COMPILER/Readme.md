# ⚙️ ALU Synthesis using Synopsys Design Compiler (32nm Generic PDK)

## 📘 Overview
This project demonstrates **RTL to Gate-Level Synthesis** of a 4-bit **Arithmetic Logic Unit (ALU)** using **Synopsys Design Compiler (DC)** with a **Generic 32nm Standard Cell Library**.

The purpose of this flow is to understand how Design Compiler maps RTL logic to standard cells based on timing, area, and power constraints.

---

## 🧰 Tools & Environment
| Tool | Purpose |
|------|----------|
| Synopsys Design Compiler | RTL Synthesis |
| Generic 32nm PDK Library (`.db`) | Technology library |
|  Linux environment |

---

## 📁 Project Structure

```
├── alu.v # RTL code of ALU
├── alu_tb.v # Optional testbench for simulation
├── compile.tcl # TCL synthesis script
├── generic_32nm.db # Target 32nm PDK library
├── output/
│ ├── alu_syn.v # Synthesized gate-level netlist
│ ├── alu_area.rpt # Area utilization report
│ ├── alu_timing.rpt # Timing analysis report
│ ├── alu_power.rpt # Power estimation report
│ └── log.txt # Design Compiler console log
└── README.md
```

# 🔧 Synthesis Steps
## 1️⃣ Launch Design Compiler
```
dc_shell -f compile.tcl | tee log.txt
```
## 2️⃣ TCL Script: compile.tcl
# --- Library Setup ---
```
set target_library [list ./generic_32nm.db]
set link_library "* $target_library"
```
# --- Read Design ---
```
read_verilog alu.v
current_design alu
```
# --- Constraints ---
```
create_clock -period 5 [get_ports clk]
set_input_delay 1 -clock clk [all_inputs]
set_output_delay 1 -clock clk [all_outputs]
```
# --- Synthesis ---
```
compile_ultra
compile_ulter_incremental
```
# --- Reports ---
```
report_area   > ./output/alu_area.rpt
```
---
<img width="3038" height="1634" alt="DC_POWER_REPORT" src="https://github.com/user-attachments/assets/73e8bc2a-13b0-4755-8f48-875adc0cb42b" />

```
report_timing > ./output/alu_timing.rpt
```
---
<img width="2683" height="1557" alt="DC_TIMING_REPORT" src="https://github.com/user-attachments/assets/9f7b00da-5c4a-4d92-a8b1-0e3a6fcdfbf7" />
```
report_power  > ./output/alu_power.rpt
```
---
<img width="2855" height="1481" alt="DC_AREA_REPORT" src="https://github.com/user-attachments/assets/ba5d010c-106a-454b-bb5f-92bf1df4afb3" />

```
# --- Output ---

```
write -format verilog -output ./output/alu_syn.v
```
