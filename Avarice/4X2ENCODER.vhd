library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_4x2 is
    Port ( input : in  STD_LOGIC_VECTOR(3 downto 0);
           output : out  STD_LOGIC_VECTOR(1 downto 0));
end Encoder_4x2;

architecture Behavioral of Encoder_4x2 is
begin
    process (input)
    begin
        case input is
            when "0001" =>
                output <= "00";
            when "0010" =>
                output <= "01";
            when "0100" =>
                output <= "10";
            when "1000" =>
                output <= "11";
            when others =>
                output <= "00"; -- Default case
        end case;
    end process;
end Behavioral;

