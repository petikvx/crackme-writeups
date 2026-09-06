/*
 * algo.cpp
 *
 *  Created on: 04.10.2018
 *      Author: jonathan
 */

#include "algo.hpp"
#include "vm.hpp"
#include <stdio.h>


#define FLAG_LENGTH 36
const char flag_start[] = "FLAG{";
#define FLAG_END '}'

const char alphabet[] = "abdfgehikmanoqrstucvwlxyz-01h23p456u78j9-_.+";

const int64_t good_differences[] = {5832, -29791, -8000, 13824, -6859, 5832, -29791, 24389, -10648, -8, 24389, -13824, -17576, 2744, -17576, 19683, -32768, 729, 19683, -1, 729, 1000, 125, -5832, 512, 512, -6859, 8000, -8000};

#define FIRST_NUMBER 22


//FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}



//Args: RDI, RSI, RDX, RCX, R8, R9
//Volatile: R10, R11

//int64_t verify_input(int64_t argc, char** argv)
asm(
		ASM_FN_HDR(verify_input)

		//if (argc != 2) return VERIFY_INPUT_ARGC;
		_LOAD_CONST(_RAX, VERIFY_INPUT_ARGC)
		_SET_IF_INEQUAL_CONST(_R8, _RDI, 2)
		_RET_IF_SET(_R8)

		//return verify_input_impl(argv[1]);
		_ADD_CONST(_RSI, _RSI, 8)
		_READ_8BYTE(_RDI, _RSI, 0)
		_JUMP(verify_input_impl)
);

//int64_t verify_input_impl(const char* input);
asm(
		ASM_FN_HDR(verify_input_impl)

		_PUSH(_RBP)
		_MOV(_RBP, _RSP)
		_ADD_CONST(_RSP, _RSP, -16)

		//locals:
		//	-8	flag_start_len
		//	-16	input

		_WRITE_8BYTE(_RBP, _RDI, -16) //input

		//if (strlen(input) != FLAG_LENGTH) return VERIFY_INPUT_WRONG;
		_CALL(asm_strlen)
		_SET_IF_INEQUAL_CONST(_RAX, _RAX, FLAG_LENGTH)
		_JUMP_IF_SET(_RAX, 1f)

		//int64_t flag_start_len = strlen(flag_start)
		_LOAD_CONST(_RDI, flag_start)
		_CALL(asm_strlen)
		_WRITE_8BYTE(_RBP, _RAX, -8) //flag_start_len

		//if (asm_memequal(input, flag_start, flag_start_len)) return VERIFY_INPUT_WRONG;
		_READ_8BYTE(_RDI, _RBP, -16) //input
		_LOAD_CONST(_RSI, flag_start)
		_MOV(_RDX, _RAX) //flag_start_len
		_CALL(asm_memequal)
		_JUMP_IF_SET(_RAX, 1f)

		//if (input[FLAG_LENGTH-1] != flag_end) return VERIFY_INPUT_WRONG;
		_READ_8BYTE(_RDI, _RBP, -16) //input
		_READ_UBYTE(_RSI, _RDI, FLAG_LENGTH - 1)
		_SET_IF_INEQUAL_CONST(_RSI, _RSI, FLAG_END)
		_JUMP_IF_SET(_RSI, 1f)

		//int64_t nbrs_count = FLAG_LENGTH - flag_start_len - 1;
		//int64_t* numbers = input_to_numbers(input + flag_start_len, nbrs_count);
		_READ_8BYTE(_RSI, _RBP, -8) //flag_start_len
		_ADD(_RDI, _RDI, _RSI)
		_NEG(_RSI, _RSI)
		_ADD_CONST(_RSI, _RSI, FLAG_LENGTH - 1)
		_PUSH(_RSI)
		_CALL(input_to_numbers)
		_POP(_RSI)

		//if (!numbers) return VERIFY_INPUT_WRONG;
		_JUMP_IF_ZERO(_RAX, 1f)

		//int64_t result = verify_numbers(numbers, nbrs_count);
		_MOV(_RDI, _RAX)
		_PUSH(_RDI)
		_CALL(verify_numbers)
		_POP(_RDI)

		//free(numbers);
		_PUSH(_RAX)
		_CALL(free)
		_POP(_RAX)

		//return result;
		_JUMP(2f)


LABEL(1)
		//return VERIFY_INPUT_WRONG;
		_LOAD_CONST(_RAX, VERIFY_INPUT_WRONG)
LABEL(2)
		//return RAX;
		_MOV(_RSP, _RBP)
		_POP(_RBP)
		_RET()
);


