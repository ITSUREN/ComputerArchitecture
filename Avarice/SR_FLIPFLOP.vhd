library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FlipFlop is
    Port ( S, R, CLK : in  STD_LOGIC;
           Q, Q_bar : out  STD_LOGIC);
end SR_FlipFlop;

architecture Behavioral of SR_FlipFlop is
    signal Q_internal : STD_LOGIC;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if R = '1' then
                Q_internal <= '0';
            elsif S = '1' then
                Q_internal <= '1';
            end if;
        end if;
    end process;
    
    Q <= Q_internal;
    Q_bar <= not Q_internal;
end Behavioral;
