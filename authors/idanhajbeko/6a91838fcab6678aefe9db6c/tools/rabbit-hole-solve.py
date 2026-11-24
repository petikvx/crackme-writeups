#!/usr/bin/env python3
"""Solveur idanhajbeko "The Rabbit Hole" (main.exe).

Séquence à taper (après un nom dont la somme des octets == 510) :
  commandes de déplacement jusqu'à (x,y)=(3,2), puis "observe", puis la
  phrase "hashedCommand", puis (dans rabbit()) la phrase finale.
Usage : rabbit-hole-solve.py [--name petiL] [-q] [--check]
"""
import argparse, itertools, subprocess, shutil, os, sys

KEY = b"Wonderland"
CMDS = {  # constantes .rdata (VA 0x140007000...)
    "observe": b';!"0E4?/<+3',
    "shift0 (x+1)": b"0!N7-6%6",
    "shift1 (x-1)": b"0!N)!59",
    "shift2 (y+1)": b"0!N#+!<!=!",
    "shift3 (y-1)": b"0!N'%2(7073=",
}
HASHED = b"YHEEHPGMAXGKTUUBM"      # 0x140007035, comparé à translate(input)
FINAL = b";.6#.*;&'&3*%"            # 0x14000720f, comparé à encode(translate(input))
NAME_SUM = 510                      # hashedName @ 0x140006028

def s8(v): return v - 256 if v > 127 else v

def enc_byte(i, c):
    b = KEY[i % len(KEY)] ^ c
    if s8(b) <= 0x2f or b == 0x7f:
        b = (s8(b) - 33 * int(s8(b) / 33)) + 0x21 & 0xff  # idiv signé (C)
    return b

def encode(s): return bytes(enc_byte(i, c) for i, c in enumerate(s))
def translate(s): return bytes((c % 26) + 0x41 for c in s)  # c non signé (ASCII)

def invert_encode(target, alphabet):
    out = []
    for i, t in enumerate(target):
        c = [c for c in alphabet if enc_byte(i, c) == t]
        out.append(c)
    return out

def preimage_translate(T):
    """Pour chaque lettre cible, caractère ASCII minuscule/maj/chiffre le plus lisible."""
    res = bytearray()
    for L in T:
        idx = L - 0x41
        cands = [c for c in range(0x20, 0x7f) if c % 26 == idx]
        lower = [c for c in cands if 0x61 <= c <= 0x7a]
        res.append(0x20 if L == 0x47 else (lower or cands)[0])  # 'G' <- espace (32%26=6)
    return bytes(res)

def solve_commands():
    out = {}
    for n, t in CMDS.items():
        opts = invert_encode(t, range(0x20, 0x7f))
        # plusieurs préimages (remap %33) : on prend minuscule/espace
        out[n] = bytes(next(c for c in o if 0x61 <= c <= 0x7a or c == 0x20) for o in opts)
        assert encode(out[n]) == t, n
    return out

def solve_final():
    # rabbit() : fgets garde '\n' -> translate('\n') = 'K' ; 13 octets au total
    letters = range(0x41, 0x5b)
    opts = invert_encode(FINAL, letters)
    assert opts[-1] and 0x4b in opts[-1], "dernier char doit être 'K' (=\\n)"
    T = bytes(o[0] for o in opts[:-1])
    return preimage_translate(T)

def name_for(prefix="peti"):
    need = NAME_SUM - sum(prefix.encode())
    assert 0x20 <= need < 0x7f
    return prefix + chr(need)

def run_check(name, seq):
    exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "main.exe")
    inp = name + "\n" + "\n".join(seq) + "\n"
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=inp.encode(),
                       capture_output=True, timeout=120)
    return r.stdout.decode("utf8", "replace")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default=None, help="défaut : petiL (petik impossible, somme 541 != 510)")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="rejoue contre original/main.exe via wine")
    a = ap.parse_args()
    name = a.name or name_for("peti")
    assert sum(name.encode()) == NAME_SUM, "somme du nom != 510"
    cmds = solve_commands()
    hashed = preimage_translate(HASHED).decode()
    final = solve_final().decode()
    seq = [cmds["shift0 (x+1)"].decode()] * 3 + [cmds["shift2 (y+1)"].decode()] * 2 \
          + [cmds["observe"].decode(), hashed, final]
    if a.q:
        print("\n".join([name] + seq)); return
    print("nom        :", name, "(somme=%d)" % sum(name.encode()))
    for n, v in cmds.items(): print("%-13s:" % n, v.decode())
    print("hashedCmd  :", hashed, "->", translate(hashed.encode()).decode())
    print("final      :", final, "->", encode(translate(final.encode()) + b"K").decode(errors="replace"))
    print("séquence   :", seq)
    if a.check:
        out = run_check(name, seq)
        print(out[:0], end='')
        import re
        out = re.sub(r"\x1b\[[0-9;?]*[A-Za-z]", "", out)
        ok = all(k in out for k in ("Wow a rabbit!", "Following the rabbit...", "what do you want?")) \
            and "Cant give" not in out and "KILLED BY THE RABBIT" not in out
        print("CHECK:", "OK" if ok else "KO"); sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
