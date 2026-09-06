/*
 * vm.cpp
 *
 *  Created on: 02.10.2018
 *      Author: jonathan
 */

#include "vm.hpp"

#pragma GCC diagnostic ignored "-Wunused-variable"

#define VM_OP_PROTO(name) void vm_##name (struct vm_insn* insn, greg_t* gregs)
#define VM_REGISTER_OP(name) [VM_OP_##name] = vm_##name
#define VM_OP_BASE(name, op) VM_OP_PROTO(name) {\
	int64_t a = gregs[insn->source_reg_1];\
	int64_t b = gregs[insn->source_reg_2];\
	int64_t c = insn->imm;\
	op;\
}
#define VM_WRITEBACK(result) gregs[insn->dest_reg] = result
#define VM_OP_ARITH(name, result) VM_OP_BASE(name, VM_WRITEBACK(result))
#define VM_OP_MEM_READ(name, type) VM_OP_ARITH(name, *(type*)(a + c))
#define VM_OP_MEM_WRITE(name, type) VM_OP_BASE(name, *(type*)(a + c) = (type)b)
#define INC_SP(amount) gregs[REG_RSP] += amount
#define STACK_PTR (int64_t*)gregs[REG_RSP]



VM_OP_PROTO(NOP) {
	//Do nothing
}

//Arithmetic
VM_OP_ARITH(ADD, a + b);
VM_OP_ARITH(SUB, a - b);
VM_OP_ARITH(MUL, a * b);
VM_OP_ARITH(DIV, a / b);
VM_OP_ARITH(MOD, a % b);
VM_OP_ARITH(RSHIFT, a >> b);
VM_OP_ARITH(LSHIFT, a << b);
VM_OP_ARITH(LOAD_CONST, c);
VM_OP_ARITH(NEG, -a);

//Memory operations
VM_OP_MEM_READ(READ_UBYTE, uint8_t);
VM_OP_MEM_READ(READ_SBYTE, int8_t);
VM_OP_MEM_READ(READ_2UBYTE, uint16_t);
VM_OP_MEM_READ(READ_2SBYTE, int16_t);
VM_OP_MEM_READ(READ_4UBYTE, uint32_t);
VM_OP_MEM_READ(READ_4SBYTE, int32_t);
VM_OP_MEM_READ(READ_8BYTE, int64_t);
VM_OP_MEM_WRITE(WRITE_BYTE, int8_t);
VM_OP_MEM_WRITE(WRITE_2BYTE, int16_t);
VM_OP_MEM_WRITE(WRITE_4BYTE, int32_t);
VM_OP_MEM_WRITE(WRITE_8BYTE, int64_t);

//Stack operations
VM_OP_BASE(PUSH, {
	INC_SP(-sizeof(int64_t));
	*STACK_PTR = a;
});

VM_OP_BASE(PUSH_CONST, {
	INC_SP(-sizeof(int64_t));
	*STACK_PTR = c;
});

VM_OP_BASE(POP, {
	VM_WRITEBACK(*STACK_PTR);
	INC_SP(sizeof(int64_t));
});

//Logic operations
VM_OP_ARITH(MOV, a);
VM_OP_ARITH(OR, a | b);
VM_OP_ARITH(AND, a & b);
VM_OP_ARITH(XOR, a ^ b);
VM_OP_ARITH(NOT, ~a);

//Comparison operations
VM_OP_ARITH(SET_IF_SMALLER, a < b);
VM_OP_ARITH(SET_IF_SMALLER_OR_EQUAL, a <= b);
VM_OP_ARITH(SET_IF_GREATER, a > b);
VM_OP_ARITH(SET_IF_GREATER_OR_EQUAL, a >= b);
VM_OP_ARITH(SET_IF_EQUAL, a == b);
VM_OP_ARITH(SET_IF_INEQUAL, a != b);
VM_OP_ARITH(SET_IF_EQUAL_CONST, a == c);
VM_OP_ARITH(SET_IF_INEQUAL_CONST, a != c);
VM_OP_ARITH(LOGICAL_INVERT, !a);

//Conditional jumps
VM_OP_BASE(JUMP_IF_ZERO, {
	if (a == 0) {
		gregs[REG_RIP] = c;
	}
});
VM_OP_BASE(JUMP_IF_NOT_ZERO, {
	if (a != 0) {
		gregs[REG_RIP] = c;
	}
});

