library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer4x1 is
    Port ( Inputs : in  STD_LOGIC_VECTOR(3 downto 0);
           Selection : in STD_LOGIC_VECTOR(1 downto 0);
           Outputs : out  STD_LOGIC);
end multiplexer4x1;

architecture Behavioral of multiplexer4x1 is
begin
    process (Inputs, Selection)
    begin
        case Selection is
            when "00" =>
                outputs <= inputs(0);
            when "01" =>
                outputs <= inputs(1);
            when "10" =>
                outputs <= inputs(2);
            when "11" =>
                outputs <= inputs(3);
            when others =>
                outputs <= 'U'; -- Default case
        end case;
    end process;
end Behavioral;
