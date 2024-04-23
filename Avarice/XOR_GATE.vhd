-- VHDL Code for xor gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity xorGate is

    port(A : in std_logic;      -- xor gate input
         B : in std_logic;      -- xor gate input
         Y : out std_logic);    -- xor gate output

end xorGate;

-- Dataflow Modelling Style
-- Architecture definition

architecture xorLogic of xorGate is

 begin
    
    Y <= ((NOT A) AND B) OR (A AND (NOT B));

end xorLogic; 


