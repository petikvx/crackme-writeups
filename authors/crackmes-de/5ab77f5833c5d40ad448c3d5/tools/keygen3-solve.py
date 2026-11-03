#!/usr/bin/env python3
"""Keygen3 by Bikers80 (VB.NET) - keygen name + heure + COMPUTERNAME -> 2 serials.

Usage: keygen3-solve.py [--name petik] [--computer NAME] [--time HH:MM] [--fmt 12|24] [-q]
Les serials ne sont valides que pendant la minute HH:MM (l'heure est dans le calcul).
"""
import argparse, datetime, os, re

def hexs(s):  # Conversion.Hex(Asc(c)) concaténé, puis retrait de A-F
    return re.sub('[A-F]', '', ''.join('%X' % ord(c) for c in s))

def val(s):   # Val() -> Double -> Math.Round -> Long
    return int(round(float(s))) if s else 0

def time_digits(hh, mm, fmt):
    # Mid(TimeOfDay.ToString,1,5) puis retrait de ':'
    # en-US : "5:07:00 PM" -> "5:07:" -> "507" ; 24h : "17:07:00" -> "17:07" -> "1707"
    h = hh if fmt == '24' else (hh % 12 or 12)
    return (('%02d:%02d' % (h, mm)) if fmt == '24' else ('%d:%02d:' % (h, mm)))[:5].replace(':', '')

def keygen(name, computer, hh, mm, fmt='12'):
    t = time_digits(hh, mm, fmt)
    v10 = val(hexs(name[:6]))
    s1 = str(v10 * int(t))[:11]
    v15 = val(hexs(computer or 'computeur'))
    s2 = str(v15 + v10 + int(t))[::-1]
    return s1, s2

if __name__ == '__main__':
    a = argparse.ArgumentParser()
    a.add_argument('--name', default='petik')
    a.add_argument('--computer', default=os.environ.get('COMPUTERNAME', ''))
    a.add_argument('--time', default=datetime.datetime.now().strftime('%H:%M'))
    a.add_argument('--fmt', default='12', choices=['12', '24'])
    a.add_argument('-q', action='store_true')
    o = a.parse_args()
    hh, mm = map(int, o.time.split(':'))
    s1, s2 = keygen(o.name, o.computer, hh, mm, o.fmt)
    print(f'{s1}\n{s2}' if o.q else f'name={o.name} computer={o.computer or "(vide->computeur)"} time={o.time}\nSerial1={s1}\nSerial2={s2}')
