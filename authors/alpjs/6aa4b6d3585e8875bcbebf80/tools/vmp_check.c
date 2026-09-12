#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static inline uint8_t rol8(uint8_t x, unsigned n){ n&=7; return (uint8_t)((x<<n)|(x>>(8-n))); }
static void round_60B0(uint8_t *s, const uint8_t *k1, const uint8_t *k2, int a4, int a5){
  for(int i=0;i<4;i++){ uint8_t t=s[a5+i]; s[a5+i]=s[a5+i+4]; s[a5+i+4]=t; }
  uint8_t v13=s[a5+2];
  uint8_t v14=(uint8_t)(s[a5+7]+s[a5+1]);
  uint8_t v15=rol8((uint8_t)(s[a5+0]+s[a5+1]), s[a5+1]&7);
  s[a5+0]=k1[a4]^v15;
  s[a5+1]=rol8(v14, v13&7);
  uint8_t v16=s[a5+3];
  uint8_t v17=s[a5+4]&7;
  uint8_t v18=rol8((uint8_t)(v13-v16), v16&7);
  uint8_t v19=k2[a4]^v18;
  s[a5+2]=v19;
  s[a5+3]=k1[(a4+3)&7]^rol8((uint8_t)(v16+v19), v17);
}
static void mix_rol(uint8_t *s){
  for(int i=0;i<8;i++){ uint8_t L=s[i],R=s[8+i]; uint8_t r=rol8(R,L&7); s[8+i]=r; s[i]=rol8(L,r&7); }
}
static void rounds(uint8_t *s, const uint8_t *k1, const uint8_t *k2, int n){
  for(int i=0;i<n;i++){ round_60B0(s,k1,k2,i,0); round_60B0(s,k1,k2,i,8); mix_rol(s); }
}
static const uint8_t K1[8]={0x6c,0x9f,0x1a,0xb7,0x35,0xe3,0x48,0x7d};
static const uint8_t K2[8]={0x51,0x13,0x2b,0xc7,0x8e,0xb2,0x4f,0x63};
static const uint8_t K3[8]={0xc9,0x3b,0xbd,0x11,0x94,0x43,0xeb,0xdf};
static const uint8_t K4[8]={0x8d,0x4f,0x67,0x03,0xca,0xee,0x8b,0x9f};
static uint8_t C510[64], TAG[8], S4[16];
static void xor_dec(uint8_t *d,const uint8_t *s,int n){for(int i=0;i<n;i++)d[i]=s[i]^((0x6d+0x13*i)&0xff);}
static void precompute(void){
  memset(S4,0,16);
  for(int b=0;b<64;b+=16){ for(int i=0;i<16;i++) S4[i]^=C510[b+i]; rounds(S4,K1,K2,6); }
}
static void keystretch(const uint8_t *pw,int len,uint8_t mac[16]){
  uint8_t full[40]={0}; memcpy(full,pw,len); if(len<40) full[len]=0x80;
  uint8_t v8[16],v81[16],v82[8],v7[16]={0};
  memcpy(v8,full,16); memcpy(v81,full+16,16); memcpy(v82,full+32,8);
  for(int it=0;it<1000;it++){
    uint8_t st[16]; for(int i=0;i<16;i++) st[i]=v8[i]^v7[i];
    rounds(st,K1,K2,6);
    for(int i=0;i<16;i++) st[i]^=v81[i];
    rounds(st,K1,K2,6);
    uint8_t v78[16]={0}; memcpy(v78,v82,8);
    for(int i=0;i<16;i++) st[i]=v78[i]^st[i];
    rounds(st,K1,K2,6);
    memcpy(v7,st,16);
  }
  memcpy(mac,v7,16);
}
static int check_short(const uint8_t *pw,int len){
  uint8_t mac[16],st[16]; keystretch(pw,len,mac);
  memcpy(st,S4,16);
  for(int i=0;i<16;i++) st[i]^=mac[i]; rounds(st,K1,K2,6);
  rounds(st,K1,K2,6);
  uint8_t blk6[16]={0}; blk6[8]=0x80;
  for(int i=0;i<16;i++) st[i]^=blk6[i]; rounds(st,K1,K2,6);
  st[0]^=0xD1; st[1]^=0x5E; rounds(st,K3,K4,8);
  return memcmp(st,TAG,8)==0;
}
/* also general check for any length */
static int check_any(const uint8_t *pw,int len){
  uint8_t mac[16],st[16],full[40]={0};
  memcpy(full,pw,len); if(len<40) full[len]=0x80;
  keystretch(pw,len,mac);
  memcpy(st,S4,16);
  for(int i=0;i<16;i++) st[i]^=mac[i]; rounds(st,K1,K2,6);
  for(int i=0;i<16;i++) st[i]^=full[16+i]; rounds(st,K1,K2,6);
  uint8_t blk6[16]; memset(blk6,0,16); memcpy(blk6,full+32,8); blk6[8]=0x80;
  for(int i=0;i<16;i++) st[i]^=blk6[i]; rounds(st,K1,K2,6);
  st[0]^=0xD1; st[1]^=0x5E; rounds(st,K3,K4,8);
  return memcmp(st,TAG,8)==0;
}
int main(int argc,char**argv){
  FILE *f=fopen("/home/petik/Documents/crackme-writeups/authors/alpjs/6aa4b6d3585e8875bcbebf80/original/crackme.exe","rb");
  fseek(f,0x3C,SEEK_SET); uint32_t e; fread(&e,4,1,f);
  fseek(f,e+6,SEEK_SET); uint16_t nsec,optsz; fread(&nsec,2,1,f); fseek(f,e+20,SEEK_SET); fread(&optsz,2,1,f);
  uint32_t secoff=e+24+optsz,rp=0,va=0;
  for(int i=0;i<nsec;i++){ fseek(f,secoff+i*40+8,SEEK_SET); uint32_t vs,v,rs,r; fread(&vs,4,1,f);fread(&v,4,1,f);fread(&rs,4,1,f);fread(&r,4,1,f); if(v<=0xC510&&v+vs>0xC510){rp=r;va=v;} }
  uint8_t raw[64]; fseek(f,rp+(0xC510-va),SEEK_SET); fread(raw,64,1,f); xor_dec(C510,raw,64);
  fseek(f,rp+(0xC550-va),SEEK_SET); fread(raw,8,1,f); xor_dec(TAG,raw,8); fclose(f);
  precompute();
  if(argc>1){ printf("%s -> %s\n",argv[1], check_any((uint8_t*)argv[1],strlen(argv[1]))?"OK":"NO"); return 0; }
  const char *alph="abcdefghijklmnopqrstuvwxyz";
  int n=26; char pw[16];
  for(int len=1;len<=5;len++){
    fprintf(stderr,"len %d\n",len);
    memset(pw,0,sizeof pw); int idx[8]={0}; long long c=0;
    for(;;){
      for(int i=0;i<len;i++) pw[i]=alph[idx[i]];
      if(check_short((uint8_t*)pw,len)){ printf("FOUND %s\n",pw); return 0; }
      if((++c&0x3FFF)==0) fprintf(stderr,"\r%lld %s",c,pw);
      int k=0; for(;k<len;k++){ if(++idx[k]<n) break; idx[k]=0; } if(k==len) break;
    }
    fprintf(stderr,"\n");
  }
  puts("not found lowercase 1-5");
  return 1;
}
