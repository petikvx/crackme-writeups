#!/usr/bin/env python3
"""Derniere couche du crackme de sudoddos : decode statiquement l'IR (protos) interprete par l'ancien 'VM'.

Etapes (reprises du script, sans l'executer) :
  S  = v1+v2+v3+v4+v5                                   (blobs en alphabet box-drawing)
  v16 = f3(S, (142897697 ^ 0) & 0xffffffff)             (permutation d'alphabet LCG + flux LCG ; 0 = pas de debogueur)
  controle  v17 = FNV-like(v16) == 1827820867
  (v13, v10) = f4(zlib.decompress(v16))                 (protos, descriptions de def/class)
  opcode reel = (ins[0] - ek[ip]) & 255 ; ek[ip] = LCG(16043489 + (k+1)*33912 & 0xffffff)
usage: irdump.py analysis/peel/L4_simpl.py analysis/ir_dump.txt
"""
import ast, sys, zlib

sys.setrecursionlimit(100000)
try: sys.stdout.reconfigure(encoding='utf-8')
except Exception: pass
tree = ast.parse(open(sys.argv[1], encoding='utf-8').read())
body = tree.body
BAD = {'exec', 'eval', 'open', 'os', 'subprocess', 'socket', 'system', 'compile', 'setattr', 'globals'}
funcs = {st.name: st for st in body if isinstance(st, ast.FunctionDef)}

# les 5 blobs (affectations de chaines longues, dans l'ordre)
blobs = [st.value.value for st in body if isinstance(st, ast.Assign) and isinstance(st.value, ast.Constant) and isinstance(st.value.value, str) and len(st.value.value) > 100 and len(st.value.value) != 256][:5]
S = ''.join(blobs)
print('blobs', [len(b) for b in blobs], 'total', len(S))

# f3 = decodeur d'alphabet (prend S et k0, ecrit v9[0]=1 si caractere inconnu) ; f4 = deserialiseur
sel = []
for nm, fn in funcs.items():
    src = ast.unparse(fn)
    if ('1664525' in src and '1103515245' in src) or ('def vi' in src and 'def it' in src): sel.append(fn)
assert len(sel) == 2, [f.name for f in sel]
for fn in sel:
    for n in ast.walk(fn):
        if isinstance(n, ast.Name) and n.id in BAD: raise SystemExit('nom interdit %s dans %s' % (n.id, fn.name))
        if isinstance(n, (ast.Import, ast.ImportFrom)): raise SystemExit('import interdit')
ns = {'__builtins__': __builtins__, 'v9': [0]}
exec(compile(ast.Module(body=sel, type_ignores=[]), '<pure>', 'exec'), ns)
F3 = next(f.name for f in sel if '1664525' in ast.unparse(f)); F4 = next(f.name for f in sel if f.name != F3)

k0 = (142897697 ^ 0) & 0xffffffff
v16 = ns[F3](S, k0)
h = 0
for b in v16: h = (h ^ b) * 16777619 & 0xffffffff
print('flag "inconnu" (doit rester 0):', ns['v9'][0], '| hash', h, '(attendu 1827820867) ->', 'OK' if h == 1827820867 else 'KO')
assert h == 1827820867
raw = zlib.decompress(v16)
protos, mods = ns[F4](raw)
print('protos:', len(protos), '| descriptions def/class:', len(mods))

out = []
def w(s): out.append(s)
for pi, pr in enumerate(protos):
    code = pr[3]
    ek = []; v21 = 16043489 + (pi + 1) * 33912 & 16777215
    for _ in range(len(code)):
        ek.append(v21 & 255); v21 = v21 * 1017115 + 578536 & 16777215
    w('=== proto %d : %d instructions | champs: %s' % (pi, len(code), [type(x).__name__ if i != 3 else 'code' for i, x in enumerate(pr)]))
    for i, x in enumerate(pr):
        if i != 3: w('  pr[%d] = %r' % (i, x if len(repr(x)) < 400 else repr(x)[:400] + '...'))
    for ip, ins in enumerate(code):
        op = (ins[0] - ek[ip]) & 255
        w('  %4d  op%-4d %s' % (ip, op, ' | '.join(repr(a) for a in ins[1:])))
for mi, m in enumerate(mods):
    w('=== def/class %d : %r' % (mi, {k: (v if len(repr(v)) < 300 else repr(v)[:300] + '...') for k, v in m.items()}))
open(sys.argv[2], 'w', encoding='utf-8').write('\n'.join(out))
print('ecrit', sys.argv[2], len(out), 'lignes')
