#include <stdio.h>
#include <string.h>
#include <stdint.h>
uint32_t h(const char*s){uint32_t a=0,i=0;uint8_t c=0;for(;*s;s++,i++){a+=(int8_t)*s;c^=*s;a+=c;c=~c;c>>=2;c^=(uint8_t)a;c^=(uint8_t)(i<<3);uint32_t d=c;d*=i;d*=~a;a^=d;}return a%0xffffff;}
int main(){char s[44]="Password!-----Hacker!---------Infinity!---!";
const char*al="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";int pos[]={9,10,11,12,13,21,22,23,24,25,26,27,28,29,39,40,41};
uint64_t x=88172645463325252ULL;
for(uint64_t n=0;;n++){for(int k=0;k<17;k++){x^=x<<13;x^=x>>7;x^=x<<17;s[pos[k]]=al[x%62];}
if(h(s)==0x209dd8){puts(s);return 0;}}}
