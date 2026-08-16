#!/usr/bin/env python3
"""Solveur timotei-crackme-08 — Crackme History Quiz.

7 questions console. Q1–Q6 : le 1er caractère de chaque réponse
(ASCII '1'/'2'/'3') est additionné dans BL. Q7 : atoi(réponse).

  bl = sum(ord(ans[i][0]) for i in 0..5)   # wrap 8 bits
  ebx = bl
  ebx -= atoi(ans7)
  bl -= 1
  succès ssi bl == 0  ⇔  (sum & 0xFF) - atoi(ans7) == 1

Réponses historiquement cohérentes + prédicat :
  2, 2, 1, 3, 1, 2, 42
  sum ASCII = 43, 43 - 42 - 1 == 0.

Usage :
  python3 timotei-crackme-08-solve.py
  wineconsole timotei-crackme-08.exe   # entrer les 7 réponses
"""

from __future__ import annotations

import shutil
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
BINARY = HERE / "timotei-crackme-08.exe"

# (numéro, libellé court, choix gagnant, texte du choix)
QUESTIONS = [
    (1, "Premier site de crackmes", "2", "crackmes.cjb.net"),
    (2, "tKC signifie", "2", "The Keyboard Caper"),
    (3, "Smartcheck", "1", "VB Debugging"),
    (4, "Premiers tutos cracking", "3", "+ORC"),
    (5, "Désassembleur célèbre", "1", "Sourcer"),
    (6, "Crackmes servaient aussi à", "2", "joining a cracking group"),
    (7, "Answer to everything", "42", "42"),
]

WINNING = [q[2] for q in QUESTIONS]


def bl_sum(mc_answers: list[str]) -> int:
    """Somme 8 bits des 1ers caractères des 6 QCM (comme add bl, [buffer])."""
    s = 0
    for a in mc_answers[:6]:
        if not a:
            raise ValueError("réponse vide")
        s = (s + ord(a[0])) & 0xFF
    return s


def quiz_ok(answers: list[str]) -> bool:
    """Prédicat exact du binaire (sub ebx,atoi / sub bl,1 / jne)."""
    if len(answers) < 7:
        return False
    ebx = bl_sum(answers)
    try:
        n = int(answers[6].strip())
    except ValueError:
        return False
    ebx = (ebx - n) & 0xFFFFFFFF
    bl = (ebx & 0xFF) - 1
    return (bl & 0xFF) == 0


def main() -> None:
    print("=== timotei-crackme-08-solve.py ===")
    print("Quiz 7 questions — pas de keyfile, ReadConsole × 7\n")

    for num, title, ans, label in QUESTIONS:
        print(f"  Q{num}. {title}")
        print(f"      → {ans}  ({label})")

    print()
    print("séquence :", " ".join(WINNING))

    # Trace du prédicat (add bl × 6, sub ebx/atoi, sub bl,1)
    print("\n--- prédicat ---")
    print("  asm : xor ebx,ebx")
    print("        ×6  ReadConsole + add bl, Buffer[0]   # ASCII, wrap 8 bits")
    print("        Q7  n = atoi(ligne) ; sub ebx,n ; sub bl,1 ; jnz fail")
    print("  formule : (sum(ord(Qi[0])) - n) ≡ 1  (mod 256)")
    print("  avec n=42 → sum ≡ 43 (mod 256)")
    print()
    bl = 0
    print("  trace bl (séquence gagnante) :")
    for i, a in enumerate(WINNING[:6], 1):
        before = bl
        bl = (bl + ord(a[0])) & 0xFF
        print(
            f"    Q{i} '{a[0]}' = {ord(a[0]):3d}  "
            f"bl {before:3d} + {ord(a[0]):3d} → {bl:3d} (0x{bl:02x})"
        )
    n = int(WINNING[6])
    after_sub = (bl - n) & 0xFFFFFFFF
    after_dec = (after_sub & 0xFF) - 1
    print(f"    Q7 atoi={n}  sub ebx → {(after_sub & 0xFF)} ; sub bl,1 → {after_dec & 0xFF}")
    print(f"  bl sum    : {bl_sum(WINNING)} (0x{bl_sum(WINNING):02x})")
    print(f"  quiz_ok   : {quiz_ok(WINNING)}")
    print()
    print("  famille math (Q7=42) : n2 + 2*n3 = 5  avec n1+n2+n3=6")
    print("    ex. n2=3,n3=1 → 2 2 1 3 1 2  (historique)")
    print("        n2=5,n3=0 → cinq '2' + un '1'")
    print("        n2=1,n3=2 → un '2' + deux '3' + trois '1'")

    print("\ncontre-exemples :")
    bad = WINNING.copy()
    bad[0] = "1"  # sum becomes 42
    print(f"  Q1=1 (reste ok, Q7=42) → {quiz_ok(bad)}  # sum=42 ; 42-42-1 → 0xFF")
    bad2 = WINNING.copy()
    bad2[6] = "41"
    print(f"  Q7=41 (MC ok)         → {quiz_ok(bad2)}  # 43-41-1 = 1 ≠ 0")

    print("\n=== live ===")
    print("ReadConsoleA = vraie console Windows.")
    print(f"  cd {HERE}")
    print("  wineconsole timotei-crackme-08.exe")
    print("  # coller une réponse par ligne :")
    for a in WINNING:
        print(f"  {a}")

    wine = shutil.which("wineconsole") or shutil.which("wine")
    if wine and BINARY.is_file():
        payload = "\r\n".join(WINNING) + "\r\n"
        print(f"\nessai pipe via {wine} (souvent incomplet)…")
        try:
            cmd = [wine, str(BINARY.name)]
            if "wineconsole" in wine:
                cmd = [wine, "--backend=curses", str(BINARY.name)]
            r = subprocess.run(
                cmd,
                cwd=HERE,
                input=payload.encode(),
                capture_output=True,
                timeout=8,
            )
            print("stdout:", r.stdout)
            if r.stderr:
                print("stderr:", r.stderr[:400])
        except subprocess.TimeoutExpired as e:
            print("TIMEOUT — sortie:", e.stdout)


if __name__ == "__main__":
    main()
