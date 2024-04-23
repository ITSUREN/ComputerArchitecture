-- VHDL Code for fullSubtractor gate

-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity fullSubtractor is

    port(A : in std_logic;      -- fullSubtractor gate input
         B : in std_logic;      -- fullSubtractor gate input
         Bin : in std_logic;    -- fullSubtractor gate output
         D : out std_logic;    -- fullSubtractor gate output
         Bout : out std_logic);    -- fullSubtractor gate output

end fullSubtractor;

-- Dataflow Modelling Style
-- Architecture definition

architecture fullSubtractorLogic of fullSubtractor is

 begin
    
    D <= A XOR B XOR Bin;
    Bout <= ((NOT A) AND B) OR (Bin AND (NOT(A XOR B)));

end fullSubtractorLogic; 