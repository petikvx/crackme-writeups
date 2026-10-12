#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_6 by analyst (crackmes.de, Delphi 5).

  python3 tools/k4n6-solve.py petik petik             -> serial (entier signé)
  python3 tools/k4n6-solve.py --check petik petik      # keygen + émulation Unicorn du vrai code (bloc de calcul puis Button1Click entier)
"""
import struct, sys
from pathlib import Path
import pefile

EXE = Path(__file__).resolve().parent.parent / "original" / "k4n6.exe"
PE = pefile.PE(str(EXE))
BASE = PE.OPTIONAL_HEADER.ImageBase
IMG = PE.get_memory_mapped_image()
T = IMG[0x4459DF - BASE: 0x4459DF - BASE + 256]          # table d'octets indexée par caractère
M = 0xFFFFFFFF


def keygen(name: str, company: str) -> int:
    n, c = name.encode("latin-1"), company.encode("latin-1")
    if len(n) < 4 or len(c) < 3:
        raise SystemExit("nom >= 4 caractères et société >= 3 caractères")
    v8 = (T[n[3]] * T[c[2]]) & M
    v = (T[n[0]] * T[n[2]] * T[c[-2]] * T[c[-1]] + v8) & M
    eax = ((v ^ 0x28D8) + 0x288D4A7D) & M
    ecx = ((0x3039 << 6) | (0x3039 >> 26)) & M              # rol ecx,6
    eax ^= 0x9714
    eax = ((eax >> 2) | (eax << 30)) & M                    # ror eax,2
    eax = (eax - (1 << 32) if eax >> 31 else eax) >> 3 & M  # sar eax,3
    eax = (eax + ecx + v8 + 1) & M
    eax = (eax & 0xFFFF0000) | (~eax & 0xFFFF)              # not ax
    eax = (eax + 0x29A) & M
    return eax - (1 << 32) if eax >> 31 else eax            # StrToInt -> Integer signé


def emulate(name: str, company: str) -> int:
    """Exécute le vrai code du binaire (0x4443e5..0x44449e, y compris Length() en 0x403b60)."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EBP, UC_X86_REG_ESP
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    size = (len(IMG) + 0xFFF) & ~0xFFF
    mu.mem_map(BASE, size); mu.mem_write(BASE, IMG)
    mu.mem_map(0x100000, 0x10000)
    ebp, sp = 0x108000, 0x107000
    def dstr(addr, s):                                      # AnsiString Delphi : [refcnt][len] puis données
        b = s.encode("latin-1")
        mu.mem_write(addr - 8, struct.pack("<ii", -1, len(b)) + b + b"\0")
        return addr
    pn, pc = dstr(0x101010, name), dstr(0x102010, company)
    mu.mem_write(ebp - 0x10, struct.pack("<I", pn))
    mu.mem_write(ebp - 0x14, struct.pack("<I", pc))
    mu.reg_write(UC_X86_REG_EBP, ebp); mu.reg_write(UC_X86_REG_ESP, sp)
    mu.emu_start(0x4443E5, 0x44449E)
    v = struct.unpack("<i", mu.mem_read(ebp - 0x4, 4))[0]   # valeur comparée à StrToInt(Edit3)
    return v


def emulate_click(name: str, company: str, serial: str):
    """Exécute tout Button1Click (0x44435c) ; seuls TControl.GetText, StrToInt et ShowMessage sont simulés."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_EDX, UC_X86_REG_ESP, UC_X86_REG_EIP
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0, 0x1000)                                    # fs:[0] (SEH Delphi) avec base FS = 0
    size = (len(IMG) + 0xFFF) & ~0xFFF
    mu.mem_map(BASE, size); mu.mem_write(BASE, IMG)
    mu.mem_map(0x100000, 0x20000); mu.mem_map(0xDEAD0000, 0x1000)
    heap = [0x110000]
    def dstr(s):
        b = s.encode("latin-1"); a = heap[0] + 8
        mu.mem_write(a - 8, struct.pack("<ii", -1, len(b)) + b + b"\0"); heap[0] += (len(b) + 0x20) & ~0xF
        return a
    form = 0x104000
    texts = {1: name, 2: company, 3: serial}
    for off, cid in ((0x2D0, 1), (0x2D4, 2), (0x2D8, 3)):
        mu.mem_write(form + off, struct.pack("<I", cid))
    out = {}
    rd = lambda a: struct.unpack("<I", mu.mem_read(a, 4))[0]
    def ret(uc, val=None):
        esp = uc.reg_read(UC_X86_REG_ESP)
        if val is not None:
            uc.reg_write(UC_X86_REG_EAX, val & 0xFFFFFFFF)
        uc.reg_write(UC_X86_REG_EIP, rd(esp)); uc.reg_write(UC_X86_REG_ESP, esp + 4)
    def hook(uc, addr, size, _):
        if addr == 0x423D1C:                                 # TControl.GetText(Self=eax, var Result=edx)
            uc.mem_write(uc.reg_read(UC_X86_REG_EDX), struct.pack("<I", dstr(texts[uc.reg_read(UC_X86_REG_EAX)])))
            ret(uc)
        elif addr == 0x407B10:                               # StrToInt
            p = uc.reg_read(UC_X86_REG_EAX)
            s = bytes(mu.mem_read(p, rd(p - 4))).decode() if p else ""
            ret(uc, int(s))
        elif addr == 0x443F74:                               # ShowMessage
            p = uc.reg_read(UC_X86_REG_EAX)
            out["msg"] = bytes(mu.mem_read(p, 80)).split(b"\0")[0].decode(); ret(uc)
    mu.hook_add(UC_HOOK_CODE, hook)
    esp = 0x108000
    mu.mem_write(esp, struct.pack("<I", 0xDEAD0000))
    mu.reg_write(UC_X86_REG_ESP, esp); mu.reg_write(UC_X86_REG_EAX, form)
    mu.emu_start(0x44435C, 0xDEAD0000, count=200000)
    return out.get("msg")


if __name__ == "__main__":
    a = sys.argv[1:]
    chk = bool(a) and a[0] == "--check"
    if chk:
        a = a[1:]
    name = a[0] if a else "petik"
    comp = a[1] if len(a) > 1 else "petik"
    k = keygen(name, comp)
    print(k)
    if chk:
        e = emulate(name, comp)
        print(f"émulation 0x4443e5 : [ebp-4] = {e} -> {'OK' if e == k else 'KO'}")
        good = emulate_click(name, comp, str(k))
        bad = emulate_click(name, comp, str(k + 1))
        print(f"Button1Click({name!r}, {comp!r}, {k}) -> {good!r} ; serial+1 -> {bad!r}")
        sys.exit(0 if e == k and good and not bad else 1)
