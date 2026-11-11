
SimpleCrackme.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	68 5d 3a 40 00       	push   0x403a5d
  401005:	e8 5e 1e 00 00       	call   0x402e68
  40100a:	59                   	pop    ecx
  40100b:	c3                   	ret
  40100c:	cc                   	int3
  40100d:	cc                   	int3
  40100e:	cc                   	int3
  40100f:	cc                   	int3
  401010:	55                   	push   ebp
  401011:	8b ec                	mov    ebp,esp
  401013:	56                   	push   esi
  401014:	8b f1                	mov    esi,ecx
  401016:	0f 57 c0             	xorps  xmm0,xmm0
  401019:	8d 46 04             	lea    eax,[esi+0x4]
  40101c:	50                   	push   eax
  40101d:	c7 06 9c 41 40 00    	mov    DWORD PTR [esi],0x40419c
  401023:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
  401027:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40102a:	83 c0 04             	add    eax,0x4
  40102d:	50                   	push   eax
  40102e:	ff 15 bc 40 40 00    	call   DWORD PTR ds:0x4040bc
  401034:	83 c4 08             	add    esp,0x8
  401037:	8b c6                	mov    eax,esi
  401039:	5e                   	pop    esi
  40103a:	5d                   	pop    ebp
  40103b:	c2 04 00             	ret    0x4
  40103e:	cc                   	int3
  40103f:	cc                   	int3
  401040:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
  401043:	b8 cc 41 40 00       	mov    eax,0x4041cc
  401048:	85 c9                	test   ecx,ecx
  40104a:	0f 45 c1             	cmovne eax,ecx
  40104d:	c3                   	ret
  40104e:	cc                   	int3
  40104f:	cc                   	int3
  401050:	55                   	push   ebp
  401051:	8b ec                	mov    ebp,esp
  401053:	56                   	push   esi
  401054:	8b f1                	mov    esi,ecx
  401056:	8d 46 04             	lea    eax,[esi+0x4]
  401059:	c7 06 9c 41 40 00    	mov    DWORD PTR [esi],0x40419c
  40105f:	50                   	push   eax
  401060:	ff 15 b0 40 40 00    	call   DWORD PTR ds:0x4040b0
  401066:	83 c4 04             	add    esp,0x4
  401069:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
  40106d:	74 0b                	je     0x40107a
  40106f:	6a 0c                	push   0xc
  401071:	56                   	push   esi
  401072:	e8 2e 19 00 00       	call   0x4029a5
  401077:	83 c4 08             	add    esp,0x8
  40107a:	8b c6                	mov    eax,esi
  40107c:	5e                   	pop    esi
  40107d:	5d                   	pop    ebp
  40107e:	c2 04 00             	ret    0x4
  401081:	cc                   	int3
  401082:	cc                   	int3
  401083:	cc                   	int3
  401084:	cc                   	int3
  401085:	cc                   	int3
  401086:	cc                   	int3
  401087:	cc                   	int3
  401088:	cc                   	int3
  401089:	cc                   	int3
  40108a:	cc                   	int3
  40108b:	cc                   	int3
  40108c:	cc                   	int3
  40108d:	cc                   	int3
  40108e:	cc                   	int3
  40108f:	cc                   	int3
  401090:	8d 41 04             	lea    eax,[ecx+0x4]
  401093:	c7 01 9c 41 40 00    	mov    DWORD PTR [ecx],0x40419c
  401099:	50                   	push   eax
  40109a:	ff 15 b0 40 40 00    	call   DWORD PTR ds:0x4040b0
  4010a0:	59                   	pop    ecx
  4010a1:	c3                   	ret
  4010a2:	cc                   	int3
  4010a3:	cc                   	int3
  4010a4:	cc                   	int3
  4010a5:	cc                   	int3
  4010a6:	cc                   	int3
  4010a7:	cc                   	int3
  4010a8:	cc                   	int3
  4010a9:	cc                   	int3
  4010aa:	cc                   	int3
  4010ab:	cc                   	int3
  4010ac:	cc                   	int3
  4010ad:	cc                   	int3
  4010ae:	cc                   	int3
  4010af:	cc                   	int3
  4010b0:	0f 57 c0             	xorps  xmm0,xmm0
  4010b3:	8b c1                	mov    eax,ecx
  4010b5:	66 0f d6 41 04       	movq   QWORD PTR [ecx+0x4],xmm0
  4010ba:	c7 41 04 e0 41 40 00 	mov    DWORD PTR [ecx+0x4],0x4041e0
  4010c1:	c7 01 c4 41 40 00    	mov    DWORD PTR [ecx],0x4041c4
  4010c7:	c3                   	ret
  4010c8:	cc                   	int3
  4010c9:	cc                   	int3
  4010ca:	cc                   	int3
  4010cb:	cc                   	int3
  4010cc:	cc                   	int3
  4010cd:	cc                   	int3
  4010ce:	cc                   	int3
  4010cf:	cc                   	int3
  4010d0:	55                   	push   ebp
  4010d1:	8b ec                	mov    ebp,esp
  4010d3:	83 ec 0c             	sub    esp,0xc
  4010d6:	8d 4d f4             	lea    ecx,[ebp-0xc]
  4010d9:	e8 d2 ff ff ff       	call   0x4010b0
  4010de:	68 50 4d 40 00       	push   0x404d50
  4010e3:	8d 45 f4             	lea    eax,[ebp-0xc]
  4010e6:	50                   	push   eax
  4010e7:	e8 da 25 00 00       	call   0x4036c6
  4010ec:	cc                   	int3
  4010ed:	cc                   	int3
  4010ee:	cc                   	int3
  4010ef:	cc                   	int3
  4010f0:	55                   	push   ebp
  4010f1:	8b ec                	mov    ebp,esp
  4010f3:	56                   	push   esi
  4010f4:	8b f1                	mov    esi,ecx
  4010f6:	0f 57 c0             	xorps  xmm0,xmm0
  4010f9:	8d 46 04             	lea    eax,[esi+0x4]
  4010fc:	50                   	push   eax
  4010fd:	c7 06 9c 41 40 00    	mov    DWORD PTR [esi],0x40419c
  401103:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
  401107:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40110a:	83 c0 04             	add    eax,0x4
  40110d:	50                   	push   eax
  40110e:	ff 15 bc 40 40 00    	call   DWORD PTR ds:0x4040bc
  401114:	83 c4 08             	add    esp,0x8
  401117:	c7 06 c4 41 40 00    	mov    DWORD PTR [esi],0x4041c4
  40111d:	8b c6                	mov    eax,esi
  40111f:	5e                   	pop    esi
  401120:	5d                   	pop    ebp
  401121:	c2 04 00             	ret    0x4
  401124:	cc                   	int3
  401125:	cc                   	int3
  401126:	cc                   	int3
  401127:	cc                   	int3
  401128:	cc                   	int3
  401129:	cc                   	int3
  40112a:	cc                   	int3
  40112b:	cc                   	int3
  40112c:	cc                   	int3
  40112d:	cc                   	int3
  40112e:	cc                   	int3
  40112f:	cc                   	int3
  401130:	55                   	push   ebp
  401131:	8b ec                	mov    ebp,esp
  401133:	56                   	push   esi
  401134:	8b f1                	mov    esi,ecx
  401136:	0f 57 c0             	xorps  xmm0,xmm0
  401139:	8d 46 04             	lea    eax,[esi+0x4]
  40113c:	50                   	push   eax
  40113d:	c7 06 9c 41 40 00    	mov    DWORD PTR [esi],0x40419c
  401143:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
  401147:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40114a:	83 c0 04             	add    eax,0x4
  40114d:	50                   	push   eax
  40114e:	ff 15 bc 40 40 00    	call   DWORD PTR ds:0x4040bc
  401154:	83 c4 08             	add    esp,0x8
  401157:	c7 06 a8 41 40 00    	mov    DWORD PTR [esi],0x4041a8
  40115d:	8b c6                	mov    eax,esi
  40115f:	5e                   	pop    esi
  401160:	5d                   	pop    ebp
  401161:	c2 04 00             	ret    0x4
  401164:	cc                   	int3
  401165:	cc                   	int3
  401166:	cc                   	int3
  401167:	cc                   	int3
  401168:	cc                   	int3
  401169:	cc                   	int3
  40116a:	cc                   	int3
  40116b:	cc                   	int3
  40116c:	cc                   	int3
  40116d:	cc                   	int3
  40116e:	cc                   	int3
  40116f:	cc                   	int3
  401170:	68 f8 41 40 00       	push   0x4041f8
  401175:	ff 15 8c 40 40 00    	call   DWORD PTR ds:0x40408c
  40117b:	cc                   	int3
  40117c:	cc                   	int3
  40117d:	cc                   	int3
  40117e:	cc                   	int3
  40117f:	cc                   	int3
  401180:	0f 57 c0             	xorps  xmm0,xmm0
  401183:	8b c1                	mov    eax,ecx
  401185:	66 0f d6 41 04       	movq   QWORD PTR [ecx+0x4],xmm0
  40118a:	c7 41 04 08 42 40 00 	mov    DWORD PTR [ecx+0x4],0x404208
  401191:	c7 01 ec 42 40 00    	mov    DWORD PTR [ecx],0x4042ec
  401197:	c3                   	ret
  401198:	cc                   	int3
  401199:	cc                   	int3
  40119a:	cc                   	int3
  40119b:	cc                   	int3
  40119c:	cc                   	int3
  40119d:	cc                   	int3
  40119e:	cc                   	int3
  40119f:	cc                   	int3
  4011a0:	55                   	push   ebp
  4011a1:	8b ec                	mov    ebp,esp
  4011a3:	83 ec 0c             	sub    esp,0xc
  4011a6:	8d 4d f4             	lea    ecx,[ebp-0xc]
  4011a9:	e8 d2 ff ff ff       	call   0x401180
  4011ae:	68 24 4d 40 00       	push   0x404d24
  4011b3:	8b c1                	mov    eax,ecx
  4011b5:	50                   	push   eax
  4011b6:	e8 0b 25 00 00       	call   0x4036c6
  4011bb:	cc                   	int3
  4011bc:	cc                   	int3
  4011bd:	cc                   	int3
  4011be:	cc                   	int3
  4011bf:	cc                   	int3
  4011c0:	55                   	push   ebp
  4011c1:	8b ec                	mov    ebp,esp
  4011c3:	56                   	push   esi
  4011c4:	8b f1                	mov    esi,ecx
  4011c6:	0f 57 c0             	xorps  xmm0,xmm0
  4011c9:	8d 46 04             	lea    eax,[esi+0x4]
  4011cc:	50                   	push   eax
  4011cd:	c7 06 9c 41 40 00    	mov    DWORD PTR [esi],0x40419c
  4011d3:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
  4011d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4011da:	83 c0 04             	add    eax,0x4
  4011dd:	50                   	push   eax
  4011de:	ff 15 bc 40 40 00    	call   DWORD PTR ds:0x4040bc
  4011e4:	83 c4 08             	add    esp,0x8
  4011e7:	c7 06 ec 42 40 00    	mov    DWORD PTR [esi],0x4042ec
  4011ed:	8b c6                	mov    eax,esi
  4011ef:	5e                   	pop    esi
  4011f0:	5d                   	pop    ebp
  4011f1:	c2 04 00             	ret    0x4
  4011f4:	cc                   	int3
  4011f5:	cc                   	int3
  4011f6:	cc                   	int3
  4011f7:	cc                   	int3
  4011f8:	cc                   	int3
  4011f9:	cc                   	int3
  4011fa:	cc                   	int3
  4011fb:	cc                   	int3
  4011fc:	cc                   	int3
  4011fd:	cc                   	int3
  4011fe:	cc                   	int3
  4011ff:	cc                   	int3
  401200:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
  401203:	85 c9                	test   ecx,ecx
  401205:	74 11                	je     0x401218
  401207:	8b 01                	mov    eax,DWORD PTR [ecx]
  401209:	ff 50 08             	call   DWORD PTR [eax+0x8]
  40120c:	85 c0                	test   eax,eax
  40120e:	74 08                	je     0x401218
  401210:	8b 10                	mov    edx,DWORD PTR [eax]
  401212:	8b c8                	mov    ecx,eax
  401214:	6a 01                	push   0x1
  401216:	ff 12                	call   DWORD PTR [edx]
  401218:	c3                   	ret
  401219:	cc                   	int3
  40121a:	cc                   	int3
  40121b:	cc                   	int3
  40121c:	cc                   	int3
  40121d:	cc                   	int3
  40121e:	cc                   	int3
  40121f:	cc                   	int3
  401220:	55                   	push   ebp
  401221:	8b ec                	mov    ebp,esp
  401223:	6a ff                	push   0xffffffff
  401225:	68 11 39 40 00       	push   0x403911
  40122a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401230:	50                   	push   eax
  401231:	81 ec 44 02 00 00    	sub    esp,0x244
  401237:	a1 40 60 40 00       	mov    eax,ds:0x406040
  40123c:	33 c5                	xor    eax,ebp
  40123e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401241:	56                   	push   esi
  401242:	57                   	push   edi
  401243:	50                   	push   eax
  401244:	8d 45 f4             	lea    eax,[ebp-0xc]
  401247:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40124d:	68 14 42 40 00       	push   0x404214
  401252:	6a 00                	push   0x0
  401254:	ff 15 d8 40 40 00    	call   DWORD PTR ds:0x4040d8
  40125a:	83 c4 08             	add    esp,0x8
  40125d:	ff 15 08 40 40 00    	call   DWORD PTR ds:0x404008
  401263:	85 c0                	test   eax,eax
  401265:	74 30                	je     0x401297
  401267:	68 1c 42 40 00       	push   0x40421c
  40126c:	ff 15 00 40 40 00    	call   DWORD PTR ds:0x404000
  401272:	8b 0d 74 40 40 00    	mov    ecx,DWORD PTR ds:0x404074
  401278:	ba 30 42 40 00       	mov    edx,0x404230
  40127d:	e8 ee 0a 00 00       	call   0x401d70
  401282:	68 b8 0b 00 00       	push   0xbb8
  401287:	ff 15 04 40 40 00    	call   DWORD PTR ds:0x404004
  40128d:	b8 01 00 00 00       	mov    eax,0x1
  401292:	e9 88 09 00 00       	jmp    0x401c1f
  401297:	0f 57 c0             	xorps  xmm0,xmm0
  40129a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  4012a1:	0f 11 45 d8          	movups XMMWORD PTR [ebp-0x28],xmm0
  4012a5:	c7 45 ec 0f 00 00 00 	mov    DWORD PTR [ebp-0x14],0xf
  4012ac:	c6 45 d8 00          	mov    BYTE PTR [ebp-0x28],0x0
  4012b0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4012b7:	8b 35 04 40 40 00    	mov    esi,DWORD PTR ds:0x404004
  4012bd:	68 f4 01 00 00       	push   0x1f4
  4012c2:	ff d6                	call   esi
  4012c4:	68 48 42 40 00       	push   0x404248
  4012c9:	ff 15 00 40 40 00    	call   DWORD PTR ds:0x404000
  4012cf:	68 2c 01 00 00       	push   0x12c
  4012d4:	ff d6                	call   esi
  4012d6:	8b 0d 74 40 40 00    	mov    ecx,DWORD PTR ds:0x404074
  4012dc:	ba 64 42 40 00       	mov    edx,0x404264
  4012e1:	e8 8a 0a 00 00       	call   0x401d70
  4012e6:	8b 0d 80 40 40 00    	mov    ecx,DWORD PTR ds:0x404080
  4012ec:	8d 55 d8             	lea    edx,[ebp-0x28]
  4012ef:	e8 9c 0c 00 00       	call   0x401f90
  4012f4:	68 78 42 40 00       	push   0x404278
  4012f9:	8d 8d a0 fe ff ff    	lea    ecx,[ebp-0x160]
  4012ff:	e8 cc 10 00 00       	call   0x4023d0
  401304:	68 80 42 40 00       	push   0x404280
  401309:	8d 8d b8 fe ff ff    	lea    ecx,[ebp-0x148]
  40130f:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  401313:	e8 b8 10 00 00       	call   0x4023d0
  401318:	68 84 42 40 00       	push   0x404284
  40131d:	8d 8d d0 fe ff ff    	lea    ecx,[ebp-0x130]
  401323:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  401327:	e8 a4 10 00 00       	call   0x4023d0
  40132c:	68 8c 42 40 00       	push   0x40428c
  401331:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  401337:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  40133b:	e8 90 10 00 00       	call   0x4023d0
  401340:	68 90 42 40 00       	push   0x404290
  401345:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  40134b:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40134f:	e8 7c 10 00 00       	call   0x4023d0
  401354:	68 94 42 40 00       	push   0x404294
  401359:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  40135f:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  401363:	e8 68 10 00 00       	call   0x4023d0
  401368:	68 98 42 40 00       	push   0x404298
  40136d:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  401373:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  401377:	e8 54 10 00 00       	call   0x4023d0
  40137c:	68 9c 42 40 00       	push   0x40429c
  401381:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  401387:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  40138b:	e8 40 10 00 00       	call   0x4023d0
  401390:	68 a4 42 40 00       	push   0x4042a4
  401395:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  40139b:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40139f:	e8 2c 10 00 00       	call   0x4023d0
  4013a4:	68 a8 42 40 00       	push   0x4042a8
  4013a9:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4013af:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  4013b3:	e8 18 10 00 00       	call   0x4023d0
  4013b8:	68 ac 42 40 00       	push   0x4042ac
  4013bd:	8d 4d 90             	lea    ecx,[ebp-0x70]
  4013c0:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  4013c4:	e8 07 10 00 00       	call   0x4023d0
  4013c9:	68 b4 42 40 00       	push   0x4042b4
  4013ce:	8d 4d a8             	lea    ecx,[ebp-0x58]
  4013d1:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  4013d5:	e8 f6 0f 00 00       	call   0x4023d0
  4013da:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  4013de:	8d 85 b8 fe ff ff    	lea    eax,[ebp-0x148]
  4013e4:	50                   	push   eax
  4013e5:	8d 95 a0 fe ff ff    	lea    edx,[ebp-0x160]
  4013eb:	8d 8d b0 fd ff ff    	lea    ecx,[ebp-0x250]
  4013f1:	e8 4a 0e 00 00       	call   0x402240
  4013f6:	8d 8d d0 fe ff ff    	lea    ecx,[ebp-0x130]
  4013fc:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  401400:	51                   	push   ecx
  401401:	8b d0                	mov    edx,eax
  401403:	8d 8d c8 fd ff ff    	lea    ecx,[ebp-0x238]
  401409:	e8 82 0d 00 00       	call   0x402190
  40140e:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  401414:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  401418:	51                   	push   ecx
  401419:	8b d0                	mov    edx,eax
  40141b:	8d 8d e0 fd ff ff    	lea    ecx,[ebp-0x220]
  401421:	e8 6a 0d 00 00       	call   0x402190
  401426:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  40142c:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  401430:	51                   	push   ecx
  401431:	8b d0                	mov    edx,eax
  401433:	8d 8d f8 fd ff ff    	lea    ecx,[ebp-0x208]
  401439:	e8 52 0d 00 00       	call   0x402190
  40143e:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  401444:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  401448:	51                   	push   ecx
  401449:	8b d0                	mov    edx,eax
  40144b:	8d 8d 10 fe ff ff    	lea    ecx,[ebp-0x1f0]
  401451:	e8 3a 0d 00 00       	call   0x402190
  401456:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  40145c:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  401460:	51                   	push   ecx
  401461:	8b d0                	mov    edx,eax
  401463:	8d 8d 28 fe ff ff    	lea    ecx,[ebp-0x1d8]
  401469:	e8 22 0d 00 00       	call   0x402190
  40146e:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  401474:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  401478:	51                   	push   ecx
  401479:	8b d0                	mov    edx,eax
  40147b:	8d 8d 40 fe ff ff    	lea    ecx,[ebp-0x1c0]
  401481:	e8 0a 0d 00 00       	call   0x402190
  401486:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  40148c:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  401490:	51                   	push   ecx
  401491:	8b d0                	mov    edx,eax
  401493:	8d 8d 58 fe ff ff    	lea    ecx,[ebp-0x1a8]
  401499:	e8 f2 0c 00 00       	call   0x402190
  40149e:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4014a4:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  4014a8:	51                   	push   ecx
  4014a9:	8b d0                	mov    edx,eax
  4014ab:	8d 8d 70 fe ff ff    	lea    ecx,[ebp-0x190]
  4014b1:	e8 da 0c 00 00       	call   0x402190
  4014b6:	8d 4d 90             	lea    ecx,[ebp-0x70]
  4014b9:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  4014bd:	51                   	push   ecx
  4014be:	8b d0                	mov    edx,eax
  4014c0:	8d 8d 88 fe ff ff    	lea    ecx,[ebp-0x178]
  4014c6:	e8 c5 0c 00 00       	call   0x402190
  4014cb:	8d 4d a8             	lea    ecx,[ebp-0x58]
  4014ce:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  4014d2:	51                   	push   ecx
  4014d3:	8b d0                	mov    edx,eax
  4014d5:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4014d8:	e8 b3 0c 00 00       	call   0x402190
  4014dd:	83 c4 2c             	add    esp,0x2c
  4014e0:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
  4014e4:	8b 8d 9c fe ff ff    	mov    ecx,DWORD PTR [ebp-0x164]
  4014ea:	83 f9 0f             	cmp    ecx,0xf
  4014ed:	76 2f                	jbe    0x40151e
  4014ef:	8b 95 88 fe ff ff    	mov    edx,DWORD PTR [ebp-0x178]
  4014f5:	41                   	inc    ecx
  4014f6:	8b c2                	mov    eax,edx
  4014f8:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4014fe:	72 14                	jb     0x401514
  401500:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401503:	83 c1 23             	add    ecx,0x23
  401506:	2b c2                	sub    eax,edx
  401508:	83 c0 fc             	add    eax,0xfffffffc
  40150b:	83 f8 1f             	cmp    eax,0x1f
  40150e:	0f 87 19 03 00 00    	ja     0x40182d
  401514:	51                   	push   ecx
  401515:	52                   	push   edx
  401516:	e8 8a 14 00 00       	call   0x4029a5
  40151b:	83 c4 08             	add    esp,0x8
  40151e:	c7 85 98 fe ff ff 00 	mov    DWORD PTR [ebp-0x168],0x0
  401525:	00 00 00 
  401528:	c7 85 9c fe ff ff 0f 	mov    DWORD PTR [ebp-0x164],0xf
  40152f:	00 00 00 
  401532:	c6 85 88 fe ff ff 00 	mov    BYTE PTR [ebp-0x178],0x0
  401539:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  40153d:	8b 8d 84 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x17c]
  401543:	83 f9 0f             	cmp    ecx,0xf
  401546:	76 2f                	jbe    0x401577
  401548:	8b 95 70 fe ff ff    	mov    edx,DWORD PTR [ebp-0x190]
  40154e:	41                   	inc    ecx
  40154f:	8b c2                	mov    eax,edx
  401551:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401557:	72 14                	jb     0x40156d
  401559:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  40155c:	83 c1 23             	add    ecx,0x23
  40155f:	2b c2                	sub    eax,edx
  401561:	83 c0 fc             	add    eax,0xfffffffc
  401564:	83 f8 1f             	cmp    eax,0x1f
  401567:	0f 87 c0 02 00 00    	ja     0x40182d
  40156d:	51                   	push   ecx
  40156e:	52                   	push   edx
  40156f:	e8 31 14 00 00       	call   0x4029a5
  401574:	83 c4 08             	add    esp,0x8
  401577:	c7 85 80 fe ff ff 00 	mov    DWORD PTR [ebp-0x180],0x0
  40157e:	00 00 00 
  401581:	c7 85 84 fe ff ff 0f 	mov    DWORD PTR [ebp-0x17c],0xf
  401588:	00 00 00 
  40158b:	c6 85 70 fe ff ff 00 	mov    BYTE PTR [ebp-0x190],0x0
  401592:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  401596:	8b 8d 6c fe ff ff    	mov    ecx,DWORD PTR [ebp-0x194]
  40159c:	83 f9 0f             	cmp    ecx,0xf
  40159f:	76 2f                	jbe    0x4015d0
  4015a1:	8b 95 58 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1a8]
  4015a7:	41                   	inc    ecx
  4015a8:	8b c2                	mov    eax,edx
  4015aa:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4015b0:	72 14                	jb     0x4015c6
  4015b2:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  4015b5:	83 c1 23             	add    ecx,0x23
  4015b8:	2b c2                	sub    eax,edx
  4015ba:	83 c0 fc             	add    eax,0xfffffffc
  4015bd:	83 f8 1f             	cmp    eax,0x1f
  4015c0:	0f 87 67 02 00 00    	ja     0x40182d
  4015c6:	51                   	push   ecx
  4015c7:	52                   	push   edx
  4015c8:	e8 d8 13 00 00       	call   0x4029a5
  4015cd:	83 c4 08             	add    esp,0x8
  4015d0:	c7 85 68 fe ff ff 00 	mov    DWORD PTR [ebp-0x198],0x0
  4015d7:	00 00 00 
  4015da:	c7 85 6c fe ff ff 0f 	mov    DWORD PTR [ebp-0x194],0xf
  4015e1:	00 00 00 
  4015e4:	c6 85 58 fe ff ff 00 	mov    BYTE PTR [ebp-0x1a8],0x0
  4015eb:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  4015ef:	8b 8d 54 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1ac]
  4015f5:	83 f9 0f             	cmp    ecx,0xf
  4015f8:	76 2f                	jbe    0x401629
  4015fa:	8b 95 40 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1c0]
  401600:	41                   	inc    ecx
  401601:	8b c2                	mov    eax,edx
  401603:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401609:	72 14                	jb     0x40161f
  40160b:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  40160e:	83 c1 23             	add    ecx,0x23
  401611:	2b c2                	sub    eax,edx
  401613:	83 c0 fc             	add    eax,0xfffffffc
  401616:	83 f8 1f             	cmp    eax,0x1f
  401619:	0f 87 0e 02 00 00    	ja     0x40182d
  40161f:	51                   	push   ecx
  401620:	52                   	push   edx
  401621:	e8 7f 13 00 00       	call   0x4029a5
  401626:	83 c4 08             	add    esp,0x8
  401629:	c7 85 50 fe ff ff 00 	mov    DWORD PTR [ebp-0x1b0],0x0
  401630:	00 00 00 
  401633:	c7 85 54 fe ff ff 0f 	mov    DWORD PTR [ebp-0x1ac],0xf
  40163a:	00 00 00 
  40163d:	c6 85 40 fe ff ff 00 	mov    BYTE PTR [ebp-0x1c0],0x0
  401644:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
  401648:	8b 8d 3c fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1c4]
  40164e:	83 f9 0f             	cmp    ecx,0xf
  401651:	76 2f                	jbe    0x401682
  401653:	8b 95 28 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1d8]
  401659:	41                   	inc    ecx
  40165a:	8b c2                	mov    eax,edx
  40165c:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401662:	72 14                	jb     0x401678
  401664:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401667:	83 c1 23             	add    ecx,0x23
  40166a:	2b c2                	sub    eax,edx
  40166c:	83 c0 fc             	add    eax,0xfffffffc
  40166f:	83 f8 1f             	cmp    eax,0x1f
  401672:	0f 87 b5 01 00 00    	ja     0x40182d
  401678:	51                   	push   ecx
  401679:	52                   	push   edx
  40167a:	e8 26 13 00 00       	call   0x4029a5
  40167f:	83 c4 08             	add    esp,0x8
  401682:	c7 85 38 fe ff ff 00 	mov    DWORD PTR [ebp-0x1c8],0x0
  401689:	00 00 00 
  40168c:	c7 85 3c fe ff ff 0f 	mov    DWORD PTR [ebp-0x1c4],0xf
  401693:	00 00 00 
  401696:	c6 85 28 fe ff ff 00 	mov    BYTE PTR [ebp-0x1d8],0x0
  40169d:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
  4016a1:	8b 8d 24 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1dc]
  4016a7:	83 f9 0f             	cmp    ecx,0xf
  4016aa:	76 2f                	jbe    0x4016db
  4016ac:	8b 95 10 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1f0]
  4016b2:	41                   	inc    ecx
  4016b3:	8b c2                	mov    eax,edx
  4016b5:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4016bb:	72 14                	jb     0x4016d1
  4016bd:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  4016c0:	83 c1 23             	add    ecx,0x23
  4016c3:	2b c2                	sub    eax,edx
  4016c5:	83 c0 fc             	add    eax,0xfffffffc
  4016c8:	83 f8 1f             	cmp    eax,0x1f
  4016cb:	0f 87 5c 01 00 00    	ja     0x40182d
  4016d1:	51                   	push   ecx
  4016d2:	52                   	push   edx
  4016d3:	e8 cd 12 00 00       	call   0x4029a5
  4016d8:	83 c4 08             	add    esp,0x8
  4016db:	c7 85 20 fe ff ff 00 	mov    DWORD PTR [ebp-0x1e0],0x0
  4016e2:	00 00 00 
  4016e5:	c7 85 24 fe ff ff 0f 	mov    DWORD PTR [ebp-0x1dc],0xf
  4016ec:	00 00 00 
  4016ef:	c6 85 10 fe ff ff 00 	mov    BYTE PTR [ebp-0x1f0],0x0
  4016f6:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  4016fa:	8b 8d 0c fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1f4]
  401700:	83 f9 0f             	cmp    ecx,0xf
  401703:	76 2f                	jbe    0x401734
  401705:	8b 95 f8 fd ff ff    	mov    edx,DWORD PTR [ebp-0x208]
  40170b:	41                   	inc    ecx
  40170c:	8b c2                	mov    eax,edx
  40170e:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401714:	72 14                	jb     0x40172a
  401716:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401719:	83 c1 23             	add    ecx,0x23
  40171c:	2b c2                	sub    eax,edx
  40171e:	83 c0 fc             	add    eax,0xfffffffc
  401721:	83 f8 1f             	cmp    eax,0x1f
  401724:	0f 87 03 01 00 00    	ja     0x40182d
  40172a:	51                   	push   ecx
  40172b:	52                   	push   edx
  40172c:	e8 74 12 00 00       	call   0x4029a5
  401731:	83 c4 08             	add    esp,0x8
  401734:	c7 85 08 fe ff ff 00 	mov    DWORD PTR [ebp-0x1f8],0x0
  40173b:	00 00 00 
  40173e:	c7 85 0c fe ff ff 0f 	mov    DWORD PTR [ebp-0x1f4],0xf
  401745:	00 00 00 
  401748:	c6 85 f8 fd ff ff 00 	mov    BYTE PTR [ebp-0x208],0x0
  40174f:	c6 45 fc 1f          	mov    BYTE PTR [ebp-0x4],0x1f
  401753:	8b 8d f4 fd ff ff    	mov    ecx,DWORD PTR [ebp-0x20c]
  401759:	83 f9 0f             	cmp    ecx,0xf
  40175c:	76 2f                	jbe    0x40178d
  40175e:	8b 95 e0 fd ff ff    	mov    edx,DWORD PTR [ebp-0x220]
  401764:	41                   	inc    ecx
  401765:	8b c2                	mov    eax,edx
  401767:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  40176d:	72 14                	jb     0x401783
  40176f:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401772:	83 c1 23             	add    ecx,0x23
  401775:	2b c2                	sub    eax,edx
  401777:	83 c0 fc             	add    eax,0xfffffffc
  40177a:	83 f8 1f             	cmp    eax,0x1f
  40177d:	0f 87 aa 00 00 00    	ja     0x40182d
  401783:	51                   	push   ecx
  401784:	52                   	push   edx
  401785:	e8 1b 12 00 00       	call   0x4029a5
  40178a:	83 c4 08             	add    esp,0x8
  40178d:	c7 85 f0 fd ff ff 00 	mov    DWORD PTR [ebp-0x210],0x0
  401794:	00 00 00 
  401797:	c7 85 f4 fd ff ff 0f 	mov    DWORD PTR [ebp-0x20c],0xf
  40179e:	00 00 00 
  4017a1:	c6 85 e0 fd ff ff 00 	mov    BYTE PTR [ebp-0x220],0x0
  4017a8:	c6 45 fc 20          	mov    BYTE PTR [ebp-0x4],0x20
  4017ac:	8b 8d dc fd ff ff    	mov    ecx,DWORD PTR [ebp-0x224]
  4017b2:	83 f9 0f             	cmp    ecx,0xf
  4017b5:	76 2b                	jbe    0x4017e2
  4017b7:	8b 95 c8 fd ff ff    	mov    edx,DWORD PTR [ebp-0x238]
  4017bd:	41                   	inc    ecx
  4017be:	8b c2                	mov    eax,edx
  4017c0:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4017c6:	72 10                	jb     0x4017d8
  4017c8:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  4017cb:	83 c1 23             	add    ecx,0x23
  4017ce:	2b c2                	sub    eax,edx
  4017d0:	83 c0 fc             	add    eax,0xfffffffc
  4017d3:	83 f8 1f             	cmp    eax,0x1f
  4017d6:	77 55                	ja     0x40182d
  4017d8:	51                   	push   ecx
  4017d9:	52                   	push   edx
  4017da:	e8 c6 11 00 00       	call   0x4029a5
  4017df:	83 c4 08             	add    esp,0x8
  4017e2:	c7 85 d8 fd ff ff 00 	mov    DWORD PTR [ebp-0x228],0x0
  4017e9:	00 00 00 
  4017ec:	c7 85 dc fd ff ff 0f 	mov    DWORD PTR [ebp-0x224],0xf
  4017f3:	00 00 00 
  4017f6:	c6 85 c8 fd ff ff 00 	mov    BYTE PTR [ebp-0x238],0x0
  4017fd:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
  401801:	8b 8d c4 fd ff ff    	mov    ecx,DWORD PTR [ebp-0x23c]
  401807:	83 f9 0f             	cmp    ecx,0xf
  40180a:	76 3b                	jbe    0x401847
  40180c:	8b 95 b0 fd ff ff    	mov    edx,DWORD PTR [ebp-0x250]
  401812:	41                   	inc    ecx
  401813:	8b c2                	mov    eax,edx
  401815:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  40181b:	72 20                	jb     0x40183d
  40181d:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401820:	83 c1 23             	add    ecx,0x23
  401823:	2b c2                	sub    eax,edx
  401825:	83 c0 fc             	add    eax,0xfffffffc
  401828:	83 f8 1f             	cmp    eax,0x1f
  40182b:	76 10                	jbe    0x40183d
  40182d:	6a 00                	push   0x0
  40182f:	6a 00                	push   0x0
  401831:	6a 00                	push   0x0
  401833:	6a 00                	push   0x0
  401835:	6a 00                	push   0x0
  401837:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  40183d:	51                   	push   ecx
  40183e:	52                   	push   edx
  40183f:	e8 61 11 00 00       	call   0x4029a5
  401844:	83 c4 08             	add    esp,0x8
  401847:	83 7d d4 0f          	cmp    DWORD PTR [ebp-0x2c],0xf
  40184b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40184e:	8b 7d c0             	mov    edi,DWORD PTR [ebp-0x40]
  401851:	8d 55 d8             	lea    edx,[ebp-0x28]
  401854:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
  401857:	0f 47 cf             	cmova  ecx,edi
  40185a:	83 7d ec 0f          	cmp    DWORD PTR [ebp-0x14],0xf
  40185e:	c7 85 c0 fd ff ff 00 	mov    DWORD PTR [ebp-0x240],0x0
  401865:	00 00 00 
  401868:	0f 47 55 d8          	cmova  edx,DWORD PTR [ebp-0x28]
  40186c:	c7 85 c4 fd ff ff 0f 	mov    DWORD PTR [ebp-0x23c],0xf
  401873:	00 00 00 
  401876:	c6 85 b0 fd ff ff 00 	mov    BYTE PTR [ebp-0x250],0x0
  40187d:	3b 75 d0             	cmp    esi,DWORD PTR [ebp-0x30]
  401880:	75 6a                	jne    0x4018ec
  401882:	85 f6                	test   esi,esi
  401884:	74 5f                	je     0x4018e5
  401886:	83 ee 04             	sub    esi,0x4
  401889:	72 16                	jb     0x4018a1
  40188b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
  401890:	8b 02                	mov    eax,DWORD PTR [edx]
  401892:	3b 01                	cmp    eax,DWORD PTR [ecx]
  401894:	75 10                	jne    0x4018a6
  401896:	83 c2 04             	add    edx,0x4
  401899:	83 c1 04             	add    ecx,0x4
  40189c:	83 ee 04             	sub    esi,0x4
  40189f:	73 ef                	jae    0x401890
  4018a1:	83 fe fc             	cmp    esi,0xfffffffc
  4018a4:	74 34                	je     0x4018da
  4018a6:	8a 02                	mov    al,BYTE PTR [edx]
  4018a8:	3a 01                	cmp    al,BYTE PTR [ecx]
  4018aa:	75 27                	jne    0x4018d3
  4018ac:	83 fe fd             	cmp    esi,0xfffffffd
  4018af:	74 29                	je     0x4018da
  4018b1:	8a 42 01             	mov    al,BYTE PTR [edx+0x1]
  4018b4:	3a 41 01             	cmp    al,BYTE PTR [ecx+0x1]
  4018b7:	75 1a                	jne    0x4018d3
  4018b9:	83 fe fe             	cmp    esi,0xfffffffe
  4018bc:	74 1c                	je     0x4018da
  4018be:	8a 42 02             	mov    al,BYTE PTR [edx+0x2]
  4018c1:	3a 41 02             	cmp    al,BYTE PTR [ecx+0x2]
  4018c4:	75 0d                	jne    0x4018d3
  4018c6:	83 fe ff             	cmp    esi,0xffffffff
  4018c9:	74 0f                	je     0x4018da
  4018cb:	8a 42 03             	mov    al,BYTE PTR [edx+0x3]
  4018ce:	3a 41 03             	cmp    al,BYTE PTR [ecx+0x3]
  4018d1:	74 07                	je     0x4018da
  4018d3:	1b c0                	sbb    eax,eax
  4018d5:	83 c8 01             	or     eax,0x1
  4018d8:	eb 02                	jmp    0x4018dc
  4018da:	33 c0                	xor    eax,eax
  4018dc:	85 c0                	test   eax,eax
  4018de:	0f 94 c0             	sete   al
  4018e1:	84 c0                	test   al,al
  4018e3:	74 07                	je     0x4018ec
  4018e5:	ba b8 42 40 00       	mov    edx,0x4042b8
  4018ea:	eb 05                	jmp    0x4018f1
  4018ec:	ba d0 42 40 00       	mov    edx,0x4042d0
  4018f1:	8b 0d 74 40 40 00    	mov    ecx,DWORD PTR ds:0x404074
  4018f7:	e8 74 04 00 00       	call   0x401d70
  4018fc:	68 b8 0b 00 00       	push   0xbb8
  401901:	ff 15 04 40 40 00    	call   DWORD PTR ds:0x404004
  401907:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40190a:	83 f8 0f             	cmp    eax,0xf
  40190d:	76 2b                	jbe    0x40193a
  40190f:	8d 48 01             	lea    ecx,[eax+0x1]
  401912:	8b c7                	mov    eax,edi
  401914:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  40191a:	72 14                	jb     0x401930
  40191c:	8b 78 fc             	mov    edi,DWORD PTR [eax-0x4]
  40191f:	83 c1 23             	add    ecx,0x23
  401922:	2b c7                	sub    eax,edi
  401924:	83 c0 fc             	add    eax,0xfffffffc
  401927:	83 f8 1f             	cmp    eax,0x1f
  40192a:	0f 87 d3 02 00 00    	ja     0x401c03
  401930:	51                   	push   ecx
  401931:	57                   	push   edi
  401932:	e8 6e 10 00 00       	call   0x4029a5
  401937:	83 c4 08             	add    esp,0x8
  40193a:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
  40193d:	83 f9 0f             	cmp    ecx,0xf
  401940:	76 2c                	jbe    0x40196e
  401942:	8b 55 a8             	mov    edx,DWORD PTR [ebp-0x58]
  401945:	41                   	inc    ecx
  401946:	8b c2                	mov    eax,edx
  401948:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  40194e:	72 14                	jb     0x401964
  401950:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401953:	83 c1 23             	add    ecx,0x23
  401956:	2b c2                	sub    eax,edx
  401958:	83 c0 fc             	add    eax,0xfffffffc
  40195b:	83 f8 1f             	cmp    eax,0x1f
  40195e:	0f 87 9f 02 00 00    	ja     0x401c03
  401964:	51                   	push   ecx
  401965:	52                   	push   edx
  401966:	e8 3a 10 00 00       	call   0x4029a5
  40196b:	83 c4 08             	add    esp,0x8
  40196e:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  401971:	83 f9 0f             	cmp    ecx,0xf
  401974:	76 2c                	jbe    0x4019a2
  401976:	8b 55 90             	mov    edx,DWORD PTR [ebp-0x70]
  401979:	41                   	inc    ecx
  40197a:	8b c2                	mov    eax,edx
  40197c:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401982:	72 14                	jb     0x401998
  401984:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401987:	83 c1 23             	add    ecx,0x23
  40198a:	2b c2                	sub    eax,edx
  40198c:	83 c0 fc             	add    eax,0xfffffffc
  40198f:	83 f8 1f             	cmp    eax,0x1f
  401992:	0f 87 6b 02 00 00    	ja     0x401c03
  401998:	51                   	push   ecx
  401999:	52                   	push   edx
  40199a:	e8 06 10 00 00       	call   0x4029a5
  40199f:	83 c4 08             	add    esp,0x8
  4019a2:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  4019a5:	83 f9 0f             	cmp    ecx,0xf
  4019a8:	76 2f                	jbe    0x4019d9
  4019aa:	8b 95 78 ff ff ff    	mov    edx,DWORD PTR [ebp-0x88]
  4019b0:	41                   	inc    ecx
  4019b1:	8b c2                	mov    eax,edx
  4019b3:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4019b9:	72 14                	jb     0x4019cf
  4019bb:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  4019be:	83 c1 23             	add    ecx,0x23
  4019c1:	2b c2                	sub    eax,edx
  4019c3:	83 c0 fc             	add    eax,0xfffffffc
  4019c6:	83 f8 1f             	cmp    eax,0x1f
  4019c9:	0f 87 34 02 00 00    	ja     0x401c03
  4019cf:	51                   	push   ecx
  4019d0:	52                   	push   edx
  4019d1:	e8 cf 0f 00 00       	call   0x4029a5
  4019d6:	83 c4 08             	add    esp,0x8
  4019d9:	8b 8d 74 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x8c]
  4019df:	83 f9 0f             	cmp    ecx,0xf
  4019e2:	76 2f                	jbe    0x401a13
  4019e4:	8b 95 60 ff ff ff    	mov    edx,DWORD PTR [ebp-0xa0]
  4019ea:	41                   	inc    ecx
  4019eb:	8b c2                	mov    eax,edx
  4019ed:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4019f3:	72 14                	jb     0x401a09
  4019f5:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  4019f8:	83 c1 23             	add    ecx,0x23
  4019fb:	2b c2                	sub    eax,edx
  4019fd:	83 c0 fc             	add    eax,0xfffffffc
  401a00:	83 f8 1f             	cmp    eax,0x1f
  401a03:	0f 87 fa 01 00 00    	ja     0x401c03
  401a09:	51                   	push   ecx
  401a0a:	52                   	push   edx
  401a0b:	e8 95 0f 00 00       	call   0x4029a5
  401a10:	83 c4 08             	add    esp,0x8
  401a13:	8b 8d 5c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xa4]
  401a19:	83 f9 0f             	cmp    ecx,0xf
  401a1c:	76 2f                	jbe    0x401a4d
  401a1e:	8b 95 48 ff ff ff    	mov    edx,DWORD PTR [ebp-0xb8]
  401a24:	41                   	inc    ecx
  401a25:	8b c2                	mov    eax,edx
  401a27:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401a2d:	72 14                	jb     0x401a43
  401a2f:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401a32:	83 c1 23             	add    ecx,0x23
  401a35:	2b c2                	sub    eax,edx
  401a37:	83 c0 fc             	add    eax,0xfffffffc
  401a3a:	83 f8 1f             	cmp    eax,0x1f
  401a3d:	0f 87 c0 01 00 00    	ja     0x401c03
  401a43:	51                   	push   ecx
  401a44:	52                   	push   edx
  401a45:	e8 5b 0f 00 00       	call   0x4029a5
  401a4a:	83 c4 08             	add    esp,0x8
  401a4d:	8b 8d 44 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xbc]
  401a53:	83 f9 0f             	cmp    ecx,0xf
  401a56:	76 2f                	jbe    0x401a87
  401a58:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd0]
  401a5e:	41                   	inc    ecx
  401a5f:	8b c2                	mov    eax,edx
  401a61:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401a67:	72 14                	jb     0x401a7d
  401a69:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401a6c:	83 c1 23             	add    ecx,0x23
  401a6f:	2b c2                	sub    eax,edx
  401a71:	83 c0 fc             	add    eax,0xfffffffc
  401a74:	83 f8 1f             	cmp    eax,0x1f
  401a77:	0f 87 86 01 00 00    	ja     0x401c03
  401a7d:	51                   	push   ecx
  401a7e:	52                   	push   edx
  401a7f:	e8 21 0f 00 00       	call   0x4029a5
  401a84:	83 c4 08             	add    esp,0x8
  401a87:	8b 8d 2c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd4]
  401a8d:	83 f9 0f             	cmp    ecx,0xf
  401a90:	76 2f                	jbe    0x401ac1
  401a92:	8b 95 18 ff ff ff    	mov    edx,DWORD PTR [ebp-0xe8]
  401a98:	41                   	inc    ecx
  401a99:	8b c2                	mov    eax,edx
  401a9b:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401aa1:	72 14                	jb     0x401ab7
  401aa3:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401aa6:	83 c1 23             	add    ecx,0x23
  401aa9:	2b c2                	sub    eax,edx
  401aab:	83 c0 fc             	add    eax,0xfffffffc
  401aae:	83 f8 1f             	cmp    eax,0x1f
  401ab1:	0f 87 4c 01 00 00    	ja     0x401c03
  401ab7:	51                   	push   ecx
  401ab8:	52                   	push   edx
  401ab9:	e8 e7 0e 00 00       	call   0x4029a5
  401abe:	83 c4 08             	add    esp,0x8
  401ac1:	8b 8d 14 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xec]
  401ac7:	83 f9 0f             	cmp    ecx,0xf
  401aca:	76 2f                	jbe    0x401afb
  401acc:	8b 95 00 ff ff ff    	mov    edx,DWORD PTR [ebp-0x100]
  401ad2:	41                   	inc    ecx
  401ad3:	8b c2                	mov    eax,edx
  401ad5:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401adb:	72 14                	jb     0x401af1
  401add:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401ae0:	83 c1 23             	add    ecx,0x23
  401ae3:	2b c2                	sub    eax,edx
  401ae5:	83 c0 fc             	add    eax,0xfffffffc
  401ae8:	83 f8 1f             	cmp    eax,0x1f
  401aeb:	0f 87 12 01 00 00    	ja     0x401c03
  401af1:	51                   	push   ecx
  401af2:	52                   	push   edx
  401af3:	e8 ad 0e 00 00       	call   0x4029a5
  401af8:	83 c4 08             	add    esp,0x8
  401afb:	8b 8d fc fe ff ff    	mov    ecx,DWORD PTR [ebp-0x104]
  401b01:	83 f9 0f             	cmp    ecx,0xf
  401b04:	76 2f                	jbe    0x401b35
  401b06:	8b 95 e8 fe ff ff    	mov    edx,DWORD PTR [ebp-0x118]
  401b0c:	41                   	inc    ecx
  401b0d:	8b c2                	mov    eax,edx
  401b0f:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401b15:	72 14                	jb     0x401b2b
  401b17:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401b1a:	83 c1 23             	add    ecx,0x23
  401b1d:	2b c2                	sub    eax,edx
  401b1f:	83 c0 fc             	add    eax,0xfffffffc
  401b22:	83 f8 1f             	cmp    eax,0x1f
  401b25:	0f 87 d8 00 00 00    	ja     0x401c03
  401b2b:	51                   	push   ecx
  401b2c:	52                   	push   edx
  401b2d:	e8 73 0e 00 00       	call   0x4029a5
  401b32:	83 c4 08             	add    esp,0x8
  401b35:	8b 8d e4 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x11c]
  401b3b:	83 f9 0f             	cmp    ecx,0xf
  401b3e:	76 2f                	jbe    0x401b6f
  401b40:	8b 95 d0 fe ff ff    	mov    edx,DWORD PTR [ebp-0x130]
  401b46:	41                   	inc    ecx
  401b47:	8b c2                	mov    eax,edx
  401b49:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401b4f:	72 14                	jb     0x401b65
  401b51:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401b54:	83 c1 23             	add    ecx,0x23
  401b57:	2b c2                	sub    eax,edx
  401b59:	83 c0 fc             	add    eax,0xfffffffc
  401b5c:	83 f8 1f             	cmp    eax,0x1f
  401b5f:	0f 87 9e 00 00 00    	ja     0x401c03
  401b65:	51                   	push   ecx
  401b66:	52                   	push   edx
  401b67:	e8 39 0e 00 00       	call   0x4029a5
  401b6c:	83 c4 08             	add    esp,0x8
  401b6f:	8b 8d cc fe ff ff    	mov    ecx,DWORD PTR [ebp-0x134]
  401b75:	83 f9 0f             	cmp    ecx,0xf
  401b78:	76 2b                	jbe    0x401ba5
  401b7a:	8b 95 b8 fe ff ff    	mov    edx,DWORD PTR [ebp-0x148]
  401b80:	41                   	inc    ecx
  401b81:	8b c2                	mov    eax,edx
  401b83:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401b89:	72 10                	jb     0x401b9b
  401b8b:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401b8e:	83 c1 23             	add    ecx,0x23
  401b91:	2b c2                	sub    eax,edx
  401b93:	83 c0 fc             	add    eax,0xfffffffc
  401b96:	83 f8 1f             	cmp    eax,0x1f
  401b99:	77 68                	ja     0x401c03
  401b9b:	51                   	push   ecx
  401b9c:	52                   	push   edx
  401b9d:	e8 03 0e 00 00       	call   0x4029a5
  401ba2:	83 c4 08             	add    esp,0x8
  401ba5:	8b 8d b4 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x14c]
  401bab:	83 f9 0f             	cmp    ecx,0xf
  401bae:	76 2b                	jbe    0x401bdb
  401bb0:	8b 95 a0 fe ff ff    	mov    edx,DWORD PTR [ebp-0x160]
  401bb6:	41                   	inc    ecx
  401bb7:	8b c2                	mov    eax,edx
  401bb9:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401bbf:	72 10                	jb     0x401bd1
  401bc1:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401bc4:	83 c1 23             	add    ecx,0x23
  401bc7:	2b c2                	sub    eax,edx
  401bc9:	83 c0 fc             	add    eax,0xfffffffc
  401bcc:	83 f8 1f             	cmp    eax,0x1f
  401bcf:	77 32                	ja     0x401c03
  401bd1:	51                   	push   ecx
  401bd2:	52                   	push   edx
  401bd3:	e8 cd 0d 00 00       	call   0x4029a5
  401bd8:	83 c4 08             	add    esp,0x8
  401bdb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  401bde:	83 f8 0f             	cmp    eax,0xf
  401be1:	76 3a                	jbe    0x401c1d
  401be3:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  401be6:	8d 48 01             	lea    ecx,[eax+0x1]
  401be9:	8b c2                	mov    eax,edx
  401beb:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  401bf1:	72 20                	jb     0x401c13
  401bf3:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  401bf6:	83 c1 23             	add    ecx,0x23
  401bf9:	2b c2                	sub    eax,edx
  401bfb:	83 c0 fc             	add    eax,0xfffffffc
  401bfe:	83 f8 1f             	cmp    eax,0x1f
  401c01:	76 10                	jbe    0x401c13
  401c03:	6a 00                	push   0x0
  401c05:	6a 00                	push   0x0
  401c07:	6a 00                	push   0x0
  401c09:	6a 00                	push   0x0
  401c0b:	6a 00                	push   0x0
  401c0d:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  401c13:	51                   	push   ecx
  401c14:	52                   	push   edx
  401c15:	e8 8b 0d 00 00       	call   0x4029a5
  401c1a:	83 c4 08             	add    esp,0x8
  401c1d:	33 c0                	xor    eax,eax
  401c1f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  401c22:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  401c29:	59                   	pop    ecx
  401c2a:	5f                   	pop    edi
  401c2b:	5e                   	pop    esi
  401c2c:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  401c2f:	33 cd                	xor    ecx,ebp
  401c31:	e8 31 0d 00 00       	call   0x402967
  401c36:	8b e5                	mov    esp,ebp
  401c38:	5d                   	pop    ebp
  401c39:	c3                   	ret
  401c3a:	cc                   	int3
  401c3b:	cc                   	int3
  401c3c:	cc                   	int3
  401c3d:	cc                   	int3
  401c3e:	cc                   	int3
  401c3f:	cc                   	int3
  401c40:	55                   	push   ebp
  401c41:	8b ec                	mov    ebp,esp
  401c43:	6a ff                	push   0xffffffff
  401c45:	68 56 39 40 00       	push   0x403956
  401c4a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401c50:	50                   	push   eax
  401c51:	83 ec 14             	sub    esp,0x14
  401c54:	a1 40 60 40 00       	mov    eax,ds:0x406040
  401c59:	33 c5                	xor    eax,ebp
  401c5b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401c5e:	53                   	push   ebx
  401c5f:	56                   	push   esi
  401c60:	57                   	push   edi
  401c61:	50                   	push   eax
  401c62:	8d 45 f4             	lea    eax,[ebp-0xc]
  401c65:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  401c6b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401c6e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  401c71:	8b 3d 6c 40 40 00    	mov    edi,DWORD PTR ds:0x40406c
  401c77:	6a 00                	push   0x0
  401c79:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  401c7c:	ff d7                	call   edi
  401c7e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401c85:	8b 35 88 40 40 00    	mov    esi,DWORD PTR ds:0x404088
  401c8b:	a1 b0 64 40 00       	mov    eax,ds:0x4064b0
  401c90:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  401c93:	83 3e 00             	cmp    DWORD PTR [esi],0x0
  401c96:	75 20                	jne    0x401cb8
  401c98:	6a 00                	push   0x0
  401c9a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  401c9d:	ff d7                	call   edi
  401c9f:	83 3e 00             	cmp    DWORD PTR [esi],0x0
  401ca2:	75 0b                	jne    0x401caf
  401ca4:	a1 84 40 40 00       	mov    eax,ds:0x404084
  401ca9:	ff 00                	inc    DWORD PTR [eax]
  401cab:	8b 00                	mov    eax,DWORD PTR [eax]
  401cad:	89 06                	mov    DWORD PTR [esi],eax
  401caf:	8d 4d ec             	lea    ecx,[ebp-0x14]
  401cb2:	ff 15 68 40 40 00    	call   DWORD PTR ds:0x404068
  401cb8:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  401cbb:	8b 1e                	mov    ebx,DWORD PTR [esi]
  401cbd:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
  401cc0:	8d 3c 9d 00 00 00 00 	lea    edi,[ebx*4+0x0]
  401cc7:	3b 59 0c             	cmp    ebx,DWORD PTR [ecx+0xc]
  401cca:	73 0c                	jae    0x401cd8
  401ccc:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
  401ccf:	8b 34 07             	mov    esi,DWORD PTR [edi+eax*1]
  401cd2:	85 f6                	test   esi,esi
  401cd4:	75 5e                	jne    0x401d34
  401cd6:	eb 02                	jmp    0x401cda
  401cd8:	33 f6                	xor    esi,esi
  401cda:	80 79 14 00          	cmp    BYTE PTR [ecx+0x14],0x0
  401cde:	74 11                	je     0x401cf1
  401ce0:	ff 15 78 40 40 00    	call   DWORD PTR ds:0x404078
  401ce6:	3b 58 0c             	cmp    ebx,DWORD PTR [eax+0xc]
  401ce9:	73 0a                	jae    0x401cf5
  401ceb:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  401cee:	8b 34 07             	mov    esi,DWORD PTR [edi+eax*1]
  401cf1:	85 f6                	test   esi,esi
  401cf3:	75 3f                	jne    0x401d34
  401cf5:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  401cf8:	85 f6                	test   esi,esi
  401cfa:	75 38                	jne    0x401d34
  401cfc:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  401cff:	8d 45 e4             	lea    eax,[ebp-0x1c]
  401d02:	50                   	push   eax
  401d03:	ff 15 5c 40 40 00    	call   DWORD PTR ds:0x40405c
  401d09:	83 c4 08             	add    esp,0x8
  401d0c:	83 f8 ff             	cmp    eax,0xffffffff
  401d0f:	74 4a                	je     0x401d5b
  401d11:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  401d14:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
  401d17:	56                   	push   esi
  401d18:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  401d1c:	e8 0f 0c 00 00       	call   0x402930
  401d21:	8b 06                	mov    eax,DWORD PTR [esi]
  401d23:	83 c4 04             	add    esp,0x4
  401d26:	8b ce                	mov    ecx,esi
  401d28:	ff 50 04             	call   DWORD PTR [eax+0x4]
  401d2b:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  401d2e:	89 35 b0 64 40 00    	mov    DWORD PTR ds:0x4064b0,esi
  401d34:	8d 4d e8             	lea    ecx,[ebp-0x18]
  401d37:	ff 15 68 40 40 00    	call   DWORD PTR ds:0x404068
  401d3d:	8b c6                	mov    eax,esi
  401d3f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  401d42:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  401d49:	59                   	pop    ecx
  401d4a:	5f                   	pop    edi
  401d4b:	5e                   	pop    esi
  401d4c:	5b                   	pop    ebx
  401d4d:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  401d50:	33 cd                	xor    ecx,ebp
  401d52:	e8 10 0c 00 00       	call   0x402967
  401d57:	8b e5                	mov    esp,ebp
  401d59:	5d                   	pop    ebp
  401d5a:	c3                   	ret
  401d5b:	e8 40 f4 ff ff       	call   0x4011a0
  401d60:	cc                   	int3
  401d61:	cc                   	int3
  401d62:	cc                   	int3
  401d63:	cc                   	int3
  401d64:	cc                   	int3
  401d65:	cc                   	int3
  401d66:	cc                   	int3
  401d67:	cc                   	int3
  401d68:	cc                   	int3
  401d69:	cc                   	int3
  401d6a:	cc                   	int3
  401d6b:	cc                   	int3
  401d6c:	cc                   	int3
  401d6d:	cc                   	int3
  401d6e:	cc                   	int3
  401d6f:	cc                   	int3
  401d70:	55                   	push   ebp
  401d71:	8b ec                	mov    ebp,esp
  401d73:	6a ff                	push   0xffffffff
  401d75:	68 95 39 40 00       	push   0x403995
  401d7a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401d80:	50                   	push   eax
  401d81:	83 ec 24             	sub    esp,0x24
  401d84:	53                   	push   ebx
  401d85:	56                   	push   esi
  401d86:	57                   	push   edi
  401d87:	a1 40 60 40 00       	mov    eax,ds:0x406040
  401d8c:	33 c5                	xor    eax,ebp
  401d8e:	50                   	push   eax
  401d8f:	8d 45 f4             	lea    eax,[ebp-0xc]
  401d92:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  401d98:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
  401d9b:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
  401d9e:	8b d9                	mov    ebx,ecx
  401da0:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  401da3:	8b ca                	mov    ecx,edx
  401da5:	33 c0                	xor    eax,eax
  401da7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  401daa:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  401dad:	8d 71 01             	lea    esi,[ecx+0x1]
  401db0:	8a 01                	mov    al,BYTE PTR [ecx]
  401db2:	41                   	inc    ecx
  401db3:	84 c0                	test   al,al
  401db5:	75 f9                	jne    0x401db0
  401db7:	8b 03                	mov    eax,DWORD PTR [ebx]
  401db9:	2b ce                	sub    ecx,esi
  401dbb:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
  401dbe:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401dc1:	8b 7c 18 24          	mov    edi,DWORD PTR [eax+ebx*1+0x24]
  401dc5:	8b 74 18 20          	mov    esi,DWORD PTR [eax+ebx*1+0x20]
  401dc9:	85 ff                	test   edi,edi
  401dcb:	7c 17                	jl     0x401de4
  401dcd:	7f 0e                	jg     0x401ddd
  401dcf:	85 f6                	test   esi,esi
  401dd1:	74 11                	je     0x401de4
  401dd3:	85 ff                	test   edi,edi
  401dd5:	7c 0d                	jl     0x401de4
  401dd7:	7f 04                	jg     0x401ddd
  401dd9:	3b f1                	cmp    esi,ecx
  401ddb:	76 07                	jbe    0x401de4
  401ddd:	2b f1                	sub    esi,ecx
  401ddf:	83 df 00             	sbb    edi,0x0
  401de2:	eb 0e                	jmp    0x401df2
  401de4:	0f 57 c0             	xorps  xmm0,xmm0
  401de7:	66 0f 13 45 d0       	movlpd QWORD PTR [ebp-0x30],xmm0
  401dec:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401def:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
  401df2:	8b 4c 18 38          	mov    ecx,DWORD PTR [eax+ebx*1+0x38]
  401df6:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  401df9:	85 c9                	test   ecx,ecx
  401dfb:	74 05                	je     0x401e02
  401dfd:	8b 01                	mov    eax,DWORD PTR [ecx]
  401dff:	ff 50 04             	call   DWORD PTR [eax+0x4]
  401e02:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401e09:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e0b:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401e0e:	03 cb                	add    ecx,ebx
  401e10:	ff 15 70 40 40 00    	call   DWORD PTR ds:0x404070
  401e16:	84 c0                	test   al,al
  401e18:	74 28                	je     0x401e42
  401e1a:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e1c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401e1f:	8b 4c 18 3c          	mov    ecx,DWORD PTR [eax+ebx*1+0x3c]
  401e23:	85 c9                	test   ecx,ecx
  401e25:	74 19                	je     0x401e40
  401e27:	3b cb                	cmp    ecx,ebx
  401e29:	74 15                	je     0x401e40
  401e2b:	ff 15 40 40 40 00    	call   DWORD PTR ds:0x404040
  401e31:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e33:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401e36:	03 cb                	add    ecx,ebx
  401e38:	ff 15 70 40 40 00    	call   DWORD PTR ds:0x404070
  401e3e:	eb 02                	jmp    0x401e42
  401e40:	b0 01                	mov    al,0x1
  401e42:	88 45 d4             	mov    BYTE PTR [ebp-0x2c],al
  401e45:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  401e4c:	84 c0                	test   al,al
  401e4e:	75 0a                	jne    0x401e5a
  401e50:	b9 04 00 00 00       	mov    ecx,0x4
  401e55:	e9 e4 00 00 00       	jmp    0x401f3e
  401e5a:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  401e5e:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e60:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401e63:	8b 44 18 14          	mov    eax,DWORD PTR [eax+ebx*1+0x14]
  401e67:	25 c0 01 00 00       	and    eax,0x1c0
  401e6c:	83 f8 40             	cmp    eax,0x40
  401e6f:	74 35                	je     0x401ea6
  401e71:	85 ff                	test   edi,edi
  401e73:	7c 31                	jl     0x401ea6
  401e75:	7f 04                	jg     0x401e7b
  401e77:	85 f6                	test   esi,esi
  401e79:	74 2b                	je     0x401ea6
  401e7b:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e7d:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401e80:	8a 44 19 40          	mov    al,BYTE PTR [ecx+ebx*1+0x40]
  401e84:	8b 4c 19 38          	mov    ecx,DWORD PTR [ecx+ebx*1+0x38]
  401e88:	88 45 dc             	mov    BYTE PTR [ebp-0x24],al
  401e8b:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  401e8e:	ff 15 50 40 40 00    	call   DWORD PTR ds:0x404050
  401e94:	83 f8 ff             	cmp    eax,0xffffffff
  401e97:	75 05                	jne    0x401e9e
  401e99:	8d 48 05             	lea    ecx,[eax+0x5]
  401e9c:	eb 2d                	jmp    0x401ecb
  401e9e:	83 c6 ff             	add    esi,0xffffffff
  401ea1:	83 d7 ff             	adc    edi,0xffffffff
  401ea4:	eb cb                	jmp    0x401e71
  401ea6:	8b 03                	mov    eax,DWORD PTR [ebx]
  401ea8:	6a 00                	push   0x0
  401eaa:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  401ead:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401eb0:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  401eb3:	8b 4c 18 38          	mov    ecx,DWORD PTR [eax+ebx*1+0x38]
  401eb7:	ff 15 54 40 40 00    	call   DWORD PTR ds:0x404054
  401ebd:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
  401ec0:	75 04                	jne    0x401ec6
  401ec2:	85 d2                	test   edx,edx
  401ec4:	74 1c                	je     0x401ee2
  401ec6:	33 c9                	xor    ecx,ecx
  401ec8:	83 c9 04             	or     ecx,0x4
  401ecb:	8b 03                	mov    eax,DWORD PTR [ebx]
  401ecd:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401ed0:	c7 44 18 20 00 00 00 	mov    DWORD PTR [eax+ebx*1+0x20],0x0
  401ed7:	00 
  401ed8:	c7 44 18 24 00 00 00 	mov    DWORD PTR [eax+ebx*1+0x24],0x0
  401edf:	00 
  401ee0:	eb 55                	jmp    0x401f37
  401ee2:	33 c9                	xor    ecx,ecx
  401ee4:	85 ff                	test   edi,edi
  401ee6:	7c e3                	jl     0x401ecb
  401ee8:	7f 04                	jg     0x401eee
  401eea:	85 f6                	test   esi,esi
  401eec:	74 dd                	je     0x401ecb
  401eee:	8b 03                	mov    eax,DWORD PTR [ebx]
  401ef0:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401ef3:	8a 44 19 40          	mov    al,BYTE PTR [ecx+ebx*1+0x40]
  401ef7:	8b 4c 19 38          	mov    ecx,DWORD PTR [ecx+ebx*1+0x38]
  401efb:	88 45 d8             	mov    BYTE PTR [ebp-0x28],al
  401efe:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  401f01:	ff 15 50 40 40 00    	call   DWORD PTR ds:0x404050
  401f07:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  401f0a:	83 f8 ff             	cmp    eax,0xffffffff
  401f0d:	74 b9                	je     0x401ec8
  401f0f:	83 c6 ff             	add    esi,0xffffffff
  401f12:	83 d7 ff             	adc    edi,0xffffffff
  401f15:	eb cd                	jmp    0x401ee4
  401f17:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
  401f1a:	6a 01                	push   0x1
  401f1c:	6a 04                	push   0x4
  401f1e:	8b 02                	mov    eax,DWORD PTR [edx]
  401f20:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401f23:	03 ca                	add    ecx,edx
  401f25:	ff 15 44 40 40 00    	call   DWORD PTR ds:0x404044
  401f2b:	b8 31 1f 40 00       	mov    eax,0x401f31
  401f30:	c3                   	ret
  401f31:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  401f34:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
  401f37:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  401f3e:	8b 03                	mov    eax,DWORD PTR [ebx]
  401f40:	6a 00                	push   0x0
  401f42:	51                   	push   ecx
  401f43:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401f46:	03 cb                	add    ecx,ebx
  401f48:	ff 15 44 40 40 00    	call   DWORD PTR ds:0x404044
  401f4e:	ff 15 7c 40 40 00    	call   DWORD PTR ds:0x40407c
  401f54:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
  401f57:	84 c0                	test   al,al
  401f59:	75 08                	jne    0x401f63
  401f5b:	8b ce                	mov    ecx,esi
  401f5d:	ff 15 3c 40 40 00    	call   DWORD PTR ds:0x40403c
  401f63:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  401f6a:	8b 06                	mov    eax,DWORD PTR [esi]
  401f6c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401f6f:	8b 4c 30 38          	mov    ecx,DWORD PTR [eax+esi*1+0x38]
  401f73:	85 c9                	test   ecx,ecx
  401f75:	74 05                	je     0x401f7c
  401f77:	8b 01                	mov    eax,DWORD PTR [ecx]
  401f79:	ff 50 08             	call   DWORD PTR [eax+0x8]
  401f7c:	8b c3                	mov    eax,ebx
  401f7e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  401f81:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  401f88:	59                   	pop    ecx
  401f89:	5f                   	pop    edi
  401f8a:	5e                   	pop    esi
  401f8b:	5b                   	pop    ebx
  401f8c:	8b e5                	mov    esp,ebp
  401f8e:	5d                   	pop    ebp
  401f8f:	c3                   	ret
  401f90:	55                   	push   ebp
  401f91:	8b ec                	mov    ebp,esp
  401f93:	6a ff                	push   0xffffffff
  401f95:	68 dd 39 40 00       	push   0x4039dd
  401f9a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401fa0:	50                   	push   eax
  401fa1:	83 ec 30             	sub    esp,0x30
  401fa4:	53                   	push   ebx
  401fa5:	56                   	push   esi
  401fa6:	57                   	push   edi
  401fa7:	a1 40 60 40 00       	mov    eax,ds:0x406040
  401fac:	33 c5                	xor    eax,ebp
  401fae:	50                   	push   eax
  401faf:	8d 45 f4             	lea    eax,[ebp-0xc]
  401fb2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  401fb8:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
  401fbb:	8b f2                	mov    esi,edx
  401fbd:	8b f9                	mov    edi,ecx
  401fbf:	8b 07                	mov    eax,DWORD PTR [edi]
  401fc1:	33 db                	xor    ebx,ebx
  401fc3:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
  401fc6:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  401fc9:	88 5d ef             	mov    BYTE PTR [ebp-0x11],bl
  401fcc:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401fcf:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  401fd2:	8b 4c 38 38          	mov    ecx,DWORD PTR [eax+edi*1+0x38]
  401fd6:	85 c9                	test   ecx,ecx
  401fd8:	74 05                	je     0x401fdf
  401fda:	8b 01                	mov    eax,DWORD PTR [ecx]
  401fdc:	ff 50 04             	call   DWORD PTR [eax+0x4]
  401fdf:	6a 00                	push   0x0
  401fe1:	8b cf                	mov    ecx,edi
  401fe3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401fea:	ff 15 64 40 40 00    	call   DWORD PTR ds:0x404064
  401ff0:	88 45 d0             	mov    BYTE PTR [ebp-0x30],al
  401ff3:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  401ffa:	84 c0                	test   al,al
  401ffc:	0f 84 25 01 00 00    	je     0x402127
  402002:	8d 45 c4             	lea    eax,[ebp-0x3c]
  402005:	50                   	push   eax
  402006:	8b 07                	mov    eax,DWORD PTR [edi]
  402008:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  40200b:	03 cf                	add    ecx,edi
  40200d:	ff 15 58 40 40 00    	call   DWORD PTR ds:0x404058
  402013:	50                   	push   eax
  402014:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  402018:	e8 23 fc ff ff       	call   0x401c40
  40201d:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  402020:	83 c4 04             	add    esp,0x4
  402023:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  402026:	85 c9                	test   ecx,ecx
  402028:	74 11                	je     0x40203b
  40202a:	8b 01                	mov    eax,DWORD PTR [ecx]
  40202c:	ff 50 08             	call   DWORD PTR [eax+0x8]
  40202f:	8b c8                	mov    ecx,eax
  402031:	85 c9                	test   ecx,ecx
  402033:	74 06                	je     0x40203b
  402035:	8b 01                	mov    eax,DWORD PTR [ecx]
  402037:	6a 01                	push   0x1
  402039:	ff 10                	call   DWORD PTR [eax]
  40203b:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
  402042:	8b c6                	mov    eax,esi
  402044:	83 7e 14 0f          	cmp    DWORD PTR [esi+0x14],0xf
  402048:	76 02                	jbe    0x40204c
  40204a:	8b 06                	mov    eax,DWORD PTR [esi]
  40204c:	c6 00 00             	mov    BYTE PTR [eax],0x0
  40204f:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  402053:	8b 07                	mov    eax,DWORD PTR [edi]
  402055:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  402058:	83 7c 38 24 00       	cmp    DWORD PTR [eax+edi*1+0x24],0x0
  40205d:	8b 5c 38 20          	mov    ebx,DWORD PTR [eax+edi*1+0x20]
  402061:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  402064:	7c 0e                	jl     0x402074
  402066:	7f 04                	jg     0x40206c
  402068:	85 db                	test   ebx,ebx
  40206a:	74 08                	je     0x402074
  40206c:	81 fb ff ff ff 7f    	cmp    ebx,0x7fffffff
  402072:	72 08                	jb     0x40207c
  402074:	bb ff ff ff 7f       	mov    ebx,0x7fffffff
  402079:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  40207c:	8b 4c 38 38          	mov    ecx,DWORD PTR [eax+edi*1+0x38]
  402080:	ff 15 48 40 40 00    	call   DWORD PTR ds:0x404048
  402086:	8b d0                	mov    edx,eax
  402088:	85 db                	test   ebx,ebx
  40208a:	74 70                	je     0x4020fc
  40208c:	83 fa ff             	cmp    edx,0xffffffff
  40208f:	75 08                	jne    0x402099
  402091:	8d 58 02             	lea    ebx,[eax+0x2]
  402094:	e9 87 00 00 00       	jmp    0x402120
  402099:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40209c:	0f b6 ca             	movzx  ecx,dl
  40209f:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4020a2:	f6 04 48 48          	test   BYTE PTR [eax+ecx*2],0x48
  4020a6:	75 54                	jne    0x4020fc
  4020a8:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
  4020ab:	8b 5e 14             	mov    ebx,DWORD PTR [esi+0x14]
  4020ae:	88 55 dc             	mov    BYTE PTR [ebp-0x24],dl
  4020b1:	3b cb                	cmp    ecx,ebx
  4020b3:	73 19                	jae    0x4020ce
  4020b5:	8d 41 01             	lea    eax,[ecx+0x1]
  4020b8:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  4020bb:	8b c6                	mov    eax,esi
  4020bd:	83 fb 0f             	cmp    ebx,0xf
  4020c0:	76 02                	jbe    0x4020c4
  4020c2:	8b 06                	mov    eax,DWORD PTR [esi]
  4020c4:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
  4020c7:	c6 44 08 01 00       	mov    BYTE PTR [eax+ecx*1+0x1],0x0
  4020cc:	eb 12                	jmp    0x4020e0
  4020ce:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  4020d1:	c6 45 d8 00          	mov    BYTE PTR [ebp-0x28],0x0
  4020d5:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  4020d8:	51                   	push   ecx
  4020d9:	8b ce                	mov    ecx,esi
  4020db:	e8 30 05 00 00       	call   0x402610
  4020e0:	8b 07                	mov    eax,DWORD PTR [edi]
  4020e2:	8b 5d e8             	mov    ebx,DWORD PTR [ebp-0x18]
  4020e5:	4b                   	dec    ebx
  4020e6:	c6 45 ef 01          	mov    BYTE PTR [ebp-0x11],0x1
  4020ea:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  4020ed:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4020f0:	8b 4c 39 38          	mov    ecx,DWORD PTR [ecx+edi*1+0x38]
  4020f4:	ff 15 4c 40 40 00    	call   DWORD PTR ds:0x40404c
  4020fa:	eb 8a                	jmp    0x402086
  4020fc:	33 db                	xor    ebx,ebx
  4020fe:	eb 20                	jmp    0x402120
  402100:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  402103:	6a 01                	push   0x1
  402105:	6a 04                	push   0x4
  402107:	8b 02                	mov    eax,DWORD PTR [edx]
  402109:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  40210c:	03 ca                	add    ecx,edx
  40210e:	ff 15 44 40 40 00    	call   DWORD PTR ds:0x404044
  402114:	b8 1a 21 40 00       	mov    eax,0x40211a
  402119:	c3                   	ret
  40211a:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  40211d:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  402120:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  402127:	80 7d ef 00          	cmp    BYTE PTR [ebp-0x11],0x0
  40212b:	8b 07                	mov    eax,DWORD PTR [edi]
  40212d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  402130:	c7 44 38 20 00 00 00 	mov    DWORD PTR [eax+edi*1+0x20],0x0
  402137:	00 
  402138:	c7 44 38 24 00 00 00 	mov    DWORD PTR [eax+edi*1+0x24],0x0
  40213f:	00 
  402140:	75 03                	jne    0x402145
  402142:	83 cb 02             	or     ebx,0x2
  402145:	8b 07                	mov    eax,DWORD PTR [edi]
  402147:	6a 00                	push   0x0
  402149:	53                   	push   ebx
  40214a:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  40214d:	03 cf                	add    ecx,edi
  40214f:	ff 15 44 40 40 00    	call   DWORD PTR ds:0x404044
  402155:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
  40215c:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  40215f:	8b 08                	mov    ecx,DWORD PTR [eax]
  402161:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
  402164:	8b 4c 01 38          	mov    ecx,DWORD PTR [ecx+eax*1+0x38]
  402168:	85 c9                	test   ecx,ecx
  40216a:	74 05                	je     0x402171
  40216c:	8b 11                	mov    edx,DWORD PTR [ecx]
  40216e:	ff 52 08             	call   DWORD PTR [edx+0x8]
  402171:	8b c7                	mov    eax,edi
  402173:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  402176:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40217d:	59                   	pop    ecx
  40217e:	5f                   	pop    edi
  40217f:	5e                   	pop    esi
  402180:	5b                   	pop    ebx
  402181:	8b e5                	mov    esp,ebp
  402183:	5d                   	pop    ebp
  402184:	c3                   	ret
  402185:	cc                   	int3
  402186:	cc                   	int3
  402187:	cc                   	int3
  402188:	cc                   	int3
  402189:	cc                   	int3
  40218a:	cc                   	int3
  40218b:	cc                   	int3
  40218c:	cc                   	int3
  40218d:	cc                   	int3
  40218e:	cc                   	int3
  40218f:	cc                   	int3
  402190:	55                   	push   ebp
  402191:	8b ec                	mov    ebp,esp
  402193:	83 ec 08             	sub    esp,0x8
  402196:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402199:	53                   	push   ebx
  40219a:	56                   	push   esi
  40219b:	57                   	push   edi
  40219c:	83 78 14 0f          	cmp    DWORD PTR [eax+0x14],0xf
  4021a0:	8b d9                	mov    ebx,ecx
  4021a2:	8b fa                	mov    edi,edx
  4021a4:	89 5d fc             	mov    DWORD PTR [ebp-0x4],ebx
  4021a7:	8b d0                	mov    edx,eax
  4021a9:	76 02                	jbe    0x4021ad
  4021ab:	8b 10                	mov    edx,DWORD PTR [eax]
  4021ad:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  4021b0:	8b 47 14             	mov    eax,DWORD PTR [edi+0x14]
  4021b3:	8b 77 10             	mov    esi,DWORD PTR [edi+0x10]
  4021b6:	2b c6                	sub    eax,esi
  4021b8:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
  4021bb:	3b c8                	cmp    ecx,eax
  4021bd:	77 26                	ja     0x4021e5
  4021bf:	83 7f 14 0f          	cmp    DWORD PTR [edi+0x14],0xf
  4021c3:	8d 04 0e             	lea    eax,[esi+ecx*1]
  4021c6:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  4021c9:	8b c7                	mov    eax,edi
  4021cb:	76 02                	jbe    0x4021cf
  4021cd:	8b 07                	mov    eax,DWORD PTR [edi]
  4021cf:	51                   	push   ecx
  4021d0:	03 f0                	add    esi,eax
  4021d2:	52                   	push   edx
  4021d3:	56                   	push   esi
  4021d4:	e8 2a 16 00 00       	call   0x403803
  4021d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4021dc:	83 c4 0c             	add    esp,0xc
  4021df:	c6 04 06 00          	mov    BYTE PTR [esi+eax*1],0x0
  4021e3:	eb 13                	jmp    0x4021f8
  4021e5:	51                   	push   ecx
  4021e6:	52                   	push   edx
  4021e7:	c6 45 08 00          	mov    BYTE PTR [ebp+0x8],0x0
  4021eb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4021ee:	51                   	push   ecx
  4021ef:	8b cf                	mov    ecx,edi
  4021f1:	e8 5a 05 00 00       	call   0x402750
  4021f6:	8b f8                	mov    edi,eax
  4021f8:	0f 57 c0             	xorps  xmm0,xmm0
  4021fb:	8b c3                	mov    eax,ebx
  4021fd:	0f 11 03             	movups XMMWORD PTR [ebx],xmm0
  402200:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  402207:	c7 43 14 00 00 00 00 	mov    DWORD PTR [ebx+0x14],0x0
  40220e:	0f 10 07             	movups xmm0,XMMWORD PTR [edi]
  402211:	0f 11 03             	movups XMMWORD PTR [ebx],xmm0
  402214:	f3 0f 7e 47 10       	movq   xmm0,QWORD PTR [edi+0x10]
  402219:	66 0f d6 43 10       	movq   QWORD PTR [ebx+0x10],xmm0
  40221e:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
  402225:	c7 47 14 0f 00 00 00 	mov    DWORD PTR [edi+0x14],0xf
  40222c:	c6 07 00             	mov    BYTE PTR [edi],0x0
  40222f:	5f                   	pop    edi
  402230:	5e                   	pop    esi
  402231:	5b                   	pop    ebx
  402232:	8b e5                	mov    esp,ebp
  402234:	5d                   	pop    ebp
  402235:	c3                   	ret
  402236:	cc                   	int3
  402237:	cc                   	int3
  402238:	cc                   	int3
  402239:	cc                   	int3
  40223a:	cc                   	int3
  40223b:	cc                   	int3
  40223c:	cc                   	int3
  40223d:	cc                   	int3
  40223e:	cc                   	int3
  40223f:	cc                   	int3
  402240:	55                   	push   ebp
  402241:	8b ec                	mov    ebp,esp
  402243:	83 ec 18             	sub    esp,0x18
  402246:	53                   	push   ebx
  402247:	8b d9                	mov    ebx,ecx
  402249:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
  40224c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40224f:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  402254:	56                   	push   esi
  402255:	8b 72 10             	mov    esi,DWORD PTR [edx+0x10]
  402258:	2b c6                	sub    eax,esi
  40225a:	57                   	push   edi
  40225b:	8b 79 10             	mov    edi,DWORD PTR [ecx+0x10]
  40225e:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  402261:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  402264:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
  402267:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
  40226a:	89 7d f4             	mov    DWORD PTR [ebp-0xc],edi
  40226d:	3b c7                	cmp    eax,edi
  40226f:	0f 82 e3 00 00 00    	jb     0x402358
  402275:	83 7a 14 0f          	cmp    DWORD PTR [edx+0x14],0xf
  402279:	76 05                	jbe    0x402280
  40227b:	8b 12                	mov    edx,DWORD PTR [edx]
  40227d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
  402280:	83 79 14 0f          	cmp    DWORD PTR [ecx+0x14],0xf
  402284:	76 05                	jbe    0x40228b
  402286:	8b 09                	mov    ecx,DWORD PTR [ecx]
  402288:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
  40228b:	8d 0c 37             	lea    ecx,[edi+esi*1]
  40228e:	0f 57 c0             	xorps  xmm0,xmm0
  402291:	be 0f 00 00 00       	mov    esi,0xf
  402296:	89 4d f8             	mov    DWORD PTR [ebp-0x8],ecx
  402299:	8b fb                	mov    edi,ebx
  40229b:	0f 11 03             	movups XMMWORD PTR [ebx],xmm0
  40229e:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  4022a5:	c7 43 14 00 00 00 00 	mov    DWORD PTR [ebx+0x14],0x0
  4022ac:	3b ce                	cmp    ecx,esi
  4022ae:	76 75                	jbe    0x402325
  4022b0:	8b f1                	mov    esi,ecx
  4022b2:	83 ce 0f             	or     esi,0xf
  4022b5:	81 fe ff ff ff 7f    	cmp    esi,0x7fffffff
  4022bb:	76 25                	jbe    0x4022e2
  4022bd:	b9 00 00 00 80       	mov    ecx,0x80000000
  4022c2:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4022c7:	83 c1 23             	add    ecx,0x23
  4022ca:	51                   	push   ecx
  4022cb:	e8 a5 06 00 00       	call   0x402975
  4022d0:	83 c4 04             	add    esp,0x4
  4022d3:	85 c0                	test   eax,eax
  4022d5:	75 30                	jne    0x402307
  4022d7:	50                   	push   eax
  4022d8:	50                   	push   eax
  4022d9:	50                   	push   eax
  4022da:	50                   	push   eax
  4022db:	50                   	push   eax
  4022dc:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  4022e2:	b8 16 00 00 00       	mov    eax,0x16
  4022e7:	3b f0                	cmp    esi,eax
  4022e9:	0f 42 f0             	cmovb  esi,eax
  4022ec:	8d 46 01             	lea    eax,[esi+0x1]
  4022ef:	85 c0                	test   eax,eax
  4022f1:	75 04                	jne    0x4022f7
  4022f3:	33 ff                	xor    edi,edi
  4022f5:	eb 2c                	jmp    0x402323
  4022f7:	3d 00 10 00 00       	cmp    eax,0x1000
  4022fc:	72 14                	jb     0x402312
  4022fe:	8d 48 23             	lea    ecx,[eax+0x23]
  402301:	3b c8                	cmp    ecx,eax
  402303:	76 58                	jbe    0x40235d
  402305:	eb c3                	jmp    0x4022ca
  402307:	8d 78 23             	lea    edi,[eax+0x23]
  40230a:	83 e7 e0             	and    edi,0xffffffe0
  40230d:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  402310:	eb 0b                	jmp    0x40231d
  402312:	50                   	push   eax
  402313:	e8 5d 06 00 00       	call   0x402975
  402318:	83 c4 04             	add    esp,0x4
  40231b:	8b f8                	mov    edi,eax
  40231d:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
  402320:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  402323:	89 3b                	mov    DWORD PTR [ebx],edi
  402325:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
  402328:	8b 75 ec             	mov    esi,DWORD PTR [ebp-0x14]
  40232b:	56                   	push   esi
  40232c:	52                   	push   edx
  40232d:	57                   	push   edi
  40232e:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
  402331:	e8 c7 14 00 00       	call   0x4037fd
  402336:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
  402339:	8d 0c 37             	lea    ecx,[edi+esi*1]
  40233c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  40233f:	51                   	push   ecx
  402340:	e8 b8 14 00 00       	call   0x4037fd
  402345:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  402348:	83 c4 18             	add    esp,0x18
  40234b:	c6 04 07 00          	mov    BYTE PTR [edi+eax*1],0x0
  40234f:	8b c3                	mov    eax,ebx
  402351:	5f                   	pop    edi
  402352:	5e                   	pop    esi
  402353:	5b                   	pop    ebx
  402354:	8b e5                	mov    esp,ebp
  402356:	5d                   	pop    ebp
  402357:	c3                   	ret
  402358:	e8 13 ee ff ff       	call   0x401170
  40235d:	e8 6e ed ff ff       	call   0x4010d0
  402362:	cc                   	int3
  402363:	cc                   	int3
  402364:	cc                   	int3
  402365:	cc                   	int3
  402366:	cc                   	int3
  402367:	cc                   	int3
  402368:	cc                   	int3
  402369:	cc                   	int3
  40236a:	cc                   	int3
  40236b:	cc                   	int3
  40236c:	cc                   	int3
  40236d:	cc                   	int3
  40236e:	cc                   	int3
  40236f:	cc                   	int3
  402370:	56                   	push   esi
  402371:	8b f1                	mov    esi,ecx
  402373:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
  402376:	83 f9 0f             	cmp    ecx,0xf
  402379:	76 27                	jbe    0x4023a2
  40237b:	8b 06                	mov    eax,DWORD PTR [esi]
  40237d:	41                   	inc    ecx
  40237e:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  402384:	72 12                	jb     0x402398
  402386:	8b 50 fc             	mov    edx,DWORD PTR [eax-0x4]
  402389:	83 c1 23             	add    ecx,0x23
  40238c:	2b c2                	sub    eax,edx
  40238e:	83 c0 fc             	add    eax,0xfffffffc
  402391:	83 f8 1f             	cmp    eax,0x1f
  402394:	77 1f                	ja     0x4023b5
  402396:	8b c2                	mov    eax,edx
  402398:	51                   	push   ecx
  402399:	50                   	push   eax
  40239a:	e8 06 06 00 00       	call   0x4029a5
  40239f:	83 c4 08             	add    esp,0x8
  4023a2:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
  4023a9:	c7 46 14 0f 00 00 00 	mov    DWORD PTR [esi+0x14],0xf
  4023b0:	c6 06 00             	mov    BYTE PTR [esi],0x0
  4023b3:	5e                   	pop    esi
  4023b4:	c3                   	ret
  4023b5:	6a 00                	push   0x0
  4023b7:	6a 00                	push   0x0
  4023b9:	6a 00                	push   0x0
  4023bb:	6a 00                	push   0x0
  4023bd:	6a 00                	push   0x0
  4023bf:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  4023c5:	cc                   	int3
  4023c6:	cc                   	int3
  4023c7:	cc                   	int3
  4023c8:	cc                   	int3
  4023c9:	cc                   	int3
  4023ca:	cc                   	int3
  4023cb:	cc                   	int3
  4023cc:	cc                   	int3
  4023cd:	cc                   	int3
  4023ce:	cc                   	int3
  4023cf:	cc                   	int3
  4023d0:	55                   	push   ebp
  4023d1:	8b ec                	mov    ebp,esp
  4023d3:	83 ec 08             	sub    esp,0x8
  4023d6:	53                   	push   ebx
  4023d7:	56                   	push   esi
  4023d8:	8b d9                	mov    ebx,ecx
  4023da:	0f 57 c0             	xorps  xmm0,xmm0
  4023dd:	57                   	push   edi
  4023de:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  4023e1:	8b f7                	mov    esi,edi
  4023e3:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
  4023e6:	0f 11 03             	movups XMMWORD PTR [ebx],xmm0
  4023e9:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  4023f0:	c7 43 14 00 00 00 00 	mov    DWORD PTR [ebx+0x14],0x0
  4023f7:	8d 4e 01             	lea    ecx,[esi+0x1]
  4023fa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
  402400:	8a 06                	mov    al,BYTE PTR [esi]
  402402:	46                   	inc    esi
  402403:	84 c0                	test   al,al
  402405:	75 f9                	jne    0x402400
  402407:	2b f1                	sub    esi,ecx
  402409:	81 fe ff ff ff 7f    	cmp    esi,0x7fffffff
  40240f:	0f 87 bc 00 00 00    	ja     0x4024d1
  402415:	83 fe 0f             	cmp    esi,0xf
  402418:	77 24                	ja     0x40243e
  40241a:	56                   	push   esi
  40241b:	57                   	push   edi
  40241c:	53                   	push   ebx
  40241d:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
  402420:	c7 43 14 0f 00 00 00 	mov    DWORD PTR [ebx+0x14],0xf
  402427:	e8 d1 13 00 00       	call   0x4037fd
  40242c:	c6 04 33 00          	mov    BYTE PTR [ebx+esi*1],0x0
  402430:	83 c4 0c             	add    esp,0xc
  402433:	8b c3                	mov    eax,ebx
  402435:	5f                   	pop    edi
  402436:	5e                   	pop    esi
  402437:	5b                   	pop    ebx
  402438:	8b e5                	mov    esp,ebp
  40243a:	5d                   	pop    ebp
  40243b:	c2 04 00             	ret    0x4
  40243e:	8b fe                	mov    edi,esi
  402440:	83 cf 0f             	or     edi,0xf
  402443:	81 ff ff ff ff 7f    	cmp    edi,0x7fffffff
  402449:	76 27                	jbe    0x402472
  40244b:	b9 00 00 00 80       	mov    ecx,0x80000000
  402450:	bf ff ff ff 7f       	mov    edi,0x7fffffff
  402455:	83 c1 23             	add    ecx,0x23
  402458:	51                   	push   ecx
  402459:	e8 17 05 00 00       	call   0x402975
  40245e:	8b c8                	mov    ecx,eax
  402460:	83 c4 04             	add    esp,0x4
  402463:	85 c9                	test   ecx,ecx
  402465:	75 2c                	jne    0x402493
  402467:	50                   	push   eax
  402468:	50                   	push   eax
  402469:	50                   	push   eax
  40246a:	50                   	push   eax
  40246b:	50                   	push   eax
  40246c:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  402472:	b8 16 00 00 00       	mov    eax,0x16
  402477:	3b f8                	cmp    edi,eax
  402479:	0f 42 f8             	cmovb  edi,eax
  40247c:	8d 47 01             	lea    eax,[edi+0x1]
  40247f:	85 c0                	test   eax,eax
  402481:	74 24                	je     0x4024a7
  402483:	3d 00 10 00 00       	cmp    eax,0x1000
  402488:	72 14                	jb     0x40249e
  40248a:	8d 48 23             	lea    ecx,[eax+0x23]
  40248d:	3b c8                	cmp    ecx,eax
  40248f:	76 45                	jbe    0x4024d6
  402491:	eb c5                	jmp    0x402458
  402493:	8d 41 23             	lea    eax,[ecx+0x23]
  402496:	83 e0 e0             	and    eax,0xffffffe0
  402499:	89 48 fc             	mov    DWORD PTR [eax-0x4],ecx
  40249c:	eb 09                	jmp    0x4024a7
  40249e:	50                   	push   eax
  40249f:	e8 d1 04 00 00       	call   0x402975
  4024a4:	83 c4 04             	add    esp,0x4
  4024a7:	56                   	push   esi
  4024a8:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
  4024ab:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4024ae:	50                   	push   eax
  4024af:	89 03                	mov    DWORD PTR [ebx],eax
  4024b1:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
  4024b4:	89 7b 14             	mov    DWORD PTR [ebx+0x14],edi
  4024b7:	e8 41 13 00 00       	call   0x4037fd
  4024bc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4024bf:	83 c4 0c             	add    esp,0xc
  4024c2:	5f                   	pop    edi
  4024c3:	c6 04 30 00          	mov    BYTE PTR [eax+esi*1],0x0
  4024c7:	8b c3                	mov    eax,ebx
  4024c9:	5e                   	pop    esi
  4024ca:	5b                   	pop    ebx
  4024cb:	8b e5                	mov    esp,ebp
  4024cd:	5d                   	pop    ebp
  4024ce:	c2 04 00             	ret    0x4
  4024d1:	e8 9a ec ff ff       	call   0x401170
  4024d6:	e8 f5 eb ff ff       	call   0x4010d0
  4024db:	cc                   	int3
  4024dc:	cc                   	int3
  4024dd:	cc                   	int3
  4024de:	cc                   	int3
  4024df:	cc                   	int3
  4024e0:	55                   	push   ebp
  4024e1:	8b ec                	mov    ebp,esp
  4024e3:	6a ff                	push   0xffffffff
  4024e5:	68 00 3a 40 00       	push   0x403a00
  4024ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4024f0:	50                   	push   eax
  4024f1:	a1 40 60 40 00       	mov    eax,ds:0x406040
  4024f6:	33 c5                	xor    eax,ebp
  4024f8:	50                   	push   eax
  4024f9:	8d 45 f4             	lea    eax,[ebp-0xc]
  4024fc:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402502:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  402509:	8b 09                	mov    ecx,DWORD PTR [ecx]
  40250b:	8b 01                	mov    eax,DWORD PTR [ecx]
  40250d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  402510:	8b 4c 08 38          	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  402514:	85 c9                	test   ecx,ecx
  402516:	74 05                	je     0x40251d
  402518:	8b 01                	mov    eax,DWORD PTR [ecx]
  40251a:	ff 50 08             	call   DWORD PTR [eax+0x8]
  40251d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  402520:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402527:	59                   	pop    ecx
  402528:	8b e5                	mov    esp,ebp
  40252a:	5d                   	pop    ebp
  40252b:	c3                   	ret
  40252c:	cc                   	int3
  40252d:	cc                   	int3
  40252e:	cc                   	int3
  40252f:	cc                   	int3
  402530:	cc                   	int3
  402531:	cc                   	int3
  402532:	cc                   	int3
  402533:	cc                   	int3
  402534:	cc                   	int3
  402535:	cc                   	int3
  402536:	cc                   	int3
  402537:	cc                   	int3
  402538:	cc                   	int3
  402539:	cc                   	int3
  40253a:	cc                   	int3
  40253b:	cc                   	int3
  40253c:	cc                   	int3
  40253d:	cc                   	int3
  40253e:	cc                   	int3
  40253f:	cc                   	int3
  402540:	55                   	push   ebp
  402541:	8b ec                	mov    ebp,esp
  402543:	6a ff                	push   0xffffffff
  402545:	68 20 3a 40 00       	push   0x403a20
  40254a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402550:	50                   	push   eax
  402551:	a1 40 60 40 00       	mov    eax,ds:0x406040
  402556:	33 c5                	xor    eax,ebp
  402558:	50                   	push   eax
  402559:	8d 45 f4             	lea    eax,[ebp-0xc]
  40255c:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402562:	8b 09                	mov    ecx,DWORD PTR [ecx]
  402564:	8b 01                	mov    eax,DWORD PTR [ecx]
  402566:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  402569:	8b 4c 08 38          	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  40256d:	85 c9                	test   ecx,ecx
  40256f:	74 05                	je     0x402576
  402571:	8b 01                	mov    eax,DWORD PTR [ecx]
  402573:	ff 50 08             	call   DWORD PTR [eax+0x8]
  402576:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  402579:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402580:	59                   	pop    ecx
  402581:	8b e5                	mov    esp,ebp
  402583:	5d                   	pop    ebp
  402584:	c3                   	ret
  402585:	cc                   	int3
  402586:	cc                   	int3
  402587:	cc                   	int3
  402588:	cc                   	int3
  402589:	cc                   	int3
  40258a:	cc                   	int3
  40258b:	cc                   	int3
  40258c:	cc                   	int3
  40258d:	cc                   	int3
  40258e:	cc                   	int3
  40258f:	cc                   	int3
  402590:	55                   	push   ebp
  402591:	8b ec                	mov    ebp,esp
  402593:	6a ff                	push   0xffffffff
  402595:	68 40 3a 40 00       	push   0x403a40
  40259a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4025a0:	50                   	push   eax
  4025a1:	56                   	push   esi
  4025a2:	a1 40 60 40 00       	mov    eax,ds:0x406040
  4025a7:	33 c5                	xor    eax,ebp
  4025a9:	50                   	push   eax
  4025aa:	8d 45 f4             	lea    eax,[ebp-0xc]
  4025ad:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4025b3:	8b f1                	mov    esi,ecx
  4025b5:	ff 15 7c 40 40 00    	call   DWORD PTR ds:0x40407c
  4025bb:	84 c0                	test   al,al
  4025bd:	75 08                	jne    0x4025c7
  4025bf:	8b 0e                	mov    ecx,DWORD PTR [esi]
  4025c1:	ff 15 3c 40 40 00    	call   DWORD PTR ds:0x40403c
  4025c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4025ce:	8b 0e                	mov    ecx,DWORD PTR [esi]
  4025d0:	8b 01                	mov    eax,DWORD PTR [ecx]
  4025d2:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4025d5:	8b 4c 08 38          	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  4025d9:	85 c9                	test   ecx,ecx
  4025db:	74 05                	je     0x4025e2
  4025dd:	8b 01                	mov    eax,DWORD PTR [ecx]
  4025df:	ff 50 08             	call   DWORD PTR [eax+0x8]
  4025e2:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4025e5:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4025ec:	59                   	pop    ecx
  4025ed:	5e                   	pop    esi
  4025ee:	8b e5                	mov    esp,ebp
  4025f0:	5d                   	pop    ebp
  4025f1:	c3                   	ret
  4025f2:	cc                   	int3
  4025f3:	cc                   	int3
  4025f4:	cc                   	int3
  4025f5:	cc                   	int3
  4025f6:	cc                   	int3
  4025f7:	cc                   	int3
  4025f8:	cc                   	int3
  4025f9:	cc                   	int3
  4025fa:	cc                   	int3
  4025fb:	cc                   	int3
  4025fc:	cc                   	int3
  4025fd:	cc                   	int3
  4025fe:	cc                   	int3
  4025ff:	cc                   	int3
  402600:	8b 09                	mov    ecx,DWORD PTR [ecx]
  402602:	85 c9                	test   ecx,ecx
  402604:	74 06                	je     0x40260c
  402606:	8b 01                	mov    eax,DWORD PTR [ecx]
  402608:	6a 01                	push   0x1
  40260a:	ff 10                	call   DWORD PTR [eax]
  40260c:	c3                   	ret
  40260d:	cc                   	int3
  40260e:	cc                   	int3
  40260f:	cc                   	int3
  402610:	55                   	push   ebp
  402611:	8b ec                	mov    ebp,esp
  402613:	83 ec 08             	sub    esp,0x8
  402616:	53                   	push   ebx
  402617:	8b d9                	mov    ebx,ecx
  402619:	ba ff ff ff 7f       	mov    edx,0x7fffffff
  40261e:	8b c2                	mov    eax,edx
  402620:	56                   	push   esi
  402621:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
  402624:	2b c1                	sub    eax,ecx
  402626:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  402629:	83 f8 01             	cmp    eax,0x1
  40262c:	0f 82 11 01 00 00    	jb     0x402743
  402632:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
  402635:	57                   	push   edi
  402636:	8d 79 01             	lea    edi,[ecx+0x1]
  402639:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  40263c:	83 cf 0f             	or     edi,0xf
  40263f:	3b fa                	cmp    edi,edx
  402641:	76 26                	jbe    0x402669
  402643:	8b fa                	mov    edi,edx
  402645:	b8 00 00 00 80       	mov    eax,0x80000000
  40264a:	83 c0 23             	add    eax,0x23
  40264d:	50                   	push   eax
  40264e:	e8 22 03 00 00       	call   0x402975
  402653:	83 c4 04             	add    esp,0x4
  402656:	85 c0                	test   eax,eax
  402658:	0f 84 b0 00 00 00    	je     0x40270e
  40265e:	8d 70 23             	lea    esi,[eax+0x23]
  402661:	83 e6 e0             	and    esi,0xffffffe0
  402664:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  402667:	eb 43                	jmp    0x4026ac
  402669:	8b c6                	mov    eax,esi
  40266b:	d1 e8                	shr    eax,1
  40266d:	2b d0                	sub    edx,eax
  40266f:	3b f2                	cmp    esi,edx
  402671:	76 07                	jbe    0x40267a
  402673:	bf ff ff ff 7f       	mov    edi,0x7fffffff
  402678:	eb cb                	jmp    0x402645
  40267a:	03 c6                	add    eax,esi
  40267c:	3b f8                	cmp    edi,eax
  40267e:	0f 42 f8             	cmovb  edi,eax
  402681:	8d 57 01             	lea    edx,[edi+0x1]
  402684:	85 d2                	test   edx,edx
  402686:	75 04                	jne    0x40268c
  402688:	33 f6                	xor    esi,esi
  40268a:	eb 23                	jmp    0x4026af
  40268c:	81 fa 00 10 00 00    	cmp    edx,0x1000
  402692:	72 0d                	jb     0x4026a1
  402694:	8d 42 23             	lea    eax,[edx+0x23]
  402697:	3b c2                	cmp    eax,edx
  402699:	0f 86 a9 00 00 00    	jbe    0x402748
  40269f:	eb ac                	jmp    0x40264d
  4026a1:	52                   	push   edx
  4026a2:	e8 ce 02 00 00       	call   0x402975
  4026a7:	83 c4 04             	add    esp,0x4
  4026aa:	8b f0                	mov    esi,eax
  4026ac:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  4026af:	83 7d f8 0f          	cmp    DWORD PTR [ebp-0x8],0xf
  4026b3:	8d 41 01             	lea    eax,[ecx+0x1]
  4026b6:	89 43 10             	mov    DWORD PTR [ebx+0x10],eax
  4026b9:	89 7b 14             	mov    DWORD PTR [ebx+0x14],edi
  4026bc:	51                   	push   ecx
  4026bd:	76 5f                	jbe    0x40271e
  4026bf:	8b 3b                	mov    edi,DWORD PTR [ebx]
  4026c1:	57                   	push   edi
  4026c2:	56                   	push   esi
  4026c3:	e8 35 11 00 00       	call   0x4037fd
  4026c8:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4026cb:	83 c4 0c             	add    esp,0xc
  4026ce:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
  4026d1:	8a 45 10             	mov    al,BYTE PTR [ebp+0x10]
  4026d4:	41                   	inc    ecx
  4026d5:	88 04 16             	mov    BYTE PTR [esi+edx*1],al
  4026d8:	c6 44 16 01 00       	mov    BYTE PTR [esi+edx*1+0x1],0x0
  4026dd:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4026e3:	72 12                	jb     0x4026f7
  4026e5:	8b 57 fc             	mov    edx,DWORD PTR [edi-0x4]
  4026e8:	83 c1 23             	add    ecx,0x23
  4026eb:	2b fa                	sub    edi,edx
  4026ed:	8d 47 fc             	lea    eax,[edi-0x4]
  4026f0:	83 f8 1f             	cmp    eax,0x1f
  4026f3:	77 19                	ja     0x40270e
  4026f5:	8b fa                	mov    edi,edx
  4026f7:	51                   	push   ecx
  4026f8:	57                   	push   edi
  4026f9:	e8 a7 02 00 00       	call   0x4029a5
  4026fe:	83 c4 08             	add    esp,0x8
  402701:	89 33                	mov    DWORD PTR [ebx],esi
  402703:	8b c3                	mov    eax,ebx
  402705:	5f                   	pop    edi
  402706:	5e                   	pop    esi
  402707:	5b                   	pop    ebx
  402708:	8b e5                	mov    esp,ebp
  40270a:	5d                   	pop    ebp
  40270b:	c2 0c 00             	ret    0xc
  40270e:	6a 00                	push   0x0
  402710:	6a 00                	push   0x0
  402712:	6a 00                	push   0x0
  402714:	6a 00                	push   0x0
  402716:	6a 00                	push   0x0
  402718:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  40271e:	53                   	push   ebx
  40271f:	56                   	push   esi
  402720:	e8 d8 10 00 00       	call   0x4037fd
  402725:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  402728:	83 c4 0c             	add    esp,0xc
  40272b:	8a 4d 10             	mov    cl,BYTE PTR [ebp+0x10]
  40272e:	8b c3                	mov    eax,ebx
  402730:	88 0c 16             	mov    BYTE PTR [esi+edx*1],cl
  402733:	c6 44 16 01 00       	mov    BYTE PTR [esi+edx*1+0x1],0x0
  402738:	5f                   	pop    edi
  402739:	89 33                	mov    DWORD PTR [ebx],esi
  40273b:	5e                   	pop    esi
  40273c:	5b                   	pop    ebx
  40273d:	8b e5                	mov    esp,ebp
  40273f:	5d                   	pop    ebp
  402740:	c2 0c 00             	ret    0xc
  402743:	e8 28 ea ff ff       	call   0x401170
  402748:	e8 83 e9 ff ff       	call   0x4010d0
  40274d:	cc                   	int3
  40274e:	cc                   	int3
  40274f:	cc                   	int3
  402750:	55                   	push   ebp
  402751:	8b ec                	mov    ebp,esp
  402753:	83 ec 10             	sub    esp,0x10
  402756:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  402759:	53                   	push   ebx
  40275a:	8b d9                	mov    ebx,ecx
  40275c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40275f:	b9 ff ff ff 7f       	mov    ecx,0x7fffffff
  402764:	8b c1                	mov    eax,ecx
  402766:	56                   	push   esi
  402767:	8b 53 10             	mov    edx,DWORD PTR [ebx+0x10]
  40276a:	2b c2                	sub    eax,edx
  40276c:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40276f:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
  402772:	3b c6                	cmp    eax,esi
  402774:	0f 82 2e 01 00 00    	jb     0x4028a8
  40277a:	8d 04 32             	lea    eax,[edx+esi*1]
  40277d:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
  402780:	57                   	push   edi
  402781:	8b f8                	mov    edi,eax
  402783:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  402786:	83 cf 0f             	or     edi,0xf
  402789:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  40278c:	3b f9                	cmp    edi,ecx
  40278e:	76 26                	jbe    0x4027b6
  402790:	8b f9                	mov    edi,ecx
  402792:	b8 00 00 00 80       	mov    eax,0x80000000
  402797:	83 c0 23             	add    eax,0x23
  40279a:	50                   	push   eax
  40279b:	e8 d5 01 00 00       	call   0x402975
  4027a0:	83 c4 04             	add    esp,0x4
  4027a3:	85 c0                	test   eax,eax
  4027a5:	0f 84 c4 00 00 00    	je     0x40286f
  4027ab:	8d 70 23             	lea    esi,[eax+0x23]
  4027ae:	83 e6 e0             	and    esi,0xffffffe0
  4027b1:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  4027b4:	eb 43                	jmp    0x4027f9
  4027b6:	8b c6                	mov    eax,esi
  4027b8:	d1 e8                	shr    eax,1
  4027ba:	2b c8                	sub    ecx,eax
  4027bc:	3b f1                	cmp    esi,ecx
  4027be:	76 07                	jbe    0x4027c7
  4027c0:	bf ff ff ff 7f       	mov    edi,0x7fffffff
  4027c5:	eb cb                	jmp    0x402792
  4027c7:	03 c6                	add    eax,esi
  4027c9:	3b f8                	cmp    edi,eax
  4027cb:	0f 42 f8             	cmovb  edi,eax
  4027ce:	8d 4f 01             	lea    ecx,[edi+0x1]
  4027d1:	85 c9                	test   ecx,ecx
  4027d3:	75 04                	jne    0x4027d9
  4027d5:	33 f6                	xor    esi,esi
  4027d7:	eb 23                	jmp    0x4027fc
  4027d9:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  4027df:	72 0d                	jb     0x4027ee
  4027e1:	8d 41 23             	lea    eax,[ecx+0x23]
  4027e4:	3b c1                	cmp    eax,ecx
  4027e6:	0f 86 c1 00 00 00    	jbe    0x4028ad
  4027ec:	eb ac                	jmp    0x40279a
  4027ee:	51                   	push   ecx
  4027ef:	e8 81 01 00 00       	call   0x402975
  4027f4:	83 c4 04             	add    esp,0x4
  4027f7:	8b f0                	mov    esi,eax
  4027f9:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4027fc:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4027ff:	89 43 10             	mov    DWORD PTR [ebx+0x10],eax
  402802:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  402805:	89 7b 14             	mov    DWORD PTR [ebx+0x14],edi
  402808:	8d 3c 16             	lea    edi,[esi+edx*1]
  40280b:	03 c7                	add    eax,edi
  40280d:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
  402810:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
  402814:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  402817:	52                   	push   edx
  402818:	76 65                	jbe    0x40287f
  40281a:	8b 3b                	mov    edi,DWORD PTR [ebx]
  40281c:	57                   	push   edi
  40281d:	56                   	push   esi
  40281e:	e8 da 0f 00 00       	call   0x4037fd
  402823:	ff 75 14             	push   DWORD PTR [ebp+0x14]
  402826:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  402829:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
  40282c:	e8 cc 0f 00 00       	call   0x4037fd
  402831:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  402834:	83 c4 18             	add    esp,0x18
  402837:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40283a:	41                   	inc    ecx
  40283b:	c6 00 00             	mov    BYTE PTR [eax],0x0
  40283e:	81 f9 00 10 00 00    	cmp    ecx,0x1000
  402844:	72 12                	jb     0x402858
  402846:	8b 57 fc             	mov    edx,DWORD PTR [edi-0x4]
  402849:	83 c1 23             	add    ecx,0x23
  40284c:	2b fa                	sub    edi,edx
  40284e:	8d 47 fc             	lea    eax,[edi-0x4]
  402851:	83 f8 1f             	cmp    eax,0x1f
  402854:	77 19                	ja     0x40286f
  402856:	8b fa                	mov    edi,edx
  402858:	51                   	push   ecx
  402859:	57                   	push   edi
  40285a:	e8 46 01 00 00       	call   0x4029a5
  40285f:	83 c4 08             	add    esp,0x8
  402862:	89 33                	mov    DWORD PTR [ebx],esi
  402864:	8b c3                	mov    eax,ebx
  402866:	5f                   	pop    edi
  402867:	5e                   	pop    esi
  402868:	5b                   	pop    ebx
  402869:	8b e5                	mov    esp,ebp
  40286b:	5d                   	pop    ebp
  40286c:	c2 10 00             	ret    0x10
  40286f:	6a 00                	push   0x0
  402871:	6a 00                	push   0x0
  402873:	6a 00                	push   0x0
  402875:	6a 00                	push   0x0
  402877:	6a 00                	push   0x0
  402879:	ff 15 08 41 40 00    	call   DWORD PTR ds:0x404108
  40287f:	53                   	push   ebx
  402880:	56                   	push   esi
  402881:	e8 77 0f 00 00       	call   0x4037fd
  402886:	ff 75 14             	push   DWORD PTR [ebp+0x14]
  402889:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  40288c:	57                   	push   edi
  40288d:	e8 6b 0f 00 00       	call   0x4037fd
  402892:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  402895:	83 c4 18             	add    esp,0x18
  402898:	c6 00 00             	mov    BYTE PTR [eax],0x0
  40289b:	8b c3                	mov    eax,ebx
  40289d:	5f                   	pop    edi
  40289e:	89 33                	mov    DWORD PTR [ebx],esi
  4028a0:	5e                   	pop    esi
  4028a1:	5b                   	pop    ebx
  4028a2:	8b e5                	mov    esp,ebp
  4028a4:	5d                   	pop    ebp
  4028a5:	c2 10 00             	ret    0x10
  4028a8:	e8 c3 e8 ff ff       	call   0x401170
  4028ad:	e8 1e e8 ff ff       	call   0x4010d0
  4028b2:	cc                   	int3
  4028b3:	56                   	push   esi
  4028b4:	57                   	push   edi
  4028b5:	8b 79 04             	mov    edi,DWORD PTR [ecx+0x4]
  4028b8:	8b 07                	mov    eax,DWORD PTR [edi]
  4028ba:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
  4028bd:	8b ce                	mov    ecx,esi
  4028bf:	ff 15 4c 41 40 00    	call   DWORD PTR ds:0x40414c
  4028c5:	8b cf                	mov    ecx,edi
  4028c7:	ff d6                	call   esi
  4028c9:	8b f8                	mov    edi,eax
  4028cb:	85 ff                	test   edi,edi
  4028cd:	74 12                	je     0x4028e1
  4028cf:	8b 0f                	mov    ecx,DWORD PTR [edi]
  4028d1:	6a 01                	push   0x1
  4028d3:	8b 31                	mov    esi,DWORD PTR [ecx]
  4028d5:	8b ce                	mov    ecx,esi
  4028d7:	ff 15 4c 41 40 00    	call   DWORD PTR ds:0x40414c
  4028dd:	8b cf                	mov    ecx,edi
  4028df:	ff d6                	call   esi
  4028e1:	5f                   	pop    edi
  4028e2:	5e                   	pop    esi
  4028e3:	c3                   	ret
  4028e4:	eb 0e                	jmp    0x4028f4
  4028e6:	8b 01                	mov    eax,DWORD PTR [ecx]
  4028e8:	6a 01                	push   0x1
  4028ea:	a3 38 61 40 00       	mov    ds:0x406138,eax
  4028ef:	e8 0b 00 00 00       	call   0x4028ff
  4028f4:	8b 0d 38 61 40 00    	mov    ecx,DWORD PTR ds:0x406138
  4028fa:	85 c9                	test   ecx,ecx
  4028fc:	75 e8                	jne    0x4028e6
  4028fe:	c3                   	ret
  4028ff:	55                   	push   ebp
  402900:	8b ec                	mov    ebp,esp
  402902:	56                   	push   esi
  402903:	8b f1                	mov    esi,ecx
  402905:	e8 a9 ff ff ff       	call   0x4028b3
  40290a:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
  40290e:	74 19                	je     0x402929
  402910:	f6 45 08 04          	test   BYTE PTR [ebp+0x8],0x4
  402914:	75 09                	jne    0x40291f
  402916:	56                   	push   esi
  402917:	ff 15 cc 40 40 00    	call   DWORD PTR ds:0x4040cc
  40291d:	eb 09                	jmp    0x402928
  40291f:	6a 08                	push   0x8
  402921:	56                   	push   esi
  402922:	e8 37 00 00 00       	call   0x40295e
  402927:	59                   	pop    ecx
  402928:	59                   	pop    ecx
  402929:	8b c6                	mov    eax,esi
  40292b:	5e                   	pop    esi
  40292c:	5d                   	pop    ebp
  40292d:	c2 04 00             	ret    0x4
  402930:	55                   	push   ebp
  402931:	8b ec                	mov    ebp,esp
  402933:	51                   	push   ecx
  402934:	6a 08                	push   0x8
  402936:	ff 15 c4 40 40 00    	call   DWORD PTR ds:0x4040c4
  40293c:	59                   	pop    ecx
  40293d:	8b c8                	mov    ecx,eax
  40293f:	85 c9                	test   ecx,ecx
  402941:	74 15                	je     0x402958
  402943:	a1 38 61 40 00       	mov    eax,ds:0x406138
  402948:	89 01                	mov    DWORD PTR [ecx],eax
  40294a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40294d:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  402950:	89 0d 38 61 40 00    	mov    DWORD PTR ds:0x406138,ecx
  402956:	c9                   	leave
  402957:	c3                   	ret
  402958:	e8 04 00 00 00       	call   0x402961
  40295d:	cc                   	int3
  40295e:	c2 00 00             	ret    0x0
  402961:	ff 25 60 40 40 00    	jmp    DWORD PTR ds:0x404060
  402967:	3b 0d 40 60 40 00    	cmp    ecx,DWORD PTR ds:0x406040
  40296d:	75 01                	jne    0x402970
  40296f:	c3                   	ret
  402970:	e9 30 05 00 00       	jmp    0x402ea5
  402975:	55                   	push   ebp
  402976:	8b ec                	mov    ebp,esp
  402978:	eb 0d                	jmp    0x402987
  40297a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40297d:	e8 6e 0d 00 00       	call   0x4036f0
  402982:	59                   	pop    ecx
  402983:	85 c0                	test   eax,eax
  402985:	74 0f                	je     0x402996
  402987:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40298a:	e8 5b 0d 00 00       	call   0x4036ea
  40298f:	59                   	pop    ecx
  402990:	85 c0                	test   eax,eax
  402992:	74 e6                	je     0x40297a
  402994:	5d                   	pop    ebp
  402995:	c3                   	ret
  402996:	83 7d 08 ff          	cmp    DWORD PTR [ebp+0x8],0xffffffff
  40299a:	0f 84 30 e7 ff ff    	je     0x4010d0
  4029a0:	e9 19 06 00 00       	jmp    0x402fbe
  4029a5:	55                   	push   ebp
  4029a6:	8b ec                	mov    ebp,esp
  4029a8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4029ab:	e8 2b 06 00 00       	call   0x402fdb
  4029b0:	59                   	pop    ecx
  4029b1:	5d                   	pop    ebp
  4029b2:	c3                   	ret
  4029b3:	55                   	push   ebp
  4029b4:	8b ec                	mov    ebp,esp
  4029b6:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
  4029ba:	56                   	push   esi
  4029bb:	8b f1                	mov    esi,ecx
  4029bd:	c7 06 8c 41 40 00    	mov    DWORD PTR [esi],0x40418c
  4029c3:	74 0a                	je     0x4029cf
  4029c5:	6a 0c                	push   0xc
  4029c7:	56                   	push   esi
  4029c8:	e8 d8 ff ff ff       	call   0x4029a5
  4029cd:	59                   	pop    ecx
  4029ce:	59                   	pop    ecx
  4029cf:	8b c6                	mov    eax,esi
  4029d1:	5e                   	pop    esi
  4029d2:	5d                   	pop    ebp
  4029d3:	c2 04 00             	ret    0x4
  4029d6:	56                   	push   esi
  4029d7:	6a 01                	push   0x1
  4029d9:	e8 1e 0d 00 00       	call   0x4036fc
  4029de:	e8 9c 06 00 00       	call   0x40307f
  4029e3:	50                   	push   eax
  4029e4:	e8 49 0d 00 00       	call   0x403732
  4029e9:	e8 8a 06 00 00       	call   0x403078
  4029ee:	8b f0                	mov    esi,eax
  4029f0:	e8 6d 0d 00 00       	call   0x403762
  4029f5:	6a 01                	push   0x1
  4029f7:	89 30                	mov    DWORD PTR [eax],esi
  4029f9:	e8 d9 02 00 00       	call   0x402cd7
  4029fe:	83 c4 0c             	add    esp,0xc
  402a01:	5e                   	pop    esi
  402a02:	84 c0                	test   al,al
  402a04:	74 73                	je     0x402a79
  402a06:	db e2                	fnclex
  402a08:	e8 b2 08 00 00       	call   0x4032bf
  402a0d:	68 eb 32 40 00       	push   0x4032eb
  402a12:	e8 51 04 00 00       	call   0x402e68
  402a17:	e8 5f 06 00 00       	call   0x40307b
  402a1c:	50                   	push   eax
  402a1d:	e8 e6 0c 00 00       	call   0x403708
  402a22:	59                   	pop    ecx
  402a23:	59                   	pop    ecx
  402a24:	85 c0                	test   eax,eax
  402a26:	75 51                	jne    0x402a79
  402a28:	e8 58 06 00 00       	call   0x403085
  402a2d:	e8 ac 06 00 00       	call   0x4030de
  402a32:	85 c0                	test   eax,eax
  402a34:	74 0b                	je     0x402a41
  402a36:	68 78 30 40 00       	push   0x403078
  402a3b:	e8 c2 0c 00 00       	call   0x403702
  402a40:	59                   	pop    ecx
  402a41:	e8 18 ff ff ff       	call   0x40295e
  402a46:	e8 13 ff ff ff       	call   0x40295e
  402a4b:	e8 44 06 00 00       	call   0x403094
  402a50:	e8 23 06 00 00       	call   0x403078
  402a55:	50                   	push   eax
  402a56:	e8 fb 0c 00 00       	call   0x403756
  402a5b:	59                   	pop    ecx
  402a5c:	e8 30 06 00 00       	call   0x403091
  402a61:	84 c0                	test   al,al
  402a63:	74 05                	je     0x402a6a
  402a65:	e8 a4 0c 00 00       	call   0x40370e
  402a6a:	e8 09 06 00 00       	call   0x403078
  402a6f:	e8 97 07 00 00       	call   0x40320b
  402a74:	85 c0                	test   eax,eax
  402a76:	75 01                	jne    0x402a79
  402a78:	c3                   	ret
  402a79:	6a 07                	push   0x7
  402a7b:	e8 76 06 00 00       	call   0x4030f6
  402a80:	cc                   	int3
  402a81:	e8 3b 06 00 00       	call   0x4030c1
  402a86:	33 c0                	xor    eax,eax
  402a88:	c3                   	ret
  402a89:	e8 c4 07 00 00       	call   0x403252
  402a8e:	e8 e5 05 00 00       	call   0x403078
  402a93:	50                   	push   eax
  402a94:	e8 c3 0c 00 00       	call   0x40375c
  402a99:	59                   	pop    ecx
  402a9a:	c3                   	ret
  402a9b:	6a 14                	push   0x14
  402a9d:	68 78 4c 40 00       	push   0x404c78
  402aa2:	e8 79 08 00 00       	call   0x403320
  402aa7:	6a 01                	push   0x1
  402aa9:	e8 f0 01 00 00       	call   0x402c9e
  402aae:	59                   	pop    ecx
  402aaf:	84 c0                	test   al,al
  402ab1:	0f 84 53 01 00 00    	je     0x402c0a
  402ab7:	32 db                	xor    bl,bl
  402ab9:	88 5d e7             	mov    BYTE PTR [ebp-0x19],bl
  402abc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  402ac3:	e8 a4 01 00 00       	call   0x402c6c
  402ac8:	88 45 dc             	mov    BYTE PTR [ebp-0x24],al
  402acb:	a1 40 61 40 00       	mov    eax,ds:0x406140
  402ad0:	33 c9                	xor    ecx,ecx
  402ad2:	41                   	inc    ecx
  402ad3:	3b c1                	cmp    eax,ecx
  402ad5:	0f 84 2f 01 00 00    	je     0x402c0a
  402adb:	85 c0                	test   eax,eax
  402add:	75 49                	jne    0x402b28
  402adf:	89 0d 40 61 40 00    	mov    DWORD PTR ds:0x406140,ecx
  402ae5:	68 70 41 40 00       	push   0x404170
  402aea:	68 64 41 40 00       	push   0x404164
  402aef:	e8 2c 0c 00 00       	call   0x403720
  402af4:	59                   	pop    ecx
  402af5:	59                   	pop    ecx
  402af6:	85 c0                	test   eax,eax
  402af8:	74 11                	je     0x402b0b
  402afa:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402b01:	b8 ff 00 00 00       	mov    eax,0xff
  402b06:	e9 ef 00 00 00       	jmp    0x402bfa
  402b0b:	68 60 41 40 00       	push   0x404160
  402b10:	68 54 41 40 00       	push   0x404154
  402b15:	e8 00 0c 00 00       	call   0x40371a
  402b1a:	59                   	pop    ecx
  402b1b:	59                   	pop    ecx
  402b1c:	c7 05 40 61 40 00 02 	mov    DWORD PTR ds:0x406140,0x2
  402b23:	00 00 00 
  402b26:	eb 05                	jmp    0x402b2d
  402b28:	8a d9                	mov    bl,cl
  402b2a:	88 5d e7             	mov    BYTE PTR [ebp-0x19],bl
  402b2d:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  402b30:	e8 c0 02 00 00       	call   0x402df5
  402b35:	59                   	pop    ecx
  402b36:	e8 af 05 00 00       	call   0x4030ea
  402b3b:	8b f0                	mov    esi,eax
  402b3d:	33 ff                	xor    edi,edi
  402b3f:	39 3e                	cmp    DWORD PTR [esi],edi
  402b41:	74 1b                	je     0x402b5e
  402b43:	56                   	push   esi
  402b44:	e8 15 02 00 00       	call   0x402d5e
  402b49:	59                   	pop    ecx
  402b4a:	84 c0                	test   al,al
  402b4c:	74 10                	je     0x402b5e
  402b4e:	8b 36                	mov    esi,DWORD PTR [esi]
  402b50:	57                   	push   edi
  402b51:	6a 02                	push   0x2
  402b53:	57                   	push   edi
  402b54:	8b ce                	mov    ecx,esi
  402b56:	ff 15 4c 41 40 00    	call   DWORD PTR ds:0x40414c
  402b5c:	ff d6                	call   esi
  402b5e:	e8 8d 05 00 00       	call   0x4030f0
  402b63:	8b f0                	mov    esi,eax
  402b65:	39 3e                	cmp    DWORD PTR [esi],edi
  402b67:	74 13                	je     0x402b7c
  402b69:	56                   	push   esi
  402b6a:	e8 ef 01 00 00       	call   0x402d5e
  402b6f:	59                   	pop    ecx
  402b70:	84 c0                	test   al,al
  402b72:	74 08                	je     0x402b7c
  402b74:	ff 36                	push   DWORD PTR [esi]
  402b76:	e8 d5 0b 00 00       	call   0x403750
  402b7b:	59                   	pop    ecx
  402b7c:	e8 93 0b 00 00       	call   0x403714
  402b81:	8b f8                	mov    edi,eax
  402b83:	e8 b6 0b 00 00       	call   0x40373e
  402b88:	8b 30                	mov    esi,DWORD PTR [eax]
  402b8a:	e8 a9 0b 00 00       	call   0x403738
  402b8f:	57                   	push   edi
  402b90:	56                   	push   esi
  402b91:	ff 30                	push   DWORD PTR [eax]
  402b93:	e8 88 e6 ff ff       	call   0x401220
  402b98:	83 c4 0c             	add    esp,0xc
  402b9b:	8b f0                	mov    esi,eax
  402b9d:	e8 6e 06 00 00       	call   0x403210
  402ba2:	84 c0                	test   al,al
  402ba4:	74 6b                	je     0x402c11
  402ba6:	84 db                	test   bl,bl
  402ba8:	75 05                	jne    0x402baf
  402baa:	e8 95 0b 00 00       	call   0x403744
  402baf:	6a 00                	push   0x0
  402bb1:	6a 01                	push   0x1
  402bb3:	e8 5a 02 00 00       	call   0x402e12
  402bb8:	59                   	pop    ecx
  402bb9:	59                   	pop    ecx
  402bba:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402bc1:	8b c6                	mov    eax,esi
  402bc3:	eb 35                	jmp    0x402bfa
  402bc5:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  402bc8:	8b 01                	mov    eax,DWORD PTR [ecx]
  402bca:	8b 00                	mov    eax,DWORD PTR [eax]
  402bcc:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  402bcf:	51                   	push   ecx
  402bd0:	50                   	push   eax
  402bd1:	e8 20 0b 00 00       	call   0x4036f6
  402bd6:	59                   	pop    ecx
  402bd7:	59                   	pop    ecx
  402bd8:	c3                   	ret
  402bd9:	8b 65 e8             	mov    esp,DWORD PTR [ebp-0x18]
  402bdc:	e8 2f 06 00 00       	call   0x403210
  402be1:	84 c0                	test   al,al
  402be3:	74 32                	je     0x402c17
  402be5:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
  402be9:	75 05                	jne    0x402bf0
  402beb:	e8 5a 0b 00 00       	call   0x40374a
  402bf0:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402bf7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402bfa:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  402bfd:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402c04:	59                   	pop    ecx
  402c05:	5f                   	pop    edi
  402c06:	5e                   	pop    esi
  402c07:	5b                   	pop    ebx
  402c08:	c9                   	leave
  402c09:	c3                   	ret
  402c0a:	6a 07                	push   0x7
  402c0c:	e8 e5 04 00 00       	call   0x4030f6
  402c11:	56                   	push   esi
  402c12:	e8 0f 0b 00 00       	call   0x403726
  402c17:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  402c1a:	e8 0d 0b 00 00       	call   0x40372c
  402c1f:	cc                   	int3
  402c20:	e8 08 04 00 00       	call   0x40302d
  402c25:	e9 71 fe ff ff       	jmp    0x402a9b
  402c2a:	55                   	push   ebp
  402c2b:	8b ec                	mov    ebp,esp
  402c2d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402c30:	56                   	push   esi
  402c31:	8b 48 3c             	mov    ecx,DWORD PTR [eax+0x3c]
  402c34:	03 c8                	add    ecx,eax
  402c36:	0f b7 41 14          	movzx  eax,WORD PTR [ecx+0x14]
  402c3a:	8d 51 18             	lea    edx,[ecx+0x18]
  402c3d:	03 d0                	add    edx,eax
  402c3f:	0f b7 41 06          	movzx  eax,WORD PTR [ecx+0x6]
  402c43:	6b f0 28             	imul   esi,eax,0x28
  402c46:	03 f2                	add    esi,edx
  402c48:	eb 15                	jmp    0x402c5f
  402c4a:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  402c4d:	39 4d 0c             	cmp    DWORD PTR [ebp+0xc],ecx
  402c50:	72 0a                	jb     0x402c5c
  402c52:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  402c55:	03 c1                	add    eax,ecx
  402c57:	39 45 0c             	cmp    DWORD PTR [ebp+0xc],eax
  402c5a:	72 0c                	jb     0x402c68
  402c5c:	83 c2 28             	add    edx,0x28
  402c5f:	3b d6                	cmp    edx,esi
  402c61:	75 e7                	jne    0x402c4a
  402c63:	33 c0                	xor    eax,eax
  402c65:	5e                   	pop    esi
  402c66:	5d                   	pop    ebp
  402c67:	c3                   	ret
  402c68:	8b c2                	mov    eax,edx
  402c6a:	eb f9                	jmp    0x402c65
  402c6c:	56                   	push   esi
  402c6d:	e8 3c 0a 00 00       	call   0x4036ae
  402c72:	85 c0                	test   eax,eax
  402c74:	74 20                	je     0x402c96
  402c76:	64 a1 18 00 00 00    	mov    eax,fs:0x18
  402c7c:	be 44 61 40 00       	mov    esi,0x406144
  402c81:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
  402c84:	eb 04                	jmp    0x402c8a
  402c86:	3b d0                	cmp    edx,eax
  402c88:	74 10                	je     0x402c9a
  402c8a:	33 c0                	xor    eax,eax
  402c8c:	8b ca                	mov    ecx,edx
  402c8e:	f0 0f b1 0e          	lock cmpxchg DWORD PTR [esi],ecx
  402c92:	85 c0                	test   eax,eax
  402c94:	75 f0                	jne    0x402c86
  402c96:	32 c0                	xor    al,al
  402c98:	5e                   	pop    esi
  402c99:	c3                   	ret
  402c9a:	b0 01                	mov    al,0x1
  402c9c:	5e                   	pop    esi
  402c9d:	c3                   	ret
  402c9e:	55                   	push   ebp
  402c9f:	8b ec                	mov    ebp,esp
  402ca1:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
  402ca5:	75 07                	jne    0x402cae
  402ca7:	c6 05 48 61 40 00 01 	mov    BYTE PTR ds:0x406148,0x1
  402cae:	e8 e1 06 00 00       	call   0x403394
  402cb3:	e8 d9 03 00 00       	call   0x403091
  402cb8:	84 c0                	test   al,al
  402cba:	75 04                	jne    0x402cc0
  402cbc:	32 c0                	xor    al,al
  402cbe:	5d                   	pop    ebp
  402cbf:	c3                   	ret
  402cc0:	e8 cc 03 00 00       	call   0x403091
  402cc5:	84 c0                	test   al,al
  402cc7:	75 0a                	jne    0x402cd3
  402cc9:	6a 00                	push   0x0
  402ccb:	e8 c1 03 00 00       	call   0x403091
  402cd0:	59                   	pop    ecx
  402cd1:	eb e9                	jmp    0x402cbc
  402cd3:	b0 01                	mov    al,0x1
  402cd5:	5d                   	pop    ebp
  402cd6:	c3                   	ret
  402cd7:	55                   	push   ebp
  402cd8:	8b ec                	mov    ebp,esp
  402cda:	80 3d 49 61 40 00 00 	cmp    BYTE PTR ds:0x406149,0x0
  402ce1:	74 04                	je     0x402ce7
  402ce3:	b0 01                	mov    al,0x1
  402ce5:	5d                   	pop    ebp
  402ce6:	c3                   	ret
  402ce7:	56                   	push   esi
  402ce8:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  402ceb:	85 f6                	test   esi,esi
  402ced:	74 05                	je     0x402cf4
  402cef:	83 fe 01             	cmp    esi,0x1
  402cf2:	75 62                	jne    0x402d56
  402cf4:	e8 b5 09 00 00       	call   0x4036ae
  402cf9:	85 c0                	test   eax,eax
  402cfb:	74 26                	je     0x402d23
  402cfd:	85 f6                	test   esi,esi
  402cff:	75 22                	jne    0x402d23
  402d01:	68 4c 61 40 00       	push   0x40614c
  402d06:	e8 5d 0a 00 00       	call   0x403768
  402d0b:	59                   	pop    ecx
  402d0c:	85 c0                	test   eax,eax
  402d0e:	75 0f                	jne    0x402d1f
  402d10:	68 58 61 40 00       	push   0x406158
  402d15:	e8 4e 0a 00 00       	call   0x403768
  402d1a:	59                   	pop    ecx
  402d1b:	85 c0                	test   eax,eax
  402d1d:	74 2b                	je     0x402d4a
  402d1f:	32 c0                	xor    al,al
  402d21:	eb 30                	jmp    0x402d53
  402d23:	83 c9 ff             	or     ecx,0xffffffff
  402d26:	89 0d 4c 61 40 00    	mov    DWORD PTR ds:0x40614c,ecx
  402d2c:	89 0d 50 61 40 00    	mov    DWORD PTR ds:0x406150,ecx
  402d32:	89 0d 54 61 40 00    	mov    DWORD PTR ds:0x406154,ecx
  402d38:	89 0d 58 61 40 00    	mov    DWORD PTR ds:0x406158,ecx
  402d3e:	89 0d 5c 61 40 00    	mov    DWORD PTR ds:0x40615c,ecx
  402d44:	89 0d 60 61 40 00    	mov    DWORD PTR ds:0x406160,ecx
  402d4a:	c6 05 49 61 40 00 01 	mov    BYTE PTR ds:0x406149,0x1
  402d51:	b0 01                	mov    al,0x1
  402d53:	5e                   	pop    esi
  402d54:	5d                   	pop    ebp
  402d55:	c3                   	ret
  402d56:	6a 05                	push   0x5
  402d58:	e8 99 03 00 00       	call   0x4030f6
  402d5d:	cc                   	int3
  402d5e:	6a 08                	push   0x8
  402d60:	68 98 4c 40 00       	push   0x404c98
  402d65:	e8 b6 05 00 00       	call   0x403320
  402d6a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  402d71:	b8 4d 5a 00 00       	mov    eax,0x5a4d
  402d76:	66 39 05 00 00 40 00 	cmp    WORD PTR ds:0x400000,ax
  402d7d:	75 5d                	jne    0x402ddc
  402d7f:	a1 3c 00 40 00       	mov    eax,ds:0x40003c
  402d84:	81 b8 00 00 40 00 50 	cmp    DWORD PTR [eax+0x400000],0x4550
  402d8b:	45 00 00 
  402d8e:	75 4c                	jne    0x402ddc
  402d90:	b9 0b 01 00 00       	mov    ecx,0x10b
  402d95:	66 39 88 18 00 40 00 	cmp    WORD PTR [eax+0x400018],cx
  402d9c:	75 3e                	jne    0x402ddc
  402d9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402da1:	b9 00 00 40 00       	mov    ecx,0x400000
  402da6:	2b c1                	sub    eax,ecx
  402da8:	50                   	push   eax
  402da9:	51                   	push   ecx
  402daa:	e8 7b fe ff ff       	call   0x402c2a
  402daf:	59                   	pop    ecx
  402db0:	59                   	pop    ecx
  402db1:	85 c0                	test   eax,eax
  402db3:	74 27                	je     0x402ddc
  402db5:	83 78 24 00          	cmp    DWORD PTR [eax+0x24],0x0
  402db9:	7c 21                	jl     0x402ddc
  402dbb:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402dc2:	b0 01                	mov    al,0x1
  402dc4:	eb 1f                	jmp    0x402de5
  402dc6:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  402dc9:	8b 00                	mov    eax,DWORD PTR [eax]
  402dcb:	33 c9                	xor    ecx,ecx
  402dcd:	81 38 05 00 00 c0    	cmp    DWORD PTR [eax],0xc0000005
  402dd3:	0f 94 c1             	sete   cl
  402dd6:	8b c1                	mov    eax,ecx
  402dd8:	c3                   	ret
  402dd9:	8b 65 e8             	mov    esp,DWORD PTR [ebp-0x18]
  402ddc:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402de3:	32 c0                	xor    al,al
  402de5:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  402de8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402def:	59                   	pop    ecx
  402df0:	5f                   	pop    edi
  402df1:	5e                   	pop    esi
  402df2:	5b                   	pop    ebx
  402df3:	c9                   	leave
  402df4:	c3                   	ret
  402df5:	55                   	push   ebp
  402df6:	8b ec                	mov    ebp,esp
  402df8:	e8 b1 08 00 00       	call   0x4036ae
  402dfd:	85 c0                	test   eax,eax
  402dff:	74 0f                	je     0x402e10
  402e01:	80 7d 08 00          	cmp    BYTE PTR [ebp+0x8],0x0
  402e05:	75 09                	jne    0x402e10
  402e07:	33 c0                	xor    eax,eax
  402e09:	b9 44 61 40 00       	mov    ecx,0x406144
  402e0e:	87 01                	xchg   DWORD PTR [ecx],eax
  402e10:	5d                   	pop    ebp
  402e11:	c3                   	ret
  402e12:	55                   	push   ebp
  402e13:	8b ec                	mov    ebp,esp
  402e15:	80 3d 48 61 40 00 00 	cmp    BYTE PTR ds:0x406148,0x0
  402e1c:	74 06                	je     0x402e24
  402e1e:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
  402e22:	75 12                	jne    0x402e36
  402e24:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402e27:	e8 65 02 00 00       	call   0x403091
  402e2c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402e2f:	e8 5d 02 00 00       	call   0x403091
  402e34:	59                   	pop    ecx
  402e35:	59                   	pop    ecx
  402e36:	b0 01                	mov    al,0x1
  402e38:	5d                   	pop    ebp
  402e39:	c3                   	ret
  402e3a:	55                   	push   ebp
  402e3b:	8b ec                	mov    ebp,esp
  402e3d:	83 3d 4c 61 40 00 ff 	cmp    DWORD PTR ds:0x40614c,0xffffffff
  402e44:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402e47:	75 07                	jne    0x402e50
  402e49:	e8 26 09 00 00       	call   0x403774
  402e4e:	eb 0b                	jmp    0x402e5b
  402e50:	68 4c 61 40 00       	push   0x40614c
  402e55:	e8 14 09 00 00       	call   0x40376e
  402e5a:	59                   	pop    ecx
  402e5b:	59                   	pop    ecx
  402e5c:	33 c9                	xor    ecx,ecx
  402e5e:	85 c0                	test   eax,eax
  402e60:	0f 44 4d 08          	cmove  ecx,DWORD PTR [ebp+0x8]
  402e64:	8b c1                	mov    eax,ecx
  402e66:	5d                   	pop    ebp
  402e67:	c3                   	ret
  402e68:	55                   	push   ebp
  402e69:	8b ec                	mov    ebp,esp
  402e6b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402e6e:	e8 c7 ff ff ff       	call   0x402e3a
  402e73:	f7 d8                	neg    eax
  402e75:	59                   	pop    ecx
  402e76:	1b c0                	sbb    eax,eax
  402e78:	f7 d8                	neg    eax
  402e7a:	48                   	dec    eax
  402e7b:	5d                   	pop    ebp
  402e7c:	c3                   	ret
  402e7d:	55                   	push   ebp
  402e7e:	8b ec                	mov    ebp,esp
  402e80:	6a 00                	push   0x0
  402e82:	ff 15 0c 40 40 00    	call   DWORD PTR ds:0x40400c
  402e88:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402e8b:	ff 15 34 40 40 00    	call   DWORD PTR ds:0x404034
  402e91:	68 09 04 00 c0       	push   0xc0000409
  402e96:	ff 15 10 40 40 00    	call   DWORD PTR ds:0x404010
  402e9c:	50                   	push   eax
  402e9d:	ff 15 14 40 40 00    	call   DWORD PTR ds:0x404014
  402ea3:	5d                   	pop    ebp
  402ea4:	c3                   	ret
  402ea5:	55                   	push   ebp
  402ea6:	8b ec                	mov    ebp,esp
  402ea8:	81 ec 24 03 00 00    	sub    esp,0x324
  402eae:	6a 17                	push   0x17
  402eb0:	ff 15 18 40 40 00    	call   DWORD PTR ds:0x404018
  402eb6:	85 c0                	test   eax,eax
  402eb8:	74 05                	je     0x402ebf
  402eba:	6a 02                	push   0x2
  402ebc:	59                   	pop    ecx
  402ebd:	cd 29                	int    0x29
  402ebf:	a3 68 62 40 00       	mov    ds:0x406268,eax
  402ec4:	89 0d 64 62 40 00    	mov    DWORD PTR ds:0x406264,ecx
  402eca:	89 15 60 62 40 00    	mov    DWORD PTR ds:0x406260,edx
  402ed0:	89 1d 5c 62 40 00    	mov    DWORD PTR ds:0x40625c,ebx
  402ed6:	89 35 58 62 40 00    	mov    DWORD PTR ds:0x406258,esi
  402edc:	89 3d 54 62 40 00    	mov    DWORD PTR ds:0x406254,edi
  402ee2:	66 8c 15 80 62 40 00 	data16 mov WORD PTR ds:0x406280,ss
  402ee9:	66 8c 0d 74 62 40 00 	data16 mov WORD PTR ds:0x406274,cs
  402ef0:	66 8c 1d 50 62 40 00 	data16 mov WORD PTR ds:0x406250,ds
  402ef7:	66 8c 05 4c 62 40 00 	data16 mov WORD PTR ds:0x40624c,es
  402efe:	66 8c 25 48 62 40 00 	data16 mov WORD PTR ds:0x406248,fs
  402f05:	66 8c 2d 44 62 40 00 	data16 mov WORD PTR ds:0x406244,gs
  402f0c:	9c                   	pushf
  402f0d:	8f 05 78 62 40 00    	pop    DWORD PTR ds:0x406278
  402f13:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  402f16:	a3 6c 62 40 00       	mov    ds:0x40626c,eax
  402f1b:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  402f1e:	a3 70 62 40 00       	mov    ds:0x406270,eax
  402f23:	8d 45 08             	lea    eax,[ebp+0x8]
  402f26:	a3 7c 62 40 00       	mov    ds:0x40627c,eax
  402f2b:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [ebp-0x324]
  402f31:	c7 05 b8 61 40 00 01 	mov    DWORD PTR ds:0x4061b8,0x10001
  402f38:	00 01 00 
  402f3b:	a1 70 62 40 00       	mov    eax,ds:0x406270
  402f40:	a3 74 61 40 00       	mov    ds:0x406174,eax
  402f45:	c7 05 68 61 40 00 09 	mov    DWORD PTR ds:0x406168,0xc0000409
  402f4c:	04 00 c0 
  402f4f:	c7 05 6c 61 40 00 01 	mov    DWORD PTR ds:0x40616c,0x1
  402f56:	00 00 00 
  402f59:	c7 05 78 61 40 00 01 	mov    DWORD PTR ds:0x406178,0x1
  402f60:	00 00 00 
  402f63:	6a 04                	push   0x4
  402f65:	58                   	pop    eax
  402f66:	6b c0 00             	imul   eax,eax,0x0
  402f69:	c7 80 7c 61 40 00 02 	mov    DWORD PTR [eax+0x40617c],0x2
  402f70:	00 00 00 
  402f73:	6a 04                	push   0x4
  402f75:	58                   	pop    eax
  402f76:	6b c0 00             	imul   eax,eax,0x0
  402f79:	8b 0d 40 60 40 00    	mov    ecx,DWORD PTR ds:0x406040
  402f7f:	89 4c 05 f8          	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  402f83:	6a 04                	push   0x4
  402f85:	58                   	pop    eax
  402f86:	c1 e0 00             	shl    eax,0x0
  402f89:	8b 0d 80 60 40 00    	mov    ecx,DWORD PTR ds:0x406080
  402f8f:	89 4c 05 f8          	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  402f93:	68 90 41 40 00       	push   0x404190
  402f98:	e8 e0 fe ff ff       	call   0x402e7d
  402f9d:	90                   	nop
  402f9e:	c9                   	leave
  402f9f:	c3                   	ret
  402fa0:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
  402fa7:	8b c1                	mov    eax,ecx
  402fa9:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
  402fb0:	c7 41 04 b0 41 40 00 	mov    DWORD PTR [ecx+0x4],0x4041b0
  402fb7:	c7 01 a8 41 40 00    	mov    DWORD PTR [ecx],0x4041a8
  402fbd:	c3                   	ret
  402fbe:	55                   	push   ebp
  402fbf:	8b ec                	mov    ebp,esp
  402fc1:	83 ec 0c             	sub    esp,0xc
  402fc4:	8d 4d f4             	lea    ecx,[ebp-0xc]
  402fc7:	e8 d4 ff ff ff       	call   0x402fa0
  402fcc:	68 b4 4c 40 00       	push   0x404cb4
  402fd1:	8d 45 f4             	lea    eax,[ebp-0xc]
  402fd4:	50                   	push   eax
  402fd5:	e8 ec 06 00 00       	call   0x4036c6
  402fda:	cc                   	int3
  402fdb:	e9 04 07 00 00       	jmp    0x4036e4
  402fe0:	55                   	push   ebp
  402fe1:	8b ec                	mov    ebp,esp
  402fe3:	83 ec 14             	sub    esp,0x14
  402fe6:	8d 45 f4             	lea    eax,[ebp-0xc]
  402fe9:	0f 57 c0             	xorps  xmm0,xmm0
  402fec:	50                   	push   eax
  402fed:	66 0f 13 45 f4       	movlpd QWORD PTR [ebp-0xc],xmm0
  402ff2:	ff 15 28 40 40 00    	call   DWORD PTR ds:0x404028
  402ff8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  402ffb:	33 45 f4             	xor    eax,DWORD PTR [ebp-0xc]
  402ffe:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  403001:	ff 15 24 40 40 00    	call   DWORD PTR ds:0x404024
  403007:	31 45 fc             	xor    DWORD PTR [ebp-0x4],eax
  40300a:	ff 15 20 40 40 00    	call   DWORD PTR ds:0x404020
  403010:	31 45 fc             	xor    DWORD PTR [ebp-0x4],eax
  403013:	8d 45 ec             	lea    eax,[ebp-0x14]
  403016:	50                   	push   eax
  403017:	ff 15 1c 40 40 00    	call   DWORD PTR ds:0x40401c
  40301d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  403020:	8d 4d fc             	lea    ecx,[ebp-0x4]
  403023:	33 45 ec             	xor    eax,DWORD PTR [ebp-0x14]
  403026:	33 45 fc             	xor    eax,DWORD PTR [ebp-0x4]
  403029:	33 c1                	xor    eax,ecx
  40302b:	c9                   	leave
  40302c:	c3                   	ret
  40302d:	8b 0d 40 60 40 00    	mov    ecx,DWORD PTR ds:0x406040
  403033:	56                   	push   esi
  403034:	57                   	push   edi
  403035:	bf 4e e6 40 bb       	mov    edi,0xbb40e64e
  40303a:	be 00 00 ff ff       	mov    esi,0xffff0000
  40303f:	3b cf                	cmp    ecx,edi
  403041:	74 04                	je     0x403047
  403043:	85 ce                	test   esi,ecx
  403045:	75 26                	jne    0x40306d
  403047:	e8 94 ff ff ff       	call   0x402fe0
  40304c:	8b c8                	mov    ecx,eax
  40304e:	3b cf                	cmp    ecx,edi
  403050:	75 07                	jne    0x403059
  403052:	b9 4f e6 40 bb       	mov    ecx,0xbb40e64f
  403057:	eb 0e                	jmp    0x403067
  403059:	85 ce                	test   esi,ecx
  40305b:	75 0a                	jne    0x403067
  40305d:	0d 11 47 00 00       	or     eax,0x4711
  403062:	c1 e0 10             	shl    eax,0x10
  403065:	0b c8                	or     ecx,eax
  403067:	89 0d 40 60 40 00    	mov    DWORD PTR ds:0x406040,ecx
  40306d:	f7 d1                	not    ecx
  40306f:	5f                   	pop    edi
  403070:	89 0d 80 60 40 00    	mov    DWORD PTR ds:0x406080,ecx
  403076:	5e                   	pop    esi
  403077:	c3                   	ret
  403078:	33 c0                	xor    eax,eax
  40307a:	c3                   	ret
  40307b:	33 c0                	xor    eax,eax
  40307d:	40                   	inc    eax
  40307e:	c3                   	ret
  40307f:	b8 00 40 00 00       	mov    eax,0x4000
  403084:	c3                   	ret
  403085:	68 88 64 40 00       	push   0x406488
  40308a:	ff 15 2c 40 40 00    	call   DWORD PTR ds:0x40402c
  403090:	c3                   	ret
  403091:	b0 01                	mov    al,0x1
  403093:	c3                   	ret
  403094:	68 00 00 03 00       	push   0x30000
  403099:	68 00 00 01 00       	push   0x10000
  40309e:	6a 00                	push   0x0
  4030a0:	e8 d5 06 00 00       	call   0x40377a
  4030a5:	83 c4 0c             	add    esp,0xc
  4030a8:	85 c0                	test   eax,eax
  4030aa:	75 01                	jne    0x4030ad
  4030ac:	c3                   	ret
  4030ad:	6a 07                	push   0x7
  4030af:	e8 42 00 00 00       	call   0x4030f6
  4030b4:	cc                   	int3
  4030b5:	b8 90 64 40 00       	mov    eax,0x406490
  4030ba:	c3                   	ret
  4030bb:	b8 98 64 40 00       	mov    eax,0x406498
  4030c0:	c3                   	ret
  4030c1:	e8 ef ff ff ff       	call   0x4030b5
  4030c6:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4030c9:	83 08 24             	or     DWORD PTR [eax],0x24
  4030cc:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
  4030cf:	e8 e7 ff ff ff       	call   0x4030bb
  4030d4:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4030d7:	83 08 02             	or     DWORD PTR [eax],0x2
  4030da:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
  4030dd:	c3                   	ret
  4030de:	33 c0                	xor    eax,eax
  4030e0:	39 05 84 60 40 00    	cmp    DWORD PTR ds:0x406084,eax
  4030e6:	0f 94 c0             	sete   al
  4030e9:	c3                   	ret
  4030ea:	b8 b8 64 40 00       	mov    eax,0x4064b8
  4030ef:	c3                   	ret
  4030f0:	b8 b4 64 40 00       	mov    eax,0x4064b4
  4030f5:	c3                   	ret
  4030f6:	55                   	push   ebp
  4030f7:	8b ec                	mov    ebp,esp
  4030f9:	81 ec 24 03 00 00    	sub    esp,0x324
  4030ff:	56                   	push   esi
  403100:	6a 17                	push   0x17
  403102:	ff 15 18 40 40 00    	call   DWORD PTR ds:0x404018
  403108:	85 c0                	test   eax,eax
  40310a:	74 05                	je     0x403111
  40310c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40310f:	cd 29                	int    0x29
  403111:	6a 03                	push   0x3
  403113:	e8 9c 01 00 00       	call   0x4032b4
  403118:	c7 04 24 cc 02 00 00 	mov    DWORD PTR [esp],0x2cc
  40311f:	8d 85 dc fc ff ff    	lea    eax,[ebp-0x324]
  403125:	6a 00                	push   0x0
  403127:	50                   	push   eax
  403128:	e8 ab 05 00 00       	call   0x4036d8
  40312d:	83 c4 0c             	add    esp,0xc
  403130:	89 85 8c fd ff ff    	mov    DWORD PTR [ebp-0x274],eax
  403136:	89 8d 88 fd ff ff    	mov    DWORD PTR [ebp-0x278],ecx
  40313c:	89 95 84 fd ff ff    	mov    DWORD PTR [ebp-0x27c],edx
  403142:	89 9d 80 fd ff ff    	mov    DWORD PTR [ebp-0x280],ebx
  403148:	89 b5 7c fd ff ff    	mov    DWORD PTR [ebp-0x284],esi
  40314e:	89 bd 78 fd ff ff    	mov    DWORD PTR [ebp-0x288],edi
  403154:	66 8c 95 a4 fd ff ff 	data16 mov WORD PTR [ebp-0x25c],ss
  40315b:	66 8c 8d 98 fd ff ff 	data16 mov WORD PTR [ebp-0x268],cs
  403162:	66 8c 9d 74 fd ff ff 	data16 mov WORD PTR [ebp-0x28c],ds
  403169:	66 8c 85 70 fd ff ff 	data16 mov WORD PTR [ebp-0x290],es
  403170:	66 8c a5 6c fd ff ff 	data16 mov WORD PTR [ebp-0x294],fs
  403177:	66 8c ad 68 fd ff ff 	data16 mov WORD PTR [ebp-0x298],gs
  40317e:	9c                   	pushf
  40317f:	8f 85 9c fd ff ff    	pop    DWORD PTR [ebp-0x264]
  403185:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  403188:	89 85 94 fd ff ff    	mov    DWORD PTR [ebp-0x26c],eax
  40318e:	8d 45 04             	lea    eax,[ebp+0x4]
  403191:	89 85 a0 fd ff ff    	mov    DWORD PTR [ebp-0x260],eax
  403197:	c7 85 dc fc ff ff 01 	mov    DWORD PTR [ebp-0x324],0x10001
  40319e:	00 01 00 
  4031a1:	8b 40 fc             	mov    eax,DWORD PTR [eax-0x4]
  4031a4:	6a 50                	push   0x50
  4031a6:	89 85 90 fd ff ff    	mov    DWORD PTR [ebp-0x270],eax
  4031ac:	8d 45 a8             	lea    eax,[ebp-0x58]
  4031af:	6a 00                	push   0x0
  4031b1:	50                   	push   eax
  4031b2:	e8 21 05 00 00       	call   0x4036d8
  4031b7:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  4031ba:	83 c4 0c             	add    esp,0xc
  4031bd:	c7 45 a8 15 00 00 40 	mov    DWORD PTR [ebp-0x58],0x40000015
  4031c4:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [ebp-0x54],0x1
  4031cb:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4031ce:	ff 15 08 40 40 00    	call   DWORD PTR ds:0x404008
  4031d4:	8b f0                	mov    esi,eax
  4031d6:	8d 45 a8             	lea    eax,[ebp-0x58]
  4031d9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4031dc:	8d 85 dc fc ff ff    	lea    eax,[ebp-0x324]
  4031e2:	6a 00                	push   0x0
  4031e4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4031e7:	ff 15 0c 40 40 00    	call   DWORD PTR ds:0x40400c
  4031ed:	8d 45 f8             	lea    eax,[ebp-0x8]
  4031f0:	50                   	push   eax
  4031f1:	ff 15 34 40 40 00    	call   DWORD PTR ds:0x404034
  4031f7:	85 c0                	test   eax,eax
  4031f9:	75 0d                	jne    0x403208
  4031fb:	83 fe 01             	cmp    esi,0x1
  4031fe:	74 08                	je     0x403208
  403200:	6a 03                	push   0x3
  403202:	e8 ad 00 00 00       	call   0x4032b4
  403207:	59                   	pop    ecx
  403208:	5e                   	pop    esi
  403209:	c9                   	leave
  40320a:	c3                   	ret
  40320b:	e9 68 fe ff ff       	jmp    0x403078
  403210:	6a 00                	push   0x0
  403212:	ff 15 30 40 40 00    	call   DWORD PTR ds:0x404030
  403218:	85 c0                	test   eax,eax
  40321a:	74 33                	je     0x40324f
  40321c:	b9 4d 5a 00 00       	mov    ecx,0x5a4d
  403221:	66 39 08             	cmp    WORD PTR [eax],cx
  403224:	75 29                	jne    0x40324f
  403226:	8b 48 3c             	mov    ecx,DWORD PTR [eax+0x3c]
  403229:	03 c8                	add    ecx,eax
  40322b:	81 39 50 45 00 00    	cmp    DWORD PTR [ecx],0x4550
  403231:	75 1c                	jne    0x40324f
  403233:	b8 0b 01 00 00       	mov    eax,0x10b
  403238:	66 39 41 18          	cmp    WORD PTR [ecx+0x18],ax
  40323c:	75 11                	jne    0x40324f
  40323e:	83 79 74 0e          	cmp    DWORD PTR [ecx+0x74],0xe
  403242:	76 0b                	jbe    0x40324f
  403244:	83 b9 e8 00 00 00 00 	cmp    DWORD PTR [ecx+0xe8],0x0
  40324b:	0f 95 c0             	setne  al
  40324e:	c3                   	ret
  40324f:	32 c0                	xor    al,al
  403251:	c3                   	ret
  403252:	68 5e 32 40 00       	push   0x40325e
  403257:	ff 15 0c 40 40 00    	call   DWORD PTR ds:0x40400c
  40325d:	c3                   	ret
  40325e:	55                   	push   ebp
  40325f:	8b ec                	mov    ebp,esp
  403261:	56                   	push   esi
  403262:	57                   	push   edi
  403263:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403266:	8b 37                	mov    esi,DWORD PTR [edi]
  403268:	81 3e 63 73 6d e0    	cmp    DWORD PTR [esi],0xe06d7363
  40326e:	75 25                	jne    0x403295
  403270:	83 7e 10 03          	cmp    DWORD PTR [esi+0x10],0x3
  403274:	75 1f                	jne    0x403295
  403276:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
  403279:	3d 20 05 93 19       	cmp    eax,0x19930520
  40327e:	74 1d                	je     0x40329d
  403280:	3d 21 05 93 19       	cmp    eax,0x19930521
  403285:	74 16                	je     0x40329d
  403287:	3d 22 05 93 19       	cmp    eax,0x19930522
  40328c:	74 0f                	je     0x40329d
  40328e:	3d 00 40 99 01       	cmp    eax,0x1994000
  403293:	74 08                	je     0x40329d
  403295:	5f                   	pop    edi
  403296:	33 c0                	xor    eax,eax
  403298:	5e                   	pop    esi
  403299:	5d                   	pop    ebp
  40329a:	c2 04 00             	ret    0x4
  40329d:	e8 2a 04 00 00       	call   0x4036cc
  4032a2:	89 30                	mov    DWORD PTR [eax],esi
  4032a4:	8b 77 04             	mov    esi,DWORD PTR [edi+0x4]
  4032a7:	e8 26 04 00 00       	call   0x4036d2
  4032ac:	89 30                	mov    DWORD PTR [eax],esi
  4032ae:	e8 cd 04 00 00       	call   0x403780
  4032b3:	cc                   	int3
  4032b4:	c7 05 a0 64 40 00 00 	mov    DWORD PTR ds:0x4064a0,0x0
  4032bb:	00 00 00 
  4032be:	c3                   	ret
  4032bf:	53                   	push   ebx
  4032c0:	56                   	push   esi
  4032c1:	be c0 49 40 00       	mov    esi,0x4049c0
  4032c6:	bb c0 49 40 00       	mov    ebx,0x4049c0
  4032cb:	3b f3                	cmp    esi,ebx
  4032cd:	73 19                	jae    0x4032e8
  4032cf:	57                   	push   edi
  4032d0:	8b 3e                	mov    edi,DWORD PTR [esi]
  4032d2:	85 ff                	test   edi,edi
  4032d4:	74 0a                	je     0x4032e0
  4032d6:	8b cf                	mov    ecx,edi
  4032d8:	ff 15 4c 41 40 00    	call   DWORD PTR ds:0x40414c
  4032de:	ff d7                	call   edi
  4032e0:	83 c6 04             	add    esi,0x4
  4032e3:	3b f3                	cmp    esi,ebx
  4032e5:	72 e9                	jb     0x4032d0
  4032e7:	5f                   	pop    edi
  4032e8:	5e                   	pop    esi
  4032e9:	5b                   	pop    ebx
  4032ea:	c3                   	ret
  4032eb:	53                   	push   ebx
  4032ec:	56                   	push   esi
  4032ed:	be c8 49 40 00       	mov    esi,0x4049c8
  4032f2:	bb c8 49 40 00       	mov    ebx,0x4049c8
  4032f7:	3b f3                	cmp    esi,ebx
  4032f9:	73 19                	jae    0x403314
  4032fb:	57                   	push   edi
  4032fc:	8b 3e                	mov    edi,DWORD PTR [esi]
  4032fe:	85 ff                	test   edi,edi
  403300:	74 0a                	je     0x40330c
  403302:	8b cf                	mov    ecx,edi
  403304:	ff 15 4c 41 40 00    	call   DWORD PTR ds:0x40414c
  40330a:	ff d7                	call   edi
  40330c:	83 c6 04             	add    esi,0x4
  40330f:	3b f3                	cmp    esi,ebx
  403311:	72 e9                	jb     0x4032fc
  403313:	5f                   	pop    edi
  403314:	5e                   	pop    esi
  403315:	5b                   	pop    ebx
  403316:	c3                   	ret
  403317:	cc                   	int3
  403318:	cc                   	int3
  403319:	cc                   	int3
  40331a:	cc                   	int3
  40331b:	cc                   	int3
  40331c:	cc                   	int3
  40331d:	cc                   	int3
  40331e:	cc                   	int3
  40331f:	cc                   	int3
  403320:	68 65 33 40 00       	push   0x403365
  403325:	64 ff 35 00 00 00 00 	push   DWORD PTR fs:0x0
  40332c:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  403330:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
  403334:	8d 6c 24 10          	lea    ebp,[esp+0x10]
  403338:	2b e0                	sub    esp,eax
  40333a:	53                   	push   ebx
  40333b:	56                   	push   esi
  40333c:	57                   	push   edi
  40333d:	a1 40 60 40 00       	mov    eax,ds:0x406040
  403342:	31 45 fc             	xor    DWORD PTR [ebp-0x4],eax
  403345:	33 c5                	xor    eax,ebp
  403347:	50                   	push   eax
  403348:	89 65 e8             	mov    DWORD PTR [ebp-0x18],esp
  40334b:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
  40334e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  403351:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
  403358:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  40335b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40335e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  403364:	c3                   	ret
  403365:	55                   	push   ebp
  403366:	8b ec                	mov    ebp,esp
  403368:	56                   	push   esi
  403369:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40336c:	ff 36                	push   DWORD PTR [esi]
  40336e:	e8 13 04 00 00       	call   0x403786
  403373:	ff 75 14             	push   DWORD PTR [ebp+0x14]
  403376:	89 06                	mov    DWORD PTR [esi],eax
  403378:	ff 75 10             	push   DWORD PTR [ebp+0x10]
  40337b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  40337e:	56                   	push   esi
  40337f:	68 67 29 40 00       	push   0x402967
  403384:	68 40 60 40 00       	push   0x406040
  403389:	e8 50 03 00 00       	call   0x4036de
  40338e:	83 c4 1c             	add    esp,0x1c
  403391:	5e                   	pop    esi
  403392:	5d                   	pop    ebp
  403393:	c3                   	ret
  403394:	55                   	push   ebp
  403395:	8b ec                	mov    ebp,esp
  403397:	83 0d 98 60 40 00 01 	or     DWORD PTR ds:0x406098,0x1
  40339e:	83 ec 28             	sub    esp,0x28
  4033a1:	c7 05 a8 64 40 00 00 	mov    DWORD PTR ds:0x4064a8,0x0
  4033a8:	00 00 00 
  4033ab:	6a 0a                	push   0xa
  4033ad:	ff 15 18 40 40 00    	call   DWORD PTR ds:0x404018
  4033b3:	85 c0                	test   eax,eax
  4033b5:	0f 84 ef 02 00 00    	je     0x4036aa
  4033bb:	53                   	push   ebx
  4033bc:	56                   	push   esi
  4033bd:	57                   	push   edi
  4033be:	33 c0                	xor    eax,eax
  4033c0:	8d 7d d8             	lea    edi,[ebp-0x28]
  4033c3:	33 c9                	xor    ecx,ecx
  4033c5:	53                   	push   ebx
  4033c6:	0f a2                	cpuid
  4033c8:	8b f3                	mov    esi,ebx
  4033ca:	5b                   	pop    ebx
  4033cb:	90                   	nop
  4033cc:	89 07                	mov    DWORD PTR [edi],eax
  4033ce:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
  4033d1:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
  4033d4:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  4033d7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  4033da:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  4033dd:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4033e0:	81 f1 69 6e 65 49    	xor    ecx,0x49656e69
  4033e6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4033e9:	35 6e 74 65 6c       	xor    eax,0x6c65746e
  4033ee:	0b c8                	or     ecx,eax
  4033f0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4033f3:	6a 01                	push   0x1
  4033f5:	35 47 65 6e 75       	xor    eax,0x756e6547
  4033fa:	0b c8                	or     ecx,eax
  4033fc:	58                   	pop    eax
  4033fd:	6a 00                	push   0x0
  4033ff:	59                   	pop    ecx
  403400:	53                   	push   ebx
  403401:	0f a2                	cpuid
  403403:	8b f3                	mov    esi,ebx
  403405:	5b                   	pop    ebx
  403406:	90                   	nop
  403407:	89 07                	mov    DWORD PTR [edi],eax
  403409:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
  40340c:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
  40340f:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  403412:	75 39                	jne    0x40344d
  403414:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  403417:	25 f0 3f ff 0f       	and    eax,0xfff3ff0
  40341c:	3d c0 06 01 00       	cmp    eax,0x106c0
  403421:	74 23                	je     0x403446
  403423:	3d 60 06 02 00       	cmp    eax,0x20660
  403428:	74 1c                	je     0x403446
  40342a:	3d 70 06 02 00       	cmp    eax,0x20670
  40342f:	74 15                	je     0x403446
  403431:	3d 50 06 03 00       	cmp    eax,0x30650
  403436:	74 0e                	je     0x403446
  403438:	3d 60 06 03 00       	cmp    eax,0x30660
  40343d:	74 07                	je     0x403446
  40343f:	3d 70 06 03 00       	cmp    eax,0x30670
  403444:	75 07                	jne    0x40344d
  403446:	83 0d ac 64 40 00 01 	or     DWORD PTR ds:0x4064ac,0x1
  40344d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
  403450:	33 db                	xor    ebx,ebx
  403452:	33 ff                	xor    edi,edi
  403454:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  403457:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
  40345b:	89 5d ec             	mov    DWORD PTR [ebp-0x14],ebx
  40345e:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  403461:	0f 8c 87 00 00 00    	jl     0x4034ee
  403467:	6a 07                	push   0x7
  403469:	58                   	pop    eax
  40346a:	33 c9                	xor    ecx,ecx
  40346c:	53                   	push   ebx
  40346d:	0f a2                	cpuid
  40346f:	8b f3                	mov    esi,ebx
  403471:	5b                   	pop    ebx
  403472:	90                   	nop
  403473:	8d 5d d8             	lea    ebx,[ebp-0x28]
  403476:	89 03                	mov    DWORD PTR [ebx],eax
  403478:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
  40347b:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  40347e:	89 53 0c             	mov    DWORD PTR [ebx+0xc],edx
  403481:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
  403484:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403487:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  40348a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40348d:	f7 c3 00 02 00 00    	test   ebx,0x200
  403493:	74 07                	je     0x40349c
  403495:	83 0d ac 64 40 00 02 	or     DWORD PTR ds:0x4064ac,0x2
  40349c:	83 7d d8 01          	cmp    DWORD PTR [ebp-0x28],0x1
  4034a0:	7c 24                	jl     0x4034c6
  4034a2:	6a 07                	push   0x7
  4034a4:	58                   	pop    eax
  4034a5:	33 c9                	xor    ecx,ecx
  4034a7:	41                   	inc    ecx
  4034a8:	53                   	push   ebx
  4034a9:	0f a2                	cpuid
  4034ab:	8b f3                	mov    esi,ebx
  4034ad:	5b                   	pop    ebx
  4034ae:	90                   	nop
  4034af:	8d 5d d8             	lea    ebx,[ebp-0x28]
  4034b2:	89 03                	mov    DWORD PTR [ebx],eax
  4034b4:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
  4034b7:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4034ba:	89 53 0c             	mov    DWORD PTR [ebx+0xc],edx
  4034bd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  4034c0:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  4034c3:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  4034c6:	6a 24                	push   0x24
  4034c8:	58                   	pop    eax
  4034c9:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
  4034cc:	7c 1d                	jl     0x4034eb
  4034ce:	33 c9                	xor    ecx,ecx
  4034d0:	8d 7d d8             	lea    edi,[ebp-0x28]
  4034d3:	53                   	push   ebx
  4034d4:	0f a2                	cpuid
  4034d6:	8b f3                	mov    esi,ebx
  4034d8:	5b                   	pop    ebx
  4034d9:	90                   	nop
  4034da:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  4034dd:	89 07                	mov    DWORD PTR [edi],eax
  4034df:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
  4034e2:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
  4034e5:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  4034e8:	8b 7d dc             	mov    edi,DWORD PTR [ebp-0x24]
  4034eb:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  4034ee:	a1 98 60 40 00       	mov    eax,ds:0x406098
  4034f3:	8b 0d 90 60 40 00    	mov    ecx,DWORD PTR ds:0x406090
  4034f9:	83 c8 02             	or     eax,0x2
  4034fc:	8b 35 94 60 40 00    	mov    esi,DWORD PTR ds:0x406094
  403502:	83 e1 fe             	and    ecx,0xfffffffe
  403505:	c7 05 a8 64 40 00 01 	mov    DWORD PTR ds:0x4064a8,0x1
  40350c:	00 00 00 
  40350f:	a3 98 60 40 00       	mov    ds:0x406098,eax
  403514:	89 0d 90 60 40 00    	mov    DWORD PTR ds:0x406090,ecx
  40351a:	89 35 94 60 40 00    	mov    DWORD PTR ds:0x406094,esi
  403520:	f7 c2 00 00 10 00    	test   edx,0x100000
  403526:	0f 84 7b 01 00 00    	je     0x4036a7
  40352c:	83 c8 04             	or     eax,0x4
  40352f:	c7 05 a8 64 40 00 02 	mov    DWORD PTR ds:0x4064a8,0x2
  403536:	00 00 00 
  403539:	a3 98 60 40 00       	mov    ds:0x406098,eax
  40353e:	83 e1 ef             	and    ecx,0xffffffef
  403541:	b8 00 00 00 18       	mov    eax,0x18000000
  403546:	89 0d 90 60 40 00    	mov    DWORD PTR ds:0x406090,ecx
  40354c:	23 d0                	and    edx,eax
  40354e:	89 35 94 60 40 00    	mov    DWORD PTR ds:0x406094,esi
  403554:	3b d0                	cmp    edx,eax
  403556:	0f 85 4b 01 00 00    	jne    0x4036a7
  40355c:	33 c9                	xor    ecx,ecx
  40355e:	0f 01 d0             	xgetbv
  403561:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  403564:	33 f6                	xor    esi,esi
  403566:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  403569:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  40356c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40356f:	83 e0 06             	and    eax,0x6
  403572:	23 ce                	and    ecx,esi
  403574:	83 f8 06             	cmp    eax,0x6
  403577:	0f 85 2a 01 00 00    	jne    0x4036a7
  40357d:	3b ce                	cmp    ecx,esi
  40357f:	0f 85 22 01 00 00    	jne    0x4036a7
  403585:	a1 98 60 40 00       	mov    eax,ds:0x406098
  40358a:	83 c8 08             	or     eax,0x8
  40358d:	c7 05 a8 64 40 00 03 	mov    DWORD PTR ds:0x4064a8,0x3
  403594:	00 00 00 
  403597:	a3 98 60 40 00       	mov    ds:0x406098,eax
  40359c:	f6 c3 20             	test   bl,0x20
  40359f:	74 79                	je     0x40361a
  4035a1:	8b 0d 94 60 40 00    	mov    ecx,DWORD PTR ds:0x406094
  4035a7:	83 c8 20             	or     eax,0x20
  4035aa:	a3 98 60 40 00       	mov    ds:0x406098,eax
  4035af:	ba 00 00 03 d0       	mov    edx,0xd0030000
  4035b4:	a1 90 60 40 00       	mov    eax,ds:0x406090
  4035b9:	23 da                	and    ebx,edx
  4035bb:	83 e0 fd             	and    eax,0xfffffffd
  4035be:	c7 05 a8 64 40 00 05 	mov    DWORD PTR ds:0x4064a8,0x5
  4035c5:	00 00 00 
  4035c8:	a3 90 60 40 00       	mov    ds:0x406090,eax
  4035cd:	89 0d 94 60 40 00    	mov    DWORD PTR ds:0x406094,ecx
  4035d3:	3b da                	cmp    ebx,edx
  4035d5:	75 4e                	jne    0x403625
  4035d7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4035da:	ba e0 00 00 00       	mov    edx,0xe0
  4035df:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4035e2:	23 c2                	and    eax,edx
  4035e4:	23 ce                	and    ecx,esi
  4035e6:	3b c2                	cmp    eax,edx
  4035e8:	75 30                	jne    0x40361a
  4035ea:	3b ce                	cmp    ecx,esi
  4035ec:	75 2c                	jne    0x40361a
  4035ee:	a1 90 60 40 00       	mov    eax,ds:0x406090
  4035f3:	83 0d 98 60 40 00 40 	or     DWORD PTR ds:0x406098,0x40
  4035fa:	83 e0 db             	and    eax,0xffffffdb
  4035fd:	8b 0d 94 60 40 00    	mov    ecx,DWORD PTR ds:0x406094
  403603:	c7 05 a8 64 40 00 06 	mov    DWORD PTR ds:0x4064a8,0x6
  40360a:	00 00 00 
  40360d:	a3 90 60 40 00       	mov    ds:0x406090,eax
  403612:	89 0d 94 60 40 00    	mov    DWORD PTR ds:0x406094,ecx
  403618:	eb 0b                	jmp    0x403625
  40361a:	8b 0d 94 60 40 00    	mov    ecx,DWORD PTR ds:0x406094
  403620:	a1 90 60 40 00       	mov    eax,ds:0x406090
  403625:	f7 45 ec 00 00 80 00 	test   DWORD PTR [ebp-0x14],0x800000
  40362c:	74 10                	je     0x40363e
  40362e:	25 ff ff ff fe       	and    eax,0xfeffffff
  403633:	89 0d 94 60 40 00    	mov    DWORD PTR ds:0x406094,ecx
  403639:	a3 90 60 40 00       	mov    ds:0x406090,eax
  40363e:	f7 45 e8 00 00 08 00 	test   DWORD PTR [ebp-0x18],0x80000
  403645:	74 60                	je     0x4036a7
  403647:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  40364a:	ba e0 00 00 00       	mov    edx,0xe0
  40364f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  403652:	23 c2                	and    eax,edx
  403654:	23 ce                	and    ecx,esi
  403656:	3b c2                	cmp    eax,edx
  403658:	75 4d                	jne    0x4036a7
  40365a:	3b ce                	cmp    ecx,esi
  40365c:	75 49                	jne    0x4036a7
  40365e:	8b c7                	mov    eax,edi
  403660:	33 c9                	xor    ecx,ecx
  403662:	c1 ef 10             	shr    edi,0x10
  403665:	25 ff 00 04 00       	and    eax,0x400ff
  40366a:	83 e7 06             	and    edi,0x6
  40366d:	a3 a4 64 40 00       	mov    ds:0x4064a4,eax
  403672:	81 cf 29 00 00 01    	or     edi,0x1000029
  403678:	f7 d1                	not    ecx
  40367a:	23 0d 94 60 40 00    	and    ecx,DWORD PTR ds:0x406094
  403680:	f7 d7                	not    edi
  403682:	23 3d 90 60 40 00    	and    edi,DWORD PTR ds:0x406090
  403688:	89 3d 90 60 40 00    	mov    DWORD PTR ds:0x406090,edi
  40368e:	89 0d 94 60 40 00    	mov    DWORD PTR ds:0x406094,ecx
  403694:	3c 01                	cmp    al,0x1
  403696:	76 0f                	jbe    0x4036a7
  403698:	83 e7 bf             	and    edi,0xffffffbf
  40369b:	89 0d 94 60 40 00    	mov    DWORD PTR ds:0x406094,ecx
  4036a1:	89 3d 90 60 40 00    	mov    DWORD PTR ds:0x406090,edi
  4036a7:	5f                   	pop    edi
  4036a8:	5e                   	pop    esi
  4036a9:	5b                   	pop    ebx
  4036aa:	33 c0                	xor    eax,eax
  4036ac:	c9                   	leave
  4036ad:	c3                   	ret
  4036ae:	33 c0                	xor    eax,eax
  4036b0:	39 05 9c 60 40 00    	cmp    DWORD PTR ds:0x40609c,eax
  4036b6:	0f 95 c0             	setne  al
  4036b9:	c3                   	ret
  4036ba:	ff 25 b4 40 40 00    	jmp    DWORD PTR ds:0x4040b4
  4036c0:	ff 25 ac 40 40 00    	jmp    DWORD PTR ds:0x4040ac
  4036c6:	ff 25 a8 40 40 00    	jmp    DWORD PTR ds:0x4040a8
  4036cc:	ff 25 a4 40 40 00    	jmp    DWORD PTR ds:0x4040a4
  4036d2:	ff 25 a0 40 40 00    	jmp    DWORD PTR ds:0x4040a0
  4036d8:	ff 25 98 40 40 00    	jmp    DWORD PTR ds:0x404098
  4036de:	ff 25 94 40 40 00    	jmp    DWORD PTR ds:0x404094
  4036e4:	ff 25 cc 40 40 00    	jmp    DWORD PTR ds:0x4040cc
  4036ea:	ff 25 c4 40 40 00    	jmp    DWORD PTR ds:0x4040c4
  4036f0:	ff 25 d0 40 40 00    	jmp    DWORD PTR ds:0x4040d0
  4036f6:	ff 25 30 41 40 00    	jmp    DWORD PTR ds:0x404130
  4036fc:	ff 25 2c 41 40 00    	jmp    DWORD PTR ds:0x40412c
  403702:	ff 25 e4 40 40 00    	jmp    DWORD PTR ds:0x4040e4
  403708:	ff 25 24 41 40 00    	jmp    DWORD PTR ds:0x404124
  40370e:	ff 25 20 41 40 00    	jmp    DWORD PTR ds:0x404120
  403714:	ff 25 1c 41 40 00    	jmp    DWORD PTR ds:0x40411c
  40371a:	ff 25 18 41 40 00    	jmp    DWORD PTR ds:0x404118
  403720:	ff 25 14 41 40 00    	jmp    DWORD PTR ds:0x404114
  403726:	ff 25 10 41 40 00    	jmp    DWORD PTR ds:0x404110
  40372c:	ff 25 f8 40 40 00    	jmp    DWORD PTR ds:0x4040f8
  403732:	ff 25 44 41 40 00    	jmp    DWORD PTR ds:0x404144
  403738:	ff 25 38 41 40 00    	jmp    DWORD PTR ds:0x404138
  40373e:	ff 25 34 41 40 00    	jmp    DWORD PTR ds:0x404134
  403744:	ff 25 0c 41 40 00    	jmp    DWORD PTR ds:0x40410c
  40374a:	ff 25 04 41 40 00    	jmp    DWORD PTR ds:0x404104
  403750:	ff 25 28 41 40 00    	jmp    DWORD PTR ds:0x404128
  403756:	ff 25 dc 40 40 00    	jmp    DWORD PTR ds:0x4040dc
  40375c:	ff 25 c8 40 40 00    	jmp    DWORD PTR ds:0x4040c8
  403762:	ff 25 40 41 40 00    	jmp    DWORD PTR ds:0x404140
  403768:	ff 25 ec 40 40 00    	jmp    DWORD PTR ds:0x4040ec
  40376e:	ff 25 f0 40 40 00    	jmp    DWORD PTR ds:0x4040f0
  403774:	ff 25 f4 40 40 00    	jmp    DWORD PTR ds:0x4040f4
  40377a:	ff 25 fc 40 40 00    	jmp    DWORD PTR ds:0x4040fc
  403780:	ff 25 00 41 40 00    	jmp    DWORD PTR ds:0x404100
  403786:	55                   	push   ebp
  403787:	8b ec                	mov    ebp,esp
  403789:	51                   	push   ecx
  40378a:	83 3d a8 64 40 00 01 	cmp    DWORD PTR ds:0x4064a8,0x1
  403791:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403794:	7c 5c                	jl     0x4037f2
  403796:	81 f9 b4 02 00 c0    	cmp    ecx,0xc00002b4
  40379c:	74 08                	je     0x4037a6
  40379e:	81 f9 b5 02 00 c0    	cmp    ecx,0xc00002b5
  4037a4:	75 4c                	jne    0x4037f2
  4037a6:	0f ae 5d fc          	stmxcsr DWORD PTR [ebp-0x4]
  4037aa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4037ad:	83 f0 3f             	xor    eax,0x3f
  4037b0:	a8 81                	test   al,0x81
  4037b2:	74 42                	je     0x4037f6
  4037b4:	a9 04 02 00 00       	test   eax,0x204
  4037b9:	75 07                	jne    0x4037c2
  4037bb:	b8 8e 00 00 c0       	mov    eax,0xc000008e
  4037c0:	c9                   	leave
  4037c1:	c3                   	ret
  4037c2:	a9 02 01 00 00       	test   eax,0x102
  4037c7:	74 2d                	je     0x4037f6
  4037c9:	a9 08 04 00 00       	test   eax,0x408
  4037ce:	75 07                	jne    0x4037d7
  4037d0:	b8 91 00 00 c0       	mov    eax,0xc0000091
  4037d5:	c9                   	leave
  4037d6:	c3                   	ret
  4037d7:	a9 10 08 00 00       	test   eax,0x810
  4037dc:	75 07                	jne    0x4037e5
  4037de:	b8 93 00 00 c0       	mov    eax,0xc0000093
  4037e3:	c9                   	leave
  4037e4:	c3                   	ret
  4037e5:	a9 20 10 00 00       	test   eax,0x1020
  4037ea:	b8 8f 00 00 c0       	mov    eax,0xc000008f
  4037ef:	0f 44 c8             	cmove  ecx,eax
  4037f2:	8b c1                	mov    eax,ecx
  4037f4:	c9                   	leave
  4037f5:	c3                   	ret
  4037f6:	b8 90 00 00 c0       	mov    eax,0xc0000090
  4037fb:	c9                   	leave
  4037fc:	c3                   	ret
  4037fd:	ff 25 b8 40 40 00    	jmp    DWORD PTR ds:0x4040b8
  403803:	ff 25 9c 40 40 00    	jmp    DWORD PTR ds:0x40409c
  403809:	cc                   	int3
  40380a:	cc                   	int3
  40380b:	cc                   	int3
  40380c:	cc                   	int3
  40380d:	cc                   	int3
  40380e:	cc                   	int3
  40380f:	cc                   	int3
  403810:	8d 4d d8             	lea    ecx,[ebp-0x28]
  403813:	e9 58 eb ff ff       	jmp    0x402370
  403818:	8d 8d a0 fe ff ff    	lea    ecx,[ebp-0x160]
  40381e:	e9 4d eb ff ff       	jmp    0x402370
  403823:	8d 8d b8 fe ff ff    	lea    ecx,[ebp-0x148]
  403829:	e9 42 eb ff ff       	jmp    0x402370
  40382e:	8d 8d d0 fe ff ff    	lea    ecx,[ebp-0x130]
  403834:	e9 37 eb ff ff       	jmp    0x402370
  403839:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  40383f:	e9 2c eb ff ff       	jmp    0x402370
  403844:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  40384a:	e9 21 eb ff ff       	jmp    0x402370
  40384f:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  403855:	e9 16 eb ff ff       	jmp    0x402370
  40385a:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  403860:	e9 0b eb ff ff       	jmp    0x402370
  403865:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  40386b:	e9 00 eb ff ff       	jmp    0x402370
  403870:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  403876:	e9 f5 ea ff ff       	jmp    0x402370
  40387b:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  403881:	e9 ea ea ff ff       	jmp    0x402370
  403886:	8d 4d 90             	lea    ecx,[ebp-0x70]
  403889:	e9 e2 ea ff ff       	jmp    0x402370
  40388e:	8d 4d a8             	lea    ecx,[ebp-0x58]
  403891:	e9 da ea ff ff       	jmp    0x402370
  403896:	8d 8d b0 fd ff ff    	lea    ecx,[ebp-0x250]
  40389c:	e9 cf ea ff ff       	jmp    0x402370
  4038a1:	8d 8d c8 fd ff ff    	lea    ecx,[ebp-0x238]
  4038a7:	e9 c4 ea ff ff       	jmp    0x402370
  4038ac:	8d 8d e0 fd ff ff    	lea    ecx,[ebp-0x220]
  4038b2:	e9 b9 ea ff ff       	jmp    0x402370
  4038b7:	8d 8d f8 fd ff ff    	lea    ecx,[ebp-0x208]
  4038bd:	e9 ae ea ff ff       	jmp    0x402370
  4038c2:	8d 8d 10 fe ff ff    	lea    ecx,[ebp-0x1f0]
  4038c8:	e9 a3 ea ff ff       	jmp    0x402370
  4038cd:	8d 8d 28 fe ff ff    	lea    ecx,[ebp-0x1d8]
  4038d3:	e9 98 ea ff ff       	jmp    0x402370
  4038d8:	8d 8d 40 fe ff ff    	lea    ecx,[ebp-0x1c0]
  4038de:	e9 8d ea ff ff       	jmp    0x402370
  4038e3:	8d 8d 58 fe ff ff    	lea    ecx,[ebp-0x1a8]
  4038e9:	e9 82 ea ff ff       	jmp    0x402370
  4038ee:	8d 8d 70 fe ff ff    	lea    ecx,[ebp-0x190]
  4038f4:	e9 77 ea ff ff       	jmp    0x402370
  4038f9:	8d 8d 88 fe ff ff    	lea    ecx,[ebp-0x178]
  4038ff:	e9 6c ea ff ff       	jmp    0x402370
  403904:	8d 4d c0             	lea    ecx,[ebp-0x40]
  403907:	e9 64 ea ff ff       	jmp    0x402370
  40390c:	cc                   	int3
  40390d:	cc                   	int3
  40390e:	cc                   	int3
  40390f:	cc                   	int3
  403910:	cc                   	int3
  403911:	90                   	nop
  403912:	90                   	nop
  403913:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  403917:	8d 42 0c             	lea    eax,[edx+0xc]
  40391a:	8b 8a b0 fd ff ff    	mov    ecx,DWORD PTR [edx-0x250]
  403920:	33 c8                	xor    ecx,eax
  403922:	e8 40 f0 ff ff       	call   0x402967
  403927:	8b 4a fc             	mov    ecx,DWORD PTR [edx-0x4]
  40392a:	33 c8                	xor    ecx,eax
  40392c:	e8 36 f0 ff ff       	call   0x402967
  403931:	b8 d0 49 40 00       	mov    eax,0x4049d0
  403936:	e9 7f fd ff ff       	jmp    0x4036ba
  40393b:	cc                   	int3
  40393c:	cc                   	int3
  40393d:	cc                   	int3
  40393e:	cc                   	int3
  40393f:	cc                   	int3
  403940:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403943:	ff 25 68 40 40 00    	jmp    DWORD PTR ds:0x404068
  403949:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40394c:	e9 af ec ff ff       	jmp    0x402600
  403951:	cc                   	int3
  403952:	cc                   	int3
  403953:	cc                   	int3
  403954:	cc                   	int3
  403955:	cc                   	int3
  403956:	90                   	nop
  403957:	90                   	nop
  403958:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  40395c:	8d 42 0c             	lea    eax,[edx+0xc]
  40395f:	8b 4a dc             	mov    ecx,DWORD PTR [edx-0x24]
  403962:	33 c8                	xor    ecx,eax
  403964:	e8 fe ef ff ff       	call   0x402967
  403969:	8b 4a fc             	mov    ecx,DWORD PTR [edx-0x4]
  40396c:	33 c8                	xor    ecx,eax
  40396e:	e8 f4 ef ff ff       	call   0x402967
  403973:	b8 08 4b 40 00       	mov    eax,0x404b08
  403978:	e9 3d fd ff ff       	jmp    0x4036ba
  40397d:	cc                   	int3
  40397e:	cc                   	int3
  40397f:	cc                   	int3
  403980:	8d 4d d0             	lea    ecx,[ebp-0x30]
  403983:	e9 b8 eb ff ff       	jmp    0x402540
  403988:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40398b:	e9 00 ec ff ff       	jmp    0x402590
  403990:	cc                   	int3
  403991:	cc                   	int3
  403992:	cc                   	int3
  403993:	cc                   	int3
  403994:	cc                   	int3
  403995:	90                   	nop
  403996:	90                   	nop
  403997:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  40399b:	8d 42 0c             	lea    eax,[edx+0xc]
  40399e:	8b 4a cc             	mov    ecx,DWORD PTR [edx-0x34]
  4039a1:	33 c8                	xor    ecx,eax
  4039a3:	e8 bf ef ff ff       	call   0x402967
  4039a8:	b8 3c 4b 40 00       	mov    eax,0x404b3c
  4039ad:	e9 08 fd ff ff       	jmp    0x4036ba
  4039b2:	cc                   	int3
  4039b3:	cc                   	int3
  4039b4:	cc                   	int3
  4039b5:	cc                   	int3
  4039b6:	cc                   	int3
  4039b7:	cc                   	int3
  4039b8:	cc                   	int3
  4039b9:	cc                   	int3
  4039ba:	cc                   	int3
  4039bb:	cc                   	int3
  4039bc:	cc                   	int3
  4039bd:	cc                   	int3
  4039be:	cc                   	int3
  4039bf:	cc                   	int3
  4039c0:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4039c3:	e9 78 eb ff ff       	jmp    0x402540
  4039c8:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4039cb:	e9 10 eb ff ff       	jmp    0x4024e0
  4039d0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4039d3:	e9 28 d8 ff ff       	jmp    0x401200
  4039d8:	cc                   	int3
  4039d9:	cc                   	int3
  4039da:	cc                   	int3
  4039db:	cc                   	int3
  4039dc:	cc                   	int3
  4039dd:	90                   	nop
  4039de:	90                   	nop
  4039df:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  4039e3:	8d 42 0c             	lea    eax,[edx+0xc]
  4039e6:	8b 4a c0             	mov    ecx,DWORD PTR [edx-0x40]
  4039e9:	33 c8                	xor    ecx,eax
  4039eb:	e8 77 ef ff ff       	call   0x402967
  4039f0:	b8 ac 4b 40 00       	mov    eax,0x404bac
  4039f5:	e9 c0 fc ff ff       	jmp    0x4036ba
  4039fa:	cc                   	int3
  4039fb:	cc                   	int3
  4039fc:	cc                   	int3
  4039fd:	cc                   	int3
  4039fe:	cc                   	int3
  4039ff:	cc                   	int3
