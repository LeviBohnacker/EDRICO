----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/16/2021 08:24:19 PM
-- Design Name: AXI4_lite_master
-- Module Name: AXI4_lite_master_control_unit - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module includes the FSM, handshake generator and the signal generation
--  modules for the AXI4_lite signals
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

library AXI4M_lib;
use AXI4M_lib.AXI4_lite_master_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity AXI4_lite_master_control_unit is
port (
    ------------------------------------------------------------------------------
    --AXI channels
    ------------------------------------------------------------------------------
    AW_ack, WD_ack, BD_ack, AR_ack, RD_ack : out std_logic;
    PS_debug : out FSM_state;
    NS_debug : out FSM_state;
    --clock and reset
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARSTN : in STD_LOGIC;
    --read address channel
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_ARPROT : out STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    --read data channel
    M_AXI_RRESP : in STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    --write address channel
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_AWPROT : out STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    --write data channel
    M_AXI_WSTRB : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    --write response channel
    M_AXI_BRESP : in STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    enable : in STD_LOGIC;
    readWrite : in STD_LOGIC;
    instruction : in STD_LOGIC;
    size : in STD_LOGIC_VECTOR(1 downto 0);
    --halt core
    halt_core : in STD_LOGIC;
    --reset
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    memOp_finished : out STD_LOGIC;
    store_systemData : out STD_LOGIC;
    --exception flags
    load_afe_AXI : out STD_LOGIC;
    storeAMO_afe_AXI : out STD_LOGIC;
    instruction_afe_AXI : out STD_LOGIC;
    --register control
    load_address : out STD_LOGIC;
    load_data : out STD_LOGIC
);
end AXI4_lite_master_control_unit;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of AXI4_lite_master_control_unit is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
--clock and reset
--signal M_AXI_ACLK_int : STD_LOGIC;
--signal M_AXI_ARSTN_int : STD_LOGIC;
--read address channel
--signal M_AXI_ARADDR_int : STD_LOGIC_VECTOR (31 downto 0);
--signal M_AXI_ARCACHE_int : STD_LOGIC_VECTOR (3 downto 0);
--signal M_AXI_ARPROT_int : STD_LOGIC_VECTOR (2 downto 0);
signal M_AXI_ARVALID_int : STD_LOGIC;
--signal M_AXI_ARREADY_int : STD_LOGIC;
--read data channel
--signal M_AXI_RDATA_int : STD_LOGIC_VECTOR (31 downto 0);
--signal M_AXI_RRESP_int : STD_LOGIC_VECTOR (1 downto 0);
signal M_AXI_RREADY_int : STD_LOGIC;
--write address channel
--signal M_AXI_AWADDR_int : STD_LOGIC_VECTOR (31 downto 0);
--signal M_AXI_AWCACHE_int : STD_LOGIC_VECTOR (3 downto 0);
--signal M_AXI_AWPROT_int : STD_LOGIC_VECTOR (2 downto 0);
signal M_AXI_AWVALID_int : STD_LOGIC;
--signal M_AXI_AWREADY_int : STD_LOGIC;
--write data channel
--signal M_AXI_WDATA_int : STD_LOGIC_VECTOR (31 downto 0);
--signal M_AXI_WSTRB_int : STD_LOGIC_VECTOR (3 downto 0);
signal M_AXI_WVALID_int : STD_LOGIC;
--signal M_AXI_WREADY_int : STD_LOGIC;
--write response channel
--signal M_AXI_BRESP_int : STD_LOGIC_VECTOR (1 downto 0);
--signal M_AXI_BVALID_int : STD_LOGIC;
signal M_AXI_BREADY_int : STD_LOGIC;

signal memOp_finished_int : STD_LOGIC;
signal RRESP_buffed : STD_LOGIC_VECTOR(1 downto 0);
signal BRESP_buffed : STD_LOGIC_VECTOR(1 downto 0);

--acknowledge signals
signal ARack, RDack : STD_LOGIC;
signal AWack, BDack, WDack : STD_LOGIC;

signal reset_local : STD_LOGIC;

signal error_detected : STD_LOGIC;

signal present_state, next_state : FSM_state;
begin

----------------------------------------------------------------------------------
--generate store_systemData signal
----------------------------------------------------------------------------------
store_systemData <= M_AXI_RREADY_int and M_AXI_RVALID;

----------------------------------------------------------------------------------
--generate memOp_finished signal
----------------------------------------------------------------------------------
memOp_finished <= memOp_finished_int and not RRESP_buffed(1);

----------------------------------------------------------------------------------
--generate register load signals
----------------------------------------------------------------------------------
load_address  <= enable and not halt_core;
load_data <= readWrite and not halt_core and enable;

