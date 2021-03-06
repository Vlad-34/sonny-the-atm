library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memorie2 is
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0); -- 00 - read carduri; 01 - read PIN-uri; 10 - read sume; 11 - write PIN-uri;
	mode2: in std_logic;
	valoareIn: in std_logic_vector(15 downto 0); -- valori pe 16 biti
	valoareIntermed: inout std_logic_vector(15 downto 0);
	valoareOut: out std_logic_vector(15 downto 0);
	ok: out std_logic); -- daca operatia se efectueaza cu succes);
end memorie2;

architecture comportamental of memorie2 is	  
type memory is array(0 to 11) of std_logic_vector(0 to 15);
signal memorie: memory := (
	"1001111010010011", "1011101000100010", "0110010100001010", "1111010000011100", -- carduri
	"1001011101010111", "1101000011001100", "0011101010001101", "1110001010011100", -- PIN-uri
	"0000101101001101", "0010101001001110", "0001000100010001", "0011100110100111"  -- sume
	);

begin
	
	process(clk)
	begin 
		
	if clk'event and clk = '1' then
		case mode is
			when "00" =>
			if valoareIn = memorie(0) then ok<='1';
			elsif valoareIn = memorie (1) then ok<='1';
			elsif valoareIn = memorie (2) then ok<='1';
			elsif valoareIn = memorie (3) then ok<='1';
			else ok <= '0';
			end if;
			
			when "01" =>   
			if valoareIn = memorie(4) then ok<='1';
			elsif valoareIn = memorie (5) then ok<='1';
			elsif valoareIn = memorie (6) then ok<='1';
			elsif valoareIn = memorie (7) then ok<='1';
			else ok <= '0';
			end if;
				
			when "10" =>
			if valoareIn = memorie(8) then ok<='1';
			elsif valoareIn = memorie (9) then ok<='1';
			elsif valoareIn = memorie (10) then ok<='1';
			elsif valoareIn = memorie (11) then ok<='1';
			else ok <= '0';
			end if;
			
			when others =>
				if mode2 = '0' then	
					if valoareIn = memorie(4) then memorie(4) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (5) then memorie(5) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (6) then memorie(6) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (7) then memorie(7) <= valoareIntermed; valoareOut <= valoareIntermed;
					end if;
				else
					if valoareIn = memorie(8) then memorie(8) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (9) then memorie(9) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (10) then memorie(10) <= valoareIntermed; valoareOut <= valoareIntermed;
					elsif valoareIn = memorie (11) then memorie(11) <= valoareIntermed; valoareOut <= valoareIntermed;
					end if;
				end if;	   
		end case;
	end if;

	end process;
end comportamental;
