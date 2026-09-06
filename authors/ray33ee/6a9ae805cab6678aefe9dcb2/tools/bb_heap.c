#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#define NEED(op) ((op)==4||(op)==6||(op)==7||(op)==20||(op)==40||(op)==41||(op)==42||(op)==0xCD||(op)==0xCE)
static uint32_t T0[8]={1,3,0,2,0,0,0,0};
static uint32_t T1[16]={3,8,1,14,6,12,9,0,11,4,15,7,13,2,10,5};
static uint32_t fold_r(uint32_t a, uint32_t s){ while(s<=0x1F){ a^=a>>s; s*=2; } return a; }
static uint32_t fold_l(uint32_t a, uint32_t s){ while(s<=0x1F){ a^=a<<s; s*=2; } return a; }
static uint32_t dec_imm(uint32_t enc, uint32_t pc){
  uint32_t v2=fold_r(enc,8), v3=fold_l(1700297411u*v2-29109u,5);
  return fold_r(1650947975u*v3,7)-41943u-pc;
}
static uint32_t dec_jmp(uint32_t a){ return T1[a&0xF]+(a&0xFFFFFFF0u); }
static uint32_t dec_slot(uint32_t a, uint32_t pc){
  if(a>0xF) return (pc%9)^(T1[a&0xF]+(a&0xFFFFFFF0u));
  return (pc%9)^(T0[a&3]+(a&0xFFFFFFFCu));
}
static uint32_t dec_frame(uint32_t a, uint32_t pc){ return ((a&0xFFFFFFFCu)+T0[a&3])^(pc&3); }
static inline int32_t i32(uint32_t u){ return (int32_t)u; }
static uint32_t *ops,*imms,*dec,*OP,*CS,*HP; static size_t N;

uint32_t run_func(uint32_t entry, uint32_t a0, uint32_t a1){
  /* don't clear HP */
  memset(OP,0,0x10000); memset(CS,0,0x10000);
  uint32_t osp=0,csp=0,fp=0,pc=entry; unsigned long steps=0;
  CS[csp++]=a0; CS[csp++]=a1; CS[csp++]=999999u;
  while(pc<N && steps<5000000ul){
    steps++; uint32_t op=ops[pc], d=dec[pc];
    switch(op){
      case 4: OP[osp++]=d; pc++; break;
      case 6: OP[osp++]=CS[(uint32_t)(fp+i32(d))]; pc++; break;
      case 7: CS[(uint32_t)(fp+i32(d))]=OP[--osp]; pc++; break;
      case 5: CS[csp++]=OP[--osp]; pc++; break;
      case 0x14: if(OP[--osp]==0) pc=d; else pc++; break;
      case 0x28: CS[csp++]=pc+1; pc=d; break;
      case 0x2A: { CS[csp]=fp; uint32_t nc=csp+1; fp=csp; csp=d+nc; pc++; break; }
      case 0x29: {
        if(CS[fp-1]==999999u) return osp?OP[osp-1]:0xffffffffu;
        uint32_t v35=fp; fp=CS[fp]; v35--; uint32_t ret=CS[v35]; csp=v35-d; pc=ret; break;
      }
      case 0xC6: { uint32_t a=OP[--osp]; OP[osp-1]=~(a&OP[osp-1]); pc++; break; }
      case 0xC7: {
        int32_t sh=i32(OP[--osp]); uint32_t val=OP[osp-1];
        if(sh>=0) OP[osp-1]=(sh<=0x1F)?(val<<sh):0;
        else { uint32_t v18=(uint32_t)(~sh); OP[osp-1]=(v18<=0x1F)?(val>>v18):0; }
        pc++; break;
      }
      case 0xCD: { uint32_t a=OP[osp-1]; OP[osp-1]=OP[osp-d-1]; OP[osp-d-1]=a; pc++; break; }
      case 0xCE: OP[osp]=OP[osp-d-1]; osp++; pc++; break;
      case 0x1F5: OP[osp-1]=HP[OP[osp-1]]; pc++; break;
      case 0x1F6: { uint32_t val=OP[--osp], addr=OP[--osp]; HP[addr]=val; pc++; break; }
      default: return 0xfffffffeu;
    }
  }
  return 0xfffffffdU;
}

/* map char like 340200 */
uint32_t mapc(uint32_t c){
  if(c>='0'&&c<='9') return c-'0';
  if((c>='A'&&c<='Z')||(c>='a'&&c<='z')) return ((c&0x1f)%16)+9;
  return 0;
}

int main(int argc, char **argv){
  FILE *f=fopen("original/program.bin","rb"); fseek(f,0,2); long sz=ftell(f); rewind(f);
  uint32_t *words=malloc(sz); fread(words,1,sz,f); fclose(f);
  size_t nw=sz/4; ops=malloc(nw*4); imms=malloc(nw*4); dec=malloc(nw*4); N=0;
  for(size_t i=0;i<nw;){ uint32_t op=words[i++],imm=0; if(NEED(op)) imm=words[i++]; ops[N]=op; imms[N++]=imm; }
  free(words);
  for(uint32_t pc=0;pc<N;pc++){
    uint32_t op=ops[pc],arg=imms[pc];
    if(op==4) dec[pc]=dec_imm(arg,pc);
    else if(op==0x14||op==0x28) dec[pc]=dec_jmp(arg);
    else if(op==6||op==7) dec[pc]=dec_slot(arg,pc);
    else if(op==0x29||op==0x2A) dec[pc]=dec_frame(arg,pc);
    else dec[pc]=arg;
  }
  OP=calloc(0x100000,4); CS=calloc(0x100000,4); HP=calloc(0x100000,4);

  const char *pw = argc>1?argv[1]:"ABCD1234";
  /* pack password: indices 0,1,2,3 and 5,6,7,8 */
  uint32_t nib[9]={0};
  for(int i=0; pw[i] && i<9; i++) nib[i]=mapc((uint8_t)pw[i]);
  uint32_t w0=(nib[0]<<12)|(nib[1]<<8)|(nib[2]<<4)|nib[3];
  uint32_t w1=(nib[5]<<12)|(nib[6]<<8)|(nib[7]<<4)|nib[8];
  printf("pw=%s w0=0x%X w1=0x%X\n", pw, w0, w1);

  /* setup linked structure */
  HP[274]=261; HP[261]=264; HP[264]=w0; HP[265]=w1;
  /* rest 266-273 = 0 already */

  /* CS args order: from live, top before call was 274, then val
     so last pushed = 274 = fp-2, earlier = val = fp-3
     cs_args = [val, 274] */
  uint32_t args[]={30572,13102,42843,38330,57076,49472,23004,18228,15347,46166};
  for(int i=0;i<10;i++){
    uint32_t r=run_func(121137, args[i], 274);
    printf("f(%u)=%u %s\n", args[i], r, r==251?"OK":"");
  }

  /* try to find formula: maybe (w0 * arg + w1) & 0xffff or similar */
  printf("formula hunt for arg=30572:\n");
  uint32_t a=30572, r=run_func(121137, a, 274);
  printf("r=%u w0*a=%u w0^a=%u (w0*a+w1)&0xffff=%u (a%%(w0+1))=%u\n",
    r, w0*a, w0^a, (w0*a+w1)&0xffff, w0?a%(w0+1):0);
  return 0;
}
