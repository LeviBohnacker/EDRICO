----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: 
-- Module Name: _UV_x_tb - rtl
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

--add librarys

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity _UV_x_tb is
end _UV_x_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of _UV_x_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------

begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 5 loop
        error_flag := false;
        --declare inputs
        
        
        wait for 1 ns;
		--result checks
        if(results(i)(x) /= x) then
            report "x error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 4 ns;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;

----------------------------------------------------------------------------------
--Design Under Test
----------------------------------------------------------------------------------
dut :

end rtl;
