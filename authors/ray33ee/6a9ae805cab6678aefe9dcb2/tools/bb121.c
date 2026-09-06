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
static uint32_t *ops,*imms,*dec; static size_t N;
static uint32_t *OP,*CS,*HP;

uint32_t run_func(uint32_t entry, uint32_t a0, uint32_t a1){
  memset(OP,0,0x100000*4); memset(CS,0,0x100000*4); /* keep HP? no */
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
        if(CS[fp-1]==999999u) { fprintf(stderr,"steps=%lu\n",steps); return osp?OP[osp-1]:0xffffffffu; }
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
      default: fprintf(stderr,"bad op %u pc=%u\n",op,pc); return 0xfffffffeu;
    }
  }
  fprintf(stderr,"timeout steps=%lu pc=%u\n",steps,pc); return 0xfffffffdU;
}

int main(){
  FILE *f=fopen("original/program.bin","rb"); fseek(f,0,2); long sz=ftell(f); rewind(f);
  uint32_t *words=malloc(sz); fread(words,1,sz,f); fclose(f);
  size_t nw=sz/4; ops=malloc(nw*4); imms=malloc(nw*4); dec=malloc(nw*4); N=0;
  for(size_t i=0;i<nw;){ uint32_t op=words[i++],imm=0; if(NEED(op)){imm=words[i++];} ops[N]=op; imms[N++]=imm; }
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
  uint32_t r;
  r=run_func(121137, 30572, 274); printf("f(30572,274)=%u\n", r);
  r=run_func(121137, 274, 30572); printf("f(274,30572)=%u\n", r);
  r=run_func(121137, 0, 274); printf("f(0,274)=%u\n", r);
  r=run_func(121137, 1, 274); printf("f(1,274)=%u\n", r);
  r=run_func(121137, 251, 274); printf("f(251,274)=%u\n", r);
  r=run_func(121137, 274, 251); printf("f(274,251)=%u\n", r);
  return 0;
}
