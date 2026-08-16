; timotei-crackme-12 — reconstruction MASM32 (PE GUI dialog)
; Pas le .asm auteur. Reconstruit depuis le PE + listing IDA
; (timotei-crackme-12-idapro.asm). DIE : MASM 6.14 / masm32 / link 5.12.
;
; Prédicat (sub_40112F / sub_4011D5) :
;   n1 = atoi(serial)              ; s'arrête au '-'
;   n2 = atoi(après le premier '-')
;   s(n) = somme des d avec 1 <= d < n et n % d == 0
;   Registered  ⇔  s(n1)==n2  et  s(n2)==n1
;   → paires amiables (ex. 220-284) ou parfaits (ex. 6-6)
;
; Compiler (Windows + MASM32 installé dans \masm32) :
;   cd timotei-crackme-12
;   \masm32\bin\rc /v timotei-crackme-12-masm.rc
;   \masm32\bin\ml /c /coff /Cp timotei-crackme-12-masm.asm
;   \masm32\bin\link /SUBSYSTEM:WINDOWS /RELEASE ^
;       /OUT:timotei-crackme-12-masm.exe ^
;       timotei-crackme-12-masm.obj timotei-crackme-12-masm.res
;
; Lancer :
;   timotei-crackme-12-masm.exe
;   Serial : 220-284  →  Check  →  Registered
;
; Preuve live (original) : screenshot01.png

.686
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\comctl32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\comctl32.lib

; atoi maison (équivalent msvcrt pour digits / signe / stop au non-digit)
; pas de dépendance msvcrt.lib — plus simple sous MASM32

