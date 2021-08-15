#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int contador=0, vendedores=0;
	float ven1, ven2, ven3, sb=15000, com=0.10, total=0, cv1, cv2, cv3, totcom;
	
	printf ("\nIngrese el numero de vendedores\n\n");
	scanf ("%d", &vendedores);
	
	while (contador<vendedores){
		
		printf ("\nIngrese monto de la primera venta\n\n");
		scanf ("%f", &ven1);
					
		printf ("\nIngrese monto de la segunda venta\n\n");
		scanf ("%f", &ven2);
						
		printf ("\nIngrese monto de la tercera venta\n\n");
		scanf ("%f", &ven3);
		
		if (ven1>0 && ven2>0 && ven3>0){
		
		cv1=ven1*com;
		cv2=ven2*com;
		cv3=ven3*com;
		
		totcom=cv1+cv2+cv3;
		
		total=sb+totcom;
		
		contador++;
		
		printf ("\nEl total de dinero percibido por concepto de comisiones es: \n%.3f\n\n", totcom); //imprime el total de dinero percibido por concepto de comision por las tres ventas de la semana
		printf ("\nEl total de dinero percibido por concepto de comisiones mas el sueldo base es: \n%.3f\n\n", total); // imprime el total de dinero percibido por concepto de comision mas el sueldo base inicial
		
	}else{
		printf ("\nMonto incorrecto\n\n");
	}
	}
	
	system("pause");
	return 0;
}
