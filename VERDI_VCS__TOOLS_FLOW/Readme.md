# 🧠 VCS + Verdi Setup Guide (4-bit ALU Example)

This guide explains how to **compile, simulate, and debug** a simple SystemVerilog design using **Synopsys VCS** and **Verdi**.

---

## 📁 Project Structure
```
alu_vcs/
├── alu.v # ALU Design (DUT)
├── tb_alu.v # Testbench for ALU
└── README.md # This guide
```

---

## ⚙️ Step 1: Create Design File (`alu.v`)

```verilog
//======================================================
// 4-bit ALU (Design Under Test)
//======================================================
module alu (
    input  logic [3:0] a, b,
    input  logic [1:0] sel,
    output logic [3:0] y,
    output logic carry
);

    always_comb begin
        case (sel)
            2'b00: {carry, y} = a + b;          // Addition
            2'b01: {carry, y} = a - b;          // Subtraction
            2'b10: {carry, y} = {1'b0, a & b};  // AND
            2'b11: {carry, y} = {1'b0, a | b};  // OR
            default: {carry, y} = 0;
        endcase
    end

endmodule
```
## Step 2: Create Testbench File (tb_alu.v)
```
//======================================================
// Testbench for ALU
//======================================================
`timescale 1ns/1ps

module tb_alu;

    logic [3:0] a, b;
    logic [1:0] sel;
    logic [3:0] y;
    logic carry;

    // Instantiate DUT
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y),
        .carry(carry)
    );

    initial begin
        // Enable waveform dump for Verdi
        $fsdbDumpfile("alu.fsdb");
        $fsdbDumpvars(0, tb_alu);

        // Apply test vectors
        a = 4'd5; b = 4'd3;
        sel = 2'b00; #10; // ADD
        sel = 2'b01; #10; // SUB
        sel = 2'b10; #10; // AND
        sel = 2'b11; #10; // OR

        $display("Simulation Complete");
        $finish;
    end

endmodule
```
## 🚀 Step 3: Compile Using VCS
```
vcs -full64 -sverilog alu.v tb_alu.v -debug_access+all -l compile.log
```
### Command Breakdown
| Option              | Description                                                      |
| ------------------- | ---------------------------------------------------------------- |
| `vcs`               | Invokes Synopsys VCS compiler/simulator                          |
| `-full64`           | Enables 64-bit mode for large designs                            |
| `-sverilog`         | Enables SystemVerilog features even if file extension is `.v`    |
| `alu.v tb_alu.v`    | Input design and testbench files                                 |
| `-debug_access+all` | Stores full debug info for Verdi (variables, hierarchy, signals) |
| `-l compile.log`    | Redirects compilation output to `compile.log` file               |

### ✅ Result

Creates simv → compiled simulation binary

Creates simv.daidir/ → internal directory for VCS run data

## ▶️ Step 4: Run Simulation
```
./simv
```
🔍 What Happens

Executes compiled binary

Runs all testbench code (initial blocks, stimuli)

Generates waveform dump (alu.fsdb)

✅ You should see:

Simulation Complete

---
<img width="3068" height="1381" alt="image" src="https://github.com/user-attachments/assets/f1b2ba60-02b8-44e7-a3f0-ea78865867a5" />


## 🧾 Step 5: Open Waveform and Debug in Verdi

```
verdi -sv alu.v tb_alu.v -ssf alu.fsdb &
```
Result

---
<img width="3072" height="1919" alt="image" src="https://github.com/user-attachments/assets/70576e38-1c45-49d1-a7a6-73de12b3193a" />

