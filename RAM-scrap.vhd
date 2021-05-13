library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
	port(clk: in std_logic;
	mode: in std_logic; -- 0 - read; 1 - write
	valoare: inout std_logic_vector(0 to 15); -- valori pe 16 biti
	adresa: in std_logic_vector(0 to 3)); -- 4 seturi de 3 campuri care se scriu pe 4 biti
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
	if mode = '0' then
		valoare <= memorie(conv_integer(adresa));
	else
		memorie(conv_integer(adresa)) <= valoare;
	end if;
	end process;
end comportamental;
