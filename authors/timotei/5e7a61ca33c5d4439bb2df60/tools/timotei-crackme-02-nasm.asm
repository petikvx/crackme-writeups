; timotei-crackme-02 — reconstruction NASM (pas le .asm auteur, perdu)
; Source d'origine très probablement FASM (ELF "executable" d'un seul fichier,
; strippé, pas de libc, pas de crt). Reconstruction depuis objdump / .data.
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-02-nasm.o timotei-crackme-02-nasm.asm
;   ld -nostdlib -static -no-pie -o timotei-crackme-02-nasm.bin \
;      timotei-crackme-02-nasm.o
;
; Lancer (le secret est argv[1], pas stdin) :
;   ./timotei-crackme-02-nasm.bin '31337!!P'

BITS 64
DEFAULT ABS                     ; adresses absolues, comme le binaire d'origine

global _start

section .text
_start:
        cmp     byte [rsp], 2           ; argc == 2 ?
        jne     out

        mov     rdi, [rsp + 0x10]       ; argv[1]
        sub     ecx, ecx                ; pas xor : 29 C9
        sub     al, al                  ; pas xor : 28 C0
        not     ecx
        cld
        repnz   scasb                   ; strlen
        not     ecx
        dec     ecx
        cmp     ecx, 3
        jle     out

        sub     rbx, rbx
        sub     rdi, rdi
        mov     rax, [rsp + 0x10]       ; argv[1]
pack:
        mov     bl, [rax]
        rol     rbx, 8
        inc     rax
        dec     ecx
        jnz     pack

        add     rbx, 0xAFDC
        mov     di, bx                  ; di = low 16 bits
here:
        mov     rax, strict qword here  ; 10 octets, comme movabs 0x40103f
        add     rax, rdi
        jmp     rax                     ; atterrit sur goodway ssi di == 0x0F

goodway:
        mov     eax, 1                  ; sys_write
        mov     edi, 1
        mov     rsi, strict qword good  ; movabs
        mov     edx, 0x2F               ; 47 octets, zéros compris
        syscall

out:
        mov     eax, 60                 ; sys_exit
        xor     rdi, rdi
        syscall

section .data
Credit:         db '._:timotei crackme#2:_:.', 0
greetz:         db ':.greetz fly out to jeffli6789 & BinaryNewbie..', 0
good:           db '_.:pass accepted:._', 10
; 200 zéros : reliquat de template (buffers #01 jamais utilisés ici)
                times 200 db 0
