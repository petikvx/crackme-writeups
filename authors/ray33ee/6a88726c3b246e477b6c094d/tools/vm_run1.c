#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

static uint32_t T0[8]={1,3,0,2,0,0,0,0};
static uint32_t T1[16]={3,8,1,14,6,12,9,0,11,4,15,7,13,2,10,5};

static uint32_t fold_r(uint32_t a, uint32_t s){
  while(s<=0x1F){ a^=a>>s; s*=2; } return a;
}
static uint32_t fold_l(uint32_t a, uint32_t s){
  while(s<=0x1F){ a^=a<<s; s*=2; } return a;
}
static uint32_t dec_imm(uint32_t enc, uint32_t pc){
  uint32_t v2=fold_r(enc,8);
  uint32_t v3=fold_l(1700297411u*v2-29109u,5);
  return fold_r(1650947975u*v3,7)-41943u-pc;
}
static uint32_t dec_jmp(uint32_t a){ return T1[a&0xF]+(a&0xFFFFFFF0u); }
static uint32_t dec_slot(uint32_t a, uint32_t pc){
  if(a>0xF) return (pc%9)^(T1[a&0xF]+(a&0xFFFFFFF0u));
  return (pc%9)^(T0[a&3]+(a&0xFFFFFFFCu));
}
static uint32_t dec_frame(uint32_t a, uint32_t pc){
  return ((a&0xFFFFFFFCu)+T0[a&3])^(pc&3);
}
static inline int32_t i32(uint32_t u){ return (int32_t)u; }

