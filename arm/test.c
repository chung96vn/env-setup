#include <stdio.h>

int main(){
    char name[0x30];
    puts("Testing");
    printf("Enter name: ");
    fflush(stdout);
    fgets(name, 0x30, stdin);
    printf("Hello %s\n", name);
    puts("Bye~~");
}
