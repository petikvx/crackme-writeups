#!/usr/bin/env python3
"""crackme_delphi_2.0 (defc0n1, crackmes.de) — username + mot de passe calculé.

TForm2.Edit2Change @ 0x48CB04 (à chaque frappe dans Edit2) :
    a=5 ; c=10 ; b=a*c ; k = a*b*25 + 0x45 + 0x1F4 - 0x177A          -> 809
TForm2.Button1Click @ 0x48C984 (Submit) :
    k -= 9                                                            -> 800
    Edit1.Text == "Kevin"  sinon « Incorrect username »
    Edit2.Text == "kevin" + IntToStr(k)  sinon « Incorrect password »   -> kevin800
    OK -> Form3 « Hello Kevin, here are the Top Secret files in our systems »

  ./defc0n1-delphi2-solve.py                     # explications
  ./defc0n1-delphi2-solve.py -q                  # « Kevin kevin800 »
  ./defc0n1-delphi2-solve.py --check Kevin kevin800
  ./defc0n1-delphi2-solve.py --clicks 2          # mot de passe au 2e Submit sans retaper Edit2
"""
import argparse

USER, PREFIX = "Kevin", "kevin"          # littéraux UnicodeString @ 0x48CA78 / 0x48CA90

def edit2change() -> int:
    a, c = 5, 10                          # [Self+0x394], [Self+0x39C]
    b = a * c                             # [Self+0x398]
    k = a * b                             # imul edx,ecx
    k = k * 5 * 5                         # lea edx,[edx+edx*4] x2
    k = k + 0x45 + 0x1F4                  # add 0x45 ; add 0x1F4
    return (k - 0x177A) & 0xFFFFFFFF      # sub [Self+0x3A0],0x177A

def password(clicks: int = 1) -> str:
    k = edit2change() - 9 * clicks        # sub [Self+0x3A0],9 à chaque Submit
    return PREFIX + str(k)

def check(user: str, pw: str, clicks: int = 1) -> str:
    if user != USER:
        return "Incorrect username"
    return "OK: Hello Kevin, here are the Top Secret files in our systems" if pw == password(clicks) else "Incorrect password"

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("USER", "PASS")); ap.add_argument("--clicks", type=int, default=1)
    a = ap.parse_args()
    if a.check:
        r = check(*a.check, clicks=a.clicks); print(r); raise SystemExit(0 if r.startswith("OK") else 1)
    if a.q:
        print(USER, password(a.clicks)); return
    print(f"Edit2Change -> k = {edit2change()}  ;  Submit n°{a.clicks} -> k = {edit2change() - 9 * a.clicks}")
    print(f"username : {USER}\npassword : {password(a.clicks)}")

if __name__ == "__main__":
    main()
