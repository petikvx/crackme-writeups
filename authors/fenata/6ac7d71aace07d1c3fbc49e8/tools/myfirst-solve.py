#!/usr/bin/env python3
"""fenata Easiest_my_first (myfirst.exe) : mot de passe fixe `123456`.

Le binaire (MSVC debug, nécessite ucrtbased/MSVCP140D, absents de Wine nu) fait :
    strcpy(buf, "123456"); cin >> input; if (!strcmp(input, buf)) puts("Congratulations!")

  tools/myfirst-solve.py            -> affiche le mot de passe
  tools/myfirst-solve.py -q         -> mot de passe seul
  tools/myfirst-solve.py --check    -> émule main() du PE d'origine (unicorn) avec le mot de passe
                                      (ou --check --pw XXX pour tester un autre : KO attendu)
Pas de user/login dans ce crackme (pas de petik).
"""
import argparse, os, struct, sys

PASSWORD = "123456"
MAIN, VA_STR_PROMPT = 0x140014e30, 0x14001f040
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "myfirst.exe")


def check(pw: str) -> bool:
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RIP

    pe = pefile.PE(EXE)
    base = pe.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x40000)
    mu.mem_write(base, pe.header)
    for s in pe.sections:
        mu.mem_write(base + s.VirtualAddress, s.get_data())
    # stubs pour l'IAT : chaque entrée -> adresse unique dans une zone hookée
    STUB = 0x7f0000000
    mu.mem_map(STUB, 0x10000)
    names = {}
    for i, (d, imp) in enumerate((d, i) for d in pe.DIRECTORY_ENTRY_IMPORT for i in d.imports):
        a = STUB + i * 16
        mu.mem_write(imp.address - 0 if False else imp.address, struct.pack("<Q", a))
        names[a] = (imp.name or b"").decode()
    HEAP, STACK = 0x200000000, 0x300000000
    mu.mem_map(HEAP, 0x10000); mu.mem_map(STACK, 0x100000)
    mu.mem_write(base + 0x40000 - 8 if False else 0x140022040, struct.pack("<Q", 0x2b992ddfa232))  # security cookie
    out, st = [], {"heap": HEAP + 0x4000, "inbuf": HEAP + 0x1000}
    mu.mem_write(st["inbuf"], b"\0")

    def cstr(a):
        r = b""
        while (c := mu.mem_read(a, 1)) != b"\0":
            r += bytes(c); a += 1
        return r

    def ret(uc, v=0):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        uc.reg_write(UC_X86_REG_RAX, v)
        uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(rsp, 8))[0])
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)

    def hook(uc, addr, size, _):
        rcx, rdx = uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_RDX)
        if addr in (0x140011276, 0x1400112c1, 0x1400112cb):   # JMC / RTC / cookie check
            return ret(uc)
        if addr == 0x1400114e2:     # template std::operator>>(istream&, char*) (thunk locale)
            uc.mem_write(rdx, pw.encode() + b"\0"); return ret(uc, rcx)
        if addr == 0x1400111fe:     # template std::operator<<(ostream&, const char*)
            out.append(cstr(rdx).decode(errors="replace")); return ret(uc, rcx)
        n = names.get(addr)
        if n is None:
            return
        if n == "VirtualAlloc":
            return ret(uc, st["heap"])
        if n == "strcpy":
            uc.mem_write(rcx, cstr(rdx) + b"\0"); return ret(uc, rcx)
        if n == "strcmp":
            a, b = cstr(rcx), cstr(rdx); return ret(uc, (a > b) - (a < b) & 0xffffffff)
        if "?cin@" in n or "?cout@" in n:
            return
        if n.startswith("??5"):     # cin >> char*
            uc.mem_write(rdx, pw.encode() + b"\0"); return ret(uc, rcx)
        if n.startswith("??6"):     # cout << x
            if rdx > 0x100000000: out.append(cstr(rdx).decode(errors="replace"))
            return ret(uc, rcx)
        return ret(uc)

    mu.hook_add(UC_HOOK_CODE, hook)
    rsp = STACK + 0x80000
    mu.mem_write(rsp, struct.pack("<Q", 0x1234))  # adresse de retour factice
    mu.reg_write(UC_X86_REG_RSP, rsp)
    try:
        mu.emu_start(MAIN, 0x1234, count=100000)
    except Exception as e:
        if "0x1234" not in str(e) and mu.reg_read(UC_X86_REG_RIP) != 0x1234:
            print("emu:", e, hex(mu.reg_read(UC_X86_REG_RIP)), file=sys.stderr)
    print("sortie émulée:", out, file=sys.stderr)
    return any("Congratulations" in s for s in out)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--pw", default=PASSWORD)
    a = ap.parse_args()
    if a.check:
        ok = check(a.pw)
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(PASSWORD if a.q else f"password = {PASSWORD}")
