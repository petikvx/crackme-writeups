#!/usr/bin/env python3
"""LibertyorDeath's Keygenme v3 — keygen (dépend du hostname de la machine).
usage : solve.py <nom> [hostname]"""
import socket, sys

def keygen(name: str, host: str) -> str:
    h = host.encode()
    # A : boucle sur hostname (index 1..) : v <<= 1 ; si index impair, v = char signé
    v, i = 0, 0
    while True:
        v = (v << 1) & 0xFFFFFFFF
        i += 1
        if i >= len(h):
            break
        if i & 1:
            v = h[i] - 256 if h[i] > 127 else h[i]
    hl = i  # = strlen(hostname)
    # B : sur le nom (getc jusqu'à '\n') : pour un index pair, B = c * idx * strlen(host)
    b = 0
    for idx, c in enumerate(name.encode()):
        if idx % 2 == 0:
            b = (c * idx * hl) & 0xFFFFFFFF
    num = (b + v) & 0xFFFFFFFF
    num = num - (1 << 32) if num >= 1 << 31 else num
    # hostname : caractères d'index pair (0, 2, 4, …)
    tail = h[::2].decode()
    return f"{num}-{tail}"   # comparé sur toute sa longueur (strncmp, n = len), après +5 des deux côtés

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    host = sys.argv[2] if len(sys.argv) > 2 else socket.gethostname()
    print(keygen(name, host))
