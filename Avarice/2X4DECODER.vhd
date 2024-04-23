library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2x4 is
    Port ( input : in  STD_LOGIC_VECTOR(1 downto 0);
           output : out  STD_LOGIC_VECTOR(3 downto 0));
end Decoder_2x4;

architecture Behavioral of Decoder_2x4 is
begin
    process (input)
    begin
        case input is
            when "00" =>
                output <= "0001";
            when "01" =>
                output <= "0010";
            when "10" =>
                output <= "0100";
            when "11" =>
                output <= "1000";
            when others =>
                output <= "0000"; -- Default case
        end case;
    end process;
end Behavioral;
