; timotei-crackme-10 — serializer GUI FASM (PE32)
; Design proche du crackme : Name + Serial + bouton About.
; À chaque frappe dans Name (EN_CHANGE) → serial recalculé (sub_401144).
;
;   sorted = bubble_sort(Name)
;   d = uint32_LE(sorted[0:4])
;   Serial = sorted[0:4] + decimal( (d*d) >> 32 )
;
; Pas de WM_MOUSEMOVE killer (contrairement à l'original).
;
;   fasm timotei-crackme-10-serializer-gui-fasm.asm \
;        timotei-crackme-10-serializer-gui-fasm.bin
;   wine timotei-crackme-10-serializer-gui-fasm.bin

format PE GUI 4.0
entry start

include 'fasm_include/win32a.inc'

; --- IDs (même esprit que le crackme : 405 name, 406 serial) ---
IDD_MAIN        = 100
IDC_NAME        = 405
IDC_SERIAL      = 406
IDC_ABOUT       = 402

EN_CHANGE       = 300h
MB_OK           = 0
MB_ICONINFORMATION = 40h

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
        ; limite saisie Name (comme EM_LIMITTEXT 0x31 du crackme)
        invoke  SendDlgItemMessage, [hwnddlg], IDC_NAME, 0C5h, 31h, 0
        invoke  SetDlgItemText, [hwnddlg], IDC_NAME, aDefaultName
        push    [hwnddlg]
        call    update_serial
        jmp     .processed

  .wmcommand:
        mov     eax, [wparam]
        ; EN_CHANGE sur Name → recalcul live
        cmp     eax, EN_CHANGE shl 16 + IDC_NAME
        je      .name_changed
        ; About
        cmp     eax, BN_CLICKED shl 16 + IDC_ABOUT
        je      .about
        jmp     .processed

  .name_changed:
        push    [hwnddlg]
        call    update_serial
        jmp     .processed

  .about:
        invoke  MessageBox, [hwnddlg], aAboutText, aAboutTitle, MB_OK+MB_ICONINFORMATION
        jmp     .processed

  .wmclose:
        invoke  EndDialog, [hwnddlg], 0

  .processed:
        mov     eax, 1
  .finish:
        pop     edi esi ebx
        ret
endp

; ------------------------------------------------------------------
; update_serial(hwnd)  stdcall 1 arg
; ------------------------------------------------------------------
update_serial:
        push    ebp
        mov     ebp, esp
        push    ebx
        push    esi
        push    edi

        mov     ebx, [ebp+8]            ; hwnd

        invoke  GetDlgItemText, ebx, IDC_NAME, namebuf, 50
        invoke  lstrlen, namebuf
        cmp     eax, 4
        jl      .too_short

        ; copie name → work (tri destructif)
        mov     esi, namebuf
        mov     edi, workbuf
        mov     ecx, eax
        mov     [namelen], eax
        rep     movsb
        mov     byte [edi], 0

        ; bubble sort workbuf[0..len)
        mov     eax, [namelen]
        mov     ebx, eax
        dec     ebx                     ; outer = len-1
        test    ebx, ebx
        jz      .sorted
  .outer:
        mov     ecx, ebx
        mov     esi, workbuf
  .inner:
        mov     al, [esi]
        mov     dl, [esi+1]
        cmp     al, dl
        jle     .noswap
        mov     [esi], dl
        mov     [esi+1], al
  .noswap:
        inc     esi
        loop    .inner
        dec     ebx
        jnz     .outer

  .sorted:
        ; d = dword LE des 4 premiers octets triés
        mov     eax, dword [workbuf]
        mov     [named], eax

        ; prefix → serbuf[0..3]
        mov     eax, [named]
        mov     dword [serbuf], eax

        ; high = (d * d) >> 32
        mov     eax, [named]
        mul     eax                     ; edx:eax = d*d
        ; edx = high32 → décimal après serbuf+4
        mov     eax, edx
        lea     edi, [serbuf+4]
        call    u32_to_dec
        mov     byte [edi], 0

        invoke  SetDlgItemText, [ebp+8], IDC_SERIAL, serbuf
        jmp     .done

  .too_short:
        invoke  SetDlgItemText, [ebp+8], IDC_SERIAL, aEmpty

  .done:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     4

; ------------------------------------------------------------------
; u32_to_dec : eax = n, edi = buf
;   out: digits écrits, edi = fin (après dernier digit), ecx = len
; ------------------------------------------------------------------
u32_to_dec:
        push    ebx
        push    edx
        push    esi
        mov     esi, edi
        lea     ebx, [digtmp+12]
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
        div     dword [esp]
        add     esp, 4
        add     dl, '0'
        dec     ecx
        mov     [ecx], dl
        test    eax, eax
        jnz     .lp
        lea     eax, [digtmp+12]
        sub     eax, ecx
        mov     edx, eax
  .copy:
        mov     bl, [ecx]
        mov     [esi], bl
        inc     ecx
        inc     esi
        dec     edx
        jnz     .copy
        mov     edi, esi
        mov     ecx, eax
        pop     esi
        pop     edx
        pop     ebx
        ret

section '.data' data readable writeable

  aDefaultName  db 'timotei',0
  aEmpty        db 0
  aAboutTitle   db 'About',0
  aAboutText    db 'timotei-crackme-10 serializer (FASM)',13,10
                db 13,10
                db 'Type a Name (login, min 4 chars).',13,10
                db 'Serial updates automatically.',13,10
                db 13,10
                db 'Algorithm (sub_401144):',13,10
                db '  sort Name ascending',13,10
                db '  d = first 4 bytes as dword LE',13,10
                db '  Serial = those 4 bytes + (d*d)>>32',13,10
                db 13,10
                db 'Example: timotei -> eiim784527143',13,10
                db 'No mouse-kill (unlike the crackme).',0

  namebuf       rb 64
  workbuf       rb 64
  serbuf        rb 64
  digtmp        rb 16
  namelen       dd 0
  named         dd 0

section '.idata' import data readable writeable

  library kernel, 'KERNEL32.DLL',\
          user,   'USER32.DLL'

  import kernel,\
         GetModuleHandle, 'GetModuleHandleA',\
         ExitProcess,     'ExitProcess',\
         lstrlen,         'lstrlenA'

  import user,\
         DialogBoxParam,     'DialogBoxParamA',\
         EndDialog,          'EndDialog',\
         GetDlgItemText,     'GetDlgItemTextA',\
         SetDlgItemText,     'SetDlgItemTextA',\
         SendDlgItemMessage, 'SendDlgItemMessageA',\
         MessageBox,         'MessageBoxA'

section '.rsrc' resource data readable

  directory RT_DIALOG, dialogs

  resource dialogs,\
    IDD_MAIN, LANG_ENGLISH+SUBLANG_DEFAULT, main_dialog

  ; layout proche du crackme #10
  dialog main_dialog, 'timotei''s Crackme #10 serializer',\
         40, 40, 200, 78,\
         WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
    dialogitem 'STATIC', 'Name:', -1, 8, 10, 36, 10, WS_VISIBLE
    dialogitem 'EDIT', '', IDC_NAME, 48, 8, 144, 12,\
               WS_VISIBLE+WS_BORDER+WS_TABSTOP+ES_AUTOHSCROLL
    dialogitem 'STATIC', 'Serial:', -1, 8, 28, 36, 10, WS_VISIBLE
    dialogitem 'EDIT', '', IDC_SERIAL, 48, 26, 144, 12,\
               WS_VISIBLE+WS_BORDER+ES_READONLY
    dialogitem 'BUTTON', '&About', IDC_ABOUT, 70, 48, 60, 14,\
               WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
  enddialog
