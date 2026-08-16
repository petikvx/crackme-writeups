; timotei-crackme-09 — serializer GUI FASM (PE32)
; Keygen / check du prédicat sub_40112F (pas le crackme d'origine).
;
;   sum = n + Σ s[i] + L*123456
;   ok  ⇔ "CM"@offset pair ∧ n>=2023 ∧ sum%n==0
;
; Headers locaux : fasm_include/ (mini win32a + macros FASM).
;   fasm timotei-crackme-09-serializer-gui-fasm.asm \
;        timotei-crackme-09-serializer-gui-fasm.bin
;
; Lancer (Wine / Windows) :
;   wine timotei-crackme-09-serializer-gui-fasm.bin
;   Generate → serial valide + Registered
;   Check    → valide le champ Serial

format PE GUI 4.0
entry start

; chemins Linux (casse) : arbre local fasm_include/ → WIN32A du package fasmw
include 'fasm_include/win32a.inc'

IDD_MAIN        = 100
IDC_SERIAL      = 1001
IDC_STATUS      = 1002
IDC_GENERATE    = 1003
IDC_CHECK       = 1004

CONST_ADD       = 123456
MIN_N           = 2023
CM_WORD         = 4D43h
N_LIMIT         = 500000

section '.text' code readable executable

  start:
        invoke  GetModuleHandle, 0
        invoke  DialogBoxParam, eax, IDD_MAIN, HWND_DESKTOP, DialogProc, 0
        invoke  ExitProcess, 0

proc DialogProc hwnddlg, msg, wparam, lparam
        push    ebx esi edi
        cmp     [msg], WM_INITDIALOG
        je      .wminitdialog
        cmp     [msg], WM_COMMAND
        je      .wmcommand
        cmp     [msg], WM_CLOSE
        je      .wmclose
        xor     eax, eax
        jmp     .finish

  .wminitdialog:
        invoke  SetDlgItemText, [hwnddlg], IDC_SERIAL, aHint
        invoke  SetDlgItemText, [hwnddlg], IDC_STATUS, aUnreg
        jmp     .processed

  .wmcommand:
        mov     eax, [wparam]
        cmp     eax, BN_CLICKED shl 16 + IDC_GENERATE
        je      .generate
        cmp     eax, BN_CLICKED shl 16 + IDC_CHECK
        je      .check
        jmp     .processed

  .generate:
        call    gen_serial
        jc      .genfail
        invoke  SetDlgItemText, [hwnddlg], IDC_SERIAL, serbuf
        invoke  SetDlgItemText, [hwnddlg], IDC_STATUS, aReg
        jmp     .processed
  .genfail:
        invoke  SetDlgItemText, [hwnddlg], IDC_STATUS, aGenFail
        jmp     .processed

  .check:
        invoke  GetDlgItemText, [hwnddlg], IDC_SERIAL, serbuf, 50
        invoke  lstrlen, serbuf
        mov     ecx, eax                ; L
        ; atoi = cdecl (msvcrt), pas stdcall
        cinvoke atoi, serbuf
        mov     esi, eax                ; n
        mov     edi, serbuf
        call    serial_ok
        jc      .bad
        invoke  SetDlgItemText, [hwnddlg], IDC_STATUS, aReg
        jmp     .processed
  .bad:
        invoke  SetDlgItemText, [hwnddlg], IDC_STATUS, aUnreg
        jmp     .processed

  .wmclose:
        invoke  EndDialog, [hwnddlg], 0

  .processed:
        mov     eax, 1
  .finish:
        pop     edi esi ebx
        ret
endp

; serial_ok: edi=s, ecx=L, esi=n → CF=0 ok
serial_ok:
        push    ebx
        push    edx
        test    ecx, ecx
        jz      .no
        cmp     esi, MIN_N
        jl      .no
        xor     edx, edx                ; offset
  .cm:
        mov     eax, edx
        inc     eax
        cmp     eax, ecx
        jge     .no
        movzx   eax, byte [edi+edx]
        movzx   ebx, byte [edi+edx+1]
        shl     ebx, 8
        or      eax, ebx
        cmp     ax, CM_WORD
        je      .cmok
        add     edx, 2
        jmp     .cm
  .cmok:
        mov     eax, esi                ; sum = n
        xor     edx, edx                ; i
  .sum:
        cmp     edx, ecx
        jge     .sumd
        movsx   ebx, byte [edi+edx]
        add     ebx, CONST_ADD
        add     eax, ebx
        inc     edx
        jmp     .sum
  .sumd:
        test    esi, esi
        jz      .no
        xor     edx, edx
        div     esi                     ; edx = sum % n
        test    edx, edx
        jnz     .no
        pop     edx
        pop     ebx
        clc
        ret
  .no:
        pop     edx
        pop     ebx
        stc
        ret

; gen_serial → serbuf NUL-terminé, CF=0 si trouvé
gen_serial:
        push    ebx
        push    esi
        push    edi
        mov     ebx, MIN_N              ; n
        xor     esi, esi                ; phase 0=CM 1=CMCM
  .gloop:
        cmp     ebx, N_LIMIT
        jl      .gtry
        cmp     esi, 0
        jne     .gfail
        mov     esi, 1
        mov     ebx, MIN_N
        jmp     .gloop
  .gtry:
        mov     eax, ebx
        mov     edi, serbuf
        call    u32_to_dec              ; ecx=digit len, edi → fin digits
        test    ecx, 1
        jnz     .gnext                  ; nb digits impair → skip
        mov     byte [edi], 'C'
        mov     byte [edi+1], 'M'
        cmp     esi, 0
        je      .gone
        mov     byte [edi+2], 'C'
        mov     byte [edi+3], 'M'
        mov     byte [edi+4], 0
        add     ecx, 4
        jmp     .gchk
  .gone:
        mov     byte [edi+2], 0
        add     ecx, 2
  .gchk:
        mov     edi, serbuf
        push    esi                     ; sauve phase
        mov     esi, ebx                ; n pour serial_ok
        call    serial_ok
        pop     esi
        jnc     .gok
  .gnext:
        inc     ebx
        jmp     .gloop
  .gok:
        pop     edi
        pop     esi
        pop     ebx
        clc
        ret
  .gfail:
        pop     edi
        pop     esi
        pop     ebx
        stc
        ret

; u32_to_dec : eax = n, edi = buf
;   out: digits écrits à buf, ecx = len, edi = fin (après dernier digit)
; scratch : digtmp[12] (écriture arrière puis copie)
u32_to_dec:
        push    ebx
        push    edx
        push    esi
        mov     esi, edi                ; destination
        lea     ebx, [digtmp+12]        ; curseur écriture (fin exclusive)
        mov     ecx, ebx
        test    eax, eax
        jnz     .lp
        mov     byte [esi], '0'
        lea     edi, [esi+1]
        mov     ecx, 1
        pop     esi
        pop     edx
        pop     ebx
        ret
  .lp:
        xor     edx, edx
        push    10
        div     dword [esp]             ; eax /= 10, edx = reste
        add     esp, 4
        add     dl, '0'
        dec     ecx
        mov     [ecx], dl
        test    eax, eax
        jnz     .lp
        ; len = (digtmp+12) - ecx
        lea     eax, [digtmp+12]
        sub     eax, ecx                ; eax = len
        mov     edx, eax
  .copy:
        mov     bl, [ecx]
        mov     [esi], bl
        inc     ecx
        inc     esi
        dec     edx
        jnz     .copy
        mov     edi, esi                ; fin
        mov     ecx, eax                ; len
        pop     esi
        pop     edx
        pop     ebx
        ret

section '.data' data readable writeable

  aHint    db 'click Generate or type a serial',0
  aReg     db 'Registered',0
  aUnreg   db 'Unregistered',0
  aGenFail db 'no serial found',0
  serbuf   rb 64
  digtmp   rb 16                ; scratch u32_to_dec (doit être avant .text ref OK en FASM data)

section '.idata' import data readable writeable

  library kernel, 'KERNEL32.DLL',\
          user,   'USER32.DLL',\
          msvcrt, 'msvcrt.dll'

  import kernel,\
         GetModuleHandle, 'GetModuleHandleA',\
         ExitProcess,     'ExitProcess',\
         lstrlen,         'lstrlenA'

  import user,\
         DialogBoxParam,  'DialogBoxParamA',\
         EndDialog,       'EndDialog',\
         GetDlgItemText,  'GetDlgItemTextA',\
         SetDlgItemText,  'SetDlgItemTextA'

  import msvcrt,\
         atoi,            'atoi'

section '.rsrc' resource data readable

  directory RT_DIALOG, dialogs

  resource dialogs,\
    IDD_MAIN, LANG_ENGLISH+SUBLANG_DEFAULT, main_dialog

  dialog main_dialog, 'timotei-crackme-09 serializer (fasm)',\
         40, 40, 230, 78,\
         WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
    dialogitem 'STATIC', 'Serial:', -1, 8, 10, 40, 10, WS_VISIBLE
    dialogitem 'EDIT', '', IDC_SERIAL, 52, 8, 168, 12,\
               WS_VISIBLE+WS_BORDER+WS_TABSTOP+ES_AUTOHSCROLL
    dialogitem 'STATIC', 'Status:', -1, 8, 28, 40, 10, WS_VISIBLE
    dialogitem 'EDIT', '', IDC_STATUS, 52, 26, 168, 12,\
               WS_VISIBLE+WS_BORDER+ES_READONLY
    dialogitem 'BUTTON', '&Generate', IDC_GENERATE, 52, 48, 75, 14,\
               WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
    dialogitem 'BUTTON', '&Check', IDC_CHECK, 140, 48, 75, 14,\
               WS_VISIBLE+WS_TABSTOP
  enddialog
