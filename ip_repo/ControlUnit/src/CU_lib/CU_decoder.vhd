----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 05/10/2021 06:04:15 AM
-- Design Name: CU_decoder
-- Module Name: Control Unit
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  Decoding unit decodes incoming instruction once its loaded from memory
--  
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CU_decoder is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- instruction register
    ir: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    type_of_instruction_int: out std_logic_vector(3 downto 0);
    -- PMP ctrl
    PMP_enable_int: out std_logic;
    PMP_instruction_int: out std_logic;
    PMP_size_int: out std_logic_vector(1 downto 0);
    PMP_rw_int: out std_logic;
    -- MUX ctrl
    DMU_IN_MUX_int: out std_logic;
    DMU_OUT_MUX_int: out std_logic;
    R_MUX_int: out std_logic;
    PMP_MUX_int: out std_logic;
    B_MUX_int: out std_logic;
    A_MUX_int: out std_logic_vector(1 downto 0);
    -- reg ctrl
    reg_read_A_int: out std_logic_vector(4 downto 0);
    reg_read_B_int: out std_logic_vector(4 downto 0);
    reg_write_int: out std_logic_vector(4 downto 0);
    -- CSR ctrl
    CSR_save_int: out std_logic;
    CSR_address_int: out std_logic_vector(11 downto 0);
    CSR_write_int: out std_logic;
    CSR_read_int: out std_logic;
    -- exception ctrl
    iie_CU_int: out std_logic;
    ece_CU_int: out std_logic;
    be_CU_int: out std_logic;
    return_int: out std_logic;
    -- other signals
    ALU_op_int: out std_logic_vector(3 downto 0);
    immediate_int: out std_logic_vector(31 downto 0);
    mask_ctrl_int: out std_logic_vector(2 downto 0)
);
end entity;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_decoder is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
type instruction_cluster is (INVALID, LOAD, STORE, BRANCH, JALR, JAL, FENCE, OPIMM, OP, SYSTEM, AUIPC, LUI);
signal decoded_cluster : instruction_cluster;
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

