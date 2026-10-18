#include <stdio.h>
#include "check.h"

int main(int argc, char **argv)
{
  if (argc < 2)
  {
    printf("usage: %s <key>\n", argv[0]);
    return 0;
  }

  if (verify(argv[1]))
    printf("ACCESS GRANTED\n");
  else
    printf("ACCESS DENIED\n");

  return 0;
}
