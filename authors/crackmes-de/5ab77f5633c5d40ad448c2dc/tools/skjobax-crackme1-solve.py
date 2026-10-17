#!/usr/bin/env python3
"""crackme_1.0 by skjobax (CrackMe2.0.exe, VB.NET) — keygen.

Le check (Form1.encrypt) fait, en late binding VB (variables Object) :
    obj = 0
    For i = 0 To 10000
        If i Mod 100 = 0 Then obj = obj + 1 Else obj = obj * 9 + Len(nom)
    Next
    serial attendu = (obj + Len(nom)).ToString()

Les opérateurs Object de Microsoft.VisualBasic élargissent le type au lieu de
lever OverflowException : Integer -> Long -> Decimal -> Double. En Double,
obj*9 dépasse 1.8e308 vers i ~ 330 et devient +Infinity ; Infinity + n reste
Infinity. Le serial vaut donc Double.PositiveInfinity.ToString() pour tout nom
non vide : « Infinity » sous .NET Framework en culture anglaise/invariante
(le symbole dépend de la culture courante : NumberFormatInfo.PositiveInfinitySymbol).

  ./skjobax-crackme1-solve.py petik        # -> Infinity
  ./skjobax-crackme1-solve.py --trace petik # types successifs de obj
"""
import argparse, math
from decimal import Decimal, getcontext

getcontext().prec = 40
I32, I64 = 2**31, 2**63
DEC_MAX = Decimal(2**96 - 1)  # System.Decimal.MaxValue

def norm(v, kind):
    """Imite l'élargissement des Operators.*Object VB (Int32→Int64→Decimal→Double)."""
    if kind == "i32" and -I32 <= v < I32: return v, "i32"
    if kind in ("i32", "i64") and -I64 <= v < I64: return v, "i64"
    if kind in ("i32", "i64", "dec"):
        if abs(Decimal(v)) <= DEC_MAX: return Decimal(v), "dec"
        return float(v), "dbl"
    return v, "dbl"

def op(a, kind, f):
    if kind == "dbl":
        try: return f(a), "dbl"
        except OverflowError: return math.inf, "dbl"
    return norm(f(a), kind)

def keygen(name, trace=False, inf_symbol="Infinity"):
    if not name:
        raise ValueError("nom vide -> « You're kidding me. »")
    n = len(name); obj, kind = 0, "i32"; prev = kind
    for i in range(10001):
        if i % 100 == 0: obj, kind = op(obj, kind, lambda x: x + 1)
        else:
            obj, kind = op(obj, kind, lambda x: x * 9)
            obj, kind = op(obj, kind, lambda x: x + n)
        if trace and kind != prev:
            print(f"  i={i:5d} -> {kind}"); prev = kind
        if kind == "dbl" and math.isinf(obj) and trace:
            print(f"  i={i:5d} -> +Infinity"); trace = False
    obj, kind = op(obj, kind, lambda x: x + n)
    if kind == "dbl" and math.isinf(obj): return inf_symbol
    return str(obj)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--trace", action="store_true")
    a = ap.parse_args()
    print(keygen(a.name, a.trace))
