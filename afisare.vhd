library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity afisare is
	port(valoare: in std_logic_vector(15 downto 0);
	cifra_unitati, cifra_zeci, cifra_sute, cifra_mii: inout std_logic_vector(6 downto 0);
	testvar: out integer); -- test port
end afisare;

architecture comportamental of afisare is  
begin	
	process(valoare)
	variable valoare_intreaga: integer := conv_integer(valoare);  
	variable unitati: integer := valoare_intreaga mod 10;  
	variable zeci: integer := (valoare_intreaga / 10) mod 10;
	variable sute: integer := (valoare_intreaga / 100) mod 10;
	variable mii: integer := valoare_intreaga / 1000; 
	
	begin
	testvar <= valoare_intreaga; -- test signal
		case unitati is
			when 0 => cifra_unitati <= "1111110"; -- 0 -- 7E
			when 1 => cifra_unitati <= "1100000"; -- 1 -- 60
			when 2 => cifra_unitati <= "1011011"; -- 2 -- 5B
			when 3 => cifra_unitati <= "1110011"; -- 3 -- 73
			when 4 => cifra_unitati <= "1100101"; -- 4 -- 65
			when 5 => cifra_unitati <= "0110111"; -- 5 -- 37
			when 6 => cifra_unitati <= "0111111"; -- 6 -- 3F 
			when 7 => cifra_unitati <= "1100010"; -- 7 -- 62
			when 8 => cifra_unitati <= "1111111"; -- 8 -- 7F
			when 9 => cifra_unitati <= "1110111"; -- 9 -- 77
			when others => cifra_unitati <= "0000000"; -- altele -- 00
		end case; 
		
		case zeci is
			when 0 => cifra_zeci <= "1111110"; -- 0 -- 7E
			when 1 => cifra_zeci <= "1100000"; -- 1	-- 60
			when 2 => cifra_zeci <= "1011011"; -- 2	-- 5B
			when 3 => cifra_zeci <= "1110011"; -- 3	-- 73
			when 4 => cifra_zeci <= "1100101"; -- 4	-- 65
			when 5 => cifra_zeci <= "0110111"; -- 5	-- 37
			when 6 => cifra_zeci <= "0111111"; -- 6 -- 3F 
			when 7 => cifra_zeci <= "1100010"; -- 7	-- 62
			when 8 => cifra_zeci <= "1111111"; -- 8	-- 7F
			when 9 => cifra_zeci <= "1110111"; -- 9 -- 77
			when others => cifra_zeci <= "0000000"; -- altele -- 00
		end case;	 
		
		case sute is
			when 0 => cifra_sute <= "1111110"; -- 0	-- 7E
			when 1 => cifra_sute <= "1100000"; -- 1	-- 60
			when 2 => cifra_sute <= "1011011"; -- 2	-- 5B
			when 3 => cifra_sute <= "1110011"; -- 3	-- 73
			when 4 => cifra_sute <= "1100101"; -- 4	-- 65
			when 5 => cifra_sute <= "0110111"; -- 5	-- 37
			when 6 => cifra_sute <= "0111111"; -- 6 -- 3F  
			when 7 => cifra_sute <= "1100010"; -- 7	-- 62
			when 8 => cifra_sute <= "1111111"; -- 8	-- 7F
			when 9 => cifra_sute <= "1110111"; -- 9 -- 77
			when others => cifra_sute <= "0000000"; -- altele -- 00
		end case;
		
		case mii is
			when 0 => cifra_mii <= "1111110"; -- 0 -- 7E
			when 1 => cifra_mii <= "1100000"; -- 1 -- 60
			when 2 => cifra_mii <= "1011011"; -- 2 -- 5B
			when 3 => cifra_mii <= "1110011"; -- 3 -- 73
			when 4 => cifra_mii <= "1100101"; -- 4 -- 65
			when 5 => cifra_mii <= "0110111"; -- 5 -- 37
			when 6 => cifra_mii <= "0111111"; -- 6 -- 3F  
			when 7 => cifra_mii <= "1100010"; -- 7 -- 62
			when 8 => cifra_mii <= "1111111"; -- 8 -- 7F
			when 9 => cifra_mii <= "1110111"; -- 9 -- 77
			when others => cifra_mii <= "0000000"; -- altele -- 00
		end case;
	end process;
end comportamental;
