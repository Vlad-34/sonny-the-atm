library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memorie is
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0); -- 00 - read carduri; 01 - read PIN-uri; 10 - read sume; 11 - write PIN-uri;
	mode2: in std_logic;
	valoare: inout std_logic_vector(15 downto 0); -- valori pe 16 biti
	ok: out std_logic); -- daca operatia se efectueaza cu succes);
end memorie;

architecture comportamental of memorie is	  
type memory is array(0 to 11) of std_logic_vector(0 to 15);
signal memorie: memory := (
	"1001111010010011", "1011101000100010", "0110010100001010", "1111010000011100", -- carduri
	"1001011101010111", "1101000011001100", "0011101010001101", "1110001010011100", -- PIN-uri
	"0000101101001101", "0010101001001110", "0001000100010001", "0011100110100111"  -- sume
	);

begin
	
	process(clk, mode, valoare)	  
	variable id: integer:=0;
	begin 
		
	ok <= '0'; -- returnam 1 pentru succes 
	if clk'event and clk = '1' then	
		case mode is
			when "00" =>
			if valoare = memorie(0) then ok<='1'; id:=0;
			elsif valoare = memorie (1) then ok<='1'; id:=1;
			elsif valoare = memorie (2) then ok<='1'; id:=2;
			elsif valoare = memorie (3) then ok<='1'; id:=3;
			end if;
			
			when "01" => 
			if valoare = memorie(id + 4) then ok <= '1';
			end if;
				
			when "10" =>
			if valoare = memorie(id + 8) then ok <= '1'; 
			end if;
			
			when "11" => 	
				if mode2 = '0' then
					memorie(id + 4) <= valoare;
				else
					memorie(id + 8) <= valoare;
				end if;	   
				ok<='1';
			when others => NULL;
		end case;
	end if;

	end process;
end comportamental;
