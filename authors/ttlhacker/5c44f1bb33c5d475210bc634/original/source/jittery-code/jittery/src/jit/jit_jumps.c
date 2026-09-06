/*
 * jit_jumps.c
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */


#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)


#define JUMP_TARGET ((uint64_t)&info->memory[IMM_VAL])


JITFUNC(J) {
	generate_jump(pos, JUMP_TARGET);
	return VM_OK;
}


JITFUNC(JR) {
	//mov rax, src1
	//mov rcx, sizeof(struct vm_cmem_word)
	//mul rax, rcx
	//mov rcx, info->memory
	//add rax, rcx
	//jmp rax
	generate_mov64(pos, REGNUM_RAX, REG_SRC1);
	generate_load_const64(pos, REGNUM_RCX, sizeof(struct vm_cmem_word));
	generate_imul64(pos, REGNUM_RAX, REGNUM_RCX);
	generate_load_const64(pos, REGNUM_RCX, (uint64_t)info->memory);
	generate_add64(pos, REGNUM_RAX, REGNUM_RCX);
	generate_jump_rax(pos);
	return VM_OK;
}


JITFUNC(JZ) {
	//movabs rax, target
	//test src1, src1
	//jnz next:
	//jmp rax
	//next:
	//...
	generate_load_const64(pos, REGNUM_RAX, JUMP_TARGET);
	generate_test64(pos, REG_SRC1, REG_SRC1);
	WRITE_SINGLEARRAY_INSN(pos, 0x75, 0x02, 0xFF, 0xE0); //jnz next; jmp rax; next:
	return VM_OK;
}


JITFUNC(JNZ) {
	//movabs rax, target
	//test src1, src1
	//jz next:
	//jmp rax
	//next:
	//...
	generate_load_const64(pos, REGNUM_RAX, JUMP_TARGET);
	generate_test64(pos, REG_SRC1, REG_SRC1);
	WRITE_SINGLEARRAY_INSN(pos, 0x74, 0x02, 0xFF, 0xE0); //jz next; jmp rax; next:
	return VM_OK;
}


JITFUNC(RETADR) {
	//mov dst, pcPlus2
	uint32_t pcPlus2 = currentPc;
	pcPlus2 = next_pc(info, pcPlus2);
	pcPlus2 = next_pc(info, pcPlus2);
	generate_load_const64(pos, REG_DST, pcPlus2);
	return VM_OK;
}
