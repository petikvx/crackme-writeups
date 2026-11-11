#!/usr/bin/env python3
"""whekkees "my first simple crack me" — login/password.

Les deux chaînes sont comparées octet par octet à des constantes (immediates
mov dword [rbp-0x50], ...) dans la fonction 0x1400012a0.

  python3 whekkees-solve.py            # affiche la réponse
  python3 whekkees-solve.py -q         # login:password seulement
  python3 whekkees-solve.py --check [crackme.exe]
        # émule la fonction de check (unicorn) sur le PE extrait du zip
"""
import struct, sys, zipfile, os, io

LOGIN = struct.pack("<II", 0x6B656877, 0x7365656B).decode()   # "whekkees"
PASSWORD = (struct.pack("<I", 0x72657771) + b"\x74").decode()  # "qwert"
BASE, FUNC = 0x140000000, 0x1400012A0
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")


def load_pe():
    with zipfile.ZipFile(ZIP) as z:
        z.setpassword(b"crackmes.one")
        return z.read("crackme.exe")


def run(pe, login, pwd):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RDX
    from unicorn.x86_const import UC_X86_REG_RCX
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
    mu.mem_map(0x7000000, 0x10000)
    sp = 0x7008000
    mu.mem_write(sp, struct.pack("<Q", 0x14000FFF0))  # adresse de retour
    mu.reg_write(UC_X86_REG_RSP, sp)
    inputs = [login, pwd]
    out = []

    def hook(uc, addr, size, _):
        if addr == 0x140001610:                      # operator<<(cout, msg)
            p = uc.reg_read(UC_X86_REG_RDX)
            s = bytearray()
            while (b := uc.mem_read(p, 1)) != b"\0":
                s += b; p += 1
            out.append(s.decode().strip())
            ret(uc)
        elif addr == 0x1400017F0:                    # operator>>(cin, std::string&)
            s = inputs.pop(0).encode()
            d = uc.reg_read(UC_X86_REG_RDX)          # SSO : buf+0 / size+0x10 / cap+0x18
            uc.mem_write(d, s + b"\0")
            uc.mem_write(d + 0x10, struct.pack("<Q", len(s)))
            ret(uc)

    def ret(uc):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(rsp, 8))[0])
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)

    mu.hook_add(UC_HOOK_CODE, hook)
    try:
        mu.emu_start(FUNC, 0x14000FFF0, count=5000)
    except Exception:
        pass
    return out


if __name__ == "__main__":
    a = sys.argv[1:]
    if "--check" in a:
        pe = load_pe()
        for l, p in [(LOGIN, PASSWORD), (LOGIN, "wrong"), ("petik", PASSWORD)]:
            print(f"{l}:{p} ->", run(pe, l, p)[-1:])
    elif "-q" in a:
        print(f"{LOGIN}:{PASSWORD}")
    else:
        print(f"login    = {LOGIN}\npassword = {PASSWORD}")
