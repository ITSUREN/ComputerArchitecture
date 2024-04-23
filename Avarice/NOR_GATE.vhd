-- VHDL Code for NOR gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity norGate is

    port(A : in std_logic;      -- NOR gate input
         B : in std_logic;      -- NOR gate input
         Y : out std_logic);    -- NOR gate output

end norGate;

-- Dataflow Modelling Style
-- Architecture definition

architecture norLogic of norGate is

 begin
    
    Y <= NOT (A OR B);

end norLogic; 

