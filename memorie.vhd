library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0); -- 00 - read carduri; 01 - read PIN-uri; 10 - read sume; 11 - write PIN-uri;
	valoare: inout std_logic_vector(0 to 15); -- valori pe 16 biti
	adresa: in std_logic_vector(0 to 3); -- 4 seturi de 3 campuri care se scriu pe 4 biti
	ok: inout std_logic; -- daca operatia se efectueaza cu succes
	id: inout integer);
end RAM;

architecture comportamental of RAM is	  
type memory is array(0 to 11) of std_logic_vector(0 to 15);
signal memorie: memory := (
	"1001111010010011", "1011101000100010", "0110010100001010", "1111010000011100", -- carduri
	"1001011101010111", "1101000011001100", "0011101010001101", "1110001010011100", -- PIN-uri
	"0000101101001101", "0010101001001110", "0011011010000100", "0011100110100111"  -- sume
	);

begin

	process(clk, mode, valoare, adresa)	  
	
	begin 
		
	ok <= '0'; -- returnam 1 pentru succes 
	if clk'event and clk = '1' then	
		case mode is
			when "00" => 
			if valoare = memorie(0) then ok<='1'; id<=0;
			elsif valoare = memorie (1) then ok<='1'; id<=1;
			elsif valoare = memorie (2) then ok<='1'; id<=2;
			elsif valoare = memorie (3) then ok<='1'; id<=3;
			end if;
			
			when "01" => 
			if valoare = memorie(id + 4) then ok <= '1';
			end if;
				
			when "10" =>
			if valoare = memorie(id + 8) then ok <= '1'; 
			end if;
			
			when "11" => 
			memorie(id + 4) <= valoare;
			ok<='1';
			
			when others => NULL;
		end case;
	end if;

	end process;
end comportamental;
