----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:11:48 06/21/2018 
-- Design Name: 
-- Module Name:    HZ5 - Behavioral 
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

entity HZ6 is
    Port ( clock : in  STD_LOGIC;
	        reset : in std_logic;
           clock_text : in std_logic;
           D1 : out  STD_LOGIC;
           D2 : out  STD_LOGIC;
           N : out  STD_LOGIC_VECTOR (3 downto 0);
           L : out  STD_LOGIC_VECTOR (7 downto 0));
end HZ6;

architecture Behavioral of HZ6 is
--------------------------------------
signal clock_con_t,clock_led_t,clear_t,enable_t,latch_t,D1_t,D2_t,DP_1_t,DP_2_t,DP_3_t,
       clock_t,clock_text_t,reset_t : std_logic;
signal led_0_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,led_6_t,latch_0_t,latch_1_t,latch_2_t,
       latch_3_t,N_t : std_logic_vector(3 downto 0);
signal L_t: std_logic_vector(7 downto 0);
------------------------------------
component two_clk is
    Port ( clock : in  STD_LOGIC;     --50MHZ
	 	     reset : in std_logic;
           clock_con : OUT  STD_LOGIC; --控制时钟0.1HZ
           clock_led : OUT  STD_LOGIC);--显示时钟200HZ
end component;
-------------------------------------
component contro is
    Port ( clock_con : in  STD_LOGIC;
	 	     reset : in std_logic;
           clear : out  STD_LOGIC;
           enable : out  STD_LOGIC;
           latch : out  STD_LOGIC);
end component;
--------------------------------------------
component counter_all is
    Port ( clock_text : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           led_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_2 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_5 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_0 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
--------------------------------------------
component latch is
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
end component;
----------------------------------------
component seg is
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
end component;
-------------------------------------------
begin
clock_t<=clock;
clock_text_t<=clock_text;
reset_t<=reset;
T1:two_clk port map (clock_t,reset_t,clock_con_t,clock_led_t);
T2:contro port map (clock_con_t,reset_t,clear_t,enable_t,latch_t);
T3:counter_all port map (clock_text_t,clear_t,enable_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,
                        led_0_t);
T4:latch port map (latch_t,D1_t,D2_t,DP_1_t,DP_2_t,DP_3_t,
                 led_0_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,
                 latch_0_t,latch_1_t,latch_2_t,latch_3_t);
T5:seg port map (clock_led_t,latch_0_t,latch_1_t,latch_2_t,latch_3_t,DP_1_t,DP_2_t,DP_3_t,
                 L_t,N_t);
D1<=D1_t;
D2<=D2_t;
L<=L_t;
N<=N_t;

end Behavioral;

