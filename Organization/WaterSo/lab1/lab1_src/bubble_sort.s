.data
N:      .word   10

arr:   	.word 5,3,6,7,31,23,43,12,45,1
str1:   .string "Array: "
str2:   .string "Sorted: "
str3:   .string "\n"
space:  .string " "

.text
main:
        lw      t0, N				#read N to temp reg(t0->N)
		
		# print str1
        la      a1, str1			
        li      a0, 4
        ecall
		# print str3
        la      a1, str3
        li      a0, 4
        ecall
   
		# read input arr to a0
        la      a0, arr
		
		# jump to function
        jal     ra, printArray
        
		# print str3
        la      a1, str3
        li      a0, 4
        ecall
		# print str2
        la      a1, str2
        li      a0, 4
        ecall

		# read input arr to a0		
		# jump to function
        la      a0, arr
        jal     ra, bubblesort
		# jump to function
        jal     ra, printArray

        la      a1, str3
        li      a0, 4
        ecall

        li      a0, 10
        ecall
bubblesort:
        addi    sp, sp, -8 	# make room on stack for 2 registers (each: 4bytes)
        sw      ra, 4(sp) 	# save return address on stack
        sw      a0, 0(sp) 	# save a0 on stack (a0->arr)
        li      a1, 0 		# init: i = 0 (a1 -> i)
        j       sort_for1	# jump to for-loop
sort_for1:	# set forloop init, step, and exit.
        bge     a1, t0, exit1 	# go to exit1 if i >= n
        addi    a2, a1, -1 		# j = i - 1
        j       sort_for2		# jump to for-loop
sort_for2:	# set second for-loop (a2->j)
        blt     a2, zero, exit2 # go to exit2 if j < 0
		
		# shift to next array element: 
        slli    t1, a2, 2  		# t1 = j * 4
        add     t1, a0, t1  	# t1 = arr + t1
		# t1 is our new arr[]
		# always compare to arr[j] and arr[j+1]
        lw      t2, 0(t1)  		# t2 = arr[j+0]
        lw      t3, 4(t1)  		# t3 = arr[j+1]
        ble     t2, t3, exit2   # go to exit2 if t2 < t3
       
		mv      t1, a2  		# second swap parameter is j
        jal     ra, swap  		# call swap
        
		addi    a2, a2, -1		# step
        j       sort_for2  		# go to for2tst
exit2: 
        addi    a1, a1, 1 # i += 1
        j       sort_for1 # go to for1tst
exit1: 

        lw      a0, 0(sp)  # load a0 from stack
        lw      ra, 4(sp)  # load return address from stack
        addi    sp, sp, 8  # load stack pointer
        ret

swap:
        # t1 is j
        slli    t2, t1, 2	# t2 = j*4
        add     t2, t2, a0	# t2 = t2 + arr
		# t2 is our new arr
        
		lw      a4, 0(t2)	# load arr[j]
        lw      a3, 4(t2)	# load arr[j+1]
		
        sw      a3, 0(t2)	# store arr[j]
        sw      a4, 4(t2)	# store arr[j+1]	
        ret


        
printArray:
        addi    sp, sp, -8	
        sw      ra, 4(sp)
        sw      a0, 0(sp)
        li      a1, 0		# init: i=0
        j       print_for	

print_for:
        bge     a1, t0, exit1	# exit if i>=N
        slli    t1, a1, 2		# t1 = i*4
        add     t1, a0, t1		# t1 = t1 + arr
        lw      t2, 0(t1)		# load arr[i]
        mv      t0, a0			# t0 = arr
        mv      t1, a1			# t1 = i*4

        mv      a1, t2			# a1 = arr[i]
        li      a0, 1			# type: INT
        ecall
        
        la      a1, space		
        li      a0, 4			# type: STRING
        ecall

        mv      a0, t0			# a0 = arr
        mv      a1, t1			# a1 = 4*i
        lw      t0, N			# load N to t0
        addi    a1, a1, 1		# i++
        j       print_for