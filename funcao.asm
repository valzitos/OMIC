	.text
	.globl main
main:
	ori $s0, $zero, 16
	ori $s1, $zero, 32
	
	ori $a0, $zero, 1 #argumento g
	ori $a1, $zero, 2 #argumento h
	ori $a2, $zero, 3 #argumento i
	ori $a3, $zero, 4 #argumento j
	jal leaf_example
	
	or $a0, $v0, $zero
	ori $v0, $zero, 1
	syscall
	
end:
	li $v0, 10
	syscall
	
leaf_example:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	
	add $s0, $a0, $a1
	add $s1, $a2, $a3
	sub $v0, $s0, $s1
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
#vamos escrever nossa função aqui