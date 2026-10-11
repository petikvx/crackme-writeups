
/tmp/x183/Crackme5.exe:     file format pei-i386


Disassembly of section CODE:

004419e8 <CODE+0x409e8>:
  4419e8:	55                   	push   ebp
  4419e9:	8b ec                	mov    ebp,esp
  4419eb:	6a 00                	push   0x0
  4419ed:	6a 00                	push   0x0
  4419ef:	53                   	push   ebx
  4419f0:	8b d8                	mov    ebx,eax
  4419f2:	33 c0                	xor    eax,eax
  4419f4:	55                   	push   ebp
  4419f5:	68 8f 1a 44 00       	push   0x441a8f
  4419fa:	64 ff 30             	push   DWORD PTR fs:[eax]
  4419fd:	64 89 20             	mov    DWORD PTR fs:[eax],esp
  441a00:	8d 55 fc             	lea    edx,[ebp-0x4]
  441a03:	8b 83 c4 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c4]
  441a09:	e8 b6 17 fe ff       	call   0x4231c4
  441a0e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  441a11:	50                   	push   eax
  441a12:	8d 55 f8             	lea    edx,[ebp-0x8]
  441a15:	8b 83 c8 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c8]
  441a1b:	e8 a4 17 fe ff       	call   0x4231c4
  441a20:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  441a23:	58                   	pop    eax
  441a24:	e8 33 21 fc ff       	call   0x403b5c
  441a29:	75 49                	jne    0x441a74
  441a2b:	33 d2                	xor    edx,edx
  441a2d:	8b 83 cc 02 00 00    	mov    eax,DWORD PTR [ebx+0x2cc]
  441a33:	e8 38 f2 ff ff       	call   0x440c70
  441a38:	6a 00                	push   0x0
  441a3a:	8d 55 fc             	lea    edx,[ebp-0x4]
  441a3d:	8b 83 d0 02 00 00    	mov    eax,DWORD PTR [ebx+0x2d0]
  441a43:	e8 7c 17 fe ff       	call   0x4231c4
  441a48:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  441a4b:	66 8b 0d 9c 1a 44 00 	mov    cx,WORD PTR ds:0x441a9c
  441a52:	b2 02                	mov    dl,0x2
  441a54:	e8 27 fb ff ff       	call   0x441580
  441a59:	8d 55 fc             	lea    edx,[ebp-0x4]
  441a5c:	8b 83 d0 02 00 00    	mov    eax,DWORD PTR [ebx+0x2d0]
  441a62:	e8 5d 17 fe ff       	call   0x4231c4
  441a67:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  441a6a:	a1 2c 38 44 00       	mov    eax,ds:0x44382c
  441a6f:	e8 80 17 fe ff       	call   0x4231f4
  441a74:	33 c0                	xor    eax,eax
  441a76:	5a                   	pop    edx
  441a77:	59                   	pop    ecx
  441a78:	59                   	pop    ecx
  441a79:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  441a7c:	68 96 1a 44 00       	push   0x441a96
  441a81:	8d 45 f8             	lea    eax,[ebp-0x8]
  441a84:	ba 02 00 00 00       	mov    edx,0x2
  441a89:	e8 66 1d fc ff       	call   0x4037f4
  441a8e:	c3                   	ret
  441a8f:	e9 fc 17 fc ff       	jmp    0x403290
  441a94:	eb eb                	jmp    0x441a81
  441a96:	5b                   	pop    ebx
  441a97:	59                   	pop    ecx
  441a98:	59                   	pop    ecx
  441a99:	5d                   	pop    ebp
  441a9a:	c3                   	ret
	...
