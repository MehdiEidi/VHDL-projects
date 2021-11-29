library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( i_Button_1 : in  STD_LOGIC;
           i_Button_2 : in  STD_LOGIC;
           i_Button_3 : in  STD_LOGIC;
           i_Button_4 : in  STD_LOGIC;
           i_Button_5 : in  STD_LOGIC;
           o_LED_1 : out  STD_LOGIC;
           o_LED_2 : out  STD_LOGIC;
           o_LED_3 : out  STD_LOGIC;
           o_LED_4 : out  STD_LOGIC;
           o_LED_5 : out  STD_LOGIC);
end Main;

architecture Behavioral of Main is

begin
	
	o_LED_1 <= i_Button_1;
	o_LED_2 <= i_Button_2;
	o_LED_3 <= i_Button_3;
	o_LED_4 <= i_Button_4;
	o_LED_5 <= i_Button_5;

end Behavioral;

