#!/usr/bin/env python3
"""Keygen — orcs236_crackme by orcs236 (crackmes.one 5ab77f5633c5d40ad448c2de).

Script AutoIt 3.1 (en-tête EA04) lancé par un loader AutoIt (FileInstall vers %TEMP%\\~xxxxxxx.tmp).
Vérification réelle (Func Iliad) :
  nom    = nom doublé s'il ne fait qu'un caractère
  s      = _StringEncrypt(1, _StringToHex(nom), nom, 3)   (4 passes, sortie hex majuscules)
  serial = StringTrimLeft(StringTrimRight(s, 5), len(s) - 60)  ==  s[len(s)-60 : len(s)-5]  (55 car.)

  ./orcs236-crackme-keygen.py <nom>
"""
import sys

def string_encrypt(text: str, password: str, level: int = 1) -> str:
    for _ in range(level + 1):
        # XOR caractère ^ mot de passe ^ 255
        text = "".join(chr(ord(c) ^ ord(password[i % len(password)]) ^ 255) for i, c in enumerate(text))
        # pseudo-RC4 : KSA normal, PRGA sans échange box[i]/box[j] (implémentation AutoIt)
        box = list(range(256)); j = 0
        for i in range(256):
            j = (j + box[i] + ord(password[i % len(password)])) % 256
            box[i], box[j] = box[j], box[i]
        i = j = 0; out = []
        for c in text:
            i = (i + 1) % 256
            j = (j + box[i]) % 256
            out.append("%02X" % (ord(c) ^ box[(box[i] + box[j]) % 256]))
        text = "".join(out)
    return text

def string_to_hex(s: str) -> str:
    return "".join("%02X" % ord(c) for c in s)

def keygen(name: str) -> str:
    if len(name) == 1:
        name = name + name
    s = string_encrypt(string_to_hex(name), name, 3)
    return s[len(s) - 60 : len(s) - 5]

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(keygen(name))
