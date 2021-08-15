#include <stdio.h>
#include <stdlib.h>


 /*Calculo del salario semanal de un obrero*/

int main(int argc, char *argv[])

{

  int ht=0, he=0, t=0;

  printf ("Ingrese la cantidad de horas trabajadas \n\n");

  scanf ("%d",&ht);

  if (ht<=40){

     t=200*ht;

     }else{

         he=ht-40;

         t=200*40+300*he;
		 }

  printf ("\nEl total a cobrar es: \n\n%d\n\n",t);
  
   system ("pause");
   return 0;
}

