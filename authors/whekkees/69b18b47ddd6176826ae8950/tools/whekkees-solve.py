#!/usr/bin/env python3
"""whekkees "very easy crack me $$$" (crackme4.exe) — login/password.

Les deux chaînes sont des immediates C-string (strlen + memcmp) dans la
fonction 0x1400012a0 :
  [rbp-0x11] = 0x6b656877 + 0x73656b      -> "whekkes"
  [rbp-0x19] = 0x72657771 + 0x7974        -> "qwerty"

  python3 whekkees-solve.py            # affiche la réponse
  python3 whekkees-solve.py -q         # login:password seulement
  python3 whekkees-solve.py --check    # émule le check (unicorn) sur le PE extrait du zip
"""
import struct, sys, zipfile, os

LOGIN = (struct.pack("<I", 0x6B656877) + struct.pack("<I", 0x73656B)).rstrip(b"\0").decode()  # "whekkes"
PASSWORD = (struct.pack("<I", 0x72657771) + struct.pack("<H", 0x7974)).decode()               # "qwerty"
BASE, FUNC, RET = 0x140000000, 0x1400012A0, 0x14000FFF0
MEMCMP = 0x140002C67
COUT, CIN, ENDL_IAT, ENDL_STUB = 0x140001630, 0x140001850, 0x1400030B0, 0x14000FF00
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")


def load_pe():
    with zipfile.ZipFile(ZIP) as z:
        z.setpassword(b"crackmes.one")
        return z.read("crackme4.exe")


def run(pe, login, pwd):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RDX
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_R8, UC_X86_REG_RAX
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    nt = struct.unpack_from("<I", pe, 0x3C)[0]
    nsec = struct.unpack_from("<H", pe, nt + 6)[0]
    soh = struct.unpack_from("<H", pe, nt + 20)[0]
    mu.mem_map(BASE, 0x10000)
    mu.mem_write(BASE, pe[:struct.unpack_from("<I", pe, nt + 84)[0]])
    off = nt + 24 + soh
    for i in range(nsec):
        vs, va, rs, rp = struct.unpack_from("<IIII", pe, off + 40 * i + 8)
        mu.mem_write(BASE + va, pe[rp:rp + rs])
    mu.mem_write(ENDL_IAT, struct.pack("<Q", ENDL_STUB))  # cout << endl : stub
    mu.mem_map(0x7000000, 0x10000)
    sp = 0x7008000
    mu.mem_write(sp, struct.pack("<Q", RET))
    mu.reg_write(UC_X86_REG_RSP, sp)
    inputs = [login, pwd]
    out = []

    def ret(uc):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(rsp, 8))[0])
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)

    def hook(uc, addr, size, _):
        if addr == COUT:                             # operator<<(cout, msg)
            p = uc.reg_read(UC_X86_REG_RDX)
            s = bytearray()
            while (b := uc.mem_read(p, 1)) != b"\0":
                s += b; p += 1
            out.append(s.decode().strip())
            ret(uc)
        elif addr == CIN:                            # operator>>(cin, std::string&)
            s = inputs.pop(0).encode()
            d = uc.reg_read(UC_X86_REG_RDX)          # SSO : buf+0 / size+0x10 / cap+0x18
            uc.mem_write(d, s + b"\0")
            uc.mem_write(d + 0x10, struct.pack("<Q", len(s)))
            ret(uc)
        elif addr == MEMCMP:                         # thunk -> vcruntime memcmp(rcx, rdx, r8)
            n = uc.reg_read(UC_X86_REG_R8)
            a = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RCX), n))
            b = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RDX), n))
            uc.reg_write(UC_X86_REG_RAX, (a > b) - (a < b) & 0xFFFFFFFF)
            ret(uc)
        elif addr == ENDL_STUB:
            ret(uc)

    mu.hook_add(UC_HOOK_CODE, hook)
    try:
        mu.emu_start(FUNC, RET, count=20000)
    except Exception as e:
        out.append(f"<emu error {e}>")
    return out


if __name__ == "__main__":
    a = sys.argv[1:]
    if "--check" in a:
        pe = load_pe()
        for l, p in [(LOGIN, PASSWORD), (LOGIN, "wrong"), ("petik", PASSWORD)]:
            print(f"{l}:{p} ->", run(pe, l, p)[-3:])
    elif "-q" in a:
        print(f"{LOGIN}:{PASSWORD}")
    else:
        print(f"login    = {LOGIN}\npassword = {PASSWORD}")
