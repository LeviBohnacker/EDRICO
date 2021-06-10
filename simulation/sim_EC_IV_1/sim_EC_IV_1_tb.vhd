----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: sim_EC_IV_1
-- Module Name: sim_EC_IV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the correct behaviour of the Exception Control top file
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

--add librarys
library EC_lib;
use EC_lib.sim_EC_IV_1_pkg.ALL;
use EC_lib.Exception_Controll_pkg.ALL;


----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_EC_IV_1_tb is
end sim_EC_IV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_EC_IV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --exception/interrupt signals
    signal load_afe_P : STD_LOGIC;
    signal storeAMO_afe_P : STD_LOGIC;
    signal instruction_afe_P : STD_LOGIC;
    signal load_ame_P : STD_LOGIC;
    signal storeAMO_ame_P : STD_LOGIC;
    signal instruction_ame_P : STD_LOGIC;
    signal load_afe_AXI : STD_LOGIC;
    signal storeAMO_afe_AXI : STD_LOGIC;
    signal instruction_afe_AXI : STD_LOGIC;
    signal iie_CU : STD_LOGIC;
    signal ece_CU : STD_LOGIC;
    signal be_CU : STD_LOGIC;
    signal iie_CSR : STD_LOGIC;
    signal si_CSR : STD_LOGIC;
    signal ti_CSR : STD_LOGIC;
    --data inputs
    signal data_in_EC : STD_LOGIC_VECTOR (31 downto 0);     --CSR input
    signal IR_dra : STD_LOGIC_VECTOR (31 downto 0);         --DRA input
    signal PMP_dra : STD_LOGIC_VECTOR (31 downto 0);
    signal PC_dra : STD_LOGIC_VECTOR (31 downto 0);
    --return signal
    signal ret : STD_LOGIC;
    --clock and reset
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR control
    signal CSR_read_EC : STD_LOGIC;
    signal CSR_write_EC : STD_LOGIC;
    signal CSR_address_EC : STD_LOGIC_VECTOR (11 downto 0);
    signal data_out_EC : STD_LOGIC_VECTOR (31 downto 0);
    --programm counter
    signal PC_dra_write : STD_LOGIC_VECTOR (31 downto 0);
    signal PC_write : STD_LOGIC;
    --halt core
    signal halt_core : STD_LOGIC;
    
    
    signal MEPC : STD_LOGIC_VECTOR (31 downto 0);
    signal MTVAL : STD_LOGIC_VECTOR (31 downto 0);
    signal MSTATUS : STD_LOGIC_VECTOR (31 downto 0);
    signal MTVEC : STD_LOGIC_VECTOR (31 downto 0);
    signal MCAUSE : STD_LOGIC_VECTOR (31 downto 0);
    
    
--test signals
signal iteration : integer := 0;
signal check : std_logic;


--testbench signals
constant T : time := 5 ns;

begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------

clk <= not clk after T/2;

sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 16 ns;
    for i in 0 to 15 loop
        error_flag := false;
        --declare inputs
        load_afe_P <= stimulus(i).load_afe_P;
        storeAMO_afe_P <= stimulus(i).storeAMO_afe_P;
        instruction_afe_P <= stimulus(i).instruction_afe_P;
        load_ame_P <= stimulus(i).load_ame_P;
        storeAMO_ame_P <= stimulus(i).storeAMO_ame_P;
        instruction_ame_P <= stimulus(i).instruction_ame_P;
        load_afe_AXI <= stimulus(i).load_afe_AXI;
        storeAMO_afe_AXI <= stimulus(i).storeAMO_afe_AXI;
        instruction_afe_AXI <= stimulus(i).instruction_afe_AXI;
        iie_CU <= stimulus(i).iie_CU;
        ece_CU <= stimulus(i).ece_CU;
        be_CU <= stimulus(i).be_CU;
        iie_CSR <= stimulus(i).iie_CSR;
        si_CSR <= stimulus(i).si_CSR;
        ti_CSR <= stimulus(i).ti_CSR;
        
        wait for 10 ns;
        check <= '0';
        --zero inputs
        load_afe_P <= stimulus(0).load_afe_P;
        storeAMO_afe_P <= stimulus(0).storeAMO_afe_P;
        instruction_afe_P <= stimulus(0).instruction_afe_P;
        load_ame_P <= stimulus(0).load_ame_P;
        storeAMO_ame_P <= stimulus(0).storeAMO_ame_P;
        instruction_ame_P <= stimulus(0).instruction_ame_P;
        load_afe_AXI <= stimulus(0).load_afe_AXI;
        storeAMO_afe_AXI <= stimulus(0).storeAMO_afe_AXI;
        instruction_afe_AXI <= stimulus(0).instruction_afe_AXI;
        iie_CU <= stimulus(0).iie_CU;
        ece_CU <= stimulus(0).ece_CU;
        be_CU <= stimulus(0).be_CU;
        iie_CSR <= stimulus(0).iie_CSR;
        si_CSR <= stimulus(0).si_CSR;
        ti_CSR <= stimulus(0).ti_CSR;
        
        wait for 6*T;
		--result checks
		check <= '1';
        if(results(i).PC /= PC_dra) then
            report "PC_dra error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).PC) & ", got: " & to_hstring(PC_dra) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i).MTVAL /= MTVAL) then
            report "MTVAL error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).MTVAL) & ", got: " & to_hstring(MTVAL) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i).MEPC /= MEPC) then
            report "MEPC error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).MEPC) & ", got: " & to_hstring(MEPC) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i).MSTATUS /= MSTATUS) then
            report "MSTATUS error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).MSTATUS) & ", got: " & to_hstring(MSTATUS) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i).MCAUSE /= MCAUSE) then
            report "MCAUSE error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).MCAUSE) & ", got: " & to_hstring(MCAUSE) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i).MTVEC /= MTVEC) then
            report "MTVEC error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results(i).MTVEC) & ", got: " & to_hstring(MTVEC) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        iteration <= iteration + 1;
    end loop;
    
    --return test
    ret <= '1';
    wait for 2*T;
    ret <= '0';
    wait for 2*T;
    
    --result checks
        if(results(16).PC /= PC_dra) then
            report "PC_dra error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).PC) & ", got: " & to_hstring(PC_dra) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(16).MTVAL /= MTVAL) then
            report "MTVAL error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).MTVAL) & ", got: " & to_hstring(MTVAL) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(16).MEPC /= MEPC) then
            report "MEPC error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).MEPC) & ", got: " & to_hstring(MEPC) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(16).MSTATUS /= MSTATUS) then
            report "MSTATUS error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).MSTATUS) & ", got: " & to_hstring(MSTATUS) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(16).MCAUSE /= MCAUSE) then
            report "MCAUSE error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).MCAUSE) & ", got: " & to_hstring(MCAUSE) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(16).MTVEC /= MTVEC) then
            report "MTVEC error at iteration: " & integer'image(16) & "\nexpected: " & to_hstring(results(16).MTVEC) & ", got: " & to_hstring(MTVEC) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;


    wait;
end process;

----------------------------------------------------------------------------------
--Design Under Test
----------------------------------------------------------------------------------
dut : Exception_Controll
Port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --exception/interrupt signals
    load_afe_P => load_afe_P,
    storeAMO_afe_P => storeAMO_afe_P,
    instruction_afe_P => instruction_afe_P,
    load_ame_P => load_ame_P,
    storeAMO_ame_P => storeAMO_ame_P,
    instruction_ame_P => instruction_ame_P,
    load_afe_AXI => load_afe_AXI,
    storeAMO_afe_AXI => storeAMO_afe_AXI,
    instruction_afe_AXI => instruction_afe_AXI,
    iie_CU => iie_CU,
    ece_CU => ece_CU,
    be_CU => be_CU,
    iie_CSR => iie_CSR,
    si_CSR => si_CSR,
    ti_CSR => ti_CSR,
    --data inputs
    data_in_EC => data_in_EC,
    IR_dra => IR_dra,
    PMP_dra => PMP_dra,
    PC_dra => PC_dra,
    --return signal
    ret => ret,
    --clock and reset
    clk => clk,
    reset => reset,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR control
    CSR_read_EC => CSR_read_EC,
    CSR_write_EC => CSR_write_EC,
    CSR_address_EC => CSR_address_EC,
    data_out_EC => data_out_EC,
    --programm counter
    PC_dra_write => PC_dra_write,
    PC_write => PC_write,
        --halt core
    halt_core => halt_core
);

reg_emulation : sim_EC_IV_1_registers
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --CSR signals
    CSR_address => CSR_address_EC,
    CSR_read => CSR_read_EC,
    CSR_write => CSR_write_EC,
    CSR_data_in => data_out_EC,
    --PC write
    PC_write => PC_write,
    PC_dra_write => PC_dra_write,
    --halt core = enable signal
    halt_core => halt_core,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR data output
    CSR_data_out => data_in_EC,
    MEPC => MEPC,
    MTVAL => MTVAL,
    MSTATUS => MSTATUS,
    MTVEC => MTVEC,
    MCAUSE => MCAUSE,
    --dra registers
    PC_dra => PC_dra,
    IR_dra => IR_dra,
    PMP_dra => PMP_dra
);

end rtl;
