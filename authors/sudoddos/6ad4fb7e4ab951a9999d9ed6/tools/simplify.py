#!/usr/bin/env python3
"""Simplificateur statique (rien n'est execute) du crackme.py de sudoddos.

Passes : repli de constantes (chr/len/ord/str/int/arithmetique), resolution des alias top-level
(`X = getattr`, `Y = __import__`, table de dispatch a cles entieres...), getattr(x,'nom') -> x.nom,
puis renommage des identifiants X/x en noms courts. Sortie : source Python lisible.
usage: simplify.py original/crackme.py analysis/deob1.py
"""
import ast, sys, keyword, builtins as B

sys.setrecursionlimit(100000)
try: sys.stdout.reconfigure(encoding='utf-8'); sys.stderr.reconfigure(encoding='utf-8')
except Exception: pass
PURE = {'chr': chr, 'len': len, 'ord': ord, 'str': str, 'int': int, 'abs': abs, 'bytes': bytes, 'hex': hex, 'bool': bool, 'tuple': tuple}
BUILT = set(dir(B))


def is_const(n): return isinstance(n, ast.Constant)


class Folder(ast.NodeTransformer):
    def __init__(self):
        self.alias = {}      # nom -> noeud AST de remplacement (Name/Attribute/Constant/...)
        self.table = {}      # nom -> {cle: noeud}
        self.assign_count = {}

    # ---- utilitaires
    def const(self, n):
        return n.value if is_const(n) else None

    def visit_Name(self, n):
        if isinstance(n.ctx, ast.Load) and n.id in self.alias:
            import copy
            return copy.deepcopy(self.alias[n.id])
        return n

    def visit_BinOp(self, n):
        self.generic_visit(n)
        # x ^ c ^ c -> x ; x | 0, x ^ 0, x + 0 -> x
        if isinstance(n.op, ast.BitXor) and is_const(n.right) and isinstance(n.left, ast.BinOp) and isinstance(n.left.op, ast.BitXor) and is_const(n.left.right) and n.left.right.value == n.right.value:
            return n.left.left
        if isinstance(n.op, (ast.BitXor, ast.BitOr, ast.Add)) and is_const(n.right) and n.right.value == 0 and not is_const(n.left):
            return n.left
        if is_const(n.left) and is_const(n.right):
            a, b = n.left.value, n.right.value
            try:
                ops = {ast.Add: lambda: a + b, ast.Sub: lambda: a - b, ast.Mult: lambda: a * b, ast.FloorDiv: lambda: a // b, ast.Mod: lambda: a % b,
                       ast.BitXor: lambda: a ^ b, ast.BitAnd: lambda: a & b, ast.BitOr: lambda: a | b, ast.LShift: lambda: a << b, ast.RShift: lambda: a >> b}
                f = ops.get(type(n.op))
                if f:
                    r = f()
                    if not (isinstance(r, (str, bytes)) and len(r) > 4096):
                        return ast.copy_location(ast.Constant(r), n)
            except Exception:
                pass
        return n

    def visit_UnaryOp(self, n):
        self.generic_visit(n)
        if is_const(n.operand) and isinstance(n.operand.value, int):
            v = n.operand.value
            if isinstance(n.op, ast.USub): return ast.copy_location(ast.Constant(-v), n)
            if isinstance(n.op, ast.Invert): return ast.copy_location(ast.Constant(~v), n)
        return n

    def visit_Compare(self, n):
        self.generic_visit(n)
        if len(n.ops) == 1 and is_const(n.left) and is_const(n.comparators[0]):
            a, b = n.left.value, n.comparators[0].value
            m = {ast.Eq: lambda: a == b, ast.NotEq: lambda: a != b, ast.Lt: lambda: a < b, ast.Gt: lambda: a > b, ast.LtE: lambda: a <= b, ast.GtE: lambda: a >= b}.get(type(n.ops[0]))
            if m:
                try: return ast.copy_location(ast.Constant(m()), n)
                except Exception: pass
        return n

    def visit_If(self, n):
        self.generic_visit(n)
        if is_const(n.test):
            body = n.body if n.test.value else n.orelse
            return body if body else ast.Pass()
        return n

    def visit_For(self, n):
        self.generic_visit(n)
        it = n.iter
        if isinstance(it, ast.Call) and getattr(it.func, 'id', None) == 'range' and len(it.args) == 1 and is_const(it.args[0]) and it.args[0].value == 0:
            return ast.Pass()
        return n

    def visit_Call(self, n):
        self.generic_visit(n)
        f = n.func
        if isinstance(f, ast.Name) and f.id == 'len' and len(n.args) == 1 and isinstance(n.args[0], (ast.Tuple, ast.List)) and not n.args[0].elts:
            return ast.copy_location(ast.Constant(0), n)
        if isinstance(f, ast.Name) and f.id in PURE and all(is_const(a) for a in n.args) and not n.keywords:
            try:
                return ast.copy_location(ast.Constant(PURE[f.id](*[a.value for a in n.args])), n)
            except Exception:
                return n
        if isinstance(f, ast.Name) and f.id == 'getattr' and len(n.args) == 2 and is_const(n.args[1]) and isinstance(n.args[1].value, str) and n.args[1].value.isidentifier() and not keyword.iskeyword(n.args[1].value):
            return ast.copy_location(ast.Attribute(n.args[0], n.args[1].value, ast.Load()), n)
        return n

    def visit_Subscript(self, n):
        self.generic_visit(n)
        if isinstance(n.value, ast.Name) and n.value.id in self.table and is_const(n.slice):
            t = self.table[n.value.id]
            if n.slice.value in t:
                import copy
                return copy.deepcopy(t[n.slice.value])
        if is_const(n.value) and is_const(n.slice):
            try: return ast.copy_location(ast.Constant(n.value.value[n.slice.value]), n)
            except Exception: pass
        return n

    def visit_Attribute(self, n):
        self.generic_visit(n)
        v = n.value
        if isinstance(v, ast.Call) and isinstance(v.func, ast.Name) and v.func.id == '__import__' and len(v.args) == 1 and is_const(v.args[0]) and v.args[0].value == 'builtins':
            return ast.copy_location(ast.Name(n.attr, ast.Load()), n)      # __import__('builtins').X -> X
        return n

    def visit_Assign(self, n):
        self.generic_visit(n)
        return n


