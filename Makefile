IVERILOG ?= iverilog
VVP      ?= vvp

.PHONY: alu clean

alu:
	$(IVERILOG) -o sim/alu_tb tb/alu_tb.v rtl/alu.v
	$(VVP) sim/alu_tb

clean:
	rm -f sim/* *.vcd
