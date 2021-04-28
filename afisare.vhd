library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity afisor is
	port(valoare: in std_logic_vector(0 to 15);
		clk: in std_logic;
		clr: in std_logic;
		catod: out std_logic_vector(0 to 6);
		anod: out std_logic_vector(0 to 3));
end entity;

architecture comportamental of afisor is
	signal sel: std_logic_vector(0 to 1); -- selectie
	signal cifra: std_logic_vector(0 to 3); -- valoare afisor
	signal clk_div: std_logic_vector(0 to 15); -- divizor de frecventa 
	
begin
	sel <= clk_div(14 to 15); -- selectia
	process(sel, valoare)
	begin
		case sel is
			when "00" => cifra <= valoare(0 to 3);
			when "01" => cifra <= valoare(4 to 7);
			when "10" => cifra <= valoare(8 to 11);
			when others => cifra <= valoare(12 to 15);
		end case;
	end process;
	
	process(cifra)
	begin
		case cifra is
			when "0000" => catod  <= "1111110"; -- 0 -- 7E
			when "0001" => catod  <= "1100000"; -- 1 -- 60
			when "0010" => catod  <= "1011011"; -- 2 -- 5B
			when "0011" => catod  <= "1110011"; -- 3 -- 73
			when "0100" => catod  <= "1100101"; -- 4 -- 65  
			when "0101" => catod  <= "0110111"; -- 5 -- 37
			when "0110" => catod  <= "0111111"; -- 6 -- 3F
			when "0111" => catod  <= "1100010"; -- 7 -- 62
			when "1000" => catod  <= "1111111"; -- 8 -- 7F
			when "1001" => catod  <= "1110111"; -- 9 -- 77
			when others => catod  <= "0000000"; -- altele -- 00
		end case;
	end process;
	
	process(sel, clr)
	begin
		anod <= "0000";
		if clr = '0' then
			anod(conv_integer(sel)) <= '0';
		end if;
	end process;
	
	process(clk, clr)
	begin
		if clr = '1' then
			clk_div <= (others => '0');
		elsif clk'event and clk = '1' then
			clk_div <= clk_div + 1;
		end if;
	end process;
end comportamental;
