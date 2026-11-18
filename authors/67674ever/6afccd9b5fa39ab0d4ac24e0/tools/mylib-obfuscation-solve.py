#!/usr/bin/env python3
"""67674ever — "My lib obfusction" (DemoMyLib.exe) : recupere la licence.

Le binaire compare FNV1a+mix64(argv[1]) au hash de la licence embarquee, qui
est stockee chiffree (blob de 0x20 octets). On rejoue le dechiffreur
(0x1400039d0) en Python pur.

  python3 -I tools/mylib-obfuscation-solve.py          # affiche la licence
  python3 -I tools/mylib-obfuscation-solve.py -q       # licence seule
  python3 -I tools/mylib-obfuscation-solve.py --check  # test live (Wine)

Pas de username : la licence est constante (argv[1]).
--check : l'original sous Wine affiche "Analysis detected" a cause d'un faux
positif anti-debug (flags du heap, voir README) ; on lance donc une COPIE en
/tmp dont 4 octets sont neutralises (original/ jamais touche).
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile, zipfile

M = (1 << 64) - 1
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "download.bin")
BASE, TEXT_VA, TEXT_FO = 0x140000000, 0x1000, 0x400

# blob "licence" (main, 0x140001af2..0x140001b34) : 20 octets chiffres + seed @+0x18
BLOB = (struct.pack("<IIII", 0x16D5057C, 0x0794AE31, 0x845090B5, 0x9F92B00C)
        + struct.pack("<Q", 0x1FF10881) + struct.pack("<Q", 0xE8749D24F8CC9B90))
GOLDEN = 0x9E3779B97F4A7C15


def sm64(x):
    z = (x ^ (x >> 30)) * 0xBF58476D1CE4E5B9 & M
    z = (z ^ (z >> 27)) * 0x94D049BB133111EB & M
    return z ^ (z >> 31)


def decrypt(blob, n=19):
    ct, seed = blob[:20], struct.unpack_from("<Q", blob, 0x18)[0]
    k8 = [sm64((seed + (i + 1) * GOLDEN) & M) & 0xFF for i in range(8)]
    out = bytearray()
    for i in range(n):
        t = (((seed >> (7 * i % 64)) & 0x3F) ^ ct[i]) & 0xFF
        t = ((t >> 7) | (t << 1)) & 0xFF                      # ror 7 == rol 1
        out.append(((seed >> (8 * (i % 8))) & 0xFF) ^ k8[i % 8] ^ t ^ (31 * i & 0xFF))
    return out.decode()


def fnv_mix(s):
    h = 0xCBF29CE484222325
    for c in s.encode():
        h = (h ^ c) * 0x100000001B3 & M
    h = (h ^ (h >> 33)) * 0xFF51AFD7ED558CCD & M
    h = (h ^ (h >> 33)) * 0xC4CEB9FE1A85EC53 & M
    return h ^ (h >> 33)


def run_wine(exe, key):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe, key], capture_output=True, text=True, timeout=120)
    return "\n".join(l for l in r.stdout.splitlines() if l.strip())


def check(key):
    tmp = tempfile.mkdtemp(prefix="mylib-")
    try:
        with zipfile.ZipFile(ZIP) as z:
            z.setpassword(b"crackmes.one")
            exe = z.extract("DemoMyLib.exe", tmp)
        print("== original non modifie sous Wine :"); print(run_wine(exe, key))
        d = bytearray(open(exe, "rb").read())
        off = 0x140005B3C - BASE - TEXT_VA + TEXT_FO          # test [rcx+0x70],0x40000062
        assert d[off:off + 7] == bytes.fromhex("f741706200004" "0")
        d[off + 3:off + 7] = bytes(4)                          # masque -> 0
        p = os.path.join(tmp, "copy.exe"); open(p, "wb").write(d)
        ok = run_wine(p, key); ko = run_wine(p, key + "x")
        print("== copie (anti-debug heap neutralise), bonne cle :"); print(ok)
        print("== copie, mauvaise cle :"); print(ko)
        return "License OK" in ok and "Invalid" in ko
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    key = decrypt(BLOB)
    if a.q:
        print(key)
    else:
        print(f"licence : {key}\nhash mix64 : 0x{fnv_mix(key):016X}")
    if a.check:
        sys.exit(0 if check(key) else 1)
