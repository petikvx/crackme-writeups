#include <stdint.h>
#include <string.h>
typedef uint64_t u64;
#define ROL(x,n) (((x)<<((n)&63))|((x)>>((64-(n))&63)))
#define A 0x5851F42D4C957F2DULL
#define B 0x14057B7EF767814FULL
static inline u64 lcg(u64 x){return x*A+B;}
static u64 aegis_hash(const unsigned char*p,size_t n){
  static const u64 K[4]={0x243F6A8885A308D3ULL,0x13198A2E03707344ULL,0xA4093822299F31D0ULL,0x082EFA98EC4E6C89ULL};
  u64 v8=(0x9E3779B97F4A7C15ULL*n)^0xDDEBA5ECAFEF00DULL, sl[4]={0,0,0,0};
  size_t i=0,k=0;
  while(n-i){ size_t m=n-i<8?n-i:8; u64 c=0; memcpy(&c,p+i,m);
    if(k<4) sl[k]=c; else { u64 y=ROL(c,17),a=sl[k&3],s=(y^a)+2*(a&y); sl[k&3]=~(s^a)-2*(s&c&a);} 
    i+=m;k++; }
  u64 s=v8,r[4];
  for(int j=0;j<4;j++){ if(sl[j]) r[j]=sl[j]; else {s=lcg(s); r[j]=s;} }
  u64 r4=K[0],r5=K[1],r6=K[2],r7=K[3];
  u64 r0=r[0],r1=r[1],r2=r[2],r3=r[3];
  static const u64 C[4]={0x9e377900,0x9e378901,0x9e379902,0x9e37a903};
  for(int j=0;j<4;j++){
    r0^=r5; r0+=C[j]; r0=ROL(r0,7); r0+=r6;
    r1=lcg(r1); r1^=r7; r1*=0x9e3779b1ULL; r1=ROL(r1,13);
    r2+=r0; r2=ROL(r2,17); r2-=r1;
    r3=lcg(r3); r3^=r2; r3=ROL(r3,29); r3*=0x85ebca77ULL;
    r0^=r3;
  }
  (void)r4;
  r0^=r1; r0^=r2;
  u64 v=lcg(r0^ROL(r1,32)^ROL(r2,16)^ROL(r3,48));
  v=lcg(v^ROL(v,17)); v=lcg(v^ROL(v,17));
  return v^ROL(v,17);
}
