.data
minima1: .asciiz "Dwse enan Integer"
minima2: .asciiz "O epomenos tou einai: "
newline: .asciiz "\n"
pataenter: .asciiz "Pata enter... "

.text
li $v0,4
la $a0,minima1
syscall