#!/usr/bin/env python3
"""crackme_2.0_by_c0de0f (crackmes.one 5ab77f5533c5d40ad448c1ff) — serial dépendant de la date

Form_Load : Temp.Text = Format(Now,"dd") * Format(Now,"mm") * 1440 + Format(Now,"yyyy")
Check     : si Text1.Text = Temp.Text -> Register.Enabled = True ; Register -> MsgBox "win"
Usage : c0de0f-crackme-2-solve.py [AAAA-MM-JJ]   (défaut : aujourd'hui, heure locale)
"""
import sys
from datetime import date

def serial(d: date) -> str:
    return str(d.day * d.month * 1440 + d.year)

if __name__ == "__main__":
    d = date.fromisoformat(sys.argv[1]) if len(sys.argv) > 1 else date.today()
    print(serial(d))
