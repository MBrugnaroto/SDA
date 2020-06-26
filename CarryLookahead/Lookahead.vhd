library ieee;
use ieee.std_logic_1164.all;

entity Lookahead is
	generic (N: integer := 32);
	port(
		a: in std_logic_vector (N-1 downto 0);
		b: in std_logic_vector (N-1 downto 0);
		s: out std_logic_vector (N-1 downto 0);
		clock: in std_logic;
		cin: in std_logic;
		cout: out std_logic
		);
end Lookahead;

architecture struct of Lookahead is
signal c: std_logic_vector (N-1 downto 0);
signal p: std_logic_vector (N-1 downto 0);
signal g: std_logic_vector (N-1 downto 0);
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
		
	PET2: reg32
		port map	(d => fio_s, clk => clock, q => s);
      	
	fio_s(0) <= fio_a(0) xor fio_b(0) xor cin;
	p(0) <= fio_a(0) or fio_b(0);
	c(0) <= cin;
	g(0) <= fio_a(0) and fio_b(0);
	
	
	first: 
			 for i in 1 to N-1 generate 
				fio_s(i) <= fio_a(i) xor fio_b(i) xor c(i);
				p(i) <= fio_a(i) or fio_b(i);
				g(i) <= fio_a(i) and fio_b(i);
				c(i) <= g(i-1) or (p(i-1) and c(i-1)); 
			 end generate;
			cout <= c(N-1); 
end struct;