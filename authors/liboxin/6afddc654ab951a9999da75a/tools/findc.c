#include <stdio.h>
#include <stdint.h>
#include <string.h>
static uint32_t fm(uint32_t C,uint32_t x){uint32_t h=C^x;h*=0x85ebca6b;h^=h>>13;h*=0xc2b2ae35;h^=h>>16;return h;}
int main(){
 FILE*f=fopen("analysis/live.bin","rb");uint8_t img[0x28000];fread(img,1,sizeof img,f);
 uint8_t*tb=img+0x4b20;uint32_t*tab=(uint32_t*)(img+0x4a60);
 for(uint64_t C=0;C<(1ULL<<32);C++){
  uint32_t seed=fm(C,0xc0ffee),r8=0x11111111;int ok=1;
  uint32_t w[48];
  for(int i=0;i<48&&ok;i++){w[i]=fm(C,seed^r8)^tab[i];r8-=0x61c88647;
   if(i%2==0){ // instr start
     uint8_t*b=(uint8_t*)&w[i];  }
  }
  int sc=0;for(int i=0;i<48;i+=2)if(tb[w[i]&0xff])sc++;ok=sc>=12;if(ok){
   int good=1;for(int i=0;i<48;i+=2){uint8_t op=w[i]&0xff;if(!tb[op]&&0)good=0;}
   printf("C=%08llx\n",(unsigned long long)C);}
 }}
