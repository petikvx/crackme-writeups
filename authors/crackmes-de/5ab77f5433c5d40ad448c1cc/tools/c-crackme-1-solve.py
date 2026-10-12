#!/usr/bin/env python3
"""Keygen — c_crackme_1 by ultrasound (crackmes.de, C++ Crackme #1).

  python3 tools/c-crackme-1-solve.py petik            -> ULT-824815863156375-0141
  python3 tools/c-crackme-1-solve.py --check petik     # keygen + émulation Unicorn de la vraie routine 0x401660
  python3 tools/c-crackme-1-solve.py --check petik ULT-824815863156375-2413   # teste un serial donné
"""
import struct, sys
from pathlib import Path
import pefile

EXE = Path(__file__).resolve().parent.parent / "original" / "CPP_Crackme1.exe"
PE = pefile.PE(str(EXE))
T = struct.unpack("<30i", PE.get_data(0x7030, 120))   # table dword @0x407030


def s8(x):
    x &= 0xFF
    return x - 256 if x > 127 else x


def keygen(name: str) -> str:
    n = name.encode("latin-1")[:29]          # GetWindowTextA(..., 0x1e)
    if not n:
        raise SystemExit("nom vide refusé par le crackme")
    b90 = [(n[i] ^ (i + 1)) if i < len(n) else ((T[i] ^ 0x5A) + i) % 0x39 + 0x41 for i in range(30)]
    b70 = [0] * 30
    for i in range(0, 30, 2):                # _swab(b90, b70, 30)
        b70[i], b70[i + 1] = b90[i + 1], b90[i]
    eax = 0
    for i in range(30):                      # mov al,b ; ror eax,1 (eax non remis à zéro)
        eax = (eax & 0xFFFFFF00) | (b70[i] & 0xFF)
        eax = ((eax >> 1) | ((eax & 1) << 31)) & 0xFFFFFFFF
        b70[i] = eax & 0xFF
    dw = [((s8(a) ^ s8(b)) + s8(a) * s8(b)) & 0xFFFFFFFF for a, b in zip(b90, b70)]
    for i in range(15):
        dw[i] = (dw[i] + dw[i + 15]) & 0xFFFFFFFF
    digits = "".join(chr((d & 0xFF) % 9 + 0x30) for d in dw[:15])
    # préfixe "ULT" = toupper(T[k]^0x63) ; le "-2413" construit ensuite est un leurre :
    # seuls 20 chars sont comparés, puis serial[20..23] ^ 0x63 == "SRWR" -> "0141"
    return f"ULT-{digits}-0141"


def emulate(name: bytes, serial: bytes):
    """Exécute la vraie routine de vérif (0x401660) sous Unicorn, APIs Win32 simulées."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESP, UC_X86_REG_EIP
    base = PE.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, 0x20000)
    mu.mem_write(base, PE.get_memory_mapped_image()[:0x20000])
    STK, HK, RET = 0x100000, 0x200000, 0xDEAD0000
    for a in (STK, HK, RET):
        mu.mem_map(a, 0x10000 if a == STK else 0x1000)
    imps = {}
    for e in PE.DIRECTORY_ENTRY_IMPORT:
        for imp in e.imports:
            stub = HK + 4 * len(imps)
            imps[stub] = imp.name.decode()
            mu.mem_write(imp.address, struct.pack("<I", stub))
    mu.mem_write(0x40974C, struct.pack("<I", 1))   # hEditName
    mu.mem_write(0x409750, struct.pack("<I", 2))   # hEditSerial
    rd = lambda a: struct.unpack("<I", mu.mem_read(a, 4))[0]
    cstr = lambda a: bytes(mu.mem_read(a, 256)).split(b"\0")[0]
    out = {}

    def hook(uc, addr, size, _):
        if addr not in imps:
            return
        fn, esp = imps[addr], uc.reg_read(UC_X86_REG_ESP)
        ret, a = rd(esp), [rd(esp + 4 + 4 * k) for k in range(4)]
        if fn == "GetWindowTextA":
            s = (name if a[0] == 1 else serial)[: a[2] - 1]
            uc.mem_write(a[1], s + b"\0"); r, pop = len(s), 12
        elif fn == "lstrlenA":
            r, pop = len(cstr(a[0])), 4
        elif fn == "MessageBoxA":
            out["msg"] = (cstr(a[2]).decode(), cstr(a[1]).decode()); r, pop = 1, 16
        else:
            raise RuntimeError("API non simulée: " + fn)
        uc.reg_write(UC_X86_REG_EAX, r)
        uc.reg_write(UC_X86_REG_ESP, esp + 4 + pop)
        uc.reg_write(UC_X86_REG_EIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    esp = STK + 0x8000
    mu.mem_write(esp, struct.pack("<I", RET))
    mu.reg_write(UC_X86_REG_ESP, esp)
    mu.emu_start(0x401660, RET, count=2_000_000)
    return out.get("msg")


if __name__ == "__main__":
    args = sys.argv[1:]
    if args and args[0] == "--check":
        name = args[1] if len(args) > 1 else "petik"
        serial = args[2] if len(args) > 2 else keygen(name)
        msg = emulate(name.encode("latin-1"), serial.encode())
        print(f"{name} / {serial} -> {msg}")
        sys.exit(0 if msg and msg[0] == "Well Done!" else 1)
    print(keygen(args[0] if args else "petik"))
