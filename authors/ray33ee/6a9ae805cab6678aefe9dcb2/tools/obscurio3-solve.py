#!/usr/bin/env python3
"""Keygen for ray33ee obscurio - 3 (crackus.exe + program.bin).

Username → 10 evaluation points + 10 targets (via tools/extract_params VM),
then interpolate a degree-9 polynomial over GF(65521) and pack limbs as:

  XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX   (49 chars)

Dash fillers (ASCII 45) are mandatory at positions i%5==4 (9 of them);
length must be exactly 49 (no trailing dash).
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

MOD = 65521
HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
EXTRACT = HERE / "extract_params"
VM_RUN = HERE / "vm_run"


def egcd(a: int, b: int) -> tuple[int, int, int]:
    if b == 0:
        return a, 1, 0
    g, x, y = egcd(b, a % b)
    return g, y, x - (a // b) * y


def inv(x: int) -> int:
    return egcd(x % MOD, MOD)[1] % MOD


def mat_solve(A: list[list[int]], b: list[int]) -> list[int]:
    n = len(b)
    M = [[A[i][j] % MOD for j in range(n)] + [b[i] % MOD] for i in range(n)]
    for col in range(n):
        piv = next(r for r in range(col, n) if M[r][col] % MOD)
        M[col], M[piv] = M[piv], M[col]
        invp = inv(M[col][col])
        M[col] = [(x * invp) % MOD for x in M[col]]
        for r in range(n):
            if r == col:
                continue
            f = M[r][col]
            if f:
                M[r] = [(M[r][c] - f * M[col][c]) % MOD for c in range(n + 1)]
    return [M[i][n] for i in range(n)]


def ensure_extract() -> None:
    if EXTRACT.is_file():
        return
    src = HERE / "extract_params.c"
    if not src.is_file():
        sys.exit(f"missing {EXTRACT} and {src}")
    subprocess.check_call(["gcc", "-O2", "-o", str(EXTRACT), str(src)])


def extract_params(user: str) -> tuple[list[int], list[int]]:
    ensure_extract()
    dummy = "X" * 49
    p = subprocess.run(
        [str(EXTRACT)],
        input=f"{user}\n{dummy}\n",
        capture_output=True,
        text=True,
        cwd=str(ROOT),
    )
    args = table = None
    for line in p.stdout.splitlines():
        if line.startswith("ARGS"):
            args = list(map(int, line.split()[1:]))
        elif line.startswith("TABLE"):
            table = list(map(int, line.split()[1:]))
    if not args or not table or len(args) != 10 or len(table) != 10:
        sys.exit(f"extract_params failed for user={user!r}:\n{p.stdout}\n{p.stderr}")
    return args, table


def interpolate(args: list[int], table: list[int]) -> list[int]:
    A = [[pow(args[i], 9 - k, MOD) for k in range(10)] for i in range(10)]
    w = mat_solve(A, table)
    for i in range(10):
        r = sum(pow(args[i], 9 - k, MOD) * w[k] % MOD for k in range(10)) % MOD
        if r != table[i] % MOD:
            sys.exit(f"poly verify fail i={i}: got {r} want {table[i]}")
    return w


def pack(limbs: list[int]) -> str:
    parts: list[str] = []
    for i, limb in enumerate(limbs):
        parts.append(f"{limb:04X}")
        if i < 9:
            parts.append("-")
    pw = "".join(parts)
    assert len(pw) == 49
    return pw


def keygen(user: str) -> tuple[str, list[int], list[int], list[int]]:
    args, table = extract_params(user)
    limbs = interpolate(args, table)
    return pack(limbs), args, table, limbs


def check(user: str, password: str) -> bool:
    if not VM_RUN.is_file():
        subprocess.check_call(
            ["gcc", "-O2", "-o", str(VM_RUN), str(HERE / "vm_run.c")]
        )
    p = subprocess.run(
        [str(VM_RUN)],
        input=f"{user}\n{password}\n",
        capture_output=True,
        text=True,
        cwd=str(ROOT),
    )
    out = p.stdout.replace("\0", "")
    return any(line.strip() == "yes" for line in out.splitlines())


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="PASSWORD", help="verify via tools/vm_run")
    ap.add_argument("--wine-check", action="store_true", help="also try wine crackus.exe")
    args_ns = ap.parse_args()

    if args_ns.check is not None:
        pw = args_ns.check
        ok = check(args_ns.user, pw)
        if args_ns.q:
            print("OK" if ok else "FAIL")
        else:
            print(f"user={args_ns.user!r} password={pw!r} vm_run={'yes' if ok else 'no'}")
        if args_ns.wine_check:
            exe = ROOT / "original" / "crackus.exe"
            p = subprocess.run(
                ["wine", str(exe.name)],
                input=f"{args_ns.user}\n{pw}\n",
                capture_output=True,
                text=True,
                cwd=str(ROOT / "original"),
                env={**dict(**{k: v for k, v in __import__("os").environ.items()}), "WINEDEBUG": "-all"},
            )
            wout = (p.stdout or "").replace("\0", "")
            wok = any(line.strip() == "yes" for line in wout.splitlines())
            print(f"wine={'yes' if wok else 'no'}")
        sys.exit(0 if ok else 1)

    pw, a, t, limbs = keygen(args_ns.user)
    if args_ns.q:
        print(pw)
        return
    print(f"user={args_ns.user!r}")
    print(f"args ={a}")
    print(f"table={t}")
    print(f"limbs={limbs}")
    print(f"password={pw}")


if __name__ == "__main__":
    main()
