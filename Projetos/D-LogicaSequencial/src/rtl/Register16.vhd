-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Register16 is
signal clocksignal: std_logic;
signal inputsignal: STD_LOGIC_VECTOR(15 downto 0);
signal loadsignal : std_logic;
signal outputsignal : STD_LOGIC_VECTOR(15 downto 0);

	component Register8 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(7 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;

begin
clocksignal <= clock;
inputsignal <= input;
loadsignal <= load;


		r0: Register8
		port map(
			clock => clocksignal,
			input => inputsignal(7 downto 0),
			load => loadsignal,
			output => outputsignal(7 downto 0)
		);
		
		r1: Register8
		port map(
			clock => clocksignal,
			input => inputsignal(15 downto 8),
			load => loadsignal,
			output => outputsignal(15 downto 8)
		);
output <= outputsignal;

end architecture;
