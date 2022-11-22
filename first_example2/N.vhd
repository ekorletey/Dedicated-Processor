----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:58:07 10/24/2022 
-- Design Name: 
-- Module Name:    N - Behavioral 
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

entity NREG is PORT(
CLOCK : in std_logic;
nCount : in std_logic;
nload : in std_logic;
Input_n : in std_logic_vector(7 downto 0);
Q : out std_logic_vector(7 downto 0));
end NREG;

architecture Behavioral of NREG is

signal Q_temp: std_logic_vector( 7 downto 0);

begin
Q <= Q_temp;
process (clock) is
begin 
  if (rising_edge(clock)) then 
    if(nload = '1') then 
	  Q_temp<= Input_n; 
	  elsif (ncount = '1') then 
	  Q_temp <= Q_temp - 1;
	  end if;
	 end if;
end process;
end Behavioral;

