----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:53 10/25/2022 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is PORT(
clock : IN STD_LOGIC;
N0eq0 : IN STD_LOGIC;
resetMain : IN STD_LOGIC;
nLoad : OUT STD_LOGIC;
nCount : OUT STD_LOGIC;
clear : OUT STD_LOGIC;
sumload : OUT STD_LOGIC;
OutEn : OUT STD_LOGIC);



end control_unit;

architecture Behavioral of control_unit is

SIGNAL Qtemp : STD_LOGIC;
SIGNAL Qnottemp : STD_LOGIC;
SIGNAL Q1temp : STD_LOGIC;
SIGNAL Q1nottemp : STD_LOGIC;
SIGNAL Q0temp : STD_LOGIC;
SIGNAL Q0nottemp : STD_LOGIC;
SIGNAL resettemp : STD_LOGIC;
	
	COMPONENT D_flipflop PORT (
	Clock : IN STD_LOGIC;
  Din : IN STD_LOGIC;
  reset : IN STD_LOGIC;
  Q :OUT STD_LOGIC;
  Qnot : OUT STD_LOGIC
	);
end component;

	COMPONENT D1_flipflop is PORT(
  Clock : IN STD_LOGIC;
  D1in : IN STD_LOGIC;
  Q1 :OUT STD_LOGIC;
  reset : IN STD_LOGIC;
  Q1not : OUT STD_LOGIC
   );
  end component;
  
	COMPONENT D0_flipflop is PORT(
  Clock : IN STD_LOGIC;
  D0in : IN STD_LOGIC;
  reset : IN STD_LOGIC;
  Q0 :OUT STD_LOGIC;
  Q0not : OUT STD_LOGIC
);
 end component;
 
 signal tempD2 :STD_LOGIC;
 SIGNAL tempD1in : STD_LOGIC;
 SIGNAL tempD0in : STD_LOGIC;
 
 
begin
  FLipflop :  D_flipflop PORT MAP(
  CLOCK => CLOCK,
  Din => tempD2,
  reset => resettemp,
  Q => Qtemp,
  Qnot => Qnottemp
  );
  
  FLipflop1 :  D0_flipflop PORT MAP(
  CLOCK => CLOCK,
  D0in => tempD1in,
  reset => resettemp,
  Q0 => Q0temp,
  Q0not => Q0nottemp
  );
  
  FLipflop2 :  D1_flipflop PORT MAP(
  CLOCK => CLOCK,
  D1in => tempD0in,
  reset => resettemp,
  Q1 => Q1temp,
  Q1not => Q1nottemp
  );
  
  
	tempD2 <= ((Qnottemp) and (Q1temp) and (Q0temp))	OR ((Qnottemp) and (Q1temp) and (not N0eq0)) OR ((Qtemp) and (Q1nottemp) and (Q0temp)) OR ((Qtemp) and (Q1nottemp) and (not N0eq0));
	tempD1in <= ((Qtemp) and (Q1nottemp) and (Q0temp)) or ((Qnottemp) and (Q1nottemp) and (Q0nottemp) and (N0eq0)) or ((Qtemp) and (Q1nottemp) and (Q0nottemp) and (N0eq0));
	tempD0in <= ((Qnottemp) and (Q0nottemp)) or ((Qtemp) and (Q1nottemp)) OR ((Q1nottemp) and (Q0nottemp));

	--(Qtemp and Q1nottemp and Q0nottemp) => OutEn;
	OutEn <= (Qtemp and Q1nottemp and Q0nottemp);
	nLoad <=(Q0nottemp and Q1temp and Qnottemp);
	nCount <= (Q0nottemp and Q1nottemp and Qtemp) ;
	sumload <= (Q0temp and Q1temp and Qnottemp);
	clear <= (Q0nottemp and Q1nottemp and Qnottemp);
	resettemp <= resetMain;

end Behavioral;

