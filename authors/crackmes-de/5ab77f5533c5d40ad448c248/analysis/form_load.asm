  402df3:	56                   	push   esi
  402df4:	ff 93 08 03 00 00    	call   DWORD PTR [ebx+0x308]
  402dfa:	8d 55 e8             	lea    edx,[ebp-0x18]
  402dfd:	50                   	push   eax
  402dfe:	52                   	push   edx
  402dff:	ff 15 e8 40 40 00    	call   DWORD PTR ds:0x4040e8
  402e05:	8b f8                	mov    edi,eax
  402e07:	68 34 1f 40 00       	push   0x401f34
  402e0c:	57                   	push   edi
  402e0d:	8b 07                	mov    eax,DWORD PTR [edi]
  402e0f:	ff 90 a4 00 00 00    	call   DWORD PTR [eax+0xa4]
  402e15:	85 c0                	test   eax,eax
  402e17:	7d 12                	jge    0x402e2b
  402e19:	68 a4 00 00 00       	push   0xa4
  402e1e:	68 24 1e 40 00       	push   0x401e24
  402e23:	57                   	push   edi
  402e24:	50                   	push   eax
  402e25:	ff 15 dc 40 40 00    	call   DWORD PTR ds:0x4040dc
  402e2b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402e2e:	ff 15 58 41 40 00    	call   DWORD PTR ds:0x404158
  402e34:	ba 3c 1f 40 00       	mov    edx,0x401f3c
  402e39:	8d 4e 34             	lea    ecx,[esi+0x34]
  402e3c:	ff 15 30 41 40 00    	call   DWORD PTR ds:0x404130
  402e42:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
