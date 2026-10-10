#!/usr/bin/env python3
"""crackme_4 (br0ken) — bruteforce caractère par caractère.
Chaque caractère c_i (a-z) est XORé avec une clé, imprimé en %X, et la
concaténation doit valoir la chaîne cible 4D11628EBE1D (.data 0x403000)."""
import string
TARGET = "4D11628EBE1D"
KEYS = [0x34, 0x78, 0x12, 0xFE, 0xDB, 0x78]

def dfs(i, pos, acc, out):
    if i == len(KEYS):
        if pos == len(TARGET):
            out.append(acc)
        return
    for c in string.ascii_lowercase:
        h = "%X" % (ord(c) ^ KEYS[i])
        if TARGET.startswith(h, pos):
            dfs(i + 1, pos + len(h), acc + c, out)

sols = []
dfs(0, 0, "", sols)
for s in sols:
    print(s)
