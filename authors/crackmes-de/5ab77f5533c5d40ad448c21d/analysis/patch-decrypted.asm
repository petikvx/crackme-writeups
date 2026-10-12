  40141f:	6a 40                	push   0x40
  401421:	68 14 80 40 00       	push   0x408014
  401426:	68 20 80 40 00       	push   0x408020
  40142b:	a1 34 81 40 00       	mov    eax,ds:0x408134
  401430:	50                   	push   eax
  401431:	ff 15 d8 70 40 00    	call   DWORD PTR ds:0x4070d8
  401437:	6a 00                	push   0x0
  401439:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40143c:	51                   	push   ecx
  40143d:	ff 15 d0 70 40 00    	call   DWORD PTR ds:0x4070d0
  401443:	6a 00                	push   0x0
  401445:	ff 15 d4 70 40 00    	call   DWORD PTR ds:0x4070d4
  40144b:	33 c0                	xor    eax,eax
  40144d:	eb 7a                	jmp    0x4014c9
