----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:28:30 10/24/2022 
-- Design Name: 
-- Module Name:    addition - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addition is PORT(
INPUT_1 : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
INPUT_2 : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
ADDOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end addition;

architecture Behavioral of addition is

begin

--ADDOUT <= (INPUT_1 + INPUT_2) when (INPUT_1 + INPUT_2) = ;

ADDOUT <= "UUUUUUUU" when (INPUT_1 OR INPUT_2) = "UUUUUUUU" else (INPUT_1 + INPUT_2);

end Behavioral;

