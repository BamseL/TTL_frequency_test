----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:10 06/20/2018 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity contro is
    Port ( clock_con : in  STD_LOGIC;
	        reset : in std_logic;
           clear : out  STD_LOGIC;
           enable : out  STD_LOGIC;
           latch : out  STD_LOGIC);
end contro;

architecture Behavioral of contro is
signal t1,t2:std_logic;
begin
process(clock_con,t1,t2,reset)
  begin
  if reset='1' then
    t1<='1';
	 t2<='0';
	 else
    if clock_con'event and clock_con='1' then
	    t1<=not t1;
	 end if;
	 if clock_con'event and clock_con='0' then
	    t2<=not t2;
	    end if;
  end if;
end process;

enable<=t1;
latch<=t2;
clear<=(not clock_con)and(not t1)and(t2);

end Behavioral;

