----------------------------------------------------------------------------------
------------------------------------CONTROL UNIT----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity CU is
	port(
		CLK, CLR: IN STD_LOGIC;
		
		--CONTROL SIGNAL
		clear: OUT STD_LOGIC;
		sumload: OUT STD_LOGIC;
		ncount: OUT STD_LOGIC;
		nload: OUT STD_LOGIC;
		OutDone: OUT STD_LOGIC;
	
	--STATUS SIGNALS
		N0eq0: IN STD_LOGIC
	
	--PRIMARY DATAPATH OUTPUT
		--Done: OUT STD_LOGIC
		
	
	);
end CU;

architecture Behavioral of CU is
	type state_type is (ST0, ST1, ST2, ST3);
	signal PS, NS: state_type;
	signal controls: STD_LOGIC_VECTOR(4 downto 0);

begin
	--control signal assignment to controls
		clear <= controls(4);
		sumload<= controls(3);
		ncount<= controls(2);
		nload<= controls(1);
		OutDone<= controls(0);
		
		sync_proc: process(CLK, CLR, NS)
			begin 
				--async input
				if(CLR = '1') then 
					PS <= ST0;
				elsif(RISING_EDGE(CLK)) THEN 
					PS <= NS;
				end if;
		end process;
		
		comb_proc: process(PS, CLR, N0eq0)
			begin 
				case(PS) is
					when ST0 =>
						controls <= "-----";
						if(CLR = '0') then 
							NS <= ST1;
						else
							NS <= ST0;
						end if;
						
					when ST1 => 
						controls <= "10010";
						NS <= ST2;
					when ST2 => 
						controls <= "01100";
						NS <= ST3;
						
					when ST3 =>
						controls <= "-----";
						if(N0eq0 = '1') then
							controls(0) <= '1';
							NS <= ST3;
						else
							NS <= ST2;
						end if;
					
					
				end case;
				
		end process;


end Behavioral;

