----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: PMP_PMA_checker
-- Module Name: sim_PMP_checker_UV_1_pkg - 
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat for the 
--  sim_PMP_checker_UV_1_tb.vhd testbench.
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
package sim_PMP_checker_UV_1_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type address_stim is array(natural range <>) of std_logic_vector(31 downto 0);
--control_stim(3) = readWrite, control_stim(2) = instruction, control_stim(1 downto 0) = size
type control_stim is array(natural range <>) of std_logic_vector(3 downto 0);
--result_vect(3) = enable_PMP, result_vect(2) = load_afe_P, result(1) = storeAMO_afe_P, result(0) = instruction_afe_P
type result_vect is array(natural range <>) of std_logic_vector(3 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant stimulus_address : address_stim(35 downto 0) :=
    (
    --functionality tests
    --ROM0
    0 => x"0001" & x"1000",     --instruction fetch
    1 => x"00FF" & x"FFFF",     --byte read
    --RAM1
    2 => x"0100" & x"0000",     --instruction write
    3 => x"0103" & x"1273",     --write
    --ROM1
    4 => x"0200" & x"DEAD",     --read
    5 => x"02FF" & x"FFFF",     --single byte read
    --RAM1
    6 => x"2345" & x"6789",     --read
    7 => x"4FFF" & x"FFFE",     --half-word write 
    --RAM2
    8 => x"5000" & x"0000",     --read
    9 => x"5000" & x"001F",     --write
    --RAM3
    10 => x"5000" & x"0102",    --write
    11 => x"5000" & x"01FF",    --single-byte read
    --RAM4
    12 => x"5000" & x"02AB",    --read
    13 => x"5000" & x"0212",    --write
    --Region0
    14 => x"5000" & x"0302",    --instruction fetch => expect load and instruction_afe
    15 => x"5000" & x"034F",    --write => expect storeAMO_afe
    --Region1 
    16 => x"5000" & x"0400",    --word write
    17 => x"5000" & x"0402",    --half-word read
    --Region2
    18 => x"DEAD" & x"AFFE",    --write instruction
    19 => x"5000" & x"FFFF",    --read
    
    --error tests
    --ROM0
    20 => x"0001" & x"1000",    --write access
    21 => x"00FF" & x"FFFF",    --size = 4 => should not match => should be allowed
    --ROM1
    22 => x"0200" & x"DEAD",    --write acceess
    23 => x"02FF" & x"FFFF",    --write instruction
    --RAM1
    24 => x"2345" & x"6789",    --instruction fetch
    25 => x"4FFF" & x"FFFE",    --size = 4 => should not match
    --RAM2
    26 => x"5000" & x"0000",    --instruction write
    27 => x"5000" & x"001F",    --instruction fetch
    --RAM3
    28 => x"5000" & x"0102",    --instruction write
    29 => x"5000" & x"01FF",    --size = 2 => should not match => allowed & instruction fetch
    --RAM4
    30 => x"5000" & x"02AB",    --instruction write
    31 => x"5000" & x"0212",    --instruction fetch
    --Region0   
    32 => x"5000" & x"0302",    --load/read
    33 => x"5000" & x"034F",    --store/write
    --Region1 
    34 => x"5000" & x"0400",    --instruction fetch
    35 => x"5000" & x"0402"     --instruction fetch, size 4, should work
    );
--control_stim(3) = readWrite, control_stim(2) = instruction, control_stim(1 downto 0) = size
constant stimulus_control : control_stim(35 downto 0) :=
    (
    --functionality tests
    --ROM0
    0 => "0110",     --instruction fetch
    1 => "0000",     --byte read
    --RAM1
    2 => "1110",     --instruction write
    3 => "1010",     --write
    --ROM1
    4 => "0010",     --read
    5 => "0000",     --single byte read
    --RAM1
    6 => "0010",     --read
    7 => "0001",     --half-word write 
    --RAM2
    8 => "0010",     --read
    9 => "1010",     --write
    --RAM3
    10 => "1010",    --write
    11 => "0000",    --single-byte read
    --RAM4
    12 => "0010",    --read
    13 => "1010",    --write
    --Region0
    14 => "0110",    --instruction fetch => expect load and instruction_afe
    15 => "1010",    --write => expect storeAMO_afe
    --Region1 
    16 => "1010",    --word write
    17 => "0001",    --half-word read
    --Region2
    18 => "1110",    --write instruction
    19 => "0010",    --read
    
    --error tests
    --ROM0
    20 => "1010",    --write access
    21 => "1110",    --size = 4 => should not match => should be allowed
    --ROM1
    22 => "1010",    --write acceess
    23 => "1100",    --write instruction
    --RAM1
    24 => "0110",    --instruction fetch
    25 => "1110",    --size = 4 => should not match
    --RAM2
    26 => "1110",    --instruction write
    27 => "0110",    --instruction fetch
    --RAM3
    28 => "1110",    --instruction write
    29 => "0101",    --size = 2 => should not match => allowed & instruction fetch
    --RAM4
    30 => "1110",    --instruction write
    31 => "0110",    --instruction fetch
    --Region0   
    32 => "0010",    --load/read
    33 => "1010",    --store/write
    --Region1 
    34 => "0110",    --instruction fetch
    35 => "0110"     --instruction fetch, size 4, should work
    );
    
--result_vect(3) = enable_PMP, result_vect(2) = load_afe_P, result(1) = storeAMO_afe_P, result(0) = instruction_afe_P
constant results : result_vect :=
    (
    --functionality tests
    --ROM0
    0 => "1000",     --instruction fetch
    1 => "1000",     --byte read
    --RAM1
    2 => "1000",     --instruction write
    3 => "1000",     --write
    --ROM1
    4 => "1000",     --read
    5 => "1000",     --single byte read
    --RAM1
    6 => "1000",     --read
    7 => "1000",     --half-word write 
    --RAM2
    8 => "1000",     --read
    9 => "1000",     --write
    --RAM3
    10 => "1000",    --write
    11 => "1000",    --single-byte read
    --RAM4
    12 => "1000",    --read
    13 => "1000",    --write
    --Region0
    14 => "0101",    --instruction fetch => expect load and instruction_afe
    15 => "0010",    --write => expect storeAMO_afe
    --Region1 
    16 => "1000",    --word write
    17 => "1000",    --half-word read
    --Region2
    18 => "1000",    --write instruction
    19 => "1000",    --read
    
    --error tests
    --ROM0
    20 => "0010",    --write access
    21 => "1000",    --size = 4 => should not match => should be allowed
    --ROM1
    22 => "0010",    --write acceess
    23 => "0011",    --write instruction
    --RAM1
    24 => "0001",    --instruction fetch
    25 => "1000",    --size = 4 => should not match
    --RAM2
    26 => "0001",    --instruction write
    27 => "0001",    --instruction fetch
    --RAM3
    28 => "0001",    --instruction write
    29 => "1000",    --size = 2 => should not match => allowed & instruction fetch
    --RAM4
    30 => "0001",    --instruction write
    31 => "0001",    --instruction fetch
    --Region0   
    32 => "0100",    --load/read
    33 => "0010",    --store/write
    --Region1 
    34 => "0001",    --instruction fetch
    35 => "1000"     --instruction fetch, size 4, should work
    );
end sim_PMP_checker_UV_1_pkg;

