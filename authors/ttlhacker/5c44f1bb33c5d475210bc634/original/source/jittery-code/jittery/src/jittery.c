/*
 ============================================================================
 Name        : jittery.c
 Author      : 
 Version     :
 Copyright   : ttlhacker (CC-BY-SA)
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

#include "vm.h"
#include "hdrgen/vmprogram.cgen"

int main(void) {
	uint64_t errCode = vm_run_program(vm_code, NELEMS(vm_code), pc_exponents, NELEMS(pc_exponents));
	if (errCode != VM_OK) {
		printf("Whoops, an internal error occurred. This is a bug, please let ttlhacker know. Error code: %lu\n", errCode);
	}
}
