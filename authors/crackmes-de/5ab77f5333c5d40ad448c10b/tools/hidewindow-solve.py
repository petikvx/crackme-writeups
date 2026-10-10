#!/usr/bin/env python3
"""hidewindow (devoney) — solveur / simulateur du WindowProcedure.

Deux conditions au clic sur le bouton (id 0x8801) :
  * GetDlgItemInt(edit 0x8802) == 0x15b8 (5560)
  * atoi(buf) == 0x34ea090 (55484560), où buf (0x406040) reçoit, à CHAQUE
    EN_CHANGE de l'edit, le DERNIER caractère du texte courant (lstrcatA).
Le piège : il faut donc que l'historique des frappes produise 55484560
tout en laissant 5560 dans la case. Un seul essai faux => ExitProcess.
"""

def simulate(states):
    """states = texte de l'edit après chaque EN_CHANGE."""
    buf = ""
    for t in states:
        if t:
            buf += t[-1]
    final = states[-1]
    ok_int = final.isdigit() and int(final) == 0x15b8
    import re
    m = re.match(r"[+-]?\d+", buf)
    ok_buf = bool(m) and int(m.group()) == 0x34ea090
    return buf, ok_int and ok_buf

# Séquence clavier : taper 5,5,4 ; sélectionner le dernier chiffre et le
# remplacer par 8, puis 4, puis 5 ; remplacer encore par 6 ; taper 0.
STATES = ["5", "55", "554", "558", "554", "555", "556", "5560"]

if __name__ == "__main__":
    buf, ok = simulate(STATES)
    print("états edit :", " -> ".join(STATES))
    print("buffer     :", buf)
    print("final      :", STATES[-1], "=> OK" if ok else "=> KO")
    assert ok
