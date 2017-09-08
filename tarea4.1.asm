.data

vector1: .word 1 2 3
vector2: .word 6 7 8

.text

main:
	add $a0,$zero,$zero	#inicializar la variable para resultado
	addi $a1,$zero,3	#inicializar la variable de límite ("K-1")
	add $t0,$zero,$zero	#inicializar la variable de contador
	#vectores
	la $t1,vector1		#cargar direccion memoria vectores
	la $t2,vector2
	add $v0,$zero,$zero
	loop:
		lw $t3, 0($t1)
		lw $t4, 0($t2)
		add $a2, $zero,$t3		#carga valores de los vectores
		add $a3, $zero,$t4
		jal multAndAccumulate		#mandar llamar funcion
		addi $t1,$t1,4			#incrementar el apuntador para avanzar en vector
		addi $t2,$t2,4
		addi $t0,$t0,1			#i++
		bne $t0,$a1,loop 		#i!=3 go to branch "loop"
j exit				#termina el programa

multAndAccumulate:
	addi $sp, $sp, -16	#recorrer stack pointer
	sw $t0, 0($sp)		#respaldar variables
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	#------------------------
		add $t0,$zero,$a2
		add $t1,$zero,$a3
		jal multiply
		add $t0,$zero,$s0
		add $t1,$zero,$v0
		jal acumulate
	#------------------------
	lw $t0, 0($sp)		#respaldar variables
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, +16	#recorrer stack pointer
jr $ra			#regresar a llamada

acumulate:
	add $v0,$t0,$t1		#guardar resultado de suma en s0
jr $ra
#-----------------------------------------------------------------------------	
multiply:
	addi $sp, $sp, -8	#recorrer stack pointer
	sw $s0, 0($sp)		#respaldar variables
	sw $t2, 4($sp)
	add $s0,$zero,$zero
	add $t2,$zero,$zero
	mloop:
		add $s0,$s0,$t0			#guardar resultado en s0
		addi $t2,$t2,1			#i++
		bne $t2,$t1,mloop 		#i!=# go to branch "mloop"
	lw $t0, 0($sp)
	lw $t2, 4($sp)
	addi $sp, $sp, +8	#recorrer stack pointer
jr $ra
#-----------------------------------------------------------------------------	
exit:				#fin del programa
