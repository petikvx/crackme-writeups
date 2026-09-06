/*
 * vmcall.h
 *
 *  Created on: 16.01.2019
 *      Author: jonathan
 */

#ifndef VMCALL_H_
#define VMCALL_H_

#include "vm.h"

uint64_t vm_dispatch_vmcall(uint64_t functionIndex, uint64_t src1, uint64_t src2, struct vm_program_info *info);



#endif /* VMCALL_H_ */
