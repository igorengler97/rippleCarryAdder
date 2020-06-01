--------------------------------------------
-- Somador Completo para 16 bits
-- 20/09/2019 
-- Organização e Arquitetura de Computadores 
-- Ripple Carry Adder
-- Portas lógicas com latência de 4ns 
-- Max 4 input
-- Vitor Gilnek, Igor Engler, Bruno Dierich
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_16 is
   port(
      X, Y : in  std_logic_vector(15 downto 0); -- X + Y
      T    : in  std_logic;                     -- Transporte de entrada
      C    : out std_logic;                     -- Transporte de saída
      S    : out std_logic_vector(15 downto 0)  -- S = X + Y
   );
end ripple_carry_16;


architecture comportamento of ripple_carry_16 is

   component ripple_carry_08 is
      port(
         X, Y : in  std_logic_vector(7 downto 0);  -- X + Y
         T    : in  std_logic;                     -- Transporte de entrada
         C    : out std_logic;                     -- Transporte de saída
         S    : out std_logic_vector(7 downto 0)   -- S = X + Y
      );
   end component;

   -- vetor de carry
   signal cv : std_logic;

begin

   u_ca0 : ripple_carry_08 
   port map(X( 7 downto 0), Y( 7 downto 0), T  , cv, S( 7 downto 0));

   u_ca1 : ripple_carry_08
   port map(X(15 downto 8), Y(15 downto 8), cv , C , S(15 downto 8));

end architecture;
