# // Programa 18
# Para a expressão a seguir, escreva um programa que calcule o valor de k:   
# k = x^y 
# Obs: Você poderá utilizar o exercício anterior. 
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá lido da 
# segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na terceira posição 
# livre da memória. 
# Dê um valor para x e y (dê valores pequenos !!) e use o MARS para verificar a quantidade de 
# instruções conforme o tipo (ULA, Desvios, Mem ou Outras)

# {
#	x = MEM[0];
#	y = MEM[1];
#	k = pow(x, y);
#	MEM[2] = k;
# }

# Associações
# x = $s0
# y = $s1
# k = $s2

.text
.globl main

main:
    lui $t0, 0x1001       # Carrega o endereço base da memória (0x1001 0000) no registrador $t0
    lw $s0, 0x0000($t0)   # Carrega o valor de x da memória (MEM[0]) para o registrador $s0
    lw $s1, 0x0004($t0)   # Carrega o valor de y da memória (MEM[1]) para o registrador $s1
    addi $s2, $zero, 1    # Inicializa k com 1 (k = 1)
    addi $t1, $zero, 0    # Inicializa o contador (contadorY) com 0

    slt $t3, $s1, $zero   # t3 = (y < 0)
    bne $t3, $zero, nega   # Se y < 0, vá para neg
    beq $s1, $zero, zero  # Se y == 0, vá para zero

loop:
    beq $t1, $s1, store   # Se contadorY == y, vá para store
    mul $s2, $s2, $s0     # k = k * x
    addi $t1, $t1, 1      # contadorY = contadorY + 1
    j loop                # Volta para o início do loop

zero:
    addi $s2, $zero, 1    # k = 1
    j store

nega:
    addi $s2, $zero, -1   # k = -1
    j store

store:
    sw $s2, 0x0008($t0)   # Armazena o valor de k na memória (MEM[2])
    j end

end:
    nop                  # No-operation (final do programa)

.data
x: .word 2
y: .word 5
k: .word -1

