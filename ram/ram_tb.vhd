-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 02/05/2019 15:05
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_tb is
end entity;

architecture bhv of ram_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;

  --signal reset_n : std_logic;
  --signal clk     : std_logic;
  signal wr      : std_logic;
  signal address : unsigned(7 downto 0);
  signal datain  : std_logic_vector(7 downto 0);
  signal dataout : std_logic_vector(7 downto 0);

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 666 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  dut : entity work.ram(rtl)
        
        port map (
          reset_n => reset_n,
          clk     => clk    ,
          wr      => wr     ,
          address => address,
          datain  => datain ,
          dataout => dataout
        );

  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
stim : process
   begin
     report "running testbench for ram(rtl)";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(100);

  -- Test WR=1 pour autorisation ecriture
  wr <='1';
  wait_cycles(10);
  --écriture de 4 à l'adresse 2
       address <= to_unsigned(2,8);
       datain <= std_logic_vector(to_unsigned(4,8));
    wait_cycles(10);
  wr <='0';
  -- fin d'autorisation d'écriture
  wait_cycles(10);
  -- Test WR=1 pour autorisation ecriture
    wr <='1';
  wait_cycles(10);
  --écriture de 5 à l'adresse 3
       address <= to_unsigned(3,8);
       datain <= std_logic_vector(to_unsigned(5,8));
  wait_cycles(10);
  wr <='0';
  -- fin d'autorisation d'écriture
  wait_cycles(10);
  -- Test WR=1 pour autorisation ecriture
  wr <='1';
  wait_cycles(10);
  --écriture de 7 à l'adresse 6
       address <= to_unsigned(6,8);
       datain <= std_logic_vector(to_unsigned(7,8));
    wait_cycles(10);
  wr <='0';
  -- fin d'autorisation d'écriture
  wait_cycles(10);

-- lecture de l'adresse 2
    wait_cycles(10);
         address <= to_unsigned(2,8);
-- lecture de l'adresse 3
    wait_cycles(10);
         address <= to_unsigned(3,8);
-- lecture de l'adresse 6
    wait_cycles(10);
         address <= to_unsigned(6,8);


  wait_cycles(100);

-- boucle pour charger tous les n° des adresses dans chacune des adresses

   report "writing memory";
   wr <= '1';
     for i in 0 to 127 loop
       wait_cycles(10);
       address <= to_unsigned(i,8);
       datain <= std_logic_vector(to_unsigned(i,8));
     end loop;
     wr <= '0';
   
     report "end of simulation";
     running <=false;
     wait;
   end process;

end bhv;
