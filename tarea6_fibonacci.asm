.data

.text
main:
	addi $s0,$zero,10		#n lugar a calcular de serie
	addi $a0,$zero,1		#inicializar contador n-1
	add $a1,$zero,$zero		#inicializar contador n-2
	addi $a2,$zero,1		#variable solo para guardar un 1 para comparar
	addi $t0,$zero,1		#inicializar valor de contador lugar n
	jal fibonacci
j exit
	
fibonacci:
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	#respaldo de memoria
	beqz $s0,nzero		#si n=0
	beq $a2,$s0,nOne	#si n=1
	bne $s0,$t0,general 	#si no es n, va a loop
	j returnFib
	nzero:
		add $v0,$zero,$zero   	#caso para n=0
	nOne:	
		add $v0,$zero,$a0	#caso para n=1
	general:
		add $v0,$a0,$a1		#guarda resultado en v0
		add $a1,$a0,$zero	#guarda el nuevo valor en n-1
		add $a0,$v0,$zero	#guarda ultimo valor en n-2
		addi $t0,$t0,1		#n++
		jal fibonacci
	returnFib:	
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	addi $sp,$sp,12
	#regresar memoria a estado anterior
	jr $ra

exit:	#terminar programa
