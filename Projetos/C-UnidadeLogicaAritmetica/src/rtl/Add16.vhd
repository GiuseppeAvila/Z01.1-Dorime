-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
      q   : out STD_LOGIC_VECTOR(15 downto 0);
      carryout : out std_logic
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.
  -- teste git

signal carry : STD_LOGIC_VECTOR(15 downto 0);
signal asignal: STD_LOGIC_VECTOR(15 downto 0);
signal qsignal: STD_LOGIC_VECTOR(15 downto 0);
signal bsignal: STD_LOGIC_VECTOR(15 downto 0);

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

begin
asignal <= a;
bsignal <= b;
  -- Implementação vem aqui!
    ad0: FullAdder 
    port map(
       a => asignal(0),
       b => bsignal(0),
       c => '0',
       soma => qsignal(0),
       vaium => carry(0)
    );

    ad1: FullAdder 
    port map(
       a => asignal(1),
       b => bsignal(1),
       c => carry(0),
       soma => qsignal(1),
       vaium => carry(1)
    );

    ad2: FullAdder 
    port map(
       a => asignal(2),
       b => bsignal(2),
       c => carry(1),
       soma => qsignal(2),
       vaium => carry(2)
    );

    ad3: FullAdder 
    port map(
       a => asignal(3),
       b => bsignal(3),
       c => carry(2),
       soma => qsignal(3),
       vaium => carry(3)
    );

    ad4: FullAdder 
    port map(
       a => asignal(4),
       b => bsignal(4),
       c => carry(3),
       soma => qsignal(4),
       vaium => carry(4)
    );
    
    ad5: FullAdder 
    port map(
       a => asignal(5),
       b => bsignal(5),
       c => carry(4),
       soma => qsignal(5),
       vaium => carry(5)
    );

    ad6: FullAdder 
    port map(
       a => asignal(6),
       b => bsignal(6),
       c => carry(5),
       soma => qsignal(6),
       vaium => carry(6)
    );

    ad7: FullAdder 
    port map(
       a => asignal(7),
       b => bsignal(7),
       c => carry(6),
       soma => qsignal(7),
       vaium => carry(7)
    );

    ad8: FullAdder 
    port map(
       a => asignal(8),
       b => bsignal(8),
       c => carry(7),
       soma => qsignal(8),
       vaium => carry(8)
    );

    ad9: FullAdder 
    port map(
       a => asignal(9),
       b => bsignal(9),
       c => carry(8),
       soma => qsignal(9),
       vaium => carry(9)
    );

    ad10: FullAdder 
    port map(
       a => asignal(10),
       b => bsignal(10),
       c => carry(9),
       soma => qsignal(10),
       vaium => carry(10)
    );

    ad11: FullAdder 
    port map(
       a => asignal(11),
       b => bsignal(11),
       c => carry(10),
       soma => qsignal(11),
       vaium => carry(11)
    );

    ad12: FullAdder 
    port map(
       a => asignal(12),
       b => bsignal(12),
       c => carry(11),
       soma => qsignal(12),
       vaium => carry(12)
    );

    ad13: FullAdder 
    port map(
       a => asignal(13),
       b => bsignal(13),
       c => carry(12),
       soma => qsignal(13),
       vaium => carry(13)
    );

    ad14: FullAdder 
    port map(
       a => asignal(14),
       b => bsignal(14),
       c => carry(13),
       soma => qsignal(14),
       vaium => carry(14)
    );

    ad15: FullAdder 
    port map(
       a => asignal(15),
       b => bsignal(15),
       c => carry(14),
       soma => qsignal(15),
       vaium => carryout
    );
q <= qsignal;

end architecture;
