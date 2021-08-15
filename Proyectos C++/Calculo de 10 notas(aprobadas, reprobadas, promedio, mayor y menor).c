#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
  int i=0, c1=0, c2=0;
  float nota=0, prom=0, suma=0, max=0, min=20;
  
  for (i=1;i<=10;i+=1){
  	
      printf("\nIngrese la nota %d\n\n",i);
      scanf("%f",&nota);
      
      if (nota>=0 && nota<=20){
      suma=suma+nota; // suma+=nota
	  }else{
	  printf("\nNota incorrecta\n\n"); 
	  system("PAUSE");
	  exit (0);
	  }
           
                      if (nota>=10){
					  c1++;
					  }else{
					  c2++;
					  }
                      if (nota>max){
					  max=nota;
					  }
                      if (nota<min){
					  min=nota;
					  }
      }
      
      prom=suma/10;
      
      printf("\nEl promedio de las notas es:\n\n%.2f\n\n",prom);
      printf("\nLa cantidad de materias aprobadas son:\n\n%d\n\n",c1);
      printf("\nLa cantidad de materias reprobadas son:\n\n%d\n\n",c2);
      printf("\nLa mayor nota es:\n\n%.0f\n\n",max);
      printf("\nLa menor nota es:\n\n%.0f\n\n",min);
      
    system("PAUSE");
	return 0;
}
