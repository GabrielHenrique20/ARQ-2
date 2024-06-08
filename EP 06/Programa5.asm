# // programa 5 { 
#	x = 100000;   HEXA = 0x0001 86A0
#	y = 200000;   HEXA = 0x0003 0D40
#	z = x + y; 
# }

#Associações
# x = $s0
# y = $s1
# z = $s3

# O NUMERO DE CASAS PARA ANDAR, NESSE CASO, TEM QUE ESTAR EM BINARIO
# Ox0010 esquivale a 16 bits
.text
.globl main

main:
	ori $t0, $zero, 0x0001 # t0 = 0x0000 0001
	sll $t0, $t0, 16  # t0 = 0x0001 0000 (andar quatro casas para a esquerda, ou seja, 4 * 4 = 16 bits)
	ori $s0, $t0, 0x86A0 # x = Ox0001 86A0
	
	ori $t1, $zero, 0x0003 # t1 = 0x0000 0003
	sll $t1, $t1, 0x0010 # t1 = 0x0003 0000 
	ori $s1, $t1, 0x0D40 # y = 0x0003 0D40
	
	add $s3, $s0, $s1 # z = x + y 
	
