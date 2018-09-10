all: migen yosys verilator iverilog

migen:
	python3 comb_loop.py

yosys:
	yosys build.ys

verilator:
	verilator --cc comb_loop.v --top-module top_b_verilator
	verilator --cc comb_loop_migen.v --top-module top

iverilog:
	iverilog comb_loop.v -s bench
	vvp -M/opt/nextpnr/lib/ivl a.out
