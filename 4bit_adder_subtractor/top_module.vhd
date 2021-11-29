library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
	port (
		in_k : in std_logic;
		in_a : in std_logic_vector (3 downto 0);
		in_b : in std_logic_vector (3 downto 0);
	
		out_s : out std_logic_vector (3 downto 0);
		out_Cout : out std_logic
	);
end top_module;

architecture Behavioral of top_module is
	COMPONENT full_adder
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		Cin : IN std_logic;          
		s : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;

	signal c0 : std_logic;
	signal c1 : std_logic;
	signal c2 : std_logic;
	
begin
	Inst_full_adder1: full_adder PORT MAP(
		a => in_a(0),
		b => in_b(0) xor in_k,
		Cin => in_k,
		s => out_s(0),
		Cout => c0
	);
	Inst_full_adder2: full_adder PORT MAP(
		a => in_a(1),
		b => in_b(1) xor in_k,
		Cin => c0,
		s => out_s(1),
		Cout => c1
	);
	Inst_full_adder3: full_adder PORT MAP(
		a => in_a(2),
		b => in_b(2) xor in_k,
		Cin => c1,
		s => out_s(2),
		Cout => c2
	);
	Inst_full_adder4: full_adder PORT MAP(
		a => in_a(3),
		b => in_b(3) xor in_k,
		Cin => c2,
		s => out_s(3),
		Cout => out_Cout
	);
	
end Behavioral;

