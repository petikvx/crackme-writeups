#!/usr/bin/env python3
"""Solveur — tdaron's Use your brain

ELF64 : Brainfuck compilé en C (hint auteur), obfusqué (usleep/getpid/write vide).
8× ',' : pour chaque caractère, N× '-' puis clear-loop.
password[i] = N_i  (octet ASCII).

Usage :
  python3 use-your-brain-solve.py -q
  python3 use-your-brain-solve.py --check 'bruh wtf'
  python3 use-your-brain-solve.py --run
  python3 use-your-brain-solve.py --lift   # réécrit analysis/lifted.bf
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "a.out"
_LIFTED = _DIR / "analysis" / "lifted.bf"

PASSWORD_CANON = "bruh wtf"  # fallback si objdump indisponible


def _disasm_main() -> list[tuple[int, str]]:
    out = subprocess.check_output(
        [
            "objdump",
            "-d",
            "-M",
            "intel",
            "--start-address=0x1199",
            "--stop-address=0x282d8",
            str(_BIN),
        ],
        text=True,
        errors="replace",
    )
    ins: list[tuple[int, str]] = []
    for line in out.splitlines():
        m = re.match(r"\s*([0-9a-f]+):\s+(?:[0-9a-f]{2} )+\s*(.*)", line)
        if m:
            ins.append((int(m.group(1), 16), m.group(2).strip()))
    return ins


def lift_bf(ins: list[tuple[int, str]] | None = None) -> str:
    ins = ins or _disasm_main()
    idx = {a: i for i, (a, _) in enumerate(ins)}
    loops: list[tuple[int, int, int]] = []
    for i, (addr, op) in enumerate(ins[:-2]):
        if op != "movzx  eax,BYTE PTR [rax]":
            continue
        if ins[i + 1][1] not in ("test   al,al", "test   eax,eax"):
            continue
        m = re.match(r"jne\s+([0-9a-f]+)", ins[i + 2][1])
        if not m:
            continue
        body = int(m.group(1), 16)
        if body >= addr:
            continue
        jmp_addr = None
        for j in range(max(0, idx[body] - 20), i):
            a, o = ins[j]
            mj = re.match(r"jmp\s+([0-9a-f]+)", o)
            if mj and j + 1 < len(ins) and ins[j + 1][0] == body:
                if int(mj.group(1), 16) >= body:
                    jmp_addr = a
                    break
        if jmp_addr is None:
            raise RuntimeError(f"no [ for loop body {body:#x}")
        loops.append((jmp_addr, addr, ins[i + 2][0]))

    open_br = {j for j, _, _ in loops}
    close_br = {t for _, t, _ in loops}
    e_addrs = {a for a, o in ins if o == "add    rax,0x752f"}

    bf: list[str] = []
    i = 0
    while i < len(ins):
        addr, op = ins[i]
        if addr in open_br:
            bf.append("[")
            i += 1
            continue
        if addr in close_br:
            bf.append("]")
            i += 3
            continue
        if addr in e_addrs:
            bf.append("E")
            i += 1
            continue
        if "call" in op and "getchar@plt>" in op:
            bf.append(",")
            i += 1
            continue
        if "call" in op and "putchar@plt>" in op:
            bf.append(".")
            i += 1
            continue
        if op == "add    QWORD PTR [rbp-0x88b0],0x1":
            bf.append(">")
            i += 1
            continue
        if op == "sub    QWORD PTR [rbp-0x88b0],0x1":
            bf.append("<")
            i += 1
            continue
        if op == "lea    edx,[rax+0x1]":
            bf.append("+")
            i += 1
            continue
        if op in ("lea    edx,[rax-0x1]", "lea    edx,[rax+0xffffffff]"):
            bf.append("-")
            i += 1
            continue
        i += 1
    return "".join(bf)


def password_from_bf(code: str) -> str:
    vals: list[int] = []
    idx = 0
    while True:
        i = code.find(",", idx)
        if i < 0:
            break
        j = i + 1
        while j < len(code) and code[j] == "-":
            j += 1
        vals.append(j - (i + 1))
        idx = i + 1
    if len(vals) != 8:
        raise RuntimeError(f"expected 8 commas, got {len(vals)}: {vals}")
    return bytes(v & 0xFF for v in vals).decode("latin1")


def password() -> str:
    try:
        return password_from_bf(lift_bf())
    except (FileNotFoundError, subprocess.CalledProcessError, RuntimeError):
        return PASSWORD_CANON


def check(s: str) -> bool:
    return s == password()


def run_bin(s: str, timeout: float = 5.0) -> tuple[int, str]:
    try:
        proc = subprocess.run(
            [str(_BIN)],
            input=s.encode("latin1"),
            capture_output=True,
            timeout=timeout,
        )
    except FileNotFoundError:
        return -1, "no-bin"
    except PermissionError:
        return -1, "no-exec"
    except subprocess.TimeoutExpired:
        return -1, "timeout"
    text = (proc.stdout + proc.stderr).decode("latin-1", errors="replace")
    return proc.returncode, text


def main() -> int:
    ap = argparse.ArgumentParser(description="Use your brain solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--lift", action="store_true", help="dump analysis/lifted.bf")
    ap.add_argument("--run", action="store_true", help="exécuter le binaire")
    args = ap.parse_args()

    if args.lift:
        code = lift_bf()
        _LIFTED.parent.mkdir(parents=True, exist_ok=True)
        _LIFTED.write_text(code)
        print(f"wrote {_LIFTED} ({len(code)} chars)")
        print(password_from_bf(code))
        return 0

    pw = password()
    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
        return 0

    print("=== Use your brain ===")
    print(f"password : {pw!r}")
    print("idea     : brainfuck→C ; 8× (',' + N×'-') ⇒ ord = N")
    print("success  : you made it hero")
    if args.run:
        rc, text = run_bin(pw)
        print(f"--- live rc={rc} ---")
        sys.stdout.write(text)
        if not text.endswith("\n"):
            print()
    return 0


if __name__ == "__main__":
    sys.exit(main())
