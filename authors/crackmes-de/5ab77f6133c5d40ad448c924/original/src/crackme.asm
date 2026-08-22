format ELF executable

sys_exit	equ	1
sys_fork	equ	2
sys_read	equ	3
sys_write	equ	4
sys_close	equ	6
sys_waitpid	equ	7
sys_pipe	equ	42
sys_brk		equ	45
sys_signal	equ	48
sys_mprotect	equ	125
sys_nanosleep	equ	162
stdin		equ	0
stdout		equ	1
stderr		equ	2

PAGESIZE	equ	4096
PAGEMASK	equ	(not 4095)
LFSR_START	equ	0x3C817A05
ENCR_CODE_LEN	equ	(encr_file.skipfunction-encr_file.startfunction)

entry _start

segment executable

; _noreturn program_end()
program_end:
	mov eax, sys_exit
	xor ebx, ebx
	int 80h

; void write(int fd, char *buf, int count)
; fd in ebx, buf in ecx, count in edx
write:
	mov eax, sys_write
	int 80h
	add ecx, eax
	sub edx, eax
	jnz write
	rep ret

; void print(char *s)
; s should be on the stack
print:
	push ebp
	mov ebp, esp
	push esi
	mov esi, [ebp+8]
	call strlen

	push ebx

	mov edx, eax
	mov ecx, esi
	mov ebx, stdout
	call write

	pop ebx
	pop esi

	leave
	ret

; void printhex(uint x)
; x in edx
printhex:
	push ebp
	mov ebp, esp
	sub esp, 10
	lea ecx, [ebp-2]
	mov word [ecx], 0x000A
	dec ecx
@@:
	mov eax, edx
	and eax, 0xF
	add eax, hex_s
	mov al, [eax]
	mov [ecx], al
	shr edx, 4
	test edx, edx
	jz @f
	dec ecx
	jmp @b
@@:
	push ecx
	call print

	leave
	ret

; void read(int fd, char *buf, int count)
; fd in ebx, buf in ecx, count in edx
read:
	push ecx
.lp:
	mov eax, sys_read
	int 80h
	test eax, eax
	jz .x
	js .x 
	add ecx, eax
	sub edx, eax
	jnz .lp
.x:
	pop eax
	sub eax, ecx
	neg eax
	ret

; void gets(char *s, int max)
; s should be in esi and max in edx
gets:
	push ebp
	mov ebp, esp

	push ebx

	dec edx
	mov ebx, stdin
	mov ecx, esi
	mov eax, sys_read
	int 80h
	
	push esi
	xor al,al
	add esi, edx
	mov [esi], al
	mov ecx, edx
.delloop:
	dec esi
	mov ah, [esi]
	cmp ah, 32
	jae .loopend
	mov [esi], al
.loopend:
	loop .delloop
	
	pop esi
	pop ebx

	leave
	ret

; void* brk(void *addr)
; addr should be in edx
brk:
	push ebx
	mov ebx, edx
	mov eax, sys_brk
	int 80h
	pop ebx
	ret

; void* brk(int bytes)
; bytes should be in edx
; allocates bytes bytes
malloc:
	push edx
	xor edx,edx
	call brk
	pop edx
	push eax
	add edx, eax
	call brk
	pop edx
	cmp eax, edx
	je .null
	mov eax, edx
	ret
.null:
	xor eax, eax
	ret

; int strlen(char *s)
; s should be in esi
; returns the strings length in eax
strlen:
	push edi
	mov edi, esi

	xor al, al
	mov ecx, -1
	repne scasb

	inc ecx
	inc ecx
	neg ecx

	mov eax, ecx

	pop edi
	ret

; int strchr(char *s, char x)
; s should be in esi, x in dl
; returns position of first occurence of x
; in s (or -1 if there is none)
strchr:
	push esi
	test dl, dl
	jz .notfound

	xor ecx, ecx
@@:
	lodsb
	test al, al
	jz .notfound
	inc ecx
	
	cmp al, dl
	je .exit

	jmp @b

.notfound:
	xor ecx, ecx
.exit:
	mov eax, ecx
	dec eax
	pop esi
	ret

; void tolower(char *s)
; s on the stack
tolower:
	mov eax, [esp+4]
@@:
	mov dl, [eax]
	test dl, dl
	jz .exit
	inc eax
	cmp dl, 'A'
	jb @b
	cmp dl, 'Z'
	ja @b
	or dl, 32
	mov [eax-1],dl
	jmp @b
.exit:
	ret


; int rand_shift(int input_entropy)
; input_entropy in ecx
; only least significant bit is used
rand_shift:
	mov edx, [lfsr]
	shr edx, 1
	shl ecx, 31
	or edx, ecx
	mov eax, edx
	and eax, 1
	jz .exit
	xor edx, [poly]
.exit:
	mov [lfsr], edx
	ret

; int rand_shift8(uint8_t c)
; c in al
rand_shift8:
	mov ecx, 8
@@:
	push ecx
	push eax
	mov ecx, eax
	call rand_shift
	pop eax
	pop ecx
	shr al, 1
	loop @b
	ret

checklowalnum:
	push esi
	xor edx, edx
@@:
	lodsb
	test al, al
	jz .exit

	cmp al, '0' ; 48
	jb .incorrect
	cmp al, 'z' ; 122
	ja .incorrect
	cmp al, '9' ; 57
	jbe @b
	cmp al, 'a' ; 97
	jae @b
	jmp .incorrect
.incorrect:
	inc edx
.exit:
	mov eax, edx
	pop esi
	ret

; void sleep(int seconds)
; seconds in edx
sleep:
	push ebp
	mov ebp, esp
	sub esp, 8
	mov [ebp-8], edx
	xor edx,edx
	mov [ebp-4],edx
	lea ebx, [ebp-8]
	xor ecx,ecx
	mov eax, sys_nanosleep
	int 80h
	leave
	ret
	

