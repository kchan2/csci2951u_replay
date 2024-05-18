#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

#define BUF_SIZE 64
#define BUF_LEN (BUF_SIZE << 1)

void order()
{
    char name[20];
    ssize_t len = read(0, name, 20);
    if (len == -1)
    {
        exit(1);
    }
}

void message()
{
    // vulnerable function with buffer overflow
    char message[BUF_SIZE];
    ssize_t len = read(0, message, BUF_LEN);
    if (len == -1)
    {
        exit(2);
    }
}

int main()
{
    // 2 distinct calls in the same function
    order();
    // redirect destination
    printf("Ordered\n");
    message();
    return 0;
}