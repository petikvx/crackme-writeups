
/tmp/ci/dump.bin:     file format binary


Disassembly of section .data:

00401000 <.data+0x1000>:
  401000:	55                   	push   ebp
  401001:	8b ec                	mov    ebp,esp
  401003:	b8 01 00 00 00       	mov    eax,0x1
  401008:	85 c0                	test   eax,eax
  40100a:	74 0f                	je     0x40101b
  40100c:	6a 01                	push   0x1
  40100e:	68 b0 40 41 00       	push   0x4140b0
  401013:	ff 15 00 10 41 00    	call   DWORD PTR ds:0x411000
  401019:	eb e8                	jmp    0x401003
  40101b:	5d                   	pop    ebp
  40101c:	c3                   	ret
  40101d:	cc                   	int3
  40101e:	cc                   	int3
  40101f:	cc                   	int3
  401020:	55                   	push   ebp
  401021:	8b ec                	mov    ebp,esp
  401023:	83 ec 0c             	sub    esp,0xc
  401026:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40102d:	c6 45 f4 00          	mov    BYTE PTR [ebp-0xc],0x0
  401031:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  401038:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40103b:	0f be 08             	movsx  ecx,BYTE PTR [eax]
  40103e:	85 c9                	test   ecx,ecx
  401040:	0f 84 8b 00 00 00    	je     0x4010d1
  401046:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  401049:	0f be 02             	movsx  eax,BYTE PTR [edx]
  40104c:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  40104f:	03 c8                	add    ecx,eax
  401051:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  401054:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  401057:	8a 45 f4             	mov    al,BYTE PTR [ebp-0xc]
  40105a:	32 02                	xor    al,BYTE PTR [edx]
  40105c:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
  40105f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  401062:	81 e1 ff 00 00 00    	and    ecx,0xff
  401068:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40106b:	03 d1                	add    edx,ecx
  40106d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
  401070:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401073:	25 ff 00 00 00       	and    eax,0xff
  401078:	f7 d0                	not    eax
  40107a:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
  40107d:	8a 4d f4             	mov    cl,BYTE PTR [ebp-0xc]
  401080:	c0 e9 02             	shr    cl,0x2
  401083:	88 4d f4             	mov    BYTE PTR [ebp-0xc],cl
  401086:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
  401089:	32 55 fc             	xor    dl,BYTE PTR [ebp-0x4]
  40108c:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
  40108f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  401092:	c1 e0 03             	shl    eax,0x3
  401095:	8a 4d f4             	mov    cl,BYTE PTR [ebp-0xc]
  401098:	32 c8                	xor    cl,al
  40109a:	88 4d f4             	mov    BYTE PTR [ebp-0xc],cl
  40109d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  4010a0:	81 e2 ff 00 00 00    	and    edx,0xff
  4010a6:	0f af 55 f8          	imul   edx,DWORD PTR [ebp-0x8]
  4010aa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4010ad:	f7 d0                	not    eax
  4010af:	0f af d0             	imul   edx,eax
  4010b2:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  4010b5:	33 ca                	xor    ecx,edx
  4010b7:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  4010ba:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4010bd:	83 c2 01             	add    edx,0x1
  4010c0:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  4010c3:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4010c6:	83 c0 01             	add    eax,0x1
  4010c9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4010cc:	e9 67 ff ff ff       	jmp    0x401038
  4010d1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4010d4:	33 d2                	xor    edx,edx
  4010d6:	f7 75 0c             	div    DWORD PTR [ebp+0xc]
  4010d9:	8b c2                	mov    eax,edx
  4010db:	8b e5                	mov    esp,ebp
  4010dd:	5d                   	pop    ebp
  4010de:	c3                   	ret
  4010df:	cc                   	int3
  4010e0:	55                   	push   ebp
  4010e1:	8b ec                	mov    ebp,esp
  4010e3:	83 ec 58             	sub    esp,0x58
  4010e6:	57                   	push   edi
  4010e7:	68 d0 40 41 00       	push   0x4140d0
  4010ec:	ff 15 08 10 41 00    	call   DWORD PTR ds:0x411008
  4010f2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4010f5:	68 bc 40 41 00       	push   0x4140bc
  4010fa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4010fd:	50                   	push   eax
  4010fe:	ff 15 04 10 41 00    	call   DWORD PTR ds:0x411004
  401104:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  401107:	ff 55 a8             	call   DWORD PTR [ebp-0x58]
  40110a:	85 c0                	test   eax,eax
  40110c:	74 05                	je     0x401113
  40110e:	e8 ed fe ff ff       	call   0x401000
  401113:	68 0c 41 41 00       	push   0x41410c
  401118:	68 10 80 41 00       	push   0x418010
  40111d:	e8 ce 01 00 00       	call   0x4012f0
  401122:	83 c4 08             	add    esp,0x8
  401125:	8d 4d ac             	lea    ecx,[ebp-0x54]
  401128:	51                   	push   ecx
  401129:	68 a0 80 41 00       	push   0x4180a0
  40112e:	e8 fd 09 00 00       	call   0x401b30
  401133:	83 c4 08             	add    esp,0x8
  401136:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  40113c:	a3 74 7f 41 00       	mov    ds:0x417f74,eax
  401141:	8d 7d ac             	lea    edi,[ebp-0x54]
  401144:	83 c9 ff             	or     ecx,0xffffffff
  401147:	33 c0                	xor    eax,eax
  401149:	f2 ae                	repnz scas al,BYTE PTR es:[edi]
  40114b:	f7 d1                	not    ecx
  40114d:	83 c1 ff             	add    ecx,0xffffffff
  401150:	83 f9 2b             	cmp    ecx,0x2b
  401153:	74 07                	je     0x40115c
  401155:	33 c0                	xor    eax,eax
  401157:	e9 84 01 00 00       	jmp    0x4012e0
  40115c:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  401162:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  401168:	3d a4 00 00 00       	cmp    eax,0xa4
  40116d:	76 05                	jbe    0x401174
  40116f:	e8 8c fe ff ff       	call   0x401000
  401174:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  40117a:	a3 74 7f 41 00       	mov    ds:0x417f74,eax
  40117f:	6a 09                	push   0x9
  401181:	68 00 41 41 00       	push   0x414100
  401186:	8d 55 ac             	lea    edx,[ebp-0x54]
  401189:	52                   	push   edx
  40118a:	e8 21 4b 00 00       	call   0x405cb0
  40118f:	83 c4 0c             	add    esp,0xc
  401192:	85 c0                	test   eax,eax
  401194:	74 07                	je     0x40119d
  401196:	33 c0                	xor    eax,eax
  401198:	e9 43 01 00 00       	jmp    0x4012e0
  40119d:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  4011a3:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  4011a9:	3d a4 00 00 00       	cmp    eax,0xa4
  4011ae:	76 05                	jbe    0x4011b5
  4011b0:	e8 4b fe ff ff       	call   0x401000
  4011b5:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  4011bb:	a3 74 7f 41 00       	mov    ds:0x417f74,eax
  4011c0:	6a 07                	push   0x7
  4011c2:	68 f8 40 41 00       	push   0x4140f8
  4011c7:	8d 45 ba             	lea    eax,[ebp-0x46]
  4011ca:	50                   	push   eax
  4011cb:	e8 e0 4a 00 00       	call   0x405cb0
  4011d0:	83 c4 0c             	add    esp,0xc
  4011d3:	85 c0                	test   eax,eax
  4011d5:	74 07                	je     0x4011de
  4011d7:	33 c0                	xor    eax,eax
  4011d9:	e9 02 01 00 00       	jmp    0x4012e0
  4011de:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  4011e4:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  4011ea:	3d a4 00 00 00       	cmp    eax,0xa4
  4011ef:	76 05                	jbe    0x4011f6
  4011f1:	e8 0a fe ff ff       	call   0x401000
  4011f6:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  4011fc:	a3 74 7f 41 00       	mov    ds:0x417f74,eax
  401201:	6a 09                	push   0x9
  401203:	68 ec 40 41 00       	push   0x4140ec
  401208:	8d 4d ca             	lea    ecx,[ebp-0x36]
  40120b:	51                   	push   ecx
  40120c:	e8 9f 4a 00 00       	call   0x405cb0
  401211:	83 c4 0c             	add    esp,0xc
  401214:	85 c0                	test   eax,eax
  401216:	74 07                	je     0x40121f
  401218:	33 c0                	xor    eax,eax
  40121a:	e9 c1 00 00 00       	jmp    0x4012e0
  40121f:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  401225:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  40122b:	3d a4 00 00 00       	cmp    eax,0xa4
  401230:	76 05                	jbe    0x401237
  401232:	e8 c9 fd ff ff       	call   0x401000
  401237:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  40123d:	a3 74 7f 41 00       	mov    ds:0x417f74,eax
  401242:	0f be 55 d6          	movsx  edx,BYTE PTR [ebp-0x2a]
  401246:	83 fa 21             	cmp    edx,0x21
  401249:	74 07                	je     0x401252
  40124b:	33 c0                	xor    eax,eax
  40124d:	e9 8e 00 00 00       	jmp    0x4012e0
  401252:	68 ff ff ff 00       	push   0xffffff
  401257:	8d 45 ac             	lea    eax,[ebp-0x54]
  40125a:	50                   	push   eax
  40125b:	e8 c0 fd ff ff       	call   0x401020
  401260:	83 c4 08             	add    esp,0x8
  401263:	3d d8 9d 20 00       	cmp    eax,0x209dd8
  401268:	75 2c                	jne    0x401296
  40126a:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  401270:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  401276:	3d a4 00 00 00       	cmp    eax,0xa4
  40127b:	76 05                	jbe    0x401282
  40127d:	e8 7e fd ff ff       	call   0x401000
  401282:	68 e0 40 41 00       	push   0x4140e0
  401287:	68 10 80 41 00       	push   0x418010
  40128c:	e8 5f 00 00 00       	call   0x4012f0
  401291:	83 c4 08             	add    esp,0x8
  401294:	eb 32                	jmp    0x4012c8
  401296:	ff 15 10 10 41 00    	call   DWORD PTR ds:0x411010
  40129c:	2b 05 74 7f 41 00    	sub    eax,DWORD PTR ds:0x417f74
  4012a2:	3d a4 00 00 00       	cmp    eax,0xa4
  4012a7:	76 05                	jbe    0x4012ae
  4012a9:	e8 52 fd ff ff       	call   0x401000
  4012ae:	68 e8 03 00 00       	push   0x3e8
  4012b3:	ff 15 0c 10 41 00    	call   DWORD PTR ds:0x41100c
  4012b9:	6a 00                	push   0x0
  4012bb:	ff 15 00 11 41 00    	call   DWORD PTR ds:0x411100
  4012c1:	50                   	push   eax
  4012c2:	ff 15 fc 10 41 00    	call   DWORD PTR ds:0x4110fc
  4012c8:	e8 39 ed 00 00       	call   0x410006
  4012cd:	85 c0                	test   eax,eax
  4012cf:	75 0d                	jne    0x4012de
  4012d1:	68 e8 03 00 00       	push   0x3e8
  4012d6:	ff 15 0c 10 41 00    	call   DWORD PTR ds:0x41100c
  4012dc:	eb ea                	jmp    0x4012c8
  4012de:	33 c0                	xor    eax,eax
  4012e0:	5f                   	pop    edi
  4012e1:	8b e5                	mov    esp,ebp
  4012e3:	5d                   	pop    ebp
  4012e4:	c3                   	ret
