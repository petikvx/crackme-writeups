#!/usr/bin/env python3
"""Keygen XYZ_KeygenMe20110405 (xiayuanzhong, crackmes.de).

main() @ 0x401390 (MinGW / Dev-C++, symboles partiels) :
  name : 1..20 chars, au moins une majuscule A-Z
  expected_len = 2*L+10 ; si != 50 : -=7  → 2*L+3 (sauf L==20 → 50)
  si name[0] in A-Z : +2 ; si name[-1] in A-Z : +3
  caps = lettres majuscules du nom ; reps = expected_len // len(caps)
  password[i] :
    si i == j*reps et j < len(caps) : caps[j]
    sinon : prochain char non-majuscule du nom, puis cycle XYZ(xyz%3)
      XYZ(0)='z', XYZ(1)='x', XYZ(2)='y'  (xyz démarre à 1)
usage : xyz-keygenme0405-solve.py [name] [--check]
"""
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "XYZ_KeygenMe20110405.EXE")

def XYZ(n):
    n = n % 3
    return {0: "z", 1: "x", 2: "y"}[n]

def keygen(name: str) -> str:
    L = len(name)
    if not (1 <= L <= 20):
        raise SystemExit("nom : 1..20 caractères")
    if not any("A" <= c <= "Z" for c in name):
        raise SystemExit("au moins une majuscule A-Z dans le nom")
    expected = 2 * L + 10
    if expected != 50:
        expected -= 7
    if "A" <= name[0] <= "Z":
        expected += 2
    if "A" <= name[-1] <= "Z":
        expected += 3
    caps = [c for c in name if "A" <= c <= "Z"]
    reps = expected // len(caps)
    out = []
    j = 0
    name_idx = 0
    xyz_c = 1
    for i in range(expected):
        if i == j * reps and j < len(caps):
            out.append(caps[j])
            j += 1
            continue
        while name_idx < L and "A" <= name[name_idx] <= "Z":
            name_idx += 1
        if name_idx >= L:
            out.append(XYZ(xyz_c))
            xyz_c += 1
        else:
            out.append(name[name_idx])
            name_idx += 1
    return "".join(out)

def run(name, pw):
    env = dict(os.environ, WINEDEBUG="-all")
    try:
        out = subprocess.run(
            ["wine", EXE],
            input=f"{name}\n{pw}\n\n",
            capture_output=True,
            text=True,
            env=env,
            timeout=12,
        ).stdout
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"").decode(errors="replace") if isinstance(e.stdout, (bytes, bytearray)) else (e.stdout or "")
    return out

if __name__ == "__main__":
    a = [x for x in sys.argv[1:] if not x.startswith("--")]
    name = a[0] if a else "Petik"
    s = keygen(name)
    print(f"{name} -> {s} (len={len(s)})")
    if "--check" in sys.argv:
        out = run(name, s)
        lines = [ln for ln in out.replace("\r", "").splitlines() if ln.strip()]
        print("wine tail:", lines[-8:])
        ok = any("email" in ln.lower() or "Bingo" in ln or "COOL" in ln or "Well" in ln or "xiayuanzhong" in ln.lower() for ln in lines)
        # Congrats prints KEEP-decoded chars; look for absence of Error after password
        print("success_hint:", ok or ("Error! Try Again" not in out and "Illegimate" not in out and len(out) > 500))
