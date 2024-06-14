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
begin
    process (A, B, op)
        variable temp_result : signed(4 downto 0); -- Extra bit for overflow detection
        variable unsigned_result : unsigned(4 downto 0); -- For overflow detection
    begin
        -- Default assignments
        result <= (others => '0');
        overflow <= '0';

        case op is
            when "000" => -- Addition
                temp_result := signed('0' & A) + signed('0' & B);
                unsigned_result := unsigned('0' & A) + unsigned('0' & B);
                result <= std_logic_vector(temp_result(3 downto 0));
                if (unsigned_result(4) = '1') then
                    overflow <= '1'; -- Overflow
                else
                    overflow <= '0';
                end if;
            when "001" => -- Subtraction
                temp_result := signed('0' & A) - signed('0' & B);
                unsigned_result := unsigned('0' & A) - unsigned('0' & B);
                result <= std_logic_vector(temp_result(3 downto 0));
                if (unsigned_result(4) = '1') then
                    overflow <= '1'; -- Overflow
                else
                    overflow <= '0';
                end if;
            when "010" => -- AND
                result <= A and B;
                overflow <= '0';
            when "011" => -- OR
                result <= A or B;
                overflow <= '0';
            when "100" => -- XOR
                result <= A xor B;
                overflow <= '0';
            when "101" => -- Shift left (logical)
                result <= A(2 downto 0) & '0'; -- Shift left by 1 position
                overflow <= '0';
            when "110" => -- Shift right (logical)
                result <= '0' & A(3 downto 1); -- Shift right by 1 position
                overflow <= '0';
            when others =>
                result <= (others => '0'); -- Default to zero for undefined operations
                overflow <= '0';
        end case;
    end process;
end Behavioral;

