/*
problem_2.c 
    An example of unexpected behavior caused by reading past the end of a buffer
*/
#include <stdio.h>
#include <string.h>

int main(int argc, char** argv)
{
    // What is this string here?
    unsigned pointer [4] = { 0x53504f4f, 0x45564f20, 0x4f4c4652, 0x00002157 };
    char string[32];

    strncpy(string, "0123456789ABCDEF0123456789ABCDEF", 32);

    printf("The string is: %s\n", string);

    return 0;
}