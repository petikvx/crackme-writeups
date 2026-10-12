#!/usr/bin/env python3
"""Solveur — 6_levels by typhoon (crackmes.de) : « binary bomb » Windows (MSVC 2013).

  python3 tools/6-levels-solve.py              # écrit analysis/solution.txt (7 niveaux + niveau secret)
  python3 tools/6-levels-solve.py --check      # + lance  wine original/bomb.exe analysis/solution.txt
"""
import itertools, struct, subprocess, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent.parent
EXE = HERE / "original" / "bomb.exe"
D = EXE.read_bytes()
va = lambda a: 0x14200 + a - 0x416000          # .data : VA 0x416000 -> fichier 0x14200
u32 = lambda a: struct.unpack("<I", D[va(a):va(a) + 4])[0]
cstr = lambda a: D[va(a):D.index(b"\0", va(a))].decode()


def fib(n):                                     # func4 (0x4012b0) : f(n<=1)=1, f(n)=f(n-1)+f(n-2)
    a, b = 1, 1
    for _ in range(n):
        a, b = b, a + b
    return a


def solve():
    lines = []
    lines.append(cstr(0x416188))                                   # 1 : strings_not_equal
    lines.append("HHH7HAHM")                                       # 2 : s[0]='H', s[3]='7', s[5]='A', s[7]='M', len>=8
    a = [1]
    for i in range(1, 6):
        a.append((i + 1) * a[-1])                                  # 3 : a[0]=1, a[i]=(i+1)*a[i-1]
    lines.append(" ".join(map(str, a)))
    lines.append("1 W 501")                                        # 4 : switch n=1 -> c='W', m=0x1f5
    n = next(n for n in range(50) if fib(n) == 0x37)               # 5 : func4(n) == 55
    lines.append(f"{n} guava")                                     #     + "guava" (0x416210) ouvre le secret
    tbl, want = cstr(0x416218), cstr(0x41612c)                     # 6 : tbl[c & 0xf] == "magshimim!"
    lines.append("".join(chr(0x60 + tbl.index(ch)) if tbl.index(ch) else "p" for ch in want))
    vals, node = [], 0x416774                                      # 7 : liste chaînée {val,next}
    while node:
        vals.append(u32(node)); node = u32(node + 4)
    sol = next(t for t in itertools.product(range(1, 7), repeat=6)
               if all(t[i] != t[i + 1] for i in range(5)) and sum(x * y for x, y in zip(t, vals)) == 0x41)
    lines.append(" ".join(map(str, sol)))
    lines.append("flame")                                          # secret : sauts dans des NOP-sleds (.data), Σinc esi == 5
    return lines


if __name__ == "__main__":
    lines = solve()
    out = HERE / "analysis" / "solution.txt"
    out.write_text("\n".join(lines) + "\n")
    print("\n".join(lines))
    if "--check" in sys.argv:
        r = subprocess.run(["wine", str(EXE), str(out)], stdin=subprocess.DEVNULL,
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, cwd=EXE.parent, timeout=60)
        print("exit code:", r.returncode, "(0 = désamorcée ; 5 = BOOM ; 1 = EOF)")
        sys.exit(r.returncode)
