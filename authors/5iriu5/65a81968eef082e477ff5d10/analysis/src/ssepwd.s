.global _start

.text
_start:
        mov $1, %rax
        mov $1, %rdi
        mov $username_prompt, %rsi
        mov $username_prompt_len, %rdx
        syscall

        mov $0, %rax
        mov $0, %rdi
        mov $username, %rsi
        mov $8, %rdx
        syscall

        mov $1, %rax
        mov $1, %rdi
        mov $password_prompt, %rsi
        mov $password_prompt_len, %rdx
        syscall

        mov $0, %rax
        mov $0, %rdi
        mov $password, %rsi
        mov $8, %rdx
        syscall

        movdqu username, %xmm0
        movdqu key, %xmm1
        paddb %xmm1, %xmm0
        movdqu secret, %xmm1
        pcmpeqb %xmm1, %xmm0
        movq %xmm0, %rdi
        movhlps %xmm0, %xmm0
        movq %xmm0, %rsi
        and %rsi, %rdi
        cmp $0xffffffffffffffff, %rdi
        je won

        mov $1, %rax
        mov $1, %rdi
        mov $try_again_msg, %rsi
        mov $try_again_msg_len, %rdx
        syscall
        jmp end

won:
        mov $1, %rax
        mov $1, %rdi
        mov $won_msg, %rsi
        mov $won_msg_len, %rdx
        syscall

end:
        mov $60, %rax
        mov $0, %rdi
        syscall

.data
username_prompt:
        .ascii "username: "
        username_prompt_len = (. - username_prompt)
password_prompt:
        .ascii "password: "
        password_prompt_len = (. - password_prompt)
won_msg: 
        .ascii "hack the planet!\n"
        won_msg_len = (. - won_msg)
try_again_msg:
        .ascii "access denied!\n"
        try_again_msg_len = (. - try_again_msg)
key:
        .ascii "\xd2\x09\x23\x42\xa5\x10\x79\xd5\xfb\xcf\x2a\x16\xc5\xfc\xf6\x92"
secret:
        .ascii "\x42\x75\x84\xa9\x1a\x75\x83\xd5\x62\x3e\x8e\x20\xc5\xfc\xf6\x92"

.bss
        .lcomm username, 8
        .lcomm password, 8
