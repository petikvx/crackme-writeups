#!/usr/bin/env python3
"""linux_crackme_v2 (CM13) by veneta//MBE — id 5ab77f5433c5d40ad448c16b.

GTK1, UPX 1.24 (dépaqueté avec tools/upx-3.96). Handler du bouton @0x8048cad :
  * name   : exactement 32 caractères HEX -> 16 octets P   (sub @0x8048f50)
  * serial : >= 3 caractères, copié en 0x804a7f0
  * RC4 maison (S initial = 256 x 0xf0 au lieu de l'identité), clé "MBECrew" :
        T = RC4(P)           (16 octets, en place @0x804a3f0)
        D = RC4(serial)
  * boucle @0x8048d72 : `xor [esi],al` x16 avec esi/edx JAMAIS incrémentés
        -> même octet XORé 16 fois = annulé ; seul effet : si D[0]==0 boucle infinie
  * compare T aux 4 dwords @0x804a218 (c4840bb5 a1020d97 5cb2e1c9 a49152cc)

=> name = hex(RC4(C)) ; serial = n'importe quoi (>=3 car., serial[0] != keystream[0]).

  cm13-solve.py [-q] [--check]
"""
import argparse, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
KEY = b"MBECrew"
C = bytes.fromhex("c4840bb5a1020d975cb2e1c9a49152cc")


def rc4(data, key=KEY):
    S = [0xF0] * 256                     # init non standard
    j = 0
    for i in range(256):
        j = (j + key[i % len(key)] + S[i]) & 255
        S[i], S[j] = S[j], S[i]
    i = j = 0
    out = bytearray()
    for b in data:
        i = (i + 1) & 255
        j = (j + S[i]) & 255
        S[i], S[j] = S[j], S[i]
        out.append(b ^ S[(S[i] + S[j]) & 255])
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--serial", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="rejoue le handler réel via unicorn (cm13-emu.py)")
    a = ap.parse_args()
    name = rc4(C).hex()
    if a.q:
        print(name)
    else:
        print(f"name  : {name}\nserial: {a.serial}   (n'importe quelle chaîne >= 3 car.)")
    if a.check:
        sys.path.insert(0, str(HERE))
        import importlib.util
        spec = importlib.util.spec_from_file_location("emu", HERE / "cm13-emu.py")
        emu = importlib.util.module_from_spec(spec); spec.loader.exec_module(emu)
        ok = emu.run(name, a.serial) == "cracked"
        ko = emu.run(name[:-1] + "d", a.serial) == "BAD KEY"
        print("check:", "OK" if ok and ko else "KO", f"(bon={ok}, name altéré rejeté={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
