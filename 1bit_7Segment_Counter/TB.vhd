library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB is
	port(
		clk 	  : in std_logic;
		reset   : in std_logic;
		out_buf : out std_logic_vector
	);
end TB;

architecture Behavioral of TB is
	component counter
		port(
			clk 	    : in std_logic;
			out_buf 	 : out std_logic_vector (3 downto 0);
			sig_reset : in std_logic
		);
	end component;
	
	component bcd_to_7seg
		port(
			in_buf  : in std_logic_vector (3 downto 0);
			out_buf : out std_logic_vector (7 downto 0)
		);
	end component;
	
	signal t : std_logic_vector (7 downto 0);
begin
	counter1: counter port map(clk => clk, sig_reset => reset, out_buf => t);
	bcd_to_7seg1: bcd_to_7seg port map(in_buf => t, out_buf => out_buf);
end Behavioral;

