----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: 
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: 
-- Module Name: 
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat for the 
--  .vhd testbench.
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
package CU_top_tb_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
--data_stim(31 downto 0) = IR_inp
type data_stim is array(natural range <>) of std_logic_vector(31 downto 0);
--control_stim(69) = reset, control_stim(68) = memOP_finished, control_stim(67) = halt_core, control_stim(66) = store_systemData, control_stim(65 downto 34) = data_bus_b, control_stim(33) = branch_re, control_stim(32 downto 1) = PC_dra, control_stim(0) = PC_write
type control_stim is array(natural range <>) of std_logic_vector(69 downto 0);

type result_vec is array(natural range <>) of std_logic_vector(149 downto 0);
--(IR_dra(149 downto 118), PC_out(117 downto 86), PMP_enable(85), PMP_instruction(84), PMP_size(83 downto 82), PMP_rw(81), DMU_IN_MUX_ctrl(80), DMU_OUT_MUX_ctrl(79), R_MUX_ctrl(78), PMP_MUX_ctrl(77), B_MUX_ctrl(76), A_MUX_ctrl(75 downto 74), register_read_A(73 downto 69), register_read_B(68 downto 64), register_write(63 downto 59), CSR_address(58 downto 47), save_CSR(46), write_CSR(45), read_CSR(44), ALU_OP(43 downto 40), mask_ctrl(39 downto 37), iie_CU(36), ece_CU(35), be_CU(34), ret(33), immediate(32 downto 1), instr_finished(0))

constant instruction : data_stim(38 downto 0) :=
    (
    0 => "00010000010100000000000001110011",    --WFI (NOP)
    --OPIMM
    1 => "00000000001000100000000010010011",    --ADDI
    2 => "00000000001000100010000010010011",    --SLTI
    3 => "00000000001000100011000010010011",    --SLTIU
    4 => "00000000001000100100000010010011",    --XORI
    5 => "00000000001000100110000010010011",    --ORI
    6 => "00000000001000100111000010010011",    --ANDI
    7 => "00000000010000100001000010010011",    --SLLI
    8 => "00000000010000100101000010010011",    --SRLI
    9 => "01000000010000100101000010010011",    --SLAI
    --OP
    10 => "00000000010000100000000010110011",   --ADD
    11 => "01000000010000100000000010110011",   --SUB
    12 => "00000000010000100001000010110011",   --SLL
    13 => "00000000010000100010000010110011",   --SLT
    14 => "00000000010000100011000010110011",   --SLTU
    15 => "00000000010000100100000010110011",   --XOR
    16 => "00000000010000100101000010110011",   --SRL
    17 => "01000000010000100101000010110011",   --SRA
    18 => "00000000010000100110000010110011",   --OR
    19 => "00000000010000100111000010110011",   --AND
    --LUI/AUIPC
    20 => "00000000000000000111000010110111",   --LUI
    21 => "00000000000000000111000010010111",   --AUIPC
    --JAL/JALR
    22 => "00000100000100001001000011101111",   --JAL
    23 => "00000010101000100000000011100111",   --JALR
    --BRANCH
    24 => "10000010011100100000100011100011",   --BEQ
    25 => "10000100011100100110100101100011",   --BLTU
    --SYSTEM
    26 => "00000000000000000000000001110011",   --ECALL
    27 => "00000000000100000000000001110011",   --EBREAK
    28 => "00110000001000000000000001110011",   --MRET
    29 => "00010000010100000000000001110011",   --WFI
    --CSRR
    30 => "00000000010000110001001001110011",   --CSRRW
    31 => "00000000010000100101001001110011",   --CSRRWI
    --LOAD
    32 => "00000000001000001000001000000011",   --LB
    33 => "00000000001000001001001000000011",   --LH
    34 => "00000000001000001010001000000011",   --LW
    --STORE
    35 => "00000000000100100000010000100011",   --SB
    36 => "00000000000100100001010000100011",   --SH
    37 => "00000000000100100010010000100011",   --SW
    --ILLEGAL
    38 => "00000000000100100010010000000000"    --ILLEGAL INSTRUCTION
    );

--control_stim() = (reset, memOP_finished, halt_core, store_systemData, data_bus_B, branch_re, PC_dra, PC_write)
constant ctrl_signals : control_stim(38 downto 0) :=
    (
    0 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0' ,    --WFI (NOP)
    --OPIMM
    1 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --ADDI
    2 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --SLTI
    3 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --SLTIU
    4 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --XORI
    5 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --ORI
    6 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --ANDI
    7 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --SLLI
    8 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --SRLI
    9 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',    --SLAI
    --OP
    10 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --ADD
    11 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SUB
    12 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SLL
    13 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SLT
    14 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SLTU
    15 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --XOR
    16 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SRL
    17 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SRA
    18 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --OR
    19 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --AND
    --LUI/AUIPC
    20 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --LUI
    21 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --AUIPC
    --JAL/JALR
    22 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --JAL
    23 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --JALR
    --BRANCH
    24 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --BEQ
    25 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --BLTU
    --SYSTEM
    26 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --ECALL
    27 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --EBREAK
    28 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --MRET
    29 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --WFI
    --CSRR
    30 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --CSRRW
    31 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --CSRRWI
    --LOAD
    32 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --LB
    33 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --LH
    34 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --LW
    --STORE
    35 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SB
    36 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SH
    37 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0',   --SW
    --ILLEGAL
    38 => '0' & '0' & '0' & '0' & x"00000000" & '0' & x"00000000" & '0'    --ILLEGAL INSTRUCTION
    );

