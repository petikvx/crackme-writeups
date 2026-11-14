#!/usr/bin/env python3
"""liboxin's my ollvm test — récupère le mot de passe attendu.

Émule main (0x140001000) sous Unicorn, stubbe printf/fgets/strcspn du CRT
statique, et lit le 2e argument du strcmp (0x140029210) : le mot de passe.

  python3 ollvm-test-solve.py [-q] [--check]
Dépendances : unicorn ; --check : wine + xvfb-run.
"""
import argparse, io, struct, subprocess, sys, zipfile
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

HERE = Path(__file__).resolve().parent
ZIP = HERE.parent / "original" / "download.bin"
IB, MAIN, MAIN_END = 0x140000000, 0x140001000, 0x14000FB98
STRDEC, PRINTF, FGETS, STRCSPN, STRCMP = 0x14000FBA0, 0x140012710, 0x140016188, 0x1400163C0, 0x140029210
SECTIONS = [(0x1000, 0x28890, 0x400), (0x2A000, 0xAA6E, 0x28E00), (0x35000, 0xE00, 0x33A00),
            (0x37000, 0x13F8, 0x34800), (0x39000, 0x100, 0x35C00)]  # va, vsize, fileoff


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("test.obf.exe", pwd=b"crackmes.one")


def recover(exe, probe=b"petik"):
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(IB, 0x40000)
    mu.mem_write(IB, exe[:0x400])
    for va, sz, off in SECTIONS:
        mu.mem_write(IB + va, exe[off:off + sz])
    stk = 0x7FF000080000
    mu.mem_map(0x7FF000000000, 0x100000)
    mu.mem_map(0x10000, 0x1000)
    mu.mem_write(stk, struct.pack("<Q", 0x10000))
    mu.reg_write(UC_X86_REG_RSP, stk)
    found = []
    funcs = {IB + struct.unpack_from("<I", exe, 0x34800 + i)[0] for i in range(0, 0x13F8, 12)}

    def ret(rax):
        rsp = mu.reg_read(UC_X86_REG_RSP)
        r = struct.unpack("<Q", mu.mem_read(rsp, 8))[0]
        mu.reg_write(UC_X86_REG_RAX, rax)
        mu.reg_write(UC_X86_REG_RSP, rsp + 8)
        mu.reg_write(UC_X86_REG_RIP, r)

    def hook(uc, a, sz, _):
        if a == STRCMP:
            found.append(bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RDX), 64)).split(b"\0")[0])
            uc.emu_stop()
        elif a == PRINTF:
            ret(0)
        elif a == FGETS:
            rc = uc.reg_read(UC_X86_REG_RCX)
            uc.mem_write(rc, probe + b"\n\0")
            ret(rc)
        elif a == STRCSPN:
            ret(len(probe))
        elif a in funcs and a not in (MAIN, STRDEC):
            raise RuntimeError(f"appel inattendu {a:#x}")

    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(MAIN, 0, count=50_000_000)
    if not found:
        raise RuntimeError("strcmp non atteint")
    return found[0].decode()


def check(exe, pw):
    exe_path = Path("/tmp/ollvm-test-check") / "test.obf.exe"
    exe_path.parent.mkdir(exist_ok=True)
    exe_path.write_bytes(exe)
    out = subprocess.run(["xvfb-run", "-a", "wine", str(exe_path)], input=pw + "\n", text=True,
                         capture_output=True, timeout=60).stdout
    return "[OK]" in out, out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie sous Wine")
    a = ap.parse_args()
    exe = load_exe()
    pw = recover(exe)
    print(pw if a.q else f"mot de passe : {pw}")
    if a.check:
        ok, out = check(exe, pw)
        print("Wine :", "OK" if ok else "KO", file=sys.stderr)
        sys.exit(0 if ok else 1)
