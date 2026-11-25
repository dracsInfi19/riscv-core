# ISA subset

Target: RV32I base integer instruction set, 32-bit, little-endian, no CSRs, no exceptions.

## Instruction formats

| Format | Used by |
|---|---|
| R | Register-register ALU operations |
| I | Immediate ALU operations, loads, JALR |
| S | Stores |
| B | Conditional branches |
| U | LUI, AUIPC |
| J | JAL |

## Instructions

| Class | Instructions |
|---|---|
| Arithmetic / logic (R) | ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU |
| Arithmetic / logic (I) | ADDI, ANDI, ORI, XORI, SLLI, SRLI, SRAI, SLTI, SLTIU |
| Loads | LW (LB, LH, LBU, LHU as extension) |
| Stores | SW (SB, SH as extension) |
| Branches | BEQ, BNE, BLT, BGE, BLTU, BGEU |
| Jumps | JAL, JALR |
| Upper immediate | LUI, AUIPC |

Initial implementation covers the word-size memory operations; byte and halfword accesses are added after the core passes the full test programs.

## References

- RISC-V Unprivileged ISA Specification, RV32I chapter
