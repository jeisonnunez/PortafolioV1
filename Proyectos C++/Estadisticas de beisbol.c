#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int i=0, hit=0, tur=0, cl=0, jg=0, jp=0, out=0, asis=0, e=0, op=0, c1=0, c2=0; 
	
	float avg=0, era=0, inn=0, jgp=0, fil=0;
	
	
	for (i=1; i<=5; i+=1){
		
		printf ("\nIndique el tipo de jugador: \n\n1-Bateador\n\n2-Lanzador\n\n %d\n\n",i);
		scanf ("%d", &op);
		
		switch (op){
			
			case 1: 
			
			printf ("\nIngrese la cantidad de hits conectados\n\n");
			scanf ("%d", &hit);
			
			printf ("\nIngrese la cantidad de turnos al bate\n\n");
			scanf ("%d", &tur);
			
			if (hit<=tur){
			
			avg=avg+(1000*(hit/tur));
			c1++;
			
			c2=c2+tur;
			
		}else{
			
			printf ("\nError. No se puede calcular porque la cantidad de hits no puede superar a la cantidad de turnos al bate\n\n");
		}
			
			printf ("\nIngrese la cantidad de outs completados\n\n");
			scanf ("%d", &out);
			
			printf ("\nIngrese la cantidad de asistencias completadas\n\n");
			scanf ("%d", &asis);
			
			printf ("\nIngrese la cantidad de errores cometidos\n\n");
			scanf ("%d", &e);
			
			fil=fil+(out+asis/out+asis+e);
			
			break;
			
		case 2:
			
			printf ("\nIngrese la cantidad de carreras limpias recibidas\n\n");
			scanf ("%d", &cl);
			
			printf ("\nIngrese la cantidad de innings lanzados\n\n");
			scanf ("%f", &inn);
			
			era=era+(9*cl/inn);
			
			printf ("\nIngrese la cantidad de juegos ganados\n\n");
			scanf ("%d", &jg);
			
			printf ("\nIngrese la cantidad de juegos perdidos\n\n");
			scanf ("%d", &jp);
			
			jgp=jgp+(jg/jg+jp);
			
			break;
		}
	
}
	printf("\nLa cantidad de promedios al bate calculados es:\n%d\n\n",c1);
	printf("\nEl total de turnos al bate del equipo es:\n%d\n\n",c2);
									
	system("pause");
		
	return 0;
}
