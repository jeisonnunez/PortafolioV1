#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int n;
	
	float num, min, max, k;
	
	do {
					
	printf ("\nIngrese la cantidad de numeros que desea calcular\n");
	scanf ("%d", &n);
	
    }while(n<=0);
    
    k=n;
    
    	while (n>0){
		
		printf ("\nIngrese el numero \n");
	    scanf ("%f", &num);
		   		    	
		   	if(n==k){
		   		
		   		max=num;
		   		min=num;
		   		
			}else{
			        	
		        if (num>max){
		    	
	     	    max=num;
		    
	    		}
		    
			    if (num<min){
		
			    min=num;
			
	            }
	        }
	        
	        n--;
        }
	
	
	printf ("\nEl numero menor es:\n%.2f\n", min);
	printf ("\nEl numero mayor es:\n%.2f\n", max);
	
	system ("pause");
	
	return 0;
}
