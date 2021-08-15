#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
    int i=0;
	float num=0;
	
	for (i=1; i<=10; i++){
		
		printf ("\nIngrese un numero %d\n\n", i);
		scanf ("%f", &num);
		
		if (num>0){
			printf ("\n%.2f\n", num);
		}
				
	}

	system("pause");
	return 0;
   
}
