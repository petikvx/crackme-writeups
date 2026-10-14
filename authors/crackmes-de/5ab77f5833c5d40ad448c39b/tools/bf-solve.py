#!/usr/bin/env python3
"""bf (crp) — id 5ab77f5833c5d40ad448c39b. Générateur de keyfile `key.bf`.

Le binaire lit `./key.bf` (<= 4096 o), l'exécute comme un programme **brainfuck** (tape 4096 cellules
d'octets avec ptr circulaire ; `,` lit le nom d'utilisateur courant (getpwuid), 0 à la fin ; `.` écrit
dans un tampon de sortie) puis compare la sortie à  sprintf("%u", 3*H(user))  :

    L = min(len(user), 40)
    s = Σ_{i<L} (L + user[i])            (signed char)
    h = (L * s) << 10                    (int 32 bits)
    h = Σ_j (j - user[j]) ajouté à h     (j < L)
    attendu = str(3*h mod 2**32)

Keyfile généré : un programme BF qui imprime ces chiffres (cellule remise à 0 / recalculée à chaque
chiffre) suivi d'un octet NUL (le binaire fait strcpy sur le buffer lu avec fread, non terminé).

  bf-solve.py [user] [-o key.bf] [-q] [--check]     (défaut user = petik ; --check = binaire réel,
                                                      valable pour l'utilisateur courant)
"""
import argparse, getpass, os, subprocess, sys, tempfile
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "bf" / "bf"


def expected(user: str) -> str:
    b = user.encode()[:40]
    s8 = lambda x: x - 256 if x > 127 else x
    L = len(b)
    v2 = sum(L + s8(c) for c in b)
    v5 = ((L * v2) << 10) & 0xFFFFFFFF
    for j, c in enumerate(b):
        v5 = (v5 + j - s8(c)) & 0xFFFFFFFF
    return str((3 * v5) & 0xFFFFFFFF)


def keyfile(user: str) -> bytes:
    out = []
    prev = 0
    for ch in expected(user):
        n = ord(ch)
        d = n - prev
        out.append(("+" * d if d >= 0 else "-" * -d) + ".")
        prev = n
    return ("".join(out)).encode() + b"\0"


def vm(prog: bytes, user: bytes) -> bytes:
    """réplique de l'interpréteur du binaire (pour tester d'autres noms que l'utilisateur courant)"""
    prog = prog.split(b"\0")[0]
    tape = bytearray(4096); ptr = ip = ui = 0; out = bytearray()
    while ip < len(prog):
        c = prog[ip:ip + 1]
        if c == b"+": tape[ptr] = (tape[ptr] + 1) & 255
        elif c == b"-": tape[ptr] = (tape[ptr] - 1) & 255
        elif c == b">": ptr = (ptr + 1) % 4096
        elif c == b"<": ptr = (ptr - 1) % 4096
        elif c == b".": out.append(tape[ptr])
        elif c == b",":
            if ui < len(user): tape[ptr] = user[ui]; ui += 1
            else: tape[ptr] = 0
        elif c == b"[" and tape[ptr] == 0:
            d = 1
            while d:
                ip += 1
                d += {91: 1, 93: -1}.get(prog[ip], 0)
        elif c == b"]":
            d = 0
            while True:
                if prog[ip] == 93: d += 1
                elif prog[ip] == 91: d -= 1
                if d == 0: break
                ip -= 1
            continue
        ip += 1
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-o", "--out", default="key.bf")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keyfile(a.user)
    Path(a.out).write_bytes(k)
    exp = expected(a.user)
    print(exp if a.q else f"user    : {a.user}\nattendu : {exp}\nkeyfile : {a.out} ({len(k)} octets)\n{k[:-1].decode()[:120]}…")
    if a.check:
        ok_vm = vm(k, a.user.encode()) == exp.encode()
        cur = getpass.getuser()
        with tempfile.TemporaryDirectory() as td:
            Path(td, "key.bf").write_bytes(keyfile(cur))
            r = subprocess.run([str(BIN)], cwd=td, capture_output=True, text=True).stdout
            Path(td, "key.bf").write_bytes(keyfile(cur + "x"))
            bad = subprocess.run([str(BIN)], cwd=td, capture_output=True, text=True).stdout
        ok_bin = "ACCEPTED" in r and "INVALID" in bad
        print("check:", "OK" if ok_vm and ok_bin else "KO", f"(vm={ok_vm}, binaire[{cur}]={ok_bin})")
        sys.exit(0 if ok_vm and ok_bin else 1)


if __name__ == "__main__":
    main()
