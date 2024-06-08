# // programa 6 { 
#	x = o maior inteiro possível;  # o maior inteiro possível é 0x7FFF FFFF
#	y = 300000;  		       Hexa = 0x0004 93E0
#	z =  x - 4y  
# } 

#Associações
# x = $s0
# y = $s1
# z = $s3

# O NUMERO DE CASAS PARA ANDAR, NESSE CASO, TEM QUE ESTAR EM BINARIO
.text
.globl main

main:
	ori $t0, $t0, 0x7FFF # t0 = 0x0000 7FFF
	sll $t0, $t0, 16 # estou andando 4 casas de bit para a esquerda, ou seja 4 de cada bit * 4 = 16 --> 0x7FFF 0000
#	sll $t0, $t0, 0x0010 TANTO FAZ USAR ESSA OPÇÃO OU A DE CIMA, AS DUAS, NESSE CASO, ANDAM 4 BITS PARA A ESQUERDA
	ori $s0, $t0, 0xFFFF
	
	ori $t1, $t1, 0x0004 # t1 = 0x0000 0004
	sll $t1, $t1, 0x0010 # t1 = 0x0004 0000 (16 bits ou também quatro casas para a esquerda)
	ori $s1, $t1, 0x93E0 # t1 = 0x0004 93E0
	
	sll $t3, $s1, 2 # 2 ^2 = 4, ou seja, 4*y
	sub $s3, $s0, $t3 # z = x - 4y
	
	
