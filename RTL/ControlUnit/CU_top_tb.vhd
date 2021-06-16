----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Noah Woelki 
-- 
-- Create Date: 08.06.2021 16:09:45
-- Design Name: 
-- Module Name: CU_top_tb - Behavioral
-- Project Name: EDRICO
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for Control Unit top
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
use ieee.numeric_std.all;

--add libraries
library CU_lib;
use CU_lib.CU_pkg.ALL;
use CU_lib.CU_top_tb_pkg.ALL;

entity CU_top_tb is
end CU_top_tb;

architecture rtl of CU_top_tb is
component CU_top
port(
------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------ 
    --reset and clock signals
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    --FSM control signals
    memOP_finished : in STD_LOGIC;
    halt_core : in STD_LOGIC;
    --IR signals
    store_systemData : in STD_LOGIC;
    IR_inp : in STD_LOGIC_VECTOR (31 downto 0);
    --PC data input
    data_bus_B : in STD_LOGIC_VECTOR (31 downto 0);
    branch_re : in std_logic;
    --PC dra signals
    PC_dra : in STD_LOGIC_VECTOR(31 downto 0);
    pc_write : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------ 
    --register outputs
    IR_dra : out STD_LOGIC_VECTOR (31 downto 0);
    PC_out : out STD_LOGIC_VECTOR (31 downto 0);
    --PMP control signals
    PMP_enable : out STD_LOGIC;
    PMP_instruction : out STD_LOGIC;
    PMP_size : out STD_LOGIC_VECTOR (1 downto 0);
    PMP_rw : out STD_LOGIC;
    --MUX control signals
    DMU_IN_MUX_ctrl : out STD_LOGIC;
    DMU_OUT_MUX_ctrl : out STD_LOGIC;
    R_MUX_ctrl : out STD_LOGIC;
    PMP_MUX_ctrl : out STD_LOGIC;
    B_MUX_ctrl : out STD_LOGIC;
    A_MUX_ctrl : out STD_LOGIC_VECTOR(1 downto 0);
    --RV32I RF control signals
    register_read_A : out STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : out STD_LOGIC_VECTOR (4 downto 0);
    register_write : out STD_LOGIC_VECTOR (4 downto 0);
    --CSR control signals
    CSR_address : out STD_LOGIC_VECTOR (11 downto 0);
    save_CSR : out STD_LOGIC;
    write_CSR : out STD_LOGIC;
    read_CSR : out STD_LOGIC;
    --ALU control signals
    ALU_OP : out STD_LOGIC_VECTOR (3 downto 0);
    --data mask unit control signals
    mask_ctrl : out STD_LOGIC_VECTOR (2 downto 0);
    --exception and return signals
    iie_CU : out STD_LOGIC;
    ece_CU : out STD_LOGIC;
    be_CU : out STD_LOGIC;
    ret : out STD_LOGIC;
    --immediate
    immediate : out STD_LOGIC_VECTOR (31 downto 0);
    --instruction finished flag
    instr_finished : out STD_LOGIC
);
end component;
--signals
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------ 
    --reset and clock signals
    signal reset : STD_LOGIC;
    signal clk : STD_LOGIC := '1';
     --FSM control signals
    signal memOP_finished : STD_LOGIC;
    signal halt_core : STD_LOGIC;
     --IR signals
    signal store_systemData : STD_LOGIC;
    signal IR_inp : STD_LOGIC_VECTOR (31 downto 0);
     --PC data input
    signal data_bus_B : STD_LOGIC_VECTOR (31 downto 0);
    signal branch_re : std_logic;
     --PC dra signals
    signal PC_dra : STD_LOGIC_VECTOR(31 downto 0);
    signal pc_write : STD_LOGIC;
     ------------------------------------------------------------------------------
     --output signals
     ------------------------------------------------------------------------------ 
     --register outputs
    signal IR_dra : STD_LOGIC_VECTOR (31 downto 0);
    signal PC_out : STD_LOGIC_VECTOR (31 downto 0);
     --PMP control signals
    signal PMP_enable : STD_LOGIC;
    signal PMP_instruction : STD_LOGIC;
    signal PMP_size : STD_LOGIC_VECTOR (1 downto 0);
    signal PMP_rw : STD_LOGIC;
     --MUX control signals
    signal DMU_IN_MUX_ctrl : STD_LOGIC;
    signal DMU_OUT_MUX_ctrl : STD_LOGIC;
    signal R_MUX_ctrl : STD_LOGIC;
    signal PMP_MUX_ctrl : STD_LOGIC;
    signal B_MUX_ctrl : STD_LOGIC;
    signal A_MUX_ctrl : STD_LOGIC_VECTOR(1 downto 0);
     --RV32I RF control signals
    signal register_read_A : STD_LOGIC_VECTOR (4 downto 0);
    signal register_read_B : STD_LOGIC_VECTOR (4 downto 0);
    signal register_write : STD_LOGIC_VECTOR (4 downto 0);
     --CSR control signals
    signal CSR_address : STD_LOGIC_VECTOR (11 downto 0);
    signal save_CSR : STD_LOGIC;
    signal write_CSR : STD_LOGIC;
    signal read_CSR : STD_LOGIC;
     --ALU control signals
    signal ALU_OP : STD_LOGIC_VECTOR (3 downto 0);
     --data mask unit control signals
    signal mask_ctrl : STD_LOGIC_VECTOR (2 downto 0);
     --exception and return signals
    signal iie_CU : STD_LOGIC;
    signal ece_CU : STD_LOGIC;
    signal be_CU : STD_LOGIC;
    signal ret : STD_LOGIC;
     --immediate
    signal immediate : STD_LOGIC_VECTOR (31 downto 0);
     --instruction finished flag
    signal instr_finished : STD_LOGIC;
   
