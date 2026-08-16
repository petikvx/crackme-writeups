; timotei-crackme-01 — reconstruction FASM
; C'est le dialecte le plus proche de l'original : ELF64 "executable"
; d'un seul fichier, symbole FILE = timo#1_final.asm, pas de libc, pas de
; crt. Reconstruction depuis le binaire (listing + table des symboles),
; pas un dump du .asm auteur.
;
; Compiler (produit directement un ELF, pas d'étape ld) :
;   fasm timotei-crackme-01-fasm.asm timotei-crackme-01-fasm.bin
;
; Installer fasm si besoin :
;   sudo apt install fasm
;   # ou https://flatassembler.net/  (fasm + fasm.x64)
;
; Lancer (deux writes, sinon read(10) avale PIN + réponse) :
;   python3 -c "
;   import subprocess,time
;   p=subprocess.Popen(['./timotei-crackme-01-fasm.bin'],stdin=subprocess.PIPE)
;   p.stdin.write(b'777\n'); p.stdin.flush(); time.sleep(0.05)
;   p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close(); p.wait()
;   "

format ELF64 executable 3
entry _start

; FASM 1.73 tasse le ELF (code juste après le header, ~0x4000B0).
; L'original 2020 est paginé 4K (EP 0x401000, data 0x402000). Même code.
segment readable executable

_start:
        mov     eax, 1                  ; sys_write
        mov     edi, 1                  ; stdout
        mov     esi, message
        mov     edx, 24h                ; 36 octets, le 10 final n'est pas écrit
        syscall

        mov     eax, 0                  ; sys_read
        mov     edi, 0                  ; stdin
        mov     esi, buffer
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer - 1], 10
        je      _garbage_end
        mov     edi, 0
        mov     rsi, dummy              ; movabs rsi, imm64
        mov     edx, 1
_garbage:
        mov     eax, 0
        syscall
        cmp     byte [dummy], 10
        je      _garbage_end
        jmp     _garbage

_garbage_end:
        mov     edi, buffer
        sub     ecx, ecx
        sub     al, al
        not     ecx
        cld
        repnz   scasb
        not     ecx
        dec     ecx
        mov     eax, ecx
        cmp     eax, 3
        jle     _out                    ; label original : out (mot réservé FASM)
        dec     eax
        xor     ebx, ebx
        mov     edx, 539h               ; 1337
        mov     ecx, buffer
        mov     esi, ecx
__:
        mov     bl, [ecx + 1]
        add     edx, ebx
        inc     ecx
        dec     eax
        jnz     __
        add     edx, edx
        mov     eax, edx
        xor     edx, edx
        mov     ecx, 11h
        div     ecx
        add     dl, 30h
        mov     al, [esi]
        sub     dl, al
        test    dl, dl
        jz      go_on
        jmp     _out

go_on:
        mov     eax, 1
        mov     edi, 1
        mov     esi, message2
        mov     edx, 21h
        syscall

        mov     eax, 0
        mov     edi, 0
        mov     esi, buffer2
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer2 - 1], 10
        je      _garbage_end2
        mov     edi, 0
        mov     rsi, dummy
        mov     edx, 1
_garbage2:
        mov     eax, 0
        syscall
        cmp     byte [dummy], 10
        je      _garbage_end2
        jmp     _garbage2

_garbage_end2:
        mov     esi, message2_help      ; hint, jamais affiché
        mov     esi, buffer2
        mov     ecx, 4
        mov     eax, 811C9DC5h          ; FNV-1 offset basis
        mov     edi, 1000193h           ; FNV-1 prime
        xor     ebx, ebx
nextbyte:
        mul     edi
        mov     bl, [esi]
        xor     eax, ebx
        inc     esi
        dec     ecx
        jnz     nextbyte
        cmp     eax, 86CFDCF8h
        jnz     _out
        mov     esi, good
        jmp     goodway

goodway:
        mov     eax, 1
        mov     edi, 1
        mov     edx, 2Fh
        syscall

_out:
        mov     eax, 3Ch                ; sys_exit
        xor     rdi, rdi
        syscall

segment readable writable

Credit          db '._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!', 0
message         db '.:knock,knock...your pin please...: ', 10
message2        db '.:Where did +Fravia taught us? : ', 10
message2_help   db 'No need to patch or bruteforce, explore the web...', 0, 10
good            db ".:Good, that's all for history lesson today:-)", 10
buffer          db 100 dup 0
buffer2         db 100 dup 0
dummy           db 0
