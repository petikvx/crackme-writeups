#!/usr/bin/env python3
"""Alias keygen → chocolate-factory-solve.py --keygen.

Exemples :
  python3 chocolate-factory-keygen.py
  python3 chocolate-factory-keygen.py -n 10
  python3 chocolate-factory-keygen.py --all --flat
"""

from __future__ import annotations

import sys

# Réutilise le solveur (même dossier).
from importlib.util import module_from_spec, spec_from_file_location
from pathlib import Path


def _load_solve():
    path = Path(__file__).with_name("chocolate-factory-solve.py")
    spec = spec_from_file_location("choco_solve", path)
    if spec is None or spec.loader is None:
        raise SystemExit(f"cannot load {path}")
    mod = module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def main() -> int:
    mod = _load_solve()
    argv = sys.argv[1:]
    # Par défaut : mode keygen (1 ticket), sauf si l'utilisateur passe déjà
    # une action (--check / --w4 / -q / --keygen / --all).
    flags = {"--check", "--w4", "-q", "--keygen", "-k", "--all"}
    if not any(a == f or a.startswith("--check=") for a in argv for f in flags):
        argv = ["--keygen", *argv]
    sys.argv = [sys.argv[0], *argv]
    return mod.main()


if __name__ == "__main__":
    raise SystemExit(main())
