----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/20/2021 09:30:17 AM
-- Design Name: sim_EC_arbiter_UV_1
-- Module Name: EC_arbiter_UV_1_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This package contains the stimulus and verification data for the 
--  EC_arbiter_UV_1_tb testbench.
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
package EC_arbiter_UV_1_pkg is

----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type arbiter_result is array(19 downto 0) of std_logic_vector(36 downto 0);
type arbiter_stim is array(19 downto 0) of std_logic_vector(14 downto 0);

----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant results : arbiter_result := (
0 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '0', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
1 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
2 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '0', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
3 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '0', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
4 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '1', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
5 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '0', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
6 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '0', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
7 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
8 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '0', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '1', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
9 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '1', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
10 => (
     4 => '0', 3 => '1', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
11 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '1', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
12 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '1', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
13 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '1' --expected interrupt signal
    ),
    
14 => (
     4 => '0', 3 => '0', 2 => '1', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '1' --expected interrupt signal
    ),
    
15 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '1' --expected interrupt signal
    ),
    
16 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '1' --expected interrupt signal
    ),
    
17 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '1', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    ),
    
18 => (
     4 => '0', 3 => '0', 2 => '0', 1 => '1', 0 => '1', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '1', --expected EI_flag signal
    36 => '1' --expected interrupt signal
    ),
    
19 => (
     4 => '1', 3 => '0', 2 => '0', 1 => '0', 0 => '0', --excpected ExceptionCode
    31 downto 5 => '0', --excpected ExceptionCode
    32 => '0', --expected save_address signal 
    33 => '0', --expected save_IR signal
    34 => '0', --expected save_PC signal
    35 => '0', --expected EI_flag signal
    36 => '0' --expected interrupt signal
    )
    
);

constant stimulus : arbiter_stim :=
(
0=> (
    0 => '1',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),
      
1=> (
    0 => '0',	--load_afe_P
    1 => '1',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  

2=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '1',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  

3=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '1',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
4=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '1',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
5=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '1',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
6=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '1',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
   
7=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '1',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
8=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '1',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
9=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '1',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
10=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '1',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
11=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '1',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
12=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '1',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),
    
13=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '1',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
14=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '1'	--ti_CSR
    ),  
    
15=> (
    0 => '1',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '1',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
16=> (
    0 => '1',	--load_afe_P
    1 => '1',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '1',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '1',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
17=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '1',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '1',	--load_afe_AXI
    7 => '1',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '1',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ),  
    
18=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '1',	--si_CSR
    14 => '1'	--ti_CSR
    ),  
    
19=> (
    0 => '0',	--load_afe_P
    1 => '0',	--storeAMO_afe_P
    2 => '0',	--instruction_afe_P
    3 => '0',	--load_ame_P
    4 => '0',	--storeAMO_ame_P
    5 => '0',	--instruction_ame_P
    6 => '0',	--load_afe_AXI
    7 => '0',	--storeAMO_afe_AXI
    8 => '0',	--instruction_afe_AXI
    9 => '0',	--iie_CU
    10 => '0',	--ece_CU
    11 => '0',	--be_CU
    12 => '0',	--iie_CSR
    13 => '0',	--si_CSR
    14 => '0'	--ti_CSR
    ) 
);

end EC_arbiter_UV_1_pkg;