constant T : time := 5 ns;
begin


dut: CU_top port map(
    --input
    reset => reset,
    clk => clk,
    memOP_finished => memOP_finished,
    halt_core => halt_core,
    store_systemData => store_systemData,
    IR_inp => IR_inp,
    data_bus_B => data_bus_B, 
    branch_re => branch_re,
    PC_dra => PC_dra,
    pc_write => pc_write,
    --output
    IR_dra => IR_dra,
    PC_out => PC_out,
    PMP_enable => PMP_enable,
    PMP_instruction => PMP_instruction,
    PMP_size => PMP_size,
    PMP_rw => PMP_rw,
    DMU_IN_MUX_ctrl => DMU_IN_MUX_ctrl,
    DMU_OUT_MUX_ctrl => DMU_OUT_MUX_ctrl,
    R_MUX_ctrl => R_MUX_ctrl,
    PMP_MUX_ctrl => PMP_MUX_ctrl,
    B_MUX_ctrl => B_MUX_ctrl,
    A_MUX_ctrl => A_MUX_ctrl,
    register_read_A => register_read_A,
    register_read_B => register_read_B,
    register_write => register_write,
    CSR_address => CSR_address,
    save_CSR => save_CSR,
    write_CSR => write_CSR,
    read_CSR => read_CSR,
    ALU_OP => ALU_OP,
    mask_ctrl => mask_ctrl,
    iie_CU => iie_CU,
    ece_CU => ece_CU, 
    be_CU => be_CU,
    ret => ret, 
    immediate => immediate,
    instr_finished => instr_finished
);
clk <= not clk after T/2;
sim: process
-- first 4 cycles of instruction