begin
    decode: process(ir)
    begin
        case ir(1 downto 0) is
            when "00" =>
                decoded_cluster <= INVALID;
            when others =>
                case ir(4 downto 2) is
                    when "000" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= LOAD;
                            when "01" => decoded_cluster <= STORE;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= BRANCH;
                            when others => decoded_cluster <= INVALID;
                        end case;
                    when "001" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= INVALID;
                            when "01" => decoded_cluster <= INVALID;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= JALR;
                            when others => decoded_cluster <= INVALID;
                        end case;                   
                    when "010" =>
                        decoded_cluster <= INVALID;
                    when "011" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= FENCE;
                            when "01" => decoded_cluster <= INVALID;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= JAL;
                            when others => decoded_cluster <= INVALID;
                        end case; 
                    when "100" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= OPIMM;
                            when "01" => decoded_cluster <= OP;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= SYSTEM;
                            when others => decoded_cluster <= INVALID;
                        end case;  
                    when "101" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= AUIPC;
                            when "01" => decoded_cluster <= LUI;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= INVALID;
                            when others => decoded_cluster <= INVALID;
                        end case;  
                    when others =>
                        decoded_cluster <= INVALID; 
                end case;
        end case;
    end process decode; 

    assign: process(ir, decoded_cluster)
    begin
        -- default values
        type_of_instruction_int <= "0000";
        PMP_enable_int <= '0';
        PMP_instruction_int <= '0';
        PMP_size_int <= "00";
        PMP_rw_int <= '0';
        DMU_IN_MUX_int <= '0';
        DMU_OUT_MUX_int <= '0';
        R_MUX_int <= '0';
        PMP_MUX_int <= '0';
        B_MUX_int <= '0';
        A_MUX_int <= "00";
        reg_read_A_int <= "00000";
        reg_read_B_int <= "00000";
        reg_write_int <= "00000";
        CSR_save_int <= '0';
        CSR_address_int <= "000000000000";
        CSR_write_int <= '0';
        CSR_read_int <= '0';
        iie_CU_int <= '0';
        ece_CU_int <= '0';
        be_CU_int <= '0';
        return_int <= '0';
        ALU_op_int <= "0000";
        immediate_int <= "00000000000000000000000000000000";
        mask_ctrl_int <= "100";

        case decoded_cluster is
            when LOAD =>
            -- for LOAD instructions adapt the PMP size and masking control
            -- ALU performs addition to obtain target address and therefore receives an immediate
            -- and data from register. loaded data stores in respective destination register
                type_of_instruction_int <= "0001";
                PMP_enable_int <= '1';  
                PMP_instruction_int <= '0';
                DMU_OUT_MUX_int <= '1';
                PMP_MUX_int <= '1';
                B_MUX_int <= '1';
                A_MUX_int <= "01";
                reg_read_B_int <= ir(19 downto 15);
                reg_write_int <= ir(11 downto 7);
                immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20)); 

                case ir(14 downto 12) is
                    when "000" => --LB
                        PMP_size_int <= "00";
                        mask_ctrl_int <= "000";                    
                    when "001" => --LH
                        PMP_size_int <= "01";
                        mask_ctrl_int <= "010";                     
                    when "010" => --LW
                        PMP_size_int <= "10";
                        mask_ctrl_int <= "100";                     
                    when "100" => --LBU
                        PMP_size_int <= "00";
                        mask_ctrl_int <= "001";                     
                    when "101" => --LHU
                        PMP_size_int <= "01";
                        mask_ctrl_int <= "011"; 
                    when others =>
                        iie_CU_int <= '1';                    
                end case;
            when STORE =>
            -- for STORE instructions adapt the PMP size and masking control
            -- ALU performs addition to obtain target address and therefore receives an immediate
            -- and data from register 
                type_of_instruction_int <= "0001";
                PMP_enable_int <= '1';
                PMP_instruction_int <= '0';
                PMP_rw_int <= '1';
                DMU_IN_MUX_int <= '1';
                DMU_OUT_MUX_int <= '0';
                R_MUX_int <= '0';
                PMP_MUX_int <= '1';
                B_MUX_int <= '1';
                A_MUX_int <= "01";
                reg_read_A_int <= ir(24 downto 20);
                reg_read_B_int <= ir(19 downto 15);
                immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 25) & ir(11 downto 7));

                    case ir(14 downto 12) is 
                        when "000" => --SB
                            PMP_size_int <= "00";     
                            mask_ctrl_int <= "001";                                                
                        when "001" => --SH
                            PMP_size_int <= "01";  
                            mask_ctrl_int <= "011";                                       
                        when "010" => --SW
                            PMP_size_int <= "10";  
                            mask_ctrl_int <= "100";
                        when others =>
                            iie_CU_int <= '1';                              
                    end case;
            when BRANCH =>
            -- Branch instructions adapt the ALU operation to compare regA and regB
                type_of_instruction_int <= "0010";
                B_MUX_int <= '1';
                A_MUX_int <= "10";
                reg_read_A_int <= ir(24 downto 20);
                reg_read_B_int <= ir(19 downto 15);
                ALU_op_int <= "0000";
                immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31) & ir(7) & ir(30 downto 25) & ir(11 downto 8));

                    case ir(14 downto 12) is 
                        when "000" => --BEQ    
                            ALU_op_int <= "0101";                                                      
                        when "001" => --BNE   
                            ALU_op_int <= "0110";
                        when "100" => --BLT     
                            ALU_op_int <= "1010";                              
                        when "101" => --BGE 
                            ALU_op_int <= "1100";                             
                        when "110" => --BLTU       
                            ALU_op_int <= "1011";                              
                        when "111" => --BLEU 
                            ALU_op_int <= "1101";
                        when others =>
                            iie_CU_int <= '1';
                    end case;                                         
            when JALR => --JALR
            -- JALR adds + 4 to the program counter and stores it to rd
            -- target address is obtained by PC_top control which adds regB to the immediate
                R_MUX_int <= '1';
                type_of_instruction_int <= "1000";
                reg_read_B_int <= ir(19 downto 15);
                reg_write_int <= ir(11 downto 7);
                immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));
            when FENCE => --NOP            
            when JAL => --JAL
            -- JAL stores PC +4 into rd, jump target address obtained by PC_top (adds immediate to PC)
                R_MUX_int <= '1';
                type_of_instruction_int <= "0100"; 
                reg_write_int <= ir(11 downto 7);
                immediate_int <= std_logic_vector((31 downto 20 => ir(31)) & ir(31) & ir(19 downto 12) & ir(20) & ir(30 downto 21));                         
            when OPIMM =>
            -- Immediate operations perform ALU operations on data from regB and immediate
                R_MUX_int <= '1';
                PMP_MUX_int <= '0';
                B_MUX_int <= '1';
                A_MUX_int <= "01";
                reg_read_B_int <= ir(19 downto 15);
                reg_write_int <= ir(11 downto 7);

                    case ir(14 downto 12) is
                        when "000" => --ADDI
                            ALU_op_int <= "0000";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));
                        when "001" => --SLLI
                            ALU_op_int <= "0111";
                            immediate_int <= std_logic_vector((31 downto 5 => ir(24)) & ir(24 downto 20));                      
                        when "010" => --SLTI
                            ALU_op_int <= "1010";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));                               
                        when "011" => --SLTIU
                            ALU_op_int <= "1011";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));                              
                        when "100" => --XORI
                            ALU_op_int <= "0100";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));                                
                        when "101" => --SRLI/SRAI
                            if(ir(30) = '0') then --SRLI
                                ALU_op_int <= "1000";
                                immediate_int <= std_logic_vector((31 downto 5 => ir(24)) & ir(24 downto 20));
                            else --SRAI
                                ALU_op_int <= "1001";
                                immediate_int <= std_logic_vector((31 downto 5 => ir(24)) & ir(24 downto 20)); 
                            end if;                                                           
                        when "110" => --ORI
                            ALU_op_int <= "0011";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));                                
                        when "111" => --ANDI
                            ALU_op_int <= "0010";
                            immediate_int <= std_logic_vector((31 downto 12 => ir(31)) & ir(31 downto 20));    
                        when others =>
                            iie_CU_int <= '1';                            
                    end case;
            when OP =>
            -- Normal operation performs ALU operation on regA and regB, stores in rd (regwrite)
                R_MUX_int <= '1';
                PMP_MUX_int <= '0';
                B_MUX_int <= '1';
                A_MUX_int <= "10";
                reg_read_A_int <= ir(24 downto 20);
                reg_read_B_int <= ir(19 downto 15);
                reg_write_int <= ir(11 downto 7);

                    case ir(14 downto 12) is
                        when "000" => --ADD/SUB
                            if(ir(30) = '0') then --ADD
                                ALU_op_int <= "0000";
                            else --SUB
                                ALU_op_int <= "0001";
                            end if;                            
                        when "001" => --SLL
                            ALU_op_int <= "0111";
                        when "010" => --SLT
                            ALU_op_int <= "1010";
                        when "011" => --SLTU
                            ALU_op_int <= "1011";                            
                        when "100" => --XOR
                            ALU_op_int <= "0100";                             
                        when "101" => --SRL/SRA
                            if(ir(30) = '0') then --SRL
                                ALU_op_int <= "1000";
                            else --SRA
                                ALU_op_int <= "1001";
                            end if;                                                           
                        when "110" => --OR
                            ALU_op_int <= "0011";                           
                        when "111" => --AND
                            ALU_op_int <= "0010";
                        when others =>
                            iie_CU_int <= '1';                           
                    end case;            
            when SYSTEM =>  
                CSR_save_int <= '1';
                CSR_address_int <= ir(31 downto 20);
                CSR_write_int <= '1';

                    case ir(14 downto 12) is

                        when "000" => --ECALL/EBREAK
                            type_of_instruction_int <= "0000";
                            PMP_enable_int <= '0';
                            PMP_instruction_int <= '0';
                            PMP_size_int <= "00";
                            PMP_rw_int <= '0';
                            DMU_IN_MUX_int <= '0';
                            DMU_OUT_MUX_int <= '0';
                            R_MUX_int <= '0';
                            PMP_MUX_int <= '0';
                            B_MUX_int <= '0';
                            A_MUX_int <= "00";
                            reg_read_A_int <= "00000";
                            reg_read_B_int <= "00000";
                            reg_write_int <= "00000";
                            CSR_save_int <= '0';
                            CSR_address_int <= "000000000000";
                            CSR_write_int <= '0';
                            CSR_read_int <= '0';
                            iie_CU_int <= '0';
                            return_int <= '0';
                            ALU_op_int <= "0000";
                            mask_ctrl_int <= "100";

                            case ir(22 downto 20) is
                                when "000" => --ECALL
                                    ece_CU_int <= '1';
                                    be_CU_int <= '0';
                                when "001" => --EBREAK
                                    ece_CU_int <= '0';
                                    be_CU_int <= '1';
                                when "010" => --MRET
                                    if(ir(29 downto 28) = "11") then
                                        ece_CU_int <= '0';
                                        be_CU_int <= '0';                                    
                                        return_int <= '1';
                                    else --INVALID
                                        ece_CU_int <= '0';
                                        be_CU_int <= '0';
                                        iie_CU_int <= '1';
                                    end if;
                                when "101" => --WFI -> NOP
                                    ece_CU_int <= '0';
                                    be_CU_int <= '0';
                                when others =>
                                    ece_CU_int <= '0';
                                    be_CU_int <= '0';
                                    iie_CU_int <= '1'; 
                            end case;
                        when "001" => --CSRRW
                            R_MUX_int <= '0';
                            B_MUX_int <= '0';
                            A_MUX_int <= "00";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                            
                            CSR_read_int <= '0';
                            ALU_op_int <= "0000";                                                                                                  
                        when "010" => --CSRRS
                            R_MUX_int <= '1';
                            B_MUX_int <= '1';
                            A_MUX_int <= "10";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                             
                            CSR_read_int <= '1';
                            ALU_op_int <= "0011";                         
                        when "011" => --CSRRC
                            R_MUX_int <= '1';
                            B_MUX_int <= '1';
                            A_MUX_int <= "10";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                              
                            CSR_read_int <= '1';
                            ALU_op_int <= "0010";                       
                        when "101" => --CSRRWI
                            R_MUX_int <= '1';
                            B_MUX_int <= '1';
                            A_MUX_int <= "01";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                              
                            CSR_read_int <= '0';
                            ALU_op_int <= "0000";
                            immediate_int <= std_logic_vector((31 downto 5 => '0') & ir(19 downto 15));                         
                        when "110" => --CSRRSI
                            R_MUX_int <= '1';
                            B_MUX_int <= '1';
                            A_MUX_int <= "01";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                             
                            CSR_read_int <= '1';
                            ALU_op_int <= "0011";
                            immediate_int <= std_logic_vector((31 downto 5 => '0') & ir(19 downto 15));                            
                        when "111" => --CSRRCI
                            R_MUX_int <= '1';
                            B_MUX_int <= '1';
                            A_MUX_int <= "01";
                            reg_read_B_int <= ir(19 downto 15);
                            reg_write_int <= ir(11 downto 7);                             
                            CSR_read_int <= '1';
                            ALU_op_int <= "0010";
                            immediate_int <= std_logic_vector((31 downto 5 => '0') & ir(19 downto 15));     
                        when others =>
                            iie_CU_int <= '1';                      
                    end case;
            when AUIPC =>
            -- AUIPC adds upper immediate to the pgroam counter and stores to rd (regwrite)
                R_MUX_int <= '1';
                PMP_MUX_int <= '0';
                B_MUX_int <= '0';
                A_MUX_int <= "01";
                reg_write_int <= ir(11 downto 7);
                immediate_int <= std_logic_vector(ir(31 downto 12) & (11 downto 0 => '0'));

            when LUI =>
            -- loads upper immediate 
                R_MUX_int <= '1';
                PMP_MUX_int <= '0';
                B_MUX_int <= '1';
                A_MUX_int <= "01";
                reg_write_int <= ir(11 downto 7);
                immediate_int <= std_logic_vector(ir(31 downto 12) & (11 downto 0 => '0'));

            when INVALID => --illegal instruction exception
                iie_CU_int <= '1';
            when others => iie_CU_int <= '1';
        end case;        
    end process assign;   
end architecture;