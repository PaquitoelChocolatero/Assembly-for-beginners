'''
Transformar:
  for(int i = 0 ; i < N ; i++){
    if(v[i]==0) c++;
  }

i ----> $t0
$a0 --> Dirección de inicio del array
$a1 --> Número de elementos del array
'''

  .data

  .text
  .globl main

main:
  li $t0, 0                                  #Variable para recorrer array

bucle:
  bge $t0, $a1, fin                          #Si cumple la condición salimos
  lw $t1, ($a0)                              #Cogemos cada posición
  li $t2, 0x7FFFFFFF                         #Cargamos 01111111...111
  and $t3, $t2, $t1                          #Comparamos quitando el signo el número y todo 1s para que nos diga si es 0 o no
  bneq $zero, $t3, no_cero                   #Si no es todo 0 vamos a esa función
  addi $v0, $v0, 1                           #Si todo es 0 sumamos 1 a la variable

no_cero:                                     #Si no es 0 sumamos 1 al contador de la posición y avanzamos 4 posiciones en memoria (espacio de cada posición del array)
  addi $t0, $t0, 1
  addi $a0, $a0, 4
  b bucle                                    #Volvemos al bucle

fin:
  jr $ra
