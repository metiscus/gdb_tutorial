#include <math.h>

float scaled_magnitude_v1(float scale, float x, float y, float z)
{
	return scale * sqrtf(x*x+y*y+z*z);
}

float scaled_magnitude_v2(float scale, double x, double y, double z)
{
	return ((double)scale) * sqrt(x*x+y*y+z*z);
}

__asm__(".symver scaled_magnitude_v1,scaled_magnitude@VERS_1.0");
__asm__(".symver scaled_magnitude_v2,scaled_magnitude@@VERS_2.0");
