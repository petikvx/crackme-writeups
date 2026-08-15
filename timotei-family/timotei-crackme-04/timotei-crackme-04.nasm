; timotei-crackme-04 — reconstruction NASM (pas le .asm auteur, perdu)
; ELF64 statique strippé. EP leurre (push out / ret). Vrai start @ 0x401007.
; FNV-1 32 bits sur argv[1], 4 octets, cible 0x6FCD79A2 → +ORC.
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-04.nasm.o timotei-crackme-04.nasm
;   ld -nostdlib -static -no-pie -o timotei-crackme-04.nasm.bin \
;      timotei-crackme-04.nasm.o
;
; Lancer (l'EP d'origine sort tout de suite ; patcher e_entry → 0x401007) :
;   python3 timotei-crackme-04-solve.py

BITS 64
DEFAULT ABS

global _start

section .text
_start:
        nop
        push    out                     ; 68 69 10 40 00
        ret                             ; toujours exit si on part de 0x401000

real_start:
        cmp     byte [rsp], 2           ; argc == 2
        jne     out

        mov     rdi, [rsp + 0x10]       ; argv[1]
        sub     ecx, ecx
        sub     al, al
        not     ecx
        cld
        repnz   scasb
        not     ecx
        dec     ecx                     ; ecx = strlen
        sub     ecx, 4
        jne     out                     ; != 4 → exit

        mov     rsi, [rsp + 0x10]
        mov     ecx, 4
        mov     eax, 0x811C9DC5         ; FNV-1 offset basis
        mov     edi, 0x01000193         ; FNV-1 prime
        xor     ebx, ebx
nextbyte:
        mul     edi
        mov     bl, [rsi]
        xor     eax, ebx
        inc     rsi
        dec     ecx
        jnz     nextbyte
        cmp     eax, 0x6FCD79A2
        jne     out

        mov     eax, 1
        mov     edi, 1
        mov     rsi, strict qword good
        mov     edx, 0x0E
        syscall

out:
        mov     eax, 60
        xor     rdi, rdi
        syscall

section .data
Credit:         db '._:timotei crackme#4:_:.', 0
good:           db '_.:solved:._', 10, 0
riddle:         db "'Gold, with six bars, or with the visor raised (in full face) for royalty, Silver, with five bars, (in full face) for a duke or marquis, Silver, with four bars, with visor raised (in profile) for an earl, viscount or baron, Steel, without bars, and with visor open (in full face) for a knight or a baronet, Steel, with visor closed (in profile) for a squire or a gentleman.'hint: He is a legend so far for the cue, tell me to whom does this question leads to? To prove your thoughts to be dead right, Fowler,Noll and Vo stays on your side."
                ; pas de 0 final : .data original fait pile 0x242 octets
