/*
 * jit_imm.c
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */


#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)


JITFUNC(LDI) {
	generate_load_const64(pos, REG_DST, (int64_t)IMM_VAL);
	return VM_OK;
}


JITFUNC(LDIU) {
	generate_load_const64(pos, REG_DST, (uint32_t)IMM_VAL);
	return VM_OK;
}


JITFUNC(LUI) {
	generate_load_const64(pos, REG_DST, ((uint64_t)IMM_VAL) << 32);
	return VM_OK;
}


//mov dst, src1
//mov rax, imm
//op dst, rax
#define ARITH_IMM_JITFUNC(name, op) JITFUNC(name) {\
	generate_mov64(pos, REG_DST, REG_SRC1);\
	generate_load_const64(pos, REGNUM_RAX, IMM_VAL);\
	generate_##op##64(pos, REG_DST, REGNUM_RAX);\
	return VM_OK;\
}

ARITH_IMM_JITFUNC(ADDI, add)
ARITH_IMM_JITFUNC(MULI, imul)
ARITH_IMM_JITFUNC(ORI, or)
ARITH_IMM_JITFUNC(ANDI, and)
ARITH_IMM_JITFUNC(XORI, xor)


//mov rax, src1
//op rax, imm
//mov dst, rax
#define ARITH_SHIFT_IMM_JITFUNC(name, op) JITFUNC(name) {\
	generate_mov64(pos, REGNUM_RAX, REG_SRC1);\
	generate_##op##_rax(pos, (uint8_t)IMM_VAL);\
	generate_mov64(pos, REG_DST, REGNUM_RAX);\
	return VM_OK;\
}

ARITH_SHIFT_IMM_JITFUNC(SHLI, shl)
ARITH_SHIFT_IMM_JITFUNC(SHRI, sar)
ARITH_SHIFT_IMM_JITFUNC(SHRIU, shr)
