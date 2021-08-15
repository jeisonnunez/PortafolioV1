#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	float m1=0, m2=0, m3=0, p1=0, p2=0, p3=0, t=0;
	
    printf ("\nIngrese el primer monto \n");
    scanf ("\n%f",&m1);
    
    printf ("\nIngrese el segundo monto \n");
    scanf ("\n%f",&m2);
    
    printf ("\nIngrese el tercer monto \n");
    scanf ("\n%f",&m3);
  
    t=m1+m2+m3;
    
    p1=m1*100/t;
    p2=m2*100/t;
    p3=m3*100/t;
       
    printf ("\n\nEl porcentaje del primer monto es de: \t%.2f ",p1);
    printf ("\n\nEl porcentaje del segundo monto es de: \t%.2f ",p2);
    printf ("\n\nEl porcentaje del tercer monto es de: \t%.2f \n\n",p3);
    printf ("\nLa suma total de la inversion es de: \t%.2f ",t);
    
    system("PAUSE");	
	return 0;
}
