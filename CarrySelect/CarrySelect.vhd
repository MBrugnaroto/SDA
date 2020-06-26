LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CarrySelect IS

PORT (
		ci1: IN STD_LOGIC;
		a1, b1: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		s1: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		cout1: OUT 	STD_LOGIC
		);
		
END CarrySelect;

ARCHITECTURE Struct OF CarrySelect IS
SIGNAL c1,c2: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL c3, c4, c5: STD_LOGIC_VECTOR (7 downto 0);

COMPONENT RippleCarry4bits

PORT (
		ci: IN STD_LOGIC;
		a, b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		s : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		cout: OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT Mux
		
PORT ( 
		sel: IN STD_LOGIC;
		a, b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);

END COMPONENT;

BEGIN 
					
	PET0: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(0), a(1) => a1(1), a(2) => a1(2), a(3) => a1(3), b(0) => b1(0), b(1) => b1(1), b(2) => b1(2), b(3) => b1(3), s(0) => c1(0), s(1) => c1(1), s(2) => c1(2), s(3) => c1(3), cout => c3(0));
	
	PET1: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(0), a(1) => a1(1), a(2) => a1(2), a(3) => a1(3), b(0) => b1(0), b(1) => b1(1), b(2) => b1(2), b(3) => b1(3), s(0) => c2(0), s(1) => c2(1), s(2) => c2(2), s(3) => c2(3), cout => c4(0));
	
	PET2: Mux
		PORT MAP (sel => ci1, a(0) => c1(0), a(1) => c1(1), a(2) => c1(2), a(3) => c1(3), b(0) => c2(0), b(1) => c2(1), b(2) => c2(2), b(3) => c2(3), y(0) => s1(0), y(1) => s1(1), y(2) => s1(2), y(3) => s1(3));
	
	c5(0) <= c3(0) or (c4(0) and ci1);
	
	PET3: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(4), a(1) => a1(5), a(2) => a1(6), a(3) => a1(7), b(0) => b1(4), b(1) => b1(5), b(2) => b1(6), b(3) => b1(7), s(0) => c1(4), s(1) => c1(5), s(2) => c1(6), s(3) => c1(7), cout => c3(1));
	
	PET4: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(4), a(1) => a1(5), a(2) => a1(6), a(3) => a1(7), b(0) => b1(4), b(1) => b1(5), b(2) => b1(6), b(3) => b1(7), s(0) => c2(4), s(1) => c2(5), s(2) => c2(6), s(3) => c2(7), cout => c4(1));
	
	PET5: Mux
		PORT MAP (sel => c5(0), a(0) => c1(4), a(1) => c1(5), a(2) => c1(6), a(3) => c1(7), b(0) => c2(4), b(1) => c2(5), b(2) => c2(6), b(3) => c2(7), y(0) => s1(4), y(1) => s1(5), y(2) => s1(6), y(3) => s1(7));
	
	c5(1) <= c3(1) or (c4(1) and ci1);
	
	PET6: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(8), a(1) => a1(9), a(2) => a1(10), a(3) => a1(11), b(0) => b1(8), b(1) => b1(9), b(2) => b1(10), b(3) => b1(11), s(0) => c1(8), s(1) => c1(9), s(2) => c1(10), s(3) => c1(11), cout => c3(2));
	
	PET7: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(8), a(1) => a1(9), a(2) => a1(10), a(3) => a1(11), b(0) => b1(8), b(1) => b1(9), b(2) => b1(10), b(3) => b1(11), s(0) => c2(8), s(1) => c2(9), s(2) => c2(10), s(3) => c2(11), cout => c4(2));
	
	PET8: Mux
		PORT MAP (sel => c5(1), a(0) => c1(8), a(1) => c1(9), a(2) => c1(10), a(3) => c1(11), b(0) => c2(8), b(1) => c2(9), b(2) => c2(10), b(3) => c2(11), y(0) => s1(8), y(1) => s1(9), y(2) => s1(10), y(3) => s1(11));
	
	c5(2) <= c3(2) or (c4(2) and ci1);
	
	PET9: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(12), a(1) => a1(13), a(2) => a1(14), a(3) => a1(15), b(0) => b1(12), b(1) => b1(13), b(2) => b1(14), b(3) => b1(15), s(0) => c1(12), s(1) => c1(13), s(2) => c1(14), s(3) => c1(15), cout => c3(3));
	
	PET10: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(12), a(1) => a1(13), a(2) => a1(14), a(3) => a1(15), b(0) => b1(12), b(1) => b1(13), b(2) => b1(14), b(3) => b1(15), s(0) => c2(12), s(1) => c2(13), s(2) => c2(14), s(3) => c2(15), cout => c4(3));
	
	PET11: Mux
		PORT MAP (sel => c5(2), a(0) => c1(12), a(1) => c1(13), a(2) => c1(14), a(3) => c1(15), b(0) => c2(12), b(1) => c2(13), b(2) => c2(14), b(3) => c2(15), y(0) => s1(12), y(1) => s1(13), y(2) => s1(14), y(3) => s1(15));
	
	c5(3) <= c3(3) or (c4(3) and ci1);
	
	PET12: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(16), a(1) => a1(17), a(2) => a1(18), a(3) => a1(19), b(0) => b1(16), b(1) => b1(17), b(2) => b1(18), b(3) => b1(19), s(0) => c1(16), s(1) => c1(17), s(2) => c1(18), s(3) => c1(19), cout => c3(4));
	
	PET13: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(16), a(1) => a1(17), a(2) => a1(18), a(3) => a1(19), b(0) => b1(16), b(1) => b1(17), b(2) => b1(18), b(3) => b1(19), s(0) => c2(16), s(1) => c2(17), s(2) => c2(18), s(3) => c2(19), cout => c4(4));
	
	PET14: Mux
		PORT MAP (sel => c5(3), a(0) => c1(16), a(1) => c1(17), a(2) => c1(18), a(3) => c1(19), b(0) => c2(16), b(1) => c2(17), b(2) => c2(18), b(3) => c2(19), y(0) => s1(16), y(1) => s1(17), y(2) => s1(18), y(3) => s1(19));
	
	c5(4) <= c3(4) or (c4(4) and ci1);
	
	PET15: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(20), a(1) => a1(21), a(2) => a1(22), a(3) => a1(23), b(0) => b1(20), b(1) => b1(21), b(2) => b1(22), b(3) => b1(23), s(0) => c1(20), s(1) => c1(21), s(2) => c1(22), s(3) => c1(23), cout => c3(5));
	
	PET16: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(20), a(1) => a1(21), a(2) => a1(22), a(3) => a1(23), b(0) => b1(20), b(1) => b1(21), b(2) => b1(22), b(3) => b1(23), s(0) => c2(20), s(1) => c2(21), s(2) => c2(22), s(3) => c2(23), cout => c4(5));
	
	PET17: Mux
		PORT MAP (sel => c5(4), a(0) => c1(20), a(1) => c1(21), a(2) => c1(22), a(3) => c1(23), b(0) => c2(20), b(1) => c2(21), b(2) => c2(22), b(3) => c2(23), y(0) => s1(20), y(1) => s1(21), y(2) => s1(22), y(3) => s1(23));
	
	c5(5) <= c3(5) or (c4(5) and ci1);
	
	PET18: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(24), a(1) => a1(25), a(2) => a1(26), a(3) => a1(27), b(0) => b1(24), b(1) => b1(25), b(2) => b1(26), b(3) => b1(27), s(0) => c1(24), s(1) => c1(25), s(2) => c1(26), s(3) => c1(27), cout => c3(6));
	
	PET19: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(24), a(1) => a1(25), a(2) => a1(26), a(3) => a1(27), b(0) => b1(24), b(1) => b1(25), b(2) => b1(26), b(3) => b1(27), s(0) => c2(24), s(1) => c2(25), s(2) => c2(26), s(3) => c2(27), cout => c4(6));
	
	PET20: Mux
		PORT MAP (sel => c5(5), a(0) => c1(24), a(1) => c1(25), a(2) => c1(26), a(3) => c1(27), b(0) => c2(24), b(1) => c2(25), b(2) => c2(26), b(3) => c2(27), y(0) => s1(24), y(1) => s1(25), y(2) => s1(26), y(3) => s1(27));
	
	c5(6) <= c3(6) or (c4(6) and ci1);
	
	PET21: RippleCarry4bits
		PORT MAP (ci => '0', a(0) => a1(28), a(1) => a1(29), a(2) => a1(30), a(3) => a1(31), b(0) => b1(28), b(1) => b1(29), b(2) => b1(30), b(3) => b1(31), s(0) => c1(28), s(1) => c1(29), s(2) => c1(30), s(3) => c1(31), cout => c3(7));
	
	PET22: RippleCarry4bits
		PORT MAP (ci => '1', a(0) => a1(28), a(1) => a1(29), a(2) => a1(30), a(3) => a1(31), b(0) => b1(28), b(1) => b1(29), b(2) => b1(30), b(3) => b1(31), s(0) => c2(28), s(1) => c2(29), s(2) => c2(30), s(3) => c2(31), cout => c4(7));
	
	PET: Mux
		PORT MAP (sel => c5(6), a(0) => c1(28), a(1) => c1(29), a(2) => c1(30), a(3) => c1(31), b(0) => c2(28), b(1) => c2(29), b(2) => c2(30), b(3) => c2(31), y(0) => s1(28), y(1) => s1(29), y(2) => s1(30), y(3) => s1(31));
	
	c5(7) <= c3(7) or (c4(7) and ci1);
	
	
END Struct;