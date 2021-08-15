#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int An=0, Aa=0, e=0;
	      
    printf ("\nIngrese el año de nacimiento \n");
    scanf ("\n\n%d",&An);
    
    printf ("\nIngrese el año actual \n");
    scanf ("\n\n%d",&Aa);
    
    e=Aa-An;
    
    printf ("\nSu edad es \n %d",e);
    
    if (e>=18){
	    
    printf ("\n\nUsted es mayor de edad \n\n");
    
	}else{
		
	printf ("\n\nUsted es menor de edad \n\n");
	}
	
   system("PAUSE");	
	return 0;
}
