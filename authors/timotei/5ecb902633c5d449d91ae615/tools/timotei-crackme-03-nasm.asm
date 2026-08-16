; timotei-crackme-03 — reconstruction NASM (pas le .asm auteur, perdu)
; ELF64 statique strippé, mix int 0x80 (i386) + syscall (x64).
; Reconstruction depuis objdump / .data.
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-03-nasm.o timotei-crackme-03-nasm.asm
;   ld -nostdlib -static -no-pie -o timotei-crackme-03-nasm.bin \
;      timotei-crackme-03-nasm.o
;
; Lancer :
;   printf 'Defeat COVID!\n' | ./timotei-crackme-03-nasm.bin

BITS 64
DEFAULT ABS

global _start

section .text
_start:
        mov     eax, 4                  ; sys_write i386
        mov     ebx, 1
        mov     ecx, cls
        mov     edx, 4
        int     0x80

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, cur1
        mov     edx, 7
        int     0x80

        mov     eax, 1                  ; sys_write x64
        mov     edi, 1
        mov     rsi, strict qword stars
        mov     edx, 0x29
        syscall

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, cur4
        mov     edx, 7
        int     0x80

        mov     eax, 1
        mov     edi, 1
        mov     rsi, strict qword stars
        mov     edx, 0x29
        syscall

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, blink
        mov     edx, 0x0A
        int     0x80

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, cur2
        mov     edx, 7
        int     0x80

        mov     eax, 1
        mov     edi, 1
        mov     rsi, strict qword warn
        mov     edx, 0x29
        syscall

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, reset
        mov     edx, 9
        int     0x80

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, cur3
        mov     edx, 7
        int     0x80

        mov     eax, 1
        mov     edi, 1
        mov     rsi, strict qword prompt
        mov     edx, 0x14
        syscall

        mov     eax, 0                  ; sys_read x64
        mov     edi, 0
        mov     esi, buffer
        mov     edx, 0x64
        syscall

        xor     ebx, ebx
        mov     ecx, buffer
        mov     dl, [ecx + 0x0C]        ; préfixe 67h
        sub     dl, 0x30
check:
        mov     bl, [ecx]               ; préfixe 67h
        cmp     bl, 0x0A
        je      compare
        add     [ecx], dl               ; préfixe 67h
        inc     ecx
        jmp     check

compare:
        mov     esi, buffer
        mov     edi, secret
        mov     ecx, 0x0E
        repz    cmpsb
        test    ecx, ecx
        jnz     out

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, cls
        mov     edx, 4
        int     0x80

        mov     eax, 1
        mov     edi, 1
        mov     rsi, strict qword good
        mov     edx, 0x1C
        syscall

out:
        mov     eax, 1                  ; sys_exit i386
        xor     ebx, ebx
        int     0x80

section .data
Credit:         db '._:timotei crackme#3:_:.', 0
hint:           db 'Defeat COVID', 0
secret:         db 0x35, 0x56, 0x57, 0x56, 0x52, 0x65, 0x11
                db 0x34, 0x40, 0x47, 0x3A, 0x35, 0x12, 0x00
cls:            db 0x1B, '[2J'
blink:          db 0x1B, '[5;37;1m', 0
reset:          db 0x1B, '[0;0;0m', 0
cur1:           db 0x1B, '[1;10H'
cur2:           db 0x1B, '[2;10H'
cur3:           db 0x1B, '[3;10H'
cur4:           db 0x1B, '[4;10H'
stars:          db '****************************************', 10
warn:           db '*.warning - self destruction activated.*', 10
prompt:         db '*.enter abort code: '
good:           db '*.Code accepted.Take care!*', 10

section .bss
buffer:         resb 100
