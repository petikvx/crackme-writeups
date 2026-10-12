  401770:	a1 08 92 40 00       	mov    eax,ds:0x409208
  401775:	50                   	push   eax
  401776:	e8 85 05 00 00       	call   0x401d00
  40177b:	83 c4 04             	add    esp,0x4
  40177e:	8b 0d 78 92 40 00    	mov    ecx,DWORD PTR ds:0x409278
  401784:	ff d1                	call   ecx
  401786:	8b 0d 7c 92 40 00    	mov    ecx,DWORD PTR ds:0x40927c
  40178c:	ff d1                	call   ecx
  40178e:	a1 4c 92 40 00       	mov    eax,ds:0x40924c
  401793:	6a 40                	push   0x40
  401795:	68 0c 92 40 00       	push   0x40920c
  40179a:	68 4c 90 40 00       	push   0x40904c
  40179f:	50                   	push   eax
  4017a0:	8b 0d 68 92 40 00    	mov    ecx,DWORD PTR ds:0x409268
  4017a6:	3e ff 11             	notrack call DWORD PTR [ecx]
  4017a9:	8b 0d 78 92 40 00    	mov    ecx,DWORD PTR ds:0x409278
  4017af:	ff d1                	call   ecx
  4017b1:	8b 0d 7c 92 40 00    	mov    ecx,DWORD PTR ds:0x40927c
  4017b7:	ff d1                	call   ecx
  4017b9:	8b 0d 08 92 40 00    	mov    ecx,DWORD PTR ds:0x409208
  4017bf:	51                   	push   ecx
  4017c0:	e8 7b 09 00 00       	call   0x402140
  4017c5:	83 c4 04             	add    esp,0x4
  4017c8:	c3                   	ret
  4017c9:	00 00                	add    BYTE PTR [eax],al
	...
