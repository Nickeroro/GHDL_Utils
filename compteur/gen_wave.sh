
#!/bin/bash

ghdl -a Compteur.vhd
echo 'VHDL compiled, Binary generated!'
echo '================================'

ghdl -a Compteur_tb.vhd
echo 'Testbench compiled, Binary generated!'
echo '================================'

ghdl -e Compteur_tb
echo 'Elaboration completed!'
echo '================================'

ghdl -r Compteur_tb --wave=Compteur.ghw
echo 'Waveform generated!'
echo '================================'
gtkwave Compteur.ghw 