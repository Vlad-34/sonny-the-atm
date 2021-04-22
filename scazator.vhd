library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scazator is
	port(A, B: in std_logic_vector(0 to 15);
	D: out std_logic_vector(0 to 15));
end scazator;	 

architecture comportamental of scazator is
begin
	D <= A - B;
end comportamental;