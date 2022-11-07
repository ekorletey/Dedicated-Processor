----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:14 10/25/2022 
-- Design Name: 
-- Module Name:    D0_flipflop - Behavioral 
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

entity D0_flipflop is PORT(
  Clock : IN STD_LOGIC;
  D0in : IN STD_LOGIC;
  reset : IN STD_LOGIC;
  Q0 :OUT STD_LOGIC;
  Q0not : OUT STD_LOGIC
);
end D0_flipflop;

architecture Behavioral of D0_flipflop is

begin
process(clock,D0in)
	begin
	if (rising_edge(clock)) then
		if(reset = '1') then 
			Q0 <= '0';
		else
			Q0 <= D0in;
		end if;
	Q0not <= (not D0in);
	
end if;
end process;

end Behavioral;

