library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity segment_decoder is
	port(
		in_buf  : in  std_logic_vector (1 downto 0);
		out_buf : out std_logic_vector (3 downto 0)
	);
end segment_decoder;

architecture Behavioral of segment_decoder is
begin
	process(in_buf) is
	begin
		case in_buf is
			when "00" =>
				out_buf <= "0001";
			when "01" =>
				out_buf <= "0010";
			when "10" =>
				out_buf <= "0100";
			when others =>
				out_buf <= "1000";
		end case;
	end process;
end Behavioral;

