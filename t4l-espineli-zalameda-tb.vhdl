-- ZALAMEDA, ANGELICA T.
-- ESPINELI, JARED A.
-- CMSC 132 T-4L
-- ASSIGNMENT 01

library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_buzzers is  --creation of entity
	constant DELAY: time := 10 ns; --allows a time delay of 10 nanoseconds
end entity;

architecture tb_arch of tb_buzzers is --creation of architecture for test bench

	component buzzers is
			port(alarm: out std_logic; INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean: in std_logic);--same ports are used
	end component;
	
	signal alarm: std_logic; 
	signal INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean: std_logic;
	
begin --architecture

	uut: component buzzers port map (alarm, INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean);
	main: process is
	
			variable temp: unsigned(5 downto 0);
			variable expected_valid: std_logic;
			variable error_count: integer := 0;
			
	begin --process
	
		report "start simulation";
		
		for i in 0 to 63 loop --shows that their are 64 states considered
			temp := TO_UNSIGNED(i, 6);
			--assign each input a value from temp
			INBoggis <= temp(5);
			INBunce <= temp(4);
			INBean <= temp(3);
			OUTBoggis <= temp(2);
			OUTBunce <= temp(1);
			OUTBean <= temp(0);
			
			if(i <= 8 or i = 16 or i = 24 or i = 32 or i = 40 or i = 48 or i = 56) then -- values in the table in which the alarm if off
				expected_valid := '0';
			else expected_valid := '1'; -- values in the table in which the alarm is on
			end if;
			wait for DELAY;
			
			assert((expected_valid = alarm)) --assign expected_valid as the alarm
				report "ERROR: Expected Alarm " & std_logic'image(expected_valid) & " /= actual alarm " & std_logic'image(alarm); 
                --sends error report if expected alaram not equal to actual alarm
				
			if (expected_valid /= alarm) --if expected_valid /= alarm, error_count increments
				then error_count := error_count + 1;
			end if;
		end loop;
		
		wait for DELAY;
		assert (error_count = 0) --sends number of errors
			report "ERROR: There were " &
				integer'image(error_count) & " errors!";
			if(error_count = 0)
				then report "Simulation completed with NO errors."; --if their are no errors reported
			end if;
		wait;
		
	end process;
end architecture tb_arch;
