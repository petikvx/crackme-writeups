
/tmp/c1/r.exe:     file format pei-i386


Disassembly of section .text:

00401590 <.text+0x590>:
  401590:	25 00 00 00 00       	and    eax,0x0
  401595:	83 ec 0c             	sub    esp,0xc
  401598:	53                   	push   ebx
  401599:	55                   	push   ebp
  40159a:	56                   	push   esi
  40159b:	8b f1                	mov    esi,ecx
  40159d:	57                   	push   edi
  40159e:	68 48 30 40 00       	push   0x403048
  4015a3:	8d 4c 24 14          	lea    ecx,[esp+0x14]
  4015a7:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
  4015ab:	e8 fa 02 00 00       	call   0x4018aa
  4015b0:	6a 01                	push   0x1
  4015b2:	8b ce                	mov    ecx,esi
  4015b4:	c7 44 24 28 00 00 00 	mov    DWORD PTR [esp+0x28],0x0
  4015bb:	00 
  4015bc:	e8 e3 02 00 00       	call   0x4018a4
  4015c1:	8b 7e 60             	mov    edi,DWORD PTR [esi+0x60]
  4015c4:	8b 5f f8             	mov    ebx,DWORD PTR [edi-0x8]
  4015c7:	83 fb 05             	cmp    ebx,0x5
  4015ca:	7c 7e                	jl     0x40164a
  4015cc:	8b 46 64             	mov    eax,DWORD PTR [esi+0x64]
  4015cf:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4015d3:	39 58 f8             	cmp    DWORD PTR [eax-0x8],ebx
  4015d6:	75 72                	jne    0x40164a
  4015d8:	83 fb 14             	cmp    ebx,0x14
  4015db:	7f 6d                	jg     0x40164a
  4015dd:	33 c9                	xor    ecx,ecx
  4015df:	85 db                	test   ebx,ebx
  4015e1:	7e 54                	jle    0x401637
  4015e3:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  4015e7:	8a 04 0f             	mov    al,BYTE PTR [edi+ecx*1]
  4015ea:	0f be 2c 31          	movsx  ebp,BYTE PTR [ecx+esi*1]
  4015ee:	0f be c0             	movsx  eax,al
  4015f1:	99                   	cdq
  4015f2:	f7 fd                	idiv   ebp
  4015f4:	8b c2                	mov    eax,edx
  4015f6:	d1 e0                	shl    eax,1
  4015f8:	83 f8 7b             	cmp    eax,0x7b
  4015fb:	7e 03                	jle    0x401600
  4015fd:	83 e8 1a             	sub    eax,0x1a
  401600:	83 f8 41             	cmp    eax,0x41
  401603:	7d 09                	jge    0x40160e
  401605:	ba 82 00 00 00       	mov    edx,0x82
  40160a:	2b d0                	sub    edx,eax
  40160c:	8b c2                	mov    eax,edx
  40160e:	83 f8 5b             	cmp    eax,0x5b
  401611:	7e 12                	jle    0x401625
  401613:	83 f8 61             	cmp    eax,0x61
  401616:	7d 0d                	jge    0x401625
  401618:	99                   	cdq
  401619:	bd 0a 00 00 00       	mov    ebp,0xa
  40161e:	f7 fd                	idiv   ebp
  401620:	83 c2 30             	add    edx,0x30
  401623:	8b c2                	mov    eax,edx
  401625:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  401629:	38 04 0a             	cmp    BYTE PTR [edx+ecx*1],al
  40162c:	75 1c                	jne    0x40164a
  40162e:	41                   	inc    ecx
  40162f:	3b cb                	cmp    ecx,ebx
  401631:	7c b4                	jl     0x4015e7
  401633:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
  401637:	6a 00                	push   0x0
  401639:	68 34 30 40 00       	push   0x403034
  40163e:	68 20 30 40 00       	push   0x403020
  401643:	8b ce                	mov    ecx,esi
  401645:	e8 54 02 00 00       	call   0x40189e
  40164a:	8d 4c 24 10          	lea    ecx,[esp+0x10]
  40164e:	c7 44 24 24 ff ff ff 	mov    DWORD PTR [esp+0x24],0xffffffff
  401655:	ff 
  401656:	e8 35 01 00 00       	call   0x401790
  40165b:	8b 4c 24 1c          	mov    ecx,DWORD PTR [esp+0x1c]
  40165f:	5f                   	pop    edi
  401660:	5e                   	pop    esi
  401661:	5d                   	pop    ebp
  401662:	5b                   	pop    ebx
  401663:	64                   	fs
  401664:	89                   	.byte 0x89
  401665:	0d                   	.byte 0xd
	...
