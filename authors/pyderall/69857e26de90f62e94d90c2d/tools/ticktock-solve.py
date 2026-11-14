#!/usr/bin/env python3
"""Keygen pour pyderall's TickTock (serial XXXX-XXXX-XXXX dépendant de l'heure).

Le serial est valide si, pour une minute m dans {t-1, t, t+1} (t = minute du jour
locale), A,B,C dérivés == serial ET (A^B)%97 == m%97.  Seulement ~3/97 des minutes
admettent un serial : le solveur peut donc attendre / chercher la prochaine fenêtre.

  ticktock-solve.py              # serial pour maintenant (ou prochaine fenêtre)
  ticktock-solve.py -q           # serial seul, attend la fenêtre si besoin
  ticktock-solve.py --at 2026-11-14T12:30
  ticktock-solve.py --check SERIAL [--at ...]
"""
import argparse, datetime as dt, sys, time

M = 0xFFFFFFFF
rotl = lambda x, r: ((x << r) | (x >> (32 - r))) & M

def fnv1a(data):
    h = 2166136261
    for b in data:
        h = ((h ^ b) * 16777619) & M
    return h

def parts(minute, yday):
    x = (minute ^ (yday << 16) ^ 0xC0FFEE11) & M
    x = (rotl(x, 7) + 0x9E3779B9) & M
    h = fnv1a(x.to_bytes(4, "little"))
    tok = rotl(h ^ 0xA5A5A5A5, 11)
    A = (tok ^ 0xBEEF) & 0xFFFF
    B = ((tok >> 16) + minute * 7) & 0xFFFF
    C = (A + B + yday * 13) & 0xFFFF
    return A, B, C

D = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
def b36(v):
    s = ""
    for _ in range(4):
        s = D[v % 36] + s
        v //= 36
    return s

def fmt(a, b, c):
    return f"{b36(a)}-{b36(b)}-{b36(c)}"

def candidates(now):
    """Serials valides à l'instant `now` (liste de (delta, serial))."""
    t = now.hour * 60 + now.minute
    yday = now.timetuple().tm_yday
    out = []
    for d in (-1, 0, 1):
        m = t + d
        m += 1440 if m < 0 else (-1440 if m >= 1440 else 0)
        A, B, C = parts(m, yday)
        if (A ^ B) % 97 == m % 97:
            out.append((d, fmt(A, B, C)))
    return out

def next_window(now):
    n = now.replace(second=0, microsecond=0)
    for i in range(0, 60 * 24 * 2):
        c = n + dt.timedelta(minutes=i)
        if candidates(c):
            return c
    return None

def parse(s):
    if len(s) != 14 or s[4] != "-" or s[9] != "-":
        return None
    try:
        v = [int(s[i:i + 4], 36) for i in (0, 5, 10)]
    except ValueError:
        return None
    return v if all(x <= 0xFFFF for x in v) else None

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--at")
    ap.add_argument("--check")
    a = ap.parse_args()
    now = dt.datetime.fromisoformat(a.at) if a.at else dt.datetime.now()
    if a.check:
        p = parse(a.check.upper())
        ok = p is not None and any(parse(s) == p for _, s in candidates(now))
        print("won" if ok else "loose")
        return 0 if ok else 1
    c = candidates(now)
    if not c:
        w = next_window(now)
        if a.q and not a.at:
            time.sleep(max(0, (w - dt.datetime.now()).total_seconds()) + 1)
            c = candidates(dt.datetime.now())
        else:
            print(f"Pas de serial valide à {now:%H:%M} ; prochaine fenêtre : {w:%Y-%m-%d %H:%M}", file=sys.stderr)
            c = candidates(w)
            now = w
    for d, s in c:
        print(s if a.q else f"{now:%Y-%m-%d %H:%M} (minute {d:+d}) -> {s}")
    return 0 if c else 1

if __name__ == "__main__":
    sys.exit(main())
