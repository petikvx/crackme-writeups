#!/usr/bin/env python3
"""feo_crackme_12 (ShoulcK) : Datos = nom du file mapping = 11 premiers car. du titre ; Serial = reverse(Nombre)."""
import sys
nombre = sys.argv[1] if len(sys.argv) > 1 else "petikpetik"
if len(nombre) < 9:
    sys.exit("Nombre >= 9 caracteres (le serial doit faire >= 9)")
title = "Crackme 12 by ShoulcK"
print(f"Nombre : {nombre}")
print(f"Datos  : {title[:11]!r}   (GetWindowTextA(hDlg, buf, 12) -> 11 car., espace final compris)")
print(f"Serial : {nombre[::-1]}")
print("Cliquer 'Guardar registro', laisser ouvert, lancer une 2e instance -> 'Buen cracker, Felicidades'")
