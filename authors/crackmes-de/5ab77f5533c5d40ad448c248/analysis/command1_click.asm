  4029db:	8b 87 08 03 00 00    	mov    eax,DWORD PTR [edi+0x308]
  4029e1:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
  4029e7:	ff d0                	call   eax
  4029e9:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4029ec:	50                   	push   eax
  4029ed:	51                   	push   ecx
  4029ee:	ff 15 e8 40 40 00    	call   DWORD PTR ds:0x4040e8
  4029f4:	8b d8                	mov    ebx,eax
  4029f6:	8d 45 e8             	lea    eax,[ebp-0x18]
  4029f9:	50                   	push   eax
  4029fa:	53                   	push   ebx
  4029fb:	8b 13                	mov    edx,DWORD PTR [ebx]
  4029fd:	ff 92 a0 00 00 00    	call   DWORD PTR [edx+0xa0]
  402a03:	85 c0                	test   eax,eax
  402a05:	7d 12                	jge    0x402a19
  402a07:	68 a0 00 00 00       	push   0xa0
  402a0c:	68 24 1e 40 00       	push   0x401e24
  402a11:	53                   	push   ebx
  402a12:	50                   	push   eax
  402a13:	ff 15 dc 40 40 00    	call   DWORD PTR ds:0x4040dc
  402a19:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
  402a1c:	8b 56 34             	mov    edx,DWORD PTR [esi+0x34]
  402a1f:	51                   	push   ecx
  402a20:	52                   	push   edx
  402a21:	ff 15 00 41 40 00    	call   DWORD PTR ds:0x404100
  402a27:	8b d8                	mov    ebx,eax
  402a29:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402a2c:	f7 db                	neg    ebx
  402a2e:	1b db                	sbb    ebx,ebx
  402a30:	43                   	inc    ebx
  402a31:	f7 db                	neg    ebx
  402a33:	ff 15 54 41 40 00    	call   DWORD PTR ds:0x404154
  402a39:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402a3c:	ff 15 58 41 40 00    	call   DWORD PTR ds:0x404158
  402a42:	b9 04 00 02 80       	mov    ecx,0x80020004
  402a47:	b8 0a 00 00 00       	mov    eax,0xa
  402a4c:	66 85 db             	test   bx,bx
  402a4f:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  402a52:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  402a55:	89 4d bc             	mov    DWORD PTR [ebp-0x44],ecx
  402a58:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  402a5b:	89 4d cc             	mov    DWORD PTR [ebp-0x34],ecx
  402a5e:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  402a61:	0f 84 40 01 00 00    	je     0x402ba7
