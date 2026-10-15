#!/usr/bin/env python3
"""crackme_by_fereter_1 (crackmes.de / Fereter) — solveur + vérification.

Le WndProc (WM_COMMAND, id 0x65 = bouton « Check ») :
  1. GetDlgItemInt(hwnd, 100, &ok, TRUE) : le texte doit être un entier valide (ok == 1) ;
  2. GetDlgItemTextA(hwnd, 100, buf, 16) puis compare
       dword buf[0..3] == 0x34393237 + 1 = 0x34393238  -> "8294"
       dword buf[4..7] == 0x00303138                   -> "810\\0"
     donc le nombre attendu est la constante 8294810 (pas de nom, pas de keygen) ;
  3. anti-debug autour : rdtsc (delta > 0x100 -> crash volontaire), scan des octets
     0xCC/0x90 dans 0x4031dd..0x4032b9, IsDebuggerPresent au démarrage.

Usage : ./crackme_by_fereter_1-solve.py            -> affiche le nombre
        ./crackme_by_fereter_1-solve.py --verify [N] -> rejoue le WndProc d'origine sous unicorn
"""
import struct, sys
from pathlib import Path

def solution():
    a = struct.pack("<I", 0x34393237 + 1)          # b"8294"
    b = struct.pack("<I", 0x00303138)              # b"810\0"
    return (a + b).split(b"\0")[0].decode()

def verify(text):
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EIP, UC_X86_REG_EAX
    exe = Path(__file__).resolve().parent.parent / "original" / "crackme.EXE"
    pe = pefile.PE(str(exe))
    base = pe.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, 0x10000)
    for s in pe.sections:
        mu.mem_write(base + s.VirtualAddress, s.get_data()[: s.Misc_VirtualSize or len(s.get_data())])
    STUB = 0x500000
    mu.mem_map(STUB, 0x1000); mu.mem_map(0x600000, 0x10000)
    names = {}
    for e in pe.DIRECTORY_ENTRY_IMPORT:
        for i, imp in enumerate(e.imports):
            addr = STUB + len(names) * 4
            names[addr] = (imp.name.decode(), )
            mu.mem_write(imp.address, struct.pack("<I", addr))
            mu.mem_write(addr, b"\xc3")
    nargs = {"GetDlgItemInt": 4, "GetDlgItemTextA": 4, "MessageBoxA": 4, "SetFocus": 1}
    out = []
    def rd(a, n=4): return struct.unpack("<I", mu.mem_read(a, 4))[0]
    def cstr(a):
        b = bytes(mu.mem_read(a, 64)); return b.split(b"\0")[0].decode("latin1")
    tsc = [0x1000]
    def hook(uc, addr, size, _):
        if bytes(uc.mem_read(addr, 2)) == b"\x0f\x31":   # rdtsc : horloge déterministe (+0x10)
            tsc[0] += 0x10; uc.reg_write(UC_X86_REG_EAX, tsc[0]); uc.reg_write(UC_X86_REG_EIP, addr + 2); return
        if addr not in names: return
        n = names[addr][0]; sp = uc.reg_read(UC_X86_REG_ESP); ret = rd(sp)
        args = [rd(sp + 4 + 4 * k) for k in range(nargs.get(n, 0))]
        r = 0
        if n == "GetDlgItemInt":
            try: v = int(text); ok = 1
            except ValueError: v = 0; ok = 0
            uc.mem_write(args[2], struct.pack("<I", ok)); r = v & 0xFFFFFFFF
        elif n == "GetDlgItemTextA":
            uc.mem_write(args[2], (text.encode()[: args[3] - 1] + b"\0").ljust(args[3], b"\0")); r = len(text)
        elif n == "MessageBoxA":
            out.append(cstr(args[1]))
        elif n == "SetFocus":
            r = 0
        else:
            raise RuntimeError("API inattendue " + n)
        uc.reg_write(UC_X86_REG_EAX, r)
        uc.reg_write(UC_X86_REG_ESP, sp + 4 + 4 * nargs.get(n, 0))
        uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook)
    sp = 0x60f000
    END = 0x600100
    for v in (0, 0x65, 0x111, 0x1234, END):          # args stdcall + adresse de retour
        sp -= 4; mu.mem_write(sp, struct.pack("<I", v))
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.emu_start(0x4030E7, END, count=200000)        # WndProc(hwnd, WM_COMMAND, 0x65, 0)
    return out

if __name__ == "__main__":
    if "--verify" in sys.argv:
        args = [a for a in sys.argv[1:] if a != "--verify"]
        for t in (args or [solution(), "8294811", "12345"]):
            print(f"{t!r:12} -> MessageBox {verify(t)}")
    else:
        print(solution())
