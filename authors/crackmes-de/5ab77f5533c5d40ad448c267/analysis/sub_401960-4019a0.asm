00401960 <.text+0x960>:
  401960:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  401964:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
  401968:	53                   	push   ebx
  401969:	55                   	push   ebp
  40196a:	56                   	push   esi
  40196b:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
  40196f:	57                   	push   edi
  401970:	33 c0                	xor    eax,eax
  401972:	2b f1                	sub    esi,ecx
  401974:	bf 04 00 00 00       	mov    edi,0x4
  401979:	0f be 1c 0e          	movsx  ebx,BYTE PTR [esi+ecx*1]
  40197d:	8b 2a                	mov    ebp,DWORD PTR [edx]
  40197f:	03 c3                	add    eax,ebx
  401981:	0f be 19             	movsx  ebx,BYTE PTR [ecx]
  401984:	03 d8                	add    ebx,eax
  401986:	03 eb                	add    ebp,ebx
  401988:	41                   	inc    ecx
  401989:	4f                   	dec    edi
  40198a:	89 2a                	mov    DWORD PTR [edx],ebp
  40198c:	75 eb                	jne    0x401979
  40198e:	8b 0d 70 85 40 00    	mov    ecx,DWORD PTR ds:0x408570
  401994:	8b f5                	mov    esi,ebp
  401996:	03 f1                	add    esi,ecx
  401998:	5f                   	pop    edi
  401999:	89 32                	mov    DWORD PTR [edx],esi
  40199b:	5e                   	pop    esi
  40199c:	5d                   	pop    ebp
  40199d:	5b                   	pop    ebx
  40199e:	c3                   	ret
  40199f:	90                   	nop
  4019a0:	8a 44 24 04          	mov    al,BYTE PTR [esp+0x4]
  4019a4:	3c 2f                	cmp    al,0x2f
  4019a6:	7e 04                	jle    0x4019ac
  4019a8:	3c 3a                	cmp    al,0x3a
  4019aa:	7c 10                	jl     0x4019bc
  4019ac:	3c 41                	cmp    al,0x41
  4019ae:	7c 04                	jl     0x4019b4
  4019b0:	3c 5a                	cmp    al,0x5a
  4019b2:	7e 08                	jle    0x4019bc
  4019b4:	3c 61                	cmp    al,0x61
  4019b6:	7c 0a                	jl     0x4019c2
  4019b8:	3c 7a                	cmp    al,0x7a
  4019ba:	7f 06                	jg     0x4019c2
  4019bc:	b8 01 00 00 00       	mov    eax,0x1
  4019c1:	c3                   	ret
  4019c2:	33 c0                	xor    eax,eax
  4019c4:	c3                   	ret
