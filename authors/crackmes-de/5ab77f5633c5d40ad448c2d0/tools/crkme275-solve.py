#!/usr/bin/env python3
"""CrackMe #2 By BuLLeT - [TOL'98] (crackme v2.75) -- mot de passe.

Binaire Visual Basic 5 *compile en code natif* (pas du p-code -- .text ne
fait que 0x1294 octets de stub/bootstrap VB, mais la routine de verification
elle-meme EST du x86 reel a partir de 0x401d24, reperable via le jmp a
0x401840).

Deux chaines "leurre" sont chargees en Variant au debut de la routine :
  firstblob  (69 car.) = "l2rK4sdg6lk7n8Rg2ovcns6a7kSlk09ush4dg3312dklfv"
                          + sep(0xE6) + "kjg" + sep + "h4356" + sep + "lkasdffc1tg5"
  secondblob (64 car.) = "DFGKHJ45TDLKDSFVLK234RT09IWCFPOMGBH698UGSEOIVN-5NVEWTO845VKJLLKN"

Elles RESSEMBLENT a des mots de passe a tester (et `strcmp`/`strings` les
affiche comme candidates evidentes) -- ce sont en fait de FAUSSES pistes : le
code extrait ensuite 6 sous-chaines (Mid$) a des positions precises dans ces
deux blobs et les CONCATENE pour obtenir le vrai mot de passe. Tenter de
reconstituer l'ordre exact (start/longueur, Mid$ vs la convention d'appel VB5
sur la pile) a la main depuis le desassemblage s'est revele ambigu malgre
plusieurs hypotheses testees (toutes rejetees par le binaire) ; la valeur
ci-dessous a ete lue **directement en memoire sous GDB**, juste avant l'appel
a `__vbaVarTstEq` (la comparaison), sur le Variant BSTR qui contient le texte
de reference construit par le programme -- donc garantie exacte, pas une
reconstruction manuelle. Voir `tools/gdb-live-password.py` et le README.

Usage : crkme275-solve.py [-q]
"""
import argparse

PASSWORD = "2rK4HJ4-7n8RgT09IW6a7kSlg33"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    print(PASSWORD if a.q else f"mot de passe = {PASSWORD!r}")


if __name__ == "__main__":
    main()
