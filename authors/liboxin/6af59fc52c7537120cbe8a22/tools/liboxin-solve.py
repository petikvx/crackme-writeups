#!/usr/bin/env python3
"""liboxin's unpack me v1 (aegis) — solveur / vérificateur.

Le serial est FIXE (pas de login) : 16 caractères, affichés XXXX-XXXX-XXXX-XXXX.
Pour chaque caractère c_i :  SBOX[c_i ^ acc] == EXPECT[i]
                             acc = (acc + 7*c_i + i) & 0xff      (acc0 = 0x5a)
d'où  c_i = SBOX^-1[EXPECT[i]] ^ acc.

Usage :
  python3 liboxin-solve.py          # affiche le serial
  python3 liboxin-solve.py -q       # serial seul
  python3 liboxin-solve.py --check  # teste contre l'exe d'origine (unzip + xvfb-run wine)
"""
import argparse, os, subprocess, sys, tempfile, zipfile

# Tables déchiffrées à l'exécution : 0x140036022 (256 o) et 0x140036122 (16 o)
SBOX = bytes.fromhex(
    "9bb87c7d1a68a5af6318749c0216948dfc77ee614450095426e6f876dbe00331d35f0f9881fac19e01b3f190da677ff0056c2e321c58294672eae837804291fdc9f6beb6128397b96fcf511d93d8cec5e534e3f345222d646a07a3c28296bc2841234071554ac4842a62ddcd355dbdd0aa2fd23e0ea4c64c658c5e5c66ac27aee1c052595b499dd136eda07b14e4ca88954e9270ebf215c7200b863b397e08b5f45a734fd4fbfe258bd519bbf92c7aa9ad3cb4c3cb6b10d7ecccde24b2b16d0aa77975789a3d898e1f00a221a6b738483a43e2995613c88fefff33116e2b47a8a1bfe70d0c4b606930d9539f1b048ae9d6ba571eab3ff7dcb08717f54d8506df")
EXPECT = bytes.fromhex("4451ccbe2bed8a3d68dc1bc6a9c9aadc")


def solve():
    inv = {v: k for k, v in enumerate(SBOX)}
    acc, out = 0x5A, []
    for i, e in enumerate(EXPECT):
        c = inv[e] ^ acc
        out.append(chr(c))
        acc = (acc + 7 * c + i) & 0xFF
    s = "".join(out)
    return "-".join(s[i:i + 4] for i in range(0, 16, 4))


def check(serial):
    here = os.path.dirname(os.path.abspath(__file__))
    zpath = os.path.join(here, "..", "original", "download.bin")
    with tempfile.TemporaryDirectory() as d:
        with zipfile.ZipFile(zpath) as z:
            z.extractall(d, pwd=b"crackmes.one")
        exe = next(f for f in os.listdir(d) if f.endswith(".exe"))
        r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=(serial + "\n").encode(),
                           cwd=d, capture_output=True, timeout=120)
    return r.stdout.decode(errors="replace").strip()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = solve()
    if a.q:
        print(s)
    else:
        print("serial:", s)
    if a.check:
        out = check(s)
        print("wine:", out)
        bad = check(s[:-1] + ("0" if s[-1] != "0" else "1"))
        print("wine (KO):", bad)
        sys.exit(0 if "accepted" in out and "Invalid" in bad else 1)
