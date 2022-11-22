----------------------------------------------------------------------------------
-------------------------------------TOP LEVEL------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity TOP is
	port(
			INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
			CLR, CLK: IN STD_LOGIC;
			DONE: OUT STD_LOGIC;
			OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
end TOP;


--architecture
architecture Structural of TOP is
	--internal signals
	signal clearsig, sumloadsig, ncountsig, nloadsig, outdonesig, N0eq0status: STD_LOGIC; 
	
	
	
	--component declaration
	component CU
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
		
		);
	end component;
	
	component Example1
		port(
				
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
		
	end component;

begin
	CU1: CU port map(
			CLK => CLK,
			CLR => CLR,
		
			--CONTROL SIGNAL
			clear => clearsig,
			sumload => sumloadsig,
			ncount => ncountsig,
			nload => nloadsig,
			OutDone => outdonesig,
		
		--STATUS SIGNALS
			N0eq0 => N0eq0status
	
	);
	
	
	DP1: Example1 port map(
		CLOCK => CLK,

		--PRIMARY DATAPATH INPUT
		Input => INPUT,
		
		--CONTROL SIGNAL
		clear => clearsig,
		sumload => sumloadsig,
		ncount => ncountsig,
		nload => nloadsig,
		OutDone => outdonesig,
		
		--STATUS SIGNALS
		N0eq0 => N0eq0status,
		
		--PRIMARY DATAPATH OUTPUT
		Done => DONE,
		OUTPUT => OUTPUT
	
	);


end Structural;

