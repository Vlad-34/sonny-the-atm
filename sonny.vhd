library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;  
library work;
use work.pachet_stari.all;

entity sonny2 is
	port(clk, rst: in std_logic;
	card: in std_logic_vector(15 downto 0);
	PIN: in std_logic_vector(15 downto 0);
	operatie: in std_logic_vector(1 downto 0); -- cele 4 ramuri
	PIN_nou: in std_logic_vector(15 downto 0);
	fonduri: in std_logic_vector(15 downto 0); -- din bancomat
	fonduri_persoana: in std_logic_vector(15 downto 0); -- input de la utilizator pentru depunere/ retragere
	catod: out std_logic_vector(6 downto 0);
	anod: out std_logic_vector(3 downto 0);
	chitantaIn: in std_logic;
	chitantaOut: out std_logic;
	alta_operatiune: in std_logic); -- jump la cele 4 ramuri
end sonny2;

architecture structural2 of sonny is

component organigrama
	port(clk, rst: in std_logic;
	card_valid, PIN_valid, fonduri_suficiente, chitanta, revenire_operatiuni: in std_logic;
	operatiune:	in std_logic_vector(1 downto 0);
	LED_chitanta: out std_logic;
	stare_curenta: in type_states);
end component;

component afisor
	port(clk: in std_logic;
	valoare: in std_logic_vector(15 downto 0);
	catod: out std_logic_vector(6 downto 0);
	anod: out std_logic_vector(3 downto 0));
end component;

component memorie
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0); -- 00 - read carduri; 01 - read PIN-uri; 10 - read sume; 11 - write PIN-uri;
	mode2: in std_logic;
	valoare: inout std_logic_vector(15 downto 0); -- valori pe 16 biti
	ok: out std_logic); -- daca operatia se efectueaza cu succes;
end component;

component sumator
	port(A, B: in std_logic_vector(15 downto 0);
	S: out std_logic_vector(15 downto 0));
end component;

component scazator
	port(A, B: in std_logic_vector(15 downto 0);
	D: out std_logic_vector(15 downto 0));
end component;	

component comparator_mic
	port(A, B: in std_logic_vector(15 downto 0);
	rez: out std_logic);
end component;

signal card_valid: std_logic; 
signal PIN_valid: std_logic;  
signal fonduri_suficiente: std_logic;
signal card_semnal: std_logic_vector(15 downto 0); 
signal PIN_semnal: std_logic_vector(15 downto 0);
signal stare_curenta: type_states;
signal val_de_afisat: std_logic_vector(15 downto 0);
signal PIN_nou_semnal: std_logic_vector(15 downto 0);
signal suma_dupa_depunere: std_logic_vector(15 downto 0); --
signal suma_dupa_retragere: std_logic_vector(15 downto 0); --

begin
	process(card, PIN)
	begin
		card_semnal <= card;
		PIN_semnal <= PIN;
		card_valid <= '0';
		PIN_valid <= '0';
		fonduri_suficiente <= '0';
		stare_curenta <= introducere_card;
		PIN_nou_semnal <= PIN_nou;	
	end process;

	memory1: memorie port map(clk, "00", '0', card_semnal, card_valid); -- daca cardul e valid 
	memory2: memorie port map(clk, "01", '0', PIN_semnal, PIN_valid); -- daca PIN-ul e valid
	organigrama1: organigrama port map(clk, rst, card_valid, PIN_valid, fonduri_suficiente, chitantaIn, alta_operatiune, operatie, chitantaOut, stare_curenta);	-- organigrama stare_curenta
	memory3: memorie port map(clk, "10", '0',val_de_afisat); -- citire suma din memorie
	afisare: afisor port map(clk, val_de_afisat, catod, anod); -- afisare
	memory4: memorie port map(clk, "11", '0',PIN_nou_semnal);  -- suprascriere PIN 
	adder: sumator port map(fonduri, fonduri_persoana, suma_dupa_depunere); -- depunere
	memory5: memorie port map(clk, "11", '1',suma_dupa_depunere);-- suprascriere suma dupa depunere
	comparator: comparator_mic port map (fonduri_persoana, fonduri, fonduri_suficiente); -- daca sunt fonduri in bancomat
	substractor: scazator port map(fonduri, fonduri_persoana, suma_dupa_retragere); -- retragere
	memor6: memorie port map(clk, "11", '1', suma_dupa_retragere);-- suprascriere suma retragere
	-- unitatea de control (organigrama) coordoneaza toate celelalte functii				 
	
end structural2;
