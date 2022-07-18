----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:38 06/20/2018 
-- Design Name: 
-- Module Name:    two_clk - Behavioral 
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

entity two_clk is
    Port ( clock : in  STD_LOGIC;     --50MHZ
	        reset : in std_logic;
           clock_con : OUT  STD_LOGIC; --控制时钟1HZ
           clock_led : OUT  STD_LOGIC);--显示时钟200HZ
end two_clk;

architecture Behavioral of two_clk is
signal s0,s1: std_logic;
signal counters: std_logic_vector (16 downto 0);
signal counter1: std_logic_vector (24 downto 0);
---------------------------------------------
begin
process(clock,reset)
  begin
  if reset='1' then
    s0<='0';
	 counters<="00000000000000000";
	 else
    if (clock'event and clock ='1') then
        counters<=counters+1; 
		  if (counters="11110100001001000") then --片选200HZ
           s0<=not s0;
		     counters<="00000000000000000";
	     end if;
	 end if;
  end if;
end process;
----------------------------------
process(clock,reset)
  begin
  if reset='1' then
    s1<='0';
	 counter1<="0000000000000000000000000";
	 else
    if (clock'event and clock ='1') then
        counter1<=counter1+1; 
		  if (counter1="1011111010111100001000000") then --片选200HZ
           s1<=not s1;
		     counter1<="0000000000000000000000000";
	     end if;
	 end if;
  end if;
end process;
clock_led<=s0;
clock_con<=s1;
end Behavioral;

