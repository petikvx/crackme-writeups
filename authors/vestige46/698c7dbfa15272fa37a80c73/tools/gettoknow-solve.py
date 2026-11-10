#!/usr/bin/env python3
"""vestige46 GetToKnow (GTK-v0.1.exe) — mot de passe en dur.

  python3 tools/gettoknow-solve.py          # affiche le mot de passe
  python3 tools/gettoknow-solve.py -q       # idem, sans fioritures
  python3 tools/gettoknow-solve.py --check  # émule le vrai main() (unicorn) : OK + KO

Le binaire est un ZIP chiffré (mot de passe site : crackmes.one) contenant GTK-v0.1.exe ;
--check l'extrait avec 7z sous analysis/extracted/ (original/ n'est jamais touché).
"""
import argparse, os, struct, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "download.bin")
EXE = os.path.join(ROOT, "analysis", "extracted", "GTK-v0.1.exe")

# immediates de main() : movabs rax / movabs rdx / mov WORD PTR [rbp-0x10]
Q1, Q2, W = 0x33685454304E6D31, 0x4D74357572547750, 0x33


def password():
    return (struct.pack("<QQH", Q1, Q2, W)).rstrip(b"\0").decode()


def emulate(pw):
    """Exécute main() du PE (0x140001450) ; stubs sur puts/scanf/strcmp/system. Retourne le texte affiché."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RAX, \
        UC_X86_REG_RCX, UC_X86_REG_RDX
    if not os.path.exists(EXE):
        os.makedirs(os.path.dirname(EXE), exist_ok=True)
        subprocess.run(["7z", "x", "-pcrackmes.one", "-o" + os.path.dirname(EXE), ZIP, "-y"],
                       check=True, stdout=subprocess.DEVNULL)
    d = open(EXE, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    optsz = struct.unpack_from("<H", d, pe + 20)[0]
    base = struct.unpack_from("<Q", d, pe + 24 + 24)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x20000)
    mu.mem_write(base, d[:0x400])
    for i in range(nsec):
        o = pe + 24 + optsz + 40 * i
        va, rsz, raw = struct.unpack_from("<III", d, o + 12)
        if va >= 0xC000:  # sections debug : inutiles
            continue
        mu.mem_write(base + va, d[raw:raw + rsz])
    mu.mem_map(0x200000, 0x10000)
    mu.mem_map(0x300000, 0x1000)
    out = []

    def hook(uc, addr, size, _):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
        rcx, rdx = uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_RDX)
        if addr == base + 0x27E8:    # puts
            out.append(_cs(uc, rcx))
            ax = 1
        elif addr == base + 0x2640:  # scanf("%s", buf)
            uc.mem_write(rdx, pw.encode() + b"\0")
            ax = 1
        elif addr == base + 0x27A0:  # strcmp
            a, b = _cs(uc, rcx), _cs(uc, rdx)
            ax = (a > b) - (a < b) & 0xFFFFFFFF
        elif addr == base + 0x2860:  # system("pause")
            ax = 0
        elif addr == base + 0x15D0:  # __main
            ax = 0
        else:
            return
        uc.reg_write(UC_X86_REG_RAX, ax)
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)
        uc.reg_write(UC_X86_REG_RIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    rsp = 0x20F000
    mu.mem_write(rsp, struct.pack("<Q", 0x300000))  # retour factice
    mu.reg_write(UC_X86_REG_RSP, rsp)
    mu.emu_start(base + 0x1450, 0x300000)
    return out


def _cs(uc, a):
    s = b""
    while True:
        c = bytes(uc.mem_read(a, 1))
        if c == b"\0":
            return s.decode()
        s += c
        a += 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = password()
    if a.q:
        print(pw)
    else:
        print("GetToKnow — mot de passe :", pw)
    if a.check:
        ok = emulate(pw)
        ko = emulate("petik")
        print("OK  ->", ok)
        print("KO  ->", ko)
        assert "YOU DID IT! LETS GOOO" in ok and "Try again..." in ko
        print("check OK")


if __name__ == "__main__":
    sys.exit(main())
