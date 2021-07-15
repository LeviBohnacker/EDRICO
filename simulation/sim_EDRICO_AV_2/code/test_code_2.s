#load upper immediate for data memory base address
lui x2, 0xA0000
#load dummy data to register
lui x30, 0x0DEAD;
lui x31, 0x0AFFE;
#store dummy data in data memory
sw x30, 0(x2);
sw x31, 4(x2);
#load two operands from memory
lw x3,0(x2)
lw x4,4(x2)
#add two operands
ADD x3, x3, x4
#store two operands in memory
sw x3, 8(x2)
#jump back to zero
JALR x1, x0, 0
