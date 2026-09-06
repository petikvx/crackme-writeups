/*
 * jit_mem.c
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */


#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)


//mov rax, imm
//add rax, src1
//mov rcx, src2
//mov [rax * 8], rcx
JITFUNC(STORE) {
	generate_load_const64(pos, REGNUM_RAX, IMM_VAL);
	generate_add64(pos, REGNUM_RAX, REG_SRC1);
	generate_mov64(pos, REGNUM_RCX, REG_SRC2);
	WRITE_SINGLEARRAY_INSN(pos, 0x48, 0x89, 0x0C, 0xC5, 0x00, 0x00, 0x00, 0x00); //mov [rax * 8], rcx
	return VM_OK;
}

//mov rax, imm
//add rax, src1
//mov rax, [rax * 8]
//mov dst, rax
JITFUNC(LOAD) {
	generate_load_const64(pos, REGNUM_RAX, IMM_VAL);
	generate_add64(pos, REGNUM_RAX, REG_SRC1);
	WRITE_SINGLEARRAY_INSN(pos, 0x48, 0x8B, 0x04, 0xC5, 0x00, 0x00, 0x00, 0x00); //mov rax, [rax *  8]
	generate_mov64(pos, REG_DST, REGNUM_RAX);
	return VM_OK;
}
