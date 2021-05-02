----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/02/2021 08:03:12 PM
-- Design Name: Exception_controll
-- Module Name: CSR_access_controll - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module controls accesses to the CSR register file from the
--  Exception_controll
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CSR_access_controll is
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    store_mepc : in std_logic;
    store_mstatus : in std_logic;
    store_mtval : in std_logic;
    store_mcause : in std_logic;
    load_mtvec : in std_logic;
    load_mepc : in std_logic;
    load_mstatus : in std_logic;
    --exception code and interrupt signal
    exception_code : in std_logic_vector (31 downto 0);
    interrupt : in std_logic;
    --data inputs
    data_in_EC : in std_logic_vector (31 downto 0);
    data_out : in std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR access signals
    CSR_read_EC : out std_logic;
    CSR_write_EC : out std_logic;
    CSR_address_EC : out std_logic_vector (11 downto 0);
    --data outputs
    data_out_EC : out std_logic_vector (31 downto 0);
    data_in_CSR : out std_logic_vector (31 downto 0)
);
end CSR_access_controll;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CSR_access_controll is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal CSR_mux: std_logic_vector(4 downto 0);
signal jump_addr : std_logic_vector(31 downto 0);
begin

----------------------------------------------------------------------------------
--CSR address gen
--  generate CSR access address from control signals
----------------------------------------------------------------------------------
CSR_mux <= (load_mepc or store_mepc) & load_mtvec & store_mtval & (load_mstatus or store_mstatus) & store_mcause;
CSR_address_EC <=   x"342" when CSR_mux = "00001" else
                    x"300" when CSR_mux = "00010" else
                    x"343" when CSR_mux = "00100" else
                    x"305" when CSR_mux = "01000" else
                    x"341" when CSR_mux = "10000" else
                    x"BC0";

----------------------------------------------------------------------------------
--CSR access gen
--  generate CSR access signals from control signals
----------------------------------------------------------------------------------                    
CSR_write_EC <= store_mepc or store_mcause  or store_mtval or store_mstatus;
CSR_read_EC <= load_mepc or load_mtvec or load_mstatus;

----------------------------------------------------------------------------------
--data2CSR gen
--  generate data put on the CSR data input bus
----------------------------------------------------------------------------------  
data_out_EC <=  interrupt & exception_code(30 downto 0) when store_mcause = '1' else
                data_out;
                
----------------------------------------------------------------------------------
--data2buffer_register gen
--  generate data put on the buffer_register input bus
---------------------------------------------------------------------------------- 
--compute address to jump to if no interrupt occured and vectored mode is set in mtvec                
jump_addr <= std_logic_vector(shift_left(unsigned("00" & data_in_EC(31 downto 2)) + unsigned(exception_code), 2));
data_in_CSR <=  data_in_EC(31 downto 2) & "00" when (interrupt = '0' and data_in_EC(1 downto 0) = "01" and load_mtvec = '1') or (data_in_EC(1 downto 0) = "00" and load_mtvec = '1')else
                jump_addr when (interrupt = '1' and data_in_EC(1 downto 0) = "01" and load_mtvec = '1') else
                data_in_CSR;

end rtl;
