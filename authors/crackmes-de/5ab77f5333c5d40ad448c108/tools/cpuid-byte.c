#include <stdio.h>
#include <cpuid.h>
int main(){unsigned s=0,a,b,c,d;for(unsigned i=0;i<5;i++){__cpuid_count(i,0,a,b,c,d);s+=a;}printf("0x%02x\n",s&0xff);}
