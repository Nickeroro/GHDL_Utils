library ieee;
use ieee.std_logic_1164.all;

entity bascule is
  port(
    clk     : in  std_logic;
    input   : in  std_logic;
    output  : out std_logic
  );
end entity;

architecture using_rising_edge of bascule is
begin

  process(clk)
  begin
    if rising_edge(clk) then
      output <= input;
    end if;
  end process;

end using_rising_edge;