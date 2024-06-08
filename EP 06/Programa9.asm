# // programa 9 
# Considere a memória inicial da seguinte forma: 
# .text 
# .data 
# x1: .word 15 
# x2: .word 25 
# x3: .word 13 
# x4: .word 17 
# soma: .word -1 
# Escrever um programa que leia todos os números, calcule e substitua o valor da variável soma por 
# este valor. 

# x1 = MEM[0]
# x2 = MEM[1]
# x3 = MEM[2]
# x4 = MEM[3]
# soma --> MEM[4] = x1 + x2 + x3 + x4

#Associações
# x1 = $s0
# x2 = $s1
# x3 = $s2
# x4 = $s3
# soma = $s10

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0x0000 ($t0) # MEM[0]
	lw $s1, 0x0004 ($t0) # MEM[1]
	lw $s2, 0x0008 ($t0) # MEM[2]
	lw $s3, 0x000C ($t0) # MEM[3]
	add $t1, $s0, $s1 # t1 = x1 + x2
	add $t1, $t1, $s2 # t1 = t1 + x3
	add $s5, $t1, $s3 # soma = t1 + x4
	sw $s5, 0x0010 ($t0) # MEM[4] = soma
	
.data 
x1: .word 15 
x2: .word 25 
x3: .word 13 
x4: .word 17 
soma: .word -1 