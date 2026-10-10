#!/usr/bin/env python3
"""Solveur pour crackmes.de qcrk_3 by qnix (id 5ab77f5333c5d40ad448c0f3).

Le binaire lit getenv("KEY") : toute valeur non-NULL (même chaîne vide) est
acceptée, sans comparaison. Anti-debug ptrace(PTRACE_TRACEME). `--check`
extrait le tgz et vérifie la bannière + l'écho de la clé.
"""

from __future__ import annotations

import argparse
import os
import subprocess
import sys
import tarfile
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
TGZ = HERE.parent / "original" / "qcrk3.tgz"
EXAMPLE_KEY = "petik"


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("-q", action="store_true", help="n'afficher que la clé d'exemple")
    p.add_argument("--check", action="store_true", help="lancer l'ELF avec KEY=petik")
    p.add_argument("--key", default=EXAMPLE_KEY, help="valeur de KEY (défaut: petik)")
    args = p.parse_args()
    if args.q:
        print(args.key)
    else:
        print(f"KEY={args.key}  (getenv("KEY") non-NULL suffit)")
    if not args.check:
        return 0
    with tempfile.TemporaryDirectory() as tmp:
        with tarfile.open(TGZ, "r:gz") as tf:
            tf.extractall(tmp)
        path = Path(tmp) / "qcrk3"
        path.chmod(0o755)
        env = os.environ.copy()
        env["KEY"] = args.key
        proc = subprocess.run([str(path)], capture_output=True, env=env)
    out = proc.stdout
    if b"Qcrk-3 By Qnix" not in out or args.key.encode() not in out:
        print(out, file=sys.stderr)
        print(proc.stderr, file=sys.stderr)
        return 1
    if b"Key Not Available" in out or b"Ptrace" in out:
        print(out, file=sys.stderr)
        return 1
    if not args.q:
        print(f"check: OK (exit {proc.returncode})")
        print(out.decode(errors="replace"), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
