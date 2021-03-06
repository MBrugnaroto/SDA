LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS

PORT ( 
		 sel: IN STD_LOGIC;
		 a, b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);

END mux;

ARCHITECTURE Struct OF mux IS

BEGIN
WITH sel SELECT
	y <= a WHEN '0',
		  b WHEN '1';
END Struct;