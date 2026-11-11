#!/usr/bin/env python3
"""SimpleCrackme (arasreal) — mot de passe = concaténation de 12 morceaux .rdata.

  python3 -I tools/simplecrackme-solve.py          # affiche le mot de passe
  python3 -I tools/simplecrackme-solve.py -q       # idem, sans décor
  python3 -I tools/simplecrackme-solve.py --check  # rejoue main() du PE sous unicorn

Le binaire ne prend pas de username (pas de `petik` ici).
"""
import argparse, struct, sys, zipfile, os

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
CHUNKS = ["succ", "ess", "good", "try", "but", "you", "are", "found", "at", "ry", "pass", "01"]
PASSWORD = "".join(CHUNKS)


def load_exe():
    return zipfile.ZipFile(ZIP).read("SimpleCrackme.exe", pwd=b"crackmes.one")


def read_chunks(d):
    """Relit les 12 chaînes depuis .rdata (0x404278..0x4042b4) pour prouver l'ordre."""
    base = 0x3000 - 0x404000  # file_off = VA + base (section .rdata)
    addrs = [0x404278, 0x404280, 0x404284, 0x40428c, 0x404290, 0x404294,
             0x404298, 0x40429c, 0x4042a4, 0x4042a8, 0x4042ac, 0x4042b4]
    out = []
    for a in addrs:
        o = a + base
        out.append(d[o:d.index(b"\0", o)].decode())
    return out


