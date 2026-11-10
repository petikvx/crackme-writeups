#!/usr/bin/env python3
"""stels sob Obfuscator Challenge : recupere le mot de passe.

Les constantes viennent de Runtime.LoadEncString (tokens 0x7000000B..0x70000010).
mot de passe = AES-256-CBC( key = share0^share1^share2, iv, ct )   (ASCII, 30 octets)

  stels-solve.py            -> affiche le mot de passe
  stels-solve.py -q         -> mot de passe seul
  stels-solve.py --check [CrackMe.dll]   -> verifie via `dotnet` sur le binaire d'origine
"""
import argparse, os, subprocess, sys, zipfile, tempfile, hashlib
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding

S0 = "bdef3b1d51fa21659361a1953e48ce6fc1f8d577bfd1dfd948fe7e12eeb04c95"
S1 = "00dd144ba9624e6ca21254842fa2add6571de43c43f13d8d665a30023ff64f30"
S2 = "89d14cb92b5369fbd2ed05d3de367d07137c9594dee17b763fa2123819999d44"
IV = "7a8b9c0d1e2f30415263748596a7b8c9"
CT = "ac0d153dfb15e49d350d4863ac31be3b031953f505084c53da642e2088dd8872"


def password() -> str:
    key = bytes(a ^ b ^ c for a, b, c in zip(*(bytes.fromhex(x) for x in (S0, S1, S2))))
    d = Cipher(algorithms.AES(key), modes.CBC(bytes.fromhex(IV))).decryptor()
    pt = d.update(bytes.fromhex(CT)) + d.finalize()
    u = padding.PKCS7(128).unpadder()
    return (u.update(pt) + u.finalize()).decode()


def rolling_xor_ok(pw: str) -> bool:
    exp = password().encode()
    k = 2779096485
    for i, ch in enumerate(pw):
        if ((ord(ch) ^ k) & 0xFF) != (exp[i % len(exp)] ^ (k & 0xFF)):
            return False
        k = ((k >> 5) | (k << 27)) & 0xFFFFFFFF
        k = (k + ord(ch)) & 0xFFFFFFFF
    return True


def check(pw: str, zpath: str) -> int:
    here = os.path.dirname(os.path.abspath(__file__))
    zpath = zpath or os.path.join(here, "..", "original", "download.bin")
    with tempfile.TemporaryDirectory() as t:
        with zipfile.ZipFile(zpath) as z:
            z.extractall(t, pwd=b"crackmes.one")
        with zipfile.ZipFile(os.path.join(t, "crackme.zip")) as z:
            z.extractall(t)
        dll = os.path.join(t, "CrackMe", "win-framework", "CrackMe.dll")
        for cand in (pw, pw + "x", "petik"):
            r = subprocess.run(["dotnet", dll], input=cand + "\n\n", capture_output=True, text=True)
            print(repr(cand), "->", r.stdout.replace("\n", " | "))
    return 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="", metavar="download.bin")
    a = ap.parse_args()
    pw = password()
    assert rolling_xor_ok(pw) and len(pw) == 30
    if a.q:
        print(pw)
    else:
        print("password =", pw)
    if a.check is not None:
        sys.exit(check(pw, a.check))
