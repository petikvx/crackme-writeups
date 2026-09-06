/*
 * algo.hpp
 *
 *  Created on: 04.10.2018
 *      Author: jonathan
 */

#ifndef ALGO_HPP_
#define ALGO_HPP_
#include <stdint.h>

extern "C" {
	int64_t verify_input(int64_t argc, const char** argv);
	int64_t verify_input_impl(const char* input);
	int64_t* input_to_numbers(const char* input, int64_t size);
	int64_t verify_numbers(int64_t* numbers, int64_t count);
	void differences_xored(int64_t* numbers, int64_t count);
	int64_t asm_strlen(const char* str);
	int64_t asm_memequal(const void* s1, const void* s2, int64_t size);
	//void print_numbers(const int64_t* numbers, int64_t count);
	const char* asm_strchr(const char* s, char c);
	extern const char flag_start[];
	extern const char alphabet[];
	extern const int64_t good_differences[];
}

#define VERIFY_INPUT_OK 0
#define VERIFY_INPUT_WRONG 1
#define VERIFY_INPUT_ARGC 2



#endif /* ALGO_HPP_ */
