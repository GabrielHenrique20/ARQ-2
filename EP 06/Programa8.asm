# // programa 8 
# Inicialmente escreva um programa que faça: 
# $8 = 0x12345678. 
# A partir do registrador $8 acima, usando apenas instruções lógicas (or, ori, and, andi, 
# xor, xori) e instruções de deslocamento (sll, srl e sra), você deverá obter os seguintes 
# valores nos respectivos registradores: 
# $9   = 0x12 
# $10 = 0x34 
# $11 = 0x56 
# $12 = 0x78 

.text
.globl main

main:
	ori $8, $0, 0x1234 #s8 = 0x0000 1234
	sll $8, $8, 16 # s7 = 4*4 casas para o lado = 16 bits, ou seja, 0x1234 0000
	ori $8, $8, 0x5678 # s8 = 0x1234 5678
	
	srl $9, $8, 24 # s9 = 0x0000 0012 --> 0x12
	
	sll $10, $8, 8 # s10 = 0x3456 7800 (4*2 = 8)
	srl $10, $10, 24 # s10 = 0x0000 0034 (4*6 = 24)
	
	andi $11, $8, 0xFF00 # s11 = and entre 0x1234 5678 e 0x0000 FF00 = 0x0000 5600
	srl $11, $11, 8 # s11 = 4*2 = 8 0x0000 0056
	
	andi $12, $8, 0x00FF # s12 = and entre 0x1234 5678 e 0x0000 00FF = 0x0000 0078
	
	
	
	
