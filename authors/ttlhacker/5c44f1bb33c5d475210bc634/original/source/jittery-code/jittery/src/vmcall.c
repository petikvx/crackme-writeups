/*
 * vmcall.c
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */

#include <stdio.h>
#include <string.h>
#include "vmcall.h"
#include "vm.h"

#include "arch/vmcallnums.jh"


//Writes the char in the first argument to the console. The second argument is ignored.
//dst = 0
uint64_t vmcall_putchar(uint64_t charToWrite, uint64_t unused, struct vm_program_info *info) {
	putchar((unsigned char)charToWrite);
	fflush(stdout);
	return 0;
}

//dst = getchar()
uint64_t vmcall_getchar(uint64_t unused1, uint64_t unused2, struct vm_program_info *info) {
	return getchar();
}

//Allocates size uint64_t's and returns a pointer to them.
//Pointers in the VM are represented by multiples of uint64_t, not bytes.
uint64_t vmcall_malloc(uint64_t size, uint64_t unused, struct vm_program_info *info) {
	return ((uint64_t)aligned_alloc(sizeof(uint64_t), size * sizeof(uint64_t))) / sizeof(uint64_t);
}

//free(src1 * 8)
//dst = 0
uint64_t vmcall_free(uint64_t mem, uint64_t unused, struct vm_program_info *info) {
	free((void*)(mem * sizeof(uint64_t)));
	return 0;
}

//dst = cmem[src1].imm
uint64_t vmcall_load_const(uint64_t cmemAdr, uint64_t unused, struct vm_program_info *info) {
	return (int64_t)info->memory[cmemAdr].insn.imm;
}

//dst = src1 + 1 (LFSR)
uint64_t vmcall_pcinc(uint64_t cmemAdr, uint64_t unused, struct vm_program_info *info) {
	return next_pc(info, (uint32_t)cmemAdr);
}

uint64_t vmcall_printnum(uint64_t num, uint64_t unused, struct vm_program_info *info) {
	printf("%ld\n", num);
	return 0;
}


#define CHECK_EQUAL_SIZES_COMPILE_TIME(type1, type2) {int typeSizeCheck[sizeof(type1) == sizeof(type2) ? 1 : -1];}
#pragma GCC diagnostic ignored "-Wunused-variable"

//dst = cmem[src1]
uint64_t vmcall_loadcmem(uint64_t loadPc, uint64_t unused, struct vm_program_info *info) {
	CHECK_EQUAL_SIZES_COMPILE_TIME(struct vm_insn, uint64_t);
	struct vm_insn *insn = &info->memory[loadPc].insn;
	uint64_t cmemValue;
	memcpy(&cmemValue, insn, sizeof(uint64_t));
	return cmemValue;
}

//cmem[src1] = src2; dst = 0
uint64_t vmcall_storecmem(uint64_t storePc, uint64_t value, struct vm_program_info *info) {
	CHECK_EQUAL_SIZES_COMPILE_TIME(struct vm_insn, uint64_t);
	vm_clear_jit_code(&info->memory[storePc]);
	struct vm_insn *insn = &info->memory[storePc].insn;
	memcpy(insn, &value, sizeof(uint64_t));
	return 0;
}

typedef uint64_t (*vmcall_handler)(uint64_t src1, uint64_t src2, struct vm_program_info *info);

static vmcall_handler vmcall_handlers[] = {
		[VC_PUTCHAR] = vmcall_putchar,
		[VC_GETCHAR] = vmcall_getchar,
		[VC_MALLOC] = vmcall_malloc,
		[VC_FREE] = vmcall_free,
		[VC_LOAD_CONST] = vmcall_load_const,
		[VC_PCINC] = vmcall_pcinc,
		[VC_PRINTNUM] = vmcall_printnum,
		[VC_LOADCMEM] = vmcall_loadcmem,
		[VC_STORECMEM] = vmcall_storecmem
};

//Calls the handler for the given function index with the given arguments.
uint64_t vm_dispatch_vmcall(uint64_t functionIndex, uint64_t src1, uint64_t src2, struct vm_program_info *info) {
	if (functionIndex >= NELEMS(vmcall_handlers)) {
		return 0;
	}

	return vmcall_handlers[functionIndex](src1, src2, info);
}
