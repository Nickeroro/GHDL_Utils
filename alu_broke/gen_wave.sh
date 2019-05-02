#!/bin/bash

ghdl -a alu.vhd

ghdl -a alu_tb.vhd

ghdl -e alu_tb

ghdl -r alu_tb --wave=ual.ghw

gtkwave alu.ghw
