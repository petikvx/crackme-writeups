#!/usr/bin/env python3
"""Pwn Flick (bytemomo) : retrouve la licence i64 attendue par index.wasm.

Usage : python3 -I pwn-flick-solve.py [index.wasm | pwn-flick.zip] [-q] [--check]
Le wasm est parsé à la main : chaque garde commence par
  global.get 0 (aegis.license_value) ; i64.const 3 ; local.set ; ...
suivi d'une chaîne MBA (add/sub/mul/xor/and/or) terminée par i64.eq <const>.
On résout f(L) == const bit par bit (f mod 2^k ne dépend que de L mod 2^k).
"""
import sys, zipfile, io, os, argparse

M = (1 << 64) - 1
SITE = b"\x23\x00\x42\x03\x21"  # global.get 0 ; i64.const 3 ; local.set


def uleb(b, i):
    r = s = 0
    while True:
        c = b[i]; i += 1
        r |= (c & 0x7F) << s; s += 7
        if not c & 0x80:
            return r, i


def sleb(b, i):
    r = s = 0
    while True:
        c = b[i]; i += 1
        r |= (c & 0x7F) << s; s += 7
        if not c & 0x80:
            if c & 0x40:
                r -= 1 << s
            return r, i


def compile_site(b, p):
    """Décode la garde en liste d'ops jusqu'à i64.eq ; renvoie (ops, const_attendue)."""
    ops, i = [], p
    while True:
        o = b[i]; i += 1
        if o == 0x23:
            _, i = uleb(b, i); ops.append(("lic",))
        elif o == 0x42:
            v, i = sleb(b, i); ops.append(("c", v & M))
        elif o in (0x20, 0x21):
            n, i = uleb(b, i); ops.append(("get" if o == 0x20 else "set", n))
        elif o in (0x7C, 0x7D, 0x7E, 0x83, 0x84, 0x85):
            ops.append(("op", o))
        elif o == 0x51:
            return ops[:-1], ops[-1][1]  # dernier push = constante comparée
        else:
            raise ValueError("opcode inattendu %#x @%d" % (o, i))


def evaluate(ops, lic):
    st, loc = [], {}
    for o in ops:
        if o[0] == "lic": st.append(lic)
        elif o[0] == "c": st.append(o[1])
        elif o[0] == "get": st.append(loc[o[1]])
        elif o[0] == "set": loc[o[1]] = st.pop()
        else:
            y, x = st.pop(), st.pop()
            st.append({0x7C: x + y, 0x7D: x - y, 0x7E: x * y,
                       0x83: x & y, 0x84: x | y, 0x85: x ^ y}[o[1]] & M)
    return st.pop()


def solve(ops, target):
    sols = [0]
    for k in range(64):
        m = (1 << (k + 1)) - 1
        sols = [s | (b << k) for s in sols for b in (0, 1)
                if evaluate(ops, s | (b << k)) & m == target & m]
    return sols


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file", nargs="?", default=os.path.join(
        os.path.dirname(__file__), "..", "original", "pwn-flick.zip"))
    ap.add_argument("-q", action="store_true", help="n'affiche que la licence")
    ap.add_argument("--check", action="store_true", help="vérifie les N gardes")
    a = ap.parse_args()
    if a.file.endswith(".zip"):
        z = zipfile.ZipFile(a.file); z.setpassword(b"crackmes.one")
        data = z.read("pwn-flick/index.wasm")
    else:
        data = open(a.file, "rb").read()
    sites, p = [], data.find(SITE)
    while p >= 0:
        sites.append(p + 2); p = data.find(SITE, p + 1)  # +2 : saute global.get 0
    first = compile_site(data, sites[0] - 2)
    sols = solve(*first)
    assert len(sols) == 1, sols
    lic = sols[0]
    if a.q:
        print(lic); return
    print("gardes trouvées :", len(sites))
    print("licence (u64)   :", lic)
    print("licence (i64)   :", lic - (1 << 64) if lic >> 63 else lic)
    if a.check:
        ok = 0
        for s in sites:
            ops, c = compile_site(data, s - 2)
            ok += evaluate(ops, lic) == c
        print("gardes satisfaites : %d/%d" % (ok, len(sites)))
        sys.exit(0 if ok == len(sites) else 1)


main()
