#!/usr/bin/env python3
"""easy_celen (s4t4y) — id 5ab77f5a33c5d40ad448c4da. ELF32 statique, anti-debug ptrace(TRACEME).

main @0x8048e60 : construit sur la pile « the_flag_is_arip_power » (22 octets, mov byte [esp+0x18+i], imm),
affiche « Welcome! » puis, seulement si le mot [esp+0x14] vaut 0x400, fprintf(stdout, "%s\\n", flag).
Le constructeur @0x8048e24 fait ptrace(PTRACE_TRACEME) : échec (débogueur) -> exit(1).
Ce script relit les 22 immédiats dans le binaire et fait la preuve avec gdb (ptrace neutralisé,
[esp+0x14] forcé à 0x400) pour voir l'affichage.

  celen-solve.py [-q] [--check]
"""
import argparse, re, shutil, subprocess, sys, tempfile
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "celen"
GDB = """set pagination off
set debuginfod enabled off
break *0x8048e49
commands
silent
set $eax = 0
set $eip = 0x8048e4e
continue
end
break *0x8048f06
commands
silent
set *(int*)($esp+0x14) = 0x400
continue
end
run
"""


def flag() -> str:
    d = BIN.read_bytes()
    # 8048e8c: mov BYTE PTR [esp+0x18+i], imm8   (c6 44 24 xx imm)  pour xx = 0x18 .. 0x2d
    out = bytearray()
    o = 0x8048E8C - 0x8048000  # vaddr -> offset fichier (premier LOAD à offset 0)
    for i in range(22):
        assert d[o:o + 4] == bytes([0xC6, 0x44, 0x24, 0x18 + i]), hex(o)
        out.append(d[o + 4]); o += 5
    return out.decode()


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    f = flag()
    print(f if a.q else f"flag : {f}")
    if a.check:
        with tempfile.TemporaryDirectory() as td:
            script = Path(td, "g"); script.write_text(GDB)
            r = subprocess.run(["gdb", "-nx", "-batch", "-x", str(script), str(BIN)], capture_output=True, text=True)
        ok = f in r.stdout
        print("check:", "OK" if ok else "KO", "(gdb : ptrace neutralisé, [esp+0x14]=0x400 -> flag affiché)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
