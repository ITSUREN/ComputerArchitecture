library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port ( J, K, CLK : in  STD_LOGIC;
           Q, Q_bar : out  STD_LOGIC);
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
    signal Q_internal : STD_LOGIC;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if J = '1' and K = '1' then
                Q_internal <= not Q_internal; -- Toggle
            elsif J = '1' then
                Q_internal <= '1';
            elsif K = '1' then
                Q_internal <= '0';
            end if;
        end if;
    end process;
    
    Q <= Q_internal;
    Q_bar <= not Q_internal;
end Behavioral;