//Maps each input character to a number according to the alphabet.
//
//int64_t* input_to_numbers(const char* input, int64_t size);
asm(
		ASM_FN_HDR(input_to_numbers)

		//if (size == 0) return nullptr;
		_LOAD_CONST(_RAX, 0)
		_RET_IF_ZERO(_RSI)

		//int64_t* result = (int64_t*)malloc(size * 8);
		_PUSH(_RDI)
		_PUSH(_RSI)
		_LSHIFT_CONST(_RDI, _RSI, 3)
		_CALL(malloc)
		_POP(_RSI)
		_POP(_RDI)

		//if (!result) return result;
		_RET_IF_ZERO(_RAX)

		//Save the buffer ptr twice
		_MOV(_R8, _RAX) //result
		_MOV(_R9, _RAX) //result_writeptr

LABEL(1)
		//const char* p = strchr(alphabet, *input);
		_PUSH(_R9)
		_PUSH(_R8)
		_PUSH(_RDI)
		_PUSH(_RSI)
		_READ_UBYTE(_RSI, _RDI, 0)
		_LOAD_CONST(_RDI, alphabet)
		_CALL(asm_strchr)
		_POP(_RSI)
		_POP(_RDI)
		_POP(_R8)
		_POP(_R9)

		//if (!p) goto LABEL(2);
		_JUMP_IF_ZERO(_RAX, 2f)

		//*result_writeptr = p - alphabet;
		_LOAD_CONST(_R10, alphabet)
		_SUB(_RAX, _RAX, _R10)
		_WRITE_8BYTE(_R9, _RAX, 0)

		//result_writeptr++; input++; size--;
		_ADD_CONST(_R9, _R9, 8)
		_ADD_CONST(_RDI, _RDI, 1)
		_ADD_CONST(_RSI, _RSI, -1)

		//if (size) goto LABEL(1);
		_JUMP_IF_SET(_RSI, 1b)

		//return result;
		_MOV(_RAX, _R8)
		_RET()

LABEL(2)
		//free(result)
		_MOV(_RDI, _R8)
		_CALL(free)

		//return nullptr;
		_LOAD_CONST(_RAX, 0)
		_RET()
);

//Returns VERIFY_INPUT_OK if the numbers are ok,
//VERIFY_INPUT_WRONG if they're wrong
//
//int64_t verify_numbers(int64_t* numbers, int64_t count);
asm(
		ASM_FN_HDR(verify_numbers)

		//if (count == 0) return VERIFY_INPUT_WRONG;
		_LOAD_CONST(_RAX, VERIFY_INPUT_WRONG)
		_RET_IF_ZERO(_RSI)

		//if (numbers[0] != FIRST_NUMBER) return VERIFY_INPUT_WRONG;
		_READ_8BYTE(_R8, _RDI, 0)
		_SET_IF_INEQUAL_CONST(_R8, _R8, FIRST_NUMBER)
		_RET_IF_SET(_R8)

		//differences(numbers, count);
		_PUSH(_RDI)
		_PUSH(_RSI)
		_CALL(differences_xored)
		_POP(_RSI)
		_POP(_RDI)

		//count--;
		_ADD_CONST(_RSI, _RSI, -1)

		/*_PUSH(_RDI)
		_PUSH(_RSI)
		_CALL(print_numbers)
		_POP(_RSI)
		_POP(_RDI)*/

		//if (asm_memequal(numbers, good_differences, count * sizeof(int64_t)) return VERIFY_INPUT_WRONG;
		_PUSH(_RDI)
		_LSHIFT_CONST(_RDX, _RSI, 3)
		_LOAD_CONST(_RSI, good_differences)
		_CALL(asm_memequal)
		_POP(_RDI)
		_MOV(_R8, _RAX)
		_LOAD_CONST(_RAX, VERIFY_INPUT_WRONG)
		_RET_IF_SET(_R8)

		//return VERIFY_INPUT_OK;
		_LOAD_CONST(_RAX, VERIFY_INPUT_OK)
		_RET()
);
/*int64_t verify_numbers(int64_t* numbers, int64_t count) {
	differences(numbers, count);
	for (int64_t i = 0; i < count; i++) {
		printf("%ld ", numbers[i]);
	}
	printf("\n");
	return VERIFY_INPUT_OK;
}*/

