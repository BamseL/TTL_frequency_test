----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:07 05/10/2018 
-- Design Name: 
-- Module Name:    BCD - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD1 is
port (
      A: out STD_LOGIC_VECTOR (7 downto 0);
		S: in STD_LOGIC_VECTOR (3 downto 0)
		);
end BCD1;

architecture Behavioral of BCD1 is
begin

process(S)
  begin
    case S is         --abcdefg
	    when "0000" => A <= "00000011";
		 when "0001" => A <= "10011111";
		 when "0010" => A <= "00100101";
		 when "0011" => A <= "00001101";
		 when "0100" => A <= "10011001";
		 when "0101" => A <= "01001001";
		 when "0110" => A <= "01000001";
		 when "0111" => A <= "00011111";
		 when "1000" => A <= "00000001";
		 when "1001" => A <= "00001001";
		 when "1010" => A <= "11111101";
		 when others => A <= "00000011";
		 end case;
end process;
end Behavioral;

