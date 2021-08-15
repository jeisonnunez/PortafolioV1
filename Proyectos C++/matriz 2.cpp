#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int fil, col, sum, c, f, m;
	
	do {
		
		printf ("\nIngrese numero de filas y de columnas\n");
		scanf ("%d %d", &fil, &col);
				
	} while (col<1 || fil<1);
	
	
	
	if (col%2==0){
		
	f=1;
	c=1;
	sum=0;
	
	//Cuando el residuo de la columna dividida entre 2 es 0
	
	    while (c<=col){
		
		    while (f<=fil){
			
		    printf ("\nIntroducir valor ubicado en %d %d\n", f,c);
	        scanf ("\n%d", &m);
	
	        sum=sum+m;
	        f=f+1;
		    }
		
		    printf ("\nLa suma de la columna %d es %d\n", c, sum);
		
		    f=fil;
	        c=c+1;
		    sum=0;
		
		        while (f>=1){
			
		        printf ("\nIntroducir valor ubicado en %d %d\n", f,c);
	            scanf ("\n%d", &m);	
			
		        f=f-1;
			    sum=sum+m;
			    
		        }
		        
		        printf ("\nLa suma de la columna %d es %d\n", c, sum);
		    
		c=c+1;
		f=1;
		sum=0;
		
	    }	
	    
	}else{
	
	f=1;
	c=1;
	sum=0;
	
	//Cuando el residuo de la columna dividida entre 2 es 1
	
	    while (c<=col){
		
		    	
	    	while (f<=fil){
			
		    printf ("\nIntroducir valor ubicado en %d %d\n", f,c);
	        scanf ("\n%d", &m);
	
	        sum=sum+m;
	        f=f+1;
		    }
		
		    printf ("\nLa suma de la columna %d es %d\n", c, sum);
		
		    f=fil;
	        c=c+1;
		    sum=0;
		
		    if (c<=col){
			
		
		    	while (f>=1){
			
		        printf ("\nIntroducir valor ubicado en %d %d\n", f,c);
	            scanf ("\n%d", &m);	
			
		        f=f-1;
			    sum=sum+m;
			    }
		        
		        printf ("\nLa suma de la columna %d es %d\n", c, sum);
		        
		c=c+1;
		f=1;
		sum=0;
	    	
		} else {
			
			printf ("\nLa matriz esta llena\n");
			system ("pause");
			exit (0);
			
    }  
}
}

    printf ("\nLa matriz esta llena\n");
    system ("pause");
	return 0;
}
