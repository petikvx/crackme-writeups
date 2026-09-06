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

int main(){
  FILE *f=fopen("original/program.bin","rb"); fseek(f,0,2); long sz=ftell(f); rewind(f);
  uint32_t *words=malloc(sz); fread(words,1,sz,f); fclose(f);
  size_t nw=sz/4,N=0; uint32_t *ops=malloc(nw*4),*imms=malloc(nw*4),*dec=malloc(nw*4);
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
  uint32_t *OP=calloc(0x100000,4),*CS=calloc(0x100000,4),*HP=calloc(0x100000,4);
  uint32_t osp=0,csp=0,fp=0,pc=0; unsigned long steps=0;
  int phase=0; /* 0 before reads, 1 after, 2 after first 121137 */
  int n121=0;
  uint32_t rets[16];

  while(pc<N){
    steps++; uint32_t op=ops[pc], d=dec[pc];
    switch(op){
      case 4: OP[osp++]=d; pc++; break;
      case 6: OP[osp++]=CS[(uint32_t)(fp+i32(d))]; pc++; break;
      case 7: {
        int off=i32(d); uint32_t val=OP[--osp];
        if(n121>=10 && (off>=20 && off<=40))
          fprintf(stderr,"STORE fp%+d=%u pc=%u\n", off, val, pc);
        CS[(uint32_t)(fp+off)]=val; pc++; break;
      }
      case 5: CS[csp++]=OP[--osp]; pc++; break;
      case 0x14: {
        uint32_t cond=OP[--osp];
        if(n121>=10 && n121<=11)
          fprintf(stderr,"JZ cond=%u ->%u pc=%u\n", cond, d, pc);
        if(cond==0) pc=d; else pc++; break;
      }
      case 0x28:
        if(d==121137) n121++;
        CS[csp++]=pc+1; pc=d; break;
      case 0x2A: { CS[csp]=fp; uint32_t nc=csp+1; fp=csp; csp=d+nc; pc++; break; }
      case 0x29: {
        if(CS[fp-1]==943118){
          rets[n121-1]=osp?OP[osp-1]:0;
          fprintf(stderr,"RET121[%d]=%u\n", n121-1, rets[n121-1]);
        }
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
      case 0x1F4: OP[--osp]; pc++; break;
      case 0x1F7: {
        uint32_t ln=OP[--osp], base=OP[--osp];
        fprintf(stderr,"PRINT base=%u ln=%u '", base, ln);
        for(uint32_t i=0;i<ln;i++){ if(HP[base+i]<=0x7F){ fputc(HP[base+i],stderr); putchar(HP[base+i]); }}
        fprintf(stderr,"'\n"); fflush(stdout); pc++; break;
      }
      case 0x1F8: {
        uint32_t maxlen=OP[osp-1], base=OP[osp-2], nread=0; int c;
        while(1){ c=getchar(); if(c==-1||c==10) break; if(nread<maxlen) HP[base+nread++]=(uint32_t)c; }
        OP[osp-1]=nread; pc++; break;
      }
      case 0x1F6: { uint32_t val=OP[--osp], addr=OP[--osp]; HP[addr]=val; pc++; break; }
      case 0x1F5: {
        if(n121>=10 && pc>943117 && pc<943117+500)
          fprintf(stderr,"HLOAD addr=%u val=%u pc=%u stack_top_below=%u\n", OP[osp-1], HP[OP[osp-1]], pc, osp>=2?OP[osp-2]:0);
        OP[osp-1]=HP[OP[osp-1]]; pc++; break;
      }
      default: return 2;
    }
  }
  return 0;
}
