#!/usr/bin/env python3
"""Solveur — Sallos's Key License (keylicense.exe)

PE32 GUI MASM32 : deux prédicats indépendants.

1) Champ dialogue (ID 1003) == GetUserNameExA(NameSamCompatible) après strip
   du préfixe DOMAIN\\  (ex. PTK-LAB\\petik → petik).

2) Fichier key.license à côté de l'exe, exactement 19 octets. Le check effectif
   (sub_401409) ne valide que les 4 premiers octets avec diviseurs fib-like
   2,3,5,8 (bug : jmp inconditionnel après le 1er groupe ; code mort pour
   XXXX-XXXX-XXXX-XXXX). On génère quand même le format 19 octets avec tirets.

Usage :
  python3 key-license-solve.py
  python3 key-license-solve.py -q
  python3 key-license-solve.py --user petik --write
  python3 key-license-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "keylicense.exe"
LICENSE_PATH = ROOT / "original" / "key.license"
LIVE = ROOT / "analysis" / "keylicense_live.exe"

# 19 octets ; préfixe valide pour div 2,3,5,8 sur les codes ASCII
DEFAULT_LICENSE = b"0020-0000-0000-0000"
DEFAULT_USER = "petik"


def prefix_ok(data: bytes) -> bool:
    """Prédicat réel de sub_401409 (4 premiers octets)."""
    if len(data) < 4:
        return False
    ebx, edx = 2, 3
    for i in range(4):
        if data[i] % (ebx & 0xFF) != 0:
            return False
        ebx, edx = edx, edx + ebx
    return True


def license_ok(data: bytes) -> bool:
    return len(data) == 19 and prefix_ok(data)


def keygen(prefix: bytes | None = None) -> bytes:
    if prefix is None:
        lic = DEFAULT_LICENSE
    else:
        p = prefix
        if len(p) == 4:
            lic = p + b"-0000-0000-0000"
        else:
            lic = p
    if not license_ok(lic):
        raise ValueError(f"license invalide (len={len(lic)} prefix_ok={prefix_ok(lic)}): {lic!r}")
    return lic


def wine_cmd(args: list[str], *, timeout: float = 20) -> subprocess.CompletedProcess[str]:
    env = os.environ.copy()
    env.setdefault("WINEDEBUG", "-all")
    # Préférer xvfb-run si dispo (serveur sans écran) ; sinon DISPLAY courant
    xvfb = shutil.which("xvfb-run")
    if xvfb:
        cmd = [xvfb, "-a", "wine", *args]
    else:
        cmd = ["wine", *args]
        env.setdefault("DISPLAY", ":0")
    return subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        timeout=timeout,
        env=env,
    )


def winepath_w(path: Path) -> str:
    r = wine_cmd(["winepath", "-w", str(path)], timeout=30)
    line = (r.stdout or "").strip().splitlines()
    if not line:
        # fallback Z: mapping typique
        return "Z:" + str(path).replace("/", "\\")
    return line[-1].strip()


def write_license(data: bytes, dest: Path = LICENSE_PATH) -> Path:
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    return dest


def check_live(user: str, lic: bytes) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    write_license(lic)
    if not LIVE.is_file():
        print(
            f"missing {LIVE} (helper Win32 analysis/keylicense_live.exe)",
            file=sys.stderr,
        )
        # repli : prédicat seul
        ok = license_ok(lic)
        print(f"predicate license: {'OK' if ok else 'FAIL'}")
        print(f"dialog user (attendu Wine SAM): {user}")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    we = winepath_w(BIN)
    wp = winepath_w(BIN.parent)
    try:
        r = wine_cmd([str(LIVE), we, wp, user], timeout=25)
    except subprocess.TimeoutExpired:
        print("LIVE timeout", file=sys.stderr)
        return 1
    out = (r.stdout or "") + (r.stderr or "")
    print(out.rstrip())
    ok = "LIVE OK" in out and license_ok(lic)
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="license file seul (19 octets)")
    ap.add_argument(
        "--user",
        default=DEFAULT_USER,
        help=f"texte du champ dialogue (= username Windows), défaut {DEFAULT_USER}",
    )
    ap.add_argument(
        "--prefix",
        default=None,
        help="4 octets / ASCII pour le début de key.license (défaut 0020)",
    )
    ap.add_argument(
        "--write",
        action="store_true",
        help=f"écrire {LICENSE_PATH.relative_to(ROOT)}",
    )
    ap.add_argument("--check", action="store_true", help="Wine live (helper + key.license)")
    args = ap.parse_args()

    prefix = args.prefix.encode("latin1") if args.prefix is not None else None
    try:
        lic = keygen(prefix)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.check:
        return check_live(args.user, lic)

    if args.write:
        write_license(lic)
        print(f"wrote {LICENSE_PATH} ({lic!r})")

    if args.q:
        sys.stdout.buffer.write(lic + b"\n")
        return 0

    print("=== Sallos Key License ===")
    print(f"dialog user : {args.user}")
    print(f"key.license : {lic.decode('latin1')}  ({len(lic)} bytes)")
    print("predicate   : len==19 && b[0]%2==0 && b[1]%3==0 && b[2]%5==0 && b[3]%8==0")
    print("success     : MessageBox « Success! » / Congratulations…")
    return 0


if __name__ == "__main__":
    sys.exit(main())
