----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: AXI4_lite_master
-- Module Name: sim_AXI4_IV_1_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat  for the 
--  sim_AXI4_IV_1_tb.vhd testbench.
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
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;


----------------------------------------------------------------------------------
--PACKAGE
----------------------------------------------------------------------------------
package sim_AXI4_IV_1_pkg is
function to_hstring (SLV : std_logic_vector) return string;

----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type AXI4_out_rec is record
    --read address channel
    M_AXI_ARADDR : STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_ARVALID : STD_LOGIC;
    --read data channel
    M_AXI_RREADY : STD_LOGIC;
    --write address channel
    M_AXI_AWADDR : STD_LOGIC_VECTOR(31 downto 0);
    M_AXI_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_AWVALID : STD_LOGIC;
    --write data channel
    M_AXI_WDATA : STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_WSTRB : STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_WVALID : STD_LOGIC;
    --write response channel
    M_AXI_BREADY : STD_LOGIC;
end record AXI4_out_rec;

type AXI4_in_rec is record
    --read address channel
    M_AXI_ARREADY : STD_LOGIC;
    --read data channel
    M_AXI_RDATA : STD_LOGIC_VECTOR(31 downto 0);
    M_AXI_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_RVALID : STD_LOGIC;
    --write address channel
    M_AXI_AWREADY : STD_LOGIC;
    --write data channel
    M_AXI_WREADY : STD_LOGIC;
    --write response channel
    M_AXI_BRESP : STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_BVALID : STD_LOGIC;
end record AXI4_in_rec;

type input_rec is record
    --controll signals
    enable : STD_LOGIC;
    readWrite : STD_LOGIC;
    instruction : STD_LOGIC;
    size : STD_LOGIC_VECTOR(1 downto 0);
    --halt core
    halt_core : STD_LOGIC;
    --address input
    address_in : STD_LOGIC_VECTOR(31 downto 0);
    data_in : STD_LOGIC_VECTOR(31 downto 0);
end record input_rec;

type output_rec is record
    --system control
    memOp_finished : STD_LOGIC;
    store_systemData : STD_LOGIC;
    --exception flags
    load_afe_AXI : STD_LOGIC;
    storeAMO_afe_AXI : STD_LOGIC;
    instruction_afe_AXI : STD_LOGIC;
    --data 
    data_out : STD_LOGIC_VECTOR(31 downto 0);
end record output_rec;

type output_vec is array(natural range <>) of output_rec;
type input_vec is array(natural range <>) of input_rec;
type AXI4_in_vec is array(natural range <>) of AXI4_in_rec;
type AXI4_out_vec is array(natural range <>) of AXI4_out_rec;

