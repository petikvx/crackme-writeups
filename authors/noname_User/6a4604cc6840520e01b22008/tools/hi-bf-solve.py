#!/usr/bin/env python3
"""Désobfusque original/hi_bf.py (ShadowForge VM) SANS l'exécuter.

Lit le fichier avec ast, reconstruit la clé maître, déchiffre les sections
(SHA-256 XOR-stream), désassemble le bytecode VM et rejoue le programme
protégé dans un mini-interpréteur sûr (uniquement print/consts).
Aucun serial : le programme protégé se résume à print('hi').

Usage : hi-bf-solve.py [-q] [--check] [fichier]
"""
import argparse, ast, base64, hashlib, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT = os.path.join(HERE, '..', 'original', 'hi_bf.py')


def varint(d, p):
    r = s = 0
    while True:
        b = d[p]; p += 1
        r |= (b & 127) << s
        if not b & 128:
            return r, p
        s += 7


def xor_stream(data, key):
    out = bytearray()
    for c in range((len(data) + 31) // 32):
        blk = hashlib.sha256(key + c.to_bytes(4, 'big')).digest()
        out += bytes(a ^ b for a, b in zip(data[c * 32:(c + 1) * 32], blk))
    return bytes(out)


def const_val(n):
    return ast.literal_eval(n) if not isinstance(n, ast.BinOp) else const_val(n.left) + const_val(n.right)


def load(path):
    tree = ast.parse(open(path, encoding='utf8').read())
    carrier = master = None
    for n in ast.walk(tree):
        if isinstance(n, ast.Assign) and getattr(n.targets[0], 'id', '') == '__SF_CARRIER__':
            carrier = ast.literal_eval(n.value)
        if isinstance(n, ast.FunctionDef) and n.name == '_sf_build_secret':
            parts = [const_val(s.value) for s in n.body
                     if isinstance(s, ast.Assign) and isinstance(s.value, ast.BinOp)]
            master = b''.join(p.to_bytes(4, 'big') for p in parts)
    return carrier, master


def sections(carrier):
    c = base64.b85decode(carrier[5:])
    assert c[:4] == b'SF02'
    cnt, p = varint(c, 4)
    out = {}
    for _ in range(cnt):
        sid, p = varint(c, p)
        tl, p = varint(c, p); tag = c[p:p + tl]; p += tl
        cl, p = varint(c, p); out[sid] = (tag, c[p:p + cl]); p += cl
    return out


def decrypt(master, secs, sid):
    key = hashlib.sha256(master + sid.to_bytes(2, 'big')).digest()
    tag, ct = secs[sid]
    clear = xor_stream(ct, key)
    assert hashlib.sha256(key + clear).digest()[:16] == tag, 'tag KO section %d' % sid
    return clear


def const(d, p):
    t = d[p]; p += 1
    if t == 0: return None, p
    if t == 1: return d[p] != 0, p + 1
    if t == 2:
        n, p = varint(d, p); return int.from_bytes(d[p:p + n], 'big', signed=True), p + n
    if t == 4:
        n, p = varint(d, p); return d[p:p + n].decode(), p + n
    raise SystemExit('const tag %d non géré' % t)


def recover(path):
    carrier, master = load(path)
    secs = sections(carrier)
    meta = decrypt(master, secs, 1)
    msid, _ = varint(meta, 1)
    om = decrypt(master, secs, 2)
    cnt, p = varint(om, 0); rev = {}
    for _ in range(cnt):
        canon, vc = om[p], om[p + 1]; p += 2
        for m in om[p:p + vc]: rev[m] = canon
        p += vc
    fc, p = varint(om, p); fake = set(om[p:p + fc])
    cs = decrypt(master, secs, 3)
    n, p = varint(cs, 0); consts = []
    for _ in range(n):
        v, p = const(cs, p); consts.append(v)
    ns = decrypt(master, secs, 4)
    n, p = varint(ns, 0); names = []
    for _ in range(n):
        sz, p = varint(ns, p); names.append(ns[p:p + sz].decode()); p += sz
    mod = decrypt(master, secs, msid)
    cnt, p = varint(mod, 0); ins = []
    for _ in range(cnt):
        m = mod[p]; p += 1
        ac, p = varint(mod, p); a = []
        for _ in range(ac):
            v, p = varint(mod, p); a.append(v)
        if m not in fake: ins.append((rev.get(m, m), a))
    return consts, names, ins, sorted(secs)


def replay(consts, names, ins):
    """Mini-VM : seulement LOAD_CONST(1) LOAD_NAME(2) CALL(6) POP(26) RET(7)."""
    st, out = [], []
    for op, a in ins:
        if op == 1: st.append(consts[a[0]])
        elif op == 2: assert names[a[0]] == 'print'; st.append(lambda *x: out.append(' '.join(map(str, x))))
        elif op == 6:
            args = [st.pop() for _ in range(a[0])][::-1]; st.append(st.pop()(*args))
        elif op == 26: st.pop()
        elif op == 7: break
        else: raise SystemExit('opcode %d non géré (programme plus riche que prévu)' % op)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('file', nargs='?', default=DEFAULT)
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true', help='compare avec l\'exécution réelle de l\'original (copie temporaire)')
    o = ap.parse_args()
    consts, names, ins, sids = recover(o.file)
    out = replay(consts, names, ins)
    if o.q:
        print('\n'.join(out)); 
    else:
        print('sections :', sids); print('consts :', consts); print('names :', names)
        for i, x in enumerate(ins): print(i, x)
        print('source équivalente : print(%r)' % consts[0]); print('sortie :', out)
    if o.check:
        import tempfile, shutil
        with tempfile.TemporaryDirectory() as d:
            t = os.path.join(d, 'hi_bf.py'); shutil.copy(o.file, t)
            r = subprocess.run([sys.executable, '-I', t], capture_output=True, text=True, stdin=subprocess.DEVNULL, timeout=30).stdout.split('\n')[:-1]
        print('réel :', r, '=>', 'OK' if r == out else 'KO'); sys.exit(r != out)


main()
