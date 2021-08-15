#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int i=1, x=0,c=0;
	
    printf ("Ingrese un numero entero \n");
    scanf ("%d", &x);
    
    while (i<=x){
          if (x%i==0){
    c++;
    }
    i++;
    }
     if (c==2){
      printf ("Es primo \n");
      }else{
      printf ("No es primo \n");
      }         

  system("PAUSE");	
	return 0;
}