----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant stimulus_input : input_vec(45 downto 0) := (
    0 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"5D8D1E12" , data_in => x"931DE196"), 
    --write transfer test     
    1 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"B1B3BCFA" , data_in => x"8D73CFEB"), 
    2 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"B1B3BCFA" , data_in => x"8D73CFEB"), 
    3 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"B1B3BCFA" , data_in => x"8D73CFEB"), 
    4 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"B1B3BCFA" , data_in => x"8D73CFEB"), 
    --read transfer test     
    5 => (enable => '1',readWrite => '0',instruction => '0',size => "10",halt_core => '0', address_in => x"B33BE7A6" , data_in => x"CBEF2EF9"), 
    6 => (enable => '1',readWrite => '0',instruction => '0',size => "10",halt_core => '0', address_in => x"B33BE7A6" , data_in => x"CBEF2EF9"), 
    7 => (enable => '1',readWrite => '0',instruction => '0',size => "10",halt_core => '0', address_in => x"B33BE7A6" , data_in => x"CBEF2EF9"), 
    8 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"B33BE7A6" , data_in => x"CBEF2EF9"), 
    --read instruction test     
    9 => (enable => '1',readWrite => '0',instruction => '1',size => "10",halt_core => '0', address_in => x"4B6130FC" , data_in => x"5B4C392E"), 
    10 => (enable => '1',readWrite => '0',instruction => '1',size => "10",halt_core => '0', address_in => x"4B6130FC" , data_in => x"5B4C392E"), 
    11 => (enable => '1',readWrite => '0',instruction => '1',size => "10",halt_core => '0', address_in => x"4B6130FC" , data_in => x"5B4C392E"), 
    12 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"4B6130FC" , data_in => x"5B4C392E"), 
    --write instruction test     
    13 => (enable => '1',readWrite => '1',instruction => '1',size => "10",halt_core => '0', address_in => x"9D834486" , data_in => x"7B4181D6"), 
    14 => (enable => '1',readWrite => '1',instruction => '1',size => "10",halt_core => '0', address_in => x"9D834486" , data_in => x"7B4181D6"), 
    15 => (enable => '1',readWrite => '1',instruction => '1',size => "10",halt_core => '0', address_in => x"9D834486" , data_in => x"7B4181D6"), 
    16 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"9D834486" , data_in => x"7B4181D6"), 
    --read halfword test     
    17 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"D1B961A1" , data_in => x"EE4536D9"), 
    18 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"D1B961A1" , data_in => x"EE4536D9"), 
    19 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"D1B961A1" , data_in => x"EE4536D9"), 
    20 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"D1B961A1" , data_in => x"EE4536D9"), 
    --write byte test     
    21 => (enable => '1',readWrite => '1',instruction => '0',size => "00",halt_core => '0', address_in => x"F6DB6843" , data_in => x"0DA83028"), 
    22 => (enable => '1',readWrite => '1',instruction => '0',size => "00",halt_core => '0', address_in => x"F6DB6843" , data_in => x"0DA83028"), 
    23 => (enable => '1',readWrite => '1',instruction => '0',size => "00",halt_core => '0', address_in => x"F6DB6843" , data_in => x"0DA83028"), 
    24 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"F6DB6843" , data_in => x"0DA83028"), 
    --load_afe test     
    25 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    26 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    27 => (enable => '1',readWrite => '0',instruction => '0',size => "01",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    28 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    29 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    30 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '1', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    31 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"B8EEEC13" , data_in => x"517E79E7"), 
    --storeAMO_afe test     
    32 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    33 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    34 => (enable => '1',readWrite => '1',instruction => '0',size => "10",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    35 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    36 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    37 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '1', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    38 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"AC0340BA" , data_in => x"F39C9106"), 
    --instruction_afe test     
    39 => (enable => '1',readWrite => '0',instruction => '1',size => "01",halt_core => '0', address_in => x"A5DE622D" , data_in => x"1D1A687D"), 
    40 => (enable => '1',readWrite => '0',instruction => '1',size => "01",halt_core => '0', address_in => x"A5DE622D" , data_in => x"4A5DFCED"), 
    41 => (enable => '1',readWrite => '0',instruction => '1',size => "01",halt_core => '0', address_in => x"A5DE622D" , data_in => x"98DD2C9F"), 
    42 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"A5DE622D" , data_in => x"D43BD600"), 
    43 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"A5DE622D" , data_in => x"391FFA15"), 
    44 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '1', address_in => x"A5DE622D" , data_in => x"826E870C"), 
    45 => (enable => '0',readWrite => '0',instruction => '0',size => "00",halt_core => '0', address_in => x"A5DE622D" , data_in => x"8B67F464") 
);

constant stimulus_AXI4_in:AXI4_in_vec(45 downto 0):=(
    0 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"00000000"),
    --write transfer test
    1 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABBABABA"),
    2 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '1', M_AXI_WREADY => '1', M_AXI_BRESP => "00", M_AXI_BVALID => '1', M_AXI_RDATA => x"ABBABABA"),
    3 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABBABABA"),
    4 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABBABABA"),
    --read transfer test
    5 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABBABABA"),
    6 => (  M_AXI_ARREADY => '1', M_AXI_RRESP => "00", M_AXI_RVALID => '1', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"DEADAFFE"),
    7 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"DEADAFFE"),
    8 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"DEADAFFE"),
    --read instruction test
    9 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"DEADAFFE"),
    10 => (	M_AXI_ARREADY => '1', M_AXI_RRESP => "00", M_AXI_RVALID => '1', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"), 
    11 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"),
    12 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"),
    --write instruction test
    13 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"),
    14 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '1', M_AXI_WREADY => '1', M_AXI_BRESP => "00", M_AXI_BVALID => '1', M_AXI_RDATA => x"BADC0DED"),
    15 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"),
    16 => ( M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"BADC0DED"),
    --read halfword
    17 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"01234567"),
    18 => ( M_AXI_ARREADY => '1', M_AXI_RRESP => "00", M_AXI_RVALID => '1', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    19 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    20 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    --write byte
    21 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    22 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '1', M_AXI_WREADY => '1', M_AXI_BRESP => "00", M_AXI_BVALID => '1', M_AXI_RDATA => x"AFFEDEAD"),
    23 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    24 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"AFFEDEAD"),
    --load_afe_test        
    25 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    26 => ( M_AXI_ARREADY => '1', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    27 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "10", M_AXI_RVALID => '1', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    28 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    29 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    30 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    31 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"12391232"),
    --storeAMO_afe test        
    32 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    33 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '1', M_AXI_WREADY => '1', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    34 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "10", M_AXI_BVALID => '1', M_AXI_RDATA => x"ABCD123F"),
    35 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    36 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    37 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    38 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"ABCD123F"),
    --instruction_afe test        
    39 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    40 => ( M_AXI_ARREADY => '1', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    41 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "10", M_AXI_RVALID => '1', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    42 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    43 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    44 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB"),
    45 => (	M_AXI_ARREADY => '0', M_AXI_RRESP => "00", M_AXI_RVALID => '0', M_AXI_AWREADY => '0', M_AXI_WREADY => '0', M_AXI_BRESP => "00", M_AXI_BVALID => '0', M_AXI_RDATA => x"82E62ACB")
);