int main(int argc, char **argv){
  const char *binpath = argc>1?argv[1]:"original/program.bin";
  FILE *f=fopen(binpath,"rb"); if(!f){perror(binpath);return 1;}
  fseek(f,0,2); long sz=ftell(f); rewind(f);
  uint32_t *words=malloc(sz); if(fread(words,1,sz,f)!=(size_t)sz){perror("fread");return 1;}
  fclose(f);
  size_t nw=sz/4;
  if(nw%2){fprintf(stderr,"odd word count\n");return 1;}
  size_t N=nw/2;
  uint32_t *ops=malloc(N*4), *imms=malloc(N*4), *dec=malloc(N*4);
  for(size_t i=0;i<N;i++){ ops[i]=words[2*i]; imms[i]=words[2*i+1]; }
  free(words);
  for(uint32_t pc=0;pc<N;pc++){
    uint32_t op=ops[pc], arg=imms[pc];
    if(op==4) dec[pc]=dec_imm(arg,pc);
    else if(op==0x14||op==0x28) dec[pc]=dec_jmp(arg);
    else if(op==0||op==1||op==2||op==3) dec[pc]=dec_slot(arg,pc);
    else if(op==0x29||op==0x2A) dec[pc]=dec_frame(arg,pc);
    else dec[pc]=arg;
  }

  uint32_t *OP=calloc(0x100000,4), *CS=calloc(0x100000,4), *HP=calloc(0x100000,4);
  uint32_t osp=0,csp=0,fp=0,pc=0;
  unsigned long steps=0;
  int verbose = getenv("VERBOSE")!=NULL;
  int dump_cmp = getenv("DUMPCMP")!=NULL;
  FILE *logf = getenv("TRACE")?fopen(getenv("TRACE"),"w"):NULL;

  while(pc<N){
    steps++;
    uint32_t op=ops[pc], d=dec[pc];
    switch(op){
      case 4: OP[osp++]=d; pc++; break;
      case 0: OP[osp++]=CS[(uint32_t)(fp+1+i32(d))]; pc++; break;
      case 1: CS[(uint32_t)(fp+1+i32(d))]=OP[--osp]; pc++; break;
      case 2: OP[osp++]=CS[(uint32_t)(fp-i32(d)-2)]; pc++; break;
      case 3: CS[(uint32_t)(fp-i32(d)-2)]=OP[--osp]; pc++; break;
      case 5: CS[csp++]=OP[--osp]; pc++; break;
      case 0x14: if(OP[--osp]==0) pc=d; else pc++; break;
      case 0x28:
        CS[csp++]=pc+1; pc=d; break;
      case 0x2A: {
        CS[csp]=fp; uint32_t nc=csp+1; fp=csp; csp=d+nc; pc++; break;
      }
      case 0x29: {
        uint32_t v35=fp; fp=CS[fp]; v35--; uint32_t ret=CS[v35]; csp=v35-d; pc=ret; break;
      }
      case 0x64: { uint32_t a=OP[--osp]; OP[osp-1]&=a; pc++; break; }
      case 0x65: { uint32_t a=OP[--osp]; OP[osp-1]|=a; pc++; break; }
      case 0x68: {
        uint32_t sh=OP[--osp];
        OP[osp-1]=(sh>0x1F)?0:(OP[osp-1]<<sh);
        pc++; break;
      }
      case 0x69: {
        uint32_t sh=OP[--osp];
        OP[osp-1]=(sh>0x1F)?0:(OP[osp-1]>>sh);
        pc++; break;
      }
      case 0x96: OP[osp-1]=~OP[osp-1]; pc++; break;
      case 0xC8: OP[osp]=OP[osp-2]; osp++; pc++; break;
      case 0xCA: OP[osp]=OP[osp-1]; osp++; pc++; break;
      case 0xC9: {
        uint32_t a=OP[osp-3], b=OP[osp-2], c=OP[osp-1];
        OP[osp-3]=c; OP[osp-2]=a; OP[osp-1]=b; pc++; break;
      }
      case 0xCB: {
        uint32_t a=OP[osp-4], b=OP[osp-3], c=OP[osp-2], e=OP[osp-1];
        OP[osp-4]=b; OP[osp-3]=c; OP[osp-2]=e; OP[osp-1]=a; pc++; break;
      }
      case 0x1F4: printf("%d\n",(int)i32(OP[--osp])); fflush(stdout); pc++; break;
      case 0x1F7: {
        uint32_t base=OP[--osp];
        uint32_t ln=HP[base];
        for(uint32_t i=0;i<ln;i++) if(HP[base+1+i]<=0x7F) putchar(HP[base+1+i]);
        fflush(stdout); pc++; break;
      }
      case 0x1F8: {
        uint32_t maxlen=OP[--osp], base=OP[--osp], nread=0; int c;
        while(1){
          c=getchar();
          if(c==-1||c=='\n'||nread==maxlen) break;
          HP[base+1+nread++]=(uint32_t)c;
        }
        HP[base]=nread;
        if(verbose) fprintf(stderr,"READ base=%u len=%u\n",base,nread);
        if(logf){
          fprintf(logf,"READ steps=%lu pc=%u base=%u len=%u\n",steps,pc,base,nread);
        }
        pc++; break;
      }
      case 0x1F6: { uint32_t val=OP[--osp], addr=OP[--osp]; HP[addr]=val; pc++; break; }
      case 0x1F5: OP[osp-1]=HP[OP[osp-1]]; pc++; break;
      default: fprintf(stderr,"unk op %u at %u\n",op,pc); return 2;
    }
    if(dump_cmp && op==0x14){
      /* after JZ already consumed; hard. instead dump when AND/OR of equality-ish */
    }
    /* Heuristic: after HLOAD of password chars, track equality via NOT+OR MBA? */
    if(logf && (op==0x1F5 || op==0x1F6) && steps>0){
      /* too noisy */
    }
  }
  if(logf){ fprintf(logf,"DONE steps=%lu osp=%u top=%u\n",steps,osp,osp?OP[osp-1]:0); fclose(logf); }
  fprintf(stderr,"steps=%lu osp=%u top=%u\n",steps,osp,osp?OP[osp-1]:0);
  return osp? (int)OP[osp-1] : 0;
}
