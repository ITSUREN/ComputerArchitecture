library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port ( D, CLK : in  STD_LOGIC;
           Q, Q_bar : out  STD_LOGIC);
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
    signal Q_internal : STD_LOGIC;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            Q_internal <= D;
        end if;
    end process;
    
    Q <= Q_internal;
    Q_bar <= not Q_internal;
end Behavioral;