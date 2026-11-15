#include <stdio.h>
#include <stdint.h>
typedef uint32_t u;
static u ror(u x,int n){return (x>>n)|(x<<(32-n));}
int main(){
 for(int n=0;n<=4;n++){
  long tot=1; for(int k=0;k<n;k++)tot*=256;
  for(long v=0;v<tot;v++){
   int c[4];long t=v;for(int k=0;k<4;k++){c[k]=(signed char)(t&255);t>>=8;}
   u e=0x1337;int i=0;int P[]={1,2,3,4,1,3,2,1,4,3,1,2,4};
   for(int j=0;j<13;j++){int op=P[j];
    if(op==1){if(i<n){e+=((c[i]^0x55)*7);i++;}}
    else if(op==2)e=ror(e,29);
    else if(op==3)e^=0xa5a5a5a5;
    else e+=(e^0x12345678)>>2;}
   if(e==0x6f3a9b21){printf("n=%d %02x %02x %02x %02x\n",n,c[0]&255,c[1]&255,c[2]&255,c[3]&255);}
  }}
}
