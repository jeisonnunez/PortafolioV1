#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
  int op=0;
  float a=0, b=0, r=0;
  
  printf ("Ingrese el primer numero\n\n");
  scanf ("%f",&a);
  
  printf ("\nIngrese el segundo numero\n\n");
  scanf ("%f",&b);
  
  printf ("\nSeleccione un numero de acuerdo a la operacion que desea realizar\n\n1-Sumar\n2-Restar\n3-Multiplicar\n4-Dividir\n\n");
  scanf ("%d",&op);
  
  switch (op) {

    case 1 :r=a+b;
    break;
    
    case 2 :r=a-b;
    break;
    
    case 3 :r=a*b;
    break;
    
    case 4 :r=a/b;
    break;
    
    default :printf ("\nOperacion no existe\n\n");
    
    system("pause");
    exit (0);
    break;

         }

  printf ("\nEl resultado de su operacion es\n\n%f\n\n",r);
  
  system("pause");				
  return 0;
}
