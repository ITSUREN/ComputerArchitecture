-- VHDL Code for halfAdder gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity halfAdder is

    port(A : in std_logic;      -- halfAdder gate input
         B : in std_logic;      -- halfAdder gate input
         S : out std_logic;    -- halfAdder gate output
         C : out std_logic);    -- halfAdder gate output

end halfAdder;

-- Dataflow Modelling Style
-- Architecture definition

architecture halfAdderLogic of halfAdder is

 begin
    
    S <= A XOR B;
    C <= A AND B;

end halfAdderLogic; 