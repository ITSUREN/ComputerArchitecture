library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch_Clocked is
    Port ( S, R, CLK : in  STD_LOGIC;
           Q, Q_bar : out  STD_LOGIC);
end SR_Latch_Clocked;

architecture Behavioral of SR_Latch_Clocked is
    signal Q_internal, Q_bar_internal : STD_LOGIC;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if R = '1' then
                Q_internal <= '0';
                Q_bar_internal <= '1';
            elsif S = '1' then
                Q_internal <= '1';
                Q_bar_internal <= '0';
            end if;
        end if;
    end process;

    Q <= Q_internal;
    Q_bar <= Q_bar_internal;
end Behavioral;
