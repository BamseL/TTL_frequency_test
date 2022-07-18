----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:26 06/20/2018 
-- Design Name: 
-- Module Name:    counter_one - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_one is
    Port ( 
	        clock_con_one: in std_logic;
	        clear : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end counter_one;

architecture Behavioral of counter_one is
signal counter: std_logic_vector(3 downto 0);
begin
process(clear,clock_con_one)
begin
  if clear='1' then
    counter<="0000";
  else if clock_con_one'event and clock_con_one='1' then
        if c_in='1' then
		    if counter<"1001" then
			    counter<=counter+1;
			 else
			    counter<="0000";
			 end if;
		  else
		  null;
		  end if;
       end if;
  end if;
end process;
s<=counter;
c_out<='1' when c_in='1' and counter="1001" else '0';
end Behavioral;

