-- ZALAMEDA, ANGELICA T.
-- ESPINELI, JARED A.
-- CMSC 132 T-4L
-- ASSIGNMENT 01

library IEEE;
use IEEE.std_logic_1164.all;

entity buzzers is --creation of entity
	port(alarm: out std_logic; INBoggis, OUTBoggis, INBunce, OUTBunce, INBean, OUTBean: in std_logic); --constructing port for input and 														   output
end entity;

architecture behav of buzzers is --creation of archiecture for internal description of the circuit
	begin
		--used K-Map for simplification of table	
		alarm <= (INBean and OUTBean) or (OUTBunce and INBean) or (INBunce and OUTBean) or (INBunce and OUTBunce) or (OUTBoggis and INBean) or (OUTBoggis and INBunce) or (INBoggis and OUTBean) or (INBoggis and OUTBunce) or (INBoggis and OUTBoggis);

end architecture behav; --end of architecture
