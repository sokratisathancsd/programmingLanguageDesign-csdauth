.data
promptInt1: .asciiz "a= "
promptInt2: .asciiz "b= "
resultInt: .asciiz "a+b= "

.text
main:

li $v0,4 
la $a0,promptInt1 
syscall 
li $v0,5
syscall
move $t0,$v0 

li $v0,4 
la $a0,promptInt2 
syscall
li $v0,5 
syscall 
move $t1,$v0 


add $t2, $t0, $t1 # t0 <-- t0 + t1
# print out text for the result
li $v0,4 
la $a0,resultInt 
syscall 
li $v0,1 
move $a0,$t2
syscall 

# All done, thank you!
li $v0,10 # code for exit
syscall # exit program
