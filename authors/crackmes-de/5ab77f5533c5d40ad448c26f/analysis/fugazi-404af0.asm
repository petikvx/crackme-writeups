00404af0 <_fugazi>:
  404af0:	55                   	push   ebp
  404af1:	89 e5                	mov    ebp,esp
  404af3:	57                   	push   edi
  404af4:	bf 86 70 40 00       	mov    edi,0x407086
  404af9:	56                   	push   esi
  404afa:	be 3c 89 40 00       	mov    esi,0x40893c
  404aff:	53                   	push   ebx
  404b00:	83 ec 4c             	sub    esp,0x4c
  404b03:	8b 1d 8c 84 40 00    	mov    ebx,DWORD PTR ds:0x40848c
  404b09:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  404b0d:	8b 0d 84 84 40 00    	mov    ecx,DWORD PTR ds:0x408484
  404b13:	bf 0a 00 00 00       	mov    edi,0xa
  404b18:	c7 04 24 30 88 40 00 	mov    DWORD PTR [esp],0x408830
  404b1f:	8b 15 80 84 40 00    	mov    edx,DWORD PTR ds:0x408480
  404b25:	a1 88 84 40 00       	mov    eax,ds:0x408488
  404b2a:	89 5c 24 14          	mov    DWORD PTR [esp+0x14],ebx
  404b2e:	bb 38 89 40 00       	mov    ebx,0x408938
  404b33:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  404b37:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  404b3b:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  404b3f:	e8 bc 0d 00 00       	call   405900 <_wsprintfA>
  404b44:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  404b48:	b9 30 89 40 00       	mov    ecx,0x408930
  404b4d:	ba 86 70 40 00       	mov    edx,0x407086
  404b52:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  404b56:	b8 34 89 40 00       	mov    eax,0x408934
  404b5b:	be 08 00 00 00       	mov    esi,0x8
  404b60:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404b64:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  404b68:	bb 40 89 40 00       	mov    ebx,0x408940
  404b6d:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  404b71:	c7 04 24 a0 85 40 00 	mov    DWORD PTR [esp],0x4085a0
  404b78:	e8 93 0c 00 00       	call   405810 <_sscanf>
  404b7d:	89 3d 94 84 40 00    	mov    DWORD PTR ds:0x408494,edi
  404b83:	c7 04 24 58 00 00 00 	mov    DWORD PTR [esp],0x58
  404b8a:	e8 c1 0c 00 00       	call   405850 <_malloc>
  404b8f:	a3 90 84 40 00       	mov    ds:0x408490,eax
  404b94:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  404b98:	be 30 89 40 00       	mov    esi,0x408930
  404b9d:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  404ba1:	c7 04 24 90 84 40 00 	mov    DWORD PTR [esp],0x408490
  404ba8:	e8 d3 c7 ff ff       	call   401380 <_doa_key>
  404bad:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  404bb4:	a1 90 84 40 00       	mov    eax,ds:0x408490
  404bb9:	8b 0d 94 84 40 00    	mov    ecx,DWORD PTR ds:0x408494
  404bbf:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  404bc2:	89 c7                	mov    edi,eax
  404bc4:	83 c7 08             	add    edi,0x8
  404bc7:	89 4d e0             	mov    DWORD PTR [ebp-0x20],ecx
  404bca:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
  404bcd:	8d 5c 12 fe          	lea    ebx,[edx+edx*1-0x2]
  404bd1:	85 db                	test   ebx,ebx
  404bd3:	0f 88 d0 02 00 00    	js     404ea9 <_fugazi+0x3b9>
  404bd9:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404bdc:	8b 06                	mov    eax,DWORD PTR [esi]
  404bde:	89 f6                	mov    esi,esi
  404be0:	8b 4c 9f 04          	mov    ecx,DWORD PTR [edi+ebx*4+0x4]
  404be4:	29 ca                	sub    edx,ecx
  404be6:	89 c1                	mov    ecx,eax
  404be8:	83 e1 1f             	and    ecx,0x1f
  404beb:	d3 ca                	ror    edx,cl
  404bed:	31 c2                	xor    edx,eax
  404bef:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404bf2:	8b 0c 9f             	mov    ecx,DWORD PTR [edi+ebx*4]
  404bf5:	29 c8                	sub    eax,ecx
  404bf7:	89 d1                	mov    ecx,edx
  404bf9:	83 e1 1f             	and    ecx,0x1f
  404bfc:	d3 c8                	ror    eax,cl
  404bfe:	31 d0                	xor    eax,edx
  404c00:	83 eb 02             	sub    ebx,0x2
  404c03:	89 06                	mov    DWORD PTR [esi],eax
  404c05:	79 d9                	jns    404be0 <_fugazi+0xf0>
  404c07:	ff 45 f0             	inc    DWORD PTR [ebp-0x10]
  404c0a:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  404c0d:	8b 19                	mov    ebx,DWORD PTR [ecx]
  404c0f:	29 d8                	sub    eax,ebx
  404c11:	89 06                	mov    DWORD PTR [esi],eax
  404c13:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
  404c16:	29 c2                	sub    edx,eax
  404c18:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404c1b:	83 c6 08             	add    esi,0x8
  404c1e:	83 7d f0 02          	cmp    DWORD PTR [ebp-0x10],0x2
  404c22:	7c a6                	jl     404bca <_fugazi+0xda>
  404c24:	c7 04 24 58 00 00 00 	mov    DWORD PTR [esp],0x58
  404c2b:	b9 0a 00 00 00       	mov    ecx,0xa
  404c30:	bf 08 00 00 00       	mov    edi,0x8
  404c35:	89 0d d4 87 40 00    	mov    DWORD PTR ds:0x4087d4,ecx
  404c3b:	be a0 86 40 00       	mov    esi,0x4086a0
  404c40:	e8 0b 0c 00 00       	call   405850 <_malloc>
  404c45:	a3 d0 87 40 00       	mov    ds:0x4087d0,eax
  404c4a:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  404c4e:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  404c52:	be 30 89 40 00       	mov    esi,0x408930
  404c57:	c7 04 24 d0 87 40 00 	mov    DWORD PTR [esp],0x4087d0
  404c5e:	e8 1d c7 ff ff       	call   401380 <_doa_key>
  404c63:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
  404c6a:	a1 d0 87 40 00       	mov    eax,ds:0x4087d0
  404c6f:	8b 15 d4 87 40 00    	mov    edx,DWORD PTR ds:0x4087d4
  404c75:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  404c78:	89 c7                	mov    edi,eax
  404c7a:	83 c7 08             	add    edi,0x8
  404c7d:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  404c80:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  404c83:	8d 5c 12 fe          	lea    ebx,[edx+edx*1-0x2]
  404c87:	85 db                	test   ebx,ebx
  404c89:	0f 88 35 02 00 00    	js     404ec4 <_fugazi+0x3d4>
  404c8f:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404c92:	8b 06                	mov    eax,DWORD PTR [esi]
  404c94:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404c9a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  404ca0:	8b 4c 9f 04          	mov    ecx,DWORD PTR [edi+ebx*4+0x4]
  404ca4:	29 ca                	sub    edx,ecx
  404ca6:	89 c1                	mov    ecx,eax
  404ca8:	83 e1 1f             	and    ecx,0x1f
  404cab:	d3 ca                	ror    edx,cl
  404cad:	31 c2                	xor    edx,eax
  404caf:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404cb2:	8b 0c 9f             	mov    ecx,DWORD PTR [edi+ebx*4]
  404cb5:	29 c8                	sub    eax,ecx
  404cb7:	89 d1                	mov    ecx,edx
  404cb9:	83 e1 1f             	and    ecx,0x1f
  404cbc:	d3 c8                	ror    eax,cl
  404cbe:	31 d0                	xor    eax,edx
  404cc0:	83 eb 02             	sub    ebx,0x2
  404cc3:	89 06                	mov    DWORD PTR [esi],eax
  404cc5:	79 d9                	jns    404ca0 <_fugazi+0x1b0>
  404cc7:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  404cca:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  404ccd:	8b 19                	mov    ebx,DWORD PTR [ecx]
  404ccf:	29 d8                	sub    eax,ebx
  404cd1:	89 06                	mov    DWORD PTR [esi],eax
  404cd3:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
  404cd6:	29 da                	sub    edx,ebx
  404cd8:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404cdb:	83 c6 08             	add    esi,0x8
  404cde:	83 7d ec 02          	cmp    DWORD PTR [ebp-0x14],0x2
  404ce2:	7c 9c                	jl     404c80 <_fugazi+0x190>
  404ce4:	c7 04 24 58 00 00 00 	mov    DWORD PTR [esp],0x58
  404ceb:	b9 0a 00 00 00       	mov    ecx,0xa
  404cf0:	bf 08 00 00 00       	mov    edi,0x8
  404cf5:	89 0d 64 84 40 00    	mov    DWORD PTR ds:0x408464,ecx
  404cfb:	be b0 86 40 00       	mov    esi,0x4086b0
  404d00:	e8 4b 0b 00 00       	call   405850 <_malloc>
  404d05:	a3 60 84 40 00       	mov    ds:0x408460,eax
  404d0a:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  404d0e:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  404d12:	be 30 89 40 00       	mov    esi,0x408930
  404d17:	c7 04 24 60 84 40 00 	mov    DWORD PTR [esp],0x408460
  404d1e:	e8 5d c6 ff ff       	call   401380 <_doa_key>
  404d23:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  404d2a:	8b 15 60 84 40 00    	mov    edx,DWORD PTR ds:0x408460
  404d30:	a1 64 84 40 00       	mov    eax,ds:0x408464
  404d35:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
  404d38:	89 d7                	mov    edi,edx
  404d3a:	83 c7 08             	add    edi,0x8
  404d3d:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  404d40:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  404d43:	8d 5c 00 fe          	lea    ebx,[eax+eax*1-0x2]
  404d47:	85 db                	test   ebx,ebx
  404d49:	0f 88 6b 01 00 00    	js     404eba <_fugazi+0x3ca>
  404d4f:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404d52:	8b 06                	mov    eax,DWORD PTR [esi]
  404d54:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404d5a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  404d60:	8b 4c 9f 04          	mov    ecx,DWORD PTR [edi+ebx*4+0x4]
  404d64:	29 ca                	sub    edx,ecx
  404d66:	89 c1                	mov    ecx,eax
  404d68:	83 e1 1f             	and    ecx,0x1f
  404d6b:	d3 ca                	ror    edx,cl
  404d6d:	31 c2                	xor    edx,eax
  404d6f:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404d72:	8b 0c 9f             	mov    ecx,DWORD PTR [edi+ebx*4]
  404d75:	29 c8                	sub    eax,ecx
  404d77:	89 d1                	mov    ecx,edx
  404d79:	83 e1 1f             	and    ecx,0x1f
  404d7c:	d3 c8                	ror    eax,cl
  404d7e:	31 d0                	xor    eax,edx
  404d80:	83 eb 02             	sub    ebx,0x2
  404d83:	89 06                	mov    DWORD PTR [esi],eax
  404d85:	79 d9                	jns    404d60 <_fugazi+0x270>
  404d87:	ff 45 e8             	inc    DWORD PTR [ebp-0x18]
  404d8a:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  404d8d:	8b 19                	mov    ebx,DWORD PTR [ecx]
  404d8f:	29 d8                	sub    eax,ebx
  404d91:	89 06                	mov    DWORD PTR [esi],eax
  404d93:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
  404d96:	29 da                	sub    edx,ebx
  404d98:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404d9b:	83 c6 08             	add    esi,0x8
  404d9e:	83 7d e8 02          	cmp    DWORD PTR [ebp-0x18],0x2
  404da2:	7c 9c                	jl     404d40 <_fugazi+0x250>
  404da4:	c7 04 24 58 00 00 00 	mov    DWORD PTR [esp],0x58
  404dab:	b9 0a 00 00 00       	mov    ecx,0xa
  404db0:	bf 08 00 00 00       	mov    edi,0x8
  404db5:	89 0d e4 87 40 00    	mov    DWORD PTR ds:0x4087e4,ecx
  404dbb:	be 20 88 40 00       	mov    esi,0x408820
  404dc0:	e8 8b 0a 00 00       	call   405850 <_malloc>
  404dc5:	a3 e0 87 40 00       	mov    ds:0x4087e0,eax
  404dca:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  404dce:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  404dd2:	be 30 89 40 00       	mov    esi,0x408930
  404dd7:	c7 04 24 e0 87 40 00 	mov    DWORD PTR [esp],0x4087e0
  404dde:	e8 9d c5 ff ff       	call   401380 <_doa_key>
  404de3:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  404dea:	a1 e0 87 40 00       	mov    eax,ds:0x4087e0
  404def:	8b 15 e4 87 40 00    	mov    edx,DWORD PTR ds:0x4087e4
  404df5:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  404df8:	89 c7                	mov    edi,eax
  404dfa:	83 c7 08             	add    edi,0x8
  404dfd:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
  404e00:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404e03:	8d 5c 12 fe          	lea    ebx,[edx+edx*1-0x2]
  404e07:	85 db                	test   ebx,ebx
  404e09:	0f 88 a4 00 00 00    	js     404eb3 <_fugazi+0x3c3>
  404e0f:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404e12:	8b 06                	mov    eax,DWORD PTR [esi]
  404e14:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404e1a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  404e20:	8b 4c 9f 04          	mov    ecx,DWORD PTR [edi+ebx*4+0x4]
  404e24:	29 ca                	sub    edx,ecx
  404e26:	89 c1                	mov    ecx,eax
  404e28:	83 e1 1f             	and    ecx,0x1f
  404e2b:	d3 ca                	ror    edx,cl
  404e2d:	31 c2                	xor    edx,eax
  404e2f:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404e32:	8b 0c 9f             	mov    ecx,DWORD PTR [edi+ebx*4]
  404e35:	29 c8                	sub    eax,ecx
  404e37:	89 d1                	mov    ecx,edx
  404e39:	83 e1 1f             	and    ecx,0x1f
  404e3c:	d3 c8                	ror    eax,cl
  404e3e:	31 d0                	xor    eax,edx
  404e40:	83 eb 02             	sub    ebx,0x2
  404e43:	89 06                	mov    DWORD PTR [esi],eax
  404e45:	79 d9                	jns    404e20 <_fugazi+0x330>
  404e47:	ff 45 e4             	inc    DWORD PTR [ebp-0x1c]
  404e4a:	8b 4d c4             	mov    ecx,DWORD PTR [ebp-0x3c]
  404e4d:	8b 19                	mov    ebx,DWORD PTR [ecx]
  404e4f:	29 d8                	sub    eax,ebx
  404e51:	89 06                	mov    DWORD PTR [esi],eax
  404e53:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
  404e56:	29 da                	sub    edx,ebx
  404e58:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
  404e5b:	83 c6 08             	add    esi,0x8
  404e5e:	83 7d e4 02          	cmp    DWORD PTR [ebp-0x1c],0x2
  404e62:	7c 9c                	jl     404e00 <_fugazi+0x310>
  404e64:	c7 04 24 a0 84 40 00 	mov    DWORD PTR [esp],0x4084a0
  404e6b:	8b 3d 34 89 40 00    	mov    edi,DWORD PTR ds:0x408934
  404e71:	b8 86 70 40 00       	mov    eax,0x407086
  404e76:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404e7a:	8b 35 30 89 40 00    	mov    esi,DWORD PTR ds:0x408930
  404e80:	8b 0d 3c 89 40 00    	mov    ecx,DWORD PTR ds:0x40893c
  404e86:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
  404e8a:	8b 15 38 89 40 00    	mov    edx,DWORD PTR ds:0x408938
  404e90:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  404e94:	89 4c 24 14          	mov    DWORD PTR [esp+0x14],ecx
  404e98:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  404e9c:	e8 5f 0a 00 00       	call   405900 <_wsprintfA>
  404ea1:	83 c4 4c             	add    esp,0x4c
  404ea4:	5b                   	pop    ebx
  404ea5:	5e                   	pop    esi
  404ea6:	5f                   	pop    edi
  404ea7:	5d                   	pop    ebp
  404ea8:	c3                   	ret
  404ea9:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404eac:	8b 06                	mov    eax,DWORD PTR [esi]
  404eae:	e9 54 fd ff ff       	jmp    404c07 <_fugazi+0x117>
  404eb3:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404eb6:	8b 06                	mov    eax,DWORD PTR [esi]
  404eb8:	eb 8d                	jmp    404e47 <_fugazi+0x357>
  404eba:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404ebd:	8b 06                	mov    eax,DWORD PTR [esi]
  404ebf:	e9 c3 fe ff ff       	jmp    404d87 <_fugazi+0x297>
  404ec4:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  404ec7:	8b 06                	mov    eax,DWORD PTR [esi]
  404ec9:	e9 f9 fd ff ff       	jmp    404cc7 <_fugazi+0x1d7>
  404ece:	89 f6                	mov    esi,esi

00404ed0 <_SundaysRuin>:
