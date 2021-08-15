#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
   int i=1, k=0, s=0;
   
   do{
   
   printf ("\nIngrese un numero natural\n");
   scanf ("\n%d", &k);
   
 }while(k<=0);
 
   s=k;
   
   while (i<k){
   	
         s=s+(k-i);
         i++;
         
         }    
      
 printf ("\nLa suma de los componentes de %d es %d\n", k,s);
 
 
  system("PAUSE");	
  return 0;
}
