# Para os programas a seguir use instruções de desvio (beq, bne, j)

#{
# int a = MEM[0]
# if (a < 0) { a = -a} # |a| inverte o valor de a
#MEM[0] = a

# Associações
# a = $s0

.text
.globl main

main:
	lui $t0, 0x1001 # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0x0000($t0) # a = MEM[0]
	srl $t1, $s0, 0x001F # metodo para identificar se o numero é postivo  ou nao, vai ficar 1 negativo e 0 se positivo e usar em beq
	beq $t1, $zero, fim # if(a > 0) o programa acaba
	sub $s0, $zero, $s0 #else{ a = |a|, ou seja, vai inverter o sinal dele
	sw $s0, 0($t0) # MEM[0] =
	j fim

fim:

.data
a: .word -5
