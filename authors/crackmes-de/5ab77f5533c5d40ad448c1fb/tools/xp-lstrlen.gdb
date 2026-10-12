# Modélise l'effet de bord de lstrlenA (Windows XP) : edx = ptr+1 en sortie.
# wine laisse edx quelconque -> la copie RtlMoveMemory part d'une adresse poubelle.
set pagination off
handle SIGUSR1 SIGUSR2 SIG34 SIG35 SIGSEGV nostop noprint pass
break *0x401212
commands
silent
set $edx = 0x403568 + $ebx + 1
printf "[xp] part2 ptr=%08x\n", $edx-1
continue
end
break *0x4012ab
commands
silent
set $edx = 0x403568 + $edi + 1
printf "[xp] part3 ptr=%08x\n", $edx-1
continue
end
break *0x401303
commands
silent
printf "[chk] compteur 0x4034f8 = %d (3 = OK)\n", *(unsigned char*)0x4034f8
continue
end
continue
