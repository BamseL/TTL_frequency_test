--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:37:31 06/22/2018
-- Design Name:   
-- Module Name:   D:/ISE_project/HZ6/text.vhd
-- Project Name:  HZ6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HZ6
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY text IS
END text;
 
ARCHITECTURE behavior OF text IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HZ6
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         clock_text : IN  std_logic;
         D1 : OUT  std_logic;
         D2 : OUT  std_logic;
         N : OUT  std_logic_vector(3 downto 0);
         L : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock_text : std_logic := '0';

 	--Outputs
   signal D1 : std_logic;
   signal D2 : std_logic;
   signal N : std_logic_vector(3 downto 0);
   signal L : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
   constant clock_text_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HZ6 PORT MAP (
          clock => clock,
          reset => reset,
          clock_text => clock_text,
          D1 => D1,
          D2 => D2,
          N => N,
          L => L
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for 10 ns;
		clock <= '1';
		wait for 10 ns;
   end process;
 
   clock_text_process :process
   begin
		clock_text <= '0';
		wait for 500 us;
		clock_text <= '1';
		wait for 500 us;
   end process;
 

   -- Stimulus process
   stim_proc: process
      begin
		  reset<='1';
		  wait for 1 ms;
		  reset<='0';
		  wait for 10000 ms;
   end process;

END;
