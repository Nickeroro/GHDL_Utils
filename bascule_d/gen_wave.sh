#!/bin/bash

ghdl -a bascule.vhd
echo 'VHDL compiled, Binary generated!'
echo '================================'

ghdl -a bascule_tb.vhd
echo 'Testbench compiled, Binary generated!'
echo '================================'

ghdl -e bascule_tb
echo 'Elaboration completed!'
echo '================================'

ghdl -r bascule_tb --wave=bascule.ghw
echo 'Waveform generated!'
echo '================================'
gtkwave bascule.ghw 