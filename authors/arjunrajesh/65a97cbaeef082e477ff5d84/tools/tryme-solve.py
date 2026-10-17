#!/usr/bin/env python3
"""ArjunRajesh — FLAG (tryme) : flag de 21 caractères passé en argv[1].

main @0x1165 :
  len(argv[1]) == 0x15 ; key = "sup3r_s3cr3t_k3y_1337" (.rodata+0x25)
  boucle 1 : buf[i] = key[i] - 0x22                       (@0x120d : sub eax,0x22)
  boucle 2 : (signed char)(buf[i] ^ argv[1][i]) == table[i]  (21 dwords sur la pile, mov DWORD PTR [rbp-0x80+4k], imm)
=> flag[i] = (key[i] - 0x22) ^ table[i]
Usage : tryme-solve.py [-q] [--check]
"""
import argparse, re, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "tryme"
d = EXE.read_bytes()
main = d[0x1165:0x1360]
key = d[0x2025:d.index(b"\0", 0x2025)]
sub = main[main.index(bytes.fromhex("83e8")) + 2]                 # sub eax, 0x22
tab = {}
for m in re.finditer(rb"\xc7\x45([\x80-\xd0])(....)", main, re.S):    # mov DWORD PTR [rbp-disp8], imm32
    disp = 256 - m.group(1)[0]
    if 0x30 <= disp <= 0x80:
        tab[disp] = struct.unpack("<I", m.group(2))[0]
table = [tab[k] for k in sorted(tab, reverse=True)]                  # [rbp-0x80] .. [rbp-0x30], ordre croissant d'indice
assert len(table) == len(key) == 21, (len(table), len(key))
flag = bytes(((k - sub) & 0xFF) ^ t for k, t in zip(key, table)).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(flag); sys.exit(0)
print(f"key = {key.decode()}  (-{sub:#x})  table = {[hex(t) for t in table]}\nflag = {flag}")
if a.check:
    run = lambda *x: subprocess.run([str(EXE), *x], capture_output=True, text=True).stdout.strip()
    ok, ko1, ko2, ko3 = run(flag), run(flag[:-1] + "x"), run(flag[:-1]), run()
    print("OK:", ok, "| KO:", ko1, "|", ko2, "|", ko3)
    sys.exit(0 if ok == f"You found a flag! {flag}" and ko1 == ko2 == "Wrong flag" and ko3.startswith("Usage") else 1)
