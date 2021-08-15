#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int alumnos, hom=0, muj=0, cont=1, op=0;
	
	printf ("\nIngrese el numero de alumnos que hay en el salon\n");
	scanf ("%d", &alumnos);
	
	while (cont<=alumnos){
		
		printf ("\nIndique el sexo del alumno\n\n1-Hombre\n\n2-Mujer\n\n");
		scanf ("%d", &op);
				
		switch (op){
			
			case 1:
			
			hom++;
			break;
			
			case 2:
			
			muj++;
			break;
			
			default: 
			
			printf ("\nOperación no disponible\n\n");
			cont--;
			break;
		}
		
	cont++;
	
	}
	
	printf ("\nLa cantidad de hombres en el grupo es:\n%d\n\n", hom);
	printf ("\nLa cantidad de mujeres en el grupo es:\n%d\n\n", muj);
	
	
	system("pause");
	return 0;
}
