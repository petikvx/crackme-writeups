; Cyberpenguin — What password???
; Reconstruction NASM du crackme (logique de final1.asm).
; Le binaire d’origine était linké avec libc (crt + easyasm.asm inutilisé
; ici : read_int / print_int / print_char). Cette version est autonome
; (_start + syscalls), même prédicat / mêmes messages.
;
; Compiler :
;   nasm -f elf64 -o what-password-nasm.o what-password-nasm.asm
;   ld -o what-password-nasm what-password-nasm.o
;
; Tester :
;   printf 'kr@meri$dab3st\n' | ./what-password-nasm
;   # Correct! You won!

BITS 64
DEFAULT REL

global _start

section .note.GNU-stack noalloc noexec nowrite progbits

section .data

; Table chiffrée @ symbole pw (origine VA 0x404028)
; expect[i] = ((pw[i] ^ 0x27) + (2 + 2*i)) & 0xff  jusqu’à '\n'
pw:
        db 0x4e, 0x49, 0x1d, 0x42, 0x7c, 0x41, 0x7c, 0x33
        db 0x75, 0x6a, 0x6b, 0x3c, 0x7e, 0x7f, 0xcb

wrong_msg:
        db "Incorrect password!", 10
wrong_len equ $ - wrong_msg          ; 0x14

right_msg:
        db "Correct! You won!", 10
right_len equ $ - right_msg          ; 0x12

section .bss
align 16
input:
        resb 0x400

section .text

_start:
        ; --- main (origine) : sys_read(0, input, 0x400) ---
        ; (RIP-relative : l’original utilisait movabs rsi, imm64 + adresses abs.)
        mov     eax, 0                  ; SYS_read
        mov     edi, 0                  ; stdin
        lea     rsi, [rel input]
        mov     edx, 0x400
        syscall

        xor     r14d, r14d              ; index i
        mov     r15d, 2                 ; addend = 2 + 2*i
        lea     rbx, [rel pw]           ; base tables (évite [rel sym+r14] invalide)
        lea     rcx, [rel input]

loop_1:
        xor     r12, r12
        xor     r13, r13
        mov     r12b, [rbx + r14]
        mov     r13b, [rcx + r14]
        xor     r12, 0x27
        add     r12b, r15b
        cmp     r12b, r13b
        jne     wrong
        cmp     r12b, 0x0a              ; fin si expect == '\n'
        je      right
        xor     r12, r12
        xor     r13, r13
        inc     r14
        add     r15, 2
        jmp     loop_1

wrong:
        mov     eax, 1                  ; SYS_write
        mov     edi, 1                  ; stdout
        lea     rsi, [rel wrong_msg]
        mov     edx, wrong_len
        syscall
        mov     eax, 60                 ; SYS_exit
        xor     rdi, rdi
        syscall

right:
        mov     eax, 1                  ; SYS_write
        mov     edi, 1
        lea     rsi, [rel right_msg]
        mov     edx, right_len
        syscall
        mov     eax, 60                 ; SYS_exit
        xor     rdi, rdi
        syscall
