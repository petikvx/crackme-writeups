; ~~~ Readme ~~~
; My first released 'CrackMe' ever. If you are new to assembly
; language, I hope this little project of mine helps you understand
; what is going on a little better. Of course, the password is very
; easy and the commands that are utilized are limited (you are a beginner
; right?) Thats not the point however. You're here to understand how this
; mess works. I've even provided the source code and commented (almost)
; every line so you can follow. I really hope to do more of these if time
; allows so I can keep learning along with you. Have fun.
;
; Oh, and if you open the program with a debugger and it doesn't allow you
; to input a password, make sure you ATTACH the debugger to the proper
; process as it's running.
;
;           ~Xeeven

; ~~~ Source code ~~~

global _start                                            ; Required for GCC compilers.

; Constant data section / Static data segments
section .data
        align 2                                          ; Align to the nearest 2 byte boundary, must be a power of two

        data_title_1: db '+ ------------------- +', 0xA  ; String, which is just a collection of bytes, 0xA is newline
        data_title_1_Len: equ $-data_title_1             ; Measure the length of the string and store it

        data_title_2: db '| Find the Password 1 |', 0xA  ; name; databyte; 'string'; , additional characters
        data_title_2_Len: equ $-data_title_2

        data_title_3: db '|           by Xeeven |', 0xA
        data_title_3_Len: equ $-data_title_3

        data_title_4: db '+ ------------------- +', 0xA
        data_title_4_Len: equ $-data_title_4

        data_password: db 'Password: '
        data_password_Len: equ $-data_password

        data_good_msg_1: db '+ *** *** *** *** *** +', 0xA
        data_good_msg_Len_1: equ $-data_good_msg_1

        data_good_msg_2: db '|   Congratulations!  |', 0xA
        data_good_msg_Len_2: equ $-data_good_msg_2

        data_good_msg_3: db '+ *** *** *** *** *** +', 0xA, 0xA
        data_good_msg_Len_3: equ $-data_good_msg_3

        data_bad_msg: db 'Wrong! Try again.', 0xA, 0xA
        data_bad_msg_Len: equ $-data_bad_msg

        data_const_password: db '8675309', 0xA            ; 8675309 is the password. After the user pushes enter, a newline character is added to their password. We must account for this because the newline character in each passwords will be compared as well.
        data_const_password_Len: equ $-data_const_password

; Variable data section / Undeclared variables
section .bss

        bss_password resb 32               ; Variable; parser; byte size
        bss_password_Len: equ $-bss_password

; Program data section /
section .text
        _start:

    ; Print title screen
        ; Print title line 1
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_title_1        ; Address of the string
        mov     edx, data_title_1_Len    ; Length of the string
        int     0x80                     ; Execute commands in registers


        ; Print title line 2
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_title_2        ; Address of the string
        mov     edx, data_title_2_Len    ; Length of the string
        int     0x80                     ; Execute commands in registers

        ; Print title line 3
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_title_3        ; Address of the string
        mov     edx, data_title_3_Len    ; Length of the string
        int     0x80                     ; Execute commands in registers

        ; Print title line 4
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_title_4        ; Address of the string
        mov     edx, data_title_4_Len    ; Length of the string
        int     0x80                     ; Execute commands in registers

        nop

    ; Print string 'Password: '
        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_password       ; Address of the string
        mov     edx, data_password_Len   ; Length of the string
        int     0x80                     ; Execute commands in registers

        nop

    ; Get input from user (password)
        mov     eax, 3                   ; Command to read
        mov     ebx, 2                   ; System fork, read from console
        mov     ecx, bss_password        ; Where to put the users input
        mov     edx, 32                  ; 32 bits stored here
        int     0x80                     ; Execute commands in registers

        nop

    ; Check users password
        mov     edi, bss_password        ; Move user entered password to EDI register
        mov     esi, data_const_password ; Move hardcoded password to ESI register
        mov     ecx, data_password_Len   ; Move hardcoded password LENGTH into ECX register
        repe cmpsb                       ; REPE/REPZ − Used to repeat the given instruction until CX = 0 or zero flag ZF = 1 // CMPSB - (C)o(MP)are (S)tring (B)ytes

        jecxz   f_password_correct       ; JECXZ - Jump to f_password_correct function if ECX is equal to Zero // JECXZ - (J)ump if (ECX) equals (Z)ero

        nop                              ; if the password is wrong, it will fall through jecxz and print 'Wrong! Try again'. and then exit.

    ; Print string 'Wrong! Try again.' string
        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_bad_msg        ; Address of the string
        mov     edx, data_bad_msg_Len    ; Length of the string
        int     0x80                     ; Execute commands in registers

        jmp f_exit                       ; Exit the program

f_password_correct:
    ; Print 'Congratulations' strings
        ; Print title line 1
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_good_msg_1     ; Address of the string
        mov     edx, data_good_msg_Len_1 ; Length of the string
        int     0x80                     ; Execute commands in registers

        ; Print title line 2
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_good_msg_2     ; Address of the string
        mov     edx, data_good_msg_Len_2 ; Length of the string
        int     0x80                     ; Execute commands in registers

        ; Print title line 3
        nop

        mov     eax, 4                   ; Command to write to screen
        mov     ebx, 1                   ; Command stdout
        mov     ecx, data_good_msg_3     ; Address of the string
        mov     edx, data_good_msg_Len_3 ; Length of the string
        int     0x80                     ; Execute commands in registers

        nop

        jmp f_exit                       ; Exit the program

f_exit:
    ; Exit the program
        nop

        mov     eax, 1                   ; Syscall number
        mov     ebx, 0                   ; Arg one: the status (0 is success)
        int     0x80                     ; Execute commands in registers
