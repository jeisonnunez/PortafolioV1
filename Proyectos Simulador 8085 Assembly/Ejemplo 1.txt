;--------------------------------------
; Programa: Codigos 7 Segmentos
; 02/10/2017
;--------------------------------------

.data 1000h
codigos:	DB 77h, 44h, 3Eh, 6Eh, 4Dh, 6Bh, 79h, 46h, 7Fh, 4Fh
dato1:	DB 00h
dato2:	DB 00h


.org 0100h
reiniciar: 	CALL ClearPort	; limpia los puertos
inicio: 	IN 00h	; leernumero oor teclado
		CPI 00h	; verifuca si hay dato
		JZ inicio	; salta a inicio
		SUI 30H	; resto para obtener digito entre 0 y 9
		STA dato1	; guarda dato1
		CALL Convert7Seg ; convierte el ndigito decimal en codigo 7seg, Entrada A, Retorno A
		OUT 00h	; primer digito
		MVI A, 08h	; signo menos
		OUT 01h	; se muestra en puerto 1
espera:	IN 00		; segundo dato
		CPI 00h	; verifuca si hay dato
		JZ espera	; espera por segundo dato
		SUI 30h	; resta 30 para obtner numero decimal
		STA dato2	; almacena dato2
		CALL Convert7Seg	;covierte segundo numero a 7seg
		OUT 02h	; muestra en puerto 2
		MVI A,28h	; signo igual
		OUT 03	; en puerto 3
		LDA dato2	; carga dato 2
		MOV B,A	; mueve dato a B
		LDA dato1	; carga dato1
		SUB B		; resta A menos B
		JP positivo	; muestra resultado positivo
		CMA		; complentar el registro A
		INR A		; obtiene codigo postivo
		MOV B,A	; resguarda valor positivo
		MVI A,08h	; signo negativo 
		OUT 06H	;
		MOV A,B	;
positivo:	CALL Convert7Seg
		OUT 07h
		JMP reiniciar				
		HLT
		

;---------------------------------------------
; Entrada: Registro A
; Salida: Registro A
; Usa etiqueta codigos 
; Modifica Registro HL
;---------------------------------------------
Convert7Seg:PUSH H		; salva valor de HL para no perder
		LXI H, codigos	; cargamos direccion de los codigos 7seg
		ADD L			; sumamos para bajo de direccion al acumulador
		MOV L,A		; movemos a direccion donde esta el codigo
		MOV A,M		; codigo de retorno
		POP H			; recuoperamo cualquier valor de HL
		RET
		
ClearPort:
		PUSH PSW
		MVI A,00h
		OUT 00h
		OUT 01h
		OUT 02h
		OUT 03h
		OUT 04h
		OUT 05h
		OUT 06h
		OUT 07h
		POP PSW
		RET