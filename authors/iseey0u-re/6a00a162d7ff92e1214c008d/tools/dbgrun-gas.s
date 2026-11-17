.intel_syntax noprefix
.text
.globl mainCRTStartup
mainCRTStartup:
    sub rsp, 0x58
    call GetCommandLineA
    mov rbx, rax
    cmp byte ptr [rbx], 34
    jne 2f
    inc rbx
1:  cmp byte ptr [rbx], 34
    je 3f
    cmp byte ptr [rbx], 0
    je 4f
    inc rbx
    jmp 1b
3:  inc rbx
    jmp 4f
2:  cmp byte ptr [rbx], 32
    je 4f
    cmp byte ptr [rbx], 0
    je 4f
    inc rbx
    jmp 2b
4:  cmp byte ptr [rbx], 32
    jne 5f
    inc rbx
    jmp 4b
5:  # rbx = child cmdline
    mov ecx, -10
    call GetStdHandle
    mov [rip+sinfo+80], rax
    mov ecx, -11
    call GetStdHandle
    mov [rip+sinfo+88], rax
    mov ecx, -12
    call GetStdHandle
    mov [rip+sinfo+96], rax
    mov dword ptr [rip+sinfo], 104
    mov dword ptr [rip+sinfo+60], 0x100
    xor ecx, ecx
    mov rdx, rbx
    xor r8d, r8d
    xor r9d, r9d
    lea rax, [rip+pinfo]
    mov [rsp+0x48], rax
    lea rax, [rip+sinfo]
    mov [rsp+0x40], rax
    mov qword ptr [rsp+0x38], 0
    mov qword ptr [rsp+0x30], 0
    mov dword ptr [rsp+0x28], 2
    mov dword ptr [rsp+0x20], 1
    call CreateProcessA
    test eax, eax
    jz 9f
6:  lea rcx, [rip+ev]
    mov edx, -1
    call WaitForDebugEvent
    mov eax, [rip+ev]
    mov r8d, 0x10002
    cmp eax, 1
    jne 7f
    mov r8d, 0x80010001
7:  push rax
    sub rsp, 0x28
    mov ecx, [rip+ev+4]
    mov edx, [rip+ev+8]
    call ContinueDebugEvent
    add rsp, 0x28
    pop rax
    cmp eax, 5
    jne 6b
9:  xor ecx, ecx
    call ExitProcess
.data
.balign 16
sinfo: .space 128
pinfo: .space 32
ev: .space 256
