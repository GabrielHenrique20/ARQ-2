# // programa 7 
# Considere a seguinte instrução iniciando um programa: 
# ori $8, $0, 0x01

# Usando apenas instruções reg-reg lógicas e/ou instruções de deslocamento (sll, srl e 
# sra), continuar o programa de forma que ao final, tenhamos o seguinte conteúdo no 
# registrador $8: 
# $8 = 0xFFFFFFFF

.text
.globl main


main:
	ori $8, $0, 0x0001  # s8 = 0x0000 0001
# 0000 0000 0000 0000 0000 0000 0000 0001
# 0000 0000 0000 0000 0000 0000 0000 0001 << 31 = 1000 0000 0000 0000 0000 0000 0000 0000 (esse numero em binario é 0x8000 0000 em hexadecimal
	sll $8, $8, 0x001F # s8 = 0x1000 0000
	sra $8, $8, 0x001F # s8 = 0xFFFF FFFF
