#!/usr/bin/env python3
"""Demian entry level crackme : le mot de passe est lu depuis .rdata (VA 0x140005050).

  demian-solve.py            -> affiche le mot de passe
  demian-solve.py -q         -> idem, sans bavardage
  demian-solve.py --check    -> exécute check_password (0x140001760) sous unicorn
                                avec le mot de passe + un mauvais (preuve sur le PE réel)
Le binaire original/download.bin est en fait un ZIP (mdp crackmes.one) contenant crackme_gui.exe.
"""
import argparse, io, struct, sys, zipfile, os

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
BASE, PW_VA, CHECK_VA = 0x140000000, 0x140005050, 0x140001760


def load_exe():
    return zipfile.ZipFile(ZIP).read("crackme_gui.exe", pwd=b"crackmes.one")


def va2off(d, va):
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    ns, so = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    for i in range(ns):
        o = pe + 24 + so + i * 40
        vs, vrva, rs, rp = struct.unpack_from("<4I", d, o + 8)
        if vrva <= va - BASE < vrva + max(vs, rs):
            return rp + va - BASE - vrva
    raise ValueError


def password(d):
    o = va2off(d, PW_VA)
    return d[o:d.index(b"\0", o)].decode()


def run_check(d, s):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RSP, UC_X86_REG_RAX
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x20000)
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    mu.mem_write(BASE, d[: struct.unpack_from("<I", d, pe + 84)[0]])
    ns, so = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    for i in range(ns):
        o = pe + 24 + so + i * 40
        vs, vrva, rs, rp = struct.unpack_from("<4I", d, o + 8)
        mu.mem_write(BASE + vrva, d[rp:rp + rs])
    # stub de strcmp (jmp [IAT]) : on remplace le thunk par une implémentation maison
    mu.mem_map(0x200000, 0x10000)
    mu.mem_map(0x300000, 0x1000)
    # strcmp : xor eax,eax ; loop: mov dl,[rcx]; mov r8b,[rdx_]... (écrit en asm brut)
    code = bytes.fromhex(
        "4531c0"            # xor r8d,r8d
        "428a0401"          # mov al,[rcx+r8]
        "428a1c02"          # mov bl,[rdx+r8]
        "38d8"              # cmp al,bl
        "750c"              # jne diff
        "84c0"              # test al,al
        "7405"              # je eq
        "49ffc0"            # inc r8
        "ebeb"              # jmp loop
        "31c0c3"            # eq: xor eax,eax; ret
        "b801000000c3"      # diff: mov eax,1; ret
    )
    mu.mem_write(0x300000, code)
    thunk = 0x1400037B0
    mu.mem_write(thunk, b"\x48\xb8" + struct.pack("<Q", 0x300000) + b"\xff\xe0")  # mov rax,imm; jmp rax
    mu.mem_write(0x200800, s.encode() + b"\0")
    sp = 0x20f000
    mu.mem_write(sp, struct.pack("<Q", 0x300800))  # adresse de retour
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.reg_write(UC_X86_REG_RCX, 0x200800)
    mu.emu_start(CHECK_VA, 0x300800, count=200)
    return mu.reg_read(UC_X86_REG_RAX) & 0xFFFFFFFF


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = load_exe()
    pw = password(d)
    if a.check:
        for s in (pw, "petik", pw + "x", ""):
            print(f"check_password({s!r}) = {run_check(d, s)}")
        ok = run_check(d, pw) == 1 and run_check(d, "petik") == 0
        sys.exit(0 if ok else 1)
    print(pw if a.q else f"Mot de passe : {pw}")


if __name__ == "__main__":
    main()
