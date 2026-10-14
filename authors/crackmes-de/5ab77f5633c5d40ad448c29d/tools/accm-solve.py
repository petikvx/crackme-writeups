#!/usr/bin/env python3
"""Keygen A_C_Crack_me! (Acid_Crack, crackmes.de a_c_c_m).

Form_Load (0x4022d0) : d = Day(Date)  (rtcGetDateVar #610 -> rtcGetDayOfMonth #542)
  A = d^2 * 2 ; B = A*3000/1500 = 2A ; C = (A+B)*2 = 6A ; D = C^2
  key = "31512" & D & "41610" & A & "24209" & C & "303711" & B
Command1_Click (0x4025e0) : __vbaStrCmp(key, Text1.Text) == 0 -> « K.O.!!U WIN ».
La clé dépend uniquement du jour du mois au moment où le formulaire est chargé.
usage : accm-solve.py [JOUR]   (défaut : jour courant)
"""
import sys, datetime

def key(day: int) -> str:
    a = day ** 2 * 2
    b = a * 3000 // 1500
    c = (a + b) * 2
    d = c ** 2
    return f"31512{d}41610{a}24209{c}303711{b}"

if __name__ == "__main__":
    day = int(sys.argv[1]) if len(sys.argv) > 1 else datetime.date.today().day
    print(key(day))
