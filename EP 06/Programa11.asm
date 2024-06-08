# // programa 11 
# Considere o seguinte programa: y = x – z + 300000 
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z 
# estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser 
# escrito, ou seja: 
# .data 
# x: .word 100000 
# z: .word 200000 
# y: .word 0   # esse valor deverá ser sobrescrito após a execução do programa.

# Associeações
# x = $s0
# y = $s1
# z = $s2

# 0x0004 93E0 -- 300000

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0x0000($t0) # MEM[0]
	lw $s2, 0x0004($t0) # MEM[1]
	sub $t1, $s0, $s2 # t1 = x - z
	lui $t2, 0x0004 # t2 = 0x0004 0000
	ori $t2, $t2, 0x93E0 # t2 = 0x0004 93E0 // 300000
	add $s1, $t1, $t2 # y = x – z + 300000
	sw $s1, 0x0008($t0) # MEM[2] = y = x – z + 300000
	
.data 
x: .word 100000 
z: .word 200000 
y: .word 0   # esse valor deverá ser sobrescrito após a execução do programa.