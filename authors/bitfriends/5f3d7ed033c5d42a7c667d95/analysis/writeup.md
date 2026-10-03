# rop — write-up

crackmes.one `5f3d7ed033c5d42a7c667d95` · BitFriends · ELF64, Ubuntu 18.04 (GCC 7.5.0)

## TL;DR

Stack buffer overflow with no canary, NX on, non-PIE. No win function and no
`system`/`/bin/sh`/`syscall` in the binary → **ret2csu to leak libc, then
ret2libc `system("/bin/sh")`**. Solver: [`../tools/rop-solve.py`](../tools/rop-solve.py).

## Recon

| Property | Value |
|---|---|
| Type | ELF64 `EXEC` (non-PIE), dynamically linked, **not stripped** |
| Mitigations | **NX on** (`GNU_STACK` RW), **no stack canary**, partial RELRO |
| Imports | `read`, `write` only |

```
main (0x400537):  write(1,"Input: ",7) ; input() ; write(1,"Hello World!\n",13)
input(0x400582):  char buf[0x40]; read(0, buf, 0x280)   ; <-- 640 bytes into 64
```

`read` accepts `0x280` bytes into a 64-byte buffer. Saved RBP is at `buf+0x40`,
the return address at `buf+0x48` → **return-address offset = 72**.

## The problem

There is no `system`, no `/bin/sh`, no `syscall`/`int 0x80` gadget, and no
`pop rdi` in the binary. The only useful gadgets are the compiler's `__libc_csu_init`
tail:

```
0x40060a  pop rbx ; pop rbp ; pop r12 ; pop r13 ; pop r14 ; pop r15 ; ret
0x4005f0  mov rdx,r15 ; mov rsi,r14 ; mov edi,r13d ; call [r12+rbx*8]
          add rbx,1 ; cmp rbp,rbx ; jne … ; add rsp,8 ; (the 6 pops) ; ret
```

So we leak libc with a ret2csu-driven `write`, then return into `main` to get a
second `read`, and finish with a classic ret2libc using a `pop rdi; ret` gadget
taken from the now-known libc.

## Stage 1 — leak libc via ret2csu

`main` calls `write` once before `input`, so `write@GOT` (`0x601018`) already holds
the resolved libc address. We call `write(1, write@GOT, 8)` through the csu gadgets:

```
rbx=0, rbp=1          # loop body runs exactly once
r12=0x601018          # call [r12+0] = write
r13=1  -> edi = 1     # fd = stdout
r14=0x601018 -> rsi   # leak write@GOT's own contents
r15=8  -> rdx         # length
```

After the call the csu epilogue does `add rsp,8` + 6 pops, so we pad **7 qwords**
then return to `main` (`0x400537`) to re-enter `input()`.

`libc_base = leak - write_offset`. The leak resolves the *running* libc, so the
solver reads `write`/`system`/`/bin/sh` offsets and the `pop rdi; ret` gadget
straight out of whatever libc the target loads (`--libc` to override).

## Stage 2 — ret2libc

```
[72 × 'A'] [ ret(0x400416) ] [ pop rdi; ret ] [ &"/bin/sh" ] [ &system ]
```

**Alignment gotcha:** glibc `do_system` runs `movaps %xmm1,(%rsp)`, which faults
unless `rsp` is 16-byte aligned. One extra `ret` fixes the parity — but it must be
the binary's `ret` at `0x400416` (executable). The first `\xc3` byte in libc sits
in the **read-only** first LOAD segment, so a libc "ret" there segfaults; that was
the one trap worth noting here.

## Result

```
$ ./rop-solve.py
PROOF=petik:1000
Linux x86_64
PWNED_42
[+] libc base   0x7787eec00000
[+] stage 2 sent; shell spawned
```

`./rop-solve.py -i` drops into the interactive shell instead.
