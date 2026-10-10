
/tmp/c117/breakme:     file format elf32-i386


Disassembly of section .text:

0804856b <.text+0xfb>:
 804856b:	push   ebp
 804856c:	mov    ebp,esp
 804856e:	sub    esp,0x18
 8048571:	mov    eax,DWORD PTR [ebp+0x14]
 8048574:	mov    BYTE PTR [ebp-0xc],al
 8048577:	mov    ecx,DWORD PTR [ebp+0x10]
 804857a:	mov    edx,DWORD PTR [ebp+0x18]
 804857d:	mov    eax,edx
 804857f:	add    eax,eax
 8048581:	add    eax,edx
 8048583:	cmp    ecx,eax
 8048585:	jne    804858c <ptrace@plt+0x12c>
 8048587:	jmp    80486c1 <ptrace@plt+0x261>
 804858c:	mov    eax,DWORD PTR [ebp+0x10]
 804858f:	mov    edx,DWORD PTR [ebp+0x18]
 8048592:	add    edx,edx
 8048594:	cmp    eax,edx
 8048596:	jae    8048601 <ptrace@plt+0x1a1>
 8048598:	mov    eax,DWORD PTR [ebp+0x10]
 804859b:	cmp    eax,DWORD PTR [ebp+0x18]
 804859e:	jae    80485cc <ptrace@plt+0x16c>
 80485a0:	nop
 80485a1:	mov    edx,DWORD PTR [ebp+0x10]
 80485a4:	mov    eax,DWORD PTR [ebp+0x8]
 80485a7:	add    eax,edx
 80485a9:	movzx  eax,BYTE PTR [eax]
 80485ac:	mov    edx,eax
 80485ae:	movzx  eax,BYTE PTR [ebp-0xc]
 80485b2:	add    eax,0xf
 80485b5:	xor    eax,edx
 80485b7:	mov    BYTE PTR [ebp-0xc],al
 80485ba:	mov    edx,DWORD PTR [ebp+0x10]
 80485bd:	mov    eax,DWORD PTR [ebp+0xc]
 80485c0:	add    eax,edx
 80485c2:	movzx  eax,BYTE PTR [eax]
 80485c5:	cmp    al,BYTE PTR [ebp-0xc]
 80485c8:	je     804863c <ptrace@plt+0x1dc>
 80485ca:	jmp    8048637 <ptrace@plt+0x1d7>
 80485cc:	nop
 80485cd:	mov    eax,DWORD PTR [ebp+0x10]
 80485d0:	mov    edx,0x0
 80485d5:	div    DWORD PTR [ebp+0x18]
 80485d8:	mov    eax,DWORD PTR [ebp+0x8]
 80485db:	add    eax,edx
 80485dd:	movzx  eax,BYTE PTR [eax]
 80485e0:	mov    edx,eax
 80485e2:	mov    eax,0x12
 80485e7:	sub    al,BYTE PTR [ebp-0xc]
 80485ea:	xor    eax,edx
 80485ec:	mov    BYTE PTR [ebp-0xc],al
 80485ef:	mov    edx,DWORD PTR [ebp+0x10]
 80485f2:	mov    eax,DWORD PTR [ebp+0xc]
 80485f5:	add    eax,edx
 80485f7:	movzx  eax,BYTE PTR [eax]
 80485fa:	cmp    al,BYTE PTR [ebp-0xc]
 80485fd:	je     804866c <ptrace@plt+0x20c>
 80485ff:	jmp    804866a <ptrace@plt+0x20a>
 8048601:	nop
 8048602:	mov    eax,DWORD PTR [ebp+0x10]
 8048605:	mov    edx,0x0
 804860a:	div    DWORD PTR [ebp+0x18]
 804860d:	mov    eax,DWORD PTR [ebp+0x8]
 8048610:	add    eax,edx
 8048612:	movzx  eax,BYTE PTR [eax]
 8048615:	mov    edx,eax
 8048617:	movzx  eax,BYTE PTR [ebp-0xc]
 804861b:	sub    eax,0x4c
 804861e:	add    eax,eax
 8048620:	xor    eax,edx
 8048622:	mov    BYTE PTR [ebp-0xc],al
 8048625:	mov    edx,DWORD PTR [ebp+0x10]
 8048628:	mov    eax,DWORD PTR [ebp+0xc]
 804862b:	add    eax,edx
 804862d:	movzx  eax,BYTE PTR [eax]
 8048630:	cmp    al,BYTE PTR [ebp-0xc]
 8048633:	je     80486a0 <ptrace@plt+0x240>
 8048635:	jmp    804869e <ptrace@plt+0x23e>
 8048637:	jmp    80486c8 <ptrace@plt+0x268>
 804863c:	add    DWORD PTR [ebp+0x10],0x1
 8048640:	mov    eax,DWORD PTR [ebp+0x10]
 8048643:	cmp    eax,DWORD PTR [ebp+0x18]
 8048646:	jne    804864c <ptrace@plt+0x1ec>
 8048648:	sub    BYTE PTR [ebp-0xc],0xa
 804864c:	movzx  eax,BYTE PTR [ebp-0xc]
 8048650:	sub    esp,0xc
 8048653:	push   DWORD PTR [ebp+0x18]
 8048656:	push   eax
 8048657:	push   DWORD PTR [ebp+0x10]
 804865a:	push   DWORD PTR [ebp+0xc]
 804865d:	push   DWORD PTR [ebp+0x8]
 8048660:	call   804856b <ptrace@plt+0x10b>
 8048665:	add    esp,0x20
 8048668:	jmp    80486c1 <ptrace@plt+0x261>
 804866a:	jmp    80486c8 <ptrace@plt+0x268>
 804866c:	add    DWORD PTR [ebp+0x10],0x1
 8048670:	mov    eax,DWORD PTR [ebp+0x10]
 8048673:	mov    edx,DWORD PTR [ebp+0x18]
 8048676:	add    edx,edx
 8048678:	cmp    eax,edx
 804867a:	jne    8048680 <ptrace@plt+0x220>
 804867c:	add    BYTE PTR [ebp-0xc],0x71
 8048680:	movzx  eax,BYTE PTR [ebp-0xc]
 8048684:	sub    esp,0xc
 8048687:	push   DWORD PTR [ebp+0x18]
 804868a:	push   eax
 804868b:	push   DWORD PTR [ebp+0x10]
 804868e:	push   DWORD PTR [ebp+0xc]
 8048691:	push   DWORD PTR [ebp+0x8]
 8048694:	call   804856b <ptrace@plt+0x10b>
 8048699:	add    esp,0x20
 804869c:	jmp    80486c1 <ptrace@plt+0x261>
 804869e:	jmp    80486c8 <ptrace@plt+0x268>
 80486a0:	movzx  eax,BYTE PTR [ebp-0xc]
 80486a4:	add    DWORD PTR [ebp+0x10],0x1
 80486a8:	sub    esp,0xc
 80486ab:	push   DWORD PTR [ebp+0x18]
 80486ae:	push   eax
 80486af:	push   DWORD PTR [ebp+0x10]
 80486b2:	push   DWORD PTR [ebp+0xc]
 80486b5:	push   DWORD PTR [ebp+0x8]
 80486b8:	call   804856b <ptrace@plt+0x10b>
 80486bd:	add    esp,0x20
 80486c0:	nop
 80486c1:	mov    eax,0x0
 80486c6:	jmp    80486e2 <ptrace@plt+0x282>
 80486c8:	sub    esp,0xc
 80486cb:	push   0x8048be0
 80486d0:	call   8048400 <puts@plt>
 80486d5:	add    esp,0x10
 80486d8:	sub    esp,0xc
 80486db:	push   0x1
 80486dd:	call   8048420 <exit@plt>
 80486e2:	leave
 80486e3:	ret
