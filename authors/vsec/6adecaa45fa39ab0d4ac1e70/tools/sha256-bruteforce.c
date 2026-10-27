#include <openssl/sha.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <omp.h>
static unsigned char T[32];
int main(int argc,char**argv){
  const char*hex="9419f86b97bd379906be72ea80517c075a499d0db0a37499132c2d203cc21420";
  for(int i=0;i<32;i++){unsigned v;sscanf(hex+2*i,"%2x",&v);T[i]=v;}
  const char*cs=argv[1]; int L=atoi(argv[2]); int n=strlen(cs);
  for(int len=1;len<=L;len++){
    unsigned long long tot=1; for(int i=0;i<len;i++) tot*=n;
    #pragma omp parallel for schedule(static)
    for(long long idx=0;idx<(long long)tot;idx++){
      char b[16]; unsigned long long x=idx;
      for(int i=0;i<len;i++){b[i]=cs[x%n];x/=n;}
      unsigned char h[32]; {SHA256_CTX c;SHA256_Init(&c);SHA256_Update(&c,b,len);SHA256_Final(h,&c);}
      if(!memcmp(h,T,32)){b[len]=0;printf("FOUND %s\n",b);fflush(stdout);exit(0);}
    }
    fprintf(stderr,"len %d done\n",len);
  }
  return 0;}
