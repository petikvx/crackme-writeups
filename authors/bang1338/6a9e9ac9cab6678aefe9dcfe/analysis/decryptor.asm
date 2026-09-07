
original/sar.exe:     file format pei-x86-64


Disassembly of section .text:

00000001400587ff <.text+0x577ff>:
   1400587ff:	85 c0                	test   eax,eax
   140058801:	0f 84 f0 22 00 00    	je     0x14005aaf7
   140058807:	9c                   	pushf
   140058808:	50                   	push   rax
   140058809:	52                   	push   rdx
   14005880a:	48 b8 8d ca ec 44 3b 	movabs rax,0x3659653b44ecca8d
   140058811:	65 59 36 
   140058814:	48 89 c2             	mov    rdx,rax
   140058817:	48 c1 fa 09          	sar    rdx,0x9
   14005881b:	48 c1 f8 04          	sar    rax,0x4
   14005881f:	48 c1 f8 0b          	sar    rax,0xb
   140058823:	48 c1 fa 05          	sar    rdx,0x5
   140058827:	48 c1 f8 0d          	sar    rax,0xd
   14005882b:	48 c1 f8 15          	sar    rax,0x15
   14005882f:	48 c1 fa 04          	sar    rdx,0x4
   140058833:	48 c1 fa 15          	sar    rdx,0x15
   140058837:	48 c1 fa 04          	sar    rdx,0x4
   14005883b:	48 c1 fa 0d          	sar    rdx,0xd
   14005883f:	48 c1 fa 09          	sar    rdx,0x9
   140058843:	48 c1 fa 03          	sar    rdx,0x3
   140058847:	48 c1 f8 04          	sar    rax,0x4
   14005884b:	48 c1 fa 07          	sar    rdx,0x7
   14005884f:	48 c1 f8 1b          	sar    rax,0x1b
   140058853:	48 d1 fa             	sar    rdx,1
   140058856:	48 c1 f8 03          	sar    rax,0x3
   14005885a:	48 c1 fa 0b          	sar    rdx,0xb
   14005885e:	48 c1 f8 1f          	sar    rax,0x1f
   140058862:	48 c1 fa 07          	sar    rdx,0x7
   140058866:	48 c1 f8 15          	sar    rax,0x15
   14005886a:	48 d1 fa             	sar    rdx,1
   14005886d:	48 c1 fa 11          	sar    rdx,0x11
   140058871:	48 c1 fa 05          	sar    rdx,0x5
   140058875:	48 c1 fa 1b          	sar    rdx,0x1b
   140058879:	48 c1 f8 15          	sar    rax,0x15
   14005887d:	48 c1 fa 1b          	sar    rdx,0x1b
   140058881:	48 c1 fa 02          	sar    rdx,0x2
   140058885:	48 c1 fa 11          	sar    rdx,0x11
   140058889:	48 c1 f8 0b          	sar    rax,0xb
   14005888d:	48 c1 f8 1f          	sar    rax,0x1f
   140058891:	48 c1 f8 1f          	sar    rax,0x1f
   140058895:	48 c1 fa 0b          	sar    rdx,0xb
   140058899:	48 c1 f8 0b          	sar    rax,0xb
   14005889d:	48 31 d0             	xor    rax,rdx
   1400588a0:	48 ba 08 7c 7c ad da 	movabs rdx,0x5551bcdaad7c7c08
   1400588a7:	bc 51 55 
   1400588aa:	48 31 d0             	xor    rax,rdx
   1400588ad:	48 c1 f8 3f          	sar    rax,0x3f
   1400588b1:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400588b5:	48 0f af d0          	imul   rdx,rax
   1400588b9:	48 85 d2             	test   rdx,rdx
   1400588bc:	75 0a                	jne    0x1400588c8
   1400588be:	48 c1 e2 28          	shl    rdx,0x28
   1400588c2:	48 8b 04 d4          	mov    rax,QWORD PTR [rsp+rdx*8]
   1400588c6:	eb 11                	jmp    0x1400588d9
   1400588c8:	48 c1 f8 11          	sar    rax,0x11
   1400588cc:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   1400588d3:	01 00 00 
   1400588d6:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1400588d9:	5a                   	pop    rdx
   1400588da:	58                   	pop    rax
   1400588db:	9d                   	popf
   1400588dc:	49 89 ff             	mov    r15,rdi
   1400588df:	49 29 f7             	sub    r15,rsi
   1400588e2:	0f 84 58 06 00 00    	je     0x140058f40
   1400588e8:	9c                   	pushf
   1400588e9:	41 52                	push   r10
   1400588eb:	41 53                	push   r11
   1400588ed:	41 ba df 08 95 18    	mov    r10d,0x189508df
   1400588f3:	45 89 d3             	mov    r11d,r10d
   1400588f6:	41 c1 fb 02          	sar    r11d,0x2
   1400588fa:	41 c1 fa 0d          	sar    r10d,0xd
   1400588fe:	41 d1 fa             	sar    r10d,1
   140058901:	41 c1 fa 03          	sar    r10d,0x3
   140058905:	41 c1 fa 09          	sar    r10d,0x9
   140058909:	41 c1 fb 1f          	sar    r11d,0x1f
   14005890d:	41 c1 fa 02          	sar    r10d,0x2
   140058911:	41 c1 fb 0f          	sar    r11d,0xf
   140058915:	41 d1 fa             	sar    r10d,1
   140058918:	41 c1 fb 11          	sar    r11d,0x11
   14005891c:	41 c1 fb 15          	sar    r11d,0x15
   140058920:	41 c1 fa 08          	sar    r10d,0x8
   140058924:	41 c1 fa 0d          	sar    r10d,0xd
   140058928:	41 c1 fa 15          	sar    r10d,0x15
   14005892c:	41 c1 fb 05          	sar    r11d,0x5
   140058930:	41 c1 fb 11          	sar    r11d,0x11
   140058934:	41 c1 fb 08          	sar    r11d,0x8
   140058938:	41 c1 fa 0b          	sar    r10d,0xb
   14005893c:	41 c1 fa 15          	sar    r10d,0x15
   140058940:	41 c1 fa 05          	sar    r10d,0x5
   140058944:	41 c1 fb 02          	sar    r11d,0x2
   140058948:	41 c1 fb 0f          	sar    r11d,0xf
   14005894c:	41 c1 fb 0f          	sar    r11d,0xf
   140058950:	41 c1 fb 03          	sar    r11d,0x3
   140058954:	41 c1 fa 07          	sar    r10d,0x7
   140058958:	45 31 da             	xor    r10d,r11d
   14005895b:	41 81 f2 1f 2c 26 4a 	xor    r10d,0x4a262c1f
   140058962:	41 c1 fa 1f          	sar    r10d,0x1f
   140058966:	45 89 d3             	mov    r11d,r10d
   140058969:	41 ff c3             	inc    r11d
   14005896c:	41 83 e3 fe          	and    r11d,0xfffffffe
   140058970:	45 85 db             	test   r11d,r11d
   140058973:	75 0a                	jne    0x14005897f
   140058975:	49 c1 e3 2a          	shl    r11,0x2a
   140058979:	46 8b 14 5c          	mov    r10d,DWORD PTR [rsp+r11*2]
   14005897d:	eb 11                	jmp    0x140058990
   14005897f:	41 c1 fa 0d          	sar    r10d,0xd
   140058983:	49 bb 00 00 00 00 00 	movabs r11,0x10000000000
   14005898a:	01 00 00 
   14005898d:	45 8b 13             	mov    r10d,DWORD PTR [r11]
   140058990:	41 5b                	pop    r11
   140058992:	41 5a                	pop    r10
   140058994:	9d                   	popf
   140058995:	b8 72 72 61 73       	mov    eax,0x73617272
   14005899a:	9c                   	pushf
   14005899b:	50                   	push   rax
   14005899c:	52                   	push   rdx
   14005899d:	b8 ce 22 76 15       	mov    eax,0x157622ce
   1400589a2:	89 c2                	mov    edx,eax
   1400589a4:	c1 f8 0d             	sar    eax,0xd
   1400589a7:	c1 fa 08             	sar    edx,0x8
   1400589aa:	d1 f8                	sar    eax,1
   1400589ac:	c1 f8 11             	sar    eax,0x11
   1400589af:	c1 f8 1f             	sar    eax,0x1f
   1400589b2:	c1 f8 04             	sar    eax,0x4
   1400589b5:	c1 f8 11             	sar    eax,0x11
   1400589b8:	c1 f8 07             	sar    eax,0x7
   1400589bb:	c1 f8 15             	sar    eax,0x15
   1400589be:	c1 f8 0d             	sar    eax,0xd
   1400589c1:	d1 f8                	sar    eax,1
   1400589c3:	c1 f8 1f             	sar    eax,0x1f
   1400589c6:	c1 f8 15             	sar    eax,0x15
   1400589c9:	c1 fa 11             	sar    edx,0x11
   1400589cc:	c1 fa 09             	sar    edx,0x9
   1400589cf:	c1 fa 11             	sar    edx,0x11
   1400589d2:	c1 fa 0f             	sar    edx,0xf
   1400589d5:	c1 f8 0b             	sar    eax,0xb
   1400589d8:	c1 f8 05             	sar    eax,0x5
   1400589db:	c1 fa 11             	sar    edx,0x11
   1400589de:	d1 fa                	sar    edx,1
   1400589e0:	c1 f8 04             	sar    eax,0x4
   1400589e3:	c1 f8 02             	sar    eax,0x2
   1400589e6:	c1 f8 07             	sar    eax,0x7
   1400589e9:	d1 f8                	sar    eax,1
   1400589eb:	c1 f8 03             	sar    eax,0x3
   1400589ee:	c1 fa 02             	sar    edx,0x2
   1400589f1:	c1 f8 11             	sar    eax,0x11
   1400589f4:	c1 fa 0b             	sar    edx,0xb
   1400589f7:	c1 fa 0b             	sar    edx,0xb
   1400589fa:	c1 f8 08             	sar    eax,0x8
   1400589fd:	c1 f8 08             	sar    eax,0x8
   140058a00:	c1 fa 08             	sar    edx,0x8
   140058a03:	c1 fa 08             	sar    edx,0x8
   140058a06:	c1 fa 0f             	sar    edx,0xf
   140058a09:	c1 f8 0d             	sar    eax,0xd
   140058a0c:	c1 fa 08             	sar    edx,0x8
   140058a0f:	31 d0                	xor    eax,edx
   140058a11:	35 00 0c 7d 58       	xor    eax,0x587d0c00
   140058a16:	c1 f8 1f             	sar    eax,0x1f
   140058a19:	89 c2                	mov    edx,eax
   140058a1b:	d1 fa                	sar    edx,1
   140058a1d:	31 c2                	xor    edx,eax
   140058a1f:	85 d2                	test   edx,edx
   140058a21:	75 09                	jne    0x140058a2c
   140058a23:	48 c1 e2 26          	shl    rdx,0x26
   140058a27:	8b 04 54             	mov    eax,DWORD PTR [rsp+rdx*2]
   140058a2a:	eb 0f                	jmp    0x140058a3b
   140058a2c:	c1 f8 0d             	sar    eax,0xd
   140058a2f:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   140058a36:	01 00 00 
   140058a39:	8b 02                	mov    eax,DWORD PTR [rdx]
   140058a3b:	5a                   	pop    rdx
   140058a3c:	58                   	pop    rax
   140058a3d:	9d                   	popf
   140058a3e:	31 c9                	xor    ecx,ecx
   140058a40:	9c                   	pushf
   140058a41:	52                   	push   rdx
   140058a42:	56                   	push   rsi
   140058a43:	48 ba 1d b1 4d 5f 8c 	movabs rdx,0x24d0188c5f4db11d
   140058a4a:	18 d0 24 
   140058a4d:	48 89 d6             	mov    rsi,rdx
   140058a50:	48 c1 fe 07          	sar    rsi,0x7
   140058a54:	48 c1 fe 15          	sar    rsi,0x15
   140058a58:	48 c1 fe 02          	sar    rsi,0x2
   140058a5c:	48 c1 fe 05          	sar    rsi,0x5
   140058a60:	48 c1 fe 03          	sar    rsi,0x3
   140058a64:	48 c1 fa 09          	sar    rdx,0x9
   140058a68:	48 c1 fe 1b          	sar    rsi,0x1b
   140058a6c:	48 d1 fa             	sar    rdx,1
   140058a6f:	48 c1 fe 0d          	sar    rsi,0xd
   140058a73:	48 c1 fe 0b          	sar    rsi,0xb
   140058a77:	48 c1 fa 05          	sar    rdx,0x5
   140058a7b:	48 c1 fa 09          	sar    rdx,0x9
   140058a7f:	48 c1 fe 15          	sar    rsi,0x15
   140058a83:	48 d1 fa             	sar    rdx,1
   140058a86:	48 c1 fa 1f          	sar    rdx,0x1f
   140058a8a:	48 c1 fa 07          	sar    rdx,0x7
   140058a8e:	48 c1 fa 03          	sar    rdx,0x3
   140058a92:	48 c1 fa 09          	sar    rdx,0x9
   140058a96:	48 c1 fe 15          	sar    rsi,0x15
   140058a9a:	48 c1 fa 07          	sar    rdx,0x7
   140058a9e:	48 c1 fa 0b          	sar    rdx,0xb
   140058aa2:	48 d1 fa             	sar    rdx,1
   140058aa5:	48 c1 fe 07          	sar    rsi,0x7
   140058aa9:	48 c1 fa 04          	sar    rdx,0x4
   140058aad:	48 c1 fa 03          	sar    rdx,0x3
   140058ab1:	48 c1 fe 09          	sar    rsi,0x9
   140058ab5:	48 c1 fa 11          	sar    rdx,0x11
   140058ab9:	48 c1 fa 1b          	sar    rdx,0x1b
   140058abd:	48 c1 fa 0d          	sar    rdx,0xd
   140058ac1:	48 c1 fe 07          	sar    rsi,0x7
   140058ac5:	48 c1 fe 05          	sar    rsi,0x5
   140058ac9:	48 d1 fa             	sar    rdx,1
   140058acc:	48 c1 fa 0b          	sar    rdx,0xb
   140058ad0:	48 c1 fe 0d          	sar    rsi,0xd
   140058ad4:	48 c1 fe 1f          	sar    rsi,0x1f
   140058ad8:	48 c1 fa 05          	sar    rdx,0x5
   140058adc:	48 31 f2             	xor    rdx,rsi
   140058adf:	48 be da 43 12 9e 87 	movabs rsi,0x18e158879e1243da
   140058ae6:	58 e1 18 
   140058ae9:	48 31 f2             	xor    rdx,rsi
   140058aec:	48 c1 fa 3f          	sar    rdx,0x3f
   140058af0:	48 89 d6             	mov    rsi,rdx
   140058af3:	48 ff c6             	inc    rsi
   140058af6:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
   140058afa:	48 85 f6             	test   rsi,rsi
   140058afd:	75 0a                	jne    0x140058b09
   140058aff:	48 c1 e6 26          	shl    rsi,0x26
   140058b03:	48 8b 14 34          	mov    rdx,QWORD PTR [rsp+rsi*1]
   140058b07:	eb 11                	jmp    0x140058b1a
   140058b09:	48 c1 fa 11          	sar    rdx,0x11
   140058b0d:	48 be 00 00 00 00 00 	movabs rsi,0x10000000000
   140058b14:	01 00 00 
   140058b17:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   140058b1a:	5e                   	pop    rsi
   140058b1b:	5a                   	pop    rdx
   140058b1c:	9d                   	popf
   140058b1d:	89 c2                	mov    edx,eax
   140058b1f:	9c                   	pushf
   140058b20:	51                   	push   rcx
   140058b21:	41 50                	push   r8
   140058b23:	b9 a0 c0 2b 25       	mov    ecx,0x252bc0a0
   140058b28:	41 89 c8             	mov    r8d,ecx
   140058b2b:	41 c1 f8 0b          	sar    r8d,0xb
   140058b2f:	c1 f9 0d             	sar    ecx,0xd
   140058b32:	41 c1 f8 1f          	sar    r8d,0x1f
   140058b36:	41 c1 f8 04          	sar    r8d,0x4
   140058b3a:	41 c1 f8 1f          	sar    r8d,0x1f
   140058b3e:	41 c1 f8 03          	sar    r8d,0x3
   140058b42:	41 c1 f8 0b          	sar    r8d,0xb
   140058b46:	c1 f9 07             	sar    ecx,0x7
   140058b49:	d1 f9                	sar    ecx,1
   140058b4b:	41 c1 f8 0d          	sar    r8d,0xd
   140058b4f:	41 c1 f8 04          	sar    r8d,0x4
   140058b53:	c1 f9 0d             	sar    ecx,0xd
   140058b56:	c1 f9 09             	sar    ecx,0x9
   140058b59:	c1 f9 04             	sar    ecx,0x4
   140058b5c:	d1 f9                	sar    ecx,1
   140058b5e:	c1 f9 0f             	sar    ecx,0xf
   140058b61:	41 c1 f8 15          	sar    r8d,0x15
   140058b65:	41 c1 f8 04          	sar    r8d,0x4
   140058b69:	c1 f9 08             	sar    ecx,0x8
   140058b6c:	41 c1 f8 02          	sar    r8d,0x2
   140058b70:	c1 f9 0d             	sar    ecx,0xd
   140058b73:	c1 f9 05             	sar    ecx,0x5
   140058b76:	c1 f9 04             	sar    ecx,0x4
   140058b79:	c1 f9 0b             	sar    ecx,0xb
   140058b7c:	41 c1 f8 0b          	sar    r8d,0xb
   140058b80:	44 31 c1             	xor    ecx,r8d
   140058b83:	81 f1 32 ab 77 20    	xor    ecx,0x2077ab32
   140058b89:	c1 f9 1f             	sar    ecx,0x1f
   140058b8c:	41 89 c8             	mov    r8d,ecx
   140058b8f:	41 ff c0             	inc    r8d
   140058b92:	41 83 e0 fe          	and    r8d,0xfffffffe
   140058b96:	45 85 c0             	test   r8d,r8d
   140058b99:	75 0a                	jne    0x140058ba5
   140058b9b:	49 c1 e0 2a          	shl    r8,0x2a
   140058b9f:	42 8b 0c 44          	mov    ecx,DWORD PTR [rsp+r8*2]
   140058ba3:	eb 10                	jmp    0x140058bb5
   140058ba5:	c1 f9 0d             	sar    ecx,0xd
   140058ba8:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   140058baf:	01 00 00 
   140058bb2:	41 8b 08             	mov    ecx,DWORD PTR [r8]
   140058bb5:	41 58                	pop    r8
   140058bb7:	59                   	pop    rcx
   140058bb8:	9d                   	popf
   140058bb9:	c1 fa 03             	sar    edx,0x3
   140058bbc:	9c                   	pushf
   140058bbd:	41 50                	push   r8
   140058bbf:	41 51                	push   r9
   140058bc1:	41 b8 48 9f ea 1f    	mov    r8d,0x1fea9f48
   140058bc7:	45 89 c1             	mov    r9d,r8d
   140058bca:	41 c1 f8 11          	sar    r8d,0x11
   140058bce:	41 c1 f8 15          	sar    r8d,0x15
   140058bd2:	41 c1 f9 15          	sar    r9d,0x15
   140058bd6:	41 c1 f8 09          	sar    r8d,0x9
   140058bda:	41 c1 f9 03          	sar    r9d,0x3
   140058bde:	41 c1 f9 0d          	sar    r9d,0xd
   140058be2:	41 c1 f9 02          	sar    r9d,0x2
   140058be6:	41 c1 f9 07          	sar    r9d,0x7
   140058bea:	41 c1 f8 03          	sar    r8d,0x3
   140058bee:	41 c1 f8 05          	sar    r8d,0x5
   140058bf2:	41 c1 f9 08          	sar    r9d,0x8
   140058bf6:	41 c1 f8 11          	sar    r8d,0x11
   140058bfa:	41 c1 f9 05          	sar    r9d,0x5
   140058bfe:	41 c1 f8 0d          	sar    r8d,0xd
   140058c02:	41 c1 f9 15          	sar    r9d,0x15
   140058c06:	41 c1 f8 0b          	sar    r8d,0xb
   140058c0a:	41 c1 f8 11          	sar    r8d,0x11
   140058c0e:	41 c1 f9 05          	sar    r9d,0x5
   140058c12:	41 c1 f8 0f          	sar    r8d,0xf
   140058c16:	41 c1 f9 03          	sar    r9d,0x3
   140058c1a:	41 c1 f9 0d          	sar    r9d,0xd
   140058c1e:	41 c1 f9 1f          	sar    r9d,0x1f
   140058c22:	41 c1 f9 15          	sar    r9d,0x15
   140058c26:	41 c1 f8 03          	sar    r8d,0x3
   140058c2a:	45 31 c8             	xor    r8d,r9d
   140058c2d:	41 81 f0 14 80 01 24 	xor    r8d,0x24018014
   140058c34:	41 c1 f8 1f          	sar    r8d,0x1f
   140058c38:	45 89 c1             	mov    r9d,r8d
   140058c3b:	41 ff c1             	inc    r9d
   140058c3e:	41 83 e1 fe          	and    r9d,0xfffffffe
   140058c42:	45 85 c9             	test   r9d,r9d
   140058c45:	75 0a                	jne    0x140058c51
   140058c47:	49 c1 e1 28          	shl    r9,0x28
   140058c4b:	46 8b 04 0c          	mov    r8d,DWORD PTR [rsp+r9*1]
   140058c4f:	eb 11                	jmp    0x140058c62
   140058c51:	41 c1 f8 0d          	sar    r8d,0xd
   140058c55:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   140058c5c:	01 00 00 
   140058c5f:	45 8b 01             	mov    r8d,DWORD PTR [r9]
   140058c62:	41 59                	pop    r9
   140058c64:	41 58                	pop    r8
   140058c66:	9d                   	popf
   140058c67:	c1 e0 05             	shl    eax,0x5
   140058c6a:	9c                   	pushf
   140058c6b:	41 52                	push   r10
   140058c6d:	41 53                	push   r11
   140058c6f:	41 ba 25 a3 39 39    	mov    r10d,0x3939a325
   140058c75:	45 89 d3             	mov    r11d,r10d
   140058c78:	41 d1 fa             	sar    r10d,1
   140058c7b:	41 c1 fb 04          	sar    r11d,0x4
   140058c7f:	41 c1 fb 0f          	sar    r11d,0xf
   140058c83:	41 c1 fb 0d          	sar    r11d,0xd
   140058c87:	41 c1 fb 1f          	sar    r11d,0x1f
   140058c8b:	41 c1 fb 0f          	sar    r11d,0xf
   140058c8f:	41 c1 fa 07          	sar    r10d,0x7
   140058c93:	41 d1 fa             	sar    r10d,1
   140058c96:	41 c1 fb 08          	sar    r11d,0x8
   140058c9a:	41 c1 fa 03          	sar    r10d,0x3
   140058c9e:	41 c1 fa 07          	sar    r10d,0x7
   140058ca2:	41 d1 fb             	sar    r11d,1
   140058ca5:	41 c1 fa 08          	sar    r10d,0x8
   140058ca9:	41 c1 fb 05          	sar    r11d,0x5
   140058cad:	41 c1 fa 1f          	sar    r10d,0x1f
   140058cb1:	41 d1 fa             	sar    r10d,1
   140058cb4:	41 c1 fa 0b          	sar    r10d,0xb
   140058cb8:	41 c1 fa 03          	sar    r10d,0x3
   140058cbc:	41 c1 fa 08          	sar    r10d,0x8
   140058cc0:	41 c1 fa 0d          	sar    r10d,0xd
   140058cc4:	41 c1 fb 1f          	sar    r11d,0x1f
   140058cc8:	41 c1 fb 0f          	sar    r11d,0xf
   140058ccc:	41 c1 fa 03          	sar    r10d,0x3
   140058cd0:	41 c1 fb 11          	sar    r11d,0x11
   140058cd4:	41 c1 fb 1f          	sar    r11d,0x1f
   140058cd8:	41 c1 fa 04          	sar    r10d,0x4
   140058cdc:	41 c1 fa 0b          	sar    r10d,0xb
   140058ce0:	41 c1 fb 04          	sar    r11d,0x4
   140058ce4:	41 c1 fa 02          	sar    r10d,0x2
   140058ce8:	41 c1 fa 02          	sar    r10d,0x2
   140058cec:	41 c1 fa 04          	sar    r10d,0x4
   140058cf0:	41 c1 fa 09          	sar    r10d,0x9
   140058cf4:	41 c1 fa 1f          	sar    r10d,0x1f
   140058cf8:	45 31 da             	xor    r10d,r11d
   140058cfb:	41 81 f2 e0 df 6b 7c 	xor    r10d,0x7c6bdfe0
   140058d02:	41 c1 fa 1f          	sar    r10d,0x1f
   140058d06:	45 8d 5a 01          	lea    r11d,[r10+0x1]
   140058d0a:	45 0f af da          	imul   r11d,r10d
   140058d0e:	45 85 db             	test   r11d,r11d
   140058d11:	75 0a                	jne    0x140058d1d
   140058d13:	49 c1 e3 28          	shl    r11,0x28
   140058d17:	46 8b 14 5c          	mov    r10d,DWORD PTR [rsp+r11*2]
   140058d1b:	eb 11                	jmp    0x140058d2e
   140058d1d:	41 c1 fa 0d          	sar    r10d,0xd
   140058d21:	49 bb 00 00 00 00 00 	movabs r11,0x10000000000
   140058d28:	01 00 00 
   140058d2b:	45 8b 13             	mov    r10d,DWORD PTR [r11]
   140058d2e:	41 5b                	pop    r11
   140058d30:	41 5a                	pop    r10
   140058d32:	9d                   	popf
   140058d33:	31 d0                	xor    eax,edx
   140058d35:	9c                   	pushf
   140058d36:	50                   	push   rax
   140058d37:	52                   	push   rdx
   140058d38:	b8 73 aa 63 6e       	mov    eax,0x6e63aa73
   140058d3d:	89 c2                	mov    edx,eax
   140058d3f:	c1 fa 08             	sar    edx,0x8
   140058d42:	c1 fa 02             	sar    edx,0x2
   140058d45:	d1 fa                	sar    edx,1
   140058d47:	c1 f8 0b             	sar    eax,0xb
   140058d4a:	c1 f8 03             	sar    eax,0x3
   140058d4d:	d1 fa                	sar    edx,1
   140058d4f:	c1 fa 04             	sar    edx,0x4
   140058d52:	d1 fa                	sar    edx,1
   140058d54:	c1 f8 0f             	sar    eax,0xf
   140058d57:	c1 f8 0f             	sar    eax,0xf
   140058d5a:	c1 f8 15             	sar    eax,0x15
   140058d5d:	c1 fa 0f             	sar    edx,0xf
   140058d60:	c1 f8 02             	sar    eax,0x2
   140058d63:	c1 f8 02             	sar    eax,0x2
   140058d66:	c1 fa 15             	sar    edx,0x15
   140058d69:	c1 f8 11             	sar    eax,0x11
   140058d6c:	c1 fa 11             	sar    edx,0x11
   140058d6f:	c1 f8 1f             	sar    eax,0x1f
   140058d72:	d1 fa                	sar    edx,1
   140058d74:	c1 f8 02             	sar    eax,0x2
   140058d77:	c1 f8 1f             	sar    eax,0x1f
   140058d7a:	c1 f8 05             	sar    eax,0x5
   140058d7d:	c1 f8 0d             	sar    eax,0xd
   140058d80:	c1 f8 02             	sar    eax,0x2
   140058d83:	31 d0                	xor    eax,edx
   140058d85:	35 1f 6a e9 3d       	xor    eax,0x3de96a1f
   140058d8a:	c1 f8 1f             	sar    eax,0x1f
   140058d8d:	8d 50 01             	lea    edx,[rax+0x1]
   140058d90:	0f af d0             	imul   edx,eax
   140058d93:	85 d2                	test   edx,edx
   140058d95:	75 09                	jne    0x140058da0
   140058d97:	48 c1 e2 2a          	shl    rdx,0x2a
   140058d9b:	8b 04 14             	mov    eax,DWORD PTR [rsp+rdx*1]
   140058d9e:	eb 0f                	jmp    0x140058daf
   140058da0:	c1 f8 0d             	sar    eax,0xd
   140058da3:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   140058daa:	01 00 00 
   140058dad:	8b 02                	mov    eax,DWORD PTR [rdx]
   140058daf:	5a                   	pop    rdx
   140058db0:	58                   	pop    rax
   140058db1:	9d                   	popf
   140058db2:	35 9d 00 00 00       	xor    eax,0x9d
   140058db7:	9c                   	pushf
   140058db8:	57                   	push   rdi
   140058db9:	53                   	push   rbx
   140058dba:	bf a9 d0 3f 5b       	mov    edi,0x5b3fd0a9
   140058dbf:	89 fb                	mov    ebx,edi
   140058dc1:	c1 fb 03             	sar    ebx,0x3
   140058dc4:	d1 fb                	sar    ebx,1
   140058dc6:	c1 fb 11             	sar    ebx,0x11
   140058dc9:	c1 fb 08             	sar    ebx,0x8
   140058dcc:	c1 ff 0d             	sar    edi,0xd
   140058dcf:	c1 fb 09             	sar    ebx,0x9
   140058dd2:	c1 fb 08             	sar    ebx,0x8
   140058dd5:	c1 ff 08             	sar    edi,0x8
   140058dd8:	c1 fb 07             	sar    ebx,0x7
   140058ddb:	c1 fb 08             	sar    ebx,0x8
   140058dde:	c1 ff 15             	sar    edi,0x15
   140058de1:	c1 fb 08             	sar    ebx,0x8
   140058de4:	c1 ff 07             	sar    edi,0x7
   140058de7:	c1 fb 1f             	sar    ebx,0x1f
   140058dea:	c1 fb 05             	sar    ebx,0x5
   140058ded:	c1 fb 05             	sar    ebx,0x5
   140058df0:	c1 fb 0b             	sar    ebx,0xb
   140058df3:	c1 fb 05             	sar    ebx,0x5
   140058df6:	c1 fb 02             	sar    ebx,0x2
   140058df9:	c1 ff 0f             	sar    edi,0xf
   140058dfc:	c1 ff 15             	sar    edi,0x15
   140058dff:	c1 fb 05             	sar    ebx,0x5
   140058e02:	c1 fb 04             	sar    ebx,0x4
   140058e05:	c1 fb 0f             	sar    ebx,0xf
   140058e08:	c1 ff 0f             	sar    edi,0xf
   140058e0b:	c1 ff 02             	sar    edi,0x2
   140058e0e:	c1 ff 08             	sar    edi,0x8
   140058e11:	c1 fb 03             	sar    ebx,0x3
   140058e14:	c1 fb 0f             	sar    ebx,0xf
   140058e17:	c1 ff 11             	sar    edi,0x11
   140058e1a:	c1 fb 15             	sar    ebx,0x15
   140058e1d:	c1 ff 0b             	sar    edi,0xb
   140058e20:	c1 ff 11             	sar    edi,0x11
   140058e23:	c1 ff 0b             	sar    edi,0xb
   140058e26:	c1 ff 1f             	sar    edi,0x1f
   140058e29:	c1 fb 03             	sar    ebx,0x3
   140058e2c:	31 df                	xor    edi,ebx
   140058e2e:	81 f7 8b 56 68 33    	xor    edi,0x3368568b
   140058e34:	c1 ff 1f             	sar    edi,0x1f
   140058e37:	89 fb                	mov    ebx,edi
   140058e39:	ff c3                	inc    ebx
   140058e3b:	83 e3 fe             	and    ebx,0xfffffffe
   140058e3e:	85 db                	test   ebx,ebx
   140058e40:	75 09                	jne    0x140058e4b
   140058e42:	48 c1 cb 20          	ror    rbx,0x20
   140058e46:	8b 3c 1c             	mov    edi,DWORD PTR [rsp+rbx*1]
   140058e49:	eb 0f                	jmp    0x140058e5a
   140058e4b:	c1 ff 0d             	sar    edi,0xd
   140058e4e:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   140058e55:	01 00 00 
   140058e58:	8b 3b                	mov    edi,DWORD PTR [rbx]
   140058e5a:	5b                   	pop    rbx
   140058e5b:	5f                   	pop    rdi
   140058e5c:	9d                   	popf
   140058e5d:	30 04 31             	xor    BYTE PTR [rcx+rsi*1],al
   140058e60:	9c                   	pushf
   140058e61:	41 51                	push   r9
   140058e63:	41 52                	push   r10
   140058e65:	41 b9 97 be e4 3d    	mov    r9d,0x3de4be97
   140058e6b:	45 89 ca             	mov    r10d,r9d
   140058e6e:	41 c1 fa 02          	sar    r10d,0x2
   140058e72:	41 c1 f9 0b          	sar    r9d,0xb
   140058e76:	41 c1 f9 15          	sar    r9d,0x15
   140058e7a:	41 c1 fa 04          	sar    r10d,0x4
   140058e7e:	41 c1 fa 11          	sar    r10d,0x11
   140058e82:	41 c1 fa 07          	sar    r10d,0x7
   140058e86:	41 c1 f9 0f          	sar    r9d,0xf
   140058e8a:	41 c1 fa 05          	sar    r10d,0x5
   140058e8e:	41 c1 fa 02          	sar    r10d,0x2
   140058e92:	41 c1 fa 07          	sar    r10d,0x7
   140058e96:	41 c1 fa 05          	sar    r10d,0x5
   140058e9a:	41 c1 fa 08          	sar    r10d,0x8
   140058e9e:	41 c1 fa 03          	sar    r10d,0x3
   140058ea2:	41 c1 f9 0f          	sar    r9d,0xf
   140058ea6:	41 c1 f9 07          	sar    r9d,0x7
   140058eaa:	41 c1 fa 0f          	sar    r10d,0xf
   140058eae:	41 c1 f9 08          	sar    r9d,0x8
   140058eb2:	41 c1 f9 03          	sar    r9d,0x3
   140058eb6:	41 c1 fa 0f          	sar    r10d,0xf
   140058eba:	41 c1 f9 11          	sar    r9d,0x11
   140058ebe:	41 d1 fa             	sar    r10d,1
   140058ec1:	41 d1 fa             	sar    r10d,1
   140058ec4:	41 d1 fa             	sar    r10d,1
   140058ec7:	41 c1 fa 05          	sar    r10d,0x5
   140058ecb:	41 c1 fa 09          	sar    r10d,0x9
   140058ecf:	41 c1 f9 08          	sar    r9d,0x8
   140058ed3:	41 c1 fa 11          	sar    r10d,0x11
   140058ed7:	41 c1 fa 02          	sar    r10d,0x2
   140058edb:	41 c1 f9 02          	sar    r9d,0x2
   140058edf:	41 c1 fa 04          	sar    r10d,0x4
   140058ee3:	41 c1 fa 08          	sar    r10d,0x8
   140058ee7:	41 c1 fa 15          	sar    r10d,0x15
   140058eeb:	41 c1 fa 02          	sar    r10d,0x2
   140058eef:	41 c1 fa 03          	sar    r10d,0x3
   140058ef3:	41 c1 fa 05          	sar    r10d,0x5
   140058ef7:	45 31 d1             	xor    r9d,r10d
   140058efa:	41 81 f1 dc a0 12 19 	xor    r9d,0x1912a0dc
   140058f01:	41 c1 f9 1f          	sar    r9d,0x1f
   140058f05:	45 89 ca             	mov    r10d,r9d
   140058f08:	41 ff c2             	inc    r10d
   140058f0b:	41 83 e2 fe          	and    r10d,0xfffffffe
   140058f0f:	45 85 d2             	test   r10d,r10d
   140058f12:	75 0a                	jne    0x140058f1e
   140058f14:	49 c1 ca 20          	ror    r10,0x20
   140058f18:	46 8b 0c 14          	mov    r9d,DWORD PTR [rsp+r10*1]
   140058f1c:	eb 11                	jmp    0x140058f2f
   140058f1e:	41 c1 f9 0d          	sar    r9d,0xd
   140058f22:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   140058f29:	01 00 00 
   140058f2c:	45 8b 0a             	mov    r9d,DWORD PTR [r10]
   140058f2f:	41 5a                	pop    r10
   140058f31:	41 59                	pop    r9
   140058f33:	9d                   	popf
   140058f34:	48 ff c1             	inc    rcx
   140058f37:	49 39 cf             	cmp    r15,rcx
   140058f3a:	0f 85 00 fb ff ff    	jne    0x140058a40
   140058f40:	9c                   	pushf
   140058f41:	41 52                	push   r10
   140058f43:	41 53                	push   r11
   140058f45:	41 ba 06 15 9a 12    	mov    r10d,0x129a1506
   140058f4b:	45 89 d3             	mov    r11d,r10d
   140058f4e:	41 c1 fa 07          	sar    r10d,0x7
   140058f52:	41 c1 fa 11          	sar    r10d,0x11
   140058f56:	41 c1 fa 05          	sar    r10d,0x5
   140058f5a:	41 c1 fb 0f          	sar    r11d,0xf
   140058f5e:	41 c1 fa 07          	sar    r10d,0x7
   140058f62:	41 c1 fb 09          	sar    r11d,0x9
   140058f66:	41 d1 fb             	sar    r11d,1
   140058f69:	41 c1 fa 04          	sar    r10d,0x4
   140058f6d:	41 c1 fa 04          	sar    r10d,0x4
   140058f71:	41 c1 fb 0d          	sar    r11d,0xd
   140058f75:	41 c1 fa 15          	sar    r10d,0x15
   140058f79:	41 c1 fa 05          	sar    r10d,0x5
   140058f7d:	41 c1 fa 07          	sar    r10d,0x7
   140058f81:	41 c1 fb 03          	sar    r11d,0x3
   140058f85:	41 d1 fb             	sar    r11d,1
   140058f88:	41 c1 fb 0f          	sar    r11d,0xf
   140058f8c:	41 c1 fb 04          	sar    r11d,0x4
   140058f90:	41 c1 fa 07          	sar    r10d,0x7
   140058f94:	41 c1 fa 15          	sar    r10d,0x15
   140058f98:	41 c1 fb 08          	sar    r11d,0x8
   140058f9c:	41 c1 fb 05          	sar    r11d,0x5
   140058fa0:	41 d1 fa             	sar    r10d,1
   140058fa3:	41 c1 fa 0b          	sar    r10d,0xb
   140058fa7:	41 c1 fa 03          	sar    r10d,0x3
   140058fab:	41 c1 fb 15          	sar    r11d,0x15
   140058faf:	41 c1 fb 05          	sar    r11d,0x5
   140058fb3:	45 31 da             	xor    r10d,r11d
   140058fb6:	41 81 f2 21 72 29 7d 	xor    r10d,0x7d297221
   140058fbd:	41 c1 fa 1f          	sar    r10d,0x1f
   140058fc1:	45 8d 5a 01          	lea    r11d,[r10+0x1]
   140058fc5:	45 0f af da          	imul   r11d,r10d
   140058fc9:	45 85 db             	test   r11d,r11d
   140058fcc:	75 09                	jne    0x140058fd7
   140058fce:	49 0f cb             	bswap  r11
   140058fd1:	46 8b 14 1c          	mov    r10d,DWORD PTR [rsp+r11*1]
   140058fd5:	eb 11                	jmp    0x140058fe8
   140058fd7:	41 c1 fa 0d          	sar    r10d,0xd
   140058fdb:	49 bb 00 00 00 00 00 	movabs r11,0x10000000000
   140058fe2:	01 00 00 
   140058fe5:	45 8b 13             	mov    r10d,DWORD PTR [r11]
   140058fe8:	41 5b                	pop    r11
   140058fea:	41 5a                	pop    r10
   140058fec:	9d                   	popf
   140058fed:	4d 8b 6c 24 28       	mov    r13,QWORD PTR [r12+0x28]
   140058ff2:	9c                   	pushf
   140058ff3:	41 50                	push   r8
   140058ff5:	41 51                	push   r9
   140058ff7:	41 b8 f3 00 9f 7e    	mov    r8d,0x7e9f00f3
   140058ffd:	45 89 c1             	mov    r9d,r8d
   140059000:	41 c1 f9 02          	sar    r9d,0x2
   140059004:	41 c1 f8 0f          	sar    r8d,0xf
   140059008:	41 c1 f8 02          	sar    r8d,0x2
   14005900c:	41 c1 f9 0f          	sar    r9d,0xf
   140059010:	41 c1 f8 0f          	sar    r8d,0xf
   140059014:	41 c1 f9 0f          	sar    r9d,0xf
   140059018:	41 c1 f8 11          	sar    r8d,0x11
   14005901c:	41 c1 f9 04          	sar    r9d,0x4
   140059020:	41 c1 f9 0d          	sar    r9d,0xd
   140059024:	41 c1 f8 1f          	sar    r8d,0x1f
   140059028:	41 c1 f8 0b          	sar    r8d,0xb
   14005902c:	41 c1 f9 15          	sar    r9d,0x15
   140059030:	41 c1 f9 05          	sar    r9d,0x5
   140059034:	41 c1 f8 04          	sar    r8d,0x4
   140059038:	41 c1 f9 0b          	sar    r9d,0xb
   14005903c:	41 c1 f8 02          	sar    r8d,0x2
   140059040:	41 c1 f9 07          	sar    r9d,0x7
   140059044:	41 c1 f8 09          	sar    r8d,0x9
   140059048:	41 c1 f8 07          	sar    r8d,0x7
   14005904c:	41 c1 f9 1f          	sar    r9d,0x1f
   140059050:	41 c1 f9 05          	sar    r9d,0x5
   140059054:	41 c1 f8 09          	sar    r8d,0x9
   140059058:	41 c1 f9 0f          	sar    r9d,0xf
   14005905c:	41 c1 f8 0f          	sar    r8d,0xf
   140059060:	41 c1 f8 0d          	sar    r8d,0xd
   140059064:	41 d1 f8             	sar    r8d,1
   140059067:	41 c1 f9 0b          	sar    r9d,0xb
   14005906b:	41 d1 f9             	sar    r9d,1
   14005906e:	41 d1 f9             	sar    r9d,1
   140059071:	41 c1 f8 07          	sar    r8d,0x7
   140059075:	41 c1 f8 08          	sar    r8d,0x8
   140059079:	41 c1 f8 07          	sar    r8d,0x7
   14005907d:	41 c1 f9 15          	sar    r9d,0x15
   140059081:	41 c1 f9 0b          	sar    r9d,0xb
   140059085:	41 d1 f9             	sar    r9d,1
   140059088:	41 c1 f9 04          	sar    r9d,0x4
   14005908c:	45 31 c8             	xor    r8d,r9d
   14005908f:	41 81 f0 b2 eb 72 5c 	xor    r8d,0x5c72ebb2
   140059096:	41 c1 f8 1f          	sar    r8d,0x1f
   14005909a:	45 89 c1             	mov    r9d,r8d
   14005909d:	41 ff c1             	inc    r9d
   1400590a0:	41 83 e1 fe          	and    r9d,0xfffffffe
   1400590a4:	45 85 c9             	test   r9d,r9d
   1400590a7:	75 0a                	jne    0x1400590b3
   1400590a9:	49 c1 e1 26          	shl    r9,0x26
   1400590ad:	46 8b 04 4c          	mov    r8d,DWORD PTR [rsp+r9*2]
   1400590b1:	eb 11                	jmp    0x1400590c4
   1400590b3:	41 c1 f8 0d          	sar    r8d,0xd
   1400590b7:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   1400590be:	01 00 00 
   1400590c1:	45 8b 01             	mov    r8d,DWORD PTR [r9]
   1400590c4:	41 59                	pop    r9
   1400590c6:	41 58                	pop    r8
   1400590c8:	9d                   	popf
   1400590c9:	41 ff 54 24 30       	call   QWORD PTR [r12+0x30]
   1400590ce:	9c                   	pushf
   1400590cf:	51                   	push   rcx
   1400590d0:	41 50                	push   r8
   1400590d2:	b9 2d af b7 6f       	mov    ecx,0x6fb7af2d
   1400590d7:	41 89 c8             	mov    r8d,ecx
   1400590da:	c1 f9 05             	sar    ecx,0x5
   1400590dd:	41 c1 f8 11          	sar    r8d,0x11
   1400590e1:	41 c1 f8 15          	sar    r8d,0x15
   1400590e5:	c1 f9 03             	sar    ecx,0x3
   1400590e8:	c1 f9 04             	sar    ecx,0x4
   1400590eb:	c1 f9 0f             	sar    ecx,0xf
   1400590ee:	41 c1 f8 1f          	sar    r8d,0x1f
   1400590f2:	c1 f9 05             	sar    ecx,0x5
   1400590f5:	c1 f9 11             	sar    ecx,0x11
   1400590f8:	c1 f9 0d             	sar    ecx,0xd
   1400590fb:	c1 f9 11             	sar    ecx,0x11
   1400590fe:	d1 f9                	sar    ecx,1
   140059100:	c1 f9 02             	sar    ecx,0x2
   140059103:	c1 f9 04             	sar    ecx,0x4
   140059106:	c1 f9 15             	sar    ecx,0x15
   140059109:	41 c1 f8 03          	sar    r8d,0x3
   14005910d:	c1 f9 08             	sar    ecx,0x8
   140059110:	41 c1 f8 1f          	sar    r8d,0x1f
   140059114:	c1 f9 03             	sar    ecx,0x3
   140059117:	c1 f9 11             	sar    ecx,0x11
   14005911a:	c1 f9 02             	sar    ecx,0x2
   14005911d:	41 c1 f8 0d          	sar    r8d,0xd
   140059121:	41 c1 f8 02          	sar    r8d,0x2
   140059125:	c1 f9 0f             	sar    ecx,0xf
   140059128:	41 c1 f8 04          	sar    r8d,0x4
   14005912c:	c1 f9 05             	sar    ecx,0x5
   14005912f:	c1 f9 05             	sar    ecx,0x5
   140059132:	c1 f9 04             	sar    ecx,0x4
   140059135:	c1 f9 04             	sar    ecx,0x4
   140059138:	c1 f9 15             	sar    ecx,0x15
   14005913b:	41 c1 f8 09          	sar    r8d,0x9
   14005913f:	41 c1 f8 08          	sar    r8d,0x8
   140059143:	44 31 c1             	xor    ecx,r8d
   140059146:	81 f1 37 fd 38 51    	xor    ecx,0x5138fd37
   14005914c:	c1 f9 1f             	sar    ecx,0x1f
   14005914f:	44 8d 41 01          	lea    r8d,[rcx+0x1]
   140059153:	44 0f af c1          	imul   r8d,ecx
   140059157:	45 85 c0             	test   r8d,r8d
   14005915a:	75 0a                	jne    0x140059166
   14005915c:	49 c1 e0 26          	shl    r8,0x26
   140059160:	42 8b 0c 04          	mov    ecx,DWORD PTR [rsp+r8*1]
   140059164:	eb 10                	jmp    0x140059176
   140059166:	c1 f9 0d             	sar    ecx,0xd
   140059169:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   140059170:	01 00 00 
   140059173:	41 8b 08             	mov    ecx,DWORD PTR [r8]
   140059176:	41 58                	pop    r8
   140059178:	59                   	pop    rcx
   140059179:	9d                   	popf
   14005917a:	48 89 c1             	mov    rcx,rax
   14005917d:	9c                   	pushf
   14005917e:	52                   	push   rdx
   14005917f:	56                   	push   rsi
   140059180:	ba d9 40 50 79       	mov    edx,0x795040d9
   140059185:	89 d6                	mov    esi,edx
   140059187:	c1 fe 09             	sar    esi,0x9
   14005918a:	c1 fa 1f             	sar    edx,0x1f
   14005918d:	c1 fe 03             	sar    esi,0x3
   140059190:	c1 fe 04             	sar    esi,0x4
   140059193:	c1 fe 08             	sar    esi,0x8
   140059196:	c1 fa 07             	sar    edx,0x7
   140059199:	c1 fe 1f             	sar    esi,0x1f
   14005919c:	c1 fe 09             	sar    esi,0x9
   14005919f:	c1 fa 15             	sar    edx,0x15
   1400591a2:	d1 fa                	sar    edx,1
   1400591a4:	c1 fa 04             	sar    edx,0x4
   1400591a7:	c1 fe 04             	sar    esi,0x4
   1400591aa:	c1 fa 11             	sar    edx,0x11
   1400591ad:	c1 fa 0f             	sar    edx,0xf
   1400591b0:	c1 fa 07             	sar    edx,0x7
   1400591b3:	c1 fa 09             	sar    edx,0x9
   1400591b6:	c1 fa 03             	sar    edx,0x3
   1400591b9:	c1 fa 04             	sar    edx,0x4
   1400591bc:	c1 fa 08             	sar    edx,0x8
   1400591bf:	c1 fe 07             	sar    esi,0x7
   1400591c2:	c1 fe 11             	sar    esi,0x11
   1400591c5:	c1 fe 11             	sar    esi,0x11
   1400591c8:	c1 fe 03             	sar    esi,0x3
   1400591cb:	c1 fe 02             	sar    esi,0x2
   1400591ce:	31 f2                	xor    edx,esi
   1400591d0:	81 f2 87 1a a0 75    	xor    edx,0x75a01a87
   1400591d6:	c1 fa 1f             	sar    edx,0x1f
   1400591d9:	8d 72 01             	lea    esi,[rdx+0x1]
   1400591dc:	0f af f2             	imul   esi,edx
   1400591df:	85 f6                	test   esi,esi
   1400591e1:	75 09                	jne    0x1400591ec
   1400591e3:	48 c1 ce 20          	ror    rsi,0x20
   1400591e7:	8b 14 34             	mov    edx,DWORD PTR [rsp+rsi*1]
   1400591ea:	eb 0f                	jmp    0x1400591fb
   1400591ec:	c1 fa 0d             	sar    edx,0xd
   1400591ef:	48 be 00 00 00 00 00 	movabs rsi,0x10000000000
   1400591f6:	01 00 00 
   1400591f9:	8b 16                	mov    edx,DWORD PTR [rsi]
   1400591fb:	5e                   	pop    rsi
   1400591fc:	5a                   	pop    rdx
   1400591fd:	9d                   	popf
   1400591fe:	48 89 f2             	mov    rdx,rsi
   140059201:	9c                   	pushf
   140059202:	52                   	push   rdx
   140059203:	56                   	push   rsi
   140059204:	ba 9d be 9c 1c       	mov    edx,0x1c9cbe9d
   140059209:	89 d6                	mov    esi,edx
   14005920b:	c1 fa 02             	sar    edx,0x2
   14005920e:	c1 fe 11             	sar    esi,0x11
   140059211:	c1 fe 07             	sar    esi,0x7
   140059214:	c1 fa 0b             	sar    edx,0xb
   140059217:	c1 fe 04             	sar    esi,0x4
   14005921a:	c1 fa 07             	sar    edx,0x7
   14005921d:	c1 fe 0d             	sar    esi,0xd
   140059220:	c1 fe 1f             	sar    esi,0x1f
   140059223:	c1 fa 15             	sar    edx,0x15
   140059226:	c1 fe 03             	sar    esi,0x3
   140059229:	c1 fa 09             	sar    edx,0x9
   14005922c:	c1 fe 1f             	sar    esi,0x1f
   14005922f:	c1 fa 11             	sar    edx,0x11
   140059232:	c1 fe 05             	sar    esi,0x5
   140059235:	d1 fa                	sar    edx,1
   140059237:	c1 fe 08             	sar    esi,0x8
   14005923a:	c1 fe 0b             	sar    esi,0xb
   14005923d:	c1 fa 0b             	sar    edx,0xb
   140059240:	c1 fa 05             	sar    edx,0x5
   140059243:	c1 fa 08             	sar    edx,0x8
   140059246:	c1 fe 15             	sar    esi,0x15
   140059249:	c1 fe 03             	sar    esi,0x3
   14005924c:	c1 fe 05             	sar    esi,0x5
   14005924f:	c1 fe 11             	sar    esi,0x11
   140059252:	d1 fe                	sar    esi,1
   140059254:	c1 fa 07             	sar    edx,0x7
   140059257:	c1 fa 04             	sar    edx,0x4
   14005925a:	c1 fa 08             	sar    edx,0x8
   14005925d:	d1 fe                	sar    esi,1
   14005925f:	c1 fa 0b             	sar    edx,0xb
   140059262:	c1 fe 05             	sar    esi,0x5
   140059265:	c1 fe 0b             	sar    esi,0xb
   140059268:	d1 fe                	sar    esi,1
   14005926a:	c1 fa 03             	sar    edx,0x3
   14005926d:	31 f2                	xor    edx,esi
   14005926f:	81 f2 63 f8 21 30    	xor    edx,0x3021f863
   140059275:	c1 fa 1f             	sar    edx,0x1f
   140059278:	8d 72 01             	lea    esi,[rdx+0x1]
   14005927b:	0f af f2             	imul   esi,edx
   14005927e:	85 f6                	test   esi,esi
   140059280:	75 09                	jne    0x14005928b
   140059282:	48 c1 ce 20          	ror    rsi,0x20
   140059286:	8b 14 34             	mov    edx,DWORD PTR [rsp+rsi*1]
   140059289:	eb 0f                	jmp    0x14005929a
   14005928b:	c1 fa 0d             	sar    edx,0xd
   14005928e:	48 be 00 00 00 00 00 	movabs rsi,0x10000000000
   140059295:	01 00 00 
   140059298:	8b 16                	mov    edx,DWORD PTR [rsi]
   14005929a:	5e                   	pop    rsi
   14005929b:	5a                   	pop    rdx
   14005929c:	9d                   	popf
   14005929d:	4d 89 f8             	mov    r8,r15
   1400592a0:	9c                   	pushf
   1400592a1:	57                   	push   rdi
   1400592a2:	53                   	push   rbx
   1400592a3:	48 bf 13 d8 92 12 3a 	movabs rdi,0x79bb083a1292d813
   1400592aa:	08 bb 79 
   1400592ad:	48 89 fb             	mov    rbx,rdi
   1400592b0:	48 c1 fb 0b          	sar    rbx,0xb
   1400592b4:	48 c1 ff 07          	sar    rdi,0x7
   1400592b8:	48 c1 ff 1f          	sar    rdi,0x1f
   1400592bc:	48 c1 fb 1b          	sar    rbx,0x1b
   1400592c0:	48 c1 ff 04          	sar    rdi,0x4
   1400592c4:	48 c1 ff 02          	sar    rdi,0x2
   1400592c8:	48 c1 fb 05          	sar    rbx,0x5
   1400592cc:	48 c1 fb 1b          	sar    rbx,0x1b
   1400592d0:	48 c1 fb 0b          	sar    rbx,0xb
   1400592d4:	48 c1 fb 09          	sar    rbx,0x9
   1400592d8:	48 c1 fb 1b          	sar    rbx,0x1b
   1400592dc:	48 c1 ff 02          	sar    rdi,0x2
   1400592e0:	48 c1 ff 05          	sar    rdi,0x5
   1400592e4:	48 d1 fb             	sar    rbx,1
   1400592e7:	48 c1 ff 1f          	sar    rdi,0x1f
   1400592eb:	48 d1 ff             	sar    rdi,1
   1400592ee:	48 c1 fb 11          	sar    rbx,0x11
   1400592f2:	48 c1 fb 09          	sar    rbx,0x9
   1400592f6:	48 c1 ff 05          	sar    rdi,0x5
   1400592fa:	48 c1 ff 0d          	sar    rdi,0xd
   1400592fe:	48 c1 ff 03          	sar    rdi,0x3
   140059302:	48 c1 ff 1b          	sar    rdi,0x1b
   140059306:	48 c1 fb 05          	sar    rbx,0x5
   14005930a:	48 c1 fb 0d          	sar    rbx,0xd
   14005930e:	48 c1 fb 0d          	sar    rbx,0xd
   140059312:	48 c1 fb 07          	sar    rbx,0x7
   140059316:	48 c1 ff 11          	sar    rdi,0x11
   14005931a:	48 c1 fb 0d          	sar    rbx,0xd
   14005931e:	48 c1 fb 09          	sar    rbx,0x9
   140059322:	48 c1 ff 02          	sar    rdi,0x2
   140059326:	48 c1 ff 1b          	sar    rdi,0x1b
   14005932a:	48 c1 ff 0b          	sar    rdi,0xb
   14005932e:	48 c1 ff 0d          	sar    rdi,0xd
   140059332:	48 c1 ff 11          	sar    rdi,0x11
   140059336:	48 c1 ff 07          	sar    rdi,0x7
   14005933a:	48 c1 ff 0b          	sar    rdi,0xb
   14005933e:	48 31 df             	xor    rdi,rbx
   140059341:	48 bb 11 0c a2 78 79 	movabs rbx,0x3219d57978a20c11
   140059348:	d5 19 32 
   14005934b:	48 31 df             	xor    rdi,rbx
   14005934e:	48 c1 ff 3f          	sar    rdi,0x3f
   140059352:	48 8d 5f 01          	lea    rbx,[rdi+0x1]
   140059356:	48 0f af df          	imul   rbx,rdi
   14005935a:	48 85 db             	test   rbx,rbx
   14005935d:	75 0a                	jne    0x140059369
   14005935f:	48 c1 e3 26          	shl    rbx,0x26
   140059363:	48 8b 3c dc          	mov    rdi,QWORD PTR [rsp+rbx*8]
   140059367:	eb 11                	jmp    0x14005937a
   140059369:	48 c1 ff 11          	sar    rdi,0x11
   14005936d:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   140059374:	01 00 00 
   140059377:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
   14005937a:	5b                   	pop    rbx
   14005937b:	5f                   	pop    rdi
   14005937c:	9d                   	popf
   14005937d:	41 ff d5             	call   r13
   140059380:	9c                   	pushf
   140059381:	51                   	push   rcx
   140059382:	41 50                	push   r8
   140059384:	b9 10 25 5b 14       	mov    ecx,0x145b2510
   140059389:	41 89 c8             	mov    r8d,ecx
   14005938c:	d1 f9                	sar    ecx,1
   14005938e:	41 c1 f8 03          	sar    r8d,0x3
   140059392:	41 c1 f8 07          	sar    r8d,0x7
   140059396:	41 c1 f8 11          	sar    r8d,0x11
   14005939a:	c1 f9 02             	sar    ecx,0x2
   14005939d:	41 c1 f8 0b          	sar    r8d,0xb
   1400593a1:	c1 f9 15             	sar    ecx,0x15
   1400593a4:	41 c1 f8 11          	sar    r8d,0x11
   1400593a8:	c1 f9 05             	sar    ecx,0x5
   1400593ab:	c1 f9 03             	sar    ecx,0x3
   1400593ae:	c1 f9 07             	sar    ecx,0x7
   1400593b1:	41 c1 f8 1f          	sar    r8d,0x1f
   1400593b5:	41 c1 f8 02          	sar    r8d,0x2
   1400593b9:	c1 f9 07             	sar    ecx,0x7
   1400593bc:	c1 f9 15             	sar    ecx,0x15
   1400593bf:	c1 f9 05             	sar    ecx,0x5
   1400593c2:	c1 f9 07             	sar    ecx,0x7
   1400593c5:	c1 f9 0b             	sar    ecx,0xb
   1400593c8:	c1 f9 0b             	sar    ecx,0xb
   1400593cb:	c1 f9 07             	sar    ecx,0x7
   1400593ce:	c1 f9 1f             	sar    ecx,0x1f
   1400593d1:	41 c1 f8 0b          	sar    r8d,0xb
   1400593d5:	c1 f9 0f             	sar    ecx,0xf
   1400593d8:	c1 f9 09             	sar    ecx,0x9
   1400593db:	44 31 c1             	xor    ecx,r8d
   1400593de:	81 f1 78 3f ac 2f    	xor    ecx,0x2fac3f78
   1400593e4:	c1 f9 1f             	sar    ecx,0x1f
   1400593e7:	44 8d 41 01          	lea    r8d,[rcx+0x1]
   1400593eb:	44 0f af c1          	imul   r8d,ecx
   1400593ef:	45 85 c0             	test   r8d,r8d
   1400593f2:	75 09                	jne    0x1400593fd
   1400593f4:	49 0f c8             	bswap  r8
   1400593f7:	42 8b 0c 04          	mov    ecx,DWORD PTR [rsp+r8*1]
   1400593fb:	eb 10                	jmp    0x14005940d
   1400593fd:	c1 f9 0d             	sar    ecx,0xd
   140059400:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   140059407:	01 00 00 
   14005940a:	41 8b 08             	mov    ecx,DWORD PTR [r8]
   14005940d:	41 58                	pop    r8
   14005940f:	59                   	pop    rcx
   140059410:	9d                   	popf
   140059411:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   140059416:	9c                   	pushf
   140059417:	41 51                	push   r9
   140059419:	41 52                	push   r10
   14005941b:	41 b9 d9 11 eb 29    	mov    r9d,0x29eb11d9
   140059421:	45 89 ca             	mov    r10d,r9d
   140059424:	41 c1 f9 11          	sar    r9d,0x11
   140059428:	41 c1 f9 05          	sar    r9d,0x5
   14005942c:	41 c1 fa 15          	sar    r10d,0x15
   140059430:	41 c1 f9 08          	sar    r9d,0x8
   140059434:	41 c1 f9 07          	sar    r9d,0x7
   140059438:	41 d1 f9             	sar    r9d,1
   14005943b:	41 d1 fa             	sar    r10d,1
   14005943e:	41 c1 f9 04          	sar    r9d,0x4
   140059442:	41 c1 fa 15          	sar    r10d,0x15
   140059446:	41 c1 f9 15          	sar    r9d,0x15
   14005944a:	41 c1 fa 03          	sar    r10d,0x3
   14005944e:	41 c1 fa 0b          	sar    r10d,0xb
   140059452:	41 c1 fa 03          	sar    r10d,0x3
   140059456:	41 d1 fa             	sar    r10d,1
   140059459:	41 c1 fa 02          	sar    r10d,0x2
   14005945d:	41 c1 fa 0d          	sar    r10d,0xd
   140059461:	41 c1 f9 05          	sar    r9d,0x5
   140059465:	41 c1 f9 0f          	sar    r9d,0xf
   140059469:	41 c1 fa 15          	sar    r10d,0x15
   14005946d:	41 c1 fa 0b          	sar    r10d,0xb
   140059471:	41 d1 fa             	sar    r10d,1
   140059474:	41 c1 f9 05          	sar    r9d,0x5
   140059478:	41 c1 fa 15          	sar    r10d,0x15
   14005947c:	41 c1 f9 0f          	sar    r9d,0xf
   140059480:	41 c1 fa 0b          	sar    r10d,0xb
   140059484:	41 c1 fa 11          	sar    r10d,0x11
   140059488:	41 c1 fa 03          	sar    r10d,0x3
   14005948c:	41 c1 f9 02          	sar    r9d,0x2
   140059490:	41 c1 fa 0b          	sar    r10d,0xb
   140059494:	41 c1 f9 02          	sar    r9d,0x2
   140059498:	41 c1 f9 08          	sar    r9d,0x8
   14005949c:	41 c1 fa 0d          	sar    r10d,0xd
   1400594a0:	41 c1 fa 1f          	sar    r10d,0x1f
   1400594a4:	45 31 d1             	xor    r9d,r10d
   1400594a7:	41 81 f1 96 57 40 10 	xor    r9d,0x10405796
   1400594ae:	41 c1 f9 1f          	sar    r9d,0x1f
   1400594b2:	45 89 ca             	mov    r10d,r9d
   1400594b5:	41 ff c2             	inc    r10d
   1400594b8:	41 83 e2 fe          	and    r10d,0xfffffffe
   1400594bc:	45 85 d2             	test   r10d,r10d
   1400594bf:	75 0a                	jne    0x1400594cb
   1400594c1:	49 c1 e2 2a          	shl    r10,0x2a
   1400594c5:	46 8b 0c 54          	mov    r9d,DWORD PTR [rsp+r10*2]
   1400594c9:	eb 11                	jmp    0x1400594dc
   1400594cb:	41 c1 f9 0d          	sar    r9d,0xd
   1400594cf:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   1400594d6:	01 00 00 
   1400594d9:	45 8b 0a             	mov    r9d,DWORD PTR [r10]
   1400594dc:	41 5a                	pop    r10
   1400594de:	41 59                	pop    r9
   1400594e0:	9d                   	popf
   1400594e1:	48 b8 15 9a b0 e4 21 	movabs rax,0x8f3c7d21e4b09a15
   1400594e8:	7d 3c 8f 
   1400594eb:	9c                   	pushf
   1400594ec:	50                   	push   rax
   1400594ed:	51                   	push   rcx
   1400594ee:	48 b8 5a 80 0a 09 9c 	movabs rax,0x22ab7c9c090a805a
   1400594f5:	7c ab 22 
   1400594f8:	48 89 c1             	mov    rcx,rax
   1400594fb:	48 c1 f8 04          	sar    rax,0x4
   1400594ff:	48 c1 f8 07          	sar    rax,0x7
   140059503:	48 c1 f8 05          	sar    rax,0x5
   140059507:	48 c1 f9 11          	sar    rcx,0x11
   14005950b:	48 c1 f8 09          	sar    rax,0x9
   14005950f:	48 c1 f8 1f          	sar    rax,0x1f
   140059513:	48 c1 f9 05          	sar    rcx,0x5
   140059517:	48 c1 f8 09          	sar    rax,0x9
   14005951b:	48 c1 f9 09          	sar    rcx,0x9
   14005951f:	48 d1 f8             	sar    rax,1
   140059522:	48 c1 f9 07          	sar    rcx,0x7
   140059526:	48 c1 f8 09          	sar    rax,0x9
   14005952a:	48 c1 f9 0d          	sar    rcx,0xd
   14005952e:	48 c1 f8 02          	sar    rax,0x2
   140059532:	48 c1 f9 09          	sar    rcx,0x9
   140059536:	48 c1 f9 04          	sar    rcx,0x4
   14005953a:	48 c1 f8 1b          	sar    rax,0x1b
   14005953e:	48 c1 f9 11          	sar    rcx,0x11
   140059542:	48 c1 f9 0b          	sar    rcx,0xb
   140059546:	48 c1 f9 05          	sar    rcx,0x5
   14005954a:	48 c1 f8 04          	sar    rax,0x4
   14005954e:	48 c1 f8 0b          	sar    rax,0xb
   140059552:	48 c1 f9 05          	sar    rcx,0x5
   140059556:	48 c1 f9 1b          	sar    rcx,0x1b
   14005955a:	48 c1 f9 03          	sar    rcx,0x3
   14005955e:	48 c1 f9 04          	sar    rcx,0x4
   140059562:	48 31 c8             	xor    rax,rcx
   140059565:	48 b9 45 9d 9a 6f 19 	movabs rcx,0x23f558196f9a9d45
   14005956c:	58 f5 23 
   14005956f:	48 31 c8             	xor    rax,rcx
   140059572:	48 c1 f8 3f          	sar    rax,0x3f
   140059576:	48 89 c1             	mov    rcx,rax
   140059579:	48 d1 f9             	sar    rcx,1
   14005957c:	48 31 c1             	xor    rcx,rax
   14005957f:	48 85 c9             	test   rcx,rcx
   140059582:	75 0a                	jne    0x14005958e
   140059584:	48 c1 e1 28          	shl    rcx,0x28
   140059588:	48 8b 04 0c          	mov    rax,QWORD PTR [rsp+rcx*1]
   14005958c:	eb 11                	jmp    0x14005959f
   14005958e:	48 c1 f8 11          	sar    rax,0x11
   140059592:	48 b9 00 00 00 00 00 	movabs rcx,0x10000000000
   140059599:	01 00 00 
   14005959c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14005959f:	59                   	pop    rcx
   1400595a0:	58                   	pop    rax
   1400595a1:	9d                   	popf
   1400595a2:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1400595a7:	9c                   	pushf
   1400595a8:	41 50                	push   r8
   1400595aa:	41 51                	push   r9
   1400595ac:	41 b8 ea 57 d7 3d    	mov    r8d,0x3dd757ea
   1400595b2:	45 89 c1             	mov    r9d,r8d
   1400595b5:	41 c1 f8 11          	sar    r8d,0x11
   1400595b9:	41 c1 f8 05          	sar    r8d,0x5
   1400595bd:	41 c1 f8 02          	sar    r8d,0x2
   1400595c1:	41 c1 f9 09          	sar    r9d,0x9
   1400595c5:	41 d1 f9             	sar    r9d,1
   1400595c8:	41 c1 f9 0b          	sar    r9d,0xb
   1400595cc:	41 c1 f9 15          	sar    r9d,0x15
   1400595d0:	41 c1 f9 0b          	sar    r9d,0xb
   1400595d4:	41 c1 f9 07          	sar    r9d,0x7
   1400595d8:	41 c1 f9 15          	sar    r9d,0x15
   1400595dc:	41 c1 f9 08          	sar    r9d,0x8
   1400595e0:	41 c1 f8 03          	sar    r8d,0x3
   1400595e4:	41 c1 f9 0f          	sar    r9d,0xf
   1400595e8:	41 c1 f8 04          	sar    r8d,0x4
   1400595ec:	41 c1 f8 15          	sar    r8d,0x15
   1400595f0:	41 c1 f8 02          	sar    r8d,0x2
   1400595f4:	41 d1 f8             	sar    r8d,1
   1400595f7:	41 c1 f8 09          	sar    r8d,0x9
   1400595fb:	41 c1 f9 15          	sar    r9d,0x15
   1400595ff:	41 c1 f8 08          	sar    r8d,0x8
   140059603:	41 c1 f9 05          	sar    r9d,0x5
   140059607:	41 c1 f8 0f          	sar    r8d,0xf
   14005960b:	41 c1 f8 08          	sar    r8d,0x8
   14005960f:	41 c1 f9 0b          	sar    r9d,0xb
   140059613:	41 c1 f9 03          	sar    r9d,0x3
   140059617:	41 c1 f8 15          	sar    r8d,0x15
   14005961b:	41 c1 f9 07          	sar    r9d,0x7
   14005961f:	41 c1 f8 09          	sar    r8d,0x9
   140059623:	41 c1 f8 05          	sar    r8d,0x5
   140059627:	41 c1 f8 1f          	sar    r8d,0x1f
   14005962b:	41 c1 f8 07          	sar    r8d,0x7
   14005962f:	41 c1 f9 08          	sar    r9d,0x8
   140059633:	45 31 c8             	xor    r8d,r9d
   140059636:	41 81 f0 87 09 eb 69 	xor    r8d,0x69eb0987
   14005963d:	41 c1 f8 1f          	sar    r8d,0x1f
   140059641:	45 8d 48 01          	lea    r9d,[r8+0x1]
   140059645:	45 0f af c8          	imul   r9d,r8d
   140059649:	45 85 c9             	test   r9d,r9d
   14005964c:	75 0a                	jne    0x140059658
   14005964e:	49 c1 e1 28          	shl    r9,0x28
   140059652:	46 8b 04 0c          	mov    r8d,DWORD PTR [rsp+r9*1]
   140059656:	eb 11                	jmp    0x140059669
   140059658:	41 c1 f8 0d          	sar    r8d,0xd
   14005965c:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   140059663:	01 00 00 
   140059666:	45 8b 01             	mov    r8d,DWORD PTR [r9]
   140059669:	41 59                	pop    r9
   14005966b:	41 58                	pop    r8
   14005966d:	9d                   	popf
   14005966e:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   140059673:	9c                   	pushf
   140059674:	41 51                	push   r9
   140059676:	41 52                	push   r10
   140059678:	49 b9 a2 24 f5 80 7c 	movabs r9,0x6c9d717c80f524a2
   14005967f:	71 9d 6c 
   140059682:	4d 89 ca             	mov    r10,r9
   140059685:	49 c1 f9 1b          	sar    r9,0x1b
   140059689:	49 c1 f9 09          	sar    r9,0x9
   14005968d:	49 c1 f9 1f          	sar    r9,0x1f
   140059691:	49 c1 f9 09          	sar    r9,0x9
   140059695:	49 c1 fa 07          	sar    r10,0x7
   140059699:	49 c1 fa 09          	sar    r10,0x9
   14005969d:	49 c1 fa 0d          	sar    r10,0xd
   1400596a1:	49 c1 f9 03          	sar    r9,0x3
   1400596a5:	49 c1 fa 11          	sar    r10,0x11
   1400596a9:	49 d1 fa             	sar    r10,1
   1400596ac:	49 c1 f9 04          	sar    r9,0x4
   1400596b0:	49 c1 fa 02          	sar    r10,0x2
   1400596b4:	49 c1 f9 03          	sar    r9,0x3
   1400596b8:	49 c1 fa 02          	sar    r10,0x2
   1400596bc:	49 c1 fa 15          	sar    r10,0x15
   1400596c0:	49 c1 fa 09          	sar    r10,0x9
   1400596c4:	49 c1 fa 02          	sar    r10,0x2
   1400596c8:	49 c1 f9 03          	sar    r9,0x3
   1400596cc:	49 c1 f9 15          	sar    r9,0x15
   1400596d0:	49 c1 fa 15          	sar    r10,0x15
   1400596d4:	49 c1 f9 0b          	sar    r9,0xb
   1400596d8:	49 c1 f9 02          	sar    r9,0x2
   1400596dc:	49 c1 fa 15          	sar    r10,0x15
   1400596e0:	49 c1 f9 1b          	sar    r9,0x1b
   1400596e4:	49 c1 f9 1b          	sar    r9,0x1b
   1400596e8:	49 c1 f9 03          	sar    r9,0x3
   1400596ec:	49 c1 f9 04          	sar    r9,0x4
   1400596f0:	49 c1 f9 05          	sar    r9,0x5
   1400596f4:	49 c1 fa 04          	sar    r10,0x4
   1400596f8:	49 c1 f9 03          	sar    r9,0x3
   1400596fc:	49 c1 fa 0d          	sar    r10,0xd
   140059700:	49 c1 fa 09          	sar    r10,0x9
   140059704:	49 c1 fa 04          	sar    r10,0x4
   140059708:	4d 31 d1             	xor    r9,r10
   14005970b:	49 ba 52 d4 35 e0 0d 	movabs r10,0x116ef20de035d452
   140059712:	f2 6e 11 
   140059715:	4d 31 d1             	xor    r9,r10
   140059718:	49 c1 f9 3f          	sar    r9,0x3f
   14005971c:	4d 8d 51 01          	lea    r10,[r9+0x1]
   140059720:	4d 0f af d1          	imul   r10,r9
   140059724:	4d 85 d2             	test   r10,r10
   140059727:	75 0a                	jne    0x140059733
   140059729:	49 c1 e2 28          	shl    r10,0x28
   14005972d:	4e 8b 0c 14          	mov    r9,QWORD PTR [rsp+r10*1]
   140059731:	eb 11                	jmp    0x140059744
   140059733:	49 c1 f9 11          	sar    r9,0x11
   140059737:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   14005973e:	01 00 00 
   140059741:	4d 8b 0a             	mov    r9,QWORD PTR [r10]
   140059744:	41 5a                	pop    r10
   140059746:	41 59                	pop    r9
   140059748:	9d                   	popf
   140059749:	48 33 44 24 30       	xor    rax,QWORD PTR [rsp+0x30]
   14005974e:	9c                   	pushf
   14005974f:	57                   	push   rdi
   140059750:	53                   	push   rbx
   140059751:	bf ba 97 88 16       	mov    edi,0x168897ba
   140059756:	89 fb                	mov    ebx,edi
   140059758:	c1 fb 11             	sar    ebx,0x11
   14005975b:	c1 ff 15             	sar    edi,0x15
   14005975e:	c1 fb 15             	sar    ebx,0x15
   140059761:	c1 ff 1f             	sar    edi,0x1f
   140059764:	c1 fb 15             	sar    ebx,0x15
   140059767:	c1 fb 05             	sar    ebx,0x5
   14005976a:	d1 fb                	sar    ebx,1
   14005976c:	c1 fb 02             	sar    ebx,0x2
   14005976f:	d1 fb                	sar    ebx,1
   140059771:	c1 fb 15             	sar    ebx,0x15
   140059774:	c1 fb 11             	sar    ebx,0x11
   140059777:	c1 ff 0d             	sar    edi,0xd
   14005977a:	c1 fb 1f             	sar    ebx,0x1f
   14005977d:	c1 ff 09             	sar    edi,0x9
   140059780:	c1 fb 11             	sar    ebx,0x11
   140059783:	c1 ff 07             	sar    edi,0x7
   140059786:	c1 ff 07             	sar    edi,0x7
   140059789:	c1 ff 0f             	sar    edi,0xf
   14005978c:	c1 ff 0d             	sar    edi,0xd
   14005978f:	c1 ff 0f             	sar    edi,0xf
   140059792:	c1 ff 07             	sar    edi,0x7
   140059795:	c1 fb 08             	sar    ebx,0x8
   140059798:	c1 fb 05             	sar    ebx,0x5
   14005979b:	c1 fb 02             	sar    ebx,0x2
   14005979e:	c1 fb 15             	sar    ebx,0x15
   1400597a1:	c1 ff 02             	sar    edi,0x2
   1400597a4:	31 df                	xor    edi,ebx
   1400597a6:	81 f7 b6 9b 5a 3b    	xor    edi,0x3b5a9bb6
   1400597ac:	c1 ff 1f             	sar    edi,0x1f
   1400597af:	8d 5f 01             	lea    ebx,[rdi+0x1]
   1400597b2:	0f af df             	imul   ebx,edi
   1400597b5:	85 db                	test   ebx,ebx
   1400597b7:	75 09                	jne    0x1400597c2
   1400597b9:	48 c1 cb 20          	ror    rbx,0x20
   1400597bd:	8b 3c 5c             	mov    edi,DWORD PTR [rsp+rbx*2]
   1400597c0:	eb 0f                	jmp    0x1400597d1
   1400597c2:	c1 ff 0d             	sar    edi,0xd
   1400597c5:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   1400597cc:	01 00 00 
   1400597cf:	8b 3b                	mov    edi,DWORD PTR [rbx]
   1400597d1:	5b                   	pop    rbx
   1400597d2:	5f                   	pop    rdi
   1400597d3:	9d                   	popf
   1400597d4:	48 33 44 24 30       	xor    rax,QWORD PTR [rsp+0x30]
   1400597d9:	9c                   	pushf
   1400597da:	57                   	push   rdi
   1400597db:	53                   	push   rbx
   1400597dc:	48 bf a5 98 06 c8 75 	movabs rdi,0x54524675c80698a5
   1400597e3:	46 52 54 
   1400597e6:	48 89 fb             	mov    rbx,rdi
   1400597e9:	48 c1 ff 07          	sar    rdi,0x7
   1400597ed:	48 c1 ff 15          	sar    rdi,0x15
   1400597f1:	48 c1 fb 15          	sar    rbx,0x15
   1400597f5:	48 c1 fb 1b          	sar    rbx,0x1b
   1400597f9:	48 c1 ff 02          	sar    rdi,0x2
   1400597fd:	48 c1 fb 1b          	sar    rbx,0x1b
   140059801:	48 c1 ff 09          	sar    rdi,0x9
   140059805:	48 c1 ff 11          	sar    rdi,0x11
   140059809:	48 c1 ff 1f          	sar    rdi,0x1f
   14005980d:	48 c1 ff 15          	sar    rdi,0x15
   140059811:	48 d1 fb             	sar    rbx,1
   140059814:	48 c1 ff 03          	sar    rdi,0x3
   140059818:	48 c1 fb 09          	sar    rbx,0x9
   14005981c:	48 c1 ff 1b          	sar    rdi,0x1b
   140059820:	48 c1 fb 04          	sar    rbx,0x4
   140059824:	48 c1 fb 11          	sar    rbx,0x11
   140059828:	48 c1 ff 03          	sar    rdi,0x3
   14005982c:	48 c1 fb 02          	sar    rbx,0x2
   140059830:	48 c1 ff 1b          	sar    rdi,0x1b
   140059834:	48 d1 fb             	sar    rbx,1
   140059837:	48 c1 ff 11          	sar    rdi,0x11
   14005983b:	48 c1 fb 05          	sar    rbx,0x5
   14005983f:	48 c1 fb 11          	sar    rbx,0x11
   140059843:	48 c1 ff 05          	sar    rdi,0x5
   140059847:	48 c1 ff 1f          	sar    rdi,0x1f
   14005984b:	48 d1 fb             	sar    rbx,1
   14005984e:	48 c1 ff 02          	sar    rdi,0x2
   140059852:	48 c1 fb 05          	sar    rbx,0x5
   140059856:	48 c1 fb 05          	sar    rbx,0x5
   14005985a:	48 c1 ff 1b          	sar    rdi,0x1b
   14005985e:	48 31 df             	xor    rdi,rbx
   140059861:	48 bb 68 05 09 b7 0c 	movabs rbx,0x7b96b30cb7090568
   140059868:	b3 96 7b 
   14005986b:	48 31 df             	xor    rdi,rbx
   14005986e:	48 c1 ff 3f          	sar    rdi,0x3f
   140059872:	48 89 fb             	mov    rbx,rdi
   140059875:	48 d1 fb             	sar    rbx,1
   140059878:	48 31 fb             	xor    rbx,rdi
   14005987b:	48 85 db             	test   rbx,rbx
   14005987e:	75 0a                	jne    0x14005988a
   140059880:	48 c1 cb 20          	ror    rbx,0x20
   140059884:	48 8b 3c dc          	mov    rdi,QWORD PTR [rsp+rbx*8]
   140059888:	eb 11                	jmp    0x14005989b
   14005988a:	48 c1 ff 11          	sar    rdi,0x11
   14005988e:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   140059895:	01 00 00 
   140059898:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
   14005989b:	5b                   	pop    rbx
   14005989c:	5f                   	pop    rdi
   14005989d:	9d                   	popf
   14005989e:	4c 89 f1             	mov    rcx,r14
   1400598a1:	9c                   	pushf
   1400598a2:	41 51                	push   r9
   1400598a4:	41 52                	push   r10
   1400598a6:	49 b9 71 2f 1f 84 13 	movabs r9,0x5c9fbe13841f2f71
   1400598ad:	be 9f 5c 
   1400598b0:	4d 89 ca             	mov    r10,r9
   1400598b3:	49 d1 fa             	sar    r10,1
   1400598b6:	49 c1 fa 0d          	sar    r10,0xd
   1400598ba:	49 c1 f9 0b          	sar    r9,0xb
   1400598be:	49 c1 f9 11          	sar    r9,0x11
   1400598c2:	49 d1 f9             	sar    r9,1
   1400598c5:	49 c1 f9 03          	sar    r9,0x3
   1400598c9:	49 c1 fa 02          	sar    r10,0x2
   1400598cd:	49 c1 fa 15          	sar    r10,0x15
   1400598d1:	49 c1 f9 03          	sar    r9,0x3
   1400598d5:	49 c1 fa 1f          	sar    r10,0x1f
   1400598d9:	49 c1 f9 15          	sar    r9,0x15
   1400598dd:	49 c1 fa 09          	sar    r10,0x9
   1400598e1:	49 c1 f9 0b          	sar    r9,0xb
   1400598e5:	49 c1 fa 11          	sar    r10,0x11
   1400598e9:	49 c1 fa 07          	sar    r10,0x7
   1400598ed:	49 c1 fa 0d          	sar    r10,0xd
   1400598f1:	49 c1 f9 11          	sar    r9,0x11
   1400598f5:	49 c1 f9 11          	sar    r9,0x11
   1400598f9:	49 c1 f9 11          	sar    r9,0x11
   1400598fd:	49 c1 f9 0d          	sar    r9,0xd
   140059901:	49 c1 f9 04          	sar    r9,0x4
   140059905:	49 c1 f9 1b          	sar    r9,0x1b
   140059909:	49 c1 f9 0d          	sar    r9,0xd
   14005990d:	49 c1 fa 03          	sar    r10,0x3
   140059911:	4d 31 d1             	xor    r9,r10
   140059914:	49 ba ea 83 3c 22 0f 	movabs r10,0x229e160f223c83ea
   14005991b:	16 9e 22 
   14005991e:	4d 31 d1             	xor    r9,r10
   140059921:	49 c1 f9 3f          	sar    r9,0x3f
   140059925:	4d 8d 51 01          	lea    r10,[r9+0x1]
   140059929:	4d 0f af d1          	imul   r10,r9
   14005992d:	4d 85 d2             	test   r10,r10
   140059930:	75 09                	jne    0x14005993b
   140059932:	49 0f ca             	bswap  r10
   140059935:	4e 8b 0c 14          	mov    r9,QWORD PTR [rsp+r10*1]
   140059939:	eb 11                	jmp    0x14005994c
   14005993b:	49 c1 f9 11          	sar    r9,0x11
   14005993f:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   140059946:	01 00 00 
   140059949:	4d 8b 0a             	mov    r9,QWORD PTR [r10]
   14005994c:	41 5a                	pop    r10
   14005994e:	41 59                	pop    r9
   140059950:	9d                   	popf
   140059951:	48 89 da             	mov    rdx,rbx
   140059954:	9c                   	pushf
   140059955:	57                   	push   rdi
   140059956:	53                   	push   rbx
   140059957:	bf b8 9d b9 34       	mov    edi,0x34b99db8
   14005995c:	89 fb                	mov    ebx,edi
   14005995e:	c1 fb 08             	sar    ebx,0x8
   140059961:	d1 fb                	sar    ebx,1
   140059963:	c1 ff 08             	sar    edi,0x8
   140059966:	c1 fb 0f             	sar    ebx,0xf
   140059969:	c1 ff 09             	sar    edi,0x9
   14005996c:	c1 fb 0b             	sar    ebx,0xb
   14005996f:	c1 ff 1f             	sar    edi,0x1f
   140059972:	c1 ff 15             	sar    edi,0x15
   140059975:	c1 ff 0f             	sar    edi,0xf
   140059978:	c1 fb 11             	sar    ebx,0x11
   14005997b:	c1 ff 09             	sar    edi,0x9
   14005997e:	c1 fb 15             	sar    ebx,0x15
   140059981:	c1 fb 15             	sar    ebx,0x15
   140059984:	c1 fb 07             	sar    ebx,0x7
   140059987:	c1 fb 0f             	sar    ebx,0xf
   14005998a:	c1 ff 08             	sar    edi,0x8
   14005998d:	c1 ff 09             	sar    edi,0x9
   140059990:	c1 fb 09             	sar    ebx,0x9
   140059993:	c1 ff 07             	sar    edi,0x7
   140059996:	d1 fb                	sar    ebx,1
   140059998:	c1 ff 0b             	sar    edi,0xb
   14005999b:	c1 ff 15             	sar    edi,0x15
   14005999e:	c1 ff 09             	sar    edi,0x9
   1400599a1:	c1 ff 02             	sar    edi,0x2
   1400599a4:	d1 fb                	sar    ebx,1
   1400599a6:	c1 fb 02             	sar    ebx,0x2
   1400599a9:	c1 ff 08             	sar    edi,0x8
   1400599ac:	c1 fb 15             	sar    ebx,0x15
   1400599af:	c1 fb 0f             	sar    ebx,0xf
   1400599b2:	c1 fb 05             	sar    ebx,0x5
   1400599b5:	c1 fb 02             	sar    ebx,0x2
   1400599b8:	d1 fb                	sar    ebx,1
   1400599ba:	c1 ff 03             	sar    edi,0x3
   1400599bd:	31 df                	xor    edi,ebx
   1400599bf:	81 f7 7c aa 61 4e    	xor    edi,0x4e61aa7c
   1400599c5:	c1 ff 1f             	sar    edi,0x1f
   1400599c8:	89 fb                	mov    ebx,edi
   1400599ca:	d1 fb                	sar    ebx,1
   1400599cc:	31 fb                	xor    ebx,edi
   1400599ce:	85 db                	test   ebx,ebx
   1400599d0:	75 09                	jne    0x1400599db
   1400599d2:	48 c1 e3 2a          	shl    rbx,0x2a
   1400599d6:	8b 3c 1c             	mov    edi,DWORD PTR [rsp+rbx*1]
   1400599d9:	eb 0f                	jmp    0x1400599ea
   1400599db:	c1 ff 0d             	sar    edi,0xd
   1400599de:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   1400599e5:	01 00 00 
   1400599e8:	8b 3b                	mov    edi,DWORD PTR [rbx]
   1400599ea:	5b                   	pop    rbx
   1400599eb:	5f                   	pop    rdi
   1400599ec:	9d                   	popf
   1400599ed:	ff d0                	call   rax
   1400599ef:	9c                   	pushf
   1400599f0:	51                   	push   rcx
   1400599f1:	41 50                	push   r8
   1400599f3:	b9 7a cd 98 7b       	mov    ecx,0x7b98cd7a
   1400599f8:	41 89 c8             	mov    r8d,ecx
   1400599fb:	41 c1 f8 0b          	sar    r8d,0xb
   1400599ff:	41 c1 f8 03          	sar    r8d,0x3
   140059a03:	c1 f9 0b             	sar    ecx,0xb
   140059a06:	c1 f9 1f             	sar    ecx,0x1f
   140059a09:	c1 f9 03             	sar    ecx,0x3
   140059a0c:	41 c1 f8 11          	sar    r8d,0x11
   140059a10:	41 c1 f8 08          	sar    r8d,0x8
   140059a14:	41 c1 f8 15          	sar    r8d,0x15
   140059a18:	c1 f9 0b             	sar    ecx,0xb
   140059a1b:	41 c1 f8 0d          	sar    r8d,0xd
   140059a1f:	c1 f9 07             	sar    ecx,0x7
   140059a22:	c1 f9 0f             	sar    ecx,0xf
   140059a25:	41 c1 f8 07          	sar    r8d,0x7
   140059a29:	41 c1 f8 03          	sar    r8d,0x3
   140059a2d:	c1 f9 11             	sar    ecx,0x11
   140059a30:	c1 f9 15             	sar    ecx,0x15
   140059a33:	c1 f9 04             	sar    ecx,0x4
   140059a36:	41 c1 f8 08          	sar    r8d,0x8
   140059a3a:	c1 f9 04             	sar    ecx,0x4
   140059a3d:	c1 f9 11             	sar    ecx,0x11
   140059a40:	c1 f9 0d             	sar    ecx,0xd
   140059a43:	41 c1 f8 0f          	sar    r8d,0xf
   140059a47:	c1 f9 02             	sar    ecx,0x2
   140059a4a:	c1 f9 0b             	sar    ecx,0xb
   140059a4d:	c1 f9 03             	sar    ecx,0x3
   140059a50:	41 c1 f8 0b          	sar    r8d,0xb
   140059a54:	41 c1 f8 11          	sar    r8d,0x11
   140059a58:	41 c1 f8 1f          	sar    r8d,0x1f
   140059a5c:	c1 f9 0f             	sar    ecx,0xf
   140059a5f:	c1 f9 1f             	sar    ecx,0x1f
   140059a62:	41 c1 f8 09          	sar    r8d,0x9
   140059a66:	c1 f9 15             	sar    ecx,0x15
   140059a69:	c1 f9 0d             	sar    ecx,0xd
   140059a6c:	41 c1 f8 03          	sar    r8d,0x3
   140059a70:	c1 f9 05             	sar    ecx,0x5
   140059a73:	44 31 c1             	xor    ecx,r8d
   140059a76:	81 f1 ee 56 1a 5b    	xor    ecx,0x5b1a56ee
   140059a7c:	c1 f9 1f             	sar    ecx,0x1f
   140059a7f:	41 89 c8             	mov    r8d,ecx
   140059a82:	41 ff c0             	inc    r8d
   140059a85:	41 83 e0 fe          	and    r8d,0xfffffffe
   140059a89:	45 85 c0             	test   r8d,r8d
   140059a8c:	75 09                	jne    0x140059a97
   140059a8e:	49 0f c8             	bswap  r8
   140059a91:	42 8b 0c 44          	mov    ecx,DWORD PTR [rsp+r8*2]
   140059a95:	eb 10                	jmp    0x140059aa7
   140059a97:	c1 f9 0d             	sar    ecx,0xd
   140059a9a:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   140059aa1:	01 00 00 
   140059aa4:	41 8b 08             	mov    ecx,DWORD PTR [r8]
   140059aa7:	41 58                	pop    r8
   140059aa9:	59                   	pop    rcx
   140059aaa:	9d                   	popf
   140059aab:	89 c3                	mov    ebx,eax
   140059aad:	48 29 f7             	sub    rdi,rsi
   140059ab0:	0f 84 69 06 00 00    	je     0x14005a11f
   140059ab6:	9c                   	pushf
   140059ab7:	52                   	push   rdx
   140059ab8:	56                   	push   rsi
   140059ab9:	ba d9 f3 87 31       	mov    edx,0x3187f3d9
   140059abe:	89 d6                	mov    esi,edx
   140059ac0:	c1 fa 0f             	sar    edx,0xf
   140059ac3:	d1 fe                	sar    esi,1
   140059ac5:	c1 fa 09             	sar    edx,0x9
   140059ac8:	c1 fa 1f             	sar    edx,0x1f
   140059acb:	c1 fe 1f             	sar    esi,0x1f
   140059ace:	d1 fa                	sar    edx,1
   140059ad0:	c1 fe 1f             	sar    esi,0x1f
   140059ad3:	c1 fe 03             	sar    esi,0x3
   140059ad6:	c1 fe 15             	sar    esi,0x15
   140059ad9:	c1 fa 1f             	sar    edx,0x1f
   140059adc:	c1 fe 04             	sar    esi,0x4
   140059adf:	c1 fe 0f             	sar    esi,0xf
   140059ae2:	c1 fa 11             	sar    edx,0x11
   140059ae5:	c1 fa 09             	sar    edx,0x9
   140059ae8:	c1 fe 04             	sar    esi,0x4
   140059aeb:	c1 fa 02             	sar    edx,0x2
   140059aee:	c1 fa 0b             	sar    edx,0xb
   140059af1:	c1 fe 03             	sar    esi,0x3
   140059af4:	c1 fa 09             	sar    edx,0x9
   140059af7:	c1 fe 1f             	sar    esi,0x1f
   140059afa:	c1 fa 05             	sar    edx,0x5
   140059afd:	c1 fa 02             	sar    edx,0x2
   140059b00:	c1 fe 04             	sar    esi,0x4
   140059b03:	c1 fa 15             	sar    edx,0x15
   140059b06:	c1 fa 05             	sar    edx,0x5
   140059b09:	c1 fe 09             	sar    esi,0x9
   140059b0c:	c1 fa 02             	sar    edx,0x2
   140059b0f:	c1 fa 05             	sar    edx,0x5
   140059b12:	c1 fa 07             	sar    edx,0x7
   140059b15:	c1 fa 03             	sar    edx,0x3
   140059b18:	c1 fe 05             	sar    esi,0x5
   140059b1b:	31 f2                	xor    edx,esi
   140059b1d:	81 f2 10 4f bb 6a    	xor    edx,0x6abb4f10
   140059b23:	c1 fa 1f             	sar    edx,0x1f
   140059b26:	89 d6                	mov    esi,edx
   140059b28:	ff c6                	inc    esi
   140059b2a:	83 e6 fe             	and    esi,0xfffffffe
   140059b2d:	85 f6                	test   esi,esi
   140059b2f:	75 09                	jne    0x140059b3a
   140059b31:	48 c1 ce 20          	ror    rsi,0x20
   140059b35:	8b 14 74             	mov    edx,DWORD PTR [rsp+rsi*2]
   140059b38:	eb 0f                	jmp    0x140059b49
   140059b3a:	c1 fa 0d             	sar    edx,0xd
   140059b3d:	48 be 00 00 00 00 00 	movabs rsi,0x10000000000
   140059b44:	01 00 00 
   140059b47:	8b 16                	mov    edx,DWORD PTR [rsi]
   140059b49:	5e                   	pop    rsi
   140059b4a:	5a                   	pop    rdx
   140059b4b:	9d                   	popf
   140059b4c:	b8 72 72 61 73       	mov    eax,0x73617272
   140059b51:	9c                   	pushf
   140059b52:	50                   	push   rax
   140059b53:	52                   	push   rdx
   140059b54:	b8 ba 22 8d 4a       	mov    eax,0x4a8d22ba
   140059b59:	89 c2                	mov    edx,eax
   140059b5b:	c1 fa 02             	sar    edx,0x2
   140059b5e:	c1 f8 08             	sar    eax,0x8
   140059b61:	c1 f8 05             	sar    eax,0x5
   140059b64:	c1 fa 0d             	sar    edx,0xd
   140059b67:	c1 fa 08             	sar    edx,0x8
   140059b6a:	d1 fa                	sar    edx,1
   140059b6c:	c1 fa 0d             	sar    edx,0xd
   140059b6f:	c1 fa 05             	sar    edx,0x5
   140059b72:	c1 fa 11             	sar    edx,0x11
   140059b75:	c1 fa 08             	sar    edx,0x8
   140059b78:	c1 fa 0b             	sar    edx,0xb
   140059b7b:	c1 f8 09             	sar    eax,0x9
   140059b7e:	c1 fa 05             	sar    edx,0x5
   140059b81:	c1 fa 09             	sar    edx,0x9
   140059b84:	c1 f8 02             	sar    eax,0x2
   140059b87:	c1 f8 11             	sar    eax,0x11
   140059b8a:	c1 f8 03             	sar    eax,0x3
   140059b8d:	c1 f8 0d             	sar    eax,0xd
   140059b90:	c1 f8 0b             	sar    eax,0xb
   140059b93:	c1 f8 0b             	sar    eax,0xb
   140059b96:	c1 f8 1f             	sar    eax,0x1f
   140059b99:	c1 f8 09             	sar    eax,0x9
   140059b9c:	c1 f8 04             	sar    eax,0x4
   140059b9f:	c1 f8 11             	sar    eax,0x11
   140059ba2:	c1 fa 04             	sar    edx,0x4
   140059ba5:	c1 f8 03             	sar    eax,0x3
   140059ba8:	c1 fa 05             	sar    edx,0x5
   140059bab:	c1 f8 0b             	sar    eax,0xb
   140059bae:	c1 f8 0b             	sar    eax,0xb
   140059bb1:	c1 f8 03             	sar    eax,0x3
   140059bb4:	c1 f8 02             	sar    eax,0x2
   140059bb7:	c1 fa 09             	sar    edx,0x9
   140059bba:	c1 fa 02             	sar    edx,0x2
   140059bbd:	c1 f8 05             	sar    eax,0x5
   140059bc0:	c1 f8 05             	sar    eax,0x5
   140059bc3:	31 d0                	xor    eax,edx
   140059bc5:	35 1c b2 94 45       	xor    eax,0x4594b21c
   140059bca:	c1 f8 1f             	sar    eax,0x1f
   140059bcd:	89 c2                	mov    edx,eax
   140059bcf:	ff c2                	inc    edx
   140059bd1:	83 e2 fe             	and    edx,0xfffffffe
   140059bd4:	85 d2                	test   edx,edx
   140059bd6:	75 09                	jne    0x140059be1
   140059bd8:	48 c1 e2 28          	shl    rdx,0x28
   140059bdc:	8b 04 14             	mov    eax,DWORD PTR [rsp+rdx*1]
   140059bdf:	eb 0f                	jmp    0x140059bf0
   140059be1:	c1 f8 0d             	sar    eax,0xd
   140059be4:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   140059beb:	01 00 00 
   140059bee:	8b 02                	mov    eax,DWORD PTR [rdx]
   140059bf0:	5a                   	pop    rdx
   140059bf1:	58                   	pop    rax
   140059bf2:	9d                   	popf
   140059bf3:	31 c9                	xor    ecx,ecx
   140059bf5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140059bfc:	00 00 00 
   140059bff:	90                   	nop
   140059c00:	9c                   	pushf
   140059c01:	50                   	push   rax
   140059c02:	51                   	push   rcx
   140059c03:	b8 45 cd a0 40       	mov    eax,0x40a0cd45
   140059c08:	89 c1                	mov    ecx,eax
   140059c0a:	c1 f8 08             	sar    eax,0x8
   140059c0d:	c1 f9 11             	sar    ecx,0x11
   140059c10:	c1 f9 11             	sar    ecx,0x11
   140059c13:	c1 f9 02             	sar    ecx,0x2
   140059c16:	c1 f8 04             	sar    eax,0x4
   140059c19:	c1 f8 05             	sar    eax,0x5
   140059c1c:	c1 f9 04             	sar    ecx,0x4
   140059c1f:	c1 f9 0f             	sar    ecx,0xf
   140059c22:	c1 f9 0b             	sar    ecx,0xb
   140059c25:	c1 f9 07             	sar    ecx,0x7
   140059c28:	c1 f9 05             	sar    ecx,0x5
   140059c2b:	c1 f8 07             	sar    eax,0x7
   140059c2e:	c1 f9 0b             	sar    ecx,0xb
   140059c31:	c1 f8 07             	sar    eax,0x7
   140059c34:	d1 f9                	sar    ecx,1
   140059c36:	c1 f9 0d             	sar    ecx,0xd
   140059c39:	c1 f8 1f             	sar    eax,0x1f
   140059c3c:	c1 f9 02             	sar    ecx,0x2
   140059c3f:	c1 f8 09             	sar    eax,0x9
   140059c42:	c1 f8 07             	sar    eax,0x7
   140059c45:	c1 f9 0f             	sar    ecx,0xf
   140059c48:	c1 f9 15             	sar    ecx,0x15
   140059c4b:	c1 f9 0d             	sar    ecx,0xd
   140059c4e:	c1 f8 11             	sar    eax,0x11
   140059c51:	c1 f9 0b             	sar    ecx,0xb
   140059c54:	c1 f8 0f             	sar    eax,0xf
   140059c57:	d1 f9                	sar    ecx,1
   140059c59:	c1 f8 08             	sar    eax,0x8
   140059c5c:	c1 f9 15             	sar    ecx,0x15
   140059c5f:	c1 f8 03             	sar    eax,0x3
   140059c62:	c1 f8 1f             	sar    eax,0x1f
   140059c65:	c1 f9 0d             	sar    ecx,0xd
   140059c68:	c1 f9 04             	sar    ecx,0x4
   140059c6b:	c1 f9 1f             	sar    ecx,0x1f
   140059c6e:	31 c8                	xor    eax,ecx
   140059c70:	35 c9 ee 4b 6e       	xor    eax,0x6e4beec9
   140059c75:	c1 f8 1f             	sar    eax,0x1f
   140059c78:	8d 48 01             	lea    ecx,[rax+0x1]
   140059c7b:	0f af c8             	imul   ecx,eax
   140059c7e:	85 c9                	test   ecx,ecx
   140059c80:	75 08                	jne    0x140059c8a
   140059c82:	48 0f c9             	bswap  rcx
   140059c85:	8b 04 4c             	mov    eax,DWORD PTR [rsp+rcx*2]
   140059c88:	eb 0f                	jmp    0x140059c99
   140059c8a:	c1 f8 0d             	sar    eax,0xd
   140059c8d:	48 b9 00 00 00 00 00 	movabs rcx,0x10000000000
   140059c94:	01 00 00 
   140059c97:	8b 01                	mov    eax,DWORD PTR [rcx]
   140059c99:	59                   	pop    rcx
   140059c9a:	58                   	pop    rax
   140059c9b:	9d                   	popf
   140059c9c:	89 c2                	mov    edx,eax
   140059c9e:	9c                   	pushf
   140059c9f:	50                   	push   rax
   140059ca0:	51                   	push   rcx
   140059ca1:	48 b8 b1 ef f8 e9 be 	movabs rax,0x6277debee9f8efb1
   140059ca8:	de 77 62 
   140059cab:	48 89 c1             	mov    rcx,rax
   140059cae:	48 c1 f8 03          	sar    rax,0x3
   140059cb2:	48 c1 f9 11          	sar    rcx,0x11
   140059cb6:	48 c1 f8 1b          	sar    rax,0x1b
   140059cba:	48 c1 f8 15          	sar    rax,0x15
   140059cbe:	48 c1 f9 09          	sar    rcx,0x9
   140059cc2:	48 c1 f9 1f          	sar    rcx,0x1f
   140059cc6:	48 c1 f8 15          	sar    rax,0x15
   140059cca:	48 c1 f8 07          	sar    rax,0x7
   140059cce:	48 c1 f9 02          	sar    rcx,0x2
   140059cd2:	48 c1 f8 0d          	sar    rax,0xd
   140059cd6:	48 d1 f8             	sar    rax,1
   140059cd9:	48 c1 f9 1f          	sar    rcx,0x1f
   140059cdd:	48 c1 f9 0d          	sar    rcx,0xd
   140059ce1:	48 c1 f8 1f          	sar    rax,0x1f
   140059ce5:	48 c1 f8 1b          	sar    rax,0x1b
   140059ce9:	48 c1 f8 11          	sar    rax,0x11
   140059ced:	48 c1 f8 04          	sar    rax,0x4
   140059cf1:	48 c1 f9 1b          	sar    rcx,0x1b
   140059cf5:	48 c1 f8 11          	sar    rax,0x11
   140059cf9:	48 c1 f8 11          	sar    rax,0x11
   140059cfd:	48 c1 f8 02          	sar    rax,0x2
   140059d01:	48 c1 f9 0b          	sar    rcx,0xb
   140059d05:	48 c1 f9 1b          	sar    rcx,0x1b
   140059d09:	48 c1 f9 15          	sar    rcx,0x15
   140059d0d:	48 c1 f8 03          	sar    rax,0x3
   140059d11:	48 c1 f9 1b          	sar    rcx,0x1b
   140059d15:	48 d1 f9             	sar    rcx,1
   140059d18:	48 c1 f8 05          	sar    rax,0x5
   140059d1c:	48 c1 f9 1b          	sar    rcx,0x1b
   140059d20:	48 c1 f8 05          	sar    rax,0x5
   140059d24:	48 c1 f8 1f          	sar    rax,0x1f
   140059d28:	48 c1 f8 02          	sar    rax,0x2
   140059d2c:	48 c1 f8 07          	sar    rax,0x7
   140059d30:	48 31 c8             	xor    rax,rcx
   140059d33:	48 b9 80 68 ff 40 30 	movabs rcx,0x7977fc3040ff6880
   140059d3a:	fc 77 79 
   140059d3d:	48 31 c8             	xor    rax,rcx
   140059d40:	48 c1 f8 3f          	sar    rax,0x3f
   140059d44:	48 89 c1             	mov    rcx,rax
   140059d47:	48 d1 f9             	sar    rcx,1
   140059d4a:	48 31 c1             	xor    rcx,rax
   140059d4d:	48 85 c9             	test   rcx,rcx
   140059d50:	75 0a                	jne    0x140059d5c
   140059d52:	48 c1 e1 28          	shl    rcx,0x28
   140059d56:	48 8b 04 0c          	mov    rax,QWORD PTR [rsp+rcx*1]
   140059d5a:	eb 11                	jmp    0x140059d6d
   140059d5c:	48 c1 f8 11          	sar    rax,0x11
   140059d60:	48 b9 00 00 00 00 00 	movabs rcx,0x10000000000
   140059d67:	01 00 00 
   140059d6a:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140059d6d:	59                   	pop    rcx
   140059d6e:	58                   	pop    rax
   140059d6f:	9d                   	popf
   140059d70:	c1 fa 03             	sar    edx,0x3
   140059d73:	9c                   	pushf
   140059d74:	41 50                	push   r8
   140059d76:	41 51                	push   r9
   140059d78:	49 b8 a3 c0 2a 12 b8 	movabs r8,0x4d970bb8122ac0a3
   140059d7f:	0b 97 4d 
   140059d82:	4d 89 c1             	mov    r9,r8
   140059d85:	49 c1 f8 09          	sar    r8,0x9
   140059d89:	49 c1 f9 05          	sar    r9,0x5
   140059d8d:	49 c1 f8 05          	sar    r8,0x5
   140059d91:	49 c1 f8 0d          	sar    r8,0xd
   140059d95:	49 c1 f8 15          	sar    r8,0x15
   140059d99:	49 c1 f9 15          	sar    r9,0x15
   140059d9d:	49 c1 f9 04          	sar    r9,0x4
   140059da1:	49 c1 f8 0d          	sar    r8,0xd
   140059da5:	49 c1 f9 1b          	sar    r9,0x1b
   140059da9:	49 c1 f9 07          	sar    r9,0x7
   140059dad:	49 d1 f9             	sar    r9,1
   140059db0:	49 c1 f9 09          	sar    r9,0x9
   140059db4:	49 d1 f9             	sar    r9,1
   140059db7:	49 c1 f9 0d          	sar    r9,0xd
   140059dbb:	49 c1 f9 03          	sar    r9,0x3
   140059dbf:	49 c1 f8 1b          	sar    r8,0x1b
   140059dc3:	49 c1 f8 1f          	sar    r8,0x1f
   140059dc7:	49 c1 f9 03          	sar    r9,0x3
   140059dcb:	49 c1 f9 1f          	sar    r9,0x1f
   140059dcf:	49 c1 f9 04          	sar    r9,0x4
   140059dd3:	49 c1 f8 15          	sar    r8,0x15
   140059dd7:	49 c1 f9 05          	sar    r9,0x5
   140059ddb:	49 c1 f8 11          	sar    r8,0x11
   140059ddf:	49 c1 f9 0d          	sar    r9,0xd
   140059de3:	4d 31 c8             	xor    r8,r9
   140059de6:	49 b9 32 af 41 c1 01 	movabs r9,0x60d98c01c141af32
   140059ded:	8c d9 60 
   140059df0:	4d 31 c8             	xor    r8,r9
   140059df3:	49 c1 f8 3f          	sar    r8,0x3f
   140059df7:	4d 89 c1             	mov    r9,r8
   140059dfa:	49 ff c1             	inc    r9
   140059dfd:	49 83 e1 fe          	and    r9,0xfffffffffffffffe
   140059e01:	4d 85 c9             	test   r9,r9
   140059e04:	75 0a                	jne    0x140059e10
   140059e06:	49 c1 c9 20          	ror    r9,0x20
   140059e0a:	4e 8b 04 0c          	mov    r8,QWORD PTR [rsp+r9*1]
   140059e0e:	eb 11                	jmp    0x140059e21
   140059e10:	49 c1 f8 11          	sar    r8,0x11
   140059e14:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   140059e1b:	01 00 00 
   140059e1e:	4d 8b 01             	mov    r8,QWORD PTR [r9]
   140059e21:	41 59                	pop    r9
   140059e23:	41 58                	pop    r8
   140059e25:	9d                   	popf
   140059e26:	c1 e0 05             	shl    eax,0x5
   140059e29:	9c                   	pushf
   140059e2a:	50                   	push   rax
   140059e2b:	52                   	push   rdx
   140059e2c:	b8 4a 53 26 1f       	mov    eax,0x1f26534a
   140059e31:	89 c2                	mov    edx,eax
   140059e33:	c1 fa 09             	sar    edx,0x9
   140059e36:	c1 fa 0d             	sar    edx,0xd
   140059e39:	c1 fa 11             	sar    edx,0x11
   140059e3c:	c1 f8 1f             	sar    eax,0x1f
   140059e3f:	c1 f8 15             	sar    eax,0x15
   140059e42:	c1 f8 07             	sar    eax,0x7
   140059e45:	c1 fa 05             	sar    edx,0x5
   140059e48:	c1 fa 04             	sar    edx,0x4
   140059e4b:	c1 fa 02             	sar    edx,0x2
   140059e4e:	c1 fa 0d             	sar    edx,0xd
   140059e51:	c1 f8 07             	sar    eax,0x7
   140059e54:	c1 f8 0f             	sar    eax,0xf
   140059e57:	c1 f8 15             	sar    eax,0x15
   140059e5a:	c1 fa 07             	sar    edx,0x7
   140059e5d:	c1 fa 07             	sar    edx,0x7
   140059e60:	c1 f8 09             	sar    eax,0x9
   140059e63:	d1 fa                	sar    edx,1
   140059e65:	c1 f8 1f             	sar    eax,0x1f
   140059e68:	c1 f8 1f             	sar    eax,0x1f
   140059e6b:	c1 fa 1f             	sar    edx,0x1f
   140059e6e:	c1 fa 15             	sar    edx,0x15
   140059e71:	c1 f8 02             	sar    eax,0x2
   140059e74:	c1 fa 04             	sar    edx,0x4
   140059e77:	c1 fa 0b             	sar    edx,0xb
   140059e7a:	c1 f8 07             	sar    eax,0x7
   140059e7d:	c1 f8 07             	sar    eax,0x7
   140059e80:	c1 fa 15             	sar    edx,0x15
   140059e83:	c1 fa 11             	sar    edx,0x11
   140059e86:	c1 f8 05             	sar    eax,0x5
   140059e89:	31 d0                	xor    eax,edx
   140059e8b:	35 f5 1a 25 43       	xor    eax,0x43251af5
   140059e90:	c1 f8 1f             	sar    eax,0x1f
   140059e93:	89 c2                	mov    edx,eax
   140059e95:	d1 fa                	sar    edx,1
   140059e97:	31 c2                	xor    edx,eax
   140059e99:	85 d2                	test   edx,edx
   140059e9b:	75 09                	jne    0x140059ea6
   140059e9d:	48 c1 ca 20          	ror    rdx,0x20
   140059ea1:	8b 04 14             	mov    eax,DWORD PTR [rsp+rdx*1]
   140059ea4:	eb 0f                	jmp    0x140059eb5
   140059ea6:	c1 f8 0d             	sar    eax,0xd
   140059ea9:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   140059eb0:	01 00 00 
   140059eb3:	8b 02                	mov    eax,DWORD PTR [rdx]
   140059eb5:	5a                   	pop    rdx
   140059eb6:	58                   	pop    rax
   140059eb7:	9d                   	popf
   140059eb8:	31 d0                	xor    eax,edx
   140059eba:	9c                   	pushf
   140059ebb:	41 52                	push   r10
   140059ebd:	41 53                	push   r11
   140059ebf:	41 ba 6c 71 99 3a    	mov    r10d,0x3a99716c
   140059ec5:	45 89 d3             	mov    r11d,r10d
   140059ec8:	41 d1 fa             	sar    r10d,1
   140059ecb:	41 c1 fa 03          	sar    r10d,0x3
   140059ecf:	41 c1 fb 0b          	sar    r11d,0xb
   140059ed3:	41 c1 fb 07          	sar    r11d,0x7
   140059ed7:	41 c1 fa 15          	sar    r10d,0x15
   140059edb:	41 c1 fb 07          	sar    r11d,0x7
   140059edf:	41 c1 fb 15          	sar    r11d,0x15
   140059ee3:	41 c1 fb 0d          	sar    r11d,0xd
   140059ee7:	41 c1 fa 04          	sar    r10d,0x4
   140059eeb:	41 c1 fa 1f          	sar    r10d,0x1f
   140059eef:	41 c1 fa 05          	sar    r10d,0x5
   140059ef3:	41 c1 fb 05          	sar    r11d,0x5
   140059ef7:	41 c1 fa 09          	sar    r10d,0x9
   140059efb:	41 c1 fb 11          	sar    r11d,0x11
   140059eff:	41 c1 fa 08          	sar    r10d,0x8
   140059f03:	41 c1 fb 08          	sar    r11d,0x8
   140059f07:	41 c1 fb 02          	sar    r11d,0x2
   140059f0b:	41 c1 fa 15          	sar    r10d,0x15
   140059f0f:	41 c1 fb 04          	sar    r11d,0x4
   140059f13:	41 c1 fb 09          	sar    r11d,0x9
   140059f17:	41 c1 fa 02          	sar    r10d,0x2
   140059f1b:	41 d1 fb             	sar    r11d,1
   140059f1e:	41 c1 fa 07          	sar    r10d,0x7
   140059f22:	41 c1 fb 0b          	sar    r11d,0xb
   140059f26:	41 c1 fb 1f          	sar    r11d,0x1f
   140059f2a:	41 d1 fb             	sar    r11d,1
   140059f2d:	41 d1 fa             	sar    r10d,1
   140059f30:	41 c1 fb 11          	sar    r11d,0x11
   140059f34:	41 c1 fb 15          	sar    r11d,0x15
   140059f38:	41 c1 fb 05          	sar    r11d,0x5
   140059f3c:	41 c1 fa 09          	sar    r10d,0x9
   140059f40:	41 c1 fb 15          	sar    r11d,0x15
   140059f44:	41 c1 fb 07          	sar    r11d,0x7
   140059f48:	41 c1 fa 0b          	sar    r10d,0xb
   140059f4c:	41 c1 fa 0b          	sar    r10d,0xb
   140059f50:	41 c1 fa 07          	sar    r10d,0x7
   140059f54:	41 d1 fa             	sar    r10d,1
   140059f57:	45 31 da             	xor    r10d,r11d
   140059f5a:	41 81 f2 83 80 86 4f 	xor    r10d,0x4f868083
   140059f61:	41 c1 fa 1f          	sar    r10d,0x1f
   140059f65:	45 89 d3             	mov    r11d,r10d
   140059f68:	41 ff c3             	inc    r11d
   140059f6b:	41 83 e3 fe          	and    r11d,0xfffffffe
   140059f6f:	45 85 db             	test   r11d,r11d
   140059f72:	75 0a                	jne    0x140059f7e
   140059f74:	49 c1 e3 26          	shl    r11,0x26
   140059f78:	46 8b 14 5c          	mov    r10d,DWORD PTR [rsp+r11*2]
   140059f7c:	eb 11                	jmp    0x140059f8f
   140059f7e:	41 c1 fa 0d          	sar    r10d,0xd
   140059f82:	49 bb 00 00 00 00 00 	movabs r11,0x10000000000
   140059f89:	01 00 00 
   140059f8c:	45 8b 13             	mov    r10d,DWORD PTR [r11]
   140059f8f:	41 5b                	pop    r11
   140059f91:	41 5a                	pop    r10
   140059f93:	9d                   	popf
   140059f94:	35 9d 00 00 00       	xor    eax,0x9d
   140059f99:	9c                   	pushf
   140059f9a:	41 51                	push   r9
   140059f9c:	41 52                	push   r10
   140059f9e:	41 b9 ce c9 18 56    	mov    r9d,0x5618c9ce
   140059fa4:	45 89 ca             	mov    r10d,r9d
   140059fa7:	41 c1 fa 15          	sar    r10d,0x15
   140059fab:	41 c1 fa 02          	sar    r10d,0x2
   140059faf:	41 c1 fa 02          	sar    r10d,0x2
   140059fb3:	41 c1 fa 09          	sar    r10d,0x9
   140059fb7:	41 c1 f9 08          	sar    r9d,0x8
   140059fbb:	41 c1 fa 0b          	sar    r10d,0xb
   140059fbf:	41 c1 fa 04          	sar    r10d,0x4
   140059fc3:	41 c1 f9 07          	sar    r9d,0x7
   140059fc7:	41 c1 fa 04          	sar    r10d,0x4
   140059fcb:	41 c1 fa 09          	sar    r10d,0x9
   140059fcf:	41 c1 f9 03          	sar    r9d,0x3
   140059fd3:	41 c1 f9 08          	sar    r9d,0x8
   140059fd7:	41 c1 fa 02          	sar    r10d,0x2
   140059fdb:	41 c1 f9 0b          	sar    r9d,0xb
   140059fdf:	41 c1 f9 08          	sar    r9d,0x8
   140059fe3:	41 c1 f9 15          	sar    r9d,0x15
   140059fe7:	41 d1 f9             	sar    r9d,1
   140059fea:	41 c1 f9 05          	sar    r9d,0x5
   140059fee:	41 d1 f9             	sar    r9d,1
   140059ff1:	41 c1 fa 05          	sar    r10d,0x5
   140059ff5:	41 c1 fa 0f          	sar    r10d,0xf
   140059ff9:	41 c1 fa 09          	sar    r10d,0x9
   140059ffd:	41 c1 fa 07          	sar    r10d,0x7
   14005a001:	41 c1 f9 03          	sar    r9d,0x3
   14005a005:	41 c1 fa 04          	sar    r10d,0x4
   14005a009:	41 c1 f9 07          	sar    r9d,0x7
   14005a00d:	41 c1 fa 11          	sar    r10d,0x11
   14005a011:	41 c1 fa 05          	sar    r10d,0x5
   14005a015:	41 c1 f9 05          	sar    r9d,0x5
   14005a019:	45 31 d1             	xor    r9d,r10d
   14005a01c:	41 81 f1 f2 bc 83 1a 	xor    r9d,0x1a83bcf2
   14005a023:	41 c1 f9 1f          	sar    r9d,0x1f
   14005a027:	45 89 ca             	mov    r10d,r9d
   14005a02a:	41 d1 fa             	sar    r10d,1
   14005a02d:	45 31 ca             	xor    r10d,r9d
   14005a030:	45 85 d2             	test   r10d,r10d
   14005a033:	75 0a                	jne    0x14005a03f
   14005a035:	49 c1 e2 28          	shl    r10,0x28
   14005a039:	46 8b 0c 54          	mov    r9d,DWORD PTR [rsp+r10*2]
   14005a03d:	eb 11                	jmp    0x14005a050
   14005a03f:	41 c1 f9 0d          	sar    r9d,0xd
   14005a043:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   14005a04a:	01 00 00 
   14005a04d:	45 8b 0a             	mov    r9d,DWORD PTR [r10]
   14005a050:	41 5a                	pop    r10
   14005a052:	41 59                	pop    r9
   14005a054:	9d                   	popf
   14005a055:	30 04 31             	xor    BYTE PTR [rcx+rsi*1],al
   14005a058:	9c                   	pushf
   14005a059:	41 51                	push   r9
   14005a05b:	41 52                	push   r10
   14005a05d:	49 b9 74 05 35 56 79 	movabs r9,0x66375a7956350574
   14005a064:	5a 37 66 
   14005a067:	4d 89 ca             	mov    r10,r9
   14005a06a:	49 c1 f9 02          	sar    r9,0x2
   14005a06e:	49 c1 f9 09          	sar    r9,0x9
   14005a072:	49 c1 fa 02          	sar    r10,0x2
   14005a076:	49 d1 f9             	sar    r9,1
   14005a079:	49 c1 fa 02          	sar    r10,0x2
   14005a07d:	49 c1 f9 0b          	sar    r9,0xb
   14005a081:	49 c1 fa 09          	sar    r10,0x9
   14005a085:	49 c1 f9 05          	sar    r9,0x5
   14005a089:	49 c1 f9 09          	sar    r9,0x9
   14005a08d:	49 c1 f9 1f          	sar    r9,0x1f
   14005a091:	49 c1 f9 11          	sar    r9,0x11
   14005a095:	49 c1 f9 0b          	sar    r9,0xb
   14005a099:	49 c1 fa 03          	sar    r10,0x3
   14005a09d:	49 c1 fa 11          	sar    r10,0x11
   14005a0a1:	49 c1 f9 07          	sar    r9,0x7
   14005a0a5:	49 c1 fa 05          	sar    r10,0x5
   14005a0a9:	49 c1 f9 07          	sar    r9,0x7
   14005a0ad:	49 d1 f9             	sar    r9,1
   14005a0b0:	49 c1 f9 1f          	sar    r9,0x1f
   14005a0b4:	49 c1 f9 04          	sar    r9,0x4
   14005a0b8:	49 c1 f9 05          	sar    r9,0x5
   14005a0bc:	49 d1 f9             	sar    r9,1
   14005a0bf:	49 c1 fa 04          	sar    r10,0x4
   14005a0c3:	49 c1 fa 04          	sar    r10,0x4
   14005a0c7:	49 c1 f9 05          	sar    r9,0x5
   14005a0cb:	49 c1 fa 1b          	sar    r10,0x1b
   14005a0cf:	49 c1 f9 02          	sar    r9,0x2
   14005a0d3:	4d 31 d1             	xor    r9,r10
   14005a0d6:	49 ba 45 42 06 d8 07 	movabs r10,0x5c39a107d8064245
   14005a0dd:	a1 39 5c 
   14005a0e0:	4d 31 d1             	xor    r9,r10
   14005a0e3:	49 c1 f9 3f          	sar    r9,0x3f
   14005a0e7:	4d 8d 51 01          	lea    r10,[r9+0x1]
   14005a0eb:	4d 0f af d1          	imul   r10,r9
   14005a0ef:	4d 85 d2             	test   r10,r10
   14005a0f2:	75 09                	jne    0x14005a0fd
   14005a0f4:	49 0f ca             	bswap  r10
   14005a0f7:	4e 8b 0c 14          	mov    r9,QWORD PTR [rsp+r10*1]
   14005a0fb:	eb 11                	jmp    0x14005a10e
   14005a0fd:	49 c1 f9 11          	sar    r9,0x11
   14005a101:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   14005a108:	01 00 00 
   14005a10b:	4d 8b 0a             	mov    r9,QWORD PTR [r10]
   14005a10e:	41 5a                	pop    r10
   14005a110:	41 59                	pop    r9
   14005a112:	9d                   	popf
   14005a113:	48 ff c1             	inc    rcx
   14005a116:	48 39 cf             	cmp    rdi,rcx
   14005a119:	0f 85 e1 fa ff ff    	jne    0x140059c00
   14005a11f:	9c                   	pushf
   14005a120:	41 52                	push   r10
   14005a122:	41 53                	push   r11
   14005a124:	49 ba b8 d1 c6 af 59 	movabs r10,0x5972dc59afc6d1b8
   14005a12b:	dc 72 59 
   14005a12e:	4d 89 d3             	mov    r11,r10
   14005a131:	49 c1 fa 0d          	sar    r10,0xd
   14005a135:	49 c1 fa 02          	sar    r10,0x2
   14005a139:	49 c1 fb 11          	sar    r11,0x11
   14005a13d:	49 c1 fb 15          	sar    r11,0x15
   14005a141:	49 c1 fa 03          	sar    r10,0x3
   14005a145:	49 c1 fb 11          	sar    r11,0x11
   14005a149:	49 c1 fb 1f          	sar    r11,0x1f
   14005a14d:	49 c1 fb 05          	sar    r11,0x5
   14005a151:	49 c1 fb 11          	sar    r11,0x11
   14005a155:	49 c1 fa 04          	sar    r10,0x4
   14005a159:	49 c1 fa 02          	sar    r10,0x2
   14005a15d:	49 c1 fa 07          	sar    r10,0x7
   14005a161:	49 c1 fb 09          	sar    r11,0x9
   14005a165:	49 c1 fb 02          	sar    r11,0x2
   14005a169:	49 d1 fb             	sar    r11,1
   14005a16c:	49 c1 fb 07          	sar    r11,0x7
   14005a170:	49 c1 fb 11          	sar    r11,0x11
   14005a174:	49 c1 fa 09          	sar    r10,0x9
   14005a178:	49 c1 fa 0d          	sar    r10,0xd
   14005a17c:	49 c1 fb 09          	sar    r11,0x9
   14005a180:	49 c1 fb 15          	sar    r11,0x15
   14005a184:	49 c1 fb 0d          	sar    r11,0xd
   14005a188:	49 d1 fb             	sar    r11,1
   14005a18b:	49 c1 fb 05          	sar    r11,0x5
   14005a18f:	49 c1 fb 15          	sar    r11,0x15
   14005a193:	49 c1 fa 03          	sar    r10,0x3
   14005a197:	4d 31 da             	xor    r10,r11
   14005a19a:	49 bb cc 60 e0 23 72 	movabs r11,0x749f477223e060cc
   14005a1a1:	47 9f 74 
   14005a1a4:	4d 31 da             	xor    r10,r11
   14005a1a7:	49 c1 fa 3f          	sar    r10,0x3f
   14005a1ab:	4d 89 d3             	mov    r11,r10
   14005a1ae:	49 d1 fb             	sar    r11,1
   14005a1b1:	4d 31 d3             	xor    r11,r10
   14005a1b4:	4d 85 db             	test   r11,r11
   14005a1b7:	75 0a                	jne    0x14005a1c3
   14005a1b9:	49 c1 e3 2a          	shl    r11,0x2a
   14005a1bd:	4e 8b 14 1c          	mov    r10,QWORD PTR [rsp+r11*1]
   14005a1c1:	eb 11                	jmp    0x14005a1d4
   14005a1c3:	49 c1 fa 11          	sar    r10,0x11
   14005a1c7:	49 bb 00 00 00 00 00 	movabs r11,0x10000000000
   14005a1ce:	01 00 00 
   14005a1d1:	4d 8b 13             	mov    r10,QWORD PTR [r11]
   14005a1d4:	41 5b                	pop    r11
   14005a1d6:	41 5a                	pop    r10
   14005a1d8:	9d                   	popf
   14005a1d9:	4d 8b 74 24 28       	mov    r14,QWORD PTR [r12+0x28]
   14005a1de:	9c                   	pushf
   14005a1df:	41 50                	push   r8
   14005a1e1:	41 51                	push   r9
   14005a1e3:	49 b8 54 d4 d5 e1 ce 	movabs r8,0x757b2ccee1d5d454
   14005a1ea:	2c 7b 75 
   14005a1ed:	4d 89 c1             	mov    r9,r8
   14005a1f0:	49 c1 f8 02          	sar    r8,0x2
   14005a1f4:	49 c1 f9 0d          	sar    r9,0xd
   14005a1f8:	49 c1 f8 1b          	sar    r8,0x1b
   14005a1fc:	49 c1 f8 0b          	sar    r8,0xb
   14005a200:	49 c1 f9 1f          	sar    r9,0x1f
   14005a204:	49 c1 f8 1f          	sar    r8,0x1f
   14005a208:	49 d1 f8             	sar    r8,1
   14005a20b:	49 c1 f8 02          	sar    r8,0x2
   14005a20f:	49 c1 f8 15          	sar    r8,0x15
   14005a213:	49 c1 f9 04          	sar    r9,0x4
   14005a217:	49 c1 f8 03          	sar    r8,0x3
   14005a21b:	49 c1 f8 1b          	sar    r8,0x1b
   14005a21f:	49 c1 f9 03          	sar    r9,0x3
   14005a223:	49 c1 f9 1b          	sar    r9,0x1b
   14005a227:	49 c1 f9 0b          	sar    r9,0xb
   14005a22b:	49 c1 f8 03          	sar    r8,0x3
   14005a22f:	49 c1 f8 02          	sar    r8,0x2
   14005a233:	49 c1 f8 05          	sar    r8,0x5
   14005a237:	49 c1 f8 02          	sar    r8,0x2
   14005a23b:	49 c1 f9 05          	sar    r9,0x5
   14005a23f:	49 c1 f9 1f          	sar    r9,0x1f
   14005a243:	49 c1 f8 1b          	sar    r8,0x1b
   14005a247:	49 c1 f9 0b          	sar    r9,0xb
   14005a24b:	49 c1 f8 03          	sar    r8,0x3
   14005a24f:	49 c1 f8 15          	sar    r8,0x15
   14005a253:	49 c1 f8 05          	sar    r8,0x5
   14005a257:	49 c1 f9 0d          	sar    r9,0xd
   14005a25b:	49 c1 f8 04          	sar    r8,0x4
   14005a25f:	49 c1 f8 05          	sar    r8,0x5
   14005a263:	49 c1 f9 04          	sar    r9,0x4
   14005a267:	49 c1 f9 0b          	sar    r9,0xb
   14005a26b:	49 c1 f9 0d          	sar    r9,0xd
   14005a26f:	49 c1 f8 0d          	sar    r8,0xd
   14005a273:	4d 31 c8             	xor    r8,r9
   14005a276:	49 b9 62 7a 64 e1 85 	movabs r9,0x2cceea85e1647a62
   14005a27d:	ea ce 2c 
   14005a280:	4d 31 c8             	xor    r8,r9
   14005a283:	49 c1 f8 3f          	sar    r8,0x3f
   14005a287:	4d 89 c1             	mov    r9,r8
   14005a28a:	49 ff c1             	inc    r9
   14005a28d:	49 83 e1 fe          	and    r9,0xfffffffffffffffe
   14005a291:	4d 85 c9             	test   r9,r9
   14005a294:	75 09                	jne    0x14005a29f
   14005a296:	49 0f c9             	bswap  r9
   14005a299:	4e 8b 04 0c          	mov    r8,QWORD PTR [rsp+r9*1]
   14005a29d:	eb 11                	jmp    0x14005a2b0
   14005a29f:	49 c1 f8 11          	sar    r8,0x11
   14005a2a3:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   14005a2aa:	01 00 00 
   14005a2ad:	4d 8b 01             	mov    r8,QWORD PTR [r9]
   14005a2b0:	41 59                	pop    r9
   14005a2b2:	41 58                	pop    r8
   14005a2b4:	9d                   	popf
   14005a2b5:	41 ff 54 24 30       	call   QWORD PTR [r12+0x30]
   14005a2ba:	9c                   	pushf
   14005a2bb:	57                   	push   rdi
   14005a2bc:	53                   	push   rbx
   14005a2bd:	48 bf 3f e8 9e aa 67 	movabs rdi,0x73184e67aa9ee83f
   14005a2c4:	4e 18 73 
   14005a2c7:	48 89 fb             	mov    rbx,rdi
   14005a2ca:	48 c1 fb 0b          	sar    rbx,0xb
   14005a2ce:	48 c1 fb 1f          	sar    rbx,0x1f
   14005a2d2:	48 c1 ff 11          	sar    rdi,0x11
   14005a2d6:	48 c1 ff 07          	sar    rdi,0x7
   14005a2da:	48 c1 ff 1f          	sar    rdi,0x1f
   14005a2de:	48 d1 fb             	sar    rbx,1
   14005a2e1:	48 c1 ff 0d          	sar    rdi,0xd
   14005a2e5:	48 c1 fb 1b          	sar    rbx,0x1b
   14005a2e9:	48 c1 fb 1b          	sar    rbx,0x1b
   14005a2ed:	48 c1 fb 15          	sar    rbx,0x15
   14005a2f1:	48 c1 ff 1b          	sar    rdi,0x1b
   14005a2f5:	48 c1 fb 1b          	sar    rbx,0x1b
   14005a2f9:	48 d1 fb             	sar    rbx,1
   14005a2fc:	48 c1 fb 11          	sar    rbx,0x11
   14005a300:	48 c1 fb 02          	sar    rbx,0x2
   14005a304:	48 c1 fb 1f          	sar    rbx,0x1f
   14005a308:	48 c1 fb 07          	sar    rbx,0x7
   14005a30c:	48 c1 fb 05          	sar    rbx,0x5
   14005a310:	48 c1 fb 09          	sar    rbx,0x9
   14005a314:	48 c1 ff 03          	sar    rdi,0x3
   14005a318:	48 c1 fb 11          	sar    rbx,0x11
   14005a31c:	48 c1 ff 0b          	sar    rdi,0xb
   14005a320:	48 c1 fb 1f          	sar    rbx,0x1f
   14005a324:	48 c1 fb 15          	sar    rbx,0x15
   14005a328:	48 c1 ff 0d          	sar    rdi,0xd
   14005a32c:	48 c1 ff 1b          	sar    rdi,0x1b
   14005a330:	48 c1 ff 07          	sar    rdi,0x7
   14005a334:	48 c1 ff 07          	sar    rdi,0x7
   14005a338:	48 31 df             	xor    rdi,rbx
   14005a33b:	48 bb 93 54 d4 8f 12 	movabs rbx,0x2df154128fd45493
   14005a342:	54 f1 2d 
   14005a345:	48 31 df             	xor    rdi,rbx
   14005a348:	48 c1 ff 3f          	sar    rdi,0x3f
   14005a34c:	48 8d 5f 01          	lea    rbx,[rdi+0x1]
   14005a350:	48 0f af df          	imul   rbx,rdi
   14005a354:	48 85 db             	test   rbx,rbx
   14005a357:	75 0a                	jne    0x14005a363
   14005a359:	48 c1 e3 2a          	shl    rbx,0x2a
   14005a35d:	48 8b 3c 1c          	mov    rdi,QWORD PTR [rsp+rbx*1]
   14005a361:	eb 11                	jmp    0x14005a374
   14005a363:	48 c1 ff 11          	sar    rdi,0x11
   14005a367:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   14005a36e:	01 00 00 
   14005a371:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
   14005a374:	5b                   	pop    rbx
   14005a375:	5f                   	pop    rdi
   14005a376:	9d                   	popf
   14005a377:	48 89 c1             	mov    rcx,rax
   14005a37a:	9c                   	pushf
   14005a37b:	41 50                	push   r8
   14005a37d:	41 51                	push   r9
   14005a37f:	41 b8 3a 4f c1 26    	mov    r8d,0x26c14f3a
   14005a385:	45 89 c1             	mov    r9d,r8d
   14005a388:	41 c1 f9 11          	sar    r9d,0x11
   14005a38c:	41 c1 f9 04          	sar    r9d,0x4
   14005a390:	41 c1 f8 03          	sar    r8d,0x3
   14005a394:	41 c1 f8 11          	sar    r8d,0x11
   14005a398:	41 c1 f9 1f          	sar    r9d,0x1f
   14005a39c:	41 c1 f9 0f          	sar    r9d,0xf
   14005a3a0:	41 c1 f9 07          	sar    r9d,0x7
   14005a3a4:	41 d1 f9             	sar    r9d,1
   14005a3a7:	41 c1 f9 02          	sar    r9d,0x2
   14005a3ab:	41 c1 f8 05          	sar    r8d,0x5
   14005a3af:	41 c1 f9 15          	sar    r9d,0x15
   14005a3b3:	41 c1 f8 15          	sar    r8d,0x15
   14005a3b7:	41 c1 f8 1f          	sar    r8d,0x1f
   14005a3bb:	41 c1 f9 04          	sar    r9d,0x4
   14005a3bf:	41 c1 f8 1f          	sar    r8d,0x1f
   14005a3c3:	41 d1 f8             	sar    r8d,1
   14005a3c6:	41 c1 f8 03          	sar    r8d,0x3
   14005a3ca:	41 c1 f9 05          	sar    r9d,0x5
   14005a3ce:	41 c1 f8 1f          	sar    r8d,0x1f
   14005a3d2:	41 c1 f8 15          	sar    r8d,0x15
   14005a3d6:	41 c1 f8 08          	sar    r8d,0x8
   14005a3da:	41 c1 f9 05          	sar    r9d,0x5
   14005a3de:	41 c1 f8 0b          	sar    r8d,0xb
   14005a3e2:	41 d1 f8             	sar    r8d,1
   14005a3e5:	41 c1 f9 05          	sar    r9d,0x5
   14005a3e9:	41 d1 f9             	sar    r9d,1
   14005a3ec:	41 c1 f9 0d          	sar    r9d,0xd
   14005a3f0:	41 c1 f8 0b          	sar    r8d,0xb
   14005a3f4:	41 c1 f9 0f          	sar    r9d,0xf
   14005a3f8:	41 c1 f8 05          	sar    r8d,0x5
   14005a3fc:	41 c1 f9 0f          	sar    r9d,0xf
   14005a400:	41 c1 f8 1f          	sar    r8d,0x1f
   14005a404:	41 c1 f8 04          	sar    r8d,0x4
   14005a408:	41 d1 f9             	sar    r9d,1
   14005a40b:	41 c1 f9 0b          	sar    r9d,0xb
   14005a40f:	45 31 c8             	xor    r8d,r9d
   14005a412:	41 81 f0 ca 27 c2 32 	xor    r8d,0x32c227ca
   14005a419:	41 c1 f8 1f          	sar    r8d,0x1f
   14005a41d:	45 89 c1             	mov    r9d,r8d
   14005a420:	41 d1 f9             	sar    r9d,1
   14005a423:	45 31 c1             	xor    r9d,r8d
   14005a426:	45 85 c9             	test   r9d,r9d
   14005a429:	75 0a                	jne    0x14005a435
   14005a42b:	49 c1 e1 28          	shl    r9,0x28
   14005a42f:	46 8b 04 0c          	mov    r8d,DWORD PTR [rsp+r9*1]
   14005a433:	eb 11                	jmp    0x14005a446
   14005a435:	41 c1 f8 0d          	sar    r8d,0xd
   14005a439:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   14005a440:	01 00 00 
   14005a443:	45 8b 01             	mov    r8d,DWORD PTR [r9]
   14005a446:	41 59                	pop    r9
   14005a448:	41 58                	pop    r8
   14005a44a:	9d                   	popf
   14005a44b:	48 89 f2             	mov    rdx,rsi
   14005a44e:	9c                   	pushf
   14005a44f:	50                   	push   rax
   14005a450:	52                   	push   rdx
   14005a451:	b8 1f ef cc 14       	mov    eax,0x14ccef1f
   14005a456:	89 c2                	mov    edx,eax
   14005a458:	c1 f8 11             	sar    eax,0x11
   14005a45b:	c1 f8 09             	sar    eax,0x9
   14005a45e:	c1 fa 02             	sar    edx,0x2
   14005a461:	c1 fa 03             	sar    edx,0x3
   14005a464:	d1 fa                	sar    edx,1
   14005a466:	c1 fa 0f             	sar    edx,0xf
   14005a469:	c1 fa 07             	sar    edx,0x7
   14005a46c:	d1 f8                	sar    eax,1
   14005a46e:	c1 fa 07             	sar    edx,0x7
   14005a471:	c1 fa 09             	sar    edx,0x9
   14005a474:	c1 fa 09             	sar    edx,0x9
   14005a477:	c1 fa 02             	sar    edx,0x2
   14005a47a:	c1 fa 02             	sar    edx,0x2
   14005a47d:	c1 f8 05             	sar    eax,0x5
   14005a480:	c1 f8 0b             	sar    eax,0xb
   14005a483:	c1 f8 11             	sar    eax,0x11
   14005a486:	c1 f8 02             	sar    eax,0x2
   14005a489:	c1 fa 05             	sar    edx,0x5
   14005a48c:	c1 f8 03             	sar    eax,0x3
   14005a48f:	c1 f8 15             	sar    eax,0x15
   14005a492:	c1 f8 1f             	sar    eax,0x1f
   14005a495:	c1 f8 0b             	sar    eax,0xb
   14005a498:	d1 f8                	sar    eax,1
   14005a49a:	c1 f8 07             	sar    eax,0x7
   14005a49d:	c1 fa 15             	sar    edx,0x15
   14005a4a0:	d1 f8                	sar    eax,1
   14005a4a2:	c1 fa 0d             	sar    edx,0xd
   14005a4a5:	d1 fa                	sar    edx,1
   14005a4a7:	c1 f8 03             	sar    eax,0x3
   14005a4aa:	d1 f8                	sar    eax,1
   14005a4ac:	c1 f8 07             	sar    eax,0x7
   14005a4af:	c1 f8 1f             	sar    eax,0x1f
   14005a4b2:	c1 fa 07             	sar    edx,0x7
   14005a4b5:	c1 fa 03             	sar    edx,0x3
   14005a4b8:	c1 f8 03             	sar    eax,0x3
   14005a4bb:	31 d0                	xor    eax,edx
   14005a4bd:	35 b1 56 27 6b       	xor    eax,0x6b2756b1
   14005a4c2:	c1 f8 1f             	sar    eax,0x1f
   14005a4c5:	89 c2                	mov    edx,eax
   14005a4c7:	d1 fa                	sar    edx,1
   14005a4c9:	31 c2                	xor    edx,eax
   14005a4cb:	85 d2                	test   edx,edx
   14005a4cd:	75 09                	jne    0x14005a4d8
   14005a4cf:	48 c1 e2 2a          	shl    rdx,0x2a
   14005a4d3:	8b 04 54             	mov    eax,DWORD PTR [rsp+rdx*2]
   14005a4d6:	eb 0f                	jmp    0x14005a4e7
   14005a4d8:	c1 f8 0d             	sar    eax,0xd
   14005a4db:	48 ba 00 00 00 00 00 	movabs rdx,0x10000000000
   14005a4e2:	01 00 00 
   14005a4e5:	8b 02                	mov    eax,DWORD PTR [rdx]
   14005a4e7:	5a                   	pop    rdx
   14005a4e8:	58                   	pop    rax
   14005a4e9:	9d                   	popf
   14005a4ea:	49 89 f8             	mov    r8,rdi
   14005a4ed:	9c                   	pushf
   14005a4ee:	57                   	push   rdi
   14005a4ef:	53                   	push   rbx
   14005a4f0:	bf 32 79 4f 65       	mov    edi,0x654f7932
   14005a4f5:	89 fb                	mov    ebx,edi
   14005a4f7:	c1 ff 05             	sar    edi,0x5
   14005a4fa:	c1 fb 0d             	sar    ebx,0xd
   14005a4fd:	c1 ff 05             	sar    edi,0x5
   14005a500:	c1 ff 07             	sar    edi,0x7
   14005a503:	c1 fb 03             	sar    ebx,0x3
   14005a506:	c1 ff 0d             	sar    edi,0xd
   14005a509:	c1 fb 08             	sar    ebx,0x8
   14005a50c:	c1 ff 1f             	sar    edi,0x1f
   14005a50f:	c1 ff 03             	sar    edi,0x3
   14005a512:	c1 fb 15             	sar    ebx,0x15
   14005a515:	c1 ff 0b             	sar    edi,0xb
   14005a518:	c1 fb 09             	sar    ebx,0x9
   14005a51b:	d1 ff                	sar    edi,1
   14005a51d:	c1 ff 08             	sar    edi,0x8
   14005a520:	c1 fb 0f             	sar    ebx,0xf
   14005a523:	d1 ff                	sar    edi,1
   14005a525:	c1 ff 04             	sar    edi,0x4
   14005a528:	c1 ff 08             	sar    edi,0x8
   14005a52b:	c1 ff 07             	sar    edi,0x7
   14005a52e:	c1 fb 04             	sar    ebx,0x4
   14005a531:	c1 ff 05             	sar    edi,0x5
   14005a534:	c1 ff 0b             	sar    edi,0xb
   14005a537:	c1 fb 09             	sar    ebx,0x9
   14005a53a:	c1 fb 05             	sar    ebx,0x5
   14005a53d:	c1 ff 09             	sar    edi,0x9
   14005a540:	c1 ff 0f             	sar    edi,0xf
   14005a543:	c1 fb 03             	sar    ebx,0x3
   14005a546:	c1 ff 11             	sar    edi,0x11
   14005a549:	c1 fb 15             	sar    ebx,0x15
   14005a54c:	c1 ff 11             	sar    edi,0x11
   14005a54f:	c1 fb 11             	sar    ebx,0x11
   14005a552:	c1 ff 11             	sar    edi,0x11
   14005a555:	c1 ff 0f             	sar    edi,0xf
   14005a558:	c1 fb 0b             	sar    ebx,0xb
   14005a55b:	31 df                	xor    edi,ebx
   14005a55d:	81 f7 57 bc 26 59    	xor    edi,0x5926bc57
   14005a563:	c1 ff 1f             	sar    edi,0x1f
   14005a566:	89 fb                	mov    ebx,edi
   14005a568:	d1 fb                	sar    ebx,1
   14005a56a:	31 fb                	xor    ebx,edi
   14005a56c:	85 db                	test   ebx,ebx
   14005a56e:	75 09                	jne    0x14005a579
   14005a570:	48 c1 e3 2a          	shl    rbx,0x2a
   14005a574:	8b 3c 1c             	mov    edi,DWORD PTR [rsp+rbx*1]
   14005a577:	eb 0f                	jmp    0x14005a588
   14005a579:	c1 ff 0d             	sar    edi,0xd
   14005a57c:	48 bb 00 00 00 00 00 	movabs rbx,0x10000000000
   14005a583:	01 00 00 
   14005a586:	8b 3b                	mov    edi,DWORD PTR [rbx]
   14005a588:	5b                   	pop    rbx
   14005a589:	5f                   	pop    rdi
   14005a58a:	9d                   	popf
   14005a58b:	41 ff d6             	call   r14
   14005a58e:	9c                   	pushf
   14005a58f:	51                   	push   rcx
   14005a590:	41 50                	push   r8
   14005a592:	48 b9 9c e4 92 5a a6 	movabs rcx,0x3090b7a65a92e49c
   14005a599:	b7 90 30 
   14005a59c:	49 89 c8             	mov    r8,rcx
   14005a59f:	49 c1 f8 05          	sar    r8,0x5
   14005a5a3:	48 c1 f9 02          	sar    rcx,0x2
   14005a5a7:	48 c1 f9 15          	sar    rcx,0x15
   14005a5ab:	49 c1 f8 11          	sar    r8,0x11
   14005a5af:	49 c1 f8 0b          	sar    r8,0xb
   14005a5b3:	49 c1 f8 09          	sar    r8,0x9
   14005a5b7:	49 c1 f8 0b          	sar    r8,0xb
   14005a5bb:	48 d1 f9             	sar    rcx,1
   14005a5be:	49 c1 f8 05          	sar    r8,0x5
   14005a5c2:	49 d1 f8             	sar    r8,1
   14005a5c5:	48 d1 f9             	sar    rcx,1
   14005a5c8:	48 c1 f9 1f          	sar    rcx,0x1f
   14005a5cc:	48 c1 f9 07          	sar    rcx,0x7
   14005a5d0:	48 c1 f9 07          	sar    rcx,0x7
   14005a5d4:	48 c1 f9 03          	sar    rcx,0x3
   14005a5d8:	48 c1 f9 05          	sar    rcx,0x5
   14005a5dc:	49 c1 f8 09          	sar    r8,0x9
   14005a5e0:	48 c1 f9 04          	sar    rcx,0x4
   14005a5e4:	49 c1 f8 05          	sar    r8,0x5
   14005a5e8:	49 c1 f8 0d          	sar    r8,0xd
   14005a5ec:	48 d1 f9             	sar    rcx,1
   14005a5ef:	49 c1 f8 03          	sar    r8,0x3
   14005a5f3:	48 c1 f9 05          	sar    rcx,0x5
   14005a5f7:	49 c1 f8 1b          	sar    r8,0x1b
   14005a5fb:	48 c1 f9 0d          	sar    rcx,0xd
   14005a5ff:	49 c1 f8 1b          	sar    r8,0x1b
   14005a603:	48 c1 f9 04          	sar    rcx,0x4
   14005a607:	48 c1 f9 09          	sar    rcx,0x9
   14005a60b:	48 c1 f9 1b          	sar    rcx,0x1b
   14005a60f:	49 c1 f8 15          	sar    r8,0x15
   14005a613:	48 c1 f9 1b          	sar    rcx,0x1b
   14005a617:	48 c1 f9 0d          	sar    rcx,0xd
   14005a61b:	49 c1 f8 11          	sar    r8,0x11
   14005a61f:	49 c1 f8 0d          	sar    r8,0xd
   14005a623:	4c 31 c1             	xor    rcx,r8
   14005a626:	49 b8 9b 22 2b 21 b3 	movabs r8,0x5d9421b3212b229b
   14005a62d:	21 94 5d 
   14005a630:	4c 31 c1             	xor    rcx,r8
   14005a633:	48 c1 f9 3f          	sar    rcx,0x3f
   14005a637:	49 89 c8             	mov    r8,rcx
   14005a63a:	49 ff c0             	inc    r8
   14005a63d:	49 83 e0 fe          	and    r8,0xfffffffffffffffe
   14005a641:	4d 85 c0             	test   r8,r8
   14005a644:	75 0a                	jne    0x14005a650
   14005a646:	49 c1 e0 26          	shl    r8,0x26
   14005a64a:	4a 8b 0c c4          	mov    rcx,QWORD PTR [rsp+r8*8]
   14005a64e:	eb 11                	jmp    0x14005a661
   14005a650:	48 c1 f9 11          	sar    rcx,0x11
   14005a654:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   14005a65b:	01 00 00 
   14005a65e:	49 8b 08             	mov    rcx,QWORD PTR [r8]
   14005a661:	41 58                	pop    r8
   14005a663:	59                   	pop    rcx
   14005a664:	9d                   	popf
   14005a665:	44 8b 44 24 2c       	mov    r8d,DWORD PTR [rsp+0x2c]
   14005a66a:	9c                   	pushf
   14005a66b:	41 50                	push   r8
   14005a66d:	41 51                	push   r9
   14005a66f:	49 b8 d7 9f 6e 5d 5d 	movabs r8,0x425b105d5d6e9fd7
   14005a676:	10 5b 42 
   14005a679:	4d 89 c1             	mov    r9,r8
   14005a67c:	49 d1 f8             	sar    r8,1
   14005a67f:	49 c1 f8 1f          	sar    r8,0x1f
   14005a683:	49 c1 f8 1f          	sar    r8,0x1f
   14005a687:	49 c1 f9 02          	sar    r9,0x2
   14005a68b:	49 c1 f8 07          	sar    r8,0x7
   14005a68f:	49 c1 f9 02          	sar    r9,0x2
   14005a693:	49 d1 f9             	sar    r9,1
   14005a696:	49 c1 f8 1f          	sar    r8,0x1f
   14005a69a:	49 c1 f9 09          	sar    r9,0x9
   14005a69e:	49 c1 f8 1f          	sar    r8,0x1f
   14005a6a2:	49 c1 f8 05          	sar    r8,0x5
   14005a6a6:	49 c1 f9 0d          	sar    r9,0xd
   14005a6aa:	49 c1 f8 04          	sar    r8,0x4
   14005a6ae:	49 d1 f9             	sar    r9,1
   14005a6b1:	49 c1 f9 02          	sar    r9,0x2
   14005a6b5:	49 c1 f9 04          	sar    r9,0x4
   14005a6b9:	49 c1 f8 09          	sar    r8,0x9
   14005a6bd:	49 c1 f8 15          	sar    r8,0x15
   14005a6c1:	49 c1 f8 1f          	sar    r8,0x1f
   14005a6c5:	49 c1 f8 11          	sar    r8,0x11
   14005a6c9:	49 c1 f8 0d          	sar    r8,0xd
   14005a6cd:	49 c1 f9 11          	sar    r9,0x11
   14005a6d1:	49 c1 f9 03          	sar    r9,0x3
   14005a6d5:	49 c1 f9 1b          	sar    r9,0x1b
   14005a6d9:	49 c1 f8 05          	sar    r8,0x5
   14005a6dd:	49 c1 f8 02          	sar    r8,0x2
   14005a6e1:	49 c1 f8 1f          	sar    r8,0x1f
   14005a6e5:	49 d1 f8             	sar    r8,1
   14005a6e8:	49 d1 f9             	sar    r9,1
   14005a6eb:	49 c1 f9 03          	sar    r9,0x3
   14005a6ef:	49 c1 f8 04          	sar    r8,0x4
   14005a6f3:	4d 31 c8             	xor    r8,r9
   14005a6f6:	49 b9 55 a4 e1 40 7c 	movabs r9,0x41bd597c40e1a455
   14005a6fd:	59 bd 41 
   14005a700:	4d 31 c8             	xor    r8,r9
   14005a703:	49 c1 f8 3f          	sar    r8,0x3f
   14005a707:	4d 89 c1             	mov    r9,r8
   14005a70a:	49 d1 f9             	sar    r9,1
   14005a70d:	4d 31 c1             	xor    r9,r8
   14005a710:	4d 85 c9             	test   r9,r9
   14005a713:	75 09                	jne    0x14005a71e
   14005a715:	49 0f c9             	bswap  r9
   14005a718:	4e 8b 04 0c          	mov    r8,QWORD PTR [rsp+r9*1]
   14005a71c:	eb 11                	jmp    0x14005a72f
   14005a71e:	49 c1 f8 11          	sar    r8,0x11
   14005a722:	49 b9 00 00 00 00 00 	movabs r9,0x10000000000
   14005a729:	01 00 00 
   14005a72c:	4d 8b 01             	mov    r8,QWORD PTR [r9]
   14005a72f:	41 59                	pop    r9
   14005a731:	41 58                	pop    r8
   14005a733:	9d                   	popf
   14005a734:	4c 8d 4c 24 2c       	lea    r9,[rsp+0x2c]
   14005a739:	9c                   	pushf
   14005a73a:	41 51                	push   r9
   14005a73c:	41 52                	push   r10
   14005a73e:	41 b9 e4 bd a2 48    	mov    r9d,0x48a2bde4
   14005a744:	45 89 ca             	mov    r10d,r9d
   14005a747:	41 c1 f9 0b          	sar    r9d,0xb
   14005a74b:	41 d1 f9             	sar    r9d,1
   14005a74e:	41 c1 f9 1f          	sar    r9d,0x1f
   14005a752:	41 c1 f9 11          	sar    r9d,0x11
   14005a756:	41 c1 f9 04          	sar    r9d,0x4
   14005a75a:	41 c1 fa 11          	sar    r10d,0x11
   14005a75e:	41 c1 f9 02          	sar    r9d,0x2
   14005a762:	41 c1 fa 07          	sar    r10d,0x7
   14005a766:	41 c1 fa 08          	sar    r10d,0x8
   14005a76a:	41 c1 fa 03          	sar    r10d,0x3
   14005a76e:	41 c1 f9 0f          	sar    r9d,0xf
   14005a772:	41 d1 fa             	sar    r10d,1
   14005a775:	41 d1 f9             	sar    r9d,1
   14005a778:	41 c1 fa 0d          	sar    r10d,0xd
   14005a77c:	41 c1 fa 11          	sar    r10d,0x11
   14005a780:	41 c1 fa 1f          	sar    r10d,0x1f
   14005a784:	41 c1 f9 0d          	sar    r9d,0xd
   14005a788:	41 c1 fa 08          	sar    r10d,0x8
   14005a78c:	41 c1 f9 08          	sar    r9d,0x8
   14005a790:	41 d1 fa             	sar    r10d,1
   14005a793:	41 c1 fa 03          	sar    r10d,0x3
   14005a797:	41 c1 fa 08          	sar    r10d,0x8
   14005a79b:	41 c1 fa 05          	sar    r10d,0x5
   14005a79f:	41 c1 fa 1f          	sar    r10d,0x1f
   14005a7a3:	41 c1 fa 05          	sar    r10d,0x5
   14005a7a7:	41 c1 f9 0d          	sar    r9d,0xd
   14005a7ab:	41 c1 f9 0b          	sar    r9d,0xb
   14005a7af:	41 c1 f9 05          	sar    r9d,0x5
   14005a7b3:	41 c1 fa 0b          	sar    r10d,0xb
   14005a7b7:	41 c1 f9 09          	sar    r9d,0x9
   14005a7bb:	41 c1 fa 0b          	sar    r10d,0xb
   14005a7bf:	41 d1 fa             	sar    r10d,1
   14005a7c2:	41 c1 f9 02          	sar    r9d,0x2
   14005a7c6:	45 31 d1             	xor    r9d,r10d
   14005a7c9:	41 81 f1 bb 55 04 38 	xor    r9d,0x380455bb
   14005a7d0:	41 c1 f9 1f          	sar    r9d,0x1f
   14005a7d4:	45 89 ca             	mov    r10d,r9d
   14005a7d7:	41 ff c2             	inc    r10d
   14005a7da:	41 83 e2 fe          	and    r10d,0xfffffffe
   14005a7de:	45 85 d2             	test   r10d,r10d
   14005a7e1:	75 09                	jne    0x14005a7ec
   14005a7e3:	49 0f ca             	bswap  r10
   14005a7e6:	46 8b 0c 14          	mov    r9d,DWORD PTR [rsp+r10*1]
   14005a7ea:	eb 11                	jmp    0x14005a7fd
   14005a7ec:	41 c1 f9 0d          	sar    r9d,0xd
   14005a7f0:	49 ba 00 00 00 00 00 	movabs r10,0x10000000000
   14005a7f7:	01 00 00 
   14005a7fa:	45 8b 0a             	mov    r9d,DWORD PTR [r10]
   14005a7fd:	41 5a                	pop    r10
   14005a7ff:	41 59                	pop    r9
   14005a801:	9d                   	popf
   14005a802:	48 89 f1             	mov    rcx,rsi
   14005a805:	9c                   	pushf
   14005a806:	51                   	push   rcx
   14005a807:	41 50                	push   r8
   14005a809:	48 b9 f1 90 83 9e 49 	movabs rcx,0x4be3ca499e8390f1
   14005a810:	ca e3 4b 
   14005a813:	49 89 c8             	mov    r8,rcx
   14005a816:	49 c1 f8 11          	sar    r8,0x11
   14005a81a:	48 c1 f9 04          	sar    rcx,0x4
   14005a81e:	48 c1 f9 05          	sar    rcx,0x5
   14005a822:	49 c1 f8 11          	sar    r8,0x11
   14005a826:	48 d1 f9             	sar    rcx,1
   14005a829:	48 d1 f9             	sar    rcx,1
   14005a82c:	49 c1 f8 1f          	sar    r8,0x1f
   14005a830:	48 c1 f9 09          	sar    rcx,0x9
   14005a834:	48 d1 f9             	sar    rcx,1
   14005a837:	48 c1 f9 1f          	sar    rcx,0x1f
   14005a83b:	49 d1 f8             	sar    r8,1
   14005a83e:	48 c1 f9 11          	sar    rcx,0x11
   14005a842:	48 c1 f9 0b          	sar    rcx,0xb
   14005a846:	49 c1 f8 05          	sar    r8,0x5
   14005a84a:	48 c1 f9 1f          	sar    rcx,0x1f
   14005a84e:	48 c1 f9 1b          	sar    rcx,0x1b
   14005a852:	48 c1 f9 15          	sar    rcx,0x15
   14005a856:	49 c1 f8 1f          	sar    r8,0x1f
   14005a85a:	49 c1 f8 07          	sar    r8,0x7
   14005a85e:	48 c1 f9 03          	sar    rcx,0x3
   14005a862:	48 c1 f9 04          	sar    rcx,0x4
   14005a866:	49 c1 f8 03          	sar    r8,0x3
   14005a86a:	48 c1 f9 03          	sar    rcx,0x3
   14005a86e:	48 c1 f9 04          	sar    rcx,0x4
   14005a872:	48 c1 f9 1f          	sar    rcx,0x1f
   14005a876:	48 d1 f9             	sar    rcx,1
   14005a879:	48 d1 f9             	sar    rcx,1
   14005a87c:	49 d1 f8             	sar    r8,1
   14005a87f:	49 c1 f8 15          	sar    r8,0x15
   14005a883:	48 c1 f9 02          	sar    rcx,0x2
   14005a887:	49 c1 f8 04          	sar    r8,0x4
   14005a88b:	49 c1 f8 0b          	sar    r8,0xb
   14005a88f:	48 c1 f9 05          	sar    rcx,0x5
   14005a893:	4c 31 c1             	xor    rcx,r8
   14005a896:	49 b8 d9 8f 81 a5 7b 	movabs r8,0x7ed03d7ba5818fd9
   14005a89d:	3d d0 7e 
   14005a8a0:	4c 31 c1             	xor    rcx,r8
   14005a8a3:	48 c1 f9 3f          	sar    rcx,0x3f
   14005a8a7:	49 89 c8             	mov    r8,rcx
   14005a8aa:	49 d1 f8             	sar    r8,1
   14005a8ad:	49 31 c8             	xor    r8,rcx
   14005a8b0:	4d 85 c0             	test   r8,r8
   14005a8b3:	75 0a                	jne    0x14005a8bf
   14005a8b5:	49 c1 e0 26          	shl    r8,0x26
   14005a8b9:	4a 8b 0c 04          	mov    rcx,QWORD PTR [rsp+r8*1]
   14005a8bd:	eb 11                	jmp    0x14005a8d0
   14005a8bf:	48 c1 f9 11          	sar    rcx,0x11
   14005a8c3:	49 b8 00 00 00 00 00 	movabs r8,0x10000000000
   14005a8ca:	01 00 00 
   14005a8cd:	49 8b 08             	mov    rcx,QWORD PTR [r8]
   14005a8d0:	41 58                	pop    r8
   14005a8d2:	59                   	pop    rcx
   14005a8d3:	9d                   	popf
   14005a8d4:	48 89 fa             	mov    rdx,rdi
   14005a8d7:	9c                   	pushf
   14005a8d8:	50                   	push   rax
   14005a8d9:	51                   	push   rcx
   14005a8da:	b8 b0 24 87 7c       	mov    eax,0x7c8724b0
   14005a8df:	89 c1                	mov    ecx,eax
   14005a8e1:	c1 f8 08             	sar    eax,0x8
   14005a8e4:	c1 f8 15             	sar    eax,0x15
   14005a8e7:	c1 f9 07             	sar    ecx,0x7
   14005a8ea:	c1 f9 0b             	sar    ecx,0xb
   14005a8ed:	c1 f9 05             	sar    ecx,0x5
   14005a8f0:	c1 f8 09             	sar    eax,0x9
   14005a8f3:	c1 f8 04             	sar    eax,0x4
   14005a8f6:	c1 f8 0b             	sar    eax,0xb
   14005a8f9:	c1 f9 07             	sar    ecx,0x7
   14005a8fc:	c1 f9 03             	sar    ecx,0x3
   14005a8ff:	c1 f8 09             	sar    eax,0x9
   14005a902:	c1 f8 0b             	sar    eax,0xb
   14005a905:	c1 f8 02             	sar    eax,0x2
   14005a908:	c1 f9 07             	sar    ecx,0x7
   14005a90b:	c1 f8 0b             	sar    eax,0xb
   14005a90e:	c1 f8 15             	sar    eax,0x15
   14005a911:	c1 f9 08             	sar    ecx,0x8
   14005a914:	d1 f8                	sar    eax,1
   14005a916:	c1 f9 08             	sar    ecx,0x8
   14005a919:	c1 f8 11             	sar    eax,0x11
   14005a91c:	c1 f8 0f             	sar    eax,0xf
   14005a91f:	c1 f9 04             	sar    ecx,0x4
   14005a922:	c1 f9 0b             	sar    ecx,0xb
   14005a925:	c1 f8 04             	sar    eax,0x4
   14005a928:	c1 f8 0d             	sar    eax,0xd
   14005a92b:	c1 f9 09             	sar    ecx,0x9
   14005a92e:	c1 f9 07             	sar    ecx,0x7
   14005a931:	c1 f8 0b             	sar    eax,0xb
   14005a934:	d1 f9                	sar    ecx,1
   14005a936:	c1 f8 03             	sar    eax,0x3
   14005a939:	c1 f8 0d             	sar    eax,0xd
   14005a93c:	c1 f8 02             	sar    eax,0x2
   14005a93f:	c1 f9 0b             	sar    ecx,0xb
   14005a942:	31 c8                	xor    eax,ecx
   14005a944:	35 5b 6c 7c 42       	xor    eax,0x427c6c5b
   14005a949:	c1 f8 1f             	sar    eax,0x1f
   14005a94c:	89 c1                	mov    ecx,eax
   14005a94e:	d1 f9                	sar    ecx,1
   14005a950:	31 c1                	xor    ecx,eax
   14005a952:	85 c9                	test   ecx,ecx
   14005a954:	75 09                	jne    0x14005a95f
   14005a956:	48 c1 e1 28          	shl    rcx,0x28
   14005a95a:	8b 04 0c             	mov    eax,DWORD PTR [rsp+rcx*1]
   14005a95d:	eb 0f                	jmp    0x14005a96e
   14005a95f:	c1 f8 0d             	sar    eax,0xd
   14005a962:	48 b9 00 00 00 00 00 	movabs rcx,0x10000000000
   14005a969:	01 00 00 
   14005a96c:	8b 01                	mov    eax,DWORD PTR [rcx]
   14005a96e:	59                   	pop    rcx
   14005a96f:	58                   	pop    rax
   14005a970:	9d                   	popf
   14005a971:	41 ff 54 24 20       	call   QWORD PTR [r12+0x20]
   14005a976:	9c                   	pushf
   14005a977:	41 52                	push   r10
   14005a979:	41 53                	push   r11
   14005a97b:	41 ba 1c c0 ca 62    	mov    r10d,0x62cac01c
   14005a981:	45 89 d3             	mov    r11d,r10d
   14005a984:	41 c1 fa 03          	sar    r10d,0x3
   14005a988:	41 c1 fa 0f          	sar    r10d,0xf
   14005a98c:	41 c1 fb 09          	sar    r11d,0x9
   14005a990:	41 c1 fa 0f          	sar    r10d,0xf
   14005a994:	41 c1 fa 11          	sar    r10d,0x11
   14005a998:	41 c1 fa 1f          	sar    r10d,0x1f
   14005a99c:	41 c1 fb 03          	sar    r11d,0x3
   14005a9a0:	41 c1 fa 05          	sar    r10d,0x5
   14005a9a4:	41 d1 fa             	sar    r10d,1
   14005a9a7:	41 c1 fa 07          	sar    r10d,0x7
   14005a9ab:	41 c1 fa 15          	sar    r10d,0x15
   14005a9af:	41 c1 fb 0b          	sar    r11d,0xb
   14005a9b3:	41 c1 fb 04          	sar    r11d,0x4
   14005a9b7:	41 c1 fb 0f          	sar    r11d,0xf
   14005a9bb:	41 d1 fb             	sar    r11d,1
   14005a9be:	41 c1 fb 0f          	sar    r11d,0xf
   14005a9c2:	41 c1 fb 05          	sar    r11d,0x5
   14005a9c6:	41 c1 fb 08          	sar    r11d,0x8
   14005a9ca:	41 d1 fa             	sar    r10d,1
   14005a9cd:	41 d1 fb             	sar    r11d,1
   14005a9d0:	41 c1 fb 03          	sar    r11d,0x3
   14005a9d4:	41 c1 fb 02          	sar    r11d,0x2
   14005a9d8:	41 c1 fa 0f          	sar    r10d,0xf
   14005a9dc:	41 c1 fb 0b          	sar    r11d,0xb
   14005a9e0:	41 c1 fa 0d          	sar    r10d,0xd
   14005a9e4:	41 c1 fa 09          	sar    r10d,0x9
   14005a9e8:	41 c1 fa 09          	sar    r10d,0x9
   14005a9ec:	41 c1 fb 0b          	sar    r11d,0xb
   14005a9f0:	45 31 da             	xor    r10d,r11d
   14005a9f3:	41 81 f2 a7 a7 db 1e 	xor    r10d,0x1edba7a7
   14005a9fa:	41 c1 fa 1f          	sar    r10d,0x1f
   14005a9fe:	45                   	rex.RB
   14005a9ff:	89                   	.byte 0x89
