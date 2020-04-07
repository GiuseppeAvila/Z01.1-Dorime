-- Elementos de Sistemas
-- by Luciano Soares
-- Register8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register8 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture arch of Register8 is

signal clocksignal: std_logic;
signal inputsignal: STD_LOGIC_VECTOR(7 downto 0);
signal loadsignal: STD_LOGIC;
signal outputsignal: STD_LOGIC_VECTOR(7 downto 0);

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

begin
clocksignal <= clock;
inputsignal <= input;
loadsignal <= load;
--outputsignal <= output;

		reg0: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(0),
			load => loadsignal,
			output => outputsignal(0)
		);
		
		reg1: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(1),
			load => loadsignal,
			output => outputsignal(1)
		);
		
		reg2: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(2),
			load => loadsignal,
			output => outputsignal(2)
		);
		
		reg3: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(3),
			load => loadsignal,
			output => outputsignal(3)
		);
		
		reg4: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(4),
			load => loadsignal,
			output => outputsignal(4)
		);
		
		reg5: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(5),
			load => loadsignal,
			output => outputsignal(5)
		);
		
		reg6: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(6),
			load => loadsignal,
			output => outputsignal(6)
		);
		
		reg7: BinaryDigit
		port map(
			clock => clocksignal,
			input => inputsignal(7),
			load => loadsignal,
			output => outputsignal(7)
		);
		
output <= outputsignal;
end architecture;