-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
-- | CC | Action  |                  Description                   |                               Signals                                |
-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
-- |  1 | rising  | pass PC and read/instruction/enable for PMP    | PC_dra(s), PMP_enable(c), PMP_instruction(s), PMP_size(s), PMP_rw(s) |
-- |  1 | falling | no action ???                                  |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  2 | rising  | PC Control adds +4 to PC                       | PC_out(c)                                                            |
-- |  2 | falling | no action ???                                  |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  3 | rising  | no action                                      |                                                                      |
-- |  3 | falling | no action                                      |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  4 | rising  | Instruction read -> start decode               | IR_inp(s), store_systemData(s), memOP_finished(s), IR_dra(c)         |
-- |  4 | falling | All signals must be stable, execute_enable set | PMP_enable(c) to immediate(c)                                        |
-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    reset <= '1';
    wait for 22.5 ns;
    reset <= '0';
    PC_dra <= ctrl_signals(1)(32 downto 1);
    wait for 2.5ns;
    --rising clock

    for i in 0 to 63 loop
        error_flag := false;
        -- first clock cycle -> fetching instruction
        data_bus_b <= ctrl_signals(i)(65 downto 34);
        reset <= ctrl_signals(i)(69);
        halt_core <= ctrl_signals(i)(67);
        branch_re <= ctrl_signals(i)(33);
        PC_write <= ctrl_signals(i)(0);
        wait for 5 ns;
        --clock cycle 2
        --check for correct PC after reading instruction
        --if(results(i)(117 downto 86) /= PC_out) then
        --    report "Error at PC iteration: " & integer'image(i) severity error;
        --    error_flag := true;
        --    error_cnt := error_cnt + 1;
        --end if;

        wait for 5 ns;
        --clock cycle 3 no action -> waiting for PMP to read instruction
        wait for 2.3 ns;
        --clock cycle 4 -> instruction read -> start decode
        IR_inp <= instruction(i);
        store_systemData <= ctrl_signals(i)(66);
        memOP_finished <= ctrl_signals(i)(68);
        wait for 2.7 ns;
        --check output IR_dra
        if(results(i)(149 downto 118) /= IR_dra) then
            report "Instruction feed through " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        wait for 3 ns; 
        store_systemData <= not ctrl_signals(i)(66);
        memOP_finished <= not ctrl_signals(i)(68);
        wait for 1 ns;
        -- falling clock 4 -> all signals must be stable
        if(results(i)(85) /= PMP_enable) then
            report "PMP_enable " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(84) /= PMP_instruction) then
            report "PMP_instruction " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(83 downto 82) /= PMP_size) then
            report "PMP_size " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(81) /= PMP_rw) then
            report "PMP_rw " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(80) /= DMU_IN_MUX_ctrl) then
            report "DMU_IN_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(79) /= DMU_OUT_MUX_ctrl) then
            report "DMU_OUT_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(78) /= R_MUX_ctrl) then
            report "R_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(77) /= PMP_MUX_ctrl) then
            report "PMP_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(76) /= B_MUX_ctrl) then
            report "B_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(75 downto 74) /= A_MUX_ctrl) then
            report "A_MUX_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(73 downto 69) /= register_read_A) then
            report "register_read_A " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(68 downto 64) /= register_read_B) then
            report "register_read_B " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(63 downto 59) /= register_write) then
            report "register_write " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(58 downto 47) /= CSR_address) then
            report "CSR_address " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(46) /= save_CSR) then
            report "save_CSR " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(45) /= write_CSR) then
            report "write_CSR " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(44) /= read_CSR) then
            report "read_CSR " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(43 downto 40) /= ALU_OP) then
            report "ALU_OP " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(39 downto 37) /= mask_ctrl) then
            report "mask_ctrl " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(36) /= iie_CU) then
            report "iie_CU " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(35) /= ece_CU) then
            report "ece_CU " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(34) /= be_CU) then
            report "be_CU " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(33) /= ret) then
            report "ret " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(32 downto 1) /= immediate) then
            report "immediate " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;  
        if(results(i)(0) /= instr_finished) then
            report "instr_finished " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;

        wait for 2.5 ns;
        --rising clk 5
        --FSM should be in wait state
        --registers loading and ALU executing instructions

        if(i > 31) and (i < 38) then
            --if memory operation, FSM goes to execute_mem state
            --FSM in exeucte_mem state
            --check for correct FSM output signals:
            if('0' /= PMP_enable) then
                report "PMP_enable " & integer'image(i) severity error;
                error_flag := true;
                error_cnt := error_cnt + 1;
            end if;
            if('0' /= PMP_instruction) then
                report "PMP_instruction " & integer'image(i) severity error;
                error_flag := true;
                error_cnt := error_cnt + 1;
            end if;
            if("00" /= PMP_size) then
                report "PMP_size " & integer'image(i) severity error;
                error_flag := true;
                error_cnt := error_cnt + 1;
            end if;
            if('0' /= PMP_rw) then
                report "PMP_rw " & integer'image(i) severity error;
                error_flag := true;
                error_cnt := error_cnt + 1;
            end if;
            if('0' /= instr_finished) then
                report "instr_finished " & integer'image(i) severity error;
                error_flag := true;
                error_cnt := error_cnt + 1;
            end if;

            --for FSM to go to next state memOp_finished and storeSystemData must be set
            wait for 5 ns;
            --rising clk6 should still be in memory operation
            wait for 2.7 ns;
            store_systemData <= ctrl_signals(i)(66);
            memOP_finished <= ctrl_signals(i)(68);
            wait for 1.3 ns;
            --rising clk7 should come with memOpFinished and store_systemData     
            --current FSM state: wait


        end if;

        wait for 2.5 ns; 
        --falling clk 5/falling clk 8 for STORE/LOAD
        store_systemData <= not ctrl_signals(i)(66);
        memOP_finished <= not ctrl_signals(i)(68);        
        wait for 5 ns;
        --new instruction                      
 
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        

    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;



end rtl;
