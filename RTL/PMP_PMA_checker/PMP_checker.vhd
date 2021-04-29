-------------------------------------------------------------------
--File Name:
--  PMP_checker.vhd
--Author:
--  Levi Bohnacker
--Description:
--  module to instantiate the PMP_unit modules and determine 
--  whether or not an access is enabled. If exceptions are raised,
--  the PMP_checker determines which sort of exception (load, 
--  instruction or storeAMO access fault exceptions are possible).
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PMP_checker is
end entity;

architecture rtl of PMP_checker is
begin
end architecture;
