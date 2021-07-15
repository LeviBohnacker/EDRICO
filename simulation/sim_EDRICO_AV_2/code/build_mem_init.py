#python code to format the "xxd -ps -c 4 -u" dump
import sys


if __name__ == '__main__':
	iFile = str(sys.argv[1])
	file_i = open(iFile, 'r')
	file_o = open('mem.coe', 'w')
	file_o.writelines('memory_initialization_radix=16;\n')
	file_o.writelines('memory_initialization_vector=')
	Lines = file_i.readlines();
	for count in range(len(Lines)):
		line = Lines[count][6:8] + Lines[count][4:6] + Lines[count][2:4] + Lines[count][0:2]
		file_o.writelines(line + ' ')
	file_o.writelines(';')
