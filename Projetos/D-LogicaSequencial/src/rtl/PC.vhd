-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(15 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(15 downto 0)
			);
    end component;
	 
	component Mux16 is
		port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;
	
	SIGNAL registerOut, muxIncOut, incOut, loadOut, resetOut: STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";

begin

  u1: Inc16 port map(a => registerOut,
							q => incOut
							);
  
  u2: Mux16 port map(a => registerOut,
							b => incOut,
							sel => increment,
							q => muxIncOut
							);
  
  u3: Mux16 port map(a => muxIncOut,
							b => input,
							sel => load,
							q => loadOut
							);
  
  u4: Mux16 port map(a => loadOut,
							b => "0000000000000000",
							sel => reset,
							q => resetOut
							);
  
  u5: Register16 port map (clock => clock,
									input => resetOut,
									load => '1',
									output => registerOut
									);
  
  output <= registerOut;

end architecture;
