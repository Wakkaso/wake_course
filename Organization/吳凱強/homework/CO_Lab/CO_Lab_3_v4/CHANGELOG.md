# Lab3 CHANGELOG

## v4
### J-type Instruction Set
- Change jal pseudo code `r31($ra) = pc + 8` to `r31($ra) = pc + 4`

## v3
### _CO_Lab3_test_data_bubble_sort.txt
- Change answer from ascending to descending
- Line 25: `slt $at, $t0, $0`, missing dollar sign in previous version
### Test_Bench.v
- Line 2: ``define END_COUNT 600`, change simulation time count from 500 to 600

## v2
### _CO_Lab3_test_data_bubble_sort.txt
- Add answer

## v1
### I-type Instruction Set
- Change load word(lw) opcode from 100010 to 100011

## v0
Initial release
