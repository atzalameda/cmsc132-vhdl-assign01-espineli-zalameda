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
			OUTBoggis <= temp(4);
			INBunce <= temp(3);
			OUTBunce <= temp(2);
			INBean <= temp(1);
			OUTBean <= temp(0);
			
			
	end process;
end architecture tb_arch;
