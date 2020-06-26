LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_unsigned.all;

ENTITY macrofunction IS

PORT (

        a, b: IN STD_LOGIC_VECTOR (31 downto 0);
        s : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        clock : in std_logic
        );

END macrofunction;

architecture hardware of macrofunction is
signal fio_a: std_LOGIC_VECTOR(31 downto 0);
signal fio_b: std_LOGIC_VECTOR(31 downto 0);
signal fio_s: std_LOGIC_VECTOR(31 downto 0);

component reg32 
generic (length : integer := 32);
port(
	d : in std_logic_vector(length - 1 downto 0);
	clk: in std_logic;
	q: out std_logic_vector(length - 1 downto 0)
);

end component;

begin
		PET0: reg32
		port map (d => a, clk => clock, q => fio_a);
		
		PET1: reg32
		port map (d => b, clk => clock, q => fio_b);
      
		fio_s <= fio_a + fio_b;
		
		PET2: reg32
		port map	(d => fio_s, clk => clock, q => s);
					 
end hardware;