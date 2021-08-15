#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int n,fila,col;


 printf("tamaño del cuadrado: ");
 scanf("%d",&n);

/*Primera fila*/
for(col=1;col<=n;col++){


printf("*");

 }
 printf("\n");


/*Filas interiores*/
for(fila=2;fila<n;fila++){


printf("*");

for(col=2;col<n;col++){


printf(" ");

}
 printf("*");
 printf("\n");

 } 


/* Última fila*/
for(col=1;col<=n;col++){


printf("*");

} 

	
	
	
	
	
	system ("pause");
	return 0;
}
