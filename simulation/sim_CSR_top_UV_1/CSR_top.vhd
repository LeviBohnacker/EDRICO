----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/09/2021 09:34:33 PM
-- Design Name: CSR_RF
-- Module Name: CSR_top - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this module implements all CSR registers and instantiates the CSR_interrupt_gen
--  as well as the CSR_controller modules. In addition, an output multiplexer is
--  implemented to connect the different CSRs to data_bus_B.
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

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.ALL;

library RF_lib;
use RF_lib.CSR_pkg.ALL;

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
--CSR controller
----------------------------------------------------------------------------------
CSRcontroller: CSR_controller
port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --CSR control signals
    CSR_address => CSR_address,
    CSR_write => CSR_write,
    CSR_read => CSR_read,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR select signals
    CSR_read_sel => read,
    CSR_write_sel => write,
    --exception signals
    illegal_instruction_exception => iie_CSR
);

----------------------------------------------------------------------------------
--CSR interrupt gen
----------------------------------------------------------------------------------
CSRinterruptGEN: CSR_interrupt_gen
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --enable signals
    MSIE => mie(3),
    MTIE => mie(7),
    MIE => mstatus(3),
    --pending signals
    MSIP => mip(3),
    MTIP => mip(7),
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --interrupt outputs
    mtime_interrupt => mtime_interrupt,
    mSW_interrupt => mSW_interrupt
);

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
        if(write(1) = '1') then
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

