
# MUY IMPORTANTE: 
# * en QtSPIM y similar **NO** escribir tildes en los comentarios ni ASCIIs porque da error de compilacion

#En este código programaremos una subrutina que recibe 5 parametros que debe pasar a una función, la cuál iterará en un vector
#En cada posicion del vector realizara la suma V[i] = v[i-1] + $ai, y despues se devolvera el vector final por pantalla

.data
	vector: .space 20
	menu: .asciiz "Introduce 5 números por favor\n"
	space: .asciiz " "

.text
.globl main
  main:
  	
	#Como sabemos que vamos a llamar a una funcion y que vamos a hacer uso de la pila, guardamos $ra y $fp
	subu $sp $sp 8
	sw $ra 4($sp)
	sw $fp ($sp)
	move $fp $sp  # que $fp apunte a donde está $sp 

	la $a0 menu
	li $v0 4
	syscall

	#Ahora guardaremos los numeros en los registros $an, puesto que por convenio son los utilizados para parametros

    # leer n'umero
	li $v0 5
	syscall
	move $a0 $v0

    # leer n'umero
	li $v0 5
	syscall
	move $a1 $v0

    # leer n'umero
	li $v0 5
	syscall
	move $a2 $v0

    # leer n'umero
	li $v0 5
	syscall
	move $a3 $v0

	#Ya no nos quedan registros $an, por lo que ahora tendremos que hacer uso de la pila para almacenar los parametros que faltan
	
    # leer n'umero
	li $v0 5
	syscall
	move $t0 $v0

    # guardar en pila
	subu $sp $sp 4
	sw $t0 ($sp)

	jal funcion  # en cada posicion del vector almacena una suma: v[0]= $a0, v[1]= v[0] + $a1, v[2]= v[1] + $a3, ...

    # restaurar pila, descartando lo que guardamos de $t0
	addi $sp $sp 4  #quitamos el 'ultimo parametro, ahora solo quedan en pila $ra y $fp

	#ya hemos acabado la funcion, ahora verificaremos el resultado por pantalla

	li $t0 5
	li $t1 0
	la $t2 vector
	iff:bge $t1 $t0 fin
	    #
		lw $a0 ($t2)
		li $v0 1
		syscall
	    #
		la $a0 space
		li $v0 4
		syscall
	    #
		addi $t2 $t2 4
		addi $t1 $t1 1
	    #
		b iff
	
	fin: #restauramos todo y cerramos
		
		lw $ra 4($sp)
		lw $fp 0($sp)
		addi $sp $sp 8

		jr $ra


	funcion:

	    
		#Como en esta función no hemos cambiado el valor de ningun registro $an, no hace falta guardarlos
		# Si que hemos usado un registro $sn, asi que tenemos que guardarlo en pila antes de usarlo

		subu $sp $sp 4
		sw $s0 ($sp)


		la $s0 vector #cargamos el vector en $s0
		sw $a0 ($s0)

#
#       a)
#       li $t1 4
#       sw $t0 vector($t1)
#
#       b)
#       sw $t0 vector+4
#

		add $t0 $a0 $a1
		sw $t0 4($s0)

		add $t0 $t0 $a2
		sw $t0 8($s0)

		add $t0 $t0 $a3
		sw $t0 12($s0)

		lw $t1 4($sp)
		add $t0 $t0 $t1
		sw $t0 16($s0)

		#hemos finalizado, asi que antes de irnos recuperamos memoria
		lw $s0 ($sp)
		addi $sp $sp 4

		jr $ra


