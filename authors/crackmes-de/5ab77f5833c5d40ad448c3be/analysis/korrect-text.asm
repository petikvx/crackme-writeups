
korrect-text.bin:     file format binary


Disassembly of section .data:

00401000 <.data>:
  401000:	55                   	push   ebp
  401001:	89 e5                	mov    ebp,esp
  401003:	83 ec 08             	sub    esp,0x8
  401006:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40100d:	ff 15 dc 50 40 00    	call   DWORD PTR ds:0x4050dc
  401013:	e8 68 00 00 00       	call   0x401080
  401018:	89 ec                	mov    esp,ebp
  40101a:	31 c0                	xor    eax,eax
  40101c:	5d                   	pop    ebp
  40101d:	c3                   	ret
  40101e:	89 f6                	mov    esi,esi
  401020:	55                   	push   ebp
  401021:	89 e5                	mov    ebp,esp
  401023:	83 ec 08             	sub    esp,0x8
  401026:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  40102d:	ff 15 dc 50 40 00    	call   DWORD PTR ds:0x4050dc
  401033:	e8 48 00 00 00       	call   0x401080
  401038:	89 ec                	mov    esp,ebp
  40103a:	31 c0                	xor    eax,eax
  40103c:	5d                   	pop    ebp
  40103d:	c3                   	ret
  40103e:	89 f6                	mov    esi,esi
  401040:	55                   	push   ebp
  401041:	89 e5                	mov    ebp,esp
  401043:	83 ec 08             	sub    esp,0x8
  401046:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  401049:	89 14 24             	mov    DWORD PTR [esp],edx
  40104c:	ff 15 f8 50 40 00    	call   DWORD PTR ds:0x4050f8
  401052:	89 ec                	mov    esp,ebp
  401054:	5d                   	pop    ebp
  401055:	c3                   	ret
  401056:	8d 76 00             	lea    esi,[esi+0x0]
  401059:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401060:	55                   	push   ebp
  401061:	89 e5                	mov    ebp,esp
  401063:	83 ec 08             	sub    esp,0x8
  401066:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  401069:	89 14 24             	mov    DWORD PTR [esp],edx
  40106c:	ff 15 ec 50 40 00    	call   DWORD PTR ds:0x4050ec
  401072:	89 ec                	mov    esp,ebp
  401074:	5d                   	pop    ebp
  401075:	c3                   	ret
  401076:	8d 76 00             	lea    esi,[esi+0x0]
  401079:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401080:	55                   	push   ebp
  401081:	89 e5                	mov    ebp,esp
  401083:	53                   	push   ebx
  401084:	83 ec 24             	sub    esp,0x24
  401087:	c7 04 24 a0 11 40 00 	mov    DWORD PTR [esp],0x4011a0
  40108e:	e8 ad 08 00 00       	call   0x401940
  401093:	83 ec 04             	sub    esp,0x4
  401096:	e8 05 03 00 00       	call   0x4013a0
  40109b:	c7 04 24 00 20 40 00 	mov    DWORD PTR [esp],0x402000
  4010a2:	8b 15 10 20 40 00    	mov    edx,DWORD PTR ds:0x402010
  4010a8:	8d 4d f8             	lea    ecx,[ebp-0x8]
  4010ab:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  4010b2:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4010b6:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4010ba:	8d 55 f4             	lea    edx,[ebp-0xc]
  4010bd:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4010c1:	c7 44 24 04 04 20 40 	mov    DWORD PTR [esp+0x4],0x402004
  4010c8:	00 
  4010c9:	e8 d2 07 00 00       	call   0x4018a0
  4010ce:	a1 00 40 40 00       	mov    eax,ds:0x404000
  4010d3:	85 c0                	test   eax,eax
  4010d5:	74 76                	je     0x40114d
  4010d7:	a3 20 20 40 00       	mov    ds:0x402020,eax
  4010dc:	a1 e8 50 40 00       	mov    eax,ds:0x4050e8
  4010e1:	85 c0                	test   eax,eax
  4010e3:	74 1f                	je     0x401104
  4010e5:	89 04 24             	mov    DWORD PTR [esp],eax
  4010e8:	e8 93 07 00 00       	call   0x401880
  4010ed:	8b 1d 00 40 40 00    	mov    ebx,DWORD PTR ds:0x404000
  4010f3:	89 04 24             	mov    DWORD PTR [esp],eax
  4010f6:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4010fa:	e8 91 07 00 00       	call   0x401890
  4010ff:	a1 e8 50 40 00       	mov    eax,ds:0x4050e8
  401104:	83 f8 e0             	cmp    eax,0xffffffe0
  401107:	74 22                	je     0x40112b
  401109:	83 c0 20             	add    eax,0x20
  40110c:	89 04 24             	mov    DWORD PTR [esp],eax
  40110f:	e8 6c 07 00 00       	call   0x401880
  401114:	8b 0d 00 40 40 00    	mov    ecx,DWORD PTR ds:0x404000
  40111a:	89 04 24             	mov    DWORD PTR [esp],eax
  40111d:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401121:	e8 6a 07 00 00       	call   0x401890
  401126:	a1 e8 50 40 00       	mov    eax,ds:0x4050e8
  40112b:	83 f8 c0             	cmp    eax,0xffffffc0
  40112e:	74 1d                	je     0x40114d
  401130:	83 c0 40             	add    eax,0x40
  401133:	89 04 24             	mov    DWORD PTR [esp],eax
  401136:	e8 45 07 00 00       	call   0x401880
  40113b:	8b 1d 00 40 40 00    	mov    ebx,DWORD PTR ds:0x404000
  401141:	89 04 24             	mov    DWORD PTR [esp],eax
  401144:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  401148:	e8 43 07 00 00       	call   0x401890
  40114d:	e8 1e 07 00 00       	call   0x401870
  401152:	8b 0d 20 20 40 00    	mov    ecx,DWORD PTR ds:0x402020
  401158:	89 08                	mov    DWORD PTR [eax],ecx
  40115a:	e8 11 02 00 00       	call   0x401370
  40115f:	e8 ec 06 00 00       	call   0x401850
  401164:	8b 15 00 20 40 00    	mov    edx,DWORD PTR ds:0x402000
  40116a:	8b 18                	mov    ebx,DWORD PTR [eax]
  40116c:	8b 0d 04 20 40 00    	mov    ecx,DWORD PTR ds:0x402004
  401172:	89 14 24             	mov    DWORD PTR [esp],edx
  401175:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401179:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40117d:	e8 2e 01 00 00       	call   0x4012b0
  401182:	89 c3                	mov    ebx,eax
  401184:	e8 b7 06 00 00       	call   0x401840
  401189:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40118c:	e8 bf 07 00 00       	call   0x401950
  401191:	eb 0d                	jmp    0x4011a0
  401193:	90                   	nop
  401194:	90                   	nop
  401195:	90                   	nop
  401196:	90                   	nop
  401197:	90                   	nop
  401198:	90                   	nop
  401199:	90                   	nop
  40119a:	90                   	nop
  40119b:	90                   	nop
  40119c:	90                   	nop
  40119d:	90                   	nop
  40119e:	90                   	nop
  40119f:	90                   	nop
  4011a0:	55                   	push   ebp
  4011a1:	89 e5                	mov    ebp,esp
  4011a3:	83 ec 18             	sub    esp,0x18
  4011a6:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  4011a9:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4011ac:	31 db                	xor    ebx,ebx
  4011ae:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
  4011b1:	31 f6                	xor    esi,esi
  4011b3:	8b 11                	mov    edx,DWORD PTR [ecx]
  4011b5:	8b 02                	mov    eax,DWORD PTR [edx]
  4011b7:	3d 91 00 00 c0       	cmp    eax,0xc0000091
  4011bc:	0f 87 be 00 00 00    	ja     0x401280
  4011c2:	3d 8d 00 00 c0       	cmp    eax,0xc000008d
  4011c7:	73 67                	jae    0x401230
  4011c9:	3d 05 00 00 c0       	cmp    eax,0xc0000005
  4011ce:	74 0e                	je     0x4011de
  4011d0:	89 d8                	mov    eax,ebx
  4011d2:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
  4011d5:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  4011d8:	89 ec                	mov    esp,ebp
  4011da:	5d                   	pop    ebp
  4011db:	c2 04 00             	ret    0x4
  4011de:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4011e5:	00 
  4011e6:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4011ed:	e8 6e 06 00 00       	call   0x401860
  4011f2:	83 f8 01             	cmp    eax,0x1
  4011f5:	74 22                	je     0x401219
  4011f7:	85 c0                	test   eax,eax
  4011f9:	74 d5                	je     0x4011d0
  4011fb:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401202:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401209:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401210:	ff d0                	call   eax
  401212:	bb ff ff ff ff       	mov    ebx,0xffffffff
  401217:	eb b7                	jmp    0x4011d0
  401219:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401220:	00 
  401221:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401228:	e8 33 06 00 00       	call   0x401860
  40122d:	eb e3                	jmp    0x401212
  40122f:	90                   	nop
  401230:	be 01 00 00 00       	mov    esi,0x1
  401235:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40123c:	00 
  40123d:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  401244:	e8 17 06 00 00       	call   0x401860
  401249:	83 f8 01             	cmp    eax,0x1
  40124c:	74 11                	je     0x40125f
  40124e:	85 c0                	test   eax,eax
  401250:	0f 84 7a ff ff ff    	je     0x4011d0
  401256:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40125d:	eb b1                	jmp    0x401210
  40125f:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401266:	00 
  401267:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40126e:	e8 ed 05 00 00       	call   0x401860
  401273:	85 f6                	test   esi,esi
  401275:	74 9b                	je     0x401212
  401277:	e8 24 01 00 00       	call   0x4013a0
  40127c:	eb 94                	jmp    0x401212
  40127e:	89 f6                	mov    esi,esi
  401280:	3d 93 00 00 c0       	cmp    eax,0xc0000093
  401285:	74 a9                	je     0x401230
  401287:	3d 94 00 00 c0       	cmp    eax,0xc0000094
  40128c:	74 a7                	je     0x401235
  40128e:	e9 3d ff ff ff       	jmp    0x4011d0
  401293:	90                   	nop
  401294:	90                   	nop
  401295:	90                   	nop
  401296:	90                   	nop
  401297:	90                   	nop
  401298:	90                   	nop
  401299:	90                   	nop
  40129a:	90                   	nop
  40129b:	90                   	nop
  40129c:	90                   	nop
  40129d:	90                   	nop
  40129e:	90                   	nop
  40129f:	90                   	nop
  4012a0:	55                   	push   ebp
  4012a1:	89 e5                	mov    ebp,esp
  4012a3:	5d                   	pop    ebp
  4012a4:	e9 c7 02 00 00       	jmp    0x401570
  4012a9:	90                   	nop
  4012aa:	90                   	nop
  4012ab:	90                   	nop
  4012ac:	90                   	nop
  4012ad:	90                   	nop
  4012ae:	90                   	nop
  4012af:	90                   	nop
  4012b0:	55                   	push   ebp
  4012b1:	89 e5                	mov    ebp,esp
  4012b3:	81 ec 18 01 00 00    	sub    esp,0x118
  4012b9:	83 e4 f0             	and    esp,0xfffffff0
  4012bc:	b8 00 00 00 00       	mov    eax,0x0
  4012c1:	83 c0 0f             	add    eax,0xf
  4012c4:	83 c0 0f             	add    eax,0xf
  4012c7:	c1 e8 04             	shr    eax,0x4
  4012ca:	c1 e0 04             	shl    eax,0x4
  4012cd:	89 85 04 ff ff ff    	mov    DWORD PTR [ebp-0xfc],eax
  4012d3:	8b 85 04 ff ff ff    	mov    eax,DWORD PTR [ebp-0xfc]
  4012d9:	e8 d2 04 00 00       	call   0x4017b0
  4012de:	e8 6d 01 00 00       	call   0x401450
  4012e3:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012ea:	e8 f1 05 00 00       	call   0x4018e0
  4012ef:	c7 04 24 20 30 40 00 	mov    DWORD PTR [esp],0x403020
  4012f6:	e8 e5 05 00 00       	call   0x4018e0
  4012fb:	8d 45 88             	lea    eax,[ebp-0x78]
  4012fe:	89 04 24             	mov    DWORD PTR [esp],eax
  401301:	e8 ca 05 00 00       	call   0x4018d0
  401306:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [ebp-0xec],0x0
  40130d:	00 00 00 
  401310:	8d 45 88             	lea    eax,[ebp-0x78]
  401313:	c7 44 24 04 25 30 40 	mov    DWORD PTR [esp+0x4],0x403025
  40131a:	00 
  40131b:	89 04 24             	mov    DWORD PTR [esp],eax
  40131e:	e8 9d 05 00 00       	call   0x4018c0
  401323:	89 85 14 ff ff ff    	mov    DWORD PTR [ebp-0xec],eax
  401329:	83 bd 14 ff ff ff 00 	cmp    DWORD PTR [ebp-0xec],0x0
  401330:	75 0e                	jne    0x401340
  401332:	c7 04 24 2e 30 40 00 	mov    DWORD PTR [esp],0x40302e
  401339:	e8 a2 05 00 00       	call   0x4018e0
  40133e:	eb 0c                	jmp    0x40134c
  401340:	c7 04 24 35 30 40 00 	mov    DWORD PTR [esp],0x403035
  401347:	e8 94 05 00 00       	call   0x4018e0
  40134c:	c7 04 24 44 30 40 00 	mov    DWORD PTR [esp],0x403044
  401353:	e8 88 05 00 00       	call   0x4018e0
  401358:	c7 04 24 47 30 40 00 	mov    DWORD PTR [esp],0x403047
  40135f:	e8 4c 05 00 00       	call   0x4018b0
  401364:	b8 00 00 00 00       	mov    eax,0x0
  401369:	c9                   	leave
  40136a:	c3                   	ret
  40136b:	90                   	nop
  40136c:	90                   	nop
  40136d:	90                   	nop
  40136e:	90                   	nop
  40136f:	90                   	nop
  401370:	55                   	push   ebp
  401371:	b9 30 31 40 00       	mov    ecx,0x403130
  401376:	89 e5                	mov    ebp,esp
  401378:	eb 14                	jmp    0x40138e
  40137a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401380:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  401383:	8b 01                	mov    eax,DWORD PTR [ecx]
  401385:	83 c1 08             	add    ecx,0x8
  401388:	01 82 00 00 40 00    	add    DWORD PTR [edx+0x400000],eax
  40138e:	81 f9 30 31 40 00    	cmp    ecx,0x403130
  401394:	72 ea                	jb     0x401380
  401396:	5d                   	pop    ebp
  401397:	c3                   	ret
  401398:	90                   	nop
  401399:	90                   	nop
  40139a:	90                   	nop
  40139b:	90                   	nop
  40139c:	90                   	nop
  40139d:	90                   	nop
  40139e:	90                   	nop
  40139f:	90                   	nop
  4013a0:	55                   	push   ebp
  4013a1:	89 e5                	mov    ebp,esp
  4013a3:	db e3                	fninit
  4013a5:	5d                   	pop    ebp
  4013a6:	c3                   	ret
  4013a7:	90                   	nop
  4013a8:	90                   	nop
  4013a9:	90                   	nop
  4013aa:	90                   	nop
  4013ab:	90                   	nop
  4013ac:	90                   	nop
  4013ad:	90                   	nop
  4013ae:	90                   	nop
  4013af:	90                   	nop
  4013b0:	55                   	push   ebp
  4013b1:	89 e5                	mov    ebp,esp
  4013b3:	83 ec 08             	sub    esp,0x8
  4013b6:	a1 30 20 40 00       	mov    eax,ds:0x402030
  4013bb:	8b 08                	mov    ecx,DWORD PTR [eax]
  4013bd:	85 c9                	test   ecx,ecx
  4013bf:	74 26                	je     0x4013e7
  4013c1:	eb 0d                	jmp    0x4013d0
  4013c3:	90                   	nop
  4013c4:	90                   	nop
  4013c5:	90                   	nop
  4013c6:	90                   	nop
  4013c7:	90                   	nop
  4013c8:	90                   	nop
  4013c9:	90                   	nop
  4013ca:	90                   	nop
  4013cb:	90                   	nop
  4013cc:	90                   	nop
  4013cd:	90                   	nop
  4013ce:	90                   	nop
  4013cf:	90                   	nop
  4013d0:	ff 10                	call   DWORD PTR [eax]
  4013d2:	8b 0d 30 20 40 00    	mov    ecx,DWORD PTR ds:0x402030
  4013d8:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  4013db:	8d 41 04             	lea    eax,[ecx+0x4]
  4013de:	a3 30 20 40 00       	mov    ds:0x402030,eax
  4013e3:	85 d2                	test   edx,edx
  4013e5:	75 e9                	jne    0x4013d0
  4013e7:	c9                   	leave
  4013e8:	c3                   	ret
  4013e9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4013f0:	55                   	push   ebp
  4013f1:	89 e5                	mov    ebp,esp
  4013f3:	53                   	push   ebx
  4013f4:	83 ec 04             	sub    esp,0x4
  4013f7:	a1 a0 19 40 00       	mov    eax,ds:0x4019a0
  4013fc:	83 f8 ff             	cmp    eax,0xffffffff
  4013ff:	74 29                	je     0x40142a
  401401:	85 c0                	test   eax,eax
  401403:	89 c3                	mov    ebx,eax
  401405:	74 13                	je     0x40141a
  401407:	89 f6                	mov    esi,esi
  401409:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401410:	ff 14 9d a0 19 40 00 	call   DWORD PTR [ebx*4+0x4019a0]
  401417:	4b                   	dec    ebx
  401418:	75 f6                	jne    0x401410
  40141a:	c7 04 24 b0 13 40 00 	mov    DWORD PTR [esp],0x4013b0
  401421:	e8 1a fc ff ff       	call   0x401040
  401426:	5b                   	pop    ebx
  401427:	5b                   	pop    ebx
  401428:	5d                   	pop    ebp
  401429:	c3                   	ret
  40142a:	8b 0d a4 19 40 00    	mov    ecx,DWORD PTR ds:0x4019a4
  401430:	31 c0                	xor    eax,eax
  401432:	85 c9                	test   ecx,ecx
  401434:	eb 0a                	jmp    0x401440
  401436:	40                   	inc    eax
  401437:	8b 14 85 a4 19 40 00 	mov    edx,DWORD PTR [eax*4+0x4019a4]
  40143e:	85 d2                	test   edx,edx
  401440:	75 f4                	jne    0x401436
  401442:	eb bd                	jmp    0x401401
  401444:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40144a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  401450:	55                   	push   ebp
  401451:	89 e5                	mov    ebp,esp
  401453:	53                   	push   ebx
  401454:	83 ec 04             	sub    esp,0x4
  401457:	a1 10 40 40 00       	mov    eax,ds:0x404010
  40145c:	85 c0                	test   eax,eax
  40145e:	75 36                	jne    0x401496
  401460:	a1 a0 19 40 00       	mov    eax,ds:0x4019a0
  401465:	bb 01 00 00 00       	mov    ebx,0x1
  40146a:	89 1d 10 40 40 00    	mov    DWORD PTR ds:0x404010,ebx
  401470:	83 f8 ff             	cmp    eax,0xffffffff
  401473:	74 25                	je     0x40149a
  401475:	85 c0                	test   eax,eax
  401477:	89 c3                	mov    ebx,eax
  401479:	74 0f                	je     0x40148a
  40147b:	90                   	nop
  40147c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401480:	ff 14 9d a0 19 40 00 	call   DWORD PTR [ebx*4+0x4019a0]
  401487:	4b                   	dec    ebx
  401488:	75 f6                	jne    0x401480
  40148a:	c7 04 24 b0 13 40 00 	mov    DWORD PTR [esp],0x4013b0
  401491:	e8 aa fb ff ff       	call   0x401040
  401496:	5b                   	pop    ebx
  401497:	5b                   	pop    ebx
  401498:	5d                   	pop    ebp
  401499:	c3                   	ret
  40149a:	8b 0d a4 19 40 00    	mov    ecx,DWORD PTR ds:0x4019a4
  4014a0:	31 c0                	xor    eax,eax
  4014a2:	85 c9                	test   ecx,ecx
  4014a4:	eb 0a                	jmp    0x4014b0
  4014a6:	40                   	inc    eax
  4014a7:	8b 14 85 a4 19 40 00 	mov    edx,DWORD PTR [eax*4+0x4019a4]
  4014ae:	85 d2                	test   edx,edx
  4014b0:	75 f4                	jne    0x4014a6
  4014b2:	eb c1                	jmp    0x401475
  4014b4:	90                   	nop
  4014b5:	90                   	nop
  4014b6:	90                   	nop
  4014b7:	90                   	nop
  4014b8:	90                   	nop
  4014b9:	90                   	nop
  4014ba:	90                   	nop
  4014bb:	90                   	nop
  4014bc:	90                   	nop
  4014bd:	90                   	nop
  4014be:	90                   	nop
  4014bf:	90                   	nop
  4014c0:	55                   	push   ebp
  4014c1:	a1 60 40 40 00       	mov    eax,ds:0x404060
  4014c6:	89 e5                	mov    ebp,esp
  4014c8:	5d                   	pop    ebp
  4014c9:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4014cc:	ff e1                	jmp    ecx
  4014ce:	89 f6                	mov    esi,esi
  4014d0:	55                   	push   ebp
  4014d1:	ba 42 00 00 00       	mov    edx,0x42
  4014d6:	89 e5                	mov    ebp,esp
  4014d8:	53                   	push   ebx
  4014d9:	0f b7 c0             	movzx  eax,ax
  4014dc:	83 ec 64             	sub    esp,0x64
  4014df:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4014e3:	8d 55 a8             	lea    edx,[ebp-0x58]
  4014e6:	31 db                	xor    ebx,ebx
  4014e8:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4014ec:	89 04 24             	mov    DWORD PTR [esp],eax
  4014ef:	ff 15 c0 50 40 00    	call   DWORD PTR ds:0x4050c0
  4014f5:	ba 1f 00 00 00       	mov    edx,0x1f
  4014fa:	b9 01 00 00 00       	mov    ecx,0x1
  4014ff:	83 ec 0c             	sub    esp,0xc
  401502:	85 c0                	test   eax,eax
  401504:	75 07                	jne    0x40150d
  401506:	eb 46                	jmp    0x40154e
  401508:	01 c9                	add    ecx,ecx
  40150a:	4a                   	dec    edx
  40150b:	78 0e                	js     0x40151b
  40150d:	80 7c 2a a8 41       	cmp    BYTE PTR [edx+ebp*1-0x58],0x41
  401512:	75 f4                	jne    0x401508
  401514:	09 cb                	or     ebx,ecx
  401516:	01 c9                	add    ecx,ecx
  401518:	4a                   	dec    edx
  401519:	79 f2                	jns    0x40150d
  40151b:	83 3b 3c             	cmp    DWORD PTR [ebx],0x3c
  40151e:	75 07                	jne    0x401527
  401520:	89 d8                	mov    eax,ebx
  401522:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401525:	c9                   	leave
  401526:	c3                   	ret
  401527:	b9 74 30 40 00       	mov    ecx,0x403074
  40152c:	ba ea 00 00 00       	mov    edx,0xea
  401531:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401535:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401539:	c7 04 24 a1 30 40 00 	mov    DWORD PTR [esp],0x4030a1
  401540:	b8 c0 30 40 00       	mov    eax,0x4030c0
  401545:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401549:	e8 92 02 00 00       	call   0x4017e0
  40154e:	b8 ec 30 40 00       	mov    eax,0x4030ec
  401553:	bb e4 00 00 00       	mov    ebx,0xe4
  401558:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40155c:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401560:	eb d7                	jmp    0x401539
  401562:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401569:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401570:	55                   	push   ebp
  401571:	89 e5                	mov    ebp,esp
  401573:	57                   	push   edi
  401574:	56                   	push   esi
  401575:	53                   	push   ebx
  401576:	81 ec cc 00 00 00    	sub    esp,0xcc
  40157c:	8b 0d 60 40 40 00    	mov    ecx,DWORD PTR ds:0x404060
  401582:	85 c9                	test   ecx,ecx
  401584:	74 08                	je     0x40158e
  401586:	8d 65 f4             	lea    esp,[ebp-0xc]
  401589:	5b                   	pop    ebx
  40158a:	5e                   	pop    esi
  40158b:	5f                   	pop    edi
  40158c:	5d                   	pop    ebp
  40158d:	c3                   	ret
  40158e:	c7 45 98 41 41 41 41 	mov    DWORD PTR [ebp-0x68],0x41414141
  401595:	a1 50 30 40 00       	mov    eax,ds:0x403050
  40159a:	8d 75 98             	lea    esi,[ebp-0x68]
  40159d:	c7 45 9c 41 41 41 41 	mov    DWORD PTR [ebp-0x64],0x41414141
  4015a4:	c7 45 a0 41 41 41 41 	mov    DWORD PTR [ebp-0x60],0x41414141
  4015ab:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  4015ae:	a1 54 30 40 00       	mov    eax,ds:0x403054
  4015b3:	c7 45 a4 41 41 41 41 	mov    DWORD PTR [ebp-0x5c],0x41414141
  4015ba:	c7 45 a8 41 41 41 41 	mov    DWORD PTR [ebp-0x58],0x41414141
  4015c1:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  4015c4:	a1 58 30 40 00       	mov    eax,ds:0x403058
  4015c9:	c7 45 ac 41 41 41 41 	mov    DWORD PTR [ebp-0x54],0x41414141
  4015d0:	c7 45 b0 41 41 41 41 	mov    DWORD PTR [ebp-0x50],0x41414141
  4015d7:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  4015da:	a1 5c 30 40 00       	mov    eax,ds:0x40305c
  4015df:	c7 45 b4 41 41 41 41 	mov    DWORD PTR [ebp-0x4c],0x41414141
  4015e6:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  4015e9:	a1 60 30 40 00       	mov    eax,ds:0x403060
  4015ee:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  4015f1:	a1 64 30 40 00       	mov    eax,ds:0x403064
  4015f6:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  4015f9:	a1 68 30 40 00       	mov    eax,ds:0x403068
  4015fe:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  401601:	a1 6c 30 40 00       	mov    eax,ds:0x40306c
  401606:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401609:	0f b7 05 70 30 40 00 	movzx  eax,WORD PTR ds:0x403070
  401610:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  401614:	89 34 24             	mov    DWORD PTR [esp],esi
  401617:	ff 15 bc 50 40 00    	call   DWORD PTR ds:0x4050bc
  40161d:	0f b7 c0             	movzx  eax,ax
  401620:	83 ec 04             	sub    esp,0x4
  401623:	85 c0                	test   eax,eax
  401625:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
  40162b:	0f 85 3b 01 00 00    	jne    0x40176c
  401631:	c7 04 24 3c 00 00 00 	mov    DWORD PTR [esp],0x3c
  401638:	e8 c3 02 00 00       	call   0x401900
  40163d:	85 c0                	test   eax,eax
  40163f:	89 c3                	mov    ebx,eax
  401641:	0f 84 59 01 00 00    	je     0x4017a0
  401647:	fc                   	cld
  401648:	89 c7                	mov    edi,eax
  40164a:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  401650:	b9 0f 00 00 00       	mov    ecx,0xf
  401655:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  401657:	c7 43 04 10 19 40 00 	mov    DWORD PTR [ebx+0x4],0x401910
  40165e:	b9 01 00 00 00       	mov    ecx,0x1
  401663:	c7 43 08 c0 14 40 00 	mov    DWORD PTR [ebx+0x8],0x4014c0
  40166a:	a1 30 40 40 00       	mov    eax,ds:0x404030
  40166f:	c7 03 3c 00 00 00    	mov    DWORD PTR [ebx],0x3c
  401675:	8b 15 34 40 40 00    	mov    edx,DWORD PTR ds:0x404034
  40167b:	c7 43 28 00 00 00 00 	mov    DWORD PTR [ebx+0x28],0x0
  401682:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
  401685:	a1 40 20 40 00       	mov    eax,ds:0x402040
  40168a:	89 53 18             	mov    DWORD PTR [ebx+0x18],edx
  40168d:	8b 15 44 20 40 00    	mov    edx,DWORD PTR ds:0x402044
  401693:	89 43 1c             	mov    DWORD PTR [ebx+0x1c],eax
  401696:	a1 40 40 40 00       	mov    eax,ds:0x404040
  40169b:	89 53 20             	mov    DWORD PTR [ebx+0x20],edx
  40169e:	c7 43 30 ff ff ff ff 	mov    DWORD PTR [ebx+0x30],0xffffffff
  4016a5:	89 43 2c             	mov    DWORD PTR [ebx+0x2c],eax
  4016a8:	8b 15 4c 20 40 00    	mov    edx,DWORD PTR ds:0x40204c
  4016ae:	a1 48 20 40 00       	mov    eax,ds:0x402048
  4016b3:	89 53 38             	mov    DWORD PTR [ebx+0x38],edx
  4016b6:	ba 1f 00 00 00       	mov    edx,0x1f
  4016bb:	89 43 34             	mov    DWORD PTR [ebx+0x34],eax
  4016be:	89 f6                	mov    esi,esi
  4016c0:	89 d8                	mov    eax,ebx
  4016c2:	21 c8                	and    eax,ecx
  4016c4:	83 f8 01             	cmp    eax,0x1
  4016c7:	19 c0                	sbb    eax,eax
  4016c9:	24 20                	and    al,0x20
  4016cb:	01 c9                	add    ecx,ecx
  4016cd:	04 41                	add    al,0x41
  4016cf:	88 84 2a 48 ff ff ff 	mov    BYTE PTR [edx+ebp*1-0xb8],al
  4016d6:	4a                   	dec    edx
  4016d7:	79 e7                	jns    0x4016c0
  4016d9:	a1 50 30 40 00       	mov    eax,ds:0x403050
  4016de:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  4016e4:	a1 54 30 40 00       	mov    eax,ds:0x403054
  4016e9:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  4016ef:	a1 58 30 40 00       	mov    eax,ds:0x403058
  4016f4:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  4016fa:	a1 5c 30 40 00       	mov    eax,ds:0x40305c
  4016ff:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  401705:	a1 60 30 40 00       	mov    eax,ds:0x403060
  40170a:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  401710:	a1 64 30 40 00       	mov    eax,ds:0x403064
  401715:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  40171b:	a1 68 30 40 00       	mov    eax,ds:0x403068
  401720:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  401723:	a1 6c 30 40 00       	mov    eax,ds:0x40306c
  401728:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  40172b:	0f b7 05 70 30 40 00 	movzx  eax,WORD PTR ds:0x403070
  401732:	66 89 45 88          	mov    WORD PTR [ebp-0x78],ax
  401736:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  40173c:	89 04 24             	mov    DWORD PTR [esp],eax
  40173f:	ff 15 b4 50 40 00    	call   DWORD PTR ds:0x4050b4
  401745:	0f b7 f8             	movzx  edi,ax
  401748:	83 ec 04             	sub    esp,0x4
  40174b:	85 ff                	test   edi,edi
  40174d:	75 42                	jne    0x401791
  40174f:	31 d2                	xor    edx,edx
  401751:	85 d2                	test   edx,edx
  401753:	75 1e                	jne    0x401773
  401755:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401758:	e8 93 01 00 00       	call   0x4018f0
  40175d:	89 34 24             	mov    DWORD PTR [esp],esi
  401760:	ff 15 bc 50 40 00    	call   DWORD PTR ds:0x4050bc
  401766:	83 ec 04             	sub    esp,0x4
  401769:	0f b7 c0             	movzx  eax,ax
  40176c:	e8 5f fd ff ff       	call   0x4014d0
  401771:	89 c3                	mov    ebx,eax
  401773:	89 1d 60 40 40 00    	mov    DWORD PTR ds:0x404060,ebx
  401779:	8d 43 04             	lea    eax,[ebx+0x4]
  40177c:	a3 50 40 40 00       	mov    ds:0x404050,eax
  401781:	8d 43 08             	lea    eax,[ebx+0x8]
  401784:	a3 70 40 40 00       	mov    ds:0x404070,eax
  401789:	8d 65 f4             	lea    esp,[ebp-0xc]
  40178c:	5b                   	pop    ebx
  40178d:	5e                   	pop    esi
  40178e:	5f                   	pop    edi
  40178f:	5d                   	pop    ebp
  401790:	c3                   	ret
  401791:	89 f8                	mov    eax,edi
  401793:	e8 38 fd ff ff       	call   0x4014d0
  401798:	39 d8                	cmp    eax,ebx
  40179a:	89 fa                	mov    edx,edi
  40179c:	75 b1                	jne    0x40174f
  40179e:	eb b1                	jmp    0x401751
  4017a0:	e8 6b 01 00 00       	call   0x401910
  4017a5:	90                   	nop
  4017a6:	90                   	nop
  4017a7:	90                   	nop
  4017a8:	90                   	nop
  4017a9:	90                   	nop
  4017aa:	90                   	nop
  4017ab:	90                   	nop
  4017ac:	90                   	nop
  4017ad:	90                   	nop
  4017ae:	90                   	nop
  4017af:	90                   	nop
  4017b0:	51                   	push   ecx
  4017b1:	89 e1                	mov    ecx,esp
  4017b3:	83 c1 08             	add    ecx,0x8
  4017b6:	3d 00 10 00 00       	cmp    eax,0x1000
  4017bb:	72 10                	jb     0x4017cd
  4017bd:	81 e9 00 10 00 00    	sub    ecx,0x1000
  4017c3:	83 09 00             	or     DWORD PTR [ecx],0x0
  4017c6:	2d 00 10 00 00       	sub    eax,0x1000
  4017cb:	eb e9                	jmp    0x4017b6
  4017cd:	29 c1                	sub    ecx,eax
  4017cf:	83 09 00             	or     DWORD PTR [ecx],0x0
  4017d2:	89 e0                	mov    eax,esp
  4017d4:	89 cc                	mov    esp,ecx
  4017d6:	8b 08                	mov    ecx,DWORD PTR [eax]
  4017d8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4017db:	ff e0                	jmp    eax
  4017dd:	90                   	nop
  4017de:	90                   	nop
  4017df:	90                   	nop
  4017e0:	55                   	push   ebp
  4017e1:	89 e5                	mov    ebp,esp
  4017e3:	83 ec 18             	sub    esp,0x18
  4017e6:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  4017e9:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4017ed:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  4017f0:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4017f4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  4017f7:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4017fb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4017fe:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401802:	a1 e8 50 40 00       	mov    eax,ds:0x4050e8
  401807:	83 c0 40             	add    eax,0x40
  40180a:	89 04 24             	mov    DWORD PTR [esp],eax
  40180d:	e8 1e 01 00 00       	call   0x401930
  401812:	a1 e8 50 40 00       	mov    eax,ds:0x4050e8
  401817:	83 c0 40             	add    eax,0x40
  40181a:	89 04 24             	mov    DWORD PTR [esp],eax
  40181d:	e8 fe 00 00 00       	call   0x401920
  401822:	e8 e9 00 00 00       	call   0x401910
  401827:	90                   	nop
  401828:	90                   	nop
  401829:	90                   	nop
  40182a:	90                   	nop
  40182b:	90                   	nop
  40182c:	90                   	nop
  40182d:	90                   	nop
  40182e:	90                   	nop
  40182f:	90                   	nop
  401830:	ff 25 dc 50 40 00    	jmp    DWORD PTR ds:0x4050dc
  401836:	90                   	nop
  401837:	90                   	nop
	...
  401840:	ff 25 e0 50 40 00    	jmp    DWORD PTR ds:0x4050e0
  401846:	90                   	nop
  401847:	90                   	nop
	...
  401850:	ff 25 d4 50 40 00    	jmp    DWORD PTR ds:0x4050d4
  401856:	90                   	nop
  401857:	90                   	nop
	...
  401860:	ff 25 14 51 40 00    	jmp    DWORD PTR ds:0x405114
  401866:	90                   	nop
  401867:	90                   	nop
	...
  401870:	ff 25 d8 50 40 00    	jmp    DWORD PTR ds:0x4050d8
  401876:	90                   	nop
  401877:	90                   	nop
	...
  401880:	ff 25 e4 50 40 00    	jmp    DWORD PTR ds:0x4050e4
  401886:	90                   	nop
  401887:	90                   	nop
	...
  401890:	ff 25 f0 50 40 00    	jmp    DWORD PTR ds:0x4050f0
  401896:	90                   	nop
  401897:	90                   	nop
	...
  4018a0:	ff 25 d0 50 40 00    	jmp    DWORD PTR ds:0x4050d0
  4018a6:	90                   	nop
  4018a7:	90                   	nop
	...
  4018b0:	ff 25 1c 51 40 00    	jmp    DWORD PTR ds:0x40511c
  4018b6:	90                   	nop
  4018b7:	90                   	nop
	...
  4018c0:	ff 25 18 51 40 00    	jmp    DWORD PTR ds:0x405118
  4018c6:	90                   	nop
  4018c7:	90                   	nop
	...
  4018d0:	ff 25 08 51 40 00    	jmp    DWORD PTR ds:0x405108
  4018d6:	90                   	nop
  4018d7:	90                   	nop
	...
  4018e0:	ff 25 10 51 40 00    	jmp    DWORD PTR ds:0x405110
  4018e6:	90                   	nop
  4018e7:	90                   	nop
	...
  4018f0:	ff 25 04 51 40 00    	jmp    DWORD PTR ds:0x405104
  4018f6:	90                   	nop
  4018f7:	90                   	nop
	...
  401900:	ff 25 0c 51 40 00    	jmp    DWORD PTR ds:0x40510c
  401906:	90                   	nop
  401907:	90                   	nop
	...
  401910:	ff 25 f4 50 40 00    	jmp    DWORD PTR ds:0x4050f4
  401916:	90                   	nop
  401917:	90                   	nop
	...
  401920:	ff 25 fc 50 40 00    	jmp    DWORD PTR ds:0x4050fc
  401926:	90                   	nop
  401927:	90                   	nop
	...
  401930:	ff 25 00 51 40 00    	jmp    DWORD PTR ds:0x405100
  401936:	90                   	nop
  401937:	90                   	nop
	...
  401940:	ff 25 c4 50 40 00    	jmp    DWORD PTR ds:0x4050c4
  401946:	90                   	nop
  401947:	90                   	nop
	...
  401950:	ff 25 b8 50 40 00    	jmp    DWORD PTR ds:0x4050b8
  401956:	90                   	nop
  401957:	90                   	nop
	...
  401960:	ff 25 c0 50 40 00    	jmp    DWORD PTR ds:0x4050c0
  401966:	90                   	nop
  401967:	90                   	nop
	...
  401970:	ff 25 bc 50 40 00    	jmp    DWORD PTR ds:0x4050bc
  401976:	90                   	nop
  401977:	90                   	nop
	...
  401980:	ff 25 b4 50 40 00    	jmp    DWORD PTR ds:0x4050b4
  401986:	90                   	nop
  401987:	90                   	nop
	...
  401990:	55                   	push   ebp
  401991:	89 e5                	mov    ebp,esp
  401993:	5d                   	pop    ebp
  401994:	e9 07 f9 ff ff       	jmp    0x4012a0
  401999:	90                   	nop
  40199a:	90                   	nop
  40199b:	90                   	nop
  40199c:	90                   	nop
  40199d:	90                   	nop
  40199e:	90                   	nop
  40199f:	90                   	nop
  4019a0:	ff                   	(bad)
  4019a1:	ff                   	(bad)
  4019a2:	ff                   	(bad)
  4019a3:	ff 90 19 40 00 00    	call   DWORD PTR [eax+0x4019]
  4019a9:	00 00                	add    BYTE PTR [eax],al
  4019ab:	00 ff                	add    bh,bh
  4019ad:	ff                   	(bad)
  4019ae:	ff                   	(bad)
  4019af:	ff 00                	inc    DWORD PTR [eax]
	...
  401ffd:	00 00                	add    BYTE PTR [eax],al
  401fff:	00 01                	add    BYTE PTR [ecx],al
  402001:	00 00                	add    BYTE PTR [eax],al
  402003:	00 68 64             	add    BYTE PTR [eax+0x64],ch
  402006:	35 00 00 00 00       	xor    eax,0x0
  40200b:	00 00                	add    BYTE PTR [eax],al
  40200d:	00 00                	add    BYTE PTR [eax],al
  40200f:	00 ff                	add    bh,bh
  402011:	ff                   	(bad)
  402012:	ff                   	(bad)
  402013:	ff 00                	inc    DWORD PTR [eax]
	...
  402021:	40                   	inc    eax
	...
  40202e:	00 00                	add    BYTE PTR [eax],al
  402030:	b0 19                	mov    al,0x19
  402032:	40                   	inc    eax
	...
  402043:	00 ff                	add    bh,bh
  402045:	ff                   	(bad)
  402046:	ff                   	(bad)
  402047:	ff 00                	inc    DWORD PTR [eax]
  402049:	00 00                	add    BYTE PTR [eax],al
  40204b:	00 ff                	add    bh,bh
  40204d:	ff                   	(bad)
  40204e:	ff                   	(bad)
  40204f:	ff 00                	inc    DWORD PTR [eax]
	...
  402ffd:	00 00                	add    BYTE PTR [eax],al
  402fff:	00 57 68             	add    BYTE PTR [edi+0x68],dl
  403002:	61                   	popa
  403003:	74 27                	je     0x40302c
  403005:	73 20                	jae    0x403027
  403007:	74 68                	je     0x403071
  403009:	65 20 72 69          	and    BYTE PTR gs:[edx+0x69],dh
  40300d:	67 68 74 20 77 6f    	addr16 push 0x6f772074
  403013:	72 64                	jb     0x403079
  403015:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
  403019:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  40301b:	74 65                	je     0x403082
  40301d:	72 3f                	jb     0x40305e
  40301f:	00 0a                	add    BYTE PTR [edx],cl
  403021:	3e 3e 20 00          	ds and BYTE PTR ds:[eax],al
  403025:	65 73 69             	gs jae 0x403091
  403028:	73 74                	jae    0x40309e
  40302a:	67 75 74             	addr16 jne 0x4030a1
  40302d:	00 0a                	add    BYTE PTR [edx],cl
  40302f:	0a 59 65             	or     bl,BYTE PTR [ecx+0x65]
  403032:	73 21                	jae    0x403055
  403034:	00 0a                	add    BYTE PTR [edx],cl
  403036:	0a 54 72 79          	or     dl,BYTE PTR [edx+esi*2+0x79]
  40303a:	20 61 67             	and    BYTE PTR [ecx+0x67],ah
  40303d:	61                   	popa
  40303e:	69 6e 2e 2e 2e 00 0a 	imul   ebp,DWORD PTR [esi+0x2e],0xa002e2e
  403045:	0a 00                	or     al,BYTE PTR [eax]
  403047:	70 61                	jo     0x4030aa
  403049:	75 73                	jne    0x4030be
  40304b:	65 00 00             	add    BYTE PTR gs:[eax],al
  40304e:	00 00                	add    BYTE PTR [eax],al
  403050:	2d 4c 49 42 47       	sub    eax,0x4742494c
  403055:	43                   	inc    ebx
  403056:	43                   	inc    ebx
  403057:	57                   	push   edi
  403058:	33 32                	xor    esi,DWORD PTR [edx]
  40305a:	2d 45 48 2d 32       	sub    eax,0x322d4845
  40305f:	2d 53 4a 4c 4a       	sub    eax,0x4a4c4a53
  403064:	2d 47 54 48 52       	sub    eax,0x52485447
  403069:	2d 4d 49 4e 47       	sub    eax,0x474e494d
  40306e:	57                   	push   edi
  40306f:	33 32                	xor    esi,DWORD PTR [edx]
  403071:	00 00                	add    BYTE PTR [eax],al
  403073:	00 77 33             	add    BYTE PTR [edi+0x33],dh
  403076:	32 5f 73             	xor    bl,BYTE PTR [edi+0x73]
  403079:	68 61 72 65 64       	push   0x64657261
  40307e:	70 74                	jo     0x4030f4
  403080:	72 2d                	jb     0x4030af
  403082:	3e 73 69             	ds jae 0x4030ee
  403085:	7a 65                	jp     0x4030ec
  403087:	20 3d 3d 20 73 69    	and    BYTE PTR ds:0x6973203d,bh
  40308d:	7a 65                	jp     0x4030f4
  40308f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403090:	66 28 57 33          	data16 sub BYTE PTR [edi+0x33],dl
  403094:	32 5f 45             	xor    bl,BYTE PTR [edi+0x45]
  403097:	48                   	dec    eax
  403098:	5f                   	pop    edi
  403099:	53                   	push   ebx
  40309a:	48                   	dec    eax
  40309b:	41                   	inc    ecx
  40309c:	52                   	push   edx
  40309d:	45                   	inc    ebp
  40309e:	44                   	inc    esp
  40309f:	29 00                	sub    DWORD PTR [eax],eax
  4030a1:	25 73 3a 25 75       	and    eax,0x75253a73
  4030a6:	3a 20                	cmp    ah,BYTE PTR [eax]
  4030a8:	66 61                	popaw
  4030aa:	69 6c 65 64 20 61 73 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x73736120
  4030b1:	73 
  4030b2:	65 72 74             	gs jb  0x403129
  4030b5:	69 6f 6e 20 60 25 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73256020
  4030bc:	27                   	daa
  4030bd:	0a 00                	or     al,BYTE PTR [eax]
  4030bf:	00 2e                	add    BYTE PTR [esi],ch
  4030c1:	2e 2f                	cs das
  4030c3:	2e 2e 2f             	cs cs das
  4030c6:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4030ca:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4030ce:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],ebp
  4030d1:	66 69 67 2f 69 33    	imul   sp,WORD PTR [edi+0x2f],0x3369
  4030d7:	38 36                	cmp    BYTE PTR [esi],dh
  4030d9:	2f                   	das
  4030da:	77 33                	ja     0x40310f
  4030dc:	32 2d 73 68 61 72    	xor    ch,BYTE PTR ds:0x72616873
  4030e2:	65 64 2d 70 74 72 2e 	gs fs sub eax,0x2e727470
  4030e9:	63 00                	arpl   WORD PTR [eax],eax
  4030eb:	00 47 65             	add    BYTE PTR [edi+0x65],al
  4030ee:	74 41                	je     0x403131
  4030f0:	74 6f                	je     0x403161
  4030f2:	6d                   	ins    DWORD PTR es:[edi],dx
  4030f3:	4e                   	dec    esi
  4030f4:	61                   	popa
  4030f5:	6d                   	ins    DWORD PTR es:[edi],dx
  4030f6:	65 41                	gs inc ecx
  4030f8:	20 28                	and    BYTE PTR [eax],ch
  4030fa:	61                   	popa
  4030fb:	74 6f                	je     0x40316c
  4030fd:	6d                   	ins    DWORD PTR es:[edi],dx
  4030fe:	2c 20                	sub    al,0x20
  403100:	73 2c                	jae    0x40312e
  403102:	20 73 69             	and    BYTE PTR [ebx+0x69],dh
  403105:	7a 65                	jp     0x40316c
  403107:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403108:	66 28 73 29          	data16 sub BYTE PTR [ebx+0x29],dh
  40310c:	29 20                	sub    DWORD PTR [eax],esp
  40310e:	21 3d 20 30 00 00    	and    DWORD PTR ds:0x3020,edi
	...
