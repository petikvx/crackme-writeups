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

int main(int argc, char **argv){
  const char *binpath = argc>1?argv[1]:"original/program.bin";
  FILE *f=fopen(binpath,"rb"); if(!f){perror(binpath);return 1;}
  fseek(f,0,2); long sz=ftell(f); rewind(f);
  uint32_t *words=malloc(sz); if(fread(words,1,sz,f)!=(size_t)sz){perror("fread");return 1;} fclose(f);
  size_t nw=sz/4;
  uint32_t *ops=malloc(nw*4), *imms=malloc(nw*4), *dec=malloc(nw*4);
  size_t N=0;
  for(size_t i=0;i<nw;){
    uint32_t op=words[i++], imm=0;
    if(NEED(op)){ if(i>=nw) break; imm=words[i++]; }
    ops[N]=op; imms[N]=imm; N++;
  }
  free(words);
  for(uint32_t pc=0;pc<N;pc++){
    uint32_t op=ops[pc], arg=imms[pc];
    if(op==4) dec[pc]=dec_imm(arg,pc);
    else if(op==0x14||op==0x28) dec[pc]=dec_jmp(arg);
    else if(op==6||op==7) dec[pc]=dec_slot(arg,pc);
    else if(op==0x29||op==0x2A) dec[pc]=dec_frame(arg,pc);
    else dec[pc]=arg;
  }

  uint32_t *OP=calloc(0x100000,4), *CS=calloc(0x100000,4), *HP=calloc(0x100000,4);
  uint32_t osp=0,csp=0,fp=0,pc=0; unsigned long steps=0;
  int reads=0;
  uint32_t user_base=0, user_len=0, pass_base=0, pass_len=0;
  FILE *logf=fopen("analysis/vmtrace.txt","w");

  /* count static calls */
  fprintf(logf, "N=%zu\n", N);

  while(pc<N){
    steps++;
    uint32_t op=ops[pc], d=dec[pc];
    switch(op){
      case 4: OP[osp++]=d; pc++; break;
      case 6: OP[osp++]=CS[(uint32_t)(fp+i32(d))]; pc++; break;
      case 7: CS[(uint32_t)(fp+i32(d))]=OP[--osp]; pc++; break;
      case 5: CS[csp++]=OP[--osp]; pc++; break;
      case 0x14: {
        uint32_t cond=OP[--osp];
        if(reads>=2 && logf && steps < 50000000){
          /* only log JZ when condition involves interesting values - skip flood */
        }
        if(cond==0) pc=d; else pc++;
        break;
      }
      case 0x28:
        if(reads>=2){
          fprintf(logf,"CALL s=%lu from=%u to=%u osp=%u args:", steps, pc, d, osp);
          for(int i=0;i<4 && i<(int)osp;i++) fprintf(logf," %u", OP[osp-1-i]);
          fprintf(logf,"\n");
        }
        CS[csp++]=pc+1; pc=d; break;
      case 0x2A: { CS[csp]=fp; uint32_t nc=csp+1; fp=csp; csp=d+nc; pc++; break; }
      case 0x29: {
        if(reads>=2){
          fprintf(logf,"RET  s=%lu at=%u to=%u osp=%u top=%u\n", steps, pc, CS[fp>0?fp-1:0], osp, osp?OP[osp-1]:0);
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
      case 0x1F4: printf("%d",(int)i32(OP[--osp])); fflush(stdout); pc++; break;
      case 0x1F7: {
        uint32_t ln=OP[--osp], base=OP[--osp];
        for(uint32_t i=0;i<ln;i++) if(HP[base+i]<=0x7F) putchar(HP[base+i]);
        fflush(stdout); pc++; break;
      }
      case 0x1F8: {
        uint32_t maxlen=OP[osp-1], base=OP[osp-2], nread=0; int c;
        while(1){ c=getchar(); if(c==-1||c=='\n') break; if(nread<maxlen) HP[base+nread++]=(uint32_t)c; }
        fprintf(logf,"READ s=%lu pc=%u base=%u len=%u '", steps, pc, base, nread);
        for(uint32_t i=0;i<nread;i++) fputc(HP[base+i],logf);
        fprintf(logf,"'\n");
        if(reads==0){ user_base=base; user_len=nread; }
        else { pass_base=base; pass_len=nread; }
        reads++; OP[osp-1]=nread; pc++; break;
      }
      case 0x1F6: { uint32_t val=OP[--osp], addr=OP[--osp]; HP[addr]=val; pc++; break; }
      case 0x1F5: {
        uint32_t addr=OP[osp-1];
        OP[osp-1]=HP[addr];
        if(reads>=2 && ((addr>=user_base && addr<user_base+user_len) || (addr>=pass_base && addr<pass_base+pass_len))){
          fprintf(logf,"HLOAD s=%lu pc=%u addr=%u val=%u\n", steps, pc, addr, OP[osp-1]);
        }
        pc++; break;
      }
      default: fprintf(stderr,"unk %u\n",op); return 2;
    }
  }
  fprintf(logf,"DONE steps=%lu\n", steps);
  fclose(logf);
  fprintf(stderr,"steps=%lu\n",steps);
  return 0;
}
