  404a37:	8b 5d a8             	mov    ebx,DWORD PTR [ebp-0x58]
  404a3a:	8d 45 d0             	lea    eax,[ebp-0x30]
  404a3d:	d9 6d b4             	fldcw  WORD PTR [ebp-0x4c]
  404a40:	df 7d a8             	fistp  QWORD PTR [ebp-0x58]
  404a43:	d9 6d b6             	fldcw  WORD PTR [ebp-0x4a]
  404a46:	89 04 24             	mov    DWORD PTR [esp],eax
  404a49:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  404a4c:	8b 55 a8             	mov    edx,DWORD PTR [ebp-0x58]
  404a4f:	8d 5d d8             	lea    ebx,[ebp-0x28]
  404a52:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  404a56:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
  404a59:	e8 a2 d1 ff ff       	call   401c00 <_gostcrypt>
  404a5e:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  404a62:	8d 55 b8             	lea    edx,[ebp-0x48]
  404a65:	8d 5d c8             	lea    ebx,[ebp-0x38]
  404a68:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404a6c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404a6f:	bb 80 70 40 00       	mov    ebx,0x407080
  404a74:	e8 87 d1 ff ff       	call   401c00 <_gostcrypt>
  404a79:	c7 04 24 40 89 40 00 	mov    DWORD PTR [esp],0x408940
  404a80:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  404a83:	b8 80 70 40 00       	mov    eax,0x407080
  404a88:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404a8c:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  404a90:	e8 8b 0d 00 00       	call   405820 <_sprintf>
  404a95:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  404a99:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  404a9c:	bb 80 70 40 00       	mov    ebx,0x407080
  404aa1:	c7 04 24 a0 86 40 00 	mov    DWORD PTR [esp],0x4086a0
  404aa8:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  404aac:	e8 6f 0d 00 00       	call   405820 <_sprintf>
  404ab1:	c7 04 24 b0 86 40 00 	mov    DWORD PTR [esp],0x4086b0
  404ab8:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  404abb:	b8 80 70 40 00       	mov    eax,0x407080
  404ac0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404ac4:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  404ac8:	e8 53 0d 00 00       	call   405820 <_sprintf>
  404acd:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  404ad1:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  404ad4:	c7 04 24 20 88 40 00 	mov    DWORD PTR [esp],0x408820
  404adb:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  404adf:	e8 3c 0d 00 00       	call   405820 <_sprintf>
  404ae4:	81 c4 14 01 00 00    	add    esp,0x114
  404aea:	5b                   	pop    ebx
  404aeb:	5d                   	pop    ebp
  404aec:	c3                   	ret
