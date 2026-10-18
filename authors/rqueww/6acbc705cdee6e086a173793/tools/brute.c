/* brute.c : force brute du mot de passe (<= 8 caractères) contre le hash cible.
   gcc -O3 -fopenmp -o brute brute.c ; ./brute <charset> <lenmin> <lenmax> */
#include <stdio.h>
#include <stdlib.h>
#include "aegis-hash.h"
#define T 0x2A8FADFD62AD902EULL
int main(int c,char**v){
  const char*cs=v[1]; int L=strlen(cs),a=atoi(v[2]),b=atoi(v[3]);
  for(int n=a;n<=b;n++){
    unsigned long long tot=1; for(int i=0;i<n;i++) tot*=L;
    unsigned long long hi=1; int sp=n>2?2:n; for(int i=0;i<sp;i++) hi*=L;
    unsigned long long lo=tot/hi;
    #pragma omp parallel for schedule(dynamic)
    for(long long h=0;h<(long long)hi;h++){
      unsigned char p[9]={0}; unsigned long long t=h;
      for(int i=0;i<sp;i++){p[i]=cs[t%L];t/=L;}
      for(unsigned long long l=0;l<lo;l++){
        unsigned long long u=l; for(int i=sp;i<n;i++){p[i]=cs[u%L];u/=L;}
        if(aegis_hash(p,n)==T){printf("FOUND %.*s\n",n,p);fflush(stdout);}
      }
    }
    fprintf(stderr,"len %d done\n",n);
  }
}
