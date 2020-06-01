--------------------------------------------
-- Somador Completo para 04 bits
-- 20/09/2019 
-- Organização e Arquitetura de Computadores 
-- Ripple Carry Adder
-- Portas lógicas com latência de 4ns 
-- Max 4 input
-- Vitor Gilnek, Igor Engler, Bruno Dierich
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_04 is
   port(
      X, Y : in  std_logic_vector(3 downto 0); 	-- X + Y
      T    : in  std_logic;                     -- Transporte de entrada
      C    : out std_logic;                     -- Transporte de saída
      S    : out std_logic_vector(3 downto 0)  	-- S = X + Y
   );
end ripple_carry_04;


architecture comportamento of ripple_carry_04 is

   component ripple_carry is
      generic (DELAY: time := 4.0 ns);
      port(
         X, Y : in  std_logic; -- X + Y
         T    : in  std_logic; -- Transporte de entrada
         C    : out std_logic; -- Transporte de saída
         S    : out std_logic  -- S = X + Y
      );
   end component;

   -- vetor de carry
   signal cv : std_logic_vector(2 downto 0);

begin

   u_ca0 : ripple_carry 
   port map(X(0), Y(0), T    , cv(0), S(0));

   u_ca1 : ripple_carry 
   port map(X(1), Y(1), cv(0), cv(1), S(1));

   u_ca2 : ripple_carry 
   port map(X(2), Y(2), cv(1), cv(2), S(2));

   u_ca3 : ripple_carry 
   port map(X(3), Y(3), cv(2), C    , S(3));

end architecture;
