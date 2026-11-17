#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
typedef uint32_t u32; typedef uint64_t u64;
static unsigned char T[256]; static const char cs[]="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
#define P 0x1000193u
typedef struct{u32 h;u32 k;}E;
static int cmp(const void*a,const void*b){u32 x=((E*)a)->h,y=((E*)b)->h;return x<y?-1:x>y;}
static u32 rol(u32 x,int n){return x<<n|x>>(32-n);}
static int full(unsigned char*b){
 u32 ecx=0xa5a5c3c3,eax=0;
 for(int i=0;i<8;i++){eax=(b[i]*0xa7+T[b[i]])^ecx;ecx=rol(eax,7)*0x85ebca77u;}
 if(eax!=0x73ac9527)return 0;
 u32 s=b[3]*b[0]+b[2]*b[1]+b[6]*b[5]+b[7]*b[4]; if(s%251!=0xd1)return 0;
 u32 x=((b[0]*0x1f+b[1]*0x11)^(b[2]|b[3]<<8))*0x10001u + (((b[4]*0xd+b[5]*0xb)^(b[6]|b[7]<<8)));
 if(x!=0x58dc8bd7u)return 0;
 u32 a=0;for(int i=0;i<8;i++)a=((a*0x83)+T[b[i]])&0xffff; return a==0x7583;}
int main(int argc,char**argv){FILE*f=fopen(argc>1?argv[1]:"T.bin","rb");fread(T,1,256,f);
 u32 Pinv=1;for(int i=0;i<5;i++)Pinv*=2-P*Pinv; // newton
 if(Pinv*P!=1){u32 y=P;for(int i=0;i<6;i++)y*=2-P*y;Pinv=y;}
 u32 N=62*62*62*62;E*e=malloc(sizeof(E)*N);u32 n=0;
 for(int a=0;a<62;a++)for(int b=0;b<62;b++)for(int c=0;c<62;c++)for(int d=0;d<62;d++){
  u32 h=0x811c9dc5;int ch[4]={a,b,c,d};for(int i=0;i<4;i++){h=(h^cs[ch[i]])*P;}
  e[n].h=h;e[n].k=a<<18|b<<12|c<<6|d;n++;}
 qsort(e,N,sizeof(E),cmp);
 u32 T8=0x53fdd974;
 for(int c8=0;c8<62;c8++){u32 h7=T8^cs[c8];u32 a7=h7*Pinv;
 for(int c7=0;c7<62;c7++){u32 h6=a7^cs[c7];u32 a6=h6*Pinv;
 for(int c6=0;c6<62;c6++){u32 h5=a6^cs[c6];u32 a5=h5*Pinv;
 for(int c5=0;c5<62;c5++){u32 h4=a5^cs[c5];
  E key={h4,0};E*p=bsearch(&key,e,N,sizeof(E),cmp);
  if(!p)continue;int i=p-e;while(i>0&&e[i-1].h==h4)i--;
  for(;i<(int)N&&e[i].h==h4;i++){unsigned char b[9];u32 k=e[i].k;
   b[0]=cs[k>>18&63];b[1]=cs[k>>12&63];b[2]=cs[k>>6&63];b[3]=cs[k&63];b[4]=cs[c5];b[5]=cs[c6];b[6]=cs[c7];b[7]=cs[c8];b[8]=0;
   if(full(b))printf("%s\n",b);}
 }}}}
}
