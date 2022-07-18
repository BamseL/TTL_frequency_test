----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:08:33 06/21/2018 
-- Design Name: 
-- Module Name:    seg - Behavioral 
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

entity seg is
    Port ( clock_led : in  STD_LOGIC;
           l_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_3 : in  STD_LOGIC_VECTOR (3 downto 0);
           DP_1 : in  STD_LOGIC;
           DP_2 : in  STD_LOGIC;
           DP_3 : in  STD_LOGIC;
	        L: out std_logic_vector (7 downto 0);			  
			  N: out STD_LOGIC_VECTOR (3 downto 0)
			 );
end seg;

architecture Behavioral of seg is
type state_type is (D1,C1,B1,A1);
signal sreg,snext: state_type;
signal A,B,C,D: std_logic_vector (7 downto 0);
signal s0,s1,s2,s3 : std_logic_vector (3 downto 0);
--------------------------------------------------
component BCD port (
      DP: in std_logic;
      A: out STD_LOGIC_VECTOR (7 downto 0);
		S: in STD_LOGIC_VECTOR (3 downto 0)
		);
end component;
--------------------------------------
component BCD1 port (
      A: out STD_LOGIC_VECTOR (7 downto 0);
		S: in STD_LOGIC_VECTOR (3 downto 0)
		);
end component;
----------------------------------------------
begin
process(clock_led)
begin
  if clock_led'event and clock_led='1' then
    sreg <=snext;
  end if;
end process;
  
process(sreg)  --×´Ì¬Ñ­»· 200HZ
  begin
	    case sreg is
		    when A1    =>  snext <=B1;
		    when B1    =>  snext <=C1;
		    when C1    =>  snext <=D1;
		    when D1    =>  snext <=A1;
		    when others => snext <=A1;
	    end case; 			 
end process;
  s0<=l_0;
  s1<=l_1;
  s2<=l_2;
  s3<=l_3;
  U10:BCD1 port map (A,s0);
  U11:BCD port map (DP_1,B,s1);
  U12:BCD port map (DP_2,C,s2);
  U13:BCD port map (DP_3,D,s3);

  with sreg select
    L <= A when A1,
         B when B1,
         C when C1,
         D when D1;
  
  with sreg select
    N <=  "1110" when A1,
          "1101" when B1,
          "1011" when C1,
          "0111" when D1;

end Behavioral;

