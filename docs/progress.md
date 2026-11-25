# Progress log

Entries are added in reverse chronological order.

## 2026-11-25

**Environment**
- WSL2 Ubuntu development environment set up.
- Icarus Verilog installed and verified with a test module (compile and run).
- Repository created with directory layout, Makefile and design documentation.

**ALU (`rtl/alu.v`)**
- Module interface defined: 32-bit `a`, `b`, 4-bit `alu_ctrl`, 32-bit `result`, 1-bit `zero`.
- Operation encoding defined as `localparam` constants for 10 operations (see [alu-spec.md](alu-spec.md)).
- Combinational `always @(*)` / `case` structure written with a `default` branch.
- ADD, SUB and AND implemented; file compiles without errors under Icarus Verilog.

**Pending in the ALU**
- OR, XOR, SLL
- SRL, SRA (logical vs arithmetic right shift)
- SLT, SLTU (signed vs unsigned comparison)
- `zero` output
- Self-checking testbench (`tb/alu_tb.v`) and `make alu` run

**Next blocks after the ALU:** register file, immediate generator, control unit.
