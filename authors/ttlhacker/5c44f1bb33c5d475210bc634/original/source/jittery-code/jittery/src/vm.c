/*
 * vm.c
 *
 *  Created on: 14.01.2019
 *      Author: jonathan
 */


#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include "vm.h"
#include "jit/jit_common.h"
#define JITTERY_NEED_FUNCTION_TABLE
#include "hdrgen/vmhdr.h"


//VM REGISTERS-----------------------------------------------------------------
//SCRATCH: RAX, RDX, RDI, RSI, RCX (temp)
//VM REGS: R8, R9, R10, R11, R12, R13, R14, R15 (save to stack before calling C code!)
//VM PARAMS: RBX (preserved)
//VM RETURN VALUE: RBX


//Saves all VM registers on the stack.
//Clobbers RCX.
void __attribute__((naked)) jitcode_push_vm_registers() {
	asm(
			ASM_INTEL
			"pop rcx\n\t"
			"push r8\n\t"
			"push r9\n\t"
			"push r10\n\t"
			"push r11\n\t"
			"push r12\n\t"
			"push r13\n\t"
			"push r14\n\t"
			"push r15\n\t"
			"jmp rcx\n\t"
			ASM_ATT
	);
}

//Restores all VM registers from the stack.
//Clobbers RCX.
void __attribute__((naked)) jitcode_pop_vm_registers() {
	asm(
			ASM_INTEL
			"pop rcx\n\t"
			"pop r15\n\t"
			"pop r14\n\t"
			"pop r13\n\t"
			"pop r12\n\t"
			"pop r11\n\t"
			"pop r10\n\t"
			"pop r9\n\t"
			"pop r8\n\t"
			"jmp rcx\n\t"
			ASM_ATT
	);
}


//PROGRAM COUNTER--------------------------------------------------------------

uint32_t next_pc(struct vm_program_info *progInfo, uint32_t pc) {
	size_t exponentCount = progInfo->exponentCount;
	int *exponents = progInfo->exponents;
	if (exponentCount == 0) {
		return 0;
	}
	uint32_t nextLowestBit = 0;
	for (size_t i = 0; i < exponentCount; i++) {
		nextLowestBit ^= (pc >> (exponents[i] - 1)) & 1;
	}
	uint32_t mask = (1 << exponents[0]) - 1;
	return ((pc << 1) | nextLowestBit) & mask;
}



//JITTER-----------------------------------------------------------------------

//Leave the jitted code and return an error code
void __attribute((naked)) jitcode_bail_from_jit_code() {
	asm(
			ASM_INTEL
			"mov rbx, " EXPAND_AND_QUOTE(VM_EXEC_ERR) "\n\t"
			"ret\n\t"
			ASM_ATT
	);
}


//JITs the instruction PC points into. Returns the instruction to continue execution at.
void* vm_jit_emit_insn(struct vm_program_info *progInfo, uint8_t *pc) {
	//Compute the address of the word to jit
	struct vm_cmem_word *memWord = (struct vm_cmem_word *)(pc - sizeof(struct call_insn));
	uint32_t currentPc = cmem_offset_by_address(progInfo, memWord);

	//Call JIT function for the instruction encountered
	uint8_t opcode = memWord->insn.opcode;
	//printf("emit_insn(): #exponents=%lu nativePc=%p memWord=%p pc=%u op=%d\n", progInfo->exponentCount, pc, memWord, currentPc, opcode);
	if (opcode >= NELEMS(jit_funcs)) {
		//printf("Unknown opcode!\n");
		return jitcode_bail_from_jit_code;
	}
	uint8_t *pos = memWord->jitted_code;
	int jitResult = jit_funcs[opcode](progInfo, &memWord->insn, &pos, currentPc);
	if (jitResult != VM_OK) {
		//printf("JIT function error!\n");
		return jitcode_bail_from_jit_code;
	}

	//Emit jump to next instruction
	uint32_t nextPc = next_pc(progInfo, currentPc);
	generate_jump(&pos, (uint64_t)&progInfo->memory[nextPc]);

	//Retry executing the same word
	return memWord;
}

//Called by unjitted instructions to request being jitted.
void __attribute__((naked)) jitcode_jit_emit_insn_entry() {
	asm(
			ASM_INTEL
			"mov rdi, rbx\n\t" //vm_program_info
			"pop rsi\n\t" //pc (return address)
			PUSH_ALL() //Save regs (vm_jit_emit_insn clobbers them)
			"call vm_jit_emit_insn\n\t"
			POP_ALL() //Restore regs
			"jmp rax\n\t" //Jump back into jitted code
			ASM_ATT
	);
}

//Runs the program pointed to by mem. Returns VM_OK on success, something else on failure
uint64_t __attribute__((naked)) vm_start_jit_program(struct vm_program_info *progInfo, struct vm_cmem_word *mem) { // @suppress("No return")
	asm(
			ASM_INTEL
			"push rbx\n\t"
			PUSH_ALL() //The VM should not clobber registers
			"mov rbx, rdi\n\t" //rbx always holds a pointer to the program info
			"call rsi\n\t"
			POP_ALL() //Restore registers of the caller
			"mov rax, rbx\n\t" //Return value from the VM
			"pop rbx\n\t"
			"ret\n\t"
			ASM_ATT
	);
}


//Clears the jitted code at the given address. (Generates a call to the jitter function there)
void vm_clear_jit_code(struct vm_cmem_word *mem) {
	memset(mem->jitted_code, 0xCC, sizeof(mem->jitted_code));
	uint8_t *pos = mem->jitted_code;
	generate_call(&pos, (uint64_t)&jitcode_jit_emit_insn_entry);
}

//Writes the given instruction to mem[addr] and clears the jitted code there.
void vm_write_insn(struct vm_insn* insn, struct vm_cmem_word *mem, size_t addr) {
	mem[addr].insn = *insn;
	vm_clear_jit_code(&mem[addr]);
}


//ENTRY POINT------------------------------------------------------------------

//Runs the given VM program.
uint64_t vm_run_program(struct vm_insn *program, size_t size, int* exponents, size_t exponentCount) {
	size_t cmem_size_bytes = size * sizeof(struct vm_cmem_word);

	//Allocate code memory
	struct vm_cmem_word *code_memory = mmap(
			NULL,
			cmem_size_bytes,
			PROT_READ | PROT_WRITE | PROT_EXEC,
			MAP_PRIVATE | MAP_ANONYMOUS,
			-1, 0);

	if (code_memory == MAP_FAILED) {
		return VM_EXEC_ERR;
	}

	//Copy instructions into code memory
	for (size_t i = 0; i < size; i++) {
		vm_write_insn(program + i, code_memory, i);
	}

	//Run it
	struct vm_program_info program_info = {
			code_memory,
			exponents,
			exponentCount
	};

	//printf("Code memory: %p\n", code_memory);
	uint64_t result = vm_start_jit_program(&program_info, code_memory + 1);

	//Cleanup
	munmap(code_memory, cmem_size_bytes);
	return result;
}
