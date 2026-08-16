#!/usr/bin/env python3
"""Solveur CFB3 (CrackNotMe — mini VM / activation password).

Le binaire interprète un bytecode 3 octets/instr en .rdata (VA 0x1400213c0) :

  raw op  (après `dec` → handler)
  1 LOAD   reg[a] = next password byte (0 si fin)
  2 IMM    reg[a] = imm b
  3 ADD    reg[a] += reg[b]   (mod 256)
  4 XOR    reg[a] ^= reg[b]
  5 XORI   reg[a] ^= imm b
  6 CMP    flag = (reg[a] == imm b)
  7 JNE    if !flag: IP = b   (sinon IP++)
  8 OK     ACCESS GRANTED
  9 FAIL   ACCESS DENIED

Inversion des contraintes → password fixe : pwn_vm_3

Usage :
  python3 cfb3-solve.py
  python3 cfb3-solve.py -q
  python3 cfb3-solve.py --check pwn_vm_3
  python3 cfb3-solve.py --trace
  python3 cfb3-solve.py --pe original/CFB3.exe   # recharge le bytecode
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

PASSWORD = "pwn_vm_3"

# 0x78 bytes @ file off 0x1fdc0 (VA 0x1400213c0), CFB3.exe
# sha256 5398416bb82f08c4f6a8779b83d97d2137a058218b07b0f7098ef70cdb639aca
DEFAULT_BYTECODE = bytes.fromhex(
    "010000050013060063070027"
    "01000002012403000106009b070027"
    "01000005005a060034070027"
    "0100000500ac0600f3070027"
    "01000002010f030001060085070027"
    "0100000500ff060092070027"
    "010000020133030001060092070027"
    "01000005001e06002d070027"
    "010000060000070027"
    "080000"
    "090000"
)
PE_BC_OFF = 0x1FDC0
PE_BC_LEN = 0x78

OP_NAMES = {
    1: "LOAD",
    2: "IMM",
    3: "ADD",
    4: "XOR",
    5: "XORI",
    6: "CMP",
    7: "JNE",
    8: "OK",
    9: "FAIL",
}


def load_bytecode(pe: Path | None) -> bytes:
    if pe is None:
        return DEFAULT_BYTECODE
    data = pe.read_bytes()
    return data[PE_BC_OFF : PE_BC_OFF + PE_BC_LEN]


def disasm(bc: bytes) -> list[str]:
    lines = []
    for i in range(0, len(bc), 3):
        op, a, b = bc[i], bc[i + 1], bc[i + 2]
        name = OP_NAMES.get(op, f"?{op}")
        lines.append(f"{i//3:02d}  {name:4} a={a} b=0x{b:02x}")
    return lines


def run_vm(password: str | bytes, bc: bytes = DEFAULT_BYTECODE) -> tuple[bool, str]:
    if isinstance(password, str):
        password = password.encode("latin-1", errors="replace")
    regs = [0, 0, 0, 0]
    pi = 0
    flag = 0
    ip = 0  # instruction index
    steps = 0
    while steps < 256:
        steps += 1
        off = ip * 3
        if off + 2 >= len(bc):
            return False, "IP hors bytecode"
        op, a, b = bc[off], bc[off + 1], bc[off + 2]
        hop = op - 1
        if hop == 0:  # LOAD
            if a >= 4:
                return False, "LOAD reg invalide"
            if pi >= len(password):
                regs[a] = 0
            else:
                regs[a] = password[pi]
                pi += 1
            ip += 1
        elif hop == 1:  # IMM
            if a >= 4:
                return False, "IMM reg invalide"
            regs[a] = b & 0xFF
            ip += 1
        elif hop == 2:  # ADD
            if a >= 4 or b >= 4:
                return False, "ADD reg invalide"
            regs[a] = (regs[a] + regs[b]) & 0xFF
            ip += 1
        elif hop == 3:  # XOR regs
            if a >= 4 or b >= 4:
                return False, "XOR reg invalide"
            regs[a] ^= regs[b]
            ip += 1
        elif hop == 4:  # XOR imm
            if a >= 4:
                return False, "XORI reg invalide"
            regs[a] ^= b & 0xFF
            ip += 1
        elif hop == 5:  # CMP
            if a >= 4:
                return False, "CMP reg invalide"
            flag = 1 if regs[a] == (b & 0xFF) else 0
            ip += 1
        elif hop == 6:  # JNE
            if flag:
                ip += 1
            else:
                ip = b
        elif hop == 7:  # OK
            return True, "ACCESS GRANTED"
        elif hop == 8:  # FAIL
            return False, "ACCESS DENIED (FAIL opcode)"
        else:
            return False, f"opcode inconnu raw={op}"
    return False, "trop d'étapes"


def recover_password(bc: bytes = DEFAULT_BYTECODE) -> str:
    """Inverse les blocs LOAD + (XORI|ADD IMM) + CMP de ce bytecode CFB3."""
    # structure connue : 8× (LOAD r0; transform; CMP; JNE fail) puis LOAD; CMP 0; OK
    chars: list[int] = []
    ip = 0
    n = len(bc) // 3
    while ip < n:
        op, a, b = bc[ip * 3], bc[ip * 3 + 1], bc[ip * 3 + 2]
        if op == 8:  # OK
            break
        if op == 9:
            break
        if op != 1 or a != 0:
            ip += 1
            continue
        # LOAD r0
        ip += 1
        acc_xor = 0
        acc_add = 0
        while ip < n:
            op, a, b = bc[ip * 3], bc[ip * 3 + 1], bc[ip * 3 + 2]
            if op == 5 and a == 0:  # XORI r0, imm
                acc_xor ^= b
                ip += 1
            elif op == 2 and a == 1:  # IMM r1, imm
                imm = b
                ip += 1
                if ip < n and bc[ip * 3] == 3 and bc[ip * 3 + 1] == 0 and bc[ip * 3 + 2] == 1:
                    acc_add = (acc_add + imm) & 0xFF
                    ip += 1
                else:
                    break
            elif op == 6 and a == 0:  # CMP r0, target
                target = b
                # reg0 = (pwd ^ acc_xor) + acc_add  (order: xor then add as in stream)
                # actual stream: either only XORI, or IMM+ADD (no mix in this crackme)
                # reconstruct last ops order from bytecode path: we applied in order
                # For only XORI: pwd ^ xor == target → pwd = target ^ xor
                # For ADD only: pwd + add == target → pwd = target - add
                if acc_add and not acc_xor:
                    pwd_b = (target - acc_add) & 0xFF
                elif acc_xor and not acc_add:
                    pwd_b = target ^ acc_xor
                elif not acc_xor and not acc_add:
                    pwd_b = target  # plain CMP
                else:
                    # mixed not used here
                    pwd_b = ((target - acc_add) & 0xFF) ^ acc_xor
                # skip trailing null load used as length check
                if pwd_b == 0 and len(chars) >= 8:
                    return bytes(chars).decode("latin-1")
                chars.append(pwd_b)
                ip += 1
                # skip JNE
                if ip < n and bc[ip * 3] == 7:
                    ip += 1
                break
            else:
                ip += 1
                break
    return bytes(chars).decode("latin-1")


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB3 mini-VM password solver")
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--check", metavar="PASS", help="simule la VM")
    ap.add_argument("--trace", action="store_true", help="désassemble le bytecode")
    ap.add_argument("--pe", type=Path, help="CFB3.exe pour extraire le bytecode")
    args = ap.parse_args()

    bc = load_bytecode(args.pe)

    if args.trace:
        for line in disasm(bc):
            print(line)
        print()
        print("recovered:", recover_password(bc))
        return 0

    if args.check is not None:
        ok, msg = run_vm(args.check, bc)
        print("OK" if ok else "FAIL", f"({msg})")
        return 0 if ok else 1

    # prefer known password (verified) ; also show recovery
    pwd = PASSWORD
    rec = recover_password(bc)
    if rec and rec != pwd:
        # if PE differs, trust recovery when VM accepts it
        ok, _ = run_vm(rec, bc)
        if ok:
            pwd = rec

    if args.q:
        print(pwd)
        return 0

    print("=== cfb3-solve.py (CFB #3 — mini VM) ===")
    print(f"Password : {pwd}")
    ok, msg = run_vm(pwd, bc)
    print(f"VM check : {'OK' if ok else 'FAIL'} ({msg})")
    print(f"recovered: {rec!r}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
