#include "module.h"

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void module_initialize()
{
    printf("Module Initialize called!\n");
    // initializing time
    srand(time(0));
}

void module_crash_1()
{
    int *pointer = 0;

    printf("The number is: %d\n", *pointer);
}

static void module_crash_2a ()
{
        int *pointer = 0;

        printf("The number is: %d\n", *pointer);
}

static void module_crash_2b ()
{
    int *pointer = 0;

    printf("The number is: %d\n", *pointer);
}

static void module_crash_2c ()
{
    int *pointer = 0;

    printf("The number is: %d\n", *pointer);
}

void module_crash_2()
{
    void (*subcrash[3])() = {module_crash_2a, module_crash_2b, module_crash_2c};
    int crash_num = rand() % 3;
    subcrash[crash_num]();
}

