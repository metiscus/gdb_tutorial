#include "common/module.h"
#include <stdio.h>

int main(int argc, char** argv)
{
	module_initialize();

	module_crash_2();
	return 0;
}