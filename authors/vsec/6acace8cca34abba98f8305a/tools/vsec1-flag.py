#!/usr/bin/env python3
"""VSEC Challenger No.1 — « flag » imprimé après [+] Serial accepted.

Reconstruit depuis la trace (après le cmp serial == attendu) :

    D   = SHA256(R)                 # R = les 32 octets AVANT le xor des 8 premiers octets avec SHA256(user||NIGHTMARE)
    S   = S1 || S2 || S3            # 24 octets (cf. vsec1-solve.py)
    flag[i] = ct[i] ^ D[i % 32] ^ S[i % 24]      pour i in 0..53

`ct` (54 octets) est une constante du programme ; on la récupère une fois depuis la sortie du binaire
pour un username connu (`petik`), puis on rejoue la formule pour n'importe quel username.
"""
from __future__ import annotations

import hashlib
import importlib.util
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("vsolve", HERE / "vsec1-solve.py")
vs = importlib.util.module_from_spec(spec)
spec.loader.exec_module(vs)
EXE = HERE.parent / "original" / "VSEC_Challenger_No.1.exe"
S = vs.S1 + vs.S2 + vs.S3


def r_pre(user: str) -> bytes:
    u = user.encode()
    h = int.from_bytes(hashlib.sha256(u + vs.S1).digest(), "big")
    f = sum(c * pow(h, i, vs.P) for i, c in enumerate(vs.COEF)) % vs.P
    y = (int.from_bytes(vs.S2, "big") + 435 * len(u)) % vs.N
    t = pow(f, y, vs.P)
    m = int.from_bytes(vs.S3 + u, "big") % vs.Q
    w = (t * pow(m, -1, vs.Q)) % vs.Q
    e = int.from_bytes((vs.S1 + vs.S2)[4:12], "big") ^ 0x5A5A5A5A5A5A5A5A
    v = (pow(w, e, vs.Q) * 0x133713371337) % vs.P
    return ((v ^ int.from_bytes(vs.S1 + vs.S2, "big")) % vs.P).to_bytes(32, "big")


def ct_from_exe(user: str = "petik") -> bytes:
    out = subprocess.run([str(EXE), user, vs.serial(user)], capture_output=True, timeout=60).stdout
    blob = out.split(b"[+] Flag: ", 1)[1]
    assert blob.endswith(b"\n")
    return blob[:-1]


def xor_flag(data: bytes, user: str) -> bytes:
    d = hashlib.sha256(r_pre(user)).digest()
    return bytes(c ^ d[i % 32] ^ S[i % 24] for i, c in enumerate(data))


def main() -> None:
    ref = "petik"
    printed = ct_from_exe(ref)
    ct = xor_flag(printed, ref)         # xor est involutif : on retrouve ct
    print("len", len(ct), "ct", ct.hex())
    # contrôle : rejouer pour un autre user doit redonner la sortie réelle de l'exe
    u2 = "alice"
    real = ct_from_exe(u2)
    assert xor_flag(ct, u2) == real, "formule incorrecte"
    print("formule OK (alice reproduit)")
    for u in sys.argv[1:]:
        print(u, xor_flag(ct, u))


if __name__ == "__main__":
    main()
