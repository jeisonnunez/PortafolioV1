#include <stdio.h>
#include <stdlib.h>
#include <string.h> 

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
   int i=1, x=0, f=0, r=1, p=0, im=0;
     
   while (r==1) {
   
   printf ("\nIngrese un numero natural\n");
   scanf ("\n%d", &x);
      
   f=x;
   
   for (i=1; i<x; i++){
   	
         f=f*(x-i);
         
         }    
      
if (x%2==0){
            p++;
            }else{
                  im++;
}
 
 printf ("\nEl factorial es %d\n",f);
 printf ("\nDesea calcular otro factorial?.\n si=1, no=0 \n");
 scanf ("%d", &r);
 
}

 printf ("\nLa cantidad de numeros pares son: %d\n",p);
 printf ("\nLa cantidad de numeros impares son: %d\n",im); 
 
 
  system("PAUSE");	
  return 0;
}


