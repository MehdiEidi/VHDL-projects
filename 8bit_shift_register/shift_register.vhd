library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
	port (
		in_bit 	  		  : in    std_logic;
		out_vector    	  : out   std_logic_vector(7 downto 0);
		in_clk 	  		  : in    std_logic;
		sig_enable 		  : in    std_logic;
		sig_clear  		  : in    std_logic;
		sig_rightshift   : in    std_logic;
		sig_leftshift    : in	 std_logic;
		sig_rotate_left  : in    std_logic;
		sig_rotate_right : in 	 std_logic
	);
end shift_register;

architecture Behavioral of shift_register is
	signal temp : std_logic_vector(7 downto 0);
begin
	process(in_clk)
	begin
		if rising_edge(in_clk) and sig_enable = '1' then
			if sig_clear = '1' then
				out_vector <= "00000000";
				
			elsif sig_rotate_right = '1' then
				for i in 1 to 7 loop
					temp(i) <= temp(i-1);
				end loop;
				temp(0) <= temp(7);
				out_vector <= temp;
				
			elsif sig_rotate_left = '1' then
				for i in 0 to 6 loop
					temp(6-i) <= temp(6-i+1);
				end loop;
				temp(7) <= temp(0);
				out_vector <= temp;
				
			elsif sig_rightshift = '1' then
				for i in 0 to 6 loop
					temp(7-i) <= temp(7-i-1);
				end loop;
				temp(0) <= in_bit;
				out_vector <= temp;
				
			elsif sig_leftshift = '1' then
				for i in 0 to 6 loop
					temp(i) <= temp(i+1);
				end loop;
				temp(7) <= in_bit;
				out_vector <= temp;
			end if;
		end if;
		
	end process;
end Behavioral;

