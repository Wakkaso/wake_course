# This example shows an implementation of the mathematical
# fibonacci function.

.data
argument: .word 10 # 
str: .string "th number in the Fibonacci sequence is "


.text
main:
        lw       a0, argument   # Load argument from static data
        addi     a1, zero, 0
        jal      ra, fibo       # Jump-and-link to the 'fibo' label

        # Print the result to console
        
        lw       a0, argument
        jal      ra, printResult

        # Exit program
        li       a0, 10
        ecall

fibo:
        addi     sp, sp, -24
        sw       ra, 16(sp)
        sw       a0, 0(sp)
        sw       a1, 8(sp)
#if 		
        addi     t0, a0, -2
        bge      t0, zero, nfibo
#if       
        addi     t0, a0, -1
        bge      t0, zero, fibo_1

#else
        addi     a1, zero, 0
        sw       a1, 8(sp)
        addi     sp, sp, 24
        jalr     x0, x1, 0

fibo_1:
        addi     a1, zero, 1
        sw       a1, 8(sp)
        addi     sp, sp, 24
        jalr     x0, x1, 0


nfibo:
        addi     a0, a0, -1
		# fibo(a0-1)
        jal      ra, fibo
        sw       a1, 8(sp)


        lw       a0, 0(sp)
        lw       ra, 16(sp)
        
        addi     sp, sp, -24
        addi     a0, a0, -2
		
		# fibo(a0-2)
        jal      ra, fibo
        addi     sp, sp, 24
        addi     t0, a1, 0
        

        lw       a0, 0(sp)
        lw       a1, 8(sp)
        lw       ra, 16(sp)
        
        add      a1, a1, t0
        sw       a1, 8(sp)
        addi     sp, sp, 24
        ret


# expects:
# a0: Value which fibonacci number was computed from
# a1: Fibonacci result
printResult:
        mv       t0, a0
        mv       t1, a1

        mv       a1, t0
        li       a0, 1
        ecall

        la       a1, str
        li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        ecall

        ret