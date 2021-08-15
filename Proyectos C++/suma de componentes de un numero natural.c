#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
   int k, s;
   
   do{
   
   printf ("\nIngrese un numero natural\n");
   scanf ("\n%d", &k);
   
 }while(k<=0);
 
   s=0;
         
   while (k>0){
   	
         s=s+k;
         k--;
      
         }    
      
 printf ("\nLa suma de los componentes es %d\n",s);
 
 
  system("PAUSE");	
  return 0;
}
