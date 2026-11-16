#!/usr/bin/env python3
"""BadEngineer's PlsCrackMe (NormalCrackme.exe) — générateur de mots de passe.

Prédicat (Checker @ 0x140001490) : exactement 3 chiffres, 3 spéciaux
(ponctuation ASCII imprimable), 3 majuscules, 4 minuscules (13 caractères).
Pas de nom d'utilisateur : le mot de passe ne dépend de rien.

  pls-crack-me-solve.py            # mot de passe fixe
  pls-crack-me-solve.py -q         # idem, sans bannière
  pls-crack-me-solve.py --random   # un autre mot de passe valide
  pls-crack-me-solve.py --check P  # teste P avec le prédicat Python
  pls-crack-me-solve.py --wine EXE # preuve live via wine
"""
import argparse, random, string, subprocess, sys

FIXED = "Pe7!Tk9@Ik#2x"
SPECIAL = string.punctuation


def classify(pw):
    d = s = u = l = 0
    for c in pw:
        o = ord(c)
        if 0x30 <= o <= 0x39: d += 1
        elif 0x21 <= o <= 0x2f or 0x3a <= o <= 0x40 or 0x5b <= o <= 0x60 or 0x7b <= o <= 0x7e: s += 1
        elif 0x41 <= o <= 0x5a: u += 1
        elif 0x61 <= o <= 0x7a: l += 1
    return d, s, u, l


def valid(pw):
    return classify(pw) == (3, 3, 3, 4)


def gen(rnd):
    cs = [rnd.choice(string.digits) for _ in range(3)] + [rnd.choice(SPECIAL) for _ in range(3)] \
        + [rnd.choice(string.ascii_uppercase) for _ in range(3)] + [rnd.choice(string.ascii_lowercase) for _ in range(4)]
    rnd.shuffle(cs)
    return "".join(cs)


def wine(exe, pw):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=pw + "\n", capture_output=True, text=True, timeout=60)
    return "Cracked it" in r.stdout, r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--random", action="store_true")
    ap.add_argument("--check", metavar="PW")
    ap.add_argument("--wine", metavar="EXE")
    a = ap.parse_args()
    if a.check is not None:
        print("OK" if valid(a.check) else "KO"); return
    pw = gen(random.Random()) if a.random else FIXED
    if a.wine:
        ok, out = wine(a.wine, pw)
        print(out); sys.exit(0 if ok else 1)
    print(pw if a.q else f"password = {pw}")


if __name__ == "__main__":
    main()
