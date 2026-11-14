/* Portage C fidèle de crackme.cpp (pas de g++ sur la machine). Heure injectée : argv[2]=minuteOfDay argv[3]=yday(1..366) ; sinon heure locale. */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
static uint32_t rotl32(uint32_t x,int r){return (x<<r)|(x>>(32-r));}
static uint32_t fnv(const void*d,size_t n){const uint8_t*p=d;uint32_t h=2166136261u;for(size_t i=0;i<n;i++){h^=p[i];h*=16777619u;}return h;}
static int bv(char c){if(c>='0'&&c<='9')return c-'0';if(c>='A'&&c<='Z')return 10+c-'A';if(c>='a'&&c<='z')return 10+c-'a';return -1;}
static int blk(const char*s,uint16_t*o){uint32_t v=0;for(int i=0;i<4;i++){int d=bv(s[i]);if(d<0)return 0;v=v*36u+d;}if(v>0xFFFF)return 0;*o=v;return 1;}
int main(int argc,char**argv){
  const char*s=argv[1];uint16_t a,b,c;
  if(strlen(s)!=14||s[4]!='-'||s[9]!='-'){puts("loose");return 0;}
  if(!(blk(s,&a)&&blk(s+5,&b)&&blk(s+10,&c))){puts("loose");return 0;}
  int mod,yd;
  if(argc>3){mod=atoi(argv[2]);yd=atoi(argv[3]);}
  else{time_t n=time(0);struct tm*t=localtime(&n);mod=t->tm_hour*60+t->tm_min;yd=t->tm_yday+1;}
  for(int d=-1;d<=1;d++){
    int m=mod+d; if(m<0)m+=1440; if(m>=1440)m-=1440;
    uint32_t x=(uint32_t)m^((uint32_t)yd<<16)^0xC0FFEE11u;
    x=rotl32(x,7)+0x9E3779B9u;
    uint32_t h=fnv(&x,4); uint32_t tok=rotl32(h^0xA5A5A5A5u,11);
    uint16_t A=(tok^0xBEEF)&0xFFFF;
    uint16_t B=((tok>>16)+(uint32_t)(m*7))&0xFFFF;
    uint16_t C=((uint32_t)A+B+(uint32_t)(yd*13))&0xFFFF;
    if(a==A&&b==B&&c==C&&((a^b)%97u)==((uint32_t)m%97u)){puts("won");return 0;}
  }
  puts("loose");return 0;}
