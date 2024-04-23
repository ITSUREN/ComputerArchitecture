-- VHDL Code for fullAdder gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity fullAdder is

    port(A : in std_logic;      -- fullAdder gate input
         B : in std_logic;      -- fullAdder gate input
         Cin : in std_logic;      -- fullAdder gate input
         S : out std_logic;    -- fullAdder gate output
         Cout : out std_logic);    -- fullAdder gate output

end fullAdder;

-- Dataflow Modelling Style
-- Architecture definition

architecture fullAdderLogic of fullAdder is

 begin
    
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));

end fullAdderLogic; 