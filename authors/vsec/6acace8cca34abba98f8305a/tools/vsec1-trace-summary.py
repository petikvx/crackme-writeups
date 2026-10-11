#!/usr/bin/env python3
"""Résume une trace vsec1-trace.py : une ligne par opération (binop / cmp)."""
import re
import sys

OPS = {0: "+", 1: "-", 2: "*", 3: "/", 4: "%", 5: "^", 6: "&", 7: "|"}
CMP = {0: "==", 1: "!=", 2: "<", 3: "<=", 4: ">", 5: ">="}


def first(v):
    m = re.match(r"<int(?:64|\?) (-?\d+) \(0x[0-9a-f]+\)>", v)
    if m:
        return int(m.group(1))
    m = re.match(r"<T1405df0d0 \[([0-9a-f]+) ", v)
    if m:
        return int(m.group(1), 16) & 0xFF
    m = re.match(r"<string '(.*)'>", v)
    if m:
        return repr(m.group(1))
    return v


def main(path):
    lines = open(path, encoding="utf8", errors="replace").read().splitlines()
    i = 0
    out = []
    while i < len(lines):
        l = lines[i]
        m = re.match(r"#(\d+) binop eax=(\w+) A=(<.*?>) B=(<.*?>)$", l)
        if m:
            op = int(m.group(2), 16)
            r = lines[i + 1] if i + 1 < len(lines) else ""
            mr = re.search(r"= (<.*>)$", r)
            out.append("%s: %s %s %s = %s" % (m.group(1), first(m.group(3)), OPS.get(op, "op%d" % op),
                                            first(m.group(4)), first(mr.group(1)) if mr else "?"))
        else:
            m = re.match(r"#(\d+) cmp eax=(\w+) .*A=(<.*?>) B=(<.*?>) C=", l)
            if m:
                op = int(m.group(2), 16)
                r = lines[i + 1] if i + 1 < len(lines) else ""
                res = "false" if "= nil" in r else "TRUE"
                out.append("%s: cmp %s %s %s -> %s" % (m.group(1), first(m.group(3)), CMP.get(op, "c%d" % op),
                                                      first(m.group(4)), res))
        i += 1
    print("\n".join(out))


if __name__ == "__main__":
    main(sys.argv[1])
