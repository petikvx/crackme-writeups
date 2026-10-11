#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
static uint32_t f1(const char*s,int n){uint32_t a=0;for(int i=0;i<n;i++){int c=s[i];uint32_t e=((uint32_t)c^0xbad0beef)+a;e|=(uint32_t)c&0xfefefefe;e=~e;a=e*(uint32_t)(c%13);}return a;}
static uint32_t f2(const char*s,int n){uint32_t a=0;for(int i=0;i<n;i++){int c=s[i];uint32_t e=(((uint32_t)c^0xb00bface)+a)&((uint32_t)c|0xfefefefe);e+=(c*3492)%17;a=e*(uint32_t)(c%5+5);}return a;}
static uint32_t f3(const char*s,int n){uint32_t a=0;for(int i=0;i<n;i++){int c=s[i];uint32_t e=((uint32_t)c^0xbad0beef)+a;e^=(uint32_t)c|0xdeadc0de;a=e*(uint32_t)c;}return a;}
int main(int argc,char**argv){int L=atoi(argv[1]);long long tot=1;for(int i=0;i<L;i++)tot*=95;
#pragma omp parallel for schedule(dynamic,65536)
for(long long k=0;k<tot;k++){char s[8];long long t=k;for(int i=0;i<L;i++){s[i]=32+t%95;t/=95;}
 if(f3(s,L)==0xA1F55297u&&f1(s,L)==0x0CEAC848u&&f2(s,L)==0x18B3DD62u){s[L]=0;printf("FOUND len%d [%s]\n",L,s);fflush(stdout);}}
return 0;}