/*void print_numbers(const int64_t* numbers, int64_t count) {
	for (int64_t i = 0; i < count; i++) {
		printf("%ld ", numbers[i]);
	}
	printf("\n");
}*/

//void differences_xored(int64_t* numbers, int64_t count);
asm(
		ASM_FN_HDR(differences_xored)

		//if (count == 0) return;
		_RET_IF_ZERO(_RSI)

		//count--;
		_ADD_CONST(_RSI, _RSI, -1)

LABEL(1)
		//if (count == 0) return;
		_RET_IF_ZERO(_RSI)

		//numbers[0] = ((numbers[1] - numbers[0]) ^ count) ** 3
		_READ_8BYTE(_R8, _RDI, 0) //numbers[0]
		_READ_8BYTE(_R9, _RDI, 8) //numbers[1]
		_SUB(_R8, _R9, _R8)
		_XOR(_R8, _R8, _RSI)
		_MUL(_R9, _R8, _R8)
		_MUL(_R8, _R9, _R8)
		_WRITE_8BYTE(_RDI, _R8, 0) //numbers[0]

		//numbers++; count--;
		_ADD_CONST(_RDI, _RDI, 8)
		_ADD_CONST(_RSI, _RSI, -1)

		//goto LABEL(1)
		_JUMP(1b)
);





//int64_t asm_strlen(const char* str);
asm(
		ASM_FN_HDR(asm_strlen)
		_LOAD_CONST(_RAX, 0)
LABEL(1)
		_READ_UBYTE(_R10, _RDI, 0)
		_RET_IF_ZERO(_R10)
		_ADD_CONST(_RDI, _RDI, 1)
		_ADD_CONST(_RAX, _RAX, 1)
		_JUMP(1b)
);



//Returns 0 if the memory areas match, a nonzero value if they don't.
//
//int64_t asm_memequal(const void* s1, const void* s2, int64_t size);
asm(
		ASM_FN_HDR(asm_memequal)

		//int64_t result = 0;
		_LOAD_CONST(_RAX, 0)

		//if (size == 0) return result;
		_RET_IF_ZERO(_RDX)

LABEL(1)
		//int64_t tmp = *s1 ^ *s2;
		_READ_UBYTE(_R8, _RDI, 0)
		_READ_UBYTE(_R9, _RSI, 0)
		_XOR(_R8, _R8, _R9)

		//result |= tmp;
		_OR(_RAX, _RAX, _R8)

		//size--; s1++; s2++;
		_ADD_CONST(_RDX, _RDX, -1)
		_ADD_CONST(_RDI, _RDI, 1)
		_ADD_CONST(_RSI, _RSI, 1)

		//if (size) goto LABEL(1);
		_JUMP_IF_SET(_RDX, 1b)

		//return result;
		_RET()
);



//Args: RDI, RSI, RDX, RCX, R8, R9
//Volatile: R10, R11




//const char* asm_strchr(const char* s, char c);
asm(
		ASM_FN_HDR(asm_strchr)

		_MOV(_RAX, _RDI)

LABEL(1)
		//if (*s == 0) return 0;
		_READ_UBYTE(_R8, _RAX, 0)
		_JUMP_IF_ZERO(_R8, 2f)

		//if (*s == c) return s;
		_SET_IF_EQUAL(_R8, _R8, _RSI)
		_RET_IF_SET(_R8)

		//s++;
		_ADD_CONST(_RAX, _RAX, 1)

		//goto LABEL(1)
		_JUMP(1b)

LABEL(2)
		//return 0;
		_LOAD_CONST(_RAX, 0)
		_RET()
);