----------------------------------------------------------------------------------
--mtvec register
----------------------------------------------------------------------------------
mtvec_proc: process(reset, clk)
begin
    if(reset = '1') then
        mtvec <= (others => '1');
    elsif(clk'event and clk='0' and write(3) = '1') then
        mtvec <= data_in;
    end if;
end process;

----------------------------------------------------------------------------------
--mscratch register
----------------------------------------------------------------------------------
mscratch_proc: process(reset, clk)
begin
    if(reset = '1') then
        mscratch <= (others => '1');
    elsif(clk'event and clk='0' and write(5) = '1') then
        mscratch <= data_in;
    end if;
end process;

----------------------------------------------------------------------------------
--mepc register
----------------------------------------------------------------------------------
mepc_proc: process(reset, clk)
begin
    if(reset = '1') then
        mepc <= (others => '1');
    elsif(clk'event and clk='0' and write(6) = '1') then
        mepc <= data_in;
    end if;
end process;

----------------------------------------------------------------------------------
--mcause register
----------------------------------------------------------------------------------
mcause_proc: process(reset, clk)
begin
    if(reset = '1') then
        mcause <= (others => '1');
    elsif(clk'event and clk='0' and write(7) = '1') then
        mcause <= data_in;
    end if;
end process;

----------------------------------------------------------------------------------
--mtval register
----------------------------------------------------------------------------------
mtval_proc: process(reset, clk)
begin
    if(reset = '1') then
        mtval <= (others => '1');
    elsif(clk'event and clk='0' and write(8) = '1') then
        mtval <= data_in;
    end if;
end process;

----------------------------------------------------------------------------------
--pmpcfg register
----------------------------------------------------------------------------------
pmpcfg_proc: process(reset,clk)
begin
    if(reset = '1') then
        pmpcfg <= (others =>(others=>'0'));
    elsif(clk'event and clk= '0') then
        --pmpcfg0
        if(write(10)='1') then
            pmpcfg(0) <= data_in(7 downto 0);
            pmpcfg(1) <= data_in(15 downto 8);
            pmpcfg(2) <= data_in(23 downto 16);
            pmpcfg(3) <= data_in(31 downto 24);
        end if;
        
        --pmpcfg1
        if(write(11)='1') then
            pmpcfg(4) <= data_in(7 downto 0);
            pmpcfg(5) <= data_in(15 downto 8);
            pmpcfg(6) <= data_in(23 downto 16);
            pmpcfg(7) <= data_in(31 downto 24);
        end if;
        
        --pmpcfg2
        if(write(12)='1') then
            pmpcfg(8) <= data_in(7 downto 0);
            pmpcfg(9) <= data_in(15 downto 8);
            pmpcfg(10) <= data_in(23 downto 16);
            pmpcfg(11) <= data_in(31 downto 24);
        end if;
        
        --pmpcfg3
        if(write(13)='1') then
            pmpcfg(12) <= data_in(7 downto 0);
            pmpcfg(13) <= data_in(15 downto 8);
            pmpcfg(14) <= data_in(23 downto 16);
            pmpcfg(15) <= data_in(31 downto 24);
        end if;
    end if;
end process;
pmpcfg_DRA <= pmpcfg;

----------------------------------------------------------------------------------
--pmpaddr register
----------------------------------------------------------------------------------
pmpaddr_proc: process(reset, clk)
begin
    if(reset = '1') then
        pmpaddr <= (others=>(others=>'0'));
    elsif(clk'event and clk='0') then
        --pmpaddr0
        if(write(14)='1') then
            pmpaddr(0) <= data_in;
        end if;
        
        --pmpaddr1
        if(write(15)='1') then
            pmpaddr(1) <= data_in;
        end if;
        
        --pmpaddr2
        if(write(16)='1') then
            pmpaddr(2) <= data_in;
        end if;
        
        --pmpaddr3
        if(write(17)='1') then
            pmpaddr(3) <= data_in;
        end if;
        
        --pmpaddr4
        if(write(18)='1') then
            pmpaddr(4) <= data_in;
        end if;
        
        --pmpaddr5
        if(write(19)='1') then
            pmpaddr(5) <= data_in;
        end if;
        
        --pmpaddr6
        if(write(20)='1') then
            pmpaddr(6) <= data_in;
        end if;
        
        --pmpaddr7
        if(write(21)='1') then
            pmpaddr(7) <= data_in;
        end if;
        
        --pmpaddr8
        if(write(22)='1') then
            pmpaddr(8) <= data_in;
        end if;
        
        --pmpaddr9
        if(write(23)='1') then
            pmpaddr(9) <= data_in;
        end if;
        
        --pmpaddr10
        if(write(24)='1') then
            pmpaddr(10) <= data_in;
        end if;
        
        --pmpaddr11
        if(write(25)='1') then
            pmpaddr(11) <= data_in;
        end if;
        
        --pmpaddr12
        if(write(26)='1') then
            pmpaddr(12) <= data_in;
        end if;
        
        --pmpaddr13
        if(write(27)='1') then
            pmpaddr(13) <= data_in;
        end if;
        
        --pmpaddr14
        if(write(28)='1') then
            pmpaddr(14) <= data_in;
        end if;
        
        --pmpaddr15
        if(write(29)='1') then
            pmpaddr(15) <= data_in;
        end if;   
    end if;
end process;
pmpaddr_DRA <= pmpaddr;

----------------------------------------------------------------------------------
--output
-- multiplexer to connect the corresponding register to the data output
----------------------------------------------------------------------------------
data_bus_B <=   mstatus when read = "000001" else
                minstretH when read = "000010" else
                mie when read = "000011" else
                mtvec when read = "000100" else
                mcountinhibit when read = "000101" else
                mscratch when read = "000110" else
                mepc when read = "000111" else
                mcause when read = "001000" else
                mtval when read = "001001" else
                mip when read = "001010" else
                pmpcfg(3) & pmpcfg(2) & pmpcfg(1) & pmpcfg(0) when read = "001011" else
                pmpcfg(7) & pmpcfg(6) & pmpcfg(5) & pmpcfg(4) when read = "001100" else
                pmpcfg(11) & pmpcfg(10) & pmpcfg(9) & pmpcfg(8) when read = "001101" else
                pmpcfg(15) & pmpcfg(14) & pmpcfg(13) & pmpcfg(12) when read = "001110" else
                pmpaddr(0) when read = "001111" else
                pmpaddr(1) when read = "010000" else
                pmpaddr(2) when read = "010001" else
                pmpaddr(3) when read = "010010" else
                pmpaddr(4) when read = "010011" else
                pmpaddr(5) when read = "010100" else
                pmpaddr(6) when read = "010101" else
                pmpaddr(7) when read = "010110" else
                pmpaddr(8) when read = "010111" else
                pmpaddr(9) when read = "011000" else
                pmpaddr(10) when read = "011001" else
                pmpaddr(11) when read = "011010" else
                pmpaddr(12) when read = "011011" else
                pmpaddr(13) when read = "011100" else
                pmpaddr(14) when read = "011101" else
                pmpaddr(15) when read = "011110" else
                mcycle when read = "011111" else
                minstret when read = "100000" else
                mcycleH when read = "100001" else
                misa when read = "100010" else
                (others => '0');
                
                
                


end rtl;
















