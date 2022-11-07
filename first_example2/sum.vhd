----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:21 10/24/2022 
-- Design Name: 
-- Module Name:    sum - Behavioral 
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

entity sum is PORT(
clock : IN STD_LOGIC;
clear : IN STD_LOGIC;
sumload : in STD_LOGIC;
D : IN STD_LOGIC_vector(7 DOWNTO 0);
Q : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0));

end sum;


architecture Behavioral of sum is

begin

process( clock, clear) is
BEGIN
if (clear = '1') then 
 Q <=(others =>'0');
 elsif(rising_edge(clock)) then 
 Q <= D;
 end if;
 END PROCESS;
 
end Behavioral;

