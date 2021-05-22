----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/22/2021 10:40:57 AM
-- Design Name: PMP_PMA_checker
-- Module Name: sim_PMP_unit_UV_1_pkg - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This package contains the stimulus and verification data for the 
--  sim_PMP_unit_UV_1 test case.
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
package sim_PMP_unit_UV_1_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
--(71 downto 64) = pmpcfg, (63 downto 32) = pmpaddr, (31 downto 0) = pmpaddrLow
type pmp_input is array(natural range <>) of std_logic_vector(71 downto 0); 
-- (1) = readWrite, (0) = instruction
type control_input is array (natural range <>) of std_logic_vector(1 downto 0);
--(67 downto 34) = address, (33 downto 0) = address_upper
type addr_input is array(natural range <>) of std_logic_vector(67 downto 0);
--(3) = instruction_afe_P, (2) = storeAMO_afe_P, (1) = load_afe_P, (0) = address_hit
type unit_output is array(natural range <>) of std_logic_vector(3 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
--(71 downto 64) = pmpcfg, (63 downto 32) = pmpaddr, (31 downto 0) = pmpaddrLow
constant stimulus_pmp : pmp_input(15 downto 0) :=
    (
    0 => "10000110" & x"BADC0DED" & x"18273912",   --L='1', A="00", X='1', W='1', R='0'    OFF
    1 => "00010101" & x"DEADAFFE" & x"01938123",   --L='0', A="10", X='1', W='0', R='1'    not locked
    2 => "10001011" & x"00A01FFF" & x"00A01000",   --L='1', A="01", X='0', W='1', R='1'    TOR
    3 => "10001100" & x"00A01FFF" & x"00A01000",   --L='1', A="01", X='1', W='0', R='0'    TOR
    4 => "10001010" & x"0B020FFF" & x"0B020000",   --L='1', A="01", X='0', W='1', R='0'    TOR
    5 => "10010010" & x"DEADAFFE" & x"18237164",   --L='1', A="10", X='0', W='1', R='0'    NA4
    6 => "10010111" & x"ABBABABA" & x"29381840",   --L='1', A="10", X='1', W='1', R='1'    NA4
    7 => "10010001" & x"18273264" & x"10239578",   --L='1', A="10", X='0', W='0', R='1'    NA4
    8 => "10011110" & x"C00203FF" & x"C00203FF",   --L='1', A="11", X='1', W='1', R='0'    NAPOT
    9 => "10011001" & x"A2831FFF" & x"12341123",    --L='1', A="11", X='0', W='0', R='1'    NAPOT
    10 => "10011110" & x"BC00FFFF" & x"78633827",   --L='1', A="11", X='1', W='1', R='0'   NAPOT
    11 => "00000100" & x"12931234" & x"19475633",   --L='0', A="00", X='1', W='0', R='0'   not locked
    12 => "00011001" & x"82492374" & x"A000F004",   --L='0', A="11", X='0', W='0', R='1'   not locked
    13 => "10000011" & x"EFE10000" & x"CD911232",   --L='1', A="00", X='0', W='1', R='1'   OFF
    14 => "10000100" & x"ABB0FFFF" & x"12853178",   --L='1', A="00", X='1', W='0', R='0'   OFF
    15 => "00011011" & x"E1192381" & x"91826737"    --L='0', A="11", X='0', W='1', R='1'    not locked
    );
    
    
-- (1) = readWrite, (0) = instruction
constant stimulus_control : control_input(31 downto 0) :=
    (
    --functionality tests
    0 => "10", --readWrite = 1, instruction = 0,   NO ADDRESSS HIT
    1 => "11", --readWrite = 1, instruction = 1,   NO ADDRESSS HIT
    2 => "00", --readWrite = , instruction = 0,    READ ACCESS         TOR
    3 => "01", --readWrite = , instruction = 1,    ERROR EXPECTED      TOR
    4 => "10", --readWrite = , instruction = 0,    WRITE ACCESS        TOR
    5 => "10", --readWrite = , instruction = 0,    WRITE ACCESS        NA4
    6 => "01", --readWrite = , instruction = 1,    READ INSTRUCTION    NA4
    7 => "00", --readWrite = , instruction = 0,    READ ACCESS         NA4
    8 => "11", --readWrite = , instruction = 1,    WRITE INSTRUCTION   NAPOT
    9 => "00", --readWrite = , instruction = 0,    READ ACCESS         NAPOT
    10 => "10", --readWrite = , instruction = 0,   WRITE ACCESS        NAPOT
    11 => "11", --readWrite = , instruction = 1,   NO ADDRESSS HIT
    12 => "10", --readWrite = , instruction = 0,   NO ADDRESSS HIT
    13 => "10", --readWrite = , instruction = 0,   NO ADDRESSS HIT
    14 => "11", --readWrite = , instruction = 1,   NO ADDRESSS HIT
    15 => "00", --readWrite = , instruction = 0,   NO ADDRESSS HIT
    --error tests
    16 => "11", --readWrite = , instruction = , NO ADDRESSS HIT
    17 => "10", --readWrite = , instruction = , NO ADDRESSS HIT
    18 => "11", --readWrite = , instruction = , ERROR EXPECTED     TOR
    19 => "10", --readWrite = , instruction = , ERROR EXPECTED     TOR
    20 => "10", --readWrite = , instruction = , WRITE ACCESS       TOR
    21 => "11", --readWrite = , instruction = , ERROR EXPECTED     NA4
    22 => "00", --readWrite = , instruction = , READ ACCESS        NA4
    23 => "11", --readWrite = , instruction = , ERROR EXPECTED     NA4
    24 => "10", --readWrite = , instruction = , WRITE ACCESS       NAPOT
    25 => "00", --readWrite = , instruction = , READ ACCESS        NAPOT
    26 => "01", --readWrite = , instruction = , ERROR EXPECTED     NAPOT
    27 => "10", --readWrite = , instruction = , NO ADDRESSS HIT
    28 => "01", --readWrite = , instruction = , NO ADDRESSS HIT
    29 => "11", --readWrite = , instruction = , NO ADDRESSS HIT
    30 => "10", --readWrite = , instruction = , NO ADDRESSS HIT
    31 => "11"  --readWrite = , instruction = , NO ADDRESSS HIT
    );
    
--(67 downto 34) = address, (33 downto 0) = address_upper
constant stimulus_address : addr_input(31 downto 0) := 
    (
    --functionality tests
    0 => x"BADC0DED" & "00" & x"18273912" & "00",   --NO ADDRESSS HIT
    1 => x"DEADAFFE" & "00" & x"01938123" & "01",   --NO ADDRESSS HIT
    2 => x"00A01234" & "00" & x"00A01234" & "11",   --READ ACCESS         TOR
    3 => x"00A01234" & "01" & x"00A01235" & "00",   --ERROR EXPECTED      TOR
    4 => x"0B020032" & "11" & x"0B020033" & "10",   --WRITE ACCESS        TOR
    5 => x"DEADAFFE" & "00" & x"DEADAFFE" & "11",   --WRITE ACCESS        NA4
    6 => x"ABBABABA" & "10" & x"ABBABABA" & "11",   --READ INSTRUCTION    NA4
    7 => x"18273264" & "01" & x"18273264" & "10",   --READ ACCESS         NA4
    8 => x"C0020412" & "01" & x"C0020413" & "00",   --WRITE INSTRUCTION   NAPOT
    9 => x"A2830ABC" & "10" & x"A2830ABD" & "01",   --READ ACCESS         NAPOT
    10 => x"BC00DEAD" & "00" & x"BC00DEAD" & "11",  --WRITE ACCESS        NAPOT
    11 => x"00A01234" & "00" & x"00A01234" & "11",  --NO ADDRESSS HIT
    12 => x"00A01234" & "01" & x"00A01235" & "00",  --NO ADDRESSS HIT
    13 => x"0B020032" & "11" & x"0B020033" & "10",  --NO ADDRESSS HIT
    14 => x"DEADAFFE" & "00" & x"0B020033" & "11",  --NO ADDRESSS HIT
    15 => x"ABBABABA" & "10" & x"0B020033" & "00",  --NO ADDRESSS HIT
    --error tests
    16 => x"BADC0DED" & "00" & x"18273912" & "00",    --NO ADDRESSS HIT
    17 => x"DEADAFFE" & "00" & x"01938123" & "01",    --NO ADDRESSS HIT
    18 => x"00A01234" & "00" & x"00A01234" & "11",    --ERROR EXPECTED     TOR
    19 => x"00A01234" & "01" & x"00A01235" & "00",    --ERROR EXPECTED     TOR
    20 => x"0C020032" & "11" & x"0C020033" & "10",    --NO ADDRESSS HIT    TOR
    21 => x"DEADAFFE" & "00" & x"DEADAFFE" & "11",    --WRITE ACCESS       NA4
    22 => x"ABCABABA" & "10" & x"ABCABABA" & "11",    --NO ADDRESSS HIT    NA4
    23 => x"18273264" & "01" & x"18273264" & "10",    --ERROR EXPECTED     NA4
    24 => x"C0F20412" & "01" & x"C0F20413" & "00",    --NO ADDRESSS HIT    NAPOT
    25 => x"A28E0ABC" & "10" & x"A28E0ABD" & "01",    --NO ADDRESSS HIT    NAPOT
    26 => x"BC00DEAD" & "00" & x"BC00DEAD" & "11",    --ERROR EXPECTED     NAPOT
    27 => x"00A01234" & "00" & x"00A01234" & "11",    --NO ADDRESSS HIT
    28 => x"00A01234" & "01" & x"00A01235" & "00",    --NO ADDRESSS HIT
    29 => x"0B020032" & "11" & x"0B020033" & "10",    --NO ADDRESSS HIT
    30 => x"DEADAFFE" & "00" & x"0B020033" & "11",    --NO ADDRESSS HIT
    31 => x"ABBABABA" & "10" & x"0B020033" & "00"     --NO ADDRESSS HIT
    );

--(3) = instruction_afe_P, (2) = storeAMO_afe_P, (1) = load_afe_P, (0) = address_hit
constant verify_output : unit_output(31 downto 0) := 
    (
    --functionality tests
    0 => "0000",   --NO ADDRESSS HIT
    1 => "0000",   --NO ADDRESSS HIT
    2 => "0001",   --READ ACCESS         TOR
    3 => "0011",   --ERROR EXPECTED      TOR
    4 => "0001",   --WRITE ACCESS        TOR
    5 => "0001",   --WRITE ACCESS        NA4
    6 => "0001",   --READ INSTRUCTION    NA4
    7 => "0001",   --READ ACCESS         NA4
    8 => "0001",   --WRITE INSTRUCTION   NAPOT
    9 => "0001",   --READ ACCESS         NAPOT
    10 => "0001",  --WRITE ACCESS        NAPOT
    11 => "0000",  --NO ADDRESSS HIT
    12 => "0000",  --NO ADDRESSS HIT
    13 => "0000",  --NO ADDRESSS HIT
    14 => "0000",  --NO ADDRESSS HIT
    15 => "0000",  --NO ADDRESSS HIT
    --error tests
    16 => "0000",    --NO ADDRESSS HIT
    17 => "0000",    --NO ADDRESSS HIT
    18 => "1001",    --ERROR EXPECTED     TOR
    19 => "0101",    --ERROR EXPECTED     TOR
    20 => "0000",    --NO ADDRESSS HIT    TOR
    21 => "1001",    --ERROR EXPECTED     NA4
    22 => "0000",    --NO ADDRESSS HIT    NA4
    23 => "1001",    --ERROR EXPECTED     NA4
    24 => "0000",    --NO ADDRESSS HIT    NAPOT
    25 => "0000",    --NO ADDRESSS HIT    NAPOT
    26 => "0011",    --ERROR EXPECTED     NAPOT
    27 => "0000",    --NO ADDRESSS HIT
    28 => "0000",    --NO ADDRESSS HIT
    29 => "0000",    --NO ADDRESSS HIT
    30 => "0000",    --NO ADDRESSS HIT
    31 => "0000"     --NO ADDRESSS HIT
);
end sim_PMP_unit_UV_1_pkg;
