library ieee;
use ieee.std_logic_1164.all; 

package pachet_stari is
	type type_states is (introducere_card, introducere_PIN, alegere_operatiune, interogare_sold, introducere_PIN_nou, actualizare_PIN,
	introducere_suma_depunere, actualizare_cont_depunere, introducere_suma_retragere,actualizare_cont_retragere, emitere_chitanta, alta_operatiune);
end package;
