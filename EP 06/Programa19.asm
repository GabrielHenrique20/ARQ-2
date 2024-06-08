# // programa 19 
# Escrever um programa que leia dois números da memória, a primeira e segunda posições 
# respectivamente (os coloque em $s0 e $s1) e determine a quantidade de bits significantes de cada 
# um. Coloque as respostas em $t0 e $t1, a partir desse resultado faça a multiplicação. Caso o número 
# de bits significantes de ambos seja menor do que 32 a resposta deverá estar apenas em $s2, caso 
# contrário a resposta estará em $s2 e $s3 (LO e HI respectivamente). 
# Para os exercícios a seguir, considere as variáveis com números abaixo de 16 bits, salvo se 
# mencionado ao contrário. 

# Associações
# x = $s0
# y = $s1

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0 ($t0) # x = MEM[0]
	lw $s1, 4 ($t0) # y = MEM[1]

	ori $t0, $zero, 0  # contador X
	ori $t1, $zero, 0  # contador Y
	or $t2, $zero, $s0 # copia de s2
	or $t3, $zero, $s1 # copia de s1

contaBitsX:
	beq $t2, $zero, contaBitsY  # verifica se o numero eh igual a 0 (nao ha mais bits significativos)
	addi $t0, $t0, 1            # add 1 no contador de bits
	srl $t2, $t2, 1             # desloca bits para direita
	j contaBitsX
	
contaBitsY:
	beq $t3, $zero, multiplicacao # verifica se o numero eh igual a 0 (nao ha mais bits significativos)
	addi $t1, $t1, 1              # add 1 no contador de bits
	srl $t3, $t3, 1               # desloca bits para direita
	j contaBitsY
	
multiplicacao:
	slti $t0, $t0, 32                # verifica se a qtd de bits do primeiro numero eh menor que 32
	beq $t0, $zero, multiplicacaoHL  # se for maior (ou igual) ja vai pro tipo de multiplicacao que salva em HI e LO
	slti $t1, $t1, 32                # verifica se a qtd de bits do segundo numero eh menor que 32
	beq $t1, $zero, multiplicacaoHL  # se for maior (ou igual) vai pro tipo de multiplicacao que salva em HI e LO
	
	mult $s0, $s1            # se chegou ate aqui ambos numeros sao menores que 32 bits
	mflo $s2                 # faz multiplicacao salvando apenas em LO
	j fim

multiplicacaoHL:
	mult $s0, $s1          # multiplica e depois busca do HI e LO
	mflo $s2
	mfhi $s3
	
fim:

.data
x: .word -10
y: .word 10