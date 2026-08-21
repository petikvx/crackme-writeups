; easyasm.asm — helpers de cours reconstruits depuis le binaire
; (Cyberpenguin What password??? / symbols read_int, print_int, print_char).
; Non utilisés par le check password ; présents dans l’ELF d’origine.
;
; Dépendances libc : scanf, printf, putchar
;
;   nasm -f elf64 -o easyasm.o easyasm.asm

BITS 64
DEFAULT REL

global read_int
global print_int
global print_char

extern scanf
extern printf
extern putchar

section .note.GNU-stack noalloc noexec nowrite progbits

section .data

read_fmt:
        db "%d", 0

print_fmt:
        db "%d", 10, 0

section .text

; ---- save / restore callee-volatile style (comme le listing d’origine) ----
%macro EASY_PROLOGUE 0
        push    rcx
        push    rdx
        push    rbx
        push    rbp
        push    rsi
        push    rdi
        push    r8
        push    r9
        push    r10
        push    r11
        push    r12
        push    r13
        push    r14
        push    r15
        push    rbp
        mov     rbp, rsp
%endmacro

%macro EASY_EPILOGUE 0
        mov     rsp, rbp
        pop     rbp
        pop     r15
        pop     r14
        pop     r13
        pop     r12
        pop     r11
        pop     r10
        pop     r9
        pop     r8
        pop     rdi
        pop     rsi
        pop     rbp
        pop     rbx
        pop     rdx
        pop     rcx
%endmacro

; int read_int(void) — scanf("%d", &local) → eax
read_int:
        EASY_PROLOGUE
        sub     rsp, 0x10
        lea     rdi, [rel read_fmt]
        lea     rsi, [rbp - 8]
        call    scanf
        mov     eax, dword [rbp - 8]
        EASY_EPILOGUE
        ret

; void print_int(int rdi) — printf("%d\n", rdi)
print_int:
        EASY_PROLOGUE
        mov     rsi, rdi
        lea     rdi, [rel print_fmt]
        call    printf
        EASY_EPILOGUE
        ret

; void print_char(int rdi) — putchar(rdi)
print_char:
        EASY_PROLOGUE
        call    putchar
        EASY_EPILOGUE
        ret
