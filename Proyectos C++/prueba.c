#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <ctype.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */
int validar_num (char numero [1]);

main () {
	
	int sw;
	char numero [1];
	
	fflush (stdin);
	printf ("\nIngrese numero:\n\n");
	gets (numero);
	
	sw=validar_num(numero);
	
	if (sw==0){
		
			printf ("\nNumero valido\n\n");
			system ("pause");
	}else{
		
		    printf ("\nNumero invalido\n\n");
		    system ("pause");
	}
	
	}
	
int validar_num (char numero [1]) {
	
	int i=0, sw=0, j;
	
	j=strlen (numero);
	
	while (i<j && sw==0){
		
		if (isdigit (numero[i]) !=0){
			
			i++;
		}
		else
		{
			sw=1;
		}
	}
		
	return sw;
}

