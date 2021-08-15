;trabajar con interrupciones
;Programa que simula la maquina de torniquete del metro
; 

.DATA 1000H
codigo7seg: db  77H,44H,3EH,6EH,4DH,6BH,7BH,46H,7FH,4FH

;principal
.ORG 0100H
inicio:	EI
		JMP inicio
		HLT

; fin principal

; REST 5.5
; rutina sensor de ticket
.ORG 002CH
		IN  00H		; lector de banda magnetica	
		CPI 00H		; comparo con cero
		JZ  devolver	; salta a devolver
		DCR A			; resto un viaje
		MOV B,A		; se guarda el valor de viajes restantes
		CPI 00H		; se agotaron los viajes
		JNZ hay		; queda todavia viajes
		MVI A,02H		; guardar en deposito
		JMP enviar
hay:		MVI A,01H		; devolver el ticket
enviar:	OUT 03H		; se guarda o se devuelve
		MOV A,B		; recuperamos el valor de A
		OUT 00H 		; grabo en ticket
		CALL convert7seg		; convertor7seg
		MOV A,B
		OUT 01H		; puerto 1 display 7seg
		MVI A,01H		; activacion de torniquete
		OUT 02		; puerto 2 torniquete, lo activa
esperar:	IN 04H		; al bit 0, sensor de tomar ticket Bit  1 sensor de pasar
		MOV B,A		; se guarda el valor de ambos puertos
		CPI 02H		; para saber si ha pasado
		JNC nopaso		; no ha pasado la persona
		MVI A,00H		; si paso
		OUT 02H		; bloqueo el torniquete
		MOV A,B		; recupero el valor de A
nopaso:	CPI 03H		; se compara con 11 paso y tomo el ticket
		JNZ esperar       ; espera hasta dque se cumpla la condicion
		MVI A,00H		;
		OUT 02H		;		
devolver:	RET

;-------------------------------------------
;Rutina de conversion de digito decimal a 7seg	
;--------------------------------------------
convert7seg:
	PUSH H; guarda en la pila cualquier valor que tenga HL
	LXI H, codigo7seg; graba la direcci?n de cod7sg en HL
	ADD L
	MOV L,A
	MOV B,M; mueve lo que hay en M a B, M tiene la direccion de HL
	POP H
	RET


		


