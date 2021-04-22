library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comparator_mic is
	port(A, B: in std_logic_vector(0 to 15);
	rez: out std_logic);
end comparator_mic;

architecture comportamental of comparator_mic is
begin
	process(A, B)
	begin
		if A < B then
			rez <= '0'; -- pentru fonduri suficiente vom returna 1
		else
			rez <= '1';
		end if;
	end process;
end comportamental;