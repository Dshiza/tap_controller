-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tap_testbench is
end;

architecture bench of tap_testbench is

  component tap
  	port(
  	tms, tck, trst, tdi : in std_logic;
  	enable, sel, clock_dr, clock_ir, tdo : out std_logic
   );
  end component;

  signal tms, tck, trst, tdi: std_logic;
  signal enable, sel, clock_dr, clock_ir, tdo: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: tap port map ( tms      => tms,
                      tck      => tck,
                      trst     => trst,
                      tdi      => tdi,
                      enable   => enable,
                      sel      => sel,
                      clock_dr => clock_dr,
                      clock_ir => clock_ir,
                      tdo      => tdo );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      tck <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
