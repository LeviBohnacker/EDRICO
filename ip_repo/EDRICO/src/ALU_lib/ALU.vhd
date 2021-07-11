----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 05/06/2021 18:04:15 AM
-- Design Name: ALU
-- Module Name: ALU
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  ALU performs arithmetic operation with the two input
--  registers depending on Control Unit signal (alu_op) from decoded 
--  instruction.
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity ALU is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- operation code from control unit
    alu_op: in std_logic_vector(3 downto 0);
    -- input registers
    -- in_a: 4, immediate, register A
    -- in_b: program counter, register B
    in_a, in_b: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    alu_result: out std_logic_vector(31 downto 0);
    branch_re: out std_logic
);
end entity;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of ALU is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

begin
    process(in_a, in_b, alu_op)
    begin
    --default output is 0
    branch_re <= '0';
    alu_result <= "00000000000000000000000000000000";

        case alu_op is

            when "0000" =>--"ADD"

                alu_result <= std_logic_vector(unsigned(in_b) + unsigned(in_a));

            when "0001" =>--"SUB"

                alu_result <= std_logic_vector(unsigned(in_b) - unsigned(in_a));

            when "0010" =>--"AND"

                alu_result <= in_b AND in_a;

            when "0011" =>--"OR"

                alu_result <= in_b OR in_a;

            when "0100" =>--"XOR"

                alu_result <= in_b XOR in_a;

            when "0101" =>--"EQUAL"

                if(in_b = in_a) then
                    branch_re <= '1';
                else
                    branch_re <= '0';
                end if;

            when "0110" =>--"NEQUAL"

                if(in_b /= in_a) then
                    branch_re <= '1';
                else
                    branch_re <= '0';
                end if;

            when "0111" =>--"lshift_left"

                alu_result <= std_logic_vector(shift_left(unsigned(in_b), to_integer(unsigned(in_a))));

            when "1000" =>--"lshift_right"

                alu_result <= std_logic_vector(shift_right(unsigned(in_b), to_integer(unsigned(in_a))));

            when "1001" =>--"ashift_right"

                alu_result <= std_logic_vector(shift_right(signed(in_b), to_integer(unsigned(in_a))));

            when "1010" =>--"<"

                if(signed(in_b) < signed(in_a)) then
                -- if b < a, branch or write b to the output
                    branch_re <= '1';
                    alu_result <= in_b;
                else
                    branch_re <= '0';
                end if;

            when "1011" =>--"< (unsigned)"

                if(unsigned(in_b) < unsigned(in_a)) then
                    branch_re <= '1';
                    alu_result <= in_b;
                else
                    branch_re <= '0';
                end if;

            when "1100" =>--">="

                if(signed(in_b) > signed(in_a)) then
                    branch_re <= '1';
                elsif (signed(in_b) = signed(in_a)) then
                    branch_re <= '1';
                else
                    branch_re <= '0';
                end if;

            when "1101" =>--">= (unsigned)"

                if(unsigned(in_b) > unsigned(in_a)) then
                    branch_re <= '1';
                elsif (unsigned(in_b) = unsigned(in_a)) then
                    branch_re <= '1';
                else
                    branch_re <= '0';
                end if;

            when others =>    

        end case;

    end process;

end architecture;