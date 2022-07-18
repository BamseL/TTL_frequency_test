----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:17 06/20/2018 
-- Design Name: 
-- Module Name:    counter_all - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_all is
    Port ( clock_text : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           led_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_2 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_5 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_0 : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_all;

architecture Behavioral of counter_all is
component counter_one is
Port ( 
	   clock_con_one: in std_logic;
	   clear : in  STD_LOGIC;
      c_in : in  STD_LOGIC;
      c_out : out  STD_LOGIC;
      s : out  STD_LOGIC_VECTOR (3 downto 0)
	   );
end component counter_one;
signal c_out_0,c_out_1,c_out_2,c_out_3,c_out_4,c_out_5,c_out_6: std_logic;--½øÎ»Êä³ö
begin
U3:counter_one port map(clock_text,clear,enable,c_out_0,led_0);
U4:counter_one port map(clock_text,clear,c_out_0,c_out_1,led_1);
U5:counter_one port map(clock_text,clear,c_out_1,c_out_2,led_2);
U6:counter_one port map(clock_text,clear,c_out_2,c_out_3,led_3);
U7:counter_one port map(clock_text,clear,c_out_3,c_out_4,led_4);
U8:counter_one port map(clock_text,clear,c_out_4,c_out_5,led_5);

end Behavioral;

