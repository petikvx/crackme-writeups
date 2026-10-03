#!/usr/bin/env python3
"""jeffli6789 « Date of Birth » : trouve la date de naissance (mm/dd/YYYY)
qui fait afficher le message déchiffré (au lieu de « You are too young »).

Le binaire fait : diff = time(NULL) - mktime(dob) ; tm = localtime(diff)
puis Y = tm_year-70, M = tm_mon, D = tm_mday et exige (via un débordement
int8) Y == 127, M == 11, D in {30,31}. La clé XOR vaut Y^M^D ; D=31 -> 107
-> « Unfortunately this app has absolutely no functionality ».
Donc : il faut un delta qui tombe le 31/12/2097 (heure locale).

Usage : date-of-birth-solve.py [-q] [--check] [--now EPOCH]
"""
import argparse, calendar, datetime, os, subprocess, sys, time

BIN = os.path.join(os.path.dirname(__file__), "..", "original", "date_of_birth")
# 2097-12-31 12:00 UTC en epoch : point de depart de la recherche
APPROX = calendar.timegm((2097, 12, 31, 12, 0, 0))


def hit(now, y, m, d):
    # meme calcul que le binaire : strptime -> tm zero (isdst=0) -> mktime
    dob = time.mktime((y, m, d, 0, 0, 0, 0, 0, 0))
    t = time.localtime(int(now - dob))
    # Y = tm_year-70 == 127, M = tm_mon == 11 (0-based), D = tm_mday == 31
    return t.tm_year == 2097 and t.tm_mon == 12 and t.tm_mday == 31


def solve(now):
    c = datetime.datetime.fromtimestamp(now - APPROX).date()
    out = []
    for k in range(-5, 6):
        d = c + datetime.timedelta(days=k)
        if hit(now, d.year, d.month, d.day):
            out.append(d.strftime("%m/%d/%Y"))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="sortie = date seule")
    ap.add_argument("--check", action="store_true", help="lance le binaire")
    ap.add_argument("--now", type=int, default=int(time.time()))
    a = ap.parse_args()
    sols = solve(a.now)
    if not sols:
        sys.exit("aucune date trouvee")
    if a.q:
        print(sols[0])
    else:
        print("DOB candidates :", ", ".join(sols))
    if a.check:
        r = subprocess.run([BIN], input=sols[0] + "\n", text=True, capture_output=True)
        print(r.stdout)
        sys.exit(0 if "Unfortunately" in r.stdout else 1)


if __name__ == "__main__":
    main()
