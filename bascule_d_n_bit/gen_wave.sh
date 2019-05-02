
#!/bin/bash

ghdl -a bascule_gen.vhd
echo 'VHDL compiled, Binary generated!'
echo '================================'

ghdl -a bascule_gen_tb.vhd
echo 'Testbench compiled, Binary generated!'
echo '================================'

ghdl -e bascule_gen_tb
echo 'Elaboration completed!'
echo '================================'

ghdl -r bascule_gen_tb --wave=bascule_gen.ghw
echo 'Waveform generated!'
echo '================================'
gtkwave bascule_gen.ghw 