input_length equ 15
pw_length equ 13

; program entry point
_start:
	nop
	push ebp
	mov ebp, esp

	push password_s
	call print
	add esp,4

	mov edx, input_length
	call malloc
	test eax, eax
	jz .error
	mov [input], eax
	mov esi, eax

	mov edx, input_length 
	call gets


	push dword [input]
	call tolower
	add esp,4

	call strlen
	cmp eax, pw_length
	jne .incorrect
	call checklowalnum
	test eax, eax
	jnz .incorrect

	mov edx, encr_file_end-encr_file+PAGESIZE
	call malloc
	test eax, eax
	jz .error
	mov [newcodeseg], eax
	and eax, PAGEMASK
	add eax, PAGESIZE
	mov [newcode], eax
	mov ecx, encr_file_end-encr_file
	mov esi, encr_file
	mov edi, eax
	rep movsb

	mov ebx, eax
	mov eax, sys_mprotect
	mov ecx, (encr_file_end-encr_file+PAGESIZE) and PAGEMASK
	mov edx, 7
	int 80h
	test eax, eax
	jnz .error

	mov ebx, pipe1
	mov eax, sys_pipe
	int 80h
	test eax, eax
	jnz .error
	mov ebx, pipe2
	mov eax, sys_pipe
	int 80h
	test eax, eax
	jnz .error
	mov ebx, pipe3
	mov eax, sys_pipe
	int 80h
	test eax, eax
	jnz .error

	jmp .fork
.fork:
	db 0x60
	xor ebx, ebx
	mov eax, sys_fork
	int 80h
	test eax, eax
	mov ecx, [newcode]
	jz .child
.parent:
	mov ecx, .parent_f * 2
	xor edx, edx
	mov eax, edx
.confusing_loop:
	not edx
	test edx,edx
	jz @f
	inc eax
	@@:
	loop .confusing_loop
	xchg ecx, eax
.child:
	mov [tmp], ecx
	jmp dword [tmp]
.parent_f:
	; close write end of pipe1
	mov ebx, [pipe1+4]
	mov eax, sys_close
	int 80h

	; close read end of pipe2
	mov ebx, [pipe2]
	mov eax, sys_close
	int 80h

	; write password to pipe2
	mov ebx, [pipe2+4]
	mov ecx, [input]
	mov edx, pw_length
	call write
	
	; wait for child to exit
	push ecx
	mov eax, sys_waitpid
	xor ebx, ebx
	dec ebx
	mov ecx, esp
	xor edx, edx
	int 80h
	pop eax

	test eax, eax
	jnz .error
	
	; read decrypted code from pipe1
	mov ebx, [pipe1]
	mov ecx, [newcode]
	add ecx, encr_file.startfunction-encr_file.start
	mov edx, ENCR_CODE_LEN
	call read
	cmp eax, ENCR_CODE_LEN
	jne .incorrect

	mov [tmp], LFSR_START
	mov ecx, 4
	mov esi, lfsr
	mov edi, tmp
	repe cmpsb
	jnz .incorrect

	; close read end of pipe1
	mov ebx, [pipe1]
	mov eax, sys_close
	int 80h
	; close write end of pipe2
	mov ebx, [pipe2+4]
	mov eax, sys_close
	int 80h

	; copy fds from pipe3 to pipe1
	mov esi, pipe3
	mov edi, pipe1
	mov ecx, 2
	movsd
	movsd

	; fork a second time and call the
	; previously encrypted function
.fork2:
	xor ebx, ebx
	mov eax, sys_fork
	int 80h
	mov [tmp], eax
	test eax, eax
	jnz .parent2

	; close read end of pipe1
	mov ebx, [pipe1]
	mov eax, sys_close
	int 80h

	mov eax, [newcode]
	add eax, encr_file.startfunction-encr_file.start
	;pusha
	;mov edx, [eax]
	;call printhex
	;popa
	call eax
	jmp .exit
.parent2:

	; close write end of pipe1
	mov ebx, [pipe1+4]
	mov eax, sys_close
	int 80h
	
	push ecx
	mov eax, sys_waitpid
	xor ebx, ebx
	dec ebx
	mov ecx, esp
	xor edx, edx
	int 80h
	pop edx
	cmp eax, [tmp]
	jne .incorrect

	; read address from pipe1
	mov ebx, [pipe1]
	mov ecx, output
	mov edx, 4
	call read
	cmp eax, 4
	jne .incorrect

	mov esi, [output]
	call strlen
	cmp eax, incorrect_s_end-incorrect_s
	ja .incorrect
	
	push dword [output]
	call print

	; read address #2 from pipe1
	mov ebx, [pipe1]
	mov ecx, output
	mov edx, 4
	call read
	cmp eax, 4
	jne .incorrect
	
	push dword [output]
	call print

	jmp .exit
.error:
	push error_s
	call print
	jmp .exit
.incorrect:
	push incorrect_s
	call print
.exit:

	leave
	jmp program_end


segment readable

poly dd 0xEDB88320
password_s db "password: ",0
hex_s db "0123456789ABCDEF"
incorrect_s db "in"
correct_s db "correct password!",10,0
incorrect_s_end:
error_s db 10,"error!",10,0

segment readable

encr_file:
include 'crackme.crypt.asm'
encr_file_end:

align 4
dd 0

segment readable writable

lfsr dd LFSR_START

input dd ?
input2 dd ?

newcodeseg dd ?
newcode dd ?

pipe1 dd 2 dup (?)
pipe2 dd 2 dup (?)
pipe3 dd 2 dup (?)

tmp dd ?
output dd ? 
