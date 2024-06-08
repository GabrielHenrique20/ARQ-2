# // programa 3 (add, addi, sub, lógicas) { 
#	x = 3; 
#	y = 4 ; 
#	z = ( 15*x + 67*y)*4 
# }

#Associações
# x = $s0
# y = $s1
# z = $s2

.text
.globl main

main:
	ori $s0, $zero, 3 # x = 3
	ori $s1, $zero, 0x0004 # y = 4
	add $t0, $s0, $s0 # t0 = 2x
	add $t0, $t0, $t0 # t0 = 4x
	add $t0, $t0, $t0 # t0 = 8x
	add $t0, $t0, $t0 # t0 = 16x
	sub $t0, $t0, $s0 # t0 = 16x - x = 15x (como usamos uma variavel temporaria, o x se torna o elemento da conta fazendo o numero diminuir para 15x)
	add $t1, $s1, $s1 # t1 = 2y
	add $t1, $t1, $t1 # t1 = 4y
	add $t1, $t1, $t1 # t1 = 8y
	add $t1, $t1, $t1 # t1 = 16y
	add $t1, $t1, $t1 # t1 = 32y
	add $t1, $t1, $t1 # t1 = 64y
	add $t1, $t1, $s1 # t1 = 64y + y = 65y
	add $t1, $t1, $s1 # t1 = 64y + y = 66y
	add $t1, $t1, $s1 # t1 = 64y + y = 67y
	add $t3, $t0, $t1 # t3 = 15x + 67y
	add $t3, $t3, $t3 # t3 = 2*(15x + 67y)
	add $s2, $t3, $t3 # z = 4*(15x + 67y)
	
	
	
