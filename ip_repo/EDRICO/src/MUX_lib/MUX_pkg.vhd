----------------------------------------------------------------------------------
-- Company: DHBW Ravensburg
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 07/07/2021 01:14:25 PM
-- Design Name: Generic_MUX
-- Module Name: MUX_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is a package to contain the types and components for the MUX modules
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
--PACKAGE
----------------------------------------------------------------------------------
package MUX_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type input is array(natural range<>) of std_logic_vector;
----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component MUX_32_2 is
    port(
        control : in std_logic;
        A_in, B_in : in std_logic_vector(31 downto 0);
        C_out : out std_logic_vector(31 downto 0)
    );
end component;

component MUX_32_3 is
    port(
        control : in std_logic_vector(1 downto 0);
        A_in, B_in : in std_logic_vector(31 downto 0);
        C_out : out std_logic_vector(31 downto 0)
    );
end component;

component MUX_CSR is
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
end component;

end MUX_pkg;

