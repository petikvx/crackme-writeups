#!/usr/bin/env python3
"""Désassembleur du bytecode de crackme_nop_vm (interpréteur natif 0x401000).
Format : [op][mode][len][args] ; mode 0xAE = registre (offset dans le cadre pusha), 0xFF = immédiat.
Parcours récursif depuis 0x40121d (appelé par le stub natif 0x40137c)."""
import struct, sys
d = open(sys.argv[1] if len(sys.argv) > 1 else 'original/crackme_nop_vm.exe', 'rb').read()
B = lambda va: d[va - 0x401000 + 0x400]
D = lambda va: struct.unpack('<I', d[va - 0x401000 + 0x400:va - 0x401000 + 0x404])[0]
R = {0: 'edi', 4: 'esi', 8: 'ebp', 0xc: 'esp', 0x10: 'ebx', 0x14: 'edx', 0x18: 'ecx', 0x1c: 'eax'}
IAT = {0x4014e8: 'ExitProcess', 0x4014ee: 'GetStdHandle', 0x4014f4: 'ReadFile', 0x4014fa: 'Sleep', 0x401500: 'WriteFile'}
names = {0x65: 'ret', 0x75: 'vcall', 0x97: 'mov', 0x59: 'push', 0xe8: 'ncall', 0xf6: 'cmp', 0x4b: 'jmp', 0xae: 'je', 0x13: 'jne', 0x33: 'load', 0xa1: 'and', 0x1d: 'add'}
seen, todo, out = set(), [0x40121d], {}
def ann(v):
    s = IAT.get(v, '')
    if 0x401204 < v < 0x401506 and not s:
        try:
            t = d[v - 0x401000 + 0x400:v - 0x401000 + 0x440].split(b'\0')[0]
            if len(t) > 3 and all(32 <= c < 127 or c == 10 for c in t[:8]): s = repr(t[:40].decode('latin-1'))
        except Exception: pass
    return f'  ; {s}' if s else ''
while todo:
    pc = todo.pop()
    while pc not in seen and 0x401204 <= pc < 0x401506:
        seen.add(pc); op, mode, ln = B(pc), B(pc+1), B(pc+2)
        n = names.get(op, f'nop?{op:02x}')
        if op == 0x65: out[pc] = 'ret'; break
        if op in (0x97, 0xf6, 0x33, 0xa1, 0x1d):
            a = R.get(B(pc+3), hex(B(pc+3)))
            b = R.get(B(pc+4), hex(B(pc+4))) if mode == 0xae else f'0x{D(pc+4):x}' + ann(D(pc+4))
            out[pc] = f'{n} {a}, {"["+b+"]" if op == 0x33 else b}'
        elif op in (0x59, 0xe8, 0x75, 0x4b, 0xae, 0x13):
            v = R.get(B(pc+3)) if mode == 0xae else D(pc+3)
            out[pc] = f'{n} {v if isinstance(v, str) else hex(v)}' + ('' if isinstance(v, str) else ann(v))
            if op in (0x75, 0xae, 0x13) and not isinstance(v, str): todo.append(v)
            if op == 0x4b and not isinstance(v, str): pc = v; continue
        else: out[pc] = f'nop (op {op:02x}, len {ln})'
        pc += ln
for a in sorted(out): print(f'{a:08x}  {out[a]}')
