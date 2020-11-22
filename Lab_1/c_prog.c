#include <stdio.h>

int main(){
	int mul;

	mul = 1;

	for(int i=1; i<=10; i++){
		mul = i * mul;
	}

	printf("Result: %d\n", mul);

	return 0;
}
