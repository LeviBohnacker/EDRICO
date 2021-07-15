########################################################
######test Integert Register-Immediate instruction######
########################################################
#LUI: generate test data
LUI x1, 0xA0000
LUI x2, 0xC0BAD
LUI x3, 0x12345
LUI x4, 0x00001
#ADDI: generate test data
ADDI x5, x0, 0x004 
#AUIPC, safe PC(0x00000014) + immediate (0x12345000) = x4
AUIPC x6, 0x12345
#ADDI x30 = x1 + 0x100
ADDI x30, x1 , 0x100
#SLTI, x29 = 1 when x1<0xFFFFFFFF (signed numbers) => x29 is expected to be 1
SLTI x29, x1, 0x7FF
#SLTIU x28 = 1 when x1<0xFFFFFFFF (unsigned numbers) => x29 is expected to be 0 
SLTIU x28, x1, 0x7FF
#ANDI:  = x5 AND 0x004 = 0x00000004
ANDI x14, x5, 0x004
#ORI: x13 = x3 ORI 0xDEA = 0x123451EA
ORI x13, x3, 0x1EA
#XORI: x12 = x5 XORI 0x004 = 0x00000000
XORI x12, x5, 0x004
#SLLI shift x4 left by four bits, =>  x27 = 0x00010000
SLLI x27, x4, 4
#SRLI shift x1 right by 2 bits, =>  x26 = 0x28000000
SRLI x26, x1, 2
#SRAI shift x1 right arithmetically by 3 bits => x25 = 0xF4000000
SRAI x25, x1, 3

########################################################
######test Integert Register-Register instruction#######
########################################################
#ADD: x24 = x2+x3 = 0xD2EF2000
ADD x24, x2, x3
#SUB: x23 = x3-x4 = 0x12344000
SUB x23, x3, x4
#AND: x22 = x1 and x4 = 0x00000000
AND x22, x1, x4
#OR: x21 = x2 or x4 = 0xC0BAD000
OR x21, x2, x4
#XOR: x20 = x2 or x4 = 0xC0BAC000
XOR x20, x2, x4
#SLT: x19 = 1 if x2 < x3, else 0 (signed, expected 1) 
SLT x19, x2, x3
#SLTU: x18 = 1 if x2 < x3, else 0 (unsigned, expected 0)
SLTU x18, x2, x3
#SLL: x17 = x4>>4(x5) = 0x00010000
SLL x17, x4, x5
#SRL: x16 = x1<<4(x5) = 0x0A000000
SRL x16, x1, x5
#SRA x15 = x1<<4(x5, arithmetic) = 0xFA000000
SRA x15, x1, x5

########################################################
###############test Conditional branches################
########################################################
#BEQ: branch to PC+8 if x1 = x2 => not performed
BEQ x1, x2, 0x4
#BNE: branch to PC+8 (skip next instruction) if x1 != x2
BNE x1, x2, 0x8
ADD x4, x3, x4  #x4=12346000
#BLT: branch to PC+16 (skip next three instructions) if x5 < x4 
BLT x5, x4, 0x10
#BGE: branch to PC+8 (skip next instruction) if x3 >= x4  
BGE x3, x4, 0x8
ADD x4, x3, x4 #x4=12346000
#BLTU: branach to PC+32 if x1 < x3 (not performed)
BLTU x1, x3, 0x20
#BGEU: branch to PC+8 (skip instruction) if x1 >= x3
BGEU x1, x3, 0x8
ADD x3, x2, x0 #(skipped)

########################################################
##############test Load Store Instruction###############
########################################################
SW x2, 0(x1)
SW x3, 4(x1)
SW x4, 8(x1)
ADDI x5, x0, 0xAB
SB x5, 13(x1)
SH x2, 14(x1)

LB x11, 3(x1) #expect 0xFFFFFFC0
LH x10, 2(x1) #expect 0xFFFFC0BA
LW x9, 4(x1) #expect 0x12345000
LBU x8, 3(x1) #expect 0x000000C0
LHU x7, 2(x1) #expect 0x0000C0BA

JAL x0, 8
NOP
JALR x0, x0, 0 #jump to start