; final1.asm — reconstruction style auteur (Cyberpenguin What password???)
; Binaire site : final1.asm + easyasm.asm, linkés via gcc/crt (main).
;
; Compiler (proche du workflow d’origine) :
;   nasm -f elf64 -o final1.o final1.asm
;   nasm -f elf64 -o easyasm.o easyasm.asm
;   gcc -no-pie -o what-password-gcc final1.o easyasm.o
;
; Tester :
;   printf 'kr@meri$dab3st\n' | ./what-password-gcc
;
; Variante autonome (sans libc) : what-password-nasm.asm

BITS 64
DEFAULT ABS                     ; adresses absolues, comme l’ELF non-PIE d’origine

global main
; easyasm exporté même si non appelé (lié comme dans le binaire site)
extern read_int
extern print_int
extern print_char

section .note.GNU-stack noalloc noexec nowrite progbits

section .data

pw:
        db 0x4e, 0x49, 0x1d, 0x42, 0x7c, 0x41, 0x7c, 0x33
        db 0x75, 0x6a, 0x6b, 0x3c, 0x7e, 0x7f, 0xcb

wrong_msg:
        db "Incorrect password!", 10

right_msg:
        db "Correct! You won!", 10

section .bss
; padding pour coller à l’ordre d’origine (pw…msgs puis input en .bss)
        align 16
input:
        resb 0x400

section .text

main:
        push    rbp
        mov     rbp, rsp

        mov     eax, 0                  ; SYS_read
        mov     edi, 0
        mov     rsi, input              ; movabs rsi, imm64 (DEFAULT ABS)
        mov     edx, 0x400
        syscall

        mov     r14d, 0
        mov     r15d, 2

loop_1:
        xor     r12, r12
        xor     r13, r13
        mov     r12b, [r14 + pw]
        mov     r13b, [r14 + input]
        xor     r12, 0x27
        add     r12b, r15b
        cmp     r12b, r13b
        jne     wrong
        cmp     r12b, 0x0a
        je      right
        xor     r12, r12
        xor     r13, r13
        inc     r14
        add     r15, 2
        jmp     loop_1

wrong:
        mov     eax, 1                  ; SYS_write
        mov     edi, 1
        mov     rsi, wrong_msg
        mov     edx, 0x14
        syscall
        mov     eax, 60                 ; SYS_exit
        xor     rdi, rdi
        syscall

right:
        mov     eax, 1
        mov     edi, 1
        mov     rsi, right_msg
        mov     edx, 0x12
        syscall
        mov     eax, 60
        xor     rdi, rdi
        syscall

        ; code mort présent dans le listing d’origine (jamais atteint)
        mov     eax, 0
        mov     rsp, rbp
        pop     rbp
        ret
