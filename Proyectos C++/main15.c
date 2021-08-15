#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Calculo de un numero feliz */

int main(int argc, char *argv[]) {
	
	int res, num, n1, n2, ni;
	
	printf ("\nIngrese un numero natural\n");
    scanf ("\n%d", &ni);
    
    num=ni;
    
    do {
		
	if (num<10){
				
	res=pow(num,2);
	
	}else{
		 		
	n1=num/10;
		
	n2=(num%10);
		
	res=pow(n1,2)+pow(n2,2);
}
} while (res!=1 || res!=ni);


    if (res==1){
	
    printf ("\nEl numero es feliz \n\n");
}
	if (res==ni){
	
	printf ("\nEl numero es infeliz \n\n");
}
	system ("pause");
	return 0;
}
