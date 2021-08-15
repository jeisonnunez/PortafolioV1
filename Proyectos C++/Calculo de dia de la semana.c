#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */
	/*Calculo de dia de la semana*/

int main(int argc, char *argv[]) {

  int dia=0;
  
  printf ("Ingrese el numero de dia\n\n");
  scanf ("%d",&dia);
  
  switch (dia) {
         case 1 :printf ("\nLunes\n\n");
         break;
         
         case 2 :printf ("\nMartes\n\n");
         break;
         
         case 3 :printf ("\nMiercoles\n\n");
         break;
         
         case 4 :printf ("\nJueves\n\n");
         break;
         
         case 5 :printf ("\nViernes\n\n");
         break;
         
         case 6 :printf ("\nSabado\n\n");
         break;
         
         case 7 :printf ("\nDomingo\n\n");
         break;
         
         default :
         	
		 printf ("\nDia no existe\n\n");
		 exit (0);
		 
         }
         
    system("pause");
	return 0;
}
