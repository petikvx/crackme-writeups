#!/usr/bin/env python3
"""M4st4rCr4ck — H1dd4n Fl4g (h1dd3n_fl4g) : le flag n'est affiché par aucun chemin de main.

main @0x1169 : login == "r3v3rs3r" et mot de passe == "lixachev" -> "[!] D0 y0u th1nk 3v3ryth1ng 1s s0 s1mpl3?" (leurre).
Fonctions jamais appelées : Flag_G3t, strcmpr, Easy_Dump, __init_..., toutes sauf UNE impriment du remplissage "br000…" :
   ___init____ @0x12f3 : lea rax,[rip+0x7f23] -> 0x9221 : "[+] FLAG{B3ST_R3V3RS3R}"  ; printf
Le solveur trouve cette fonction via `nm`, lit le lea RIP-relatif et la chaîne ; --check l'appelle sous gdb.
Usage : h1dd3n-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "h1dd3n_fl4g"
d = EXE.read_bytes()
nm = subprocess.run(["nm", str(EXE)], capture_output=True, text=True).stdout
addr = int(next(l.split()[0] for l in nm.splitlines() if l.endswith(" ___init____")), 16)
body = d[addr:addr + 0x20]
i = body.index(bytes.fromhex("488d05"))                       # lea rax,[rip+disp32]
disp = struct.unpack_from("<i", body, i + 3)[0]
target = addr + i + 7 + disp                                   # .rodata (offset fichier = VMA ici)
msg = d[target:d.index(b"\0", target)].decode()
flag = msg.split("] ", 1)[1]
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(flag); sys.exit(0)
print(f"___init____ @ {addr:#x} -> lea {target:#x} -> {msg!r}\nflag = {flag}")
if a.check:
    out = subprocess.run(["gdb", "-q", "-batch", "-ex", "set debuginfod enabled off", "-ex", "break main", "-ex", "run < /dev/null",
                          "-ex", "call (int)___init____()", "-ex", "call (int)fflush(0)", str(EXE)], capture_output=True, text=True).stdout
    ok = msg in out and "$1 = 23" in out
    out2 = subprocess.run([str(EXE)], input="r3v3rs3r\nlixachev\n", capture_output=True, text=True).stdout
    troll = "D0 y0u th1nk" in out2 and "FLAG" not in out2
    print("gdb call ___init____ ->", "OK" if ok else "KO", "| chemin normal (r3v3rs3r/lixachev) sans flag:", troll)
    sys.exit(0 if ok and troll else 1)
