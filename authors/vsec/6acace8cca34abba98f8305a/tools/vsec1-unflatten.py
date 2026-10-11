#!/usr/bin/env python3
"""VSEC Challenger No.1 — dé-aplatit les 3 fonctions VM_Garble (blob0/1/2).

- décode les tables DISPATCH chiffrées du PE :
      cible = table[state] ^ TK ^ TK2 ^ mix64(TK) ^ mix64(TK2)
- suit `CONST state; DISPATCH` -> goto, supprime le junk (NEG/ADD/POP, a+b-b, xor/pop...)
  et le prédicat opaque `(x+1)^x^1 & 1` (JNZ jamais pris).

  python vsec1-unflatten.py            # écrit analysis/disasm/blob{0,1,2}-unflat.txt
  python vsec1-unflatten.py 1          # n'affiche que blob1
"""
from __future__ import annotations

import importlib.util
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("vdis", ROOT / "tools" / "vsec1-disasm.py")
vdis = importlib.util.module_from_spec(spec)
spec.loader.exec_module(vdis)

IMG = 0x140000000
TK, TK2 = 0xEE089F079D78CD84, 0x6FEF9DC0E305B988      # qword_14061C578 / C580
MASK_TAB = TK ^ TK2 ^ vdis.mix64(TK) ^ vdis.mix64(TK2)
# (VA du slice Dispatch, nb entrées) lus via off_14063E4F0 = {0x1406445b0,3,3} (3 slices Go)
TABS = [(0x140620AE8, 38), (0x1406200C8, 28), (0x14061DCE0, 5)]
EXE = ROOT / "original" / "VSEC_Challenger_No.1.exe"


def pe_reader():
    d = EXE.read_bytes()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    secs = []
    o = pe + 24 + opt
    for _ in range(nsec):
        vs, va, rs, ro = struct.unpack_from("<IIII", d, o + 8)
        secs.append((va, vs, ro, rs))
        o += 40

    def rd(va, n):
        rva = va - IMG
        for sv, vs, ro, rs in secs:
            if sv <= rva < sv + max(vs, rs):
                return d[ro + rva - sv: ro + rva - sv + n]
        raise KeyError(hex(va))

    return rd


def s64(x):
    return x - (1 << 64) if x >> 63 else x


def load(idx, rd):
    ptr, n = TABS[idx]
    table = [r ^ MASK_TAB for r in struct.unpack("<%dQ" % n, rd(ptr, 8 * n))]
    code = (ROOT / "analysis" / f"blob{idx}.bin").read_bytes()
    insns, _ = vdis.disasm(code)
    return table, [(i[0], i[3], i[2]) for i in insns]


def unflatten(idx, rd):
    table, L = load(idx, rd)
    byp = {pc: k for k, (pc, _, _) in enumerate(L)}
    out = [f"# blob{idx} : table DISPATCH décodée = {table}"]

    def junk(k):
        g = lambda j: L[k + j] if k + j < len(L) else (None, None, None)
        n = lambda j: g(j)[1]
        a = lambda j: g(j)[2]
        if n(0) == "CONST" and n(1) == "NEG" and n(2) == "CONST" and a(0) == a(2) and n(3) == "ADD" and n(4) == "POP":
            return 5
        if n(0) == "CONST" and n(1) == "CONST" and n(2) == "ADD" and n(3) == "CONST" and a(1) == a(3) \
                and n(4) == "SUB" and n(5) == "POP":
            return 6
        if n(0) == "CONST" and n(1) == "CONST" and n(2) == "XOR" and n(3) == "POP":
            return 4
        if n(0) == "LOAD" and n(1) == "STORE" and a(0) == a(1):
            return 2
        return 0

    seen, done, todo = set(), set(), [0]
    while todo:
        pc = todo.pop(0)
        if pc in done or pc not in byp:
            continue
        done.add(pc)
        out.append(f"@{pc}:")
        k = byp[pc]
        while True:
            if L[k][0] in seen and k != byp[pc]:
                out.append(f"  goto @{L[k][0]}")
                todo.append(L[k][0])
                break
            seen.add(L[k][0])
            j = junk(k)
            if j:
                k += j
                continue
            p, name, arg = L[k]
            if (name == "LOAD" and k + 9 < len(L) and L[k + 1][1] == "CONST" and L[k + 2][1] == "ADD"
                    and L[k + 3][1] == "LOAD" and L[k + 3][2] == arg and L[k + 4][1] == "XOR"
                    and L[k + 9][1] == "JNZ"):
                k += 10                      # prédicat opaque : JNZ jamais pris
                continue
            if name == "CONST" and k + 1 < len(L) and L[k + 1][1] == "DISPATCH":
                t = table[arg]
                out.append(f"  goto @{t}    (state {arg})")
                todo.append(t)
                break
            out.append(f"  {p:5d}: {name}" + (f" {s64(arg)}" if arg is not None else ""))
            if name in ("JZ", "JNZ"):
                todo.append(s64(arg))
            if name == "RET":
                break
            k += 1
            if k >= len(L):
                break
    return "\n".join(out) + "\n"


def main():
    rd = pe_reader()
    which = [int(sys.argv[1])] if len(sys.argv) > 1 else [0, 1, 2]
    for i in which:
        txt = unflatten(i, rd)
        if len(which) == 1:
            print(txt)
        else:
            (ROOT / "analysis" / "disasm" / f"blob{i}-unflat.txt").write_text(txt, encoding="utf8")
            print(f"blob{i}: {len(txt.splitlines())} lignes -> analysis/disasm/blob{i}-unflat.txt")


if __name__ == "__main__":
    main()
