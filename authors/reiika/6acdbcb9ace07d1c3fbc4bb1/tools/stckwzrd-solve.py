#!/usr/bin/env python3
"""Solveur stckwzrd (Reiika) — déchiffre le bytecode de la VM à pile,
émule le programme et inverse la transformation chaînée octet par octet.

Usage : python3 tools/stckwzrd-solve.py [-q] [--check SERIAL] [--traced] [--dump]
"""
import argparse, os, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "stckwzrd")
BASE = 0x400000                       # LOAD R : vaddr 0x402000 = offset 0x2000
JT, CODE, EXP = 0x4020e0, 0x402140, 0x402280
CODE_LEN = 0x120

# handler (VA) -> mnémonique ; *I = opérande immédiate (2 octets)
HANDLERS = {0x40162b: "PUSH", 0x4017b9: "DROP", 0x401790: "DUP", 0x4017cb: "SWAP",
            0x40157c: "LDIN", 0x40174f: "ADD", 0x40170e: "SUB", 0x4015ea: "XOR",
            0x4015a7: "MUL", 0x401692: "AND", 0x401651: "OR", 0x4016d3: "ROLI",
            0x401541: "RORI", 0x401506: "SHLI", 0x40149d: "SARI", 0x4014d8: "STM",
            0x40143d: "LDM", 0x40146b: "CHK", 0x401405: "ADDI", 0x4013d0: "XORI",
            0x401363: "MULI", 0x401811: "BAD"}
IMM = {"PUSH", "LDIN", "ROLI", "RORI", "SHLI", "SARI", "STM", "LDM", "CHK",
       "ADDI", "XORI", "MULI"}


def load(traced=False):
    d = open(BIN, "rb").read()
    rd = lambda va, n: d[va - BASE: va - BASE + n]
    ops = {}
    for i in range(24):
        off = struct.unpack("<i", rd(JT + 4 * i, 4))[0]
        ops[i] = HANDLERS.get(JT + off, "BAD")
    # boucle SSE 0x401160 : clé[i] = 109*i + 0x3b (mod 256)
    bc = bytearray(b ^ ((109 * i + 0x3B) & 0xFF) for i, b in enumerate(rd(CODE, CODE_LEN)))
    # 0x401236 : bc[1] = 0x5a si ptrace(TRACEME) réussit (pas de debugger), sinon 0
    bc[1] = 0 if traced else 0x5A
    bc += bytes([0x0F, 0x06, 0x10, 0x80, 0xFE])   # dword 0x8010060f + 0xfe (0x40123e)
    return ops, bc, rd(EXP, 16)


def rol8(x, c):
    c &= 7
    return ((x << c) | (x >> ((8 - c) & 7))) & 0xFF


def run(ops, bc, exp, inp, trace=False):
    st, mem, pc, bad = [], [0] * 256, 0, 0
    while pc <= 0x124:
        o = bc[pc]
        if o == 0xFE:
            break
        if o == 0 or o > 0x17 or ops[o] == "BAD":
            return False
        n = ops[o]
        a = bc[pc + 1]
        if trace:
            print(f"{pc:03x}: {n} {a:#04x}" if n in IMM else f"{pc:03x}: {n}")
        pc += 2 if n in IMM else 1
        if n == "PUSH": st.append(a)
        elif n == "LDIN": st.append(inp[a])
        elif n == "LDM": st.append(mem[a])
        elif n == "STM": mem[a] = st.pop()
        elif n == "CHK": bad |= st.pop() != exp[a]
        elif n == "DUP": st.append(st[-1])
        elif n == "DROP": st.pop()
        elif n == "SWAP": st[-1], st[-2] = st[-2], st[-1]
        elif n in ("ADDI", "XORI", "MULI", "SHLI", "SARI", "ROLI", "RORI"):
            x = st.pop()
            st.append({"ADDI": x + a, "XORI": x ^ a, "MULI": x * a, "SHLI": x << (a & 31),
                       "SARI": x >> (a & 31), "ROLI": rol8(x, a), "RORI": rol8(x, 8 - (a & 7))}[n] & 0xFF)
        else:
            b, x = st.pop(), st.pop()
            st.append({"ADD": x + b, "SUB": x - b, "XOR": x ^ b, "MUL": x * b,
                       "AND": x & b, "OR": x | b}[n] & 0xFF)
    return not bad


def solve(ops, bc, exp):
    # programme : PUSH seed ; STM 0x80 ; puis 16 blocs
    #   LDIN i ; DUP ; LDM 0x80 ; XOR ; ADDI k ; ROLI r ; XORI 0x9e ; DUP ; CHK i ; ADD ; STM 0x80
    seed, pc, out = bc[1], 4, bytearray()
    s = seed
    for i in range(16):
        blk = bc[pc:pc + 18]
        k, r, x = blk[7], blk[9], blk[11]   # opérandes ADDI, ROLI, XORI
        v = exp[i]
        c = ((rol8(v ^ x, 8 - (r & 7)) - k) & 0xFF) ^ s   # inversion
        out.append(c)
        s = (c + v) & 0xFF                                 # état chaîné
        pc += 18
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--traced", action="store_true", help="variante vue sous ptrace (seed 0)")
    ap.add_argument("--dump", action="store_true", help="désassemble le bytecode")
    a = ap.parse_args()
    ops, bc, exp = load(a.traced)
    if a.dump:
        run(ops, bc, exp, b"A" * 16, trace=True)
        return
    if a.check:
        ok = len(a.check) == 16 and run(ops, bc, exp, a.check.encode())
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    s = solve(ops, bc, exp)
    assert run(ops, bc, exp, s)
    txt = s.decode("latin-1")
    shown = txt if txt.isprintable() and s.isascii() else f"(non imprimable) {s.hex()}"
    if a.q:
        print(shown)
    else:
        print(f"seed=0x{bc[1]:02x} expected={exp.hex()}")
        print(f"serial: {shown}")


if __name__ == "__main__":
    main()
