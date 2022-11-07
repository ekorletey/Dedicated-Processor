----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:47 10/25/2022 
-- Design Name: 
-- Module Name:    D1_flipflop - Behavioral 
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

entity D1_flipflop is PORT(
  Clock : IN STD_LOGIC;
  D1in : IN STD_LOGIC;
  reset : IN STD_LOGIC;
  Q1 :OUT STD_LOGIC;
  Q1not : OUT STD_LOGIC
);
end D1_flipflop;

architecture Behavioral of D1_flipflop is

begin
process(clock,D1in)
	begin
	if (rising_edge(clock)) then
		if(reset = '1') then 
			Q1 <= '0';
		else
			Q1 <= D1in;
		end if;
	Q1not <= (not D1in);
	
end if;
end process;


end Behavioral;

