library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sumator is
	port(A, B: in std_logic_vector(0 to 15);
	S: out std_logic_vector(0 to 15));
end sumator;	 

architecture comportamental of sumator is
begin
	S <= A + B;
end comportamental;