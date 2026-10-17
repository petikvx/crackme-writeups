#!/usr/bin/env python3
"""Solveur — crackmes.de's « crackme » by aharli (VB.NET WinForms).

Les identifiants sont codés en dur dans Button1_Click (deux Operators.CompareString) :
User = "aharli", Pass = "1368". Pas de keygen possible : le nom est fixe (petik refusé).

Ce script relit le tas #US (user strings .NET) du binaire d'origine pour prouver que
les deux littéraux comparés sont bien là, puis rejoue la logique du bouton.

  ./aharli-crackme-solve.py            # affiche User / Pass
  ./aharli-crackme-solve.py -q         # "aharli 1368"
  ./aharli-crackme-solve.py --check    # parse #US + simulation OK/KO
"""
import argparse, struct, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "Crack me.exe"
USER, PASS = "aharli", "1368"

def us_heap(data):
    """Retourne la liste des chaînes du tas #US d'un assembly .NET (PE32)."""
    pe = struct.unpack_from("<I", data, 0x3C)[0]
    nsec = struct.unpack_from("<H", data, pe + 6)[0]
    opt = pe + 24
    secs = []
    so = opt + struct.unpack_from("<H", data, pe + 20)[0]
    for i in range(nsec):
        vs, va, rs, rp = struct.unpack_from("<IIII", data, so + i * 40 + 8)
        secs.append((va, max(vs, rs), rp))
    def rva2off(r):
        for va, sz, rp in secs:
            if va <= r < va + sz:
                return r - va + rp
        raise ValueError(hex(r))
    cli_rva = struct.unpack_from("<I", data, opt + 96 + 14 * 8)[0]  # data dir #14 (CLR header, PE32)
    cli = rva2off(cli_rva)
    md = rva2off(struct.unpack_from("<I", data, cli + 8)[0])
    vlen = struct.unpack_from("<I", data, md + 12)[0]
    p = md + 16 + vlen + 2
    nstreams = struct.unpack_from("<H", data, p)[0]; p += 2
    for _ in range(nstreams):
        off, size = struct.unpack_from("<II", data, p); p += 8
        name = data[p:data.index(b"\0", p)].decode(); p += (len(name) + 4) & ~3
        if name == "#US":
            heap = data[md + off: md + off + size]
            break
    else:
        raise SystemExit("pas de tas #US")
    out, i = [], 1
    while i < len(heap):
        b = heap[i]
        if b & 0x80 == 0: n, i = b, i + 1
        elif b & 0xC0 == 0x80: n, i = ((b & 0x3F) << 8) | heap[i + 1], i + 2
        else: n, i = ((b & 0x1F) << 24) | (heap[i+1] << 16) | (heap[i+2] << 8) | heap[i+3], i + 4
        if n == 0: continue
        out.append(heap[i:i + n - 1].decode("utf-16le")); i += n
    return out

def button1(user, pw, state):
    """Rejoue Button1_Click : a démarre à 1 (Form1_Load)."""
    if user != USER and pw != PASS:      # opérateur & non court-circuité : les DEUX faux
        state["a"] += 1
        if state["a"] >= 3:
            return "Can not Cracked (EndApp)"
        return None                       # rien d'affiché
    if user == USER and pw == PASS:
        return "Cracked"
    return None                           # un seul champ faux : silence, pas de compteur

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        strs = us_heap(EXE.read_bytes())
        print("#US :", strs)
        assert USER in strs and PASS in strs and "Cracked" in strs, "littéraux absents"
        st = {"a": 1}
        cases = [("petik", "0000"), ("aharli", "0000"), ("petik", "1368"), (USER, PASS)]
        for u, p in cases:
            print(f"  {u!r:10} {p!r:8} -> {button1(u, p, st)}  (a={st['a']})")
        st = {"a": 1}
        print("  2 essais tout faux :", button1("x", "y", st), "/", button1("x", "y", st))
        assert button1(USER, PASS, {"a": 1}) == "Cracked"
        print("OK")
        return
    print(f"{USER} {PASS}" if a.q else f"User : {USER}\nPass : {PASS}")

if __name__ == "__main__":
    main()
