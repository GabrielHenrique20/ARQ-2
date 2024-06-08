# Escrever  um  programa  que  crie  um  vetor  de  100  elementos  na memória onde vetor[i] = 2*i + 1.
# Após a  última  posição  do  vetor criado,  escrever  a  soma  de  todos  os  valores armazenados do vetor. 
# Use o MARS para verificar a quantidade de instruções conforme o tipo (ULA, Desvios, Mem ou Outras) 
# {
#	int v[100]
#	int soma = 0;
#	int i = 0
#	for(i = 0; i < 100; i++){
#		vetor[i] = 2*i + 1 // MEM[i] = 2*i + 1
#		soma += 2*i + 1
#		}
#	MEM[100] = soma
# }

# Associações
# V[0] = $s0
# soma = $s1
# i = $s2

# 100 em hexadecimal = 0x64
.text
.globl main

main:
	lui $s0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000, colocando o vetor na sua primeira posicao
	# addi $s1, $0, $0 # soma = 0
	# addi $s2, $zero, $zero # i = 0
	or $s1, $zero, $zero # soma = 0
	or $s2, $zero, $zero # i = 0
	ori $t3, $zero, 0x0064 #t3 = 100

loop:
	sll $t1, $s2, 1 # t1 = i * 2, sendo esse 2 2^1 = 2
	addi $t1, $t1, 1 # t1 = 2*i + 1
	sll $t2, $s2, 2 # t2 = 4*i
	add $t2, $s0, $t2 # t2 = v[i] // temos que multiplicar por quatro para colocar, por exemplo, dentro do vetor
	sw $t1, 0x0000($t2) # MEM[i] = 2*i + 1, ou seja, t2 que valei 4i vai para memoria, MEM[i]
	add $s1, $s1, $t1 # soma = soma + 2*i + 1
	addi $s2, $s2, 1 # i++
	bne $s2, $t3, loop # if (i < 100) goto loop, ou seja, enquanto o i for diferente de 100, ele vai continuar executando o codigo
	sw $s1, 0x0004($t2)# MEM[100] = soma
	
#fim do loop
	
	
	