#!/usr/bin/env python3
"""Keymaker KeygenMe 0.68 (bswap, crackmes.de) — 3 entrées.

1. Code d'entrée (dialogue « Enter code to entry », edit 0xFA, 15 car. max), testé à chaque frappe :
     c[0] == c[11]  et  c[2] == c[9]  et  c[0] != c[9]           (>= 12 caractères)
   petik -> "petikabcdtep"
2. Key (edit 0xC9) : seul compte le 4e caractère, testé à chaque frappe :
     GetDlgItemTextA(…, 5) renvoie min(len,4) ; 4 + 0x6E = 'r'  →  key[3] == 'r'
   La conversion hex des 16 caractères est bien faite mais lavée par 0x3999 tours de
   shr/shl : T = 09 4C 95 64 6C 78 06 F3 | 00*8, constant.
3. Name (edit 0xC8, 16 car. max) : name'[15-i] = name[15-i] + tbl[0x4032bc+i] (table remplie au
   WM_INITDIALOG) puis `repne cmpsw` : il suffit qu'UN mot de 2 octets coïncide avec T.
   Seul couple imprimable : mot 6 → name[12:14] == "Tl" (name >= 14 car.).
   petik -> name "petik_petik_Tl", key "petr"

  ./keygenme068-solve.py [nom]     # code d'entrée + name + key
  ./keygenme068-solve.py -q        # une ligne : code name key
  ./keygenme068-solve.py --check CODE NAME KEY
"""
import argparse, sys

T = bytes.fromhex("094c95646c7806f3") + bytes(8)        # sortie constante du lavage (Unicorn)
ADD = bytes.fromhex("38e8d217e43c825f60c00227ac9452ff") # name'[j] = name[j] + ADD[j] (Unicorn, nom nul)

def entry_ok(c: bytes) -> bool:                       # 0x401d76..0x401dbc
    c = (c[:15] + b"\0" * 16)[:16]
    return c[0] == c[11] and c[2] == c[9] and c[0] != c[9]

def key_ok(k: bytes) -> bool:                         # 0x4014cd : min(len,4) + 0x6e == k[3]
    return len(k) >= 4 and k[3] == 4 + 0x6E

def name_ok(n: bytes) -> bool:                        # 0x40161c..0x401648 (repne cmpsw)
    n = (n[:16] + b"\0" * 16)[:16]
    p = bytes((n[j] + ADD[j]) & 0xFF for j in range(16))
    return any(p[2*k:2*k+2] == T[2*k:2*k+2] for k in range(8))

def needed():
    """Pour chaque mot k, le couple name[2k], name[2k+1] qui le fait coïncider."""
    return {k: bytes((T[j] - ADD[j]) & 0xFF for j in (2*k, 2*k+1)) for k in range(8)}

def keygen(name: str = "petik"):
    base = name.encode()[:5] or b"petik"
    code = (base + b"abcdefg")[:9]                    # c0..c8
    code = code[:9] + bytes([code[2]]) + b"e" + bytes([code[0]])   # c9=c2, c10 libre, c11=c0
    if code[0] == code[9]:                            # c0 == c2 → changer c2/c9
        code = code[:2] + b"#" + code[3:9] + b"#" + code[10:]
    full = (name.encode() + b"_" + name.encode() + b"_" * 12)[:12] + needed()[6]   # "Tl" en 12..13
    key = (name.encode()[:3] + b"xxx")[:3] + b"r"
    return code.decode(), full.decode(), key.decode()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=3, metavar=("CODE", "NAME", "KEY"))
    a = ap.parse_args()
    if a.check:
        c, n, k = (x.encode("latin-1") for x in a.check)
        r = (entry_ok(c), name_ok(n), key_ok(k))
        print(f"code {'OK' if r[0] else 'KO'} / name {'OK' if r[1] else 'KO'} / key {'OK' if r[2] else 'KO'}")
        sys.exit(0 if all(r) else 1)
    c, n, k = keygen(a.name)
    assert entry_ok(c.encode()) and name_ok(n.encode()) and key_ok(k.encode())
    print(f"{c} {n} {k}" if a.q else f"Code d'entrée = {c}\nName          = {n}\nKey           = {k}")
