.data
argument: .word 10 # Number to find the factorial value of
str1: .string "th number in the Fibonacci sequence is "

.text
main:
        lw       a0, argument        # Load argument from static data
        jal      ra, fibonacci       # Jump-and-link to the 'fact' label

        # Print the result to console
        mv       a5, a0
        lw       a5, argument
        jal      ra, printResult

        # Exit program
        li       a0, 10
        ecall
		
		
printResult:
		mv		 t0, a5
		mv 		 t1, a0
		
		
		mv 		 a1, t0
		li       a0, 1
		ecall

		la	     a1,str1
		li       a0, 4
		ecall		
		
		mv 		 a1, t1
		li       a0, 1
		ecall
		
		ret
		
fibonacci:
        addi     sp, sp, -16
        sw       ra, 8(sp)
        sw       a0, 0(sp)
        addi     t0, a0, -2
        bge      t0, zero, nfibonacci
        addi     t1, a0, -1
        bge      t1, zero, nfibonacci
        addi     a0, zero, 1
        addi     sp, sp, 16
        jalr     x0, x1, 0


nfibonacci:
        addi     a0, a0, -1

        addi     t1, a0, 0
        lw       a0, 0(sp)
        lw       ra, 8(sp)
        addi     sp, sp, 16
        add     a0, a0, t1
        ret
