# // programa 14: 
# Escreva um programa  que leia um valor A da memória, identifique se  o  número  é  par  ou  não.  
# Um valor deverá ser escrito na segunda posição livre da memória (0 para par e 1 para ímpar). 

# int a = MEM[0]
# if (a % 2 == 0) { MEM[1] = 0}
# else { MEM[1] = 1}

# Associações
# a = $s0

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0x0000($t0) # a = MEM[0]
	andi $t1, $s0, 0x0001 # um and entre o numero colocado e 0x0000 0001, se for par 0, se for impar 1
	beq $t1, $zero, par # if (a % 2 == 0) {par}
	sw $t1, 0x0004($t0) # else{ MEM[0] = 1
	j fim
	
par:
	sw $s0, 0x0004($t0) # MEM[0] = 0
fim:

.data
a: .word 32