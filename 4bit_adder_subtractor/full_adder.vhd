library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
	port (
		a, b, Cin : in std_logic;
		s, Cout : out std_logic
	);
end full_adder;

architecture Behavioral of full_adder is
	signal d1 : std_logic;
begin
	d1 <= a xor b;
	s <= d1 xor Cin;
	Cout <= (Cin and d1) or (a and b);
end Behavioral;

