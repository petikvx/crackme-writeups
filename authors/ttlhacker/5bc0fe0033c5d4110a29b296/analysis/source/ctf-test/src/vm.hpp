/*
 * vm.hpp
 *
 *  Created on: 02.10.2018
 *      Author: jonathan
 */

#ifndef VM_HPP_
#define VM_HPP_

#include <ucontext.h>
#include <stdint.h>

#pragma pack(push, 1)
struct vm_insn {
	uint64_t imm;
	uint8_t opcode;
	uint8_t dest_reg;
	uint8_t source_reg_1;
	uint8_t source_reg_2;
};
#pragma pack(pop)

//NOP
#define VM_OP_NOP 0

//Arithmetic instructions
#define VM_OP_ADD 1
#define VM_OP_SUB 2
#define VM_OP_MUL 3
#define VM_OP_DIV 4
#define VM_OP_MOD 5
#define VM_OP_RSHIFT 6
#define VM_OP_LSHIFT 7
#define VM_OP_NEG 8

//Load constant
#define VM_OP_LOAD_CONST 9

//Memory instructions
#define VM_OP_READ_UBYTE 10
#define VM_OP_READ_SBYTE 11
#define VM_OP_READ_2UBYTE 12
#define VM_OP_READ_2SBYTE 13
#define VM_OP_READ_4UBYTE 14
#define VM_OP_READ_4SBYTE 15
#define VM_OP_READ_8BYTE 16

#define VM_OP_WRITE_BYTE 17
#define VM_OP_WRITE_2BYTE 18
#define VM_OP_WRITE_4BYTE 19
#define VM_OP_WRITE_8BYTE 20

//Stack operations
#define VM_OP_PUSH 21
#define VM_OP_PUSH_CONST 22
#define VM_OP_POP 23

//Logic instructions
#define VM_OP_MOV 24
#define VM_OP_OR 25
#define VM_OP_AND 26
#define VM_OP_XOR 27
#define VM_OP_NOT 28

//Comparison operations
#define VM_OP_SET_IF_SMALLER 29
#define VM_OP_SET_IF_SMALLER_OR_EQUAL 30
#define VM_OP_SET_IF_GREATER 31
#define VM_OP_SET_IF_GREATER_OR_EQUAL 32
#define VM_OP_SET_IF_EQUAL 33
#define VM_OP_SET_IF_INEQUAL 34
#define VM_OP_SET_IF_EQUAL_CONST 35
#define VM_OP_SET_IF_INEQUAL_CONST 36
#define VM_OP_LOGICAL_INVERT 37

//Conditional jumps
#define VM_OP_JUMP_IF_ZERO 38
#define VM_OP_JUMP_IF_NOT_ZERO 39

//CALL/RET
#define VM_OP_CALL 40
#define VM_OP_RET 41
#define VM_OP_RET_IF_SET 42
#define VM_OP_RET_IF_ZERO 43

//Arithmetic/logic operations with constants
#define VM_OP_ADD_CONST 44
#define VM_OP_RSHIFT_CONST 45
#define VM_OP_LSHIFT_CONST 46
#define VM_OP_OR_CONST 47
#define VM_OP_AND_CONST 48
#define VM_OP_XOR_CONST 49



//Register numbers for x64, taken from ucontext.h
#ifdef __x86_64__
#define _R8			0
#define _R9			1
#define _R10		2
#define _R11		3
#define _R12		4
#define _R13		5
#define _R14		6
#define _R15		7
#define _RDI		8
#define _RSI		9
#define _RBP		10
#define _RBX		11
#define _RDX		12
#define _RAX		13
#define _RCX		14
#define _RSP		15
#define _RIP		16
#define _EFL		17
#define _CSGSFS		18
#define _ERR		19
#define _TRAPNO		20
#define _OLDMASK	21
#define _CR2		22
#else
#error("Unsupported architecture")
#endif


#define QUOTE(str) #str
#define EXPAND_AND_QUOTE(str) QUOTE(str)


//Macros for creating the custom instructions (in an asm block)
#define MAKE_INSN(opcode, dest_reg, source_reg_1, source_reg_2, imm) \
	"ud2\n\t"\
	".quad " EXPAND_AND_QUOTE(imm) "\n\t"\
	".byte " EXPAND_AND_QUOTE(opcode) "\n\t"\
	".byte " EXPAND_AND_QUOTE(dest_reg) "\n\t"\
	".byte " EXPAND_AND_QUOTE(source_reg_1) "\n\t"\
	".byte " EXPAND_AND_QUOTE(source_reg_2) "\n\t"

#define MAKE_INSN_DAB(opcode, dest, source_1, source_2)\
	MAKE_INSN(opcode, dest, source_1, source_2, 0)

#define MAKE_INSN_DA(opcode, dest, source)\
	MAKE_INSN(opcode, dest, source, 0, 0)

#define MAKE_INSN_DAC(opcode, dest, source, c)\
	MAKE_INSN(opcode, dest, source, 0, c)

#define MAKE_INSN_DC(opcode, dest, c)\
	MAKE_INSN(opcode, dest, 0, 0, c)

#define MAKE_INSN_AC(opcode, source, c)\
	MAKE_INSN(opcode, 0, source, 0, c)

#define MAKE_INSN_AB(opcode, source1, source2)\
	MAKE_INSN(opcode, 0, source1, source2, 0)

#define MAKE_INSN_ABC(opcode, source1, source2, c)\
	MAKE_INSN(opcode, 0, source1, source2, c)

#define MAKE_INSN_C(opcode, c)\
	MAKE_INSN(opcode, 0, 0, 0, c)

#define MAKE_INSN_A(opcode, source)\
	MAKE_INSN(opcode, 0, source, 0, 0)

