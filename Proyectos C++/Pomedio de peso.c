#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int i=0, edad=0, n=0, a=0, j=0, v=0; 
	float pn=0, pa=0, pj=0, pv=0, peso=0, totaln=0, totala=0, totalj=0, totalv=0;
	
	for (i=1;i<=3;i++){
		
		printf ("\nIngrese el peso de la persona %d\n\n", i);
		scanf ("%f", &peso);
		
		if (peso>0){
									
		printf ("\nIngrese la edad de la persona %d\n\n", i);
		scanf ("%d", &edad);
		
		if (edad>0){
			
			//rango edad niños
			if (edad>0 && edad<=12){
				
				totaln=totaln+peso;
				n++;
			}
			//rango edad adolescentes
			if (edad>=13 && edad<=29){
				
				totalj=totalj+peso;
				j++;
			}
			//rango edad adultos
			if (edad>=30 && edad<=59){
				
				totala=totala+peso;
				a++;
			}
			//rango edad viejos
			if (edad>=60){
				
				totalv=totalv+peso;
				v++;
			}
			
	}else{
		
		printf ("\nEdad incorrecta\n");
		i--;
	}
	
}else{
	    printf ("\nPeso incorrecto\n");
		i--;
	}
}

    if(n>0){
    	
    	pn=totaln/n;
    	
    }else{
    	
		pn=0;
	}
	
    if(j>0){
    	
	    pj=totalj/j;
	    
	}else{
    	
		pj=0;
	}
		
	if(a>0){
		
		pa=totala/a;
		
    }else{
    	
    	pa=0;
	}
	
	if(v>0){
		
		pv=totalv/v;
		
    }else{
	
	pv=0;
    }
		
	printf ("\nEl promedio de peso de los niños es \n%.2f\n\n", pn);
	printf ("\nEl promedio de peso de los jovenes es \n%.2f\n\n", pj);
	printf ("\nEl promedio de peso de los adultos es \n%.2f\n\n", pa);
	printf ("\nEl promedio de peso de los viejos es \n%.2f\n\n", pv);
	
	
	system("pause");
	return 0;
}
