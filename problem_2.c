#include <stdio.h>
#include <string.h>

int main(int argc, char** argv)
{
    unsigned pointer [4] = { 0x53504f4f, 0x45564f20, 0x4f4c4652, 0x00002157 };
    char string[32];

    strncpy(string, "0123456789ABCDEF0123456789ABCDEF", 32);

    printf("The string is: %s\n", string);

    return 0;
}