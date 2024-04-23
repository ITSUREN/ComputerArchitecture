-- VHDL Code for halfSubtractor gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity halfSubtractor is

    port(A : in std_logic;      -- halfSubtractor gate input
         B : in std_logic;      -- halfSubtractor gate input
         D : out std_logic;    -- halfSubtractor gate output
         Bout : out std_logic);    -- halfSubtractor gate output

end halfSubtractor;

-- Dataflow Modelling Style
-- Architecture definition

architecture halfSubtractorLogic of halfSubtractor is

 begin
    
    D <= A XOR B;
    Bout <= (NOT A) AND B;

end halfSubtractorLogic; 