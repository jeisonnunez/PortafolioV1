#include <stdio.h>
#include <stdlib.h>
#include<math.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	float a,b,c,x,x1,x2,discriminante;
	
    do{
    	
    printf("\nIngrese el valor de a:\n\n");
    scanf("%f",&a);
    
    printf("\nIngrese el valor de b: \n\n");
    scanf("%f",&b);
    
    printf("\nIngrese el valor de c:\n\n");
    scanf("%f",&c); 
    
    discriminante=pow(b,2)-(4*a*c);
    
    if (discriminante<0){
	
        printf ("\nError. La ecuación no tiene solución en los numeros reales\n\n");
    
}
   	}while(discriminante<0);

	if (discriminante==0){
		
		x=(-b)/(2*a);
		
       printf("\nEl valor de x es: \n%.2f\n\n",x);   
    }

	if (discriminante>0){
		
		x1=((-b)+sqrt(discriminante))/(2*a);
        x2=((-b)-sqrt(discriminante))/(2*a);

	    printf("El valor de x1 es:\n%.2f\n\n",x1);
		printf("El valor de x2 es:\n%.2f\n\n",x2);
		
	}	
		
	system("pause");
	return 0;
}
