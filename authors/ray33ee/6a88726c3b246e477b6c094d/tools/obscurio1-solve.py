#!/usr/bin/env python3
"""Solveur — ray33ee obscurio - 1 (password fixe).

Récupération sans spoiler : oracle sur le nombre de steps de la VM
(longueur exacte 17, puis caractère par caractère).

  python3 tools/obscurio1-solve.py -q
  python3 tools/obscurio1-solve.py --recover
  python3 tools/obscurio1-solve.py --check
"""
from __future__ import annotations

import argparse
import string
import struct
import subprocess
import sys
import time
from pathlib import Path

PASSWORD = "r4y_0b5Curi0_I729"
ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "crackus.exe"
BIN = ROOT / "original" / "program.bin"
ORACLE_BIN = ROOT / "tools" / "oracle_steps"

# Mesures empiriques (interpréteur fidèle tools/vm_run1 / oracle_steps) :
# - len != 17 → early-fail ~93080 steps
# - len == 17, 0 bon chars → 96886 steps
# - chaque caractère correct ajoute +4644 steps (jusqu’au 16e)
# - password entier → 172871 steps, stack_top == 0, "well done!"
LEN = 17
STEPS_LEN_OK = 96886
STEPS_PER_CHAR = 4644

T0 = [1, 3, 0, 2, 0, 0, 0, 0]
T1 = [3, 8, 1, 14, 6, 12, 9, 0, 11, 4, 15, 7, 13, 2, 10, 5]


def fold_r(a: int, s: int) -> int:
    a &= 0xFFFFFFFF
    while s <= 0x1F:
        a ^= a >> s
        s *= 2
        a &= 0xFFFFFFFF
    return a


def fold_l(a: int, s: int) -> int:
    a &= 0xFFFFFFFF
    while s <= 0x1F:
        a ^= a << s
        s *= 2
        a &= 0xFFFFFFFF
    return a


def dec_imm(enc: int, pc: int) -> int:
    v2 = fold_r(enc, 8)
    v3 = fold_l((1700297411 * v2 - 29109) & 0xFFFFFFFF, 5)
    return (fold_r((1650947975 * v3) & 0xFFFFFFFF, 7) - 41943 - pc) & 0xFFFFFFFF


def dec_jmp(a: int) -> int:
    return (T1[a & 0xF] + (a & 0xFFFFFFF0)) & 0xFFFFFFFF


def dec_slot(a: int, pc: int) -> int:
    if a > 0xF:
        return ((pc % 9) ^ (T1[a & 0xF] + (a & 0xFFFFFFF0))) & 0xFFFFFFFF
    return ((pc % 9) ^ (T0[a & 3] + (a & 0xFFFFFFFC))) & 0xFFFFFFFF


def dec_frame(a: int, pc: int) -> int:
    return (((a & 0xFFFFFFFC) + T0[a & 3]) ^ (pc & 3)) & 0xFFFFFFFF


def i32(u: int) -> int:
    return u - 0x100000000 if u >= 0x80000000 else u


