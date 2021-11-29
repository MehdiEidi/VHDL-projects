library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
	port (
		i_a:    in  std_logic;
		i_b:    in  std_logic;
		i_cin:  in  std_logic;
		
		o_s:    out std_logic;
		o_cout: out std_logic
	);
end main;

architecture Behavioral of main is
	signal s_xor1: std_logic;
begin
	s_xor1 <= i_a xor i_b;
	o_s <= s_xor1 xor i_cin;
	o_cout <= (s_xor1 and i_cin) or (i_a and i_b);
end Behavioral;

