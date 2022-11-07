----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:45 10/25/2022 
-- Design Name: 
-- Module Name:    D_flipflop - Behavioral 
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

entity D_flipflop is PORT(
  Clock : IN STD_LOGIC;
  Din : IN STD_LOGIC;
  reset : IN STD_LOGIC;
  Q :OUT STD_LOGIC;
  Qnot : OUT STD_LOGIC
);
end D_flipflop;

architecture Behavioral of D_flipflop is

begin
process(clock,Din)
	begin
	if (rising_edge(clock)) then
		if(reset = '1') then 
			Q <= '0';
		else
			Q <= Din;
		end if;
	Qnot <= (not Din);
	
end if;
end process;


end Behavioral;