--(IR_dra(149 downto 118), PC_out(117 downto 86), PMP_enable(85), PMP_instruction(84), PMP_size(83 downto 82), PMP_rw(81), DMU_IN_MUX_ctrl(80), DMU_OUT_MUX_ctrl(79), R_MUX_ctrl(78), PMP_MUX_ctrl(77), B_MUX_ctrl(76), A_MUX_ctrl(75 downto 74), register_read_A(73 downto 69), register_read_B(68 downto 64), register_write(63 downto 59), CSR_address(58 downto 47), save_CSR(46), write_CSR(45), read_CSR(44), ALU_OP(43 downto 40), mask_ctrl(39 downto 37), iie_CU(36), ece_CU(35), be_CU(34), ret(33), immediate(32 downto 1), instr_finished(0))
constant results : result_vec(38 downto 0) :=
(
    0 => x"00000000" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',    --WFI (NOP)
    --OPIMM
    1 => x"00220093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --ADDI
    2 => x"00222093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1010" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --SLTI
    3 => x"00223093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1011" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --SLTIU
    4 => x"00224093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0100" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --XORI
    5 => x"00226093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0011" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --ORI
    6 => x"00227093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0010" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '1',    --ANDI
    7 => x"00421093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0111" & "100" & '0' & '0' & '0' & '0' & x"00000004" & '1',    --SLLI
    8 => x"00425093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1000" & "100" & '0' & '0' & '0' & '0' & x"00000004" & '1',    --SRLI
    9 => x"40425093" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1001" & "100" & '0' & '0' & '0' & '0' & x"00000004" & '1',    --SRAI
    --OP
    10 => x"004200B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --ADD
    11 => x"404200B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0001" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SUB
    12 => x"004210B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0111" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SLL
    13 => x"004220B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1010" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SLT
    14 => x"004230B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1011" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SLTU
    15 => x"004240B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0100" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --XOR
    16 => x"004250B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SRL
    17 => x"404250B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "1001" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --SRA
    18 => x"004260B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0011" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --OR
    19 => x"004270B3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "10" & "00100" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0010" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --AND
    --LUI/AUIPC
    20 => x"000070B7" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00000" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00007000" & '0',   --LUI
    21 => x"00007097" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '0' & "01" & "00000" & "00000" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00007000" & '0',   --AUIPC
    --JAL/JALR
    22 => x"041090EF" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '0' & "00" & "00000" & "00000" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00004C20" & '0',   --JAL
    23 => x"02A200E7" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '0' & "00" & "00000" & "00100" & "00001" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"0000002A" & '0',   --JALR
    --BRANCH
    24 => x"827208E3" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '1' & "10" & "00111" & "00100" & "00000" & "000000000000" & '0' & '0' & '0' & "0101" & "100" & '0' & '0' & '0' & '0' & x"FFFFFC18" & '0',   --BEQ
    25 => x"84726963" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '1' & "10" & "00111" & "00100" & "00000" & "000000000000" & '0' & '0' & '0' & "1011" & "100" & '0' & '0' & '0' & '0' & x"FFFFF829" & '0',   --BLTU
    --SYSTEM
    26 => x"00000073" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '1' & '0' & '0' & x"00000000" & '0',   --ECALL
    27 => x"00100073" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '1' & '0' & x"00000000" & '0',   --EBREAK
    28 => x"30200073" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '1' & x"00000000" & '0',   --MRET
    29 => x"10500073" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --WFI
    --CSRR
    30 => x"00431273" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00110" & "00100" & "000000000100" & '1' & '1' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0',   --CSRRW
    31 => x"00425273" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '1' & '0' & '1' & "01" & "00000" & "00100" & "00100" & "000000000100" & '1' & '1' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000004" & '0',   --CSRRWI
    --LOAD
    32 => x"00208203" & x"00000000" & '1' & '1' & "00" & '0' & '0' & '1' & '0' & '1' & '1' & "01" & "00000" & "00001" & "00100" & "000000000000" & '0' & '0' & '0' & "0000" & "000" & '0' & '0' & '0' & '0' & x"00000002" & '0',   --LB
    33 => x"00209203" & x"00000000" & '1' & '1' & "01" & '0' & '0' & '1' & '0' & '1' & '1' & "01" & "00000" & "00001" & "00100" & "000000000000" & '0' & '0' & '0' & "0000" & "010" & '0' & '0' & '0' & '0' & x"00000002" & '0',   --LH
    34 => x"0020A203" & x"00000000" & '1' & '1' & "10" & '0' & '0' & '1' & '0' & '1' & '1' & "01" & "00000" & "00001" & "00100" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000002" & '0',   --LW
    --STORE
    35 => x"00120423" & x"00000000" & '1' & '1' & "00" & '1' & '1' & '0' & '0' & '1' & '1' & "01" & "00001" & "00100" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "001" & '0' & '0' & '0' & '0' & x"00000008" & '0',   --SB
    36 => x"00121423" & x"00000000" & '1' & '1' & "01" & '1' & '1' & '0' & '0' & '1' & '1' & "01" & "00001" & "00100" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "011" & '0' & '0' & '0' & '0' & x"00000008" & '0',   --SH
    37 => x"00122423" & x"00000000" & '1' & '1' & "10" & '1' & '1' & '0' & '0' & '1' & '1' & "01" & "00001" & "00100" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000008" & '0',   --SW
    --ILLEGAL
    38 => x"00122400" & x"00000000" & '0' & '0' & "00" & '0' & '0' & '0' & '0' & '0' & '0' & "00" & "00000" & "00000" & "00000" & "000000000000" & '0' & '0' & '0' & "0000" & "100" & '0' & '0' & '0' & '0' & x"00000000" & '0'    --ILLEGAL INSTRUCTION    
);

end package;