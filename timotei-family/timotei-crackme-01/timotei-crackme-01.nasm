; timotei-crackme-01 — reconstruction NASM (pas le .asm auteur, perdu)
; Source d'origine très probablement FASM (ELF "executable" d'un seul fichier,
; symbole FILE = timo#1_final.asm). Cette version NASM reproduit le même
; comportement et les mêmes labels. Les encodings 32 bits (eax/esi/ecx +
; préfixe 67h, movabs rsi, sub au lieu de xor) suivent le listing du binaire.
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-01.nasm.o timotei-crackme-01.nasm
;   ld -nostdlib -static -no-pie -o timotei-crackme-01.nasm.bin \
;      timotei-crackme-01.nasm.o
;
; Lancer (deux writes, sinon read(10) avale PIN + réponse) :
;   python3 -c "
;   import subprocess,time
;   p=subprocess.Popen(['./timotei-crackme-01.nasm.bin'],stdin=subprocess.PIPE)
;   p.stdin.write(b'777\n'); p.stdin.flush(); time.sleep(0.05)
;   p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close(); p.wait()
;   "

BITS 64
DEFAULT ABS                     ; adresses absolues, comme le binaire d'origine
                                ; (pas de RIP-relative / PIE)

global _start

section .text
_start:
        mov     eax, 1                  ; sys_write
        mov     edi, 1                  ; stdout
        mov     esi, message
        mov     edx, 0x24               ; 36 octets, le '\n' final n'est pas écrit
        syscall

        mov     eax, 0                  ; sys_read
        mov     edi, 0                  ; stdin
        mov     esi, buffer
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer - 1], 10
        je      _garbage_end
        mov     edi, 0
        mov     rsi, dummy              ; movabs rsi, imm64 (comme l'original)
        mov     edx, 1
_garbage:
        mov     eax, 0
        syscall                         ; read 1 octet
        cmp     byte [dummy], 10
        je      _garbage_end
        jmp     _garbage

_garbage_end:
        mov     edi, buffer
        sub     ecx, ecx                ; pas xor : encodage 29 C9
        sub     al, al                  ; pas xor : encodage 28 C0
        not     ecx
        cld
        repnz   scasb                   ; strlen jusqu'au 0
        not     ecx
        dec     ecx                     ; ecx = strlen
        mov     eax, ecx
        cmp     eax, 3
        jle     out
        dec     eax                     ; nb d'itérations = strlen-1
        xor     ebx, ebx
        mov     edx, 0x539              ; 1337
        mov     ecx, buffer
        mov     esi, ecx                ; esi = &buffer[0] (1er char)
__:
        mov     bl, [ecx + 1]           ; préfixe 67h (adresse 32 bits)
        add     edx, ebx
        inc     ecx
        dec     eax
        jnz     __
        add     edx, edx                ; * 2
        mov     eax, edx
        xor     edx, edx
        mov     ecx, 17
        div     ecx                     ; edx = reste
        add     dl, 0x30                ; reste + '0'
        mov     al, [esi]
        sub     dl, al
        test    dl, dl
        jz      go_on
        jmp     out

go_on:
        mov     eax, 1
        mov     edi, 1
        mov     esi, message2
        mov     edx, 0x21               ; 33 octets, sans le '\n'
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
        mov     esi, message2_help      ; hint, dead store (Hex-Rays l'efface)
        mov     esi, buffer2
        mov     ecx, 4
        mov     eax, 0x811C9DC5         ; FNV-1 offset basis
        mov     edi, 0x01000193         ; FNV-1 prime
        xor     ebx, ebx
nextbyte:
        mul     edi                     ; eax = eax * prime
        mov     bl, [esi]
        xor     eax, ebx
        inc     esi
        dec     ecx
        jnz     nextbyte
        cmp     eax, 0x86CFDCF8
        jnz     out
        mov     esi, good
        jmp     goodway                 ; eb 00 dans l'original

goodway:
        mov     eax, 1
        mov     edi, 1
        mov     edx, 0x2F               ; 47 octets, newline compris
        syscall

out:
        mov     eax, 60                 ; sys_exit
        xor     rdi, rdi
        syscall

section .data
Credit:         db '._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!', 0
message:        db '.:knock,knock...your pin please...: ', 10
message2:       db '.:Where did +Fravia taught us? : ', 10
message2_help:  db 'No need to patch or bruteforce, explore the web...', 0, 10
good:           db ".:Good, that's all for history lesson today:-)", 10
buffer:         times 100 db 0
buffer2:        times 100 db 0
dummy:          db 0