----------------------------------------------------------------------------------
--read handshakes
----------------------------------------------------------------------------------
--address read channel
AR_handshake : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK) 
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        ARack <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --synchronous local reset
        if(reset_local = '1') then
            ARack <= '0';
        --set ARack
        elsif(M_AXI_ARVALID_int = '1' and M_AXI_ARREADY = '1') then
            ARack <= '1';
        end if;
    end if;
end process;

ARVALID_setter : process(M_AXI_ARSTN, M_AXI_ACLK)
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        M_AXI_ARVALID_int <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --reset read valid if handshake happens/happend
        if((M_AXI_ARVALID_int = '1' and M_AXI_ARREADY = '1') or ARack = '1') then
            M_AXI_ARVALID_int <= '0';
        --set read valid, if no handshake happend and the transfer is initated
        elsif(readWrite = '0' and enable = '1') then
            M_AXI_ARVALID_int <= '1';
        --reset read valid if no handshake happens/happend and no transfer is initated
        else
            M_AXI_ARVALID_int <= '0';
        end if;
    end if;
end process;

M_AXI_ARVALID <= M_AXI_ARVALID_int;

--read data channel
RD_buffer : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK)
begin
    if(M_AXI_ARSTN = '0') then
        RRESP_buffed <= "00";
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        if(reset_local = '1') then
            RRESP_buffed <= "00";
        elsif(M_AXI_RREADY_int = '1' and M_AXI_RVALID = '1') then
            RRESP_buffed <= M_AXI_RRESP;
        end if;
    end if;
end process;

RD_handshake : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK) 
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        RDack <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --synchronous local reset
        if(reset_local = '1') then
            RDack <= '0';
        --set RDack
        elsif(M_AXI_RREADY_int = '1' and M_AXI_RVALID = '1') then
            RDack <= '1';
        end if;
    end if;
end process;

RREADY_setter : process(M_AXI_ARSTN, M_AXI_ACLK)
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        M_AXI_RREADY_int <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --reset read ready if handshake happens/happend
        if((M_AXI_RREADY_int = '1' and M_AXI_RVALID = '1') or RDack = '1') then
            M_AXI_RREADY_int <= '0';
        --set read ready, if no handshake happend and the transfer is initated
        elsif(readWrite = '0' and enable = '1') then
            M_AXI_RREADY_int <= '1';
        --reset read ready if no handshake happens/happend and no transfer is initated
        else
            M_AXI_RREADY_int <= '0';
        end if;
    end if;
end process;

M_AXI_RREADY <= M_AXI_RREADY_int;


----------------------------------------------------------------------------------
--write handshakes
----------------------------------------------------------------------------------
--address write channel
AW_handshake : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK) 
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        AWack <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --synchronous local reset
        if(reset_local = '1') then
            AWack <= '0';
        --set AWack
        elsif(M_AXI_AWVALID_int = '1' and M_AXI_AWREADY = '1') then
            AWack <= '1';
        end if;
    end if;
end process;

AWVALID_setter : process(M_AXI_ARSTN, M_AXI_ACLK)
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        M_AXI_AWVALID_int <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --reset write valid if handshake happens/happend
        if((M_AXI_AWVALID_int = '1' and M_AXI_AWREADY = '1') or AWack = '1') then
            M_AXI_AWVALID_int <= '0';
        --set write valid, if no handshake happend and the transfer is initated
        elsif(readWrite = '1' and enable = '1') then
            M_AXI_AWVALID_int <= '1';
        --reset write valid if no handshake happens/happend and no transfer is initated
        else
            M_AXI_AWVALID_int <= '0';
        end if;
    end if;
end process;

M_AXI_AWVALID <= M_AXI_AWVALID_int;

--write response channel
BR_buffer : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK)
begin
    if(M_AXI_ARSTN = '0') then
        BRESP_buffed <= "00";
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        if(reset_local = '1') then
            BRESP_buffed <= "00";
        elsif(M_AXI_BREADY_int = '1' and M_AXI_BVALID = '1') then
            BRESP_buffed <= M_AXI_RRESP;
        end if;
    end if;
end process;

BD_handshake : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK) 
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        BDack <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --synchronous local reset
        if(reset_local = '1') then
            BDack <= '0';
        --set ARack
        elsif(M_AXI_BREADY_int = '1' and M_AXI_BVALID = '1') then
            BDack <= '1';
        end if;
    end if;
end process;

BREADY_setter : process(M_AXI_ARSTN, M_AXI_ACLK)
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        M_AXI_BREADY_int <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --reset read ready if handshake happens/happend
        if((M_AXI_BREADY_int = '1' and M_AXI_BVALID = '1') or BDack = '1') then
            M_AXI_BREADY_int <= '0';
        --set read ready, if no handshake happend and the transfer is initated
        elsif(readWrite = '1' and enable = '1') then
            M_AXI_BREADY_int <= '1';
        --reset read ready if no handshake happens/happend and no transfer is initated
        else
            M_AXI_BREADY_int <= '0';
        end if;
    end if;
end process;

