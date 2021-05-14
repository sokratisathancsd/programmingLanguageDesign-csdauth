.data
Vector: .space 24
linefeed: .asciiz "\n"
string1: .asciiz "Please input 6 integers:\n"
string2: .asciiz "You entered these integers:\n"
string3: .asciiz "sum="

.text

main:

## Read 6 integers in memory (Vector)
##
##
# prompt for integers
li $v0,4 		# code for print_string
la $a0,string1 	# point $a0 to prompt string
syscall 		# print the prompt


## ************************************************
#  Διάβασμα των στοιχείων του πινακα
## ************************************************
la $t0,Vector 	# Load base address
li $t1,1 		# Counter
li $t2,6 		# Size of array

# read 6 integers
read_num: 
bgt $t1,$t2,endloop1

li $v0,5  		# code for read_int
syscall 		#get int from user --> returned in $v0

sw $v0,($t0) 	#put integer in the array
addi $t1,$t1,1	# αυξάνω τον μετρητή 
addi $t0,$t0,4	# επόμενη διεύθυνση του πίνακα
j read_num
endloop1:
## ************************************************


## Print the integers from memory (Vector)
## find the sum of all integer in $t5 
##

# prompt for integers
li $v0,4 		# code for print_string
la $a0,string2 	# point $a0 to prompt string
syscall 		# print the prompt

la $t0,Vector 	# Load base address
li $t1,1 		# Counter
li $t2,6 		# Size of array
li $t5,0		# μεταβλητή για το άθροισμα του πίνακα 

for:
bgt $t1,$t2,end
lw $t4,($t0)    # $t4=Vector($t0)
add $t5,$t5,$t4 # $t5 = $t5 + $t4 = $t5 + Vector($t0)

li $v0,1 		# code for print_int
move $a0,$t4 	# put result in $a0
syscall 		# print out the result

# print out a line feed
li $v0,4 		# code for print_string
la $a0,linefeed # point $a0 to linefeed string
syscall 		# print linefeed
addi $t1,$t1,1
addi $t0,$t0,4
j for

end:

# prompt sum
li $v0,4 # code for print_string
la $a0,string3 # point $a0 to prompt string
syscall # print the prompt

li $v0,1 # code for print_int
move $a0,$t5 # put result in $a0
syscall # print out the result
# print out a line feed
li $v0,4 # code for print_string
la $a0,linefeed # point $a0 to linefeed string
syscall # print linefeed



# All done, thank you!
li $v0,10 # code for exit
syscall # exit program
