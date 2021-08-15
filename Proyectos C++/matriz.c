#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int fil, col, sum, c, f, m, tot=0;
	
	do {
		
		printf ("\nIngrese numero de filas\n");
		scanf ("%d", &fil);
		
		
		printf ("\nIngrese numero de columnas\n"); 
		scanf ("%d", &col);
		
	} while (col<1 || fil<1);
	
	f=1;
	c=1;
	sum=0;
	
	
	while (f<=fil){
	
	while (c<=col){
		
	printf ("\nIntroducir valor ubicado en %d %d\n", f,c);
	scanf ("\n%d", &m);
	
	sum=sum+m;
	c=c+1;
}

    printf ("\nLa suma de la fila %d es %d\n", f, sum);
    
	c=1;
	f=f+1;
	tot=tot+sum;
	sum=0;
}

    printf ("\nLa suma total de filas de la matriz %d * %d es %d\n", fil, col, tot);

	system ("pause");
	return 0;
}
