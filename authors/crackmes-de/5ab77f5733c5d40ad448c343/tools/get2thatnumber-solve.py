#!/usr/bin/env python3
"""Keygen Get2ThatNumber (obnoxious, crackmes.de) : name -> key.

Usage: get2thatnumber-solve.py [--name petik] [-q] [--check KEY]
"""
import argparse


def function_one(name: str) -> int:
    """Delimiteur lt in {5,6,8} (port fidèle de function_one)."""
    n = sum(name.encode("ascii")) & 0xF
    if n == 7:
        return 6
    if n == 9:
        return 8
    if n >= 10:
        n -= 5
        if n == 10:
            return 8
        if n == 7:
            n = 6
        if n == 9:
            n = 8
        return n
    if n < 5:
        n += 5
        if n == 7:
            n = 6
        if n == 9:
            n = 8
    return n


def function_two(lt: int) -> int:
    return {5: 8, 6: 13}.get(lt, 34)


def paths(start: int, lt: int):
    """Suites croissantes (pas 1 ou 2) de start jusqu'à lt."""
    if start == lt:
        yield str(lt)
        return
    for step in (1, 2):
        if start + step <= lt:
            for rest in paths(start + step, lt):
                yield str(start) + rest


def keygen(name: str) -> str:
    lt = function_one(name)
    segs = sorted(set(p for s in (1, 2) for p in paths(s, lt)))
    assert len(segs) == function_two(lt)
    return "".join(segs)


def check(name: str, key: str) -> bool:
    """Réimplémentation de chk() (pour --check)."""
    if not name:
        return False
    lt = str(function_one(name))
    num = function_two(int(lt))
    segs, cur = [], ""
    for c in key:
        cur += c
        if c == lt:
            segs.append(cur)
            cur = ""
    if len(segs) < num:
        return False
    segs = segs[:num]
    if len(set(segs)) != num:
        return False
    for s in segs:
        if s[0] not in "12":
            return False
        if any(int(s[k + 1]) - int(s[k]) not in (1, 2) for k in range(len(s) - 1)):
            return False
    return True


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="KEY")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.name, a.check)
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    k = keygen(a.name)
    if a.q:
        print(k)
    else:
        lt = function_one(a.name)
        print(f"name={a.name} delimiteur={lt} segments={function_two(lt)}\nkey={k}")