def check(pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_EIP, UC_X86_REG_ESP, UC_X86_REG_EAX,
                                   UC_X86_REG_EDX, UC_X86_REG_ECX, UC_X86_REG_EBP)
    d = load_exe()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    optsz = struct.unpack_from("<H", d, pe + 20)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000)
    mu.mem_write(0x400000, d[:0x400])
    for i in range(nsec):
        s = pe + 24 + optsz + i * 40
        vsz, va, rsz, raw = struct.unpack_from("<IIII", d, s + 8)
        mu.mem_write(0x400000 + va, d[raw:raw + rsz])
    # IAT -> stubs
    imp, _ = struct.unpack_from("<II", d, pe + 24 + 96 + 8)
    def rva2off(r):
        for i in range(nsec):
            s = pe + 24 + optsz + i * 40
            vsz, va, rsz, raw = struct.unpack_from("<IIII", d, s + 8)
            if va <= r < va + max(vsz, rsz):
                return r - va + raw
    stubs, names = {}, {}
    p = rva2off(imp)
    n = 0
    while struct.unpack_from("<I", d, p + 12)[0]:
        oft, _, _, _, ft = struct.unpack_from("<IIIII", d, p)
        k = 0
        while True:
            t = struct.unpack_from("<I", d, rva2off(oft) + 4 * k)[0]
            if not t:
                break
            nm = d[rva2off(t) + 2:d.index(b"\0", rva2off(t) + 2)].decode()
            st = 0x7F000000 + n * 16
            mu.mem_write(0x400000 + ft + 4 * k, struct.pack("<I", st))
            names[st] = nm
            n += 1
            k += 1
        p += 20
    mu.mem_map(0x7F000000, 0x10000)
    mu.mem_map(0x10000000, 0x100000)   # heap
    mu.mem_map(0x20000000, 0x100000)   # stack
    heap = [0x10000000]
    out, cin = [], {}
    NARGS = {"Sleep": 4, "SetConsoleTitleA": 4, "IsDebuggerPresent": 0}
    esp0 = 0x20000000 + 0x80000

    def alloc(n):
        a = heap[0]; heap[0] += (n + 15) & ~15; return a

    def cstr(a):
        b = b""
        while mu.mem_read(a, 1) != b"\0":
            b += bytes(mu.mem_read(a, 1)); a += 1
        return b.decode(errors="replace")

    def hook(mu, addr, sz, _):
        esp = mu.reg_read(UC_X86_REG_ESP)
        if addr in names:
            nm = names[addr]
            arg = lambda i: struct.unpack("<I", bytes(mu.mem_read(esp + 4 + 4 * i, 4)))[0]
            ret = struct.unpack("<I", bytes(mu.mem_read(esp, 4)))[0]
            rv, pop = 0, NARGS.get(nm, 0)
            if nm == "malloc":
                rv = alloc(arg(0))
            elif nm in ("memcpy", "memmove"):
                mu.mem_write(arg(0), bytes(mu.mem_read(arg(1), arg(2))))
                rv = arg(0)
            elif nm == "SetConsoleTitleA":
                rv = 1
            mu.reg_write(UC_X86_REG_EAX, rv)
            mu.reg_write(UC_X86_REG_ESP, esp + 4 + pop)
            mu.reg_write(UC_X86_REG_EIP, ret)
        elif addr == 0x401D70:      # cout << edx (const char*)
            out.append(cstr(mu.reg_read(UC_X86_REG_EDX)))
            mu.reg_write(UC_X86_REG_EIP, struct.unpack("<I", bytes(mu.mem_read(esp, 4)))[0])
            mu.reg_write(UC_X86_REG_ESP, esp + 4)
        elif addr == 0x401F90:      # cin >> std::string edx
            s = mu.reg_read(UC_X86_REG_EDX)
            b = pw.encode()
            buf = alloc(len(b) + 1)
            mu.mem_write(buf, b + b"\0")
            mu.mem_write(s, struct.pack("<I", buf))
            mu.mem_write(s + 0x10, struct.pack("<II", len(b), len(b)))
            ret = struct.unpack("<I", bytes(mu.mem_read(esp, 4)))[0]
            mu.reg_write(UC_X86_REG_ESP, esp + 4)
            mu.reg_write(UC_X86_REG_EIP, ret)
    def dbg(mu, addr, sz, _):
        ebp = mu.reg_read(UC_X86_REG_EBP)
        L, cap = struct.unpack("<II", bytes(mu.mem_read(ebp - 0x30, 8)))
        a = ebp - 0x40 if cap <= 15 else struct.unpack("<I", bytes(mu.mem_read(ebp - 0x40, 4)))[0]
        print("attendu :", bytes(mu.mem_read(a, L)))
    if os.environ.get("DBG"):
        mu.hook_add(UC_HOOK_CODE, dbg, None, 0x40184b, 0x40184b)
    mu.hook_add(UC_HOOK_CODE, hook, None, 0x401D70, 0x401D70)
    mu.hook_add(UC_HOOK_CODE, hook, None, 0x401F90, 0x401F90)
    mu.hook_add(UC_HOOK_CODE, hook, None, 0x7F000000, 0x7F010000)
    # ds:0x404074 / 0x404080 (cout/cin) : pointeurs bidon suffisent (hooks)
    mu.mem_map(0x30000000, 0x1000)     # TIB bidon (fs:0 = chaîne SEH)
    mu.msr_write(0xC0000100, 0x30000000)
    mu.reg_write(UC_X86_REG_ESP, esp0)
    mu.mem_write(esp0, struct.pack("<I", 0x7F00FFF0))
    mu.reg_write(UC_X86_REG_EIP, 0x401220)
    try:
        mu.emu_start(0x401220, 0x7F00FFF0, count=2_000_000)
    except Exception as e:
        print("emu stop:", e, hex(mu.reg_read(UC_X86_REG_EIP)), file=sys.stderr)
    return [o.strip() for o in out]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        assert read_chunks(load_exe()) == CHUNKS, "chunks .rdata != solveur"
        for pw, want in ((PASSWORD, "[+] Access Granted!"), ("petik", "[-] Wrong password!")):
            r = check(pw)
            ok = want in r
            print(f"{pw!r:45} -> {r[-1:] }  {'OK' if ok else 'KO'}")
            if not ok:
                sys.exit(1)
        return
    print(PASSWORD if a.q else f"password = {PASSWORD}")


main()
