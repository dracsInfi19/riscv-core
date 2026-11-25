# Architecture

## Overview

Two implementations of the same RV32I subset share the same ALU, register file, immediate generator and control logic:

1. **Single-cycle core** (`core_sc.v`): one instruction completes per clock. Used as the performance and area baseline.
2. **5-stage pipelined core** (`core_pipe.v`): one instruction issues per clock, with hazard handling.

## Pipeline stages

| Stage | Function | Pipeline register |
|---|---|---|
| IF | Fetch instruction at PC, compute PC+4 | IF/ID |
| ID | Decode, read register file, generate immediate | ID/EX |
| EX | ALU operation, branch target and condition | EX/MEM |
| MEM | Data memory load / store | MEM/WB |
| WB | Write result to register file | n/a |

## Hazard handling

| Hazard | Cause | Resolution |
|---|---|---|
| RAW (data) | Instruction reads a register written by an in-flight instruction | Forward from EX/MEM and MEM/WB to ALU inputs |
| Load-use | Instruction needs a loaded value in the next cycle | Stall one cycle, then forward |
| Control | Branch or jump changes PC after younger instructions are fetched | Flush IF/ID and ID/EX on taken branch |

The register file writes in the first half of the cycle and reads in the second half, which removes the WB-to-ID hazard.

## Custom instruction

To be selected after the baseline is verified. Candidates:

- Multiply-accumulate (MAC)
- Approximate multiply built from 4:2 compressors

The instruction uses the RISC-V `custom-0` opcode space (`0001011`) so it does not collide with standard encodings. Encoding, semantics and the benchmark that exercises it will be documented here.

## Evaluation method

- **Speedup:** cycle count of the same benchmark program on each configuration, measured in simulation.
- **Cost:** cell count and estimated area from Yosys synthesis of each configuration.
