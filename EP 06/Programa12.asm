# // programa 12 
# Considere a seguinte situação: 
# int ***x; 
# onde x contem um ponteiro para um ponteiro para um ponteiro para um inteiro. 
# Nessa situação, considere que a posição inicial de memória contenha o inteiro em questão.  
# Coloque todos os outros valores em registradores, use os endereços de memória que quiser dentro 
# do espaço de endereçamento do Mips. 
# Resumo do problema: 
# k = MEM [ MEM [MEM [ x ] ] ].   
# Crie um programa que implemente a estrutura de dados acima, leia o valor de K, o multiplique por 
# 2 e o reescreva no local correto conhecendo-se apenas o valor de x.

# {
#	int ***x;
#	k = MEM [ MEM [MEM [ x ] ] ];
#	k = 2*k
#	MEM [ MEM [MEM [ x ] ] ] = k
# }

# Associações
# x = $s0
# k = $s1

.text
.globl main

main:
	lui $s0, 0x1001 # x = 0x1001 0000
	lw $t0, 0x0000($s0) # t0 = MEM[x]
	lw $t1, 0x0000($t0) # t1 = MEM[MEM[x]]
	lw $s1, 0x0000($t1) # k = MEM [ MEM [MEM [ x ] ] ]
	sll $s1, $s1, 1 # k = 2 * k (2^1 = 2)
	sw $s1, 0x0000($t1) # MEM [ MEM [MEM [ x ] ] ] = k, sendo k = 2*k

.data
x: .word 0x10010004
pont_x: .word 0x10010008
pont_pont_x: .word 20