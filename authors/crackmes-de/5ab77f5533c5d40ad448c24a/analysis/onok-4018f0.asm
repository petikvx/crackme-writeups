  4018f0:	55                   	push   ebp
  4018f1:	8b ec                	mov    ebp,esp
  4018f3:	81 ec 24 01 00 00    	sub    esp,0x124
  4018f9:	53                   	push   ebx
  4018fa:	56                   	push   esi
  4018fb:	57                   	push   edi
  4018fc:	51                   	push   ecx
  4018fd:	8d bd dc fe ff ff    	lea    edi,[ebp-0x124]
  401903:	b9 49 00 00 00       	mov    ecx,0x49
  401908:	b8 cc cc cc cc       	mov    eax,0xcccccccc
  40190d:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  40190f:	59                   	pop    ecx
  401910:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  401913:	c7 85 2c ff ff ff 00 	mov    DWORD PTR [ebp-0xd4],0x0
  40191a:	00 00 00 
  40191d:	c7 85 28 ff ff ff 00 	mov    DWORD PTR [ebp-0xd8],0x0
  401924:	00 00 00 
  401927:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [ebp-0xdc],0x0
  40192e:	00 00 00 
  401931:	c7 85 20 ff ff ff 00 	mov    DWORD PTR [ebp-0xe0],0x0
  401938:	00 00 00 
  40193b:	6a 64                	push   0x64
  40193d:	8d 45 98             	lea    eax,[ebp-0x68]
  401940:	50                   	push   eax
  401941:	68 e9 03 00 00       	push   0x3e9
  401946:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  401949:	e8 83 36 05 00       	call   0x454fd1
  40194e:	6a 32                	push   0x32
  401950:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  401956:	51                   	push   ecx
  401957:	68 ea 03 00 00       	push   0x3ea
  40195c:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  40195f:	e8 6d 36 05 00       	call   0x454fd1
  401964:	8d 55 98             	lea    edx,[ebp-0x68]
  401967:	52                   	push   edx
  401968:	e8 13 17 00 00       	call   0x403080
  40196d:	83 c4 04             	add    esp,0x4
  401970:	89 85 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],eax
  401976:	83 bd 28 ff ff ff 04 	cmp    DWORD PTR [ebp-0xd8],0x4
  40197d:	7d 17                	jge    0x401996
  40197f:	68 d0 23 51 00       	push   0x5123d0
  401984:	68 e9 03 00 00       	push   0x3e9
  401989:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  40198c:	e8 c8 37 05 00       	call   0x455159
  401991:	e9 99 01 00 00       	jmp    0x401b2f
  401996:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [ebp-0xe4],0x0
  40199d:	00 00 00 
  4019a0:	eb 0f                	jmp    0x4019b1
  4019a2:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [ebp-0xe4]
  4019a8:	83 c0 01             	add    eax,0x1
  4019ab:	89 85 1c ff ff ff    	mov    DWORD PTR [ebp-0xe4],eax
  4019b1:	8b 8d 1c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xe4]
  4019b7:	3b 8d 28 ff ff ff    	cmp    ecx,DWORD PTR [ebp-0xd8]
  4019bd:	7d 1b                	jge    0x4019da
  4019bf:	8b 95 1c ff ff ff    	mov    edx,DWORD PTR [ebp-0xe4]
  4019c5:	0f be 44 15 98       	movsx  eax,BYTE PTR [ebp+edx*1-0x68]
  4019ca:	8b 8d 2c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd4]
  4019d0:	03 c8                	add    ecx,eax
  4019d2:	89 8d 2c ff ff ff    	mov    DWORD PTR [ebp-0xd4],ecx
  4019d8:	eb c8                	jmp    0x4019a2
  4019da:	33 db                	xor    ebx,ebx
  4019dc:	8b 9d 2c ff ff ff    	mov    ebx,DWORD PTR [ebp-0xd4]
  4019e2:	03 9d 28 ff ff ff    	add    ebx,DWORD PTR [ebp-0xd8]
  4019e8:	33 9d 28 ff ff ff    	xor    ebx,DWORD PTR [ebp-0xd8]
  4019ee:	d1 eb                	shr    ebx,1
  4019f0:	01 9d 24 ff ff ff    	add    DWORD PTR [ebp-0xdc],ebx
  4019f6:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd8]
  4019fc:	83 ea 02             	sub    edx,0x2
  4019ff:	89 95 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],edx
  401a05:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  401a0b:	2b 85 20 ff ff ff    	sub    eax,DWORD PTR [ebp-0xe0]
  401a11:	89 85 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],eax
  401a17:	8b 8d 24 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xdc]
  401a1d:	81 e9 a8 61 00 00    	sub    ecx,0x61a8
  401a23:	89 8d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ecx
  401a29:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd8]
  401a2f:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  401a35:	8d 4c 10 04          	lea    ecx,[eax+edx*1+0x4]
  401a39:	89 8d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ecx
  401a3f:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd8]
  401a45:	83 ea 02             	sub    edx,0x2
  401a48:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  401a4e:	2b c2                	sub    eax,edx
  401a50:	89 85 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],eax
  401a56:	8b 8d 28 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd8]
  401a5c:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [ebp-0xdc]
  401a62:	8d 44 0a 02          	lea    eax,[edx+ecx*1+0x2]
  401a66:	89 85 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],eax
  401a6c:	8b 8d 24 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xdc]
  401a72:	81 e9 50 c3 00 00    	sub    ecx,0xc350
  401a78:	89 8d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ecx
  401a7e:	8b 9d 24 ff ff ff    	mov    ebx,DWORD PTR [ebp-0xdc]
  401a84:	d1 c3                	rol    ebx,1
  401a86:	c1 eb 02             	shr    ebx,0x2
  401a89:	89 9d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ebx
  401a8f:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [ebp-0xdc]
  401a95:	81 ea 80 f0 fa 02    	sub    edx,0x2faf080
  401a9b:	89 95 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],edx
  401aa1:	8b 9d 2c ff ff ff    	mov    ebx,DWORD PTR [ebp-0xd4]
  401aa7:	83 eb 41             	sub    ebx,0x41
  401aaa:	01 9d 24 ff ff ff    	add    DWORD PTR [ebp-0xdc],ebx
  401ab0:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  401ab6:	50                   	push   eax
  401ab7:	68 cc 23 51 00       	push   0x5123cc
  401abc:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  401ac2:	51                   	push   ecx
  401ac3:	e8 b8 14 00 00       	call   0x402f80
  401ac8:	83 c4 0c             	add    esp,0xc
  401acb:	8b f4                	mov    esi,esp
  401acd:	68 c8 23 51 00       	push   0x5123c8
  401ad2:	8d 95 64 ff ff ff    	lea    edx,[ebp-0x9c]
  401ad8:	52                   	push   edx
  401ad9:	ff 15 f4 34 53 00    	call   DWORD PTR ds:0x5334f4
  401adf:	3b f4                	cmp    esi,esp
  401ae1:	e8 ca 0d 00 00       	call   0x4028b0
  401ae6:	8b f4                	mov    esi,esp
  401ae8:	68 c4 23 51 00       	push   0x5123c4
  401aed:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  401af3:	50                   	push   eax
  401af4:	ff 15 f4 34 53 00    	call   DWORD PTR ds:0x5334f4
  401afa:	3b f4                	cmp    esi,esp
  401afc:	e8 af 0d 00 00       	call   0x4028b0
  401b01:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  401b07:	51                   	push   ecx
  401b08:	8d 95 30 ff ff ff    	lea    edx,[ebp-0xd0]
  401b0e:	52                   	push   edx
  401b0f:	e8 dc 13 00 00       	call   0x402ef0
  401b14:	83 c4 08             	add    esp,0x8
  401b17:	85 c0                	test   eax,eax
  401b19:	75 14                	jne    0x401b2f
  401b1b:	6a 00                	push   0x0
  401b1d:	68 bc 23 51 00       	push   0x5123bc
  401b22:	68 74 23 51 00       	push   0x512374
  401b27:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  401b2a:	e8 73 03 05 00       	call   0x451ea2
  401b2f:	5f                   	pop    edi
  401b30:	5e                   	pop    esi
  401b31:	5b                   	pop    ebx
  401b32:	81 c4 24 01 00 00    	add    esp,0x124
  401b38:	3b ec                	cmp    ebp,esp
  401b3a:	e8 71 0d 00 00       	call   0x4028b0
  401b3f:	8b e5                	mov    esp,ebp
  401b41:	5d                   	pop    ebp
  401b42:	c3                   	ret
