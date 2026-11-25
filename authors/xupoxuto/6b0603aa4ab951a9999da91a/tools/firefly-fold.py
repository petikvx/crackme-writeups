#!/usr/bin/env python3
"""Déplie le stage 1 de l'obfuscateur « FireFly » : plie les constantes par AST.

Usage: firefly-fold.py <stage2.bin> <stage2-folded.py>

`stage2.bin` s'obtient du script d'origine par
  base64.b85decode(<le gros bytes literal de la ligne 41>) puis gzip.decompress.
"""
import ast, sys
SAFE = {'bytes':bytes,'bytearray':bytearray,'chr':chr,'ord':ord,'str':str,'int':int,'len':len,
        'list':list,'tuple':tuple,'range':range,'abs':abs,'pow':pow,'sum':sum,'min':min,'max':max,
        'True':True,'False':False,'None':None}
ENV = {'__builtins__': SAFE}

def is_pure(node):
    for n in ast.walk(node):
        if isinstance(n, ast.Name):
            if n.id not in SAFE: return False
        if isinstance(n, (ast.Await, ast.Yield, ast.YieldFrom, ast.NamedExpr)): return False
        if isinstance(n, ast.Attribute):
            if n.attr not in ('decode','encode','join','hex','fromhex','format','to_bytes','from_bytes','lower','upper'):
                return False
    return True

class Folder(ast.NodeTransformer):
    def generic_visit(self, node):
        node = super().generic_visit(node)
        if isinstance(node, ast.expr) and not isinstance(node, (ast.Constant, ast.Name, ast.Attribute, ast.Lambda)):
            if is_pure(node):
                try:
                    v = eval(compile(ast.Expression(ast.fix_missing_locations(ast.copy_location(node, node))), '<f>', 'eval'), dict(ENV))
                except Exception:
                    return node
                if isinstance(v, (int, float, str, bytes, bool, type(None))) and (not isinstance(v,(str,bytes)) or len(v) < 4000):
                    return ast.copy_location(ast.Constant(value=v), node)
                if isinstance(v, tuple) and len(v) < 200:
                    try:
                        return ast.copy_location(ast.Tuple(elts=[ast.Constant(value=x) for x in v], ctx=ast.Load()), node)
                    except Exception: return node
        return node

src = open(sys.argv[1], encoding='utf-8', errors='replace').read()
tree = ast.parse(src)
for _ in range(4):
    tree = ast.fix_missing_locations(Folder().visit(tree))
out = ast.unparse(tree)
open(sys.argv[2],'w').write(out)
print("wrote", len(out))
