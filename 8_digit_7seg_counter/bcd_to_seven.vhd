library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_seven is
	port(
		in_buf  : in  std_logic_vector(3 downto 0);
		out_buf : out std_logic_vector (7 downto 0)
	);
end bcd_to_seven;

architecture Behavioral of bcd_to_seven is
begin
	process(in_buf) is 
	begin
		case in_buf is
			when "0000" =>
				out_buf <= "11111100";
			when "0001" =>
				out_buf <= "01100000";
			when "0010" =>
				out_buf <= "11011010";
			when "0011" =>
				out_buf <= "11110010";
			when "0100" =>
				out_buf <= "01100110";
			when "0101" =>
				out_buf <= "10110110";
			when "0110" =>
				out_buf <= "10111110";
			when "0111" =>
				out_buf <= "11100000";
			when "1000" =>
				out_buf <= "11111110";
			when "1001" =>
				out_buf <= "11110110";
			when others =>
				out_buf <= "11111111";
		end case;
	end process;
end Behavioral;

