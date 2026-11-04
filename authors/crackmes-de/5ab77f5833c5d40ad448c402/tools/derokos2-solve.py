#!/usr/bin/env python3
"""Solveur derokos_crackme_2 (deroko) : clé du RAR `crackme_src.rar` (format XXXX-XXXX-XXXX).

crackme.EXE (PE32, TASM) chiffre le prédicat (VA 0x4012e8..0x40135b) par un XOR 0xde ;
un handler SEH (single-step / TF) le déchiffre instruction par instruction à l'exécution.
Ici on déchiffre statiquement, on lit les constantes dans les immédiats et on inverse :

    seg1 = dword[0..3]   : not(rol(seg1,16))        == 0xadabafbe
    seg2 = dword[5..8]   : not(seg2 ^ 0x6c666f72)   == 0xd4d8dccb
    seg3 = dword[10..13] : rol(seg3,16)             == 0x574f5a4e

--check : (1) exécute le code déchiffré sous Unicorn avec la clé en 0x402008 (eax==0 => OK),
         (2) teste la clé sur le RAR (en-têtes chiffrés : 7z l refuse un mauvais mot de passe).
Usage : derokos2-solve.py [-q] [--check] [--zip original/crackme.zip]
"""
import argparse, os, struct, subprocess, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_ZIP = os.path.join(HERE, "..", "original", "crackme.zip")
BASE, RAW, XKEY = 0x401000, 0x600, 0xDE      # VA/offset fichier de CODE, clé XOR
PRED_START, PRED_END = 0x4012E8, 0x40135C
M = 0xFFFFFFFF
rol = lambda x, n: ((x << n) | (x >> (32 - n))) & M
ror = lambda x, n: rol(x, 32 - n)


def load(zpath):
    z = zipfile.ZipFile(zpath)
    z.setpassword(b"crackmes.one")
    return z.read("crackme/crackme.EXE"), z.read("crackme/crackme_src.rar")


def predicate(exe):
    s = PRED_START - BASE + RAW
    return bytes(b ^ XKEY for b in exe[s:s + PRED_END - PRED_START])


def key_from_exe(exe):
    p = predicate(exe)
    imm = lambda va: struct.unpack_from("<I", p, va - PRED_START)[0]
    c1 = imm(0x401313)                       # cmp ebx,imm
    x2, c2 = imm(0x40132B), imm(0x401333)    # xor ebx,imm ; cmp ebx,imm
    c3 = imm(0x40134E)                       # cmp ebx,imm
    s1 = ror(~c1 & M, 16)
    s2 = (~c2 & M) ^ x2
    s3 = ror(c3, 16)
    return struct.pack("<I", s1) + b"-" + struct.pack("<I", s2) + b"-" + struct.pack("<I", s3)


def emu_check(exe, key):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EAX
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x401000, 0x2000)
    mu.mem_write(PRED_START, predicate(exe))
    mu.mem_write(0x402008, key + b"\0")
    mu.emu_start(PRED_START, PRED_END)
    return mu.reg_read(UC_X86_REG_EAX) == 0


def rar_check(key, rar):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "src.rar")
        open(p, "wb").write(rar)
        r = subprocess.run(["7z", "l", "-p" + key.decode(), p], capture_output=True, text=True)
        return "crackme_src/crackme.asm" in r.stdout


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--zip", default=DEF_ZIP)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe, rar = load(a.zip)
    key = key_from_exe(exe)
    if a.check:
        ok_emu = emu_check(exe, key) and not emu_check(exe, b"WRONG-FLAG-XXXX") \
            and not emu_check(exe, b"trap-flag-ownz")
        ok_rar = rar_check(key, rar) and not rar_check(b"WRONG-FLAG-XXXX", rar)
        print(("OK" if ok_emu and ok_rar else "FAIL"), f"emu={ok_emu} rar={ok_rar}", key.decode())
        raise SystemExit(0 if ok_emu and ok_rar else 1)
    print(key.decode() if a.q else f"RAR key : {key.decode()}")