; --- IDs (mêmes que l'original) ---
IDD_MAIN        equ 100
IDC_PROMPT      equ 400         ; 190h
IDC_SERIAL      equ 405         ; 195h
IDC_STATUS      equ 406         ; 196h
IDC_CHECK       equ 402         ; 192h

.data

szPrompt        db ".:please enter a valid serial:.",0
szDefault       db "1234-5678",0
szUnreg         db "Unregistered",0
szReg           db "Registered",0

buffer          db 64 dup(0)    ; GetDlgItemText max 32h
n1_save         dd 0            ; dword_4030B6 — atoi(serial) complet
s_sum           dd 0            ; dword_4030AE — s(n)

hInstance       dd 0
hIcon           dd 0
hCursor         dd 0
lpPrevWndFunc   dd 0

.code

; ==================================================================
; start
; ==================================================================
start:
    invoke  InitCommonControls
    invoke  GetModuleHandle, NULL
    mov     hInstance, eax

    ; icône IDI_APPLICATION (0C8h) / curseur IDC_ARROW (7F89h)
    invoke  LoadIcon, hInstance, 0C8h
    mov     hIcon, eax
    invoke  LoadCursor, NULL, IDC_ARROW
    mov     hCursor, eax

    invoke  DialogBoxParam, hInstance, IDD_MAIN, NULL, \
            offset DialogFunc, 0
    invoke  ExitProcess, 0

; ==================================================================
; DialogFunc — WM_INITDIALOG / WM_COMMAND / WM_CLOSE
; ==================================================================
DialogFunc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    .if uMsg == WM_INITDIALOG
        ; subclass de la fenêtre (curseur) — comme SetWindowLong GWL_WNDPROC
        invoke  SetWindowLong, hWnd, GWL_WNDPROC, offset SubclassProc
        mov     lpPrevWndFunc, eax

        invoke  SendMessage, hWnd, WM_SETICON, ICON_BIG, hIcon
        ; EM_LIMITTEXT 0x31 sur Serial
        invoke  SendDlgItemMessage, hWnd, IDC_SERIAL, EM_LIMITTEXT, 31h, 0

        invoke  SetDlgItemText, hWnd, IDC_PROMPT, addr szPrompt
        invoke  SetDlgItemText, hWnd, IDC_SERIAL, addr szDefault
        invoke  CheckSerial, hWnd
        mov     eax, TRUE
        ret

    .elseif uMsg == WM_COMMAND
        mov     eax, wParam
        and     eax, 0FFFFh
        .if eax == IDC_CHECK
            invoke  CheckSerial, hWnd
        .endif

    .elseif uMsg == WM_CLOSE
        invoke  EndDialog, hWnd, 0
    .endif

    xor     eax, eax
    ret
DialogFunc endp

; ==================================================================
; SubclassProc — WM_SETCURSOR → SetCursor (comme sub_4010F8)
; ==================================================================
SubclassProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    .if uMsg == WM_SETCURSOR
        invoke  SetCursor, hCursor
        xor     eax, eax
        ret
    .endif
    invoke  CallWindowProc, lpPrevWndFunc, hWnd, uMsg, wParam, lParam
    ret
SubclassProc endp

; ==================================================================
; MyAtoi — esi = string → eax = valeur (style msvcrt)
; ==================================================================
MyAtoi proc
    push    ebx
    push    ecx
    push    esi
    xor     eax, eax
    xor     ebx, ebx                ; sign 0=+
    mov     cl, [esi]
    cmp     cl, '+'
    je      ma_skip
    cmp     cl, '-'
    jne     ma_digits
    mov     ebx, 1
ma_skip:
    inc     esi
ma_digits:
    movzx   ecx, byte ptr [esi]
    cmp     cl, '0'
    jb      ma_done
    cmp     cl, '9'
    ja      ma_done
    imul    eax, 10
    sub     cl, '0'
    add     eax, ecx
    inc     esi
    jmp     ma_digits
ma_done:
    test    ebx, ebx
    jz      ma_ret
    neg     eax
ma_ret:
    pop     esi
    pop     ecx
    pop     ebx
    ret
MyAtoi endp

; ==================================================================
; AliquotSum — s(n) dans s_sum  (sub_4011D5)
;   in : eax = n
;   s_sum = Σ { ebx | 1 <= ebx < n, n % ebx == 0 }
; ==================================================================
AliquotSum proc
    push    ebx
    push    ecx
    push    edx
    push    edi

    mov     s_sum, 0
    mov     ebx, 1
    mov     ecx, eax
    dec     ecx                 ; boucle n-1 fois
    mov     edi, eax            ; n constant
    test    ecx, ecx
    jle     as_done

as_loop:
    mov     eax, edi
    xor     edx, edx
    div     ebx
    cmp     edx, 0
    jne     as_next
    add     s_sum, ebx
as_next:
    inc     ebx
    loop    as_loop

as_done:
    pop     edi
    pop     edx
    pop     ecx
    pop     ebx
    ret
AliquotSum endp

; ==================================================================
; CheckSerial — sub_40112F
; ==================================================================
CheckSerial proc hDlg:HWND
    LOCAL   n2:DWORD

    push    ebx
    push    esi
    push    edi

    invoke  GetDlgItemText, hDlg, IDC_SERIAL, addr buffer, 32h
    invoke  lstrlen, addr buffer
    cmp     eax, 0
    je      cs_fail

    ; n1 = atoi(serial)  — s'arrête au '-'
    lea     esi, buffer
    call    MyAtoi
    mov     n1_save, eax
    call    AliquotSum              ; s(n1) → s_sum

    ; chercher le premier '-'
    lea     edi, buffer
cs_find:
    cmp     byte ptr [edi], '-'
    je      cs_found
    cmp     byte ptr [edi], 0
    je      cs_fail
    inc     edi
    jmp     cs_find

cs_found:
    inc     edi                     ; après '-'
    mov     esi, edi
    call    MyAtoi                  ; n2
    mov     n2, eax
    cmp     s_sum, eax              ; s(n1) == n2 ?
    jne     cs_fail

    ; s(n2) puis n1 == s(n2) ?
    mov     eax, n2
    call    AliquotSum              ; s_sum = s(n2)
    mov     eax, n1_save
    cmp     eax, s_sum
    jne     cs_fail

    invoke  SetDlgItemText, hDlg, IDC_STATUS, addr szReg
    jmp     cs_done

cs_fail:
    invoke  SetDlgItemText, hDlg, IDC_STATUS, addr szUnreg

cs_done:
    pop     edi
    pop     esi
    pop     ebx
    ret
CheckSerial endp

end start
