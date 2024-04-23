library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Include numeric_std package

entity ALU_4bit is
    Port ( A, B : in  STD_LOGIC_VECTOR(3 downto 0);
           op : in  STD_LOGIC_VECTOR(2 downto 0);
           result : out  STD_LOGIC_VECTOR(3 downto 0);
           overflow : out STD_LOGIC);
end ALU_4bit;

architecture Behavioral of ALU_4bit is
    signal temp_result : signed(3 downto 0);
begin
    process (A, B, op)
    begin
        temp_result <= (others => '0');
        
        case op is
            when "000" => -- Addition
                temp_result <= signed(A) + signed(B);
                if (signed(A) > 0 and signed(B) > 0 and temp_result < 0) or (signed(A) < 0 and signed(B) < 0 and temp_result > 0) then
                    overflow <= '1'; -- Overflow
                else
                    overflow <= '0';
                end if;
            when "001" => -- Subtraction
                temp_result <= signed(A) - signed(B);
                if (signed(A) < signed(B)) then
                    overflow <= '1'; -- Overflow
                else
                    overflow <= '0';
                end if;
            when others =>
                temp_result <= (others => '0');
        end case;
        
        case op is
            when "010" => -- AND
                result <= A and B;
            when "011" => -- OR
                result <= A or B;
            when "100" => -- XOR
                result <= A xor B;
            when "101" => -- Shift left (logical)
                result <= A(2 downto 0) & "0"; -- Shift left by B positions
            when "110" => -- Shift right (logical)
                result <= "0" & A(3 downto 1); -- Shift right by B positions
            when others =>
                result <= (others => '0');
        end case;
    end process;
end Behavioral;
