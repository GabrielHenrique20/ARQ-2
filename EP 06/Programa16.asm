# Escreva um programa que avalie a expressão: (x*y)/z.  
# Use x = 1600000 (=0x186A00), y = 80000 (=0x13880), e z = 400000 (=0x61A80). Inicializar os 
# registradores com os valores acima.

# x = 1600000 (=0x0018 6A00)
# y = 80000 (=0x0001 3880)
# z = 400000 (=0x0006 1A80)
# conta = (x*y)/z

# Associaçõs
# x = $s0
# y = $s1
# z = $s2
# conta = $s3

.text
.globl main

main:
	lui $t0, 0x0018 # t0 = 0x0018 0000
	ori $s0, $t0, 0x6A00 # x = 0x0018 6A00 --> 1600000
	lui $t1, 0x0001 # t1 = 0x0001 0000
	ori $s1, $t1, 0x3880 # y = 0x0001 3880 --> 80000
	lui $t2, 0x0006 # t2 = 0x0006 0000
	ori $s2, $t2, 0x1A80 # z = 0x0006 1A80
	div $s0, $s2 # x/z
	mflo $t0 # t0 = x/z
	mult $s1, $t0 # y * x/z
	mflo $s3 # conta = (x*y)/z
