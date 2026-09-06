/*
 * vm.h
 *
 *  Created on: 14.01.2019
 *      Author: jonathan
 */

#ifndef VM_H_
#define VM_H_

#include <stdlib.h>
#include <stdint.h>

#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

#define VM_OK 0
#define VM_JIT_ERR 1
#define VM_EXEC_ERR 2

#pragma pack(push, 1)
struct vm_insn {
	uint8_t opcode;
	uint8_t dst;
	uint8_t src1;
	uint8_t src2;
	int32_t imm;
};
struct vm_cmem_word {
	uint8_t jitted_code[56];
	struct vm_insn insn;
};
struct vm_program_info {
	struct vm_cmem_word *memory;
	int* exponents;
	size_t exponentCount;
};
#pragma pack(pop)

uint64_t vm_run_program(struct vm_insn *program, size_t size, int* exponents, size_t exponentCount);

//Computes the next program counter value for the given current PC.
uint32_t next_pc(struct vm_program_info *progInfo, uint32_t pc);

//Computes the offset of the instruction at the given offset in the code memory. ("Address to PC value")
static inline uint32_t cmem_offset_by_address(struct vm_program_info *progInfo, struct vm_cmem_word* address) {
	return (uint32_t)(address - progInfo->memory);
}

//Saves all VM registers on the stack.
//Clobbers RCX.
//ONLY CALL THIS FROM ASSEMBLER CODE.
void jitcode_push_vm_registers();

//Restores all VM registers from the stack.
//Clobbers RCX.
//ONLY CALL THIS FROM ASSEMBLER CODE.
void jitcode_pop_vm_registers();

//Clears the jitted code in the given memory word.
void vm_clear_jit_code(struct vm_cmem_word *mem);


#define QUOTE(str) #str
#define EXPAND_AND_QUOTE(str) QUOTE(str)
#define LABEL(name) #name ":\n"
#define ASM_INTEL ".intel_syntax noprefix\n\t"
#define ASM_ATT ".att_syntax prefix\n\t"
#define PUSH_ALL() "call jitcode_push_vm_registers\n\t"
#define POP_ALL() "call jitcode_pop_vm_registers\n\t"


#endif /* VM_H_ */
