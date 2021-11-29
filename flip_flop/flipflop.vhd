library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
	port (
		in_d  : in std_logic;
		out_q : out std_logic;
		clk   : in std_logic
	);
end flipflop;

architecture Behavioral of flipflop is

begin
	process(clk)
	begin
		if rising_edge (clk) then
			out_q <= in_d;
		end if;
	end process;

end Behavioral;

