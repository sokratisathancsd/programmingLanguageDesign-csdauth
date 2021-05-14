.text 
li $v0,4 		# code for print_string
la $a0,minima1 	# point $a0 to prompt string
syscall 		# print the prompt

# get an integer from the user
li $v0,5 		# code for read_int
syscall 		#get int from user --> returned in $v0
move $t0,$v0 	# move the resulting int to $t0

li $v0,4 		# code for print_string
la $a0,minima2 	# point $a0 to prompt string
syscall 		# print the prompt

# get an integer from the user
li $v0,5 		# code for read_int
syscall 		#get int from user --> returned in $v0
move $t1,$v0 	# move the resulting int to $t0

bne $t0, $t1, else # if $t0!=$t1 goto else 

then: 
li $v0,4 		# code for print_string
la $a0,minima3	# point $a0 to prompt string
syscall 		# print the prompt
j end1

else: # else code (label)
li $v0,4 		# code for print_string
la $a0,minima4	# point $a0 to prompt string
syscall 		# print the prompt

end1: 
# All done, thank you!
li $v0,10 # code for exit
syscall # exit program

.data
minima1: .asciiz "a="
minima2: .asciiz "b="
minima3: .asciiz "Einai isoi oi arithmoi"
minima4: .asciiz "Den einai isoi"

