#!/usr/bin/env python3
"""Pele les couches de l'emballage du crackme de sudoddos, sans rien executer du crackme.

Pour chaque couche :
  1. simplify  : repli de constantes / alias / renommage (tools/simplify.py)
  2. ordre     : mini-interpreteur arithmetique qui rejoue la boucle de dispatch et note les indices passes a exec()
  3. fusion    : couche + chaines d'etapes dans l'ordre -> simplify -> layer.py (fonctions pures en liste blanche)
usage: peel.py <layer0.py> <workdir> [max_layers]      (layer0 = original/crackme.py)
"""
import ast, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.setrecursionlimit(100000)
try: sys.stdout.reconfigure(encoding='utf-8', errors='replace'); sys.stderr.reconfigure(encoding='utf-8', errors='replace')
except Exception: pass


class Skip(Exception): pass


class Lam:
    def __init__(self, node, env): self.node, self.env = node, env


class Interp:
    def __init__(self, tree):
        self.funcs = {}; self.env = {}; self.exec_log = []; self.steps = 0
        self.tree = tree

    # ---------- expressions
    def ev(self, n, env):
        self.steps += 1
        if self.steps > 5_000_000: raise Skip('trop long')
        t = type(n)
        if t is ast.Constant: return n.value
        if t is ast.Name:
            if n.id in env: return env[n.id]
            if n.id in self.env: return self.env[n.id]
            import builtins as _b
            if hasattr(_b, n.id): return ('builtin', n.id)
            raise Skip('nom ' + n.id)
        if t is ast.BinOp:
            a, b = self.ev(n.left, env), self.ev(n.right, env)
            op = type(n.op)
            try:
                return {ast.Add: lambda: a + b, ast.Sub: lambda: a - b, ast.Mult: lambda: a * b, ast.FloorDiv: lambda: a // b, ast.Mod: lambda: a % b,
                        ast.BitXor: lambda: a ^ b, ast.BitAnd: lambda: a & b, ast.BitOr: lambda: a | b, ast.LShift: lambda: a << b, ast.RShift: lambda: a >> b}[op]()
            except Exception: raise Skip('binop')
        if t is ast.UnaryOp:
            a = self.ev(n.operand, env)
            return {ast.USub: lambda: -a, ast.Invert: lambda: ~a, ast.Not: lambda: not a, ast.UAdd: lambda: a}[type(n.op)]()
        if t is ast.BoolOp:
            vals = [self.ev(v, env) for v in n.values]
            return all(vals) if isinstance(n.op, ast.And) else any(vals)
        if t is ast.Compare:
            left = self.ev(n.left, env)
            for op, c in zip(n.ops, n.comparators):
                r = self.ev(c, env)
                ok = {ast.Eq: left == r, ast.NotEq: left != r, ast.Lt: left < r, ast.Gt: left > r, ast.LtE: left <= r, ast.GtE: left >= r}.get(type(op))
                if ok is None: raise Skip('cmp')
                if not ok: return False
                left = r
            return True
        if t is ast.IfExp: return self.ev(n.body, env) if self.ev(n.test, env) else self.ev(n.orelse, env)
        if t is ast.Subscript:
            v = self.ev(n.value, env)
            if isinstance(n.slice, ast.Slice):
                lo = self.ev(n.slice.lower, env) if n.slice.lower else None; hi = self.ev(n.slice.upper, env) if n.slice.upper else None
                st = self.ev(n.slice.step, env) if n.slice.step else None
                return v[lo:hi:st]
            return v[self.ev(n.slice, env)]
        if t is ast.List: return [self.ev(e, env) for e in n.elts]
        if t is ast.Tuple: return tuple(self.ev(e, env) for e in n.elts)
        if t is ast.Dict: return {self.ev(k, env): self.ev(v, env) for k, v in zip(n.keys, n.values)}
        if t is ast.Lambda: return Lam(n, env)
        if t is ast.Call: return self.call(n, env)
        raise Skip(t.__name__)

    def call(self, n, env):
        f = n.func
        if isinstance(f, ast.Name):
            nm = f.id
            if nm == 'len': return len(self.ev(n.args[0], env))
            if nm == 'globals': return {}
            if nm == 'exec':
                a = n.args[0]
                if isinstance(a, ast.Subscript) and not isinstance(a.slice, ast.Slice): self.exec_log.append(self.ev(a.slice, env))
                else: raise Skip('exec arg')
                return None
            if nm in self.funcs: return self.call_user(self.funcs[nm], [self.ev(a, env) for a in n.args])
            if nm in env and isinstance(env[nm], Lam): return self.call_lam(env[nm], [])
            raise Skip('appel ' + nm)
        if isinstance(f, ast.Attribute) and f.attr == 'append':
            self.ev(f.value, env).append(self.ev(n.args[0], env)); return None
        if isinstance(f, ast.Attribute) and f.attr == 'get':
            d = self.ev(f.value, env); k = self.ev(n.args[0], env); dflt = self.ev(n.args[1], env) if len(n.args) > 1 else None
            return d.get(k, dflt)
        v = self.ev(f, env)
        if isinstance(v, Lam): return self.call_lam(v, [self.ev(a, env) for a in n.args])
        raise Skip('appel non resolu')

    def call_lam(self, lam, args):
        e = dict(lam.env)
        for a, v in zip(lam.node.args.args, args): e[a.arg] = v
        return self.ev(lam.node.body, e)

    def call_user(self, fn, args):
        e = {}
        for a, v in zip(fn.args.args, args): e[a.arg] = v
        try: self.run(fn.body, e, in_func=True)
        except Return as r: return r.value
        return None

    # ---------- statements
    def run(self, stmts, env, in_func=False):
        for st in stmts:
            self.steps += 1
            if self.steps > 5_000_000: raise Skip('trop long')
            t = type(st)
            if t is ast.Assign:
                v = self.ev(st.value, env)
                for tg in st.targets:
                    if isinstance(tg, ast.Name): env[tg.id] = v
                    elif isinstance(tg, ast.Subscript): self.ev(tg.value, env)[self.ev(tg.slice, env)] = v
                    else: raise Skip('target')
            elif t is ast.AugAssign:
                cur = self.ev(ast.Name(id=st.target.id, ctx=ast.Load()), env)
                e2 = ast.BinOp(left=ast.Constant(cur), op=st.op, right=st.value)
                env[st.target.id] = self.ev(e2, env)
            elif t is ast.While:
                while self.ev(st.test, env): self.run(st.body, env, in_func)
            elif t is ast.If:
                self.run(st.body if self.ev(st.test, env) else st.orelse, env, in_func)
            elif t is ast.For:
                it = st.iter
                if isinstance(it, ast.Call) and getattr(it.func, 'id', '') == 'range':
                    for i in range(*[self.ev(a, env) for a in it.args]):
                        env[st.target.id] = i; self.run(st.body, env, in_func)
                else: raise Skip('for')
            elif t is ast.Return:
                raise Return(self.ev(st.value, env) if st.value else None)
            elif t is ast.Expr:
                self.ev(st.value, env)
            elif t in (ast.Pass, ast.FunctionDef, ast.ClassDef, ast.Import, ast.ImportFrom, ast.Try, ast.Raise, ast.Delete, ast.Global):
                pass
            else:
                raise Skip(t.__name__)