def top_level_aliases(tree, fo):
    """Pre-calcule les alias simples du haut du fichier (affectations uniques)."""
    cnt = {}
    for node in ast.walk(tree):
        if isinstance(node, ast.Name) and isinstance(node.ctx, ast.Store):
            cnt[node.id] = cnt.get(node.id, 0) + 1
    for st in tree.body:
        if isinstance(st, ast.Assign) and len(st.targets) == 1 and isinstance(st.targets[0], ast.Name) and cnt.get(st.targets[0].id) == 1:
            nm = st.targets[0].id
            v = fo.visit(st.value)
            if isinstance(v, ast.Dict) and all(is_const(k) for k in v.keys if k is not None):
                fo.table[nm] = {k.value: x for k, x in zip(v.keys, v.values)}
            elif is_const(v) and not (isinstance(v.value, (str, bytes)) and len(v.value) > 200):
                fo.alias[nm] = v
            elif isinstance(v, (ast.Name, ast.Attribute)):
                fo.alias[nm] = v
            elif isinstance(v, ast.Call) and isinstance(v.func, ast.Name) and v.func.id == '__import__' and all(is_const(a) for a in v.args):
                fo.alias[nm] = v
        # imports symboliques : X = __import__('zlib') deja gere ci-dessus


def pure(n):
    if isinstance(n, ast.Constant): return True
    if isinstance(n, (ast.Name,)): return True
    if isinstance(n, ast.BinOp): return pure(n.left) and pure(n.right)
    if isinstance(n, ast.UnaryOp): return pure(n.operand)
    if isinstance(n, (ast.Tuple, ast.List)): return all(pure(e) for e in n.elts)
    if isinstance(n, ast.Call) and isinstance(n.func, ast.Name) and n.func.id in ('len', 'id', 'chr', 'ord', 'str', 'int') and not n.keywords: return all(pure(a) for a in n.args)
    if isinstance(n, ast.Call) and isinstance(n.func, ast.Attribute) and n.func.attr == 'id' and isinstance(n.func.value, ast.Call) and getattr(n.func.value.func, 'id', None) == '__import__': return True
    return False


