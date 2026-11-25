# Verification plan

## Block-level

Each `rtl/<block>.v` has a self-checking testbench `tb/<block>_tb.v`.

- Expected values are computed independently of the design under test.
- A testbench ends with `ALL TESTS PASSED` or `N TESTS FAILED`.
- A deliberate fault (for example SRA replaced by SRL) must be reported as a failure.

## Core-level

- Hand-written assembly programs in `programs/` covering each instruction class.
- The same programs run on the single-cycle and pipelined cores; final register file and memory contents must match.
- Hazard-specific programs: back-to-back dependent instructions, load followed by dependent use, taken and not-taken branches, branch after load.

## Benchmarks

Small C or assembly kernels (for example vector sum, dot product, memcpy) compiled with `riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32` and run on each configuration. Cycle counts are recorded in the README results table.

## Synthesis

Yosys `synth -top <core>` followed by `stat` for cell counts; scripts and reports are stored in `synth/`.
