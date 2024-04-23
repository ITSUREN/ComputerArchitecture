-- VHDL Code for xnor gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity xnorGate is

    port(A : in std_logic;      -- xnor gate input
         B : in std_logic;      -- xnor gate input
         Y : out std_logic);    -- xnor gate output

end xnorGate;

-- Dataflow Modelling Style
-- Architecture definition

architecture xnorLogic of xnorGate is

 begin
    
    Y <= (A AND B) OR ((NOT A) AND (NOT B));

end xnorLogic; 
