library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd0, bcd1, bcd2: in  STD_LOGIC_VECTOR(3 downto 0);
			leds0, leds1, leds2: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin
	with bcd0 select
			 leds0 <= "1000000" when "0000",	--0
						"1111001" when "0001",	--1
						"0100100" when "0010",	--2
						"0110000" when "0011",	--3
						"0011001" when "0100",	--4
						"0010010" when "0101",	--5
						"0000010" when "0110",	--6
						"1111000" when "0111",	--7
						"0000000" when "1000",	--8
						"0010000" when "1001",	--9
						"1111111" when others;	--blank when not a digit
						
	with bcd1 select
			 leds1 <= "1000000" when "0000",	--0
						"1111001" when "0001",	--1
						"0100100" when "0010",	--2
						"0110000" when "0011",	--3
						"0011001" when "0100",	--4
						"0010010" when "0101",	--5
						"0000010" when "0110",	--6
						"1111000" when "0111",	--7
						"0000000" when "1000",	--8
						"0010000" when "1001",	--9
						"1111111" when others;	--blank when not a digit
						
	with bcd2 select
			 leds2 <= "1000000" when "0000",	--0
						"1111001" when "0001",	--1
						"0100100" when "0010",	--2
						"0110000" when "0011",	--3
						"0011001" when "0100",	--4
						"0010010" when "0101",	--5
						"0000010" when "0110",	--6
						"1111000" when "0111",	--7
						"0000000" when "1000",	--8
						"0010000" when "1001",	--9
						"1111111" when others;	--blank when not a digit

end architecture;
