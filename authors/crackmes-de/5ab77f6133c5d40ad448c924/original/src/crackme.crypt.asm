
.start:
	push ebp
	mov ebp, esp

	; close read end of pipe1
	mov ebx, sys_close
	mov esi, .d_pipes
	lodsd
	xchg eax, ebx
	mov ebx, [ebx]
	int 80h

	; close write end of pipe2
	mov ebx, sys_close
	lodsd
	xchg eax, ebx
	mov ebx, [ebx+4]
	int 80h

	jmp .skipfunction

	dd 0x12345678 ; magic number so i find this section in hex editor :D
.startfunction:
	; check decryption of secret
	mov eax, [newcode]
	mov esi, eax
	add esi, .secret-.start
	push esi
	nop
	add eax, .f_strlen-.start
	call dword [eax]
	cmp eax, .secret_end-.secret-1
	jne .badend

	; write address of correct_s to pipe1
	mov ebx, [.d_pipes]
	mov ebx, [ebx+4]
	nop
	mov ecx, [.s_incorrect]
	inc ecx
	dec ecx
	jmp @f
.secret db "secret code: 62f6sHpFshNh844rTh",10,0
.secret_end:
@@:
	inc ecx
	inc ecx
	mov edi, [newcode]
	mov [edi], ecx
	mov esi, edi
	jmp @f
.f_strlen dd strlen
@@:
	add esi, .secret-.start
	mov [edi+4], esi
	mov ecx, edi
	mov edx, 8
	call [.f_write]
.badend:
	call [.f_end]
	align 4
	dd 0,0,0

.skipfunction:


	mov edx, pw_length+1
	call [.f_malloc]
	jz .exit
	mov [input2], eax

	; read password from pipe2
	mov ebx, [.d_pipes+4]
	mov ebx, [ebx]
	mov ecx, [input2]
	mov edx, pw_length
	call [.f_read]

	; calculate key from password
	mov esi, [input2]
	mov ebx, [input]
	mov ecx, pw_length
@@:
	lodsb
	test al,al
	jz @f
	push ecx
	call [.f_shift8]
	pop ecx
	xchg esi,ebx
	inc esi
	loop @b
@@:

	; calculate position of encrypted code
	mov eax, .startfunction-.start
	mov ecx, [newcode]
	add eax, ecx
	add ecx, .skipfunction-.start

	; decrypt encrypted code
	mov edi, eax
	mov esi, .startfunction
	mov edx, [lfsr]
.decrypt:
	cmp edi, ecx
	jae @f
	lodsd
	xor eax,edx
	stosd

	; show outcome of decryption
	;pusha
	;mov edx, eax
	;call [.f_printhex]
	;popa

	jmp .decrypt
@@:
	
	; read decrypted code from pipe1
	mov ebx, [.d_pipes]
	mov ebx, [ebx+4]
	mov ecx, [newcode]
	add ecx, .startfunction-.start
	mov edx, ENCR_CODE_LEN
	call [.f_write]

	; print LFSR in hex
	;mov edx, [lfsr]
	;call [.f_printhex]
.exit:
	leave
	call dword [.f_end]

.f_print dd print
.f_end dd program_end
.f_write dd write
.f_printhex dd printhex
.f_read dd read
.f_malloc dd malloc
.f_shift8 dd rand_shift8
.d_pipes dd pipe1, pipe2
.d_lfsrstart dd LFSR_START
.s_incorrect dd incorrect_s
