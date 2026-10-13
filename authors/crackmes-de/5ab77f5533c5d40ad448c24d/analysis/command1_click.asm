
original/CrackMe3.exe:     file format pei-i386


Disassembly of section .text:

00402af0 <.text+0x1af0>:
  402af0:	55                   	push   ebp
  402af1:	8b ec                	mov    ebp,esp
  402af3:	83 ec 18             	sub    esp,0x18
  402af6:	68 c6 10 40 00       	push   0x4010c6
  402afb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402b01:	50                   	push   eax
  402b02:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  402b09:	b8 48 00 00 00       	mov    eax,0x48
  402b0e:	e8 ad e5 ff ff       	call   0x4010c0
  402b13:	53                   	push   ebx
  402b14:	56                   	push   esi
  402b15:	57                   	push   edi
  402b16:	89 65 e8             	mov    DWORD PTR [ebp-0x18],esp
  402b19:	c7 45 ec 70 10 40 00 	mov    DWORD PTR [ebp-0x14],0x401070
  402b20:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402b23:	83 e0 01             	and    eax,0x1
  402b26:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  402b29:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402b2c:	83 e1 fe             	and    ecx,0xfffffffe
  402b2f:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
  402b32:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  402b39:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402b3c:	8b 02                	mov    eax,DWORD PTR [edx]
  402b3e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402b41:	51                   	push   ecx
  402b42:	ff 50 04             	call   DWORD PTR [eax+0x4]
  402b45:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  402b4c:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  402b53:	6a ff                	push   0xffffffff
  402b55:	ff 15 f8 40 40 00    	call   DWORD PTR ds:0x4040f8
  402b5b:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  402b62:	68 54 1e 40 00       	push   0x401e54
  402b67:	6a 01                	push   0x1
  402b69:	6a ff                	push   0xffffffff
  402b6b:	6a 01                	push   0x1
  402b6d:	ff 15 44 41 40 00    	call   DWORD PTR ds:0x404144
  402b73:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  402b7a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402b7d:	83 c2 34             	add    edx,0x34
  402b80:	52                   	push   edx
  402b81:	6a 01                	push   0x1
  402b83:	68 74 1e 40 00       	push   0x401e74
  402b88:	ff 15 30 41 40 00    	call   DWORD PTR ds:0x404130
  402b8e:	83 c4 0c             	add    esp,0xc
  402b91:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
  402b98:	6a 01                	push   0x1
  402b9a:	ff 15 10 41 40 00    	call   DWORD PTR ds:0x404110
  402ba0:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  402ba7:	c7 45 c4 7c 1e 40 00 	mov    DWORD PTR [ebp-0x3c],0x401e7c
  402bae:	c7 45 bc 08 80 00 00 	mov    DWORD PTR [ebp-0x44],0x8008
  402bb5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402bb8:	83 c0 34             	add    eax,0x34
  402bbb:	50                   	push   eax
  402bbc:	8d 4d bc             	lea    ecx,[ebp-0x44]
  402bbf:	51                   	push   ecx
  402bc0:	ff 15 18 41 40 00    	call   DWORD PTR ds:0x404118
  402bc6:	0f bf d0             	movsx  edx,ax
  402bc9:	85 d2                	test   edx,edx
  402bcb:	74 70                	je     0x402c3d
  402bcd:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
  402bd4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402bd7:	8b 08                	mov    ecx,DWORD PTR [eax]
  402bd9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402bdc:	52                   	push   edx
  402bdd:	ff 91 00 03 00 00    	call   DWORD PTR [ecx+0x300]
  402be3:	50                   	push   eax
  402be4:	8d 45 dc             	lea    eax,[ebp-0x24]
  402be7:	50                   	push   eax
  402be8:	ff 15 fc 40 40 00    	call   DWORD PTR ds:0x4040fc
  402bee:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  402bf1:	68 a0 1e 40 00       	push   0x401ea0
  402bf6:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  402bf9:	8b 11                	mov    edx,DWORD PTR [ecx]
  402bfb:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402bfe:	50                   	push   eax
  402bff:	ff 92 a4 00 00 00    	call   DWORD PTR [edx+0xa4]
  402c05:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  402c08:	83 7d b4 00          	cmp    DWORD PTR [ebp-0x4c],0x0
  402c0c:	7d 1d                	jge    0x402c2b
  402c0e:	68 a4 00 00 00       	push   0xa4
  402c13:	68 b8 1e 40 00       	push   0x401eb8
  402c18:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  402c1b:	51                   	push   ecx
  402c1c:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  402c1f:	52                   	push   edx
  402c20:	ff 15 ec 40 40 00    	call   DWORD PTR ds:0x4040ec
  402c26:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  402c29:	eb 07                	jmp    0x402c32
  402c2b:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [ebp-0x64],0x0
  402c32:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402c35:	ff 15 70 41 40 00    	call   DWORD PTR ds:0x404170
  402c3b:	eb 6e                	jmp    0x402cab
  402c3d:	c7                   	.byte 0xc7
  402c3e:	45                   	inc    ebp
  402c3f:	fc                   	cld
