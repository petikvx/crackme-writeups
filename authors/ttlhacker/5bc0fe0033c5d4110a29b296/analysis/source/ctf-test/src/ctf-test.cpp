#define _POSIX_C_SOURCE 199309L
#include <iostream>
#include <string.h>
#include <signal.h>
#include <ucontext.h>
#include "vm.hpp"
#include "algo.hpp"
using namespace std;


#define UD2_SIZE 2

void sigill_handler(int signum, siginfo_t* info, void* extra) {
	ucontext_t* ctx = (ucontext_t*)extra;

	//Skip UD2 instruction
	greg_t* rip = &ctx->uc_mcontext.gregs[REG_RIP];
	*rip += UD2_SIZE;

	struct vm_insn* insn = (struct vm_insn*)*rip;
	*rip += sizeof(struct vm_insn);

	greg_t* regs = ctx->uc_mcontext.gregs;
	vm_run_insn(insn, regs);
}


bool register_sigill_handler() {
	struct sigaction sa = {};
	sa.sa_sigaction = sigill_handler;
	sa.sa_flags = SA_ONSTACK | SA_SIGINFO;
	if (sigfillset(&sa.sa_mask) != 0) {
		return false;
	}
	return sigaction(SIGILL, &sa, nullptr) == 0;
}

//Create a new stack for signal handlers.
bool init_sigaltstack() {
	void* stack = malloc(SIGSTKSZ);
	if (!stack) {
		return false;
	}
	stack_t new_stack = {
			.ss_sp = stack,
			.ss_flags = 0,
			.ss_size = SIGSTKSZ
	};
	if (sigaltstack(&new_stack, nullptr) != 0) {
		free(stack);
		return false;
	}
	return true;
}


int main(int argc, const char** argv) {
	if (!init_sigaltstack()) {
		return 1;
	}
	if (!register_sigill_handler()) {
		return 2;
	}

	int64_t verify_result = verify_input(argc, argv);
	const char* output = "You have encountered a bug";

	switch (verify_result) {
	case VERIFY_INPUT_OK:
		output = "OK!";
		break;
	case VERIFY_INPUT_WRONG:
		output = "Wrong";
		break;
	case VERIFY_INPUT_ARGC:
		output = "[hell86 crackme] Please pass the flag as a command-line argument.";
		break;
	default:
		//Nothing.
		break;
	}
	puts(output);

	return 0;
}
