# Este script es un ejemplo de una calculadora basica de sumas, restas, multiplicaciones y divisiones de enteros
# Con esto quiero introducir o dar a conocer parte del convenio que se ha de seguir a la hora de programar
# en ensamblador
# Ademas de manejar la introduccion de inputs y la impresion por pantalla de variables

#OJO: NO escribir tildes en los comentarios ni ASCIIs porque da error de compilacion


.data
  ope: .asciiz "\nQue operación quieres hacer?:\n 1)Sumar \n 2)Restar \n 3)Multiplicar \n  4)Dividir \n"
  cual: .asciiz "Hola, introduce los 2 numeros con los que quieras operar: \n"
  peke: .asciiz "El numero que intentas dividir es mas pequeño que por el que divides, prueba otros\n"
  eng: .asciiz "El numero introducido no es una opcion, introduzca otro número\n"
  rep: .asciiz "Introduce de nuevo 2 números\n"
 cont: .asciiz "Quieres continuar operando (S/N)?:\t"
 adios: .asciiz "\nSee you"
 buffer: .space 16
.text
.globl main
  main:
        subu $sp $sp 8  #Guardamos $fp y $ra porque vamos a llamar a al menos una funcion
        sw $fp 4($sp)
        sw $ra  ($sp)
		
	ini:
		la $a0 ope	#1)Sumar \n 2)Restar \n 3)Multiplicar \n  4)Dividir \n Que operacion quieres hacer?:
        li $v0 4
        syscall
		
		li $v0 5
		syscall
		move $t0 $v0  #Guardo el numero introducido por teclado en $t0
		
        la $a0 cual #Hola, introduce los 2 numeros con los que quieras operar
        li $v0 4
        syscall

        li $v0 5	#Lectura del primer numero
        syscall
        move $a1 $v0

        li $v0 5	 #Lectura del segundo numero
        syscall
        move $a2 $v0

	
        li $t1 1
        li $t2 2
        li $t3 3
        li $t4 4

      bne $t0 $t1 try2
            jal sumar
            b fin

      try2:bne $t0 $t2 try3
            jal restar
            b fin

      try3:bne $t0 $t3 try4
            jal multiplicar
            b fin

      try4:bne $t0 $t4 default
            jal dividir
            b fin

      default: la $a0 eng  #Tecleamos algo que no es ni 1 ni 2 ni 3 ni 4 y te dice que repitas 
               li $v0 4
               syscall
			   b ini

      fin:
			la $a0 '\n'
			li $v0 11
			syscall
            #Recuperamos todos los registros que salvamos al principio
            #Asi el $ra y el $fp en este caso, se restauran y podemos salir

		#Quieres seguir?
	        la $a0 cont
			li $v0 4
			syscall

			li $v0 12
			syscall

			li $t0 's'
			beq $t0 $v0 ini
			la $a0 adios
			li $v0 4
			syscall

            lw $ra ($sp)	
            lw $fp 4($sp)
            addi $sp $sp 8
            jr $ra


	#La funciones no alteran registros $an ni $sn, ni queremos los que si utiliza($a0), 
	#asi que no guardamos ni recuperamos registros en pila, aunque generalmente al usar
	#el registro $a0 deberiamos guardarlo por convenio
            sumar:
                  add $v0 $a2 $a1
                  move $a0 $v0
                  li $v0 1
                  syscall
                  jr $ra

            restar:
                  subu $v0 $a1 $a2
                  move $a0 $v0
                  li $v0 1
                  syscall
                  jr $ra

            multiplicar:
                  mul $v0 $a2 $a1
                  move $a0 $v0
                  li $v0 1
                  syscall
                  jr $ra

            dividir:
              # asegurarse de que los datos esten ok...
              if: bge $a1 $a2 okdiv

                    la $a0 peke
                    li $v0 4
                    syscall

                    li $v0 5
                    syscall
                    move $a1 $v0

                    li $v0 5
                    syscall
                    move $a2 $v0

                    b if

              # ...y tratar los datos
              okdiv:
                      div $v0 $a1 $a2
                      move $a0 $v0
                      li $v0 1
                      syscall
                      jr $ra
