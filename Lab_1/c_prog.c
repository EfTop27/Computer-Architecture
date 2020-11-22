#include <stdio.h>

int main(){
	int mul;

	mul = 1;

	for(int i=1; i<=10; i++){  //Multiplies i with mul in for loop
		mul = i * mul;
	}

	printf("Result of multiplication is: %d\n", mul);

	return 0;
}
