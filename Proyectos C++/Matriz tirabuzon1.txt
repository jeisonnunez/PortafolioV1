#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int fil, col, f, c, filsup, filinf, colder, colizq, cont, m;
	
	do{
		
		printf ("\nIngrese numero entero de filas y columnas\n");
		scanf ("%d %d", &fil, &col);
		
	}while(col<0 || fil<0);
	
	filsup=1;
	filinf=fil;
	colder=col;
	colizq=1;
	cont=fil*col;
	
    while (cont>0){
	
		c=colizq;
		f=filsup;
		
		while (c<=colder){ 
			
			printf ("\nIngrese valor ubicado en filas %d y columnas %d\n", f,c);
			scanf ("%d", &m);
			
			c=c+1;
			cont=cont-1;
		}
		
		if (cont==0){
			
			printf ("\nLa matriz esta llena\n");
			system ("pause");
			exit (0);
		}
		
		c=colder;
		f=filsup+1;
		
		while (f<=filinf){
			
			printf ("\nIngrese valor ubicado en filas %d y columnas %d\n", f,c);
			scanf ("%d", &m);
			
			f=f+1;
			cont=cont-1;
		}
	
	    if (cont==0){
			
			printf ("\nLa matriz esta llena\n");
			system ("pause");
			exit (0);
		}
	
	    filsup=filsup+1;
	    f=filinf;
	    c=colder-1;
	    
	    while (c>=colizq){
	    	
	    	printf ("\nIngrese valor ubicado en filas %d y columnas %d\n", f,c);
			scanf ("%d", &m);
	    	
	    	c=c-1;
	    	cont=cont-1;
		}
	
	    if (cont==0){
			
			printf ("\nLa matriz esta llena\n");
			system ("pause");
			exit (0);
		}
	
	    c=colizq;
	    f=filinf-1;
	
	    while (f>=filsup){
	    	
	    	printf ("\nIngrese valor ubicado en filas %d y columnas %d\n", f,c);
			scanf ("%d", &m);
	    	
	    	f=f-1;
	    	cont=cont-1;
		}
	
	    colder=colder-1;
	    filinf=filinf-1;
	    colizq=colizq+1;
	    
}

	printf ("\nLa matriz esta llena\n");
	system ("pause");
	return 0;
}
