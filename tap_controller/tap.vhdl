library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity tap is
	port(
	tms, tck, trst, tdi : in std_logic;
	enable, sel, clock_dr, clock_ir, tdo : out std_logic --update_dr, update_ir, shift_dr, shift_ir, 
 );

end tap;


ARCHITECTURE behaviour of tap is

signal state, test_logic_reset, idle, select_dr_scan, select_ir_scan, capture_ir, shift_ir, exit1_ir, pause_ir, exit2_ir,
		update_ir, capture_dr, shift_dr, exit1_dr, pause_dr, exit2_dr, update_dr : std_logic;

BEGIN

clock: process(tck)
begin

		-- test logic reset state
	if rising_edge(tck) and state = test_logic_reset then
		if tms = '1' then 
			state <= test_logic_reset;
		else
			state <= idle; -- run-test/idle
		end if;
	end if;
	
	
	--  run-test/idle state
	if rising_edge(tck) and state = idle then
		if tms = '1' then 
			state <= select_dr_scan;
		else
			state <= idle; -- run-test/idle
		end if;
	end if;
	
		
	
		--  select-dr-scan state
	if rising_edge(tck) and state = select_dr_scan then
		if tms = '1' then 
			state <= select_ir_scan;
		else
			state <= select_dr_scan; -- 
		end if;
	end if;
	
	
	
		
		
	
		--  select-ir-scan state
	if rising_edge(tck) and state = select_ir_scan then
		if tms = '1' then 
			state <= test_logic_reset;
		else
			state <= capture_ir; -- 
		end if;
	end if;
	
	
		
		
	
		--  capture-ir state
	if rising_edge(tck) and state = capture_ir then
		if tms = '1' then 
			state <= exit1_ir;
		else
			state <= shift_ir; -- 
		end if;
	end if;
	
		
		
	
		--  shift-ir state
	if rising_edge(tck) and state = shift_ir then
		if tms = '1' then 
			state <= exit1_ir;
		else
			state <= shift_ir; -- 
		end if;
	end if;
	
	
		
		
	
		--  exit1-ir state
	if rising_edge(tck) and state = exit1_ir then
		if tms = '1' then 
			state <= update_ir;
		else
			state <= pause_ir; -- 
		end if;
	end if;
	
	
		
		
	
		--  pause-ir state
	if rising_edge(tck) and state = pause_ir then
		if tms = '1' then 
			state <= exit2_ir;
		else
			state <= pause_ir; -- 
		end if;
	end if;
	
		
		
	
		--  exit2-ir state
	if rising_edge(tck) and state = exit2_ir then
		if tms = '1' then 
			state <= update_ir;
		else
			state <= shift_ir; -- run-test/idle
		end if;
	end if;
	
	
		
		
	
		--  update-ir state
	if rising_edge(tck) and state = update_ir then
		if tms = '1' then 
			state <= select_dr_scan;
		else
			state <= idle; -- goes back to idle
		end if;
	end if;
	
	 -- done instruction register of diagram on top
	
	-- Data register diagram
	  -- capture-dr-scan state

	if rising_edge(tck) and state = capture_dr then
		if tms = '1' then 
			state <= exit1_dr;
		else
			state <= shift_dr; -- run-test/idle
		end if;
	end if;
	
	
	 -- shift-dr state

	if rising_edge(tck) and state = shift_dr then
		if tms = '1' then 
			state <= exit1_dr;
		else
			state <= shift_dr; -- run-test/idle
		end if;
	end if;
	
	
	
	
	 -- exit1-dr state

	if rising_edge(tck) and state = exit1_dr then
		if tms = '1' then 
			state <= update_dr;
		else
			state <= pause_dr; -- run-test/idle
		end if;
	end if;
	
	
	 -- pause-dr state 

	if rising_edge(tck) and state = pause_dr then
		if tms = '1' then 
			state <= exit2_dr;
		else
			state <= pause_dr; -- stays in pause-dr
		end if;
	end if;
	
	
	 -- exit2-dr state

	if rising_edge(tck) and state = exit2_dr then
		if tms = '1' then 
			state <= update_dr;
		else
			state <= shift_dr; -- goes back to shift-dr state
		end if;
	end if;
	
	
	
	 -- update-dr state

	if rising_edge(tck) and state = update_dr then
		if tms = '1' then 
			state <= select_dr_scan;
		else
			state <= idle; -- run-test/idle
		end if;
	end if;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end process;


end behaviour;