def load_program(path: Path = BIN):
    raw = path.read_bytes()
    words = list(struct.unpack("<%dI" % (len(raw) // 4), raw))
    n = len(words) // 2
    ops = [words[2 * i] for i in range(n)]
    imms = [words[2 * i + 1] for i in range(n)]
    dec = [0] * n
    for pc in range(n):
        op, arg = ops[pc], imms[pc]
        if op == 4:
            dec[pc] = dec_imm(arg, pc)
        elif op in (0x14, 0x28):
            dec[pc] = dec_jmp(arg)
        elif op in (0, 1, 2, 3):
            dec[pc] = dec_slot(arg, pc)
        elif op in (0x29, 0x2A):
            dec[pc] = dec_frame(arg, pc)
        else:
            dec[pc] = arg
    return ops, dec


def run_steps_py(password: str, ops, dec) -> tuple[int, int | None]:
    """Interpréteur Python fidèle au host (retourne steps, stack_top)."""
    n = len(ops)
    op_stack = [0] * 200000
    call_stack = [0] * 200000
    heap = [0] * 200000
    osp = csp = fp = pc = steps = 0
    it = iter(password)

    def getch() -> int:
        try:
            return ord(next(it))
        except StopIteration:
            return -1

    while pc < n:
        steps += 1
        op = ops[pc]
        d = dec[pc]
        if op == 4:
            op_stack[osp] = d
            osp += 1
            pc += 1
        elif op == 0:
            op_stack[osp] = call_stack[(fp + 1 + i32(d)) & 0xFFFFFFFF]
            osp += 1
            pc += 1
        elif op == 1:
            osp -= 1
            call_stack[(fp + 1 + i32(d)) & 0xFFFFFFFF] = op_stack[osp]
            pc += 1
        elif op == 2:
            op_stack[osp] = call_stack[(fp - i32(d) - 2) & 0xFFFFFFFF]
            osp += 1
            pc += 1
        elif op == 3:
            osp -= 1
            call_stack[(fp - i32(d) - 2) & 0xFFFFFFFF] = op_stack[osp]
            pc += 1
        elif op == 5:
            osp -= 1
            call_stack[csp] = op_stack[osp]
            csp += 1
            pc += 1
        elif op == 0x14:
            osp -= 1
            pc = d if op_stack[osp] == 0 else pc + 1
        elif op == 0x28:
            call_stack[csp] = pc + 1
            csp += 1
            pc = d
        elif op == 0x2A:
            call_stack[csp] = fp
            nc = csp + 1
            fp = csp
            csp = d + nc
            pc += 1
        elif op == 0x29:
            v35 = fp
            fp = call_stack[fp]
            v35 -= 1
            ret = call_stack[v35]
            csp = v35 - d
            pc = ret
        elif op == 0x64:
            osp -= 1
            op_stack[osp - 1] &= op_stack[osp]
            pc += 1
        elif op == 0x65:
            osp -= 1
            op_stack[osp - 1] |= op_stack[osp]
            pc += 1
        elif op == 0x68:
            osp -= 1
            sh = op_stack[osp]
            op_stack[osp - 1] = 0 if sh > 0x1F else ((op_stack[osp - 1] << sh) & 0xFFFFFFFF)
            pc += 1
        elif op == 0x69:
            osp -= 1
            sh = op_stack[osp]
            op_stack[osp - 1] = 0 if sh > 0x1F else (op_stack[osp - 1] >> sh)
            pc += 1
        elif op == 0x96:
            op_stack[osp - 1] = (~op_stack[osp - 1]) & 0xFFFFFFFF
            pc += 1
        elif op == 0xC8:
            op_stack[osp] = op_stack[osp - 2]
            osp += 1
            pc += 1
        elif op == 0xCA:
            op_stack[osp] = op_stack[osp - 1]
            osp += 1
            pc += 1
        elif op == 0xC9:
            a, b, c = op_stack[osp - 3], op_stack[osp - 2], op_stack[osp - 1]
            op_stack[osp - 3], op_stack[osp - 2], op_stack[osp - 1] = c, a, b
            pc += 1
        elif op == 0xCB:
            a, b, c, e = (
                op_stack[osp - 4],
                op_stack[osp - 3],
                op_stack[osp - 2],
                op_stack[osp - 1],
            )
            op_stack[osp - 4], op_stack[osp - 3], op_stack[osp - 2], op_stack[osp - 1] = (
                b,
                c,
                e,
                a,
            )
            pc += 1
        elif op == 0x1F4:
            osp -= 1
            pc += 1
        elif op == 0x1F7:
            osp -= 1
            pc += 1
        elif op == 0x1F8:
            osp -= 1
            maxlen = op_stack[osp]
            osp -= 1
            base = op_stack[osp]
            nread = 0
            while True:
                ch = getch()
                if ch == -1 or nread == maxlen:
                    break
                heap[base + 1 + nread] = ch
                nread += 1
            heap[base] = nread
            pc += 1
        elif op == 0x1F6:
            osp -= 1
            val = op_stack[osp]
            osp -= 1
            addr = op_stack[osp]
            heap[addr] = val
            pc += 1
        elif op == 0x1F5:
            op_stack[osp - 1] = heap[op_stack[osp - 1]]
            pc += 1
        else:
            raise RuntimeError(f"unknown opcode {op} at pc={pc}")
        if steps > 300000:
            break
    top = op_stack[osp - 1] if osp else None
    return steps, top


def run_steps(password: str, ops=None, dec=None) -> tuple[int, int | None]:
    """Préfère tools/oracle_steps (C) s’il est compilé, sinon Python."""
    if ORACLE_BIN.is_file():
        try:
            p = subprocess.run(
                [str(ORACLE_BIN), password],
                capture_output=True,
                text=True,
                timeout=5,
                cwd=str(ROOT),
            )
            parts = (p.stdout or "").strip().split()
            if len(parts) >= 2:
                return int(parts[0]), int(parts[1])
        except (OSError, ValueError, subprocess.TimeoutExpired):
            pass
    if ops is None or dec is None:
        ops, dec = load_program()
    return run_steps_py(password, ops, dec)


def recover(verbose: bool = True) -> str:
    charset = string.ascii_letters + string.digits + "_-"
    ops, dec = load_program()
    # warmup path choice
    _ = run_steps("X" * LEN, ops, dec)

    found: list[str] = ["?"] * LEN
    t0 = time.time()
    for i in range(LEN):
        best_ch = None
        best_steps = -1
        expected = STEPS_LEN_OK + (i + 1) * STEPS_PER_CHAR
        for ch in charset:
            pw = "".join(found[:i]) + ch + ("X" * (LEN - i - 1))
            steps, top = run_steps(pw, ops, dec)
            if steps > best_steps:
                best_steps = steps
                best_ch = ch
            if i < LEN - 1 and steps == expected:
                best_ch = ch
                best_steps = steps
                break
            if i == LEN - 1 and top == 0:
                best_ch = ch
                best_steps = steps
                break
        if best_ch is None:
            raise RuntimeError(f"no candidate at position {i}")
        found[i] = best_ch
        if verbose:
            print(
                f"  [{i:02d}] '{best_ch}' steps={best_steps} → {''.join(found)}",
                file=sys.stderr,
            )
    pw = "".join(found)
    if verbose:
        print(f"recovered in {time.time() - t0:.1f}s", file=sys.stderr)
    return pw


def wine_check(password: str = PASSWORD) -> bool:
    if not EXE.is_file():
        print("missing", EXE, file=sys.stderr)
        return False
    try:
        p = subprocess.run(
            ["env", "WINEDEBUG=-all", "wine", str(EXE.name)],
            input=password + "\n",
            capture_output=True,
            text=True,
            timeout=20,
            cwd=str(EXE.parent),
        )
    except FileNotFoundError as e:
        print("wine missing:", e, file=sys.stderr)
        return False
    out = (p.stdout or "") + (p.stderr or "")
    ok = p.returncode == 0 and "well done" in out.lower()
    print(out.strip())
    print("OK" if ok else "FAIL", f"(exit={p.returncode})")
    return ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument(
        "--recover",
        action="store_true",
        help="retrouver le password via oracle steps (VM)",
    )
    ap.add_argument("--check", action="store_true", help="preuve Wine")
    args = ap.parse_args()

    if args.recover:
        pw = recover(verbose=not args.q)
        print(pw)
        return 0

    if args.check:
        return 0 if wine_check(PASSWORD) else 1

    if args.q:
        print(PASSWORD)
        return 0

    print(f"password : {PASSWORD}")
    print("recover  : python3 tools/obscurio1-solve.py --recover")
    print(f"run      : cd original && printf '%s\\n' | wine crackus.exe" % PASSWORD)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
