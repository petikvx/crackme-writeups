/*
 * jit_arith.c
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */

#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)

//mov rax, src1
//op rax, src2
//mov dst, rax
#define MAKE_ARITH_JITFUNC(name, op) JITFUNC(name) {\
	generate_mov64(pos, REGNUM_RAX, REG_SRC1);\
	generate_##op##64(pos, REGNUM_RAX, REG_SRC2);\
	generate_mov64(pos, REG_DST, REGNUM_RAX);\
	return VM_OK;\
}


MAKE_ARITH_JITFUNC(ADD, add)
MAKE_ARITH_JITFUNC(SUB, sub)
MAKE_ARITH_JITFUNC(MUL, imul)


JITFUNC(NEG) {
	//mov dst, src1
	//neg dst
	generate_mov64(pos, REG_DST, REG_SRC1);
	generate_neg64(pos, REG_DST);
	return VM_OK;
}


MAKE_ARITH_JITFUNC(AND, and)
MAKE_ARITH_JITFUNC(OR, or)
MAKE_ARITH_JITFUNC(XOR, xor)


