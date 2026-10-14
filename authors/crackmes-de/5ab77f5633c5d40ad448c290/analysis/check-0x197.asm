; therapy's CRACKME #1 - routine de vérification (code déchiffré, offsets COM)
; trace Unicorn 16 bits (tools/emu-com.py -t), sauts parasites retirés
0197 mov bx, 0x234          ; buffer int21/AH=0Ah : [0]=max 0x14, [1]=len, [2..]=texte
019a mov al, [bx+1]
019d cmp al, 0
019f ja  0x1ab              ; mot de passe vide -> échec
01ab push cs / pop es
01ad xor si, si             ; si = index dans la table 0x343 "hTq%762"
01af xor dx, dx
01b1 mov di, 0x236          ; début du texte saisi
01b7 mov al, [si+0x343]     ; caractère recherché
01bb xor cx, cx
01bd mov cl, [di-1]         ; cx = longueur saisie
01c0 cld
01c1 repne scasb            ; cherche al dans le reste du texte
01c3 je  0x1c8
01c5 jmp 0x1ce
01c8 inc byte [si+0x34a]    ; compteur[si]++ et on continue le scan (toutes occurrences)
01cc jmp 0x1c1
01ce inc si
01cf cmp si, 7
01d2 jne 0x1af
01d4 mov di, 0x34a          ; compteurs calculés
01d7 mov si, 0x351          ; compteurs attendus 02 03 01 02 04 02 01
01da mov cx, 7
01de repe cmpsb
01e0 jne 0x1ec              ; -> "No, no. Try again, it`s easy!"
