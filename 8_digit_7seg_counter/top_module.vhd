library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
	port(
		clk 			: in  std_logic;
		number 		: out std_logic_vector(7 downto 0);
		segment_num : out std_logic_vector(3 downto 0)
	);
end top_module;

architecture Behavioral of top_module is
	component seven_segment_counter
		port(
			clk		: in  std_logic;
			out_buf  : out std_logic_vector(1 downto 0)
		);
	end component;
	
	component segment_decoder
		port(
			in_buf  : in  std_logic_vector (1 downto 0);
			out_buf : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component counter
		port(
			clk 		: in  std_logic;
			out_buf1 : out std_logic_vector(3 downto 0);
			out_buf2 : out std_logic_vector(3 downto 0);
			out_buf3 : out std_logic_vector(3 downto 0);
			out_buf4 : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component mux
		port(
			in_buf1  : in  std_logic_vector(3 downto 0);
			in_buf2  : in  std_logic_vector(3 downto 0);
			in_buf3  : in  std_logic_vector(3 downto 0);
			in_buf4  : in  std_logic_vector(3 downto 0);
		
			out_buf  : out std_logic_vector(3 downto 0);
		
			selector : in  std_logic_vector(1 downto 0)
		);
	end component;
	
	component bcd_to_seven
		port(
			in_buf  : in  std_logic_vector(3 downto 0);
			out_buf : out std_logic_vector (7 downto 0)
		);
	end component;
	
	signal seven_segment_counter_temp : std_logic_vector(1 downto 0);
	
	signal counter_temp1 : std_logic_vector(3 downto 0);
	signal counter_temp2 : std_logic_vector(3 downto 0);
	signal counter_temp3 : std_logic_vector(3 downto 0);
	signal counter_temp4 : std_logic_vector(3 downto 0);
	
	signal mux_temp : std_logic_vector(3 downto 0);
begin
	seven_segment_counter1: seven_segment_counter port map(
		clk => clk,
		out_buf => seven_segment_counter_temp
	); 
	
	segment_decoder1: segment_decoder port map(
		in_buf => seven_segment_counter_temp,
		out_buf => segment_num
	);
	
	counter1: counter port map(
		clk => clk, 
		out_buf1 => counter_temp1, 
		out_buf2 => counter_temp2,
		out_buf3 => counter_temp3,
		out_buf4 => counter_temp4
	);
	
	mux1: mux port map(
		in_buf1 => counter_temp1,
		in_buf2 => counter_temp2,
		in_buf3 => counter_temp3,
		in_buf4 => counter_temp4, 
		out_buf => mux_temp, 
		selector => seven_segment_counter_temp
	);
	
	bcd_to_seven1: bcd_to_seven port map(
		in_buf => mux_temp, 
		out_buf => number
	);
end Behavioral;

