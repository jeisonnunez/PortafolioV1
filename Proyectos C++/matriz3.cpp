#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int fil, col, sum, c, f, mfc, k, min, max, par=0, imp=0, coc, r;
	
	do {
		
		printf ("\nIngrese numero de filas y de columnas\n");
		scanf ("%d %d", &fil, &col);
				
	} while (col<1 || fil<1);
	
	f=1;
	c=1;
	sum=0;
    k=f;
    
        while (c<=col){
				    	
	    	while (f<=fil){
			
		    printf ("\nIntroducir valor ubicado en fila %d y columna %d\n", f, c);
	        scanf ("\n%d", &mfc);
	
	        if(f==k){
	        	
	        	max=mfc;
	        	min=mfc;
	        	
			}else{
			
	        if (mfc>max){
	        	
	        	max=mfc;
			}
			
	        if (mfc<min){
	        	
	        	min=mfc;
			}
	        
			}
			
			coc=mfc/2;
		    r=mfc-2*coc;
		    
			if(r==0){
				
			par=par+1;
				
			}else{
			
			imp=imp+1;	
			}
			
	        sum=sum+mfc;
	        f=f+1;
	        
		    }
		
		    printf ("\nLa suma de la columna %d es %d\n", c, sum);
		    printf ("\nEl numero menor de la columna %d es %d\n", c, min);
		    printf ("\nEl numero mayor de la columna %d es %d\n", c, max);
		    printf ("\nLa cantidad de numero pares en la columna %d es %d\n", c, par);
		    printf ("\nLa cantidad de numero impares en la columna %d es %d\n", c, imp);
		
		
		    f=fil;
	        c=c+1;
		    sum=0;
	    	k=f;
	    	par=0;
	    	imp=0;
		
		    if (c<=col){
			
				while (f>=1){
			
		        printf ("\nIntroducir valor ubicado en fila %d columna %d\n", f, c);
	            scanf ("\n%d", &mfc);	
	            
			        if(f==k){
	        	
	        	    max=mfc;
	             	min=mfc;
	        	
			        }else{
			
	                    if (mfc>max){
	        	
	        	        max=mfc;
			            }
			
	                    if (mfc<min){
	        	
	        	        min=mfc;
			            }
	        
		         	}
		         	
		         	coc=mfc/2;
		         	r=mfc-2*coc;
		         	
		         	if(r==0){
				
			        par=par+1;
				
			        }else{
			
			        imp=imp+1;	
			        
			        }
			        
		        f=f-1;
			    sum=sum+mfc;
			    
			    }
		        
		        printf ("\nLa suma de la columna %d es %d\n", c, sum);
		        printf ("\nEl numero menor de la columna %d es %d\n", c, min);
		        printf ("\nEl numero mayor de la columna %d es %d\n", c, max);
		        printf ("\nLa cantidad de numero pares en la columna %d es %d\n", c, par);
		        printf ("\nLa cantidad de numero impares en la columna %d es %d\n", c, imp);
		   
         	    c=c+1;
	            f=1;
	     	    sum=0;
	     	    k=f;
	     	    par=0;
	    	    imp=0;
	    	
	    	}else{
			
			    printf ("\nLa matriz esta llena\n");
		    	system ("pause");
		    	exit (0);
            	}  
        }


    printf ("\nLa matriz esta llena\n");
    system ("pause");
	return 0;
}
