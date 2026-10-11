#!/usr/bin/env python3
"""Cherche un username pour lequel le « flag » déchiffré est entièrement imprimable.

  python vsec1-flag-scan.py words [fichier]     # dictionnaire + variantes
  python vsec1-flag-scan.py brute N [charset]   # tous les mots de N caractères
"""
from __future__ import annotations

import importlib.util
import itertools
import multiprocessing as mp
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("vflag", HERE / "vsec1-flag.py")
vf = importlib.util.module_from_spec(spec)
spec.loader.exec_module(vf)
CT = bytes.fromhex("e2f7ef07fcd04c338dda9178f1c956629dee528f6b500e54d14c57dd4c5b4eb86fb01e0a033285a388690ba9c77af2a6224a6e79a01e")


def check(u: str):
    if not 4 <= len(u.encode()) <= 32:
        return None
    p = vf.xor_flag(CT, u)
    return u, p if all(32 <= c < 127 for c in p) else None


def check_chunk(chunk):
    out = []
    for u in chunk:
        r = check(u)
        if r and r[1]:
            out.append(r)
    return out


def gen_brute(n, cs):
    for t in itertools.product(cs, repeat=n):
        yield "".join(t)


def chunks(it, size=20000):
    while True:
        c = list(itertools.islice(it, size))
        if not c:
            return
        yield c


def variants(w):
    base = {w, w.lower(), w.upper(), w.capitalize()}
    out = set()
    for b in base:
        out.add(b)
        for suf in ("", "1", "123", "2026", "2025", "_", "!", "01", "0", "42", "1337", "007"):
            out.add(b + suf)
    return out


def main():
    mode = sys.argv[1]
    if mode == "words":
        words = set()
        if len(sys.argv) > 2:
            words |= {l.strip() for l in open(sys.argv[2], encoding="utf8", errors="ignore") if l.strip()}
        words |= set("vsec nightmare challenger challenge crackme crackmes flag admin root user test guest hello password "
                     "golang garble nikjoo nima hacker cracker reverse reversing keygen serial licence license "
                     "secret key master player victor alice bob carol dave eve mallory trent peggy walter oscar judy "
                     "go gopher vm virtual machine obfuscated hard insane easy medium pwn ctf kali linux windows "
                     "number one two three first no1 no 1 challenger_no_1 sha256 secp256k1 curve25519 ed25519 "
                     "bitcoin ethereum satoshi nakamoto 1337 leet elite zero cool dark night mare dream "
                     "welcome congratulations winner solved crack cracked pass passwd".split())
        cand = set()
        for w in words:
            cand |= variants(w)
        for a in list(words)[:80]:
            for b in list(words)[:80]:
                cand.add(a + b)
                cand.add(a + "_" + b)
        print(len(cand), "candidats")
        for c in chunks(iter(sorted(cand))):
            for u, p in check_chunk(c):
                print("HIT", u, p)
    else:
        n = int(sys.argv[2])
        cs = sys.argv[3] if len(sys.argv) > 3 else "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
        with mp.Pool() as pool:
            done = 0
            for res in pool.imap_unordered(check_chunk, chunks(gen_brute(n, cs))):
                done += 1
                for u, p in res:
                    print("HIT", u, p, flush=True)
        print("fin")


if __name__ == "__main__":
    mp.freeze_support()
    main()
