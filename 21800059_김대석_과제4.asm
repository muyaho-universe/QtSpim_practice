.data
    prompt: .asciiz "Enter the number: "
    message: .asciiz "\nSum of multiples of 3 is "
    newLine: .asciiz "\n"

.text 

main:

    #prompt ask the user to enter the numbers
    li $v0, 4
    la $a0, prompt
    syscall

    #get the number
    li $v0, 5
    syscall

    #initialization
    move $s0, $v0
    addi $t0, $zero, 0
    addi $t1, $zero, 3
    addi $t2, $zero, 1
    addi $t3, $s0, 1

    #loop start
loop:
    div $t2, $t1
    mfhi $t4
    bne $t4, $zero, more
    add $t0, $t0, $t2
more:
    addi $t2, $t2, 1
    beq $t2, $t3, exit
    j loop
exit:
    #display numbers
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newLine
    syscall
    jr $ra
.end