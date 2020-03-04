library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0);
end entity;

architecture arch of detectorDeMoedas is

begin

cents <= [11001] when Q;
cents <= [1010] when D;
cents <= [101] when N;

end architecture;
