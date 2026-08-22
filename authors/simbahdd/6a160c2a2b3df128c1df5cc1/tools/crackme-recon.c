/* Clone minimal de SimbaHDD's CRACKME (même I/O / strcmp).
 * Pour preuve Wine quand l'original MinGW plante en SEH.
 *
 *   x86_64-w64-mingw32-gcc -o ../analysis/crackme-recon.exe crackme-recon.c
 */
#include <stdio.h>
#include <string.h>

char input[100];

int main(void)
{
    printf("Enter password: ");
    scanf("%99s", input);
    if (strcmp(input, "simba123") == 0)
        printf("CORRECT!");
    else
        printf("WRONG!");
    getchar();
    return 0;
}