def dead_stores(tree):
    """Supprime les affectations pures a des noms jamais lus, les try/except vides, les expressions constantes (iteree)."""
    for _ in range(4):
        loaded = {n.id for n in ast.walk(tree) if isinstance(n, ast.Name) and isinstance(n.ctx, ast.Load)}
        declared = {a for n in ast.walk(tree) if isinstance(n, (ast.Global, ast.Nonlocal)) for a in n.names}

        class D(ast.NodeTransformer):
            def visit_Assign(self, n):
                if len(n.targets) == 1 and isinstance(n.targets[0], ast.Name) and n.targets[0].id not in loaded and n.targets[0].id not in declared and pure(n.value):
                    return None
                return n

            def visit_AugAssign(self, n):
                if isinstance(n.target, ast.Name) and n.target.id not in loaded and n.target.id not in declared and pure(n.value): return None
                return n

            def visit_Expr(self, n):
                return None if isinstance(n.value, ast.Constant) else n

            def visit_Try(self, n):
                self.generic_visit(n)
                if not n.body or all(isinstance(s, ast.Pass) for s in n.body):
                    return n.finalbody or None
                return n

            def generic_visit(self, node):
                r = super().generic_visit(node)
                for fld in ('body', 'orelse', 'finalbody'):
                    if hasattr(node, fld) and isinstance(getattr(node, fld), list):
                        flat = []
                        for s in getattr(node, fld):
                            if isinstance(s, list): flat += s
                            else: flat.append(s)
                        if not flat and fld == 'body' and isinstance(node, (ast.FunctionDef, ast.If, ast.While, ast.For, ast.ClassDef, ast.ExceptHandler)): flat = [ast.Pass()]
                        setattr(node, fld, flat)
                return r
        tree = D().visit(tree)
        ast.fix_missing_locations(tree)
    return tree


def rename(tree):
    mp = {}; cnt = {'v': 0, 'f': 0, 'c': 0, 'a': 0}

    def nm(old, kind):
        if old in BUILT or old in ('self', 'cls', '__name__', '__main__') or (old.startswith('__') and old.endswith('__')):
            return old
        if old not in mp:
            cnt[kind] += 1; mp[old] = '%s%d' % (kind, cnt[kind])
        return mp[old]
    obf = lambda s: len(s) > 6 and set(s) <= set('Xx_')

    class R(ast.NodeTransformer):
        def visit_Name(self, n):
            if obf(n.id): n.id = nm(n.id, 'v')
            return n

        def visit_arg(self, n):
            if obf(n.arg): n.arg = nm(n.arg, 'a')
            return n

        def visit_FunctionDef(self, n):
            if obf(n.name): n.name = nm(n.name, 'f')
            self.generic_visit(n); return n

        def visit_ClassDef(self, n):
            if obf(n.name): n.name = nm(n.name, 'c')
            self.generic_visit(n); return n

        def visit_Attribute(self, n):
            self.generic_visit(n)
            if obf(n.attr): n.attr = nm(n.attr, 'v')
            return n
    return R().visit(tree), mp


def main():
    src = open(sys.argv[1], 'rb').read().decode('utf-8', 'replace')
    tree = ast.parse(src)
    fo = Folder()
    for rnd in range(3):
        top_level_aliases(tree, fo)
        tree = fo.visit(tree)
        ast.fix_missing_locations(tree)
        print('passe', rnd + 1, 'alias:', len(fo.alias), 'tables:', len(fo.table), file=sys.stderr)
    # retire les affectations d'alias devenues inutiles
    keep = []
    for st in tree.body:
        if isinstance(st, ast.Assign) and len(st.targets) == 1 and isinstance(st.targets[0], ast.Name) and (st.targets[0].id in fo.alias):
            continue
        keep.append(st)
    tree.body = keep
    tree = dead_stores(tree)
    tree, mp = rename(tree)
    out = ast.unparse(tree)
    open(sys.argv[2], 'w', encoding='utf-8').write(out)
    print('ecrit', sys.argv[2], len(out), 'octets,', len(out.splitlines()), 'lignes ; identifiants renommes:', len(mp), file=sys.stderr)


if __name__ == '__main__':
    main()
