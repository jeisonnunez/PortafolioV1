#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
    int p=0, op=0, id=0;
	float s=100000, r=0, d=0, sd=0;
	
	printf("Banco Mercantil\n\n");
	printf ("\nIngrese clave de cuatro digitos\n\n");
	scanf ("%d", &p);
	
	if (p==1234 || p==1996){
		
	printf ("\nIndique un numero de acuerdo a la operacion que desee realizar\n\n1-Consulta de saldo\n\n2-Deposito\n\n3-Retiro\n\n");
	scanf ("%d",&op);
	
	    switch (op) {
		
		case 1: 
		
		printf ("\nIngrese los dos primero o dos ultimos digitos de su cedula\n\n");
	    scanf ("%d", &id);
	    
	        if (id==25 || id==19){
		        sd=s;
		        		        
	            }else{
	            	
		            printf ("\nCedula incorrecta\n\n");
		                system("PAUSE");
		                exit (0);
		                }
		break;
		
		
		case 2: 
		
		printf ("\nIngrese monto del deposito\n\n");
		scanf ("%f", &d);
		
		    printf ("\nIngrese los dos primero o dos ultimos digitos de su cedula\n\n");
	        scanf ("%d", &id);
	        
	        if (id==25 || id==19){
		        sd=s+d;
		        
	                }else{
	                	
		                printf ("\nCedula incorrecta\n\n");
		                    system("PAUSE");
		                    exit (0);
		                    }
	
		break;
		
		case 3:
			
		printf ("\nIngrese monto del retiro\n\n");
		scanf ("%f", &r);
		
		if (r<=s) {
			
			printf ("\nIngrese los dos primero o dos ultimos digitos de su cedula\n\n");
	        scanf ("%d", &id);
	        
	        if (id==25 || id==19){
		        sd=s-r;
		        
	                }else{
	                	
		            printf ("\nCedula incorrecta\n\n");
		                system("PAUSE");
		                exit(0);
		                    }
								
						}else{
						
		    printf ("\nError. Monto del retiro mayor al saldo disponible\n\n");
		    system("PAUSE");
			exit (0);
		}
		
		break;		
			
	    default: 
		
		printf("\nOperacion no disponible\n\n");
		
		system("PAUSE");
		exit(0);
		break;
		
	    }
	
	}else{
		
		printf ("\nClave incorrecta\n\n");
		system("PAUSE");
		exit (0);
		
		}
		
		printf ("\nEl saldo disponible en su cuenta es: \n\n%f\n\n",sd);
		printf ("\nGracias por su operacion\n\n");
		
	system("PAUSE");	
  return 0;
}

