main:
	addi $a0,$zero,2	#el numero a elevar, 2
	addi $a1,$zero,3	#la potencia a elevar
	addi $v0,$zero,0	#resultado
	
	add $t0,$zero,$zero
	addi $t1,$zero,0
	beq $a1,$zero,zeroPOW	#valida caso potencia 0
	addi $v0,$zero,1
	loop:			#multiplica x2 n veces (n=potencia)
		jal m2x
		addi $t1,$t1,1	#contador
		bne $t1,$a1,loop
j exit
#-----------------------------------------------------------------------
m2x:
	add $v0,$v0,$v0	#sumar a si mismo = X2
jr $ra
#-----------------------------------------------------------------------
zeroPOW:		#caso particular para potencia 0
	addi $v0,$zero,1
	
exit:	#fin del programa