class Return(Exception):
    def __init__(self, v): self.value = v


def compute_order(tree):
    it = Interp(tree)
    for st in tree.body:
        if isinstance(st, ast.FunctionDef): it.funcs[st.name] = st
    # execute chaque instruction de haut niveau evaluable (les autres sont ignorees)
    for st in tree.body:
        if isinstance(st, (ast.Assign, ast.AugAssign, ast.While)):
            before = len(it.exec_log)
            try: it.run([st], it.env)
            except (Skip, KeyError, IndexError, TypeError, ZeroDivisionError, Return):
                del it.exec_log[before:]
                continue
    return it.exec_log


def find_stage_strings(tree):
    best = None
    for st in tree.body:
        if isinstance(st, ast.Assign) and isinstance(st.value, ast.List) and st.value.elts and all(isinstance(e, ast.Constant) and isinstance(e.value, str) for e in st.value.elts):
            if best is None or len(st.value.elts) > len(best): best = [e.value for e in st.value.elts]
    return best


def sh(args):
    r = subprocess.run([sys.executable, '-I'] + args, capture_output=True, text=True, encoding='utf-8', errors='replace')
    return r.stdout + r.stderr


def run_layer_py(merged, out):
    r = subprocess.run([sys.executable, '-I', os.path.join(HERE, 'layer.py'), merged, out], capture_output=True, text=True, encoding='utf-8', errors='replace')
    txt = r.stdout + r.stderr
    return '\n'.join(l[:300] for l in txt.splitlines()[-8:])


def main():
    cur = sys.argv[1]; work = sys.argv[2]; maxl = int(sys.argv[3]) if len(sys.argv) > 3 else 10
    os.makedirs(work, exist_ok=True)
    for L in range(1, maxl + 1):
        print('=== couche %d : %s (%d octets)' % (L, cur, os.path.getsize(cur)))
        simpl = os.path.join(work, 'L%d_simpl.py' % L)
        print(sh([os.path.join(HERE, 'simplify.py'), cur, simpl]).strip().splitlines()[-1])
        tree = ast.parse(open(simpl, encoding='utf-8').read())
        strings = find_stage_strings(tree)
        order = compute_order(tree)
        print('chaines d\'etapes:', None if strings is None else [len(s) for s in strings], '| ordre d\'execution:', order)
        parts = [open(cur, 'rb').read().decode('utf-8', 'replace')]
        if strings:
            for idx in order:
                if 0 <= idx < len(strings): parts.append('\n# ===== etape %d =====\n' % idx + strings[idx])
        merged_raw = os.path.join(work, 'L%d_merged.py' % L); open(merged_raw, 'w', encoding='utf-8').write('\n'.join(parts))
        merged = os.path.join(work, 'L%d_merged_simpl.py' % L)
        sh([os.path.join(HERE, 'simplify.py'), merged_raw, merged])
        nxt = os.path.join(work, 'L%d_next.py' % (L + 1))
        out = run_layer_py(merged, nxt)
        print(out.strip())
        if 'OK :' not in out:
            print('arret : impossible de deballer la couche suivante'); break
        cur = nxt


if __name__ == '__main__':
    main()

