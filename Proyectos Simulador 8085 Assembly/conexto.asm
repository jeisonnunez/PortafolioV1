;-------------------------------------
; Programa de Cambio de Contexto
; Autor: Gustavo Jimenez
; 
;
;
;-------------------------------------

;-------------------------------------
; Area de datos para procesos
; max 4 procesos
; direcciones 2000h, 3000h, 4000h y 5000h
; cada proceso guarda su estado y valor de 
; registros incluyendo PC
;-------------------------------------
.data D000h
;					Resistros
;proceso		PC    A   B   C   D   E	 H   L     	
pc1:		DB 	00h
A1:		DB	01h
pc2:		DB	00h
A2:		DB    0Dh
pc3:		DB	00h
A3:		DB	01h
pc4:		DB    00h
A4:		DB    01h
actual:	DB	01h

;-------------------------------------
; Programa principal
;-------------------------------------
.org 0000h
		JMP s1
		HLT

.org 002Ch
		PUSH PSW
		LDA actual 
		CPI 01h
		JZ p1
		CPI 02h
		JZ p2
		CPI 03h
		JZ p3
		CPI 04h
		JZ p4
		JMP retornar	

p1:		POP PSW
		STA A1
		POP H
		MOV A,L
		STA pc1
		LDA pc2
		MOV L,A
		MVI H,20h
		PUSH H
		LDA actual
		INR A
		STA actual
		LDA A2
		JMP retornar

p2:		POP PSW
		STA A2
		POP H
		MOV A,L
		STA pc2
		LDA pc3
		MOV L,A
		MVI H,30h
		PUSH H
		LDA actual
		INR A
		STA actual
		LDA A3
		JMP retornar

p3:		POP PSW
		STA A3
		POP H
		MOV A,L
		STA pc3
		LDA pc4
		MOV L,A
		MVI H,40h
		PUSH H
		LDA actual
		INR A
		STA actual
		LDA A4
		JMP retornar

p4:		POP PSW
		STA A4
		POP H
		MOV A,L
		STA pc4
		LDA pc1
		MOV L,A
		MVI H,10h
		PUSH H
		MVI A,01h
		STA actual
		LDA A1
		JMP retornar


retornar:	RET


.org 1000h
s1:		EI
		INR A
		OUT 01
		JMP s1

.org 2000h
s2:		EI
		DCR A
		OUT 02
		JMP s2

.org 3000h
s3:		EI
		RRC
		OUT 03
		JMP s3

.org 4000h
s4:		EI
		IN 00h
		MOV B,A
		IN 01h
		ADD B
		OUT 04
		JMP s4
