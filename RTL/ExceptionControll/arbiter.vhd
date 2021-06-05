----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/04/2021 03:35:31 PM
-- Design Name: Exception_Controll
-- Module Name: arbiter - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  arbiter to decide, which exception shall be taken, generate exception code,
--  interrupt and safe_ signals.
-- 
-- Dependencies: 
--  <none>
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arbiter is
Port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --exception signals
    load_afe_P : in STD_LOGIC;
    storeAMO_afe_P : in STD_LOGIC;
    instruction_afe_P : in STD_LOGIC;
    load_ame_P : in STD_LOGIC;
    storeAMO_ame_P : in STD_LOGIC;
    instruction_ame_P : in STD_LOGIC;
    load_afe_AXI : in STD_LOGIC;
    storeAMO_afe_AXI : in STD_LOGIC;
    instruction_afe_AXI : in STD_LOGIC;
    iie_CU : in STD_LOGIC;
    ece_CU : in STD_LOGIC;
    be_CU : in STD_LOGIC;
    iie_CSR : in STD_LOGIC;
    --interrutp signals
    si_CSR : in STD_LOGIC;
    ti_CSR : in STD_LOGIC;
    --arbiter control
    local_reset : in STD_LOGIC;
    buffer_arbiter : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --safe signals
    save_address : out STD_LOGIC;
    save_PC : out STD_LOGIC;
    save_IR : out STD_LOGIC;
    --control signals
    interrupt : out STD_LOGIC;
    exception_code : out STD_LOGIC_VECTOR(31 downto 0);
    EI_flag : out STD_LOGIC
);
end arbiter;

architecture rtl of arbiter is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal interrupt_int : std_logic;
signal exception_code_int : std_logic_vector(31 downto 0);
signal exception_bundle : std_logic_vector(10 downto 0);

--buffered signals
signal load_afe_buf : std_logic;
signal storeAMO_afe_buf : std_logic;
signal instruction_afe_buf : std_logic;
signal load_ame_buf : std_logic;
signal storeAMO_ame_buf : std_logic;
signal instruction_ame_buf : std_logic;
signal iie_buf : std_logic;
signal ece_buf : std_logic;
signal be_buf : std_logic;
signal si_buf : std_logic;
signal ti_buf : std_logic;

signal EI_flag_int : std_logic;
begin
----------------------------------------------------------------------------------
--signal buffer
--  the exception and interrupt signals are buffere, when the EI_flag and the
--  buffer_arbiter flag are set to high.
--  Reset is asynchronous on local_reset or reset (global)
----------------------------------------------------------------------------------
signal_buffer: process(clk, reset, local_reset)
begin
    if(reset = '1' or local_reset = '1') then
        load_afe_buf <= '0';
        storeAMO_afe_buf <= '0';
        instruction_afe_buf <= '0';
        load_ame_buf <= '0';
        storeAMO_ame_buf <= '0';
        instruction_ame_buf <= '0';
        iie_buf <= '0';
        ece_buf <= '0';
        be_buf <= '0';
        si_buf <= '0';
        ti_buf <= '0';
    elsif(clk'event and clk= '1' and EI_flag_int = '1' and buffer_arbiter = '1') then
        load_afe_buf <= load_afe_P or load_afe_AXI;
        storeAMO_afe_buf <= storeAMO_afe_P or storeAMO_afe_AXI;
        instruction_afe_buf <= instruction_afe_P or instruction_afe_AXI;
        load_ame_buf <= load_ame_P;
        storeAMO_ame_buf <= storeAMO_ame_P;
        instruction_ame_buf <= instruction_ame_P;
        iie_buf <= iie_CSR or iie_CU;
        ece_buf <= ece_CU;
        be_buf <= be_CU;
        si_buf <= si_CSR;
        ti_buf <= ti_CSR;
    end if;
end process;


----------------------------------------------------------------------------------
--EI_flag and interrupt signal generation
--  if one of these flags is high, a trap entry is performed on the next rising 
--  edge. If either the si_CSR or the ti_CSR signal is high, the interrupt signal
--  is raised additional.
----------------------------------------------------------------------------------
EI_flag_int <=  --exception signals
            load_afe_P or
            storeAMO_afe_P or
            instruction_afe_P or
            load_ame_P or
            storeAMO_ame_P or
            instruction_ame_P or
            load_afe_AXI or
            storeAMO_afe_AXI or
            instruction_afe_AXI or
            iie_CU or
            ece_CU or
            be_CU or
            iie_CSR or
            --interrutp signals
            si_CSR or
            ti_CSR;
         
EI_flag <= EI_flag_int;
            
interrupt_int <= si_buf or ti_buf;
interrupt <= interrupt_int;

----------------------------------------------------------------------------------
--exception code generation
--  select the proper exception/interupt to execute (even if multiple at once ar
--  raised) by selecting the proper exception code.
----------------------------------------------------------------------------------
exception_bundle <= si_buf & ti_buf & instruction_ame_buf & (instruction_afe_buf) & (iie_buf) & be_buf & load_ame_buf & (load_afe_buf) & storeAMO_ame_buf & (storeAMO_afe_buf) & ece_buf;

exception_code_int <=   x"0000" & x"0003" when exception_bundle(10) = '1' else
                        x"0000" & x"0007" when exception_bundle(10 downto 9) = "01" else
                        x"0000" & x"0000" when exception_bundle(10 downto 8) = "001" else
                        x"0000" & x"0001" when exception_bundle(10 downto 7) = "0001" else
                        x"0000" & x"0002" when exception_bundle(10 downto 6) = "00001" else
                        x"0000" & x"0003" when exception_bundle(10 downto 5) = "000001" else
                        x"0000" & x"0004" when exception_bundle(10 downto 4) = "0000001" else
                        x"0000" & x"0005" when exception_bundle(10 downto 3) = "00000001" else
                        x"0000" & x"0006" when exception_bundle(10 downto 2) = "000000001" else
                        x"0000" & x"0007" when exception_bundle(10 downto 1) = "0000000001" else
                        x"0000" & x"000B" when exception_bundle(10 downto 0) = "00000000001" else
                        x"0000" & x"0010";
                    
exception_code <= exception_code_int;
         
----------------------------------------------------------------------------------
--save signal generator
--  generate signals to either save the address, program counter or instruction
--  register. 
----------------------------------------------------------------------------------           
save_data: process(exception_code_int, interrupt_int)
begin
    if (interrupt_int = '0' and (exception_code_int = x"00000000" or exception_code_int = x"00000001" or exception_code_int = x"00000004" or exception_code_int = x"00000005" or exception_code_int = x"00000006" or exception_code_int = x"00000007")) then
        save_address <= '1';
        save_PC <= '0';
        save_IR <= '0';
    elsif (interrupt_int = '0' and exception_code_int = x"00000003") then
        save_address <= '0';
        save_PC <= '1';
        save_IR <= '0';
    elsif (interrupt_int = '0' and exception_code_int = x"00000002") then
        save_address <= '0';
        save_PC <= '0';
        save_IR <= '1';
    else
        save_address <= '0';
        save_PC <= '0';
        save_IR <= '0';
    end if;
end process;

end rtl;
