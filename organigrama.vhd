library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
library work;

use work.pachet_stari.all;

entity organigrama is
	port(clk, rst: in std_logic;
	card_valid, PIN_valid, fonduri_suficiente, chitanta, revenire_operatiuni: in std_logic;
	operatiune:	in std_logic_vector(1 downto 0);
	LED_chitanta: out std_logic;
	stare_curenta: in type_states);
end organigrama;
	
architecture comportamental of organigrama is

	signal stare, stare_urmatoare: type_states;

begin	

	CLS: process(clk, rst, card_valid, PIN_valid, fonduri_suficiente, chitanta, revenire_operatiuni, operatiune, stare_curenta)
	begin
		if rst = '1' then
			stare <= introducere_card;
		elsif clk'event and clk = '1' then
			stare <= stare_urmatoare;
		end if;	  
	end process;	  	 
	
	CLC: process(stare, card_valid, PIN_valid, operatiune, chitanta, revenire_operatiuni)
	begin	 

		case stare is
			when introducere_card =>
				if card_valid = '1' then stare_urmatoare <= introducere_PIN;
					else stare_urmatoare <= introducere_card;
					end if;	 
					
			when introducere_PIN =>
				if PIN_valid = '1' then stare_urmatoare <= alegere_operatiune;
				else stare_urmatoare <= introducere_PIN; 
				end if;
					
			when alegere_operatiune =>			
				if operatiune = "00" then stare_urmatoare <= interogare_sold; -- ramura 1
				elsif operatiune = "01" then stare_urmatoare <= introducere_PIN_nou; -- ramura 2
				elsif operatiune = "10" then stare_urmatoare <= introducere_suma_depunere; -- ramura 3
				elsif operatiune = "11" then stare_urmatoare <= introducere_suma_retragere; -- ramura 4
				end if;
			
			when interogare_sold =>
				stare_urmatoare <= alta_operatiune;	-- ramura 1
			
			when introducere_PIN_nou =>
				stare_urmatoare <= actualizare_PIN; -- ramura 2
			
			when actualizare_PIN =>
				stare_urmatoare	<= emitere_chitanta;
			
			when introducere_suma_depunere =>
			stare_urmatoare <= actualizare_cont_depunere; -- ramura 3
			
			when actualizare_cont_depunere =>
				stare_urmatoare <= emitere_chitanta;
			
			when introducere_suma_retragere =>
				if fonduri_suficiente = '1' then stare_urmatoare <= actualizare_cont_retragere; -- ramura 4
				else stare_urmatoare <=	introducere_suma_retragere;
				end if;
				
			when actualizare_cont_retragere =>
				stare_urmatoare <= emitere_chitanta;
			
			when emitere_chitanta =>
				if chitanta = '1' then LED_chitanta <= '1';
				end if;
				stare_urmatoare <= alta_operatiune;
				
			when alta_operatiune =>
				if revenire_operatiuni = '1' then stare_urmatoare <= alegere_operatiune;
				else stare_urmatoare <= introducere_card;
				end if;

		end case;	
	end process;
end comportamental;
