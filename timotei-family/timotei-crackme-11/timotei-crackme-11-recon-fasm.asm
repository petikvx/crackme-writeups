; timotei-crackme-11 — reconstruction FASM (même algorithme que l'original)
;
; Différence volontaire pour l'affichage :
;   original : push esi   ; hWnd = esi+n+1  → souvent invalide, MessageBox rate
;   recon    : push 0     ; hWnd = NULL     → la boîte s'affiche (Wine + Windows)
;
; Le reste (GetCommandLine, parse, XOR @ Text) est fidèle à IDA / Hex-Rays.
;
; Compiler :
;   fasm timotei-crackme-11-recon-fasm.asm timotei-crackme-11-recon-fasm.bin
;
; Lancer :
;   wine timotei-crackme-11-recon-fasm.bin t62O3668101526
;   → MessageBox "Good Work"

format PE GUI 4.0
entry start

include '../timotei-crackme-10/fasm_include/win32a.inc'

section '.text' code readable writeable executable

  start:
        invoke  GetCommandLineA
        ; eax = command line ; trouver le NUL
  .scan:
        inc     eax
        cmp     byte [eax], 0
        jne     .scan

        sub     eax, 10                 ; 10 derniers car.
        mov     esi, [eax-4]            ; clé dword LE
        mov     edi, eax
        xor     ecx, ecx
        xor     eax, eax                ; n = 0
  .parse:
        movzx   edx, byte [edi+ecx]
        test    dl, dl
        jz      .parsed
        sub     dl, '0'
        imul    eax, 10
        add     eax, edx
        inc     ecx
        jmp     .parse
  .parsed:
        ; Text[0..3] ^= esi ; Text[5..8] ^= n
        xor     dword [Text], esi
        xor     dword [Text+5], eax

        ; hWnd : original serait add esi,eax / inc esi / push esi
        ; recon affichable :
        push    0                       ; uType
        push    Title                   ; lpCaption
        push    Text                    ; lpText
        push    0                       ; hWnd = NULL  (★ fix affichage)
        call    [MessageBoxA]

        push    0
        call    [ExitProcess]

section '.data' data readable writeable

  ; cipher identique @ 0x401070
  Text    db 33h, 59h, 5Dh, 2Bh, 20h, 0C1h, 0A6h, 0D0h, 0B1h, 00h, 00h, 00h
  Title   db 'timotei crackme #11 1K-Edition',0

section '.idata' import data readable writeable

  library kernel, 'KERNEL32.DLL',\
          user,   'USER32.DLL'

  import kernel,\
         GetCommandLineA, 'GetCommandLineA',\
         ExitProcess,     'ExitProcess'

  import user,\
         MessageBoxA,     'MessageBoxA'
