/*
 * jitfuncs.c
 *
 *  Created on: 14.01.2019
 *      Author: jonathan
 */

#include "../vm.h"
#include "../hdrgen/vmhdr.h"
#include "jit_common.h"
#pragma pack(1)

JITFUNC(NOP) {
	//Nothing to do here
	return VM_OK;
}


//Called by jitted code to perform a VMCALL operation.
//Uses the standard C x86_64 calling convention. (RDI, RSI, RDX; return in RAX)
//Takes the program info from RBX (where it should always be)
uint64_t __attribute__((naked)) jitcode_do_vmcall(uint64_t functionIndex, uint64_t src1, uint64_t src2) { // @suppress("No return")
	asm(
			ASM_INTEL
			PUSH_ALL()
			"mov rcx, rbx\n\t" //program info (4th argument to vm_dispatch_vmcall)
			"call vm_dispatch_vmcall\n\t"
			POP_ALL()
			"ret\n\t"
			ASM_ATT
	);
}


JITFUNC(VMCALL) {
	//mov rdi, imm
	//mov rsi, src1
	//mov rdx, src2
	//call jitcode_do_vmcall
	//mov dst, rax
	generate_load_const64(pos, REGNUM_RDI, IMM_VAL);
	generate_mov64(pos, REGNUM_RSI, REG_SRC1);
	generate_mov64(pos, REGNUM_RDX, REG_SRC2);
	generate_call(pos, (uint64_t)&jitcode_do_vmcall);
	generate_mov64(pos, REG_DST, REGNUM_RAX); //dst = jitcode_do_vmcall(imm, src1, src2)
	return VM_OK;
}


JITFUNC(VMQUIT) {
	//mov rbx, imm
	//ret
	generate_load_const64(pos, REGNUM_RBX, IMM_VAL);
	generate_1byte_insn(pos, RET_INSN);
	return VM_OK;
}


JITFUNC(INVALID_OP) {
	//This opcode is invalid.
	return VM_JIT_ERR;
}

