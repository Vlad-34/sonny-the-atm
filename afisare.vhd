library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity afisare is
	port(valoare: in std_logic_vector(0 to 3);
	afisor: out std_logic_vector(0 to 3);
	cifra: out std_logic_vector(0 to 6));
end afisare;

architecture comportamental of afisare is
begin
	afisor <= "1111"; -- setam afisorul pe inactiv
	process(valoare)
	begin
		case valoare is
			when "0000" =>
				cifra <= "0000001"; -- "0" 
			when "0001" =>
				cifra <= "0011111"; -- "1"
			when "0010" =>
				cifra <= "0100100"; -- "2"
			when "0011" =>
				cifra <= "0001100"; -- "3"
			when "0100" =>
				cifra <= "0011010"; -- "4"
			when "0101" =>
				cifra <= "1001000"; -- "5"	
			when "0110" =>
				cifra <= "1000000"; -- "6"	
			when "0111" =>
				cifra <= "0011101"; -- "7"
			when "1000" =>
				cifra <= "0000001"; -- "8"
			when "1001" =>
				cifra <= "0001000"; -- "9"
			when others =>
				cifra <= "1111111"; -- altele
		end case;
	end process;
end comportamental;


