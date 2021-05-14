.data
linefeed: .asciiz "\n"

.text
li $t8, 1
for:
bge $t8, 13, end_for

# print out the result
li $v0,1 # code for print_int
move $a0,$t8 # put result in $a0
syscall # print out the result
# print out a line feed
li $v0,4 # code for print_string
la $a0,linefeed # point $a0 to linefeed string
syscall # print linefeed

addi $t8, $t8, 1
j for
end_for:

# All done, thank you!
li $v0,10 # code for exit
syscall # exit program