M_AXI_BREADY <= M_AXI_BREADY_int;

--write data channel
WD_handshake : process(reset_local, M_AXI_ARSTN, M_AXI_ACLK) 
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        WDack <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --synchronous local reset
        if(reset_local = '1') then
            WDack <= '0';
        --set WDack
        elsif(M_AXI_WVALID_int = '1' and M_AXI_WREADY = '1') then
            WDack <= '1';
        end if;
    end if;
end process;

WVALID_setter : process(M_AXI_ARSTN, M_AXI_ACLK)
begin
    --asynchronous AXI reset
    if(M_AXI_ARSTN = '0') then
        M_AXI_WVALID_int <= '0';
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        --reset write data valid if handshake happens/happend
        if((M_AXI_WVALID_int = '1' and M_AXI_WREADY = '1') or WDack = '1') then
            M_AXI_WVALID_int <= '0';
        --set write data valid, if no handshake happend and the transfer is initated
        elsif(readWrite = '1' and enable = '1') then
            M_AXI_WVALID_int <= '1';
        --reset write data valid if no handshake happens/happend and no transfer is initated
        else
            M_AXI_WVALID_int <= '0';
        end if;
    end if;
end process;

M_AXI_WVALID <= M_AXI_WVALID_int;

----------------------------------------------------------------------------------
--generate write strobe
----------------------------------------------------------------------------------
M_AXI_WSTRB <=  "0001" when size = "00" else
                "0011" when size = "01" else
                "1111";

----------------------------------------------------------------------------------
--generate cache and protection signal
----------------------------------------------------------------------------------
M_AXI_AWCACHE <= "0011";
M_AXI_ARCACHE <= "0011";

M_AXI_AWPROT <= instruction & "00";
M_AXI_ARPROT <= instruction & "00";

----------------------------------------------------------------------------------
--generate exception signals
----------------------------------------------------------------------------------
exception_gen: process(error_detected)
begin
    if (error_detected = '1') then
        if(readWrite = '0' and instruction = '0') then
            load_afe_AXI <= '1';
            instruction_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
        elsif(readWrite = '1' and instruction = '0') then
            load_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            storeAMO_afe_AXI <= '1';
        else
            load_afe_AXI <= '0';
            instruction_afe_AXI <= '1';
            storeAMO_afe_AXI <= '0';
        end if;
    else
        load_afe_AXI <= '0';
        instruction_afe_AXI <= '0';
        storeAMO_afe_AXI <= '0';
    end if;
end process;    


------------------------------------------------------------------------------
--AXI4-Lite FSM
------------------------------------------------------------------------------
FSM_synq_proc: process(reset, M_AXI_ACLK, M_AXI_ARSTN)
begin
    if(reset = '1' or M_AXI_ARSTN = '0') then
        present_state <= idle;
    elsif(M_AXI_ACLK'event and M_AXI_ACLK='1') then
        present_state <= next_state;
    end if;
end process;

--DEBUG PORTS
PS_debug <= present_state;
NS_debug <= next_state;
AR_ack <= ARack;
RD_ack <= RDack;
AW_ack <= AWack;
BD_ack <= BDack;
WD_ack <= WDack;

FSM_comb_proc: process(present_state, readWrite, enable, ARack, RDack, RRESP_buffed, AWack, BDack, WDack, BRESP_buffed, halt_core)
begin
    case present_state is
        when idle =>
            --next state decoder
            if(readWrite = '0' and enable = '1') then
                next_state <= read;
            elsif(readWrite = '1' and enable = '1') then
                next_state <= write;
            else
                next_state <= idle;
            end if;
            --output decoder
            reset_local <= '1';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '0';
        when read => 
            --next state deocder
            if(ARack = '1' and RDack = '1') then
                next_state <= end_read;
            else
                next_state <= read;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '0';
        when end_read =>
            --next state decoder
            if(RRESP_buffed(1) = '1') then
                next_state <= error;
            else
                next_state <= idle;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '1';
        when write =>
            --next state decoder
            if(AWack = '1' and WDack = '1' and BDack = '1') then
                next_state <= end_write;
            else 
                next_state <= write;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '0';
        when end_write =>
            --next state decoder
            if(BRESP_buffed(1) = '1') then
                next_state <= error;
            else
                next_state <= idle;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '1';
        when error =>
            --next state decoder
            if(halt_core = '1') then
                next_state <= pause;
            else
                next_state <= error;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '1';
            memOp_finished_int <= '0';
        when pause =>
            --next state decoder
            if(halt_core = '0') then
                next_state <= idle;
            else
                next_state <= pause;
            end if;
            --output decoder
            reset_local <= '0';
            load_afe_AXI <= '0';
            storeAMO_afe_AXI <= '0';
            instruction_afe_AXI <= '0';
            error_detected <= '0';
            memOp_finished_int <= '0';
    end case;
end process;



end rtl;

















