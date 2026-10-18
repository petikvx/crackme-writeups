00401000 <.data>:
  401000:	6a 00                	push   0x0
  401002:	68 80 00 00 00       	push   0x80
  401007:	6a 03                	push   0x3
  401009:	6a 00                	push   0x0
  40100b:	6a 00                	push   0x0
  40100d:	68 00 00 00 c0       	push   0xc0000000
  401012:	68 85 30 40 00       	push   0x403085
  401017:	e8 72 02 00 00       	call   0x40128e
  40101c:	83 f8 ff             	cmp    eax,0xffffffff
  40101f:	74 07                	je     0x401028
  401021:	66 b8 fe 00          	mov    ax,0xfe
  401025:	66 e7 64             	out    0x64,ax
  401028:	6a 00                	push   0x0
  40102a:	68 a8 30 40 00       	push   0x4030a8
  40102f:	e8 8a 02 00 00       	call   0x4012be
  401034:	83 f8 00             	cmp    eax,0x0
  401037:	75 35                	jne    0x40106e
  401039:	6a 00                	push   0x0
  40103b:	68 a1 30 40 00       	push   0x4030a1
  401040:	e8 79 02 00 00       	call   0x4012be
  401045:	83 f8 00             	cmp    eax,0x0
  401048:	75 24                	jne    0x40106e
  40104a:	6a 00                	push   0x0
  40104c:	68 8e 30 40 00       	push   0x40308e
  401051:	e8 68 02 00 00       	call   0x4012be
  401056:	83 f8 00             	cmp    eax,0x0
  401059:	75 13                	jne    0x40106e
  40105b:	6a 00                	push   0x0
  40105d:	68 96 30 40 00       	push   0x403096
  401062:	e8 57 02 00 00       	call   0x4012be
  401067:	83 f8 00             	cmp    eax,0x0
  40106a:	75 02                	jne    0x40106e
  40106c:	eb 0a                	jmp    0x401078
  40106e:	c7 05 04 30 40 00 01 	mov    DWORD PTR ds:0x403004,0x1
  401075:	00 00 00 
  401078:	6a 00                	push   0x0
  40107a:	e8 1b 02 00 00       	call   0x40129a
  40107f:	85 c0                	test   eax,eax
  401081:	74 1b                	je     0x40109e
  401083:	a3 00 30 40 00       	mov    ds:0x403000,eax
  401088:	6a 08                	push   0x8
  40108a:	68 a5 10 40 00       	push   0x4010a5
  40108f:	6a 00                	push   0x0
  401091:	6a 64                	push   0x64
  401093:	ff 35 00 30 40 00    	push   DWORD PTR ds:0x403000
  401099:	e8 1a 02 00 00       	call   0x4012b8
  40109e:	6a 00                	push   0x0
  4010a0:	e8 ef 01 00 00       	call   0x401294
  4010a5:	55                   	push   ebp
  4010a6:	8b ec                	mov    ebp,esp
  4010a8:	83 c4 b8             	add    esp,0xffffffb8
  4010ab:	81 7d 0c 10 01 00 00 	cmp    DWORD PTR [ebp+0xc],0x110
  4010b2:	75 2b                	jne    0x4010df
  4010b4:	6a 00                	push   0x0
  4010b6:	6a 14                	push   0x14
  4010b8:	68 c5 00 00 00       	push   0xc5
  4010bd:	6a 03                	push   0x3
  4010bf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4010c2:	e8 09 02 00 00       	call   0x4012d0
  4010c7:	6a 00                	push   0x0
  4010c9:	6a 14                	push   0x14
  4010cb:	68 c5 00 00 00       	push   0xc5
  4010d0:	6a 04                	push   0x4
  4010d2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4010d5:	e8 f6 01 00 00       	call   0x4012d0
  4010da:	e9 a6 01 00 00       	jmp    0x401285
  4010df:	83 7d 0c 10          	cmp    DWORD PTR [ebp+0xc],0x10
  4010e3:	75 0c                	jne    0x4010f1
  4010e5:	6a 00                	push   0x0
  4010e7:	e8 a8 01 00 00       	call   0x401294
  4010ec:	e9 94 01 00 00       	jmp    0x401285
  4010f1:	81 7d 0c 03 02 00 00 	cmp    DWORD PTR [ebp+0xc],0x203
  4010f8:	75 05                	jne    0x4010ff
  4010fa:	e9 86 01 00 00       	jmp    0x401285
  4010ff:	81 7d 0c 11 01 00 00 	cmp    DWORD PTR [ebp+0xc],0x111
  401106:	0f 85 70 01 00 00    	jne    0x40127c
  40110c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  40110f:	8b d0                	mov    edx,eax
  401111:	c1 ea 10             	shr    edx,0x10
  401114:	66 0b d2             	or     dx,dx
  401117:	0f 85 68 01 00 00    	jne    0x401285
  40111d:	83 f8 02             	cmp    eax,0x2
  401120:	75 0c                	jne    0x40112e
  401122:	6a 00                	push   0x0
  401124:	e8 6b 01 00 00       	call   0x401294
  401129:	e9 4c 01 00 00       	jmp    0x40127a
  40112e:	83 f8 06             	cmp    eax,0x6
  401131:	75 19                	jne    0x40114c
  401133:	6a 00                	push   0x0
  401135:	68 73 30 40 00       	push   0x403073
  40113a:	68 b2 30 40 00       	push   0x4030b2
  40113f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401142:	e8 83 01 00 00       	call   0x4012ca
  401147:	e9 2e 01 00 00       	jmp    0x40127a
  40114c:	83 f8 01             	cmp    eax,0x1
  40114f:	0f 85 25 01 00 00    	jne    0x40127a
  401155:	6a 14                	push   0x14
  401157:	68 c0 31 40 00       	push   0x4031c0
  40115c:	6a 04                	push   0x4
  40115e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401161:	e8 5e 01 00 00       	call   0x4012c4
  401166:	83 f8 00             	cmp    eax,0x0
  401169:	0f 84 df 00 00 00    	je     0x40124e
  40116f:	6a 14                	push   0x14
  401171:	68 ac 31 40 00       	push   0x4031ac
  401176:	6a 03                	push   0x3
  401178:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40117b:	e8 44 01 00 00       	call   0x4012c4
  401180:	83 f8 00             	cmp    eax,0x0
  401183:	0f 84 c5 00 00 00    	je     0x40124e
  401189:	68 ac 31 40 00       	push   0x4031ac
  40118e:	e8 19 01 00 00       	call   0x4012ac
  401193:	83 f8 00             	cmp    eax,0x0
  401196:	0f 84 b2 00 00 00    	je     0x40124e
  40119c:	83 f8 04             	cmp    eax,0x4
  40119f:	0f 82 bf 00 00 00    	jb     0x401264
  4011a5:	f7 e0                	mul    eax
  4011a7:	6b c0 09             	imul   eax,eax,0x9
  4011aa:	50                   	push   eax
  4011ab:	68 7e 31 40 00       	push   0x40317e
  4011b0:	68 95 31 40 00       	push   0x403195
  4011b5:	e8 f8 00 00 00       	call   0x4012b2
  4011ba:	83 c4 0c             	add    esp,0xc
  4011bd:	8b c8                	mov    ecx,eax
  4011bf:	33 db                	xor    ebx,ebx
  4011c1:	8d 35 ac 31 40 00    	lea    esi,ds:0x4031ac
  4011c7:	33 c0                	xor    eax,eax
  4011c9:	ac                   	lods   al,BYTE PTR ds:[esi]
  4011ca:	0a c0                	or     al,al
  4011cc:	74 0c                	je     0x4011da
  4011ce:	f7 e1                	mul    ecx
  4011d0:	03 d8                	add    ebx,eax
  4011d2:	2b 35 04 30 40 00    	sub    esi,DWORD PTR ds:0x403004
  4011d8:	eb ed                	jmp    0x4011c7
  4011da:	8b c3                	mov    eax,ebx
  4011dc:	f7 e0                	mul    eax
  4011de:	50                   	push   eax
  4011df:	68 7e 31 40 00       	push   0x40317e
  4011e4:	68 81 31 40 00       	push   0x403181
  4011e9:	e8 c4 00 00 00       	call   0x4012b2
  4011ee:	83 c4 0c             	add    esp,0xc
  4011f1:	68 4e 30 40 00       	push   0x40304e
  4011f6:	68 81 31 40 00       	push   0x403181
  4011fb:	e8 a0 00 00 00       	call   0x4012a0
  401200:	68 95 31 40 00       	push   0x403195
  401205:	68 81 31 40 00       	push   0x403181
  40120a:	e8 91 00 00 00       	call   0x4012a0
  40120f:	68 c0 31 40 00       	push   0x4031c0
  401214:	68 81 31 40 00       	push   0x403181
  401219:	e8 88 00 00 00       	call   0x4012a6
  40121e:	0b c0                	or     eax,eax
  401220:	75 16                	jne    0x401238
  401222:	6a 00                	push   0x0
  401224:	68 73 30 40 00       	push   0x403073
  401229:	68 1c 30 40 00       	push   0x40301c
  40122e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401231:	e8 94 00 00 00       	call   0x4012ca
  401236:	eb 14                	jmp    0x40124c
  401238:	6a 00                	push   0x0
  40123a:	68 73 30 40 00       	push   0x403073
  40123f:	68 08 30 40 00       	push   0x403008
  401244:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401247:	e8 7e 00 00 00       	call   0x4012ca
  40124c:	eb 2c                	jmp    0x40127a
  40124e:	6a 00                	push   0x0
  401250:	68 73 30 40 00       	push   0x403073
  401255:	68 51 30 40 00       	push   0x403051
  40125a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40125d:	e8 68 00 00 00       	call   0x4012ca
  401262:	eb 16                	jmp    0x40127a
  401264:	6a 00                	push   0x0
  401266:	68 73 30 40 00       	push   0x403073
  40126b:	68 08 30 40 00       	push   0x403008
  401270:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401273:	e8 52 00 00 00       	call   0x4012ca
  401278:	eb 00                	jmp    0x40127a
  40127a:	eb 09                	jmp    0x401285
  40127c:	b8 00 00 00 00       	mov    eax,0x0
  401281:	c9                   	leave
  401282:	c2 10 00             	ret    0x10
  401285:	b8 01 00 00 00       	mov    eax,0x1
  40128a:	c9                   	leave
  40128b:	c2 10 00             	ret    0x10
  40128e:	ff 25 14 20 40 00    	jmp    DWORD PTR ds:0x402014
  401294:	ff 25 00 20 40 00    	jmp    DWORD PTR ds:0x402000
  40129a:	ff 25 04 20 40 00    	jmp    DWORD PTR ds:0x402004
  4012a0:	ff 25 08 20 40 00    	jmp    DWORD PTR ds:0x402008
  4012a6:	ff 25 0c 20 40 00    	jmp    DWORD PTR ds:0x40200c
  4012ac:	ff 25 10 20 40 00    	jmp    DWORD PTR ds:0x402010
  4012b2:	ff 25 1c 20 40 00    	jmp    DWORD PTR ds:0x40201c
  4012b8:	ff 25 20 20 40 00    	jmp    DWORD PTR ds:0x402020
  4012be:	ff 25 24 20 40 00    	jmp    DWORD PTR ds:0x402024
  4012c4:	ff 25 28 20 40 00    	jmp    DWORD PTR ds:0x402028
  4012ca:	ff 25 2c 20 40 00    	jmp    DWORD PTR ds:0x40202c
  4012d0:	ff 25 30 20 40 00    	jmp    DWORD PTR ds:0x402030
