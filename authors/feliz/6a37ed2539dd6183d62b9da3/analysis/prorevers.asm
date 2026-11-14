
prorevers.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	push   ebp
  401001:	mov    ebp,esp
  401003:	push   esi
  401004:	mov    esi,ecx
  401006:	xorps  xmm0,xmm0
  401009:	lea    eax,[esi+0x4]
  40100c:	push   eax
  40100d:	mov    DWORD PTR [esi],0x403184
  401013:	movq   QWORD PTR [eax],xmm0
  401017:	mov    eax,DWORD PTR [ebp+0x8]
  40101a:	add    eax,0x4
  40101d:	push   eax
  40101e:	call   DWORD PTR ds:0x4030a0
  401024:	add    esp,0x8
  401027:	mov    eax,esi
  401029:	pop    esi
  40102a:	pop    ebp
  40102b:	ret    0x4
  40102e:	int3
  40102f:	int3
  401030:	mov    ecx,DWORD PTR [ecx+0x4]
  401033:	mov    eax,0x4031b4
  401038:	test   ecx,ecx
  40103a:	cmovne eax,ecx
  40103d:	ret
  40103e:	int3
  40103f:	int3
  401040:	push   ebp
  401041:	mov    ebp,esp
  401043:	push   esi
  401044:	mov    esi,ecx
  401046:	lea    eax,[esi+0x4]
  401049:	mov    DWORD PTR [esi],0x403184
  40104f:	push   eax
  401050:	call   DWORD PTR ds:0x4030a4
  401056:	add    esp,0x4
  401059:	test   BYTE PTR [ebp+0x8],0x1
  40105d:	je     0x40106a
  40105f:	push   0xc
  401061:	push   esi
  401062:	call   0x401f3b
  401067:	add    esp,0x8
  40106a:	mov    eax,esi
  40106c:	pop    esi
  40106d:	pop    ebp
  40106e:	ret    0x4
  401071:	int3
  401072:	int3
  401073:	int3
  401074:	int3
  401075:	int3
  401076:	int3
  401077:	int3
  401078:	int3
  401079:	int3
  40107a:	int3
  40107b:	int3
  40107c:	int3
  40107d:	int3
  40107e:	int3
  40107f:	int3
  401080:	lea    eax,[ecx+0x4]
  401083:	mov    DWORD PTR [ecx],0x403184
  401089:	push   eax
  40108a:	call   DWORD PTR ds:0x4030a4
  401090:	pop    ecx
  401091:	ret
  401092:	int3
  401093:	int3
  401094:	int3
  401095:	int3
  401096:	int3
  401097:	int3
  401098:	int3
  401099:	int3
  40109a:	int3
  40109b:	int3
  40109c:	int3
  40109d:	int3
  40109e:	int3
  40109f:	int3
  4010a0:	xorps  xmm0,xmm0
  4010a3:	mov    eax,ecx
  4010a5:	movq   QWORD PTR [ecx+0x4],xmm0
  4010aa:	mov    DWORD PTR [ecx+0x4],0x4031c8
  4010b1:	mov    DWORD PTR [ecx],0x4031ac
  4010b7:	ret
  4010b8:	int3
  4010b9:	int3
  4010ba:	int3
  4010bb:	int3
  4010bc:	int3
  4010bd:	int3
  4010be:	int3
  4010bf:	int3
  4010c0:	push   ebp
  4010c1:	mov    ebp,esp
  4010c3:	sub    esp,0xc
  4010c6:	lea    ecx,[ebp-0xc]
  4010c9:	call   0x4010a0
  4010ce:	push   0x403ab4
  4010d3:	lea    eax,[ebp-0xc]
  4010d6:	push   eax
  4010d7:	call   0x402c56
  4010dc:	int3
  4010dd:	int3
  4010de:	int3
  4010df:	int3
  4010e0:	push   ebp
  4010e1:	mov    ebp,esp
  4010e3:	push   esi
  4010e4:	mov    esi,ecx
  4010e6:	xorps  xmm0,xmm0
  4010e9:	lea    eax,[esi+0x4]
  4010ec:	push   eax
  4010ed:	mov    DWORD PTR [esi],0x403184
  4010f3:	movq   QWORD PTR [eax],xmm0
  4010f7:	mov    eax,DWORD PTR [ebp+0x8]
  4010fa:	add    eax,0x4
  4010fd:	push   eax
  4010fe:	call   DWORD PTR ds:0x4030a0
  401104:	add    esp,0x8
  401107:	mov    DWORD PTR [esi],0x4031ac
  40110d:	mov    eax,esi
  40110f:	pop    esi
  401110:	pop    ebp
  401111:	ret    0x4
  401114:	int3
  401115:	int3
  401116:	int3
  401117:	int3
  401118:	int3
  401119:	int3
  40111a:	int3
  40111b:	int3
  40111c:	int3
  40111d:	int3
  40111e:	int3
  40111f:	int3
  401120:	push   ebp
  401121:	mov    ebp,esp
  401123:	push   esi
  401124:	mov    esi,ecx
  401126:	xorps  xmm0,xmm0
  401129:	lea    eax,[esi+0x4]
  40112c:	push   eax
  40112d:	mov    DWORD PTR [esi],0x403184
  401133:	movq   QWORD PTR [eax],xmm0
  401137:	mov    eax,DWORD PTR [ebp+0x8]
  40113a:	add    eax,0x4
  40113d:	push   eax
  40113e:	call   DWORD PTR ds:0x4030a0
  401144:	add    esp,0x8
  401147:	mov    DWORD PTR [esi],0x403190
  40114d:	mov    eax,esi
  40114f:	pop    esi
  401150:	pop    ebp
  401151:	ret    0x4
  401154:	int3
  401155:	int3
  401156:	int3
  401157:	int3
  401158:	int3
  401159:	int3
  40115a:	int3
  40115b:	int3
  40115c:	int3
  40115d:	int3
  40115e:	int3
  40115f:	int3
  401160:	push   0x4031e0
  401165:	call   DWORD PTR ds:0x40306c
  40116b:	int3
  40116c:	int3
  40116d:	int3
  40116e:	int3
  40116f:	int3
  401170:	push   ebx
  401171:	mov    ebx,esp
  401173:	sub    esp,0x8
  401176:	and    esp,0xfffffff8
  401179:	add    esp,0x4
  40117c:	push   ebp
  40117d:	mov    ebp,DWORD PTR [ebx+0x4]
  401180:	mov    DWORD PTR [esp+0x4],ebp
  401184:	mov    ebp,esp
  401186:	push   0xffffffff
  401188:	push   0x402dbd
  40118d:	mov    eax,fs:0x0
  401193:	push   eax
  401194:	push   ebx
  401195:	sub    esp,0x58
  401198:	mov    eax,ds:0x405000
  40119d:	xor    eax,ebp
  40119f:	mov    DWORD PTR [ebp-0x14],eax
  4011a2:	push   esi
  4011a3:	push   edi
  4011a4:	push   eax
  4011a5:	lea    eax,[ebp-0xc]
  4011a8:	mov    fs:0x0,eax
  4011ae:	mov    edi,ecx
  4011b0:	mov    DWORD PTR [ebp-0x30],edi
  4011b3:	xorps  xmm0,xmm0
  4011b6:	mov    DWORD PTR [ebp-0x1c],0x0
  4011bd:	movups XMMWORD PTR [ebp-0x2c],xmm0
  4011c1:	mov    DWORD PTR [ebp-0x18],0xf
  4011c8:	mov    BYTE PTR [ebp-0x2c],0x0
  4011cc:	mov    DWORD PTR [ebp-0x4],0x0
  4011d3:	mov    eax,DWORD PTR [edi+0x4]
  4011d6:	lea    ecx,[eax*8+0x0]
  4011dd:	sub    ecx,eax
  4011df:	mov    eax,0x4ec4ec4f
  4011e4:	add    ecx,0x43
  4011e7:	imul   ecx
  4011e9:	lea    ecx,[ebp-0x48]
  4011ec:	sar    edx,0x4
  4011ef:	mov    eax,edx
  4011f1:	shr    eax,0x1f
  4011f4:	add    eax,edx
  4011f6:	imul   edx,eax,0xb9a
  4011fc:	sub    edx,0xa5318
  401202:	call   0x401560
  401207:	mov    BYTE PTR [ebp-0x4],0x1
  40120b:	mov    ecx,DWORD PTR [ebp-0x34]
  40120e:	mov    eax,ecx
  401210:	mov    edx,DWORD PTR [ebp-0x38]
  401213:	sub    eax,edx
  401215:	cmp    eax,0x6
  401218:	jb     0x40129e
  40121e:	cmp    ecx,0xf
  401221:	lea    esi,[ebp-0x48]
  401224:	lea    eax,[edx+0x6]
  401227:	cmova  esi,DWORD PTR [ebp-0x48]
  40122b:	mov    DWORD PTR [ebp-0x38],eax
  40122e:	cmp    esi,0x4031f6
  401234:	jae    0x401256
  401236:	lea    eax,[esi+edx*1]
  401239:	cmp    eax,0x4031f0
  40123e:	jb     0x401256
  401240:	cmp    esi,0x4031f0
  401246:	ja     0x40124c
  401248:	xor    edi,edi
  40124a:	jmp    0x40125b
  40124c:	mov    edi,esi
  40124e:	sub    edi,0x4031f0
  401254:	jmp    0x40125b
  401256:	mov    edi,0x6
  40125b:	lea    eax,[edx+0x1]
  40125e:	push   eax
  40125f:	lea    ecx,[esi+0x6]
  401262:	push   esi
  401263:	push   ecx
  401264:	call   0x402d93
  401269:	add    esp,0xc
  40126c:	push   edi
  40126d:	push   0x4031f0
  401272:	push   esi
  401273:	call   0x402d8d
  401278:	add    esp,0xc
  40127b:	lea    ecx,[esi+edi*1]
  40127e:	mov    eax,0x6
  401283:	sub    eax,edi
  401285:	push   eax
  401286:	lea    eax,[edi+0x4031f6]
  40128c:	push   eax
  40128d:	push   ecx
  40128e:	call   0x402d8d
  401293:	mov    edi,DWORD PTR [ebp-0x30]
  401296:	lea    eax,[ebp-0x48]
  401299:	add    esp,0xc
  40129c:	jmp    0x4012b4
  40129e:	push   0x6
  4012a0:	sub    esp,0x8
  4012a3:	mov    BYTE PTR [ebp-0x30],0x0
  4012a7:	lea    ecx,[ebp-0x48]
  4012aa:	push   DWORD PTR [ebp-0x30]
  4012ad:	push   0x6
  4012af:	call   0x401db0
  4012b4:	movups xmm0,XMMWORD PTR [eax]
  4012b7:	movups XMMWORD PTR [ebp-0x60],xmm0
  4012bb:	movq   xmm0,QWORD PTR [eax+0x10]
  4012c0:	movq   QWORD PTR [ebp-0x50],xmm0
  4012c5:	mov    DWORD PTR [eax+0x10],0x0
  4012cc:	mov    DWORD PTR [eax+0x14],0xf
  4012d3:	mov    BYTE PTR [eax],0x0
  4012d6:	mov    BYTE PTR [ebp-0x4],0x3
  4012da:	mov    ecx,DWORD PTR [ebp-0x34]
  4012dd:	cmp    ecx,0xf
  4012e0:	jbe    0x40131a
  4012e2:	mov    edx,DWORD PTR [ebp-0x48]
  4012e5:	inc    ecx
  4012e6:	mov    eax,edx
  4012e8:	cmp    ecx,0x1000
  4012ee:	jb     0x401310
  4012f0:	mov    edx,DWORD PTR [eax-0x4]
  4012f3:	add    ecx,0x23
  4012f6:	sub    eax,edx
  4012f8:	add    eax,0xfffffffc
  4012fb:	cmp    eax,0x1f
  4012fe:	jbe    0x401310
  401300:	push   0x0
  401302:	push   0x0
  401304:	push   0x0
  401306:	push   0x0
  401308:	push   0x0
  40130a:	call   DWORD PTR ds:0x4030e8
  401310:	push   ecx
  401311:	push   edx
  401312:	call   0x401f3b
  401317:	add    esp,0x8
  40131a:	cmp    DWORD PTR [edi],0x0
  40131d:	mov    DWORD PTR [ebp-0x38],0x0
  401324:	mov    DWORD PTR [ebp-0x34],0xf
  40132b:	mov    BYTE PTR [ebp-0x48],0x0
  40132f:	jle    0x401432
  401335:	data16 data16 nop WORD PTR [eax+eax*1+0x0]
  401340:	mov    ecx,DWORD PTR ds:0x403058
  401346:	mov    edx,0x4031f8
  40134b:	call   0x4016f0
  401350:	mov    esi,DWORD PTR ds:0x403070
  401356:	push   0xa
  401358:	mov    eax,DWORD PTR [esi]
  40135a:	mov    ecx,DWORD PTR [eax+0x4]
  40135d:	add    ecx,esi
  40135f:	call   DWORD PTR ds:0x40304c
  401365:	movzx  eax,al
  401368:	lea    edx,[ebp-0x2c]
  40136b:	push   eax
  40136c:	mov    ecx,esi
  40136e:	call   0x401a00
  401373:	mov    esi,DWORD PTR [ebp-0x1c]
  401376:	lea    edx,[ebp-0x60]
  401379:	add    esp,0x4
  40137c:	lea    eax,[ebp-0x2c]
  40137f:	cmp    DWORD PTR [ebp-0x4c],0xf
  401383:	cmova  edx,DWORD PTR [ebp-0x60]
  401387:	cmp    DWORD PTR [ebp-0x18],0xf
  40138b:	cmova  eax,DWORD PTR [ebp-0x2c]
  40138f:	cmp    esi,DWORD PTR [ebp-0x50]
  401392:	jne    0x4013fa
  401394:	test   esi,esi
  401396:	je     0x4014bd
  40139c:	sub    esi,0x4
  40139f:	jb     0x4013b2
  4013a1:	mov    ecx,DWORD PTR [eax]
  4013a3:	cmp    ecx,DWORD PTR [edx]
  4013a5:	jne    0x4013b7
  4013a7:	add    eax,0x4
  4013aa:	add    edx,0x4
  4013ad:	sub    esi,0x4
  4013b0:	jae    0x4013a1
  4013b2:	cmp    esi,0xfffffffc
  4013b5:	je     0x4013eb
  4013b7:	mov    cl,BYTE PTR [eax]
  4013b9:	cmp    cl,BYTE PTR [edx]
  4013bb:	jne    0x4013e4
  4013bd:	cmp    esi,0xfffffffd
  4013c0:	je     0x4013eb
  4013c2:	mov    cl,BYTE PTR [eax+0x1]
  4013c5:	cmp    cl,BYTE PTR [edx+0x1]
  4013c8:	jne    0x4013e4
  4013ca:	cmp    esi,0xfffffffe
  4013cd:	je     0x4013eb
  4013cf:	mov    cl,BYTE PTR [eax+0x2]
  4013d2:	cmp    cl,BYTE PTR [edx+0x2]
  4013d5:	jne    0x4013e4
  4013d7:	cmp    esi,0xffffffff
  4013da:	je     0x4013eb
  4013dc:	mov    al,BYTE PTR [eax+0x3]
  4013df:	cmp    al,BYTE PTR [edx+0x3]
  4013e2:	je     0x4013eb
  4013e4:	sbb    eax,eax
  4013e6:	or     eax,0x1
  4013e9:	jmp    0x4013ed
  4013eb:	xor    eax,eax
  4013ed:	test   eax,eax
  4013ef:	sete   al
  4013f2:	test   al,al
  4013f4:	jne    0x4014bd
  4013fa:	mov    eax,DWORD PTR [edi]
  4013fc:	dec    eax
  4013fd:	mov    DWORD PTR [edi],eax
  4013ff:	test   eax,eax
  401401:	jle    0x401429
  401403:	mov    ecx,DWORD PTR ds:0x403058
  401409:	mov    edx,0x403218
  40140e:	push   0x401910
  401413:	push   eax
  401414:	call   0x4016f0
  401419:	mov    ecx,eax
  40141b:	call   DWORD PTR ds:0x403050
  401421:	mov    ecx,eax
  401423:	call   DWORD PTR ds:0x40307c
  401429:	cmp    DWORD PTR [edi],0x0
  40142c:	jg     0x401340
  401432:	mov    esi,DWORD PTR [ebp-0x2c]
  401435:	mov    edx,0x403230
  40143a:	push   0x401910
  40143f:	push   ecx
  401440:	mov    ecx,DWORD PTR ds:0x403058
  401446:	call   0x4016f0
  40144b:	add    esp,0x4
  40144e:	mov    ecx,eax
  401450:	call   DWORD PTR ds:0x40307c
  401456:	mov    eax,DWORD PTR [ebp-0x4c]
  401459:	cmp    eax,0xf
  40145c:	jbe    0x401488
  40145e:	mov    edx,DWORD PTR [ebp-0x60]
  401461:	lea    ecx,[eax+0x1]
  401464:	mov    eax,edx
  401466:	cmp    ecx,0x1000
  40146c:	jb     0x40147e
  40146e:	mov    edx,DWORD PTR [eax-0x4]
  401471:	add    ecx,0x23
  401474:	sub    eax,edx
  401476:	add    eax,0xfffffffc
  401479:	cmp    eax,0x1f
  40147c:	ja     0x4014ad
  40147e:	push   ecx
  40147f:	push   edx
  401480:	call   0x401f3b
  401485:	add    esp,0x8
  401488:	mov    eax,DWORD PTR [ebp-0x18]
  40148b:	cmp    eax,0xf
  40148e:	jbe    0x4014f0
  401490:	lea    ecx,[eax+0x1]
  401493:	mov    eax,esi
  401495:	cmp    ecx,0x1000
  40149b:	jb     0x4014e6
  40149d:	mov    esi,DWORD PTR [eax-0x4]
  4014a0:	add    ecx,0x23
  4014a3:	sub    eax,esi
  4014a5:	add    eax,0xfffffffc
  4014a8:	cmp    eax,0x1f
  4014ab:	jbe    0x4014e6
  4014ad:	push   0x0
  4014af:	push   0x0
  4014b1:	push   0x0
  4014b3:	push   0x0
  4014b5:	push   0x0
  4014b7:	call   DWORD PTR ds:0x4030e8
  4014bd:	push   0x401910
  4014c2:	push   ecx
  4014c3:	mov    ecx,DWORD PTR ds:0x403058
  4014c9:	mov    edx,0x403208
  4014ce:	call   0x4016f0
  4014d3:	add    esp,0x4
  4014d6:	mov    ecx,eax
  4014d8:	call   DWORD PTR ds:0x40307c
  4014de:	mov    esi,DWORD PTR [ebp-0x2c]
  4014e1:	jmp    0x401456
  4014e6:	push   ecx
  4014e7:	push   esi
  4014e8:	call   0x401f3b
  4014ed:	add    esp,0x8
  4014f0:	mov    ecx,DWORD PTR [ebp-0xc]
  4014f3:	mov    DWORD PTR fs:0x0,ecx
  4014fa:	pop    ecx
  4014fb:	pop    edi
  4014fc:	pop    esi
  4014fd:	mov    ecx,DWORD PTR [ebp-0x14]
  401500:	xor    ecx,ebp
  401502:	call   0x401efd
  401507:	mov    esp,ebp
  401509:	pop    ebp
  40150a:	mov    esp,ebx
  40150c:	pop    ebx
  40150d:	ret
  40150e:	int3
  40150f:	int3
  401510:	push   ebp
  401511:	mov    ebp,esp
  401513:	and    esp,0xfffffff8
  401516:	sub    esp,0x8
  401519:	push   0x403238
  40151e:	call   DWORD PTR ds:0x4030f4
  401524:	add    esp,0x4
  401527:	mov    DWORD PTR [esp],0x3
  40152e:	lea    ecx,[esp]
  401531:	mov    DWORD PTR [esp+0x4],0x1cdf
  401539:	call   0x401170
  40153e:	mov    ecx,DWORD PTR ds:0x403058
  401544:	mov    edx,0x403248
  401549:	call   0x4016f0
  40154e:	mov    ecx,DWORD PTR ds:0x403070
  401554:	call   DWORD PTR ds:0x403048
  40155a:	xor    eax,eax
  40155c:	mov    esp,ebp
  40155e:	pop    ebp
  40155f:	ret
  401560:	push   ebp
  401561:	mov    ebp,esp
  401563:	sub    esp,0x28
  401566:	mov    eax,ds:0x405000
  40156b:	xor    eax,ebp
  40156d:	mov    DWORD PTR [ebp-0x4],eax
  401570:	push   ebx
  401571:	push   esi
  401572:	mov    esi,ecx
  401574:	mov    ebx,edx
  401576:	mov    DWORD PTR [ebp-0x20],esi
  401579:	mov    DWORD PTR [ebp-0x20],esi
  40157c:	push   edi
  40157d:	lea    edi,[ebp-0x7]
  401580:	test   ebx,ebx
  401582:	jns    0x4015b0
  401584:	neg    ebx
  401586:	mov    eax,0xcccccccd
  40158b:	dec    edi
  40158c:	mul    ebx
  40158e:	shr    edx,0x3
  401591:	mov    al,dl
  401593:	shl    al,0x2
  401596:	lea    ecx,[eax+edx*1]
  401599:	add    cl,cl
  40159b:	sub    bl,cl
  40159d:	add    bl,0x30
  4015a0:	mov    BYTE PTR [edi],bl
  4015a2:	mov    ebx,edx
  4015a4:	test   ebx,ebx
  4015a6:	jne    0x401586
  4015a8:	dec    edi
  4015a9:	mov    BYTE PTR [edi],0x2d
  4015ac:	jmp    0x4015d2
  4015ae:	xchg   ax,ax
  4015b0:	mov    eax,0xcccccccd
  4015b5:	dec    edi
  4015b6:	mul    ebx
  4015b8:	shr    edx,0x3
  4015bb:	mov    al,dl
  4015bd:	shl    al,0x2
  4015c0:	lea    ecx,[eax+edx*1]
  4015c3:	add    cl,cl
  4015c5:	sub    bl,cl
  4015c7:	add    bl,0x30
  4015ca:	mov    BYTE PTR [edi],bl
  4015cc:	mov    ebx,edx
  4015ce:	test   ebx,ebx
  4015d0:	jne    0x4015b0
  4015d2:	xorps  xmm0,xmm0
  4015d5:	lea    eax,[ebp-0x7]
  4015d8:	movups XMMWORD PTR [esi],xmm0
  4015db:	mov    DWORD PTR [esi+0x10],0x0
  4015e2:	mov    DWORD PTR [esi+0x14],0x0
  4015e9:	cmp    edi,eax
  4015eb:	jne    0x40160a
  4015ed:	mov    DWORD PTR [esi+0x14],0xf
  4015f4:	mov    eax,esi
  4015f6:	mov    BYTE PTR [esi],0x0
  4015f9:	pop    edi
  4015fa:	pop    esi
  4015fb:	pop    ebx
  4015fc:	mov    ecx,DWORD PTR [ebp-0x4]
  4015ff:	xor    ecx,ebp
  401601:	call   0x401efd
  401606:	mov    esp,ebp
  401608:	pop    ebp
  401609:	ret
  40160a:	lea    ebx,[ebp-0x7]
  40160d:	sub    ebx,edi
  40160f:	cmp    ebx,0x7fffffff
  401615:	ja     0x4016dc
  40161b:	cmp    ebx,0xf
  40161e:	ja     0x40163b
  401620:	push   ebx
  401621:	push   edi
  401622:	push   esi
  401623:	mov    DWORD PTR [esi+0x10],ebx
  401626:	mov    DWORD PTR [esi+0x14],0xf
  40162d:	call   0x402d8d
  401632:	mov    BYTE PTR [ebx+esi*1],0x0
  401636:	jmp    0x4016c6
  40163b:	mov    eax,ebx
  40163d:	or     eax,0xf
  401640:	cmp    eax,0x7fffffff
  401645:	jbe    0x40166e
  401647:	mov    eax,0x80000000
  40164c:	mov    DWORD PTR [ebp-0x24],0x7fffffff
  401653:	add    eax,0x23
  401656:	push   eax
  401657:	call   0x401f0b
  40165c:	add    esp,0x4
  40165f:	test   eax,eax
  401661:	jne    0x401693
  401663:	push   eax
  401664:	push   eax
  401665:	push   eax
  401666:	push   eax
  401667:	push   eax
  401668:	call   DWORD PTR ds:0x4030e8
  40166e:	mov    ecx,0x16
  401673:	cmp    eax,ecx
  401675:	cmovb  eax,ecx
  401678:	mov    DWORD PTR [ebp-0x24],eax
  40167b:	lea    ecx,[eax+0x1]
  40167e:	test   ecx,ecx
  401680:	je     0x4016ac
  401682:	cmp    ecx,0x1000
  401688:	jb     0x40169e
  40168a:	lea    eax,[ecx+0x23]
  40168d:	cmp    eax,ecx
  40168f:	jbe    0x4016e1
  401691:	jmp    0x401656
  401693:	lea    ecx,[eax+0x23]
  401696:	and    ecx,0xffffffe0
  401699:	mov    DWORD PTR [ecx-0x4],eax
  40169c:	jmp    0x4016a9
  40169e:	push   ecx
  40169f:	call   0x401f0b
  4016a4:	add    esp,0x4
  4016a7:	mov    ecx,eax
  4016a9:	mov    eax,DWORD PTR [ebp-0x24]
  4016ac:	push   ebx
  4016ad:	push   edi
  4016ae:	push   ecx
  4016af:	mov    DWORD PTR [ebp-0x20],ecx
  4016b2:	mov    DWORD PTR [esi],ecx
  4016b4:	mov    DWORD PTR [esi+0x10],ebx
  4016b7:	mov    DWORD PTR [esi+0x14],eax
  4016ba:	call   0x402d8d
  4016bf:	mov    eax,DWORD PTR [ebp-0x20]
  4016c2:	mov    BYTE PTR [eax+ebx*1],0x0
  4016c6:	mov    ecx,DWORD PTR [ebp-0x4]
  4016c9:	add    esp,0xc
  4016cc:	mov    eax,esi
  4016ce:	xor    ecx,ebp
  4016d0:	pop    edi
  4016d1:	pop    esi
  4016d2:	pop    ebx
  4016d3:	call   0x401efd
  4016d8:	mov    esp,ebp
  4016da:	pop    ebp
  4016db:	ret
  4016dc:	call   0x401160
  4016e1:	call   0x4010c0
  4016e6:	int3
  4016e7:	int3
  4016e8:	int3
  4016e9:	int3
  4016ea:	int3
  4016eb:	int3
  4016ec:	int3
  4016ed:	int3
  4016ee:	int3
  4016ef:	int3
  4016f0:	push   ebp
  4016f1:	mov    ebp,esp
  4016f3:	push   0xffffffff
  4016f5:	push   0x402e05
  4016fa:	mov    eax,fs:0x0
  401700:	push   eax
  401701:	sub    esp,0x24
  401704:	push   ebx
  401705:	push   esi
  401706:	push   edi
  401707:	mov    eax,ds:0x405000
  40170c:	xor    eax,ebp
  40170e:	push   eax
  40170f:	lea    eax,[ebp-0xc]
  401712:	mov    fs:0x0,eax
  401718:	mov    DWORD PTR [ebp-0x10],esp
  40171b:	mov    DWORD PTR [ebp-0x28],edx
  40171e:	mov    ebx,ecx
  401720:	mov    DWORD PTR [ebp-0x20],ebx
  401723:	mov    ecx,edx
  401725:	xor    eax,eax
  401727:	mov    DWORD PTR [ebp-0x14],eax
  40172a:	mov    DWORD PTR [ebp-0x18],eax
  40172d:	lea    esi,[ecx+0x1]
  401730:	mov    al,BYTE PTR [ecx]
  401732:	inc    ecx
  401733:	test   al,al
  401735:	jne    0x401730
  401737:	mov    eax,DWORD PTR [ebx]
  401739:	sub    ecx,esi
  40173b:	mov    DWORD PTR [ebp-0x1c],ecx
  40173e:	mov    eax,DWORD PTR [eax+0x4]
  401741:	mov    edi,DWORD PTR [eax+ebx*1+0x24]
  401745:	mov    esi,DWORD PTR [eax+ebx*1+0x20]
  401749:	test   edi,edi
  40174b:	jl     0x401764
  40174d:	jg     0x40175d
  40174f:	test   esi,esi
  401751:	je     0x401764
  401753:	test   edi,edi
  401755:	jl     0x401764
  401757:	jg     0x40175d
  401759:	cmp    esi,ecx
  40175b:	jbe    0x401764
  40175d:	sub    esi,ecx
  40175f:	sbb    edi,0x0
  401762:	jmp    0x401772
  401764:	xorps  xmm0,xmm0
  401767:	movlpd QWORD PTR [ebp-0x30],xmm0
  40176c:	mov    edi,DWORD PTR [ebp-0x2c]
  40176f:	mov    esi,DWORD PTR [ebp-0x30]
  401772:	mov    ecx,DWORD PTR [eax+ebx*1+0x38]
  401776:	mov    DWORD PTR [ebp-0x30],ebx
  401779:	test   ecx,ecx
  40177b:	je     0x401782
  40177d:	mov    eax,DWORD PTR [ecx]
  40177f:	call   DWORD PTR [eax+0x4]
  401782:	mov    DWORD PTR [ebp-0x4],0x0
  401789:	mov    eax,DWORD PTR [ebx]
  40178b:	mov    ecx,DWORD PTR [eax+0x4]
  40178e:	add    ecx,ebx
  401790:	call   DWORD PTR ds:0x403054
  401796:	test   al,al
  401798:	je     0x4017c2
  40179a:	mov    eax,DWORD PTR [ebx]
  40179c:	mov    eax,DWORD PTR [eax+0x4]
  40179f:	mov    ecx,DWORD PTR [eax+ebx*1+0x3c]
  4017a3:	test   ecx,ecx
  4017a5:	je     0x4017c0
  4017a7:	cmp    ecx,ebx
  4017a9:	je     0x4017c0
  4017ab:	call   DWORD PTR ds:0x403044
  4017b1:	mov    eax,DWORD PTR [ebx]
  4017b3:	mov    ecx,DWORD PTR [eax+0x4]
  4017b6:	add    ecx,ebx
  4017b8:	call   DWORD PTR ds:0x403054
  4017be:	jmp    0x4017c2
  4017c0:	mov    al,0x1
  4017c2:	mov    BYTE PTR [ebp-0x2c],al
  4017c5:	mov    DWORD PTR [ebp-0x4],0x1
  4017cc:	test   al,al
  4017ce:	jne    0x4017da
  4017d0:	mov    ecx,0x4
  4017d5:	jmp    0x4018be
  4017da:	mov    BYTE PTR [ebp-0x4],0x2
  4017de:	mov    eax,DWORD PTR [ebx]
  4017e0:	mov    eax,DWORD PTR [eax+0x4]
  4017e3:	mov    eax,DWORD PTR [eax+ebx*1+0x14]
  4017e7:	and    eax,0x1c0
  4017ec:	cmp    eax,0x40
  4017ef:	je     0x401826
  4017f1:	test   edi,edi
  4017f3:	jl     0x401826
  4017f5:	jg     0x4017fb
  4017f7:	test   esi,esi
  4017f9:	je     0x401826
  4017fb:	mov    eax,DWORD PTR [ebx]
  4017fd:	mov    ecx,DWORD PTR [eax+0x4]
  401800:	mov    al,BYTE PTR [ecx+ebx*1+0x40]
  401804:	mov    ecx,DWORD PTR [ecx+ebx*1+0x38]
  401808:	mov    BYTE PTR [ebp-0x24],al
  40180b:	push   DWORD PTR [ebp-0x24]
  40180e:	call   DWORD PTR ds:0x403038
  401814:	cmp    eax,0xffffffff
  401817:	jne    0x40181e
  401819:	lea    ecx,[eax+0x5]
  40181c:	jmp    0x40184b
  40181e:	add    esi,0xffffffff
  401821:	adc    edi,0xffffffff
  401824:	jmp    0x4017f1
  401826:	mov    eax,DWORD PTR [ebx]
  401828:	push   0x0
  40182a:	push   DWORD PTR [ebp-0x1c]
  40182d:	mov    eax,DWORD PTR [eax+0x4]
  401830:	push   DWORD PTR [ebp-0x28]
  401833:	mov    ecx,DWORD PTR [eax+ebx*1+0x38]
  401837:	call   DWORD PTR ds:0x40303c
  40183d:	cmp    eax,DWORD PTR [ebp-0x1c]
  401840:	jne    0x401846
  401842:	test   edx,edx
  401844:	je     0x401862
  401846:	xor    ecx,ecx
  401848:	or     ecx,0x4
  40184b:	mov    eax,DWORD PTR [ebx]
  40184d:	mov    eax,DWORD PTR [eax+0x4]
  401850:	mov    DWORD PTR [eax+ebx*1+0x20],0x0
  401858:	mov    DWORD PTR [eax+ebx*1+0x24],0x0
  401860:	jmp    0x4018b7
  401862:	xor    ecx,ecx
  401864:	test   edi,edi
  401866:	jl     0x40184b
  401868:	jg     0x40186e
  40186a:	test   esi,esi
  40186c:	je     0x40184b
  40186e:	mov    eax,DWORD PTR [ebx]
  401870:	mov    ecx,DWORD PTR [eax+0x4]
  401873:	mov    al,BYTE PTR [ecx+ebx*1+0x40]
  401877:	mov    ecx,DWORD PTR [ecx+ebx*1+0x38]
  40187b:	mov    BYTE PTR [ebp-0x28],al
  40187e:	push   DWORD PTR [ebp-0x28]
  401881:	call   DWORD PTR ds:0x403038
  401887:	mov    ecx,DWORD PTR [ebp-0x14]
  40188a:	cmp    eax,0xffffffff
  40188d:	je     0x401848
  40188f:	add    esi,0xffffffff
  401892:	adc    edi,0xffffffff
  401895:	jmp    0x401864
  401897:	mov    edx,DWORD PTR [ebp-0x20]
  40189a:	push   0x1
  40189c:	push   0x4
  40189e:	mov    eax,DWORD PTR [edx]
  4018a0:	mov    ecx,DWORD PTR [eax+0x4]
  4018a3:	add    ecx,edx
  4018a5:	call   DWORD PTR ds:0x40305c
  4018ab:	mov    eax,0x4018b1
  4018b0:	ret
  4018b1:	mov    ebx,DWORD PTR [ebp-0x20]
  4018b4:	mov    ecx,DWORD PTR [ebp-0x18]
  4018b7:	mov    DWORD PTR [ebp-0x4],0x1
  4018be:	mov    eax,DWORD PTR [ebx]
  4018c0:	push   0x0
  4018c2:	push   ecx
  4018c3:	mov    ecx,DWORD PTR [eax+0x4]
  4018c6:	add    ecx,ebx
  4018c8:	call   DWORD PTR ds:0x40305c
  4018ce:	call   DWORD PTR ds:0x403074
  4018d4:	mov    esi,DWORD PTR [ebp-0x30]
  4018d7:	test   al,al
  4018d9:	jne    0x4018e3
  4018db:	mov    ecx,esi
  4018dd:	call   DWORD PTR ds:0x403060
  4018e3:	mov    DWORD PTR [ebp-0x4],0x4
  4018ea:	mov    eax,DWORD PTR [esi]
  4018ec:	mov    eax,DWORD PTR [eax+0x4]
  4018ef:	mov    ecx,DWORD PTR [eax+esi*1+0x38]
  4018f3:	test   ecx,ecx
  4018f5:	je     0x4018fc
  4018f7:	mov    eax,DWORD PTR [ecx]
  4018f9:	call   DWORD PTR [eax+0x8]
  4018fc:	mov    eax,ebx
  4018fe:	mov    ecx,DWORD PTR [ebp-0xc]
  401901:	mov    DWORD PTR fs:0x0,ecx
  401908:	pop    ecx
  401909:	pop    edi
  40190a:	pop    esi
  40190b:	pop    ebx
  40190c:	mov    esp,ebp
  40190e:	pop    ebp
  40190f:	ret
  401910:	push   ebp
  401911:	mov    ebp,esp
  401913:	push   esi
  401914:	mov    esi,DWORD PTR [ebp+0x8]
  401917:	push   0xa
  401919:	mov    eax,DWORD PTR [esi]
  40191b:	mov    ecx,DWORD PTR [eax+0x4]
  40191e:	add    ecx,esi
  401920:	call   DWORD PTR ds:0x40304c
  401926:	movzx  ecx,al
  401929:	push   ecx
  40192a:	mov    ecx,esi
  40192c:	call   DWORD PTR ds:0x403040
  401932:	mov    ecx,esi
  401934:	call   DWORD PTR ds:0x403044
  40193a:	mov    eax,esi
  40193c:	pop    esi
  40193d:	pop    ebp
  40193e:	ret
  40193f:	int3
  401940:	push   esi
  401941:	mov    esi,ecx
  401943:	mov    ecx,DWORD PTR [esi+0x14]
  401946:	cmp    ecx,0xf
  401949:	jbe    0x401972
  40194b:	mov    eax,DWORD PTR [esi]
  40194d:	inc    ecx
  40194e:	cmp    ecx,0x1000
  401954:	jb     0x401968
  401956:	mov    edx,DWORD PTR [eax-0x4]
  401959:	add    ecx,0x23
  40195c:	sub    eax,edx
  40195e:	add    eax,0xfffffffc
  401961:	cmp    eax,0x1f
  401964:	ja     0x401985
  401966:	mov    eax,edx
  401968:	push   ecx
  401969:	push   eax
  40196a:	call   0x401f3b
  40196f:	add    esp,0x8
  401972:	mov    DWORD PTR [esi+0x10],0x0
  401979:	mov    DWORD PTR [esi+0x14],0xf
  401980:	mov    BYTE PTR [esi],0x0
  401983:	pop    esi
  401984:	ret
  401985:	push   0x0
  401987:	push   0x0
  401989:	push   0x0
  40198b:	push   0x0
  40198d:	push   0x0
  40198f:	call   DWORD PTR ds:0x4030e8
  401995:	int3
  401996:	int3
  401997:	int3
  401998:	int3
  401999:	int3
  40199a:	int3
  40199b:	int3
  40199c:	int3
  40199d:	int3
  40199e:	int3
  40199f:	int3
  4019a0:	push   ebp
  4019a1:	mov    ebp,esp
  4019a3:	push   0xffffffff
  4019a5:	push   0x402e30
  4019aa:	mov    eax,fs:0x0
  4019b0:	push   eax
  4019b1:	mov    eax,ds:0x405000
  4019b6:	xor    eax,ebp
  4019b8:	push   eax
  4019b9:	lea    eax,[ebp-0xc]
  4019bc:	mov    fs:0x0,eax
  4019c2:	mov    DWORD PTR [ebp-0x4],0x0
  4019c9:	mov    ecx,DWORD PTR [ecx]
  4019cb:	mov    eax,DWORD PTR [ecx]
  4019cd:	mov    eax,DWORD PTR [eax+0x4]
  4019d0:	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  4019d4:	test   ecx,ecx
  4019d6:	je     0x4019dd
  4019d8:	mov    eax,DWORD PTR [ecx]
  4019da:	call   DWORD PTR [eax+0x8]
  4019dd:	mov    ecx,DWORD PTR [ebp-0xc]
  4019e0:	mov    DWORD PTR fs:0x0,ecx
  4019e7:	pop    ecx
  4019e8:	mov    esp,ebp
  4019ea:	pop    ebp
  4019eb:	ret
  4019ec:	int3
  4019ed:	int3
  4019ee:	int3
  4019ef:	int3
  4019f0:	int3
  4019f1:	int3
  4019f2:	int3
  4019f3:	int3
  4019f4:	int3
  4019f5:	int3
  4019f6:	int3
  4019f7:	int3
  4019f8:	int3
  4019f9:	int3
  4019fa:	int3
  4019fb:	int3
  4019fc:	int3
  4019fd:	int3
  4019fe:	int3
  4019ff:	int3
  401a00:	push   ebp
  401a01:	mov    ebp,esp
  401a03:	push   0xffffffff
  401a05:	push   0x402e65
  401a0a:	mov    eax,fs:0x0
  401a10:	push   eax
  401a11:	sub    esp,0x24
  401a14:	push   ebx
  401a15:	push   esi
  401a16:	push   edi
  401a17:	mov    eax,ds:0x405000
  401a1c:	xor    eax,ebp
  401a1e:	push   eax
  401a1f:	lea    eax,[ebp-0xc]
  401a22:	mov    fs:0x0,eax
  401a28:	mov    DWORD PTR [ebp-0x10],esp
  401a2b:	mov    esi,edx
  401a2d:	mov    edi,ecx
  401a2f:	mov    eax,DWORD PTR [edi]
  401a31:	xor    bl,bl
  401a33:	mov    DWORD PTR [ebp-0x18],edi
  401a36:	mov    DWORD PTR [ebp-0x28],0x0
  401a3d:	mov    BYTE PTR [ebp-0x11],bl
  401a40:	mov    eax,DWORD PTR [eax+0x4]
  401a43:	mov    DWORD PTR [ebp-0x30],edi
  401a46:	mov    ecx,DWORD PTR [eax+edi*1+0x38]
  401a4a:	test   ecx,ecx
  401a4c:	je     0x401a53
  401a4e:	mov    eax,DWORD PTR [ecx]
  401a50:	call   DWORD PTR [eax+0x4]
  401a53:	push   0x1
  401a55:	mov    ecx,edi
  401a57:	mov    DWORD PTR [ebp-0x4],0x0
  401a5e:	call   DWORD PTR ds:0x403064
  401a64:	mov    BYTE PTR [ebp-0x2c],al
  401a67:	mov    DWORD PTR [ebp-0x4],0x1
  401a6e:	test   al,al
  401a70:	je     0x401b63
  401a76:	mov    BYTE PTR [ebp-0x4],0x2
  401a7a:	mov    eax,esi
  401a7c:	mov    DWORD PTR [esi+0x10],0x0
  401a83:	cmp    DWORD PTR [esi+0x14],0xf
  401a87:	jbe    0x401a8b
  401a89:	mov    eax,DWORD PTR [esi]
  401a8b:	mov    BYTE PTR [eax],0x0
  401a8e:	movzx  eax,BYTE PTR [ebp+0x8]
  401a92:	mov    DWORD PTR [ebp-0x1c],eax
  401a95:	mov    eax,DWORD PTR [edi]
  401a97:	mov    ecx,DWORD PTR [eax+0x4]
  401a9a:	mov    ecx,DWORD PTR [ecx+edi*1+0x38]
  401a9e:	call   DWORD PTR ds:0x403034
  401aa4:	mov    edx,eax
  401aa6:	cmp    edx,0xffffffff
  401aa9:	jne    0x401ab3
  401aab:	lea    eax,[edx+0x2]
  401aae:	jmp    0x401b56
  401ab3:	cmp    edx,DWORD PTR [ebp-0x1c]
  401ab6:	jne    0x401ad3
  401ab8:	mov    eax,DWORD PTR [edi]
  401aba:	mov    bl,0x1
  401abc:	mov    BYTE PTR [ebp-0x11],bl
  401abf:	mov    ecx,DWORD PTR [eax+0x4]
  401ac2:	mov    ecx,DWORD PTR [ecx+edi*1+0x38]
  401ac6:	call   DWORD PTR ds:0x403078
  401acc:	xor    eax,eax
  401ace:	jmp    0x401b56
  401ad3:	mov    ecx,DWORD PTR [esi+0x10]
  401ad6:	cmp    ecx,0x7fffffff
  401adc:	jb     0x401ae5
  401ade:	mov    eax,0x2
  401ae3:	jmp    0x401b56
  401ae5:	mov    ebx,DWORD PTR [esi+0x14]
  401ae8:	mov    BYTE PTR [ebp-0x20],dl
  401aeb:	cmp    ecx,ebx
  401aed:	jae    0x401b08
  401aef:	lea    eax,[ecx+0x1]
  401af2:	mov    DWORD PTR [esi+0x10],eax
  401af5:	mov    eax,esi
  401af7:	cmp    ebx,0xf
  401afa:	jbe    0x401afe
  401afc:	mov    eax,DWORD PTR [esi]
  401afe:	mov    BYTE PTR [eax+ecx*1],dl
  401b01:	mov    BYTE PTR [eax+ecx*1+0x1],0x0
  401b06:	jmp    0x401b1a
  401b08:	push   DWORD PTR [ebp-0x20]
  401b0b:	mov    BYTE PTR [ebp-0x24],0x0
  401b0f:	push   DWORD PTR [ebp-0x24]
  401b12:	push   ecx
  401b13:	mov    ecx,esi
  401b15:	call   0x401c70
  401b1a:	mov    eax,DWORD PTR [edi]
  401b1c:	mov    bl,0x1
  401b1e:	mov    BYTE PTR [ebp-0x11],bl
  401b21:	mov    ecx,DWORD PTR [eax+0x4]
  401b24:	mov    ecx,DWORD PTR [ecx+edi*1+0x38]
  401b28:	call   DWORD PTR ds:0x403068
  401b2e:	jmp    0x401aa4
  401b33:	mov    edx,DWORD PTR [ebp-0x18]
  401b36:	push   0x1
  401b38:	push   0x4
  401b3a:	mov    eax,DWORD PTR [edx]
  401b3c:	mov    ecx,DWORD PTR [eax+0x4]
  401b3f:	add    ecx,edx
  401b41:	call   DWORD PTR ds:0x40305c
  401b47:	mov    eax,0x401b4d
  401b4c:	ret
  401b4d:	mov    eax,DWORD PTR [ebp-0x28]
  401b50:	mov    bl,BYTE PTR [ebp-0x11]
  401b53:	mov    edi,DWORD PTR [ebp-0x18]
  401b56:	mov    DWORD PTR [ebp-0x4],0x1
  401b5d:	test   bl,bl
  401b5f:	jne    0x401b68
  401b61:	jmp    0x401b65
  401b63:	xor    eax,eax
  401b65:	or     eax,0x2
  401b68:	push   0x0
  401b6a:	push   eax
  401b6b:	mov    eax,DWORD PTR [edi]
  401b6d:	mov    ecx,DWORD PTR [eax+0x4]
  401b70:	add    ecx,edi
  401b72:	call   DWORD PTR ds:0x40305c
  401b78:	mov    DWORD PTR [ebp-0x4],0x4
  401b7f:	mov    eax,DWORD PTR [ebp-0x30]
  401b82:	mov    ecx,DWORD PTR [eax]
  401b84:	mov    ecx,DWORD PTR [ecx+0x4]
  401b87:	mov    ecx,DWORD PTR [ecx+eax*1+0x38]
  401b8b:	test   ecx,ecx
  401b8d:	je     0x401b94
  401b8f:	mov    edx,DWORD PTR [ecx]
  401b91:	call   DWORD PTR [edx+0x8]
  401b94:	mov    eax,edi
  401b96:	mov    ecx,DWORD PTR [ebp-0xc]
  401b99:	mov    DWORD PTR fs:0x0,ecx
  401ba0:	pop    ecx
  401ba1:	pop    edi
  401ba2:	pop    esi
  401ba3:	pop    ebx
  401ba4:	mov    esp,ebp
  401ba6:	pop    ebp
  401ba7:	ret
  401ba8:	int3
  401ba9:	int3
  401baa:	int3
  401bab:	int3
  401bac:	int3
  401bad:	int3
  401bae:	int3
  401baf:	int3
  401bb0:	push   ebp
  401bb1:	mov    ebp,esp
  401bb3:	push   0xffffffff
  401bb5:	push   0x402e90
  401bba:	mov    eax,fs:0x0
  401bc0:	push   eax
  401bc1:	mov    eax,ds:0x405000
  401bc6:	xor    eax,ebp
  401bc8:	push   eax
  401bc9:	lea    eax,[ebp-0xc]
  401bcc:	mov    fs:0x0,eax
  401bd2:	mov    ecx,DWORD PTR [ecx]
  401bd4:	mov    eax,DWORD PTR [ecx]
  401bd6:	mov    eax,DWORD PTR [eax+0x4]
  401bd9:	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  401bdd:	test   ecx,ecx
  401bdf:	je     0x401be6
  401be1:	mov    eax,DWORD PTR [ecx]
  401be3:	call   DWORD PTR [eax+0x8]
  401be6:	mov    ecx,DWORD PTR [ebp-0xc]
  401be9:	mov    DWORD PTR fs:0x0,ecx
  401bf0:	pop    ecx
  401bf1:	mov    esp,ebp
  401bf3:	pop    ebp
  401bf4:	ret
  401bf5:	int3
  401bf6:	int3
  401bf7:	int3
  401bf8:	int3
  401bf9:	int3
  401bfa:	int3
  401bfb:	int3
  401bfc:	int3
  401bfd:	int3
  401bfe:	int3
  401bff:	int3
  401c00:	push   ebp
  401c01:	mov    ebp,esp
  401c03:	push   0xffffffff
  401c05:	push   0x402eb0
  401c0a:	mov    eax,fs:0x0
  401c10:	push   eax
  401c11:	push   esi
  401c12:	mov    eax,ds:0x405000
  401c17:	xor    eax,ebp
  401c19:	push   eax
  401c1a:	lea    eax,[ebp-0xc]
  401c1d:	mov    fs:0x0,eax
  401c23:	mov    esi,ecx
  401c25:	call   DWORD PTR ds:0x403074
  401c2b:	test   al,al
  401c2d:	jne    0x401c37
  401c2f:	mov    ecx,DWORD PTR [esi]
  401c31:	call   DWORD PTR ds:0x403060
  401c37:	mov    DWORD PTR [ebp-0x4],0x0
  401c3e:	mov    ecx,DWORD PTR [esi]
  401c40:	mov    eax,DWORD PTR [ecx]
  401c42:	mov    eax,DWORD PTR [eax+0x4]
  401c45:	mov    ecx,DWORD PTR [eax+ecx*1+0x38]
  401c49:	test   ecx,ecx
  401c4b:	je     0x401c52
  401c4d:	mov    eax,DWORD PTR [ecx]
  401c4f:	call   DWORD PTR [eax+0x8]
  401c52:	mov    ecx,DWORD PTR [ebp-0xc]
  401c55:	mov    DWORD PTR fs:0x0,ecx
  401c5c:	pop    ecx
  401c5d:	pop    esi
  401c5e:	mov    esp,ebp
  401c60:	pop    ebp
  401c61:	ret
  401c62:	int3
  401c63:	int3
  401c64:	int3
  401c65:	int3
  401c66:	int3
  401c67:	int3
  401c68:	int3
  401c69:	int3
  401c6a:	int3
  401c6b:	int3
  401c6c:	int3
  401c6d:	int3
  401c6e:	int3
  401c6f:	int3
  401c70:	push   ebp
  401c71:	mov    ebp,esp
  401c73:	sub    esp,0x8
  401c76:	push   ebx
  401c77:	mov    ebx,ecx
  401c79:	mov    edx,0x7fffffff
  401c7e:	mov    eax,edx
  401c80:	push   esi
  401c81:	mov    ecx,DWORD PTR [ebx+0x10]
  401c84:	sub    eax,ecx
  401c86:	mov    DWORD PTR [ebp-0x4],ecx
  401c89:	cmp    eax,0x1
  401c8c:	jb     0x401da3
  401c92:	mov    esi,DWORD PTR [ebx+0x14]
  401c95:	push   edi
  401c96:	lea    edi,[ecx+0x1]
  401c99:	mov    DWORD PTR [ebp-0x8],esi
  401c9c:	or     edi,0xf
  401c9f:	cmp    edi,edx
  401ca1:	jbe    0x401cc9
  401ca3:	mov    edi,edx
  401ca5:	mov    eax,0x80000000
  401caa:	add    eax,0x23
  401cad:	push   eax
  401cae:	call   0x401f0b
  401cb3:	add    esp,0x4
  401cb6:	test   eax,eax
  401cb8:	je     0x401d6e
  401cbe:	lea    esi,[eax+0x23]
  401cc1:	and    esi,0xffffffe0
  401cc4:	mov    DWORD PTR [esi-0x4],eax
  401cc7:	jmp    0x401d0c
  401cc9:	mov    eax,esi
  401ccb:	shr    eax,1
  401ccd:	sub    edx,eax
  401ccf:	cmp    esi,edx
  401cd1:	jbe    0x401cda
  401cd3:	mov    edi,0x7fffffff
  401cd8:	jmp    0x401ca5
  401cda:	add    eax,esi
  401cdc:	cmp    edi,eax
  401cde:	cmovb  edi,eax
  401ce1:	lea    edx,[edi+0x1]
  401ce4:	test   edx,edx
  401ce6:	jne    0x401cec
  401ce8:	xor    esi,esi
  401cea:	jmp    0x401d0f
  401cec:	cmp    edx,0x1000
  401cf2:	jb     0x401d01
  401cf4:	lea    eax,[edx+0x23]
  401cf7:	cmp    eax,edx
  401cf9:	jbe    0x401da8
  401cff:	jmp    0x401cad
  401d01:	push   edx
  401d02:	call   0x401f0b
  401d07:	add    esp,0x4
  401d0a:	mov    esi,eax
  401d0c:	mov    ecx,DWORD PTR [ebp-0x4]
  401d0f:	cmp    DWORD PTR [ebp-0x8],0xf
  401d13:	lea    eax,[ecx+0x1]
  401d16:	mov    DWORD PTR [ebx+0x10],eax
  401d19:	mov    DWORD PTR [ebx+0x14],edi
  401d1c:	push   ecx
  401d1d:	jbe    0x401d7e
  401d1f:	mov    edi,DWORD PTR [ebx]
  401d21:	push   edi
  401d22:	push   esi
  401d23:	call   0x402d8d
  401d28:	mov    edx,DWORD PTR [ebp-0x4]
  401d2b:	add    esp,0xc
  401d2e:	mov    ecx,DWORD PTR [ebp-0x8]
  401d31:	mov    al,BYTE PTR [ebp+0x10]
  401d34:	inc    ecx
  401d35:	mov    BYTE PTR [esi+edx*1],al
  401d38:	mov    BYTE PTR [esi+edx*1+0x1],0x0
  401d3d:	cmp    ecx,0x1000
  401d43:	jb     0x401d57
  401d45:	mov    edx,DWORD PTR [edi-0x4]
  401d48:	add    ecx,0x23
  401d4b:	sub    edi,edx
  401d4d:	lea    eax,[edi-0x4]
  401d50:	cmp    eax,0x1f
  401d53:	ja     0x401d6e
  401d55:	mov    edi,edx
  401d57:	push   ecx
  401d58:	push   edi
  401d59:	call   0x401f3b
  401d5e:	add    esp,0x8
  401d61:	mov    DWORD PTR [ebx],esi
  401d63:	mov    eax,ebx
  401d65:	pop    edi
  401d66:	pop    esi
  401d67:	pop    ebx
  401d68:	mov    esp,ebp
  401d6a:	pop    ebp
  401d6b:	ret    0xc
  401d6e:	push   0x0
  401d70:	push   0x0
  401d72:	push   0x0
  401d74:	push   0x0
  401d76:	push   0x0
  401d78:	call   DWORD PTR ds:0x4030e8
  401d7e:	push   ebx
  401d7f:	push   esi
  401d80:	call   0x402d8d
  401d85:	mov    edx,DWORD PTR [ebp-0x4]
  401d88:	add    esp,0xc
  401d8b:	mov    cl,BYTE PTR [ebp+0x10]
  401d8e:	mov    eax,ebx
  401d90:	mov    BYTE PTR [esi+edx*1],cl
  401d93:	mov    BYTE PTR [esi+edx*1+0x1],0x0
  401d98:	pop    edi
  401d99:	mov    DWORD PTR [ebx],esi
  401d9b:	pop    esi
  401d9c:	pop    ebx
  401d9d:	mov    esp,ebp
  401d9f:	pop    ebp
  401da0:	ret    0xc
  401da3:	call   0x401160
  401da8:	call   0x4010c0
  401dad:	int3
  401dae:	int3
  401daf:	int3
  401db0:	push   ebp
  401db1:	mov    ebp,esp
  401db3:	sub    esp,0xc
  401db6:	mov    edx,DWORD PTR [ebp+0x8]
  401db9:	push   ebx
  401dba:	mov    ebx,ecx
  401dbc:	mov    ecx,0x7fffffff
  401dc1:	push   esi
  401dc2:	mov    eax,ecx
  401dc4:	mov    esi,DWORD PTR [ebx+0x10]
  401dc7:	sub    eax,esi
  401dc9:	mov    DWORD PTR [ebp-0x8],esi
  401dcc:	cmp    eax,edx
  401dce:	jb     0x401ef2
  401dd4:	lea    eax,[esi+edx*1]
  401dd7:	mov    esi,DWORD PTR [ebx+0x14]
  401dda:	push   edi
  401ddb:	mov    edi,eax
  401ddd:	mov    DWORD PTR [ebp-0x4],eax
  401de0:	or     edi,0xf
  401de3:	mov    DWORD PTR [ebp-0xc],esi
  401de6:	cmp    edi,ecx
  401de8:	jbe    0x401e10
  401dea:	mov    edi,ecx
  401dec:	mov    eax,0x80000000
  401df1:	add    eax,0x23
  401df4:	push   eax
  401df5:	call   0x401f0b
  401dfa:	add    esp,0x4
  401dfd:	test   eax,eax
  401dff:	je     0x401ec3
  401e05:	lea    esi,[eax+0x23]
  401e08:	and    esi,0xffffffe0
  401e0b:	mov    DWORD PTR [esi-0x4],eax
  401e0e:	jmp    0x401e53
  401e10:	mov    eax,esi
  401e12:	shr    eax,1
  401e14:	sub    ecx,eax
  401e16:	cmp    esi,ecx
  401e18:	jbe    0x401e21
  401e1a:	mov    edi,0x7fffffff
  401e1f:	jmp    0x401dec
  401e21:	add    eax,esi
  401e23:	cmp    edi,eax
  401e25:	cmovb  edi,eax
  401e28:	lea    ecx,[edi+0x1]
  401e2b:	test   ecx,ecx
  401e2d:	jne    0x401e33
  401e2f:	xor    esi,esi
  401e31:	jmp    0x401e53
  401e33:	cmp    ecx,0x1000
  401e39:	jb     0x401e48
  401e3b:	lea    eax,[ecx+0x23]
  401e3e:	cmp    eax,ecx
  401e40:	jbe    0x401ef7
  401e46:	jmp    0x401df4
  401e48:	push   ecx
  401e49:	call   0x401f0b
  401e4e:	add    esp,0x4
  401e51:	mov    esi,eax
  401e53:	mov    eax,DWORD PTR [ebp-0x4]
  401e56:	mov    DWORD PTR [ebx+0x10],eax
  401e59:	mov    eax,DWORD PTR [ebp+0x18]
  401e5c:	mov    DWORD PTR [ebx+0x14],edi
  401e5f:	mov    edi,DWORD PTR [ebp-0x8]
  401e62:	push   eax
  401e63:	inc    edi
  401e64:	lea    ecx,[esi+eax*1]
  401e67:	cmp    DWORD PTR [ebp-0xc],0xf
  401e6b:	push   0x4031f0
  401e70:	mov    DWORD PTR [ebp-0x4],ecx
  401e73:	push   esi
  401e74:	jbe    0x401ed3
  401e76:	mov    edi,DWORD PTR [ebx]
  401e78:	call   0x402d8d
  401e7d:	mov    eax,DWORD PTR [ebp-0x8]
  401e80:	inc    eax
  401e81:	push   eax
  401e82:	push   edi
  401e83:	push   DWORD PTR [ebp-0x4]
  401e86:	call   0x402d8d
  401e8b:	mov    ecx,DWORD PTR [ebp-0xc]
  401e8e:	add    esp,0x18
  401e91:	inc    ecx
  401e92:	cmp    ecx,0x1000
  401e98:	jb     0x401eac
  401e9a:	mov    edx,DWORD PTR [edi-0x4]
  401e9d:	add    ecx,0x23
  401ea0:	sub    edi,edx
  401ea2:	lea    eax,[edi-0x4]
  401ea5:	cmp    eax,0x1f
  401ea8:	ja     0x401ec3
  401eaa:	mov    edi,edx
  401eac:	push   ecx
  401ead:	push   edi
  401eae:	call   0x401f3b
  401eb3:	add    esp,0x8
  401eb6:	mov    DWORD PTR [ebx],esi
  401eb8:	mov    eax,ebx
  401eba:	pop    edi
  401ebb:	pop    esi
  401ebc:	pop    ebx
  401ebd:	mov    esp,ebp
  401ebf:	pop    ebp
  401ec0:	ret    0x14
  401ec3:	push   0x0
  401ec5:	push   0x0
  401ec7:	push   0x0
  401ec9:	push   0x0
  401ecb:	push   0x0
  401ecd:	call   DWORD PTR ds:0x4030e8
  401ed3:	call   0x402d8d
  401ed8:	push   edi
  401ed9:	push   ebx
  401eda:	push   DWORD PTR [ebp-0x4]
  401edd:	call   0x402d8d
  401ee2:	add    esp,0x18
  401ee5:	mov    DWORD PTR [ebx],esi
  401ee7:	mov    eax,ebx
  401ee9:	pop    edi
  401eea:	pop    esi
  401eeb:	pop    ebx
  401eec:	mov    esp,ebp
  401eee:	pop    ebp
  401eef:	ret    0x14
  401ef2:	call   0x401160
  401ef7:	call   0x4010c0
  401efc:	int3
  401efd:	cmp    ecx,DWORD PTR ds:0x405000
  401f03:	jne    0x401f06
  401f05:	ret
  401f06:	jmp    0x4021e8
  401f0b:	push   ebp
  401f0c:	mov    ebp,esp
  401f0e:	jmp    0x401f1d
  401f10:	push   DWORD PTR [ebp+0x8]
  401f13:	call   0x402c74
  401f18:	pop    ecx
  401f19:	test   eax,eax
  401f1b:	je     0x401f2c
  401f1d:	push   DWORD PTR [ebp+0x8]
  401f20:	call   0x402c7a
  401f25:	pop    ecx
  401f26:	test   eax,eax
  401f28:	je     0x401f10
  401f2a:	pop    ebp
  401f2b:	ret
  401f2c:	cmp    DWORD PTR [ebp+0x8],0xffffffff
  401f30:	je     0x4010c0
  401f36:	jmp    0x402301
  401f3b:	push   ebp
  401f3c:	mov    ebp,esp
  401f3e:	push   DWORD PTR [ebp+0x8]
  401f41:	call   0x40231e
  401f46:	pop    ecx
  401f47:	pop    ebp
  401f48:	ret
  401f49:	push   ebp
  401f4a:	mov    ebp,esp
  401f4c:	test   BYTE PTR [ebp+0x8],0x1
  401f50:	push   esi
  401f51:	mov    esi,ecx
  401f53:	mov    DWORD PTR [esi],0x403174
  401f59:	je     0x401f65
  401f5b:	push   0xc
  401f5d:	push   esi
  401f5e:	call   0x401f3b
  401f63:	pop    ecx
  401f64:	pop    ecx
  401f65:	mov    eax,esi
  401f67:	pop    esi
  401f68:	pop    ebp
  401f69:	ret    0x4
  401f6c:	push   esi
  401f6d:	push   0x1
  401f6f:	call   0x402c86
  401f74:	call   0x402615
  401f79:	push   eax
  401f7a:	call   0x402cbc
  401f7f:	call   0x40260e
  401f84:	mov    esi,eax
  401f86:	call   0x402cec
  401f8b:	push   0x1
  401f8d:	mov    DWORD PTR [eax],esi
  401f8f:	call   0x4023d0
  401f94:	add    esp,0xc
  401f97:	pop    esi
  401f98:	test   al,al
  401f9a:	je     0x40200f
  401f9c:	fnclex
  401f9e:	call   0x402858
  401fa3:	push   0x402884
  401fa8:	call   0x402561
  401fad:	call   0x402611
  401fb2:	push   eax
  401fb3:	call   0x402c92
  401fb8:	pop    ecx
  401fb9:	pop    ecx
  401fba:	test   eax,eax
  401fbc:	jne    0x40200f
  401fbe:	call   0x40261b
  401fc3:	call   0x402677
  401fc8:	test   eax,eax
  401fca:	je     0x401fd7
  401fcc:	push   0x40260e
  401fd1:	call   0x402c8c
  401fd6:	pop    ecx
  401fd7:	call   0x40264b
  401fdc:	call   0x40264b
  401fe1:	call   0x40262a
  401fe6:	call   0x40260e
  401feb:	push   eax
  401fec:	call   0x402ce0
  401ff1:	pop    ecx
  401ff2:	call   0x402627
  401ff7:	test   al,al
  401ff9:	je     0x402000
  401ffb:	call   0x402c98
  402000:	call   0x40260e
  402005:	call   0x4027a4
  40200a:	test   eax,eax
  40200c:	jne    0x40200f
  40200e:	ret
  40200f:	push   0x7
  402011:	call   0x40268f
  402016:	int3
  402017:	call   0x40265a
  40201c:	xor    eax,eax
  40201e:	ret
  40201f:	call   0x4027eb
  402024:	call   0x40260e
  402029:	push   eax
  40202a:	call   0x402ce6
  40202f:	pop    ecx
  402030:	ret
  402031:	push   0x14
  402033:	push   0x403a18
  402038:	call   0x4028b0
  40203d:	push   0x1
  40203f:	call   0x402397
  402044:	pop    ecx
  402045:	test   al,al
  402047:	je     0x4021a0
  40204d:	xor    bl,bl
  40204f:	mov    BYTE PTR [ebp-0x19],bl
  402052:	mov    DWORD PTR [ebp-0x4],0x0
  402059:	call   0x402365
  40205e:	mov    BYTE PTR [ebp-0x24],al
  402061:	mov    eax,ds:0x4053f4
  402066:	xor    ecx,ecx
  402068:	inc    ecx
  402069:	cmp    eax,ecx
  40206b:	je     0x4021a0
  402071:	test   eax,eax
  402073:	jne    0x4020be
  402075:	mov    DWORD PTR ds:0x4053f4,ecx
  40207b:	push   0x40315c
  402080:	push   0x403150
  402085:	call   0x402caa
  40208a:	pop    ecx
  40208b:	pop    ecx
  40208c:	test   eax,eax
  40208e:	je     0x4020a1
  402090:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402097:	mov    eax,0xff
  40209c:	jmp    0x402190
  4020a1:	push   0x40314c
  4020a6:	push   0x403144
  4020ab:	call   0x402ca4
  4020b0:	pop    ecx
  4020b1:	pop    ecx
  4020b2:	mov    DWORD PTR ds:0x4053f4,0x2
  4020bc:	jmp    0x4020c3
  4020be:	mov    bl,cl
  4020c0:	mov    BYTE PTR [ebp-0x19],bl
  4020c3:	push   DWORD PTR [ebp-0x24]
  4020c6:	call   0x4024ee
  4020cb:	pop    ecx
  4020cc:	call   0x402683
  4020d1:	mov    esi,eax
  4020d3:	xor    edi,edi
  4020d5:	cmp    DWORD PTR [esi],edi
  4020d7:	je     0x4020f4
  4020d9:	push   esi
  4020da:	call   0x402457
  4020df:	pop    ecx
  4020e0:	test   al,al
  4020e2:	je     0x4020f4
  4020e4:	mov    esi,DWORD PTR [esi]
  4020e6:	push   edi
  4020e7:	push   0x2
  4020e9:	push   edi
  4020ea:	mov    ecx,esi
  4020ec:	call   DWORD PTR ds:0x40313c
  4020f2:	call   esi
  4020f4:	call   0x402689
  4020f9:	mov    esi,eax
  4020fb:	cmp    DWORD PTR [esi],edi
  4020fd:	je     0x402112
  4020ff:	push   esi
  402100:	call   0x402457
  402105:	pop    ecx
  402106:	test   al,al
  402108:	je     0x402112
  40210a:	push   DWORD PTR [esi]
  40210c:	call   0x402cda
  402111:	pop    ecx
  402112:	call   0x402c9e
  402117:	mov    edi,eax
  402119:	call   0x402cc8
  40211e:	mov    esi,DWORD PTR [eax]
  402120:	call   0x402cc2
  402125:	push   edi
  402126:	push   esi
  402127:	push   DWORD PTR [eax]
  402129:	call   0x401510
  40212e:	add    esp,0xc
  402131:	mov    esi,eax
  402133:	call   0x4027a9
  402138:	test   al,al
  40213a:	je     0x4021a7
  40213c:	test   bl,bl
  40213e:	jne    0x402145
  402140:	call   0x402cce
  402145:	push   0x0
  402147:	push   0x1
  402149:	call   0x40250b
  40214e:	pop    ecx
  40214f:	pop    ecx
  402150:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402157:	mov    eax,esi
  402159:	jmp    0x402190
  40215b:	mov    ecx,DWORD PTR [ebp-0x14]
  40215e:	mov    eax,DWORD PTR [ecx]
  402160:	mov    eax,DWORD PTR [eax]
  402162:	mov    DWORD PTR [ebp-0x20],eax
  402165:	push   ecx
  402166:	push   eax
  402167:	call   0x402c80
  40216c:	pop    ecx
  40216d:	pop    ecx
  40216e:	ret
  40216f:	mov    esp,DWORD PTR [ebp-0x18]
  402172:	call   0x4027a9
  402177:	test   al,al
  402179:	je     0x4021ad
  40217b:	cmp    BYTE PTR [ebp-0x19],0x0
  40217f:	jne    0x402186
  402181:	call   0x402cd4
  402186:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  40218d:	mov    eax,DWORD PTR [ebp-0x20]
  402190:	mov    ecx,DWORD PTR [ebp-0x10]
  402193:	mov    DWORD PTR fs:0x0,ecx
  40219a:	pop    ecx
  40219b:	pop    edi
  40219c:	pop    esi
  40219d:	pop    ebx
  40219e:	leave
  40219f:	ret
  4021a0:	push   0x7
  4021a2:	call   0x40268f
  4021a7:	push   esi
  4021a8:	call   0x402cb0
  4021ad:	push   DWORD PTR [ebp-0x20]
  4021b0:	call   0x402cb6
  4021b5:	int3
  4021b6:	call   0x4025c3
  4021bb:	jmp    0x402031
  4021c0:	push   ebp
  4021c1:	mov    ebp,esp
  4021c3:	push   0x0
  4021c5:	call   DWORD PTR ds:0x403028
  4021cb:	push   DWORD PTR [ebp+0x8]
  4021ce:	call   DWORD PTR ds:0x403000
  4021d4:	push   0xc0000409
  4021d9:	call   DWORD PTR ds:0x403024
  4021df:	push   eax
  4021e0:	call   DWORD PTR ds:0x403020
  4021e6:	pop    ebp
  4021e7:	ret
  4021e8:	push   ebp
  4021e9:	mov    ebp,esp
  4021eb:	sub    esp,0x324
  4021f1:	push   0x17
  4021f3:	call   DWORD PTR ds:0x40301c
  4021f9:	test   eax,eax
  4021fb:	je     0x402202
  4021fd:	push   0x2
  4021ff:	pop    ecx
  402200:	int    0x29
  402202:	mov    ds:0x4051d8,eax
  402207:	mov    DWORD PTR ds:0x4051d4,ecx
  40220d:	mov    DWORD PTR ds:0x4051d0,edx
  402213:	mov    DWORD PTR ds:0x4051cc,ebx
  402219:	mov    DWORD PTR ds:0x4051c8,esi
  40221f:	mov    DWORD PTR ds:0x4051c4,edi
  402225:	data16 mov WORD PTR ds:0x4051f0,ss
  40222c:	data16 mov WORD PTR ds:0x4051e4,cs
  402233:	data16 mov WORD PTR ds:0x4051c0,ds
  40223a:	data16 mov WORD PTR ds:0x4051bc,es
  402241:	data16 mov WORD PTR ds:0x4051b8,fs
  402248:	data16 mov WORD PTR ds:0x4051b4,gs
  40224f:	pushf
  402250:	pop    DWORD PTR ds:0x4051e8
  402256:	mov    eax,DWORD PTR [ebp+0x0]
  402259:	mov    ds:0x4051dc,eax
  40225e:	mov    eax,DWORD PTR [ebp+0x4]
  402261:	mov    ds:0x4051e0,eax
  402266:	lea    eax,[ebp+0x8]
  402269:	mov    ds:0x4051ec,eax
  40226e:	mov    eax,DWORD PTR [ebp-0x324]
  402274:	mov    DWORD PTR ds:0x405128,0x10001
  40227e:	mov    eax,ds:0x4051e0
  402283:	mov    ds:0x4050e4,eax
  402288:	mov    DWORD PTR ds:0x4050d8,0xc0000409
  402292:	mov    DWORD PTR ds:0x4050dc,0x1
  40229c:	mov    DWORD PTR ds:0x4050e8,0x1
  4022a6:	push   0x4
  4022a8:	pop    eax
  4022a9:	imul   eax,eax,0x0
  4022ac:	mov    DWORD PTR [eax+0x4050ec],0x2
  4022b6:	push   0x4
  4022b8:	pop    eax
  4022b9:	imul   eax,eax,0x0
  4022bc:	mov    ecx,DWORD PTR ds:0x405000
  4022c2:	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  4022c6:	push   0x4
  4022c8:	pop    eax
  4022c9:	shl    eax,0x0
  4022cc:	mov    ecx,DWORD PTR ds:0x405040
  4022d2:	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  4022d6:	push   0x403178
  4022db:	call   0x4021c0
  4022e0:	nop
  4022e1:	leave
  4022e2:	ret
  4022e3:	mov    DWORD PTR [ecx+0x4],0x0
  4022ea:	mov    eax,ecx
  4022ec:	mov    DWORD PTR [ecx+0x8],0x0
  4022f3:	mov    DWORD PTR [ecx+0x4],0x403198
  4022fa:	mov    DWORD PTR [ecx],0x403190
  402300:	ret
  402301:	push   ebp
  402302:	mov    ebp,esp
  402304:	sub    esp,0xc
  402307:	lea    ecx,[ebp-0xc]
  40230a:	call   0x4022e3
  40230f:	push   0x403a34
  402314:	lea    eax,[ebp-0xc]
  402317:	push   eax
  402318:	call   0x402c56
  40231d:	int3
  40231e:	jmp    0x402cf2
  402323:	push   ebp
  402324:	mov    ebp,esp
  402326:	mov    eax,DWORD PTR [ebp+0x8]
  402329:	push   esi
  40232a:	mov    ecx,DWORD PTR [eax+0x3c]
  40232d:	add    ecx,eax
  40232f:	movzx  eax,WORD PTR [ecx+0x14]
  402333:	lea    edx,[ecx+0x18]
  402336:	add    edx,eax
  402338:	movzx  eax,WORD PTR [ecx+0x6]
  40233c:	imul   esi,eax,0x28
  40233f:	add    esi,edx
  402341:	jmp    0x402358
  402343:	mov    ecx,DWORD PTR [edx+0xc]
  402346:	cmp    DWORD PTR [ebp+0xc],ecx
  402349:	jb     0x402355
  40234b:	mov    eax,DWORD PTR [edx+0x8]
  40234e:	add    eax,ecx
  402350:	cmp    DWORD PTR [ebp+0xc],eax
  402353:	jb     0x402361
  402355:	add    edx,0x28
  402358:	cmp    edx,esi
  40235a:	jne    0x402343
  40235c:	xor    eax,eax
  40235e:	pop    esi
  40235f:	pop    ebp
  402360:	ret
  402361:	mov    eax,edx
  402363:	jmp    0x40235e
  402365:	push   esi
  402366:	call   0x402c3e
  40236b:	test   eax,eax
  40236d:	je     0x40238f
  40236f:	mov    eax,fs:0x18
  402375:	mov    esi,0x4053f8
  40237a:	mov    edx,DWORD PTR [eax+0x4]
  40237d:	jmp    0x402383
  40237f:	cmp    edx,eax
  402381:	je     0x402393
  402383:	xor    eax,eax
  402385:	mov    ecx,edx
  402387:	lock cmpxchg DWORD PTR [esi],ecx
  40238b:	test   eax,eax
  40238d:	jne    0x40237f
  40238f:	xor    al,al
  402391:	pop    esi
  402392:	ret
  402393:	mov    al,0x1
  402395:	pop    esi
  402396:	ret
  402397:	push   ebp
  402398:	mov    ebp,esp
  40239a:	cmp    DWORD PTR [ebp+0x8],0x0
  40239e:	jne    0x4023a7
  4023a0:	mov    BYTE PTR ds:0x4053fc,0x1
  4023a7:	call   0x402924
  4023ac:	call   0x402627
  4023b1:	test   al,al
  4023b3:	jne    0x4023b9
  4023b5:	xor    al,al
  4023b7:	pop    ebp
  4023b8:	ret
  4023b9:	call   0x402627
  4023be:	test   al,al
  4023c0:	jne    0x4023cc
  4023c2:	push   0x0
  4023c4:	call   0x402627
  4023c9:	pop    ecx
  4023ca:	jmp    0x4023b5
  4023cc:	mov    al,0x1
  4023ce:	pop    ebp
  4023cf:	ret
  4023d0:	push   ebp
  4023d1:	mov    ebp,esp
  4023d3:	cmp    BYTE PTR ds:0x4053fd,0x0
  4023da:	je     0x4023e0
  4023dc:	mov    al,0x1
  4023de:	pop    ebp
  4023df:	ret
  4023e0:	push   esi
  4023e1:	mov    esi,DWORD PTR [ebp+0x8]
  4023e4:	test   esi,esi
  4023e6:	je     0x4023ed
  4023e8:	cmp    esi,0x1
  4023eb:	jne    0x40244f
  4023ed:	call   0x402c3e
  4023f2:	test   eax,eax
  4023f4:	je     0x40241c
  4023f6:	test   esi,esi
  4023f8:	jne    0x40241c
  4023fa:	push   0x405400
  4023ff:	call   0x402cf8
  402404:	pop    ecx
  402405:	test   eax,eax
  402407:	jne    0x402418
  402409:	push   0x40540c
  40240e:	call   0x402cf8
  402413:	pop    ecx
  402414:	test   eax,eax
  402416:	je     0x402443
  402418:	xor    al,al
  40241a:	jmp    0x40244c
  40241c:	or     ecx,0xffffffff
  40241f:	mov    DWORD PTR ds:0x405400,ecx
  402425:	mov    DWORD PTR ds:0x405404,ecx
  40242b:	mov    DWORD PTR ds:0x405408,ecx
  402431:	mov    DWORD PTR ds:0x40540c,ecx
  402437:	mov    DWORD PTR ds:0x405410,ecx
  40243d:	mov    DWORD PTR ds:0x405414,ecx
  402443:	mov    BYTE PTR ds:0x4053fd,0x1
  40244a:	mov    al,0x1
  40244c:	pop    esi
  40244d:	pop    ebp
  40244e:	ret
  40244f:	push   0x5
  402451:	call   0x40268f
  402456:	int3
  402457:	push   0x8
  402459:	push   0x403a50
  40245e:	call   0x4028b0
  402463:	mov    DWORD PTR [ebp-0x4],0x0
  40246a:	mov    eax,0x5a4d
  40246f:	cmp    WORD PTR ds:0x400000,ax
  402476:	jne    0x4024d5
  402478:	mov    eax,ds:0x40003c
  40247d:	cmp    DWORD PTR [eax+0x400000],0x4550
  402487:	jne    0x4024d5
  402489:	mov    ecx,0x10b
  40248e:	cmp    WORD PTR [eax+0x400018],cx
  402495:	jne    0x4024d5
  402497:	mov    eax,DWORD PTR [ebp+0x8]
  40249a:	mov    ecx,0x400000
  40249f:	sub    eax,ecx
  4024a1:	push   eax
  4024a2:	push   ecx
  4024a3:	call   0x402323
  4024a8:	pop    ecx
  4024a9:	pop    ecx
  4024aa:	test   eax,eax
  4024ac:	je     0x4024d5
  4024ae:	cmp    DWORD PTR [eax+0x24],0x0
  4024b2:	jl     0x4024d5
  4024b4:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4024bb:	mov    al,0x1
  4024bd:	jmp    0x4024de
  4024bf:	mov    eax,DWORD PTR [ebp-0x14]
  4024c2:	mov    eax,DWORD PTR [eax]
  4024c4:	xor    ecx,ecx
  4024c6:	cmp    DWORD PTR [eax],0xc0000005
  4024cc:	sete   cl
  4024cf:	mov    eax,ecx
  4024d1:	ret
  4024d2:	mov    esp,DWORD PTR [ebp-0x18]
  4024d5:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4024dc:	xor    al,al
  4024de:	mov    ecx,DWORD PTR [ebp-0x10]
  4024e1:	mov    DWORD PTR fs:0x0,ecx
  4024e8:	pop    ecx
  4024e9:	pop    edi
  4024ea:	pop    esi
  4024eb:	pop    ebx
  4024ec:	leave
  4024ed:	ret
  4024ee:	push   ebp
  4024ef:	mov    ebp,esp
  4024f1:	call   0x402c3e
  4024f6:	test   eax,eax
  4024f8:	je     0x402509
  4024fa:	cmp    BYTE PTR [ebp+0x8],0x0
  4024fe:	jne    0x402509
  402500:	xor    eax,eax
  402502:	mov    ecx,0x4053f8
  402507:	xchg   DWORD PTR [ecx],eax
  402509:	pop    ebp
  40250a:	ret
  40250b:	push   ebp
  40250c:	mov    ebp,esp
  40250e:	cmp    BYTE PTR ds:0x4053fc,0x0
  402515:	je     0x40251d
  402517:	cmp    BYTE PTR [ebp+0xc],0x0
  40251b:	jne    0x40252f
  40251d:	push   DWORD PTR [ebp+0x8]
  402520:	call   0x402627
  402525:	push   DWORD PTR [ebp+0x8]
  402528:	call   0x402627
  40252d:	pop    ecx
  40252e:	pop    ecx
  40252f:	mov    al,0x1
  402531:	pop    ebp
  402532:	ret
  402533:	push   ebp
  402534:	mov    ebp,esp
  402536:	cmp    DWORD PTR ds:0x405400,0xffffffff
  40253d:	push   DWORD PTR [ebp+0x8]
  402540:	jne    0x402549
  402542:	call   0x402d04
  402547:	jmp    0x402554
  402549:	push   0x405400
  40254e:	call   0x402cfe
  402553:	pop    ecx
  402554:	pop    ecx
  402555:	xor    ecx,ecx
  402557:	test   eax,eax
  402559:	cmove  ecx,DWORD PTR [ebp+0x8]
  40255d:	mov    eax,ecx
  40255f:	pop    ebp
  402560:	ret
  402561:	push   ebp
  402562:	mov    ebp,esp
  402564:	push   DWORD PTR [ebp+0x8]
  402567:	call   0x402533
  40256c:	neg    eax
  40256e:	pop    ecx
  40256f:	sbb    eax,eax
  402571:	neg    eax
  402573:	dec    eax
  402574:	pop    ebp
  402575:	ret
  402576:	push   ebp
  402577:	mov    ebp,esp
  402579:	sub    esp,0x14
  40257c:	lea    eax,[ebp-0xc]
  40257f:	xorps  xmm0,xmm0
  402582:	push   eax
  402583:	movlpd QWORD PTR [ebp-0xc],xmm0
  402588:	call   DWORD PTR ds:0x40300c
  40258e:	mov    eax,DWORD PTR [ebp-0x8]
  402591:	xor    eax,DWORD PTR [ebp-0xc]
  402594:	mov    DWORD PTR [ebp-0x4],eax
  402597:	call   DWORD PTR ds:0x403010
  40259d:	xor    DWORD PTR [ebp-0x4],eax
  4025a0:	call   DWORD PTR ds:0x403014
  4025a6:	xor    DWORD PTR [ebp-0x4],eax
  4025a9:	lea    eax,[ebp-0x14]
  4025ac:	push   eax
  4025ad:	call   DWORD PTR ds:0x403018
  4025b3:	mov    eax,DWORD PTR [ebp-0x10]
  4025b6:	lea    ecx,[ebp-0x4]
  4025b9:	xor    eax,DWORD PTR [ebp-0x14]
  4025bc:	xor    eax,DWORD PTR [ebp-0x4]
  4025bf:	xor    eax,ecx
  4025c1:	leave
  4025c2:	ret
  4025c3:	mov    ecx,DWORD PTR ds:0x405000
  4025c9:	push   esi
  4025ca:	push   edi
  4025cb:	mov    edi,0xbb40e64e
  4025d0:	mov    esi,0xffff0000
  4025d5:	cmp    ecx,edi
  4025d7:	je     0x4025dd
  4025d9:	test   esi,ecx
  4025db:	jne    0x402603
  4025dd:	call   0x402576
  4025e2:	mov    ecx,eax
  4025e4:	cmp    ecx,edi
  4025e6:	jne    0x4025ef
  4025e8:	mov    ecx,0xbb40e64f
  4025ed:	jmp    0x4025fd
  4025ef:	test   esi,ecx
  4025f1:	jne    0x4025fd
  4025f3:	or     eax,0x4711
  4025f8:	shl    eax,0x10
  4025fb:	or     ecx,eax
  4025fd:	mov    DWORD PTR ds:0x405000,ecx
  402603:	not    ecx
  402605:	pop    edi
  402606:	mov    DWORD PTR ds:0x405040,ecx
  40260c:	pop    esi
  40260d:	ret
  40260e:	xor    eax,eax
  402610:	ret
  402611:	xor    eax,eax
  402613:	inc    eax
  402614:	ret
  402615:	mov    eax,0x4000
  40261a:	ret
  40261b:	push   0x405418
  402620:	call   DWORD PTR ds:0x403008
  402626:	ret
  402627:	mov    al,0x1
  402629:	ret
  40262a:	push   0x30000
  40262f:	push   0x10000
  402634:	push   0x0
  402636:	call   0x402d0a
  40263b:	add    esp,0xc
  40263e:	test   eax,eax
  402640:	jne    0x402643
  402642:	ret
  402643:	push   0x7
  402645:	call   0x40268f
  40264a:	int3
  40264b:	ret    0x0
  40264e:	mov    eax,0x405420
  402653:	ret
  402654:	mov    eax,0x405428
  402659:	ret
  40265a:	call   0x40264e
  40265f:	mov    ecx,DWORD PTR [eax+0x4]
  402662:	or     DWORD PTR [eax],0x24
  402665:	mov    DWORD PTR [eax+0x4],ecx
  402668:	call   0x402654
  40266d:	mov    ecx,DWORD PTR [eax+0x4]
  402670:	or     DWORD PTR [eax],0x2
  402673:	mov    DWORD PTR [eax+0x4],ecx
  402676:	ret
  402677:	xor    eax,eax
  402679:	cmp    DWORD PTR ds:0x405048,eax
  40267f:	sete   al
  402682:	ret
  402683:	mov    eax,0x405444
  402688:	ret
  402689:	mov    eax,0x405440
  40268e:	ret
  40268f:	push   ebp
  402690:	mov    ebp,esp
  402692:	sub    esp,0x324
  402698:	push   esi
  402699:	push   0x17
  40269b:	call   DWORD PTR ds:0x40301c
  4026a1:	test   eax,eax
  4026a3:	je     0x4026aa
  4026a5:	mov    ecx,DWORD PTR [ebp+0x8]
  4026a8:	int    0x29
  4026aa:	push   0x3
  4026ac:	call   0x40284d
  4026b1:	mov    DWORD PTR [esp],0x2cc
  4026b8:	lea    eax,[ebp-0x324]
  4026be:	push   0x0
  4026c0:	push   eax
  4026c1:	call   0x402c68
  4026c6:	add    esp,0xc
  4026c9:	mov    DWORD PTR [ebp-0x274],eax
  4026cf:	mov    DWORD PTR [ebp-0x278],ecx
  4026d5:	mov    DWORD PTR [ebp-0x27c],edx
  4026db:	mov    DWORD PTR [ebp-0x280],ebx
  4026e1:	mov    DWORD PTR [ebp-0x284],esi
  4026e7:	mov    DWORD PTR [ebp-0x288],edi
  4026ed:	data16 mov WORD PTR [ebp-0x25c],ss
  4026f4:	data16 mov WORD PTR [ebp-0x268],cs
  4026fb:	data16 mov WORD PTR [ebp-0x28c],ds
  402702:	data16 mov WORD PTR [ebp-0x290],es
  402709:	data16 mov WORD PTR [ebp-0x294],fs
  402710:	data16 mov WORD PTR [ebp-0x298],gs
  402717:	pushf
  402718:	pop    DWORD PTR [ebp-0x264]
  40271e:	mov    eax,DWORD PTR [ebp+0x4]
  402721:	mov    DWORD PTR [ebp-0x26c],eax
  402727:	lea    eax,[ebp+0x4]
  40272a:	mov    DWORD PTR [ebp-0x260],eax
  402730:	mov    DWORD PTR [ebp-0x324],0x10001
  40273a:	mov    eax,DWORD PTR [eax-0x4]
  40273d:	push   0x50
  40273f:	mov    DWORD PTR [ebp-0x270],eax
  402745:	lea    eax,[ebp-0x58]
  402748:	push   0x0
  40274a:	push   eax
  40274b:	call   0x402c68
  402750:	mov    eax,DWORD PTR [ebp+0x4]
  402753:	add    esp,0xc
  402756:	mov    DWORD PTR [ebp-0x58],0x40000015
  40275d:	mov    DWORD PTR [ebp-0x54],0x1
  402764:	mov    DWORD PTR [ebp-0x4c],eax
  402767:	call   DWORD PTR ds:0x403004
  40276d:	mov    esi,eax
  40276f:	lea    eax,[ebp-0x58]
  402772:	mov    DWORD PTR [ebp-0x8],eax
  402775:	lea    eax,[ebp-0x324]
  40277b:	push   0x0
  40277d:	mov    DWORD PTR [ebp-0x4],eax
  402780:	call   DWORD PTR ds:0x403028
  402786:	lea    eax,[ebp-0x8]
  402789:	push   eax
  40278a:	call   DWORD PTR ds:0x403000
  402790:	test   eax,eax
  402792:	jne    0x4027a1
  402794:	cmp    esi,0x1
  402797:	je     0x4027a1
  402799:	push   0x3
  40279b:	call   0x40284d
  4027a0:	pop    ecx
  4027a1:	pop    esi
  4027a2:	leave
  4027a3:	ret
  4027a4:	jmp    0x40260e
  4027a9:	push   0x0
  4027ab:	call   DWORD PTR ds:0x40302c
  4027b1:	test   eax,eax
  4027b3:	je     0x4027e8
  4027b5:	mov    ecx,0x5a4d
  4027ba:	cmp    WORD PTR [eax],cx
  4027bd:	jne    0x4027e8
  4027bf:	mov    ecx,DWORD PTR [eax+0x3c]
  4027c2:	add    ecx,eax
  4027c4:	cmp    DWORD PTR [ecx],0x4550
  4027ca:	jne    0x4027e8
  4027cc:	mov    eax,0x10b
  4027d1:	cmp    WORD PTR [ecx+0x18],ax
  4027d5:	jne    0x4027e8
  4027d7:	cmp    DWORD PTR [ecx+0x74],0xe
  4027db:	jbe    0x4027e8
  4027dd:	cmp    DWORD PTR [ecx+0xe8],0x0
  4027e4:	setne  al
  4027e7:	ret
  4027e8:	xor    al,al
  4027ea:	ret
  4027eb:	push   0x4027f7
  4027f0:	call   DWORD PTR ds:0x403028
  4027f6:	ret
  4027f7:	push   ebp
  4027f8:	mov    ebp,esp
  4027fa:	push   esi
  4027fb:	push   edi
  4027fc:	mov    edi,DWORD PTR [ebp+0x8]
  4027ff:	mov    esi,DWORD PTR [edi]
  402801:	cmp    DWORD PTR [esi],0xe06d7363
  402807:	jne    0x40282e
  402809:	cmp    DWORD PTR [esi+0x10],0x3
  40280d:	jne    0x40282e
  40280f:	mov    eax,DWORD PTR [esi+0x14]
  402812:	cmp    eax,0x19930520
  402817:	je     0x402836
  402819:	cmp    eax,0x19930521
  40281e:	je     0x402836
  402820:	cmp    eax,0x19930522
  402825:	je     0x402836
  402827:	cmp    eax,0x1994000
  40282c:	je     0x402836
  40282e:	pop    edi
  40282f:	xor    eax,eax
  402831:	pop    esi
  402832:	pop    ebp
  402833:	ret    0x4
  402836:	call   0x402c5c
  40283b:	mov    DWORD PTR [eax],esi
  40283d:	mov    esi,DWORD PTR [edi+0x4]
  402840:	call   0x402c62
  402845:	mov    DWORD PTR [eax],esi
  402847:	call   0x402d10
  40284c:	int3
  40284d:	mov    DWORD PTR ds:0x405430,0x0
  402857:	ret
  402858:	push   ebx
  402859:	push   esi
  40285a:	mov    esi,0x403894
  40285f:	mov    ebx,0x403894
  402864:	cmp    esi,ebx
  402866:	jae    0x402881
  402868:	push   edi
  402869:	mov    edi,DWORD PTR [esi]
  40286b:	test   edi,edi
  40286d:	je     0x402879
  40286f:	mov    ecx,edi
  402871:	call   DWORD PTR ds:0x40313c
  402877:	call   edi
  402879:	add    esi,0x4
  40287c:	cmp    esi,ebx
  40287e:	jb     0x402869
  402880:	pop    edi
  402881:	pop    esi
  402882:	pop    ebx
  402883:	ret
  402884:	push   ebx
  402885:	push   esi
  402886:	mov    esi,0x40389c
  40288b:	mov    ebx,0x40389c
  402890:	cmp    esi,ebx
  402892:	jae    0x4028ad
  402894:	push   edi
  402895:	mov    edi,DWORD PTR [esi]
  402897:	test   edi,edi
  402899:	je     0x4028a5
  40289b:	mov    ecx,edi
  40289d:	call   DWORD PTR ds:0x40313c
  4028a3:	call   edi
  4028a5:	add    esi,0x4
  4028a8:	cmp    esi,ebx
  4028aa:	jb     0x402895
  4028ac:	pop    edi
  4028ad:	pop    esi
  4028ae:	pop    ebx
  4028af:	ret
  4028b0:	push   0x4028f5
  4028b5:	push   DWORD PTR fs:0x0
  4028bc:	mov    eax,DWORD PTR [esp+0x10]
  4028c0:	mov    DWORD PTR [esp+0x10],ebp
  4028c4:	lea    ebp,[esp+0x10]
  4028c8:	sub    esp,eax
  4028ca:	push   ebx
  4028cb:	push   esi
  4028cc:	push   edi
  4028cd:	mov    eax,ds:0x405000
  4028d2:	xor    DWORD PTR [ebp-0x4],eax
  4028d5:	xor    eax,ebp
  4028d7:	push   eax
  4028d8:	mov    DWORD PTR [ebp-0x18],esp
  4028db:	push   DWORD PTR [ebp-0x8]
  4028de:	mov    eax,DWORD PTR [ebp-0x4]
  4028e1:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4028e8:	mov    DWORD PTR [ebp-0x8],eax
  4028eb:	lea    eax,[ebp-0x10]
  4028ee:	mov    fs:0x0,eax
  4028f4:	ret
  4028f5:	push   ebp
  4028f6:	mov    ebp,esp
  4028f8:	push   esi
  4028f9:	mov    esi,DWORD PTR [ebp+0x8]
  4028fc:	push   DWORD PTR [esi]
  4028fe:	call   0x402d16
  402903:	push   DWORD PTR [ebp+0x14]
  402906:	mov    DWORD PTR [esi],eax
  402908:	push   DWORD PTR [ebp+0x10]
  40290b:	push   DWORD PTR [ebp+0xc]
  40290e:	push   esi
  40290f:	push   0x401efd
  402914:	push   0x405000
  402919:	call   0x402c6e
  40291e:	add    esp,0x1c
  402921:	pop    esi
  402922:	pop    ebp
  402923:	ret
  402924:	push   ebp
  402925:	mov    ebp,esp
  402927:	or     DWORD PTR ds:0x405058,0x1
  40292e:	sub    esp,0x28
  402931:	mov    DWORD PTR ds:0x405438,0x0
  40293b:	push   0xa
  40293d:	call   DWORD PTR ds:0x40301c
  402943:	test   eax,eax
  402945:	je     0x402c3a
  40294b:	push   ebx
  40294c:	push   esi
  40294d:	push   edi
  40294e:	xor    eax,eax
  402950:	lea    edi,[ebp-0x28]
  402953:	xor    ecx,ecx
  402955:	push   ebx
  402956:	cpuid
  402958:	mov    esi,ebx
  40295a:	pop    ebx
  40295b:	nop
  40295c:	mov    DWORD PTR [edi],eax
  40295e:	mov    DWORD PTR [edi+0x4],esi
  402961:	mov    DWORD PTR [edi+0x8],ecx
  402964:	mov    DWORD PTR [edi+0xc],edx
  402967:	mov    eax,DWORD PTR [ebp-0x28]
  40296a:	mov    ecx,DWORD PTR [ebp-0x1c]
  40296d:	mov    DWORD PTR [ebp-0x4],eax
  402970:	xor    ecx,0x49656e69
  402976:	mov    eax,DWORD PTR [ebp-0x20]
  402979:	xor    eax,0x6c65746e
  40297e:	or     ecx,eax
  402980:	mov    eax,DWORD PTR [ebp-0x24]
  402983:	push   0x1
  402985:	xor    eax,0x756e6547
  40298a:	or     ecx,eax
  40298c:	pop    eax
  40298d:	push   0x0
  40298f:	pop    ecx
  402990:	push   ebx
  402991:	cpuid
  402993:	mov    esi,ebx
  402995:	pop    ebx
  402996:	nop
  402997:	mov    DWORD PTR [edi],eax
  402999:	mov    DWORD PTR [edi+0x4],esi
  40299c:	mov    DWORD PTR [edi+0x8],ecx
  40299f:	mov    DWORD PTR [edi+0xc],edx
  4029a2:	jne    0x4029dd
  4029a4:	mov    eax,DWORD PTR [ebp-0x28]
  4029a7:	and    eax,0xfff3ff0
  4029ac:	cmp    eax,0x106c0
  4029b1:	je     0x4029d6
  4029b3:	cmp    eax,0x20660
  4029b8:	je     0x4029d6
  4029ba:	cmp    eax,0x20670
  4029bf:	je     0x4029d6
  4029c1:	cmp    eax,0x30650
  4029c6:	je     0x4029d6
  4029c8:	cmp    eax,0x30660
  4029cd:	je     0x4029d6
  4029cf:	cmp    eax,0x30670
  4029d4:	jne    0x4029dd
  4029d6:	or     DWORD PTR ds:0x40543c,0x1
  4029dd:	mov    edx,DWORD PTR [ebp-0x20]
  4029e0:	xor    ebx,ebx
  4029e2:	xor    edi,edi
  4029e4:	mov    DWORD PTR [ebp-0xc],edx
  4029e7:	cmp    DWORD PTR [ebp-0x4],0x7
  4029eb:	mov    DWORD PTR [ebp-0x14],ebx
  4029ee:	mov    DWORD PTR [ebp-0x18],ebx
  4029f1:	jl     0x402a7e
  4029f7:	push   0x7
  4029f9:	pop    eax
  4029fa:	xor    ecx,ecx
  4029fc:	push   ebx
  4029fd:	cpuid
  4029ff:	mov    esi,ebx
  402a01:	pop    ebx
  402a02:	nop
  402a03:	lea    ebx,[ebp-0x28]
  402a06:	mov    DWORD PTR [ebx],eax
  402a08:	mov    DWORD PTR [ebx+0x4],esi
  402a0b:	mov    DWORD PTR [ebx+0x8],ecx
  402a0e:	mov    DWORD PTR [ebx+0xc],edx
  402a11:	mov    ebx,DWORD PTR [ebp-0x24]
  402a14:	mov    eax,DWORD PTR [ebp-0x1c]
  402a17:	mov    DWORD PTR [ebp-0x8],ebx
  402a1a:	mov    DWORD PTR [ebp-0x14],eax
  402a1d:	test   ebx,0x200
  402a23:	je     0x402a2c
  402a25:	or     DWORD PTR ds:0x40543c,0x2
  402a2c:	cmp    DWORD PTR [ebp-0x28],0x1
  402a30:	jl     0x402a56
  402a32:	push   0x7
  402a34:	pop    eax
  402a35:	xor    ecx,ecx
  402a37:	inc    ecx
  402a38:	push   ebx
  402a39:	cpuid
  402a3b:	mov    esi,ebx
  402a3d:	pop    ebx
  402a3e:	nop
  402a3f:	lea    ebx,[ebp-0x28]
  402a42:	mov    DWORD PTR [ebx],eax
  402a44:	mov    DWORD PTR [ebx+0x4],esi
  402a47:	mov    DWORD PTR [ebx+0x8],ecx
  402a4a:	mov    DWORD PTR [ebx+0xc],edx
  402a4d:	mov    eax,DWORD PTR [ebp-0x1c]
  402a50:	mov    ebx,DWORD PTR [ebp-0x8]
  402a53:	mov    DWORD PTR [ebp-0x18],eax
  402a56:	push   0x24
  402a58:	pop    eax
  402a59:	cmp    DWORD PTR [ebp-0x4],eax
  402a5c:	jl     0x402a7b
  402a5e:	xor    ecx,ecx
  402a60:	lea    edi,[ebp-0x28]
  402a63:	push   ebx
  402a64:	cpuid
  402a66:	mov    esi,ebx
  402a68:	pop    ebx
  402a69:	nop
  402a6a:	mov    ebx,DWORD PTR [ebp-0x8]
  402a6d:	mov    DWORD PTR [edi],eax
  402a6f:	mov    DWORD PTR [edi+0x4],esi
  402a72:	mov    DWORD PTR [edi+0x8],ecx
  402a75:	mov    DWORD PTR [edi+0xc],edx
  402a78:	mov    edi,DWORD PTR [ebp-0x24]
  402a7b:	mov    edx,DWORD PTR [ebp-0xc]
  402a7e:	mov    eax,ds:0x405058
  402a83:	mov    ecx,DWORD PTR ds:0x405050
  402a89:	or     eax,0x2
  402a8c:	mov    esi,DWORD PTR ds:0x405054
  402a92:	and    ecx,0xfffffffe
  402a95:	mov    DWORD PTR ds:0x405438,0x1
  402a9f:	mov    ds:0x405058,eax
  402aa4:	mov    DWORD PTR ds:0x405050,ecx
  402aaa:	mov    DWORD PTR ds:0x405054,esi
  402ab0:	test   edx,0x100000
  402ab6:	je     0x402c37
  402abc:	or     eax,0x4
  402abf:	mov    DWORD PTR ds:0x405438,0x2
  402ac9:	mov    ds:0x405058,eax
  402ace:	and    ecx,0xffffffef
  402ad1:	mov    eax,0x18000000
  402ad6:	mov    DWORD PTR ds:0x405050,ecx
  402adc:	and    edx,eax
  402ade:	mov    DWORD PTR ds:0x405054,esi
  402ae4:	cmp    edx,eax
  402ae6:	jne    0x402c37
  402aec:	xor    ecx,ecx
  402aee:	xgetbv
  402af1:	mov    DWORD PTR [ebp-0x10],eax
  402af4:	xor    esi,esi
  402af6:	mov    DWORD PTR [ebp-0xc],edx
  402af9:	mov    eax,DWORD PTR [ebp-0x10]
  402afc:	mov    ecx,DWORD PTR [ebp-0xc]
  402aff:	and    eax,0x6
  402b02:	and    ecx,esi
  402b04:	cmp    eax,0x6
  402b07:	jne    0x402c37
  402b0d:	cmp    ecx,esi
  402b0f:	jne    0x402c37
  402b15:	mov    eax,ds:0x405058
  402b1a:	or     eax,0x8
  402b1d:	mov    DWORD PTR ds:0x405438,0x3
  402b27:	mov    ds:0x405058,eax
  402b2c:	test   bl,0x20
  402b2f:	je     0x402baa
  402b31:	mov    ecx,DWORD PTR ds:0x405054
  402b37:	or     eax,0x20
  402b3a:	mov    ds:0x405058,eax
  402b3f:	mov    edx,0xd0030000
  402b44:	mov    eax,ds:0x405050
  402b49:	and    ebx,edx
  402b4b:	and    eax,0xfffffffd
  402b4e:	mov    DWORD PTR ds:0x405438,0x5
  402b58:	mov    ds:0x405050,eax
  402b5d:	mov    DWORD PTR ds:0x405054,ecx
  402b63:	cmp    ebx,edx
  402b65:	jne    0x402bb5
  402b67:	mov    eax,DWORD PTR [ebp-0x10]
  402b6a:	mov    edx,0xe0
  402b6f:	mov    ecx,DWORD PTR [ebp-0xc]
  402b72:	and    eax,edx
  402b74:	and    ecx,esi
  402b76:	cmp    eax,edx
  402b78:	jne    0x402baa
  402b7a:	cmp    ecx,esi
  402b7c:	jne    0x402baa
  402b7e:	mov    eax,ds:0x405050
  402b83:	or     DWORD PTR ds:0x405058,0x40
  402b8a:	and    eax,0xffffffdb
  402b8d:	mov    ecx,DWORD PTR ds:0x405054
  402b93:	mov    DWORD PTR ds:0x405438,0x6
  402b9d:	mov    ds:0x405050,eax
  402ba2:	mov    DWORD PTR ds:0x405054,ecx
  402ba8:	jmp    0x402bb5
  402baa:	mov    ecx,DWORD PTR ds:0x405054
  402bb0:	mov    eax,ds:0x405050
  402bb5:	test   DWORD PTR [ebp-0x14],0x800000
  402bbc:	je     0x402bce
  402bbe:	and    eax,0xfeffffff
  402bc3:	mov    DWORD PTR ds:0x405054,ecx
  402bc9:	mov    ds:0x405050,eax
  402bce:	test   DWORD PTR [ebp-0x18],0x80000
  402bd5:	je     0x402c37
  402bd7:	mov    eax,DWORD PTR [ebp-0x10]
  402bda:	mov    edx,0xe0
  402bdf:	mov    ecx,DWORD PTR [ebp-0xc]
  402be2:	and    eax,edx
  402be4:	and    ecx,esi
  402be6:	cmp    eax,edx
  402be8:	jne    0x402c37
  402bea:	cmp    ecx,esi
  402bec:	jne    0x402c37
  402bee:	mov    eax,edi
  402bf0:	xor    ecx,ecx
  402bf2:	shr    edi,0x10
  402bf5:	and    eax,0x400ff
  402bfa:	and    edi,0x6
  402bfd:	mov    ds:0x405434,eax
  402c02:	or     edi,0x1000029
  402c08:	not    ecx
  402c0a:	and    ecx,DWORD PTR ds:0x405054
  402c10:	not    edi
  402c12:	and    edi,DWORD PTR ds:0x405050
  402c18:	mov    DWORD PTR ds:0x405050,edi
  402c1e:	mov    DWORD PTR ds:0x405054,ecx
  402c24:	cmp    al,0x1
  402c26:	jbe    0x402c37
  402c28:	and    edi,0xffffffbf
  402c2b:	mov    DWORD PTR ds:0x405054,ecx
  402c31:	mov    DWORD PTR ds:0x405050,edi
  402c37:	pop    edi
  402c38:	pop    esi
  402c39:	pop    ebx
  402c3a:	xor    eax,eax
  402c3c:	leave
  402c3d:	ret
  402c3e:	xor    eax,eax
  402c40:	cmp    DWORD PTR ds:0x40505c,eax
  402c46:	setne  al
  402c49:	ret
  402c4a:	jmp    DWORD PTR ds:0x4030a8
  402c50:	jmp    DWORD PTR ds:0x40309c
  402c56:	jmp    DWORD PTR ds:0x403098
  402c5c:	jmp    DWORD PTR ds:0x403090
  402c62:	jmp    DWORD PTR ds:0x40308c
  402c68:	jmp    DWORD PTR ds:0x403088
  402c6e:	jmp    DWORD PTR ds:0x403084
  402c74:	jmp    DWORD PTR ds:0x4030b8
  402c7a:	jmp    DWORD PTR ds:0x4030b4
  402c80:	jmp    DWORD PTR ds:0x403120
  402c86:	jmp    DWORD PTR ds:0x40311c
  402c8c:	jmp    DWORD PTR ds:0x4030d0
  402c92:	jmp    DWORD PTR ds:0x403128
  402c98:	jmp    DWORD PTR ds:0x403114
  402c9e:	jmp    DWORD PTR ds:0x403110
  402ca4:	jmp    DWORD PTR ds:0x40310c
  402caa:	jmp    DWORD PTR ds:0x403108
  402cb0:	jmp    DWORD PTR ds:0x403104
  402cb6:	jmp    DWORD PTR ds:0x403100
  402cbc:	jmp    DWORD PTR ds:0x403134
  402cc2:	jmp    DWORD PTR ds:0x4030f0
  402cc8:	jmp    DWORD PTR ds:0x403118
  402cce:	jmp    DWORD PTR ds:0x4030fc
  402cd4:	jmp    DWORD PTR ds:0x4030f8
  402cda:	jmp    DWORD PTR ds:0x4030ec
  402ce0:	jmp    DWORD PTR ds:0x4030c8
  402ce6:	jmp    DWORD PTR ds:0x4030bc
  402cec:	jmp    DWORD PTR ds:0x403130
  402cf2:	jmp    DWORD PTR ds:0x4030c0
  402cf8:	jmp    DWORD PTR ds:0x4030d8
  402cfe:	jmp    DWORD PTR ds:0x4030dc
  402d04:	jmp    DWORD PTR ds:0x4030e0
  402d0a:	jmp    DWORD PTR ds:0x4030e4
  402d10:	jmp    DWORD PTR ds:0x403124
  402d16:	push   ebp
  402d17:	mov    ebp,esp
  402d19:	push   ecx
  402d1a:	cmp    DWORD PTR ds:0x405438,0x1
  402d21:	mov    ecx,DWORD PTR [ebp+0x8]
  402d24:	jl     0x402d82
  402d26:	cmp    ecx,0xc00002b4
  402d2c:	je     0x402d36
  402d2e:	cmp    ecx,0xc00002b5
  402d34:	jne    0x402d82
  402d36:	stmxcsr DWORD PTR [ebp-0x4]
  402d3a:	mov    eax,DWORD PTR [ebp-0x4]
  402d3d:	xor    eax,0x3f
  402d40:	test   al,0x81
  402d42:	je     0x402d86
  402d44:	test   eax,0x204
  402d49:	jne    0x402d52
  402d4b:	mov    eax,0xc000008e
  402d50:	leave
  402d51:	ret
  402d52:	test   eax,0x102
  402d57:	je     0x402d86
  402d59:	test   eax,0x408
  402d5e:	jne    0x402d67
  402d60:	mov    eax,0xc0000091
  402d65:	leave
  402d66:	ret
  402d67:	test   eax,0x810
  402d6c:	jne    0x402d75
  402d6e:	mov    eax,0xc0000093
  402d73:	leave
  402d74:	ret
  402d75:	test   eax,0x1020
  402d7a:	mov    eax,0xc000008f
  402d7f:	cmove  ecx,eax
  402d82:	mov    eax,ecx
  402d84:	leave
  402d85:	ret
  402d86:	mov    eax,0xc0000090
  402d8b:	leave
  402d8c:	ret
  402d8d:	jmp    DWORD PTR ds:0x4030ac
  402d93:	jmp    DWORD PTR ds:0x403094
  402d99:	int3
  402d9a:	int3
  402d9b:	int3
  402d9c:	int3
  402d9d:	int3
  402d9e:	int3
  402d9f:	int3
  402da0:	lea    ecx,[ebp-0x2c]
  402da3:	jmp    0x401940
  402da8:	lea    ecx,[ebp-0x48]
  402dab:	jmp    0x401940
  402db0:	lea    ecx,[ebp-0x60]
  402db3:	jmp    0x401940
  402db8:	int3
  402db9:	int3
  402dba:	int3
  402dbb:	int3
  402dbc:	int3
  402dbd:	nop
  402dbe:	nop
  402dbf:	mov    edx,DWORD PTR [esp+0x8]
  402dc3:	lea    eax,[edx+0xc]
  402dc6:	mov    ecx,DWORD PTR [edx-0x68]
  402dc9:	xor    ecx,eax
  402dcb:	call   0x401efd
  402dd0:	mov    ecx,DWORD PTR [edx-0x8]
  402dd3:	xor    ecx,eax
  402dd5:	call   0x401efd
  402dda:	mov    eax,0x4038a0
  402ddf:	jmp    0x402c4a
  402de4:	int3
  402de5:	int3
  402de6:	int3
  402de7:	int3
  402de8:	int3
  402de9:	int3
  402dea:	int3
  402deb:	int3
  402dec:	int3
  402ded:	int3
  402dee:	int3
  402def:	int3
  402df0:	lea    ecx,[ebp-0x30]
  402df3:	jmp    0x401bb0
  402df8:	lea    ecx,[ebp-0x30]
  402dfb:	jmp    0x401c00
  402e00:	int3
  402e01:	int3
  402e02:	int3
  402e03:	int3
  402e04:	int3
  402e05:	nop
  402e06:	nop
  402e07:	mov    edx,DWORD PTR [esp+0x8]
  402e0b:	lea    eax,[edx+0xc]
  402e0e:	mov    ecx,DWORD PTR [edx-0x34]
  402e11:	xor    ecx,eax
  402e13:	call   0x401efd
  402e18:	mov    eax,0x4038e4
  402e1d:	jmp    0x402c4a
  402e22:	int3
  402e23:	int3
  402e24:	int3
  402e25:	int3
  402e26:	int3
  402e27:	int3
  402e28:	int3
  402e29:	int3
  402e2a:	int3
  402e2b:	int3
  402e2c:	int3
  402e2d:	int3
  402e2e:	int3
  402e2f:	int3
  402e30:	nop
  402e31:	nop
  402e32:	mov    edx,DWORD PTR [esp+0x8]
  402e36:	lea    eax,[edx+0xc]
  402e39:	mov    ecx,DWORD PTR [edx-0x4]
  402e3c:	xor    ecx,eax
  402e3e:	call   0x401efd
  402e43:	mov    eax,0x403954
  402e48:	jmp    0x402c4a
  402e4d:	int3
  402e4e:	int3
  402e4f:	int3
  402e50:	lea    ecx,[ebp-0x30]
  402e53:	jmp    0x401bb0
  402e58:	lea    ecx,[ebp-0x30]
  402e5b:	jmp    0x4019a0
  402e60:	int3
  402e61:	int3
  402e62:	int3
  402e63:	int3
  402e64:	int3
  402e65:	nop
  402e66:	nop
  402e67:	mov    edx,DWORD PTR [esp+0x8]
  402e6b:	lea    eax,[edx+0xc]
  402e6e:	mov    ecx,DWORD PTR [edx-0x34]
  402e71:	xor    ecx,eax
  402e73:	call   0x401efd
  402e78:	mov    eax,0x403980
  402e7d:	jmp    0x402c4a
  402e82:	int3
  402e83:	int3
  402e84:	int3
  402e85:	int3
  402e86:	int3
  402e87:	int3
  402e88:	int3
  402e89:	int3
  402e8a:	int3
  402e8b:	int3
  402e8c:	int3
  402e8d:	int3
  402e8e:	int3
  402e8f:	int3
  402e90:	nop
  402e91:	nop
  402e92:	mov    edx,DWORD PTR [esp+0x8]
  402e96:	lea    eax,[edx+0xc]
  402e99:	mov    ecx,DWORD PTR [edx-0x4]
  402e9c:	xor    ecx,eax
  402e9e:	call   0x401efd
  402ea3:	mov    eax,0x4039f0
  402ea8:	jmp    0x402c4a
  402ead:	int3
  402eae:	int3
  402eaf:	int3
  402eb0:	nop
  402eb1:	nop
  402eb2:	mov    edx,DWORD PTR [esp+0x8]
  402eb6:	lea    eax,[edx+0xc]
  402eb9:	mov    ecx,DWORD PTR [edx-0x8]
  402ebc:	xor    ecx,eax
  402ebe:	call   0x401efd
  402ec3:	mov    eax,0x403954
  402ec8:	jmp    0x402c4a
