----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnack
-- 
-- Create Date: 05/19/2021 03:48:45 PM
-- Design Name: Exception Control
-- Module Name: EC_CSR_ac_UV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module verifies the functionality of the CSR_access_controll.vhd file
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

library EC_lib;
use EC_lib.Exception_Controll_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity EC_CSR_ac_UV_1_tb is
end EC_CSR_ac_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of EC_CSR_ac_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    signal store_mepc : std_logic;
    signal store_mstatus : std_logic;
    signal store_mtval : std_logic;
    signal store_mcause : std_logic;
    signal load_mtvec : std_logic;
    signal load_mepc : std_logic;
    signal load_mstatus : std_logic;
    --exception code and interrupt signal
    signal exception_code : std_logic_vector (31 downto 0);
    signal interrupt : std_logic;
    --data inputs
    signal data_in_EC : std_logic_vector (31 downto 0);
    signal data_out : std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR access signals
    signal CSR_read_EC : std_logic;
    signal CSR_write_EC : std_logic;
    signal CSR_address_EC : std_logic_vector (11 downto 0);
    --data outputs
    signal data_out_EC : std_logic_vector (31 downto 0);
    signal data_in_CSR : std_logic_vector (31 downto 0);
begin

dut: CSR_access_controll
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    store_mepc => store_mepc,
    store_mstatus => store_mstatus,
    store_mtval => store_mtval,
    store_mcause => store_mcause,
    load_mtvec => load_mtvec,
    load_mepc => load_mepc,
    load_mstatus => load_mstatus,
    --exception code and interrupt signal
    exception_code => exception_code,
    interrupt => interrupt,
    --data inputs
    data_in_EC => data_in_EC,
    data_out => data_out,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR access signals
    CSR_read_EC => CSR_read_EC,
    CSR_write_EC => CSR_write_EC,
    CSR_address_EC => CSR_address_EC,
    --data outputs
    data_out_EC => data_out_EC,
    data_in_CSR => data_in_CSR
); 
stim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    --store mepc
    wait for 4 ns;
    store_mepc <= '1';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '0';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"00000000"; --dummy data
    data_out <= x"DEADAFFE"; --data to be stored in mepc
    
    wait for 1 ns;
    if(CSR_address_EC /= x"341") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during store mepc test" severity error;
     
        
    --store mstatus
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '1';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '0';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"00000000"; --dummy data
    data_out <= x"DEADAFFE"; --data to be stored in mstatus
    
    wait for 1 ns;
    if(CSR_address_EC /= x"300") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during store mstatus test" severity error;
    
    --store mtval
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '1';
    store_mcause <= '0';
    load_mtvec <= '0';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"00000000"; --dummy data
    data_out <= x"DEADAFFE"; --data to be stored in mtval
    
    wait for 1 ns;
    if(CSR_address_EC /= x"343") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during store mtval test" severity error;
    
    --store mcause
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '1';
    load_mtvec <= '0';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"00000000"; --dummy data
    data_out <= x"DEADAFFE"; --data to be stored in mcause
    
    wait for 1 ns;
    if(CSR_address_EC /= x"342") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= interrupt & exception_code(30 downto 0)) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during store mcause test" severity error;
    
    --load mtvec, interrutp = 0 data_in_EC(1:0) = 01 
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"DEAD1235"; --data to be stored in buffer register (data_in_EC(1:0) =  01)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC(31 downto 2) & "00") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 0, data_in_EC(1:0) = 01 test" severity error;
    
    --load mtvec, interrutp = 1 data_in_EC(1:0) = 00 
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '1';   --interrutp occured
    data_in_EC <= x"DEAD1230"; --data to be stored in buffer register (data_in_EC(1:0) =  00)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC(31 downto 2) & "00") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 1, data_in_EC(1:0) = 00 test" severity error;
    
    --load mtvec, interrutp = 0 data_in_EC(1:0) = 00
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"DEAD1230"; --data to be stored in buffer register (data_in_EC(1:0) =  00)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC(31 downto 2) & "00") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 0, data_in_EC(1:0) = 00 test" severity error;
    
    --load mtvec, interrutp = 1 data_in_EC(1:0) = 01 
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '1';   --interrutp occured
    data_in_EC <= x"DEAD1235"; --data to be stored in buffer register (data_in_EC(1:0) =  01)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= std_logic_vector(shift_left(unsigned("00" & data_in_EC(31 downto 2))+unsigned(exception_code),2))) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 1, data_in_EC(1:0) = 01 test" severity error;
    
    --load mtvec, interrutp = 1 data_in_EC(1:0) = 11 
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '1';   --interrutp occured
    data_in_EC <= x"DEAD123F"; --data to be stored in buffer register (data_in_EC(1:0) =  11)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC(31 downto 2) & "00") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 1, data_in_EC(1:0) = 11 test" severity error;
    
    --load mtvec, interrutp = 0 data_in_EC(1:0) = 11 
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '1';
    load_mepc <= '0';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '0';   --no interrutp occured
    data_in_EC <= x"DEAD123F"; --data to be stored in buffer register (data_in_EC(1:0) =  11)
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"305") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC(31 downto 2) & "00") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mtvec, interrupt = 0, data_in_EC(1:0) = 11 test" severity error;    
    
    --load mepc
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '0';
    load_mepc <= '1';
    load_mstatus <= '0';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '1';   --no interrutp occured
    data_in_EC <= x"DEADAFFE"; --data to be stored in buffer register 
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"341") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mepc test" severity error;
    
    --load mstatus
    wait for 4 ns;
    store_mepc <= '0';
    store_mstatus <= '0';
    store_mtval <= '0';
    store_mcause <= '0';
    load_mtvec <= '0';
    load_mepc <= '0';
    load_mstatus <= '1';
    
    exception_code <= x"00000010"; --16 = default value
    interrupt <= '1';   --no interrutp occured
    data_in_EC <= x"BADC0DED"; --data to be stored in buffer register 
    data_out <= x"00000000"; --dummy data
    
    wait for 1 ns;
    if(CSR_address_EC /= x"300") then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_read_EC /= '1') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(CSR_write_EC /= '0') then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_out_EC /= data_out) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    if(data_in_CSR /= data_in_EC) then
        error_flag := true;
        error_cnt := error_cnt + 1;
    end if;
    assert error_flag = false report "error during load mstatus test" severity error;

    assert error_flag = false report integer'image(error_cnt) & " error(s) occured" severity error;
    assert error_flag = true report "test completed without errors" severity note;

    wait;
end process;
end rtl;



















