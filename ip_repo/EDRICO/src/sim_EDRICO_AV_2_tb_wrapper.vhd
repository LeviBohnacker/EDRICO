--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Sun Jul 11 11:07:41 2021
--Host        : dickerlaptop running 64-bit Manjaro Linux
--Command     : generate_target sim_EDRICO_AV_2_tb_wrapper.bd
--Design      : sim_EDRICO_AV_2_tb_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sim_EDRICO_AV_2_tb_wrapper is
end sim_EDRICO_AV_2_tb_wrapper;

architecture STRUCTURE of sim_EDRICO_AV_2_tb_wrapper is
  component sim_EDRICO_AV_2_tb is
  end component sim_EDRICO_AV_2_tb;
begin
sim_EDRICO_AV_2_tb_i: component sim_EDRICO_AV_2_tb
 ;
end STRUCTURE;
