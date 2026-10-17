#!/usr/bin/env python3
"""Keygen — orks236_crackme_2 by orcs236 (crackmes.one 5ab77f5633c5d40ad448c2dd).

Réimplémentation du script AutoIt 3.2 extrait (2 couches : loader + crackme.exe) :
  name  = nom tronqué / complété à 10 caractères avec des 'q'
  num   = Stretch(@UserName & @ComputerName, mode 0 ["Out"], 20)  -> XXXXX-XXXXX-XXXXX-XXXXX
  serial= Stretch(name,1) - Stretch(name+"orcs236",1) - Stretch(num sans '-',1,10)[:5] - [5:]
Stretch = _StringEncrypt (XOR 255^clé puis RC4, niveau 1 => 2 passes, sortie hex)
          puis réduction des chiffres : t[i] = (a[i] + a[i+1]) mod 10 jusqu'à la taille voulue
          (les lettres A–F valent 0 dans l'arithmétique AutoIt).

  ./orcs236-crackme2-keygen.py <nom> <username_windows> <computername>
"""
import sys

def string_encrypt(text: str, password: str, level: int = 1) -> str:
    for _ in range(level + 1):
        # XOR avec le mot de passe et 255
        text = "".join(chr(ord(c) ^ ord(password[i % len(password)]) ^ 255) for i, c in enumerate(text))
        # pseudo-RC4 (clé = password), sortie hex majuscules
        box = list(range(256)); j = 0
        for i in range(256):
            j = (j + box[i] + ord(password[i % len(password)])) % 256
            box[i], box[j] = box[j], box[i]
        i = j = 0; out = []
        for c in text:
            i = (i + 1) % 256
            j = (j + box[i]) % 256
            # NB : la version AutoIt n'échange PAS box[i]/box[j] ici (RC4 « cassé »)
            out.append("%02X" % (ord(c) ^ box[(box[i] + box[j]) % 256]))
        text = "".join(out)
    return text


def digit(ch: str) -> int:
    return int(ch) if ch.isdigit() else 0   # "A".."F" -> 0 en AutoIt

def stretch(macro: str, mode: int, size: int = 5) -> str:
    if macro == "":
        return "0"
    macro = string_encrypt(macro, "In" if mode == 1 else "Out", 1)
    temp = macro
    if len(macro) > size:
        arr = list(macro)
        while True:
            temp = "".join(str((digit(arr[k]) + digit(arr[k + 1])) % 10) for k in range(len(arr) - 1))
            arr = list(temp)
            if len(temp) == size:
                break
    elif len(macro) < size:   # jamais atteint (hex >= 4 car./octet)
        while len(temp) < size:
            temp = str(int(temp) * 2)
    return temp

def pad_name(name: str) -> str:
    return (name + "q" * 10)[:10]

def machine_number(username: str, computername: str) -> str:
    t = stretch(username + computername, 0, 20)
    return f"{t[:5]}-{t[5:10]}-{t[10:15]}-{t[15:]}"

def serial(name: str, username: str, computername: str) -> str:
    n = pad_name(name)
    num = machine_number(username, computername)
    t = stretch(num.replace("-", ""), 1, 10)
    return f"{stretch(n, 1)}-{stretch(n + 'orcs236', 1)}-{t[:5]}-{t[5:]}"

if __name__ == "__main__":
    if len(sys.argv) != 4:
        sys.exit(__doc__)
    print(serial(*sys.argv[1:4]))
