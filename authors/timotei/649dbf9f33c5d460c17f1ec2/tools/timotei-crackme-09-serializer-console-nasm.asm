; timotei-crackme-09 — keygen console NASM64 (prédicat sub_40112F)
;
; Forme cherchée : decimal(n) + "CM" avec len(digits) pair, n >= 2023,
; et sum % n == 0 où :
;   sum = n + Σ s[i] + L * 123456
;   "CM" détecté comme word 0x4D43 (offset pair, style repne scasw)
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-09-serializer-console-nasm.o timotei-crackme-09-serializer-console-nasm.asm
;   ld -nostdlib -static -no-pie -o timotei-crackme-09-serializer-console-nasm.bin \
;      timotei-crackme-09-serializer-console-nasm.o
;
; Lancer :
;   ./timotei-crackme-09-serializer-console-nasm.bin              # imprime des serials
;   ./timotei-crackme-09-serializer-console-nasm.bin 2191CMCM     # check → OK / FAIL

BITS 64
DEFAULT REL

global _start

CONST_ADD   equ 123456
MIN_N       equ 2023
CM_WORD     equ 0x4D43
MAX_FIND    equ 8
N_LIMIT     equ 500000

section .bss
serbuf:     resb 32

section .data
banner:
        db 'timotei-crackme-09 serializer-console (nasm)', 10
        db 'predicat: CM @ even + n>=2023 + sum%n==0', 10, 10
banner_len equ $ - banner
hdr:    db 'serials:', 10
hdr_len equ $ - hdr
msg_ok: db 'OK  '
msg_ok_len equ $ - msg_ok
msg_fail: db 'FAIL '
msg_fail_len equ $ - msg_fail
nl:     db 10

section .text
_start:
        mov     rax, [rsp]              ; argc
        cmp     rax, 2
        jae     mode_check

; ══════════════════════════════════════════════════════════════════
; mode keygen
; ══════════════════════════════════════════════════════════════════
mode_keygen:
        lea     rsi, [banner]
        mov     rdx, banner_len
        call    sys_write
        lea     rsi, [hdr]
        mov     rdx, hdr_len
        call    sys_write

        xor     r12d, r12d              ; found
        mov     r13d, MIN_N             ; n
        xor     r15d, r15d              ; phase: 0 = +"CM", 1 = +"CMCM"

.kloop:
        cmp     r12d, MAX_FIND
        jge     .kdone
        cmp     r13d, N_LIMIT
        jl      .ktry
        ; phase suivante
        cmp     r15d, 0
        jne     .kdone
        mov     r15d, 1
        mov     r13d, MIN_N
        jmp     .kloop

.ktry:
        mov     edi, r13d
        lea     rsi, [serbuf]
        call    u32_to_dec              ; ecx = digit len, rsi → end
        test    ecx, 1
        jnz     .knext                  ; digits impair → CM à offset impair

        mov     byte [rsi], 'C'
        mov     byte [rsi + 1], 'M'
        cmp     r15d, 0
        je      .one_cm
        mov     byte [rsi + 2], 'C'
        mov     byte [rsi + 3], 'M'
        mov     byte [rsi + 4], 0
        add     ecx, 4
        jmp     .kcheck
.one_cm:
        mov     byte [rsi + 2], 0
        add     ecx, 2
.kcheck:
        lea     rdi, [serbuf]
        mov     esi, r13d               ; n
        call    serial_ok
        jc      .knext

        lea     rdi, [serbuf]
        call    strlen
        mov     rdx, rax
        lea     rsi, [serbuf]
        call    sys_write
        lea     rsi, [nl]
        mov     rdx, 1
        call    sys_write
        inc     r12d

.knext:
        inc     r13d
        jmp     .kloop

.kdone:
        xor     edi, edi
        call    sys_exit

; ══════════════════════════════════════════════════════════════════
; mode check : argv[1]
; ══════════════════════════════════════════════════════════════════
mode_check:
        mov     r14, [rsp + 16]         ; argv[1]
        mov     rdi, r14
        call    strlen
        mov     r15d, eax               ; L (preserved)
        test    r15d, r15d
        jz      .fail

        mov     rsi, r14
        call    c_atoi                  ; eax = n
        mov     esi, eax                ; n
        mov     ecx, r15d               ; L
        mov     rdi, r14
        call    serial_ok
        jc      .fail

        lea     rsi, [msg_ok]
        mov     rdx, msg_ok_len
        call    sys_write
        mov     rdi, r14
        call    strlen
        mov     rdx, rax
        mov     rsi, r14
        call    sys_write
        lea     rsi, [nl]
        mov     rdx, 1
        call    sys_write
        xor     edi, edi
        call    sys_exit

