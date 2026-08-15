; timotei-crackme-06 — reconstruction FASM (PE console)
; Original : MASM32 6.14 + link 5.12 (DIE). Même prédicat, autre image.
;
;   fasm.x64 timotei-crackme-06-fasm.asm timotei-crackme-06-fasm.bin
;   python3 timotei-crackme-06-solve.py
;   wine timotei-crackme-06-fasm.bin

format PE console
entry start

section '.text' code readable executable

start:
        push    0
        push    80h
        push    3
        push    0
        push    0
        push    80000000h
        push    FileName
        call    [CreateFileA]
        cmp     eax, 0FFFFFFFFh
        je      fail
        mov     [hFile], eax
        push    0
        push    NumberOfBytesRead
        push    50h
        push    buffer
        push    eax
        call    [ReadFile]
        test    eax, eax
        jz      fail
        xor     edx, edx
        xor     ecx, ecx
        sub     byte [NumberOfBytesRead], 0Dh
        jnz     fail
        mov     eax, buffer
        add     edx, [eax]
        sub     edx, [eax+4]
        add     edx, [eax+8]
        cmp     edx, 0BC614Eh
        jl      fail
        cmp     dl, [eax+0Ch]
        jne     fail
        cmp     byte [eax+0Ah], 36h
        jne     fail
        push    aAccepted
        call    puts
        push    aCRLF
        call    puts
        push    aPress
        call    puts
        call    waitkey
        push    aCRLF
        call    puts
fail:
        push    [hFile]
        call    [CloseHandle]
        push    0
        call    [ExitProcess]

puts:
        push    ebp
        mov     ebp, esp
        push    0FFFFFFF5h
        call    [GetStdHandle]
        mov     ebx, eax
        mov     esi, [ebp+8]
        xor     ecx, ecx
.len:
        cmp     byte [esi+ecx], 0
        je      .wr
        inc     ecx
        jmp     .len
.wr:
        push    0
        push    written
        push    ecx
        push    esi
        push    ebx
        call    [WriteFile]
        pop     ebp
        ret     4

waitkey:
        push    0FFFFFFF6h
        call    [GetStdHandle]
        push    eax
        call    [FlushConsoleInputBuffer]
.wait:
        push    1
        call    [Sleep]
        call    [_kbhit]
        test    eax, eax
        jz      .wait
        call    [_getch]
        ret

section '.data' data readable writeable

FileName        db 'timotei.crackme#6.enjoy!', 0
buffer          rb 80
hFile           dd 0
NumberOfBytesRead dd 0
aAccepted       db '.:keyfile:.accepted:.', 0
aCRLF           db 13, 10, 0
aPress          db 'Press any key to continue ...', 0
written         dd 0

section '.idata' import data readable writeable

  dd 0,0,0, RVA kernel32_name, RVA kernel32_iat
  dd 0,0,0, RVA msvcrt_name, RVA msvcrt_iat
  dd 0,0,0,0,0

kernel32_iat:
  CreateFileA             dd RVA _CreateFileA
  ReadFile                dd RVA _ReadFile
  CloseHandle             dd RVA _CloseHandle
  ExitProcess             dd RVA _ExitProcess
  GetStdHandle            dd RVA _GetStdHandle
  WriteFile               dd RVA _WriteFile
  FlushConsoleInputBuffer dd RVA _FlushConsoleInputBuffer
  Sleep                   dd RVA _Sleep
  dd 0
msvcrt_iat:
  _kbhit                  dd RVA __kbhit
  _getch                  dd RVA __getch
  dd 0
kernel32_name db 'KERNEL32.DLL',0
msvcrt_name   db 'msvcrt.dll',0
_CreateFileA            dw 0
                        db 'CreateFileA',0
_ReadFile               dw 0
                        db 'ReadFile',0
_CloseHandle            dw 0
                        db 'CloseHandle',0
_ExitProcess            dw 0
                        db 'ExitProcess',0
_GetStdHandle           dw 0
                        db 'GetStdHandle',0
_WriteFile              dw 0
                        db 'WriteFile',0
_FlushConsoleInputBuffer dw 0
                        db 'FlushConsoleInputBuffer',0
_Sleep                  dw 0
                        db 'Sleep',0
__kbhit                 dw 0
                        db '_kbhit',0
__getch                 dw 0
                        db '_getch',0
