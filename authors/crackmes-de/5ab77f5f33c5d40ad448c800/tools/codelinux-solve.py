#!/usr/bin/env python3
"""code_linux / CodeLinux (buga0205) — id 5ab77f5f33c5d40ad448c800. ELF32 statique.

main @0x80496cc : ptrace anti-debug ; scanf("%s", code) ; L = strlen(code) ; L impair et 2*(L+1-9) <= 41 ;
  b = base64(code)                                  (sub_8049216 -> sub_8048EB3, alphabet standard)
  128 × reverse(b)                                  (sub_8048E54 : identité, nombre pair)
  b = caesar(b, +(L+1))   lettres seulement          (sub_8049058)
  b[i] ^= 4 pour i < 28 ; memcmp(b, "KcT6LV@JCU1lV6bJV4PcTU0f~e99", 28) == 0   (sub_80495ED)
=> b64 = unshift( v5 ^ 4 , L+1 ), avec 28 caractères dont « == » final -> L ≡ 1 (mod 3), L impair : L = 19.

  codelinux-solve.py [-q] [--check]
"""
import argparse, base64, subprocess, sys, tempfile, shutil, os
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "CodeLinux"
V5 = b"KcT6LV@JCU1lV6bJV4PcTU0f~e99"


def unshift(s, k):
    o = []
    for c in s:
        if 97 <= c <= 122:
            o.append((c - 97 - k) % 26 + 97)
        elif 65 <= c <= 90:
            o.append((c - 65 - k) % 26 + 65)
        else:
            o.append(c)
    return bytes(o)


def solve():
    t = bytes(c ^ 4 for c in V5)
    sols = []
    for L in range(1, 29, 2):
        if 4 * ((L + 2) // 3) != 28:
            continue
        try:
            d = base64.b64decode(unshift(t, L + 1), validate=True)
        except Exception:
            continue
        if len(d) == L and all(32 < c < 127 for c in d):
            sols.append(d.decode())
    return sols


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = solve()
    assert s, "aucune solution"
    print(s[0] if a.q else f"code : {s[0]}   (L = {len(s[0])}, shift = {len(s[0]) + 1})")
    if a.check:
        with tempfile.TemporaryDirectory() as td:
            exe = os.path.join(td, "CodeLinux"); shutil.copy(BIN, exe); os.chmod(exe, 0o755)
            run = lambda x: subprocess.run([exe], input=x + "\n", capture_output=True, text=True, timeout=5).stdout
            ok, ko = "Code Linux Memeber" in run(s[0]), "Not Code Linux" in run("petik")
        print("check:", "OK" if ok and ko else "KO", f"(ok={ok}, petik→rejeté={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
