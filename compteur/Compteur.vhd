library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compteur is
  port (
    reset_n : in  std_logic;
    clk     : in  std_logic;
    qs      : out std_logic_vector(9 downto 0)); 
end Compteur;


architecture bhv of Compteur is
  signal q : unsigned(9 downto 0);
begin

  process(clk)
  begin
    if reset_n = '0' then
      q <= (others => '0');
    elsif rising_edge(clk) then
      q <= q + 1;
      if q = 1000 then
        q <= (others => '0');
      end if;
      
    end if;
  end process;

  qs <= std_logic_vector(q);
  
end bhv;
