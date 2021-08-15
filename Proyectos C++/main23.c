#include<stdio.h> 

int factorial(int n) 
{ 
	int r; 
	if (n==1) 
	{ 
	return 1; 
	} 
	r=n*factorial(n-1 ) ; 
	return (r ) ; 
} 
int main() 
{ 
	int n,res; 
	
	printf("***********************************n" ) ; 
	
	printf("tFactorial Recursivon" ) ; 
	
	printf("***********************************n" ) ; 
	
	printf("Dame un numero: " ) ; 
	
	scanf("%d",&n ) ; 
	
	res=factorial(n ) ; 
	
	printf("El factorial de %d es: %d",n,res ) ; 
	system ("pause");
	
return 0; 
} 
