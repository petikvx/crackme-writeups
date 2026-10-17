/* paypain -- Election : LD_PRELOAD shim making Sar win every time.
 *
 * election checks getenv("LD_PRELOAD") itself and aborts if set, and also
 * self-ptrace()s to detect a debugger. The constructor below runs before
 * main() (standard ELF .init_array ordering) and clears LD_PRELOAD from the
 * environment before main() ever reads it -- the loader has already used it
 * to map this library, so clearing it afterwards does not undo the preload.
 *
 * main() calls rand() exactly three times, in this order, to build the vote
 * counts: votes[Bob] = rand() % 99 ; votes[Poe] = rand() % (99-votes[Bob]) ;
 * votes[Sar] = rand() % (99-votes[Poe]). Overriding rand() to return 0 on the
 * first two calls and 98 on the third forces votes = {Bob:0, Poe:0, Sar:98},
 * which rank() turns into a clean (non-tied) first place for Sar.
 */
#define _GNU_SOURCE
#include <stdlib.h>

__attribute__((constructor))
static void hide_preload(void) {
    unsetenv("LD_PRELOAD");
}

int rand(void) {
    static int call = 0;
    call++;
    if (call == 3) return 98;   /* Sar's draw */
    return 0;                    /* Bob's and Poe's draws */
}
