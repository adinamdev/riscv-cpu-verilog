# 5-Stage Pipelined RISC-V CPU

A synthesizable 32-bit RISC-V processor implemented in Verilog and targeted for FPGA deployment. This project explores processor microarchitecture, pipelined execution, RTL design, functional verification, and FPGA synthesis using Intel Quartus Prime and Questa.

## Overview

The processor implements a classic five-stage pipeline:

1. **Instruction Fetch (IF)** — Fetches instructions from instruction memory using the program counter.
2. **Instruction Decode (ID)** — Decodes instructions, reads source registers, and generates immediate values and control signals.
3. **Execute (EX)** — Performs arithmetic and logical operations through the ALU.
4. **Memory Access (MEM)** — Interfaces with data memory for load/store operations.
5. **Write Back (WB)** — Writes computation or memory results back to the register file.

The design was developed modularly in Verilog, verified using dedicated testbenches, and synthesized using Intel Quartus Prime for FPGA implementation.

## Architecture

```text
             ┌───────────┐
             │    PC     │
             └─────┬─────┘
                   │
                   ▼
        ┌─────────────────────┐
        │  Instruction Memory │
        └──────────┬──────────┘
                   │
              IF / ID
                   │
                   ▼
        ┌─────────────────────┐
        │    Control Unit     │
        │    Register File    │
        │ Immediate Generator │
        └──────────┬──────────┘
                   │
              ID / EX
                   │
                   ▼
             ┌───────────┐
             │    ALU    │
             └─────┬─────┘
                   │
              EX / MEM
                   │
                   ▼
            ┌─────────────┐
            │ Data Memory │
            └──────┬──────┘
                   │
              MEM / WB
                   │
                   ▼
            ┌─────────────┐
            │ Write Back  │
            └─────────────┘
