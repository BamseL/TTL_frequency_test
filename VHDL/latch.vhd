----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:55 06/20/2018 
-- Design Name: 
-- Module Name:    latch - Behavioral 
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

entity latch is
    Port ( latch : in  STD_LOGIC;
	        D1 : out  STD_LOGIC;  --分档（LED是否亮）
			  D2 : out  STD_LOGIC;
			  DP_1 : OUT STD_LOGIC; --小数点的确定
			  DP_2 : OUT STD_LOGIC;
			  DP_3 : OUT STD_LOGIC;			  
           led_0 : in STD_LOGIC_VECTOR (3 downto 0);
           led_1 : in STD_LOGIC_VECTOR (3 downto 0);
           led_2 : in STD_LOGIC_VECTOR (3 downto 0);
           led_3 : in STD_LOGIC_VECTOR (3 downto 0);
           led_4 : in STD_LOGIC_VECTOR (3 downto 0);
           led_5 : in STD_LOGIC_VECTOR (3 downto 0);
           latch_0 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_2 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_3 : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end latch;

architecture Behavioral of latch is

begin
process(latch)
  variable latch_led_0 : STD_LOGIC_VECTOR (3 downto 0);
  variable latch_led_1 : STD_LOGIC_VECTOR (3 downto 0);
  variable latch_led_2 : STD_LOGIC_VECTOR (3 downto 0);
  variable latch_led_3 : STD_LOGIC_VECTOR (3 downto 0);
  variable latch_led_4 : STD_LOGIC_VECTOR (3 downto 0);
  variable latch_led_5 : STD_LOGIC_VECTOR (3 downto 0);
  begin
    if latch'event and latch='1' then
	    latch_led_0:=led_0;
		 latch_led_1:=led_1;
		 latch_led_2:=led_2;
		 latch_led_3:=led_3;
		 latch_led_4:=led_4;
		 latch_led_5:=led_5;
		 if latch_led_5="0000" then
		    if latch_led_4="0000" then
			   if latch_led_3="0000" then
				  D1<='1';
				  D2<='0';
				  latch_0<="0000";
				  latch_1<=latch_led_0;				  
				  latch_2<=latch_led_1;
				  latch_3<=latch_led_2;
              DP_1<='0';
              DP_2<='1';
              DP_3<='1';
           	else
				  D1<='0';
				  D2<='1';
				  latch_0<=latch_led_0;
				  latch_1<=latch_led_1;				  
				  latch_2<=latch_led_2;
				  latch_3<=latch_led_3;
              DP_1<='1';
              DP_2<='1';
              DP_3<='0';
            end if;
          else 
				D1<='0';
				D2<='1';
				latch_0<=latch_led_1;
				latch_1<=latch_led_2;				  
				latch_2<=latch_led_3;
				latch_3<=latch_led_4;
            DP_1<='1';
            DP_2<='0';
            DP_3<='1';
          end if;	
		  else
			 D1<='0';
			 D2<='1';
			 latch_0<=latch_led_2;
			 latch_1<=latch_led_3;				  
			 latch_2<=latch_led_4;
			 latch_3<=latch_led_5;
          DP_1<='0';
          DP_2<='1';
          DP_3<='1';			 
	     end if;
		end if;
end process;
end Behavioral;

