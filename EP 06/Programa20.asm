# // programa 20 
#	{
#	|y = x4 + x3 -2x2           
#	|se x for par
#	|
#	|x5 – x3  + 1          
#	|se x for impar 
#	{
# Os valores de x devem ser lidos da primeira posição livre da memória e o valor de y deverá ser 
# escrito na segunda posição livre. 

.text
.globl main

main:
	lui $t0, 0x1001     # endereço 0x1001 é onde começa a memoria no mars 0x1001 0000
	lw $s0, 0 ($t0)     # x = MEM[0]

	andi $t1, $s0, 1    # verifica se eh par ou impar (se $t1 = 1, impar; se $t1 = 0, par)
	beq $t1, $zero, par # se for par vai para o label par, caso impar, seguir as proximas linhas

impar:
	mult $s0, $s0 # x^2
	mflo $t2      
	mult $t2, $s0 
	mflo $t2      # x^3
	mult $t2, $s0 # x^4
	mflo $t3      
	mult $t3, $s0 
	mflo $t3      # x^5

	ori $t4, $zero, 1 # t4 = 1 PARA ADICIONAR
	sub $t3, $t3, $t2  # t3 = x^5 – x^3
	add $t5, $t3, $t4  # t5 = x^5 – x^3  + 1
		
	j fim
	
par:
	mult $s0, $s0 
	mflo $t2      #x^2
	mult $t2, $s0 
	mflo $t3      #x^3
	mult $t3, $s0 
	mflo $t4      #x^4
	
	
	ori $t5, $zero, 2   # t5 = 2
	mult $t2, $t5       # t2 = 2x^2
	mflo $t2
	add $t4, $t4, $t3   # t4 = x^4 + x^3
	sub $t5, $t4, $t3   # t5 = x^4 + x^3 - 2x^2
	
fim:
	sw $t5, 4 ($t0)     # guardando o resultado na memoria (MEM[] = RESULTADO)
	
.data
x: .word 3
