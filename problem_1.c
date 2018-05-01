/*
problem_1.c 
    A very basic example of a null pointer dereference causing a crash.
*/
#include <stdio.h>

int main(int argc, char** argv)
{
    int *pointer = 0;

    printf("The number is: %d\n", *pointer);

    return 0;
}