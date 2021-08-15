#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
  int i=0, num=0, tab=0;
  
  printf ("\nIngrese un numero entero positivo\n\n");
  scanf ("%d", &num);
  
  if (num>0){
  	
  	printf("\nLa tabla de multiplicar del numero es:\n\n");
  
  for (i=1;i<=10;i+=1){
  	  	
    tab=num*i;
    
    printf ("%d * %d = %d\n\n",num,i,tab);
    }
      
      	}else{
  		
  		printf ("\nError. Numero invalido\n\n");
  		
  		system("PAUSE");
  		exit (0);
  			
	  }
	  
	system("PAUSE"); 
	return 0;
}
