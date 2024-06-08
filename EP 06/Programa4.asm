# // programa 4 { 
#	x = 3; 
#	y = 4 ; 
#	z = ( 15*x + 67*y)*4
# }

#Associações
# x = $s0
# y = $s1
# z = $s2

.text
.globl main

main:
	ori $s0, $zero, 3 # x = 3
	ori $s1, $zero, 0x0004 # y = 4
	sll $t0, $s0, 4 # 2^4 = 16, ou seja, t0 = 16x
	sub $t0, $t0, $s0 # t0 = 16x - x = 15x
	sll $t1, $s1, 6 # 2^4 = 64, ou seja, t1 = 64y
	add $t1, $t1, $s1 # t1 = 64y + y = 65y
	add $t1, $t1, $s1 # t1 = 65y + y = 66y
	add $t1, $t1, $s1 # t1 = 65y + y = 67y
	add $t3, $t0, $t1 # t3 = 15x + 67y
	sll $s2, $t3, 0x0002 # 2^2 = 4, ou seja, z = 4*(15x + 67y)
	
