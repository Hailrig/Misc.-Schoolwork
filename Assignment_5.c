/*
 ============================================================================
 Name        : Assignment 5
 Author      : Lucas Harvey 192742
 ============================================================================
 */

#include<stdio.h>


int compute(int *a, int *b, int m, int n){
	int lesser, result = 0;
	if (m >= n){
		lesser = n;
	} else {
		lesser = m;
	}
	int i;
	for (i = 0; i < lesser; ++i){
		result += a[i];
		result += b[i];
	}
	return result;
}

int main(void) {
	int array1Length, array2Length = 0;
	
	printf("Enter the length of the first array: ");
	scanf("%d", &array1Length);
	int array1[array1Length];
	int input =0;
	for (int i = 0; i < array1Length; i++){
		printf("Enter term %d: ", i+1);
		scanf("%d", &input);
		array1[i] = input;
	}

	printf("Enter the length of the second array: ");
	scanf("%d", &array2Length);
	int array2[array2Length];
	input = 0;
	for (int i = 0; i < array2Length; i++){
		printf("Enter term %d: ", i+1);
		scanf("%d", &input);
		array2[i] = input;
	}

	int (*p1)[array1Length] = &array1;
	int (*p2)[array2Length] = &array2;
	int result = compute(*p1, *p2, array1Length, array2Length);
	
	printf("Result: %i", result);
	return result;
}
