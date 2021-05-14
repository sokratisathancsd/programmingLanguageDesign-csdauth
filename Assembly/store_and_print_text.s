.data
# string constants
prompt1: .asciiz "Input String: "
prompt2: .asciiz "Output String: "
# save space for 255 character input, plus the null character
text: .space 256

.text
li $v0, 4 	# print the intro
li $a1, 256 	# size of input buffer
# infinite parrot loop
loop: 
la $a0, prompt1 # print prompt
syscall
li $v0, 8 	# read text to parrot
la $a0, text 	# address to store read text
syscall

li $v0, 4 	# print parrot lead
la $a0, prompt2
syscall
la $a0, text 	# print parroted text
syscall
j loop 		# repeat