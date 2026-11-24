#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#define R(x,b) (((x)>>(64-b))|((x)<<(b)))
typedef struct{uint64_t v0,v1,v2,v3;}S;
#define SIP(s) do{ s.v0+=s.v1; s.v1=R(s.v1,13); s.v1^=s.v0; s.v0=R(s.v0,32); s.v2+=s.v3; s.v3=R(s.v3,16); s.v3^=s.v2; \
 s.v0+=s.v3; s.v3=R(s.v3,21); s.v3^=s.v0; s.v2+=s.v1; s.v1=R(s.v1,17); s.v1^=s.v2; s.v2=R(s.v2,32);}while(0)
static const uint64_t K[3][2]={{0x0f0e0d0c0b0a0908ULL,0x0102030405060708ULL},{0xdeadbeefcafebabeULL,0x0102030405060708ULL},{0xfeedc0deaabbccddULL,0x0807060504030201ULL}};
static S init(int i,uint64_t m){S s;s.v0=K[i][0]^0x736f6d6570736575ULL;s.v1=K[i][1]^0x646f72616e646f6dULL;s.v2=K[i][0]^0x6c7967656e657261ULL;s.v3=K[i][1]^0x7465646279746573ULL;
 s.v3^=m;SIP(s);SIP(s);s.v0^=m;return s;}
static uint64_t fin(S s,uint64_t b){s.v3^=b;SIP(s);SIP(s);s.v0^=b;s.v2^=0xff;SIP(s);SIP(s);SIP(s);SIP(s);return s.v0^s.v1^s.v2^s.v3;}
int main(int argc,char**argv){
 const char*cs="abcdefghijklmnopqrstuvwxyz0123456789";int n=36;
 uint32_t T=0xc2b293feU; long np=atol(argv[1]);
 #pragma omp parallel for schedule(dynamic,16)
 for(long p=0;p<np;p++){
  char pre[8];long q=p;for(int i=0;i<8;i++){pre[i]=cs[q%n];q/=n;}
  uint64_t m;memcpy(&m,pre,8);
  S s0=init(0,m),s1=init(1,m),s2=init(2,m);
  for(int a=0;a<n;a++)for(int b=0;b<n;b++)for(int c=0;c<n;c++)for(int d=0;d<n;d++){
   uint64_t t=(uint64_t)cs[a]|(uint64_t)cs[b]<<8|(uint64_t)cs[c]<<16|(uint64_t)cs[d]<<24|12ULL<<56;
   uint64_t h1=fin(s0,t),h2=fin(s1,t),h3=fin(s2,t);
   uint32_t f=(uint32_t)(h1>>32)^(uint32_t)h1^(uint32_t)h2^(uint32_t)h3;
   if(f==T){printf("%.8s%c%c%c%c\n",pre,cs[a],cs[b],cs[c],cs[d]);fflush(stdout);}
  }}
}
