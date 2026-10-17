#!/usr/bin/env python3
"""ghost256 — baby (game, ELF 32 bits) : le vrai code de succès est MORT, jamais appelé.

main @0x8049674 : boucle getchar -> move_player(w/a/s/d, 'l', 'p') -> print_map ; si (row,col) == (29,89) :
                  puts("You win!") et exit(0). AUCUN chemin ne lit flag.txt.
win() @0x804975d : fopen("flag.txt","r") ; fgets ; printf(buf) -- affiche le contenu du fichier.
                   Vérification (nm / xref) : win() n'a AUCUN appelant dans le binaire entier.
Le programme attend un fichier "flag.txt" dans le répertoire courant (il ne contient pas de vrai flag :
l'auteur laisse l'utilisateur en créer un pour l'exercice).
Astuce : le label 'p' appelle solve_round(), qui déplace @ tout seul jusqu'à la case de fin -- ça donne
"You win!" mais ne révèle toujours pas le fichier.
Usage : baby-solve.py [--flag-content TEXTE] [--check]
"""
import argparse, subprocess, sys, tempfile
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "game"
ap = argparse.ArgumentParser()
ap.add_argument("--flag-content", default="FLAG{exemple_local}")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
print("win() @0x804975d n'est appelée par personne (vérifié par xref) : il faut la déclencher soi-même, par exemple sous gdb :")
print("  gdb -q ./original/game")
print("  (gdb) break main ; run < /dev/null")
print("  (gdb) call (int)win()")
print("  (gdb) call (int)fflush(0)")
if a.check:
    with tempfile.TemporaryDirectory() as t:
        (Path(t) / "flag.txt").write_text(a.flag_content + "\n")
        out = subprocess.run(["gdb", "-q", "-batch", "-ex", "set debuginfod enabled off", "-ex", "break main",
                              "-ex", "run < /dev/null", "-ex", "call (int)win()", "-ex", "call (int)fflush(0)", str(EXE)],
                             cwd=t, capture_output=True, text=True).stdout
    ok = a.flag_content in out
    print("gdb call win() ->", "OK, contenu affiché" if ok else "KO", "| flag.txt créé pour le test :", a.flag_content)
    sys.exit(0 if ok else 1)
