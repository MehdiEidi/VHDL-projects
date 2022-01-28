library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	port(
		clk 		: in  std_logic;
		out_buf1 : out std_logic_vector(3 downto 0);
		out_buf2 : out std_logic_vector(3 downto 0);
		out_buf3 : out std_logic_vector(3 downto 0);
		out_buf4 : out std_logic_vector(3 downto 0)
	);
end counter;

architecture Behavioral of counter is
	signal temp1 : unsigned (3 downto 0) := "0000";
	signal temp2 : unsigned (3 downto 0) := "0000";
	signal temp3 : unsigned (3 downto 0) := "0000";
	signal temp4 : unsigned (3 downto 0) := "0000";
	
	signal segment_count : unsigned (2 downto 0) := "000";
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if segment_count < 3 then
				segment_count <= segment_count + 1;
			else
				segment_count <= "000";
				
				if temp1 = 9 then
					temp1 <= "0000";
					if temp2 = 9 then
						temp2 <= "0000";
						if temp3 = 9 then
							temp3 <= "0000";
							if temp4 = 9 then
								temp4 <= "0000";
							else
								temp4 <= temp4 + 1;
							end if;	
						else
							temp3 <= temp3 + 1;
						end if;
					else
						temp2 <= temp2 + 1;
					end if;
				else 
					temp1 <= temp1 + 1;
				end if;
			end if;
			
			out_buf1 <= std_logic_vector(temp1);
			out_buf2 <= std_logic_vector(temp2);
			out_buf3 <= std_logic_vector(temp3);
			out_buf4 <= std_logic_vector(temp4);
		end if;
	end process;
end Behavioral;

