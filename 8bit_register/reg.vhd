library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg is
	port (
		in_regd   : in  std_logic;
		out_regq  : out std_logic_vector (7 downto 0);
		regclk    : in  std_logic;
		clear_sig : in  std_logic;
		twos_sig  : in  std_logic;
		ones_sig  : in  std_logic;
		inc_sig   : in  std_logic;
		dec_sig   : in  std_logic
	);
end reg;

architecture Behavioral of reg is
	COMPONENT flipflop
		port (
			in_d  : in std_logic;
			out_q : out std_logic;
			clk   : in std_logic
		);
	end COMPONENT;
	
	signal d : std_logic_vector (7 downto 0);
begin
	ff1 : flipflop port map (in_regd, d(0), regclk);
	ff2 : flipflop port map (d(0), d(1), regclk);
	ff3 : flipflop port map (d(1), d(2), regclk);
	ff4 : flipflop port map (d(2), d(3), regclk);
	ff5 : flipflop port map (d(3), d(4), regclk);
	ff6 : flipflop port map (d(4), d(5), regclk);
	ff7 : flipflop port map (d(5), d(6), regclk);
	ff8 : flipflop port map (d(6), d(7), regclk);

	process (regclk)
	begin
		if clear_sig = '1' then
			out_regq <= "00000000";
		elsif ones_sig = '1' then
			out_regq <= not(d);
		elsif twos_sig = '1' then
			out_regq <= not(d) + 1;
		elsif inc_sig = '1' then
			out_regq <= d + 1;
		elsif dec_sig = '1' then
			out_regq <= d - 1;
		elsif rising_edge(regclk) then
			out_regq<= d;
		end if;

	end process;
end Behavioral;

