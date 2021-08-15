#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	char letra;
	int num, op, largo, ancho;
	
	printf ("\nIngrese la letra\n");
	scanf ("%c", &letra);
		
	do{
		
	printf ("\nIngrese un numero para calcular el tamaño\n");
	scanf ("%d", &num);
	
	if (num<=2)
		
	printf ("\nIngrese un numero mayor a 2\n");
	
	}while (num<=2);
	
	printf ("\nSelecione un numero de acuerdo a la figura que desea dibujar\n\n1-Cuadrado\n\n2-Triangulo\n\n");
	scanf ("%d", &op);
	
	switch (op){
	
	case 1:
		
		for (largo=1;largo<=num;largo++){
				
			for (ancho=1;ancho<num;ancho++){
						
			printf ("%c\t", letra);
		}
					    
		printf ("%c\n\n", letra);
		
		}
		
	break;	
		
	case 2:
	
		for (largo=1;largo<=num;largo++){
				
			for (ancho=1;ancho<largo;ancho++){
						
			printf ("%c\t", letra);
		}
					    
		printf ("%c\n\n", letra);
		
		}
		
	break;	
	
	default: printf ("\nOperacion no disponible\n\n");
	
	system ("pause");
	exit (0);
}
	system ("pause");
	return 0;
}
