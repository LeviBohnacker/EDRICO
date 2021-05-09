----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2021 09:34:33 PM
-- Design Name: 
-- Module Name: CSR_top - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
use IEEE.NUMERIC_STD.ALL;

library PMP_PMA_lib;
use PMP_PMA_lib.PMP_PMA_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CSR_top is
port ( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --interrupt pending bit dra's
    MSIP_dra : in STD_LOGIC;
    MTIP_dra : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset: in STD_LOGIC;
    --instruction finished flag
    instr_finished : in STD_LOGIC;
    --CSR controll signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_read : in STD_LOGIC;
    CSR_write : in STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    --pmp dra outputs
    pmpcfg_dra : out type_pmpcfg;
    pmpaddr_dra : out type_pmpaddr;
    --interrupt pending flags
    iie_CSR: out STD_LOGIC;
    mtime_interrupt : out STD_LOGIC;
    mSW_interrupt : out STD_LOGIC
);
end CSR_top;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CSR_top is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
--registers
signal mcycle_reg: std_logic_vector(63 downto 0);
signal mcycle: std_logic_vector(31 downto 0);
signal mcycleH: std_logic_vector(31 downto 0);
signal minstret_reg: std_logic_vector(63 downto 0);
signal minstret: std_logic_vector(31 downto 0);
signal minstretH: std_logic_vector(31 downto 0);
signal mcountinhibit_reg: std_logic_vector(1 downto 0);
signal mcountinhibit: std_logic_vector(31 downto 0);

signal mip_reg: std_logic_vector(1 downto 0);
signal mie_reg: std_logic_vector(8 downto 0);
signal mstatus_reg: std_logic_vector(1 downto 0);
signal mstatus, misa, mie, mtvec: std_logic_vector(31 downto 0);
signal mscratch, mepc, mcause, mtval, mip: std_logic_vector(31 downto 0);

signal pmpcfg: type_pmpcfg;
signal pmpaddr: type_pmpaddr;

--CSR controller outputs
signal read: std_logic_vector(5 downto 0);
signal write: std_logic_vector(32 downto 0);
begin


----------------------------------------------------------------------------------
--Hardware Performance Counter
----------------------------------------------------------------------------------
mcountinhibit_proc: process(reset, clk) 
begin
    if(reset = '1') then    --async reset
        mcountinhibit_reg <= "11";
    elsif(clk'event and clk = '0' and write(4) = '1') then --update on falling clock edge
        mcountinhibit_reg <= data_in(2) & data_in(0);
    end if;
end process;

mcountinhibit <= x"0000000" & '0' & mcountinhibit_reg(1) & '0' & mcountinhibit_reg(0);

mcycle_proc: process(reset, clk)
begin
    if(reset = '1') then
        mcycle_reg <= x"00000000" & x"00000000";
    elsif(clk'event and clk = '0') then
        if(write(32) = '1') then
            mcycle_reg <= data_in & mcycle_reg(31 downto 0);
        elsif(write(30) = '1') then
            mcycle_reg <= mcycle_reg(63 downto 32) & data_in;
        elsif(mcountinhibit(0) = '0') then
            mcycle_reg <= std_logic_vector(unsigned(mcycle_reg) + 1);
        end if;
    end if;
end process;

mcycle <= mcycle_reg(31 downto 0);
mcycleH <= mcycle_reg(63 downto 32);

minstret_proc: process(reset, clk)
begin
    if(reset = '1') then
        minstret_reg <= x"00000000" & x"00000000";
    elsif(clk'event and clk = '0') then
        if(write(2) = '1') then
            minstret_reg <= data_in & minstret_reg(31 downto 0);
        elsif(write(31) = '1') then
            minstret_reg <= minstret_reg(63 downto 32) & data_in;
        elsif(instr_finished = '1' and mcountinhibit(1) = '0') then
            minstret_reg <= std_logic_vector(unsigned(minstret_reg)+1);
        end if;
    end if;
end process;

minstret <= minstret_reg(31 downto 0);
minstretH <= minstret_reg(63 downto 32);

----------------------------------------------------------------------------------
--mip and mie registers;
----------------------------------------------------------------------------------
--register update
mip_proc: process(reset, clk)
begin
    if(reset = '1') then
        mip_reg <= "00";
    elsif(clk'event and clk = '0' and write(9) = '1') then
        mip_reg <= data_in(7) & data_in(3);
    end if;
end process;

--interrupt pending flag updates
mip_reg <= MTIP_dra & mip_reg(0) when MTIP_dra = '1' else
           mip_reg(1) & MSIP_dra when MSIP_dra = '1' else
           mip_reg;
           
--outputs
mip <= x"000000" & mip_reg(1) & "000" & mip_reg(0) & "000";

mie_proc: process(reset, clk)
begin
    if(reset = '1') then
        mie_reg <= (others => '0');
    elsif(clk'event and clk = '0' and write(2) = '1') then
        mie_reg <= data_in(11) & data_in(9 downto 7) & data_in(5 downto 3) & data_in(1 downto 0);
    end if;
end process;

mie <= x"00000" & mie_reg(8) & '0' & mie_reg(7 downto 5) & '0' & mie_reg(4 downto 2) & '0' & mie_reg(1 downto 0);

----------------------------------------------------------------------------------
--mstatus register
----------------------------------------------------------------------------------
mstatus_proc: process(reset, clk)
begin
    if(reset = '1') then
        mstatus_reg <= (others => '1');
    elsif(clk'event and clk = '0' and write(0) = '1') then
        mstatus_reg <= data_in(7) & data_in(3);
    end if;
end process;

mstatus <= x"000018" & mstatus_reg(1) & "000" & mstatus_reg(0) & "000";

----------------------------------------------------------------------------------
--misa register
----------------------------------------------------------------------------------
misa <= x"00000100";

end rtl;
















