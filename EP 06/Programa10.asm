# // programa 10 
# Considere o seguinte programa: y = 127x – 65z + 1 
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z 
# estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser 
# escrito, ou seja: 
# .data 
# x: .word 5 
# z: .word 7 
# y: .word 0   # esse valor deverá ser sobrescrito após a execução do programa. 

# Associacoes
# x = $s1
# z = $s2
# y = $s3

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s1, 0x0000 ($t0) # MEM[0]
	lw $s2, 0x0004 ($t0) # MEM[1]
	
	sll $t1, $s1, 7 # t1 = 128*x
	sub $t1, $t1, $s1 # t1 = 128x - x = 127x
	
	sll $t2, $s2, 6 # t2 = 64z
	add $t2, $t2, $s2 # t2 = 64z + z
	
	sub $t3, $t1, $t2 # t3 = 127x – 65z
	addi $s3, $t3, 1 # t3 = 127x – 65z + 1
	
	sw $s3, 0x0008 ($t0) # y -> MEM[2] = 127x – 65z + 1
	
.data 
x: .word 5 
z: .word 7 
y: .word 0   # esse valor deverá ser sobrescrito após a execução do programa.
