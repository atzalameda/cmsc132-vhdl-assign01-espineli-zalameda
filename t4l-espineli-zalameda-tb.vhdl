-- ZALAMEDA, ANGELICA T.
-- ESPINELI, JARED A.
-- CMSC 132 T-4L
-- ASSIGNMENT 01

library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_buzzers is
	constant DELAY: time := 10 ns;
end entity;

architecture tb_arch of tb_buzzers is

	component buzzers is
			port(alarm: out std_logic; INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean: in std_logic);
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
		
		for i in 0 to 63 loop
			temp := TO_UNSIGNED(i, 6);
			--assign each input a value from temp
			INBoggis <= temp(5);
			INBunce <= temp(4);
			INBean <= temp(3);
			OUTBoggis <= temp(2);
			OUTBunce <= temp(1);
			OUTBean <= temp(0);
			
			if(i <= 8 or i = 16 or i = 24 or i = 32 or i = 40 or i = 48 or i = 56) then 
				expected_valid := '0';
			else expected_valid := '1';
			end if;
			wait for DELAY;
			
			assert((expected_valid = alarm))
				report "ERROR: Expected Alarm " & std_logic'image(expected_valid) & " /= actual alarm " & std_logic'image(alarm);
				
			if (expected_valid /= alarm)
				then error_count := error_count + 1;
			end if;
		end loop;
		
	end process;
end architecture tb_arch;
