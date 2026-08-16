; Minimal Win32 headers for timotei-crackme-09-serializer-gui-fasm.asm
; (subset of FASM package INCLUDE — ASCII / PE GUI dialog)

include 'macro/struct.inc'
include 'macro/proc32.inc'
include 'macro/import32.inc'
include 'macro/resource.inc'

; --- messages ---
WM_CLOSE        = 0010h
WM_INITDIALOG   = 0110h
WM_COMMAND      = 0111h
BN_CLICKED      = 0

; --- window styles ---
WS_POPUP        = 80000000h
WS_CHILD        = 40000000h
WS_VISIBLE      = 10000000h
WS_CAPTION      = 00C00000h
WS_BORDER       = 00800000h
WS_SYSMENU      = 00080000h
WS_TABSTOP      = 00010000h
WS_GROUP        = 00020000h
DS_MODALFRAME   = 80h
DS_SETFONT      = 40h

ES_AUTOHSCROLL  = 80h
ES_READONLY     = 800h
BS_DEFPUSHBUTTON = 1
BS_PUSHBUTTON   = 0

HWND_DESKTOP    = 0

; --- resource ---
RT_DIALOG       = 5
LANG_ENGLISH    = 9
SUBLANG_DEFAULT = 1

struc TCHAR [val] { common match any, val \{ . db val \}
                           match , val \{ . db ? \} }
sizeof.TCHAR = 1

macro api [name] { if used name
                    label name dword at name#A
                   end if }
