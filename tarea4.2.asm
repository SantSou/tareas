main:
	add  $s0,$zero,$zero	#selector
	addi $s1,$zero,5	#a
	addi $s2,$zero,3	#b
	add  $s3,$zero,$zero	#c
	#así benían las variables en las instrucciones
	addi $t9,$zero,1	#"switch, case"
	bne $t9,$s0,suma
	addi $t9,$zero,2
	bne $t9,$s0,resta
	addi $t9,$zero,3
	bne $t9,$s0,multiply	#el "default" es que simplemente siga y haga el AND
#-----------------------------------------------------------------------
andBitwise:
	and $s3,$s1,$s2
j exit
#-----------------------------------------------------------------------
suma:
	add $s3,$s1,$s2
j exit
#-----------------------------------------------------------------------
resta:
	not $t0,$s2
	addi $t0,$t0,1
	add $s3,$s1,$t0
j exit
#-----------------------------------------------------------------------
multiply:
	add $s0,$zero,$zero
	add $t0,$zero,$zero
	mloop:
		add $s3,$s3,$s2			#guardar resultado en s3
		addi $t0,$t0,1			#i++
		bne $t0,$s1,mloop 		#i!=# go to branch "mloop"
#-----------------------------------------------------------------------
exit:	#fin del programa