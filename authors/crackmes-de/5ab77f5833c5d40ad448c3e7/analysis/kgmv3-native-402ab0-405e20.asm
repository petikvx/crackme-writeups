
dump.bin:     file format binary


Disassembly of section .data:

00402ab0 <.data+0x2ab0>:
  402ab0:	00 00                	add    BYTE PTR [eax],al
  402ab2:	00 00                	add    BYTE PTR [eax],al
  402ab4:	20 1f                	and    BYTE PTR [edi],bl
  402ab6:	40                   	inc    eax
  402ab7:	00 ff                	add    bh,bh
  402ab9:	ff                   	(bad)
  402aba:	ff                   	(bad)
  402abb:	ff 00                	inc    DWORD PTR [eax]
  402abd:	00 00                	add    BYTE PTR [eax],al
  402abf:	00 06                	add    BYTE PTR [esi],al
  402ac1:	00 00                	add    BYTE PTR [eax],al
  402ac3:	00 00                	add    BYTE PTR [eax],al
  402ac5:	00 00                	add    BYTE PTR [eax],al
  402ac7:	00 8c 2a 40 00 00 00 	add    BYTE PTR [edx+ebp*1+0x40],cl
  402ace:	00 00                	add    BYTE PTR [eax],al
  402ad0:	98                   	cwde
  402ad1:	2a 40 00             	sub    al,BYTE PTR [eax+0x0]
  402ad4:	80 2a 40             	sub    BYTE PTR [edx],0x40
  402ad7:	00 80 2a 40 00 00    	add    BYTE PTR [eax+0x402a],al
	...
  402ae5:	00 00                	add    BYTE PTR [eax],al
  402ae7:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
  402aeb:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  402aee:	00 00                	add    BYTE PTR [eax],al
  402af0:	00 00                	add    BYTE PTR [eax],al
  402af2:	00 00                	add    BYTE PTR [eax],al
  402af4:	d8 22                	fsub   DWORD PTR [edx]
  402af6:	40                   	inc    eax
  402af7:	00 ff                	add    bh,bh
  402af9:	ff                   	(bad)
  402afa:	ff                   	(bad)
  402afb:	ff 00                	inc    DWORD PTR [eax]
  402afd:	00 00                	add    BYTE PTR [eax],al
  402aff:	00 80 2a 40 00 00    	add    BYTE PTR [eax+0x402a],al
	...
  402b0d:	00 00                	add    BYTE PTR [eax],al
  402b0f:	00 ff                	add    bh,bh
  402b11:	ff                   	(bad)
  402b12:	ff                   	(bad)
  402b13:	ff 00                	inc    DWORD PTR [eax]
  402b15:	00 00                	add    BYTE PTR [eax],al
  402b17:	00 98 24 40 00 28    	add    BYTE PTR [eax+0x28004024],bl
  402b1d:	24 40                	and    al,0x40
  402b1f:	00 d8                	add    al,bl
  402b21:	73 40                	jae    0x402b63
  402b23:	00 98 24 40 00 c8    	add    BYTE PTR [eax-0x37ffbfdc],bl
  402b29:	24 40                	and    al,0x40
  402b2b:	00 dc                	add    ah,bl
  402b2d:	73 40                	jae    0x402b6f
  402b2f:	00 98 24 40 00 e8    	add    BYTE PTR [eax-0x17ffbfdc],bl
  402b35:	24 40                	and    al,0x40
  402b37:	00 e0                	add    al,ah
  402b39:	73 40                	jae    0x402b7b
  402b3b:	00 cc                	add    ah,cl
  402b3d:	cc                   	int3
  402b3e:	cc                   	int3
  402b3f:	cc                   	int3
  402b40:	e9 e9 e9 e9 cc       	jmp    0xcd2a152e
  402b45:	cc                   	int3
  402b46:	cc                   	int3
  402b47:	cc                   	int3
  402b48:	cc                   	int3
  402b49:	cc                   	int3
  402b4a:	cc                   	int3
  402b4b:	cc                   	int3
  402b4c:	cc                   	int3
  402b4d:	cc                   	int3
  402b4e:	cc                   	int3
  402b4f:	cc                   	int3
  402b50:	55                   	push   ebp
  402b51:	8b ec                	mov    ebp,esp
  402b53:	83 ec 0c             	sub    esp,0xc
  402b56:	68 66 12 40 00       	push   0x401266
  402b5b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402b61:	50                   	push   eax
  402b62:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  402b69:	81 ec a8 01 00 00    	sub    esp,0x1a8
  402b6f:	53                   	push   ebx
  402b70:	56                   	push   esi
  402b71:	57                   	push   edi
  402b72:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  402b75:	c7 45 f8 68 11 40 00 	mov    DWORD PTR [ebp-0x8],0x401168
  402b7c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  402b7f:	8b c3                	mov    eax,ebx
  402b81:	83 e0 01             	and    eax,0x1
  402b84:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  402b87:	83 e3 fe             	and    ebx,0xfffffffe
  402b8a:	53                   	push   ebx
  402b8b:	89 5d 08             	mov    DWORD PTR [ebp+0x8],ebx
  402b8e:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  402b90:	ff 51 04             	call   DWORD PTR [ecx+0x4]
  402b93:	8b 13                	mov    edx,DWORD PTR [ebx]
  402b95:	33 f6                	xor    esi,esi
  402b97:	53                   	push   ebx
  402b98:	89 75 dc             	mov    DWORD PTR [ebp-0x24],esi
  402b9b:	89 75 cc             	mov    DWORD PTR [ebp-0x34],esi
  402b9e:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  402ba1:	89 75 c4             	mov    DWORD PTR [ebp-0x3c],esi
  402ba4:	89 75 c0             	mov    DWORD PTR [ebp-0x40],esi
  402ba7:	89 75 bc             	mov    DWORD PTR [ebp-0x44],esi
  402baa:	89 75 b8             	mov    DWORD PTR [ebp-0x48],esi
  402bad:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  402bb0:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  402bb3:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  402bb6:	89 b5 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],esi
  402bbc:	89 b5 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],esi
  402bc2:	89 b5 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],esi
  402bc8:	89 b5 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],esi
  402bce:	89 b5 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],esi
  402bd4:	89 b5 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],esi
  402bda:	89 b5 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],esi
  402be0:	89 b5 08 ff ff ff    	mov    DWORD PTR [ebp-0xf8],esi
  402be6:	89 b5 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],esi
  402bec:	89 b5 e8 fe ff ff    	mov    DWORD PTR [ebp-0x118],esi
  402bf2:	89 b5 d8 fe ff ff    	mov    DWORD PTR [ebp-0x128],esi
  402bf8:	89 b5 c8 fe ff ff    	mov    DWORD PTR [ebp-0x138],esi
  402bfe:	89 b5 b8 fe ff ff    	mov    DWORD PTR [ebp-0x148],esi
  402c04:	89 b5 a8 fe ff ff    	mov    DWORD PTR [ebp-0x158],esi
  402c0a:	89 b5 98 fe ff ff    	mov    DWORD PTR [ebp-0x168],esi
  402c10:	ff 92 08 03 00 00    	call   DWORD PTR [edx+0x308]
  402c16:	50                   	push   eax
  402c17:	8d 45 b8             	lea    eax,[ebp-0x48]
  402c1a:	50                   	push   eax
  402c1b:	ff 15 6c 10 40 00    	call   DWORD PTR ds:0x40106c
  402c21:	8b f8                	mov    edi,eax
  402c23:	8d 55 c8             	lea    edx,[ebp-0x38]
  402c26:	52                   	push   edx
  402c27:	57                   	push   edi
  402c28:	8b 0f                	mov    ecx,DWORD PTR [edi]
  402c2a:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  402c30:	3b c6                	cmp    eax,esi
  402c32:	db e2                	fnclex
  402c34:	7d 12                	jge    0x402c48
  402c36:	68 a0 00 00 00       	push   0xa0
  402c3b:	68 1c 25 40 00       	push   0x40251c
  402c40:	57                   	push   edi
  402c41:	50                   	push   eax
  402c42:	ff 15 50 10 40 00    	call   DWORD PTR ds:0x401050
  402c48:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402c4b:	8d 55 a8             	lea    edx,[ebp-0x58]
  402c4e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402c51:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  402c54:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  402c57:	c7 45 a8 08 00 00 00 	mov    DWORD PTR [ebp-0x58],0x8
  402c5e:	ff 15 10 10 40 00    	call   DWORD PTR ds:0x401010
  402c64:	8d 4d b8             	lea    ecx,[ebp-0x48]
  402c67:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  402c6d:	8b 03                	mov    eax,DWORD PTR [ebx]
  402c6f:	53                   	push   ebx
  402c70:	ff 90 04 03 00 00    	call   DWORD PTR [eax+0x304]
  402c76:	8d 4d b8             	lea    ecx,[ebp-0x48]
  402c79:	50                   	push   eax
  402c7a:	51                   	push   ecx
  402c7b:	ff 15 6c 10 40 00    	call   DWORD PTR ds:0x40106c
  402c81:	8b f8                	mov    edi,eax
  402c83:	8d 45 c8             	lea    eax,[ebp-0x38]
  402c86:	50                   	push   eax
  402c87:	57                   	push   edi
  402c88:	8b 17                	mov    edx,DWORD PTR [edi]
  402c8a:	ff 92 a0 00 00 00    	call   DWORD PTR [edx+0xa0]
  402c90:	3b c6                	cmp    eax,esi
  402c92:	db e2                	fnclex
  402c94:	7d 12                	jge    0x402ca8
  402c96:	68 a0 00 00 00       	push   0xa0
  402c9b:	68 1c 25 40 00       	push   0x40251c
  402ca0:	57                   	push   edi
  402ca1:	50                   	push   eax
  402ca2:	ff 15 50 10 40 00    	call   DWORD PTR ds:0x401050
  402ca8:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  402cab:	8d 4b 44             	lea    ecx,[ebx+0x44]
  402cae:	89 8d 48 fe ff ff    	mov    DWORD PTR [ebp-0x1b8],ecx
  402cb4:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  402cba:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402cbd:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  402cc3:	8d 4d b8             	lea    ecx,[ebp-0x48]
  402cc6:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  402ccc:	8b 35 d8 10 40 00    	mov    esi,DWORD PTR ds:0x4010d8
  402cd2:	8d 4d a8             	lea    ecx,[ebp-0x58]
  402cd5:	6a 55                	push   0x55
  402cd7:	51                   	push   ecx
  402cd8:	ff d6                	call   esi
  402cda:	8d 55 98             	lea    edx,[ebp-0x68]
  402cdd:	6a 54                	push   0x54
  402cdf:	52                   	push   edx
  402ce0:	ff d6                	call   esi
  402ce2:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  402ce8:	6a 57                	push   0x57
  402cea:	50                   	push   eax
  402ceb:	ff d6                	call   esi
  402ced:	8b 3d e8 10 40 00    	mov    edi,DWORD PTR ds:0x4010e8
  402cf3:	8d 4d a8             	lea    ecx,[ebp-0x58]
  402cf6:	8d 55 98             	lea    edx,[ebp-0x68]
  402cf9:	51                   	push   ecx
  402cfa:	8d 45 88             	lea    eax,[ebp-0x78]
  402cfd:	52                   	push   edx
  402cfe:	50                   	push   eax
  402cff:	ff d7                	call   edi
  402d01:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  402d07:	50                   	push   eax
  402d08:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
  402d0e:	51                   	push   ecx
  402d0f:	52                   	push   edx
  402d10:	ff d7                	call   edi
  402d12:	50                   	push   eax
  402d13:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  402d19:	8b d0                	mov    edx,eax
  402d1b:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402d1e:	ff 15 40 11 40 00    	call   DWORD PTR ds:0x401140
  402d24:	8b d0                	mov    edx,eax
  402d26:	8d 4b 38             	lea    ecx,[ebx+0x38]
  402d29:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  402d2f:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402d32:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  402d38:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  402d3e:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  402d44:	50                   	push   eax
  402d45:	8d 55 88             	lea    edx,[ebp-0x78]
  402d48:	51                   	push   ecx
  402d49:	8d 45 98             	lea    eax,[ebp-0x68]
  402d4c:	52                   	push   edx
  402d4d:	8d 4d a8             	lea    ecx,[ebp-0x58]
  402d50:	50                   	push   eax
  402d51:	51                   	push   ecx
  402d52:	6a 05                	push   0x5
  402d54:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  402d5a:	83 c4 18             	add    esp,0x18
  402d5d:	8d 55 a8             	lea    edx,[ebp-0x58]
  402d60:	6a 55                	push   0x55
  402d62:	52                   	push   edx
  402d63:	ff d6                	call   esi
  402d65:	8d 45 98             	lea    eax,[ebp-0x68]
  402d68:	6a 38                	push   0x38
  402d6a:	50                   	push   eax
  402d6b:	ff d6                	call   esi
  402d6d:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  402d73:	6a 35                	push   0x35
  402d75:	51                   	push   ecx
  402d76:	ff d6                	call   esi
  402d78:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  402d7e:	6a 54                	push   0x54
  402d80:	52                   	push   edx
  402d81:	ff d6                	call   esi
  402d83:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  402d89:	6a 38                	push   0x38
  402d8b:	50                   	push   eax
  402d8c:	ff d6                	call   esi
  402d8e:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  402d94:	6a 34                	push   0x34
  402d96:	51                   	push   ecx
  402d97:	ff d6                	call   esi
  402d99:	8d 95 f8 fe ff ff    	lea    edx,[ebp-0x108]
  402d9f:	6a 57                	push   0x57
  402da1:	52                   	push   edx
  402da2:	ff d6                	call   esi
  402da4:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  402daa:	6a 38                	push   0x38
  402dac:	50                   	push   eax
  402dad:	ff d6                	call   esi
  402daf:	8d 8d b8 fe ff ff    	lea    ecx,[ebp-0x148]
  402db5:	6a 37                	push   0x37
  402db7:	51                   	push   ecx
  402db8:	ff d6                	call   esi
  402dba:	8d 55 a8             	lea    edx,[ebp-0x58]
  402dbd:	8d 45 98             	lea    eax,[ebp-0x68]
  402dc0:	52                   	push   edx
  402dc1:	8d 4d 88             	lea    ecx,[ebp-0x78]
  402dc4:	50                   	push   eax
  402dc5:	51                   	push   ecx
  402dc6:	ff d7                	call   edi
  402dc8:	50                   	push   eax
  402dc9:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  402dcf:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  402dd5:	52                   	push   edx
  402dd6:	50                   	push   eax
  402dd7:	ff d7                	call   edi
  402dd9:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  402ddf:	50                   	push   eax
  402de0:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  402de6:	51                   	push   ecx
  402de7:	52                   	push   edx
  402de8:	ff d7                	call   edi
  402dea:	50                   	push   eax
  402deb:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  402df1:	8d 8d 28 ff ff ff    	lea    ecx,[ebp-0xd8]
  402df7:	50                   	push   eax
  402df8:	51                   	push   ecx
  402df9:	ff d7                	call   edi
  402dfb:	50                   	push   eax
  402dfc:	8d 95 18 ff ff ff    	lea    edx,[ebp-0xe8]
  402e02:	8d 85 08 ff ff ff    	lea    eax,[ebp-0xf8]
  402e08:	52                   	push   edx
  402e09:	50                   	push   eax
  402e0a:	ff d7                	call   edi
  402e0c:	8d 8d f8 fe ff ff    	lea    ecx,[ebp-0x108]
  402e12:	50                   	push   eax
  402e13:	8d 95 e8 fe ff ff    	lea    edx,[ebp-0x118]
  402e19:	51                   	push   ecx
  402e1a:	52                   	push   edx
  402e1b:	ff d7                	call   edi
  402e1d:	50                   	push   eax
  402e1e:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  402e24:	8d 8d c8 fe ff ff    	lea    ecx,[ebp-0x138]
  402e2a:	50                   	push   eax
  402e2b:	51                   	push   ecx
  402e2c:	ff d7                	call   edi
  402e2e:	50                   	push   eax
  402e2f:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  402e35:	8d 85 a8 fe ff ff    	lea    eax,[ebp-0x158]
  402e3b:	52                   	push   edx
  402e3c:	50                   	push   eax
  402e3d:	ff d7                	call   edi
  402e3f:	50                   	push   eax
  402e40:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  402e46:	8b 35 40 11 40 00    	mov    esi,DWORD PTR ds:0x401140
  402e4c:	8b d0                	mov    edx,eax
  402e4e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402e51:	ff d6                	call   esi
  402e53:	8b d0                	mov    edx,eax
  402e55:	8d 4b 34             	lea    ecx,[ebx+0x34]
  402e58:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  402e5e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402e61:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  402e67:	8d 8d a8 fe ff ff    	lea    ecx,[ebp-0x158]
  402e6d:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  402e73:	51                   	push   ecx
  402e74:	8d 85 c8 fe ff ff    	lea    eax,[ebp-0x138]
  402e7a:	52                   	push   edx
  402e7b:	8d 8d d8 fe ff ff    	lea    ecx,[ebp-0x128]
  402e81:	50                   	push   eax
  402e82:	51                   	push   ecx
  402e83:	8d 95 e8 fe ff ff    	lea    edx,[ebp-0x118]
  402e89:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
  402e8f:	52                   	push   edx
  402e90:	8d 8d 08 ff ff ff    	lea    ecx,[ebp-0xf8]
  402e96:	50                   	push   eax
  402e97:	8d 95 18 ff ff ff    	lea    edx,[ebp-0xe8]
  402e9d:	51                   	push   ecx
  402e9e:	8d 85 28 ff ff ff    	lea    eax,[ebp-0xd8]
  402ea4:	52                   	push   edx
  402ea5:	8d 8d 38 ff ff ff    	lea    ecx,[ebp-0xc8]
  402eab:	50                   	push   eax
  402eac:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  402eb2:	51                   	push   ecx
  402eb3:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
  402eb9:	52                   	push   edx
  402eba:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  402ec0:	50                   	push   eax
  402ec1:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  402ec7:	51                   	push   ecx
  402ec8:	8d 45 88             	lea    eax,[ebp-0x78]
  402ecb:	52                   	push   edx
  402ecc:	8d 4d 98             	lea    ecx,[ebp-0x68]
  402ecf:	50                   	push   eax
  402ed0:	8d 55 a8             	lea    edx,[ebp-0x58]
  402ed3:	51                   	push   ecx
  402ed4:	52                   	push   edx
  402ed5:	6a 11                	push   0x11
  402ed7:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  402edd:	8b 3d 38 11 40 00    	mov    edi,DWORD PTR ds:0x401138
  402ee3:	83 c4 48             	add    esp,0x48
  402ee6:	8d 45 dc             	lea    eax,[ebp-0x24]
  402ee9:	8d 4d 98             	lea    ecx,[ebp-0x68]
  402eec:	6a 01                	push   0x1
  402eee:	50                   	push   eax
  402eef:	51                   	push   ecx
  402ef0:	ff d7                	call   edi
  402ef2:	8d 55 dc             	lea    edx,[ebp-0x24]
  402ef5:	6a 02                	push   0x2
  402ef7:	8d 45 88             	lea    eax,[ebp-0x78]
  402efa:	52                   	push   edx
  402efb:	50                   	push   eax
  402efc:	ff d7                	call   edi
  402efe:	8b 3d e4 10 40 00    	mov    edi,DWORD PTR ds:0x4010e4
  402f04:	8d 4d 98             	lea    ecx,[ebp-0x68]
  402f07:	8d 55 c8             	lea    edx,[ebp-0x38]
  402f0a:	51                   	push   ecx
  402f0b:	52                   	push   edx
  402f0c:	ff d7                	call   edi
  402f0e:	50                   	push   eax
  402f0f:	ff 15 34 10 40 00    	call   DWORD PTR ds:0x401034
  402f15:	66 8b d0             	mov    dx,ax
  402f18:	8d 45 88             	lea    eax,[ebp-0x78]
  402f1b:	66 6b d2 02          	imul   dx,dx,0x2
  402f1f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402f22:	50                   	push   eax
  402f23:	0f 80 45 03 00 00    	jo     0x40326e
  402f29:	51                   	push   ecx
  402f2a:	66 89 95 46 fe ff ff 	mov    WORD PTR [ebp-0x1ba],dx
  402f31:	ff d7                	call   edi
  402f33:	50                   	push   eax
  402f34:	ff 15 34 10 40 00    	call   DWORD PTR ds:0x401034
  402f3a:	66 8b 95 46 fe ff ff 	mov    dx,WORD PTR [ebp-0x1ba]
  402f41:	8b 3d 54 10 40 00    	mov    edi,DWORD PTR ds:0x401054
  402f47:	66 0f af d0          	imul   dx,ax
  402f4b:	8d 45 dc             	lea    eax,[ebp-0x24]
  402f4e:	8d 4d a8             	lea    ecx,[ebp-0x58]
  402f51:	50                   	push   eax
  402f52:	51                   	push   ecx
  402f53:	0f 80 15 03 00 00    	jo     0x40326e
  402f59:	66 89 95 a0 fe ff ff 	mov    WORD PTR [ebp-0x160],dx
  402f60:	c7 85 98 fe ff ff 02 	mov    DWORD PTR [ebp-0x168],0x2
  402f67:	00 00 00 
  402f6a:	ff d7                	call   edi
  402f6c:	50                   	push   eax
  402f6d:	8d 95 98 fe ff ff    	lea    edx,[ebp-0x168]
  402f73:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  402f79:	52                   	push   edx
  402f7a:	50                   	push   eax
  402f7b:	ff 15 24 11 40 00    	call   DWORD PTR ds:0x401124
  402f81:	50                   	push   eax
  402f82:	ff 15 ec 10 40 00    	call   DWORD PTR ds:0x4010ec
  402f88:	66 89 43 3c          	mov    WORD PTR [ebx+0x3c],ax
  402f8c:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402f8f:	8d 55 c8             	lea    edx,[ebp-0x38]
  402f92:	51                   	push   ecx
  402f93:	52                   	push   edx
  402f94:	6a 02                	push   0x2
  402f96:	ff 15 0c 11 40 00    	call   DWORD PTR ds:0x40110c
  402f9c:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  402fa2:	8d 4d 88             	lea    ecx,[ebp-0x78]
  402fa5:	50                   	push   eax
  402fa6:	8d 55 98             	lea    edx,[ebp-0x68]
  402fa9:	51                   	push   ecx
  402faa:	52                   	push   edx
  402fab:	6a 03                	push   0x3
  402fad:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  402fb3:	83 c4 1c             	add    esp,0x1c
  402fb6:	8d 45 dc             	lea    eax,[ebp-0x24]
  402fb9:	8d 4d a8             	lea    ecx,[ebp-0x58]
  402fbc:	c7 85 a0 fe ff ff d0 	mov    DWORD PTR [ebp-0x160],0x7d0
  402fc3:	07 00 00 
  402fc6:	50                   	push   eax
  402fc7:	51                   	push   ecx
  402fc8:	c7 85 98 fe ff ff 02 	mov    DWORD PTR [ebp-0x168],0x2
  402fcf:	00 00 00 
  402fd2:	ff d7                	call   edi
  402fd4:	50                   	push   eax
  402fd5:	8d 95 98 fe ff ff    	lea    edx,[ebp-0x168]
  402fdb:	8d 45 98             	lea    eax,[ebp-0x68]
  402fde:	52                   	push   edx
  402fdf:	50                   	push   eax
  402fe0:	ff 15 c4 10 40 00    	call   DWORD PTR ds:0x4010c4
  402fe6:	50                   	push   eax
  402fe7:	ff 15 ec 10 40 00    	call   DWORD PTR ds:0x4010ec
  402fed:	66 8b 4b 3c          	mov    cx,WORD PTR [ebx+0x3c]
  402ff1:	8b 3d 04 10 40 00    	mov    edi,DWORD PTR ds:0x401004
  402ff7:	51                   	push   ecx
  402ff8:	66 89 43 3e          	mov    WORD PTR [ebx+0x3e],ax
  402ffc:	ff d7                	call   edi
  402ffe:	8b d0                	mov    edx,eax
  403000:	8d 4d c8             	lea    ecx,[ebp-0x38]
  403003:	ff d6                	call   esi
  403005:	66 8b 53 3e          	mov    dx,WORD PTR [ebx+0x3e]
  403009:	50                   	push   eax
  40300a:	52                   	push   edx
  40300b:	ff d7                	call   edi
  40300d:	8b d0                	mov    edx,eax
  40300f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  403012:	ff d6                	call   esi
  403014:	50                   	push   eax
  403015:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  40301b:	8b d0                	mov    edx,eax
  40301d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403020:	ff d6                	call   esi
  403022:	8d 45 c0             	lea    eax,[ebp-0x40]
  403025:	83 c3 40             	add    ebx,0x40
  403028:	50                   	push   eax
  403029:	e8 42 2c 00 00       	call   0x405c70
  40302e:	8b d0                	mov    edx,eax
  403030:	8d 4d bc             	lea    ecx,[ebp-0x44]
  403033:	ff d6                	call   esi
  403035:	8b d0                	mov    edx,eax
  403037:	8b cb                	mov    ecx,ebx
  403039:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  40303f:	8d 4d bc             	lea    ecx,[ebp-0x44]
  403042:	8d 55 c0             	lea    edx,[ebp-0x40]
  403045:	51                   	push   ecx
  403046:	8d 45 c4             	lea    eax,[ebp-0x3c]
  403049:	52                   	push   edx
  40304a:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40304d:	50                   	push   eax
  40304e:	51                   	push   ecx
  40304f:	6a 04                	push   0x4
  403051:	ff 15 0c 11 40 00    	call   DWORD PTR ds:0x40110c
  403057:	8b 95 48 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1b8]
  40305d:	83 c4 14             	add    esp,0x14
  403060:	52                   	push   edx
  403061:	e8 0a 2c 00 00       	call   0x405c70
  403066:	bf 08 00 00 00       	mov    edi,0x8
  40306b:	8d 55 a8             	lea    edx,[ebp-0x58]
  40306e:	8d 4d cc             	lea    ecx,[ebp-0x34]
  403071:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  403074:	89 7d a8             	mov    DWORD PTR [ebp-0x58],edi
  403077:	ff 15 10 10 40 00    	call   DWORD PTR ds:0x401010
  40307d:	8b 03                	mov    eax,DWORD PTR [ebx]
  40307f:	8d 4d cc             	lea    ecx,[ebp-0x34]
  403082:	8d 95 98 fe ff ff    	lea    edx,[ebp-0x168]
  403088:	51                   	push   ecx
  403089:	52                   	push   edx
  40308a:	89 85 a0 fe ff ff    	mov    DWORD PTR [ebp-0x160],eax
  403090:	c7 85 98 fe ff ff 08 	mov    DWORD PTR [ebp-0x168],0x8008
  403097:	80 00 00 
  40309a:	ff 15 9c 10 40 00    	call   DWORD PTR ds:0x40109c
  4030a0:	66 85 c0             	test   ax,ax
  4030a3:	0f 84 e6 00 00 00    	je     0x40318f
  4030a9:	a1 d4 73 40 00       	mov    eax,ds:0x4073d4
  4030ae:	85 c0                	test   eax,eax
  4030b0:	75 10                	jne    0x4030c2
  4030b2:	68 d4 73 40 00       	push   0x4073d4
  4030b7:	68 d0 25 40 00       	push   0x4025d0
  4030bc:	ff 15 f8 10 40 00    	call   DWORD PTR ds:0x4010f8
  4030c2:	8b 35 d4 73 40 00    	mov    esi,DWORD PTR ds:0x4073d4
  4030c8:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4030cb:	51                   	push   ecx
  4030cc:	56                   	push   esi
  4030cd:	8b 06                	mov    eax,DWORD PTR [esi]
  4030cf:	ff 50 14             	call   DWORD PTR [eax+0x14]
  4030d2:	85 c0                	test   eax,eax
  4030d4:	db e2                	fnclex
  4030d6:	7d 0f                	jge    0x4030e7
  4030d8:	6a 14                	push   0x14
  4030da:	68 c0 25 40 00       	push   0x4025c0
  4030df:	56                   	push   esi
  4030e0:	50                   	push   eax
  4030e1:	ff 15 50 10 40 00    	call   DWORD PTR ds:0x401050
  4030e7:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4030ea:	68 94 25 40 00       	push   0x402594
  4030ef:	50                   	push   eax
  4030f0:	8b f0                	mov    esi,eax
  4030f2:	8b 10                	mov    edx,DWORD PTR [eax]
  4030f4:	ff 52 64             	call   DWORD PTR [edx+0x64]
  4030f7:	85 c0                	test   eax,eax
  4030f9:	db e2                	fnclex
  4030fb:	7d 0f                	jge    0x40310c
  4030fd:	6a 64                	push   0x64
  4030ff:	68 e0 25 40 00       	push   0x4025e0
  403104:	56                   	push   esi
  403105:	50                   	push   eax
  403106:	ff 15 50 10 40 00    	call   DWORD PTR ds:0x401050
  40310c:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40310f:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  403115:	b9 04 00 02 80       	mov    ecx,0x80020004
  40311a:	b8 0a 00 00 00       	mov    eax,0xa
  40311f:	89 4d 80             	mov    DWORD PTR [ebp-0x80],ecx
  403122:	89 4d 90             	mov    DWORD PTR [ebp-0x70],ecx
  403125:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
  403128:	8d 95 98 fe ff ff    	lea    edx,[ebp-0x168]
  40312e:	8d 4d a8             	lea    ecx,[ebp-0x58]
  403131:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  403137:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  40313a:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  40313d:	c7 85 a0 fe ff ff f4 	mov    DWORD PTR [ebp-0x160],0x4025f4
  403144:	25 40 00 
  403147:	89 bd 98 fe ff ff    	mov    DWORD PTR [ebp-0x168],edi
  40314d:	ff 15 28 11 40 00    	call   DWORD PTR ds:0x401128
  403153:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  403159:	8d 4d 88             	lea    ecx,[ebp-0x78]
  40315c:	50                   	push   eax
  40315d:	8d 55 98             	lea    edx,[ebp-0x68]
  403160:	51                   	push   ecx
  403161:	52                   	push   edx
  403162:	8d 45 a8             	lea    eax,[ebp-0x58]
  403165:	68 00 00 08 00       	push   0x80000
  40316a:	50                   	push   eax
  40316b:	ff 15 70 10 40 00    	call   DWORD PTR ds:0x401070
  403171:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  403177:	8d 55 88             	lea    edx,[ebp-0x78]
  40317a:	51                   	push   ecx
  40317b:	8d 45 98             	lea    eax,[ebp-0x68]
  40317e:	52                   	push   edx
  40317f:	8d 4d a8             	lea    ecx,[ebp-0x58]
  403182:	50                   	push   eax
  403183:	51                   	push   ecx
  403184:	6a 04                	push   0x4
  403186:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  40318c:	83 c4 14             	add    esp,0x14
  40318f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  403196:	68 4f 32 40 00       	push   0x40324f
  40319b:	e9 9e 00 00 00       	jmp    0x40323e
  4031a0:	8d 55 bc             	lea    edx,[ebp-0x44]
  4031a3:	8d 45 c0             	lea    eax,[ebp-0x40]
  4031a6:	52                   	push   edx
  4031a7:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4031aa:	50                   	push   eax
  4031ab:	8d 55 c8             	lea    edx,[ebp-0x38]
  4031ae:	51                   	push   ecx
  4031af:	52                   	push   edx
  4031b0:	6a 04                	push   0x4
  4031b2:	ff 15 0c 11 40 00    	call   DWORD PTR ds:0x40110c
  4031b8:	83 c4 14             	add    esp,0x14
  4031bb:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4031be:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  4031c4:	8d 85 a8 fe ff ff    	lea    eax,[ebp-0x158]
  4031ca:	8d 8d b8 fe ff ff    	lea    ecx,[ebp-0x148]
  4031d0:	50                   	push   eax
  4031d1:	8d 95 c8 fe ff ff    	lea    edx,[ebp-0x138]
  4031d7:	51                   	push   ecx
  4031d8:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  4031de:	52                   	push   edx
  4031df:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  4031e5:	50                   	push   eax
  4031e6:	8d 95 f8 fe ff ff    	lea    edx,[ebp-0x108]
  4031ec:	51                   	push   ecx
  4031ed:	8d 85 08 ff ff ff    	lea    eax,[ebp-0xf8]
  4031f3:	52                   	push   edx
  4031f4:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  4031fa:	50                   	push   eax
  4031fb:	8d 95 28 ff ff ff    	lea    edx,[ebp-0xd8]
  403201:	51                   	push   ecx
  403202:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  403208:	52                   	push   edx
  403209:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  40320f:	50                   	push   eax
  403210:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  403216:	51                   	push   ecx
  403217:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  40321d:	52                   	push   edx
  40321e:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  403224:	50                   	push   eax
  403225:	8d 55 88             	lea    edx,[ebp-0x78]
  403228:	51                   	push   ecx
  403229:	8d 45 98             	lea    eax,[ebp-0x68]
  40322c:	52                   	push   edx
  40322d:	8d 4d a8             	lea    ecx,[ebp-0x58]
  403230:	50                   	push   eax
  403231:	51                   	push   ecx
  403232:	6a 11                	push   0x11
  403234:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  40323a:	83 c4 48             	add    esp,0x48
  40323d:	c3                   	ret
  40323e:	8b 35 18 10 40 00    	mov    esi,DWORD PTR ds:0x401018
  403244:	8d 4d dc             	lea    ecx,[ebp-0x24]
  403247:	ff d6                	call   esi
  403249:	8d 4d cc             	lea    ecx,[ebp-0x34]
  40324c:	ff d6                	call   esi
  40324e:	c3                   	ret
  40324f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403252:	50                   	push   eax
  403253:	8b 10                	mov    edx,DWORD PTR [eax]
  403255:	ff 52 08             	call   DWORD PTR [edx+0x8]
  403258:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  40325b:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  40325e:	5f                   	pop    edi
  40325f:	5e                   	pop    esi
  403260:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  403267:	5b                   	pop    ebx
  403268:	8b e5                	mov    esp,ebp
  40326a:	5d                   	pop    ebp
  40326b:	c2 04 00             	ret    0x4
  40326e:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  403274:	90                   	nop
  403275:	90                   	nop
  403276:	90                   	nop
  403277:	90                   	nop
  403278:	90                   	nop
  403279:	90                   	nop
  40327a:	90                   	nop
  40327b:	90                   	nop
  40327c:	90                   	nop
  40327d:	90                   	nop
  40327e:	90                   	nop
  40327f:	90                   	nop
  403280:	55                   	push   ebp
  403281:	8b ec                	mov    ebp,esp
  403283:	83 ec 0c             	sub    esp,0xc
  403286:	68 66 12 40 00       	push   0x401266
  40328b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403291:	50                   	push   eax
  403292:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  403299:	83 ec 08             	sub    esp,0x8
  40329c:	53                   	push   ebx
  40329d:	56                   	push   esi
  40329e:	57                   	push   edi
  40329f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  4032a2:	c7 45 f8 78 11 40 00 	mov    DWORD PTR [ebp-0x8],0x401178
  4032a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4032ac:	8b c8                	mov    ecx,eax
  4032ae:	83 e1 01             	and    ecx,0x1
  4032b1:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  4032b4:	24 fe                	and    al,0xfe
  4032b6:	50                   	push   eax
  4032b7:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
  4032ba:	8b 10                	mov    edx,DWORD PTR [eax]
  4032bc:	ff 52 04             	call   DWORD PTR [edx+0x4]
  4032bf:	ff 15 28 10 40 00    	call   DWORD PTR ds:0x401028
  4032c5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4032cc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4032cf:	50                   	push   eax
  4032d0:	8b 08                	mov    ecx,DWORD PTR [eax]
  4032d2:	ff 51 08             	call   DWORD PTR [ecx+0x8]
  4032d5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4032d8:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  4032db:	5f                   	pop    edi
  4032dc:	5e                   	pop    esi
  4032dd:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4032e4:	5b                   	pop    ebx
  4032e5:	8b e5                	mov    esp,ebp
  4032e7:	5d                   	pop    ebp
  4032e8:	c2 04 00             	ret    0x4
  4032eb:	90                   	nop
  4032ec:	90                   	nop
  4032ed:	90                   	nop
  4032ee:	90                   	nop
  4032ef:	90                   	nop
  4032f0:	55                   	push   ebp
  4032f1:	8b ec                	mov    ebp,esp
  4032f3:	83 ec 0c             	sub    esp,0xc
  4032f6:	68 66 12 40 00       	push   0x401266
  4032fb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403301:	50                   	push   eax
  403302:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  403309:	83 ec 08             	sub    esp,0x8
  40330c:	53                   	push   ebx
  40330d:	56                   	push   esi
  40330e:	57                   	push   edi
  40330f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  403312:	c7 45 f8 80 11 40 00 	mov    DWORD PTR [ebp-0x8],0x401180
  403319:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40331c:	8b c8                	mov    ecx,eax
  40331e:	83 e1 01             	and    ecx,0x1
  403321:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  403324:	24 fe                	and    al,0xfe
  403326:	50                   	push   eax
  403327:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
  40332a:	8b 10                	mov    edx,DWORD PTR [eax]
  40332c:	ff 52 04             	call   DWORD PTR [edx+0x4]
  40332f:	68 2c 26 40 00       	push   0x40262c
  403334:	e8 37 00 00 00       	call   0x403370
  403339:	68 54 26 40 00       	push   0x402654
  40333e:	e8 2d 00 00 00       	call   0x403370
  403343:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40334a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40334d:	50                   	push   eax
  40334e:	8b 08                	mov    ecx,DWORD PTR [eax]
  403350:	ff 51 08             	call   DWORD PTR [ecx+0x8]
  403353:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  403356:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  403359:	5f                   	pop    edi
  40335a:	5e                   	pop    esi
  40335b:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  403362:	5b                   	pop    ebx
  403363:	8b e5                	mov    esp,ebp
  403365:	5d                   	pop    ebp
  403366:	c2 04 00             	ret    0x4
  403369:	90                   	nop
  40336a:	90                   	nop
  40336b:	90                   	nop
  40336c:	90                   	nop
  40336d:	90                   	nop
  40336e:	90                   	nop
  40336f:	90                   	nop
  403370:	55                   	push   ebp
  403371:	8b ec                	mov    ebp,esp
  403373:	83 ec 14             	sub    esp,0x14
  403376:	68 66 12 40 00       	push   0x401266
  40337b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403381:	50                   	push   eax
  403382:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  403389:	81 ec 14 01 00 00    	sub    esp,0x114
  40338f:	53                   	push   ebx
  403390:	56                   	push   esi
  403391:	57                   	push   edi
  403392:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  403395:	c7 45 f0 88 11 40 00 	mov    DWORD PTR [ebp-0x10],0x401188
  40339c:	33 f6                	xor    esi,esi
  40339e:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  4033a1:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  4033a4:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
  4033a7:	89 75 c4             	mov    DWORD PTR [ebp-0x3c],esi
  4033aa:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
  4033ad:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  4033b0:	89 75 a0             	mov    DWORD PTR [ebp-0x60],esi
  4033b3:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
  4033b6:	89 75 80             	mov    DWORD PTR [ebp-0x80],esi
  4033b9:	89 b5 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],esi
  4033bf:	89 b5 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],esi
  4033c5:	89 b5 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],esi
  4033cb:	89 b5 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],esi
  4033d1:	89 b5 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],esi
  4033d7:	89 b5 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],esi
  4033dd:	89 b5 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],esi
  4033e3:	89 b5 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],esi
  4033e9:	89 b5 08 ff ff ff    	mov    DWORD PTR [ebp-0xf8],esi
  4033ef:	89 b5 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],esi
  4033f5:	89 b5 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],esi
  4033fb:	89 b5 ec fe ff ff    	mov    DWORD PTR [ebp-0x114],esi
  403401:	89 b5 e8 fe ff ff    	mov    DWORD PTR [ebp-0x118],esi
  403407:	89 b5 e4 fe ff ff    	mov    DWORD PTR [ebp-0x11c],esi
  40340d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  403410:	8d 4d a0             	lea    ecx,[ebp-0x60]
  403413:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  403419:	6a 01                	push   0x1
  40341b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  403421:	c7 85 40 ff ff ff 04 	mov    DWORD PTR [ebp-0xc0],0x80020004
  403428:	00 02 80 
  40342b:	c7 85 38 ff ff ff 0a 	mov    DWORD PTR [ebp-0xc8],0xa
  403432:	00 00 00 
  403435:	c7 85 10 ff ff ff 14 	mov    DWORD PTR [ebp-0xf0],0x402814
  40343c:	28 40 00 
  40343f:	c7 85 08 ff ff ff 08 	mov    DWORD PTR [ebp-0xf8],0x8
  403446:	00 00 00 
  403449:	8d 95 08 ff ff ff    	lea    edx,[ebp-0xf8]
  40344f:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  403455:	ff 15 28 11 40 00    	call   DWORD PTR ds:0x401128
  40345b:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  403461:	50                   	push   eax
  403462:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  403468:	51                   	push   ecx
  403469:	8d 95 28 ff ff ff    	lea    edx,[ebp-0xd8]
  40346f:	52                   	push   edx
  403470:	ff 15 44 10 40 00    	call   DWORD PTR ds:0x401044
  403476:	8d 85 28 ff ff ff    	lea    eax,[ebp-0xd8]
  40347c:	50                   	push   eax
  40347d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  403480:	51                   	push   ecx
  403481:	8b 1d 20 11 40 00    	mov    ebx,DWORD PTR ds:0x401120
  403487:	ff d3                	call   ebx
  403489:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  40348f:	52                   	push   edx
  403490:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  403496:	50                   	push   eax
  403497:	6a 02                	push   0x2
  403499:	8b 3d 24 10 40 00    	mov    edi,DWORD PTR ds:0x401024
  40349f:	ff d7                	call   edi
  4034a1:	b8 2c 28 40 00       	mov    eax,0x40282c
  4034a6:	89 85 10 ff ff ff    	mov    DWORD PTR [ebp-0xf0],eax
  4034ac:	b9 08 00 00 00       	mov    ecx,0x8
  4034b1:	89 8d 08 ff ff ff    	mov    DWORD PTR [ebp-0xf8],ecx
  4034b7:	51                   	push   ecx
  4034b8:	8b d4                	mov    edx,esp
  4034ba:	89 0a                	mov    DWORD PTR [edx],ecx
  4034bc:	8b 8d 0c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xf4]
  4034c2:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  4034c5:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  4034c8:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [ebp-0xec]
  4034ce:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  4034d1:	6a 01                	push   0x1
  4034d3:	68 44 27 40 00       	push   0x402744
  4034d8:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  4034db:	51                   	push   ecx
  4034dc:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  4034e2:	52                   	push   edx
  4034e3:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  4034e9:	83 c4 20             	add    esp,0x20
  4034ec:	50                   	push   eax
  4034ed:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  4034f3:	50                   	push   eax
  4034f4:	ff d3                	call   ebx
  4034f6:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  4034fc:	51                   	push   ecx
  4034fd:	8d 55 b4             	lea    edx,[ebp-0x4c]
  403500:	52                   	push   edx
  403501:	8d 85 f0 fe ff ff    	lea    eax,[ebp-0x110]
  403507:	50                   	push   eax
  403508:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  40350e:	51                   	push   ecx
  40350f:	8d 95 e4 fe ff ff    	lea    edx,[ebp-0x11c]
  403515:	52                   	push   edx
  403516:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
  40351c:	50                   	push   eax
  40351d:	ff 15 44 11 40 00    	call   DWORD PTR ds:0x401144
  403523:	8b 1d 40 10 40 00    	mov    ebx,DWORD PTR ds:0x401040
  403529:	3b c6                	cmp    eax,esi
  40352b:	56                   	push   esi
  40352c:	0f 84 71 01 00 00    	je     0x4036a3
  403532:	68 94 26 40 00       	push   0x402694
  403537:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40353a:	51                   	push   ecx
  40353b:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  403541:	52                   	push   edx
  403542:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  403548:	83 c4 10             	add    esp,0x10
  40354b:	50                   	push   eax
  40354c:	ff 15 38 10 40 00    	call   DWORD PTR ds:0x401038
  403552:	8b d0                	mov    edx,eax
  403554:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  40355a:	ff 15 40 11 40 00    	call   DWORD PTR ds:0x401140
  403560:	50                   	push   eax
  403561:	68 4c 28 40 00       	push   0x40284c
  403566:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  40356c:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
  403572:	c7 85 38 ff ff ff 08 	mov    DWORD PTR [ebp-0xc8],0x8
  403579:	00 00 00 
  40357c:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  403582:	50                   	push   eax
  403583:	8d 8d 28 ff ff ff    	lea    ecx,[ebp-0xd8]
  403589:	51                   	push   ecx
  40358a:	ff 15 7c 10 40 00    	call   DWORD PTR ds:0x40107c
  403590:	8d 95 28 ff ff ff    	lea    edx,[ebp-0xd8]
  403596:	52                   	push   edx
  403597:	8d 85 18 ff ff ff    	lea    eax,[ebp-0xe8]
  40359d:	50                   	push   eax
  40359e:	ff d3                	call   ebx
  4035a0:	8d 95 18 ff ff ff    	lea    edx,[ebp-0xe8]
  4035a6:	8d 4d 80             	lea    ecx,[ebp-0x80]
  4035a9:	ff 15 10 10 40 00    	call   DWORD PTR ds:0x401010
  4035af:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  4035b5:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4035bb:	8d 8d 28 ff ff ff    	lea    ecx,[ebp-0xd8]
  4035c1:	51                   	push   ecx
  4035c2:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  4035c8:	52                   	push   edx
  4035c9:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  4035cf:	50                   	push   eax
  4035d0:	6a 03                	push   0x3
  4035d2:	ff d7                	call   edi
  4035d4:	83 c4 10             	add    esp,0x10
  4035d7:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4035da:	89 8d 10 ff ff ff    	mov    DWORD PTR [ebp-0xf0],ecx
  4035e0:	c7 85 08 ff ff ff 08 	mov    DWORD PTR [ebp-0xf8],0x4008
  4035e7:	40 00 00 
  4035ea:	8d 95 08 ff ff ff    	lea    edx,[ebp-0xf8]
  4035f0:	52                   	push   edx
  4035f1:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  4035f7:	50                   	push   eax
  4035f8:	ff d3                	call   ebx
  4035fa:	89 b5 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],esi
  403600:	c7 85 f8 fe ff ff 02 	mov    DWORD PTR [ebp-0x108],0x8002
  403607:	80 00 00 
  40360a:	6a 01                	push   0x1
  40360c:	8d 4d 80             	lea    ecx,[ebp-0x80]
  40360f:	51                   	push   ecx
  403610:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  403616:	52                   	push   edx
  403617:	6a 01                	push   0x1
  403619:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  40361f:	50                   	push   eax
  403620:	ff 15 e0 10 40 00    	call   DWORD PTR ds:0x4010e0
  403626:	50                   	push   eax
  403627:	8d 8d f8 fe ff ff    	lea    ecx,[ebp-0x108]
  40362d:	51                   	push   ecx
  40362e:	ff 15 00 10 40 00    	call   DWORD PTR ds:0x401000
  403634:	8b f0                	mov    esi,eax
  403636:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  40363c:	52                   	push   edx
  40363d:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  403643:	50                   	push   eax
  403644:	6a 02                	push   0x2
  403646:	ff d7                	call   edi
  403648:	83 c4 0c             	add    esp,0xc
  40364b:	66 85 f6             	test   si,si
  40364e:	74 26                	je     0x403676
  403650:	6a 00                	push   0x0
  403652:	68 50 28 40 00       	push   0x402850
  403657:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40365a:	51                   	push   ecx
  40365b:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  403661:	52                   	push   edx
  403662:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  403668:	83 c4 10             	add    esp,0x10
  40366b:	8b d0                	mov    edx,eax
  40366d:	8d 4d 90             	lea    ecx,[ebp-0x70]
  403670:	ff 15 10 10 40 00    	call   DWORD PTR ds:0x401010
  403676:	8d 45 b4             	lea    eax,[ebp-0x4c]
  403679:	50                   	push   eax
  40367a:	8d 8d f0 fe ff ff    	lea    ecx,[ebp-0x110]
  403680:	51                   	push   ecx
  403681:	8d 95 e8 fe ff ff    	lea    edx,[ebp-0x118]
  403687:	52                   	push   edx
  403688:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  40368e:	50                   	push   eax
  40368f:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  403695:	51                   	push   ecx
  403696:	ff 15 30 10 40 00    	call   DWORD PTR ds:0x401030
  40369c:	33 f6                	xor    esi,esi
  40369e:	e9 86 fe ff ff       	jmp    0x403529
  4036a3:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
  4036a9:	52                   	push   edx
  4036aa:	8b 3d 34 11 40 00    	mov    edi,DWORD PTR ds:0x401134
  4036b0:	ff d7                	call   edi
  4036b2:	56                   	push   esi
  4036b3:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4036b6:	50                   	push   eax
  4036b7:	ff d7                	call   edi
  4036b9:	ff 15 18 11 40 00    	call   DWORD PTR ds:0x401118
  4036bf:	50                   	push   eax
  4036c0:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  4036c6:	51                   	push   ecx
  4036c7:	ff 15 6c 10 40 00    	call   DWORD PTR ds:0x40106c
  4036cd:	8b 10                	mov    edx,DWORD PTR [eax]
  4036cf:	50                   	push   eax
  4036d0:	ff 52 48             	call   DWORD PTR [edx+0x48]
  4036d3:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  4036d9:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  4036df:	ff 15 64 10 40 00    	call   DWORD PTR ds:0x401064
  4036e5:	68 83 37 40 00       	push   0x403783
  4036ea:	eb 40                	jmp    0x40372c
  4036ec:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  4036f2:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4036f8:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  4036fe:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  403704:	8d 85 18 ff ff ff    	lea    eax,[ebp-0xe8]
  40370a:	50                   	push   eax
  40370b:	8d 8d 28 ff ff ff    	lea    ecx,[ebp-0xd8]
  403711:	51                   	push   ecx
  403712:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  403718:	52                   	push   edx
  403719:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  40371f:	50                   	push   eax
  403720:	6a 04                	push   0x4
  403722:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  403728:	83 c4 14             	add    esp,0x14
  40372b:	c3                   	ret
  40372c:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  403732:	51                   	push   ecx
  403733:	ff 15 50 11 40 00    	call   DWORD PTR ds:0x401150
  403739:	8d 8d f0 fe ff ff    	lea    ecx,[ebp-0x110]
  40373f:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  403745:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  403748:	8b 35 18 10 40 00    	mov    esi,DWORD PTR ds:0x401018
  40374e:	ff d6                	call   esi
  403750:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  403753:	ff d6                	call   esi
  403755:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  403758:	ff d6                	call   esi
  40375a:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40375d:	ff d6                	call   esi
  40375f:	8d 4d a0             	lea    ecx,[ebp-0x60]
  403762:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  403768:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40376b:	ff d6                	call   esi
  40376d:	8d 4d 80             	lea    ecx,[ebp-0x80]
  403770:	ff d6                	call   esi
  403772:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  403778:	ff d6                	call   esi
  40377a:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  403780:	ff d6                	call   esi
  403782:	c3                   	ret
  403783:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  403786:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40378d:	5f                   	pop    edi
  40378e:	5e                   	pop    esi
  40378f:	5b                   	pop    ebx
  403790:	8b e5                	mov    esp,ebp
  403792:	5d                   	pop    ebp
  403793:	c2 04 00             	ret    0x4
  403796:	90                   	nop
  403797:	90                   	nop
  403798:	90                   	nop
  403799:	90                   	nop
  40379a:	90                   	nop
  40379b:	90                   	nop
  40379c:	90                   	nop
  40379d:	90                   	nop
  40379e:	90                   	nop
  40379f:	90                   	nop
  4037a0:	55                   	push   ebp
  4037a1:	8b ec                	mov    ebp,esp
  4037a3:	83 ec 08             	sub    esp,0x8
  4037a6:	68 66 12 40 00       	push   0x401266
  4037ab:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4037b1:	50                   	push   eax
  4037b2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  4037b9:	83 ec 10             	sub    esp,0x10
  4037bc:	53                   	push   ebx
  4037bd:	56                   	push   esi
  4037be:	57                   	push   edi
  4037bf:	89 65 f8             	mov    DWORD PTR [ebp-0x8],esp
  4037c2:	c7 45 fc b0 11 40 00 	mov    DWORD PTR [ebp-0x4],0x4011b0
  4037c9:	33 c0                	xor    eax,eax
  4037cb:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4037ce:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  4037d1:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  4037d4:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  4037d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4037da:	8b 10                	mov    edx,DWORD PTR [eax]
  4037dc:	ff 15 08 11 40 00    	call   DWORD PTR ds:0x401108
  4037e2:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  4037e5:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  4037eb:	51                   	push   ecx
  4037ec:	68 30 29 40 00       	push   0x402930
  4037f1:	ff d6                	call   esi
  4037f3:	85 c0                	test   eax,eax
  4037f5:	75 17                	jne    0x40380e
  4037f7:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  4037fa:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  4037fd:	8b 07                	mov    eax,DWORD PTR [edi]
  4037ff:	8b 31                	mov    esi,DWORD PTR [ecx]
  403801:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  403804:	8b d0                	mov    edx,eax
  403806:	f7 d2                	not    edx
  403808:	8b 09                	mov    ecx,DWORD PTR [ecx]
  40380a:	23 d6                	and    edx,esi
  40380c:	eb 24                	jmp    0x403832
  40380e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403811:	50                   	push   eax
  403812:	68 3c 29 40 00       	push   0x40293c
  403817:	ff d6                	call   esi
  403819:	85 c0                	test   eax,eax
  40381b:	75 3c                	jne    0x403859
  40381d:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  403820:	8b 01                	mov    eax,DWORD PTR [ecx]
  403822:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  403825:	8b d0                	mov    edx,eax
  403827:	8b 39                	mov    edi,DWORD PTR [ecx]
  403829:	f7 d2                	not    edx
  40382b:	23 d7                	and    edx,edi
  40382d:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  403830:	8b 0f                	mov    ecx,DWORD PTR [edi]
  403832:	23 c8                	and    ecx,eax
  403834:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  403837:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  40383a:	0b d1                	or     edx,ecx
  40383c:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
  40383f:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
  403842:	52                   	push   edx
  403843:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403846:	50                   	push   eax
  403847:	51                   	push   ecx
  403848:	56                   	push   esi
  403849:	e8 02 19 00 00       	call   0x405150
  40384e:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  403851:	89 06                	mov    DWORD PTR [esi],eax
  403853:	52                   	push   edx
  403854:	e9 84 00 00 00       	jmp    0x4038dd
  403859:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  40385c:	50                   	push   eax
  40385d:	68 48 29 40 00       	push   0x402948
  403862:	ff d6                	call   esi
  403864:	85 c0                	test   eax,eax
  403866:	75 33                	jne    0x40389b
  403868:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  40386b:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  40386e:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  403871:	8b 0f                	mov    ecx,DWORD PTR [edi]
  403873:	8b 32                	mov    esi,DWORD PTR [edx]
  403875:	8b 10                	mov    edx,DWORD PTR [eax]
  403877:	33 ce                	xor    ecx,esi
  403879:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  40387c:	33 ca                	xor    ecx,edx
  40387e:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  403881:	89 4d e8             	mov    DWORD PTR [ebp-0x18],ecx
  403884:	8b 4d 24             	mov    ecx,DWORD PTR [ebp+0x24]
  403887:	8d 45 e8             	lea    eax,[ebp-0x18]
  40388a:	51                   	push   ecx
  40388b:	52                   	push   edx
  40388c:	50                   	push   eax
  40388d:	56                   	push   esi
  40388e:	e8 bd 18 00 00       	call   0x405150
  403893:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
  403896:	89 06                	mov    DWORD PTR [esi],eax
  403898:	51                   	push   ecx
  403899:	eb 42                	jmp    0x4038dd
  40389b:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  40389e:	52                   	push   edx
  40389f:	68 54 29 40 00       	push   0x402954
  4038a4:	ff d6                	call   esi
  4038a6:	85 c0                	test   eax,eax
  4038a8:	75 44                	jne    0x4038ee
  4038aa:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  4038ad:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  4038b0:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  4038b3:	8b 08                	mov    ecx,DWORD PTR [eax]
  4038b5:	8b 07                	mov    eax,DWORD PTR [edi]
  4038b7:	8b 32                	mov    esi,DWORD PTR [edx]
  4038b9:	8d 55 e8             	lea    edx,[ebp-0x18]
  4038bc:	f7 d1                	not    ecx
  4038be:	0b c8                	or     ecx,eax
  4038c0:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  4038c3:	33 ce                	xor    ecx,esi
  4038c5:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  4038c8:	89 4d e8             	mov    DWORD PTR [ebp-0x18],ecx
  4038cb:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  4038ce:	50                   	push   eax
  4038cf:	51                   	push   ecx
  4038d0:	52                   	push   edx
  4038d1:	56                   	push   esi
  4038d2:	e8 79 18 00 00       	call   0x405150
  4038d7:	89 06                	mov    DWORD PTR [esi],eax
  4038d9:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
  4038dc:	50                   	push   eax
  4038dd:	56                   	push   esi
  4038de:	e8 3d 00 00 00       	call   0x403920
  4038e3:	57                   	push   edi
  4038e4:	56                   	push   esi
  4038e5:	89 06                	mov    DWORD PTR [esi],eax
  4038e7:	e8 94 17 00 00       	call   0x405080
  4038ec:	89 06                	mov    DWORD PTR [esi],eax
  4038ee:	68 fd 38 40 00       	push   0x4038fd
  4038f3:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4038f6:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4038fc:	c3                   	ret
  4038fd:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  403900:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  403903:	5f                   	pop    edi
  403904:	5e                   	pop    esi
  403905:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40390c:	5b                   	pop    ebx
  40390d:	8b e5                	mov    esp,ebp
  40390f:	5d                   	pop    ebp
  403910:	c2 20 00             	ret    0x20
  403913:	90                   	nop
  403914:	90                   	nop
  403915:	90                   	nop
  403916:	90                   	nop
  403917:	90                   	nop
  403918:	90                   	nop
  403919:	90                   	nop
  40391a:	90                   	nop
  40391b:	90                   	nop
  40391c:	90                   	nop
  40391d:	90                   	nop
  40391e:	90                   	nop
  40391f:	90                   	nop
  403920:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  403924:	55                   	push   ebp
  403925:	8b 28                	mov    ebp,DWORD PTR [eax]
  403927:	81 e5 1f 00 00 80    	and    ebp,0x8000001f
  40392d:	79 05                	jns    0x403934
  40392f:	4d                   	dec    ebp
  403930:	83 cd e0             	or     ebp,0xffffffe0
  403933:	45                   	inc    ebp
  403934:	89 28                	mov    DWORD PTR [eax],ebp
  403936:	75 0a                	jne    0x403942
  403938:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  40393c:	5d                   	pop    ebp
  40393d:	8b 00                	mov    eax,DWORD PTR [eax]
  40393f:	c2 08 00             	ret    0x8
  403942:	56                   	push   esi
  403943:	be 01 00 00 00       	mov    esi,0x1
  403948:	57                   	push   edi
  403949:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  40394d:	3b ee                	cmp    ebp,esi
  40394f:	7c 41                	jl     0x403992
  403951:	53                   	push   ebx
  403952:	8b 07                	mov    eax,DWORD PTR [edi]
  403954:	33 db                	xor    ebx,ebx
  403956:	8b c8                	mov    ecx,eax
  403958:	81 e1 00 00 00 c0    	and    ecx,0xc0000000
  40395e:	8b d1                	mov    edx,ecx
  403960:	c1 ea 1e             	shr    edx,0x1e
  403963:	83 e2 01             	and    edx,0x1
  403966:	f7 da                	neg    edx
  403968:	81 e2 00 00 00 80    	and    edx,0x80000000
  40396e:	85 c9                	test   ecx,ecx
  403970:	0f 9c c3             	setl   bl
  403973:	f7 db                	neg    ebx
  403975:	83 e3 01             	and    ebx,0x1
  403978:	25 ff ff ff 3f       	and    eax,0x3fffffff
  40397d:	0b d3                	or     edx,ebx
  40397f:	6b c0 02             	imul   eax,eax,0x2
  403982:	70 16                	jo     0x40399a
  403984:	0b d0                	or     edx,eax
  403986:	83 c6 01             	add    esi,0x1
  403989:	70 0f                	jo     0x40399a
  40398b:	3b f5                	cmp    esi,ebp
  40398d:	89 17                	mov    DWORD PTR [edi],edx
  40398f:	7e c1                	jle    0x403952
  403991:	5b                   	pop    ebx
  403992:	8b 07                	mov    eax,DWORD PTR [edi]
  403994:	5f                   	pop    edi
  403995:	5e                   	pop    esi
  403996:	5d                   	pop    ebp
  403997:	c2 08 00             	ret    0x8
  40399a:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  4039a0:	55                   	push   ebp
  4039a1:	8b ec                	mov    ebp,esp
  4039a3:	83 ec 08             	sub    esp,0x8
  4039a6:	68 66 12 40 00       	push   0x401266
  4039ab:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4039b1:	50                   	push   eax
  4039b2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  4039b9:	83 ec 54             	sub    esp,0x54
  4039bc:	53                   	push   ebx
  4039bd:	56                   	push   esi
  4039be:	57                   	push   edi
  4039bf:	89 65 f8             	mov    DWORD PTR [ebp-0x8],esp
  4039c2:	c7 45 fc c0 11 40 00 	mov    DWORD PTR [ebp-0x4],0x4011c0
  4039c9:	8b 0d 24 70 40 00    	mov    ecx,DWORD PTR ds:0x407024
  4039cf:	33 ff                	xor    edi,edi
  4039d1:	8b c1                	mov    eax,ecx
  4039d3:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
  4039d6:	25 3f 00 00 80       	and    eax,0x8000003f
  4039db:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  4039de:	79 05                	jns    0x4039e5
  4039e0:	48                   	dec    eax
  4039e1:	83 c8 c0             	or     eax,0xffffffc0
  4039e4:	40                   	inc    eax
  4039e5:	bb 40 00 00 00       	mov    ebx,0x40
  4039ea:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4039ed:	2b d8                	sub    ebx,eax
  4039ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4039f2:	0f 80 71 02 00 00    	jo     0x403c69
  4039f8:	8b 10                	mov    edx,DWORD PTR [eax]
  4039fa:	03 d1                	add    edx,ecx
  4039fc:	0f 80 67 02 00 00    	jo     0x403c69
  403a02:	89 15 24 70 40 00    	mov    DWORD PTR ds:0x407024,edx
  403a08:	8b 08                	mov    ecx,DWORD PTR [eax]
  403a0a:	3b cb                	cmp    ecx,ebx
  403a0c:	0f 8c 90 01 00 00    	jl     0x403ba2
  403a12:	8b cb                	mov    ecx,ebx
  403a14:	83 e9 01             	sub    ecx,0x1
  403a17:	0f 80 4c 02 00 00    	jo     0x403c69
  403a1d:	ff 15 a0 10 40 00    	call   DWORD PTR ds:0x4010a0
  403a23:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  403a26:	66 3b 7d bc          	cmp    di,WORD PTR [ebp-0x44]
  403a2a:	7f 73                	jg     0x403a9f
  403a2c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  403a2f:	8b 00                	mov    eax,DWORD PTR [eax]
  403a31:	85 c0                	test   eax,eax
  403a33:	74 20                	je     0x403a55
  403a35:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  403a39:	75 1a                	jne    0x403a55
  403a3b:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  403a3e:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  403a41:	0f bf f7             	movsx  esi,di
  403a44:	2b f2                	sub    esi,edx
  403a46:	3b f1                	cmp    esi,ecx
  403a48:	72 06                	jb     0x403a50
  403a4a:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403a50:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
  403a53:	eb 09                	jmp    0x403a5e
  403a55:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403a5b:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  403a5e:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  403a61:	0f bf f7             	movsx  esi,di
  403a64:	03 f1                	add    esi,ecx
  403a66:	0f 80 fd 01 00 00    	jo     0x403c69
  403a6c:	83 fe 40             	cmp    esi,0x40
  403a6f:	72 06                	jb     0x403a77
  403a71:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403a77:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  403a7a:	8b 11                	mov    edx,DWORD PTR [ecx]
  403a7c:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  403a7f:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  403a82:	8a 14 08             	mov    dl,BYTE PTR [eax+ecx*1]
  403a85:	a1 54 70 40 00       	mov    eax,ds:0x407054
  403a8a:	88 14 30             	mov    BYTE PTR [eax+esi*1],dl
  403a8d:	b8 01 00 00 00       	mov    eax,0x1
  403a92:	66 03 c7             	add    ax,di
  403a95:	0f 80 ce 01 00 00    	jo     0x403c69
  403a9b:	8b f8                	mov    edi,eax
  403a9d:	eb 87                	jmp    0x403a26
  403a9f:	8d 4d cc             	lea    ecx,[ebp-0x34]
  403aa2:	c7 45 cc 48 70 40 00 	mov    DWORD PTR [ebp-0x34],0x407048
  403aa9:	51                   	push   ecx
  403aaa:	e8 81 03 00 00       	call   0x403e30
  403aaf:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  403ab2:	8b 0a                	mov    ecx,DWORD PTR [edx]
  403ab4:	8b c1                	mov    eax,ecx
  403ab6:	25 3f 00 00 80       	and    eax,0x8000003f
  403abb:	79 05                	jns    0x403ac2
  403abd:	48                   	dec    eax
  403abe:	83 c8 c0             	or     eax,0xffffffc0
  403ac1:	40                   	inc    eax
  403ac2:	0f bf d7             	movsx  edx,di
  403ac5:	8b 35 a0 10 40 00    	mov    esi,DWORD PTR ds:0x4010a0
  403acb:	2b ca                	sub    ecx,edx
  403acd:	0f 80 96 01 00 00    	jo     0x403c69
  403ad3:	2b c8                	sub    ecx,eax
  403ad5:	0f 80 8e 01 00 00    	jo     0x403c69
  403adb:	ff d6                	call   esi
  403add:	8b cb                	mov    ecx,ebx
  403adf:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  403ae2:	ff d6                	call   esi
  403ae4:	8b f0                	mov    esi,eax
  403ae6:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
  403ae9:	66 3b 75 b4          	cmp    si,WORD PTR [ebp-0x4c]
  403aed:	0f 8f a6 00 00 00    	jg     0x403b99
  403af3:	33 ff                	xor    edi,edi
  403af5:	b8 3f 00 00 00       	mov    eax,0x3f
  403afa:	66 3b f8             	cmp    di,ax
  403afd:	7f 72                	jg     0x403b71
  403aff:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  403b02:	8b 00                	mov    eax,DWORD PTR [eax]
  403b04:	85 c0                	test   eax,eax
  403b06:	74 2b                	je     0x403b33
  403b08:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  403b0c:	75 25                	jne    0x403b33
  403b0e:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  403b11:	66 8b cf             	mov    cx,di
  403b14:	66 03 ce             	add    cx,si
  403b17:	0f 80 4c 01 00 00    	jo     0x403c69
  403b1d:	0f bf f1             	movsx  esi,cx
  403b20:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  403b23:	2b f2                	sub    esi,edx
  403b25:	3b f1                	cmp    esi,ecx
  403b27:	72 06                	jb     0x403b2f
  403b29:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403b2f:	8b de                	mov    ebx,esi
  403b31:	eb 08                	jmp    0x403b3b
  403b33:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403b39:	8b d8                	mov    ebx,eax
  403b3b:	0f bf f7             	movsx  esi,di
  403b3e:	83 fe 40             	cmp    esi,0x40
  403b41:	72 06                	jb     0x403b49
  403b43:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403b49:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  403b4c:	8b 02                	mov    eax,DWORD PTR [edx]
  403b4e:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  403b51:	a1 54 70 40 00       	mov    eax,ds:0x407054
  403b56:	8a 14 19             	mov    dl,BYTE PTR [ecx+ebx*1]
  403b59:	88 14 30             	mov    BYTE PTR [eax+esi*1],dl
  403b5c:	8b 75 e0             	mov    esi,DWORD PTR [ebp-0x20]
  403b5f:	b8 01 00 00 00       	mov    eax,0x1
  403b64:	66 03 c7             	add    ax,di
  403b67:	0f 80 fc 00 00 00    	jo     0x403c69
  403b6d:	8b f8                	mov    edi,eax
  403b6f:	eb 84                	jmp    0x403af5
  403b71:	8d 4d cc             	lea    ecx,[ebp-0x34]
  403b74:	c7 45 cc 48 70 40 00 	mov    DWORD PTR [ebp-0x34],0x407048
  403b7b:	51                   	push   ecx
  403b7c:	e8 af 02 00 00       	call   0x403e30
  403b81:	b8 40 00 00 00       	mov    eax,0x40
  403b86:	66 03 c6             	add    ax,si
  403b89:	0f 80 da 00 00 00    	jo     0x403c69
  403b8f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  403b92:	8b f0                	mov    esi,eax
  403b94:	e9 50 ff ff ff       	jmp    0x403ae9
  403b99:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
  403ba0:	eb 05                	jmp    0x403ba7
  403ba2:	89 7d e0             	mov    DWORD PTR [ebp-0x20],edi
  403ba5:	8b f7                	mov    esi,edi
  403ba7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403baa:	0f bf d6             	movsx  edx,si
  403bad:	8b 08                	mov    ecx,DWORD PTR [eax]
  403baf:	2b ca                	sub    ecx,edx
  403bb1:	0f 80 b2 00 00 00    	jo     0x403c69
  403bb7:	83 e9 01             	sub    ecx,0x1
  403bba:	0f 80 a9 00 00 00    	jo     0x403c69
  403bc0:	ff 15 a0 10 40 00    	call   DWORD PTR ds:0x4010a0
  403bc6:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  403bc9:	33 ff                	xor    edi,edi
  403bcb:	66 3b 7d a4          	cmp    di,WORD PTR [ebp-0x5c]
  403bcf:	7f 70                	jg     0x403c41
  403bd1:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  403bd4:	8b 01                	mov    eax,DWORD PTR [ecx]
  403bd6:	85 c0                	test   eax,eax
  403bd8:	74 25                	je     0x403bff
  403bda:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  403bde:	75 1f                	jne    0x403bff
  403be0:	66 8b d7             	mov    dx,di
  403be3:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  403be6:	66 03 d6             	add    dx,si
  403be9:	70 7e                	jo     0x403c69
  403beb:	0f bf f2             	movsx  esi,dx
  403bee:	2b 70 14             	sub    esi,DWORD PTR [eax+0x14]
  403bf1:	3b f1                	cmp    esi,ecx
  403bf3:	72 06                	jb     0x403bfb
  403bf5:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403bfb:	8b de                	mov    ebx,esi
  403bfd:	eb 08                	jmp    0x403c07
  403bff:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403c05:	8b d8                	mov    ebx,eax
  403c07:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  403c0a:	0f bf f7             	movsx  esi,di
  403c0d:	03 f1                	add    esi,ecx
  403c0f:	70 58                	jo     0x403c69
  403c11:	83 fe 40             	cmp    esi,0x40
  403c14:	72 06                	jb     0x403c1c
  403c16:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403c1c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  403c1f:	8b 08                	mov    ecx,DWORD PTR [eax]
  403c21:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  403c24:	8b 0d 54 70 40 00    	mov    ecx,DWORD PTR ds:0x407054
  403c2a:	8a 04 1a             	mov    al,BYTE PTR [edx+ebx*1]
  403c2d:	88 04 31             	mov    BYTE PTR [ecx+esi*1],al
  403c30:	8b 75 e0             	mov    esi,DWORD PTR [ebp-0x20]
  403c33:	b8 01 00 00 00       	mov    eax,0x1
  403c38:	66 03 c7             	add    ax,di
  403c3b:	70 2c                	jo     0x403c69
  403c3d:	8b f8                	mov    edi,eax
  403c3f:	eb 8a                	jmp    0x403bcb
  403c41:	68 53 3c 40 00       	push   0x403c53
  403c46:	eb 0a                	jmp    0x403c52
  403c48:	8d 4d ec             	lea    ecx,[ebp-0x14]
  403c4b:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  403c51:	c3                   	ret
  403c52:	c3                   	ret
  403c53:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  403c56:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  403c59:	5f                   	pop    edi
  403c5a:	5e                   	pop    esi
  403c5b:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  403c62:	5b                   	pop    ebx
  403c63:	8b e5                	mov    esp,ebp
  403c65:	5d                   	pop    ebp
  403c66:	c2 08 00             	ret    0x8
  403c69:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  403c6f:	90                   	nop
  403c70:	55                   	push   ebp
  403c71:	8b ec                	mov    ebp,esp
  403c73:	83 ec 0c             	sub    esp,0xc
  403c76:	68 66 12 40 00       	push   0x401266
  403c7b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403c81:	50                   	push   eax
  403c82:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  403c89:	83 ec 64             	sub    esp,0x64
  403c8c:	53                   	push   ebx
  403c8d:	56                   	push   esi
  403c8e:	57                   	push   edi
  403c8f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  403c92:	c7 45 f8 d0 11 40 00 	mov    DWORD PTR [ebp-0x8],0x4011d0
  403c99:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  403c9c:	8b 35 1c 10 40 00    	mov    esi,DWORD PTR ds:0x40101c
  403ca2:	33 ff                	xor    edi,edi
  403ca4:	8b 03                	mov    eax,DWORD PTR [ebx]
  403ca6:	57                   	push   edi
  403ca7:	50                   	push   eax
  403ca8:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
  403cab:	89 7d e0             	mov    DWORD PTR [ebp-0x20],edi
  403cae:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  403cb1:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  403cb4:	89 7d bc             	mov    DWORD PTR [ebp-0x44],edi
  403cb7:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  403cba:	ff d6                	call   esi
  403cbc:	50                   	push   eax
  403cbd:	6a 01                	push   0x1
  403cbf:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403cc2:	6a 11                	push   0x11
  403cc4:	51                   	push   ecx
  403cc5:	6a 01                	push   0x1
  403cc7:	68 80 00 00 00       	push   0x80
  403ccc:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  403cd2:	8b 13                	mov    edx,DWORD PTR [ebx]
  403cd4:	83 c4 1c             	add    esp,0x1c
  403cd7:	52                   	push   edx
  403cd8:	ff d6                	call   esi
  403cda:	8b c8                	mov    ecx,eax
  403cdc:	83 e9 01             	sub    ecx,0x1
  403cdf:	0f 80 38 01 00 00    	jo     0x403e1d
  403ce5:	ff 15 a0 10 40 00    	call   DWORD PTR ds:0x4010a0
  403ceb:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  403cee:	33 f6                	xor    esi,esi
  403cf0:	66 3b 75 90          	cmp    si,WORD PTR [ebp-0x70]
  403cf4:	0f 8f bc 00 00 00    	jg     0x403db6
  403cfa:	66 8b ce             	mov    cx,si
  403cfd:	8d 45 cc             	lea    eax,[ebp-0x34]
  403d00:	66 83 c1 01          	add    cx,0x1
  403d04:	50                   	push   eax
  403d05:	0f 80 12 01 00 00    	jo     0x403e1d
  403d0b:	0f bf d1             	movsx  edx,cx
  403d0e:	8d 45 ac             	lea    eax,[ebp-0x54]
  403d11:	52                   	push   edx
  403d12:	8d 4d bc             	lea    ecx,[ebp-0x44]
  403d15:	50                   	push   eax
  403d16:	51                   	push   ecx
  403d17:	c7 45 d4 01 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x1
  403d1e:	c7 45 cc 02 00 00 00 	mov    DWORD PTR [ebp-0x34],0x2
  403d25:	89 5d b4             	mov    DWORD PTR [ebp-0x4c],ebx
  403d28:	c7 45 ac 08 40 00 00 	mov    DWORD PTR [ebp-0x54],0x4008
  403d2f:	ff 15 84 10 40 00    	call   DWORD PTR ds:0x401084
  403d35:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  403d38:	3b c7                	cmp    eax,edi
  403d3a:	74 1d                	je     0x403d59
  403d3c:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  403d40:	75 17                	jne    0x403d59
  403d42:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  403d45:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  403d48:	0f bf fe             	movsx  edi,si
  403d4b:	2b fa                	sub    edi,edx
  403d4d:	3b f9                	cmp    edi,ecx
  403d4f:	72 10                	jb     0x403d61
  403d51:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403d57:	eb 08                	jmp    0x403d61
  403d59:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  403d5f:	8b f8                	mov    edi,eax
  403d61:	8d 55 bc             	lea    edx,[ebp-0x44]
  403d64:	8d 45 dc             	lea    eax,[ebp-0x24]
  403d67:	52                   	push   edx
  403d68:	50                   	push   eax
  403d69:	ff 15 e4 10 40 00    	call   DWORD PTR ds:0x4010e4
  403d6f:	50                   	push   eax
  403d70:	ff 15 34 10 40 00    	call   DWORD PTR ds:0x401034
  403d76:	8b c8                	mov    ecx,eax
  403d78:	ff 15 b4 10 40 00    	call   DWORD PTR ds:0x4010b4
  403d7e:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
  403d81:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  403d84:	8d 4d dc             	lea    ecx,[ebp-0x24]
  403d87:	88 04 3a             	mov    BYTE PTR [edx+edi*1],al
  403d8a:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  403d90:	8d 45 bc             	lea    eax,[ebp-0x44]
  403d93:	8d 4d cc             	lea    ecx,[ebp-0x34]
  403d96:	50                   	push   eax
  403d97:	51                   	push   ecx
  403d98:	6a 02                	push   0x2
  403d9a:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  403da0:	b8 01 00 00 00       	mov    eax,0x1
  403da5:	83 c4 0c             	add    esp,0xc
  403da8:	66 03 c6             	add    ax,si
  403dab:	70 70                	jo     0x403e1d
  403dad:	8b f0                	mov    esi,eax
  403daf:	33 ff                	xor    edi,edi
  403db1:	e9 3a ff ff ff       	jmp    0x403cf0
  403db6:	8d 55 e8             	lea    edx,[ebp-0x18]
  403db9:	8d 45 e0             	lea    eax,[ebp-0x20]
  403dbc:	52                   	push   edx
  403dbd:	50                   	push   eax
  403dbe:	ff 15 14 10 40 00    	call   DWORD PTR ds:0x401014
  403dc4:	68 07 3e 40 00       	push   0x403e07
  403dc9:	eb 2f                	jmp    0x403dfa
  403dcb:	f6 45 fc 04          	test   BYTE PTR [ebp-0x4],0x4
  403dcf:	74 0c                	je     0x403ddd
  403dd1:	8d 4d e0             	lea    ecx,[ebp-0x20]
  403dd4:	51                   	push   ecx
  403dd5:	6a 00                	push   0x0
  403dd7:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  403ddd:	8d 4d dc             	lea    ecx,[ebp-0x24]
  403de0:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  403de6:	8d 55 bc             	lea    edx,[ebp-0x44]
  403de9:	8d 45 cc             	lea    eax,[ebp-0x34]
  403dec:	52                   	push   edx
  403ded:	50                   	push   eax
  403dee:	6a 02                	push   0x2
  403df0:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  403df6:	83 c4 0c             	add    esp,0xc
  403df9:	c3                   	ret
  403dfa:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403dfd:	51                   	push   ecx
  403dfe:	6a 00                	push   0x0
  403e00:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  403e06:	c3                   	ret
  403e07:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  403e0a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403e0d:	5f                   	pop    edi
  403e0e:	5e                   	pop    esi
  403e0f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  403e16:	5b                   	pop    ebx
  403e17:	8b e5                	mov    esp,ebp
  403e19:	5d                   	pop    ebp
  403e1a:	c2 04 00             	ret    0x4
  403e1d:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  403e23:	90                   	nop
  403e24:	90                   	nop
  403e25:	90                   	nop
  403e26:	90                   	nop
  403e27:	90                   	nop
  403e28:	90                   	nop
  403e29:	90                   	nop
  403e2a:	90                   	nop
  403e2b:	90                   	nop
  403e2c:	90                   	nop
  403e2d:	90                   	nop
  403e2e:	90                   	nop
  403e2f:	90                   	nop
  403e30:	55                   	push   ebp
  403e31:	8b ec                	mov    ebp,esp
  403e33:	83 ec 08             	sub    esp,0x8
  403e36:	68 66 12 40 00       	push   0x401266
  403e3b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403e41:	50                   	push   eax
  403e42:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  403e49:	83 ec 48             	sub    esp,0x48
  403e4c:	53                   	push   ebx
  403e4d:	56                   	push   esi
  403e4e:	57                   	push   edi
  403e4f:	89 65 f8             	mov    DWORD PTR [ebp-0x8],esp
  403e52:	c7 45 fc e0 11 40 00 	mov    DWORD PTR [ebp-0x4],0x4011e0
  403e59:	33 c0                	xor    eax,eax
  403e5b:	6a 03                	push   0x3
  403e5d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  403e60:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  403e63:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403e66:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  403e69:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  403e6c:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  403e6f:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  403e72:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  403e75:	8d 45 c8             	lea    eax,[ebp-0x38]
  403e78:	68 80 29 40 00       	push   0x402980
  403e7d:	50                   	push   eax
  403e7e:	ff 15 98 10 40 00    	call   DWORD PTR ds:0x401098
  403e84:	a1 38 70 40 00       	mov    eax,ds:0x407038
  403e89:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  403e8c:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
  403e8f:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
  403e92:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
  403e95:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  403e98:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
  403e9b:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
  403e9e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403ea1:	8d 45 c8             	lea    eax,[ebp-0x38]
  403ea4:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
  403ea7:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  403eaa:	8d 55 b8             	lea    edx,[ebp-0x48]
  403ead:	51                   	push   ecx
  403eae:	8d 45 bc             	lea    eax,[ebp-0x44]
  403eb1:	52                   	push   edx
  403eb2:	50                   	push   eax
  403eb3:	c7 45 bc 40 00 00 00 	mov    DWORD PTR [ebp-0x44],0x40
  403eba:	e8 c1 13 00 00       	call   0x405280
  403ebf:	8b 35 08 11 40 00    	mov    esi,DWORD PTR ds:0x401108
  403ec5:	ba 30 29 40 00       	mov    edx,0x402930
  403eca:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403ecd:	c7 45 b4 78 a4 6a d7 	mov    DWORD PTR [ebp-0x4c],0xd76aa478
  403ed4:	c7 45 b8 07 00 00 00 	mov    DWORD PTR [ebp-0x48],0x7
  403edb:	ff d6                	call   esi
  403edd:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  403ee0:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  403ee3:	8d 55 b8             	lea    edx,[ebp-0x48]
  403ee6:	51                   	push   ecx
  403ee7:	52                   	push   edx
  403ee8:	8d 4d e0             	lea    ecx,[ebp-0x20]
  403eeb:	50                   	push   eax
  403eec:	8d 55 e4             	lea    edx,[ebp-0x1c]
  403eef:	51                   	push   ecx
  403ef0:	8d 45 e8             	lea    eax,[ebp-0x18]
  403ef3:	52                   	push   edx
  403ef4:	8d 4d ec             	lea    ecx,[ebp-0x14]
  403ef7:	50                   	push   eax
  403ef8:	8d 55 c0             	lea    edx,[ebp-0x40]
  403efb:	51                   	push   ecx
  403efc:	52                   	push   edx
  403efd:	e8 9e f8 ff ff       	call   0x4037a0
  403f02:	8b 3d 5c 11 40 00    	mov    edi,DWORD PTR ds:0x40115c
  403f08:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f0b:	ff d7                	call   edi
  403f0d:	ba 30 29 40 00       	mov    edx,0x402930
  403f12:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f15:	c7 45 b4 56 b7 c7 e8 	mov    DWORD PTR [ebp-0x4c],0xe8c7b756
  403f1c:	c7 45 b8 0c 00 00 00 	mov    DWORD PTR [ebp-0x48],0xc
  403f23:	ff d6                	call   esi
  403f25:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  403f28:	8d 45 b4             	lea    eax,[ebp-0x4c]
  403f2b:	8d 4d b8             	lea    ecx,[ebp-0x48]
  403f2e:	50                   	push   eax
  403f2f:	83 c2 04             	add    edx,0x4
  403f32:	51                   	push   ecx
  403f33:	8d 45 e4             	lea    eax,[ebp-0x1c]
  403f36:	52                   	push   edx
  403f37:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403f3a:	50                   	push   eax
  403f3b:	51                   	push   ecx
  403f3c:	8d 55 ec             	lea    edx,[ebp-0x14]
  403f3f:	8d 45 e0             	lea    eax,[ebp-0x20]
  403f42:	52                   	push   edx
  403f43:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f46:	50                   	push   eax
  403f47:	51                   	push   ecx
  403f48:	e8 53 f8 ff ff       	call   0x4037a0
  403f4d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f50:	ff d7                	call   edi
  403f52:	ba 30 29 40 00       	mov    edx,0x402930
  403f57:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f5a:	c7 45 b4 db 70 20 24 	mov    DWORD PTR [ebp-0x4c],0x242070db
  403f61:	c7 45 b8 11 00 00 00 	mov    DWORD PTR [ebp-0x48],0x11
  403f68:	ff d6                	call   esi
  403f6a:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  403f6d:	8d 55 b4             	lea    edx,[ebp-0x4c]
  403f70:	8d 45 b8             	lea    eax,[ebp-0x48]
  403f73:	52                   	push   edx
  403f74:	83 c1 08             	add    ecx,0x8
  403f77:	50                   	push   eax
  403f78:	8d 55 e8             	lea    edx,[ebp-0x18]
  403f7b:	51                   	push   ecx
  403f7c:	8d 45 ec             	lea    eax,[ebp-0x14]
  403f7f:	52                   	push   edx
  403f80:	8d 4d e0             	lea    ecx,[ebp-0x20]
  403f83:	50                   	push   eax
  403f84:	8d 55 e4             	lea    edx,[ebp-0x1c]
  403f87:	51                   	push   ecx
  403f88:	8d 45 c0             	lea    eax,[ebp-0x40]
  403f8b:	52                   	push   edx
  403f8c:	50                   	push   eax
  403f8d:	e8 0e f8 ff ff       	call   0x4037a0
  403f92:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403f95:	ff d7                	call   edi
  403f97:	bb 16 00 00 00       	mov    ebx,0x16
  403f9c:	ba 30 29 40 00       	mov    edx,0x402930
  403fa1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403fa4:	c7 45 b4 ee ce bd c1 	mov    DWORD PTR [ebp-0x4c],0xc1bdceee
  403fab:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  403fae:	ff d6                	call   esi
  403fb0:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  403fb3:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  403fb6:	8d 55 b8             	lea    edx,[ebp-0x48]
  403fb9:	51                   	push   ecx
  403fba:	83 c0 0c             	add    eax,0xc
  403fbd:	52                   	push   edx
  403fbe:	8d 4d ec             	lea    ecx,[ebp-0x14]
  403fc1:	50                   	push   eax
  403fc2:	8d 55 e0             	lea    edx,[ebp-0x20]
  403fc5:	51                   	push   ecx
  403fc6:	8d 45 e4             	lea    eax,[ebp-0x1c]
  403fc9:	52                   	push   edx
  403fca:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403fcd:	50                   	push   eax
  403fce:	8d 55 c0             	lea    edx,[ebp-0x40]
  403fd1:	51                   	push   ecx
  403fd2:	52                   	push   edx
  403fd3:	e8 c8 f7 ff ff       	call   0x4037a0
  403fd8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403fdb:	ff d7                	call   edi
  403fdd:	ba 30 29 40 00       	mov    edx,0x402930
  403fe2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403fe5:	c7 45 b4 af 0f 7c f5 	mov    DWORD PTR [ebp-0x4c],0xf57c0faf
  403fec:	c7 45 b8 07 00 00 00 	mov    DWORD PTR [ebp-0x48],0x7
  403ff3:	ff d6                	call   esi
  403ff5:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  403ff8:	8d 45 b4             	lea    eax,[ebp-0x4c]
  403ffb:	8d 4d b8             	lea    ecx,[ebp-0x48]
  403ffe:	50                   	push   eax
  403fff:	83 c2 10             	add    edx,0x10
  404002:	51                   	push   ecx
  404003:	8d 45 e0             	lea    eax,[ebp-0x20]
  404006:	52                   	push   edx
  404007:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40400a:	50                   	push   eax
  40400b:	8d 55 e8             	lea    edx,[ebp-0x18]
  40400e:	51                   	push   ecx
  40400f:	8d 45 ec             	lea    eax,[ebp-0x14]
  404012:	52                   	push   edx
  404013:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404016:	50                   	push   eax
  404017:	51                   	push   ecx
  404018:	e8 83 f7 ff ff       	call   0x4037a0
  40401d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404020:	ff d7                	call   edi
  404022:	ba 30 29 40 00       	mov    edx,0x402930
  404027:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40402a:	c7 45 b4 2a c6 87 47 	mov    DWORD PTR [ebp-0x4c],0x4787c62a
  404031:	c7 45 b8 0c 00 00 00 	mov    DWORD PTR [ebp-0x48],0xc
  404038:	ff d6                	call   esi
  40403a:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  40403d:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404040:	8d 45 b8             	lea    eax,[ebp-0x48]
  404043:	52                   	push   edx
  404044:	83 c1 14             	add    ecx,0x14
  404047:	50                   	push   eax
  404048:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40404b:	51                   	push   ecx
  40404c:	8d 45 e8             	lea    eax,[ebp-0x18]
  40404f:	52                   	push   edx
  404050:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404053:	50                   	push   eax
  404054:	8d 55 e0             	lea    edx,[ebp-0x20]
  404057:	51                   	push   ecx
  404058:	8d 45 c0             	lea    eax,[ebp-0x40]
  40405b:	52                   	push   edx
  40405c:	50                   	push   eax
  40405d:	e8 3e f7 ff ff       	call   0x4037a0
  404062:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404065:	ff d7                	call   edi
  404067:	ba 30 29 40 00       	mov    edx,0x402930
  40406c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40406f:	c7 45 b4 13 46 30 a8 	mov    DWORD PTR [ebp-0x4c],0xa8304613
  404076:	c7 45 b8 11 00 00 00 	mov    DWORD PTR [ebp-0x48],0x11
  40407d:	ff d6                	call   esi
  40407f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404082:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404085:	8d 55 b8             	lea    edx,[ebp-0x48]
  404088:	51                   	push   ecx
  404089:	83 c0 18             	add    eax,0x18
  40408c:	52                   	push   edx
  40408d:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404090:	50                   	push   eax
  404091:	8d 55 ec             	lea    edx,[ebp-0x14]
  404094:	51                   	push   ecx
  404095:	8d 45 e0             	lea    eax,[ebp-0x20]
  404098:	52                   	push   edx
  404099:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40409c:	50                   	push   eax
  40409d:	8d 55 c0             	lea    edx,[ebp-0x40]
  4040a0:	51                   	push   ecx
  4040a1:	52                   	push   edx
  4040a2:	e8 f9 f6 ff ff       	call   0x4037a0
  4040a7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4040aa:	ff d7                	call   edi
  4040ac:	ba 30 29 40 00       	mov    edx,0x402930
  4040b1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4040b4:	c7 45 b4 01 95 46 fd 	mov    DWORD PTR [ebp-0x4c],0xfd469501
  4040bb:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4040be:	ff d6                	call   esi
  4040c0:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4040c3:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4040c6:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4040c9:	50                   	push   eax
  4040ca:	83 c2 1c             	add    edx,0x1c
  4040cd:	51                   	push   ecx
  4040ce:	8d 45 ec             	lea    eax,[ebp-0x14]
  4040d1:	52                   	push   edx
  4040d2:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4040d5:	50                   	push   eax
  4040d6:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4040d9:	51                   	push   ecx
  4040da:	8d 45 e8             	lea    eax,[ebp-0x18]
  4040dd:	52                   	push   edx
  4040de:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4040e1:	50                   	push   eax
  4040e2:	51                   	push   ecx
  4040e3:	e8 b8 f6 ff ff       	call   0x4037a0
  4040e8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4040eb:	ff d7                	call   edi
  4040ed:	c7 45 b4 d8 98 80 69 	mov    DWORD PTR [ebp-0x4c],0x698098d8
  4040f4:	c7 45 b8 07 00 00 00 	mov    DWORD PTR [ebp-0x48],0x7
  4040fb:	ba 30 29 40 00       	mov    edx,0x402930
  404100:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404103:	ff d6                	call   esi
  404105:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404108:	8d 55 b4             	lea    edx,[ebp-0x4c]
  40410b:	8d 45 b8             	lea    eax,[ebp-0x48]
  40410e:	52                   	push   edx
  40410f:	83 c1 20             	add    ecx,0x20
  404112:	50                   	push   eax
  404113:	8d 55 e0             	lea    edx,[ebp-0x20]
  404116:	51                   	push   ecx
  404117:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40411a:	52                   	push   edx
  40411b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40411e:	50                   	push   eax
  40411f:	8d 55 ec             	lea    edx,[ebp-0x14]
  404122:	51                   	push   ecx
  404123:	8d 45 c0             	lea    eax,[ebp-0x40]
  404126:	52                   	push   edx
  404127:	50                   	push   eax
  404128:	e8 73 f6 ff ff       	call   0x4037a0
  40412d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404130:	ff d7                	call   edi
  404132:	ba 30 29 40 00       	mov    edx,0x402930
  404137:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40413a:	c7 45 b4 af f7 44 8b 	mov    DWORD PTR [ebp-0x4c],0x8b44f7af
  404141:	c7 45 b8 0c 00 00 00 	mov    DWORD PTR [ebp-0x48],0xc
  404148:	ff d6                	call   esi
  40414a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40414d:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404150:	8d 55 b8             	lea    edx,[ebp-0x48]
  404153:	51                   	push   ecx
  404154:	83 c0 24             	add    eax,0x24
  404157:	52                   	push   edx
  404158:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40415b:	50                   	push   eax
  40415c:	8d 55 e8             	lea    edx,[ebp-0x18]
  40415f:	51                   	push   ecx
  404160:	8d 45 ec             	lea    eax,[ebp-0x14]
  404163:	52                   	push   edx
  404164:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404167:	50                   	push   eax
  404168:	8d 55 c0             	lea    edx,[ebp-0x40]
  40416b:	51                   	push   ecx
  40416c:	52                   	push   edx
  40416d:	e8 2e f6 ff ff       	call   0x4037a0
  404172:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404175:	ff d7                	call   edi
  404177:	ba 30 29 40 00       	mov    edx,0x402930
  40417c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40417f:	c7 45 b4 b1 5b ff ff 	mov    DWORD PTR [ebp-0x4c],0xffff5bb1
  404186:	c7 45 b8 11 00 00 00 	mov    DWORD PTR [ebp-0x48],0x11
  40418d:	ff d6                	call   esi
  40418f:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404192:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404195:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404198:	50                   	push   eax
  404199:	83 c2 28             	add    edx,0x28
  40419c:	51                   	push   ecx
  40419d:	8d 45 e8             	lea    eax,[ebp-0x18]
  4041a0:	52                   	push   edx
  4041a1:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4041a4:	50                   	push   eax
  4041a5:	8d 55 e0             	lea    edx,[ebp-0x20]
  4041a8:	51                   	push   ecx
  4041a9:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4041ac:	52                   	push   edx
  4041ad:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4041b0:	50                   	push   eax
  4041b1:	51                   	push   ecx
  4041b2:	e8 e9 f5 ff ff       	call   0x4037a0
  4041b7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4041ba:	ff d7                	call   edi
  4041bc:	ba 30 29 40 00       	mov    edx,0x402930
  4041c1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4041c4:	c7 45 b4 be d7 5c 89 	mov    DWORD PTR [ebp-0x4c],0x895cd7be
  4041cb:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4041ce:	ff d6                	call   esi
  4041d0:	8d 55 b4             	lea    edx,[ebp-0x4c]
  4041d3:	8d 45 b8             	lea    eax,[ebp-0x48]
  4041d6:	52                   	push   edx
  4041d7:	50                   	push   eax
  4041d8:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  4041db:	8d 55 ec             	lea    edx,[ebp-0x14]
  4041de:	83 c1 2c             	add    ecx,0x2c
  4041e1:	8d 45 e0             	lea    eax,[ebp-0x20]
  4041e4:	51                   	push   ecx
  4041e5:	52                   	push   edx
  4041e6:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4041e9:	50                   	push   eax
  4041ea:	8d 55 e8             	lea    edx,[ebp-0x18]
  4041ed:	51                   	push   ecx
  4041ee:	8d 45 c0             	lea    eax,[ebp-0x40]
  4041f1:	52                   	push   edx
  4041f2:	50                   	push   eax
  4041f3:	e8 a8 f5 ff ff       	call   0x4037a0
  4041f8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4041fb:	ff d7                	call   edi
  4041fd:	ba 30 29 40 00       	mov    edx,0x402930
  404202:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404205:	c7 45 b4 22 11 90 6b 	mov    DWORD PTR [ebp-0x4c],0x6b901122
  40420c:	c7 45 b8 07 00 00 00 	mov    DWORD PTR [ebp-0x48],0x7
  404213:	ff d6                	call   esi
  404215:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404218:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40421b:	8d 55 b8             	lea    edx,[ebp-0x48]
  40421e:	51                   	push   ecx
  40421f:	83 c0 30             	add    eax,0x30
  404222:	52                   	push   edx
  404223:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404226:	50                   	push   eax
  404227:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40422a:	51                   	push   ecx
  40422b:	8d 45 e8             	lea    eax,[ebp-0x18]
  40422e:	52                   	push   edx
  40422f:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404232:	50                   	push   eax
  404233:	8d 55 c0             	lea    edx,[ebp-0x40]
  404236:	51                   	push   ecx
  404237:	52                   	push   edx
  404238:	e8 63 f5 ff ff       	call   0x4037a0
  40423d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404240:	ff d7                	call   edi
  404242:	ba 30 29 40 00       	mov    edx,0x402930
  404247:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40424a:	c7 45 b4 93 71 98 fd 	mov    DWORD PTR [ebp-0x4c],0xfd987193
  404251:	c7 45 b8 0c 00 00 00 	mov    DWORD PTR [ebp-0x48],0xc
  404258:	ff d6                	call   esi
  40425a:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40425d:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404260:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404263:	50                   	push   eax
  404264:	83 c2 34             	add    edx,0x34
  404267:	51                   	push   ecx
  404268:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40426b:	52                   	push   edx
  40426c:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40426f:	50                   	push   eax
  404270:	8d 55 ec             	lea    edx,[ebp-0x14]
  404273:	51                   	push   ecx
  404274:	8d 45 e0             	lea    eax,[ebp-0x20]
  404277:	52                   	push   edx
  404278:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40427b:	50                   	push   eax
  40427c:	51                   	push   ecx
  40427d:	e8 1e f5 ff ff       	call   0x4037a0
  404282:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404285:	ff d7                	call   edi
  404287:	ba 30 29 40 00       	mov    edx,0x402930
  40428c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40428f:	c7 45 b4 8e 43 79 a6 	mov    DWORD PTR [ebp-0x4c],0xa679438e
  404296:	c7 45 b8 11 00 00 00 	mov    DWORD PTR [ebp-0x48],0x11
  40429d:	ff d6                	call   esi
  40429f:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  4042a2:	8d 55 b4             	lea    edx,[ebp-0x4c]
  4042a5:	8d 45 b8             	lea    eax,[ebp-0x48]
  4042a8:	52                   	push   edx
  4042a9:	83 c1 38             	add    ecx,0x38
  4042ac:	50                   	push   eax
  4042ad:	8d 55 e8             	lea    edx,[ebp-0x18]
  4042b0:	51                   	push   ecx
  4042b1:	52                   	push   edx
  4042b2:	8d 45 ec             	lea    eax,[ebp-0x14]
  4042b5:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4042b8:	50                   	push   eax
  4042b9:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4042bc:	51                   	push   ecx
  4042bd:	8d 45 c0             	lea    eax,[ebp-0x40]
  4042c0:	52                   	push   edx
  4042c1:	50                   	push   eax
  4042c2:	e8 d9 f4 ff ff       	call   0x4037a0
  4042c7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4042ca:	ff d7                	call   edi
  4042cc:	ba 30 29 40 00       	mov    edx,0x402930
  4042d1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4042d4:	c7 45 b4 21 08 b4 49 	mov    DWORD PTR [ebp-0x4c],0x49b40821
  4042db:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4042de:	ff d6                	call   esi
  4042e0:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4042e3:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4042e6:	8d 55 b8             	lea    edx,[ebp-0x48]
  4042e9:	51                   	push   ecx
  4042ea:	83 c0 3c             	add    eax,0x3c
  4042ed:	52                   	push   edx
  4042ee:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4042f1:	50                   	push   eax
  4042f2:	8d 55 e0             	lea    edx,[ebp-0x20]
  4042f5:	51                   	push   ecx
  4042f6:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4042f9:	52                   	push   edx
  4042fa:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4042fd:	50                   	push   eax
  4042fe:	8d 55 c0             	lea    edx,[ebp-0x40]
  404301:	51                   	push   ecx
  404302:	52                   	push   edx
  404303:	e8 98 f4 ff ff       	call   0x4037a0
  404308:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40430b:	ff d7                	call   edi
  40430d:	ba 3c 29 40 00       	mov    edx,0x40293c
  404312:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404315:	c7 45 b4 62 25 1e f6 	mov    DWORD PTR [ebp-0x4c],0xf61e2562
  40431c:	c7 45 b8 05 00 00 00 	mov    DWORD PTR [ebp-0x48],0x5
  404323:	ff d6                	call   esi
  404325:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404328:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40432b:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40432e:	50                   	push   eax
  40432f:	83 c2 04             	add    edx,0x4
  404332:	51                   	push   ecx
  404333:	8d 45 e0             	lea    eax,[ebp-0x20]
  404336:	52                   	push   edx
  404337:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40433a:	50                   	push   eax
  40433b:	8d 55 e8             	lea    edx,[ebp-0x18]
  40433e:	51                   	push   ecx
  40433f:	8d 45 ec             	lea    eax,[ebp-0x14]
  404342:	52                   	push   edx
  404343:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404346:	50                   	push   eax
  404347:	51                   	push   ecx
  404348:	e8 53 f4 ff ff       	call   0x4037a0
  40434d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404350:	ff d7                	call   edi
  404352:	ba 3c 29 40 00       	mov    edx,0x40293c
  404357:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40435a:	c7 45 b4 40 b3 40 c0 	mov    DWORD PTR [ebp-0x4c],0xc040b340
  404361:	c7 45 b8 09 00 00 00 	mov    DWORD PTR [ebp-0x48],0x9
  404368:	ff d6                	call   esi
  40436a:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  40436d:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404370:	8d 45 b8             	lea    eax,[ebp-0x48]
  404373:	52                   	push   edx
  404374:	83 c1 18             	add    ecx,0x18
  404377:	50                   	push   eax
  404378:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40437b:	51                   	push   ecx
  40437c:	8d 45 e8             	lea    eax,[ebp-0x18]
  40437f:	52                   	push   edx
  404380:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404383:	50                   	push   eax
  404384:	8d 55 e0             	lea    edx,[ebp-0x20]
  404387:	51                   	push   ecx
  404388:	52                   	push   edx
  404389:	8d 45 c0             	lea    eax,[ebp-0x40]
  40438c:	50                   	push   eax
  40438d:	e8 0e f4 ff ff       	call   0x4037a0
  404392:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404395:	ff d7                	call   edi
  404397:	ba 3c 29 40 00       	mov    edx,0x40293c
  40439c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40439f:	c7 45 b4 51 5a 5e 26 	mov    DWORD PTR [ebp-0x4c],0x265e5a51
  4043a6:	c7 45 b8 0e 00 00 00 	mov    DWORD PTR [ebp-0x48],0xe
  4043ad:	ff d6                	call   esi
  4043af:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4043b2:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4043b5:	8d 55 b8             	lea    edx,[ebp-0x48]
  4043b8:	51                   	push   ecx
  4043b9:	83 c0 2c             	add    eax,0x2c
  4043bc:	52                   	push   edx
  4043bd:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043c0:	50                   	push   eax
  4043c1:	8d 55 ec             	lea    edx,[ebp-0x14]
  4043c4:	51                   	push   ecx
  4043c5:	8d 45 e0             	lea    eax,[ebp-0x20]
  4043c8:	52                   	push   edx
  4043c9:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4043cc:	50                   	push   eax
  4043cd:	8d 55 c0             	lea    edx,[ebp-0x40]
  4043d0:	51                   	push   ecx
  4043d1:	52                   	push   edx
  4043d2:	e8 c9 f3 ff ff       	call   0x4037a0
  4043d7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4043da:	ff d7                	call   edi
  4043dc:	bb 14 00 00 00       	mov    ebx,0x14
  4043e1:	ba 3c 29 40 00       	mov    edx,0x40293c
  4043e6:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4043e9:	c7 45 b4 aa c7 b6 e9 	mov    DWORD PTR [ebp-0x4c],0xe9b6c7aa
  4043f0:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4043f3:	ff d6                	call   esi
  4043f5:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4043f8:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4043fb:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4043fe:	50                   	push   eax
  4043ff:	51                   	push   ecx
  404400:	8d 45 ec             	lea    eax,[ebp-0x14]
  404403:	52                   	push   edx
  404404:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404407:	50                   	push   eax
  404408:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40440b:	51                   	push   ecx
  40440c:	8d 45 e8             	lea    eax,[ebp-0x18]
  40440f:	52                   	push   edx
  404410:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404413:	50                   	push   eax
  404414:	51                   	push   ecx
  404415:	e8 86 f3 ff ff       	call   0x4037a0
  40441a:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40441d:	ff d7                	call   edi
  40441f:	ba 3c 29 40 00       	mov    edx,0x40293c
  404424:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404427:	c7 45 b4 5d 10 2f d6 	mov    DWORD PTR [ebp-0x4c],0xd62f105d
  40442e:	c7 45 b8 05 00 00 00 	mov    DWORD PTR [ebp-0x48],0x5
  404435:	ff d6                	call   esi
  404437:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  40443a:	8d 55 b4             	lea    edx,[ebp-0x4c]
  40443d:	8d 45 b8             	lea    eax,[ebp-0x48]
  404440:	52                   	push   edx
  404441:	03 cb                	add    ecx,ebx
  404443:	50                   	push   eax
  404444:	8d 55 e0             	lea    edx,[ebp-0x20]
  404447:	51                   	push   ecx
  404448:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40444b:	52                   	push   edx
  40444c:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40444f:	50                   	push   eax
  404450:	8d 55 ec             	lea    edx,[ebp-0x14]
  404453:	51                   	push   ecx
  404454:	8d 45 c0             	lea    eax,[ebp-0x40]
  404457:	52                   	push   edx
  404458:	50                   	push   eax
  404459:	e8 42 f3 ff ff       	call   0x4037a0
  40445e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404461:	ff d7                	call   edi
  404463:	c7 45 b4 53 14 44 02 	mov    DWORD PTR [ebp-0x4c],0x2441453
  40446a:	c7 45 b8 09 00 00 00 	mov    DWORD PTR [ebp-0x48],0x9
  404471:	ba 3c 29 40 00       	mov    edx,0x40293c
  404476:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404479:	ff d6                	call   esi
  40447b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40447e:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404481:	8d 55 b8             	lea    edx,[ebp-0x48]
  404484:	51                   	push   ecx
  404485:	83 c0 28             	add    eax,0x28
  404488:	52                   	push   edx
  404489:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40448c:	50                   	push   eax
  40448d:	8d 55 e8             	lea    edx,[ebp-0x18]
  404490:	51                   	push   ecx
  404491:	8d 45 ec             	lea    eax,[ebp-0x14]
  404494:	52                   	push   edx
  404495:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404498:	50                   	push   eax
  404499:	8d 55 c0             	lea    edx,[ebp-0x40]
  40449c:	51                   	push   ecx
  40449d:	52                   	push   edx
  40449e:	e8 fd f2 ff ff       	call   0x4037a0
  4044a3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4044a6:	ff d7                	call   edi
  4044a8:	ba 3c 29 40 00       	mov    edx,0x40293c
  4044ad:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4044b0:	c7 45 b4 81 e6 a1 d8 	mov    DWORD PTR [ebp-0x4c],0xd8a1e681
  4044b7:	c7 45 b8 0e 00 00 00 	mov    DWORD PTR [ebp-0x48],0xe
  4044be:	ff d6                	call   esi
  4044c0:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4044c3:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4044c6:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4044c9:	50                   	push   eax
  4044ca:	83 c2 3c             	add    edx,0x3c
  4044cd:	51                   	push   ecx
  4044ce:	8d 45 e8             	lea    eax,[ebp-0x18]
  4044d1:	52                   	push   edx
  4044d2:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4044d5:	50                   	push   eax
  4044d6:	8d 55 e0             	lea    edx,[ebp-0x20]
  4044d9:	51                   	push   ecx
  4044da:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4044dd:	52                   	push   edx
  4044de:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4044e1:	50                   	push   eax
  4044e2:	51                   	push   ecx
  4044e3:	e8 b8 f2 ff ff       	call   0x4037a0
  4044e8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4044eb:	ff d7                	call   edi
  4044ed:	ba 3c 29 40 00       	mov    edx,0x40293c
  4044f2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4044f5:	c7 45 b4 c8 fb d3 e7 	mov    DWORD PTR [ebp-0x4c],0xe7d3fbc8
  4044fc:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4044ff:	ff d6                	call   esi
  404501:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404504:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404507:	8d 45 b8             	lea    eax,[ebp-0x48]
  40450a:	52                   	push   edx
  40450b:	83 c1 10             	add    ecx,0x10
  40450e:	50                   	push   eax
  40450f:	8d 55 ec             	lea    edx,[ebp-0x14]
  404512:	51                   	push   ecx
  404513:	8d 45 e0             	lea    eax,[ebp-0x20]
  404516:	52                   	push   edx
  404517:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40451a:	50                   	push   eax
  40451b:	8d 55 e8             	lea    edx,[ebp-0x18]
  40451e:	51                   	push   ecx
  40451f:	8d 45 c0             	lea    eax,[ebp-0x40]
  404522:	52                   	push   edx
  404523:	50                   	push   eax
  404524:	e8 77 f2 ff ff       	call   0x4037a0
  404529:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40452c:	ff d7                	call   edi
  40452e:	ba 3c 29 40 00       	mov    edx,0x40293c
  404533:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404536:	c7 45 b4 e6 cd e1 21 	mov    DWORD PTR [ebp-0x4c],0x21e1cde6
  40453d:	c7 45 b8 05 00 00 00 	mov    DWORD PTR [ebp-0x48],0x5
  404544:	ff d6                	call   esi
  404546:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404549:	8d 55 b8             	lea    edx,[ebp-0x48]
  40454c:	51                   	push   ecx
  40454d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404550:	52                   	push   edx
  404551:	83 c0 24             	add    eax,0x24
  404554:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404557:	50                   	push   eax
  404558:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40455b:	51                   	push   ecx
  40455c:	8d 45 e8             	lea    eax,[ebp-0x18]
  40455f:	52                   	push   edx
  404560:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404563:	50                   	push   eax
  404564:	8d 55 c0             	lea    edx,[ebp-0x40]
  404567:	51                   	push   ecx
  404568:	52                   	push   edx
  404569:	e8 32 f2 ff ff       	call   0x4037a0
  40456e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404571:	ff d7                	call   edi
  404573:	ba 3c 29 40 00       	mov    edx,0x40293c
  404578:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40457b:	c7 45 b4 d6 07 37 c3 	mov    DWORD PTR [ebp-0x4c],0xc33707d6
  404582:	c7 45 b8 09 00 00 00 	mov    DWORD PTR [ebp-0x48],0x9
  404589:	ff d6                	call   esi
  40458b:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40458e:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404591:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404594:	50                   	push   eax
  404595:	83 c2 38             	add    edx,0x38
  404598:	51                   	push   ecx
  404599:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40459c:	52                   	push   edx
  40459d:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4045a0:	50                   	push   eax
  4045a1:	8d 55 ec             	lea    edx,[ebp-0x14]
  4045a4:	51                   	push   ecx
  4045a5:	8d 45 e0             	lea    eax,[ebp-0x20]
  4045a8:	52                   	push   edx
  4045a9:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4045ac:	50                   	push   eax
  4045ad:	51                   	push   ecx
  4045ae:	e8 ed f1 ff ff       	call   0x4037a0
  4045b3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4045b6:	ff d7                	call   edi
  4045b8:	ba 3c 29 40 00       	mov    edx,0x40293c
  4045bd:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4045c0:	c7 45 b4 87 0d d5 f4 	mov    DWORD PTR [ebp-0x4c],0xf4d50d87
  4045c7:	c7 45 b8 0e 00 00 00 	mov    DWORD PTR [ebp-0x48],0xe
  4045ce:	ff d6                	call   esi
  4045d0:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  4045d3:	8d 55 b4             	lea    edx,[ebp-0x4c]
  4045d6:	8d 45 b8             	lea    eax,[ebp-0x48]
  4045d9:	52                   	push   edx
  4045da:	83 c1 0c             	add    ecx,0xc
  4045dd:	50                   	push   eax
  4045de:	8d 55 e8             	lea    edx,[ebp-0x18]
  4045e1:	51                   	push   ecx
  4045e2:	8d 45 ec             	lea    eax,[ebp-0x14]
  4045e5:	52                   	push   edx
  4045e6:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4045e9:	50                   	push   eax
  4045ea:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4045ed:	51                   	push   ecx
  4045ee:	8d 45 c0             	lea    eax,[ebp-0x40]
  4045f1:	52                   	push   edx
  4045f2:	50                   	push   eax
  4045f3:	e8 a8 f1 ff ff       	call   0x4037a0
  4045f8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4045fb:	ff d7                	call   edi
  4045fd:	ba 3c 29 40 00       	mov    edx,0x40293c
  404602:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404605:	c7 45 b4 ed 14 5a 45 	mov    DWORD PTR [ebp-0x4c],0x455a14ed
  40460c:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  40460f:	ff d6                	call   esi
  404611:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404614:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404617:	8d 55 b8             	lea    edx,[ebp-0x48]
  40461a:	51                   	push   ecx
  40461b:	83 c0 20             	add    eax,0x20
  40461e:	52                   	push   edx
  40461f:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404622:	50                   	push   eax
  404623:	51                   	push   ecx
  404624:	8d 55 e0             	lea    edx,[ebp-0x20]
  404627:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40462a:	52                   	push   edx
  40462b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40462e:	50                   	push   eax
  40462f:	8d 55 c0             	lea    edx,[ebp-0x40]
  404632:	51                   	push   ecx
  404633:	52                   	push   edx
  404634:	e8 67 f1 ff ff       	call   0x4037a0
  404639:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40463c:	ff d7                	call   edi
  40463e:	ba 3c 29 40 00       	mov    edx,0x40293c
  404643:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404646:	c7 45 b4 05 e9 e3 a9 	mov    DWORD PTR [ebp-0x4c],0xa9e3e905
  40464d:	c7 45 b8 05 00 00 00 	mov    DWORD PTR [ebp-0x48],0x5
  404654:	ff d6                	call   esi
  404656:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404659:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40465c:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40465f:	50                   	push   eax
  404660:	83 c2 34             	add    edx,0x34
  404663:	51                   	push   ecx
  404664:	8d 45 e0             	lea    eax,[ebp-0x20]
  404667:	52                   	push   edx
  404668:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40466b:	50                   	push   eax
  40466c:	8d 55 e8             	lea    edx,[ebp-0x18]
  40466f:	51                   	push   ecx
  404670:	8d 45 ec             	lea    eax,[ebp-0x14]
  404673:	52                   	push   edx
  404674:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404677:	50                   	push   eax
  404678:	51                   	push   ecx
  404679:	e8 22 f1 ff ff       	call   0x4037a0
  40467e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404681:	ff d7                	call   edi
  404683:	ba 3c 29 40 00       	mov    edx,0x40293c
  404688:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40468b:	c7 45 b4 f8 a3 ef fc 	mov    DWORD PTR [ebp-0x4c],0xfcefa3f8
  404692:	c7 45 b8 09 00 00 00 	mov    DWORD PTR [ebp-0x48],0x9
  404699:	ff d6                	call   esi
  40469b:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  40469e:	8d 55 b4             	lea    edx,[ebp-0x4c]
  4046a1:	8d 45 b8             	lea    eax,[ebp-0x48]
  4046a4:	52                   	push   edx
  4046a5:	83 c1 08             	add    ecx,0x8
  4046a8:	50                   	push   eax
  4046a9:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4046ac:	51                   	push   ecx
  4046ad:	8d 45 e8             	lea    eax,[ebp-0x18]
  4046b0:	52                   	push   edx
  4046b1:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4046b4:	50                   	push   eax
  4046b5:	8d 55 e0             	lea    edx,[ebp-0x20]
  4046b8:	51                   	push   ecx
  4046b9:	8d 45 c0             	lea    eax,[ebp-0x40]
  4046bc:	52                   	push   edx
  4046bd:	50                   	push   eax
  4046be:	e8 dd f0 ff ff       	call   0x4037a0
  4046c3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4046c6:	ff d7                	call   edi
  4046c8:	ba 3c 29 40 00       	mov    edx,0x40293c
  4046cd:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4046d0:	c7 45 b4 d9 02 6f 67 	mov    DWORD PTR [ebp-0x4c],0x676f02d9
  4046d7:	c7 45 b8 0e 00 00 00 	mov    DWORD PTR [ebp-0x48],0xe
  4046de:	ff d6                	call   esi
  4046e0:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4046e3:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4046e6:	8d 55 b8             	lea    edx,[ebp-0x48]
  4046e9:	51                   	push   ecx
  4046ea:	83 c0 1c             	add    eax,0x1c
  4046ed:	52                   	push   edx
  4046ee:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4046f1:	50                   	push   eax
  4046f2:	8d 55 ec             	lea    edx,[ebp-0x14]
  4046f5:	51                   	push   ecx
  4046f6:	8d 45 e0             	lea    eax,[ebp-0x20]
  4046f9:	52                   	push   edx
  4046fa:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4046fd:	50                   	push   eax
  4046fe:	51                   	push   ecx
  4046ff:	8d 55 c0             	lea    edx,[ebp-0x40]
  404702:	52                   	push   edx
  404703:	e8 98 f0 ff ff       	call   0x4037a0
  404708:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40470b:	ff d7                	call   edi
  40470d:	ba 3c 29 40 00       	mov    edx,0x40293c
  404712:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404715:	c7 45 b4 8a 4c 2a 8d 	mov    DWORD PTR [ebp-0x4c],0x8d2a4c8a
  40471c:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  40471f:	ff d6                	call   esi
  404721:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404724:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404727:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40472a:	50                   	push   eax
  40472b:	83 c2 30             	add    edx,0x30
  40472e:	51                   	push   ecx
  40472f:	8d 45 ec             	lea    eax,[ebp-0x14]
  404732:	52                   	push   edx
  404733:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404736:	50                   	push   eax
  404737:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40473a:	51                   	push   ecx
  40473b:	8d 45 e8             	lea    eax,[ebp-0x18]
  40473e:	52                   	push   edx
  40473f:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404742:	50                   	push   eax
  404743:	51                   	push   ecx
  404744:	e8 57 f0 ff ff       	call   0x4037a0
  404749:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40474c:	ff d7                	call   edi
  40474e:	ba 48 29 40 00       	mov    edx,0x402948
  404753:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404756:	c7 45 b4 42 39 fa ff 	mov    DWORD PTR [ebp-0x4c],0xfffa3942
  40475d:	c7 45 b8 04 00 00 00 	mov    DWORD PTR [ebp-0x48],0x4
  404764:	ff d6                	call   esi
  404766:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404769:	8d 55 b4             	lea    edx,[ebp-0x4c]
  40476c:	8d 45 b8             	lea    eax,[ebp-0x48]
  40476f:	52                   	push   edx
  404770:	03 cb                	add    ecx,ebx
  404772:	50                   	push   eax
  404773:	8d 55 e0             	lea    edx,[ebp-0x20]
  404776:	51                   	push   ecx
  404777:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40477a:	52                   	push   edx
  40477b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40477e:	50                   	push   eax
  40477f:	8d 55 ec             	lea    edx,[ebp-0x14]
  404782:	51                   	push   ecx
  404783:	8d 45 c0             	lea    eax,[ebp-0x40]
  404786:	52                   	push   edx
  404787:	50                   	push   eax
  404788:	e8 13 f0 ff ff       	call   0x4037a0
  40478d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404790:	ff d7                	call   edi
  404792:	ba 48 29 40 00       	mov    edx,0x402948
  404797:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40479a:	c7 45 b4 81 f6 71 87 	mov    DWORD PTR [ebp-0x4c],0x8771f681
  4047a1:	c7 45 b8 0b 00 00 00 	mov    DWORD PTR [ebp-0x48],0xb
  4047a8:	ff d6                	call   esi
  4047aa:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4047ad:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4047b0:	8d 55 b8             	lea    edx,[ebp-0x48]
  4047b3:	51                   	push   ecx
  4047b4:	83 c0 20             	add    eax,0x20
  4047b7:	52                   	push   edx
  4047b8:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4047bb:	50                   	push   eax
  4047bc:	8d 55 e8             	lea    edx,[ebp-0x18]
  4047bf:	51                   	push   ecx
  4047c0:	8d 45 ec             	lea    eax,[ebp-0x14]
  4047c3:	52                   	push   edx
  4047c4:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4047c7:	50                   	push   eax
  4047c8:	8d 55 c0             	lea    edx,[ebp-0x40]
  4047cb:	51                   	push   ecx
  4047cc:	52                   	push   edx
  4047cd:	e8 ce ef ff ff       	call   0x4037a0
  4047d2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4047d5:	ff d7                	call   edi
  4047d7:	c7 45 b4 22 61 9d 6d 	mov    DWORD PTR [ebp-0x4c],0x6d9d6122
  4047de:	ba 48 29 40 00       	mov    edx,0x402948
  4047e3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4047e6:	c7 45 b8 10 00 00 00 	mov    DWORD PTR [ebp-0x48],0x10
  4047ed:	ff d6                	call   esi
  4047ef:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4047f2:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4047f5:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4047f8:	50                   	push   eax
  4047f9:	83 c2 2c             	add    edx,0x2c
  4047fc:	51                   	push   ecx
  4047fd:	8d 45 e8             	lea    eax,[ebp-0x18]
  404800:	52                   	push   edx
  404801:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404804:	50                   	push   eax
  404805:	8d 55 e0             	lea    edx,[ebp-0x20]
  404808:	51                   	push   ecx
  404809:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40480c:	52                   	push   edx
  40480d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404810:	50                   	push   eax
  404811:	51                   	push   ecx
  404812:	e8 89 ef ff ff       	call   0x4037a0
  404817:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40481a:	ff d7                	call   edi
  40481c:	bb 17 00 00 00       	mov    ebx,0x17
  404821:	ba 48 29 40 00       	mov    edx,0x402948
  404826:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404829:	c7 45 b4 0c 38 e5 fd 	mov    DWORD PTR [ebp-0x4c],0xfde5380c
  404830:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404833:	ff d6                	call   esi
  404835:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404838:	8d 55 b4             	lea    edx,[ebp-0x4c]
  40483b:	8d 45 b8             	lea    eax,[ebp-0x48]
  40483e:	52                   	push   edx
  40483f:	83 c1 38             	add    ecx,0x38
  404842:	50                   	push   eax
  404843:	8d 55 ec             	lea    edx,[ebp-0x14]
  404846:	51                   	push   ecx
  404847:	8d 45 e0             	lea    eax,[ebp-0x20]
  40484a:	52                   	push   edx
  40484b:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40484e:	50                   	push   eax
  40484f:	8d 55 e8             	lea    edx,[ebp-0x18]
  404852:	51                   	push   ecx
  404853:	8d 45 c0             	lea    eax,[ebp-0x40]
  404856:	52                   	push   edx
  404857:	50                   	push   eax
  404858:	e8 43 ef ff ff       	call   0x4037a0
  40485d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404860:	ff d7                	call   edi
  404862:	ba 48 29 40 00       	mov    edx,0x402948
  404867:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40486a:	c7 45 b4 44 ea be a4 	mov    DWORD PTR [ebp-0x4c],0xa4beea44
  404871:	c7 45 b8 04 00 00 00 	mov    DWORD PTR [ebp-0x48],0x4
  404878:	ff d6                	call   esi
  40487a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40487d:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404880:	8d 55 b8             	lea    edx,[ebp-0x48]
  404883:	51                   	push   ecx
  404884:	83 c0 04             	add    eax,0x4
  404887:	52                   	push   edx
  404888:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40488b:	50                   	push   eax
  40488c:	8d 55 e4             	lea    edx,[ebp-0x1c]
  40488f:	51                   	push   ecx
  404890:	8d 45 e8             	lea    eax,[ebp-0x18]
  404893:	52                   	push   edx
  404894:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404897:	50                   	push   eax
  404898:	8d 55 c0             	lea    edx,[ebp-0x40]
  40489b:	51                   	push   ecx
  40489c:	52                   	push   edx
  40489d:	e8 fe ee ff ff       	call   0x4037a0
  4048a2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4048a5:	ff d7                	call   edi
  4048a7:	ba 48 29 40 00       	mov    edx,0x402948
  4048ac:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4048af:	c7 45 b4 a9 cf de 4b 	mov    DWORD PTR [ebp-0x4c],0x4bdecfa9
  4048b6:	c7 45 b8 0b 00 00 00 	mov    DWORD PTR [ebp-0x48],0xb
  4048bd:	ff d6                	call   esi
  4048bf:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4048c2:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4048c5:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4048c8:	50                   	push   eax
  4048c9:	83 c2 10             	add    edx,0x10
  4048cc:	51                   	push   ecx
  4048cd:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4048d0:	52                   	push   edx
  4048d1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4048d4:	50                   	push   eax
  4048d5:	8d 55 ec             	lea    edx,[ebp-0x14]
  4048d8:	51                   	push   ecx
  4048d9:	8d 45 e0             	lea    eax,[ebp-0x20]
  4048dc:	52                   	push   edx
  4048dd:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4048e0:	50                   	push   eax
  4048e1:	51                   	push   ecx
  4048e2:	e8 b9 ee ff ff       	call   0x4037a0
  4048e7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4048ea:	ff d7                	call   edi
  4048ec:	ba 48 29 40 00       	mov    edx,0x402948
  4048f1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4048f4:	c7 45 b4 60 4b bb f6 	mov    DWORD PTR [ebp-0x4c],0xf6bb4b60
  4048fb:	c7 45 b8 10 00 00 00 	mov    DWORD PTR [ebp-0x48],0x10
  404902:	ff d6                	call   esi
  404904:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404907:	8d 55 b4             	lea    edx,[ebp-0x4c]
  40490a:	8d 45 b8             	lea    eax,[ebp-0x48]
  40490d:	52                   	push   edx
  40490e:	83 c1 1c             	add    ecx,0x1c
  404911:	50                   	push   eax
  404912:	8d 55 e8             	lea    edx,[ebp-0x18]
  404915:	51                   	push   ecx
  404916:	8d 45 ec             	lea    eax,[ebp-0x14]
  404919:	52                   	push   edx
  40491a:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40491d:	50                   	push   eax
  40491e:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404921:	51                   	push   ecx
  404922:	8d 45 c0             	lea    eax,[ebp-0x40]
  404925:	52                   	push   edx
  404926:	50                   	push   eax
  404927:	e8 74 ee ff ff       	call   0x4037a0
  40492c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40492f:	ff d7                	call   edi
  404931:	ba 48 29 40 00       	mov    edx,0x402948
  404936:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404939:	c7 45 b4 70 bc bf be 	mov    DWORD PTR [ebp-0x4c],0xbebfbc70
  404940:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404943:	ff d6                	call   esi
  404945:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404948:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40494b:	8d 55 b8             	lea    edx,[ebp-0x48]
  40494e:	51                   	push   ecx
  40494f:	83 c0 28             	add    eax,0x28
  404952:	52                   	push   edx
  404953:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404956:	50                   	push   eax
  404957:	8d 55 e0             	lea    edx,[ebp-0x20]
  40495a:	51                   	push   ecx
  40495b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40495e:	52                   	push   edx
  40495f:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404962:	50                   	push   eax
  404963:	8d 55 c0             	lea    edx,[ebp-0x40]
  404966:	51                   	push   ecx
  404967:	52                   	push   edx
  404968:	e8 33 ee ff ff       	call   0x4037a0
  40496d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404970:	ff d7                	call   edi
  404972:	ba 48 29 40 00       	mov    edx,0x402948
  404977:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40497a:	c7 45 b4 c6 7e 9b 28 	mov    DWORD PTR [ebp-0x4c],0x289b7ec6
  404981:	c7 45 b8 04 00 00 00 	mov    DWORD PTR [ebp-0x48],0x4
  404988:	ff d6                	call   esi
  40498a:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40498d:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404990:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404993:	50                   	push   eax
  404994:	83 c2 34             	add    edx,0x34
  404997:	51                   	push   ecx
  404998:	52                   	push   edx
  404999:	8d 45 e0             	lea    eax,[ebp-0x20]
  40499c:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40499f:	50                   	push   eax
  4049a0:	8d 55 e8             	lea    edx,[ebp-0x18]
  4049a3:	51                   	push   ecx
  4049a4:	8d 45 ec             	lea    eax,[ebp-0x14]
  4049a7:	52                   	push   edx
  4049a8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4049ab:	50                   	push   eax
  4049ac:	51                   	push   ecx
  4049ad:	e8 ee ed ff ff       	call   0x4037a0
  4049b2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4049b5:	ff d7                	call   edi
  4049b7:	ba 48 29 40 00       	mov    edx,0x402948
  4049bc:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4049bf:	c7 45 b4 fa 27 a1 ea 	mov    DWORD PTR [ebp-0x4c],0xeaa127fa
  4049c6:	c7 45 b8 0b 00 00 00 	mov    DWORD PTR [ebp-0x48],0xb
  4049cd:	ff d6                	call   esi
  4049cf:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  4049d2:	8d 55 b4             	lea    edx,[ebp-0x4c]
  4049d5:	8d 45 b8             	lea    eax,[ebp-0x48]
  4049d8:	52                   	push   edx
  4049d9:	50                   	push   eax
  4049da:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4049dd:	51                   	push   ecx
  4049de:	8d 45 e8             	lea    eax,[ebp-0x18]
  4049e1:	52                   	push   edx
  4049e2:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4049e5:	50                   	push   eax
  4049e6:	8d 55 e0             	lea    edx,[ebp-0x20]
  4049e9:	51                   	push   ecx
  4049ea:	8d 45 c0             	lea    eax,[ebp-0x40]
  4049ed:	52                   	push   edx
  4049ee:	50                   	push   eax
  4049ef:	e8 ac ed ff ff       	call   0x4037a0
  4049f4:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4049f7:	ff d7                	call   edi
  4049f9:	ba 48 29 40 00       	mov    edx,0x402948
  4049fe:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a01:	c7 45 b4 85 30 ef d4 	mov    DWORD PTR [ebp-0x4c],0xd4ef3085
  404a08:	c7 45 b8 10 00 00 00 	mov    DWORD PTR [ebp-0x48],0x10
  404a0f:	ff d6                	call   esi
  404a11:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404a14:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404a17:	8d 55 b8             	lea    edx,[ebp-0x48]
  404a1a:	51                   	push   ecx
  404a1b:	83 c0 0c             	add    eax,0xc
  404a1e:	52                   	push   edx
  404a1f:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404a22:	50                   	push   eax
  404a23:	8d 55 ec             	lea    edx,[ebp-0x14]
  404a26:	51                   	push   ecx
  404a27:	8d 45 e0             	lea    eax,[ebp-0x20]
  404a2a:	52                   	push   edx
  404a2b:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404a2e:	50                   	push   eax
  404a2f:	8d 55 c0             	lea    edx,[ebp-0x40]
  404a32:	51                   	push   ecx
  404a33:	52                   	push   edx
  404a34:	e8 67 ed ff ff       	call   0x4037a0
  404a39:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a3c:	ff d7                	call   edi
  404a3e:	ba 48 29 40 00       	mov    edx,0x402948
  404a43:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a46:	c7 45 b4 05 1d 88 04 	mov    DWORD PTR [ebp-0x4c],0x4881d05
  404a4d:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404a50:	ff d6                	call   esi
  404a52:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404a55:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404a58:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404a5b:	50                   	push   eax
  404a5c:	83 c2 18             	add    edx,0x18
  404a5f:	51                   	push   ecx
  404a60:	8d 45 ec             	lea    eax,[ebp-0x14]
  404a63:	52                   	push   edx
  404a64:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404a67:	50                   	push   eax
  404a68:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404a6b:	51                   	push   ecx
  404a6c:	52                   	push   edx
  404a6d:	8d 45 e8             	lea    eax,[ebp-0x18]
  404a70:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a73:	50                   	push   eax
  404a74:	51                   	push   ecx
  404a75:	e8 26 ed ff ff       	call   0x4037a0
  404a7a:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a7d:	ff d7                	call   edi
  404a7f:	ba 48 29 40 00       	mov    edx,0x402948
  404a84:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404a87:	c7 45 b4 39 d0 d4 d9 	mov    DWORD PTR [ebp-0x4c],0xd9d4d039
  404a8e:	c7 45 b8 04 00 00 00 	mov    DWORD PTR [ebp-0x48],0x4
  404a95:	ff d6                	call   esi
  404a97:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404a9a:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404a9d:	8d 45 b8             	lea    eax,[ebp-0x48]
  404aa0:	52                   	push   edx
  404aa1:	83 c1 24             	add    ecx,0x24
  404aa4:	50                   	push   eax
  404aa5:	8d 55 e0             	lea    edx,[ebp-0x20]
  404aa8:	51                   	push   ecx
  404aa9:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404aac:	52                   	push   edx
  404aad:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404ab0:	50                   	push   eax
  404ab1:	8d 55 ec             	lea    edx,[ebp-0x14]
  404ab4:	51                   	push   ecx
  404ab5:	8d 45 c0             	lea    eax,[ebp-0x40]
  404ab8:	52                   	push   edx
  404ab9:	50                   	push   eax
  404aba:	e8 e1 ec ff ff       	call   0x4037a0
  404abf:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404ac2:	ff d7                	call   edi
  404ac4:	ba 48 29 40 00       	mov    edx,0x402948
  404ac9:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404acc:	c7 45 b4 e5 99 db e6 	mov    DWORD PTR [ebp-0x4c],0xe6db99e5
  404ad3:	c7 45 b8 0b 00 00 00 	mov    DWORD PTR [ebp-0x48],0xb
  404ada:	ff d6                	call   esi
  404adc:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404adf:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404ae2:	8d 55 b8             	lea    edx,[ebp-0x48]
  404ae5:	51                   	push   ecx
  404ae6:	83 c0 30             	add    eax,0x30
  404ae9:	52                   	push   edx
  404aea:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404aed:	50                   	push   eax
  404aee:	8d 55 e8             	lea    edx,[ebp-0x18]
  404af1:	51                   	push   ecx
  404af2:	8d 45 ec             	lea    eax,[ebp-0x14]
  404af5:	52                   	push   edx
  404af6:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404af9:	50                   	push   eax
  404afa:	8d 55 c0             	lea    edx,[ebp-0x40]
  404afd:	51                   	push   ecx
  404afe:	52                   	push   edx
  404aff:	e8 9c ec ff ff       	call   0x4037a0
  404b04:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b07:	ff d7                	call   edi
  404b09:	ba 48 29 40 00       	mov    edx,0x402948
  404b0e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b11:	c7 45 b4 f8 7c a2 1f 	mov    DWORD PTR [ebp-0x4c],0x1fa27cf8
  404b18:	c7 45 b8 10 00 00 00 	mov    DWORD PTR [ebp-0x48],0x10
  404b1f:	ff d6                	call   esi
  404b21:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404b24:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404b27:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404b2a:	50                   	push   eax
  404b2b:	83 c2 3c             	add    edx,0x3c
  404b2e:	51                   	push   ecx
  404b2f:	8d 45 e8             	lea    eax,[ebp-0x18]
  404b32:	52                   	push   edx
  404b33:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404b36:	50                   	push   eax
  404b37:	8d 55 e0             	lea    edx,[ebp-0x20]
  404b3a:	51                   	push   ecx
  404b3b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404b3e:	52                   	push   edx
  404b3f:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b42:	50                   	push   eax
  404b43:	51                   	push   ecx
  404b44:	e8 57 ec ff ff       	call   0x4037a0
  404b49:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b4c:	ff d7                	call   edi
  404b4e:	ba 48 29 40 00       	mov    edx,0x402948
  404b53:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b56:	c7 45 b4 65 56 ac c4 	mov    DWORD PTR [ebp-0x4c],0xc4ac5665
  404b5d:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404b60:	ff d6                	call   esi
  404b62:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404b65:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404b68:	8d 45 b8             	lea    eax,[ebp-0x48]
  404b6b:	52                   	push   edx
  404b6c:	83 c1 08             	add    ecx,0x8
  404b6f:	50                   	push   eax
  404b70:	8d 55 ec             	lea    edx,[ebp-0x14]
  404b73:	51                   	push   ecx
  404b74:	8d 45 e0             	lea    eax,[ebp-0x20]
  404b77:	52                   	push   edx
  404b78:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404b7b:	50                   	push   eax
  404b7c:	8d 55 e8             	lea    edx,[ebp-0x18]
  404b7f:	51                   	push   ecx
  404b80:	8d 45 c0             	lea    eax,[ebp-0x40]
  404b83:	52                   	push   edx
  404b84:	50                   	push   eax
  404b85:	e8 16 ec ff ff       	call   0x4037a0
  404b8a:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b8d:	ff d7                	call   edi
  404b8f:	ba 54 29 40 00       	mov    edx,0x402954
  404b94:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404b97:	c7 45 b4 44 22 29 f4 	mov    DWORD PTR [ebp-0x4c],0xf4292244
  404b9e:	c7 45 b8 06 00 00 00 	mov    DWORD PTR [ebp-0x48],0x6
  404ba5:	ff d6                	call   esi
  404ba7:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404baa:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404bad:	8d 55 b8             	lea    edx,[ebp-0x48]
  404bb0:	51                   	push   ecx
  404bb1:	52                   	push   edx
  404bb2:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404bb5:	50                   	push   eax
  404bb6:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404bb9:	51                   	push   ecx
  404bba:	8d 45 e8             	lea    eax,[ebp-0x18]
  404bbd:	52                   	push   edx
  404bbe:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404bc1:	50                   	push   eax
  404bc2:	8d 55 c0             	lea    edx,[ebp-0x40]
  404bc5:	51                   	push   ecx
  404bc6:	52                   	push   edx
  404bc7:	e8 d4 eb ff ff       	call   0x4037a0
  404bcc:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404bcf:	ff d7                	call   edi
  404bd1:	ba 54 29 40 00       	mov    edx,0x402954
  404bd6:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404bd9:	c7 45 b4 97 ff 2a 43 	mov    DWORD PTR [ebp-0x4c],0x432aff97
  404be0:	c7 45 b8 0a 00 00 00 	mov    DWORD PTR [ebp-0x48],0xa
  404be7:	ff d6                	call   esi
  404be9:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404bec:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404bef:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404bf2:	50                   	push   eax
  404bf3:	83 c2 1c             	add    edx,0x1c
  404bf6:	51                   	push   ecx
  404bf7:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404bfa:	52                   	push   edx
  404bfb:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404bfe:	50                   	push   eax
  404bff:	8d 55 ec             	lea    edx,[ebp-0x14]
  404c02:	51                   	push   ecx
  404c03:	8d 45 e0             	lea    eax,[ebp-0x20]
  404c06:	52                   	push   edx
  404c07:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c0a:	50                   	push   eax
  404c0b:	51                   	push   ecx
  404c0c:	e8 8f eb ff ff       	call   0x4037a0
  404c11:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c14:	ff d7                	call   edi
  404c16:	ba 54 29 40 00       	mov    edx,0x402954
  404c1b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c1e:	c7 45 b4 a7 23 94 ab 	mov    DWORD PTR [ebp-0x4c],0xab9423a7
  404c25:	c7 45 b8 0f 00 00 00 	mov    DWORD PTR [ebp-0x48],0xf
  404c2c:	ff d6                	call   esi
  404c2e:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404c31:	52                   	push   edx
  404c32:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404c35:	8d 45 b8             	lea    eax,[ebp-0x48]
  404c38:	83 c1 38             	add    ecx,0x38
  404c3b:	50                   	push   eax
  404c3c:	8d 55 e8             	lea    edx,[ebp-0x18]
  404c3f:	51                   	push   ecx
  404c40:	8d 45 ec             	lea    eax,[ebp-0x14]
  404c43:	52                   	push   edx
  404c44:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404c47:	50                   	push   eax
  404c48:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404c4b:	51                   	push   ecx
  404c4c:	8d 45 c0             	lea    eax,[ebp-0x40]
  404c4f:	52                   	push   edx
  404c50:	50                   	push   eax
  404c51:	e8 4a eb ff ff       	call   0x4037a0
  404c56:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c59:	ff d7                	call   edi
  404c5b:	bb 15 00 00 00       	mov    ebx,0x15
  404c60:	ba 54 29 40 00       	mov    edx,0x402954
  404c65:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c68:	c7 45 b4 39 a0 93 fc 	mov    DWORD PTR [ebp-0x4c],0xfc93a039
  404c6f:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404c72:	ff d6                	call   esi
  404c74:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404c77:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404c7a:	8d 55 b8             	lea    edx,[ebp-0x48]
  404c7d:	51                   	push   ecx
  404c7e:	83 c0 14             	add    eax,0x14
  404c81:	52                   	push   edx
  404c82:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404c85:	50                   	push   eax
  404c86:	8d 55 e0             	lea    edx,[ebp-0x20]
  404c89:	51                   	push   ecx
  404c8a:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404c8d:	52                   	push   edx
  404c8e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404c91:	50                   	push   eax
  404c92:	8d 55 c0             	lea    edx,[ebp-0x40]
  404c95:	51                   	push   ecx
  404c96:	52                   	push   edx
  404c97:	e8 04 eb ff ff       	call   0x4037a0
  404c9c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404c9f:	ff d7                	call   edi
  404ca1:	ba 54 29 40 00       	mov    edx,0x402954
  404ca6:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404ca9:	c7 45 b4 c3 59 5b 65 	mov    DWORD PTR [ebp-0x4c],0x655b59c3
  404cb0:	c7 45 b8 06 00 00 00 	mov    DWORD PTR [ebp-0x48],0x6
  404cb7:	ff d6                	call   esi
  404cb9:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404cbc:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404cbf:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404cc2:	50                   	push   eax
  404cc3:	83 c2 30             	add    edx,0x30
  404cc6:	51                   	push   ecx
  404cc7:	8d 45 e0             	lea    eax,[ebp-0x20]
  404cca:	52                   	push   edx
  404ccb:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404cce:	50                   	push   eax
  404ccf:	8d 55 e8             	lea    edx,[ebp-0x18]
  404cd2:	51                   	push   ecx
  404cd3:	8d 45 ec             	lea    eax,[ebp-0x14]
  404cd6:	52                   	push   edx
  404cd7:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404cda:	50                   	push   eax
  404cdb:	51                   	push   ecx
  404cdc:	e8 bf ea ff ff       	call   0x4037a0
  404ce1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404ce4:	ff d7                	call   edi
  404ce6:	ba 54 29 40 00       	mov    edx,0x402954
  404ceb:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404cee:	c7 45 b4 92 cc 0c 8f 	mov    DWORD PTR [ebp-0x4c],0x8f0ccc92
  404cf5:	c7 45 b8 0a 00 00 00 	mov    DWORD PTR [ebp-0x48],0xa
  404cfc:	ff d6                	call   esi
  404cfe:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404d01:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404d04:	8d 45 b8             	lea    eax,[ebp-0x48]
  404d07:	52                   	push   edx
  404d08:	83 c1 0c             	add    ecx,0xc
  404d0b:	50                   	push   eax
  404d0c:	51                   	push   ecx
  404d0d:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404d10:	8d 45 e8             	lea    eax,[ebp-0x18]
  404d13:	52                   	push   edx
  404d14:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404d17:	50                   	push   eax
  404d18:	8d 55 e0             	lea    edx,[ebp-0x20]
  404d1b:	51                   	push   ecx
  404d1c:	8d 45 c0             	lea    eax,[ebp-0x40]
  404d1f:	52                   	push   edx
  404d20:	50                   	push   eax
  404d21:	e8 7a ea ff ff       	call   0x4037a0
  404d26:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404d29:	ff d7                	call   edi
  404d2b:	ba 54 29 40 00       	mov    edx,0x402954
  404d30:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404d33:	c7 45 b4 7d f4 ef ff 	mov    DWORD PTR [ebp-0x4c],0xffeff47d
  404d3a:	c7 45 b8 0f 00 00 00 	mov    DWORD PTR [ebp-0x48],0xf
  404d41:	ff d6                	call   esi
  404d43:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404d46:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404d49:	8d 55 b8             	lea    edx,[ebp-0x48]
  404d4c:	51                   	push   ecx
  404d4d:	83 c0 28             	add    eax,0x28
  404d50:	52                   	push   edx
  404d51:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404d54:	50                   	push   eax
  404d55:	8d 55 ec             	lea    edx,[ebp-0x14]
  404d58:	51                   	push   ecx
  404d59:	8d 45 e0             	lea    eax,[ebp-0x20]
  404d5c:	52                   	push   edx
  404d5d:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404d60:	50                   	push   eax
  404d61:	8d 55 c0             	lea    edx,[ebp-0x40]
  404d64:	51                   	push   ecx
  404d65:	52                   	push   edx
  404d66:	e8 35 ea ff ff       	call   0x4037a0
  404d6b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404d6e:	ff d7                	call   edi
  404d70:	ba 54 29 40 00       	mov    edx,0x402954
  404d75:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404d78:	c7 45 b4 d1 5d 84 85 	mov    DWORD PTR [ebp-0x4c],0x85845dd1
  404d7f:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404d82:	ff d6                	call   esi
  404d84:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404d87:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404d8a:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404d8d:	50                   	push   eax
  404d8e:	83 c2 04             	add    edx,0x4
  404d91:	51                   	push   ecx
  404d92:	8d 45 ec             	lea    eax,[ebp-0x14]
  404d95:	52                   	push   edx
  404d96:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404d99:	50                   	push   eax
  404d9a:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404d9d:	51                   	push   ecx
  404d9e:	8d 45 e8             	lea    eax,[ebp-0x18]
  404da1:	52                   	push   edx
  404da2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404da5:	50                   	push   eax
  404da6:	51                   	push   ecx
  404da7:	e8 f4 e9 ff ff       	call   0x4037a0
  404dac:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404daf:	ff d7                	call   edi
  404db1:	ba 54 29 40 00       	mov    edx,0x402954
  404db6:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404db9:	c7 45 b4 4f 7e a8 6f 	mov    DWORD PTR [ebp-0x4c],0x6fa87e4f
  404dc0:	c7 45 b8 06 00 00 00 	mov    DWORD PTR [ebp-0x48],0x6
  404dc7:	ff d6                	call   esi
  404dc9:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404dcc:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404dcf:	8d 45 b8             	lea    eax,[ebp-0x48]
  404dd2:	52                   	push   edx
  404dd3:	83 c1 20             	add    ecx,0x20
  404dd6:	50                   	push   eax
  404dd7:	8d 55 e0             	lea    edx,[ebp-0x20]
  404dda:	51                   	push   ecx
  404ddb:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404dde:	52                   	push   edx
  404ddf:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404de2:	50                   	push   eax
  404de3:	51                   	push   ecx
  404de4:	8d 55 ec             	lea    edx,[ebp-0x14]
  404de7:	8d 45 c0             	lea    eax,[ebp-0x40]
  404dea:	52                   	push   edx
  404deb:	50                   	push   eax
  404dec:	e8 af e9 ff ff       	call   0x4037a0
  404df1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404df4:	ff d7                	call   edi
  404df6:	ba 54 29 40 00       	mov    edx,0x402954
  404dfb:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404dfe:	c7 45 b4 e0 e6 2c fe 	mov    DWORD PTR [ebp-0x4c],0xfe2ce6e0
  404e05:	c7 45 b8 0a 00 00 00 	mov    DWORD PTR [ebp-0x48],0xa
  404e0c:	ff d6                	call   esi
  404e0e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404e11:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404e14:	8d 55 b8             	lea    edx,[ebp-0x48]
  404e17:	51                   	push   ecx
  404e18:	83 c0 3c             	add    eax,0x3c
  404e1b:	52                   	push   edx
  404e1c:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404e1f:	50                   	push   eax
  404e20:	8d 55 e8             	lea    edx,[ebp-0x18]
  404e23:	51                   	push   ecx
  404e24:	8d 45 ec             	lea    eax,[ebp-0x14]
  404e27:	52                   	push   edx
  404e28:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404e2b:	50                   	push   eax
  404e2c:	8d 55 c0             	lea    edx,[ebp-0x40]
  404e2f:	51                   	push   ecx
  404e30:	52                   	push   edx
  404e31:	e8 6a e9 ff ff       	call   0x4037a0
  404e36:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404e39:	ff d7                	call   edi
  404e3b:	ba 54 29 40 00       	mov    edx,0x402954
  404e40:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404e43:	c7 45 b4 14 43 01 a3 	mov    DWORD PTR [ebp-0x4c],0xa3014314
  404e4a:	c7 45 b8 0f 00 00 00 	mov    DWORD PTR [ebp-0x48],0xf
  404e51:	ff d6                	call   esi
  404e53:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404e56:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404e59:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404e5c:	50                   	push   eax
  404e5d:	83 c2 18             	add    edx,0x18
  404e60:	51                   	push   ecx
  404e61:	8d 45 e8             	lea    eax,[ebp-0x18]
  404e64:	52                   	push   edx
  404e65:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404e68:	50                   	push   eax
  404e69:	8d 55 e0             	lea    edx,[ebp-0x20]
  404e6c:	51                   	push   ecx
  404e6d:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404e70:	52                   	push   edx
  404e71:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404e74:	50                   	push   eax
  404e75:	51                   	push   ecx
  404e76:	e8 25 e9 ff ff       	call   0x4037a0
  404e7b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404e7e:	ff d7                	call   edi
  404e80:	ba 54 29 40 00       	mov    edx,0x402954
  404e85:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404e88:	c7 45 b4 a1 11 08 4e 	mov    DWORD PTR [ebp-0x4c],0x4e0811a1
  404e8f:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404e92:	ff d6                	call   esi
  404e94:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404e97:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404e9a:	8d 45 b8             	lea    eax,[ebp-0x48]
  404e9d:	52                   	push   edx
  404e9e:	83 c1 34             	add    ecx,0x34
  404ea1:	50                   	push   eax
  404ea2:	8d 55 ec             	lea    edx,[ebp-0x14]
  404ea5:	51                   	push   ecx
  404ea6:	8d 45 e0             	lea    eax,[ebp-0x20]
  404ea9:	52                   	push   edx
  404eaa:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  404ead:	50                   	push   eax
  404eae:	8d 55 e8             	lea    edx,[ebp-0x18]
  404eb1:	51                   	push   ecx
  404eb2:	8d 45 c0             	lea    eax,[ebp-0x40]
  404eb5:	52                   	push   edx
  404eb6:	50                   	push   eax
  404eb7:	e8 e4 e8 ff ff       	call   0x4037a0
  404ebc:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404ebf:	ff d7                	call   edi
  404ec1:	ba 54 29 40 00       	mov    edx,0x402954
  404ec6:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404ec9:	c7 45 b4 82 7e 53 f7 	mov    DWORD PTR [ebp-0x4c],0xf7537e82
  404ed0:	c7 45 b8 06 00 00 00 	mov    DWORD PTR [ebp-0x48],0x6
  404ed7:	ff d6                	call   esi
  404ed9:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404edc:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404edf:	8d 55 b8             	lea    edx,[ebp-0x48]
  404ee2:	51                   	push   ecx
  404ee3:	83 c0 10             	add    eax,0x10
  404ee6:	52                   	push   edx
  404ee7:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404eea:	50                   	push   eax
  404eeb:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404eee:	51                   	push   ecx
  404eef:	8d 45 e8             	lea    eax,[ebp-0x18]
  404ef2:	52                   	push   edx
  404ef3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404ef6:	50                   	push   eax
  404ef7:	8d 55 c0             	lea    edx,[ebp-0x40]
  404efa:	51                   	push   ecx
  404efb:	52                   	push   edx
  404efc:	e8 9f e8 ff ff       	call   0x4037a0
  404f01:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f04:	ff d7                	call   edi
  404f06:	ba 54 29 40 00       	mov    edx,0x402954
  404f0b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f0e:	c7 45 b4 35 f2 3a bd 	mov    DWORD PTR [ebp-0x4c],0xbd3af235
  404f15:	c7 45 b8 0a 00 00 00 	mov    DWORD PTR [ebp-0x48],0xa
  404f1c:	ff d6                	call   esi
  404f1e:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404f21:	8d 45 b4             	lea    eax,[ebp-0x4c]
  404f24:	8d 4d b8             	lea    ecx,[ebp-0x48]
  404f27:	50                   	push   eax
  404f28:	83 c2 2c             	add    edx,0x2c
  404f2b:	51                   	push   ecx
  404f2c:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404f2f:	52                   	push   edx
  404f30:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404f33:	50                   	push   eax
  404f34:	8d 55 ec             	lea    edx,[ebp-0x14]
  404f37:	51                   	push   ecx
  404f38:	8d 45 e0             	lea    eax,[ebp-0x20]
  404f3b:	52                   	push   edx
  404f3c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f3f:	50                   	push   eax
  404f40:	51                   	push   ecx
  404f41:	e8 5a e8 ff ff       	call   0x4037a0
  404f46:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f49:	ff d7                	call   edi
  404f4b:	ba 54 29 40 00       	mov    edx,0x402954
  404f50:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f53:	c7 45 b4 bb d2 d7 2a 	mov    DWORD PTR [ebp-0x4c],0x2ad7d2bb
  404f5a:	c7 45 b8 0f 00 00 00 	mov    DWORD PTR [ebp-0x48],0xf
  404f61:	ff d6                	call   esi
  404f63:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  404f66:	8d 55 b4             	lea    edx,[ebp-0x4c]
  404f69:	8d 45 b8             	lea    eax,[ebp-0x48]
  404f6c:	52                   	push   edx
  404f6d:	83 c1 08             	add    ecx,0x8
  404f70:	50                   	push   eax
  404f71:	8d 55 e8             	lea    edx,[ebp-0x18]
  404f74:	51                   	push   ecx
  404f75:	8d 45 ec             	lea    eax,[ebp-0x14]
  404f78:	52                   	push   edx
  404f79:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404f7c:	50                   	push   eax
  404f7d:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404f80:	51                   	push   ecx
  404f81:	8d 45 c0             	lea    eax,[ebp-0x40]
  404f84:	52                   	push   edx
  404f85:	50                   	push   eax
  404f86:	e8 15 e8 ff ff       	call   0x4037a0
  404f8b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f8e:	ff d7                	call   edi
  404f90:	ba 54 29 40 00       	mov    edx,0x402954
  404f95:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404f98:	c7 45 b4 91 d3 86 eb 	mov    DWORD PTR [ebp-0x4c],0xeb86d391
  404f9f:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  404fa2:	ff d6                	call   esi
  404fa4:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404fa7:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404faa:	8d 55 b8             	lea    edx,[ebp-0x48]
  404fad:	51                   	push   ecx
  404fae:	83 c0 24             	add    eax,0x24
  404fb1:	52                   	push   edx
  404fb2:	8d 4d ec             	lea    ecx,[ebp-0x14]
  404fb5:	50                   	push   eax
  404fb6:	8d 55 e0             	lea    edx,[ebp-0x20]
  404fb9:	51                   	push   ecx
  404fba:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404fbd:	52                   	push   edx
  404fbe:	8d 4d e8             	lea    ecx,[ebp-0x18]
  404fc1:	50                   	push   eax
  404fc2:	8d 55 c0             	lea    edx,[ebp-0x40]
  404fc5:	51                   	push   ecx
  404fc6:	52                   	push   edx
  404fc7:	e8 d4 e7 ff ff       	call   0x4037a0
  404fcc:	8d 4d c0             	lea    ecx,[ebp-0x40]
  404fcf:	ff d7                	call   edi
  404fd1:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  404fd7:	8d 45 ec             	lea    eax,[ebp-0x14]
  404fda:	83 c1 04             	add    ecx,0x4
  404fdd:	50                   	push   eax
  404fde:	51                   	push   ecx
  404fdf:	e8 9c 00 00 00       	call   0x405080
  404fe4:	8b 15 38 70 40 00    	mov    edx,DWORD PTR ds:0x407038
  404fea:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
  404fed:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  404ff3:	8d 45 e8             	lea    eax,[ebp-0x18]
  404ff6:	83 c1 08             	add    ecx,0x8
  404ff9:	50                   	push   eax
  404ffa:	51                   	push   ecx
  404ffb:	e8 80 00 00 00       	call   0x405080
  405000:	8b 15 38 70 40 00    	mov    edx,DWORD PTR ds:0x407038
  405006:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  405009:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  40500f:	8d 45 e4             	lea    eax,[ebp-0x1c]
  405012:	83 c1 0c             	add    ecx,0xc
  405015:	50                   	push   eax
  405016:	51                   	push   ecx
  405017:	e8 64 00 00 00       	call   0x405080
  40501c:	8b 15 38 70 40 00    	mov    edx,DWORD PTR ds:0x407038
  405022:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  405025:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  40502b:	8d 45 e0             	lea    eax,[ebp-0x20]
  40502e:	83 c1 10             	add    ecx,0x10
  405031:	50                   	push   eax
  405032:	51                   	push   ecx
  405033:	e8 48 00 00 00       	call   0x405080
  405038:	8b 15 38 70 40 00    	mov    edx,DWORD PTR ds:0x407038
  40503e:	68 65 50 40 00       	push   0x405065
  405043:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
  405046:	eb 0a                	jmp    0x405052
  405048:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40504b:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405051:	c3                   	ret
  405052:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405055:	8d 45 c8             	lea    eax,[ebp-0x38]
  405058:	51                   	push   ecx
  405059:	6a 00                	push   0x0
  40505b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40505e:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  405064:	c3                   	ret
  405065:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  405068:	5f                   	pop    edi
  405069:	5e                   	pop    esi
  40506a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405071:	5b                   	pop    ebx
  405072:	8b e5                	mov    esp,ebp
  405074:	5d                   	pop    ebp
  405075:	c2 04 00             	ret    0x4
  405078:	90                   	nop
  405079:	90                   	nop
  40507a:	90                   	nop
  40507b:	90                   	nop
  40507c:	90                   	nop
  40507d:	90                   	nop
  40507e:	90                   	nop
  40507f:	90                   	nop
  405080:	83 ec 08             	sub    esp,0x8
  405083:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405087:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  40508b:	53                   	push   ebx
  40508c:	56                   	push   esi
  40508d:	8b 19                	mov    ebx,DWORD PTR [ecx]
  40508f:	57                   	push   edi
  405090:	8b 38                	mov    edi,DWORD PTR [eax]
  405092:	8b cb                	mov    ecx,ebx
  405094:	8b d7                	mov    edx,edi
  405096:	81 e1 ff ff 00 00    	and    ecx,0xffff
  40509c:	81 e2 ff ff 00 00    	and    edx,0xffff
  4050a2:	03 ca                	add    ecx,edx
  4050a4:	0f 80 94 00 00 00    	jo     0x40513e
  4050aa:	8b c1                	mov    eax,ecx
  4050ac:	99                   	cdq
  4050ad:	81 e2 ff ff 00 00    	and    edx,0xffff
  4050b3:	03 c2                	add    eax,edx
  4050b5:	8b f0                	mov    esi,eax
  4050b7:	8b c3                	mov    eax,ebx
  4050b9:	25 00 00 ff ff       	and    eax,0xffff0000
  4050be:	99                   	cdq
  4050bf:	81 e2 ff ff 00 00    	and    edx,0xffff
  4050c5:	03 c2                	add    eax,edx
  4050c7:	8b d8                	mov    ebx,eax
  4050c9:	8b c7                	mov    eax,edi
  4050cb:	25 00 00 ff ff       	and    eax,0xffff0000
  4050d0:	99                   	cdq
  4050d1:	81 e2 ff ff 00 00    	and    edx,0xffff
  4050d7:	03 c2                	add    eax,edx
  4050d9:	c1 fb 10             	sar    ebx,0x10
  4050dc:	c1 f8 10             	sar    eax,0x10
  4050df:	c1 fe 10             	sar    esi,0x10
  4050e2:	03 d8                	add    ebx,eax
  4050e4:	70 58                	jo     0x40513e
  4050e6:	03 de                	add    ebx,esi
  4050e8:	70 54                	jo     0x40513e
  4050ea:	81 e3 ff ff 00 00    	and    ebx,0xffff
  4050f0:	81 e1 ff ff 00 00    	and    ecx,0xffff
  4050f6:	89 5c 24 18          	mov    DWORD PTR [esp+0x18],ebx
  4050fa:	db 44 24 18          	fild   DWORD PTR [esp+0x18]
  4050fe:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  405102:	dd 5c 24 0c          	fstp   QWORD PTR [esp+0xc]
  405106:	dd 44 24 0c          	fld    QWORD PTR [esp+0xc]
  40510a:	dc 0d f0 11 40 00    	fmul   QWORD PTR ds:0x4011f0
  405110:	db 44 24 18          	fild   DWORD PTR [esp+0x18]
  405114:	dd 5c 24 0c          	fstp   QWORD PTR [esp+0xc]
  405118:	dc 44 24 0c          	fadd   QWORD PTR [esp+0xc]
  40511c:	dd 5c 24 0c          	fstp   QWORD PTR [esp+0xc]
  405120:	df e0                	fnstsw ax
  405122:	a8 0d                	test   al,0xd
  405124:	75 13                	jne    0x405139
  405126:	8d 44 24 0c          	lea    eax,[esp+0xc]
  40512a:	50                   	push   eax
  40512b:	e8 70 03 00 00       	call   0x4054a0
  405130:	5f                   	pop    edi
  405131:	5e                   	pop    esi
  405132:	5b                   	pop    ebx
  405133:	83 c4 08             	add    esp,0x8
  405136:	c2 08 00             	ret    0x8
  405139:	e9 2e c1 ff ff       	jmp    0x40126c
  40513e:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  405144:	90                   	nop
  405145:	90                   	nop
  405146:	90                   	nop
  405147:	90                   	nop
  405148:	90                   	nop
  405149:	90                   	nop
  40514a:	90                   	nop
  40514b:	90                   	nop
  40514c:	90                   	nop
  40514d:	90                   	nop
  40514e:	90                   	nop
  40514f:	90                   	nop
  405150:	83 ec 08             	sub    esp,0x8
  405153:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405157:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  40515b:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  40515f:	53                   	push   ebx
  405160:	8b 19                	mov    ebx,DWORD PTR [ecx]
  405162:	55                   	push   ebp
  405163:	8b 2a                	mov    ebp,DWORD PTR [edx]
  405165:	56                   	push   esi
  405166:	57                   	push   edi
  405167:	8b 38                	mov    edi,DWORD PTR [eax]
  405169:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40516d:	8b cb                	mov    ecx,ebx
  40516f:	8b d7                	mov    edx,edi
  405171:	81 e1 ff ff 00 00    	and    ecx,0xffff
  405177:	8b 00                	mov    eax,DWORD PTR [eax]
  405179:	81 e2 ff ff 00 00    	and    edx,0xffff
  40517f:	03 ca                	add    ecx,edx
  405181:	8b d5                	mov    edx,ebp
  405183:	0f 80 e8 00 00 00    	jo     0x405271
  405189:	81 e2 ff ff 00 00    	and    edx,0xffff
  40518f:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  405193:	03 ca                	add    ecx,edx
  405195:	0f 80 d6 00 00 00    	jo     0x405271
  40519b:	25 ff ff 00 00       	and    eax,0xffff
  4051a0:	03 c8                	add    ecx,eax
  4051a2:	0f 80 c9 00 00 00    	jo     0x405271
  4051a8:	8b c1                	mov    eax,ecx
  4051aa:	99                   	cdq
  4051ab:	81 e2 ff ff 00 00    	and    edx,0xffff
  4051b1:	03 c2                	add    eax,edx
  4051b3:	8b f0                	mov    esi,eax
  4051b5:	8b c3                	mov    eax,ebx
  4051b7:	25 00 00 ff ff       	and    eax,0xffff0000
  4051bc:	99                   	cdq
  4051bd:	81 e2 ff ff 00 00    	and    edx,0xffff
  4051c3:	03 c2                	add    eax,edx
  4051c5:	8b d8                	mov    ebx,eax
  4051c7:	8b c7                	mov    eax,edi
  4051c9:	25 00 00 ff ff       	and    eax,0xffff0000
  4051ce:	99                   	cdq
  4051cf:	81 e2 ff ff 00 00    	and    edx,0xffff
  4051d5:	03 c2                	add    eax,edx
  4051d7:	c1 fb 10             	sar    ebx,0x10
  4051da:	c1 f8 10             	sar    eax,0x10
  4051dd:	c1 fe 10             	sar    esi,0x10
  4051e0:	03 d8                	add    ebx,eax
  4051e2:	8b c5                	mov    eax,ebp
  4051e4:	0f 80 87 00 00 00    	jo     0x405271
  4051ea:	25 00 00 ff ff       	and    eax,0xffff0000
  4051ef:	99                   	cdq
  4051f0:	81 e2 ff ff 00 00    	and    edx,0xffff
  4051f6:	03 c2                	add    eax,edx
  4051f8:	c1 f8 10             	sar    eax,0x10
  4051fb:	03 d8                	add    ebx,eax
  4051fd:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405201:	70 6e                	jo     0x405271
  405203:	25 00 00 ff ff       	and    eax,0xffff0000
  405208:	99                   	cdq
  405209:	81 e2 ff ff 00 00    	and    edx,0xffff
  40520f:	03 c2                	add    eax,edx
  405211:	c1 f8 10             	sar    eax,0x10
  405214:	03 d8                	add    ebx,eax
  405216:	70 59                	jo     0x405271
  405218:	03 de                	add    ebx,esi
  40521a:	70 55                	jo     0x405271
  40521c:	81 e3 ff ff 00 00    	and    ebx,0xffff
  405222:	81 e1 ff ff 00 00    	and    ecx,0xffff
  405228:	89 5c 24 1c          	mov    DWORD PTR [esp+0x1c],ebx
  40522c:	db 44 24 1c          	fild   DWORD PTR [esp+0x1c]
  405230:	89 4c 24 1c          	mov    DWORD PTR [esp+0x1c],ecx
  405234:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405238:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  40523c:	dc 0d f0 11 40 00    	fmul   QWORD PTR ds:0x4011f0
  405242:	db 44 24 1c          	fild   DWORD PTR [esp+0x1c]
  405246:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  40524a:	dc 44 24 10          	fadd   QWORD PTR [esp+0x10]
  40524e:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405252:	df e0                	fnstsw ax
  405254:	a8 0d                	test   al,0xd
  405256:	75 14                	jne    0x40526c
  405258:	8d 44 24 10          	lea    eax,[esp+0x10]
  40525c:	50                   	push   eax
  40525d:	e8 3e 02 00 00       	call   0x4054a0
  405262:	5f                   	pop    edi
  405263:	5e                   	pop    esi
  405264:	5d                   	pop    ebp
  405265:	5b                   	pop    ebx
  405266:	83 c4 08             	add    esp,0x8
  405269:	c2 10 00             	ret    0x10
  40526c:	e9 fb bf ff ff       	jmp    0x40126c
  405271:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  405277:	90                   	nop
  405278:	90                   	nop
  405279:	90                   	nop
  40527a:	90                   	nop
  40527b:	90                   	nop
  40527c:	90                   	nop
  40527d:	90                   	nop
  40527e:	90                   	nop
  40527f:	90                   	nop
  405280:	83 ec 18             	sub    esp,0x18
  405283:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405287:	57                   	push   edi
  405288:	33 ff                	xor    edi,edi
  40528a:	66 8b 00             	mov    ax,WORD PTR [eax]
  40528d:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  405291:	66 2d 01 00          	sub    ax,0x1
  405295:	89 7c 24 18          	mov    DWORD PTR [esp+0x18],edi
  405299:	0f 80 f0 01 00 00    	jo     0x40548f
  40529f:	66 3b c7             	cmp    ax,di
  4052a2:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4052a6:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4052aa:	0f 8c d3 01 00 00    	jl     0x405483
  4052b0:	53                   	push   ebx
  4052b1:	55                   	push   ebp
  4052b2:	56                   	push   esi
  4052b3:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
  4052b7:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4052ba:	85 c0                	test   eax,eax
  4052bc:	74 21                	je     0x4052df
  4052be:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4052c2:	75 1b                	jne    0x4052df
  4052c4:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  4052c7:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  4052ca:	0f bf f7             	movsx  esi,di
  4052cd:	2b f2                	sub    esi,edx
  4052cf:	3b f1                	cmp    esi,ecx
  4052d1:	72 06                	jb     0x4052d9
  4052d3:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  4052d9:	89 74 24 2c          	mov    DWORD PTR [esp+0x2c],esi
  4052dd:	eb 0a                	jmp    0x4052e9
  4052df:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  4052e5:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  4052e9:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4052ec:	85 c0                	test   eax,eax
  4052ee:	74 2c                	je     0x40531c
  4052f0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4052f4:	75 26                	jne    0x40531c
  4052f6:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  4052f9:	66 8b cf             	mov    cx,di
  4052fc:	66 83 c1 01          	add    cx,0x1
  405300:	0f 80 89 01 00 00    	jo     0x40548f
  405306:	0f bf f1             	movsx  esi,cx
  405309:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  40530c:	2b f2                	sub    esi,edx
  40530e:	3b f1                	cmp    esi,ecx
  405310:	72 06                	jb     0x405318
  405312:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  405318:	8b de                	mov    ebx,esi
  40531a:	eb 08                	jmp    0x405324
  40531c:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  405322:	8b d8                	mov    ebx,eax
  405324:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405327:	85 c0                	test   eax,eax
  405329:	74 2a                	je     0x405355
  40532b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  40532f:	75 24                	jne    0x405355
  405331:	66 8b d7             	mov    dx,di
  405334:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  405337:	66 83 c2 02          	add    dx,0x2
  40533b:	0f 80 4e 01 00 00    	jo     0x40548f
  405341:	0f bf f2             	movsx  esi,dx
  405344:	2b 70 14             	sub    esi,DWORD PTR [eax+0x14]
  405347:	3b f1                	cmp    esi,ecx
  405349:	72 06                	jb     0x405351
  40534b:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  405351:	8b ee                	mov    ebp,esi
  405353:	eb 08                	jmp    0x40535d
  405355:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  40535b:	8b e8                	mov    ebp,eax
  40535d:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  405361:	8b 00                	mov    eax,DWORD PTR [eax]
  405363:	85 c0                	test   eax,eax
  405365:	74 2c                	je     0x405393
  405367:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  40536b:	75 26                	jne    0x405393
  40536d:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  405370:	66 8b cf             	mov    cx,di
  405373:	66 83 c1 03          	add    cx,0x3
  405377:	0f 80 12 01 00 00    	jo     0x40548f
  40537d:	0f bf f1             	movsx  esi,cx
  405380:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  405383:	2b f2                	sub    esi,edx
  405385:	3b f1                	cmp    esi,ecx
  405387:	72 06                	jb     0x40538f
  405389:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  40538f:	8b c6                	mov    eax,esi
  405391:	eb 06                	jmp    0x405399
  405393:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  405399:	8b 54 24 34          	mov    edx,DWORD PTR [esp+0x34]
  40539d:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
  4053a1:	8b 0a                	mov    ecx,DWORD PTR [edx]
  4053a3:	33 d2                	xor    edx,edx
  4053a5:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4053a8:	8a 14 19             	mov    dl,BYTE PTR [ecx+ebx*1]
  4053ab:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  4053af:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4053b3:	33 d2                	xor    edx,edx
  4053b5:	db 44 24 14          	fild   DWORD PTR [esp+0x14]
  4053b9:	8a 14 31             	mov    dl,BYTE PTR [ecx+esi*1]
  4053bc:	89 54 24 2c          	mov    DWORD PTR [esp+0x2c],edx
  4053c0:	33 d2                	xor    edx,edx
  4053c2:	dd 5c 24 14          	fstp   QWORD PTR [esp+0x14]
  4053c6:	dd 44 24 14          	fld    QWORD PTR [esp+0x14]
  4053ca:	dc 0d 00 12 40 00    	fmul   QWORD PTR ds:0x401200
  4053d0:	db 44 24 2c          	fild   DWORD PTR [esp+0x2c]
  4053d4:	8a 14 29             	mov    dl,BYTE PTR [ecx+ebp*1]
  4053d7:	dd 5c 24 14          	fstp   QWORD PTR [esp+0x14]
  4053db:	dc 44 24 14          	fadd   QWORD PTR [esp+0x14]
  4053df:	89 54 24 2c          	mov    DWORD PTR [esp+0x2c],edx
  4053e3:	33 d2                	xor    edx,edx
  4053e5:	db 44 24 2c          	fild   DWORD PTR [esp+0x2c]
  4053e9:	8a 14 01             	mov    dl,BYTE PTR [ecx+eax*1]
  4053ec:	dd 5c 24 14          	fstp   QWORD PTR [esp+0x14]
  4053f0:	dd 44 24 14          	fld    QWORD PTR [esp+0x14]
  4053f4:	dc 0d f0 11 40 00    	fmul   QWORD PTR ds:0x4011f0
  4053fa:	89 54 24 2c          	mov    DWORD PTR [esp+0x2c],edx
  4053fe:	de c1                	faddp  st(1),st
  405400:	db 44 24 2c          	fild   DWORD PTR [esp+0x2c]
  405404:	dd 5c 24 20          	fstp   QWORD PTR [esp+0x20]
  405408:	dd 44 24 20          	fld    QWORD PTR [esp+0x20]
  40540c:	dc 0d f8 11 40 00    	fmul   QWORD PTR ds:0x4011f8
  405412:	de c1                	faddp  st(1),st
  405414:	dd 5c 24 20          	fstp   QWORD PTR [esp+0x20]
  405418:	df e0                	fnstsw ax
  40541a:	a8 0d                	test   al,0xd
  40541c:	75 6c                	jne    0x40548a
  40541e:	8b 03                	mov    eax,DWORD PTR [ebx]
  405420:	85 c0                	test   eax,eax
  405422:	74 22                	je     0x405446
  405424:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  405428:	75 1c                	jne    0x405446
  40542a:	0f bf 74 24 10       	movsx  esi,WORD PTR [esp+0x10]
  40542f:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
  405432:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  405435:	2b f2                	sub    esi,edx
  405437:	3b f1                	cmp    esi,ecx
  405439:	72 06                	jb     0x405441
  40543b:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  405441:	c1 e6 02             	shl    esi,0x2
  405444:	eb 08                	jmp    0x40544e
  405446:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  40544c:	8b f0                	mov    esi,eax
  40544e:	8d 44 24 20          	lea    eax,[esp+0x20]
  405452:	50                   	push   eax
  405453:	e8 48 00 00 00       	call   0x4054a0
  405458:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  40545a:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  40545d:	89 04 32             	mov    DWORD PTR [edx+esi*1],eax
  405460:	66 8b 44 24 10       	mov    ax,WORD PTR [esp+0x10]
  405465:	66 05 01 00          	add    ax,0x1
  405469:	70 24                	jo     0x40548f
  40546b:	66 83 c7 04          	add    di,0x4
  40546f:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  405473:	70 1a                	jo     0x40548f
  405475:	66 3b 7c 24 1c       	cmp    di,WORD PTR [esp+0x1c]
  40547a:	0f 8e 33 fe ff ff    	jle    0x4052b3
  405480:	5e                   	pop    esi
  405481:	5d                   	pop    ebp
  405482:	5b                   	pop    ebx
  405483:	5f                   	pop    edi
  405484:	83 c4 18             	add    esp,0x18
  405487:	c2 0c 00             	ret    0xc
  40548a:	e9 dd bd ff ff       	jmp    0x40126c
  40548f:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  405495:	90                   	nop
  405496:	90                   	nop
  405497:	90                   	nop
  405498:	90                   	nop
  405499:	90                   	nop
  40549a:	90                   	nop
  40549b:	90                   	nop
  40549c:	90                   	nop
  40549d:	90                   	nop
  40549e:	90                   	nop
  40549f:	90                   	nop
  4054a0:	56                   	push   esi
  4054a1:	8b 74 24 08          	mov    esi,DWORD PTR [esp+0x8]
  4054a5:	dd 06                	fld    QWORD PTR [esi]
  4054a7:	dc 1d 18 12 40 00    	fcomp  QWORD PTR ds:0x401218
  4054ad:	df e0                	fnstsw ax
  4054af:	f6 c4 01             	test   ah,0x1
  4054b2:	75 07                	jne    0x4054bb
  4054b4:	b9 01 00 00 00       	mov    ecx,0x1
  4054b9:	eb 02                	jmp    0x4054bd
  4054bb:	33 c9                	xor    ecx,ecx
  4054bd:	dd 06                	fld    QWORD PTR [esi]
  4054bf:	dc 1d 10 12 40 00    	fcomp  QWORD PTR ds:0x401210
  4054c5:	df e0                	fnstsw ax
  4054c7:	f6 c4 01             	test   ah,0x1
  4054ca:	74 07                	je     0x4054d3
  4054cc:	b8 01 00 00 00       	mov    eax,0x1
  4054d1:	eb 02                	jmp    0x4054d5
  4054d3:	33 c0                	xor    eax,eax
  4054d5:	85 c8                	test   eax,ecx
  4054d7:	75 08                	jne    0x4054e1
  4054d9:	6a 06                	push   0x6
  4054db:	ff 15 4c 10 40 00    	call   DWORD PTR ds:0x40104c
  4054e1:	dd 06                	fld    QWORD PTR [esi]
  4054e3:	dc 1d 08 12 40 00    	fcomp  QWORD PTR ds:0x401208
  4054e9:	dd 06                	fld    QWORD PTR [esi]
  4054eb:	df e0                	fnstsw ax
  4054ed:	f6 c4 41             	test   ah,0x41
  4054f0:	75 0c                	jne    0x4054fe
  4054f2:	dc 25 10 12 40 00    	fsub   QWORD PTR ds:0x401210
  4054f8:	df e0                	fnstsw ax
  4054fa:	a8 0d                	test   al,0xd
  4054fc:	75 0a                	jne    0x405508
  4054fe:	ff 15 2c 11 40 00    	call   DWORD PTR ds:0x40112c
  405504:	5e                   	pop    esi
  405505:	c2 04 00             	ret    0x4
  405508:	e9 5f bd ff ff       	jmp    0x40126c
  40550d:	90                   	nop
  40550e:	90                   	nop
  40550f:	90                   	nop
  405510:	55                   	push   ebp
  405511:	8b ec                	mov    ebp,esp
  405513:	83 ec 08             	sub    esp,0x8
  405516:	68 66 12 40 00       	push   0x401266
  40551b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405521:	50                   	push   eax
  405522:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  405529:	83 ec 40             	sub    esp,0x40
  40552c:	53                   	push   ebx
  40552d:	56                   	push   esi
  40552e:	57                   	push   edi
  40552f:	89 65 f8             	mov    DWORD PTR [ebp-0x8],esp
  405532:	c7 45 fc 20 12 40 00 	mov    DWORD PTR [ebp-0x4],0x401220
  405539:	33 c0                	xor    eax,eax
  40553b:	6a 11                	push   0x11
  40553d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  405540:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  405543:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  405546:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  405549:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40554c:	8d 45 d0             	lea    eax,[ebp-0x30]
  40554f:	68 9c 29 40 00       	push   0x40299c
  405554:	50                   	push   eax
  405555:	ff 15 98 10 40 00    	call   DWORD PTR ds:0x401098
  40555b:	8b 35 b4 10 40 00    	mov    esi,DWORD PTR ds:0x4010b4
  405561:	b9 80 00 00 00       	mov    ecx,0x80
  405566:	ff d6                	call   esi
  405568:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  40556b:	88 01                	mov    BYTE PTR [ecx],al
  40556d:	8b 0d 24 70 40 00    	mov    ecx,DWORD PTR ds:0x407024
  405573:	8b d1                	mov    edx,ecx
  405575:	8b c1                	mov    eax,ecx
  405577:	6b d2 08             	imul   edx,edx,0x8
  40557a:	0f 80 88 01 00 00    	jo     0x405708
  405580:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
  405583:	25 3f 00 00 80       	and    eax,0x8000003f
  405588:	db 45 b0             	fild   DWORD PTR [ebp-0x50]
  40558b:	dd 5d e8             	fstp   QWORD PTR [ebp-0x18]
  40558e:	79 05                	jns    0x405595
  405590:	48                   	dec    eax
  405591:	83 c8 c0             	or     eax,0xffffffc0
  405594:	40                   	inc    eax
  405595:	83 f8 38             	cmp    eax,0x38
  405598:	7f 20                	jg     0x4055ba
  40559a:	ba 38 00 00 00       	mov    edx,0x38
  40559f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4055a2:	2b d0                	sub    edx,eax
  4055a4:	89 4d bc             	mov    DWORD PTR [ebp-0x44],ecx
  4055a7:	8d 45 bc             	lea    eax,[ebp-0x44]
  4055aa:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4055ad:	0f 80 55 01 00 00    	jo     0x405708
  4055b3:	50                   	push   eax
  4055b4:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  4055b7:	51                   	push   ecx
  4055b8:	eb 1e                	jmp    0x4055d8
  4055ba:	b8 78 00 00 00       	mov    eax,0x78
  4055bf:	8d 55 d0             	lea    edx,[ebp-0x30]
  4055c2:	2b c1                	sub    eax,ecx
  4055c4:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
  4055c7:	8d 4d bc             	lea    ecx,[ebp-0x44]
  4055ca:	8d 55 c0             	lea    edx,[ebp-0x40]
  4055cd:	0f 80 35 01 00 00    	jo     0x405708
  4055d3:	51                   	push   ecx
  4055d4:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  4055d7:	52                   	push   edx
  4055d8:	e8 c3 e3 ff ff       	call   0x4039a0
  4055dd:	8b 1d 40 11 40 00    	mov    ebx,DWORD PTR ds:0x401140
  4055e3:	8b d0                	mov    edx,eax
  4055e5:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4055e8:	ff d3                	call   ebx
  4055ea:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4055ed:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4055f3:	8d 45 e8             	lea    eax,[ebp-0x18]
  4055f6:	50                   	push   eax
  4055f7:	e8 a4 fe ff ff       	call   0x4054a0
  4055fc:	8b 3d c0 10 40 00    	mov    edi,DWORD PTR ds:0x4010c0
  405602:	8b c8                	mov    ecx,eax
  405604:	81 e1 ff 00 00 00    	and    ecx,0xff
  40560a:	ff d7                	call   edi
  40560c:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  40560f:	8d 55 e8             	lea    edx,[ebp-0x18]
  405612:	52                   	push   edx
  405613:	88 01                	mov    BYTE PTR [ecx],al
  405615:	e8 86 fe ff ff       	call   0x4054a0
  40561a:	99                   	cdq
  40561b:	81 e2 ff 00 00 00    	and    edx,0xff
  405621:	03 c2                	add    eax,edx
  405623:	8b c8                	mov    ecx,eax
  405625:	c1 f9 08             	sar    ecx,0x8
  405628:	81 e1 ff 00 00 00    	and    ecx,0xff
  40562e:	ff d7                	call   edi
  405630:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  405633:	8d 55 e8             	lea    edx,[ebp-0x18]
  405636:	52                   	push   edx
  405637:	88 41 01             	mov    BYTE PTR [ecx+0x1],al
  40563a:	e8 61 fe ff ff       	call   0x4054a0
  40563f:	99                   	cdq
  405640:	81 e2 ff ff 00 00    	and    edx,0xffff
  405646:	03 c2                	add    eax,edx
  405648:	8b c8                	mov    ecx,eax
  40564a:	c1 f9 10             	sar    ecx,0x10
  40564d:	81 e1 ff 00 00 00    	and    ecx,0xff
  405653:	ff d7                	call   edi
  405655:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  405658:	8d 55 e8             	lea    edx,[ebp-0x18]
  40565b:	52                   	push   edx
  40565c:	88 41 02             	mov    BYTE PTR [ecx+0x2],al
  40565f:	e8 3c fe ff ff       	call   0x4054a0
  405664:	99                   	cdq
  405665:	81 e2 ff ff ff 00    	and    edx,0xffffff
  40566b:	03 c2                	add    eax,edx
  40566d:	8b c8                	mov    ecx,eax
  40566f:	c1 f9 18             	sar    ecx,0x18
  405672:	81 e1 ff 00 00 00    	and    ecx,0xff
  405678:	ff d7                	call   edi
  40567a:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  40567d:	88 41 03             	mov    BYTE PTR [ecx+0x3],al
  405680:	33 c9                	xor    ecx,ecx
  405682:	ff d6                	call   esi
  405684:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  405687:	33 c9                	xor    ecx,ecx
  405689:	88 42 04             	mov    BYTE PTR [edx+0x4],al
  40568c:	ff d6                	call   esi
  40568e:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  405691:	88 41 05             	mov    BYTE PTR [ecx+0x5],al
  405694:	33 c9                	xor    ecx,ecx
  405696:	ff d6                	call   esi
  405698:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  40569b:	33 c9                	xor    ecx,ecx
  40569d:	88 42 06             	mov    BYTE PTR [edx+0x6],al
  4056a0:	ff d6                	call   esi
  4056a2:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  4056a5:	8d 55 d0             	lea    edx,[ebp-0x30]
  4056a8:	88 41 07             	mov    BYTE PTR [ecx+0x7],al
  4056ab:	8d 45 bc             	lea    eax,[ebp-0x44]
  4056ae:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4056b1:	50                   	push   eax
  4056b2:	51                   	push   ecx
  4056b3:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
  4056b6:	c7 45 c0 08 00 00 00 	mov    DWORD PTR [ebp-0x40],0x8
  4056bd:	e8 de e2 ff ff       	call   0x4039a0
  4056c2:	8b d0                	mov    edx,eax
  4056c4:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4056c7:	ff d3                	call   ebx
  4056c9:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4056cc:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4056d2:	9b                   	fwait
  4056d3:	68 f7 56 40 00       	push   0x4056f7
  4056d8:	eb 0a                	jmp    0x4056e4
  4056da:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4056dd:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  4056e3:	c3                   	ret
  4056e4:	8d 45 c0             	lea    eax,[ebp-0x40]
  4056e7:	8d 55 d0             	lea    edx,[ebp-0x30]
  4056ea:	50                   	push   eax
  4056eb:	6a 00                	push   0x0
  4056ed:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  4056f0:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  4056f6:	c3                   	ret
  4056f7:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  4056fa:	5f                   	pop    edi
  4056fb:	5e                   	pop    esi
  4056fc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405703:	5b                   	pop    ebx
  405704:	8b e5                	mov    esp,ebp
  405706:	5d                   	pop    ebp
  405707:	c3                   	ret
  405708:	ff 15 f4 10 40 00    	call   DWORD PTR ds:0x4010f4
  40570e:	90                   	nop
  40570f:	90                   	nop
  405710:	55                   	push   ebp
  405711:	8b ec                	mov    ebp,esp
  405713:	83 ec 0c             	sub    esp,0xc
  405716:	68 66 12 40 00       	push   0x401266
  40571b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405721:	50                   	push   eax
  405722:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  405729:	83 ec 6c             	sub    esp,0x6c
  40572c:	53                   	push   ebx
  40572d:	56                   	push   esi
  40572e:	57                   	push   edi
  40572f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  405732:	c7 45 f8 30 12 40 00 	mov    DWORD PTR [ebp-0x8],0x401230
  405739:	33 c0                	xor    eax,eax
  40573b:	c6 45 e8 00          	mov    BYTE PTR [ebp-0x18],0x0
  40573f:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  405742:	88 45 d8             	mov    BYTE PTR [ebp-0x28],al
  405745:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  405748:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40574b:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  40574e:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  405751:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  405754:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  405757:	c6 45 e4 00          	mov    BYTE PTR [ebp-0x1c],0x0
  40575b:	c6 45 e0 00          	mov    BYTE PTR [ebp-0x20],0x0
  40575f:	8b 08                	mov    ecx,DWORD PTR [eax]
  405761:	81 e1 ff 00 00 00    	and    ecx,0xff
  405767:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0
  40576d:	3c 10                	cmp    al,0x10
  40576f:	88 45 d8             	mov    BYTE PTR [ebp-0x28],al
  405772:	73 68                	jae    0x4057dc
  405774:	8b 35 04 11 40 00    	mov    esi,DWORD PTR ds:0x401104
  40577a:	8d 55 98             	lea    edx,[ebp-0x68]
  40577d:	8d 45 c8             	lea    eax,[ebp-0x38]
  405780:	8d 4d d8             	lea    ecx,[ebp-0x28]
  405783:	52                   	push   edx
  405784:	50                   	push   eax
  405785:	c7 45 90 b8 29 40 00 	mov    DWORD PTR [ebp-0x70],0x4029b8
  40578c:	c7 45 88 08 00 00 00 	mov    DWORD PTR [ebp-0x78],0x8
  405793:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
  405796:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  40579d:	ff d6                	call   esi
  40579f:	8d 4d 88             	lea    ecx,[ebp-0x78]
  4057a2:	8d 55 c8             	lea    edx,[ebp-0x38]
  4057a5:	51                   	push   ecx
  4057a6:	8d 45 b8             	lea    eax,[ebp-0x48]
  4057a9:	52                   	push   edx
  4057aa:	50                   	push   eax
  4057ab:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  4057b1:	8b 3d 20 10 40 00    	mov    edi,DWORD PTR ds:0x401020
  4057b7:	50                   	push   eax
  4057b8:	ff d7                	call   edi
  4057ba:	8b 1d 40 11 40 00    	mov    ebx,DWORD PTR ds:0x401140
  4057c0:	8b d0                	mov    edx,eax
  4057c2:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4057c5:	ff d3                	call   ebx
  4057c7:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4057ca:	8d 55 c8             	lea    edx,[ebp-0x38]
  4057cd:	51                   	push   ecx
  4057ce:	52                   	push   edx
  4057cf:	6a 02                	push   0x2
  4057d1:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  4057d7:	83 c4 0c             	add    esp,0xc
  4057da:	eb 3f                	jmp    0x40581b
  4057dc:	8b 35 04 11 40 00    	mov    esi,DWORD PTR ds:0x401104
  4057e2:	8d 4d 98             	lea    ecx,[ebp-0x68]
  4057e5:	8d 55 c8             	lea    edx,[ebp-0x38]
  4057e8:	8d 45 d8             	lea    eax,[ebp-0x28]
  4057eb:	51                   	push   ecx
  4057ec:	52                   	push   edx
  4057ed:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
  4057f0:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  4057f7:	ff d6                	call   esi
  4057f9:	8b 3d 20 10 40 00    	mov    edi,DWORD PTR ds:0x401020
  4057ff:	8d 45 c8             	lea    eax,[ebp-0x38]
  405802:	50                   	push   eax
  405803:	ff d7                	call   edi
  405805:	8b 1d 40 11 40 00    	mov    ebx,DWORD PTR ds:0x401140
  40580b:	8b d0                	mov    edx,eax
  40580d:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405810:	ff d3                	call   ebx
  405812:	8d 4d c8             	lea    ecx,[ebp-0x38]
  405815:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  40581b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40581e:	33 c9                	xor    ecx,ecx
  405820:	8a 4a 01             	mov    cl,BYTE PTR [edx+0x1]
  405823:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0
  405829:	3c 10                	cmp    al,0x10
  40582b:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
  40582e:	73 65                	jae    0x405895
  405830:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  405833:	50                   	push   eax
  405834:	68 b8 29 40 00       	push   0x4029b8
  405839:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  40583f:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  405842:	8d 55 98             	lea    edx,[ebp-0x68]
  405845:	8d 45 c8             	lea    eax,[ebp-0x38]
  405848:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40584b:	52                   	push   edx
  40584c:	50                   	push   eax
  40584d:	c7 45 b8 08 00 00 00 	mov    DWORD PTR [ebp-0x48],0x8
  405854:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
  405857:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  40585e:	ff d6                	call   esi
  405860:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405863:	8d 55 c8             	lea    edx,[ebp-0x38]
  405866:	51                   	push   ecx
  405867:	8d 45 a8             	lea    eax,[ebp-0x58]
  40586a:	52                   	push   edx
  40586b:	50                   	push   eax
  40586c:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  405872:	50                   	push   eax
  405873:	ff d7                	call   edi
  405875:	8b d0                	mov    edx,eax
  405877:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40587a:	ff d3                	call   ebx
  40587c:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40587f:	8d 55 c8             	lea    edx,[ebp-0x38]
  405882:	51                   	push   ecx
  405883:	8d 45 b8             	lea    eax,[ebp-0x48]
  405886:	52                   	push   edx
  405887:	50                   	push   eax
  405888:	6a 03                	push   0x3
  40588a:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405890:	83 c4 10             	add    esp,0x10
  405893:	eb 53                	jmp    0x4058e8
  405895:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  405898:	8d 45 98             	lea    eax,[ebp-0x68]
  40589b:	89 4d 90             	mov    DWORD PTR [ebp-0x70],ecx
  40589e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4058a1:	8d 55 e8             	lea    edx,[ebp-0x18]
  4058a4:	50                   	push   eax
  4058a5:	51                   	push   ecx
  4058a6:	c7 45 88 08 00 00 00 	mov    DWORD PTR [ebp-0x78],0x8
  4058ad:	89 55 a0             	mov    DWORD PTR [ebp-0x60],edx
  4058b0:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  4058b7:	ff d6                	call   esi
  4058b9:	8d 55 88             	lea    edx,[ebp-0x78]
  4058bc:	8d 45 c8             	lea    eax,[ebp-0x38]
  4058bf:	52                   	push   edx
  4058c0:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4058c3:	50                   	push   eax
  4058c4:	51                   	push   ecx
  4058c5:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  4058cb:	50                   	push   eax
  4058cc:	ff d7                	call   edi
  4058ce:	8b d0                	mov    edx,eax
  4058d0:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4058d3:	ff d3                	call   ebx
  4058d5:	8d 55 b8             	lea    edx,[ebp-0x48]
  4058d8:	8d 45 c8             	lea    eax,[ebp-0x38]
  4058db:	52                   	push   edx
  4058dc:	50                   	push   eax
  4058dd:	6a 02                	push   0x2
  4058df:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  4058e5:	83 c4 0c             	add    esp,0xc
  4058e8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4058eb:	33 c9                	xor    ecx,ecx
  4058ed:	8a 4a 02             	mov    cl,BYTE PTR [edx+0x2]
  4058f0:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0
  4058f6:	3c 10                	cmp    al,0x10
  4058f8:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
  4058fb:	73 65                	jae    0x405962
  4058fd:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  405900:	50                   	push   eax
  405901:	68 b8 29 40 00       	push   0x4029b8
  405906:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  40590c:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40590f:	8d 55 98             	lea    edx,[ebp-0x68]
  405912:	8d 45 c8             	lea    eax,[ebp-0x38]
  405915:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405918:	52                   	push   edx
  405919:	50                   	push   eax
  40591a:	c7 45 b8 08 00 00 00 	mov    DWORD PTR [ebp-0x48],0x8
  405921:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
  405924:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  40592b:	ff d6                	call   esi
  40592d:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405930:	8d 55 c8             	lea    edx,[ebp-0x38]
  405933:	51                   	push   ecx
  405934:	8d 45 a8             	lea    eax,[ebp-0x58]
  405937:	52                   	push   edx
  405938:	50                   	push   eax
  405939:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  40593f:	50                   	push   eax
  405940:	ff d7                	call   edi
  405942:	8b d0                	mov    edx,eax
  405944:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405947:	ff d3                	call   ebx
  405949:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40594c:	8d 55 c8             	lea    edx,[ebp-0x38]
  40594f:	51                   	push   ecx
  405950:	8d 45 b8             	lea    eax,[ebp-0x48]
  405953:	52                   	push   edx
  405954:	50                   	push   eax
  405955:	6a 03                	push   0x3
  405957:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  40595d:	83 c4 10             	add    esp,0x10
  405960:	eb 53                	jmp    0x4059b5
  405962:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  405965:	8d 45 98             	lea    eax,[ebp-0x68]
  405968:	89 4d 90             	mov    DWORD PTR [ebp-0x70],ecx
  40596b:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40596e:	8d 55 e4             	lea    edx,[ebp-0x1c]
  405971:	50                   	push   eax
  405972:	51                   	push   ecx
  405973:	c7 45 88 08 00 00 00 	mov    DWORD PTR [ebp-0x78],0x8
  40597a:	89 55 a0             	mov    DWORD PTR [ebp-0x60],edx
  40597d:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  405984:	ff d6                	call   esi
  405986:	8d 55 88             	lea    edx,[ebp-0x78]
  405989:	8d 45 c8             	lea    eax,[ebp-0x38]
  40598c:	52                   	push   edx
  40598d:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405990:	50                   	push   eax
  405991:	51                   	push   ecx
  405992:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  405998:	50                   	push   eax
  405999:	ff d7                	call   edi
  40599b:	8b d0                	mov    edx,eax
  40599d:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4059a0:	ff d3                	call   ebx
  4059a2:	8d 55 b8             	lea    edx,[ebp-0x48]
  4059a5:	8d 45 c8             	lea    eax,[ebp-0x38]
  4059a8:	52                   	push   edx
  4059a9:	50                   	push   eax
  4059aa:	6a 02                	push   0x2
  4059ac:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  4059b2:	83 c4 0c             	add    esp,0xc
  4059b5:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4059b8:	8b 01                	mov    eax,DWORD PTR [ecx]
  4059ba:	85 c0                	test   eax,eax
  4059bc:	7d 0d                	jge    0x4059cb
  4059be:	8b c8                	mov    ecx,eax
  4059c0:	c1 f9 18             	sar    ecx,0x18
  4059c3:	83 e1 7f             	and    ecx,0x7f
  4059c6:	80 c9 80             	or     cl,0x80
  4059c9:	eb 13                	jmp    0x4059de
  4059cb:	25 00 00 00 ff       	and    eax,0xff000000
  4059d0:	99                   	cdq
  4059d1:	81 e2 ff ff ff 00    	and    edx,0xffffff
  4059d7:	03 c2                	add    eax,edx
  4059d9:	8b c8                	mov    ecx,eax
  4059db:	c1 f9 18             	sar    ecx,0x18
  4059de:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0
  4059e4:	3c 10                	cmp    al,0x10
  4059e6:	88 45 e0             	mov    BYTE PTR [ebp-0x20],al
  4059e9:	73 6d                	jae    0x405a58
  4059eb:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  4059ee:	52                   	push   edx
  4059ef:	68 b8 29 40 00       	push   0x4029b8
  4059f4:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4059fa:	8d 4d 98             	lea    ecx,[ebp-0x68]
  4059fd:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  405a00:	8d 55 c8             	lea    edx,[ebp-0x38]
  405a03:	8d 45 e0             	lea    eax,[ebp-0x20]
  405a06:	51                   	push   ecx
  405a07:	52                   	push   edx
  405a08:	c7 45 b8 08 00 00 00 	mov    DWORD PTR [ebp-0x48],0x8
  405a0f:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
  405a12:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  405a19:	ff d6                	call   esi
  405a1b:	8d 45 b8             	lea    eax,[ebp-0x48]
  405a1e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  405a21:	50                   	push   eax
  405a22:	8d 55 a8             	lea    edx,[ebp-0x58]
  405a25:	51                   	push   ecx
  405a26:	52                   	push   edx
  405a27:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  405a2d:	50                   	push   eax
  405a2e:	ff d7                	call   edi
  405a30:	8b d0                	mov    edx,eax
  405a32:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405a35:	ff d3                	call   ebx
  405a37:	8d 45 a8             	lea    eax,[ebp-0x58]
  405a3a:	8d 4d c8             	lea    ecx,[ebp-0x38]
  405a3d:	50                   	push   eax
  405a3e:	8d 55 b8             	lea    edx,[ebp-0x48]
  405a41:	51                   	push   ecx
  405a42:	52                   	push   edx
  405a43:	6a 03                	push   0x3
  405a45:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405a4b:	83 c4 10             	add    esp,0x10
  405a4e:	68 da 5a 40 00       	push   0x405ada
  405a53:	e9 81 00 00 00       	jmp    0x405ad9
  405a58:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  405a5b:	8d 55 98             	lea    edx,[ebp-0x68]
  405a5e:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  405a61:	8d 45 c8             	lea    eax,[ebp-0x38]
  405a64:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405a67:	52                   	push   edx
  405a68:	50                   	push   eax
  405a69:	c7 45 88 08 00 00 00 	mov    DWORD PTR [ebp-0x78],0x8
  405a70:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
  405a73:	c7 45 98 11 40 00 00 	mov    DWORD PTR [ebp-0x68],0x4011
  405a7a:	ff d6                	call   esi
  405a7c:	8d 4d 88             	lea    ecx,[ebp-0x78]
  405a7f:	8d 55 c8             	lea    edx,[ebp-0x38]
  405a82:	51                   	push   ecx
  405a83:	8d 45 b8             	lea    eax,[ebp-0x48]
  405a86:	52                   	push   edx
  405a87:	50                   	push   eax
  405a88:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  405a8e:	50                   	push   eax
  405a8f:	ff d7                	call   edi
  405a91:	8b d0                	mov    edx,eax
  405a93:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405a96:	ff d3                	call   ebx
  405a98:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405a9b:	8d 55 c8             	lea    edx,[ebp-0x38]
  405a9e:	51                   	push   ecx
  405a9f:	52                   	push   edx
  405aa0:	6a 02                	push   0x2
  405aa2:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405aa8:	83 c4 0c             	add    esp,0xc
  405aab:	68 da 5a 40 00       	push   0x405ada
  405ab0:	eb 27                	jmp    0x405ad9
  405ab2:	f6 45 fc 04          	test   BYTE PTR [ebp-0x4],0x4
  405ab6:	74 09                	je     0x405ac1
  405ab8:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405abb:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405ac1:	8d 45 a8             	lea    eax,[ebp-0x58]
  405ac4:	8d 4d b8             	lea    ecx,[ebp-0x48]
  405ac7:	50                   	push   eax
  405ac8:	8d 55 c8             	lea    edx,[ebp-0x38]
  405acb:	51                   	push   ecx
  405acc:	52                   	push   edx
  405acd:	6a 03                	push   0x3
  405acf:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405ad5:	83 c4 10             	add    esp,0x10
  405ad8:	c3                   	ret
  405ad9:	c3                   	ret
  405ada:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  405add:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  405ae0:	5f                   	pop    edi
  405ae1:	5e                   	pop    esi
  405ae2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405ae9:	5b                   	pop    ebx
  405aea:	8b e5                	mov    esp,ebp
  405aec:	5d                   	pop    ebp
  405aed:	c2 04 00             	ret    0x4
  405af0:	55                   	push   ebp
  405af1:	8b ec                	mov    ebp,esp
  405af3:	83 ec 0c             	sub    esp,0xc
  405af6:	68 66 12 40 00       	push   0x401266
  405afb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405b01:	50                   	push   eax
  405b02:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  405b09:	83 ec 54             	sub    esp,0x54
  405b0c:	53                   	push   ebx
  405b0d:	56                   	push   esi
  405b0e:	57                   	push   edi
  405b0f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  405b12:	c7 45 f8 40 12 40 00 	mov    DWORD PTR [ebp-0x8],0x401240
  405b19:	33 c0                	xor    eax,eax
  405b1b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  405b1e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  405b21:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  405b24:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  405b27:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  405b2a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  405b2d:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  405b30:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  405b33:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  405b36:	a1 38 70 40 00       	mov    eax,ds:0x407038
  405b3b:	83 c0 04             	add    eax,0x4
  405b3e:	50                   	push   eax
  405b3f:	e8 cc fb ff ff       	call   0x405710
  405b44:	8b 35 40 11 40 00    	mov    esi,DWORD PTR ds:0x401140
  405b4a:	8b d0                	mov    edx,eax
  405b4c:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405b4f:	ff d6                	call   esi
  405b51:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  405b57:	50                   	push   eax
  405b58:	83 c1 08             	add    ecx,0x8
  405b5b:	51                   	push   ecx
  405b5c:	e8 af fb ff ff       	call   0x405710
  405b61:	8b d0                	mov    edx,eax
  405b63:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405b66:	ff d6                	call   esi
  405b68:	8b 3d 48 10 40 00    	mov    edi,DWORD PTR ds:0x401048
  405b6e:	50                   	push   eax
  405b6f:	ff d7                	call   edi
  405b71:	8b d0                	mov    edx,eax
  405b73:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405b76:	ff d6                	call   esi
  405b78:	8b 15 38 70 40 00    	mov    edx,DWORD PTR ds:0x407038
  405b7e:	50                   	push   eax
  405b7f:	83 c2 0c             	add    edx,0xc
  405b82:	52                   	push   edx
  405b83:	e8 88 fb ff ff       	call   0x405710
  405b88:	8b d0                	mov    edx,eax
  405b8a:	8d 4d d8             	lea    ecx,[ebp-0x28]
  405b8d:	ff d6                	call   esi
  405b8f:	50                   	push   eax
  405b90:	ff d7                	call   edi
  405b92:	8b d0                	mov    edx,eax
  405b94:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  405b97:	ff d6                	call   esi
  405b99:	50                   	push   eax
  405b9a:	a1 38 70 40 00       	mov    eax,ds:0x407038
  405b9f:	83 c0 10             	add    eax,0x10
  405ba2:	50                   	push   eax
  405ba3:	e8 68 fb ff ff       	call   0x405710
  405ba8:	8b d0                	mov    edx,eax
  405baa:	8d 4d d0             	lea    ecx,[ebp-0x30]
  405bad:	ff d6                	call   esi
  405baf:	50                   	push   eax
  405bb0:	ff d7                	call   edi
  405bb2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  405bb5:	8d 55 b0             	lea    edx,[ebp-0x50]
  405bb8:	51                   	push   ecx
  405bb9:	52                   	push   edx
  405bba:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  405bbd:	c7 45 c0 08 00 00 00 	mov    DWORD PTR [ebp-0x40],0x8
  405bc4:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  405bca:	8d 45 b0             	lea    eax,[ebp-0x50]
  405bcd:	50                   	push   eax
  405bce:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  405bd4:	8b d0                	mov    edx,eax
  405bd6:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405bd9:	ff d6                	call   esi
  405bdb:	8d 4d d0             	lea    ecx,[ebp-0x30]
  405bde:	8d 55 d4             	lea    edx,[ebp-0x2c]
  405be1:	51                   	push   ecx
  405be2:	8d 45 d8             	lea    eax,[ebp-0x28]
  405be5:	52                   	push   edx
  405be6:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405be9:	50                   	push   eax
  405bea:	51                   	push   ecx
  405beb:	8d 55 e0             	lea    edx,[ebp-0x20]
  405bee:	8d 45 e4             	lea    eax,[ebp-0x1c]
  405bf1:	52                   	push   edx
  405bf2:	50                   	push   eax
  405bf3:	6a 06                	push   0x6
  405bf5:	ff 15 0c 11 40 00    	call   DWORD PTR ds:0x40110c
  405bfb:	8d 4d b0             	lea    ecx,[ebp-0x50]
  405bfe:	8d 55 c0             	lea    edx,[ebp-0x40]
  405c01:	51                   	push   ecx
  405c02:	52                   	push   edx
  405c03:	6a 02                	push   0x2
  405c05:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405c0b:	83 c4 28             	add    esp,0x28
  405c0e:	68 59 5c 40 00       	push   0x405c59
  405c13:	eb 43                	jmp    0x405c58
  405c15:	f6 45 fc 04          	test   BYTE PTR [ebp-0x4],0x4
  405c19:	74 09                	je     0x405c24
  405c1b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405c1e:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405c24:	8d 45 d0             	lea    eax,[ebp-0x30]
  405c27:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  405c2a:	50                   	push   eax
  405c2b:	8d 55 d8             	lea    edx,[ebp-0x28]
  405c2e:	51                   	push   ecx
  405c2f:	8d 45 dc             	lea    eax,[ebp-0x24]
  405c32:	52                   	push   edx
  405c33:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405c36:	50                   	push   eax
  405c37:	8d 55 e4             	lea    edx,[ebp-0x1c]
  405c3a:	51                   	push   ecx
  405c3b:	52                   	push   edx
  405c3c:	6a 06                	push   0x6
  405c3e:	ff 15 0c 11 40 00    	call   DWORD PTR ds:0x40110c
  405c44:	8d 45 b0             	lea    eax,[ebp-0x50]
  405c47:	8d 4d c0             	lea    ecx,[ebp-0x40]
  405c4a:	50                   	push   eax
  405c4b:	51                   	push   ecx
  405c4c:	6a 02                	push   0x2
  405c4e:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024
  405c54:	83 c4 28             	add    esp,0x28
  405c57:	c3                   	ret
  405c58:	c3                   	ret
  405c59:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  405c5c:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  405c5f:	5f                   	pop    edi
  405c60:	5e                   	pop    esi
  405c61:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405c68:	5b                   	pop    ebx
  405c69:	8b e5                	mov    esp,ebp
  405c6b:	5d                   	pop    ebp
  405c6c:	c3                   	ret
  405c6d:	90                   	nop
  405c6e:	90                   	nop
  405c6f:	90                   	nop
  405c70:	55                   	push   ebp
  405c71:	8b ec                	mov    ebp,esp
  405c73:	83 ec 0c             	sub    esp,0xc
  405c76:	68 66 12 40 00       	push   0x401266
  405c7b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405c81:	50                   	push   eax
  405c82:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  405c89:	83 ec 1c             	sub    esp,0x1c
  405c8c:	53                   	push   ebx
  405c8d:	56                   	push   esi
  405c8e:	57                   	push   edi
  405c8f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  405c92:	c7 45 f8 50 12 40 00 	mov    DWORD PTR [ebp-0x8],0x401250
  405c99:	33 f6                	xor    esi,esi
  405c9b:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
  405c9e:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  405ca1:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
  405ca4:	89 75 dc             	mov    DWORD PTR [ebp-0x24],esi
  405ca7:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
  405caa:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  405cad:	56                   	push   esi
  405cae:	e8 bd df ff ff       	call   0x403c70
  405cb3:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  405cb6:	8d 45 dc             	lea    eax,[ebp-0x24]
  405cb9:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405cbc:	50                   	push   eax
  405cbd:	51                   	push   ecx
  405cbe:	ff 15 14 10 40 00    	call   DWORD PTR ds:0x401014
  405cc4:	e8 97 00 00 00       	call   0x405d60
  405cc9:	8b 16                	mov    edx,DWORD PTR [esi]
  405ccb:	52                   	push   edx
  405ccc:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  405cd2:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  405cd5:	8d 45 e8             	lea    eax,[ebp-0x18]
  405cd8:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405cdb:	50                   	push   eax
  405cdc:	51                   	push   ecx
  405cdd:	e8 be dc ff ff       	call   0x4039a0
  405ce2:	8b 35 40 11 40 00    	mov    esi,DWORD PTR ds:0x401140
  405ce8:	8b d0                	mov    edx,eax
  405cea:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405ced:	ff d6                	call   esi
  405cef:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405cf2:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405cf8:	e8 13 f8 ff ff       	call   0x405510
  405cfd:	e8 ee fd ff ff       	call   0x405af0
  405d02:	8b d0                	mov    edx,eax
  405d04:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405d07:	ff d6                	call   esi
  405d09:	68 40 5d 40 00       	push   0x405d40
  405d0e:	eb 19                	jmp    0x405d29
  405d10:	f6 45 fc 04          	test   BYTE PTR [ebp-0x4],0x4
  405d14:	74 09                	je     0x405d1f
  405d16:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405d19:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405d1f:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405d22:	ff 15 5c 11 40 00    	call   DWORD PTR ds:0x40115c
  405d28:	c3                   	ret
  405d29:	8b 3d 5c 10 40 00    	mov    edi,DWORD PTR ds:0x40105c
  405d2f:	8d 55 d8             	lea    edx,[ebp-0x28]
  405d32:	33 f6                	xor    esi,esi
  405d34:	52                   	push   edx
  405d35:	56                   	push   esi
  405d36:	ff d7                	call   edi
  405d38:	8d 45 e8             	lea    eax,[ebp-0x18]
  405d3b:	50                   	push   eax
  405d3c:	56                   	push   esi
  405d3d:	ff d7                	call   edi
  405d3f:	c3                   	ret
  405d40:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  405d43:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  405d46:	5f                   	pop    edi
  405d47:	5e                   	pop    esi
  405d48:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405d4f:	5b                   	pop    ebx
  405d50:	8b e5                	mov    esp,ebp
  405d52:	5d                   	pop    ebp
  405d53:	c2 04 00             	ret    0x4
  405d56:	90                   	nop
  405d57:	90                   	nop
  405d58:	90                   	nop
  405d59:	90                   	nop
  405d5a:	90                   	nop
  405d5b:	90                   	nop
  405d5c:	90                   	nop
  405d5d:	90                   	nop
  405d5e:	90                   	nop
  405d5f:	90                   	nop
  405d60:	55                   	push   ebp
  405d61:	8b ec                	mov    ebp,esp
  405d63:	83 e4 f8             	and    esp,0xfffffff8
  405d66:	83 ec 08             	sub    esp,0x8
  405d69:	8d 44 24 00          	lea    eax,[esp+0x0]
  405d6d:	c7 05 24 70 40 00 00 	mov    DWORD PTR ds:0x407024,0x0
  405d74:	00 00 00 
  405d77:	50                   	push   eax
  405d78:	c7 44 24 04 00 00 40 	mov    DWORD PTR [esp+0x4],0xc0400000
  405d7f:	c0 
  405d80:	c7 44 24 08 48 d1 d9 	mov    DWORD PTR [esp+0x8],0x41d9d148
  405d87:	41 
  405d88:	e8 13 f7 ff ff       	call   0x4054a0
  405d8d:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  405d93:	8d 54 24 00          	lea    edx,[esp+0x0]
  405d97:	52                   	push   edx
  405d98:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  405d9b:	c7 44 24 04 00 00 20 	mov    DWORD PTR [esp+0x4],0x71200000
  405da2:	71 
  405da3:	c7 44 24 08 b5 f9 ed 	mov    DWORD PTR [esp+0x8],0x41edf9b5
  405daa:	41 
  405dab:	e8 f0 f6 ff ff       	call   0x4054a0
  405db0:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  405db6:	8d 54 24 00          	lea    edx,[esp+0x0]
  405dba:	52                   	push   edx
  405dbb:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  405dbe:	c7 44 24 04 00 00 c0 	mov    DWORD PTR [esp+0x4],0x9fc00000
  405dc5:	9f 
  405dc6:	c7 44 24 08 5b 17 e3 	mov    DWORD PTR [esp+0x8],0x41e3175b
  405dcd:	41 
  405dce:	e8 cd f6 ff ff       	call   0x4054a0
  405dd3:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  405dd9:	8d 54 24 00          	lea    edx,[esp+0x0]
  405ddd:	52                   	push   edx
  405dde:	89 41 0c             	mov    DWORD PTR [ecx+0xc],eax
  405de1:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x76000000
  405de8:	76 
  405de9:	c7 44 24 08 54 32 b0 	mov    DWORD PTR [esp+0x8],0x41b03254
  405df0:	41 
  405df1:	e8 aa f6 ff ff       	call   0x4054a0
  405df6:	8b 0d 38 70 40 00    	mov    ecx,DWORD PTR ds:0x407038
  405dfc:	89 41 10             	mov    DWORD PTR [ecx+0x10],eax
  405dff:	8b e5                	mov    esp,ebp
  405e01:	5d                   	pop    ebp
  405e02:	c3                   	ret
  405e03:	90                   	nop
  405e04:	90                   	nop
  405e05:	90                   	nop
  405e06:	90                   	nop
  405e07:	90                   	nop
  405e08:	90                   	nop
  405e09:	90                   	nop
  405e0a:	90                   	nop
  405e0b:	90                   	nop
  405e0c:	90                   	nop
  405e0d:	90                   	nop
  405e0e:	90                   	nop
  405e0f:	90                   	nop
  405e10:	9e                   	sahf
  405e11:	9e                   	sahf
  405e12:	9e                   	sahf
  405e13:	9e                   	sahf
  405e14:	00 10                	add    BYTE PTR [eax],dl
  405e16:	40                   	inc    eax
  405e17:	00 a0 5f 40 00 00    	add    BYTE PTR [eax+0x405f],ah
  405e1d:	00 00                	add    BYTE PTR [eax],al
	...
