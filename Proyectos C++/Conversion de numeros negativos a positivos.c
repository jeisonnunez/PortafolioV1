#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int i=0;
	float neg=0, pos=0;
		
	for (i=1; i<=3; i+=1){
		
	printf ("\nIngrese un numero negativo %d\n\n", i);
	scanf ("%f", &neg);
	
	if (neg<0){
		
		pos=(neg*-1);
		printf ("\nLa conversion del numero negativo a postivo es: %.2f\n\n", pos);
		
	}else{
		printf ("\nError. Ingrese un numero negativo\n\n");
		i--;
	}
		
	}
		
	
		
	system("PAUSE");
	return 0;
}
