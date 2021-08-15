; Programa que nuestra el mayor de dos numeros
; Autor: Gustavo Jimenez
; Fecha: 05/10/2016
; Universidad Alejandro de Humboldt
; 
; Puertos:
; dato0 en puerto 0
; dato2 en puerto 2
; mayor en puerto 7

; Variables
.DATA 1000H
cod7s:	DB 77H, 44H, 3EH, 6EH, 4DH, 6BH, 7BH, 46H, 7FH, 4FH
dato0:	DB 00H
dato2:	DB 00H


; programa principal
.ORG 0100H
inicio:	CALL mostrar		; rutina que muestra los valores en display de 7 seg
		IN 00H		; se lee puerto del teclado
		CPI 57H
		JZ subir0	; se compara con las tecla w para subir
		CPI 53H
		JZ bajar0	; se compara con la tecla s para baja
		CPI 4AH
		JZ subir2	; subir el dato2 tecla j 
		CPI 4DH
		JZ bajar2	; bajar el dato2 tecla m
		JMP inicio

subir0:	LDA dato0		; se carga el valor del dato 1
		INR A		; se incrementa en 1
		CPI 0AH		; se compara con 10 (0AH en hexadecimal)
		JNZ salto1	; si es mayor de 10 se ajusta a 9
		MVI A,09H	; 
salto1:	STA dato0		; se guarda otra vez en la memoria
		JMP inicio	; se salta a inicio para mostrar el nuevo valor


bajar0:	LDA dato0		; carga el dato0
		DCR A		; en este caso se decrementa
		CPI FFH		; se compara com -1 (FFH en Hex)
		JNZ salto2	; si es negativo se ajusta a 0
		MVI A,00H
salto2:	STA dato0		; se salva el nuevo valor
		JMP inicio	: se regresa al inicio para mostrar valor actualizado en 7Seg


subir2:	LDA dato2		; igual para el otro dato
		INR A
		CPI 0AH
		JNZ salto3
		MVI A,09H
salto3:	STA dato2
		JMP inicio

bajar2:	LDA dato2
		DCR A
		CPI FFH
		JNZ salto4
		MVI A,00H
salto4:	STA dato2
		JMP inicio	; se repite todo el tiempo
		HLT		; fin de programa principal


;rutina que muesta el mayor de los datos
mostrar:
		LDA dato0	; carga el primer dato
		MOV C,A		; se guarda en C
		CALL CONVERT7SEG; se convierte a 7 seg
		MOV A,B		; se recupera de la funcion convert
		OUT 00h		; se muestra en puerto 0
		LDA dato2	; ahora se carga el dato 2
		CALL CONVERT7SEG; igual se convierte a 7seg
		MOV A,B		; se mueve a a para luego ser mostrado 
		OUT 02H		; se muestra en puerto 2
		LDA dato2	; se vuelve a cargar el dato ya que se perdio al mostrarlo en el puerto
		CMP C		; se compara con el primer valor 
		JNC mayor	; si no hay acarreo el maor es el valor actual de A
		MOV A,C		; en el caso contraio el mayo es el valor de C
mayor:	CALL CONVERT7SEG	; se convierte a 7seg el mayor
		MOV A,B		; se recupera en A el codg 7g
		OUT 07H		; se muestra en puerto 7
		RET		; regresa la rutina



; rutina de convenserion de 7 seg
; entrada registro A
; salida registro B
CONVERT7SEG:
		PUSH H
		LXI H, cod7s
		ADD L
		MOV L,A
		MOV B,M
		POP H
		RET ; fin rutina



		

			
