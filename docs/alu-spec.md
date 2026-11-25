# ALU specification

## Interface

| Port | Direction | Width | Description |
|---|---|---|---|
| `a` | input | 32 | Operand A |
| `b` | input | 32 | Operand B |
| `alu_ctrl` | input | 4 | Operation select |
| `result` | output | 32 | Operation result |
| `zero` | output | 1 | 1 when `result == 0` |

## Operation encoding

| `alu_ctrl` | Operation | Result |
|---|---|---|
| 0000 | ADD | `a + b` |
| 0001 | SUB | `a - b` |
| 0010 | AND | `a & b` |
| 0011 | OR | `a \| b` |
| 0100 | XOR | `a ^ b` |
| 0101 | SLL | `a << b[4:0]` |
| 0110 | SRL | `a >> b[4:0]` (zero fill) |
| 0111 | SRA | `a >>> b[4:0]` (sign fill) |
| 1000 | SLT | `1` if `a < b` signed, else `0` |
| 1001 | SLTU | `1` if `a < b` unsigned, else `0` |

Shift amount uses only `b[4:0]`.

## Implementation notes

- Purely combinational.
- Every `case` branch assigns `result`; `default` assigns zero to avoid latch inference.
- Signed operations use `$signed()` on the operands.

## Test coverage

At least three cases per operation, including: `0x00000000`, `0xFFFFFFFF`, `0x80000000`, `0x7FFFFFFF`, shift by 0 and 31, SLT with negative operands, SUB producing zero.
