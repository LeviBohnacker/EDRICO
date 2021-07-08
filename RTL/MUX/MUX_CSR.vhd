----------------------------------------------------------------------------------
-- Company: DHBW Ravensburg
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 07/07/2021 01:14:25 PM
-- Design Name: MUX_32_2
-- Module Name: MUX_32_2
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is a multiplexer with two inputs (CSR control signals each):
--      control: '0' => C_out: CSR_CU
--      control: '1' => C_out: CSR_EC
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity MUX_CSR is
    port(
        control : in std_logic;
        --csr control input signals
        read_CSR_CU, read_CSR_EC : in std_logic;
        write_CSR_CU, write_CSR_EC : in std_logic;
        CSR_address_CU, CSR_address_EC : in std_logic_vector(11 downto 0);
        --csr control output signals
        read_CSR : out std_logic;
        write_CSR : out std_logic;
        CSR_address : out std_logic_vector(11 downto 0)
    );
end entity;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of MUX_CSR is 
begin

    ------------------------------------------------------------------------------
    --Multiplexer
    ------------------------------------------------------------------------------
    MUX: process(control, read_CSR_CU, read_CSR_EC, write_CSR_CU, write_CSR_EC, CSR_address_CU, CSR_address_EC) 
    begin
        if(control = '1') then
            read_CSR <= read_CSR_EC;
            write_CSR <= write_CSR_EC;
            CSR_address <= CSR_address_EC;
        else
            read_CSR <= read_CSR_CU;
            write_CSR <= write_CSR_CU;
            CSR_address <= CSR_address_CU;
        end if;
    end process;


end architecture; 