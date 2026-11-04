  4012e8:	be 08 20 40 00       	mov    esi,0x402008
  4012ed:	b8 01 00 00 00       	mov    eax,0x1
  4012f2:	80 7e 04 2d          	cmp    BYTE PTR [esi+0x4],0x2d
  4012f6:	75 64                	jne    0x40135c
  4012f8:	80 7e 09 2d          	cmp    BYTE PTR [esi+0x9],0x2d
  4012fc:	75 5e                	jne    0x40135c
  4012fe:	b9 40 00 00 00       	mov    ecx,0x40
  401303:	32 16                	xor    dl,BYTE PTR [esi]
  401305:	c1 c2 07             	rol    edx,0x7
  401308:	e2 f9                	loop   0x401303
  40130a:	8b 1e                	mov    ebx,DWORD PTR [esi]
  40130c:	c1 c3 10             	rol    ebx,0x10
  40130f:	f7 d3                	not    ebx
  401311:	81 fb be af ab ad    	cmp    ebx,0xadabafbe
  401317:	75 43                	jne    0x40135c
  401319:	b9 40 00 00 00       	mov    ecx,0x40
  40131e:	32 56 06             	xor    dl,BYTE PTR [esi+0x6]
  401321:	c1 c2 07             	rol    edx,0x7
  401324:	e2 f8                	loop   0x40131e
  401326:	8b 5e 05             	mov    ebx,DWORD PTR [esi+0x5]
  401329:	81 f3 72 6f 66 6c    	xor    ebx,0x6c666f72
  40132f:	f7 d3                	not    ebx
  401331:	81 fb cb dc d8 d4    	cmp    ebx,0xd4d8dccb
  401337:	75 23                	jne    0x40135c
  401339:	b9 40 00 00 00       	mov    ecx,0x40
  40133e:	32 56 06             	xor    dl,BYTE PTR [esi+0x6]
  401341:	c1 c2 07             	rol    edx,0x7
  401344:	e2 f8                	loop   0x40133e
  401346:	8b 5e 0a             	mov    ebx,DWORD PTR [esi+0xa]
  401349:	c1 c3 10             	rol    ebx,0x10
  40134c:	81 fb 4e 5a 4f 57    	cmp    ebx,0x574f5a4e
  401352:	75 08                	jne    0x40135c
  401354:	33 db                	xor    ebx,ebx
  401356:	33 d2                	xor    edx,edx
  401358:	33 c9                	xor    ecx,ecx
  40135a:	33 c0                	xor    eax,eax
  40135c:	33 d2                	xor    edx,edx
  40135e:	68 7a 13 40 00       	push   0x40137a
  401363:	64 ff 32             	push   DWORD PTR fs:[edx]
  401366:	64 89 22             	mov    DWORD PTR fs:[edx],esp
  401369:	4e                   	dec    esi
  40136a:	4e                   	dec    esi
  40136b:	4e                   	dec    esi
  40136c:	4e                   	dec    esi
