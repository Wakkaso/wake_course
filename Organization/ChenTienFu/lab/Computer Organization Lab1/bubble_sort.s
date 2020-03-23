data:
        .word   5
        .word   3
        .word   6
        .word   7
        .word   31
        .word   23
        .word   43
        .word   12
        .word   45
        .word   1
.LC0:
        .string "Array: "
.LC1:
        .string "Sorted: "
main:
        lui     a5,%hi(.LC0)
        addi    a0,a5,%lo(.LC0)
        call    puts
        call    printArray
        li      a1,10
        lui     a5,%hi(data)
        addi    a0,a5,%lo(data)
        call    bubblesort
        lui     a5,%hi(.LC1)
        addi    a0,a5,%lo(.LC1)
        call    puts
        call    printArray
        li      a5,0
        mv      a0,a5
        jr      ra
		ecall
bubblesort:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sw      zero,-20(s0)
        j       .L4
.L8:
        lw      a5,-20(s0)
        addiw   a5,a5,-1
        sw      a5,-24(s0)
        j       .L5
.L7:
        lw      a5,-24(s0)
        mv      a1,a5
        lui     a5,%hi(data)
        addi    a0,a5,%lo(data)
        call    swap
        lw      a5,-24(s0)
        addiw   a5,a5,-1
        sw      a5,-24(s0)
.L5:
        lw      a5,-24(s0)
        sext.w  a5,a5
        bltz    a5,.L6
        lui     a5,%hi(data)
        lw      a4,-24(s0)
        slli    a4,a4,2
        addi    a5,a5,%lo(data)
        add     a5,a4,a5
        lw      a3,0(a5)
        lw      a5,-24(s0)
        addiw   a5,a5,1
        sext.w  a4,a5
        lui     a5,%hi(data)
        slli    a4,a4,2
        addi    a5,a5,%lo(data)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a4,a3
        bgt     a4,a5,.L7
.L6:
        lw      a5,-20(s0)
        addiw   a5,a5,1
        sw      a5,-20(s0)
.L4:
        lw      a5,-20(s0)
        sext.w  a4,a5
        li      a5,9
        ble     a4,a5,.L8
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
swap:
        addi    sp,sp,-48
        sd      s0,40(sp)
        addi    s0,sp,48
        sd      a0,-40(s0)
        mv      a5,a1
        sw      a5,-44(s0)
        lw      a5,-44(s0)
        slli    a5,a5,2
        ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-20(s0)
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        ld      a4,-40(s0)
        add     a4,a4,a5
        lw      a5,-44(s0)
        slli    a5,a5,2
        ld      a3,-40(s0)
        add     a5,a3,a5
        lw      a4,0(a4)
        sw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a4,-20(s0)
        sw      a4,0(a5)
        nop
        ld      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC2:
        .string "%d "
printArray:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sw      zero,-20(s0)
        j       .L11
.L12:
        lui     a5,%hi(data)
        lw      a4,-20(s0)
        slli    a4,a4,2
        addi    a5,a5,%lo(data)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a1,a5
        lui     a5,%hi(.LC2)
        addi    a0,a5,%lo(.LC2)
        call    printf
        lw      a5,-20(s0)
        addiw   a5,a5,1
        sw      a5,-20(s0)
.L11:
        lw      a5,-20(s0)
        sext.w  a4,a5
        li      a5,9
        ble     a4,a5,.L12
        li      a0,10
        call    putchar
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra