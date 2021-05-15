library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity sonny is
	port(clk, rst: in std_logic;
	input: in std_logic_vector(15 downto 0); 
	catod: out std_logic_vector(0 to 6);
	anod: out std_logic_vector(0 to 3);
	chitanta: out std_logic);
end sonny;

architecture structural of sonny is

component organigrama is
	port(clk, rst: in std_logic;
	card_valid, PIN_valid, fonduri_suficiente, chitanta, revenire_operatiuni: in std_logic;
	operatiune:	in bit_vector(0 to 1);
	LED_chitanta: out std_logic);
end component;

component afisor is
	port(valoare: in std_logic_vector(0 to 15);
		clk: in std_logic;
		clr: in std_logic;
		catod: out std_logic_vector(0 to 6);
		anod: out std_logic_vector(0 to 3));
end component;

component RAM is
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0); -- 00 - read carduri; 01 - read PIN-uri; 10 - read sume; 11 - write PIN-uri;
	valoare: inout std_logic_vector(0 to 15); -- valori pe 16 biti
	adresa: in std_logic_vector(0 to 3); -- 4 seturi de 3 campuri care se scriu pe 4 biti
	output: out std_logic);
end component;

component sumator is
	port(A, B: in std_logic_vector(0 to 15);
	S: out std_logic_vector(0 to 15));
end component;

component scazator is
	port(A, B: in std_logic_vector(0 to 15);
	S: out std_logic_vector(0 to 15));
end component;	

component comparator_egal is
	port(A, B: in std_logic_vector(0 to 15);
	rez: out std_logic);
end component; 

component comparator_mic is
	port(A, B: in std_logic_vector(0 to 15);
	rez: out std_logic);
end component;

begin

	-- your links here

end structural;