.fail:
        lea     rsi, [msg_fail]
        mov     rdx, msg_fail_len
        call    sys_write
        test    r14, r14
        jz      .fail_nl
        mov     rdi, r14
        call    strlen
        test    rax, rax
        jz      .fail_nl
        mov     rdx, rax
        mov     rsi, r14
        call    sys_write
.fail_nl:
        lea     rsi, [nl]
        mov     rdx, 1
        call    sys_write
        mov     edi, 1
        call    sys_exit

; ══════════════════════════════════════════════════════════════════
; serial_ok
;   in : rdi = s, ecx = L, esi = n
;   out: CF=0 ok, CF=1 fail
; ══════════════════════════════════════════════════════════════════
serial_ok:
        push    rbx
        push    rdi
        push    rsi
        push    rcx

        test    ecx, ecx
        jz      .bad
        cmp     esi, MIN_N
        jl      .bad

        ; --- scasw-like : words LE step 2, offsets pairs dans s[0..L) ---
        mov     r8, rdi
        xor     r10d, r10d              ; offset
.cm_loop:
        mov     eax, r10d
        inc     eax
        cmp     eax, ecx                ; need offset+1 < L
        jge     .bad
        movzx   eax, byte [r8 + r10]
        movzx   ebx, byte [r8 + r10 + 1]
        shl     ebx, 8
        or      eax, ebx
        cmp     ax, CM_WORD
        je      .cm_yes
        add     r10d, 2
        jmp     .cm_loop

.cm_yes:
        ; sum = n + Σ (movsx(s[i]) + CONST_ADD)
        mov     eax, esi                ; low 32 bits like PE
        xor     r10d, r10d
        mov     r9d, ecx
.sum_loop:
        test    r9d, r9d
        jz      .sum_done
        movsx   ebx, byte [rdi + r10]
        add     ebx, CONST_ADD
        add     eax, ebx
        inc     r10d
        dec     r9d
        jmp     .sum_loop

.sum_done:
        mov     ebx, esi
        test    ebx, ebx
        jz      .bad
        xor     edx, edx
        div     ebx                     ; edx = sum % n
        test    edx, edx
        jnz     .bad

        pop     rcx
        pop     rsi
        pop     rdi
        pop     rbx
        clc
        ret

.bad:
        pop     rcx
        pop     rsi
        pop     rdi
        pop     rbx
        stc
        ret

; ══════════════════════════════════════════════════════════════════
; c_atoi : rsi → eax (préfixe [+-]?digits)
; ══════════════════════════════════════════════════════════════════
c_atoi:
        xor     eax, eax
        xor     r8d, r8d                ; sign: 0=+ 1=-
        mov     bl, [rsi]
        cmp     bl, '+'
        je      .sgn
        cmp     bl, '-'
        jne     .digs
        mov     r8d, 1
.sgn:
        inc     rsi
.digs:
        movzx   ecx, byte [rsi]
        cmp     cl, '0'
        jb      .done
        cmp     cl, '9'
        ja      .done
        imul    eax, 10
        sub     cl, '0'
        add     eax, ecx
        inc     rsi
        jmp     .digs
.done:
        test    r8d, r8d
        jz      .out
        neg     eax
.out:
        ret

; ══════════════════════════════════════════════════════════════════
; u32_to_dec : edi=n, rsi=buf
;   out: digits at buf, rsi=end, ecx=len  (n>=0)
; ══════════════════════════════════════════════════════════════════
u32_to_dec:
        push    rbx
        push    rdx
        mov     eax, edi
        lea     rbx, [rsi + 20]         ; write digits backward here
        mov     r8, rbx
        test    eax, eax
        jnz     .loop
        mov     byte [rsi], '0'
        inc     rsi
        mov     ecx, 1
        pop     rdx
        pop     rbx
        ret
.loop:
        xor     edx, edx
        mov     r9d, 10
        div     r9d
        add     dl, '0'
        dec     r8
        mov     [r8], dl
        test    eax, eax
        jnz     .loop
        mov     rcx, rbx
        sub     rcx, r8                 ; len
        mov     rax, rcx
.copy:
        mov     dl, [r8]
        mov     [rsi], dl
        inc     r8
        inc     rsi
        dec     rcx
        jnz     .copy
        mov     ecx, eax
        pop     rdx
        pop     rbx
        ret

; ══════════════════════════════════════════════════════════════════
strlen: ; rdi → rax
        xor     eax, eax
.l:
        cmp     byte [rdi + rax], 0
        je      .r
        inc     rax
        jmp     .l
.r:     ret

sys_write: ; rsi=buf rdx=len → stdout
        mov     eax, 1
        mov     edi, 1
        syscall
        ret

sys_exit: ; edi=code
        mov     eax, 60
        syscall
