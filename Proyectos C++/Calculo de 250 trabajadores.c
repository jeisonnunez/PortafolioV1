#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int i=0, op=0, ht=0, ext=0, i1=0, a1=0, t1=0, c1=0, ser=0;
	float ins=0, alb=0, tec=0, con=0, sb=16000, mf=3000, tot=0; 
	
	for (i=1; i<=5; i+=1){
		
		printf ("\nIndique el tipo de trabajador: \n\n1-Inspector\n\n2-Albanil\n\n3-Tecnico\n\n4-Contratados\n\n %d\n\n",i);
		scanf ("%d", &op);
		
		switch (op){
			
			case 1:
				
				ins=ins+sb/4;
				i1++;
				break;
			
			case 2:
				
				printf ("\nIngrese numero de horas trabajadas\n");
				scanf ("%d", &ht);
				
				if (ht>0 && ht<=30){
					alb=alb+mf;
					a1++;
				}
				 
				else if (ht>30){
					ext=ht-30;
					alb=alb+mf+(1.5*mf*ext);
					a1++;
					
				}else{
					printf ("\nError. Numero de horas no validas\n");
					
				}
				break;
				
			case 3:
				
				tec=tec+sb/4+0.45*(sb/4);
				t1++;
				break;
			
			case 4: 
			
			    printf ("\nIngrese la cantidad de servicios prestados en la semana\n");
			    scanf ("%d", &ser);
			    
			    if (ser>=0){
				con=con+mf*ser-0.04*(mf*ser);
			    c1++;
			    
			    }else{
			    	printf ("\nError. Numero de servicios no validos \n");
				}
			    break;
			    
			default: 
			
			    printf("\nOperacion no disponible\n");
			    break;
			
		}
	}
	   
	        printf("\nLa cantidad de inspectores a pagar es:\n%d\n\n",i1);
		    printf("\nEL total nomina a pagar inspectores es:\n%f\n\n",ins);
					     	
	        printf("\nLa cantidad de albaniles a pagar es:\n%d\n\n",a1);
		    printf("\nEL total nomina a pagar albaniles es:\n%f\n\n",alb);
		           	       
	        printf("\nLa cantidad de tecnicos a pagar es:\n%d\n\n",t1);
		    printf("\nEL total nomina a pagar tecnicos es:\n%f\n\n",tec);
		  		    		   
		    printf("\nLa cantidad de contratados a pagar es:\n%d\n\n",c1);
		    printf("\nEL total nomina a pagar contratados es:\n%f\n\n",con);
		    
	       		
	tot=ins+alb+tec+con;
	
	printf ("\nEl total nomina a pagar es:\n%f\n\n", tot);
		
	system ("pause");
	return 0;
}
