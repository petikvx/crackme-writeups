#!/usr/bin/env python3
"""Solveur ProjectObscura (0x3xp) : le « code secret » est reconstruit par un sprintf("%c"*15, ...)
dont les arguments sont des octets lus dans un ordre mélangé.

  python3 -I tools/obscura-solve.py            # affiche le code secret
  python3 -I tools/obscura-solve.py -q         # code seul
  python3 -I tools/obscura-solve.py --check [exe]  # émule main() sous Unicorn avec ce code
Le binaire est dans original/download.bin (ZIP, mot de passe crackmes.one) ; extrait sous analysis/extracted/.
"""
import argparse, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
EXE = os.path.join(HERE, "..", "analysis", "extracted", "ProjectObscura.exe")

# main() : buffer local rbp+0x1c1 .. rbp+0x1cf (15 octets, stockés en mov byte [rbp+off], imm)
BUF = {0x1cf:'0',0x1ce:'0',0x1cd:'5',0x1cc:'x',0x1cb:'P',0x1ca:'6',0x1c9:'P',0x1c8:'P',
       0x1c7:'D',0x1c6:'6',0x1c5:'G',0x1c4:'E',0x1c3:'7',0x1c2:'T',0x1c1:'A'}
# ordre des arguments de sprintf (r8, r9, puis pile +0x20..+0x80)
ORDER = [0x1cf,0x1cc,0x1c9,0x1c6,0x1c3,0x1ce,0x1cb,0x1c8,0x1c5,0x1c2,0x1cd,0x1ca,0x1c7,0x1c4,0x1c1]

def secret():
    return "".join(BUF[o] for o in ORDER)

def check(exe, given=None):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9
    d = open(exe, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3c)[0]
    nsec = struct.unpack_from("<H", d, pe+6)[0]; opt = struct.unpack_from("<H", d, pe+20)[0]
    base = 0x140000000
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x30000)
    mu.mem_write(base, d[:0x600])
    for i in range(nsec):
        o = pe+24+opt+40*i
        vs, va, rs, ro = struct.unpack_from("<IIII", d, o+8)
        mu.mem_write(base+va, d[ro:ro+min(rs, vs)])
    mu.mem_map(0x7000000, 0x100000); mu.mem_map(0x9000000, 0x10000)
    sp = 0x7000000+0xf0000
    iat = {}   # stub addresses pour __imp_*
    stubs = {0x14000a3e8: "iob", 0x14000a450: "MsgW", 0x14000a448: "MsgA"}
    for a, n in stubs.items():
        mu.mem_write(a, struct.pack("<Q", 0x9000000+a % 0x1000))
    hooks = {0x140001d30:"__main", 0x140002da0:"sprintf", 0x140001c30:"banner", 0x140002fb0:"puts",
             0x140002e00:"printf", 0x140002fa8:"fgets", 0x140002f68:"strlen", 0x140002f60:"strcmp",
             0x140001847:"WRONG", 0x14000187e:"WIN"}
    for a, n in stubs.items(): hooks[0x9000000+a % 0x1000] = n
    state = {"res": None, "expected": None, "flag": None}
    pw = (given or secret()).encode()
    def rd(a, n): return bytes(mu.mem_read(a, n))
    def cstr(a):
        s = b""
        while True:
            c = rd(a, 1)
            if c == b"\0": return s
            s += c; a += 1
    def ret(v=0):
        rsp = mu.reg_read(UC_X86_REG_RSP)
        mu.reg_write(UC_X86_REG_RAX, v)
        mu.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", rd(rsp, 8))[0])
        mu.reg_write(UC_X86_REG_RSP, rsp+8)
    def hook(uc, addr, size, _):
        n = hooks.get(addr)
        if not n: return
        rsp = uc.reg_read(UC_X86_REG_RSP)
        rcx, rdx, r8, r9 = (uc.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9))
        if n == "sprintf":
            fmt = cstr(rdx); k = fmt.count(b"%c")
            args = [r8 & 0xff, r9 & 0xff] + [struct.unpack("<I", rd(rsp+0x28+8*i, 4))[0] & 0xff for i in range(k-2)]
            uc.mem_write(rcx, bytes(args)+b"\0"); ret(k)
        elif n == "fgets":
            uc.mem_write(rcx, pw+b"\n\0"); ret(rcx)
        elif n == "strlen": ret(len(cstr(rcx)))
        elif n == "strcmp":
            state["expected"] = cstr(rdx); ret(0 if cstr(rcx) == cstr(rdx) else 1)
        elif n == "WIN": state["res"] = "WIN"
        elif n == "MsgA": state["flag"] = cstr(rdx); uc.emu_stop()
        elif n == "WRONG": state["res"] = "WRONG"; uc.emu_stop()
        elif n == "iob": ret(0)
        else: ret(0)
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.mem_write(sp, struct.pack("<Q", 0x9000f00))   # adresse de retour bidon
    mu.emu_start(0x140001450, 0x9000f00, count=5000)
    return state

if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--pw", help="code à tester avec --check (défaut : le bon)")
    ap.add_argument("--check", nargs="?", const=EXE, metavar="EXE")
    a = ap.parse_args()
    if a.check:
        if not os.path.exists(a.check):
            zipfile.ZipFile(ZIP).extractall(os.path.dirname(a.check), pwd=b"crackmes.one")
        st = check(a.check, a.pw)
        print("attendu par strcmp:", st["expected"], "| fourni:", a.pw or secret(), "| résultat:", st["res"], "| MessageBox:", st["flag"])
        sys.exit(0 if st["res"] == "WIN" else 1)
    print(secret() if a.q else "Code secret : " + secret())
