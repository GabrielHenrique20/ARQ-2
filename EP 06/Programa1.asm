# //programa 1 (add, addi, sub, lógicas) { 
#	a = 2; 
#	b = 3; 
#	c = 4; 
#	d = 5; 
#	x = (a+b) - (c+d); 
#	y = a – b + x; 
#	b = x – y; 
# }

#Associações
# a = $s0
# b = $s1
# c = $s2
# d = $s3

# x = $s4
# y = $s5

.text
.globl main
main:
addi $s0, $zero, 2 # a = 2
addi $s1, $zero, 3 # b = 3
addi $s2, $zero, 4 # c = 4
addi $s3, $zero, 5 # d = 5

add $s4, $s0, $s1 # x = a + b
sub $s4, $s4, $s2 # x = x - c
sub $s4, $s4, $s3 # x = x - d

sub $t5, $s0, $s1 # y ($t5) = a - b
add $s5, $t5, $s4 # y = y + x

sub $s1, $s4, $s5 # b = x - y


