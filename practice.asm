main:
    addi $t0, $s6, 4
    addi $t1, $s6, 0
    sw $t1, 0($t0)
    lw $t0, 0($t0)
    add $s0, $t1, $t0
    jr $ra
.exit