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
  uint32_t *words=malloc(sz); fread(words,1,sz,f); fclose(f);
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
  FILE *logf=fopen("analysis/vmtrace2.txt","w");
  uint32_t expect[16]; int nexpect=0;

  while(pc<N){
    steps++;
    uint32_t op=ops[pc], d=dec[pc];
    switch(op){
      case 4: OP[osp++]=d; pc++; break;
      case 6: OP[osp++]=CS[(uint32_t)(fp+i32(d))]; pc++; break;
      case 7: CS[(uint32_t)(fp+i32(d))]=OP[--osp]; pc++; break;
      case 5: CS[csp++]=OP[--osp]; pc++; break;
      case 0x14: if(OP[--osp]==0) pc=d; else pc++; break;
      case 0x28: {
        if(reads>=2 && (d==121137 || d==340200 || d==118917 || d==123 || d==67715 || d==1023634 || d==984547 || d==969115)){
          fprintf(logf,"CALL to=%u s=%lu from=%u CS_args:", d, steps, pc);
          /* args are below where return will be pushed: CS[csp-1], CS[csp-2], ... */
          for(int i=0;i<6 && i<(int)csp;i++) fprintf(logf," %u", CS[csp-1-i]);
          fprintf(logf," OP:");
          for(int i=0;i<4 && i<(int)osp;i++) fprintf(logf," %u", OP[osp-1-i]);
          fprintf(logf,"\n");
        }
        CS[csp++]=pc+1; pc=d; break;
      }
      case 0x2A: { CS[csp]=fp; uint32_t nc=csp+1; fp=csp; csp=d+nc; pc++; break; }
      case 0x29: {
        if(reads>=2){
          uint32_t entry_guess = 0;
          /* log returns from interesting funcs: when ret addr is known */
          uint32_t retaddr = CS[fp-1];
          if(osp){
            /* detect by current pc ranges */
            if(pc>=121137 && pc<340200)
              fprintf(logf,"RET from~121137 area pc=%u s=%lu top=%u ret=%u\n", pc, steps, OP[osp-1], retaddr);
            else if(pc>=340200 && pc<373000)
              fprintf(logf,"RET from~340200 pc=%u s=%lu top=%u\n", pc, steps, OP[osp-1]);
          }
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
        fprintf(logf,"READ base=%u len=%u\n", base, nread);
        reads++; OP[osp-1]=nread; pc++; break;
      }
      case 0x1F6: { uint32_t val=OP[--osp], addr=OP[--osp]; HP[addr]=val; pc++; break; }
      case 0x1F5: {
        /* special: at 943119 after call - log comparison pair */
        if(pc==943119){
          fprintf(logf,"CMP_EXPECT hload_addr_will_be=%u call_ret_on_stack=%u\n", OP[osp-1], osp>=2?OP[osp-2]:0);
        }
        OP[osp-1]=HP[OP[osp-1]];
        if(pc==943119){
          fprintf(logf,"CMP_PAIR got=%u expect=%u idx_related fp12\n", osp>=2?OP[osp-2]:0, OP[osp-1]);
          if(nexpect<16) expect[nexpect++]=OP[osp-1];
        }
        pc++; break;
      }
      default: fprintf(stderr,"unk %u\n",op); return 2;
    }
  }
  fprintf(logf,"EXPECTS:");
  for(int i=0;i<nexpect;i++) fprintf(logf," %u", expect[i]);
  fprintf(logf,"\nDONE steps=%lu\n", steps);
  fclose(logf);
  fprintf(stderr,"steps=%lu nexpect=%d\n",steps,nexpect);
  return 0;
}
