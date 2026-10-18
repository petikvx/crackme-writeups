#include <stdio.h>
#include "aegis-hash.h"
int main(){ char l[256]; while(fgets(l,256,stdin)){ size_t n=strlen(l); while(n&&(l[n-1]=='\n'||l[n-1]=='\r'))l[--n]=0;
 if(aegis_hash((unsigned char*)l,n)==0x2A8FADFD62AD902EULL){printf("FOUND %s\n",l);} } return 0;}
