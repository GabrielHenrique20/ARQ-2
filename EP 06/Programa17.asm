# // programa 17 
# Para a expressão a seguir, escreva um programa que calcule o valor de k: 
# k =  x * y   (Você deverá realizar a multiplicação através de somas!) 
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá lido da 
# segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na terceira posição 
# livre da memória.

# {
#	x = MEM[0]
#	y = MEM[1]
#	k = x * y
#	MEM[2] = k
# }

# Associações
# x = $s0
# y = $s1
# k = $s2

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0x0000($t0) # x = MEM[0]
	lw $s1, 0x0004($t0) # y = MEM[1]
	
multip:
	add $t1, $t1, $s0 # t1 = t1 + x
	addi $t2, $t2, 1 # contador++
	bne $t2, $s1, multip # if (contador != y) goto multip
	add $s2, $zero, $t1 # k = x * y
	sw $s2, 0x0008($t0) # MEM[2] = k

.data
x: .word 5
y: .word 5	