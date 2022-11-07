----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:14 10/26/2022 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
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

entity Processor is PORT(
entry : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
clock : in STD_LOGIC;
reset : in STD_LOGIC;
answer : Out STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end Processor;

architecture Behavioral of Processor is
 
 COMPONENT control_unit PORT(
  clock : IN STD_LOGIC;
  N0eq0 : IN STD_LOGIC;
  nLoad : OUT STD_LOGIC;
  nCount : OUT STD_LOGIC;
  clear : OUT STD_LOGIC;
  resetMain : IN STD_LOGIC;
  sumload : OUT STD_LOGIC;
  OutEn : OUT STD_LOGIC);
 end component;
 
 COMPONENT Example1 PORT(
 CLOCK: IN STD_LOGIC;
 Input: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
 clear: IN STD_LOGIC;
 sumload: IN STD_LOGIC;
 ncount: IN STD_LOGIC;
 nload: IN STD_LOGIC;
 OutDone: IN STD_LOGIC;
 N0eq0: OUT STD_LOGIC;
 Done: OUT STD_LOGIC;
 OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;


SIGNAL nLoadtemp : STD_LOGIC;
SIGNAL nCounttemp : STD_LOGIC;
SIGNAL cleartemp : STD_LOGIC;
SIGNAL sumloadtemp : STD_LOGIC;
SIGNAL OutEntemp : STD_LOGIC;
SIGNAL resettemp : STD_LOGIC;
SIGNAL entrytemp :std_logic_vector(7 downto 0);
SIGNAL N0eq0temp :STD_LOGIC;
SIGNAL answertemp : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
 first_connection : control_unit PORT MAP(
  clock => CLOCK ,
  N0eq0 => N0eq0temp,
  nLoad => nLoadtemp,
  nCount => nCounttemp,
  resetMain => resettemp,
  clear => cleartemp,
  sumload => sumloadtemp,
  OutEn => OutEntemp);
  
 second_connection : Example1 PORT MAP(
	CLOCK => CLOCK,
 Input => entrytemp,
 clear => cleartemp,
 sumload => sumloadtemp,
 ncount => nCounttemp,
 nload => nLoadtemp,
 OutDone => OutEntemp,
 N0eq0 => N0eq0temp,
 --Done: 
 OUTPUT => answertemp
 );


		answer <= answertemp;
		entrytemp <= entry;
		resettemp <= reset ;
		
end Behavioral;

