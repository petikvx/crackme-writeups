set pagination off
set breakpoint pending on
break __libc_start_main
run
# PIE sans ASLR : base = 0x555555554000
# 1) breakpoint juste avant la boucle de scramble (0x2373) : on force la cle et l'entree
break *0x555555556373
# 2) breakpoint apres la boucle de scramble (0x23cf) : on dumpe la string scramblee
break *0x5555555563cf
continue
# on est a 0x2373 : rdi (arg) a ete sauvegarde en [rbp-0x58]
set $s = *(long*)($rbp-0x58)
set $p = (char*)malloc(64)
call (void)strcpy($p, "CMO{I_l0v3_fUnCt1OnS}\n")
set *(long*)$s = (long)$p
set *(long*)($s+8) = 22
set *(int*)($rbp-0x48) = 0x4c
continue
printf "scrambled: "
x/22xb *(long*)($rbp-0x30)
kill
quit
