#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int contador=1, autos, num=0, ama=0, rosa=0, azul=0, rojo=0, verd=0;
	
	printf ("\nIndique la cantidad de autos\n\n");
	scanf ("%d", &autos);
	
	if (autos<=0){
		
	printf ("\nError. Numero de autos invalidos\n\n");
	
    }else{
				
	while (contador<=autos){
		
	printf ("\nIndique el ultimo numero de matricula del auto %d\n\n", contador);
	scanf ("%d", &num);
	
	if (num>=0 && num<=9){
						
	if (num==1 || num==2){
		
		ama++;
		contador++;	
	}
	
	if (num==3 || num==4){
		
		rosa++;
		contador++;
	}
	 
	if (num==5 || num==6){
		
		rojo++;
		contador++;
	}	
	
	if (num==7 || num==8){
		
		verd++;
		contador++;
	}
		
	if (num==9 || num==0){
		
		azul++;
		contador++;
	}
		
    }else{
    	printf ("\nError. Numero ingresado no esta en el rango establecido\n\n");
    }
    
}
	
	printf ("\nLa cantidad de autos amarillos son: \n%d\n\n", ama);
	printf ("\nLa cantidad de autos rosas son: \n%d\n\n", rosa);
	printf ("\nLa cantidad de autos rojos son: \n%d\n\n", rojo);
	printf ("\nLa cantidad de autos verdes son: \n%d\n\n", verd);
	printf ("\nLa cantidad de autos azules son: \n%d\n\n", azul);
}
	system("pause");
	return 0;
}
