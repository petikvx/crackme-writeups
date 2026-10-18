#!/usr/bin/env python3
"""Deballe UNE couche de l'emballage du crackme de sudoddos, sans executer le crackme.

Entree : la source *fusionnee et simplifiee* d'une couche (couche + chaines d'etapes, voir simplify.py),
qui contient : 5 blobs `vN`, des fonctions pures (shuffle / decode perm / decode octets / decryptage),
et le code d'assemblage :
    vL = [vA[::-1], vB[::-1], ...]            # 5 blobs inverses
    vP = Fperm('<5 car>'[::-1])               # permutation
    vJ = ''.join(vL[i] for i in vP)
    vR = Fdec(Fbytes(vJ), vJ)                 # decode + XOR + (zlib|lzma|bz2) + controle sha256
On execute uniquement les `def` de la couche apres verification par liste blanche (hashlib/binascii/zlib/lzma/bz2),
en remplacant le `compile(src,'<god>','exec')` final par `return src`.

usage: layer.py merged_simplified.py out_source.py
"""
import ast, sys

sys.setrecursionlimit(100000)
try: sys.stdout.reconfigure(encoding='utf-8'); sys.stderr.reconfigure(encoding='utf-8')
except Exception: pass
OK_MODULES = {'hashlib', 'binascii', 'zlib', 'lzma', 'bz2', 'builtins'}
BAD_NAMES = {'exec', 'eval', 'open', 'os', 'subprocess', 'socket', 'system', 'popen', 'input', 'globals', 'setattr', 'delattr'}

tree = ast.parse(open(sys.argv[1], encoding='utf-8').read())
body = tree.body


def is_slice_rev(n): return isinstance(n, ast.Subscript) and isinstance(n.slice, ast.Slice) and isinstance(n.slice.step, ast.UnaryOp) and isinstance(n.slice.step.op, ast.USub)


# 1. liste des 5 blobs inverses (n'importe ou dans l'arbre)
blob_names = None
for n in ast.walk(tree):
    if isinstance(n, ast.List) and len(n.elts) >= 3 and all(is_slice_rev(e) and isinstance(e.value, ast.Name) for e in n.elts):
        blob_names = [e.value.id for e in n.elts]
assert blob_names, 'liste des 5 blobs introuvable'

# 2. permutation : Call(Fperm, [Subscript(Constant str de 5 car, [::-1])])
perm_call = None
for n in ast.walk(tree):
    if isinstance(n, ast.Call) and isinstance(n.func, ast.Name) and len(n.args) == 1 and is_slice_rev(n.args[0]) and isinstance(n.args[0].value, ast.Constant) and isinstance(n.args[0].value.value, str) and len(n.args[0].value.value) == len(blob_names):
        perm_call = n
assert perm_call, 'appel de permutation introuvable'
FPERM = perm_call.func.id; PERM_LIT = perm_call.args[0].value.value

# 3. chaine de decodage : X = Fdec(Fbytes(J), J)
chain = None
for n in ast.walk(tree):
    if isinstance(n, ast.Assign) and isinstance(n.value, ast.Call) and isinstance(n.value.func, ast.Name) and len(n.value.args) == 2 \
            and isinstance(n.value.args[0], ast.Call) and isinstance(n.value.args[0].func, ast.Name):
        chain = n.value
assert chain, 'chaine f7(f6(x), x) introuvable'
FDEC = chain.func.id; FBYTES = chain.args[0].func.id

# 4. valeurs des blobs : derniere affectation de chaine de chaque nom
vals = {}
for st in body:
    if isinstance(st, ast.Assign) and len(st.targets) == 1 and isinstance(st.targets[0], ast.Name) and isinstance(st.value, ast.Constant) and isinstance(st.value.value, str):
        vals[st.targets[0].id] = st.value.value
blobs = [vals[b][::-1] for b in blob_names]
print('blobs', blob_names, [len(b) for b in blobs], '| perm', PERM_LIT, '| fonctions: perm=%s bytes=%s dec=%s' % (FPERM, FBYTES, FDEC))

# 5. fonctions de la couche : verification par liste blanche, puis exec isole
funcs = {st.name: st for st in body if isinstance(st, ast.FunctionDef)}
need = {FPERM, FBYTES, FDEC}


def deps(fn):
    return {n.func.id for n in ast.walk(fn) if isinstance(n, ast.Call) and isinstance(n.func, ast.Name) and n.func.id in funcs}


todo = set(need)
while True:
    new = set()
    for nm in todo: new |= deps(funcs[nm])
    if new <= todo: break
    todo |= new
for nm in todo:
    fn = funcs[nm]
    for n in ast.walk(fn):
        if isinstance(n, ast.Name) and n.id in BAD_NAMES: raise SystemExit('fonction %s: nom interdit %s' % (nm, n.id))
        if isinstance(n, ast.Call) and isinstance(n.func, ast.Name) and n.func.id == '__import__':
            if not (n.args and isinstance(n.args[0], ast.Constant) and n.args[0].value in OK_MODULES): raise SystemExit('import interdit dans %s' % nm)
        if isinstance(n, (ast.Import, ast.ImportFrom)): raise SystemExit('import interdit dans %s' % nm)


class Patch(ast.NodeTransformer):
    def visit_Return(self, n):
        v = n.value
        if isinstance(v, ast.Call) and getattr(v.func, 'attr', None) == 'compile' or (isinstance(v, ast.Call) and getattr(v.func, 'id', None) == 'compile'):
            return ast.copy_location(ast.Return(v.args[0]), n)
        return n


mod = ast.Module(body=[Patch().visit(funcs[nm]) for nm in sorted(todo)], type_ignores=[])
ast.fix_missing_locations(mod)
ns = {'__builtins__': __builtins__}
exec(compile(mod, '<layer-funcs>', 'exec'), ns)     # uniquement des def (aucune execution du crackme)

perm = ns[FPERM](PERM_LIT[::-1])
print('permutation:', perm)
assert sorted(perm) == list(range(len(blobs)))
joined = ''.join(blobs[i] for i in perm)
data = ns[FBYTES](joined)
try:
    src = ns[FDEC](data, joined)
except ValueError as e:
    raise SystemExit('controle sha256 echoue: %s' % str(e)[:60])
if isinstance(src, bytes): src = src.decode()
open(sys.argv[2], 'w', encoding='utf-8').write(src)
print('OK : source dechiffree', len(src), 'caracteres ->', sys.argv[2])
