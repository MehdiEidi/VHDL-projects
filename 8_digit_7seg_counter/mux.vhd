library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
	port(
		in_buf1  : in  std_logic_vector(3 downto 0);
		in_buf2  : in  std_logic_vector(3 downto 0);
		in_buf3  : in  std_logic_vector(3 downto 0);
		in_buf4  : in  std_logic_vector(3 downto 0);
		out_buf  : out std_logic_vector(3 downto 0);
		selector : in  std_logic_vector(1 downto 0)
	);
end mux;

architecture Behavioral of mux is
begin
	process(selector) is 
	begin
		case selector is
			when "00" =>
				out_buf <= in_buf1;
			when "01" =>
				out_buf <= in_buf2;
			when "10" =>
				out_buf <= in_buf3;
			when others =>
				out_buf <= in_buf4;
		end case;
	end process;
end Behavioral;

