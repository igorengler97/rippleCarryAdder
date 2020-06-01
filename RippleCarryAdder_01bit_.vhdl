--------------------------------------------
-- Somador Completo para 01 bit
-- 20/09/2019 
-- Organização e Arquitetura de Computadores 
-- Ripple Carry Adder
-- Portas lógicas com latência de 4ns 
-- Max 4 input
-- Vitor Gilnek, Igor Engler, Bruno Dierich
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry is
   generic (DELAY: time := 4.0 ns);
   port(
      X, Y : in  std_logic; -- X + Y
      T    : in  std_logic; -- Transporte de entrada
      C    : out std_logic; -- Transporte de saída
      S    : out std_logic  -- S = X + Y
   );
end ripple_carry;

architecture comportamento of ripple_carry is

begin
   -- XOR de duas entradas
   S <= ((X xor Y) xor T) after 2*DELAY;

   -- 3_ANDs em paralelo, em série com 2_OR
   C <= (X and T) or ((Y and T) or (X and Y)) after 3*DELAY;

end architecture;
