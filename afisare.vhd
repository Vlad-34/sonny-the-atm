library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity afisare is
	port(valoare: in std_logic_vector(0 to 3);
	cifra_unitati, cifra_zeci, cifra_sute, cifra_mii: out std_logic_vector(0 to 6)); 
end afisare;

architecture comportamental of afisare is  
begin	
	process(valoare)
	variable valoare_intreaga: integer := to_integer(unsigned(valoare));  
	variable unitati: integer := valoare_intreaga mod 10;  
	variable zeci: integer := (valoare_intreaga / 10) mod 10;
	variable sute: integer := (valoare_intreaga / 100) mod 10;
	variable mii: integer := valoare_intreaga / 1000; 
	
	begin
		case unitati is
			when 0 => cifra_unitati <= "1111110"; -- 0
			when 1 => cifra_unitati <= "1100000"; -- 1
			when 2 => cifra_unitati <= "1011011"; -- 2
			when 3 => cifra_unitati <= "1110011"; -- 3
			when 4 => cifra_unitati <= "1100101"; -- 4
			when 5 => cifra_unitati <= "0110111"; -- 5
			when 6 => cifra_unitati <= "0111111"; -- 6   
			when 7 => cifra_unitati <= "1100010"; -- 7
			when 8 => cifra_unitati <= "1111111"; -- 8
			when 9 => cifra_unitati <= "1110111"; -- 9
			when others => cifra_unitati <= "0000000"; -- altele
		end case; 
		
		case zeci is
			when 0 => cifra_zeci <= "1111110"; -- 0
			when 1 => cifra_zeci <= "1100000"; -- 1
			when 2 => cifra_zeci <= "1011011"; -- 2
			when 3 => cifra_zeci <= "1110011"; -- 3
			when 4 => cifra_zeci <= "1100101"; -- 4
			when 5 => cifra_zeci <= "0110111"; -- 5
			when 6 => cifra_zeci <= "0111111"; -- 6   
			when 7 => cifra_zeci <= "1100010"; -- 7
			when 8 => cifra_zeci <= "1111111"; -- 8
			when 9 => cifra_zeci <= "1110111"; -- 9
			when others => cifra_zeci <= "0000000"; -- altele
		end case;	 
		
		case sute is
			when 0 => cifra_sute <= "1111110"; -- 0
			when 1 => cifra_sute <= "1100000"; -- 1
			when 2 => cifra_sute <= "1011011"; -- 2
			when 3 => cifra_sute <= "1110011"; -- 3
			when 4 => cifra_sute <= "1100101"; -- 4
			when 5 => cifra_sute <= "0110111"; -- 5
			when 6 => cifra_sute <= "0111111"; -- 6   
			when 7 => cifra_sute <= "1100010"; -- 7
			when 8 => cifra_sute <= "1111111"; -- 8
			when 9 => cifra_sute <= "1110111"; -- 9
			when others => cifra_sute <= "0000000"; -- altele
		end case;
		
		case mii is
			when 0 => cifra_mii <= "1111110"; -- 0
			when 1 => cifra_mii <= "1100000"; -- 1
			when 2 => cifra_mii <= "1011011"; -- 2
			when 3 => cifra_mii <= "1110011"; -- 3
			when 4 => cifra_mii <= "1100101"; -- 4
			when 5 => cifra_mii <= "0110111"; -- 5
			when 6 => cifra_mii <= "0111111"; -- 6   
			when 7 => cifra_mii <= "1100010"; -- 7
			when 8 => cifra_mii <= "1111111"; -- 8
			when 9 => cifra_mii <= "1110111"; -- 9
			when others => cifra_mii <= "0000000"; -- altele
		end case;
	end process;
end comportamental;