constant results_output: output_vec(45 downto 0) := (
    0 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"00000000"),
    --write transfer test
    1 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABBABABA"),
    2 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABBABABA"),
    3 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABBABABA"),
    4 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABBABABA"),
    --read transfer test
    5 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABBABABA"),
    6 => (  memOp_finished => '0', store_systemData => '1', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"DEADAFFE"),
    7 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"DEADAFFE"),
    8 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"DEADAFFE"),
    --read instruction test
    9 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"DEADAFFE"),
    10 => (  memOp_finished => '0', store_systemData => '1', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    11 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    12 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    --write instruction test
    13 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    14 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    15 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    16 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"BADC0DED"),
    --read halfword test
    17 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"01234567"),
    18 => (  memOp_finished => '0', store_systemData => '1', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    19 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    20 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    --write byte test
    21 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    22 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    23 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"),
    24 => (  memOp_finished => '1', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"AFFEDEAD"), 
    --load_afe test
    25 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    26 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    27 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    28 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    29 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    30 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '1', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"),
    31 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"12391232"), 
    --storeAMO_afe test
    32 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    33 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    34 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    35 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    36 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    37 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '1', instruction_afe_AXI => '0', data_out =>x"ABCD123F"),
    38 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"ABCD123F"), 
    --instruction_afe test
    39 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB"),
    40 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB"),
    41 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB"),
    42 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB"),
    43 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB"),
    44 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '1', data_out =>x"82E62ACB"),
    45 => (  memOp_finished => '0', store_systemData => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', data_out =>x"82E62ACB")
);

