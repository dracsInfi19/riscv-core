# riscv-core

5-stage pipelined RV32I core in Verilog with one custom instruction. The core is compared against a single-cycle baseline to measure speedup (cycles) and cost (area).

## Goals

- Single-cycle RV32I core as the baseline
- 5-stage pipeline (IF, ID, EX, MEM, WB) with data forwarding, load-use stall and branch flush
- One custom instruction added to the decoder and ALU
- Self-checking testbenches for every block and for full programs
- Cycle count and area comparison: baseline vs pipelined vs pipelined + custom instruction

## Status

Last updated: 2026-11-25. Full history in [docs/progress.md](docs/progress.md).

| Block | RTL | Testbench | Status |
|---|---|---|---|
| ALU | `rtl/alu.v` | `tb/alu_tb.v` | In progress: module interface, operation encoding, ADD / SUB / AND written; OR, XOR, SLL, SRL, SRA, SLT, SLTU, `zero` output and testbench pending |
| Register file | `rtl/regfile.v` | `tb/regfile_tb.v` | Not started |
| Immediate generator | `rtl/imm_gen.v` | `tb/imm_gen_tb.v` | Not started |
| Control unit / decoder | `rtl/control.v` | `tb/control_tb.v` | Not started |
| Single-cycle core | `rtl/core_sc.v` | `tb/core_sc_tb.v` | Not started |
| Pipelined core | `rtl/core_pipe.v` | `tb/core_pipe_tb.v` | Not started |
| Hazard unit | `rtl/hazard_unit.v` | `tb/hazard_tb.v` | Not started |
| Custom instruction | `rtl/alu.v`, `rtl/control.v` | `tb/custom_tb.v` | Not started |
| Synthesis (Yosys) | `synth/` | n/a | Not started |

## Repository layout

```text
rtl/        synthesizable Verilog
tb/         self-checking testbenches
sim/        simulation outputs (ignored by git)
programs/   RISC-V test programs (assembly / C) and memory images
synth/      Yosys scripts and reports
docs/       architecture and design notes
```

## Tools

| Tool | Purpose |
|---|---|
| Icarus Verilog (`iverilog`, `vvp`) | Simulation |
| GTKWave | Waveform viewing |
| Yosys | Synthesis and area estimation |
| RISC-V GCC (`riscv64-unknown-elf-gcc`) | Compiling test programs |

Ubuntu / WSL install:

```bash
sudo apt update
sudo apt install -y iverilog gtkwave yosys make git \
    gcc-riscv64-unknown-elf binutils-riscv64-unknown-elf
```

## Build and test

```bash
make alu        # compile and run the ALU testbench
```

A testbench prints `ALL TESTS PASSED` when every check passes and `N TESTS FAILED` otherwise.

Waveform of a run (after adding `$dumpfile` / `$dumpvars` to the testbench):

```bash
gtkwave sim/alu_tb.vcd
```

## Results

Filled in after the benchmarks are run.

| Configuration | Cycles (benchmark) | CPI | Cells / area (Yosys) |
|---|---|---|---|
| Single-cycle baseline | TBD | TBD | TBD |
| 5-stage pipeline | TBD | TBD | TBD |
| 5-stage pipeline + custom instruction | TBD | TBD | TBD |

## Documentation

- [Progress log](docs/progress.md)
- [Architecture](docs/architecture.md)
- [ISA subset](docs/isa-subset.md)
- [ALU specification](docs/alu-spec.md)
- [Verification plan](docs/verification.md)
