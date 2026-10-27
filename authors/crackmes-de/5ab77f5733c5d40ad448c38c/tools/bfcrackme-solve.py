#!/usr/bin/env python3
"""bfcrackme (JiM~) — solveur : l'unique octet d'entrée accepté (brainfuck -> COM 16 bits).

Le .COM est une traduction 1:1 du brainfuck de bfcrackme.txt (tape à partir de SI).
Le programme lit UN caractère (INT 21h/AH=8), lui soustrait 208 (20*10 + 8) et
affiche « Congratualtions » si le résultat est 0, « Wrong » sinon.

Usage : bfcrackme-solve.py [-q] [--check [--full]] [--zip ../original/bfcrackme.zip]
  --check : rejoue les 256 entrées sur (1) l'interpréteur BF du .txt et
            (2) le BFCRACKME.COM d'origine émulé avec unicorn (x86-16 + stubs INT 21h).
"""
import argparse, io, os, zipfile
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "bfcrackme.zip")

def load(zpath):
    z = zipfile.ZipFile(zpath)
    z.setpassword(b"crackmes.one")
    com = txt = None
    for n in z.namelist():
        if n.lower().endswith(".com"): com = z.read(n)
        if n.lower().endswith(".txt"): txt = z.read(n).decode("cp437")
    return com, txt

def bf_code(txt):
    # le programme commence après le texte d'intro (première ligne de '+' / '>')
    code = txt[txt.index(">++++++[-<"):]
    return "".join(c for c in code if c in "+-<>[],.")

def bf_run(code, inp):
    j, st = {}, []
    for i, c in enumerate(code):
        if c == "[": st.append(i)
        elif c == "]": k = st.pop(); j[i] = k; j[k] = i
    t = [0] * 30000; p = pc = ii = 0; out = []
    while pc < len(code):
        c = code[pc]
        if c == "+": t[p] = (t[p] + 1) & 255
        elif c == "-": t[p] = (t[p] - 1) & 255
        elif c == ">": p += 1
        elif c == "<": p -= 1
        elif c == ".": out.append(t[p])
        elif c == ",": t[p] = inp[ii] if ii < len(inp) else 0; ii += 1
        elif c == "[" and t[p] == 0: pc = j[pc]
        elif c == "]" and t[p] != 0: pc = j[pc]
        pc += 1
    return bytes(out)

def com_run(com, ch):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR, UcError
    from unicorn.x86_const import (UC_X86_REG_CS, UC_X86_REG_DS, UC_X86_REG_ES,
        UC_X86_REG_SS, UC_X86_REG_SP, UC_X86_REG_AH, UC_X86_REG_AL, UC_X86_REG_DL)
    seg = 0x1000
    mu = Uc(UC_ARCH_X86, UC_MODE_16); mu.mem_map(0, 0x100000)
    mu.mem_write(seg * 16 + 0x100, com)
    mu.mem_write(seg * 16, b"\xcd\x20")                 # PSP:0000 = INT 20h (cible du RET final)
    for r in (UC_X86_REG_CS, UC_X86_REG_DS, UC_X86_REG_ES, UC_X86_REG_SS): mu.reg_write(r, seg)
    mu.reg_write(UC_X86_REG_SP, 0xfffe)
    out = bytearray()
    def intr(mu, n, _):
        if n == 0x21:
            ah = mu.reg_read(UC_X86_REG_AH)
            if ah == 8: mu.reg_write(UC_X86_REG_AL, ch)
            elif ah == 2: out.append(mu.reg_read(UC_X86_REG_DL))
        else: mu.emu_stop()                              # INT 20h = fin
    mu.hook_add(UC_HOOK_INTR, intr)
    try: mu.emu_start(0x100, 0x1100 * 16, count=5_000_000)
    except UcError: pass
    return bytes(out)

def solve(txt):
    code = bf_code(txt)
    ok = [b for b in range(256) if b"Congrat" in bf_run(code, bytes([b]))]
    assert len(ok) == 1
    return ok[0]

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--full", action="store_true")
    ap.add_argument("--zip", default=ZIP)
    a = ap.parse_args()
    com, txt = load(a.zip)
    b = solve(txt)
    if a.check:
        # ~1,5 s par exécution émulée : échantillon par défaut, --full = 256 valeurs (~6 min)
        cands = range(256) if a.full else sorted({0, 13, 65, 0x7F, b - 1, b, b + 1, 255})
        good = [c for c in cands if b"Congrat" in com_run(com, c)]
        assert good == [b], good
        print(f"[check] BFCRACKME.COM émulé ({len(cands)} entrées) : seul 0x{b:02X} donne "
              f"Congratualtions, les autres -> Wrong")
    if a.q:
        print(f"0x{b:02X}")
    else:
        print(f"Octet attendu : {b} = 0x{b:02X} = '{bytes([b]).decode('cp437')}' (CP437)")
        print("Saisie DOS : Alt+208 (pavé num.) ; sous shell : printf '\\xd0'")
