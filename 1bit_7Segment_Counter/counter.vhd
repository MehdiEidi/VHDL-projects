library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	port(
		clk 	    : in std_logic;
		out_buf 	 : out std_logic_vector (3 downto 0);
		sig_reset : in std_logic
	);
end counter;

architecture Behavioral of counter is
	signal temp 	: unsigned (3 downto 0);
	signal clkCntr : unsigned (19 downto 0);
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if sig_reset = '1' then
				out_buf <= "0000";
			else
				if clkCntr < 100000 then
					clkCntr <= clkCntr + 1;
				else 
					clkCntr <= (others => '0');
				
					if temp < 9 then
						temp <= temp + 1;
						out_buf <= std_logic_vector(temp);
					else
						temp <= "0000";
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

