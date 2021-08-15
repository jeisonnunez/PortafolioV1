#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
  int i=0;
  float x=0, c=0;
  
  for (i=1;i<=10;i+=1){
  	
      printf("Ingrese el numero %d\n\n",i);
      scanf("%f",&x);
      
      c=x*x;
      
      printf("\nEl cuadrado es\n\n%.0f\n\n",c);
      }
      
  system("PAUSE");	
	return 0;
}
