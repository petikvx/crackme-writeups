#!/usr/bin/env python3
"""Émulateur de la mini-VM d'« easy vm v2 » (liboxin) et désassembleur de ses
deux bytecodes.

Lit les deux descripteurs de programme dans le `.rdata` de l'exécutable
dépaqueté (`analysis/supervm.unpacked.exe`, voir `tools/aegis-unpack-v144.py`) :

    struct prog { const u8 *code; u32 size; u32 seed; const u8 *optbl; };
      VM1 @ 0x14000a1a0    VM2 @ 0x14000a180

`code` est chiffré par un LCG (`sub_140001450`) :

    state = seed ; for i : state = state*0x41C64E6D + 0x3039 ;
                        plain[i] = code[i] ^ (state >> 24)

`optbl` est une permutation de 18 octets ; la VM applique son inverse à
l'opcode lu (`sub_140001500`), puis saute dans la table de `0x14000a000`.

Une instruction fait 7 octets : `op, a, b, imm32` (LE), cf. `sub_140001860`.
Contexte : bytecode en ctx+0, input (64 u32) en ctx+0x100, 8 registres u32 en
ctx+0x200, len en ctx+0x220, pc en ctx+0x224, flag de comparaison en ctx+0x228.

Usage:
  supervm-emu.py dis                 # désassemble les deux programmes
  supervm-emu.py run <clé>           # exécute les deux VMs sur une clé
"""
import struct, sys, os

EXE = os.path.join(os.path.dirname(__file__), '..', 'analysis', 'supervm.unpacked.exe')
M32 = 0xFFFFFFFF

# index (après démappage) -> (mnémonique, forme des opérandes)
OPS = {
    0:  ('HALT',       ''),
    1:  ('MOV_IMM',    'a,imm'),
    2:  ('LOAD_IN',    'a,b'),     # reg[a] = input[reg[b] & 63]
    3:  ('LOAD_LEN',   'a'),       # reg[a] = len
    4:  ('ADD',        'a,b'),
    5:  ('SUB',        'a,b'),
    6:  ('XOR',        'a,b'),
    7:  ('MUL_IMM',    'a,imm'),
    8:  ('ROL_IMM',    'a,imm'),
    9:  ('SHR_IMM',    'a,imm'),
    10: ('CMP_REG',    'a,b'),
    11: ('CMP_IMM',    'a,imm'),
    12: ('JE',         'imm'),     # si flag != 0 : pc = imm*7
    13: ('JNE',        'imm'),     # si flag == 0 : pc = imm*7
    14: ('INC',        'a'),
    15: ('DEC',        'a'),
    16: ('MOV_REG',    'a,b'),     # reg[a] = reg[b]
    17: ('JMP',        'imm'),     # pc = imm*7
}

def load(path=EXE):
    d = open(path, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    nsec = struct.unpack_from('<H', d, pe + 6)[0]
    sect = pe + 24 + struct.unpack_from('<H', d, pe + 20)[0]

    def va2off(va):
        r = va - 0x140000000
        for i in range(nsec):
            vs, v, rs, ro = struct.unpack_from('<IIII', d, sect + i * 40 + 8)
            if v <= r < v + max(vs, rs):
                return r - v + ro

    def rd(va, n):
        o = va2off(va)
        return d[o:o + n]

    progs = {}
    for name, hdr in (("VM1", 0x14000a1a0), ("VM2", 0x14000a180)):
        code_va, size, seed, optbl_va = struct.unpack('<QIIQ', rd(hdr, 24))
        enc = rd(code_va, size)
        st = seed
        code = bytearray()
        for i in range(size):
            st = (st * 0x41C64E6D + 0x3039) & M32
            code.append(enc[i] ^ ((st >> 24) & 0xFF))
        tbl = rd(optbl_va, 18)
        inv = [0] * 18
        for a in range(18):
            inv[tbl[a]] = a
        progs[name] = (bytes(code), inv, seed)
    return progs

def decode(code, inv):
    out = []
    for k in range(len(code) // 7):
        op = code[k * 7]
        a, b = code[k * 7 + 1], code[k * 7 + 2]
        imm = struct.unpack_from('<I', code, k * 7 + 3)[0]
        out.append((inv[op] if op < 18 else -1, a, b, imm))
    return out

def dis(progs):
    for name, (code, inv, seed) in progs.items():
        print("=== %s (seed %#x, %d instructions)" % (name, seed, len(code) // 7))
        for k, (idx, a, b, imm) in enumerate(decode(code, inv)):
            mn, form = OPS.get(idx, ('?%d' % idx, 'a,b,imm'))
            if form == '':        ops = ''
            elif form == 'a':     ops = 'r%d' % a
            elif form == 'a,b':   ops = 'r%d, r%d' % (a, b)
            elif form == 'a,imm': ops = 'r%d, %#x' % (a, imm)
            elif form == 'imm':   ops = '%d' % imm
            else:                 ops = 'r%d, r%d, %#x' % (a, b, imm)
            print("  %02d  %-9s %s" % (k, mn, ops))

def run(prog, key):
    code, inv, _ = prog
    ins = decode(code, inv)
    reg = [0] * 8
    inp = [0] * 64
    for i, c in enumerate(key[:64]):
        inp[i] = c
    ln = len(key)
    pc = 0
    flag = 0
    for _ in range(0x1000):
        if pc + 7 > len(code):
            return 0
        idx, a, b, imm = ins[pc // 7]
        pc += 7
        if   idx == 0:  return 1 if reg[0] == 1 else 0
        elif idx == 1:  reg[a] = imm & M32
        elif idx == 2:  reg[a] = inp[reg[b] & 63]
        elif idx == 3:  reg[a] = ln
        elif idx == 4:  reg[a] = (reg[a] + reg[b]) & M32
        elif idx == 5:  reg[a] = (reg[a] - reg[b]) & M32
        elif idx == 6:  reg[a] ^= reg[b]
        elif idx == 7:  reg[a] = (reg[a] * imm) & M32
        elif idx == 8:  n = imm & 31; reg[a] = ((reg[a] << n) | (reg[a] >> (32 - n))) & M32 if n else reg[a]
        elif idx == 9:  reg[a] = (reg[a] >> (imm & 31)) & M32
        elif idx == 10: flag = 1 if reg[a] == reg[b] else 0
        elif idx == 11: flag = 1 if reg[a] == (imm & M32) else 0
        elif idx == 12:
            if flag: pc = imm * 7
        elif idx == 13:
            if not flag: pc = imm * 7
        elif idx == 14: reg[a] = (reg[a] + 1) & M32
        elif idx == 15: reg[a] = (reg[a] - 1) & M32
        elif idx == 16: reg[a] = reg[b]
        elif idx == 17: pc = imm * 7
        else: return 0
    return 0

def main():
    progs = load()
    if len(sys.argv) > 1 and sys.argv[1] == 'dis':
        dis(progs)
        return
    if len(sys.argv) > 2 and sys.argv[1] == 'run':
        key = sys.argv[2].encode()
        r1 = run(progs['VM1'], key)
        r2 = run(progs['VM2'], key)
        print("clé %r (%d octets) : VM1=%d VM2=%d -> %s"
              % (sys.argv[2], len(key), r1, r2,
                 "ACCESS GRANTED" if (r1 and r2) else "ACCESS DENIED"))
        return
    print(__doc__)

if __name__ == '__main__':
    main()
