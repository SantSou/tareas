main:
	addi $s0,$zero,1	#"counter"
	add $s1,$zero,$zero	#"variable"
	addi $t1,$zero,4
	loop:
			jal suma
			add $t2,$zero,$s0
			div $s1,$t2,$t1	#divide counter/4 y el resultado queda en variable
		slti $t0,$s1,20		#vompara si s1<20, si no t0=0
		bne $t0,$zero,loop	#condición de loop
j exit

suma:
	add $s0,$s0,$s0	
	jr $ra

exit:	#fin del programa