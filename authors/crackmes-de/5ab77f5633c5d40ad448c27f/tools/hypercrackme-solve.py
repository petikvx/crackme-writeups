#!/usr/bin/env python3
"""hypercrackme (thehyper) — calcul du serial + vérification par émulation du vrai WndProc.

Serial N (atodw) valide si :
  * les 6 nombres premiers de [20,45[ divisent N : 23,29,31,37,41,43 ;
  * la somme des chiffres de N vaut 0x32 = 50 (elle devient l'ID du menu « Register »,
    et seul l'ID 0x32 déclenche WM_COMMAND 0x7d05 -> « Good job »).
  -> N = 23*29*31*37*41*43 = 1348781387 (le seul multiple qui tienne sur 31 bits).

  python3 tools/hypercrackme-solve.py            # serial + vérif émulée
  python3 tools/hypercrackme-solve.py --serial X # teste un serial arbitraire
"""
import argparse, struct, sys
from pathlib import Path

def isprime(n): return n > 1 and all(n % d for d in range(2, n))

def solve():
    P = 1
    for p in range(20, 45):
        if isprime(p): P *= p
    sols = [k * P for k in range(1, 2**31 // P + 1) if sum(map(int, str(k * P))) == 50]
    return P, sols

def emulate(serial: str):
    """Exécute le code du binaire (dépacké en mémoire via émulation du stub UPX)."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EIP, UC_X86_REG_EAX
    here = Path(__file__).resolve().parent.parent
    pe = pefile.PE(str(here / "original/HyperCrackme.exe")); IB = pe.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(IB, 0x10000)
    mu.mem_write(IB, pe.get_memory_mapped_image()[:0x8000])
    STUB = 0x700000; mu.mem_map(STUB, 0x20000); mu.mem_map(0x800000, 0x100000)
    names, n = {}, 0
    for d in pe.DIRECTORY_ENTRY_IMPORT:
        for imp in d.imports:
            a = STUB + n * 16; names[a] = (imp.name or b"?").decode()
            mu.mem_write(imp.address, struct.pack("<I", a)); n += 1
    fake = [STUB + 0x8000]
    st = {"phase": "unpack", "msgs": [], "wid": None, "pending": []}
    NARGS = {"GetWindowTextA": 3, "InsertMenuItemA": 4, "DrawMenuBar": 1, "MessageBoxA": 4,
             "SendMessageA": 4, "SetWindowTextA": 2, "DestroyWindow": 1}
    def cstr(a): return bytes(mu.mem_read(a, 256)).split(b"\0")[0].decode("latin1")
    def hook(uc, addr, size, _):
        if st["phase"] == "unpack" and IB + 0x1000 <= addr < IB + 0x6000:
            st["phase"] = "oep"; uc.emu_stop(); return
        if not (STUB <= addr < STUB + 0x20000): return
        nm = names.get(addr, "?"); esp = uc.reg_read(UC_X86_REG_ESP)
        ret = struct.unpack("<I", uc.mem_read(esp, 4))[0]
        a = struct.unpack("<4I", uc.mem_read(esp + 4, 16)); v, k = 0, NARGS.get(nm, 0)
        if nm == "GetProcAddress":
            f = cstr(a[1]) if a[1] > 0xffff else "#%d" % a[1]
            fake[0] += 16; names[fake[0]] = f; v, k = fake[0], 2
        elif nm == "LoadLibraryA": v, k = 0x10000000, 1
        elif nm == "VirtualProtect": v, k = 1, 4
        elif nm == "GetWindowTextA":
            b = serial.encode()[: a[2] - 1]; uc.mem_write(a[1], b + b"\0"); v = len(b)
        elif nm == "InsertMenuItemA":
            st["wid"] = struct.unpack("<I", uc.mem_read(a[3] + 16, 4))[0]; v = 1
        elif nm == "MessageBoxA": st["msgs"].append(cstr(a[1])); v = 1
        elif nm == "SendMessageA": st["pending"].append((a[1], a[2], a[3])); v = 0
        elif nm == "DestroyWindow": st["msgs"].append("<DestroyWindow>"); v = 1
        uc.reg_write(UC_X86_REG_EAX, v); uc.reg_write(UC_X86_REG_ESP, esp + 4 + 4 * k)
        uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.reg_write(UC_X86_REG_ESP, 0x8f0000)
    mu.emu_start(IB + pe.OPTIONAL_HEADER.AddressOfEntryPoint, 0)
    RET = STUB + 0x1fff0; mu.mem_write(RET, b"\xf4")
    def wndproc(msg, wp, lp=0):
        esp = 0x8e0000; mu.mem_write(esp, struct.pack("<5I", RET, 0x1234, msg, wp, lp))
        mu.reg_write(UC_X86_REG_ESP, esp); mu.emu_start(0x401126, RET)
    wndproc(0x111, 0x7d00)                  # clic sur « Check »
    if st["wid"] is not None:
        wndproc(0x111, st["wid"])           # clic sur le menu « Register » ajouté
        while st["pending"]:
            m, w, l = st["pending"].pop(0); wndproc(m, w, l)
    return st

if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--serial"); a = ap.parse_args()
    P, sols = solve()
    print(f"produit des premiers 23..43 = {P} ; serials 31 bits (somme chiffres 50) : {sols}")
    s = a.serial or str(sols[0])
    st = emulate(s)
    print(f"serial={s!r} -> menu wID={st['wid']} messages={st['msgs']}")
    ok = any(m.startswith("Good job") for m in st["msgs"])
    print("VALIDE" if ok else "INVALIDE"); sys.exit(0 if ok else 1)
