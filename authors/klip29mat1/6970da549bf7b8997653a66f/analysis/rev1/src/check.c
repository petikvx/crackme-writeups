#include <string.h>
#include "check.h"

int verify(char *s)
{
    char buf[32];

    strcpy(buf, s);

    if (strlen(buf) != 8)
        return 0;

    if (buf[0] != 'R')
        return 0;

    if (buf[3] != '4')
        return 0;

    if (buf[7] != 'Z')
        return 0;

    if (strcmp(buf + 1, "3V4") == 0)
        return 1;

    return 0;
}
