library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_segment_counter is
	port(
		clk		: in  std_logic;
		out_buf  : out std_logic_vector(1 downto 0)
	);
end seven_segment_counter;

architecture Behavioral of seven_segment_counter is
	signal temp : unsigned (1 downto 0);
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if temp < 4 then
				temp <= temp + 1;
				out_buf <= std_logic_vector(temp);
			else 
				temp <= "00";
			end if;
		end if;
	end process;
end Behavioral;

