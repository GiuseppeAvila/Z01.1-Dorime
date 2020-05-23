-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

begin

 loadD <= instruction(17) and instruction(4);
 loadM <= instruction(17) and instruction(5);
 loadA <= not instruction(17);
 
 --((instruction(0) or instruction(1)) or instruction(2))
 
 loadPC <= '1' when instruction(17) = '1' and ((instruction(0)='1' or instruction(1)='1') or instruction(2)='1') and zr='0' and ng='0' else '0';
 
 
 
 muxALUI_A  <= '0' when instruction(17) = '1' else '1';
 zx <= '1' when instruction(17) = '1' and instruction(12) = '1' else '0';
 nx  <= '1' when instruction(17) = '1' and instruction(11) = '1' else '0';
 zy  <= '1' when instruction(17) = '1' and instruction(10) = '1' else '0';
 ny  <= '1' when instruction(17) = '1' and instruction(9) = '1' else '0';
 f  <= '1' when instruction(17) = '1' and instruction(8) = '1' else '0';
 no  <= '1' when instruction(17) = '1' and instruction(7) = '1' else '0'; 
 

end architecture;
