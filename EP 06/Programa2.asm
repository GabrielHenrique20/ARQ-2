# //programa 2 (add, addi, sub, lógicas) { 
#	x = 1; 
#	y = 5*x + 15; 
# }

#Associeações
# x = $s0
# y = $s1

.text
.globl main

main:
	ori $s0, $zero, 0x0001 # x = 1
	add $t0, $s0, $s0 # t0 = 2x (x + x)
	add $t0, $t0, $t0 # t0 = 4x (2x + 2x)
	add $t0, $t0, $s0 # t0 = 5x (4x + x)
	
	addi $s1, $t0, 15 # y = 5x + 15
#fim
