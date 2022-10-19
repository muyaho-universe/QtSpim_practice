.data
    message: .asciiz "Sum of multiples of 3 is "

.text 
main:
    #initialization
 #   addi $s0, $zero, 12
    addi $t0, $zero, 0  #t0 is the sum of multiple of 3
    addi $t1, $zero, 3  #$t1 is 3
    addi $t2, $zero, 1  #$t2 is 1
    addi $t3, $s0, 1    #$t3 = $s1 + 1
    
    #loop start
loop:
    div $t2, $t1    
    mfhi $t4            #take the remainder
    bne $t4, $zero, more   #check $t4 
    add $t0, $t0, $t2   #sum += i;
more:                   #$t2 is not the multiple of 3
    addi $t2, $t2, 1    #i++
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

    jr $ra
.end