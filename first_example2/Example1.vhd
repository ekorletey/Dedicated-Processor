----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:13:59 10/20/2022 
-- Design Name: 
-- Module Name:    Example1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Example1 is PORT(
CLOCK: IN STD_LOGIC;

	--PRIMARY DATAPATH INPUT
	Input: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--CONTROL SIGNAL
	clear: IN STD_LOGIC;
	sumload: IN STD_LOGIC;
	ncount: IN STD_LOGIC;
	nload: IN STD_LOGIC;
	OutDone: IN STD_LOGIC;
	
	--STATUS SIGNALS
	N0eq0: OUT STD_LOGIC;
	
	--PRIMARY DATAPATH OUTPUT
	Done: OUT STD_LOGIC;
	OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end Example1;


architecture Behavioral of Example1 is

	COMPONENT sum PORT(
		clock : IN STD_LOGIC;
      clear : IN STD_LOGIC;
      sumload : in STD_LOGIC;
      D : IN STD_LOGIC_vector(7 DOWNTO 0);
      Q : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0));
		
	END COMPONENT;
	
	COMPONENT NREG PORT(
		CLOCK : in std_logic;
      nCount : in std_logic;
      nload : in std_logic;
      Input_n : in std_logic_vector(7 downto 0);
       Q : out std_logic_vector(7 downto 0));
	END COMPONENT;
	
	COMPONENT addition PORT(
	INPUT_1 : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
	INPUT_2 : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
	ADDOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
	
	SIGNAL Qoutn: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Qoutsum, addOutput: STD_LOGIC_VECTOR(7 DOWNTO 0);
  
	
begin
	sum1: sum PORT MAP(
		clock => CLOCK,
		clear => clear,
		sumload => sumload,
		D => addOutput,
		Q => Qoutsum
	);
	
	nreg1: NREG PORT MAP(
		CLOCK => CLOCK,
		nCount => ncount,
		nLoad => nload,
		Input_n => Input,
		Q => Qoutn
	
	);
	
	add1: addition PORT MAP(
		INPUT_1 => Qoutsum,
		INPUT_2 => Qoutn,
		ADDOUT => addOutput
	);
		
		N0eq0 <= '1' when Qoutsum = "00000000" else '0';
		
		OUTPUT <= Qoutsum when OutDone = '1'; --may cause issue...
		Done <= OutDone;
		
		
		

end Behavioral;

