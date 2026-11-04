#!/usr/bin/env python3
"""Solveur — antidbg_crackme1 (Crackme#1.exe, scriptkiddy).

Prédicat (main @ 0x401108) :
  - username : exactement 10 caractères, chacun dans '1'..'5'
  - serial   : exactement 10 caractères
  - serial == [chr(ord(c) + 1) for c in username]

Usage:
  python3 antidbg-crackme1-solve.py                 # user par défaut 1234512345
  python3 antidbg-crackme1-solve.py 5432154321 -q   # serial seul
  python3 antidbg-crackme1-solve.py --check         # preuve live sous Wine (pty)

Note : « petik » est impossible (10 caractères '1'..'5' imposés) ;
l'exemple le plus proche est dérivé de petik : voir --from-petik.
"""
from __future__ import annotations

import argparse
import os
import pty
import re
import select
import subprocess
import sys
import tempfile
import time
import zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parents[1] / "original" / "Crackme#1.zip"
DEFAULT_USER = "1234512345"


def keygen(user: str) -> str:
    if len(user) != 10 or any(c not in "12345" for c in user):
        raise ValueError("username : 10 caractères dans '1'..'5' exigés par le binaire")
    return "".join(chr(ord(c) + 1) for c in user)


def from_petik(name: str = "petik") -> str:
    """Repli 'petik' -> username valide : (ord(c) % 5) + 1, répété/tronqué à 10."""
    digits = "".join(str(ord(c) % 5 + 1) for c in name)
    return (digits * 10)[:10]


def run_wine(exe: str, user: str, serial: str) -> str:
    m, s = pty.openpty()
    env = {**os.environ, "WINEDEBUG": "-all"}
    p = subprocess.Popen(["xvfb-run", "-a", "wine", exe], stdin=s, stdout=s,
                         stderr=subprocess.DEVNULL, env=env)
    buf = b""

    def rd(pat: bytes, t: float = 40) -> None:
        nonlocal buf
        end = time.time() + t
        while time.time() < end and pat not in buf:
            r, _, _ = select.select([m], [], [], 0.5)
            if r:
                try:
                    buf += os.read(m, 4096)
                except OSError:
                    break

    rd(b"username:")
    os.write(m, (user + "\r").encode())
    rd(b"serial:")
    os.write(m, (serial + "\r").encode())
    time.sleep(0.2)
    rd(b"Wrong", 6) if b"Correct" not in buf else None
    p.kill()
    return re.sub(rb"\x1b\[[?0-9;]*[a-zA-Z]", b"", buf).decode(errors="replace")


def check(user: str) -> int:
    serial = keygen(user)
    with tempfile.TemporaryDirectory() as td:
        with zipfile.ZipFile(ZIP) as z:
            z.extract("Crackme#1.exe", td)
        exe = str(Path(td) / "Crackme#1.exe")
        ok = run_wine(exe, user, serial)
        ko = run_wine(exe, user, serial[:-1] + chr(ord(serial[-1]) + 1))
    print("OK :", "Correct" in ok, "|", ok.strip().splitlines()[-1] if ok.strip() else "")
    print("KO :", "Wrong" in ko, "|", ko.strip().splitlines()[-1] if ko.strip() else "")
    return 0 if ("Correct" in ok and "Wrong" in ko) else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("user", nargs="?", default=DEFAULT_USER)
    ap.add_argument("--from-petik", action="store_true", help="username dérivé de 'petik'")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--check", action="store_true", help="preuve live Wine")
    a = ap.parse_args()
    user = from_petik() if a.from_petik else a.user
    if a.check:
        return check(user)
    s = keygen(user)
    print(s if a.q else f"username = {user}\nserial   = {s}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
