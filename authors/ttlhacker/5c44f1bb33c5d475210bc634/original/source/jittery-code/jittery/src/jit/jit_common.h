/*
 * jit_common.h
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */

#ifndef JIT_JIT_COMMON_H_
#define JIT_JIT_COMMON_H_

#include <string.h>
#include <stdint.h>

#define WRITE_INSN(mem, insnBytes) {memcpy(*mem, &insnBytes, sizeof(insnBytes)); *mem += sizeof(insnBytes);}
#define WRITE_SINGLEARRAY_INSN(mem, ...) {\
	uint8_t insnBytes[] = {__VA_ARGS__};\
	WRITE_INSN(mem, insnBytes);\
}


//Register numbers
#define REGNUM_RAX 0
#define REGNUM_RCX 1
#define REGNUM_RDX 2
#define REGNUM_RBX 3
#define REGNUM_RSP 4
#define REGNUM_RBP 5
#define REGNUM_RSI 6
#define REGNUM_RDI 7
#define REGNUM_R8 8
#define REGNUM_R9 9
#define REGNUM_R10 10
#define REGNUM_R11 11
#define REGNUM_R12 12
#define REGNUM_R13 13
#define REGNUM_R14 14
#define REGNUM_R15 15

//Creates a host machine register number from the given VM register number.
#define VMREG(reg) (reg + REGNUM_R8)

//These can be used to refer to the instruction's arguments in a jitter function
#define IMM_VAL ((int64_t)(insn->imm))
#define REG_SRC1 VMREG(insn->src1)
#define REG_SRC2 VMREG(insn->src2)
#define REG_DST VMREG(insn->dst)

//1-byte instructions
#define RET_INSN 0xC3


//Generates a REX prefix with 64-bit operand size set.
static inline uint8_t generate_rex64_prefix(uint8_t rm, uint8_t reg) {
	uint8_t rmTopBit = (rm >> 3) & 1;
	uint8_t regTopBit = (reg >> 3) & 1;
	return 0b01001000 | rmTopBit | (regTopBit << 2);
}

//Generates a ModR/M byte with register-direct addressing.
static inline uint8_t generate_regdirect_modrm_byte(uint8_t rm, uint8_t reg) {
	rm &= 0b111;
	reg &= 0b111;
	return 0b11000000 | rm | (reg << 3);
}

//Generates a 1-byte instruction that's given as a parameter.
static inline void generate_1byte_insn(uint8_t **mem, uint8_t insn) {
	WRITE_INSN(mem, insn);
}

#define MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(name, op)\
static inline void generate_##name##64(uint8_t **mem, uint8_t destReg, uint8_t sourceReg) {\
	uint8_t insnBytes[] = {\
			generate_rex64_prefix(destReg, sourceReg),\
			op,\
			generate_regdirect_modrm_byte(destReg, sourceReg)\
	};\
	WRITE_INSN(mem, insnBytes);\
}

//Generates a 64-bit mov instruction.
//mov destReg, sourceReg
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(mov, 0x89)

//Generates a 64-bit test instruction.
//test src1, src
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(test, 0x85)


//64-bit arithmetic instructions

MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(add, 0x01)
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(sub, 0x29)
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(or, 0x09)
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(and, 0x21)
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(xor, 0x31)
MAKE_REX_1BYTE_MODRM_INSTRUCTION_GENERATOR(cmp, 0x39)


static inline void generate_imul64(uint8_t** mem, uint8_t destReg, uint8_t sourceReg) {
	WRITE_SINGLEARRAY_INSN(mem,
			generate_rex64_prefix(sourceReg, destReg),
			0x0F,
			0xAF,
			generate_regdirect_modrm_byte(sourceReg, destReg)
	);
}

//shl rax, amount
static inline void generate_shl_rax(uint8_t** mem, uint8_t amount) {
	WRITE_SINGLEARRAY_INSN(mem, 0x48, 0xC1, 0xE0, amount);
}

//shr rax, amount
static inline void generate_shr_rax(uint8_t** mem, uint8_t amount) {
	WRITE_SINGLEARRAY_INSN(mem, 0x48, 0xC1, 0xE8, amount);
}

//sar rax, amount
static inline void generate_sar_rax(uint8_t** mem, uint8_t amount) {
	WRITE_SINGLEARRAY_INSN(mem, 0x48, 0xC1, 0xF8, amount);
}

//neg reg
static inline void generate_neg64(uint8_t** mem, uint8_t reg) {
	WRITE_SINGLEARRAY_INSN(mem,
			generate_rex64_prefix(reg, 3),
			0xF7,
			generate_regdirect_modrm_byte(reg, 3)
	);
}

//movzx rax, al
static inline void generate_movzx_rax_al(uint8_t** mem) {
	WRITE_SINGLEARRAY_INSN(mem, 0x48, 0x0F, 0xB6, 0xC0);
}


//setcc conditions
#define SETCC_SETA 0x97 //above (unsigned)
#define SETCC_SETAE 0x93 //above/equal (unsigned)
#define SETCC_SETB 0x92 //below (unsigned)
#define SETCC_SETBE 0x96 //below/equal (unsigned)
#define SETCC_SETE 0x94 //equal
#define SETCC_SETNE 0x95 //not equal
#define SETCC_SETG 0x9F //greater (signed)
#define SETCC_SETGE 0x9D //greater/equal (signed)
#define SETCC_SETL 0x9C //less (signed)
#define SETCC_SETLE 0x9E //less/equal (signed)


//setcc al
static inline void generate_setcc_al(uint8_t** mem, uint8_t op) {
	WRITE_SINGLEARRAY_INSN(mem, 0x0F, op, 0xC0);
}


//Generates a 64-bit movabs instruction.
//movabs destReg, constVal
static inline void generate_load_const64(uint8_t** mem, uint8_t destReg, uint64_t constVal) {
#pragma pack(push, 1)
	struct load_const_insn {
		uint8_t opbytes[2];
		uint64_t value;
	} insn = {
			{
					generate_rex64_prefix(destReg, 0),
					0xB8 | (destReg & 0b111)
			},
			constVal
	};
#pragma pack(pop)

	WRITE_INSN(mem, insn);
}

#define SIZEOF_JUMP_RAX 2
//Generates a JMP RAX instruction.
static inline void generate_jump_rax(uint8_t **mem) {
	WRITE_SINGLEARRAY_INSN(mem, 0xFF, 0xE0);
}

//Generates a jump instruction. Clobbers RAX.
static inline void generate_jump(uint8_t** mem, uint64_t target) {
	generate_load_const64(mem, REGNUM_RAX, target);
	generate_jump_rax(mem);
}


#pragma pack(push, 1)
struct call_insn {
	uint8_t opbytes_movabs[2];
	uint64_t target;
	uint8_t opbytes_call_rax[2];
};
#pragma pack(pop)

//Generates a call instruction. Clobbers RAX.
static inline void generate_call(uint8_t** mem, uint64_t target) {
	struct call_insn insn = {
			{0x48, 0xB8},
			target,
			{0xFF, 0xD0}
	};
	WRITE_INSN(mem, insn);
}



#endif /* JIT_JIT_COMMON_H_ */