#define MAKE_INSN_D(opcode, dest)\
	MAKE_INSN(opcode, dest, 0, 0, 0)


//Shortcuts
#define _NOP() MAKE_INSN_C(VM_OP_NOP, 0)
#define _ADD(dest, a, b) MAKE_INSN_DAB(VM_OP_ADD, dest, a, b)
#define _SUB(dest, a, b) MAKE_INSN_DAB(VM_OP_SUB, dest, a, b)
#define _MUL(dest, a, b) MAKE_INSN_DAB(VM_OP_MUL, dest, a, b)
#define _DIV(dest, a, b) MAKE_INSN_DAB(VM_OP_DIV, dest, a, b)
#define _MOD(dest, a, b) MAKE_INSN_DAB(VM_OP_MOD, dest, a, b)
#define _RSHIFT(dest, a, b) MAKE_INSN_DAB(VM_OP_RSHIFT, dest, a, b)
#define _LSHIFT(dest, a, b) MAKE_INSN_DAB(VM_OP_LSHIFT, dest, a, b)
#define _NEG(dest, a) MAKE_INSN_DA(VM_OP_NEG, dest, a)
#define _LOAD_CONST(dest, c) MAKE_INSN_DC(VM_OP_LOAD_CONST, dest, c)
#define _READ_UBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_UBYTE, dest, a, c)
#define _READ_SBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_SBYTE, dest, a, c)
#define _READ_2UBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_2UBYTE, dest, a, c)
#define _READ_2SBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_2SBYTE, dest, a, c)
#define _READ_4UBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_4UBYTE, dest, a, c)
#define _READ_4SBYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_4SBYTE, dest, a, c)
#define _READ_8BYTE(dest, a, c) MAKE_INSN_DAC(VM_OP_READ_8BYTE, dest, a, c)
#define _WRITE_BYTE(a, b, c) MAKE_INSN_ABC(VM_OP_WRITE_BYTE, a, b, c)
#define _WRITE_2BYTE(a, b, c) MAKE_INSN_ABC(VM_OP_WRITE_2BYTE, a, b, c)
#define _WRITE_4BYTE(a, b, c) MAKE_INSN_ABC(VM_OP_WRITE_4BYTE, a, b, c)
#define _WRITE_8BYTE(a, b, c) MAKE_INSN_ABC(VM_OP_WRITE_8BYTE, a, b, c)
#define _PUSH(a) MAKE_INSN_A(VM_OP_PUSH, a)
#define _PUSH_CONST(c) MAKE_INSN_C(VM_OP_PUSH_CONST, c)
#define _POP(dest) MAKE_INSN_D(VM_OP_POP, dest)
#define _MOV(dest, a) MAKE_INSN_DA(VM_OP_MOV, dest, a)
#define _OR(dest, a, b) MAKE_INSN_DAB(VM_OP_OR, dest, a, b)
#define _AND(dest, a, b) MAKE_INSN_DAB(VM_OP_AND, dest, a, b)
#define _XOR(dest, a, b) MAKE_INSN_DAB(VM_OP_XOR, dest, a, b)
#define _NOT(dest, a) MAKE_INSN_DA(VM_OP_NOT, dest, a)
#define _SET_IF_SMALLER(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_SMALLER, dest, a, b)
#define _SET_IF_SMALLER_OR_EQUAL(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_SMALLER_OR_EQUAL, dest, a, b)
#define _SET_IF_GREATER(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_GREATER, dest, a, b)
#define _SET_IF_GREATER_OR_EQUAL(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_GREATER_OR_EQUAL, dest, a, b)
#define _SET_IF_EQUAL(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_EQUAL, dest, a, b)
#define _SET_IF_INEQUAL(dest, a, b) MAKE_INSN_DAB(VM_OP_SET_IF_INEQUAL, dest, a, b)
#define _SET_IF_EQUAL_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_SET_IF_EQUAL_CONST, dest, a, c)
#define _SET_IF_INEQUAL_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_SET_IF_INEQUAL_CONST, dest, a, c)
#define _LOGICAL_INVERT(dest, a) MAKE_INSN_DA(VM_OP_LOGICAL_INVERT, dest, a)
#define _JUMP_IF_ZERO(a, c) MAKE_INSN_AC(VM_OP_JUMP_IF_ZERO, a, c)
#define _JUMP_IF_SET(a, c) MAKE_INSN_AC(VM_OP_JUMP_IF_NOT_ZERO, a, c)
#define _JUMP(c) _LOAD_CONST(_RIP, c)
#define _CALL(c) MAKE_INSN_C(VM_OP_CALL, c)
#define _RET() MAKE_INSN(VM_OP_RET, 0, 0, 0, 0)
#define _RET_IF_SET(a) MAKE_INSN_A(VM_OP_RET_IF_SET, a)
#define _RET_IF_ZERO(a) MAKE_INSN_A(VM_OP_RET_IF_ZERO, a)
#define _ADD_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_ADD_CONST, dest, a, c)
#define _RSHIFT_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_RSHIFT_CONST, dest, a, c)
#define _LSHIFT_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_LSHIFT_CONST, dest, a, c)
#define _OR_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_OR_CONST, dest, a, c)
#define _AND_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_AND_CONST, dest, a, c)
#define _XOR_CONST(dest, a, c) MAKE_INSN_DAC(VM_OP_XOR_CONST, dest, a, c)

//Assembler function header definition
#define ASM_FN_HDR(name) ".globl " #name "\n" #name ":\n"
#define LABEL(name) #name ":\n"


void vm_run_insn(struct vm_insn* insn, greg_t* gregs);


#endif /* VM_HPP_ */
