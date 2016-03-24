-- ZALAMEDA, ANGELICA T.
-- ESPINELI, JARED A.
-- CMSC 132 T-4L
-- ASSIGNMENT 01

library IEEE;
use IEEE.std_logic_1164.all;

entity buzzers is
	port(alarm: out std_logic; INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean: in std_logic);
end entity;

architecture behav of buzzers is
	begin
		alarm <= (INBean and OUTBean) or (INBean and OUTBunce) or (INBean and OUTBoggis) or (INBunce and OUTBean) or (INBunce and OUTBunce) or (INBunce and OUTBoggis) or (INBoggis and OUTBean) or (INBoggis and OUTBunce) or (INBoggis and OUTBoggis);
end architecture behav;
