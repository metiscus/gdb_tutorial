#include <stdio.h>
#include "common/support.h"

int main(int argc, char** argv)
{
	float x = 1;
	float y = 1;
	float z = 1;
	float scale = 1;
	
	float result = scaled_magnitude(scale, x, y, z);
	printf("scaled_magnitude(%f, %f, %f, %f) = %f\n", scale, x, y, z, result);
	
	return 0;
}
