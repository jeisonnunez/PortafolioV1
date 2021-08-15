#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) { 

int a=0;

  printf ("Ingrese un numero entero\n\n");

  scanf ("%d",&a);

  if (a%2==0 && a>0){

  printf ("\nEl numero es par y positivo\n\n");

  }else if (a%2==0 && a<0){

  printf ("\nEl numero es par y negativo\n\n");

  }else if (a%2!=0 && a>0){

  printf ("\nEl numero impar y positivo\n\n");

  }else if (a%2!=0 && a<0){

  printf ("\nEl numero es impar y negativo\n\n");

  }else if (a%2==0 && a==0) {

  printf ("\nEl numero es cero \n\n");

  }

    system("PAUSE");
 	return 0;
 }

