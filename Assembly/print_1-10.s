.text
li $t1,1
li $t2,10

L1: 
	bgt $t1,$t2, EXIT
	# εκτύοωση του αριθμού που υπάρχει στο $τ1
	li $v0,1 		
	move $a0,$t1		
	syscall 
	
	# εκτυπώνεται η αλλαγή γραμμής
	li $v0,4 		
	la $a0,space		
	syscall 
	
	# $t1=$t1+1
	addi $t1,$t1,1
	
	# goto L1
	j L1
EXIT:
# All done, thank you!
li $v0,10 # code for exit
syscall # exit program


.data
space: .asciiz "\n"