//CALL/RET
VM_OP_BASE(CALL, {
	INC_SP(-sizeof(int64_t));
	*STACK_PTR = gregs[REG_RIP];
	gregs[REG_RIP] = c;
});
#define VM_OP_RET_OPERATION() {gregs[REG_RIP] = *STACK_PTR; INC_SP(sizeof(int64_t));}
VM_OP_BASE(RET, {
		VM_OP_RET_OPERATION();
});
VM_OP_BASE(RET_IF_SET, {
	if (a != 0) {
		VM_OP_RET_OPERATION();
	}
});
VM_OP_BASE(RET_IF_ZERO, {
	if (a == 0) {
		VM_OP_RET_OPERATION();
	}
});


//Arithmetic/logic operations with constants
VM_OP_ARITH(ADD_CONST, a + c);
VM_OP_ARITH(RSHIFT_CONST, a >> c);
VM_OP_ARITH(LSHIFT_CONST, a << c);
VM_OP_ARITH(OR_CONST, a | c);
VM_OP_ARITH(AND_CONST, a & c);
VM_OP_ARITH(XOR_CONST, a ^ c);


typedef void (*vm_insn_fn_t)(struct vm_insn* insn, greg_t* gregs);

vm_insn_fn_t insn_fns[256] = {
		VM_REGISTER_OP(NOP),
		VM_REGISTER_OP(ADD),
		VM_REGISTER_OP(SUB),
		VM_REGISTER_OP(MUL),
		VM_REGISTER_OP(DIV),
		VM_REGISTER_OP(MOD),
		VM_REGISTER_OP(RSHIFT),
		VM_REGISTER_OP(LSHIFT),
		VM_REGISTER_OP(NEG),
		VM_REGISTER_OP(LOAD_CONST),
		VM_REGISTER_OP(READ_UBYTE),
		VM_REGISTER_OP(READ_SBYTE),
		VM_REGISTER_OP(READ_2UBYTE),
		VM_REGISTER_OP(READ_2SBYTE),
		VM_REGISTER_OP(READ_4UBYTE),
		VM_REGISTER_OP(READ_4SBYTE),
		VM_REGISTER_OP(READ_8BYTE),
		VM_REGISTER_OP(WRITE_BYTE),
		VM_REGISTER_OP(WRITE_2BYTE),
		VM_REGISTER_OP(WRITE_4BYTE),
		VM_REGISTER_OP(WRITE_8BYTE),
		VM_REGISTER_OP(PUSH),
		VM_REGISTER_OP(PUSH_CONST),
		VM_REGISTER_OP(POP),
		VM_REGISTER_OP(MOV),
		VM_REGISTER_OP(OR),
		VM_REGISTER_OP(AND),
		VM_REGISTER_OP(XOR),
		VM_REGISTER_OP(NOT),
		VM_REGISTER_OP(SET_IF_SMALLER),
		VM_REGISTER_OP(SET_IF_SMALLER_OR_EQUAL),
		VM_REGISTER_OP(SET_IF_GREATER),
		VM_REGISTER_OP(SET_IF_GREATER_OR_EQUAL),
		VM_REGISTER_OP(SET_IF_EQUAL),
		VM_REGISTER_OP(SET_IF_INEQUAL),
		VM_REGISTER_OP(SET_IF_EQUAL_CONST),
		VM_REGISTER_OP(SET_IF_INEQUAL_CONST),
		VM_REGISTER_OP(LOGICAL_INVERT),
		VM_REGISTER_OP(JUMP_IF_ZERO),
		VM_REGISTER_OP(JUMP_IF_NOT_ZERO),
		VM_REGISTER_OP(CALL),
		VM_REGISTER_OP(RET),
		VM_REGISTER_OP(RET_IF_SET),
		VM_REGISTER_OP(RET_IF_ZERO),
		VM_REGISTER_OP(ADD_CONST),
		VM_REGISTER_OP(RSHIFT_CONST),
		VM_REGISTER_OP(LSHIFT_CONST),
		VM_REGISTER_OP(OR_CONST),
		VM_REGISTER_OP(AND_CONST),
		VM_REGISTER_OP(XOR_CONST),
};

void vm_run_insn(struct vm_insn* insn, greg_t* gregs) {
	insn_fns[insn->opcode](insn, gregs);
}


