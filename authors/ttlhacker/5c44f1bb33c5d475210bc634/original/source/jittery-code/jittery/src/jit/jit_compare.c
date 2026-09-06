/*
 * jit_compare.c
 *
 *  Created on: 18.01.2019
 *      Author: jonathan
 */


#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)


//cmp src1, src2
//setcc al
//movzx rax, al
//mov dst, rax
#define MAKE_COMP_REG_REG(name, setccOp) JITFUNC(name) {\
	generate_cmp64(pos, REG_SRC1, REG_SRC2);\
	generate_setcc_al(pos, setccOp);\
	generate_movzx_rax_al(pos);\
	generate_mov64(pos, REG_DST, REGNUM_RAX);\
	return VM_OK;\
}

MAKE_COMP_REG_REG(SEQ, SETCC_SETE);
MAKE_COMP_REG_REG(SNEQ, SETCC_SETNE);
MAKE_COMP_REG_REG(SLT, SETCC_SETL);
MAKE_COMP_REG_REG(SLET, SETCC_SETLE);
MAKE_COMP_REG_REG(SLTU, SETCC_SETB);
MAKE_COMP_REG_REG(SLETU, SETCC_SETBE);

//mov rax, imm
//cmp src1, rax
//setcc al
//movzx rax, al
//mov dst, rax
#define MAKE_COMP_REG_IMM(name, setccOp) JITFUNC(name) {\
	generate_load_const64(pos, REGNUM_RAX, IMM_VAL);\
	generate_cmp64(pos, REG_SRC1, REGNUM_RAX);\
	generate_setcc_al(pos, setccOp);\
	generate_movzx_rax_al(pos);\
	generate_mov64(pos, REG_DST, REGNUM_RAX);\
	return VM_OK;\
}

MAKE_COMP_REG_IMM(SEQI, SETCC_SETE);
MAKE_COMP_REG_IMM(SNEQI, SETCC_SETNE);
MAKE_COMP_REG_IMM(SLTI, SETCC_SETL);
MAKE_COMP_REG_IMM(SLETI, SETCC_SETLE);
MAKE_COMP_REG_IMM(SGTI, SETCC_SETG);
MAKE_COMP_REG_IMM(SGETI, SETCC_SETGE);

