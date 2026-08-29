; TForm1.Edit1Change — VA 0x44F018 (image base 0x400000, post-ASPack / dump Scylla)
; Extrait live x32dbg (Crackme#5_dump_SCY.exe)

; --- Edit1 : transform + compare ---
; for each char c of Edit1.Text:
;   out += Chr( (c XOR 0xE0) + 0x20 )
; compare to encoded "SerialCheck" @ 0x44F250
;   DB 0xD3,0xA5,0xB2,0xA9,0xA1,0xAC,0xC3,0xA8,0xA5,0xA3,0xAB
; else compare to encoded "About" @ 0x44F264
;   DB 0xC1,0xA2,0xAF,0xB5,0xB4  → MessageBox "Some Info." / hint

0044F071  movzx edi, byte ptr [eax+edx-1]
0044F076  xor   edi, 0E0h
0044F07C  add   edi, 20h
; ... Char + string concat ...
0044F09A  mov   eax, [ebp-10h]          ; transformed Edit1
0044F09D  mov   edx, 44F250h            ; "SerialCheck" enc
0044F0A2  call  LStrCmp                 ; 404608
0044F0A7  je    serial_path             ; 44F0DA
0044F0A9  mov   eax, [ebp-10h]
0044F0AC  mov   edx, 44F264h            ; "About" enc
0044F0B1  call  LStrCmp
0044F0B6  je    about_msg               ; 44F0BD
0044F0B8  jmp   epilogue

; --- Edit3 (name) → serial, compare Edit2 ---
serial_path:
0044F0F0  cmp   eax, 4                  ; Length(Edit3) >= 4
0044F10F  cmp   eax, 4                  ; Length(Edit2) >= 4
; acc = 0
; for i := 1 to Length(Edit3) do
0044F14A  movzx eax, byte ptr [eax+edi-1]
0044F14F  xor   eax, 7D3h
0044F154  imul  edi                     ; * i (1-based)
0044F156  add   [ebp-8], eax
0044F159  sub   dword ptr [ebp-8], 1Dh
; acc := acc * Length(Edit3)
0044F177  imul  dword ptr [ebp-8]
; acc := acc div Ord(Edit3[1])
0044F18E  movzx eax, byte ptr [eax]     ; first char
0044F199  idiv  ecx
; acc := acc * acc + 15h
0044F1A1  imul  dword ptr [ebp-8]
0044F1A4  add   eax, 15h
0044F1B0  call  IntToStr                ; 4082AC → [ebp-14]
0044F1C9  call  LStrCmp                 ; vs Edit2
0044F1CE  jne   epilogue
0044F1D0  ; MessageBox "WELL DONE!" / "YOU DID IT!..."
; clear Edit1, Edit2, Edit3
