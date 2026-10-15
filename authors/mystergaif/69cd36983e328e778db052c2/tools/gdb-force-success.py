"""U Can't Pass -- preuve live : force le chemin "Success!" autrement inatteignable.

main() fixe var_8 (DWORD [rbp-8]) a 10 puis fait DEUX fois `cmp var_8, 10` :
  - 1er test (je) : si egal -> saute DIRECTEMENT par-dessus le printf("Success!") ;
  - 2e test (jne) : si egal -> tombe dans printf("Error!").
var_8 == 10 est fixe par le programme lui-meme, sans aucune lecture d'entree
(ni scanf, ni argv) : la branche "Success!" est du code mort tant qu'on ne
modifie pas var_8 depuis l'exterieur -- d'ou le titre "U Can't Pass".

Ce script casse ce tautologie *en memoire, au runtime*, sans toucher au
fichier sous original/ (interdit par AGENTS.md) : on arrete le process juste
avant le premier `cmp`, on met var_8 a autre chose que 10, puis on laisse
continuer.

Usage :
    gdb -q -batch -ex "source tools/gdb-force-success.py" ./original/main.out
"""
import gdb

gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("break *main+0x28")   # cmp DWORD PTR [rbp-0x8], 0xa (1er test, PIE-safe via main+offset)
gdb.execute("run", to_string=False)

val = int(gdb.parse_and_eval("*(int*)($rbp-8)"))
print("PROOF var_8_before = %d" % val)

gdb.execute("set variable *(int*)($rbp-8) = 0")
val2 = int(gdb.parse_and_eval("*(int*)($rbp-8)"))
print("PROOF var_8_after = %d" % val2)

gdb.execute("continue")
