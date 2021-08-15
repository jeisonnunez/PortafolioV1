#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	float pb=1000, pt=0;
	int op=0, n=0;
	
	printf ("Bienvenido a Domino Pizza\n\n");
	printf ("\nSeleccione un numero de acuerdo al pedido que desea realizar:\n\n1-Pizza Pequena\n\n2-Pizza Mediana\n\n3-Pizza Grande\n\n4-Pizza Familiar\n\n");
	scanf ("%d", &op);
	
	switch (op) {
		
		case 1: 
		    printf ("\nIngrese numero de pizzas pequenas que desea ordenar\n\n");
		    scanf ("%d", &n);
		    pt= n*pb;
		    break;
	    
	    case 2:
	    	printf ("\nIngrese numero de pizzas medianas que desea ordenar\n\n");
	    	scanf ("%d", &n);
	    	pt= n*(pb+0.20*pb); 
	    	break;
	    	
	    case 3:
	    	printf ("\nIngrese numero de pizzas grandes que desea ordenar\n\n");
	    	scanf ("%d", &n);
	    	pt= n*(pb+0.30*pb);
	    	break;
	    	
	    case 4:
	    	printf ("\nIngrese numero de pizzas familiares que desea ordenar\n\n");
	    	scanf ("%d", &n);
	    	pt= n*(pb+0.40*pb);
	    	break;
	    	
	    default : 
		    printf ("\nOperacion no disponible\n\n");
		    system ("PAUSE");
	        exit (0);	
			break;    
			      
			}
	
	printf ("\nEl total a pagar es: \n\n%f\n\n" , pt);
				
					
	system ("PAUSE");
	return 0;
}