constant results_AXI4_out: AXI4_out_vec(45 downto 0) := (
    0 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"00000000", M_AXI_AWADDR => x"00000000", M_AXI_WDATA => x"00000000"),
    --write transfer test
    1 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"00000000", M_AXI_AWADDR => x"00000000", M_AXI_WDATA => x"00000000"),
    2 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '1', M_AXI_WSTRB => "1111", M_AXI_WVALID => '1', M_AXI_BREADY => '1', M_AXI_ARADDR => x"B1B3BCFA", M_AXI_AWADDR => x"B1B3BCFA", M_AXI_WDATA => x"8D73CFEB"),
    3 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B1B3BCFA", M_AXI_AWADDR => x"B1B3BCFA", M_AXI_WDATA => x"8D73CFEB"),
    4 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B1B3BCFA", M_AXI_AWADDR => x"B1B3BCFA", M_AXI_WDATA => x"8D73CFEB"),
    --read transfer test
    5 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B1B3BCFA", M_AXI_AWADDR => x"B1B3BCFA", M_AXI_WDATA => x"8D73CFEB"),
    6 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '1', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B33BE7A6", M_AXI_AWADDR => x"B33BE7A6", M_AXI_WDATA => x"8D73CFEB"),
    7 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B33BE7A6", M_AXI_AWADDR => x"B33BE7A6", M_AXI_WDATA => x"8D73CFEB"),
    8 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B33BE7A6", M_AXI_AWADDR => x"B33BE7A6", M_AXI_WDATA => x"8D73CFEB"),
    --read instruction test
    9 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B33BE7A6", M_AXI_AWADDR => x"B33BE7A6", M_AXI_WDATA => x"8D73CFEB"),
    10 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '1', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"4B6130FC", M_AXI_AWADDR => x"4B6130FC", M_AXI_WDATA => x"8D73CFEB"),
    11 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"4B6130FC", M_AXI_AWADDR => x"4B6130FC", M_AXI_WDATA => x"8D73CFEB"),
    12 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"4B6130FC", M_AXI_AWADDR => x"4B6130FC", M_AXI_WDATA => x"8D73CFEB"),
    --write instruction test
    13 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"4B6130FC", M_AXI_AWADDR => x"4B6130FC", M_AXI_WDATA => x"8D73CFEB"),
    14 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '1', M_AXI_WSTRB => "1111", M_AXI_WVALID => '1', M_AXI_BREADY => '1', M_AXI_ARADDR => x"9D834486", M_AXI_AWADDR => x"9D834486", M_AXI_WDATA => x"7B4181D6"),
    15 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"9D834486", M_AXI_AWADDR => x"9D834486", M_AXI_WDATA => x"7B4181D6"),
    16 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"9D834486", M_AXI_AWADDR => x"9D834486", M_AXI_WDATA => x"7B4181D6"),
    --read halfword test
    17 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"9D834486", M_AXI_AWADDR => x"9D834486", M_AXI_WDATA => x"7B4181D6"),
    18 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '1', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"D1B961A1", M_AXI_AWADDR => x"D1B961A1", M_AXI_WDATA => x"7B4181D6"),
    19 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"D1B961A1", M_AXI_AWADDR => x"D1B961A1", M_AXI_WDATA => x"7B4181D6"),
    20 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"D1B961A1", M_AXI_AWADDR => x"D1B961A1", M_AXI_WDATA => x"7B4181D6"),
    --write byte test
    21 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"D1B961A1", M_AXI_AWADDR => x"D1B961A1", M_AXI_WDATA => x"7B4181D6"),
    22 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '1', M_AXI_WSTRB => "0001", M_AXI_WVALID => '1', M_AXI_BREADY => '1', M_AXI_ARADDR => x"F6DB6843", M_AXI_AWADDR => x"F6DB6843", M_AXI_WDATA => x"0DA83028"),
    23 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"F6DB6843", M_AXI_AWADDR => x"F6DB6843", M_AXI_WDATA => x"0DA83028"),
    24 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"F6DB6843", M_AXI_AWADDR => x"F6DB6843", M_AXI_WDATA => x"0DA83028"),
    --loaf_afe test
    25 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"F6DB6843", M_AXI_AWADDR => x"F6DB6843", M_AXI_WDATA => x"0DA83028"),
    26 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '1', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    27 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    28 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    29 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    30 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    31 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    --storeAMO_afe test
    32 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"B8EEEC13", M_AXI_AWADDR => x"B8EEEC13", M_AXI_WDATA => x"0DA83028"),
    33 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '1', M_AXI_WSTRB => "1111", M_AXI_WVALID => '1', M_AXI_BREADY => '1', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    34 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "1111", M_AXI_WVALID => '0', M_AXI_BREADY => '1', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    35 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    36 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    37 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    38 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    --instruction_afe test
    39 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"AC0340BA", M_AXI_AWADDR => x"AC0340BA", M_AXI_WDATA => x"F39C9106"),
    40 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '1', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106"),
    41 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "100", M_AXI_ARVALID => '0', M_AXI_RREADY => '1', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "100", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0011", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106"),
    42 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106"),
    43 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106"),
    44 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106"),
    45 => (  M_AXI_ARCACHE => "0011", M_AXI_ARPROT => "000", M_AXI_ARVALID => '0', M_AXI_RREADY => '0', M_AXI_AWCACHE => "0011", M_AXI_AWPROT => "000", M_AXI_AWVALID => '0', M_AXI_WSTRB => "0001", M_AXI_WVALID => '0', M_AXI_BREADY => '0', M_AXI_ARADDR => x"A5DE622D", M_AXI_AWADDR => x"A5DE622D", M_AXI_WDATA => x"F39C9106")
);


end package;


package body sim_AXI4_IV_1_pkg is
function to_hstring (SLV : std_logic_vector) return string is
    variable L : LINE;
  begin
    hwrite(L,SLV);
    return L.all;
  end function to_hstring;
end package body;