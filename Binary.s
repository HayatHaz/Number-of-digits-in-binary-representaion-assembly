.data
  #variable declration
  Enter: .asciiz "Enter Positive Number: "
  space: .asciiz "\n"
  Result: .asciiz "Number of digits in the binary representaion: "

.text

main:

li $s0, 1 #counter

la $a0, Enter #displying 1st msg
li $v0, 4
syscall

li $v0, 5 #take the number from user
syscall
move $s1, $v0

move $a0, $s1 #disply the taken number
li $v0,1
syscall

li $s2, 1 #used later to compare if the number given > 1

li $s4, 2 #used later to divide by 2 on each iteration

loop:

slt $s3, $s2, $s1 #check if $s3 > 1
beq $s3, $0, end #if false, go to end

addi $s0, $s0, 1 #if true, add on bit to as the representation of the number

div $s1, $s4 #divide the number by 2 as algrothim works by divide-and-conquer
mflo $s1 #save the int part of the division

j loop


end:

la $a0, space #print separated line
li $v0, 4
syscall

la $a0, Result #print the result msg
li $v0, 4
syscall

move $a0, $s0 #disply the result
li $v0,1
syscall

li $v0, 10 #end of program
syscall







