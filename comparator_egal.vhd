library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comparator_egal is
	port(A, B: in std_logic_vector(0 to 15);
	rez: out std_logic);
end comparator_egal;

architecture comportamental of comparator_egal is
begin
	process(A, B)
	begin
		if A = B then
			rez <= '1';
		else
			rez <= '0';
		end if;
	end process;
end comportamental;