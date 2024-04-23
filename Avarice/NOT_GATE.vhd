
-- VHDL Code for NOT gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity notGate is

    port(A : in std_logic;      -- NOT gate input
         Y : out std_logic);    -- NOT gate output

end notGate;

-- Dataflow Modelling Style
-- Architecture definition

architecture notLogic of notGate is

 begin
    
    Y <= NOT A;

end notLogic; 