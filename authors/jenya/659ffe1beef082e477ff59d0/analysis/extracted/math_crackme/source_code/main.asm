global _start
section .data
	num1 dq 0
	num2 dq 0
	user_input times 20 db 0
	str1 db "enter first number: "
	str2 db "enter second number: "
	correct db "CORRECT",10
	wrong db "WRONG",10
section .text
_start:
	mov rsi,str1
	mov rbx,20
	call print
	call input
	call convert_to_num
	mov [num1],rdi
	mov rsi,str2
	mov rbx,20
	call print
	call input
	call convert_to_num
	mov [num2],rdi
	call check
	cmp rdi,[num2]
	je correct_answer
	mov rbx,6
	mov rsi,wrong
	call print
	jmp finish
	correct_answer:
	mov rbx,8
	mov rsi,correct
	call print
	finish:
	mov rdi,0
	mov rax,60
	syscall

input:
	xor rax,rax
	xor rdi,rdi
	mov rsi,user_input
	mov rdx,20
	syscall
	ret
print:
	mov rax,1
	mov rdi,1
	mov rdx,rbx
	syscall
	ret
convert_to_num:
	xor rax,rax
	mov rbx,10
	mov rsi,user_input
	run:
		sub byte[rsi],48
		xor rdx,rdx
		mul rbx
		xor rcx,rcx
		mov cl,[rsi]
		add rax,rcx
		inc rsi
		cmp byte[rsi],10
		jne run
	mov rdi,rax
	ret
check:
	mov rax,[num1]
	mov rbx,2
	xor rdx,rdx
	div rbx
	mov rdi,rdx
	
	xor rdx,rdx
	mov rax,[num1]
	mov rbx,3
	div rbx
	mov rbx,rdx
	
	mov rsi,6
	and rdx,1
	mov cl,dl
	shl rbx,cl
	inc rbx
	mov rax,rsi
	xor rdx,rdx
	div rbx
	
	xor rdi,1
	mul rdi
	mov rdi,rax
	
	ret
	
	
	
	
	
	
	
