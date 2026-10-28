
KeygenMe.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	push   ebp
  401001:	mov    ebp,esp
  401003:	push   ecx
  401004:	push   ebx
  401005:	mov    ebx,ecx
  401007:	mov    edx,ebx
  401009:	push   esi
  40100a:	push   edi
  40100b:	xor    esi,esi
  40100d:	lea    edi,[edx+0x1]
  401010:	mov    al,BYTE PTR [edx]
  401012:	inc    edx
  401013:	test   al,al
  401015:	jne    0x401010
  401017:	sub    edx,edi
  401019:	je     0x401059
  40101b:	mov    ecx,0x4130c0
  401020:	lea    edx,[ecx+0x1]
  401023:	mov    al,BYTE PTR [ecx]
  401025:	inc    ecx
  401026:	test   al,al
  401028:	jne    0x401023
  40102a:	sub    ecx,edx
  40102c:	xor    eax,eax
  40102e:	test   ecx,ecx
  401030:	je     0x401042
  401032:	mov    dl,BYTE PTR [esi+ebx*1]
  401035:	cmp    BYTE PTR [eax+0x4130c0],dl
  40103b:	je     0x401046
  40103d:	inc    eax
  40103e:	cmp    eax,ecx
  401040:	jb     0x401035
  401042:	xor    eax,eax
  401044:	jmp    0x40105c
  401046:	mov    edx,ebx
  401048:	inc    esi
  401049:	lea    edi,[edx+0x1]
  40104c:	mov    al,BYTE PTR [edx]
  40104e:	inc    edx
  40104f:	test   al,al
  401051:	jne    0x40104c
  401053:	sub    edx,edi
  401055:	cmp    esi,edx
  401057:	jb     0x40102c
  401059:	xor    eax,eax
  40105b:	inc    eax
  40105c:	pop    edi
  40105d:	pop    esi
  40105e:	pop    ebx
  40105f:	mov    esp,ebp
  401061:	pop    ebp
  401062:	ret
  401063:	push   ebx
  401064:	push   esi
  401065:	push   edi
  401066:	push   0x4
  401068:	push   0x1000
  40106d:	push   0x64
  40106f:	push   0x0
  401071:	mov    edi,ecx
  401073:	call   DWORD PTR ds:0x40d004
  401079:	push   0xc
  40107b:	mov    esi,eax
  40107d:	mov    ebx,0x3ec
  401082:	push   esi
  401083:	push   ebx
  401084:	push   edi
  401085:	call   DWORD PTR ds:0x40d114
  40108b:	mov    ecx,esi
  40108d:	lea    edx,[ecx+0x1]
  401090:	mov    al,BYTE PTR [ecx]
  401092:	inc    ecx
  401093:	test   al,al
  401095:	jne    0x401090
  401097:	sub    ecx,edx
  401099:	cmp    ecx,0xa
  40109c:	jne    0x401110
  40109e:	mov    ecx,esi
  4010a0:	call   0x401000
  4010a5:	test   eax,eax
  4010a7:	je     0x401109
  4010a9:	xor    eax,eax
  4010ab:	xor    DWORD PTR [esi+eax*4],0x1234567
  4010b2:	and    BYTE PTR [esi+eax*4],0xe
  4010b6:	inc    eax
  4010b7:	cmp    eax,0x2
  4010ba:	jb     0x4010ab
  4010bc:	mov    cl,BYTE PTR [esi+0x8]
  4010bf:	xor    eax,eax
  4010c1:	add    cl,BYTE PTR [eax+esi*1]
  4010c4:	inc    eax
  4010c5:	mov    BYTE PTR [esi+0x8],cl
  4010c8:	cmp    eax,0xa
  4010cb:	jb     0x4010c1
  4010cd:	xor    eax,eax
  4010cf:	xor    DWORD PTR [esi+eax*4],0x89abcde
  4010d6:	and    BYTE PTR [esi+eax*4],0xe
  4010da:	inc    eax
  4010db:	cmp    eax,0x2
  4010de:	jb     0x4010cf
  4010e0:	mov    al,BYTE PTR [esi+0x9]
  4010e3:	xor    ecx,ecx
  4010e5:	add    al,BYTE PTR [ecx+esi*1]
  4010e8:	inc    ecx
  4010e9:	mov    BYTE PTR [esi+0x9],al
  4010ec:	cmp    ecx,0xa
  4010ef:	jb     0x4010e5
  4010f1:	cmp    BYTE PTR [esi+0x8],0x42
  4010f5:	jne    0x401102
  4010f7:	cmp    al,0xde
  4010f9:	jne    0x401102
  4010fb:	push   0x410db4
  401100:	jmp    0x401115
  401102:	push   0x410dd4
  401107:	jmp    0x401115
  401109:	push   0x410de8
  40110e:	jmp    0x401115
  401110:	push   0x410e0c
  401115:	push   esi
  401116:	call   0x40121c
  40111b:	pop    ecx
  40111c:	pop    ecx
  40111d:	push   esi
  40111e:	push   ebx
  40111f:	push   edi
  401120:	call   DWORD PTR ds:0x40d11c
  401126:	push   0x8000
  40112b:	push   0x0
  40112d:	push   esi
  40112e:	call   DWORD PTR ds:0x40d000
  401134:	pop    edi
  401135:	pop    esi
  401136:	pop    ebx
  401137:	ret
  401138:	push   ebp
  401139:	mov    ebp,esp
  40113b:	mov    eax,DWORD PTR [ebp+0xc]
  40113e:	sub    eax,0x110
  401143:	je     0x4011b0
  401145:	dec    eax
  401146:	je     0x401168
  401148:	sub    eax,0xf0
  40114d:	jne    0x4011e4
  401153:	push   DWORD PTR [ebp+0x14]
  401156:	push   0x2
  401158:	push   0xa1
  40115d:	push   DWORD PTR [ebp+0x8]
  401160:	call   DWORD PTR ds:0x40d104
  401166:	jmp    0x4011e4
  401168:	mov    eax,DWORD PTR [ebp+0x10]
  40116b:	movzx  eax,ax
  40116e:	dec    eax
  40116f:	dec    eax
  401170:	je     0x4011a0
  401172:	sub    eax,0x3e7
  401177:	je     0x4011a0
  401179:	dec    eax
  40117a:	je     0x401189
  40117c:	dec    eax
  40117d:	jne    0x4011e4
  40117f:	mov    ecx,DWORD PTR [ebp+0x8]
  401182:	call   0x401063
  401187:	jmp    0x4011e4
  401189:	push   0x40
  40118b:	push   0x410e34
  401190:	push   0x410e3c
  401195:	push   DWORD PTR [ebp+0x8]
  401198:	call   DWORD PTR ds:0x40d108
  40119e:	jmp    0x4011e4
  4011a0:	push   0x0
  4011a2:	push   DWORD PTR [ebp+0x8]
  4011a5:	call   DWORD PTR ds:0x40d110
  4011ab:	xor    eax,eax
  4011ad:	inc    eax
  4011ae:	jmp    0x4011e6
  4011b0:	push   0x67
  4011b2:	push   DWORD PTR ds:0x413e80
  4011b8:	call   DWORD PTR ds:0x40d0fc
  4011be:	push   eax
  4011bf:	push   0x1
  4011c1:	push   0x80
  4011c6:	push   DWORD PTR [ebp+0x8]
  4011c9:	call   DWORD PTR ds:0x40d104
  4011cf:	push   0x3ec
  4011d4:	push   DWORD PTR [ebp+0x8]
  4011d7:	call   DWORD PTR ds:0x40d10c
  4011dd:	push   eax
  4011de:	call   DWORD PTR ds:0x40d100
  4011e4:	xor    eax,eax
  4011e6:	pop    ebp
  4011e7:	ret    0x10
  4011ea:	push   ebp
  4011eb:	mov    ebp,esp
  4011ed:	mov    eax,DWORD PTR [ebp+0x8]
  4011f0:	push   0x0
  4011f2:	push   0x401138
  4011f7:	push   0x0
  4011f9:	push   0x65
  4011fb:	push   eax
  4011fc:	mov    ds:0x413e80,eax
  401201:	call   DWORD PTR ds:0x40d118
  401207:	xor    eax,eax
  401209:	pop    ebp
  40120a:	ret    0x10
  40120d:	cmp    ecx,DWORD PTR ds:0x412000
  401213:	jne    0x401217
  401215:	repz ret
  401217:	jmp    0x40145e
  40121c:	push   ebp
  40121d:	mov    ebp,esp
  40121f:	sub    esp,0x20
  401222:	push   ebx
  401223:	push   edi
  401224:	xor    ebx,ebx
  401226:	lea    edi,[ebp-0x1c]
  401229:	push   0x7
  40122b:	xor    eax,eax
  40122d:	mov    DWORD PTR [ebp-0x20],ebx
  401230:	pop    ecx
  401231:	rep stos DWORD PTR es:[edi],eax
  401233:	cmp    DWORD PTR [ebp+0xc],eax
  401236:	jne    0x40124d
  401238:	call   0x402568
  40123d:	mov    DWORD PTR [eax],0x16
  401243:	call   0x4016b6
  401248:	or     eax,0xffffffff
  40124b:	jmp    0x40129a
  40124d:	mov    eax,DWORD PTR [ebp+0x8]
  401250:	test   eax,eax
  401252:	je     0x401238
  401254:	push   esi
  401255:	mov    DWORD PTR [ebp-0x18],eax
  401258:	mov    DWORD PTR [ebp-0x20],eax
  40125b:	lea    eax,[ebp+0x10]
  40125e:	push   eax
  40125f:	push   ebx
  401260:	push   DWORD PTR [ebp+0xc]
  401263:	lea    eax,[ebp-0x20]
  401266:	mov    DWORD PTR [ebp-0x1c],0x7fffffff
  40126d:	push   eax
  40126e:	mov    DWORD PTR [ebp-0x14],0x42
  401275:	call   0x4018c8
  40127a:	add    esp,0x10
  40127d:	mov    esi,eax
  40127f:	dec    DWORD PTR [ebp-0x1c]
  401282:	js     0x40128b
  401284:	mov    ecx,DWORD PTR [ebp-0x20]
  401287:	mov    BYTE PTR [ecx],bl
  401289:	jmp    0x401297
  40128b:	lea    eax,[ebp-0x20]
  40128e:	push   eax
  40128f:	push   ebx
  401290:	call   0x4016f1
  401295:	pop    ecx
  401296:	pop    ecx
  401297:	mov    eax,esi
  401299:	pop    esi
  40129a:	pop    edi
  40129b:	pop    ebx
  40129c:	mov    esp,ebp
  40129e:	pop    ebp
  40129f:	ret
  4012a0:	call   0x4035a9
  4012a5:	jmp    0x4012aa
  4012aa:	push   0x14
  4012ac:	push   0x410ee0
  4012b1:	call   0x403b60
  4012b6:	call   0x403790
  4012bb:	movzx  esi,ax
  4012be:	push   0x2
  4012c0:	call   0x40355c
  4012c5:	pop    ecx
  4012c6:	mov    eax,0x5a4d
  4012cb:	cmp    WORD PTR ds:0x400000,ax
  4012d2:	je     0x4012d8
  4012d4:	xor    ebx,ebx
  4012d6:	jmp    0x40130b
  4012d8:	mov    eax,ds:0x40003c
  4012dd:	cmp    DWORD PTR [eax+0x400000],0x4550
  4012e7:	jne    0x4012d4
  4012e9:	mov    ecx,0x10b
  4012ee:	cmp    WORD PTR [eax+0x400018],cx
  4012f5:	jne    0x4012d4
  4012f7:	xor    ebx,ebx
  4012f9:	cmp    DWORD PTR [eax+0x400074],0xe
  401300:	jbe    0x40130b
  401302:	cmp    DWORD PTR [eax+0x4000e8],ebx
  401308:	setne  bl
  40130b:	mov    DWORD PTR [ebp-0x1c],ebx
  40130e:	call   0x402d69
  401313:	test   eax,eax
  401315:	jne    0x40131f
  401317:	push   0x1c
  401319:	call   0x4013fa
  40131e:	pop    ecx
  40131f:	call   0x4029d5
  401324:	test   eax,eax
  401326:	jne    0x401330
  401328:	push   0x10
  40132a:	call   0x4013fa
  40132f:	pop    ecx
  401330:	call   0x403645
  401335:	and    DWORD PTR [ebp-0x4],0x0
  401339:	call   0x402d7e
  40133e:	test   eax,eax
  401340:	jns    0x40134a
  401342:	push   0x1b
  401344:	call   0x4013fa
  401349:	pop    ecx
  40134a:	call   DWORD PTR ds:0x40d014
  401350:	mov    ds:0x414f5c,eax
  401355:	call   0x403685
  40135a:	mov    ds:0x413100,eax
  40135f:	call   0x403032
  401364:	test   eax,eax
  401366:	jns    0x401370
  401368:	push   0x8
  40136a:	call   0x402ab2
  40136f:	pop    ecx
  401370:	call   0x403261
  401375:	test   eax,eax
  401377:	jns    0x401381
  401379:	push   0x9
  40137b:	call   0x402ab2
  401380:	pop    ecx
  401381:	push   0x1
  401383:	call   0x402aec
  401388:	pop    ecx
  401389:	test   eax,eax
  40138b:	je     0x401394
  40138d:	push   eax
  40138e:	call   0x402ab2
  401393:	pop    ecx
  401394:	call   0x403af3
  401399:	push   esi
  40139a:	push   eax
  40139b:	push   0x0
  40139d:	push   0x400000
  4013a2:	call   0x4011ea
  4013a7:	mov    esi,eax
  4013a9:	mov    DWORD PTR [ebp-0x24],esi
  4013ac:	test   ebx,ebx
  4013ae:	jne    0x4013b6
  4013b0:	push   esi
  4013b1:	call   0x402d55
  4013b6:	call   0x402add
  4013bb:	jmp    0x4013eb
  4013bd:	mov    ecx,DWORD PTR [ebp-0x14]
  4013c0:	mov    eax,DWORD PTR [ecx]
  4013c2:	mov    eax,DWORD PTR [eax]
  4013c4:	mov    DWORD PTR [ebp-0x20],eax
  4013c7:	push   ecx
  4013c8:	push   eax
  4013c9:	call   0x40260b
  4013ce:	pop    ecx
  4013cf:	pop    ecx
  4013d0:	ret
  4013d1:	mov    esp,DWORD PTR [ebp-0x18]
  4013d4:	mov    esi,DWORD PTR [ebp-0x20]
  4013d7:	mov    DWORD PTR [ebp-0x24],esi
  4013da:	cmp    DWORD PTR [ebp-0x1c],0x0
  4013de:	jne    0x4013e6
  4013e0:	push   esi
  4013e1:	call   0x402b70
  4013e6:	call   0x402ace
  4013eb:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4013f2:	mov    eax,esi
  4013f4:	call   0x403ba5
  4013f9:	ret
  4013fa:	push   ebp
  4013fb:	mov    ebp,esp
  4013fd:	cmp    DWORD PTR ds:0x413ca0,0x1
  401404:	jne    0x40140b
  401406:	call   0x403342
  40140b:	push   DWORD PTR [ebp+0x8]
  40140e:	call   0x40339f
  401413:	push   0xff
  401418:	call   0x402a9c
  40141d:	pop    ecx
  40141e:	pop    ecx
  40141f:	pop    ebp
  401420:	ret
  401421:	push   ebp
  401422:	mov    ebp,esp
  401424:	call   DWORD PTR ds:0x40d018
  40142a:	push   0x1
  40142c:	mov    ds:0x413424,eax
  401431:	call   0x403d54
  401436:	push   DWORD PTR [ebp+0x8]
  401439:	call   0x403add
  40143e:	cmp    DWORD PTR ds:0x413424,0x0
  401445:	pop    ecx
  401446:	pop    ecx
  401447:	jne    0x401451
  401449:	push   0x1
  40144b:	call   0x403d54
  401450:	pop    ecx
  401451:	push   0xc0000409
  401456:	call   0x403ac8
  40145b:	pop    ecx
  40145c:	pop    ebp
  40145d:	ret
  40145e:	push   ebp
  40145f:	mov    ebp,esp
  401461:	sub    esp,0x324
  401467:	push   0x17
  401469:	call   0x40c208
  40146e:	test   eax,eax
  401470:	je     0x401477
  401472:	push   0x2
  401474:	pop    ecx
  401475:	int    0x29
  401477:	mov    ds:0x413208,eax
  40147c:	mov    DWORD PTR ds:0x413204,ecx
  401482:	mov    DWORD PTR ds:0x413200,edx
  401488:	mov    DWORD PTR ds:0x4131fc,ebx
  40148e:	mov    DWORD PTR ds:0x4131f8,esi
  401494:	mov    DWORD PTR ds:0x4131f4,edi
  40149a:	data16 mov WORD PTR ds:0x413220,ss
  4014a1:	data16 mov WORD PTR ds:0x413214,cs
  4014a8:	data16 mov WORD PTR ds:0x4131f0,ds
  4014af:	data16 mov WORD PTR ds:0x4131ec,es
  4014b6:	data16 mov WORD PTR ds:0x4131e8,fs
  4014bd:	data16 mov WORD PTR ds:0x4131e4,gs
  4014c4:	pushf
  4014c5:	pop    DWORD PTR ds:0x413218
  4014cb:	mov    eax,DWORD PTR [ebp+0x0]
  4014ce:	mov    ds:0x41320c,eax
  4014d3:	mov    eax,DWORD PTR [ebp+0x4]
  4014d6:	mov    ds:0x413210,eax
  4014db:	lea    eax,[ebp+0x8]
  4014de:	mov    ds:0x41321c,eax
  4014e3:	mov    eax,DWORD PTR [ebp-0x324]
  4014e9:	mov    DWORD PTR ds:0x413158,0x10001
  4014f3:	mov    eax,ds:0x413210
  4014f8:	mov    ds:0x413114,eax
  4014fd:	mov    DWORD PTR ds:0x413108,0xc0000409
  401507:	mov    DWORD PTR ds:0x41310c,0x1
  401511:	mov    DWORD PTR ds:0x413118,0x1
  40151b:	push   0x4
  40151d:	pop    eax
  40151e:	imul   eax,eax,0x0
  401521:	mov    DWORD PTR [eax+0x41311c],0x2
  40152b:	push   0x4
  40152d:	pop    eax
  40152e:	imul   eax,eax,0x0
  401531:	mov    ecx,DWORD PTR ds:0x412000
  401537:	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  40153b:	push   0x4
  40153d:	pop    eax
  40153e:	shl    eax,0x0
  401541:	mov    ecx,DWORD PTR ds:0x412004
  401547:	mov    DWORD PTR [ebp+eax*1-0x8],ecx
  40154b:	push   0x40d168
  401550:	call   0x401421
  401555:	mov    esp,ebp
  401557:	pop    ebp
  401558:	ret
  401559:	push   ebp
  40155a:	mov    ebp,esp
  40155c:	sub    esp,0x328
  401562:	mov    eax,ds:0x412000
  401567:	xor    eax,ebp
  401569:	mov    DWORD PTR [ebp-0x4],eax
  40156c:	cmp    DWORD PTR [ebp+0x8],0xffffffff
  401570:	push   edi
  401571:	je     0x40157c
  401573:	push   DWORD PTR [ebp+0x8]
  401576:	call   0x403d54
  40157b:	pop    ecx
  40157c:	and    DWORD PTR [ebp-0x320],0x0
  401583:	lea    eax,[ebp-0x31c]
  401589:	push   0x4c
  40158b:	push   0x0
  40158d:	push   eax
  40158e:	call   0x403d60
  401593:	lea    eax,[ebp-0x320]
  401599:	add    esp,0xc
  40159c:	mov    DWORD PTR [ebp-0x328],eax
  4015a2:	lea    eax,[ebp-0x2d0]
  4015a8:	mov    DWORD PTR [ebp-0x324],eax
  4015ae:	mov    DWORD PTR [ebp-0x220],eax
  4015b4:	mov    DWORD PTR [ebp-0x224],ecx
  4015ba:	mov    DWORD PTR [ebp-0x228],edx
  4015c0:	mov    DWORD PTR [ebp-0x22c],ebx
  4015c6:	mov    DWORD PTR [ebp-0x230],esi
  4015cc:	mov    DWORD PTR [ebp-0x234],edi
  4015d2:	data16 mov WORD PTR [ebp-0x208],ss
  4015d9:	data16 mov WORD PTR [ebp-0x214],cs
  4015e0:	data16 mov WORD PTR [ebp-0x238],ds
  4015e7:	data16 mov WORD PTR [ebp-0x23c],es
  4015ee:	data16 mov WORD PTR [ebp-0x240],fs
  4015f5:	data16 mov WORD PTR [ebp-0x244],gs
  4015fc:	pushf
  4015fd:	pop    DWORD PTR [ebp-0x210]
  401603:	mov    eax,DWORD PTR [ebp+0x4]
  401606:	mov    DWORD PTR [ebp-0x218],eax
  40160c:	lea    eax,[ebp+0x4]
  40160f:	mov    DWORD PTR [ebp-0x20c],eax
  401615:	mov    DWORD PTR [ebp-0x2d0],0x10001
  40161f:	mov    eax,DWORD PTR [eax-0x4]
  401622:	mov    DWORD PTR [ebp-0x21c],eax
  401628:	mov    eax,DWORD PTR [ebp+0xc]
  40162b:	mov    DWORD PTR [ebp-0x320],eax
  401631:	mov    eax,DWORD PTR [ebp+0x10]
  401634:	mov    DWORD PTR [ebp-0x31c],eax
  40163a:	mov    eax,DWORD PTR [ebp+0x4]
  40163d:	mov    DWORD PTR [ebp-0x314],eax
  401643:	call   DWORD PTR ds:0x40d018
  401649:	mov    edi,eax
  40164b:	lea    eax,[ebp-0x328]
  401651:	push   eax
  401652:	call   0x403add
  401657:	pop    ecx
  401658:	test   eax,eax
  40165a:	jne    0x40166f
  40165c:	test   edi,edi
  40165e:	jne    0x40166f
  401660:	cmp    DWORD PTR [ebp+0x8],0xffffffff
  401664:	je     0x40166f
  401666:	push   DWORD PTR [ebp+0x8]
  401669:	call   0x403d54
  40166e:	pop    ecx
  40166f:	mov    ecx,DWORD PTR [ebp-0x4]
  401672:	xor    ecx,ebp
  401674:	pop    edi
  401675:	call   0x40120d
  40167a:	mov    esp,ebp
  40167c:	pop    ebp
  40167d:	ret
  40167e:	push   ebp
  40167f:	mov    ebp,esp
  401681:	mov    eax,DWORD PTR [ebp+0x8]
  401684:	mov    ds:0x413428,eax
  401689:	pop    ebp
  40168a:	ret
  40168b:	push   ebp
  40168c:	mov    ebp,esp
  40168e:	push   DWORD PTR ds:0x413428
  401694:	call   DWORD PTR ds:0x40d024
  40169a:	test   eax,eax
  40169c:	je     0x4016a1
  40169e:	pop    ebp
  40169f:	jmp    eax
  4016a1:	push   DWORD PTR [ebp+0x18]
  4016a4:	push   DWORD PTR [ebp+0x14]
  4016a7:	push   DWORD PTR [ebp+0x10]
  4016aa:	push   DWORD PTR [ebp+0xc]
  4016ad:	push   DWORD PTR [ebp+0x8]
  4016b0:	call   0x4016c6
  4016b5:	int3
  4016b6:	xor    eax,eax
  4016b8:	push   eax
  4016b9:	push   eax
  4016ba:	push   eax
  4016bb:	push   eax
  4016bc:	push   eax
  4016bd:	call   0x40168b
  4016c2:	add    esp,0x14
  4016c5:	ret
  4016c6:	push   0x17
  4016c8:	call   0x40c208
  4016cd:	test   eax,eax
  4016cf:	je     0x4016d6
  4016d1:	push   0x5
  4016d3:	pop    ecx
  4016d4:	int    0x29
  4016d6:	push   esi
  4016d7:	push   0x1
  4016d9:	mov    esi,0xc0000417
  4016de:	push   esi
  4016df:	push   0x2
  4016e1:	call   0x401559
  4016e6:	push   esi
  4016e7:	call   0x403ac8
  4016ec:	add    esp,0x10
  4016ef:	pop    esi
  4016f0:	ret
  4016f1:	push   ebp
  4016f2:	mov    ebp,esp
  4016f4:	push   esi
  4016f5:	mov    esi,DWORD PTR [ebp+0xc]
  4016f8:	push   edi
  4016f9:	push   esi
  4016fa:	call   0x403f66
  4016ff:	pop    ecx
  401700:	mov    ecx,DWORD PTR [esi+0xc]
  401703:	mov    edi,eax
  401705:	test   cl,0x82
  401708:	jne    0x401721
  40170a:	call   0x402568
  40170f:	mov    DWORD PTR [eax],0x9
  401715:	or     DWORD PTR [esi+0xc],0x20
  401719:	or     eax,0xffffffff
  40171c:	jmp    0x40183c
  401721:	test   cl,0x40
  401724:	je     0x401733
  401726:	call   0x402568
  40172b:	mov    DWORD PTR [eax],0x22
  401731:	jmp    0x401715
  401733:	push   ebx
  401734:	xor    ebx,ebx
  401736:	test   cl,0x1
  401739:	je     0x40174e
  40173b:	mov    DWORD PTR [esi+0x4],ebx
  40173e:	test   cl,0x10
  401741:	je     0x4017c0
  401743:	mov    eax,DWORD PTR [esi+0x8]
  401746:	and    ecx,0xfffffffe
  401749:	mov    DWORD PTR [esi],eax
  40174b:	mov    DWORD PTR [esi+0xc],ecx
  40174e:	mov    eax,DWORD PTR [esi+0xc]
  401751:	and    eax,0xffffffef
  401754:	mov    DWORD PTR [esi+0x4],ebx
  401757:	or     eax,0x2
  40175a:	mov    DWORD PTR [esi+0xc],eax
  40175d:	test   eax,0x10c
  401762:	jne    0x40178e
  401764:	call   0x403e8a
  401769:	add    eax,0x20
  40176c:	cmp    esi,eax
  40176e:	je     0x40177c
  401770:	call   0x403e8a
  401775:	add    eax,0x40
  401778:	cmp    esi,eax
  40177a:	jne    0x401787
  40177c:	push   edi
  40177d:	call   0x403f8a
  401782:	pop    ecx
  401783:	test   eax,eax
  401785:	jne    0x40178e
  401787:	push   esi
  401788:	call   0x404aa1
  40178d:	pop    ecx
  40178e:	test   DWORD PTR [esi+0xc],0x108
  401795:	je     0x401811
  401797:	mov    edx,DWORD PTR [esi+0x8]
  40179a:	mov    ecx,DWORD PTR [esi]
  40179c:	sub    ecx,edx
  40179e:	mov    DWORD PTR [ebp+0xc],ecx
  4017a1:	lea    eax,[edx+0x1]
  4017a4:	mov    DWORD PTR [esi],eax
  4017a6:	mov    eax,DWORD PTR [esi+0x18]
  4017a9:	dec    eax
  4017aa:	mov    DWORD PTR [esi+0x4],eax
  4017ad:	test   ecx,ecx
  4017af:	jle    0x4017c8
  4017b1:	push   ecx
  4017b2:	push   edx
  4017b3:	push   edi
  4017b4:	call   0x403fde
  4017b9:	add    esp,0xc
  4017bc:	mov    ebx,eax
  4017be:	jmp    0x401807
  4017c0:	or     ecx,0x20
  4017c3:	mov    DWORD PTR [esi+0xc],ecx
  4017c6:	jmp    0x401830
  4017c8:	cmp    edi,0xffffffff
  4017cb:	je     0x4017e8
  4017cd:	cmp    edi,0xfffffffe
  4017d0:	je     0x4017e8
  4017d2:	mov    eax,edi
  4017d4:	mov    ecx,edi
  4017d6:	sar    eax,0x5
  4017d9:	and    ecx,0x1f
  4017dc:	shl    ecx,0x6
  4017df:	add    ecx,DWORD PTR [eax*4+0x413468]
  4017e6:	jmp    0x4017ed
  4017e8:	mov    ecx,0x412188
  4017ed:	test   BYTE PTR [ecx+0x4],0x20
  4017f1:	je     0x401807
  4017f3:	push   0x2
  4017f5:	push   ebx
  4017f6:	push   ebx
  4017f7:	push   edi
  4017f8:	call   0x404932
  4017fd:	and    eax,edx
  4017ff:	add    esp,0x10
  401802:	cmp    eax,0xffffffff
  401805:	je     0x40182c
  401807:	mov    ecx,DWORD PTR [esi+0x8]
  40180a:	mov    al,BYTE PTR [ebp+0x8]
  40180d:	mov    BYTE PTR [ecx],al
  40180f:	jmp    0x401827
  401811:	xor    eax,eax
  401813:	inc    eax
  401814:	push   eax
  401815:	mov    DWORD PTR [ebp+0xc],eax
  401818:	lea    eax,[ebp+0x8]
  40181b:	push   eax
  40181c:	push   edi
  40181d:	call   0x403fde
  401822:	add    esp,0xc
  401825:	mov    ebx,eax
  401827:	cmp    ebx,DWORD PTR [ebp+0xc]
  40182a:	je     0x401835
  40182c:	or     DWORD PTR [esi+0xc],0x20
  401830:	or     eax,0xffffffff
  401833:	jmp    0x40183b
  401835:	mov    eax,DWORD PTR [ebp+0x8]
  401838:	movzx  eax,al
  40183b:	pop    ebx
  40183c:	pop    edi
  40183d:	pop    esi
  40183e:	pop    ebp
  40183f:	ret
  401840:	push   ebp
  401841:	mov    ebp,esp
  401843:	push   esi
  401844:	mov    esi,ecx
  401846:	mov    ecx,DWORD PTR [ebp+0x8]
  401849:	mov    BYTE PTR [esi+0xc],0x0
  40184d:	test   ecx,ecx
  40184f:	jne    0x4018b7
  401851:	push   edi
  401852:	call   0x40289b
  401857:	mov    edi,eax
  401859:	mov    DWORD PTR [esi+0x8],edi
  40185c:	mov    edx,DWORD PTR [edi+0x6c]
  40185f:	mov    DWORD PTR [esi],edx
  401861:	mov    ecx,DWORD PTR [edi+0x68]
  401864:	mov    DWORD PTR [esi+0x4],ecx
  401867:	cmp    edx,DWORD PTR ds:0x412adc
  40186d:	je     0x401880
  40186f:	mov    eax,ds:0x412b98
  401874:	test   DWORD PTR [edi+0x70],eax
  401877:	jne    0x401880
  401879:	call   0x404d76
  40187e:	mov    DWORD PTR [esi],eax
  401880:	mov    eax,DWORD PTR [esi+0x4]
  401883:	pop    edi
  401884:	cmp    eax,DWORD PTR ds:0x41287c
  40188a:	je     0x4018a1
  40188c:	mov    ecx,DWORD PTR [esi+0x8]
  40188f:	mov    eax,ds:0x412b98
  401894:	test   DWORD PTR [ecx+0x70],eax
  401897:	jne    0x4018a1
  401899:	call   0x4050f8
  40189e:	mov    DWORD PTR [esi+0x4],eax
  4018a1:	mov    ecx,DWORD PTR [esi+0x8]
  4018a4:	mov    eax,DWORD PTR [ecx+0x70]
  4018a7:	test   al,0x2
  4018a9:	jne    0x4018c1
  4018ab:	or     eax,0x2
  4018ae:	mov    DWORD PTR [ecx+0x70],eax
  4018b1:	mov    BYTE PTR [esi+0xc],0x1
  4018b5:	jmp    0x4018c1
  4018b7:	mov    eax,DWORD PTR [ecx]
  4018b9:	mov    DWORD PTR [esi],eax
  4018bb:	mov    eax,DWORD PTR [ecx+0x4]
  4018be:	mov    DWORD PTR [esi+0x4],eax
  4018c1:	mov    eax,esi
  4018c3:	pop    esi
  4018c4:	pop    ebp
  4018c5:	ret    0x4
  4018c8:	push   ebp
  4018c9:	mov    ebp,esp
  4018cb:	sub    esp,0x280
  4018d1:	mov    eax,ds:0x412000
  4018d6:	xor    eax,ebp
  4018d8:	mov    DWORD PTR [ebp-0x4],eax
  4018db:	mov    eax,DWORD PTR [ebp+0x8]
  4018de:	lea    ecx,[ebp-0x270]
  4018e4:	push   ebx
  4018e5:	push   esi
  4018e6:	mov    DWORD PTR [ebp-0x230],eax
  4018ec:	mov    eax,DWORD PTR [ebp+0xc]
  4018ef:	push   edi
  4018f0:	push   DWORD PTR [ebp+0x10]
  4018f3:	mov    edi,DWORD PTR [ebp+0x14]
  4018f6:	mov    DWORD PTR [ebp-0x210],eax
  4018fc:	xor    eax,eax
  4018fe:	mov    ebx,eax
  401900:	mov    DWORD PTR [ebp-0x21c],edi
  401906:	mov    DWORD PTR [ebp-0x254],eax
  40190c:	mov    esi,eax
  40190e:	mov    DWORD PTR [ebp-0x218],ebx
  401914:	mov    DWORD PTR [ebp-0x240],eax
  40191a:	mov    DWORD PTR [ebp-0x228],eax
  401920:	mov    DWORD PTR [ebp-0x234],eax
  401926:	mov    DWORD PTR [ebp-0x25c],eax
  40192c:	mov    DWORD PTR [ebp-0x24c],eax
  401932:	mov    DWORD PTR [ebp-0x238],eax
  401938:	call   0x401840
  40193d:	call   0x402568
  401942:	mov    DWORD PTR [ebp-0x258],eax
  401948:	mov    eax,DWORD PTR [ebp-0x230]
  40194e:	test   eax,eax
  401950:	je     0x402413
  401956:	test   BYTE PTR [eax+0xc],0x40
  40195a:	jne    0x4019bf
  40195c:	push   eax
  40195d:	call   0x403f66
  401962:	pop    ecx
  401963:	mov    ecx,eax
  401965:	cmp    ecx,0xffffffff
  401968:	je     0x401983
  40196a:	cmp    ecx,0xfffffffe
  40196d:	je     0x401983
  40196f:	mov    edx,ecx
  401971:	sar    eax,0x5
  401974:	and    edx,0x1f
  401977:	shl    edx,0x6
  40197a:	add    edx,DWORD PTR [eax*4+0x413468]
  401981:	jmp    0x401988
  401983:	mov    edx,0x412188
  401988:	test   BYTE PTR [edx+0x24],0x7f
  40198c:	jne    0x402413
  401992:	cmp    ecx,0xffffffff
  401995:	je     0x4019b0
  401997:	cmp    ecx,0xfffffffe
  40199a:	je     0x4019b0
  40199c:	mov    eax,ecx
  40199e:	and    ecx,0x1f
  4019a1:	sar    eax,0x5
  4019a4:	shl    ecx,0x6
  4019a7:	add    ecx,DWORD PTR [eax*4+0x413468]
  4019ae:	jmp    0x4019b5
  4019b0:	mov    ecx,0x412188
  4019b5:	test   BYTE PTR [ecx+0x24],0x80
  4019b9:	jne    0x402413
  4019bf:	mov    edx,DWORD PTR [ebp-0x210]
  4019c5:	test   edx,edx
  4019c7:	je     0x402413
  4019cd:	mov    dl,BYTE PTR [edx]
  4019cf:	xor    eax,eax
  4019d1:	mov    DWORD PTR [ebp-0x224],eax
  4019d7:	mov    ecx,eax
  4019d9:	mov    DWORD PTR [ebp-0x220],ecx
  4019df:	mov    DWORD PTR [ebp-0x244],eax
  4019e5:	mov    DWORD PTR [ebp-0x250],eax
  4019eb:	mov    BYTE PTR [ebp-0x211],dl
  4019f1:	mov    BYTE PTR [ebp-0x248],dl
  4019f7:	test   dl,dl
  4019f9:	je     0x4023ed
  4019ff:	mov    eax,DWORD PTR [ebp-0x210]
  401a05:	inc    eax
  401a06:	mov    DWORD PTR [ebp-0x210],eax
  401a0c:	test   ecx,ecx
  401a0e:	js     0x4023ed
  401a14:	lea    eax,[edx-0x20]
  401a17:	cmp    al,0x58
  401a19:	ja     0x401a2a
  401a1b:	movsx  eax,dl
  401a1e:	movsx  eax,BYTE PTR [eax+0x40d168]
  401a25:	and    eax,0xf
  401a28:	jmp    0x401a2c
  401a2a:	xor    eax,eax
  401a2c:	mov    edi,DWORD PTR [ebp-0x244]
  401a32:	movsx  edi,BYTE PTR [edi+eax*8+0x40d188]
  401a3a:	mov    eax,edi
  401a3c:	mov    DWORD PTR [ebp-0x244],edi
  401a42:	mov    edi,DWORD PTR [ebp-0x21c]
  401a48:	sar    eax,0x4
  401a4b:	mov    DWORD PTR [ebp-0x244],eax
  401a51:	cmp    eax,0x7
  401a54:	ja     0x4023d1
  401a5a:	jmp    DWORD PTR [eax*4+0x402428]
  401a61:	xor    eax,eax
  401a63:	or     DWORD PTR [ebp-0x228],0xffffffff
  401a6a:	mov    ebx,eax
  401a6c:	mov    DWORD PTR [ebp-0x25c],eax
  401a72:	mov    DWORD PTR [ebp-0x24c],eax
  401a78:	mov    DWORD PTR [ebp-0x240],eax
  401a7e:	mov    DWORD PTR [ebp-0x234],eax
  401a84:	mov    DWORD PTR [ebp-0x218],ebx
  401a8a:	mov    DWORD PTR [ebp-0x238],eax
  401a90:	jmp    0x4023d1
  401a95:	movsx  eax,dl
  401a98:	sub    eax,0x20
  401a9b:	je     0x401ae3
  401a9d:	sub    eax,0x3
  401aa0:	je     0x401adb
  401aa2:	sub    eax,0x8
  401aa5:	je     0x401ad6
  401aa7:	dec    eax
  401aa8:	dec    eax
  401aa9:	je     0x401ac8
  401aab:	sub    eax,0x3
  401aae:	mov    eax,DWORD PTR [ebp-0x210]
  401ab4:	jne    0x4023d7
  401aba:	or     ebx,0x8
  401abd:	mov    DWORD PTR [ebp-0x218],ebx
  401ac3:	jmp    0x4023d7
  401ac8:	or     ebx,0x4
  401acb:	mov    DWORD PTR [ebp-0x218],ebx
  401ad1:	jmp    0x4023d1
  401ad6:	or     ebx,0x1
  401ad9:	jmp    0x401acb
  401adb:	or     ebx,0x80
  401ae1:	jmp    0x401acb
  401ae3:	or     ebx,0x2
  401ae6:	jmp    0x401acb
  401ae8:	cmp    dl,0x2a
  401aeb:	jne    0x401b1c
  401aed:	mov    eax,DWORD PTR [edi]
  401aef:	add    edi,0x4
  401af2:	mov    DWORD PTR [ebp-0x21c],edi
  401af8:	mov    DWORD PTR [ebp-0x240],eax
  401afe:	test   eax,eax
  401b00:	jns    0x4023d1
  401b06:	or     ebx,0x4
  401b09:	neg    eax
  401b0b:	mov    DWORD PTR [ebp-0x218],ebx
  401b11:	mov    DWORD PTR [ebp-0x240],eax
  401b17:	jmp    0x4023d1
  401b1c:	imul   ecx,DWORD PTR [ebp-0x240],0xa
  401b23:	movsx  eax,dl
  401b26:	add    ecx,0xffffffd0
  401b29:	add    eax,ecx
  401b2b:	mov    DWORD PTR [ebp-0x240],eax
  401b31:	jmp    0x4023cb
  401b36:	xor    eax,eax
  401b38:	mov    DWORD PTR [ebp-0x228],eax
  401b3e:	jmp    0x4023d1
  401b43:	cmp    dl,0x2a
  401b46:	jne    0x401b73
  401b48:	mov    eax,DWORD PTR [edi]
  401b4a:	add    edi,0x4
  401b4d:	mov    DWORD PTR [ebp-0x228],eax
  401b53:	test   eax,eax
  401b55:	mov    eax,DWORD PTR [ebp-0x210]
  401b5b:	mov    DWORD PTR [ebp-0x21c],edi
  401b61:	jns    0x4023d7
  401b67:	or     DWORD PTR [ebp-0x228],0xffffffff
  401b6e:	jmp    0x4023d7
  401b73:	imul   ecx,DWORD PTR [ebp-0x228],0xa
  401b7a:	movsx  eax,dl
  401b7d:	add    ecx,0xffffffd0
  401b80:	add    eax,ecx
  401b82:	mov    DWORD PTR [ebp-0x228],eax
  401b88:	jmp    0x4023cb
  401b8d:	cmp    dl,0x49
  401b90:	je     0x401bd7
  401b92:	cmp    dl,0x68
  401b95:	je     0x401bcf
  401b97:	mov    eax,DWORD PTR [ebp-0x210]
  401b9d:	cmp    dl,0x6c
  401ba0:	je     0x401bb6
  401ba2:	cmp    dl,0x77
  401ba5:	jne    0x4023d7
  401bab:	or     ebx,0x800
  401bb1:	jmp    0x401abd
  401bb6:	cmp    BYTE PTR [eax],0x6c
  401bb9:	jne    0x401bc7
  401bbb:	inc    eax
  401bbc:	or     ebx,0x1000
  401bc2:	jmp    0x401abd
  401bc7:	or     ebx,0x10
  401bca:	jmp    0x401abd
  401bcf:	or     ebx,0x20
  401bd2:	jmp    0x401acb
  401bd7:	mov    eax,DWORD PTR [ebp-0x210]
  401bdd:	mov    al,BYTE PTR [eax]
  401bdf:	cmp    al,0x36
  401be1:	jne    0x401bff
  401be3:	mov    edi,DWORD PTR [ebp-0x210]
  401be9:	cmp    BYTE PTR [edi+0x1],0x34
  401bed:	jne    0x401bff
  401bef:	mov    eax,edi
  401bf1:	add    eax,0x2
  401bf4:	or     ebx,0x8000
  401bfa:	jmp    0x401abd
  401bff:	cmp    al,0x33
  401c01:	jne    0x401c1f
  401c03:	mov    edi,DWORD PTR [ebp-0x210]
  401c09:	cmp    BYTE PTR [edi+0x1],0x32
  401c0d:	jne    0x401c1f
  401c0f:	mov    eax,edi
  401c11:	add    eax,0x2
  401c14:	and    ebx,0xffff7fff
  401c1a:	jmp    0x401abd
  401c1f:	cmp    al,0x64
  401c21:	je     0x4023d1
  401c27:	cmp    al,0x69
  401c29:	je     0x4023d1
  401c2f:	cmp    al,0x6f
  401c31:	je     0x4023d1
  401c37:	cmp    al,0x75
  401c39:	je     0x4023d1
  401c3f:	cmp    al,0x78
  401c41:	je     0x4023d1
  401c47:	cmp    al,0x58
  401c49:	je     0x4023d1
  401c4f:	xor    eax,eax
  401c51:	mov    DWORD PTR [ebp-0x244],eax
  401c57:	jmp    0x401c5b
  401c59:	xor    eax,eax
  401c5b:	mov    DWORD PTR [ebp-0x238],eax
  401c61:	lea    eax,[ebp-0x270]
  401c67:	push   eax
  401c68:	movzx  eax,dl
  401c6b:	push   eax
  401c6c:	call   0x405531
  401c71:	pop    ecx
  401c72:	pop    ecx
  401c73:	test   eax,eax
  401c75:	je     0x401caf
  401c77:	lea    eax,[ebp-0x220]
  401c7d:	push   eax
  401c7e:	push   DWORD PTR [ebp-0x230]
  401c84:	push   DWORD PTR [ebp-0x248]
  401c8a:	call   0x402448
  401c8f:	mov    ecx,DWORD PTR [ebp-0x210]
  401c95:	add    esp,0xc
  401c98:	mov    al,BYTE PTR [ecx]
  401c9a:	inc    ecx
  401c9b:	mov    BYTE PTR [ebp-0x248],al
  401ca1:	mov    DWORD PTR [ebp-0x210],ecx
  401ca7:	test   al,al
  401ca9:	je     0x402413
  401caf:	lea    eax,[ebp-0x220]
  401cb5:	push   eax
  401cb6:	push   DWORD PTR [ebp-0x230]
  401cbc:	push   DWORD PTR [ebp-0x248]
  401cc2:	call   0x402448
  401cc7:	add    esp,0xc
  401cca:	jmp    0x4023cb
  401ccf:	movsx  eax,dl
  401cd2:	cmp    eax,0x64
  401cd5:	jg     0x401ea8
  401cdb:	je     0x401f32
  401ce1:	cmp    eax,0x53
  401ce4:	jg     0x401dd7
  401cea:	je     0x401d68
  401cec:	sub    eax,0x41
  401cef:	je     0x401d01
  401cf1:	dec    eax
  401cf2:	dec    eax
  401cf3:	je     0x401d4b
  401cf5:	dec    eax
  401cf6:	dec    eax
  401cf7:	je     0x401d01
  401cf9:	dec    eax
  401cfa:	dec    eax
  401cfb:	jne    0x402219
  401d01:	add    dl,0x20
  401d04:	mov    DWORD PTR [ebp-0x25c],0x1
  401d0e:	mov    BYTE PTR [ebp-0x211],dl
  401d14:	mov    eax,DWORD PTR [ebp-0x228]
  401d1a:	lea    esi,[ebp-0x20c]
  401d20:	or     ebx,0x40
  401d23:	mov    ecx,0x200
  401d28:	mov    DWORD PTR [ebp-0x218],ebx
  401d2e:	mov    DWORD PTR [ebp-0x23c],ecx
  401d34:	test   eax,eax
  401d36:	jns    0x401f6e
  401d3c:	mov    DWORD PTR [ebp-0x228],0x6
  401d46:	jmp    0x401fcb
  401d4b:	test   ebx,0x830
  401d51:	jne    0x401df5
  401d57:	or     ebx,0x800
  401d5d:	mov    DWORD PTR [ebp-0x218],ebx
  401d63:	jmp    0x401df5
  401d68:	test   ebx,0x830
  401d6e:	jne    0x401d7c
  401d70:	or     ebx,0x800
  401d76:	mov    DWORD PTR [ebp-0x218],ebx
  401d7c:	mov    edx,DWORD PTR [ebp-0x228]
  401d82:	mov    ecx,0x7fffffff
  401d87:	cmp    edx,0xffffffff
  401d8a:	je     0x401d8e
  401d8c:	mov    ecx,edx
  401d8e:	mov    esi,DWORD PTR [edi]
  401d90:	add    edi,0x4
  401d93:	mov    DWORD PTR [ebp-0x21c],edi
  401d99:	test   ebx,0x810
  401d9f:	je     0x4021f8
  401da5:	test   esi,esi
  401da7:	jne    0x401daf
  401da9:	mov    esi,DWORD PTR ds:0x41200c
  401daf:	mov    DWORD PTR [ebp-0x238],0x1
  401db9:	mov    eax,esi
  401dbb:	test   ecx,ecx
  401dbd:	je     0x401dce
  401dbf:	xor    edx,edx
  401dc1:	dec    ecx
  401dc2:	cmp    WORD PTR [eax],dx
  401dc5:	je     0x401dce
  401dc7:	add    eax,0x2
  401dca:	test   ecx,ecx
  401dcc:	jne    0x401dc1
  401dce:	sub    eax,esi
  401dd0:	sar    eax,1
  401dd2:	jmp    0x402213
  401dd7:	sub    eax,0x58
  401dda:	je     0x402090
  401de0:	dec    eax
  401de1:	dec    eax
  401de2:	je     0x401e54
  401de4:	sub    eax,0x7
  401de7:	je     0x401d14
  401ded:	dec    eax
  401dee:	dec    eax
  401def:	jne    0x402219
  401df5:	add    edi,0x4
  401df8:	mov    DWORD PTR [ebp-0x21c],edi
  401dfe:	test   ebx,0x810
  401e04:	je     0x401e36
  401e06:	movzx  eax,WORD PTR [edi-0x4]
  401e0a:	push   eax
  401e0b:	push   0x200
  401e10:	lea    eax,[ebp-0x20c]
  401e16:	push   eax
  401e17:	lea    eax,[ebp-0x224]
  401e1d:	push   eax
  401e1e:	call   0x405744
  401e23:	add    esp,0x10
  401e26:	test   eax,eax
  401e28:	je     0x401e49
  401e2a:	mov    DWORD PTR [ebp-0x24c],0x1
  401e34:	jmp    0x401e49
  401e36:	mov    al,BYTE PTR [edi-0x4]
  401e39:	mov    BYTE PTR [ebp-0x20c],al
  401e3f:	mov    DWORD PTR [ebp-0x224],0x1
  401e49:	lea    esi,[ebp-0x20c]
  401e4f:	jmp    0x402219
  401e54:	mov    eax,DWORD PTR [edi]
  401e56:	add    edi,0x4
  401e59:	mov    DWORD PTR [ebp-0x21c],edi
  401e5f:	test   eax,eax
  401e61:	je     0x401e96
  401e63:	mov    esi,DWORD PTR [eax+0x4]
  401e66:	test   esi,esi
  401e68:	je     0x401e96
  401e6a:	movsx  eax,WORD PTR [eax]
  401e6d:	test   ebx,0x800
  401e73:	je     0x401e89
  401e75:	cdq
  401e76:	sub    eax,edx
  401e78:	mov    DWORD PTR [ebp-0x238],0x1
  401e82:	sar    eax,1
  401e84:	jmp    0x402213
  401e89:	xor    ecx,ecx
  401e8b:	mov    DWORD PTR [ebp-0x238],ecx
  401e91:	jmp    0x402213
  401e96:	mov    esi,DWORD PTR ds:0x412008
  401e9c:	push   esi
  401e9d:	call   0x405580
  401ea2:	pop    ecx
  401ea3:	jmp    0x402213
  401ea8:	cmp    eax,0x70
  401eab:	jg     0x402094
  401eb1:	je     0x402086
  401eb7:	cmp    eax,0x65
  401eba:	jl     0x402219
  401ec0:	cmp    eax,0x67
  401ec3:	jle    0x401d14
  401ec9:	cmp    eax,0x69
  401ecc:	je     0x401f32
  401ece:	cmp    eax,0x6e
  401ed1:	je     0x401ef8
  401ed3:	cmp    eax,0x6f
  401ed6:	jne    0x402219
  401edc:	mov    DWORD PTR [ebp-0x224],0x8
  401ee6:	test   bl,bl
  401ee8:	jns    0x401f45
  401eea:	or     ebx,0x200
  401ef0:	mov    DWORD PTR [ebp-0x218],ebx
  401ef6:	jmp    0x401f45
  401ef8:	add    edi,0x4
  401efb:	mov    DWORD PTR [ebp-0x21c],edi
  401f01:	mov    edi,DWORD PTR [edi-0x4]
  401f04:	call   0x40560b
  401f09:	test   eax,eax
  401f0b:	je     0x402413
  401f11:	mov    eax,DWORD PTR [ebp-0x220]
  401f17:	test   bl,0x20
  401f1a:	je     0x401f21
  401f1c:	mov    WORD PTR [edi],ax
  401f1f:	jmp    0x401f23
  401f21:	mov    DWORD PTR [edi],eax
  401f23:	mov    DWORD PTR [ebp-0x24c],0x1
  401f2d:	jmp    0x4023ac
  401f32:	or     ebx,0x40
  401f35:	mov    DWORD PTR [ebp-0x218],ebx
  401f3b:	mov    DWORD PTR [ebp-0x224],0xa
  401f45:	test   ebx,0x8000
  401f4b:	jne    0x401f59
  401f4d:	test   ebx,0x1000
  401f53:	je     0x4020e7
  401f59:	mov    ecx,DWORD PTR [edi]
  401f5b:	add    edi,0x8
  401f5e:	mov    DWORD PTR [ebp-0x21c],edi
  401f64:	xor    esi,esi
  401f66:	mov    edi,DWORD PTR [edi-0x4]
  401f69:	jmp    0x40211c
  401f6e:	jne    0x401f81
  401f70:	cmp    dl,0x67
  401f73:	jne    0x401fcb
  401f75:	mov    DWORD PTR [ebp-0x228],0x1
  401f7f:	jmp    0x401fcb
  401f81:	cmp    eax,ecx
  401f83:	jle    0x401f8d
  401f85:	mov    eax,ecx
  401f87:	mov    DWORD PTR [ebp-0x228],eax
  401f8d:	cmp    eax,0xa3
  401f92:	jle    0x401fcb
  401f94:	lea    edi,[eax+0x15d]
  401f9a:	push   edi
  401f9b:	call   0x4057df
  401fa0:	mov    dl,BYTE PTR [ebp-0x211]
  401fa6:	mov    DWORD PTR [ebp-0x250],eax
  401fac:	pop    ecx
  401fad:	test   eax,eax
  401faf:	je     0x401fbb
  401fb1:	mov    esi,eax
  401fb3:	mov    DWORD PTR [ebp-0x23c],edi
  401fb9:	jmp    0x401fc5
  401fbb:	mov    DWORD PTR [ebp-0x228],0xa3
  401fc5:	mov    edi,DWORD PTR [ebp-0x21c]
  401fcb:	mov    eax,DWORD PTR [edi]
  401fcd:	add    edi,0x8
  401fd0:	mov    DWORD PTR [ebp-0x278],eax
  401fd6:	mov    DWORD PTR [ebp-0x21c],edi
  401fdc:	mov    eax,DWORD PTR [edi-0x4]
  401fdf:	mov    DWORD PTR [ebp-0x274],eax
  401fe5:	lea    eax,[ebp-0x270]
  401feb:	push   eax
  401fec:	push   DWORD PTR [ebp-0x25c]
  401ff2:	movsx  eax,dl
  401ff5:	push   DWORD PTR [ebp-0x228]
  401ffb:	push   eax
  401ffc:	push   DWORD PTR [ebp-0x23c]
  402002:	lea    eax,[ebp-0x278]
  402008:	push   esi
  402009:	push   eax
  40200a:	push   DWORD PTR ds:0x412bb4
  402010:	call   DWORD PTR ds:0x40d024
  402016:	call   eax
  402018:	mov    edi,ebx
  40201a:	add    esp,0x1c
  40201d:	and    edi,0x80
  402023:	je     0x402046
  402025:	cmp    DWORD PTR [ebp-0x228],0x0
  40202c:	jne    0x402046
  40202e:	lea    eax,[ebp-0x270]
  402034:	push   eax
  402035:	push   esi
  402036:	push   DWORD PTR ds:0x412bc0
  40203c:	call   DWORD PTR ds:0x40d024
  402042:	call   eax
  402044:	pop    ecx
  402045:	pop    ecx
  402046:	cmp    BYTE PTR [ebp-0x211],0x67
  40204d:	jne    0x40206b
  40204f:	test   edi,edi
  402051:	jne    0x40206b
  402053:	lea    eax,[ebp-0x270]
  402059:	push   eax
  40205a:	push   esi
  40205b:	push   DWORD PTR ds:0x412bbc
  402061:	call   DWORD PTR ds:0x40d024
  402067:	call   eax
  402069:	pop    ecx
  40206a:	pop    ecx
  40206b:	cmp    BYTE PTR [esi],0x2d
  40206e:	jne    0x401e9c
  402074:	or     ebx,0x100
  40207a:	inc    esi
  40207b:	mov    DWORD PTR [ebp-0x218],ebx
  402081:	jmp    0x401e9c
  402086:	mov    DWORD PTR [ebp-0x228],0x8
  402090:	push   0x7
  402092:	jmp    0x4020b0
  402094:	sub    eax,0x73
  402097:	je     0x401d7c
  40209d:	dec    eax
  40209e:	dec    eax
  40209f:	je     0x401f3b
  4020a5:	sub    eax,0x3
  4020a8:	jne    0x402219
  4020ae:	push   0x27
  4020b0:	mov    DWORD PTR [ebp-0x224],0x10
  4020ba:	pop    eax
  4020bb:	mov    DWORD PTR [ebp-0x254],eax
  4020c1:	test   bl,bl
  4020c3:	jns    0x401f45
  4020c9:	add    al,0x51
  4020cb:	mov    BYTE PTR [ebp-0x22c],0x30
  4020d2:	mov    BYTE PTR [ebp-0x22b],al
  4020d8:	mov    DWORD PTR [ebp-0x234],0x2
  4020e2:	jmp    0x401f45
  4020e7:	add    edi,0x4
  4020ea:	xor    esi,esi
  4020ec:	mov    DWORD PTR [ebp-0x21c],edi
  4020f2:	test   bl,0x20
  4020f5:	je     0x402108
  4020f7:	test   bl,0x40
  4020fa:	je     0x402102
  4020fc:	movsx  eax,WORD PTR [edi-0x4]
  402100:	jmp    0x402110
  402102:	movzx  eax,WORD PTR [edi-0x4]
  402106:	jmp    0x402110
  402108:	test   bl,0x40
  40210b:	je     0x402117
  40210d:	mov    eax,DWORD PTR [edi-0x4]
  402110:	cdq
  402111:	mov    ecx,eax
  402113:	mov    edi,edx
  402115:	jmp    0x40211c
  402117:	mov    ecx,DWORD PTR [edi-0x4]
  40211a:	mov    edi,esi
  40211c:	test   bl,0x40
  40211f:	je     0x40213d
  402121:	cmp    edi,esi
  402123:	jg     0x40213d
  402125:	jl     0x40212b
  402127:	cmp    ecx,esi
  402129:	jae    0x40213d
  40212b:	neg    ecx
  40212d:	adc    edi,esi
  40212f:	neg    edi
  402131:	or     ebx,0x100
  402137:	mov    DWORD PTR [ebp-0x218],ebx
  40213d:	test   ebx,0x9000
  402143:	jne    0x402147
  402145:	mov    edi,esi
  402147:	mov    edx,DWORD PTR [ebp-0x228]
  40214d:	test   edx,edx
  40214f:	jns    0x402156
  402151:	xor    edx,edx
  402153:	inc    edx
  402154:	jmp    0x40216a
  402156:	and    ebx,0xfffffff7
  402159:	mov    eax,0x200
  40215e:	mov    DWORD PTR [ebp-0x218],ebx
  402164:	cmp    edx,eax
  402166:	jle    0x40216a
  402168:	mov    edx,eax
  40216a:	mov    eax,ecx
  40216c:	or     eax,edi
  40216e:	jne    0x402176
  402170:	mov    DWORD PTR [ebp-0x234],esi
  402176:	lea    esi,[ebp-0xd]
  402179:	mov    eax,edx
  40217b:	dec    edx
  40217c:	mov    DWORD PTR [ebp-0x228],edx
  402182:	test   eax,eax
  402184:	jg     0x40218c
  402186:	mov    eax,ecx
  402188:	or     eax,edi
  40218a:	je     0x4021c9
  40218c:	mov    eax,DWORD PTR [ebp-0x224]
  402192:	cdq
  402193:	push   edx
  402194:	push   eax
  402195:	push   edi
  402196:	push   ecx
  402197:	call   0x405870
  40219c:	add    ecx,0x30
  40219f:	mov    DWORD PTR [ebp-0x27c],ebx
  4021a5:	mov    DWORD PTR [ebp-0x23c],eax
  4021ab:	mov    edi,edx
  4021ad:	cmp    ecx,0x39
  4021b0:	jle    0x4021b8
  4021b2:	add    ecx,DWORD PTR [ebp-0x254]
  4021b8:	mov    edx,DWORD PTR [ebp-0x228]
  4021be:	mov    BYTE PTR [esi],cl
  4021c0:	dec    esi
  4021c1:	mov    ecx,DWORD PTR [ebp-0x23c]
  4021c7:	jmp    0x402179
  4021c9:	mov    ebx,DWORD PTR [ebp-0x218]
  4021cf:	lea    eax,[ebp-0xd]
  4021d2:	sub    eax,esi
  4021d4:	inc    esi
  4021d5:	mov    DWORD PTR [ebp-0x224],eax
  4021db:	test   ebx,0x200
  4021e1:	je     0x402219
  4021e3:	test   eax,eax
  4021e5:	je     0x4021ec
  4021e7:	cmp    BYTE PTR [esi],0x30
  4021ea:	je     0x402219
  4021ec:	dec    esi
  4021ed:	inc    DWORD PTR [ebp-0x224]
  4021f3:	mov    BYTE PTR [esi],0x30
  4021f6:	jmp    0x402219
  4021f8:	test   esi,esi
  4021fa:	jne    0x402202
  4021fc:	mov    esi,DWORD PTR ds:0x412008
  402202:	mov    eax,esi
  402204:	jmp    0x40220d
  402206:	dec    ecx
  402207:	cmp    BYTE PTR [eax],0x0
  40220a:	je     0x402211
  40220c:	inc    eax
  40220d:	test   ecx,ecx
  40220f:	jne    0x402206
  402211:	sub    eax,esi
  402213:	mov    DWORD PTR [ebp-0x224],eax
  402219:	cmp    DWORD PTR [ebp-0x24c],0x0
  402220:	jne    0x4023ac
  402226:	test   bl,0x40
  402229:	je     0x402260
  40222b:	test   ebx,0x100
  402231:	je     0x40223c
  402233:	mov    BYTE PTR [ebp-0x22c],0x2d
  40223a:	jmp    0x402256
  40223c:	test   bl,0x1
  40223f:	je     0x40224a
  402241:	mov    BYTE PTR [ebp-0x22c],0x2b
  402248:	jmp    0x402256
  40224a:	test   bl,0x2
  40224d:	je     0x402260
  40224f:	mov    BYTE PTR [ebp-0x22c],0x20
  402256:	mov    DWORD PTR [ebp-0x234],0x1
  402260:	mov    edi,DWORD PTR [ebp-0x240]
  402266:	sub    edi,DWORD PTR [ebp-0x224]
  40226c:	mov    eax,DWORD PTR [ebp-0x234]
  402272:	sub    edi,eax
  402274:	test   bl,0xc
  402277:	jne    0x402297
  402279:	lea    eax,[ebp-0x220]
  40227f:	push   eax
  402280:	push   DWORD PTR [ebp-0x230]
  402286:	push   edi
  402287:	push   0x20
  402289:	call   0x402490
  40228e:	mov    eax,DWORD PTR [ebp-0x234]
  402294:	add    esp,0x10
  402297:	push   DWORD PTR [ebp-0x258]
  40229d:	lea    ecx,[ebp-0x220]
  4022a3:	push   ecx
  4022a4:	push   DWORD PTR [ebp-0x230]
  4022aa:	push   eax
  4022ab:	lea    eax,[ebp-0x22c]
  4022b1:	push   eax
  4022b2:	call   0x4024bc
  4022b7:	add    esp,0x14
  4022ba:	test   bl,0x8
  4022bd:	je     0x4022dc
  4022bf:	test   bl,0x4
  4022c2:	jne    0x4022dc
  4022c4:	lea    eax,[ebp-0x220]
  4022ca:	push   eax
  4022cb:	push   DWORD PTR [ebp-0x230]
  4022d1:	push   edi
  4022d2:	push   0x30
  4022d4:	call   0x402490
  4022d9:	add    esp,0x10
  4022dc:	cmp    DWORD PTR [ebp-0x238],0x0
  4022e3:	mov    eax,DWORD PTR [ebp-0x224]
  4022e9:	je     0x402368
  4022eb:	test   eax,eax
  4022ed:	jle    0x402368
  4022ef:	mov    ecx,esi
  4022f1:	dec    eax
  4022f2:	mov    DWORD PTR [ebp-0x23c],eax
  4022f8:	movzx  eax,WORD PTR [ecx]
  4022fb:	add    ecx,0x2
  4022fe:	push   eax
  4022ff:	push   0x6
  402301:	lea    eax,[ebp-0xc]
  402304:	mov    DWORD PTR [ebp-0x27c],ecx
  40230a:	push   eax
  40230b:	lea    eax,[ebp-0x260]
  402311:	push   eax
  402312:	call   0x405744
  402317:	add    esp,0x10
  40231a:	test   eax,eax
  40231c:	jne    0x40235d
  40231e:	cmp    DWORD PTR [ebp-0x260],eax
  402324:	je     0x40235d
  402326:	push   DWORD PTR [ebp-0x258]
  40232c:	lea    eax,[ebp-0x220]
  402332:	push   eax
  402333:	push   DWORD PTR [ebp-0x230]
  402339:	lea    eax,[ebp-0xc]
  40233c:	push   DWORD PTR [ebp-0x260]
  402342:	push   eax
  402343:	call   0x4024bc
  402348:	mov    eax,DWORD PTR [ebp-0x23c]
  40234e:	add    esp,0x14
  402351:	mov    ecx,DWORD PTR [ebp-0x27c]
  402357:	test   eax,eax
  402359:	jne    0x4022f1
  40235b:	jmp    0x402385
  40235d:	or     ecx,0xffffffff
  402360:	mov    DWORD PTR [ebp-0x220],ecx
  402366:	jmp    0x40238b
  402368:	push   DWORD PTR [ebp-0x258]
  40236e:	lea    ecx,[ebp-0x220]
  402374:	push   ecx
  402375:	push   DWORD PTR [ebp-0x230]
  40237b:	push   eax
  40237c:	push   esi
  40237d:	call   0x4024bc
  402382:	add    esp,0x14
  402385:	mov    ecx,DWORD PTR [ebp-0x220]
  40238b:	test   ecx,ecx
  40238d:	js     0x4023b2
  40238f:	test   bl,0x4
  402392:	je     0x4023b2
  402394:	lea    eax,[ebp-0x220]
  40239a:	push   eax
  40239b:	push   DWORD PTR [ebp-0x230]
  4023a1:	push   edi
  4023a2:	push   0x20
  4023a4:	call   0x402490
  4023a9:	add    esp,0x10
  4023ac:	mov    ecx,DWORD PTR [ebp-0x220]
  4023b2:	mov    eax,DWORD PTR [ebp-0x250]
  4023b8:	test   eax,eax
  4023ba:	je     0x4023d1
  4023bc:	push   eax
  4023bd:	call   0x40575f
  4023c2:	xor    eax,eax
  4023c4:	pop    ecx
  4023c5:	mov    DWORD PTR [ebp-0x250],eax
  4023cb:	mov    ecx,DWORD PTR [ebp-0x220]
  4023d1:	mov    eax,DWORD PTR [ebp-0x210]
  4023d7:	mov    dl,BYTE PTR [eax]
  4023d9:	mov    BYTE PTR [ebp-0x211],dl
  4023df:	mov    BYTE PTR [ebp-0x248],dl
  4023e5:	test   dl,dl
  4023e7:	jne    0x401a05
  4023ed:	mov    eax,ecx
  4023ef:	cmp    BYTE PTR [ebp-0x264],0x0
  4023f6:	pop    edi
  4023f7:	pop    esi
  4023f8:	pop    ebx
  4023f9:	je     0x402405
  4023fb:	mov    ecx,DWORD PTR [ebp-0x268]
  402401:	and    DWORD PTR [ecx+0x70],0xfffffffd
  402405:	mov    ecx,DWORD PTR [ebp-0x4]
  402408:	xor    ecx,ebp
  40240a:	call   0x40120d
  40240f:	mov    esp,ebp
  402411:	pop    ebp
  402412:	ret
  402413:	call   0x402568
  402418:	mov    DWORD PTR [eax],0x16
  40241e:	call   0x4016b6
  402423:	or     eax,0xffffffff
  402426:	jmp    0x4023ef
  402428:	pop    ecx
  402429:	sbb    al,0x40
  40242b:	add    BYTE PTR [ecx+0x1a],ah
  40242e:	inc    eax
  40242f:	add    BYTE PTR [ebp-0x17ffbfe6],dl
  402435:	sbb    al,BYTE PTR [eax+0x0]
  402438:	sbb    eax,DWORD PTR ss:[eax+0x0]
  40243c:	inc    ebx
  40243d:	sbb    eax,DWORD PTR [eax+0x0]
  402440:	lea    ebx,[ebx]
  402442:	inc    eax
  402443:	add    bh,cl
  402445:	sbb    al,0x40
  402447:	add    BYTE PTR [ebp-0x75],dl
  40244a:	in     al,dx
  40244b:	mov    edx,DWORD PTR [ebp+0xc]
  40244e:	test   BYTE PTR [edx+0xc],0x40
  402452:	je     0x40245a
  402454:	cmp    DWORD PTR [edx+0x8],0x0
  402458:	je     0x402489
  40245a:	dec    DWORD PTR [edx+0x4]
  40245d:	js     0x40246d
  40245f:	mov    eax,DWORD PTR [edx]
  402461:	mov    cl,BYTE PTR [ebp+0x8]
  402464:	mov    BYTE PTR [eax],cl
  402466:	inc    DWORD PTR [edx]
  402468:	movzx  eax,cl
  40246b:	jmp    0x40247c
  40246d:	mov    eax,DWORD PTR [ebp+0x8]
  402470:	push   edx
  402471:	movsx  eax,al
  402474:	push   eax
  402475:	call   0x4016f1
  40247a:	pop    ecx
  40247b:	pop    ecx
  40247c:	cmp    eax,0xffffffff
  40247f:	jne    0x402489
  402481:	mov    eax,DWORD PTR [ebp+0x10]
  402484:	or     DWORD PTR [eax],0xffffffff
  402487:	pop    ebp
  402488:	ret
  402489:	mov    eax,DWORD PTR [ebp+0x10]
  40248c:	inc    DWORD PTR [eax]
  40248e:	pop    ebp
  40248f:	ret
  402490:	push   ebp
  402491:	mov    ebp,esp
  402493:	push   esi
  402494:	mov    esi,DWORD PTR [ebp+0xc]
  402497:	test   esi,esi
  402499:	jle    0x4024b9
  40249b:	push   edi
  40249c:	mov    edi,DWORD PTR [ebp+0x14]
  40249f:	push   edi
  4024a0:	push   DWORD PTR [ebp+0x10]
  4024a3:	dec    esi
  4024a4:	push   DWORD PTR [ebp+0x8]
  4024a7:	call   0x402448
  4024ac:	add    esp,0xc
  4024af:	cmp    DWORD PTR [edi],0xffffffff
  4024b2:	je     0x4024b8
  4024b4:	test   esi,esi
  4024b6:	jg     0x40249f
  4024b8:	pop    edi
  4024b9:	pop    esi
  4024ba:	pop    ebp
  4024bb:	ret
  4024bc:	push   ebp
  4024bd:	mov    ebp,esp
  4024bf:	push   esi
  4024c0:	mov    esi,DWORD PTR [ebp+0x18]
  4024c3:	push   edi
  4024c4:	mov    edi,DWORD PTR [ebp+0x10]
  4024c7:	mov    eax,DWORD PTR [esi]
  4024c9:	mov    DWORD PTR [ebp+0x18],eax
  4024cc:	test   BYTE PTR [edi+0xc],0x40
  4024d0:	je     0x4024e2
  4024d2:	cmp    DWORD PTR [edi+0x8],0x0
  4024d6:	jne    0x4024e2
  4024d8:	mov    ecx,DWORD PTR [ebp+0x14]
  4024db:	mov    eax,DWORD PTR [ebp+0xc]
  4024de:	add    DWORD PTR [ecx],eax
  4024e0:	jmp    0x402530
  4024e2:	and    DWORD PTR [esi],0x0
  4024e5:	push   ebx
  4024e6:	mov    ebx,DWORD PTR [ebp+0xc]
  4024e9:	test   ebx,ebx
  4024eb:	jle    0x40252d
  4024ed:	mov    eax,DWORD PTR [ebp+0x14]
  4024f0:	push   eax
  4024f1:	mov    eax,DWORD PTR [ebp+0x8]
  4024f4:	dec    ebx
  4024f5:	push   edi
  4024f6:	movzx  eax,BYTE PTR [eax]
  4024f9:	push   eax
  4024fa:	call   0x402448
  4024ff:	mov    eax,DWORD PTR [ebp+0x14]
  402502:	add    esp,0xc
  402505:	inc    DWORD PTR [ebp+0x8]
  402508:	cmp    DWORD PTR [eax],0xffffffff
  40250b:	jne    0x402521
  40250d:	cmp    DWORD PTR [esi],0x2a
  402510:	jne    0x402525
  402512:	push   eax
  402513:	push   edi
  402514:	push   0x3f
  402516:	call   0x402448
  40251b:	mov    eax,DWORD PTR [ebp+0x14]
  40251e:	add    esp,0xc
  402521:	test   ebx,ebx
  402523:	jg     0x4024f0
  402525:	cmp    DWORD PTR [esi],0x0
  402528:	jne    0x40252f
  40252a:	mov    eax,DWORD PTR [ebp+0x18]
  40252d:	mov    DWORD PTR [esi],eax
  40252f:	pop    ebx
  402530:	pop    edi
  402531:	pop    esi
  402532:	pop    ebp
  402533:	ret
  402534:	call   0x4028b3
  402539:	test   eax,eax
  40253b:	jne    0x402543
  40253d:	mov    eax,0x41217c
  402542:	ret
  402543:	add    eax,0xc
  402546:	ret
  402547:	push   ebp
  402548:	mov    ebp,esp
  40254a:	push   esi
  40254b:	call   0x402534
  402550:	mov    ecx,DWORD PTR [ebp+0x8]
  402553:	push   ecx
  402554:	mov    DWORD PTR [eax],ecx
  402556:	call   0x40257b
  40255b:	pop    ecx
  40255c:	mov    esi,eax
  40255e:	call   0x402568
  402563:	mov    DWORD PTR [eax],esi
  402565:	pop    esi
  402566:	pop    ebp
  402567:	ret
  402568:	call   0x4028b3
  40256d:	test   eax,eax
  40256f:	jne    0x402577
  402571:	mov    eax,0x412178
  402576:	ret
  402577:	add    eax,0x8
  40257a:	ret
  40257b:	push   ebp
  40257c:	mov    ebp,esp
  40257e:	mov    ecx,DWORD PTR [ebp+0x8]
  402581:	xor    eax,eax
  402583:	cmp    ecx,DWORD PTR [eax*8+0x412010]
  40258a:	je     0x4025b3
  40258c:	inc    eax
  40258d:	cmp    eax,0x2d
  402590:	jb     0x402583
  402592:	lea    eax,[ecx-0x13]
  402595:	cmp    eax,0x11
  402598:	ja     0x40259f
  40259a:	push   0xd
  40259c:	pop    eax
  40259d:	pop    ebp
  40259e:	ret
  40259f:	lea    eax,[ecx-0xbc]
  4025a5:	push   0xe
  4025a7:	pop    ecx
  4025a8:	cmp    ecx,eax
  4025aa:	sbb    eax,eax
  4025ac:	and    eax,ecx
  4025ae:	add    eax,0x8
  4025b1:	pop    ebp
  4025b2:	ret
  4025b3:	mov    eax,DWORD PTR [eax*8+0x412014]
  4025ba:	pop    ebp
  4025bb:	ret
  4025bc:	push   ebp
  4025bd:	mov    ebp,esp
  4025bf:	mov    eax,DWORD PTR [ebp+0x8]
  4025c2:	mov    eax,DWORD PTR [eax]
  4025c4:	cmp    DWORD PTR [eax],0xe06d7363
  4025ca:	jne    0x4025f1
  4025cc:	cmp    DWORD PTR [eax+0x10],0x3
  4025d0:	jne    0x4025f1
  4025d2:	mov    eax,DWORD PTR [eax+0x14]
  4025d5:	cmp    eax,0x19930520
  4025da:	je     0x4025f7
  4025dc:	cmp    eax,0x19930521
  4025e1:	je     0x4025f7
  4025e3:	cmp    eax,0x19930522
  4025e8:	je     0x4025f7
  4025ea:	cmp    eax,0x1994000
  4025ef:	je     0x4025f7
  4025f1:	xor    eax,eax
  4025f3:	pop    ebp
  4025f4:	ret    0x4
  4025f7:	call   0x405924
  4025fc:	int3
  4025fd:	push   0x4025bc
  402602:	call   0x403aac
  402607:	pop    ecx
  402608:	xor    eax,eax
  40260a:	ret
  40260b:	push   ebp
  40260c:	mov    ebp,esp
  40260e:	push   esi
  40260f:	call   0x4028b3
  402614:	mov    esi,eax
  402616:	test   esi,esi
  402618:	je     0x402763
  40261e:	mov    edx,DWORD PTR [esi+0x5c]
  402621:	mov    ecx,edx
  402623:	push   edi
  402624:	mov    edi,DWORD PTR [ebp+0x8]
  402627:	cmp    DWORD PTR [ecx],edi
  402629:	je     0x402638
  40262b:	add    ecx,0xc
  40262e:	lea    eax,[edx+0x90]
  402634:	cmp    ecx,eax
  402636:	jb     0x402627
  402638:	lea    eax,[edx+0x90]
  40263e:	cmp    ecx,eax
  402640:	jae    0x402646
  402642:	cmp    DWORD PTR [ecx],edi
  402644:	je     0x402648
  402646:	xor    ecx,ecx
  402648:	test   ecx,ecx
  40264a:	je     0x402760
  402650:	mov    edx,DWORD PTR [ecx+0x8]
  402653:	test   edx,edx
  402655:	je     0x402760
  40265b:	cmp    edx,0x5
  40265e:	jne    0x40266c
  402660:	and    DWORD PTR [ecx+0x8],0x0
  402664:	xor    eax,eax
  402666:	inc    eax
  402667:	jmp    0x402762
  40266c:	cmp    edx,0x1
  40266f:	jne    0x402679
  402671:	or     eax,0xffffffff
  402674:	jmp    0x402762
  402679:	mov    eax,DWORD PTR [ebp+0xc]
  40267c:	push   ebx
  40267d:	mov    ebx,DWORD PTR [esi+0x60]
  402680:	mov    DWORD PTR [esi+0x60],eax
  402683:	cmp    DWORD PTR [ecx+0x4],0x8
  402687:	jne    0x40274d
  40268d:	push   0x24
  40268f:	pop    edi
  402690:	mov    eax,DWORD PTR [esi+0x5c]
  402693:	and    DWORD PTR [edi+eax*1+0x8],0x0
  402698:	add    edi,0xc
  40269b:	cmp    edi,0x90
  4026a1:	jl     0x402690
  4026a3:	cmp    DWORD PTR [ecx],0xc000008e
  4026a9:	mov    edi,DWORD PTR [esi+0x64]
  4026ac:	jne    0x4026ba
  4026ae:	mov    DWORD PTR [esi+0x64],0x83
  4026b5:	jmp    0x402740
  4026ba:	cmp    DWORD PTR [ecx],0xc0000090
  4026c0:	jne    0x4026cb
  4026c2:	mov    DWORD PTR [esi+0x64],0x81
  4026c9:	jmp    0x402740
  4026cb:	cmp    DWORD PTR [ecx],0xc0000091
  4026d1:	jne    0x4026dc
  4026d3:	mov    DWORD PTR [esi+0x64],0x84
  4026da:	jmp    0x402740
  4026dc:	cmp    DWORD PTR [ecx],0xc0000093
  4026e2:	jne    0x4026ed
  4026e4:	mov    DWORD PTR [esi+0x64],0x85
  4026eb:	jmp    0x402740
  4026ed:	cmp    DWORD PTR [ecx],0xc000008d
  4026f3:	jne    0x4026fe
  4026f5:	mov    DWORD PTR [esi+0x64],0x82
  4026fc:	jmp    0x402740
  4026fe:	cmp    DWORD PTR [ecx],0xc000008f
  402704:	jne    0x40270f
  402706:	mov    DWORD PTR [esi+0x64],0x86
  40270d:	jmp    0x402740
  40270f:	cmp    DWORD PTR [ecx],0xc0000092
  402715:	jne    0x402720
  402717:	mov    DWORD PTR [esi+0x64],0x8a
  40271e:	jmp    0x402740
  402720:	cmp    DWORD PTR [ecx],0xc00002b5
  402726:	jne    0x402731
  402728:	mov    DWORD PTR [esi+0x64],0x8d
  40272f:	jmp    0x402740
  402731:	cmp    DWORD PTR [ecx],0xc00002b4
  402737:	jne    0x402740
  402739:	mov    DWORD PTR [esi+0x64],0x8e
  402740:	push   DWORD PTR [esi+0x64]
  402743:	push   0x8
  402745:	call   edx
  402747:	pop    ecx
  402748:	mov    DWORD PTR [esi+0x64],edi
  40274b:	jmp    0x402756
  40274d:	push   DWORD PTR [ecx+0x4]
  402750:	and    DWORD PTR [ecx+0x8],0x0
  402754:	call   edx
  402756:	pop    ecx
  402757:	mov    DWORD PTR [esi+0x60],ebx
  40275a:	or     eax,0xffffffff
  40275d:	pop    ebx
  40275e:	jmp    0x402762
  402760:	xor    eax,eax
  402762:	pop    edi
  402763:	pop    esi
  402764:	pop    ebp
  402765:	ret
  402766:	push   0x8
  402768:	push   0x410f00
  40276d:	call   0x403b60
  402772:	mov    esi,DWORD PTR [ebp+0x8]
  402775:	test   esi,esi
  402777:	je     0x40287b
  40277d:	cmp    DWORD PTR [esi+0x24],0x0
  402781:	je     0x40278c
  402783:	push   DWORD PTR [esi+0x24]
  402786:	call   0x40575f
  40278b:	pop    ecx
  40278c:	cmp    DWORD PTR [esi+0x2c],0x0
  402790:	je     0x40279b
  402792:	push   DWORD PTR [esi+0x2c]
  402795:	call   0x40575f
  40279a:	pop    ecx
  40279b:	cmp    DWORD PTR [esi+0x34],0x0
  40279f:	je     0x4027aa
  4027a1:	push   DWORD PTR [esi+0x34]
  4027a4:	call   0x40575f
  4027a9:	pop    ecx
  4027aa:	cmp    DWORD PTR [esi+0x3c],0x0
  4027ae:	je     0x4027b9
  4027b0:	push   DWORD PTR [esi+0x3c]
  4027b3:	call   0x40575f
  4027b8:	pop    ecx
  4027b9:	cmp    DWORD PTR [esi+0x40],0x0
  4027bd:	je     0x4027c8
  4027bf:	push   DWORD PTR [esi+0x40]
  4027c2:	call   0x40575f
  4027c7:	pop    ecx
  4027c8:	cmp    DWORD PTR [esi+0x44],0x0
  4027cc:	je     0x4027d7
  4027ce:	push   DWORD PTR [esi+0x44]
  4027d1:	call   0x40575f
  4027d6:	pop    ecx
  4027d7:	cmp    DWORD PTR [esi+0x48],0x0
  4027db:	je     0x4027e6
  4027dd:	push   DWORD PTR [esi+0x48]
  4027e0:	call   0x40575f
  4027e5:	pop    ecx
  4027e6:	cmp    DWORD PTR [esi+0x5c],0x40d1e8
  4027ed:	je     0x4027f8
  4027ef:	push   DWORD PTR [esi+0x5c]
  4027f2:	call   0x40575f
  4027f7:	pop    ecx
  4027f8:	push   0xd
  4027fa:	call   0x405969
  4027ff:	pop    ecx
  402800:	and    DWORD PTR [ebp-0x4],0x0
  402804:	mov    ecx,DWORD PTR [esi+0x68]
  402807:	test   ecx,ecx
  402809:	je     0x402823
  40280b:	or     eax,0xffffffff
  40280e:	lock xadd DWORD PTR [ecx],eax
  402812:	jne    0x402823
  402814:	cmp    ecx,0x412658
  40281a:	je     0x402823
  40281c:	push   ecx
  40281d:	call   0x40575f
  402822:	pop    ecx
  402823:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  40282a:	call   0x402886
  40282f:	push   0xc
  402831:	call   0x405969
  402836:	pop    ecx
  402837:	mov    DWORD PTR [ebp-0x4],0x1
  40283e:	mov    edi,DWORD PTR [esi+0x6c]
  402841:	test   edi,edi
  402843:	je     0x402868
  402845:	push   edi
  402846:	call   0x404cd6
  40284b:	pop    ecx
  40284c:	cmp    edi,DWORD PTR ds:0x412adc
  402852:	je     0x402868
  402854:	cmp    edi,0x412ae0
  40285a:	je     0x402868
  40285c:	cmp    DWORD PTR [edi],0x0
  40285f:	jne    0x402868
  402861:	push   edi
  402862:	call   0x404b7c
  402867:	pop    ecx
  402868:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  40286f:	call   0x402892
  402874:	push   esi
  402875:	call   0x40575f
  40287a:	pop    ecx
  40287b:	call   0x403ba5
  402880:	ret    0x4
  402883:	mov    esi,DWORD PTR [ebp+0x8]
  402886:	push   0xd
  402888:	call   0x405ad3
  40288d:	pop    ecx
  40288e:	ret
  40288f:	mov    esi,DWORD PTR [ebp+0x8]
  402892:	push   0xc
  402894:	call   0x405ad3
  402899:	pop    ecx
  40289a:	ret
  40289b:	push   esi
  40289c:	call   0x4028b3
  4028a1:	mov    esi,eax
  4028a3:	test   esi,esi
  4028a5:	jne    0x4028af
  4028a7:	push   0x10
  4028a9:	call   0x402ab2
  4028ae:	pop    ecx
  4028af:	mov    eax,esi
  4028b1:	pop    esi
  4028b2:	ret
  4028b3:	push   esi
  4028b4:	push   edi
  4028b5:	call   DWORD PTR ds:0x40d028
  4028bb:	push   DWORD PTR ds:0x412180
  4028c1:	mov    edi,eax
  4028c3:	call   0x40374f
  4028c8:	mov    esi,eax
  4028ca:	pop    ecx
  4028cb:	test   esi,esi
  4028cd:	jne    0x402916
  4028cf:	push   0x3bc
  4028d4:	push   0x1
  4028d6:	call   0x405797
  4028db:	mov    esi,eax
  4028dd:	pop    ecx
  4028de:	pop    ecx
  4028df:	test   esi,esi
  4028e1:	je     0x402916
  4028e3:	push   esi
  4028e4:	push   DWORD PTR ds:0x412180
  4028ea:	call   0x40376e
  4028ef:	pop    ecx
  4028f0:	pop    ecx
  4028f1:	test   eax,eax
  4028f3:	je     0x40290d
  4028f5:	push   0x0
  4028f7:	push   esi
  4028f8:	call   0x402922
  4028fd:	pop    ecx
  4028fe:	pop    ecx
  4028ff:	call   DWORD PTR ds:0x40d030
  402905:	or     DWORD PTR [esi+0x4],0xffffffff
  402909:	mov    DWORD PTR [esi],eax
  40290b:	jmp    0x402916
  40290d:	push   esi
  40290e:	call   0x40575f
  402913:	pop    ecx
  402914:	xor    esi,esi
  402916:	push   edi
  402917:	call   DWORD PTR ds:0x40d02c
  40291d:	pop    edi
  40291e:	mov    eax,esi
  402920:	pop    esi
  402921:	ret
  402922:	push   0x8
  402924:	push   0x410f28
  402929:	call   0x403b60
  40292e:	mov    esi,DWORD PTR [ebp+0x8]
  402931:	mov    DWORD PTR [esi+0x5c],0x40d1e8
  402938:	and    DWORD PTR [esi+0x8],0x0
  40293c:	xor    edi,edi
  40293e:	inc    edi
  40293f:	mov    DWORD PTR [esi+0x14],edi
  402942:	mov    DWORD PTR [esi+0x70],edi
  402945:	push   0x43
  402947:	pop    eax
  402948:	mov    WORD PTR [esi+0xb8],ax
  40294f:	mov    WORD PTR [esi+0x1be],ax
  402956:	mov    DWORD PTR [esi+0x68],0x412658
  40295d:	and    DWORD PTR [esi+0x3b8],0x0
  402964:	push   0xd
  402966:	call   0x405969
  40296b:	pop    ecx
  40296c:	and    DWORD PTR [ebp-0x4],0x0
  402970:	mov    eax,DWORD PTR [esi+0x68]
  402973:	mov    ecx,edi
  402975:	lock xadd DWORD PTR [eax],ecx
  402979:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402980:	call   0x4029c3
  402985:	push   0xc
  402987:	call   0x405969
  40298c:	pop    ecx
  40298d:	mov    DWORD PTR [ebp-0x4],edi
  402990:	mov    eax,DWORD PTR [ebp+0xc]
  402993:	mov    DWORD PTR [esi+0x6c],eax
  402996:	test   eax,eax
  402998:	jne    0x4029a2
  40299a:	mov    eax,ds:0x412adc
  40299f:	mov    DWORD PTR [esi+0x6c],eax
  4029a2:	push   DWORD PTR [esi+0x6c]
  4029a5:	call   0x404ae7
  4029aa:	pop    ecx
  4029ab:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4029b2:	call   0x4029cc
  4029b7:	call   0x403ba5
  4029bc:	ret
  4029bd:	xor    edi,edi
  4029bf:	inc    edi
  4029c0:	mov    esi,DWORD PTR [ebp+0x8]
  4029c3:	push   0xd
  4029c5:	call   0x405ad3
  4029ca:	pop    ecx
  4029cb:	ret
  4029cc:	push   0xc
  4029ce:	call   0x405ad3
  4029d3:	pop    ecx
  4029d4:	ret
  4029d5:	call   0x402b84
  4029da:	call   0x405a9a
  4029df:	test   eax,eax
  4029e1:	jne    0x4029eb
  4029e3:	call   0x402a4b
  4029e8:	xor    eax,eax
  4029ea:	ret
  4029eb:	push   0x402766
  4029f0:	call   0x403712
  4029f5:	mov    ds:0x412180,eax
  4029fa:	pop    ecx
  4029fb:	cmp    eax,0xffffffff
  4029fe:	je     0x4029e3
  402a00:	push   esi
  402a01:	push   0x3bc
  402a06:	push   0x1
  402a08:	call   0x405797
  402a0d:	mov    esi,eax
  402a0f:	pop    ecx
  402a10:	pop    ecx
  402a11:	test   esi,esi
  402a13:	je     0x402a42
  402a15:	push   esi
  402a16:	push   DWORD PTR ds:0x412180
  402a1c:	call   0x40376e
  402a21:	pop    ecx
  402a22:	pop    ecx
  402a23:	test   eax,eax
  402a25:	je     0x402a42
  402a27:	push   0x0
  402a29:	push   esi
  402a2a:	call   0x402922
  402a2f:	pop    ecx
  402a30:	pop    ecx
  402a31:	call   DWORD PTR ds:0x40d030
  402a37:	or     DWORD PTR [esi+0x4],0xffffffff
  402a3b:	mov    DWORD PTR [esi],eax
  402a3d:	xor    eax,eax
  402a3f:	inc    eax
  402a40:	pop    esi
  402a41:	ret
  402a42:	call   0x402a4b
  402a47:	xor    eax,eax
  402a49:	pop    esi
  402a4a:	ret
  402a4b:	mov    eax,ds:0x412180
  402a50:	cmp    eax,0xffffffff
  402a53:	je     0x402a63
  402a55:	push   eax
  402a56:	call   0x403730
  402a5b:	or     DWORD PTR ds:0x412180,0xffffffff
  402a62:	pop    ecx
  402a63:	jmp    0x40599d
  402a68:	push   ebp
  402a69:	mov    ebp,esp
  402a6b:	push   ecx
  402a6c:	lea    eax,[ebp-0x4]
  402a6f:	push   eax
  402a70:	push   0x40d288
  402a75:	push   0x0
  402a77:	call   DWORD PTR ds:0x40d038
  402a7d:	test   eax,eax
  402a7f:	je     0x402a98
  402a81:	push   0x40d2a0
  402a86:	push   DWORD PTR [ebp-0x4]
  402a89:	call   DWORD PTR ds:0x40d03c
  402a8f:	test   eax,eax
  402a91:	je     0x402a98
  402a93:	push   DWORD PTR [ebp+0x8]
  402a96:	call   eax
  402a98:	mov    esp,ebp
  402a9a:	pop    ebp
  402a9b:	ret
  402a9c:	push   ebp
  402a9d:	mov    ebp,esp
  402a9f:	push   DWORD PTR [ebp+0x8]
  402aa2:	call   0x402a68
  402aa7:	pop    ecx
  402aa8:	push   DWORD PTR [ebp+0x8]
  402aab:	call   DWORD PTR ds:0x40d034
  402ab1:	int3
  402ab2:	push   ebp
  402ab3:	mov    ebp,esp
  402ab5:	call   0x403342
  402aba:	push   DWORD PTR [ebp+0x8]
  402abd:	call   0x40339f
  402ac2:	pop    ecx
  402ac3:	push   0xff
  402ac8:	call   0x402b70
  402acd:	int3
  402ace:	push   0x1
  402ad0:	push   0x1
  402ad2:	push   0x0
  402ad4:	call   0x402c26
  402ad9:	add    esp,0xc
  402adc:	ret
  402add:	push   0x1
  402adf:	push   0x0
  402ae1:	push   0x0
  402ae3:	call   0x402c26
  402ae8:	add    esp,0xc
  402aeb:	ret
  402aec:	push   ebp
  402aed:	mov    ebp,esp
  402aef:	cmp    DWORD PTR ds:0x410d88,0x0
  402af6:	je     0x402b11
  402af8:	push   0x410d88
  402afd:	call   0x405b40
  402b02:	pop    ecx
  402b03:	test   eax,eax
  402b05:	je     0x402b11
  402b07:	push   DWORD PTR [ebp+0x8]
  402b0a:	call   DWORD PTR ds:0x410d88
  402b10:	pop    ecx
  402b11:	call   0x405905
  402b16:	push   0x40d144
  402b1b:	push   0x40d12c
  402b20:	call   0x402bf2
  402b25:	pop    ecx
  402b26:	pop    ecx
  402b27:	test   eax,eax
  402b29:	jne    0x402b6e
  402b2b:	push   0x403665
  402b30:	call   0x405d5c
  402b35:	mov    DWORD PTR [esp],0x40d128
  402b3c:	push   0x40d124
  402b41:	call   0x402bbc
  402b46:	cmp    DWORD PTR ds:0x414f48,0x0
  402b4d:	pop    ecx
  402b4e:	pop    ecx
  402b4f:	je     0x402b6c
  402b51:	push   0x414f48
  402b56:	call   0x405b40
  402b5b:	pop    ecx
  402b5c:	test   eax,eax
  402b5e:	je     0x402b6c
  402b60:	push   0x0
  402b62:	push   0x2
  402b64:	push   0x0
  402b66:	call   DWORD PTR ds:0x414f48
  402b6c:	xor    eax,eax
  402b6e:	pop    ebp
  402b6f:	ret
  402b70:	push   ebp
  402b71:	mov    ebp,esp
  402b73:	push   0x0
  402b75:	push   0x1
  402b77:	push   DWORD PTR [ebp+0x8]
  402b7a:	call   0x402c26
  402b7f:	add    esp,0xc
  402b82:	pop    ebp
  402b83:	ret
  402b84:	push   esi
  402b85:	push   0x0
  402b87:	call   DWORD PTR ds:0x40d020
  402b8d:	mov    esi,eax
  402b8f:	push   esi
  402b90:	call   0x405d97
  402b95:	push   esi
  402b96:	call   0x40167e
  402b9b:	push   esi
  402b9c:	call   0x405da4
  402ba1:	push   esi
  402ba2:	call   0x405dbe
  402ba7:	push   esi
  402ba8:	call   0x405958
  402bad:	push   esi
  402bae:	call   0x405fcf
  402bb3:	add    esp,0x18
  402bb6:	pop    esi
  402bb7:	jmp    0x403821
  402bbc:	push   ebp
  402bbd:	mov    ebp,esp
  402bbf:	mov    eax,DWORD PTR [ebp+0xc]
  402bc2:	push   ebx
  402bc3:	push   esi
  402bc4:	mov    esi,DWORD PTR [ebp+0x8]
  402bc7:	xor    ebx,ebx
  402bc9:	sub    eax,esi
  402bcb:	add    eax,0x3
  402bce:	shr    eax,0x2
  402bd1:	cmp    DWORD PTR [ebp+0xc],esi
  402bd4:	push   edi
  402bd5:	sbb    edi,edi
  402bd7:	not    edi
  402bd9:	and    edi,eax
  402bdb:	jbe    0x402bed
  402bdd:	mov    eax,DWORD PTR [esi]
  402bdf:	test   eax,eax
  402be1:	je     0x402be5
  402be3:	call   eax
  402be5:	add    esi,0x4
  402be8:	inc    ebx
  402be9:	cmp    ebx,edi
  402beb:	jb     0x402bdd
  402bed:	pop    edi
  402bee:	pop    esi
  402bef:	pop    ebx
  402bf0:	pop    ebp
  402bf1:	ret
  402bf2:	push   ebp
  402bf3:	mov    ebp,esp
  402bf5:	push   esi
  402bf6:	mov    esi,DWORD PTR [ebp+0x8]
  402bf9:	xor    eax,eax
  402bfb:	jmp    0x402c0c
  402bfd:	test   eax,eax
  402bff:	jne    0x402c11
  402c01:	mov    ecx,DWORD PTR [esi]
  402c03:	test   ecx,ecx
  402c05:	je     0x402c09
  402c07:	call   ecx
  402c09:	add    esi,0x4
  402c0c:	cmp    esi,DWORD PTR [ebp+0xc]
  402c0f:	jb     0x402bfd
  402c11:	pop    esi
  402c12:	pop    ebp
  402c13:	ret
  402c14:	push   0x8
  402c16:	call   0x405969
  402c1b:	pop    ecx
  402c1c:	ret
  402c1d:	push   0x8
  402c1f:	call   0x405ad3
  402c24:	pop    ecx
  402c25:	ret
  402c26:	push   0x1c
  402c28:	push   0x410f50
  402c2d:	call   0x403b60
  402c32:	push   0x8
  402c34:	call   0x405969
  402c39:	pop    ecx
  402c3a:	and    DWORD PTR [ebp-0x4],0x0
  402c3e:	cmp    DWORD PTR ds:0x41342c,0x1
  402c45:	je     0x402d14
  402c4b:	mov    DWORD PTR ds:0x413454,0x1
  402c55:	mov    al,BYTE PTR [ebp+0x10]
  402c58:	mov    ds:0x413450,al
  402c5d:	cmp    DWORD PTR [ebp+0xc],0x0
  402c61:	jne    0x402d03
  402c67:	push   DWORD PTR ds:0x414f50
  402c6d:	mov    esi,DWORD PTR ds:0x40d024
  402c73:	call   esi
  402c75:	mov    ebx,eax
  402c77:	mov    DWORD PTR [ebp-0x2c],ebx
  402c7a:	test   ebx,ebx
  402c7c:	je     0x402cf2
  402c7e:	push   DWORD PTR ds:0x414f4c
  402c84:	call   esi
  402c86:	mov    edi,eax
  402c88:	mov    DWORD PTR [ebp-0x1c],ebx
  402c8b:	mov    DWORD PTR [ebp-0x20],edi
  402c8e:	mov    DWORD PTR [ebp-0x24],edi
  402c91:	sub    edi,0x4
  402c94:	mov    DWORD PTR [ebp-0x24],edi
  402c97:	cmp    edi,ebx
  402c99:	jb     0x402cf2
  402c9b:	push   0x0
  402c9d:	call   DWORD PTR ds:0x40d020
  402ca3:	cmp    DWORD PTR [edi],eax
  402ca5:	je     0x402c91
  402ca7:	cmp    edi,ebx
  402ca9:	jb     0x402cf2
  402cab:	push   DWORD PTR [edi]
  402cad:	call   esi
  402caf:	mov    esi,eax
  402cb1:	push   0x0
  402cb3:	call   DWORD PTR ds:0x40d020
  402cb9:	mov    DWORD PTR [edi],eax
  402cbb:	call   esi
  402cbd:	push   DWORD PTR ds:0x414f50
  402cc3:	mov    esi,DWORD PTR ds:0x40d024
  402cc9:	call   esi
  402ccb:	mov    DWORD PTR [ebp-0x28],eax
  402cce:	push   DWORD PTR ds:0x414f4c
  402cd4:	call   esi
  402cd6:	mov    ecx,DWORD PTR [ebp-0x28]
  402cd9:	cmp    DWORD PTR [ebp-0x1c],ecx
  402cdc:	jne    0x402ce3
  402cde:	cmp    DWORD PTR [ebp-0x20],eax
  402ce1:	je     0x402c91
  402ce3:	mov    DWORD PTR [ebp-0x1c],ecx
  402ce6:	mov    ebx,ecx
  402ce8:	mov    DWORD PTR [ebp-0x2c],ebx
  402ceb:	mov    DWORD PTR [ebp-0x20],eax
  402cee:	mov    edi,eax
  402cf0:	jmp    0x402c8e
  402cf2:	push   0x40d158
  402cf7:	push   0x40d148
  402cfc:	call   0x402bbc
  402d01:	pop    ecx
  402d02:	pop    ecx
  402d03:	push   0x40d160
  402d08:	push   0x40d15c
  402d0d:	call   0x402bbc
  402d12:	pop    ecx
  402d13:	pop    ecx
  402d14:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  402d1b:	call   0x402d40
  402d20:	cmp    DWORD PTR [ebp+0x10],0x0
  402d24:	jne    0x402d4f
  402d26:	mov    DWORD PTR ds:0x41342c,0x1
  402d30:	push   0x8
  402d32:	call   0x405ad3
  402d37:	pop    ecx
  402d38:	push   DWORD PTR [ebp+0x8]
  402d3b:	call   0x402a9c
  402d40:	cmp    DWORD PTR [ebp+0x10],0x0
  402d44:	je     0x402d4e
  402d46:	push   0x8
  402d48:	call   0x405ad3
  402d4d:	pop    ecx
  402d4e:	ret
  402d4f:	call   0x403ba5
  402d54:	ret
  402d55:	push   ebp
  402d56:	mov    ebp,esp
  402d58:	push   0x0
  402d5a:	push   0x0
  402d5c:	push   DWORD PTR [ebp+0x8]
  402d5f:	call   0x402c26
  402d64:	add    esp,0xc
  402d67:	pop    ebp
  402d68:	ret
  402d69:	call   DWORD PTR ds:0x40d048
  402d6f:	xor    ecx,ecx
  402d71:	mov    ds:0x413460,eax
  402d76:	test   eax,eax
  402d78:	setne  cl
  402d7b:	mov    eax,ecx
  402d7d:	ret
  402d7e:	push   0x64
  402d80:	push   0x410f70
  402d85:	call   0x403b60
  402d8a:	push   0xb
  402d8c:	call   0x405969
  402d91:	pop    ecx
  402d92:	xor    ebx,ebx
  402d94:	mov    DWORD PTR [ebp-0x4],ebx
  402d97:	push   0x40
  402d99:	push   0x20
  402d9b:	pop    edi
  402d9c:	push   edi
  402d9d:	call   0x405797
  402da2:	pop    ecx
  402da3:	pop    ecx
  402da4:	mov    ecx,eax
  402da6:	mov    DWORD PTR [ebp-0x24],ecx
  402da9:	test   ecx,ecx
  402dab:	jne    0x402dc8
  402dad:	push   0xfffffffe
  402daf:	lea    eax,[ebp-0x10]
  402db2:	push   eax
  402db3:	push   0x412000
  402db8:	call   0x405fe0
  402dbd:	add    esp,0xc
  402dc0:	or     eax,0xffffffff
  402dc3:	jmp    0x403023
  402dc8:	mov    ds:0x413468,eax
  402dcd:	mov    DWORD PTR ds:0x414f44,edi
  402dd3:	add    eax,0x800
  402dd8:	cmp    ecx,eax
  402dda:	jae    0x402e0d
  402ddc:	mov    WORD PTR [ecx+0x4],0xa00
  402de2:	or     DWORD PTR [ecx],0xffffffff
  402de5:	mov    DWORD PTR [ecx+0x8],ebx
  402de8:	and    BYTE PTR [ecx+0x24],0x80
  402dec:	mov    al,BYTE PTR [ecx+0x24]
  402def:	and    al,0x7f
  402df1:	mov    BYTE PTR [ecx+0x24],al
  402df4:	mov    WORD PTR [ecx+0x25],0xa0a
  402dfa:	mov    DWORD PTR [ecx+0x38],ebx
  402dfd:	mov    BYTE PTR [ecx+0x34],bl
  402e00:	add    ecx,0x40
  402e03:	mov    DWORD PTR [ebp-0x24],ecx
  402e06:	mov    eax,ds:0x413468
  402e0b:	jmp    0x402dd3
  402e0d:	lea    eax,[ebp-0x74]
  402e10:	push   eax
  402e11:	call   DWORD PTR ds:0x40d058
  402e17:	cmp    WORD PTR [ebp-0x42],0x0
  402e1c:	je     0x402f51
  402e22:	mov    eax,DWORD PTR [ebp-0x40]
  402e25:	test   eax,eax
  402e27:	je     0x402f51
  402e2d:	mov    ecx,DWORD PTR [eax]
  402e2f:	mov    DWORD PTR [ebp-0x1c],ecx
  402e32:	add    eax,0x4
  402e35:	mov    DWORD PTR [ebp-0x28],eax
  402e38:	add    eax,ecx
  402e3a:	mov    DWORD PTR [ebp-0x20],eax
  402e3d:	mov    eax,0x800
  402e42:	cmp    ecx,eax
  402e44:	jl     0x402e4b
  402e46:	mov    ecx,eax
  402e48:	mov    DWORD PTR [ebp-0x1c],ecx
  402e4b:	xor    esi,esi
  402e4d:	inc    esi
  402e4e:	mov    DWORD PTR [ebp-0x30],esi
  402e51:	cmp    DWORD PTR ds:0x414f44,ecx
  402e57:	jge    0x402e79
  402e59:	push   0x40
  402e5b:	push   edi
  402e5c:	call   0x405797
  402e61:	pop    ecx
  402e62:	pop    ecx
  402e63:	mov    ecx,eax
  402e65:	mov    DWORD PTR [ebp-0x24],ecx
  402e68:	test   ecx,ecx
  402e6a:	jne    0x402f04
  402e70:	mov    ecx,DWORD PTR ds:0x414f44
  402e76:	mov    DWORD PTR [ebp-0x1c],ecx
  402e79:	mov    edi,ebx
  402e7b:	mov    DWORD PTR [ebp-0x2c],edi
  402e7e:	push   0xfffffffe
  402e80:	pop    ebx
  402e81:	mov    eax,DWORD PTR [ebp-0x28]
  402e84:	mov    edx,DWORD PTR [ebp-0x20]
  402e87:	cmp    edi,ecx
  402e89:	jge    0x402f54
  402e8f:	mov    esi,DWORD PTR [edx]
  402e91:	cmp    esi,0xffffffff
  402e94:	je     0x402ef1
  402e96:	cmp    esi,ebx
  402e98:	je     0x402ef1
  402e9a:	mov    al,BYTE PTR [eax]
  402e9c:	test   al,0x1
  402e9e:	je     0x402ef1
  402ea0:	test   al,0x8
  402ea2:	jne    0x402eb2
  402ea4:	push   esi
  402ea5:	call   DWORD PTR ds:0x40d050
  402eab:	mov    edx,DWORD PTR [ebp-0x20]
  402eae:	test   eax,eax
  402eb0:	je     0x402eee
  402eb2:	mov    eax,edi
  402eb4:	sar    eax,0x5
  402eb7:	mov    esi,edi
  402eb9:	and    esi,0x1f
  402ebc:	shl    esi,0x6
  402ebf:	add    esi,DWORD PTR [eax*4+0x413468]
  402ec6:	mov    DWORD PTR [ebp-0x24],esi
  402ec9:	mov    eax,DWORD PTR [edx]
  402ecb:	mov    DWORD PTR [esi],eax
  402ecd:	mov    eax,DWORD PTR [ebp-0x28]
  402ed0:	mov    al,BYTE PTR [eax]
  402ed2:	mov    BYTE PTR [esi+0x4],al
  402ed5:	push   0x0
  402ed7:	push   0xfa0
  402edc:	lea    eax,[esi+0xc]
  402edf:	push   eax
  402ee0:	call   0x4037b3
  402ee5:	add    esp,0xc
  402ee8:	inc    DWORD PTR [esi+0x8]
  402eeb:	mov    edx,DWORD PTR [ebp-0x20]
  402eee:	mov    ecx,DWORD PTR [ebp-0x1c]
  402ef1:	inc    edi
  402ef2:	mov    DWORD PTR [ebp-0x2c],edi
  402ef5:	mov    eax,DWORD PTR [ebp-0x28]
  402ef8:	inc    eax
  402ef9:	mov    DWORD PTR [ebp-0x28],eax
  402efc:	add    edx,0x4
  402eff:	mov    DWORD PTR [ebp-0x20],edx
  402f02:	jmp    0x402e87
  402f04:	mov    DWORD PTR [esi*4+0x413468],ecx
  402f0b:	add    DWORD PTR ds:0x414f44,edi
  402f11:	mov    eax,DWORD PTR [esi*4+0x413468]
  402f18:	add    eax,0x800
  402f1d:	cmp    ecx,eax
  402f1f:	jae    0x402f45
  402f21:	mov    WORD PTR [ecx+0x4],0xa00
  402f27:	or     DWORD PTR [ecx],0xffffffff
  402f2a:	mov    DWORD PTR [ecx+0x8],ebx
  402f2d:	and    BYTE PTR [ecx+0x24],0x80
  402f31:	mov    WORD PTR [ecx+0x25],0xa0a
  402f37:	mov    DWORD PTR [ecx+0x38],ebx
  402f3a:	mov    BYTE PTR [ecx+0x34],bl
  402f3d:	add    ecx,0x40
  402f40:	mov    DWORD PTR [ebp-0x24],ecx
  402f43:	jmp    0x402f11
  402f45:	inc    esi
  402f46:	mov    DWORD PTR [ebp-0x30],esi
  402f49:	mov    ecx,DWORD PTR [ebp-0x1c]
  402f4c:	jmp    0x402e51
  402f51:	push   0xfffffffe
  402f53:	pop    ebx
  402f54:	xor    edi,edi
  402f56:	mov    DWORD PTR [ebp-0x2c],edi
  402f59:	cmp    edi,0x3
  402f5c:	jge    0x403019
  402f62:	mov    esi,edi
  402f64:	shl    esi,0x6
  402f67:	add    esi,DWORD PTR ds:0x413468
  402f6d:	mov    DWORD PTR [ebp-0x24],esi
  402f70:	cmp    DWORD PTR [esi],0xffffffff
  402f73:	je     0x402f87
  402f75:	cmp    DWORD PTR [esi],ebx
  402f77:	je     0x402f87
  402f79:	movsx  eax,BYTE PTR [esi+0x4]
  402f7d:	or     al,0x80
  402f7f:	mov    BYTE PTR [esi+0x4],al
  402f82:	jmp    0x403013
  402f87:	mov    BYTE PTR [esi+0x4],0x81
  402f8b:	test   edi,edi
  402f8d:	jne    0x402f94
  402f8f:	push   0xfffffff6
  402f91:	pop    eax
  402f92:	jmp    0x402f9e
  402f94:	lea    eax,[edi-0x1]
  402f97:	neg    eax
  402f99:	sbb    eax,eax
  402f9b:	add    eax,0xfffffff5
  402f9e:	push   eax
  402f9f:	call   DWORD PTR ds:0x40d04c
  402fa5:	mov    DWORD PTR [ebp-0x1c],eax
  402fa8:	cmp    eax,0xffffffff
  402fab:	je     0x402ff9
  402fad:	test   eax,eax
  402faf:	je     0x402ff9
  402fb1:	push   eax
  402fb2:	call   DWORD PTR ds:0x40d050
  402fb8:	test   eax,eax
  402fba:	je     0x402ff9
  402fbc:	mov    ecx,DWORD PTR [ebp-0x1c]
  402fbf:	mov    DWORD PTR [esi],ecx
  402fc1:	and    eax,0xff
  402fc6:	cmp    eax,0x2
  402fc9:	jne    0x402fd3
  402fcb:	movsx  eax,BYTE PTR [esi+0x4]
  402fcf:	or     al,0x40
  402fd1:	jmp    0x402fde
  402fd3:	cmp    eax,0x3
  402fd6:	jne    0x402fe1
  402fd8:	movsx  eax,BYTE PTR [esi+0x4]
  402fdc:	or     al,0x8
  402fde:	mov    BYTE PTR [esi+0x4],al
  402fe1:	push   0x0
  402fe3:	push   0xfa0
  402fe8:	lea    eax,[esi+0xc]
  402feb:	push   eax
  402fec:	call   0x4037b3
  402ff1:	add    esp,0xc
  402ff4:	inc    DWORD PTR [esi+0x8]
  402ff7:	jmp    0x403013
  402ff9:	movsx  eax,BYTE PTR [esi+0x4]
  402ffd:	or     al,0x40
  402fff:	mov    BYTE PTR [esi+0x4],al
  403002:	mov    DWORD PTR [esi],ebx
  403004:	mov    eax,ds:0x414ea0
  403009:	test   eax,eax
  40300b:	je     0x403013
  40300d:	mov    eax,DWORD PTR [eax+edi*4]
  403010:	mov    DWORD PTR [eax+0x10],ebx
  403013:	inc    edi
  403014:	jmp    0x402f56
  403019:	mov    DWORD PTR [ebp-0x4],ebx
  40301c:	call   0x403029
  403021:	xor    eax,eax
  403023:	call   0x403ba5
  403028:	ret
  403029:	push   0xb
  40302b:	call   0x405ad3
  403030:	pop    ecx
  403031:	ret
  403032:	push   ebp
  403033:	mov    ebp,esp
  403035:	push   ecx
  403036:	push   ecx
  403037:	cmp    DWORD PTR ds:0x414f54,0x0
  40303e:	jne    0x403045
  403040:	call   0x404e41
  403045:	push   ebx
  403046:	push   esi
  403047:	push   edi
  403048:	push   0x104
  40304d:	mov    edi,0x413568
  403052:	xor    ebx,ebx
  403054:	push   edi
  403055:	push   ebx
  403056:	mov    BYTE PTR ds:0x41366c,bl
  40305c:	call   DWORD PTR ds:0x40d05c
  403062:	mov    esi,DWORD PTR ds:0x414f5c
  403068:	mov    DWORD PTR ds:0x413444,edi
  40306e:	test   esi,esi
  403070:	je     0x403076
  403072:	cmp    BYTE PTR [esi],bl
  403074:	jne    0x403078
  403076:	mov    esi,edi
  403078:	lea    eax,[ebp-0x8]
  40307b:	push   eax
  40307c:	lea    eax,[ebp-0x4]
  40307f:	push   eax
  403080:	push   ebx
  403081:	push   ebx
  403082:	push   esi
  403083:	call   0x4030e5
  403088:	mov    ebx,DWORD PTR [ebp-0x4]
  40308b:	add    esp,0x14
  40308e:	cmp    ebx,0x3fffffff
  403094:	jae    0x4030db
  403096:	mov    ecx,DWORD PTR [ebp-0x8]
  403099:	cmp    ecx,0xffffffff
  40309c:	jae    0x4030db
  40309e:	lea    edx,[ecx+ebx*4]
  4030a1:	cmp    edx,ecx
  4030a3:	jb     0x4030db
  4030a5:	push   edx
  4030a6:	call   0x4057df
  4030ab:	mov    edi,eax
  4030ad:	pop    ecx
  4030ae:	test   edi,edi
  4030b0:	je     0x4030db
  4030b2:	lea    eax,[ebp-0x8]
  4030b5:	push   eax
  4030b6:	lea    eax,[ebp-0x4]
  4030b9:	push   eax
  4030ba:	lea    eax,[edi+ebx*4]
  4030bd:	push   eax
  4030be:	push   edi
  4030bf:	push   esi
  4030c0:	call   0x4030e5
  4030c5:	mov    eax,DWORD PTR [ebp-0x4]
  4030c8:	add    esp,0x14
  4030cb:	dec    eax
  4030cc:	mov    DWORD PTR ds:0x413434,edi
  4030d2:	mov    ds:0x413430,eax
  4030d7:	xor    eax,eax
  4030d9:	jmp    0x4030de
  4030db:	or     eax,0xffffffff
  4030de:	pop    edi
  4030df:	pop    esi
  4030e0:	pop    ebx
  4030e1:	mov    esp,ebp
  4030e3:	pop    ebp
  4030e4:	ret
  4030e5:	push   ebp
  4030e6:	mov    ebp,esp
  4030e8:	mov    eax,DWORD PTR [ebp+0x14]
  4030eb:	push   ebx
  4030ec:	mov    ebx,DWORD PTR [ebp+0x18]
  4030ef:	push   esi
  4030f0:	mov    esi,DWORD PTR [ebp+0x8]
  4030f3:	push   edi
  4030f4:	and    DWORD PTR [ebx],0x0
  4030f7:	mov    edi,DWORD PTR [ebp+0x10]
  4030fa:	mov    DWORD PTR [eax],0x1
  403100:	mov    eax,DWORD PTR [ebp+0xc]
  403103:	test   eax,eax
  403105:	je     0x40310f
  403107:	mov    DWORD PTR [eax],edi
  403109:	add    eax,0x4
  40310c:	mov    DWORD PTR [ebp+0xc],eax
  40310f:	xor    ecx,ecx
  403111:	mov    DWORD PTR [ebp+0x8],ecx
  403114:	cmp    BYTE PTR [esi],0x22
  403117:	jne    0x40312a
  403119:	xor    eax,eax
  40311b:	test   ecx,ecx
  40311d:	sete   al
  403120:	inc    esi
  403121:	mov    ecx,eax
  403123:	mov    al,0x22
  403125:	mov    DWORD PTR [ebp+0x8],ecx
  403128:	jmp    0x40315f
  40312a:	inc    DWORD PTR [ebx]
  40312c:	test   edi,edi
  40312e:	je     0x403135
  403130:	mov    al,BYTE PTR [esi]
  403132:	mov    BYTE PTR [edi],al
  403134:	inc    edi
  403135:	mov    al,BYTE PTR [esi]
  403137:	inc    esi
  403138:	mov    BYTE PTR [ebp+0x1b],al
  40313b:	movzx  eax,al
  40313e:	push   eax
  40313f:	call   0x40618c
  403144:	pop    ecx
  403145:	test   eax,eax
  403147:	je     0x403155
  403149:	inc    DWORD PTR [ebx]
  40314b:	test   edi,edi
  40314d:	je     0x403154
  40314f:	mov    al,BYTE PTR [esi]
  403151:	mov    BYTE PTR [edi],al
  403153:	inc    edi
  403154:	inc    esi
  403155:	mov    al,BYTE PTR [ebp+0x1b]
  403158:	test   al,al
  40315a:	je     0x403175
  40315c:	mov    ecx,DWORD PTR [ebp+0x8]
  40315f:	test   ecx,ecx
  403161:	jne    0x403114
  403163:	cmp    al,0x20
  403165:	je     0x40316b
  403167:	cmp    al,0x9
  403169:	jne    0x403114
  40316b:	test   edi,edi
  40316d:	je     0x403176
  40316f:	mov    BYTE PTR [edi-0x1],0x0
  403173:	jmp    0x403176
  403175:	dec    esi
  403176:	and    DWORD PTR [ebp+0x18],0x0
  40317a:	cmp    BYTE PTR [esi],0x0
  40317d:	je     0x40324d
  403183:	mov    al,BYTE PTR [esi]
  403185:	cmp    al,0x20
  403187:	je     0x40318d
  403189:	cmp    al,0x9
  40318b:	jne    0x403190
  40318d:	inc    esi
  40318e:	jmp    0x403183
  403190:	cmp    BYTE PTR [esi],0x0
  403193:	je     0x40324d
  403199:	mov    edx,DWORD PTR [ebp+0xc]
  40319c:	test   edx,edx
  40319e:	je     0x4031a8
  4031a0:	mov    DWORD PTR [edx],edi
  4031a2:	add    edx,0x4
  4031a5:	mov    DWORD PTR [ebp+0xc],edx
  4031a8:	mov    eax,DWORD PTR [ebp+0x14]
  4031ab:	inc    DWORD PTR [eax]
  4031ad:	xor    edx,edx
  4031af:	inc    edx
  4031b0:	xor    ecx,ecx
  4031b2:	jmp    0x4031b6
  4031b4:	inc    esi
  4031b5:	inc    ecx
  4031b6:	cmp    BYTE PTR [esi],0x5c
  4031b9:	je     0x4031b4
  4031bb:	cmp    BYTE PTR [esi],0x22
  4031be:	jne    0x4031f3
  4031c0:	test   cl,0x1
  4031c3:	jne    0x4031e4
  4031c5:	cmp    DWORD PTR [ebp+0x18],0x0
  4031c9:	je     0x4031d7
  4031cb:	lea    eax,[esi+0x1]
  4031ce:	cmp    BYTE PTR [eax],0x22
  4031d1:	jne    0x4031d7
  4031d3:	mov    esi,eax
  4031d5:	jmp    0x4031e4
  4031d7:	xor    eax,eax
  4031d9:	xor    edx,edx
  4031db:	cmp    DWORD PTR [ebp+0x18],eax
  4031de:	sete   al
  4031e1:	mov    DWORD PTR [ebp+0x18],eax
  4031e4:	shr    ecx,1
  4031e6:	jmp    0x4031f3
  4031e8:	dec    ecx
  4031e9:	test   edi,edi
  4031eb:	je     0x4031f1
  4031ed:	mov    BYTE PTR [edi],0x5c
  4031f0:	inc    edi
  4031f1:	inc    DWORD PTR [ebx]
  4031f3:	test   ecx,ecx
  4031f5:	jne    0x4031e8
  4031f7:	mov    al,BYTE PTR [esi]
  4031f9:	test   al,al
  4031fb:	je     0x40323e
  4031fd:	cmp    DWORD PTR [ebp+0x18],ecx
  403200:	jne    0x40320a
  403202:	cmp    al,0x20
  403204:	je     0x40323e
  403206:	cmp    al,0x9
  403208:	je     0x40323e
  40320a:	test   edx,edx
  40320c:	je     0x403238
  40320e:	movsx  eax,al
  403211:	push   eax
  403212:	call   0x40618c
  403217:	pop    ecx
  403218:	test   edi,edi
  40321a:	je     0x40322f
  40321c:	test   eax,eax
  40321e:	je     0x403228
  403220:	mov    al,BYTE PTR [esi]
  403222:	mov    BYTE PTR [edi],al
  403224:	inc    edi
  403225:	inc    esi
  403226:	inc    DWORD PTR [ebx]
  403228:	mov    al,BYTE PTR [esi]
  40322a:	mov    BYTE PTR [edi],al
  40322c:	inc    edi
  40322d:	jmp    0x403236
  40322f:	test   eax,eax
  403231:	je     0x403236
  403233:	inc    esi
  403234:	inc    DWORD PTR [ebx]
  403236:	inc    DWORD PTR [ebx]
  403238:	inc    esi
  403239:	jmp    0x4031ad
  40323e:	test   edi,edi
  403240:	je     0x403246
  403242:	mov    BYTE PTR [edi],0x0
  403245:	inc    edi
  403246:	inc    DWORD PTR [ebx]
  403248:	jmp    0x40317a
  40324d:	mov    edx,DWORD PTR [ebp+0xc]
  403250:	pop    edi
  403251:	pop    esi
  403252:	pop    ebx
  403253:	test   edx,edx
  403255:	je     0x40325a
  403257:	and    DWORD PTR [edx],0x0
  40325a:	mov    eax,DWORD PTR [ebp+0x14]
  40325d:	inc    DWORD PTR [eax]
  40325f:	pop    ebp
  403260:	ret
  403261:	cmp    DWORD PTR ds:0x414f54,0x0
  403268:	jne    0x40326f
  40326a:	call   0x404e41
  40326f:	push   esi
  403270:	mov    esi,DWORD PTR ds:0x413100
  403276:	push   edi
  403277:	xor    edi,edi
  403279:	test   esi,esi
  40327b:	jne    0x403294
  40327d:	or     eax,0xffffffff
  403280:	jmp    0x40331b
  403285:	cmp    al,0x3d
  403287:	je     0x40328a
  403289:	inc    edi
  40328a:	push   esi
  40328b:	call   0x405580
  403290:	inc    esi
  403291:	pop    ecx
  403292:	add    esi,eax
  403294:	mov    al,BYTE PTR [esi]
  403296:	test   al,al
  403298:	jne    0x403285
  40329a:	lea    eax,[edi+0x1]
  40329d:	push   0x4
  40329f:	push   eax
  4032a0:	call   0x405797
  4032a5:	mov    edi,eax
  4032a7:	mov    DWORD PTR ds:0x41343c,edi
  4032ad:	pop    ecx
  4032ae:	pop    ecx
  4032af:	test   edi,edi
  4032b1:	je     0x40327d
  4032b3:	mov    esi,DWORD PTR ds:0x413100
  4032b9:	push   ebx
  4032ba:	cmp    BYTE PTR [esi],0x0
  4032bd:	je     0x4032fd
  4032bf:	push   esi
  4032c0:	call   0x405580
  4032c5:	cmp    BYTE PTR [esi],0x3d
  4032c8:	pop    ecx
  4032c9:	lea    ebx,[eax+0x1]
  4032cc:	je     0x4032f0
  4032ce:	push   0x1
  4032d0:	push   ebx
  4032d1:	call   0x405797
  4032d6:	mov    DWORD PTR [edi],eax
  4032d8:	pop    ecx
  4032d9:	pop    ecx
  4032da:	test   eax,eax
  4032dc:	je     0x40331e
  4032de:	push   esi
  4032df:	push   ebx
  4032e0:	push   eax
  4032e1:	call   0x4061a2
  4032e6:	add    esp,0xc
  4032e9:	test   eax,eax
  4032eb:	jne    0x403335
  4032ed:	add    edi,0x4
  4032f0:	add    esi,ebx
  4032f2:	cmp    BYTE PTR [esi],0x0
  4032f5:	jne    0x4032bf
  4032f7:	mov    esi,DWORD PTR ds:0x413100
  4032fd:	push   esi
  4032fe:	call   0x40575f
  403303:	and    DWORD PTR ds:0x413100,0x0
  40330a:	and    DWORD PTR [edi],0x0
  40330d:	xor    eax,eax
  40330f:	mov    DWORD PTR ds:0x414f58,0x1
  403319:	pop    ecx
  40331a:	pop    ebx
  40331b:	pop    edi
  40331c:	pop    esi
  40331d:	ret
  40331e:	push   DWORD PTR ds:0x41343c
  403324:	call   0x40575f
  403329:	and    DWORD PTR ds:0x41343c,0x0
  403330:	or     eax,0xffffffff
  403333:	jmp    0x403319
  403335:	xor    eax,eax
  403337:	push   eax
  403338:	push   eax
  403339:	push   eax
  40333a:	push   eax
  40333b:	push   eax
  40333c:	call   0x4016c6
  403341:	int3
  403342:	push   0x3
  403344:	call   0x403569
  403349:	pop    ecx
  40334a:	cmp    eax,0x1
  40334d:	je     0x403364
  40334f:	push   0x3
  403351:	call   0x403569
  403356:	pop    ecx
  403357:	test   eax,eax
  403359:	jne    0x40337a
  40335b:	cmp    DWORD PTR ds:0x413670,0x1
  403362:	jne    0x40337a
  403364:	push   0xfc
  403369:	call   0x40339f
  40336e:	push   0xff
  403373:	call   0x40339f
  403378:	pop    ecx
  403379:	pop    ecx
  40337a:	ret
  40337b:	push   ebp
  40337c:	mov    ebp,esp
  40337e:	mov    ecx,DWORD PTR [ebp+0x8]
  403381:	xor    eax,eax
  403383:	cmp    ecx,DWORD PTR [eax*8+0x40d2b0]
  40338a:	je     0x403396
  40338c:	inc    eax
  40338d:	cmp    eax,0x17
  403390:	jb     0x403383
  403392:	xor    eax,eax
  403394:	pop    ebp
  403395:	ret
  403396:	mov    eax,DWORD PTR [eax*8+0x40d2b4]
  40339d:	pop    ebp
  40339e:	ret
  40339f:	push   ebp
  4033a0:	mov    ebp,esp
  4033a2:	sub    esp,0x1fc
  4033a8:	mov    eax,ds:0x412000
  4033ad:	xor    eax,ebp
  4033af:	mov    DWORD PTR [ebp-0x4],eax
  4033b2:	push   esi
  4033b3:	mov    esi,DWORD PTR [ebp+0x8]
  4033b6:	push   edi
  4033b7:	push   esi
  4033b8:	call   0x40337b
  4033bd:	mov    edi,eax
  4033bf:	pop    ecx
  4033c0:	test   edi,edi
  4033c2:	je     0x403541
  4033c8:	push   ebx
  4033c9:	push   0x3
  4033cb:	call   0x403569
  4033d0:	pop    ecx
  4033d1:	cmp    eax,0x1
  4033d4:	je     0x4034e9
  4033da:	push   0x3
  4033dc:	call   0x403569
  4033e1:	pop    ecx
  4033e2:	test   eax,eax
  4033e4:	jne    0x4033f3
  4033e6:	cmp    DWORD PTR ds:0x413670,0x1
  4033ed:	je     0x4034e9
  4033f3:	cmp    esi,0xfc
  4033f9:	je     0x403540
  4033ff:	push   0x40dc50
  403404:	push   0x314
  403409:	push   0x413678
  40340e:	call   0x406263
  403413:	add    esp,0xc
  403416:	xor    ebx,ebx
  403418:	test   eax,eax
  40341a:	jne    0x403551
  403420:	push   0x104
  403425:	push   0x4136aa
  40342a:	push   ebx
  40342b:	mov    ds:0x4138b2,ax
  403431:	call   DWORD PTR ds:0x40d064
  403437:	mov    esi,0x2fb
  40343c:	test   eax,eax
  40343e:	jne    0x40345b
  403440:	push   0x40dc84
  403445:	push   esi
  403446:	push   0x4136aa
  40344b:	call   0x406263
  403450:	add    esp,0xc
  403453:	test   eax,eax
  403455:	jne    0x403551
  40345b:	push   0x4136aa
  403460:	call   0x4062bf
  403465:	inc    eax
  403466:	pop    ecx
  403467:	cmp    eax,0x3c
  40346a:	jbe    0x4034a1
  40346c:	push   0x4136aa
  403471:	call   0x4062bf
  403476:	push   0x3
  403478:	push   0x40dcb4
  40347d:	lea    ecx,[eax*2+0x413634]
  403484:	mov    eax,ecx
  403486:	sub    eax,0x4136aa
  40348b:	sar    eax,1
  40348d:	sub    esi,eax
  40348f:	push   esi
  403490:	push   ecx
  403491:	call   0x4062d8
  403496:	add    esp,0x14
  403499:	test   eax,eax
  40349b:	jne    0x403551
  4034a1:	push   0x40dcbc
  4034a6:	push   0x314
  4034ab:	mov    esi,0x413678
  4034b0:	push   esi
  4034b1:	call   0x4061f7
  4034b6:	add    esp,0xc
  4034b9:	test   eax,eax
  4034bb:	jne    0x403551
  4034c1:	push   edi
  4034c2:	push   0x314
  4034c7:	push   esi
  4034c8:	call   0x4061f7
  4034cd:	add    esp,0xc
  4034d0:	test   eax,eax
  4034d2:	jne    0x403551
  4034d4:	push   0x12010
  4034d9:	push   0x40dcc8
  4034de:	push   esi
  4034df:	call   0x406396
  4034e4:	add    esp,0xc
  4034e7:	jmp    0x403540
  4034e9:	push   0xfffffff4
  4034eb:	call   DWORD PTR ds:0x40d04c
  4034f1:	mov    esi,eax
  4034f3:	test   esi,esi
  4034f5:	je     0x403540
  4034f7:	cmp    esi,0xffffffff
  4034fa:	je     0x403540
  4034fc:	xor    ebx,ebx
  4034fe:	mov    ecx,ebx
  403500:	mov    al,BYTE PTR [edi+ecx*2]
  403503:	mov    BYTE PTR [ebp+ecx*1-0x1f8],al
  40350a:	cmp    WORD PTR [edi+ecx*2],bx
  40350e:	je     0x403519
  403510:	inc    ecx
  403511:	cmp    ecx,0x1f4
  403517:	jb     0x403500
  403519:	push   ebx
  40351a:	lea    eax,[ebp-0x1fc]
  403520:	mov    BYTE PTR [ebp-0x5],bl
  403523:	push   eax
  403524:	lea    eax,[ebp-0x1f8]
  40352a:	push   eax
  40352b:	call   0x405580
  403530:	pop    ecx
  403531:	push   eax
  403532:	lea    eax,[ebp-0x1f8]
  403538:	push   eax
  403539:	push   esi
  40353a:	call   DWORD PTR ds:0x40d060
  403540:	pop    ebx
  403541:	mov    ecx,DWORD PTR [ebp-0x4]
  403544:	pop    edi
  403545:	xor    ecx,ebp
  403547:	pop    esi
  403548:	call   0x40120d
  40354d:	mov    esp,ebp
  40354f:	pop    ebp
  403550:	ret
  403551:	push   ebx
  403552:	push   ebx
  403553:	push   ebx
  403554:	push   ebx
  403555:	push   ebx
  403556:	call   0x4016c6
  40355b:	int3
  40355c:	push   ebp
  40355d:	mov    ebp,esp
  40355f:	mov    eax,DWORD PTR [ebp+0x8]
  403562:	mov    ds:0x413670,eax
  403567:	pop    ebp
  403568:	ret
  403569:	push   ebp
  40356a:	mov    ebp,esp
  40356c:	mov    eax,DWORD PTR [ebp+0x8]
  40356f:	test   eax,eax
  403571:	js     0x403594
  403573:	cmp    eax,0x2
  403576:	jle    0x403585
  403578:	cmp    eax,0x3
  40357b:	jne    0x403594
  40357d:	mov    ecx,DWORD PTR ds:0x413ca0
  403583:	jmp    0x403590
  403585:	mov    ecx,DWORD PTR ds:0x413ca0
  40358b:	mov    ds:0x413ca0,eax
  403590:	mov    eax,ecx
  403592:	pop    ebp
  403593:	ret
  403594:	call   0x402568
  403599:	mov    DWORD PTR [eax],0x16
  40359f:	call   0x4016b6
  4035a4:	or     eax,0xffffffff
  4035a7:	pop    ebp
  4035a8:	ret
  4035a9:	push   ebp
  4035aa:	mov    ebp,esp
  4035ac:	sub    esp,0x14
  4035af:	and    DWORD PTR [ebp-0xc],0x0
  4035b3:	and    DWORD PTR [ebp-0x8],0x0
  4035b7:	mov    eax,ds:0x412000
  4035bc:	push   esi
  4035bd:	push   edi
  4035be:	mov    edi,0xbb40e64e
  4035c3:	mov    esi,0xffff0000
  4035c8:	cmp    eax,edi
  4035ca:	je     0x4035d9
  4035cc:	test   esi,eax
  4035ce:	je     0x4035d9
  4035d0:	not    eax
  4035d2:	mov    ds:0x412004,eax
  4035d7:	jmp    0x40363f
  4035d9:	lea    eax,[ebp-0xc]
  4035dc:	push   eax
  4035dd:	call   DWORD PTR ds:0x40d070
  4035e3:	mov    eax,DWORD PTR [ebp-0x8]
  4035e6:	xor    eax,DWORD PTR [ebp-0xc]
  4035e9:	mov    DWORD PTR [ebp-0x4],eax
  4035ec:	call   DWORD PTR ds:0x40d030
  4035f2:	xor    DWORD PTR [ebp-0x4],eax
  4035f5:	call   DWORD PTR ds:0x40d06c
  4035fb:	xor    DWORD PTR [ebp-0x4],eax
  4035fe:	lea    eax,[ebp-0x14]
  403601:	push   eax
  403602:	call   DWORD PTR ds:0x40d068
  403608:	mov    ecx,DWORD PTR [ebp-0x10]
  40360b:	lea    eax,[ebp-0x4]
  40360e:	xor    ecx,DWORD PTR [ebp-0x14]
  403611:	xor    ecx,DWORD PTR [ebp-0x4]
  403614:	xor    ecx,eax
  403616:	cmp    ecx,edi
  403618:	jne    0x403621
  40361a:	mov    ecx,0xbb40e64f
  40361f:	jmp    0x403631
  403621:	test   esi,ecx
  403623:	jne    0x403631
  403625:	mov    eax,ecx
  403627:	or     eax,0x4711
  40362c:	shl    eax,0x10
  40362f:	or     ecx,eax
  403631:	mov    DWORD PTR ds:0x412000,ecx
  403637:	not    ecx
  403639:	mov    DWORD PTR ds:0x412004,ecx
  40363f:	pop    edi
  403640:	pop    esi
  403641:	mov    esp,ebp
  403643:	pop    ebp
  403644:	ret
  403645:	push   esi
  403646:	push   edi
  403647:	mov    esi,0x410ed0
  40364c:	mov    edi,0x410ed0
  403651:	jmp    0x40365e
  403653:	mov    eax,DWORD PTR [esi]
  403655:	test   eax,eax
  403657:	je     0x40365b
  403659:	call   eax
  40365b:	add    esi,0x4
  40365e:	cmp    esi,edi
  403660:	jb     0x403653
  403662:	pop    edi
  403663:	pop    esi
  403664:	ret
  403665:	push   esi
  403666:	push   edi
  403667:	mov    esi,0x410ed8
  40366c:	mov    edi,0x410ed8
  403671:	jmp    0x40367e
  403673:	mov    eax,DWORD PTR [esi]
  403675:	test   eax,eax
  403677:	je     0x40367b
  403679:	call   eax
  40367b:	add    esi,0x4
  40367e:	cmp    esi,edi
  403680:	jb     0x403673
  403682:	pop    edi
  403683:	pop    esi
  403684:	ret
  403685:	push   ebp
  403686:	mov    ebp,esp
  403688:	push   ecx
  403689:	push   edi
  40368a:	call   DWORD PTR ds:0x40d074
  403690:	mov    edi,eax
  403692:	xor    eax,eax
  403694:	test   edi,edi
  403696:	je     0x40370d
  403698:	push   esi
  403699:	mov    esi,edi
  40369b:	cmp    WORD PTR [edi],ax
  40369e:	je     0x4036b0
  4036a0:	add    esi,0x2
  4036a3:	cmp    WORD PTR [esi],ax
  4036a6:	jne    0x4036a0
  4036a8:	add    esi,0x2
  4036ab:	cmp    WORD PTR [esi],ax
  4036ae:	jne    0x4036a0
  4036b0:	push   ebx
  4036b1:	push   eax
  4036b2:	push   eax
  4036b3:	push   eax
  4036b4:	sub    esi,edi
  4036b6:	push   eax
  4036b7:	sar    esi,1
  4036b9:	inc    esi
  4036ba:	push   esi
  4036bb:	push   edi
  4036bc:	push   eax
  4036bd:	push   eax
  4036be:	call   DWORD PTR ds:0x40d044
  4036c4:	mov    DWORD PTR [ebp-0x4],eax
  4036c7:	test   eax,eax
  4036c9:	je     0x403702
  4036cb:	push   eax
  4036cc:	call   0x4057df
  4036d1:	mov    ebx,eax
  4036d3:	pop    ecx
  4036d4:	test   ebx,ebx
  4036d6:	je     0x403702
  4036d8:	xor    eax,eax
  4036da:	push   eax
  4036db:	push   eax
  4036dc:	push   DWORD PTR [ebp-0x4]
  4036df:	push   ebx
  4036e0:	push   esi
  4036e1:	push   edi
  4036e2:	push   eax
  4036e3:	push   eax
  4036e4:	call   DWORD PTR ds:0x40d044
  4036ea:	test   eax,eax
  4036ec:	jne    0x4036f7
  4036ee:	push   ebx
  4036ef:	call   0x40575f
  4036f4:	pop    ecx
  4036f5:	xor    ebx,ebx
  4036f7:	push   edi
  4036f8:	call   DWORD PTR ds:0x40d078
  4036fe:	mov    eax,ebx
  403700:	jmp    0x40370b
  403702:	push   edi
  403703:	call   DWORD PTR ds:0x40d078
  403709:	xor    eax,eax
  40370b:	pop    ebx
  40370c:	pop    esi
  40370d:	pop    edi
  40370e:	mov    esp,ebp
  403710:	pop    ebp
  403711:	ret
  403712:	push   ebp
  403713:	mov    ebp,esp
  403715:	mov    eax,ds:0x414ec0
  40371a:	xor    eax,DWORD PTR ds:0x412000
  403720:	je     0x403729
  403722:	push   DWORD PTR [ebp+0x8]
  403725:	call   eax
  403727:	pop    ebp
  403728:	ret
  403729:	pop    ebp
  40372a:	jmp    DWORD PTR ds:0x40d094
  403730:	push   ebp
  403731:	mov    ebp,esp
  403733:	mov    eax,ds:0x414ec4
  403738:	xor    eax,DWORD PTR ds:0x412000
  40373e:	push   DWORD PTR [ebp+0x8]
  403741:	je     0x403747
  403743:	call   eax
  403745:	pop    ebp
  403746:	ret
  403747:	call   DWORD PTR ds:0x40d0a0
  40374d:	pop    ebp
  40374e:	ret
  40374f:	push   ebp
  403750:	mov    ebp,esp
  403752:	mov    eax,ds:0x414ec8
  403757:	xor    eax,DWORD PTR ds:0x412000
  40375d:	push   DWORD PTR [ebp+0x8]
  403760:	je     0x403766
  403762:	call   eax
  403764:	pop    ebp
  403765:	ret
  403766:	call   DWORD PTR ds:0x40d098
  40376c:	pop    ebp
  40376d:	ret
  40376e:	push   ebp
  40376f:	mov    ebp,esp
  403771:	mov    eax,ds:0x414ecc
  403776:	xor    eax,DWORD PTR ds:0x412000
  40377c:	push   DWORD PTR [ebp+0xc]
  40377f:	push   DWORD PTR [ebp+0x8]
  403782:	je     0x403788
  403784:	call   eax
  403786:	pop    ebp
  403787:	ret
  403788:	call   DWORD PTR ds:0x40d09c
  40378e:	pop    ebp
  40378f:	ret
  403790:	push   ebp
  403791:	mov    ebp,esp
  403793:	sub    esp,0x44
  403796:	lea    eax,[ebp-0x44]
  403799:	push   eax
  40379a:	call   DWORD PTR ds:0x40d058
  4037a0:	test   BYTE PTR [ebp-0x18],0x1
  4037a4:	je     0x4037ac
  4037a6:	movzx  eax,WORD PTR [ebp-0x14]
  4037aa:	jmp    0x4037af
  4037ac:	push   0xa
  4037ae:	pop    eax
  4037af:	mov    esp,ebp
  4037b1:	pop    ebp
  4037b2:	ret
  4037b3:	push   ebp
  4037b4:	mov    ebp,esp
  4037b6:	mov    eax,ds:0x414ed0
  4037bb:	xor    eax,DWORD PTR ds:0x412000
  4037c1:	je     0x4037d0
  4037c3:	push   DWORD PTR [ebp+0x10]
  4037c6:	push   DWORD PTR [ebp+0xc]
  4037c9:	push   DWORD PTR [ebp+0x8]
  4037cc:	call   eax
  4037ce:	pop    ebp
  4037cf:	ret
  4037d0:	push   DWORD PTR [ebp+0xc]
  4037d3:	push   DWORD PTR [ebp+0x8]
  4037d6:	call   DWORD PTR ds:0x40d084
  4037dc:	xor    eax,eax
  4037de:	inc    eax
  4037df:	pop    ebp
  4037e0:	ret
  4037e1:	push   ebp
  4037e2:	mov    ebp,esp
  4037e4:	push   ecx
  4037e5:	push   esi
  4037e6:	mov    esi,DWORD PTR ds:0x4121c8
  4037ec:	test   esi,esi
  4037ee:	jns    0x403815
  4037f0:	mov    eax,ds:0x414f34
  4037f5:	xor    esi,esi
  4037f7:	xor    eax,DWORD PTR ds:0x412000
  4037fd:	mov    DWORD PTR [ebp-0x4],esi
  403800:	je     0x40380f
  403802:	push   esi
  403803:	lea    ecx,[ebp-0x4]
  403806:	push   ecx
  403807:	call   eax
  403809:	cmp    eax,0x7a
  40380c:	jne    0x40380f
  40380e:	inc    esi
  40380f:	mov    DWORD PTR ds:0x4121c8,esi
  403815:	xor    eax,eax
  403817:	test   esi,esi
  403819:	pop    esi
  40381a:	setg   al
  40381d:	mov    esp,ebp
  40381f:	pop    ebp
  403820:	ret
  403821:	push   esi
  403822:	push   edi
  403823:	push   0x40dd14
  403828:	call   DWORD PTR ds:0x40d0a4
  40382e:	mov    esi,DWORD PTR ds:0x40d03c
  403834:	mov    edi,eax
  403836:	push   0x40dd30
  40383b:	push   edi
  40383c:	call   esi
  40383e:	xor    eax,DWORD PTR ds:0x412000
  403844:	push   0x40dd3c
  403849:	push   edi
  40384a:	mov    ds:0x414ec0,eax
  40384f:	call   esi
  403851:	xor    eax,DWORD PTR ds:0x412000
  403857:	push   0x40dd44
  40385c:	push   edi
  40385d:	mov    ds:0x414ec4,eax
  403862:	call   esi
  403864:	xor    eax,DWORD PTR ds:0x412000
  40386a:	push   0x40dd50
  40386f:	push   edi
  403870:	mov    ds:0x414ec8,eax
  403875:	call   esi
  403877:	xor    eax,DWORD PTR ds:0x412000
  40387d:	push   0x40dd5c
  403882:	push   edi
  403883:	mov    ds:0x414ecc,eax
  403888:	call   esi
  40388a:	xor    eax,DWORD PTR ds:0x412000
  403890:	push   0x40dd78
  403895:	push   edi
  403896:	mov    ds:0x414ed0,eax
  40389b:	call   esi
  40389d:	xor    eax,DWORD PTR ds:0x412000
  4038a3:	push   0x40dd88
  4038a8:	push   edi
  4038a9:	mov    ds:0x414ed4,eax
  4038ae:	call   esi
  4038b0:	xor    eax,DWORD PTR ds:0x412000
  4038b6:	push   0x40dd9c
  4038bb:	push   edi
  4038bc:	mov    ds:0x414ed8,eax
  4038c1:	call   esi
  4038c3:	xor    eax,DWORD PTR ds:0x412000
  4038c9:	push   0x40ddb4
  4038ce:	push   edi
  4038cf:	mov    ds:0x414edc,eax
  4038d4:	call   esi
  4038d6:	xor    eax,DWORD PTR ds:0x412000
  4038dc:	push   0x40ddcc
  4038e1:	push   edi
  4038e2:	mov    ds:0x414ee0,eax
  4038e7:	call   esi
  4038e9:	xor    eax,DWORD PTR ds:0x412000
  4038ef:	push   0x40dde0
  4038f4:	push   edi
  4038f5:	mov    ds:0x414ee4,eax
  4038fa:	call   esi
  4038fc:	xor    eax,DWORD PTR ds:0x412000
  403902:	push   0x40de00
  403907:	push   edi
  403908:	mov    ds:0x414ee8,eax
  40390d:	call   esi
  40390f:	xor    eax,DWORD PTR ds:0x412000
  403915:	push   0x40de18
  40391a:	push   edi
  40391b:	mov    ds:0x414eec,eax
  403920:	call   esi
  403922:	xor    eax,DWORD PTR ds:0x412000
  403928:	push   0x40de30
  40392d:	push   edi
  40392e:	mov    ds:0x414ef0,eax
  403933:	call   esi
  403935:	xor    eax,DWORD PTR ds:0x412000
  40393b:	push   0x40de44
  403940:	push   edi
  403941:	mov    ds:0x414ef4,eax
  403946:	call   esi
  403948:	xor    eax,DWORD PTR ds:0x412000
  40394e:	mov    ds:0x414ef8,eax
  403953:	push   0x40de58
  403958:	push   edi
  403959:	call   esi
  40395b:	xor    eax,DWORD PTR ds:0x412000
  403961:	push   0x40de74
  403966:	push   edi
  403967:	mov    ds:0x414efc,eax
  40396c:	call   esi
  40396e:	xor    eax,DWORD PTR ds:0x412000
  403974:	push   0x40de94
  403979:	push   edi
  40397a:	mov    ds:0x414f00,eax
  40397f:	call   esi
  403981:	xor    eax,DWORD PTR ds:0x412000
  403987:	push   0x40deb0
  40398c:	push   edi
  40398d:	mov    ds:0x414f04,eax
  403992:	call   esi
  403994:	xor    eax,DWORD PTR ds:0x412000
  40399a:	push   0x40ded0
  40399f:	push   edi
  4039a0:	mov    ds:0x414f08,eax
  4039a5:	call   esi
  4039a7:	xor    eax,DWORD PTR ds:0x412000
  4039ad:	push   0x40dee4
  4039b2:	push   edi
  4039b3:	mov    ds:0x414f0c,eax
  4039b8:	call   esi
  4039ba:	xor    eax,DWORD PTR ds:0x412000
  4039c0:	push   0x40df00
  4039c5:	push   edi
  4039c6:	mov    ds:0x414f10,eax
  4039cb:	call   esi
  4039cd:	xor    eax,DWORD PTR ds:0x412000
  4039d3:	push   0x40df14
  4039d8:	push   edi
  4039d9:	mov    ds:0x414f18,eax
  4039de:	call   esi
  4039e0:	xor    eax,DWORD PTR ds:0x412000
  4039e6:	push   0x40df24
  4039eb:	push   edi
  4039ec:	mov    ds:0x414f14,eax
  4039f1:	call   esi
  4039f3:	xor    eax,DWORD PTR ds:0x412000
  4039f9:	push   0x40df34
  4039fe:	push   edi
  4039ff:	mov    ds:0x414f1c,eax
  403a04:	call   esi
  403a06:	xor    eax,DWORD PTR ds:0x412000
  403a0c:	push   0x40df44
  403a11:	push   edi
  403a12:	mov    ds:0x414f20,eax
  403a17:	call   esi
  403a19:	xor    eax,DWORD PTR ds:0x412000
  403a1f:	push   0x40df54
  403a24:	push   edi
  403a25:	mov    ds:0x414f24,eax
  403a2a:	call   esi
  403a2c:	xor    eax,DWORD PTR ds:0x412000
  403a32:	push   0x40df70
  403a37:	push   edi
  403a38:	mov    ds:0x414f28,eax
  403a3d:	call   esi
  403a3f:	xor    eax,DWORD PTR ds:0x412000
  403a45:	push   0x40df84
  403a4a:	push   edi
  403a4b:	mov    ds:0x414f2c,eax
  403a50:	call   esi
  403a52:	xor    eax,DWORD PTR ds:0x412000
  403a58:	push   0x40df94
  403a5d:	push   edi
  403a5e:	mov    ds:0x414f30,eax
  403a63:	call   esi
  403a65:	xor    eax,DWORD PTR ds:0x412000
  403a6b:	push   0x40dfa8
  403a70:	push   edi
  403a71:	mov    ds:0x414f34,eax
  403a76:	call   esi
  403a78:	xor    eax,DWORD PTR ds:0x412000
  403a7e:	mov    ds:0x414f38,eax
  403a83:	push   0x40dfb8
  403a88:	push   edi
  403a89:	call   esi
  403a8b:	xor    eax,DWORD PTR ds:0x412000
  403a91:	push   0x40dfd8
  403a96:	push   edi
  403a97:	mov    ds:0x414f3c,eax
  403a9c:	call   esi
  403a9e:	xor    eax,DWORD PTR ds:0x412000
  403aa4:	pop    edi
  403aa5:	mov    ds:0x414f40,eax
  403aaa:	pop    esi
  403aab:	ret
  403aac:	push   ebp
  403aad:	mov    ebp,esp
  403aaf:	push   DWORD PTR [ebp+0x8]
  403ab2:	call   DWORD PTR ds:0x40d080
  403ab8:	pop    ebp
  403ab9:	ret
  403aba:	push   ebp
  403abb:	mov    ebp,esp
  403abd:	push   DWORD PTR [ebp+0x8]
  403ac0:	call   DWORD PTR ds:0x40d088
  403ac6:	pop    ebp
  403ac7:	ret
  403ac8:	push   ebp
  403ac9:	mov    ebp,esp
  403acb:	push   DWORD PTR [ebp+0x8]
  403ace:	call   DWORD PTR ds:0x40d08c
  403ad4:	push   eax
  403ad5:	call   DWORD PTR ds:0x40d090
  403adb:	pop    ebp
  403adc:	ret
  403add:	push   ebp
  403ade:	mov    ebp,esp
  403ae0:	push   0x0
  403ae2:	call   DWORD PTR ds:0x40d080
  403ae8:	push   DWORD PTR [ebp+0x8]
  403aeb:	call   DWORD PTR ds:0x40d07c
  403af1:	pop    ebp
  403af2:	ret
  403af3:	push   esi
  403af4:	push   edi
  403af5:	xor    edi,edi
  403af7:	cmp    DWORD PTR ds:0x414f54,edi
  403afd:	jne    0x403b04
  403aff:	call   0x404e41
  403b04:	mov    esi,DWORD PTR ds:0x414f5c
  403b0a:	test   esi,esi
  403b0c:	jne    0x403b13
  403b0e:	mov    esi,0x40dff4
  403b13:	mov    cl,BYTE PTR [esi]
  403b15:	cmp    cl,0x20
  403b18:	ja     0x403b22
  403b1a:	test   cl,cl
  403b1c:	je     0x403b4d
  403b1e:	test   edi,edi
  403b20:	je     0x403b47
  403b22:	cmp    cl,0x22
  403b25:	jne    0x403b30
  403b27:	xor    eax,eax
  403b29:	test   edi,edi
  403b2b:	sete   al
  403b2e:	mov    edi,eax
  403b30:	movzx  eax,cl
  403b33:	push   eax
  403b34:	call   0x40618c
  403b39:	pop    ecx
  403b3a:	test   eax,eax
  403b3c:	je     0x403b3f
  403b3e:	inc    esi
  403b3f:	inc    esi
  403b40:	jmp    0x403b13
  403b42:	cmp    al,0x20
  403b44:	ja     0x403b4d
  403b46:	inc    esi
  403b47:	mov    al,BYTE PTR [esi]
  403b49:	test   al,al
  403b4b:	jne    0x403b42
  403b4d:	pop    edi
  403b4e:	mov    eax,esi
  403b50:	pop    esi
  403b51:	ret
  403b52:	int3
  403b53:	int3
  403b54:	int3
  403b55:	int3
  403b56:	int3
  403b57:	int3
  403b58:	int3
  403b59:	int3
  403b5a:	int3
  403b5b:	int3
  403b5c:	int3
  403b5d:	int3
  403b5e:	int3
  403b5f:	int3
  403b60:	push   0x403bc0
  403b65:	push   DWORD PTR fs:0x0
  403b6c:	mov    eax,DWORD PTR [esp+0x10]
  403b70:	mov    DWORD PTR [esp+0x10],ebp
  403b74:	lea    ebp,[esp+0x10]
  403b78:	sub    esp,eax
  403b7a:	push   ebx
  403b7b:	push   esi
  403b7c:	push   edi
  403b7d:	mov    eax,ds:0x412000
  403b82:	xor    DWORD PTR [ebp-0x4],eax
  403b85:	xor    eax,ebp
  403b87:	push   eax
  403b88:	mov    DWORD PTR [ebp-0x18],esp
  403b8b:	push   DWORD PTR [ebp-0x8]
  403b8e:	mov    eax,DWORD PTR [ebp-0x4]
  403b91:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  403b98:	mov    DWORD PTR [ebp-0x8],eax
  403b9b:	lea    eax,[ebp-0x10]
  403b9e:	mov    fs:0x0,eax
  403ba4:	ret
  403ba5:	mov    ecx,DWORD PTR [ebp-0x10]
  403ba8:	mov    DWORD PTR fs:0x0,ecx
  403baf:	pop    ecx
  403bb0:	pop    edi
  403bb1:	pop    edi
  403bb2:	pop    esi
  403bb3:	pop    ebx
  403bb4:	mov    esp,ebp
  403bb6:	pop    ebp
  403bb7:	push   ecx
  403bb8:	ret
  403bb9:	int3
  403bba:	int3
  403bbb:	int3
  403bbc:	int3
  403bbd:	int3
  403bbe:	int3
  403bbf:	int3
  403bc0:	push   ebp
  403bc1:	mov    ebp,esp
  403bc3:	sub    esp,0x18
  403bc6:	push   ebx
  403bc7:	mov    ebx,DWORD PTR [ebp+0xc]
  403bca:	push   esi
  403bcb:	push   edi
  403bcc:	mov    BYTE PTR [ebp-0x1],0x0
  403bd0:	mov    edi,DWORD PTR [ebx+0x8]
  403bd3:	lea    esi,[ebx+0x10]
  403bd6:	xor    edi,DWORD PTR ds:0x412000
  403bdc:	mov    DWORD PTR [ebp-0xc],0x1
  403be3:	mov    eax,DWORD PTR [edi]
  403be5:	cmp    eax,0xfffffffe
  403be8:	je     0x403bf7
  403bea:	mov    ecx,DWORD PTR [edi+0x4]
  403bed:	add    ecx,esi
  403bef:	xor    ecx,DWORD PTR [eax+esi*1]
  403bf2:	call   0x40120d
  403bf7:	mov    eax,DWORD PTR [edi+0x8]
  403bfa:	mov    ecx,DWORD PTR [edi+0xc]
  403bfd:	add    ecx,esi
  403bff:	xor    ecx,DWORD PTR [eax+esi*1]
  403c02:	call   0x40120d
  403c07:	mov    eax,DWORD PTR [ebp+0x8]
  403c0a:	test   BYTE PTR [eax+0x4],0x66
  403c0e:	jne    0x403ce3
  403c14:	mov    DWORD PTR [ebp-0x18],eax
  403c17:	mov    eax,DWORD PTR [ebp+0x10]
  403c1a:	mov    DWORD PTR [ebp-0x14],eax
  403c1d:	lea    eax,[ebp-0x18]
  403c20:	mov    DWORD PTR [ebx-0x4],eax
  403c23:	mov    eax,DWORD PTR [ebx+0xc]
  403c26:	mov    DWORD PTR [ebp-0x8],eax
  403c29:	cmp    eax,0xfffffffe
  403c2c:	je     0x403d1f
  403c32:	lea    eax,[eax+eax*2]
  403c35:	lea    eax,[eax+0x4]
  403c38:	mov    ecx,DWORD PTR [edi+eax*4+0x4]
  403c3c:	lea    eax,[edi+eax*4]
  403c3f:	mov    ebx,DWORD PTR [eax]
  403c41:	mov    DWORD PTR [ebp-0x10],eax
  403c44:	test   ecx,ecx
  403c46:	je     0x403cc3
  403c48:	mov    edx,esi
  403c4a:	call   0x4060d2
  403c4f:	mov    cl,0x1
  403c51:	mov    BYTE PTR [ebp-0x1],cl
  403c54:	test   eax,eax
  403c56:	js     0x403cda
  403c5c:	jle    0x403cc6
  403c5e:	mov    eax,DWORD PTR [ebp+0x8]
  403c61:	cmp    DWORD PTR [eax],0xe06d7363
  403c67:	jne    0x403c91
  403c69:	cmp    DWORD PTR ds:0x414eac,0x0
  403c70:	je     0x403c91
  403c72:	push   0x414eac
  403c77:	call   0x405b40
  403c7c:	add    esp,0x4
  403c7f:	test   eax,eax
  403c81:	je     0x403c91
  403c83:	push   0x1
  403c85:	push   DWORD PTR [ebp+0x8]
  403c88:	call   DWORD PTR ds:0x414eac
  403c8e:	add    esp,0x8
  403c91:	mov    edx,DWORD PTR [ebp+0x8]
  403c94:	mov    ecx,DWORD PTR [ebp+0xc]
  403c97:	call   0x406102
  403c9c:	mov    eax,DWORD PTR [ebp+0xc]
  403c9f:	mov    edx,DWORD PTR [ebp-0x8]
  403ca2:	cmp    DWORD PTR [eax+0xc],edx
  403ca5:	je     0x403cb7
  403ca7:	push   0x412000
  403cac:	push   esi
  403cad:	mov    ecx,eax
  403caf:	call   0x40611b
  403cb4:	mov    eax,DWORD PTR [ebp+0xc]
  403cb7:	mov    DWORD PTR [eax+0xc],ebx
  403cba:	mov    eax,DWORD PTR [edi]
  403cbc:	cmp    eax,0xfffffffe
  403cbf:	je     0x403d36
  403cc1:	jmp    0x403d29
  403cc3:	mov    cl,BYTE PTR [ebp-0x1]
  403cc6:	mov    DWORD PTR [ebp-0x8],ebx
  403cc9:	mov    eax,ebx
  403ccb:	cmp    ebx,0xfffffffe
  403cce:	jne    0x403c32
  403cd4:	test   cl,cl
  403cd6:	je     0x403d1f
  403cd8:	jmp    0x403cfb
  403cda:	mov    DWORD PTR [ebp-0xc],0x0
  403ce1:	jmp    0x403cfb
  403ce3:	cmp    DWORD PTR [ebx+0xc],0xfffffffe
  403ce7:	je     0x403d1f
  403ce9:	push   0x412000
  403cee:	push   esi
  403cef:	mov    ecx,ebx
  403cf1:	mov    edx,0xfffffffe
  403cf6:	call   0x40611b
  403cfb:	mov    eax,DWORD PTR [edi]
  403cfd:	cmp    eax,0xfffffffe
  403d00:	je     0x403d0f
  403d02:	mov    ecx,DWORD PTR [edi+0x4]
  403d05:	add    ecx,esi
  403d07:	xor    ecx,DWORD PTR [eax+esi*1]
  403d0a:	call   0x40120d
  403d0f:	mov    edx,DWORD PTR [edi+0x8]
  403d12:	mov    ecx,DWORD PTR [edi+0xc]
  403d15:	add    ecx,esi
  403d17:	xor    ecx,DWORD PTR [edx+esi*1]
  403d1a:	call   0x40120d
  403d1f:	mov    eax,DWORD PTR [ebp-0xc]
  403d22:	pop    edi
  403d23:	pop    esi
  403d24:	pop    ebx
  403d25:	mov    esp,ebp
  403d27:	pop    ebp
  403d28:	ret
  403d29:	mov    ecx,DWORD PTR [edi+0x4]
  403d2c:	add    ecx,esi
  403d2e:	xor    ecx,DWORD PTR [eax+esi*1]
  403d31:	call   0x40120d
  403d36:	mov    eax,DWORD PTR [edi+0x8]
  403d39:	mov    ecx,DWORD PTR [edi+0xc]
  403d3c:	add    ecx,esi
  403d3e:	xor    ecx,DWORD PTR [eax+esi*1]
  403d41:	call   0x40120d
  403d46:	mov    ecx,DWORD PTR [ebp-0x10]
  403d49:	mov    edx,esi
  403d4b:	mov    ecx,DWORD PTR [ecx+0x8]
  403d4e:	call   0x4060e9
  403d53:	int3
  403d54:	and    DWORD PTR ds:0x414ea8,0x0
  403d5b:	ret
  403d5c:	int3
  403d5d:	int3
  403d5e:	int3
  403d5f:	int3
  403d60:	mov    edx,DWORD PTR [esp+0xc]
  403d64:	mov    ecx,DWORD PTR [esp+0x4]
  403d68:	test   edx,edx
  403d6a:	je     0x403deb
  403d6c:	movzx  eax,BYTE PTR [esp+0x8]
  403d71:	bt     DWORD PTR ds:0x413e60,0x1
  403d79:	jae    0x403d88
  403d7b:	mov    ecx,DWORD PTR [esp+0xc]
  403d7f:	push   edi
  403d80:	mov    edi,DWORD PTR [esp+0x8]
  403d84:	rep stos BYTE PTR es:[edi],al
  403d86:	jmp    0x403de5
  403d88:	mov    edx,DWORD PTR [esp+0xc]
  403d8c:	cmp    edx,0x80
  403d92:	jl     0x403da2
  403d94:	bt     DWORD PTR ds:0x412cf0,0x1
  403d9c:	jb     0x40657c
  403da2:	push   edi
  403da3:	mov    edi,ecx
  403da5:	cmp    edx,0x4
  403da8:	jb     0x403ddb
  403daa:	neg    ecx
  403dac:	and    ecx,0x3
  403daf:	je     0x403dbd
  403db1:	sub    edx,ecx
  403db3:	mov    BYTE PTR [edi],al
  403db5:	add    edi,0x1
  403db8:	sub    ecx,0x1
  403dbb:	jne    0x403db3
  403dbd:	mov    ecx,eax
  403dbf:	shl    eax,0x8
  403dc2:	add    eax,ecx
  403dc4:	mov    ecx,eax
  403dc6:	shl    eax,0x10
  403dc9:	add    eax,ecx
  403dcb:	mov    ecx,edx
  403dcd:	and    edx,0x3
  403dd0:	shr    ecx,0x2
  403dd3:	je     0x403ddb
  403dd5:	rep stos DWORD PTR es:[edi],eax
  403dd7:	test   edx,edx
  403dd9:	je     0x403de5
  403ddb:	mov    BYTE PTR [edi],al
  403ddd:	add    edi,0x1
  403de0:	sub    edx,0x1
  403de3:	jne    0x403ddb
  403de5:	mov    eax,DWORD PTR [esp+0x8]
  403de9:	pop    edi
  403dea:	ret
  403deb:	mov    eax,DWORD PTR [esp+0x4]
  403def:	ret
  403df0:	mov    eax,ds:0x414ea4
  403df5:	push   esi
  403df6:	push   0x14
  403df8:	pop    esi
  403df9:	test   eax,eax
  403dfb:	jne    0x403e04
  403dfd:	mov    eax,0x200
  403e02:	jmp    0x403e0a
  403e04:	cmp    eax,esi
  403e06:	jge    0x403e0f
  403e08:	mov    eax,esi
  403e0a:	mov    ds:0x414ea4,eax
  403e0f:	push   0x4
  403e11:	push   eax
  403e12:	call   0x405797
  403e17:	mov    ds:0x414ea0,eax
  403e1c:	pop    ecx
  403e1d:	pop    ecx
  403e1e:	test   eax,eax
  403e20:	jne    0x403e40
  403e22:	push   0x4
  403e24:	push   esi
  403e25:	mov    DWORD PTR ds:0x414ea4,esi
  403e2b:	call   0x405797
  403e30:	mov    ds:0x414ea0,eax
  403e35:	pop    ecx
  403e36:	pop    ecx
  403e37:	test   eax,eax
  403e39:	jne    0x403e40
  403e3b:	push   0x1a
  403e3d:	pop    eax
  403e3e:	pop    esi
  403e3f:	ret
  403e40:	xor    edx,edx
  403e42:	mov    ecx,0x4121d0
  403e47:	mov    DWORD PTR [edx+eax*1],ecx
  403e4a:	add    ecx,0x20
  403e4d:	lea    edx,[edx+0x4]
  403e50:	cmp    ecx,0x412450
  403e56:	jge    0x403e5f
  403e58:	mov    eax,ds:0x414ea0
  403e5d:	jmp    0x403e47
  403e5f:	xor    eax,eax
  403e61:	pop    esi
  403e62:	ret
  403e63:	call   0x406904
  403e68:	cmp    BYTE PTR ds:0x413450,0x0
  403e6f:	je     0x403e76
  403e71:	call   0x4067bd
  403e76:	push   DWORD PTR ds:0x414ea0
  403e7c:	call   0x40575f
  403e81:	and    DWORD PTR ds:0x414ea0,0x0
  403e88:	pop    ecx
  403e89:	ret
  403e8a:	mov    eax,0x4121d0
  403e8f:	ret
  403e90:	push   ebp
  403e91:	mov    ebp,esp
  403e93:	push   esi
  403e94:	mov    esi,DWORD PTR [ebp+0x8]
  403e97:	mov    ecx,0x4121d0
  403e9c:	cmp    esi,ecx
  403e9e:	jb     0x403ec2
  403ea0:	cmp    esi,0x412430
  403ea6:	ja     0x403ec2
  403ea8:	mov    eax,esi
  403eaa:	sub    eax,ecx
  403eac:	sar    eax,0x5
  403eaf:	add    eax,0x10
  403eb2:	push   eax
  403eb3:	call   0x405969
  403eb8:	or     DWORD PTR [esi+0xc],0x8000
  403ebf:	pop    ecx
  403ec0:	jmp    0x403ecc
  403ec2:	lea    eax,[esi+0x20]
  403ec5:	push   eax
  403ec6:	call   DWORD PTR ds:0x40d0a8
  403ecc:	pop    esi
  403ecd:	pop    ebp
  403ece:	ret
  403ecf:	push   ebp
  403ed0:	mov    ebp,esp
  403ed2:	mov    eax,DWORD PTR [ebp+0x8]
  403ed5:	cmp    eax,0x14
  403ed8:	jge    0x403ef0
  403eda:	add    eax,0x10
  403edd:	push   eax
  403ede:	call   0x405969
  403ee3:	mov    eax,DWORD PTR [ebp+0xc]
  403ee6:	pop    ecx
  403ee7:	or     DWORD PTR [eax+0xc],0x8000
  403eee:	pop    ebp
  403eef:	ret
  403ef0:	mov    eax,DWORD PTR [ebp+0xc]
  403ef3:	add    eax,0x20
  403ef6:	push   eax
  403ef7:	call   DWORD PTR ds:0x40d0a8
  403efd:	pop    ebp
  403efe:	ret
  403eff:	push   ebp
  403f00:	mov    ebp,esp
  403f02:	mov    eax,DWORD PTR [ebp+0x8]
  403f05:	mov    ecx,0x4121d0
  403f0a:	cmp    eax,ecx
  403f0c:	jb     0x403f2d
  403f0e:	cmp    eax,0x412430
  403f13:	ja     0x403f2d
  403f15:	and    DWORD PTR [eax+0xc],0xffff7fff
  403f1c:	sub    eax,ecx
  403f1e:	sar    eax,0x5
  403f21:	add    eax,0x10
  403f24:	push   eax
  403f25:	call   0x405ad3
  403f2a:	pop    ecx
  403f2b:	pop    ebp
  403f2c:	ret
  403f2d:	add    eax,0x20
  403f30:	push   eax
  403f31:	call   DWORD PTR ds:0x40d0ac
  403f37:	pop    ebp
  403f38:	ret
  403f39:	push   ebp
  403f3a:	mov    ebp,esp
  403f3c:	mov    ecx,DWORD PTR [ebp+0x8]
  403f3f:	mov    eax,DWORD PTR [ebp+0xc]
  403f42:	cmp    ecx,0x14
  403f45:	jge    0x403f5a
  403f47:	and    DWORD PTR [eax+0xc],0xffff7fff
  403f4e:	lea    eax,[ecx+0x10]
  403f51:	push   eax
  403f52:	call   0x405ad3
  403f57:	pop    ecx
  403f58:	pop    ebp
  403f59:	ret
  403f5a:	add    eax,0x20
  403f5d:	push   eax
  403f5e:	call   DWORD PTR ds:0x40d0ac
  403f64:	pop    ebp
  403f65:	ret
  403f66:	push   ebp
  403f67:	mov    ebp,esp
  403f69:	mov    eax,DWORD PTR [ebp+0x8]
  403f6c:	test   eax,eax
  403f6e:	jne    0x403f85
  403f70:	call   0x402568
  403f75:	mov    DWORD PTR [eax],0x16
  403f7b:	call   0x4016b6
  403f80:	or     eax,0xffffffff
  403f83:	pop    ebp
  403f84:	ret
  403f85:	mov    eax,DWORD PTR [eax+0x10]
  403f88:	pop    ebp
  403f89:	ret
  403f8a:	push   ebp
  403f8b:	mov    ebp,esp
  403f8d:	mov    ecx,DWORD PTR [ebp+0x8]
  403f90:	cmp    ecx,0xfffffffe
  403f93:	jne    0x403fa2
  403f95:	call   0x402568
  403f9a:	mov    DWORD PTR [eax],0x9
  403fa0:	jmp    0x403fda
  403fa2:	test   ecx,ecx
  403fa4:	js     0x403fca
  403fa6:	cmp    ecx,DWORD PTR ds:0x414f44
  403fac:	jae    0x403fca
  403fae:	mov    eax,ecx
  403fb0:	and    ecx,0x1f
  403fb3:	sar    eax,0x5
  403fb6:	shl    ecx,0x6
  403fb9:	mov    eax,DWORD PTR [eax*4+0x413468]
  403fc0:	movsx  eax,BYTE PTR [eax+ecx*1+0x4]
  403fc5:	and    eax,0x40
  403fc8:	pop    ebp
  403fc9:	ret
  403fca:	call   0x402568
  403fcf:	mov    DWORD PTR [eax],0x9
  403fd5:	call   0x4016b6
  403fda:	xor    eax,eax
  403fdc:	pop    ebp
  403fdd:	ret
  403fde:	push   0x10
  403fe0:	push   0x410f90
  403fe5:	call   0x403b60
  403fea:	xor    ebx,ebx
  403fec:	mov    DWORD PTR [ebp-0x1c],ebx
  403fef:	mov    esi,DWORD PTR [ebp+0x8]
  403ff2:	cmp    esi,0xfffffffe
  403ff5:	jne    0x40400e
  403ff7:	call   0x402534
  403ffc:	mov    DWORD PTR [eax],ebx
  403ffe:	call   0x402568
  404003:	mov    DWORD PTR [eax],0x9
  404009:	jmp    0x4040c4
  40400e:	test   esi,esi
  404010:	js     0x4040ad
  404016:	cmp    esi,DWORD PTR ds:0x414f44
  40401c:	jae    0x4040ad
  404022:	mov    ebx,esi
  404024:	sar    ebx,0x5
  404027:	mov    edi,esi
  404029:	and    edi,0x1f
  40402c:	shl    edi,0x6
  40402f:	mov    eax,DWORD PTR [ebx*4+0x413468]
  404036:	movsx  eax,BYTE PTR [eax+edi*1+0x4]
  40403b:	and    eax,0x1
  40403e:	jne    0x40404a
  404040:	call   0x402534
  404045:	and    DWORD PTR [eax],0x0
  404048:	jmp    0x4040b4
  40404a:	push   esi
  40404b:	call   0x4069f1
  404050:	pop    ecx
  404051:	and    DWORD PTR [ebp-0x4],0x0
  404055:	mov    eax,DWORD PTR [ebx*4+0x413468]
  40405c:	test   BYTE PTR [eax+edi*1+0x4],0x1
  404061:	je     0x404076
  404063:	push   DWORD PTR [ebp+0x10]
  404066:	push   DWORD PTR [ebp+0xc]
  404069:	push   esi
  40406a:	call   0x4040cd
  40406f:	add    esp,0xc
  404072:	mov    edi,eax
  404074:	jmp    0x40408c
  404076:	call   0x402568
  40407b:	mov    DWORD PTR [eax],0x9
  404081:	call   0x402534
  404086:	and    DWORD PTR [eax],0x0
  404089:	or     edi,0xffffffff
  40408c:	mov    DWORD PTR [ebp-0x1c],edi
  40408f:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  404096:	call   0x4040a5
  40409b:	mov    eax,edi
  40409d:	jmp    0x4040c7
  40409f:	mov    esi,DWORD PTR [ebp+0x8]
  4040a2:	mov    edi,DWORD PTR [ebp-0x1c]
  4040a5:	push   esi
  4040a6:	call   0x406b6c
  4040ab:	pop    ecx
  4040ac:	ret
  4040ad:	call   0x402534
  4040b2:	mov    DWORD PTR [eax],ebx
  4040b4:	call   0x402568
  4040b9:	mov    DWORD PTR [eax],0x9
  4040bf:	call   0x4016b6
  4040c4:	or     eax,0xffffffff
  4040c7:	call   0x403ba5
  4040cc:	ret
  4040cd:	push   ebp
  4040ce:	mov    ebp,esp
  4040d0:	mov    eax,0x1af0
  4040d5:	call   0x406cf0
  4040da:	mov    eax,ds:0x412000
  4040df:	xor    eax,ebp
  4040e1:	mov    DWORD PTR [ebp-0x4],eax
  4040e4:	and    DWORD PTR [ebp-0x1abc],0x0
  4040eb:	mov    eax,DWORD PTR [ebp+0x8]
  4040ee:	mov    ecx,DWORD PTR [ebp+0xc]
  4040f1:	push   esi
  4040f2:	xor    esi,esi
  4040f4:	mov    DWORD PTR [ebp-0x1ac8],eax
  4040fa:	push   edi
  4040fb:	xor    edi,edi
  4040fd:	mov    DWORD PTR [ebp-0x1ad0],ecx
  404103:	mov    DWORD PTR [ebp-0x1ac0],esi
  404109:	cmp    DWORD PTR [ebp+0x10],esi
  40410c:	jne    0x404115
  40410e:	xor    eax,eax
  404110:	jmp    0x404922
  404115:	test   ecx,ecx
  404117:	jne    0x404138
  404119:	call   0x402534
  40411e:	and    DWORD PTR [eax],esi
  404120:	call   0x402568
  404125:	mov    DWORD PTR [eax],0x16
  40412b:	call   0x4016b6
  404130:	or     eax,0xffffffff
  404133:	jmp    0x404922
  404138:	mov    edx,eax
  40413a:	mov    ecx,eax
  40413c:	sar    edx,0x5
  40413f:	and    ecx,0x1f
  404142:	shl    ecx,0x6
  404145:	mov    DWORD PTR [ebp-0x1ad8],edx
  40414b:	push   ebx
  40414c:	mov    edx,DWORD PTR [edx*4+0x413468]
  404153:	mov    DWORD PTR [ebp-0x1adc],ecx
  404159:	mov    bl,BYTE PTR [ecx+edx*1+0x24]
  40415d:	add    bl,bl
  40415f:	sar    bl,1
  404161:	cmp    bl,0x2
  404164:	je     0x40416b
  404166:	cmp    bl,0x1
  404169:	jne    0x404196
  40416b:	mov    eax,DWORD PTR [ebp+0x10]
  40416e:	not    eax
  404170:	test   al,0x1
  404172:	jne    0x404190
  404174:	call   0x402534
  404179:	and    DWORD PTR [eax],esi
  40417b:	call   0x402568
  404180:	mov    DWORD PTR [eax],0x16
  404186:	call   0x4016b6
  40418b:	jmp    0x404918
  404190:	mov    eax,DWORD PTR [ebp-0x1ac8]
  404196:	test   BYTE PTR [ecx+edx*1+0x4],0x20
  40419b:	je     0x4041ac
  40419d:	push   0x2
  40419f:	push   0x0
  4041a1:	push   0x0
  4041a3:	push   eax
  4041a4:	call   0x404a2e
  4041a9:	add    esp,0x10
  4041ac:	push   DWORD PTR [ebp-0x1ac8]
  4041b2:	call   0x403f8a
  4041b7:	pop    ecx
  4041b8:	test   eax,eax
  4041ba:	je     0x404510
  4041c0:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4041c6:	mov    ecx,DWORD PTR [ebp-0x1adc]
  4041cc:	mov    eax,DWORD PTR [eax*4+0x413468]
  4041d3:	test   BYTE PTR [ecx+eax*1+0x4],0x80
  4041d8:	je     0x404510
  4041de:	call   0x40289b
  4041e3:	xor    ecx,ecx
  4041e5:	mov    eax,DWORD PTR [eax+0x6c]
  4041e8:	cmp    DWORD PTR [eax+0xa8],ecx
  4041ee:	lea    eax,[ebp-0x1ae8]
  4041f4:	push   eax
  4041f5:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4041fb:	sete   cl
  4041fe:	mov    DWORD PTR [ebp-0x1ac4],ecx
  404204:	mov    ecx,DWORD PTR [ebp-0x1adc]
  40420a:	mov    eax,DWORD PTR [eax*4+0x413468]
  404211:	push   DWORD PTR [ecx+eax*1]
  404214:	call   DWORD PTR ds:0x40d0b4
  40421a:	test   eax,eax
  40421c:	je     0x404510
  404222:	cmp    DWORD PTR [ebp-0x1ac4],esi
  404228:	je     0x404232
  40422a:	test   bl,bl
  40422c:	je     0x404510
  404232:	call   DWORD PTR ds:0x40d0b0
  404238:	mov    edx,DWORD PTR [ebp-0x1ad0]
  40423e:	xor    ecx,ecx
  404240:	and    DWORD PTR [ebp-0x1ac8],ecx
  404246:	mov    DWORD PTR [ebp-0x1af0],eax
  40424c:	mov    DWORD PTR [ebp-0x1acc],ecx
  404252:	mov    DWORD PTR [ebp-0x1ad4],edx
  404258:	cmp    DWORD PTR [ebp+0x10],ecx
  40425b:	jbe    0x4048e2
  404261:	mov    eax,DWORD PTR [ebp-0x1ad4]
  404267:	xor    edx,edx
  404269:	mov    DWORD PTR [ebp-0x1ac0],edx
  40426f:	mov    DWORD PTR [ebp-0x1aec],0xa
  404279:	and    DWORD PTR [ebp-0x1ac4],edi
  40427f:	test   bl,bl
  404281:	jne    0x404435
  404287:	mov    dl,BYTE PTR [eax]
  404289:	xor    eax,eax
  40428b:	mov    ecx,DWORD PTR [ebp-0x1adc]
  404291:	cmp    dl,0xa
  404294:	sete   al
  404297:	mov    DWORD PTR [ebp-0x1ae8],eax
  40429d:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4042a3:	mov    eax,DWORD PTR [eax*4+0x413468]
  4042aa:	mov    DWORD PTR [ebp-0x1ac4],eax
  4042b0:	cmp    DWORD PTR [ecx+eax*1+0x38],edi
  4042b4:	je     0x4042d2
  4042b6:	mov    al,BYTE PTR [ecx+eax*1+0x34]
  4042ba:	mov    BYTE PTR [ebp-0xc],al
  4042bd:	mov    eax,DWORD PTR [ebp-0x1ac4]
  4042c3:	mov    BYTE PTR [ebp-0xb],dl
  4042c6:	push   0x2
  4042c8:	and    DWORD PTR [ecx+eax*1+0x38],edi
  4042cc:	lea    eax,[ebp-0xc]
  4042cf:	push   eax
  4042d0:	jmp    0x40432c
  4042d2:	movsx  eax,dl
  4042d5:	push   eax
  4042d6:	call   0x40556b
  4042db:	pop    ecx
  4042dc:	test   eax,eax
  4042de:	je     0x404324
  4042e0:	mov    eax,DWORD PTR [ebp-0x1ad0]
  4042e6:	mov    edx,DWORD PTR [ebp-0x1ad4]
  4042ec:	sub    eax,edx
  4042ee:	add    eax,DWORD PTR [ebp+0x10]
  4042f1:	cmp    eax,0x1
  4042f4:	jbe    0x4044d5
  4042fa:	push   0x2
  4042fc:	push   edx
  4042fd:	lea    eax,[ebp-0x1acc]
  404303:	push   eax
  404304:	call   0x406c87
  404309:	add    esp,0xc
  40430c:	cmp    eax,0xffffffff
  40430f:	je     0x40461a
  404315:	mov    eax,DWORD PTR [ebp-0x1ad4]
  40431b:	inc    eax
  40431c:	inc    DWORD PTR [ebp-0x1ac0]
  404322:	jmp    0x40434a
  404324:	push   0x1
  404326:	push   DWORD PTR [ebp-0x1ad4]
  40432c:	lea    eax,[ebp-0x1acc]
  404332:	push   eax
  404333:	call   0x406c87
  404338:	add    esp,0xc
  40433b:	cmp    eax,0xffffffff
  40433e:	je     0x40461a
  404344:	mov    eax,DWORD PTR [ebp-0x1ad4]
  40434a:	xor    ecx,ecx
  40434c:	inc    eax
  40434d:	inc    DWORD PTR [ebp-0x1ac0]
  404353:	push   ecx
  404354:	push   ecx
  404355:	push   0x5
  404357:	mov    DWORD PTR [ebp-0x1ad4],eax
  40435d:	lea    eax,[ebp-0xc]
  404360:	push   eax
  404361:	push   0x1
  404363:	lea    eax,[ebp-0x1acc]
  404369:	push   eax
  40436a:	push   ecx
  40436b:	push   DWORD PTR [ebp-0x1af0]
  404371:	call   DWORD PTR ds:0x40d044
  404377:	mov    DWORD PTR [ebp-0x1ac4],eax
  40437d:	test   eax,eax
  40437f:	je     0x40461a
  404385:	push   0x0
  404387:	lea    ecx,[ebp-0x1ac8]
  40438d:	push   ecx
  40438e:	mov    ecx,DWORD PTR [ebp-0x1adc]
  404394:	push   eax
  404395:	lea    eax,[ebp-0xc]
  404398:	push   eax
  404399:	mov    eax,DWORD PTR [ebp-0x1ad8]
  40439f:	mov    eax,DWORD PTR [eax*4+0x413468]
  4043a6:	push   DWORD PTR [ecx+eax*1]
  4043a9:	call   DWORD PTR ds:0x40d060
  4043af:	test   eax,eax
  4043b1:	je     0x404503
  4043b7:	mov    esi,DWORD PTR [ebp-0x1ac0]
  4043bd:	mov    ecx,DWORD PTR [ebp-0x1abc]
  4043c3:	add    esi,ecx
  4043c5:	mov    eax,DWORD PTR [ebp-0x1ac4]
  4043cb:	cmp    DWORD PTR [ebp-0x1ac8],eax
  4043d1:	jl     0x404620
  4043d7:	cmp    DWORD PTR [ebp-0x1ae8],edi
  4043dd:	je     0x40442a
  4043df:	mov    ecx,DWORD PTR [ebp-0x1adc]
  4043e5:	lea    eax,[ebp-0x1ac8]
  4043eb:	push   0x0
  4043ed:	push   eax
  4043ee:	push   0x1
  4043f0:	lea    eax,[ebp-0xc]
  4043f3:	mov    BYTE PTR [ebp-0xc],0xd
  4043f7:	push   eax
  4043f8:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4043fe:	mov    eax,DWORD PTR [eax*4+0x413468]
  404405:	push   DWORD PTR [ecx+eax*1]
  404408:	call   DWORD PTR ds:0x40d060
  40440e:	test   eax,eax
  404410:	je     0x404503
  404416:	cmp    DWORD PTR [ebp-0x1ac8],0x1
  40441d:	jl     0x40461a
  404423:	inc    DWORD PTR [ebp-0x1abc]
  404429:	inc    esi
  40442a:	mov    ecx,DWORD PTR [ebp-0x1acc]
  404430:	jmp    0x4044bb
  404435:	cmp    bl,0x1
  404438:	je     0x40443f
  40443a:	cmp    bl,0x2
  40443d:	jne    0x404472
  40443f:	movzx  ecx,WORD PTR [eax]
  404442:	xor    edx,edx
  404444:	cmp    cx,WORD PTR [ebp-0x1aec]
  40444b:	mov    DWORD PTR [ebp-0x1acc],ecx
  404451:	sete   dl
  404454:	add    eax,0x2
  404457:	mov    DWORD PTR [ebp-0x1ac4],edx
  40445d:	mov    edx,DWORD PTR [ebp-0x1ac0]
  404463:	add    edx,0x2
  404466:	mov    DWORD PTR [ebp-0x1ad4],eax
  40446c:	mov    DWORD PTR [ebp-0x1ac0],edx
  404472:	cmp    bl,0x1
  404475:	je     0x40447c
  404477:	cmp    bl,0x2
  40447a:	jne    0x4044c7
  40447c:	push   ecx
  40447d:	call   0x406c9f
  404482:	pop    ecx
  404483:	mov    ecx,DWORD PTR [ebp-0x1acc]
  404489:	cmp    ax,cx
  40448c:	jne    0x404503
  40448e:	add    esi,0x2
  404491:	cmp    DWORD PTR [ebp-0x1ac4],edi
  404497:	je     0x4044bb
  404499:	push   0xd
  40449b:	pop    eax
  40449c:	push   eax
  40449d:	mov    DWORD PTR [ebp-0x1acc],eax
  4044a3:	call   0x406c9f
  4044a8:	pop    ecx
  4044a9:	mov    ecx,DWORD PTR [ebp-0x1acc]
  4044af:	cmp    ax,cx
  4044b2:	jne    0x404503
  4044b4:	inc    esi
  4044b5:	inc    DWORD PTR [ebp-0x1abc]
  4044bb:	mov    edx,DWORD PTR [ebp-0x1ac0]
  4044c1:	mov    eax,DWORD PTR [ebp-0x1ad4]
  4044c7:	cmp    edx,DWORD PTR [ebp+0x10]
  4044ca:	jb     0x404279
  4044d0:	jmp    0x40461a
  4044d5:	mov    ebx,DWORD PTR [ebp-0x1ad8]
  4044db:	inc    esi
  4044dc:	mov    al,BYTE PTR [edx]
  4044de:	mov    edx,DWORD PTR [ebp-0x1adc]
  4044e4:	mov    ecx,DWORD PTR [ebx*4+0x413468]
  4044eb:	mov    BYTE PTR [edx+ecx*1+0x34],al
  4044ef:	mov    eax,DWORD PTR [ebx*4+0x413468]
  4044f6:	mov    DWORD PTR [edx+eax*1+0x38],0x1
  4044fe:	jmp    0x40461a
  404503:	call   DWORD PTR ds:0x40d028
  404509:	mov    edi,eax
  40450b:	jmp    0x40461a
  404510:	mov    eax,DWORD PTR [ebp-0x1ad8]
  404516:	mov    ecx,DWORD PTR [eax*4+0x413468]
  40451d:	mov    eax,DWORD PTR [ebp-0x1adc]
  404523:	test   BYTE PTR [eax+ecx*1+0x4],0x80
  404528:	je     0x4048a3
  40452e:	mov    edx,DWORD PTR [ebp-0x1ad0]
  404534:	xor    edi,edi
  404536:	mov    DWORD PTR [ebp-0x1acc],edi
  40453c:	test   bl,bl
  40453e:	jne    0x404652
  404544:	mov    ebx,DWORD PTR [ebp+0x10]
  404547:	mov    DWORD PTR [ebp-0x1ac8],edx
  40454d:	test   ebx,ebx
  40454f:	je     0x4048e2
  404555:	xor    ecx,ecx
  404557:	lea    edi,[ebp-0x140c]
  40455d:	mov    eax,edx
  40455f:	mov    DWORD PTR [ebp-0x1ac4],ecx
  404565:	sub    eax,DWORD PTR [ebp-0x1ad0]
  40456b:	cmp    eax,ebx
  40456d:	jae    0x4045b3
  40456f:	mov    cl,BYTE PTR [edx]
  404571:	inc    edx
  404572:	inc    eax
  404573:	mov    BYTE PTR [ebp-0x1ae1],cl
  404579:	cmp    cl,0xa
  40457c:	mov    DWORD PTR [ebp-0x1ac8],edx
  404582:	mov    ecx,DWORD PTR [ebp-0x1ac4]
  404588:	jne    0x404595
  40458a:	inc    DWORD PTR [ebp-0x1abc]
  404590:	mov    BYTE PTR [edi],0xd
  404593:	inc    edi
  404594:	inc    ecx
  404595:	mov    dl,BYTE PTR [ebp-0x1ae1]
  40459b:	mov    BYTE PTR [edi],dl
  40459d:	inc    edi
  40459e:	mov    edx,DWORD PTR [ebp-0x1ac8]
  4045a4:	inc    ecx
  4045a5:	mov    DWORD PTR [ebp-0x1ac4],ecx
  4045ab:	cmp    ecx,0x13ff
  4045b1:	jb     0x40456b
  4045b3:	mov    ecx,DWORD PTR [ebp-0x1adc]
  4045b9:	lea    eax,[ebp-0x140c]
  4045bf:	sub    edi,eax
  4045c1:	lea    eax,[ebp-0x1ae0]
  4045c7:	push   0x0
  4045c9:	push   eax
  4045ca:	push   edi
  4045cb:	lea    eax,[ebp-0x140c]
  4045d1:	push   eax
  4045d2:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4045d8:	mov    eax,DWORD PTR [eax*4+0x413468]
  4045df:	push   DWORD PTR [ecx+eax*1]
  4045e2:	call   DWORD PTR ds:0x40d060
  4045e8:	test   eax,eax
  4045ea:	je     0x404503
  4045f0:	add    esi,DWORD PTR [ebp-0x1ae0]
  4045f6:	cmp    DWORD PTR [ebp-0x1ae0],edi
  4045fc:	jl     0x404614
  4045fe:	mov    edx,DWORD PTR [ebp-0x1ac8]
  404604:	mov    eax,edx
  404606:	sub    eax,DWORD PTR [ebp-0x1ad0]
  40460c:	cmp    eax,ebx
  40460e:	jb     0x404555
  404614:	mov    edi,DWORD PTR [ebp-0x1acc]
  40461a:	mov    ecx,DWORD PTR [ebp-0x1abc]
  404620:	test   esi,esi
  404622:	jne    0x40491d
  404628:	test   edi,edi
  40462a:	je     0x4048dc
  404630:	push   0x5
  404632:	pop    ebx
  404633:	cmp    edi,ebx
  404635:	jne    0x4048d3
  40463b:	call   0x402568
  404640:	mov    DWORD PTR [eax],0x9
  404646:	call   0x402534
  40464b:	mov    DWORD PTR [eax],ebx
  40464d:	jmp    0x404918
  404652:	mov    ecx,edx
  404654:	cmp    bl,0x2
  404657:	jne    0x404747
  40465d:	cmp    DWORD PTR [ebp+0x10],esi
  404660:	jbe    0x4048e2
  404666:	mov    DWORD PTR [ebp-0x1aec],0xa
  404670:	and    DWORD PTR [ebp-0x1ae8],0x0
  404677:	lea    ebx,[ebp-0x140c]
  40467d:	mov    eax,ecx
  40467f:	push   0xd
  404681:	sub    eax,edx
  404683:	mov    edx,DWORD PTR [ebp-0x1ae8]
  404689:	pop    esi
  40468a:	cmp    eax,DWORD PTR [ebp+0x10]
  40468d:	jae    0x4046c2
  40468f:	movzx  edi,WORD PTR [ecx]
  404692:	add    eax,0x2
  404695:	add    ecx,0x2
  404698:	cmp    di,WORD PTR [ebp-0x1aec]
  40469f:	jne    0x4046b1
  4046a1:	add    DWORD PTR [ebp-0x1abc],0x2
  4046a8:	mov    WORD PTR [ebx],si
  4046ab:	add    ebx,0x2
  4046ae:	add    edx,0x2
  4046b1:	mov    WORD PTR [ebx],di
  4046b4:	add    edx,0x2
  4046b7:	add    ebx,0x2
  4046ba:	cmp    edx,0x13fe
  4046c0:	jb     0x40468a
  4046c2:	lea    eax,[ebp-0x140c]
  4046c8:	mov    DWORD PTR [ebp-0x1ac4],ecx
  4046ce:	mov    ecx,DWORD PTR [ebp-0x1adc]
  4046d4:	sub    ebx,eax
  4046d6:	push   0x0
  4046d8:	lea    eax,[ebp-0x1ae0]
  4046de:	push   eax
  4046df:	push   ebx
  4046e0:	lea    eax,[ebp-0x140c]
  4046e6:	push   eax
  4046e7:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4046ed:	mov    eax,DWORD PTR [eax*4+0x413468]
  4046f4:	push   DWORD PTR [ecx+eax*1]
  4046f7:	call   DWORD PTR ds:0x40d060
  4046fd:	mov    esi,DWORD PTR [ebp-0x1ac0]
  404703:	mov    edi,DWORD PTR [ebp-0x1acc]
  404709:	test   eax,eax
  40470b:	je     0x404503
  404711:	add    esi,DWORD PTR [ebp-0x1ae0]
  404717:	mov    DWORD PTR [ebp-0x1ac0],esi
  40471d:	cmp    DWORD PTR [ebp-0x1ae0],ebx
  404723:	jl     0x40461a
  404729:	mov    ecx,DWORD PTR [ebp-0x1ac4]
  40472f:	mov    eax,ecx
  404731:	mov    edx,DWORD PTR [ebp-0x1ad0]
  404737:	sub    eax,edx
  404739:	cmp    eax,DWORD PTR [ebp+0x10]
  40473c:	jb     0x404670
  404742:	jmp    0x40461a
  404747:	mov    ebx,DWORD PTR [ebp+0x10]
  40474a:	mov    DWORD PTR [ebp-0x1ac8],ecx
  404750:	test   ebx,ebx
  404752:	je     0x4048e2
  404758:	mov    DWORD PTR [ebp-0x1aec],0xa
  404762:	and    DWORD PTR [ebp-0x1ae8],0x0
  404769:	lea    eax,[ebp-0x1ab8]
  40476f:	mov    edi,DWORD PTR [ebp-0x1ac8]
  404775:	sub    ecx,edx
  404777:	mov    edx,DWORD PTR [ebp-0x1ae8]
  40477d:	cmp    ecx,ebx
  40477f:	jae    0x4047bc
  404781:	movzx  esi,WORD PTR [edi]
  404784:	add    ecx,0x2
  404787:	add    edi,0x2
  40478a:	mov    DWORD PTR [ebp-0x1ac8],edi
  404790:	cmp    si,WORD PTR [ebp-0x1aec]
  404797:	jne    0x4047ab
  404799:	push   0xd
  40479b:	pop    edi
  40479c:	mov    WORD PTR [eax],di
  40479f:	add    eax,0x2
  4047a2:	mov    edi,DWORD PTR [ebp-0x1ac8]
  4047a8:	add    edx,0x2
  4047ab:	mov    WORD PTR [eax],si
  4047ae:	add    edx,0x2
  4047b1:	add    eax,0x2
  4047b4:	cmp    edx,0x6a8
  4047ba:	jb     0x40477d
  4047bc:	xor    esi,esi
  4047be:	lea    ecx,[ebp-0xd64]
  4047c4:	push   esi
  4047c5:	push   esi
  4047c6:	push   0xd55
  4047cb:	push   ecx
  4047cc:	lea    ecx,[ebp-0x1ab8]
  4047d2:	sub    eax,ecx
  4047d4:	cdq
  4047d5:	sub    eax,edx
  4047d7:	sar    eax,1
  4047d9:	push   eax
  4047da:	mov    eax,ecx
  4047dc:	push   eax
  4047dd:	push   esi
  4047de:	push   0xfde9
  4047e3:	call   DWORD PTR ds:0x40d044
  4047e9:	mov    esi,DWORD PTR [ebp-0x1ac0]
  4047ef:	mov    edi,DWORD PTR [ebp-0x1acc]
  4047f5:	mov    DWORD PTR [ebp-0x1ac4],eax
  4047fb:	test   eax,eax
  4047fd:	je     0x404503
  404803:	xor    ecx,ecx
  404805:	mov    DWORD PTR [ebp-0x1ac0],ecx
  40480b:	push   0x0
  40480d:	sub    eax,ecx
  40480f:	lea    edx,[ebp-0x1ae0]
  404815:	push   edx
  404816:	push   eax
  404817:	lea    eax,[ebp-0xd64]
  40481d:	add    eax,ecx
  40481f:	mov    ecx,DWORD PTR [ebp-0x1adc]
  404825:	push   eax
  404826:	mov    eax,DWORD PTR [ebp-0x1ad8]
  40482c:	mov    eax,DWORD PTR [eax*4+0x413468]
  404833:	push   DWORD PTR [ecx+eax*1]
  404836:	call   DWORD PTR ds:0x40d060
  40483c:	test   eax,eax
  40483e:	je     0x40485e
  404840:	mov    ecx,DWORD PTR [ebp-0x1ac0]
  404846:	add    ecx,DWORD PTR [ebp-0x1ae0]
  40484c:	mov    eax,DWORD PTR [ebp-0x1ac4]
  404852:	mov    DWORD PTR [ebp-0x1ac0],ecx
  404858:	cmp    eax,ecx
  40485a:	jg     0x40480b
  40485c:	jmp    0x404878
  40485e:	call   DWORD PTR ds:0x40d028
  404864:	mov    ecx,DWORD PTR [ebp-0x1ac0]
  40486a:	mov    edi,eax
  40486c:	mov    eax,DWORD PTR [ebp-0x1ac4]
  404872:	mov    DWORD PTR [ebp-0x1acc],edi
  404878:	cmp    eax,ecx
  40487a:	jg     0x40461a
  404880:	mov    ecx,DWORD PTR [ebp-0x1ac8]
  404886:	mov    esi,ecx
  404888:	mov    edx,DWORD PTR [ebp-0x1ad0]
  40488e:	sub    esi,edx
  404890:	mov    DWORD PTR [ebp-0x1ac0],esi
  404896:	cmp    esi,ebx
  404898:	jb     0x404762
  40489e:	jmp    0x40461a
  4048a3:	push   0x0
  4048a5:	lea    edx,[ebp-0x1ae0]
  4048ab:	push   edx
  4048ac:	push   DWORD PTR [ebp+0x10]
  4048af:	push   DWORD PTR [ebp-0x1ad0]
  4048b5:	push   DWORD PTR [eax+ecx*1]
  4048b8:	call   DWORD PTR ds:0x40d060
  4048be:	test   eax,eax
  4048c0:	je     0x404503
  4048c6:	mov    esi,DWORD PTR [ebp-0x1ae0]
  4048cc:	xor    edi,edi
  4048ce:	jmp    0x40461a
  4048d3:	push   edi
  4048d4:	call   0x402547
  4048d9:	pop    ecx
  4048da:	jmp    0x404918
  4048dc:	mov    edx,DWORD PTR [ebp-0x1ad0]
  4048e2:	mov    eax,DWORD PTR [ebp-0x1ad8]
  4048e8:	mov    ecx,DWORD PTR [ebp-0x1adc]
  4048ee:	mov    eax,DWORD PTR [eax*4+0x413468]
  4048f5:	test   BYTE PTR [ecx+eax*1+0x4],0x40
  4048fa:	je     0x404905
  4048fc:	cmp    BYTE PTR [edx],0x1a
  4048ff:	jne    0x404905
  404901:	xor    eax,eax
  404903:	jmp    0x404921
  404905:	call   0x402568
  40490a:	mov    DWORD PTR [eax],0x1c
  404910:	call   0x402534
  404915:	and    DWORD PTR [eax],0x0
  404918:	or     eax,0xffffffff
  40491b:	jmp    0x404921
  40491d:	sub    esi,ecx
  40491f:	mov    eax,esi
  404921:	pop    ebx
  404922:	mov    ecx,DWORD PTR [ebp-0x4]
  404925:	pop    edi
  404926:	xor    ecx,ebp
  404928:	pop    esi
  404929:	call   0x40120d
  40492e:	mov    esp,ebp
  404930:	pop    ebp
  404931:	ret
  404932:	push   0x18
  404934:	push   0x410fb0
  404939:	call   0x403b60
  40493e:	or     esi,0xffffffff
  404941:	mov    DWORD PTR [ebp-0x28],esi
  404944:	mov    DWORD PTR [ebp-0x24],esi
  404947:	mov    edi,DWORD PTR [ebp+0x8]
  40494a:	cmp    edi,0xfffffffe
  40494d:	jne    0x404967
  40494f:	call   0x402534
  404954:	and    DWORD PTR [eax],0x0
  404957:	call   0x402568
  40495c:	mov    DWORD PTR [eax],0x9
  404962:	jmp    0x404a24
  404967:	test   edi,edi
  404969:	js     0x404a0c
  40496f:	cmp    edi,DWORD PTR ds:0x414f44
  404975:	jae    0x404a0c
  40497b:	mov    eax,edi
  40497d:	sar    eax,0x5
  404980:	mov    DWORD PTR [ebp-0x1c],eax
  404983:	mov    ebx,edi
  404985:	and    ebx,0x1f
  404988:	shl    ebx,0x6
  40498b:	mov    eax,DWORD PTR [eax*4+0x413468]
  404992:	movsx  eax,BYTE PTR [eax+ebx*1+0x4]
  404997:	and    eax,0x1
  40499a:	je     0x404a0c
  40499c:	push   edi
  40499d:	call   0x4069f1
  4049a2:	pop    ecx
  4049a3:	and    DWORD PTR [ebp-0x4],0x0
  4049a7:	mov    eax,DWORD PTR [ebp-0x1c]
  4049aa:	mov    eax,DWORD PTR [eax*4+0x413468]
  4049b1:	test   BYTE PTR [eax+ebx*1+0x4],0x1
  4049b6:	je     0x4049d0
  4049b8:	push   DWORD PTR [ebp+0x14]
  4049bb:	push   DWORD PTR [ebp+0x10]
  4049be:	push   DWORD PTR [ebp+0xc]
  4049c1:	push   edi
  4049c2:	call   0x404a2e
  4049c7:	add    esp,0x10
  4049ca:	mov    esi,eax
  4049cc:	mov    ebx,edx
  4049ce:	jmp    0x4049e5
  4049d0:	call   0x402568
  4049d5:	mov    DWORD PTR [eax],0x9
  4049db:	call   0x402534
  4049e0:	and    DWORD PTR [eax],0x0
  4049e3:	mov    ebx,esi
  4049e5:	mov    DWORD PTR [ebp-0x28],esi
  4049e8:	mov    DWORD PTR [ebp-0x24],ebx
  4049eb:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4049f2:	call   0x404a04
  4049f7:	mov    edx,ebx
  4049f9:	jmp    0x404a26
  4049fb:	mov    edi,DWORD PTR [ebp+0x8]
  4049fe:	mov    ebx,DWORD PTR [ebp-0x24]
  404a01:	mov    esi,DWORD PTR [ebp-0x28]
  404a04:	push   edi
  404a05:	call   0x406b6c
  404a0a:	pop    ecx
  404a0b:	ret
  404a0c:	call   0x402534
  404a11:	and    DWORD PTR [eax],0x0
  404a14:	call   0x402568
  404a19:	mov    DWORD PTR [eax],0x9
  404a1f:	call   0x4016b6
  404a24:	mov    edx,esi
  404a26:	mov    eax,esi
  404a28:	call   0x403ba5
  404a2d:	ret
  404a2e:	push   ebp
  404a2f:	mov    ebp,esp
  404a31:	push   ecx
  404a32:	push   ecx
  404a33:	push   esi
  404a34:	mov    esi,DWORD PTR [ebp+0x8]
  404a37:	push   edi
  404a38:	push   esi
  404a39:	call   0x406b05
  404a3e:	or     edi,0xffffffff
  404a41:	pop    ecx
  404a42:	cmp    eax,edi
  404a44:	jne    0x404a57
  404a46:	call   0x402568
  404a4b:	mov    DWORD PTR [eax],0x9
  404a51:	mov    eax,edi
  404a53:	mov    edx,edi
  404a55:	jmp    0x404a9b
  404a57:	push   DWORD PTR [ebp+0x14]
  404a5a:	lea    ecx,[ebp-0x8]
  404a5d:	push   ecx
  404a5e:	push   DWORD PTR [ebp+0x10]
  404a61:	push   DWORD PTR [ebp+0xc]
  404a64:	push   eax
  404a65:	call   DWORD PTR ds:0x40d0b8
  404a6b:	test   eax,eax
  404a6d:	jne    0x404a7e
  404a6f:	call   DWORD PTR ds:0x40d028
  404a75:	push   eax
  404a76:	call   0x402547
  404a7b:	pop    ecx
  404a7c:	jmp    0x404a51
  404a7e:	mov    eax,esi
  404a80:	and    esi,0x1f
  404a83:	sar    eax,0x5
  404a86:	shl    esi,0x6
  404a89:	mov    eax,DWORD PTR [eax*4+0x413468]
  404a90:	and    BYTE PTR [eax+esi*1+0x4],0xfd
  404a95:	mov    eax,DWORD PTR [ebp-0x8]
  404a98:	mov    edx,DWORD PTR [ebp-0x4]
  404a9b:	pop    edi
  404a9c:	pop    esi
  404a9d:	mov    esp,ebp
  404a9f:	pop    ebp
  404aa0:	ret
  404aa1:	push   ebp
  404aa2:	mov    ebp,esp
  404aa4:	inc    DWORD PTR ds:0x413ca4
  404aaa:	push   esi
  404aab:	mov    esi,0x1000
  404ab0:	push   esi
  404ab1:	call   0x4057df
  404ab6:	pop    ecx
  404ab7:	mov    ecx,DWORD PTR [ebp+0x8]
  404aba:	mov    DWORD PTR [ecx+0x8],eax
  404abd:	test   eax,eax
  404abf:	je     0x404aca
  404ac1:	or     DWORD PTR [ecx+0xc],0x8
  404ac5:	mov    DWORD PTR [ecx+0x18],esi
  404ac8:	jmp    0x404adb
  404aca:	or     DWORD PTR [ecx+0xc],0x4
  404ace:	lea    eax,[ecx+0x14]
  404ad1:	mov    DWORD PTR [ecx+0x8],eax
  404ad4:	mov    DWORD PTR [ecx+0x18],0x2
  404adb:	mov    eax,DWORD PTR [ecx+0x8]
  404ade:	and    DWORD PTR [ecx+0x4],0x0
  404ae2:	mov    DWORD PTR [ecx],eax
  404ae4:	pop    esi
  404ae5:	pop    ebp
  404ae6:	ret
  404ae7:	push   ebp
  404ae8:	mov    ebp,esp
  404aea:	mov    edx,DWORD PTR [ebp+0x8]
  404aed:	xor    ecx,ecx
  404aef:	push   ebx
  404af0:	push   esi
  404af1:	inc    ecx
  404af2:	push   edi
  404af3:	mov    eax,ecx
  404af5:	lock xadd DWORD PTR [edx],eax
  404af9:	mov    esi,DWORD PTR [edx+0x78]
  404afc:	test   esi,esi
  404afe:	je     0x404b06
  404b00:	mov    eax,ecx
  404b02:	lock xadd DWORD PTR [esi],eax
  404b06:	mov    esi,DWORD PTR [edx+0x80]
  404b0c:	test   esi,esi
  404b0e:	je     0x404b16
  404b10:	mov    eax,ecx
  404b12:	lock xadd DWORD PTR [esi],eax
  404b16:	mov    esi,DWORD PTR [edx+0x7c]
  404b19:	test   esi,esi
  404b1b:	je     0x404b23
  404b1d:	mov    eax,ecx
  404b1f:	lock xadd DWORD PTR [esi],eax
  404b23:	mov    esi,DWORD PTR [edx+0x88]
  404b29:	test   esi,esi
  404b2b:	je     0x404b33
  404b2d:	mov    eax,ecx
  404b2f:	lock xadd DWORD PTR [esi],eax
  404b33:	push   0x6
  404b35:	lea    esi,[edx+0x1c]
  404b38:	pop    ebx
  404b39:	cmp    DWORD PTR [esi-0x8],0x412974
  404b40:	je     0x404b4e
  404b42:	mov    edi,DWORD PTR [esi]
  404b44:	test   edi,edi
  404b46:	je     0x404b4e
  404b48:	mov    eax,ecx
  404b4a:	lock xadd DWORD PTR [edi],eax
  404b4e:	cmp    DWORD PTR [esi-0xc],0x0
  404b52:	je     0x404b61
  404b54:	mov    edi,DWORD PTR [esi-0x4]
  404b57:	test   edi,edi
  404b59:	je     0x404b61
  404b5b:	mov    eax,ecx
  404b5d:	lock xadd DWORD PTR [edi],eax
  404b61:	add    esi,0x10
  404b64:	dec    ebx
  404b65:	jne    0x404b39
  404b67:	mov    eax,DWORD PTR [edx+0x9c]
  404b6d:	add    eax,0xb0
  404b72:	lock xadd DWORD PTR [eax],ecx
  404b76:	inc    ecx
  404b77:	pop    edi
  404b78:	pop    esi
  404b79:	pop    ebx
  404b7a:	pop    ebp
  404b7b:	ret
  404b7c:	push   ebp
  404b7d:	mov    ebp,esp
  404b7f:	push   ebx
  404b80:	push   esi
  404b81:	mov    esi,DWORD PTR [ebp+0x8]
  404b84:	xor    ebx,ebx
  404b86:	push   edi
  404b87:	mov    eax,DWORD PTR [esi+0x84]
  404b8d:	test   eax,eax
  404b8f:	je     0x404bf7
  404b91:	cmp    eax,0x412d08
  404b96:	je     0x404bf7
  404b98:	mov    eax,DWORD PTR [esi+0x78]
  404b9b:	test   eax,eax
  404b9d:	je     0x404bf7
  404b9f:	cmp    DWORD PTR [eax],ebx
  404ba1:	jne    0x404bf7
  404ba3:	mov    eax,DWORD PTR [esi+0x80]
  404ba9:	test   eax,eax
  404bab:	je     0x404bc4
  404bad:	cmp    DWORD PTR [eax],ebx
  404baf:	jne    0x404bc4
  404bb1:	push   eax
  404bb2:	call   0x40575f
  404bb7:	push   DWORD PTR [esi+0x84]
  404bbd:	call   0x406d1b
  404bc2:	pop    ecx
  404bc3:	pop    ecx
  404bc4:	mov    eax,DWORD PTR [esi+0x7c]
  404bc7:	test   eax,eax
  404bc9:	je     0x404be2
  404bcb:	cmp    DWORD PTR [eax],ebx
  404bcd:	jne    0x404be2
  404bcf:	push   eax
  404bd0:	call   0x40575f
  404bd5:	push   DWORD PTR [esi+0x84]
  404bdb:	call   0x406e17
  404be0:	pop    ecx
  404be1:	pop    ecx
  404be2:	push   DWORD PTR [esi+0x78]
  404be5:	call   0x40575f
  404bea:	push   DWORD PTR [esi+0x84]
  404bf0:	call   0x40575f
  404bf5:	pop    ecx
  404bf6:	pop    ecx
  404bf7:	mov    eax,DWORD PTR [esi+0x88]
  404bfd:	test   eax,eax
  404bff:	je     0x404c45
  404c01:	cmp    DWORD PTR [eax],ebx
  404c03:	jne    0x404c45
  404c05:	mov    eax,DWORD PTR [esi+0x8c]
  404c0b:	sub    eax,0xfe
  404c10:	push   eax
  404c11:	call   0x40575f
  404c16:	mov    eax,DWORD PTR [esi+0x94]
  404c1c:	mov    edi,0x80
  404c21:	sub    eax,edi
  404c23:	push   eax
  404c24:	call   0x40575f
  404c29:	mov    eax,DWORD PTR [esi+0x98]
  404c2f:	sub    eax,edi
  404c31:	push   eax
  404c32:	call   0x40575f
  404c37:	push   DWORD PTR [esi+0x88]
  404c3d:	call   0x40575f
  404c42:	add    esp,0x10
  404c45:	mov    eax,DWORD PTR [esi+0x9c]
  404c4b:	cmp    eax,0x412978
  404c50:	je     0x404c6d
  404c52:	cmp    DWORD PTR [eax+0xb0],ebx
  404c58:	jne    0x404c6d
  404c5a:	push   eax
  404c5b:	call   0x406e7e
  404c60:	push   DWORD PTR [esi+0x9c]
  404c66:	call   0x40575f
  404c6b:	pop    ecx
  404c6c:	pop    ecx
  404c6d:	push   0x6
  404c6f:	pop    eax
  404c70:	lea    ebx,[esi+0xa0]
  404c76:	mov    DWORD PTR [ebp+0x8],eax
  404c79:	lea    edi,[esi+0x1c]
  404c7c:	cmp    DWORD PTR [edi-0x8],0x412974
  404c83:	je     0x404ca2
  404c85:	mov    eax,DWORD PTR [edi]
  404c87:	test   eax,eax
  404c89:	je     0x404c9f
  404c8b:	cmp    DWORD PTR [eax],0x0
  404c8e:	jne    0x404c9f
  404c90:	push   eax
  404c91:	call   0x40575f
  404c96:	push   DWORD PTR [ebx]
  404c98:	call   0x40575f
  404c9d:	pop    ecx
  404c9e:	pop    ecx
  404c9f:	mov    eax,DWORD PTR [ebp+0x8]
  404ca2:	cmp    DWORD PTR [edi-0xc],0x0
  404ca6:	je     0x404cbe
  404ca8:	mov    eax,DWORD PTR [edi-0x4]
  404cab:	test   eax,eax
  404cad:	je     0x404cbb
  404caf:	cmp    DWORD PTR [eax],0x0
  404cb2:	jne    0x404cbb
  404cb4:	push   eax
  404cb5:	call   0x40575f
  404cba:	pop    ecx
  404cbb:	mov    eax,DWORD PTR [ebp+0x8]
  404cbe:	add    ebx,0x4
  404cc1:	add    edi,0x10
  404cc4:	dec    eax
  404cc5:	mov    DWORD PTR [ebp+0x8],eax
  404cc8:	jne    0x404c7c
  404cca:	push   esi
  404ccb:	call   0x40575f
  404cd0:	pop    ecx
  404cd1:	pop    edi
  404cd2:	pop    esi
  404cd3:	pop    ebx
  404cd4:	pop    ebp
  404cd5:	ret
  404cd6:	push   ebp
  404cd7:	mov    ebp,esp
  404cd9:	mov    edx,DWORD PTR [ebp+0x8]
  404cdc:	test   edx,edx
  404cde:	je     0x404d72
  404ce4:	push   ebx
  404ce5:	push   esi
  404ce6:	or     esi,0xffffffff
  404ce9:	push   edi
  404cea:	mov    eax,esi
  404cec:	lock xadd DWORD PTR [edx],eax
  404cf0:	mov    ecx,DWORD PTR [edx+0x78]
  404cf3:	test   ecx,ecx
  404cf5:	je     0x404cfd
  404cf7:	mov    eax,esi
  404cf9:	lock xadd DWORD PTR [ecx],eax
  404cfd:	mov    ecx,DWORD PTR [edx+0x80]
  404d03:	test   ecx,ecx
  404d05:	je     0x404d0d
  404d07:	mov    eax,esi
  404d09:	lock xadd DWORD PTR [ecx],eax
  404d0d:	mov    ecx,DWORD PTR [edx+0x7c]
  404d10:	test   ecx,ecx
  404d12:	je     0x404d1a
  404d14:	mov    eax,esi
  404d16:	lock xadd DWORD PTR [ecx],eax
  404d1a:	mov    ecx,DWORD PTR [edx+0x88]
  404d20:	test   ecx,ecx
  404d22:	je     0x404d2a
  404d24:	mov    eax,esi
  404d26:	lock xadd DWORD PTR [ecx],eax
  404d2a:	push   0x6
  404d2c:	lea    ecx,[edx+0x1c]
  404d2f:	pop    ebx
  404d30:	cmp    DWORD PTR [ecx-0x8],0x412974
  404d37:	je     0x404d45
  404d39:	mov    edi,DWORD PTR [ecx]
  404d3b:	test   edi,edi
  404d3d:	je     0x404d45
  404d3f:	mov    eax,esi
  404d41:	lock xadd DWORD PTR [edi],eax
  404d45:	cmp    DWORD PTR [ecx-0xc],0x0
  404d49:	je     0x404d58
  404d4b:	mov    edi,DWORD PTR [ecx-0x4]
  404d4e:	test   edi,edi
  404d50:	je     0x404d58
  404d52:	mov    eax,esi
  404d54:	lock xadd DWORD PTR [edi],eax
  404d58:	add    ecx,0x10
  404d5b:	dec    ebx
  404d5c:	jne    0x404d30
  404d5e:	mov    ecx,DWORD PTR [edx+0x9c]
  404d64:	add    ecx,0xb0
  404d6a:	lock xadd DWORD PTR [ecx],esi
  404d6e:	dec    esi
  404d6f:	pop    edi
  404d70:	pop    esi
  404d71:	pop    ebx
  404d72:	mov    eax,edx
  404d74:	pop    ebp
  404d75:	ret
  404d76:	push   0xc
  404d78:	push   0x410fd0
  404d7d:	call   0x403b60
  404d82:	and    DWORD PTR [ebp-0x1c],0x0
  404d86:	call   0x40289b
  404d8b:	mov    esi,eax
  404d8d:	mov    ecx,DWORD PTR ds:0x412b98
  404d93:	test   DWORD PTR [esi+0x70],ecx
  404d96:	je     0x404dba
  404d98:	cmp    DWORD PTR [esi+0x6c],0x0
  404d9c:	je     0x404dba
  404d9e:	call   0x40289b
  404da3:	mov    esi,DWORD PTR [eax+0x6c]
  404da6:	test   esi,esi
  404da8:	jne    0x404db2
  404daa:	push   0x20
  404dac:	call   0x402ab2
  404db1:	pop    ecx
  404db2:	mov    eax,esi
  404db4:	call   0x403ba5
  404db9:	ret
  404dba:	push   0xc
  404dbc:	call   0x405969
  404dc1:	pop    ecx
  404dc2:	and    DWORD PTR [ebp-0x4],0x0
  404dc6:	push   DWORD PTR ds:0x412adc
  404dcc:	lea    eax,[esi+0x6c]
  404dcf:	push   eax
  404dd0:	call   0x404df6
  404dd5:	pop    ecx
  404dd6:	pop    ecx
  404dd7:	mov    esi,eax
  404dd9:	mov    DWORD PTR [ebp-0x1c],esi
  404ddc:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  404de3:	call   0x404ded
  404de8:	jmp    0x404da6
  404dea:	mov    esi,DWORD PTR [ebp-0x1c]
  404ded:	push   0xc
  404def:	call   0x405ad3
  404df4:	pop    ecx
  404df5:	ret
  404df6:	push   ebp
  404df7:	mov    ebp,esp
  404df9:	push   edi
  404dfa:	mov    edi,DWORD PTR [ebp+0xc]
  404dfd:	test   edi,edi
  404dff:	je     0x404e3c
  404e01:	mov    eax,DWORD PTR [ebp+0x8]
  404e04:	test   eax,eax
  404e06:	je     0x404e3c
  404e08:	push   esi
  404e09:	mov    esi,DWORD PTR [eax]
  404e0b:	cmp    esi,edi
  404e0d:	je     0x404e37
  404e0f:	push   edi
  404e10:	mov    DWORD PTR [eax],edi
  404e12:	call   0x404ae7
  404e17:	pop    ecx
  404e18:	test   esi,esi
  404e1a:	je     0x404e37
  404e1c:	push   esi
  404e1d:	call   0x404cd6
  404e22:	cmp    DWORD PTR [esi],0x0
  404e25:	pop    ecx
  404e26:	jne    0x404e37
  404e28:	cmp    esi,0x412ae0
  404e2e:	je     0x404e37
  404e30:	push   esi
  404e31:	call   0x404b7c
  404e36:	pop    ecx
  404e37:	mov    eax,edi
  404e39:	pop    esi
  404e3a:	jmp    0x404e3e
  404e3c:	xor    eax,eax
  404e3e:	pop    edi
  404e3f:	pop    ebp
  404e40:	ret
  404e41:	cmp    DWORD PTR ds:0x414f54,0x0
  404e48:	jne    0x404e5c
  404e4a:	push   0xfffffffd
  404e4c:	call   0x40519e
  404e51:	pop    ecx
  404e52:	mov    DWORD PTR ds:0x414f54,0x1
  404e5c:	xor    eax,eax
  404e5e:	ret
  404e5f:	push   ebp
  404e60:	mov    ebp,esp
  404e62:	mov    eax,DWORD PTR [ebp+0x8]
  404e65:	sub    eax,0x3a4
  404e6a:	je     0x404e92
  404e6c:	sub    eax,0x4
  404e6f:	je     0x404e8b
  404e71:	sub    eax,0xd
  404e74:	je     0x404e84
  404e76:	dec    eax
  404e77:	je     0x404e7d
  404e79:	xor    eax,eax
  404e7b:	pop    ebp
  404e7c:	ret
  404e7d:	mov    eax,ds:0x40e060
  404e82:	pop    ebp
  404e83:	ret
  404e84:	mov    eax,ds:0x40e05c
  404e89:	pop    ebp
  404e8a:	ret
  404e8b:	mov    eax,ds:0x40e058
  404e90:	pop    ebp
  404e91:	ret
  404e92:	mov    eax,ds:0x40e054
  404e97:	pop    ebp
  404e98:	ret
  404e99:	push   ebp
  404e9a:	mov    ebp,esp
  404e9c:	sub    esp,0x10
  404e9f:	lea    ecx,[ebp-0x10]
  404ea2:	push   0x0
  404ea4:	call   0x401840
  404ea9:	and    DWORD PTR ds:0x413cc0,0x0
  404eb0:	mov    eax,DWORD PTR [ebp+0x8]
  404eb3:	cmp    eax,0xfffffffe
  404eb6:	jne    0x404eca
  404eb8:	mov    DWORD PTR ds:0x413cc0,0x1
  404ec2:	call   DWORD PTR ds:0x40d0c4
  404ec8:	jmp    0x404ef6
  404eca:	cmp    eax,0xfffffffd
  404ecd:	jne    0x404ee1
  404ecf:	mov    DWORD PTR ds:0x413cc0,0x1
  404ed9:	call   DWORD PTR ds:0x40d0c0
  404edf:	jmp    0x404ef6
  404ee1:	cmp    eax,0xfffffffc
  404ee4:	jne    0x404ef6
  404ee6:	mov    eax,DWORD PTR [ebp-0x10]
  404ee9:	mov    DWORD PTR ds:0x413cc0,0x1
  404ef3:	mov    eax,DWORD PTR [eax+0x4]
  404ef6:	cmp    BYTE PTR [ebp-0x4],0x0
  404efa:	je     0x404f03
  404efc:	mov    ecx,DWORD PTR [ebp-0x8]
  404eff:	and    DWORD PTR [ecx+0x70],0xfffffffd
  404f03:	mov    esp,ebp
  404f05:	pop    ebp
  404f06:	ret
  404f07:	push   ebp
  404f08:	mov    ebp,esp
  404f0a:	push   ebx
  404f0b:	mov    ebx,DWORD PTR [ebp+0x8]
  404f0e:	push   esi
  404f0f:	push   edi
  404f10:	push   0x101
  404f15:	xor    edi,edi
  404f17:	lea    esi,[ebx+0x18]
  404f1a:	push   edi
  404f1b:	push   esi
  404f1c:	call   0x403d60
  404f21:	mov    DWORD PTR [ebx+0x4],edi
  404f24:	xor    eax,eax
  404f26:	mov    DWORD PTR [ebx+0x8],edi
  404f29:	add    esp,0xc
  404f2c:	mov    DWORD PTR [ebx+0x21c],edi
  404f32:	mov    ecx,0x101
  404f37:	lea    edi,[ebx+0xc]
  404f3a:	stos   DWORD PTR es:[edi],eax
  404f3b:	stos   DWORD PTR es:[edi],eax
  404f3c:	stos   DWORD PTR es:[edi],eax
  404f3d:	mov    edi,0x412658
  404f42:	sub    edi,ebx
  404f44:	mov    al,BYTE PTR [edi+esi*1]
  404f47:	mov    BYTE PTR [esi],al
  404f49:	inc    esi
  404f4a:	dec    ecx
  404f4b:	jne    0x404f44
  404f4d:	lea    ecx,[ebx+0x119]
  404f53:	mov    edx,0x100
  404f58:	mov    al,BYTE PTR [ecx+edi*1]
  404f5b:	mov    BYTE PTR [ecx],al
  404f5d:	inc    ecx
  404f5e:	dec    edx
  404f5f:	jne    0x404f58
  404f61:	pop    edi
  404f62:	pop    esi
  404f63:	pop    ebx
  404f64:	pop    ebp
  404f65:	ret
  404f66:	push   ebp
  404f67:	mov    ebp,esp
  404f69:	sub    esp,0x520
  404f6f:	mov    eax,ds:0x412000
  404f74:	xor    eax,ebp
  404f76:	mov    DWORD PTR [ebp-0x4],eax
  404f79:	push   ebx
  404f7a:	push   esi
  404f7b:	mov    esi,DWORD PTR [ebp+0x8]
  404f7e:	lea    eax,[ebp-0x518]
  404f84:	push   edi
  404f85:	push   eax
  404f86:	push   DWORD PTR [esi+0x4]
  404f89:	call   DWORD PTR ds:0x40d0c8
  404f8f:	xor    ebx,ebx
  404f91:	mov    edi,0x100
  404f96:	test   eax,eax
  404f98:	je     0x40508e
  404f9e:	mov    eax,ebx
  404fa0:	mov    BYTE PTR [ebp+eax*1-0x104],al
  404fa7:	inc    eax
  404fa8:	cmp    eax,edi
  404faa:	jb     0x404fa0
  404fac:	mov    al,BYTE PTR [ebp-0x512]
  404fb2:	lea    ecx,[ebp-0x512]
  404fb8:	mov    BYTE PTR [ebp-0x104],0x20
  404fbf:	jmp    0x404fe0
  404fc1:	movzx  edx,BYTE PTR [ecx+0x1]
  404fc5:	movzx  eax,al
  404fc8:	jmp    0x404fd7
  404fca:	cmp    eax,edi
  404fcc:	jae    0x404fdb
  404fce:	mov    BYTE PTR [ebp+eax*1-0x104],0x20
  404fd6:	inc    eax
  404fd7:	cmp    eax,edx
  404fd9:	jbe    0x404fca
  404fdb:	add    ecx,0x2
  404fde:	mov    al,BYTE PTR [ecx]
  404fe0:	test   al,al
  404fe2:	jne    0x404fc1
  404fe4:	push   ebx
  404fe5:	push   DWORD PTR [esi+0x4]
  404fe8:	lea    eax,[ebp-0x504]
  404fee:	push   eax
  404fef:	push   edi
  404ff0:	lea    eax,[ebp-0x104]
  404ff6:	push   eax
  404ff7:	push   0x1
  404ff9:	push   ebx
  404ffa:	call   0x40755e
  404fff:	push   ebx
  405000:	push   DWORD PTR [esi+0x4]
  405003:	lea    eax,[ebp-0x204]
  405009:	push   edi
  40500a:	push   eax
  40500b:	push   edi
  40500c:	lea    eax,[ebp-0x104]
  405012:	push   eax
  405013:	push   edi
  405014:	push   DWORD PTR [esi+0x21c]
  40501a:	push   ebx
  40501b:	call   0x407402
  405020:	add    esp,0x40
  405023:	lea    eax,[ebp-0x304]
  405029:	push   ebx
  40502a:	push   DWORD PTR [esi+0x4]
  40502d:	push   edi
  40502e:	push   eax
  40502f:	push   edi
  405030:	lea    eax,[ebp-0x104]
  405036:	push   eax
  405037:	push   0x200
  40503c:	push   DWORD PTR [esi+0x21c]
  405042:	push   ebx
  405043:	call   0x407402
  405048:	add    esp,0x24
  40504b:	mov    ecx,ebx
  40504d:	movzx  eax,WORD PTR [ebp+ecx*2-0x504]
  405055:	test   al,0x1
  405057:	je     0x405067
  405059:	or     BYTE PTR [esi+ecx*1+0x19],0x10
  40505e:	mov    al,BYTE PTR [ebp+ecx*1-0x204]
  405065:	jmp    0x405077
  405067:	test   al,0x2
  405069:	je     0x405080
  40506b:	or     BYTE PTR [esi+ecx*1+0x19],0x20
  405070:	mov    al,BYTE PTR [ebp+ecx*1-0x304]
  405077:	mov    BYTE PTR [esi+ecx*1+0x119],al
  40507e:	jmp    0x405087
  405080:	mov    BYTE PTR [esi+ecx*1+0x119],bl
  405087:	inc    ecx
  405088:	cmp    ecx,edi
  40508a:	jb     0x40504d
  40508c:	jmp    0x4050e7
  40508e:	push   0xffffff9f
  405090:	lea    edx,[esi+0x119]
  405096:	mov    ecx,ebx
  405098:	pop    eax
  405099:	sub    eax,edx
  40509b:	mov    DWORD PTR [ebp-0x520],eax
  4050a1:	add    edx,ecx
  4050a3:	add    eax,edx
  4050a5:	mov    DWORD PTR [ebp-0x51c],eax
  4050ab:	add    eax,0x20
  4050ae:	cmp    eax,0x19
  4050b1:	ja     0x4050bd
  4050b3:	or     BYTE PTR [esi+ecx*1+0x19],0x10
  4050b8:	lea    eax,[ecx+0x20]
  4050bb:	jmp    0x4050d0
  4050bd:	cmp    DWORD PTR [ebp-0x51c],0x19
  4050c4:	ja     0x4050d4
  4050c6:	lea    eax,[esi+ecx*1]
  4050c9:	or     BYTE PTR [eax+0x19],0x20
  4050cd:	lea    eax,[ecx-0x20]
  4050d0:	mov    BYTE PTR [edx],al
  4050d2:	jmp    0x4050d6
  4050d4:	mov    BYTE PTR [edx],bl
  4050d6:	mov    eax,DWORD PTR [ebp-0x520]
  4050dc:	lea    edx,[esi+0x119]
  4050e2:	inc    ecx
  4050e3:	cmp    ecx,edi
  4050e5:	jb     0x4050a1
  4050e7:	mov    ecx,DWORD PTR [ebp-0x4]
  4050ea:	pop    edi
  4050eb:	pop    esi
  4050ec:	xor    ecx,ebp
  4050ee:	pop    ebx
  4050ef:	call   0x40120d
  4050f4:	mov    esp,ebp
  4050f6:	pop    ebp
  4050f7:	ret
  4050f8:	push   0xc
  4050fa:	push   0x410ff0
  4050ff:	call   0x403b60
  405104:	xor    esi,esi
  405106:	mov    DWORD PTR [ebp-0x1c],esi
  405109:	call   0x40289b
  40510e:	mov    edi,eax
  405110:	mov    ecx,DWORD PTR ds:0x412b98
  405116:	test   DWORD PTR [edi+0x70],ecx
  405119:	je     0x405137
  40511b:	cmp    DWORD PTR [edi+0x6c],esi
  40511e:	je     0x405137
  405120:	mov    esi,DWORD PTR [edi+0x68]
  405123:	test   esi,esi
  405125:	jne    0x40512f
  405127:	push   0x20
  405129:	call   0x402ab2
  40512e:	pop    ecx
  40512f:	mov    eax,esi
  405131:	call   0x403ba5
  405136:	ret
  405137:	push   0xd
  405139:	call   0x405969
  40513e:	pop    ecx
  40513f:	mov    DWORD PTR [ebp-0x4],esi
  405142:	mov    esi,DWORD PTR [edi+0x68]
  405145:	mov    DWORD PTR [ebp-0x1c],esi
  405148:	cmp    esi,DWORD PTR ds:0x41287c
  40514e:	je     0x405184
  405150:	test   esi,esi
  405152:	je     0x40516c
  405154:	or     eax,0xffffffff
  405157:	lock xadd DWORD PTR [esi],eax
  40515b:	jne    0x40516c
  40515d:	cmp    esi,0x412658
  405163:	je     0x40516c
  405165:	push   esi
  405166:	call   0x40575f
  40516b:	pop    ecx
  40516c:	mov    eax,ds:0x41287c
  405171:	mov    DWORD PTR [edi+0x68],eax
  405174:	mov    esi,DWORD PTR ds:0x41287c
  40517a:	mov    DWORD PTR [ebp-0x1c],esi
  40517d:	xor    eax,eax
  40517f:	inc    eax
  405180:	lock xadd DWORD PTR [esi],eax
  405184:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  40518b:	call   0x405195
  405190:	jmp    0x405123
  405192:	mov    esi,DWORD PTR [ebp-0x1c]
  405195:	push   0xd
  405197:	call   0x405ad3
  40519c:	pop    ecx
  40519d:	ret
  40519e:	push   0x10
  4051a0:	push   0x411010
  4051a5:	call   0x403b60
  4051aa:	or     edi,0xffffffff
  4051ad:	call   0x40289b
  4051b2:	mov    ebx,eax
  4051b4:	mov    DWORD PTR [ebp-0x20],ebx
  4051b7:	call   0x4050f8
  4051bc:	mov    esi,DWORD PTR [ebx+0x68]
  4051bf:	push   DWORD PTR [ebp+0x8]
  4051c2:	call   0x404e99
  4051c7:	pop    ecx
  4051c8:	mov    DWORD PTR [ebp+0x8],eax
  4051cb:	cmp    eax,DWORD PTR [esi+0x4]
  4051ce:	je     0x40533c
  4051d4:	push   0x220
  4051d9:	call   0x4057df
  4051de:	pop    ecx
  4051df:	mov    ebx,eax
  4051e1:	test   ebx,ebx
  4051e3:	je     0x40533e
  4051e9:	mov    ecx,0x88
  4051ee:	mov    eax,DWORD PTR [ebp-0x20]
  4051f1:	mov    esi,DWORD PTR [eax+0x68]
  4051f4:	mov    edi,ebx
  4051f6:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  4051f8:	xor    esi,esi
  4051fa:	mov    DWORD PTR [ebx],esi
  4051fc:	push   ebx
  4051fd:	push   DWORD PTR [ebp+0x8]
  405200:	call   0x405346
  405205:	pop    ecx
  405206:	pop    ecx
  405207:	mov    edi,eax
  405209:	mov    DWORD PTR [ebp+0x8],edi
  40520c:	test   edi,edi
  40520e:	jne    0x40531b
  405214:	mov    eax,DWORD PTR [ebp-0x20]
  405217:	mov    ecx,DWORD PTR [eax+0x68]
  40521a:	or     edx,0xffffffff
  40521d:	lock xadd DWORD PTR [ecx],edx
  405221:	jne    0x405238
  405223:	mov    ecx,DWORD PTR [eax+0x68]
  405226:	cmp    ecx,0x412658
  40522c:	je     0x405238
  40522e:	push   ecx
  40522f:	call   0x40575f
  405234:	pop    ecx
  405235:	mov    eax,DWORD PTR [ebp-0x20]
  405238:	mov    DWORD PTR [eax+0x68],ebx
  40523b:	xor    eax,eax
  40523d:	inc    eax
  40523e:	lock xadd DWORD PTR [ebx],eax
  405242:	mov    eax,DWORD PTR [ebp-0x20]
  405245:	test   BYTE PTR [eax+0x70],0x2
  405249:	jne    0x40533e
  40524f:	test   BYTE PTR ds:0x412b98,0x1
  405256:	jne    0x40533e
  40525c:	push   0xd
  40525e:	call   0x405969
  405263:	pop    ecx
  405264:	mov    DWORD PTR [ebp-0x4],esi
  405267:	mov    eax,DWORD PTR [ebx+0x4]
  40526a:	mov    ds:0x413ca8,eax
  40526f:	mov    eax,DWORD PTR [ebx+0x8]
  405272:	mov    ds:0x413cac,eax
  405277:	mov    eax,DWORD PTR [ebx+0x21c]
  40527d:	mov    ds:0x413cbc,eax
  405282:	mov    ecx,esi
  405284:	mov    DWORD PTR [ebp-0x1c],ecx
  405287:	cmp    ecx,0x5
  40528a:	jge    0x40529c
  40528c:	mov    ax,WORD PTR [ebx+ecx*2+0xc]
  405291:	mov    WORD PTR [ecx*2+0x413cb0],ax
  405299:	inc    ecx
  40529a:	jmp    0x405284
  40529c:	mov    ecx,esi
  40529e:	mov    DWORD PTR [ebp-0x1c],ecx
  4052a1:	cmp    ecx,0x101
  4052a7:	jge    0x4052b6
  4052a9:	mov    al,BYTE PTR [ecx+ebx*1+0x18]
  4052ad:	mov    BYTE PTR [ecx+0x412450],al
  4052b3:	inc    ecx
  4052b4:	jmp    0x40529e
  4052b6:	mov    DWORD PTR [ebp-0x1c],esi
  4052b9:	cmp    esi,0x100
  4052bf:	jge    0x4052d1
  4052c1:	mov    al,BYTE PTR [esi+ebx*1+0x119]
  4052c8:	mov    BYTE PTR [esi+0x412558],al
  4052ce:	inc    esi
  4052cf:	jmp    0x4052b6
  4052d1:	mov    eax,ds:0x41287c
  4052d6:	or     ecx,0xffffffff
  4052d9:	lock xadd DWORD PTR [eax],ecx
  4052dd:	jne    0x4052f2
  4052df:	mov    eax,ds:0x41287c
  4052e4:	cmp    eax,0x412658
  4052e9:	je     0x4052f2
  4052eb:	push   eax
  4052ec:	call   0x40575f
  4052f1:	pop    ecx
  4052f2:	mov    DWORD PTR ds:0x41287c,ebx
  4052f8:	xor    eax,eax
  4052fa:	inc    eax
  4052fb:	lock xadd DWORD PTR [ebx],eax
  4052ff:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405306:	call   0x405310
  40530b:	jmp    0x40533e
  40530d:	mov    edi,DWORD PTR [ebp+0x8]
  405310:	push   0xd
  405312:	call   0x405ad3
  405317:	pop    ecx
  405318:	ret
  405319:	jmp    0x40533e
  40531b:	cmp    edi,0xffffffff
  40531e:	jne    0x40533e
  405320:	cmp    ebx,0x412658
  405326:	je     0x40532f
  405328:	push   ebx
  405329:	call   0x40575f
  40532e:	pop    ecx
  40532f:	call   0x402568
  405334:	mov    DWORD PTR [eax],0x16
  40533a:	jmp    0x40533e
  40533c:	xor    edi,edi
  40533e:	mov    eax,edi
  405340:	call   0x403ba5
  405345:	ret
  405346:	push   ebp
  405347:	mov    ebp,esp
  405349:	sub    esp,0x20
  40534c:	mov    eax,ds:0x412000
  405351:	xor    eax,ebp
  405353:	mov    DWORD PTR [ebp-0x4],eax
  405356:	push   ebx
  405357:	push   esi
  405358:	push   DWORD PTR [ebp+0x8]
  40535b:	mov    esi,DWORD PTR [ebp+0xc]
  40535e:	call   0x404e99
  405363:	mov    ebx,eax
  405365:	pop    ecx
  405366:	test   ebx,ebx
  405368:	jne    0x405378
  40536a:	push   esi
  40536b:	call   0x404f07
  405370:	pop    ecx
  405371:	xor    eax,eax
  405373:	jmp    0x405521
  405378:	push   edi
  405379:	xor    edi,edi
  40537b:	mov    ecx,edi
  40537d:	mov    eax,edi
  40537f:	mov    DWORD PTR [ebp-0x1c],ecx
  405382:	cmp    DWORD PTR [eax+0x412880],ebx
  405388:	je     0x405476
  40538e:	inc    ecx
  40538f:	add    eax,0x30
  405392:	mov    DWORD PTR [ebp-0x1c],ecx
  405395:	cmp    eax,0xf0
  40539a:	jb     0x405382
  40539c:	cmp    ebx,0xfde8
  4053a2:	je     0x40546e
  4053a8:	cmp    ebx,0xfde9
  4053ae:	je     0x40546e
  4053b4:	movzx  eax,bx
  4053b7:	push   eax
  4053b8:	call   DWORD PTR ds:0x40d0bc
  4053be:	test   eax,eax
  4053c0:	je     0x40546e
  4053c6:	lea    eax,[ebp-0x18]
  4053c9:	push   eax
  4053ca:	push   ebx
  4053cb:	call   DWORD PTR ds:0x40d0c8
  4053d1:	test   eax,eax
  4053d3:	je     0x40545b
  4053d9:	push   0x101
  4053de:	lea    eax,[esi+0x18]
  4053e1:	push   edi
  4053e2:	push   eax
  4053e3:	call   0x403d60
  4053e8:	mov    DWORD PTR [esi+0x4],ebx
  4053eb:	add    esp,0xc
  4053ee:	xor    ebx,ebx
  4053f0:	mov    DWORD PTR [esi+0x21c],edi
  4053f6:	inc    ebx
  4053f7:	cmp    DWORD PTR [ebp-0x18],ebx
  4053fa:	jbe    0x40544b
  4053fc:	cmp    BYTE PTR [ebp-0x12],0x0
  405400:	lea    eax,[ebp-0x12]
  405403:	je     0x405426
  405405:	mov    cl,BYTE PTR [eax+0x1]
  405408:	test   cl,cl
  40540a:	je     0x405426
  40540c:	movzx  edx,cl
  40540f:	movzx  ecx,BYTE PTR [eax]
  405412:	jmp    0x40541a
  405414:	or     BYTE PTR [esi+ecx*1+0x19],0x4
  405419:	inc    ecx
  40541a:	cmp    ecx,edx
  40541c:	jbe    0x405414
  40541e:	add    eax,0x2
  405421:	cmp    BYTE PTR [eax],0x0
  405424:	jne    0x405405
  405426:	lea    eax,[esi+0x1a]
  405429:	mov    ecx,0xfe
  40542e:	or     BYTE PTR [eax],0x8
  405431:	inc    eax
  405432:	dec    ecx
  405433:	jne    0x40542e
  405435:	push   DWORD PTR [esi+0x4]
  405438:	call   0x404e5f
  40543d:	add    esp,0x4
  405440:	mov    DWORD PTR [esi+0x21c],eax
  405446:	mov    DWORD PTR [esi+0x8],ebx
  405449:	jmp    0x40544e
  40544b:	mov    DWORD PTR [esi+0x8],edi
  40544e:	xor    eax,eax
  405450:	lea    edi,[esi+0xc]
  405453:	stos   DWORD PTR es:[edi],eax
  405454:	stos   DWORD PTR es:[edi],eax
  405455:	stos   DWORD PTR es:[edi],eax
  405456:	jmp    0x405517
  40545b:	cmp    DWORD PTR ds:0x413cc0,edi
  405461:	je     0x40546e
  405463:	push   esi
  405464:	call   0x404f07
  405469:	jmp    0x40551d
  40546e:	or     eax,0xffffffff
  405471:	jmp    0x405520
  405476:	push   0x101
  40547b:	lea    eax,[esi+0x18]
  40547e:	push   edi
  40547f:	push   eax
  405480:	call   0x403d60
  405485:	add    esp,0xc
  405488:	imul   eax,DWORD PTR [ebp-0x1c],0x30
  40548c:	mov    DWORD PTR [ebp-0x20],eax
  40548f:	lea    eax,[eax+0x412890]
  405495:	mov    DWORD PTR [ebp-0x1c],eax
  405498:	cmp    BYTE PTR [eax],0x0
  40549b:	mov    ecx,eax
  40549d:	je     0x4054d4
  40549f:	mov    al,BYTE PTR [ecx+0x1]
  4054a2:	test   al,al
  4054a4:	je     0x4054d1
  4054a6:	movzx  edx,BYTE PTR [ecx]
  4054a9:	movzx  eax,al
  4054ac:	jmp    0x4054c5
  4054ae:	cmp    edx,0x100
  4054b4:	jae    0x4054c9
  4054b6:	mov    al,BYTE PTR [edi+0x412878]
  4054bc:	or     BYTE PTR [esi+edx*1+0x19],al
  4054c0:	inc    edx
  4054c1:	movzx  eax,BYTE PTR [ecx+0x1]
  4054c5:	cmp    edx,eax
  4054c7:	jbe    0x4054ae
  4054c9:	add    ecx,0x2
  4054cc:	cmp    BYTE PTR [ecx],0x0
  4054cf:	jne    0x40549f
  4054d1:	mov    eax,DWORD PTR [ebp-0x1c]
  4054d4:	inc    edi
  4054d5:	add    eax,0x8
  4054d8:	mov    DWORD PTR [ebp-0x1c],eax
  4054db:	cmp    edi,0x4
  4054de:	jb     0x405498
  4054e0:	push   ebx
  4054e1:	mov    DWORD PTR [esi+0x4],ebx
  4054e4:	mov    DWORD PTR [esi+0x8],0x1
  4054eb:	call   0x404e5f
  4054f0:	add    esp,0x4
  4054f3:	mov    DWORD PTR [esi+0x21c],eax
  4054f9:	mov    eax,DWORD PTR [ebp-0x20]
  4054fc:	lea    ecx,[esi+0xc]
  4054ff:	push   0x6
  405501:	lea    edx,[eax+0x412884]
  405507:	pop    edi
  405508:	mov    ax,WORD PTR [edx]
  40550b:	lea    edx,[edx+0x2]
  40550e:	mov    WORD PTR [ecx],ax
  405511:	lea    ecx,[ecx+0x2]
  405514:	dec    edi
  405515:	jne    0x405508
  405517:	push   esi
  405518:	call   0x404f66
  40551d:	pop    ecx
  40551e:	xor    eax,eax
  405520:	pop    edi
  405521:	mov    ecx,DWORD PTR [ebp-0x4]
  405524:	pop    esi
  405525:	xor    ecx,ebp
  405527:	pop    ebx
  405528:	call   0x40120d
  40552d:	mov    esp,ebp
  40552f:	pop    ebp
  405530:	ret
  405531:	push   ebp
  405532:	mov    ebp,esp
  405534:	sub    esp,0x10
  405537:	push   DWORD PTR [ebp+0xc]
  40553a:	lea    ecx,[ebp-0x10]
  40553d:	call   0x401840
  405542:	mov    eax,DWORD PTR [ebp+0x8]
  405545:	movzx  ecx,al
  405548:	mov    eax,DWORD PTR [ebp-0x10]
  40554b:	mov    eax,DWORD PTR [eax+0x90]
  405551:	movzx  eax,WORD PTR [eax+ecx*2]
  405555:	and    eax,0x8000
  40555a:	cmp    BYTE PTR [ebp-0x4],0x0
  40555e:	je     0x405567
  405560:	mov    ecx,DWORD PTR [ebp-0x8]
  405563:	and    DWORD PTR [ecx+0x70],0xfffffffd
  405567:	mov    esp,ebp
  405569:	pop    ebp
  40556a:	ret
  40556b:	push   ebp
  40556c:	mov    ebp,esp
  40556e:	push   0x0
  405570:	push   DWORD PTR [ebp+0x8]
  405573:	call   0x405531
  405578:	pop    ecx
  405579:	pop    ecx
  40557a:	pop    ebp
  40557b:	ret
  40557c:	int3
  40557d:	int3
  40557e:	int3
  40557f:	int3
  405580:	mov    ecx,DWORD PTR [esp+0x4]
  405584:	test   ecx,0x3
  40558a:	je     0x4055b0
  40558c:	mov    al,BYTE PTR [ecx]
  40558e:	add    ecx,0x1
  405591:	test   al,al
  405593:	je     0x4055e3
  405595:	test   ecx,0x3
  40559b:	jne    0x40558c
  40559d:	add    eax,0x0
  4055a2:	lea    esp,[esp+0x0]
  4055a9:	lea    esp,[esp+0x0]
  4055b0:	mov    eax,DWORD PTR [ecx]
  4055b2:	mov    edx,0x7efefeff
  4055b7:	add    edx,eax
  4055b9:	xor    eax,0xffffffff
  4055bc:	xor    eax,edx
  4055be:	add    ecx,0x4
  4055c1:	test   eax,0x81010100
  4055c6:	je     0x4055b0
  4055c8:	mov    eax,DWORD PTR [ecx-0x4]
  4055cb:	test   al,al
  4055cd:	je     0x405601
  4055cf:	test   ah,ah
  4055d1:	je     0x4055f7
  4055d3:	test   eax,0xff0000
  4055d8:	je     0x4055ed
  4055da:	test   eax,0xff000000
  4055df:	je     0x4055e3
  4055e1:	jmp    0x4055b0
  4055e3:	lea    eax,[ecx-0x1]
  4055e6:	mov    ecx,DWORD PTR [esp+0x4]
  4055ea:	sub    eax,ecx
  4055ec:	ret
  4055ed:	lea    eax,[ecx-0x2]
  4055f0:	mov    ecx,DWORD PTR [esp+0x4]
  4055f4:	sub    eax,ecx
  4055f6:	ret
  4055f7:	lea    eax,[ecx-0x3]
  4055fa:	mov    ecx,DWORD PTR [esp+0x4]
  4055fe:	sub    eax,ecx
  405600:	ret
  405601:	lea    eax,[ecx-0x4]
  405604:	mov    ecx,DWORD PTR [esp+0x4]
  405608:	sub    eax,ecx
  40560a:	ret
  40560b:	mov    ecx,DWORD PTR ds:0x412000
  405611:	xor    eax,eax
  405613:	or     ecx,0x1
  405616:	cmp    DWORD PTR ds:0x413cc4,ecx
  40561c:	sete   al
  40561f:	ret
  405620:	push   ebp
  405621:	mov    ebp,esp
  405623:	sub    esp,0x10
  405626:	push   ebx
  405627:	mov    ebx,DWORD PTR [ebp+0xc]
  40562a:	push   edi
  40562b:	mov    edi,DWORD PTR [ebp+0x10]
  40562e:	test   ebx,ebx
  405630:	jne    0x405644
  405632:	test   edi,edi
  405634:	je     0x405644
  405636:	mov    eax,DWORD PTR [ebp+0x8]
  405639:	test   eax,eax
  40563b:	je     0x405640
  40563d:	and    DWORD PTR [eax],0x0
  405640:	xor    eax,eax
  405642:	jmp    0x4056c3
  405644:	mov    eax,DWORD PTR [ebp+0x8]
  405647:	test   eax,eax
  405649:	je     0x40564e
  40564b:	or     DWORD PTR [eax],0xffffffff
  40564e:	push   esi
  40564f:	cmp    edi,0x7fffffff
  405655:	jbe    0x405668
  405657:	call   0x402568
  40565c:	push   0x16
  40565e:	pop    esi
  40565f:	mov    DWORD PTR [eax],esi
  405661:	call   0x4016b6
  405666:	jmp    0x4056c0
  405668:	push   DWORD PTR [ebp+0x18]
  40566b:	lea    ecx,[ebp-0x10]
  40566e:	call   0x401840
  405673:	mov    eax,DWORD PTR [ebp-0x10]
  405676:	xor    esi,esi
  405678:	cmp    DWORD PTR [eax+0xa8],esi
  40567e:	jne    0x4056e2
  405680:	mov    ax,WORD PTR [ebp+0x14]
  405684:	mov    ecx,0xff
  405689:	cmp    ax,cx
  40568c:	jbe    0x4056c9
  40568e:	test   ebx,ebx
  405690:	je     0x4056a1
  405692:	test   edi,edi
  405694:	je     0x4056a1
  405696:	push   edi
  405697:	push   esi
  405698:	push   ebx
  405699:	call   0x403d60
  40569e:	add    esp,0xc
  4056a1:	call   0x402568
  4056a6:	mov    DWORD PTR [eax],0x2a
  4056ac:	call   0x402568
  4056b1:	mov    esi,DWORD PTR [eax]
  4056b3:	cmp    BYTE PTR [ebp-0x4],0x0
  4056b7:	je     0x4056c0
  4056b9:	mov    ecx,DWORD PTR [ebp-0x8]
  4056bc:	and    DWORD PTR [ecx+0x70],0xfffffffd
  4056c0:	mov    eax,esi
  4056c2:	pop    esi
  4056c3:	pop    edi
  4056c4:	pop    ebx
  4056c5:	mov    esp,ebp
  4056c7:	pop    ebp
  4056c8:	ret
  4056c9:	test   ebx,ebx
  4056cb:	je     0x4056d3
  4056cd:	test   edi,edi
  4056cf:	je     0x405730
  4056d1:	mov    BYTE PTR [ebx],al
  4056d3:	mov    eax,DWORD PTR [ebp+0x8]
  4056d6:	test   eax,eax
  4056d8:	je     0x4056b3
  4056da:	mov    DWORD PTR [eax],0x1
  4056e0:	jmp    0x4056b3
  4056e2:	lea    ecx,[ebp+0xc]
  4056e5:	mov    DWORD PTR [ebp+0xc],esi
  4056e8:	push   ecx
  4056e9:	push   esi
  4056ea:	push   edi
  4056eb:	push   ebx
  4056ec:	push   0x1
  4056ee:	lea    ecx,[ebp+0x14]
  4056f1:	push   ecx
  4056f2:	push   esi
  4056f3:	push   DWORD PTR [eax+0x4]
  4056f6:	call   DWORD PTR ds:0x40d044
  4056fc:	mov    ecx,eax
  4056fe:	test   ecx,ecx
  405700:	je     0x405712
  405702:	cmp    DWORD PTR [ebp+0xc],esi
  405705:	jne    0x4056a1
  405707:	mov    eax,DWORD PTR [ebp+0x8]
  40570a:	test   eax,eax
  40570c:	je     0x4056b3
  40570e:	mov    DWORD PTR [eax],ecx
  405710:	jmp    0x4056b3
  405712:	call   DWORD PTR ds:0x40d028
  405718:	cmp    eax,0x7a
  40571b:	jne    0x4056a1
  40571d:	test   ebx,ebx
  40571f:	je     0x405730
  405721:	test   edi,edi
  405723:	je     0x405730
  405725:	push   edi
  405726:	push   esi
  405727:	push   ebx
  405728:	call   0x403d60
  40572d:	add    esp,0xc
  405730:	call   0x402568
  405735:	push   0x22
  405737:	pop    esi
  405738:	mov    DWORD PTR [eax],esi
  40573a:	call   0x4016b6
  40573f:	jmp    0x4056b3
  405744:	push   ebp
  405745:	mov    ebp,esp
  405747:	push   0x0
  405749:	push   DWORD PTR [ebp+0x14]
  40574c:	push   DWORD PTR [ebp+0x10]
  40574f:	push   DWORD PTR [ebp+0xc]
  405752:	push   DWORD PTR [ebp+0x8]
  405755:	call   0x405620
  40575a:	add    esp,0x14
  40575d:	pop    ebp
  40575e:	ret
  40575f:	push   ebp
  405760:	mov    ebp,esp
  405762:	cmp    DWORD PTR [ebp+0x8],0x0
  405766:	je     0x405795
  405768:	push   DWORD PTR [ebp+0x8]
  40576b:	push   0x0
  40576d:	push   DWORD PTR ds:0x413460
  405773:	call   DWORD PTR ds:0x40d0cc
  405779:	test   eax,eax
  40577b:	jne    0x405795
  40577d:	push   esi
  40577e:	call   0x402568
  405783:	mov    esi,eax
  405785:	call   DWORD PTR ds:0x40d028
  40578b:	push   eax
  40578c:	call   0x40257b
  405791:	pop    ecx
  405792:	mov    DWORD PTR [esi],eax
  405794:	pop    esi
  405795:	pop    ebp
  405796:	ret
  405797:	push   ebp
  405798:	mov    ebp,esp
  40579a:	push   esi
  40579b:	push   edi
  40579c:	xor    esi,esi
  40579e:	push   0x0
  4057a0:	push   DWORD PTR [ebp+0xc]
  4057a3:	push   DWORD PTR [ebp+0x8]
  4057a6:	call   0x4076db
  4057ab:	mov    edi,eax
  4057ad:	add    esp,0xc
  4057b0:	test   edi,edi
  4057b2:	jne    0x4057d9
  4057b4:	cmp    DWORD PTR ds:0x413cc8,eax
  4057ba:	jbe    0x4057d9
  4057bc:	push   esi
  4057bd:	call   0x403aba
  4057c2:	add    esi,0x3e8
  4057c8:	pop    ecx
  4057c9:	cmp    esi,DWORD PTR ds:0x413cc8
  4057cf:	jbe    0x4057d4
  4057d1:	or     esi,0xffffffff
  4057d4:	cmp    esi,0xffffffff
  4057d7:	jne    0x40579e
  4057d9:	mov    eax,edi
  4057db:	pop    edi
  4057dc:	pop    esi
  4057dd:	pop    ebp
  4057de:	ret
  4057df:	push   ebp
  4057e0:	mov    ebp,esp
  4057e2:	push   ebx
  4057e3:	push   esi
  4057e4:	push   edi
  4057e5:	mov    edi,DWORD PTR ds:0x413cc8
  4057eb:	xor    esi,esi
  4057ed:	push   DWORD PTR [ebp+0x8]
  4057f0:	call   0x40759e
  4057f5:	mov    ebx,eax
  4057f7:	pop    ecx
  4057f8:	test   ebx,ebx
  4057fa:	jne    0x40581f
  4057fc:	test   edi,edi
  4057fe:	je     0x40581f
  405800:	push   esi
  405801:	call   0x403aba
  405806:	mov    edi,DWORD PTR ds:0x413cc8
  40580c:	add    esi,0x3e8
  405812:	pop    ecx
  405813:	cmp    esi,edi
  405815:	jbe    0x40581a
  405817:	or     esi,0xffffffff
  40581a:	cmp    esi,0xffffffff
  40581d:	jne    0x4057ed
  40581f:	pop    edi
  405820:	pop    esi
  405821:	mov    eax,ebx
  405823:	pop    ebx
  405824:	pop    ebp
  405825:	ret
  405826:	push   ebp
  405827:	mov    ebp,esp
  405829:	push   esi
  40582a:	push   edi
  40582b:	xor    esi,esi
  40582d:	push   DWORD PTR [ebp+0xc]
  405830:	push   DWORD PTR [ebp+0x8]
  405833:	call   0x407630
  405838:	mov    edi,eax
  40583a:	pop    ecx
  40583b:	pop    ecx
  40583c:	test   edi,edi
  40583e:	jne    0x40586a
  405840:	cmp    DWORD PTR [ebp+0xc],eax
  405843:	je     0x40586a
  405845:	cmp    DWORD PTR ds:0x413cc8,eax
  40584b:	jbe    0x40586a
  40584d:	push   esi
  40584e:	call   0x403aba
  405853:	add    esi,0x3e8
  405859:	pop    ecx
  40585a:	cmp    esi,DWORD PTR ds:0x413cc8
  405860:	jbe    0x405865
  405862:	or     esi,0xffffffff
  405865:	cmp    esi,0xffffffff
  405868:	jne    0x40582d
  40586a:	mov    eax,edi
  40586c:	pop    edi
  40586d:	pop    esi
  40586e:	pop    ebp
  40586f:	ret
  405870:	push   esi
  405871:	mov    eax,DWORD PTR [esp+0x14]
  405875:	or     eax,eax
  405877:	jne    0x4058a1
  405879:	mov    ecx,DWORD PTR [esp+0x10]
  40587d:	mov    eax,DWORD PTR [esp+0xc]
  405881:	xor    edx,edx
  405883:	div    ecx
  405885:	mov    ebx,eax
  405887:	mov    eax,DWORD PTR [esp+0x8]
  40588b:	div    ecx
  40588d:	mov    esi,eax
  40588f:	mov    eax,ebx
  405891:	mul    DWORD PTR [esp+0x10]
  405895:	mov    ecx,eax
  405897:	mov    eax,esi
  405899:	mul    DWORD PTR [esp+0x10]
  40589d:	add    edx,ecx
  40589f:	jmp    0x4058e8
  4058a1:	mov    ecx,eax
  4058a3:	mov    ebx,DWORD PTR [esp+0x10]
  4058a7:	mov    edx,DWORD PTR [esp+0xc]
  4058ab:	mov    eax,DWORD PTR [esp+0x8]
  4058af:	shr    ecx,1
  4058b1:	rcr    ebx,1
  4058b3:	shr    edx,1
  4058b5:	rcr    eax,1
  4058b7:	or     ecx,ecx
  4058b9:	jne    0x4058af
  4058bb:	div    ebx
  4058bd:	mov    esi,eax
  4058bf:	mul    DWORD PTR [esp+0x14]
  4058c3:	mov    ecx,eax
  4058c5:	mov    eax,DWORD PTR [esp+0x10]
  4058c9:	mul    esi
  4058cb:	add    edx,ecx
  4058cd:	jb     0x4058dd
  4058cf:	cmp    edx,DWORD PTR [esp+0xc]
  4058d3:	ja     0x4058dd
  4058d5:	jb     0x4058e6
  4058d7:	cmp    eax,DWORD PTR [esp+0x8]
  4058db:	jbe    0x4058e6
  4058dd:	dec    esi
  4058de:	sub    eax,DWORD PTR [esp+0x10]
  4058e2:	sbb    edx,DWORD PTR [esp+0x14]
  4058e6:	xor    ebx,ebx
  4058e8:	sub    eax,DWORD PTR [esp+0x8]
  4058ec:	sbb    edx,DWORD PTR [esp+0xc]
  4058f0:	neg    edx
  4058f2:	neg    eax
  4058f4:	sbb    edx,0x0
  4058f7:	mov    ecx,edx
  4058f9:	mov    edx,ebx
  4058fb:	mov    ebx,ecx
  4058fd:	mov    ecx,eax
  4058ff:	mov    eax,esi
  405901:	pop    esi
  405902:	ret    0x10
  405905:	push   esi
  405906:	xor    esi,esi
  405908:	push   DWORD PTR [esi+0x412b9c]
  40590e:	call   DWORD PTR ds:0x40d020
  405914:	mov    DWORD PTR [esi+0x412b9c],eax
  40591a:	add    esi,0x4
  40591d:	cmp    esi,0x28
  405920:	jb     0x405908
  405922:	pop    esi
  405923:	ret
  405924:	push   0x8
  405926:	push   0x411030
  40592b:	call   0x403b60
  405930:	call   0x40289b
  405935:	mov    eax,DWORD PTR [eax+0x78]
  405938:	test   eax,eax
  40593a:	je     0x405952
  40593c:	and    DWORD PTR [ebp-0x4],0x0
  405940:	call   eax
  405942:	jmp    0x40594b
  405944:	xor    eax,eax
  405946:	inc    eax
  405947:	ret
  405948:	mov    esp,DWORD PTR [ebp-0x18]
  40594b:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405952:	call   0x40775e
  405957:	int3
  405958:	push   0x405924
  40595d:	call   DWORD PTR ds:0x40d020
  405963:	mov    ds:0x413ccc,eax
  405968:	ret
  405969:	push   ebp
  40596a:	mov    ebp,esp
  40596c:	push   esi
  40596d:	mov    esi,DWORD PTR [ebp+0x8]
  405970:	cmp    DWORD PTR [esi*8+0x412bc8],0x0
  405978:	jne    0x40598d
  40597a:	push   esi
  40597b:	call   0x4059f1
  405980:	pop    ecx
  405981:	test   eax,eax
  405983:	jne    0x40598d
  405985:	push   0x11
  405987:	call   0x402ab2
  40598c:	pop    ecx
  40598d:	push   DWORD PTR [esi*8+0x412bc8]
  405994:	call   DWORD PTR ds:0x40d0a8
  40599a:	pop    esi
  40599b:	pop    ebp
  40599c:	ret
  40599d:	push   esi
  40599e:	push   edi
  40599f:	mov    esi,0x412bc8
  4059a4:	mov    edi,esi
  4059a6:	push   ebx
  4059a7:	mov    ebx,DWORD PTR [edi]
  4059a9:	test   ebx,ebx
  4059ab:	je     0x4059c4
  4059ad:	cmp    DWORD PTR [edi+0x4],0x1
  4059b1:	je     0x4059c4
  4059b3:	push   ebx
  4059b4:	call   DWORD PTR ds:0x40d054
  4059ba:	push   ebx
  4059bb:	call   0x40575f
  4059c0:	and    DWORD PTR [edi],0x0
  4059c3:	pop    ecx
  4059c4:	add    edi,0x8
  4059c7:	cmp    edi,0x412ce8
  4059cd:	jl     0x4059a7
  4059cf:	pop    ebx
  4059d0:	cmp    DWORD PTR [esi],0x0
  4059d3:	je     0x4059e3
  4059d5:	cmp    DWORD PTR [esi+0x4],0x1
  4059d9:	jne    0x4059e3
  4059db:	push   DWORD PTR [esi]
  4059dd:	call   DWORD PTR ds:0x40d054
  4059e3:	add    esi,0x8
  4059e6:	cmp    esi,0x412ce8
  4059ec:	jl     0x4059d0
  4059ee:	pop    edi
  4059ef:	pop    esi
  4059f0:	ret
  4059f1:	push   0x8
  4059f3:	push   0x411050
  4059f8:	call   0x403b60
  4059fd:	cmp    DWORD PTR ds:0x413460,0x0
  405a04:	jne    0x405a1e
  405a06:	call   0x403342
  405a0b:	push   0x1e
  405a0d:	call   0x40339f
  405a12:	push   0xff
  405a17:	call   0x402a9c
  405a1c:	pop    ecx
  405a1d:	pop    ecx
  405a1e:	mov    edi,DWORD PTR [ebp+0x8]
  405a21:	xor    ebx,ebx
  405a23:	cmp    DWORD PTR [edi*8+0x412bc8],ebx
  405a2a:	jne    0x405a88
  405a2c:	push   0x18
  405a2e:	call   0x4057df
  405a33:	pop    ecx
  405a34:	mov    esi,eax
  405a36:	test   esi,esi
  405a38:	jne    0x405a49
  405a3a:	call   0x402568
  405a3f:	mov    DWORD PTR [eax],0xc
  405a45:	xor    eax,eax
  405a47:	jmp    0x405a8b
  405a49:	push   0xa
  405a4b:	call   0x405969
  405a50:	pop    ecx
  405a51:	mov    DWORD PTR [ebp-0x4],ebx
  405a54:	cmp    DWORD PTR [edi*8+0x412bc8],ebx
  405a5b:	jne    0x405a75
  405a5d:	push   ebx
  405a5e:	push   0xfa0
  405a63:	push   esi
  405a64:	call   0x4037b3
  405a69:	add    esp,0xc
  405a6c:	mov    DWORD PTR [edi*8+0x412bc8],esi
  405a73:	jmp    0x405a7c
  405a75:	push   esi
  405a76:	call   0x40575f
  405a7b:	pop    ecx
  405a7c:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405a83:	call   0x405a91
  405a88:	xor    eax,eax
  405a8a:	inc    eax
  405a8b:	call   0x403ba5
  405a90:	ret
  405a91:	push   0xa
  405a93:	call   0x405ad3
  405a98:	pop    ecx
  405a99:	ret
  405a9a:	push   esi
  405a9b:	push   edi
  405a9c:	mov    esi,0x412bc8
  405aa1:	mov    edi,0x413cd0
  405aa6:	cmp    DWORD PTR [esi+0x4],0x1
  405aaa:	jne    0x405ac2
  405aac:	push   0x0
  405aae:	mov    DWORD PTR [esi],edi
  405ab0:	add    edi,0x18
  405ab3:	push   0xfa0
  405ab8:	push   DWORD PTR [esi]
  405aba:	call   0x4037b3
  405abf:	add    esp,0xc
  405ac2:	add    esi,0x8
  405ac5:	cmp    esi,0x412ce8
  405acb:	jl     0x405aa6
  405acd:	xor    eax,eax
  405acf:	pop    edi
  405ad0:	inc    eax
  405ad1:	pop    esi
  405ad2:	ret
  405ad3:	push   ebp
  405ad4:	mov    ebp,esp
  405ad6:	mov    eax,DWORD PTR [ebp+0x8]
  405ad9:	push   DWORD PTR [eax*8+0x412bc8]
  405ae0:	call   DWORD PTR ds:0x40d0ac
  405ae6:	pop    ebp
  405ae7:	ret
  405ae8:	int3
  405ae9:	int3
  405aea:	int3
  405aeb:	int3
  405aec:	int3
  405aed:	int3
  405aee:	int3
  405aef:	int3
  405af0:	push   ebp
  405af1:	mov    ebp,esp
  405af3:	mov    eax,DWORD PTR [ebp+0x8]
  405af6:	xor    edx,edx
  405af8:	push   ebx
  405af9:	push   esi
  405afa:	push   edi
  405afb:	mov    ecx,DWORD PTR [eax+0x3c]
  405afe:	add    ecx,eax
  405b00:	movzx  eax,WORD PTR [ecx+0x14]
  405b04:	movzx  ebx,WORD PTR [ecx+0x6]
  405b08:	add    eax,0x18
  405b0b:	add    eax,ecx
  405b0d:	test   ebx,ebx
  405b0f:	je     0x405b2c
  405b11:	mov    edi,DWORD PTR [ebp+0xc]
  405b14:	mov    esi,DWORD PTR [eax+0xc]
  405b17:	cmp    edi,esi
  405b19:	jb     0x405b24
  405b1b:	mov    ecx,DWORD PTR [eax+0x8]
  405b1e:	add    ecx,esi
  405b20:	cmp    edi,ecx
  405b22:	jb     0x405b2e
  405b24:	inc    edx
  405b25:	add    eax,0x28
  405b28:	cmp    edx,ebx
  405b2a:	jb     0x405b14
  405b2c:	xor    eax,eax
  405b2e:	pop    edi
  405b2f:	pop    esi
  405b30:	pop    ebx
  405b31:	pop    ebp
  405b32:	ret
  405b33:	int3
  405b34:	int3
  405b35:	int3
  405b36:	int3
  405b37:	int3
  405b38:	int3
  405b39:	int3
  405b3a:	int3
  405b3b:	int3
  405b3c:	int3
  405b3d:	int3
  405b3e:	int3
  405b3f:	int3
  405b40:	push   ebp
  405b41:	mov    ebp,esp
  405b43:	push   0xfffffffe
  405b45:	push   0x411070
  405b4a:	push   0x403bc0
  405b4f:	mov    eax,fs:0x0
  405b55:	push   eax
  405b56:	sub    esp,0x8
  405b59:	push   ebx
  405b5a:	push   esi
  405b5b:	push   edi
  405b5c:	mov    eax,ds:0x412000
  405b61:	xor    DWORD PTR [ebp-0x8],eax
  405b64:	xor    eax,ebp
  405b66:	push   eax
  405b67:	lea    eax,[ebp-0x10]
  405b6a:	mov    fs:0x0,eax
  405b70:	mov    DWORD PTR [ebp-0x18],esp
  405b73:	mov    DWORD PTR [ebp-0x4],0x0
  405b7a:	push   0x400000
  405b7f:	call   0x405c00
  405b84:	add    esp,0x4
  405b87:	test   eax,eax
  405b89:	je     0x405bdf
  405b8b:	mov    eax,DWORD PTR [ebp+0x8]
  405b8e:	sub    eax,0x400000
  405b93:	push   eax
  405b94:	push   0x400000
  405b99:	call   0x405af0
  405b9e:	add    esp,0x8
  405ba1:	test   eax,eax
  405ba3:	je     0x405bdf
  405ba5:	mov    eax,DWORD PTR [eax+0x24]
  405ba8:	shr    eax,0x1f
  405bab:	not    eax
  405bad:	and    eax,0x1
  405bb0:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405bb7:	mov    ecx,DWORD PTR [ebp-0x10]
  405bba:	mov    DWORD PTR fs:0x0,ecx
  405bc1:	pop    ecx
  405bc2:	pop    edi
  405bc3:	pop    esi
  405bc4:	pop    ebx
  405bc5:	mov    esp,ebp
  405bc7:	pop    ebp
  405bc8:	ret
  405bc9:	mov    eax,DWORD PTR [ebp-0x14]
  405bcc:	mov    eax,DWORD PTR [eax]
  405bce:	xor    ecx,ecx
  405bd0:	cmp    DWORD PTR [eax],0xc0000005
  405bd6:	sete   cl
  405bd9:	mov    eax,ecx
  405bdb:	ret
  405bdc:	mov    esp,DWORD PTR [ebp-0x18]
  405bdf:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405be6:	xor    eax,eax
  405be8:	mov    ecx,DWORD PTR [ebp-0x10]
  405beb:	mov    DWORD PTR fs:0x0,ecx
  405bf2:	pop    ecx
  405bf3:	pop    edi
  405bf4:	pop    esi
  405bf5:	pop    ebx
  405bf6:	mov    esp,ebp
  405bf8:	pop    ebp
  405bf9:	ret
  405bfa:	int3
  405bfb:	int3
  405bfc:	int3
  405bfd:	int3
  405bfe:	int3
  405bff:	int3
  405c00:	push   ebp
  405c01:	mov    ebp,esp
  405c03:	mov    eax,DWORD PTR [ebp+0x8]
  405c06:	mov    ecx,0x5a4d
  405c0b:	cmp    WORD PTR [eax],cx
  405c0e:	je     0x405c14
  405c10:	xor    eax,eax
  405c12:	pop    ebp
  405c13:	ret
  405c14:	mov    ecx,DWORD PTR [eax+0x3c]
  405c17:	add    ecx,eax
  405c19:	xor    eax,eax
  405c1b:	cmp    DWORD PTR [ecx],0x4550
  405c21:	jne    0x405c2f
  405c23:	mov    edx,0x10b
  405c28:	cmp    WORD PTR [ecx+0x18],dx
  405c2c:	sete   al
  405c2f:	pop    ebp
  405c30:	ret
  405c31:	push   esi
  405c32:	push   0x4
  405c34:	push   0x20
  405c36:	call   0x405797
  405c3b:	pop    ecx
  405c3c:	pop    ecx
  405c3d:	mov    esi,eax
  405c3f:	push   esi
  405c40:	call   DWORD PTR ds:0x40d020
  405c46:	mov    ds:0x414f50,eax
  405c4b:	mov    ds:0x414f4c,eax
  405c50:	test   esi,esi
  405c52:	jne    0x405c59
  405c54:	push   0x18
  405c56:	pop    eax
  405c57:	pop    esi
  405c58:	ret
  405c59:	and    DWORD PTR [esi],0x0
  405c5c:	xor    eax,eax
  405c5e:	pop    esi
  405c5f:	ret
  405c60:	push   0xc
  405c62:	push   0x411090
  405c67:	call   0x403b60
  405c6c:	and    DWORD PTR [ebp-0x1c],0x0
  405c70:	call   0x402c14
  405c75:	and    DWORD PTR [ebp-0x4],0x0
  405c79:	push   DWORD PTR [ebp+0x8]
  405c7c:	call   0x405ca4
  405c81:	pop    ecx
  405c82:	mov    esi,eax
  405c84:	mov    DWORD PTR [ebp-0x1c],esi
  405c87:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405c8e:	call   0x405c9e
  405c93:	mov    eax,esi
  405c95:	call   0x403ba5
  405c9a:	ret
  405c9b:	mov    esi,DWORD PTR [ebp-0x1c]
  405c9e:	call   0x402c1d
  405ca3:	ret
  405ca4:	push   ebp
  405ca5:	mov    ebp,esp
  405ca7:	push   ecx
  405ca8:	push   ebx
  405ca9:	push   esi
  405caa:	mov    esi,DWORD PTR ds:0x40d024
  405cb0:	push   edi
  405cb1:	push   DWORD PTR ds:0x414f50
  405cb7:	call   esi
  405cb9:	push   DWORD PTR ds:0x414f4c
  405cbf:	mov    DWORD PTR [ebp-0x4],eax
  405cc2:	call   esi
  405cc4:	mov    ebx,eax
  405cc6:	mov    eax,DWORD PTR [ebp-0x4]
  405cc9:	cmp    ebx,eax
  405ccb:	jb     0x405d53
  405cd1:	mov    edi,ebx
  405cd3:	sub    edi,eax
  405cd5:	lea    ecx,[edi+0x4]
  405cd8:	cmp    ecx,0x4
  405cdb:	jb     0x405d53
  405cdd:	push   eax
  405cde:	call   0x4077a1
  405ce3:	mov    esi,eax
  405ce5:	lea    eax,[edi+0x4]
  405ce8:	pop    ecx
  405ce9:	cmp    esi,eax
  405ceb:	jae    0x405d34
  405ced:	mov    eax,0x800
  405cf2:	cmp    esi,eax
  405cf4:	jae    0x405cf8
  405cf6:	mov    eax,esi
  405cf8:	mov    ebx,DWORD PTR [ebp-0x4]
  405cfb:	add    eax,esi
  405cfd:	cmp    eax,esi
  405cff:	jb     0x405d0e
  405d01:	push   eax
  405d02:	push   ebx
  405d03:	call   0x405826
  405d08:	pop    ecx
  405d09:	pop    ecx
  405d0a:	test   eax,eax
  405d0c:	jne    0x405d22
  405d0e:	lea    eax,[esi+0x10]
  405d11:	cmp    eax,esi
  405d13:	jb     0x405d53
  405d15:	push   eax
  405d16:	push   ebx
  405d17:	call   0x405826
  405d1c:	pop    ecx
  405d1d:	pop    ecx
  405d1e:	test   eax,eax
  405d20:	je     0x405d53
  405d22:	sar    edi,0x2
  405d25:	push   eax
  405d26:	lea    ebx,[eax+edi*4]
  405d29:	call   DWORD PTR ds:0x40d020
  405d2f:	mov    ds:0x414f50,eax
  405d34:	push   DWORD PTR [ebp+0x8]
  405d37:	call   DWORD PTR ds:0x40d020
  405d3d:	lea    ecx,[ebx+0x4]
  405d40:	mov    DWORD PTR [ebx],eax
  405d42:	push   ecx
  405d43:	call   DWORD PTR ds:0x40d020
  405d49:	mov    ds:0x414f4c,eax
  405d4e:	mov    eax,DWORD PTR [ebp+0x8]
  405d51:	jmp    0x405d55
  405d53:	xor    eax,eax
  405d55:	pop    edi
  405d56:	pop    esi
  405d57:	pop    ebx
  405d58:	mov    esp,ebp
  405d5a:	pop    ebp
  405d5b:	ret
  405d5c:	push   ebp
  405d5d:	mov    ebp,esp
  405d5f:	push   DWORD PTR [ebp+0x8]
  405d62:	call   0x405c60
  405d67:	neg    eax
  405d69:	pop    ecx
  405d6a:	sbb    eax,eax
  405d6c:	neg    eax
  405d6e:	dec    eax
  405d6f:	pop    ebp
  405d70:	ret
  405d71:	push   ebp
  405d72:	mov    ebp,esp
  405d74:	push   DWORD PTR ds:0x413e20
  405d7a:	call   DWORD PTR ds:0x40d024
  405d80:	test   eax,eax
  405d82:	je     0x405d93
  405d84:	push   DWORD PTR [ebp+0x8]
  405d87:	call   eax
  405d89:	pop    ecx
  405d8a:	test   eax,eax
  405d8c:	je     0x405d93
  405d8e:	xor    eax,eax
  405d90:	inc    eax
  405d91:	pop    ebp
  405d92:	ret
  405d93:	xor    eax,eax
  405d95:	pop    ebp
  405d96:	ret
  405d97:	push   ebp
  405d98:	mov    ebp,esp
  405d9a:	mov    eax,DWORD PTR [ebp+0x8]
  405d9d:	mov    ds:0x413e20,eax
  405da2:	pop    ebp
  405da3:	ret
  405da4:	push   ebp
  405da5:	mov    ebp,esp
  405da7:	mov    eax,DWORD PTR [ebp+0x8]
  405daa:	mov    ds:0x413e24,eax
  405daf:	pop    ebp
  405db0:	ret
  405db1:	push   DWORD PTR ds:0x413e30
  405db7:	call   DWORD PTR ds:0x40d024
  405dbd:	ret
  405dbe:	push   ebp
  405dbf:	mov    ebp,esp
  405dc1:	mov    eax,DWORD PTR [ebp+0x8]
  405dc4:	mov    ds:0x413e28,eax
  405dc9:	mov    ds:0x413e2c,eax
  405dce:	mov    ds:0x413e30,eax
  405dd3:	mov    ds:0x413e34,eax
  405dd8:	pop    ebp
  405dd9:	ret
  405dda:	push   0x24
  405ddc:	push   0x4110b0
  405de1:	call   0x403b60
  405de6:	and    DWORD PTR [ebp-0x2c],0x0
  405dea:	and    DWORD PTR [ebp-0x30],0x0
  405dee:	xor    ebx,ebx
  405df0:	mov    DWORD PTR [ebp-0x20],ebx
  405df3:	xor    edi,edi
  405df5:	mov    DWORD PTR [ebp-0x28],edi
  405df8:	mov    esi,DWORD PTR [ebp+0x8]
  405dfb:	cmp    esi,0xb
  405dfe:	jg     0x405e50
  405e00:	je     0x405e17
  405e02:	mov    eax,esi
  405e04:	push   0x2
  405e06:	pop    ecx
  405e07:	sub    eax,ecx
  405e09:	je     0x405e2d
  405e0b:	sub    eax,ecx
  405e0d:	je     0x405e17
  405e0f:	sub    eax,ecx
  405e11:	je     0x405e71
  405e13:	sub    eax,ecx
  405e15:	jne    0x405e5f
  405e17:	call   0x4028b3
  405e1c:	mov    edi,eax
  405e1e:	mov    DWORD PTR [ebp-0x28],edi
  405e21:	test   edi,edi
  405e23:	jne    0x405e3b
  405e25:	or     eax,0xffffffff
  405e28:	jmp    0x405f8f
  405e2d:	mov    DWORD PTR [ebp-0x1c],0x413e28
  405e34:	mov    eax,ds:0x413e28
  405e39:	jmp    0x405e99
  405e3b:	push   DWORD PTR [edi+0x5c]
  405e3e:	push   esi
  405e3f:	call   0x405f95
  405e44:	pop    ecx
  405e45:	pop    ecx
  405e46:	add    eax,0x8
  405e49:	mov    DWORD PTR [ebp-0x1c],eax
  405e4c:	mov    eax,DWORD PTR [eax]
  405e4e:	jmp    0x405ea6
  405e50:	mov    eax,esi
  405e52:	sub    eax,0xf
  405e55:	je     0x405e8d
  405e57:	sub    eax,0x6
  405e5a:	je     0x405e7f
  405e5c:	dec    eax
  405e5d:	je     0x405e71
  405e5f:	call   0x402568
  405e64:	mov    DWORD PTR [eax],0x16
  405e6a:	call   0x4016b6
  405e6f:	jmp    0x405e25
  405e71:	mov    DWORD PTR [ebp-0x1c],0x413e30
  405e78:	mov    eax,ds:0x413e30
  405e7d:	jmp    0x405e99
  405e7f:	mov    DWORD PTR [ebp-0x1c],0x413e2c
  405e86:	mov    eax,ds:0x413e2c
  405e8b:	jmp    0x405e99
  405e8d:	mov    DWORD PTR [ebp-0x1c],0x413e34
  405e94:	mov    eax,ds:0x413e34
  405e99:	xor    ebx,ebx
  405e9b:	inc    ebx
  405e9c:	mov    DWORD PTR [ebp-0x20],ebx
  405e9f:	push   eax
  405ea0:	call   DWORD PTR ds:0x40d024
  405ea6:	mov    DWORD PTR [ebp-0x24],eax
  405ea9:	cmp    eax,0x1
  405eac:	je     0x405f8d
  405eb2:	test   eax,eax
  405eb4:	jne    0x405ebd
  405eb6:	push   0x3
  405eb8:	call   0x402b70
  405ebd:	test   ebx,ebx
  405ebf:	je     0x405ec9
  405ec1:	push   0x0
  405ec3:	call   0x405969
  405ec8:	pop    ecx
  405ec9:	and    DWORD PTR [ebp-0x4],0x0
  405ecd:	cmp    esi,0x8
  405ed0:	je     0x405edc
  405ed2:	cmp    esi,0xb
  405ed5:	je     0x405edc
  405ed7:	cmp    esi,0x4
  405eda:	jne    0x405ef8
  405edc:	mov    eax,DWORD PTR [edi+0x60]
  405edf:	mov    DWORD PTR [ebp-0x2c],eax
  405ee2:	and    DWORD PTR [edi+0x60],0x0
  405ee6:	cmp    esi,0x8
  405ee9:	jne    0x405f2a
  405eeb:	mov    eax,DWORD PTR [edi+0x64]
  405eee:	mov    DWORD PTR [ebp-0x30],eax
  405ef1:	mov    DWORD PTR [edi+0x64],0x8c
  405ef8:	cmp    esi,0x8
  405efb:	jne    0x405f2a
  405efd:	mov    ecx,DWORD PTR ds:0x40d280
  405f03:	mov    edx,ecx
  405f05:	mov    DWORD PTR [ebp-0x34],edx
  405f08:	mov    eax,ds:0x40d284
  405f0d:	add    eax,ecx
  405f0f:	cmp    edx,eax
  405f11:	jge    0x405f37
  405f13:	imul   ecx,edx,0xc
  405f16:	mov    eax,DWORD PTR [edi+0x5c]
  405f19:	and    DWORD PTR [eax+ecx*1+0x8],0x0
  405f1e:	inc    edx
  405f1f:	mov    DWORD PTR [ebp-0x34],edx
  405f22:	mov    ecx,DWORD PTR ds:0x40d280
  405f28:	jmp    0x405f08
  405f2a:	push   0x0
  405f2c:	call   DWORD PTR ds:0x40d020
  405f32:	mov    ecx,DWORD PTR [ebp-0x1c]
  405f35:	mov    DWORD PTR [ecx],eax
  405f37:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  405f3e:	call   0x405f5b
  405f43:	cmp    esi,0x8
  405f46:	jne    0x405f68
  405f48:	push   DWORD PTR [edi+0x64]
  405f4b:	push   esi
  405f4c:	call   DWORD PTR [ebp-0x24]
  405f4f:	pop    ecx
  405f50:	jmp    0x405f6c
  405f52:	mov    esi,DWORD PTR [ebp+0x8]
  405f55:	mov    ebx,DWORD PTR [ebp-0x20]
  405f58:	mov    edi,DWORD PTR [ebp-0x28]
  405f5b:	test   ebx,ebx
  405f5d:	je     0x405f67
  405f5f:	push   0x0
  405f61:	call   0x405ad3
  405f66:	pop    ecx
  405f67:	ret
  405f68:	push   esi
  405f69:	call   DWORD PTR [ebp-0x24]
  405f6c:	pop    ecx
  405f6d:	cmp    esi,0x8
  405f70:	je     0x405f7c
  405f72:	cmp    esi,0xb
  405f75:	je     0x405f7c
  405f77:	cmp    esi,0x4
  405f7a:	jne    0x405f8d
  405f7c:	mov    eax,DWORD PTR [ebp-0x2c]
  405f7f:	mov    DWORD PTR [edi+0x60],eax
  405f82:	cmp    esi,0x8
  405f85:	jne    0x405f8d
  405f87:	mov    eax,DWORD PTR [ebp-0x30]
  405f8a:	mov    DWORD PTR [edi+0x64],eax
  405f8d:	xor    eax,eax
  405f8f:	call   0x403ba5
  405f94:	ret
  405f95:	push   ebp
  405f96:	mov    ebp,esp
  405f98:	mov    edx,DWORD PTR [ebp+0xc]
  405f9b:	mov    ecx,DWORD PTR ds:0x40d278
  405fa1:	push   esi
  405fa2:	mov    esi,DWORD PTR [ebp+0x8]
  405fa5:	cmp    DWORD PTR [edx+0x4],esi
  405fa8:	je     0x405fb7
  405faa:	imul   eax,ecx,0xc
  405fad:	add    edx,0xc
  405fb0:	add    eax,DWORD PTR [ebp+0xc]
  405fb3:	cmp    edx,eax
  405fb5:	jb     0x405fa5
  405fb7:	imul   ecx,ecx,0xc
  405fba:	add    ecx,DWORD PTR [ebp+0xc]
  405fbd:	cmp    edx,ecx
  405fbf:	jae    0x405fca
  405fc1:	cmp    DWORD PTR [edx+0x4],esi
  405fc4:	jne    0x405fca
  405fc6:	mov    eax,edx
  405fc8:	jmp    0x405fcc
  405fca:	xor    eax,eax
  405fcc:	pop    esi
  405fcd:	pop    ebp
  405fce:	ret
  405fcf:	push   ebp
  405fd0:	mov    ebp,esp
  405fd2:	mov    eax,DWORD PTR [ebp+0x8]
  405fd5:	mov    ds:0x413e3c,eax
  405fda:	pop    ebp
  405fdb:	ret
  405fdc:	int3
  405fdd:	int3
  405fde:	int3
  405fdf:	int3
  405fe0:	push   ebx
  405fe1:	push   esi
  405fe2:	push   edi
  405fe3:	mov    edx,DWORD PTR [esp+0x10]
  405fe7:	mov    eax,DWORD PTR [esp+0x14]
  405feb:	mov    ecx,DWORD PTR [esp+0x18]
  405fef:	push   ebp
  405ff0:	push   edx
  405ff1:	push   eax
  405ff2:	push   ecx
  405ff3:	push   ecx
  405ff4:	push   0x406070
  405ff9:	push   DWORD PTR fs:0x0
  406000:	mov    eax,ds:0x412000
  406005:	xor    eax,esp
  406007:	mov    DWORD PTR [esp+0x8],eax
  40600b:	mov    DWORD PTR fs:0x0,esp
  406012:	mov    eax,DWORD PTR [esp+0x30]
  406016:	mov    ebx,DWORD PTR [eax+0x8]
  406019:	mov    ecx,DWORD PTR [esp+0x2c]
  40601d:	xor    ebx,DWORD PTR [ecx]
  40601f:	mov    esi,DWORD PTR [eax+0xc]
  406022:	cmp    esi,0xfffffffe
  406025:	je     0x406062
  406027:	mov    edx,DWORD PTR [esp+0x34]
  40602b:	cmp    edx,0xfffffffe
  40602e:	je     0x406034
  406030:	cmp    esi,edx
  406032:	jbe    0x406062
  406034:	lea    esi,[esi+esi*2]
  406037:	lea    ebx,[ebx+esi*4+0x10]
  40603b:	mov    ecx,DWORD PTR [ebx]
  40603d:	mov    DWORD PTR [eax+0xc],ecx
  406040:	cmp    DWORD PTR [ebx+0x4],0x0
  406044:	jne    0x406012
  406046:	push   0x101
  40604b:	mov    eax,DWORD PTR [ebx+0x8]
  40604e:	call   0x408075
  406053:	mov    ecx,0x1
  406058:	mov    eax,DWORD PTR [ebx+0x8]
  40605b:	call   0x408094
  406060:	jmp    0x406012
  406062:	pop    DWORD PTR fs:0x0
  406069:	add    esp,0x18
  40606c:	pop    edi
  40606d:	pop    esi
  40606e:	pop    ebx
  40606f:	ret
  406070:	mov    ecx,DWORD PTR [esp+0x4]
  406074:	test   DWORD PTR [ecx+0x4],0x6
  40607b:	mov    eax,0x1
  406080:	je     0x4060b5
  406082:	mov    eax,DWORD PTR [esp+0x8]
  406086:	mov    ecx,DWORD PTR [eax+0x8]
  406089:	xor    ecx,eax
  40608b:	call   0x40120d
  406090:	push   ebp
  406091:	mov    ebp,DWORD PTR [eax+0x18]
  406094:	push   DWORD PTR [eax+0xc]
  406097:	push   DWORD PTR [eax+0x10]
  40609a:	push   DWORD PTR [eax+0x14]
  40609d:	call   0x405fe0
  4060a2:	add    esp,0xc
  4060a5:	pop    ebp
  4060a6:	mov    eax,DWORD PTR [esp+0x8]
  4060aa:	mov    edx,DWORD PTR [esp+0x10]
  4060ae:	mov    DWORD PTR [edx],eax
  4060b0:	mov    eax,0x3
  4060b5:	ret
  4060b6:	push   ebp
  4060b7:	mov    ecx,DWORD PTR [esp+0x8]
  4060bb:	mov    ebp,DWORD PTR [ecx]
  4060bd:	push   DWORD PTR [ecx+0x1c]
  4060c0:	push   DWORD PTR [ecx+0x18]
  4060c3:	push   DWORD PTR [ecx+0x28]
  4060c6:	call   0x405fe0
  4060cb:	add    esp,0xc
  4060ce:	pop    ebp
  4060cf:	ret    0x4
  4060d2:	push   ebp
  4060d3:	push   esi
  4060d4:	push   edi
  4060d5:	push   ebx
  4060d6:	mov    ebp,edx
  4060d8:	xor    eax,eax
  4060da:	xor    ebx,ebx
  4060dc:	xor    edx,edx
  4060de:	xor    esi,esi
  4060e0:	xor    edi,edi
  4060e2:	call   ecx
  4060e4:	pop    ebx
  4060e5:	pop    edi
  4060e6:	pop    esi
  4060e7:	pop    ebp
  4060e8:	ret
  4060e9:	mov    ebp,edx
  4060eb:	mov    esi,ecx
  4060ed:	mov    eax,ecx
  4060ef:	push   0x1
  4060f1:	call   0x408075
  4060f6:	xor    eax,eax
  4060f8:	xor    ebx,ebx
  4060fa:	xor    ecx,ecx
  4060fc:	xor    edx,edx
  4060fe:	xor    edi,edi
  406100:	jmp    esi
  406102:	push   ebp
  406103:	mov    ebp,esp
  406105:	push   ebx
  406106:	push   esi
  406107:	push   edi
  406108:	push   0x0
  40610a:	push   edx
  40610b:	push   0x406116
  406110:	push   ecx
  406111:	call   0x40c20e
  406116:	pop    edi
  406117:	pop    esi
  406118:	pop    ebx
  406119:	pop    ebp
  40611a:	ret
  40611b:	push   ebp
  40611c:	mov    ebp,DWORD PTR [esp+0x8]
  406120:	push   edx
  406121:	push   ecx
  406122:	push   DWORD PTR [esp+0x14]
  406126:	call   0x405fe0
  40612b:	add    esp,0xc
  40612e:	pop    ebp
  40612f:	ret    0x8
  406132:	push   ebp
  406133:	mov    ebp,esp
  406135:	sub    esp,0x10
  406138:	push   esi
  406139:	push   DWORD PTR [ebp+0x8]
  40613c:	lea    ecx,[ebp-0x10]
  40613f:	call   0x401840
  406144:	mov    eax,DWORD PTR [ebp+0xc]
  406147:	mov    cl,BYTE PTR [ebp+0x14]
  40614a:	movzx  esi,al
  40614d:	mov    eax,DWORD PTR [ebp-0xc]
  406150:	test   BYTE PTR [eax+esi*1+0x19],cl
  406154:	jne    0x406175
  406156:	xor    edx,edx
  406158:	cmp    DWORD PTR [ebp+0x10],edx
  40615b:	je     0x40616f
  40615d:	mov    eax,DWORD PTR [ebp-0x10]
  406160:	mov    eax,DWORD PTR [eax+0x90]
  406166:	movzx  eax,WORD PTR [eax+esi*2]
  40616a:	and    eax,DWORD PTR [ebp+0x10]
  40616d:	jmp    0x406171
  40616f:	mov    eax,edx
  406171:	test   eax,eax
  406173:	je     0x406178
  406175:	xor    edx,edx
  406177:	inc    edx
  406178:	cmp    BYTE PTR [ebp-0x4],0x0
  40617c:	pop    esi
  40617d:	je     0x406186
  40617f:	mov    ecx,DWORD PTR [ebp-0x8]
  406182:	and    DWORD PTR [ecx+0x70],0xfffffffd
  406186:	mov    eax,edx
  406188:	mov    esp,ebp
  40618a:	pop    ebp
  40618b:	ret
  40618c:	push   ebp
  40618d:	mov    ebp,esp
  40618f:	push   0x4
  406191:	push   0x0
  406193:	push   DWORD PTR [ebp+0x8]
  406196:	push   0x0
  406198:	call   0x406132
  40619d:	add    esp,0x10
  4061a0:	pop    ebp
  4061a1:	ret
  4061a2:	push   ebp
  4061a3:	mov    ebp,esp
  4061a5:	push   esi
  4061a6:	mov    esi,DWORD PTR [ebp+0x8]
  4061a9:	test   esi,esi
  4061ab:	je     0x4061bd
  4061ad:	mov    edx,DWORD PTR [ebp+0xc]
  4061b0:	test   edx,edx
  4061b2:	je     0x4061bd
  4061b4:	mov    ecx,DWORD PTR [ebp+0x10]
  4061b7:	test   ecx,ecx
  4061b9:	jne    0x4061d1
  4061bb:	mov    BYTE PTR [esi],cl
  4061bd:	call   0x402568
  4061c2:	push   0x16
  4061c4:	pop    esi
  4061c5:	mov    DWORD PTR [eax],esi
  4061c7:	call   0x4016b6
  4061cc:	mov    eax,esi
  4061ce:	pop    esi
  4061cf:	pop    ebp
  4061d0:	ret
  4061d1:	push   edi
  4061d2:	mov    edi,esi
  4061d4:	sub    edi,ecx
  4061d6:	mov    al,BYTE PTR [ecx]
  4061d8:	mov    BYTE PTR [edi+ecx*1],al
  4061db:	inc    ecx
  4061dc:	test   al,al
  4061de:	je     0x4061e3
  4061e0:	dec    edx
  4061e1:	jne    0x4061d6
  4061e3:	pop    edi
  4061e4:	test   edx,edx
  4061e6:	jne    0x4061f3
  4061e8:	mov    BYTE PTR [esi],dl
  4061ea:	call   0x402568
  4061ef:	push   0x22
  4061f1:	jmp    0x4061c4
  4061f3:	xor    eax,eax
  4061f5:	jmp    0x4061ce
  4061f7:	push   ebp
  4061f8:	mov    ebp,esp
  4061fa:	push   esi
  4061fb:	push   edi
  4061fc:	mov    edi,DWORD PTR [ebp+0x8]
  4061ff:	test   edi,edi
  406201:	je     0x406216
  406203:	mov    ecx,DWORD PTR [ebp+0xc]
  406206:	test   ecx,ecx
  406208:	je     0x406216
  40620a:	mov    edx,DWORD PTR [ebp+0x10]
  40620d:	test   edx,edx
  40620f:	jne    0x40622b
  406211:	xor    eax,eax
  406213:	mov    WORD PTR [edi],ax
  406216:	call   0x402568
  40621b:	push   0x16
  40621d:	pop    esi
  40621e:	mov    DWORD PTR [eax],esi
  406220:	call   0x4016b6
  406225:	mov    eax,esi
  406227:	pop    edi
  406228:	pop    esi
  406229:	pop    ebp
  40622a:	ret
  40622b:	mov    esi,edi
  40622d:	cmp    WORD PTR [esi],0x0
  406231:	je     0x406239
  406233:	add    esi,0x2
  406236:	dec    ecx
  406237:	jne    0x40622d
  406239:	test   ecx,ecx
  40623b:	je     0x406211
  40623d:	sub    esi,edx
  40623f:	movzx  eax,WORD PTR [edx]
  406242:	mov    WORD PTR [esi+edx*1],ax
  406246:	lea    edx,[edx+0x2]
  406249:	test   ax,ax
  40624c:	je     0x406251
  40624e:	dec    ecx
  40624f:	jne    0x40623f
  406251:	xor    eax,eax
  406253:	test   ecx,ecx
  406255:	jne    0x406227
  406257:	mov    WORD PTR [edi],ax
  40625a:	call   0x402568
  40625f:	push   0x22
  406261:	jmp    0x40621d
  406263:	push   ebp
  406264:	mov    ebp,esp
  406266:	push   esi
  406267:	mov    esi,DWORD PTR [ebp+0x8]
  40626a:	test   esi,esi
  40626c:	je     0x406281
  40626e:	mov    edx,DWORD PTR [ebp+0xc]
  406271:	test   edx,edx
  406273:	je     0x406281
  406275:	mov    ecx,DWORD PTR [ebp+0x10]
  406278:	test   ecx,ecx
  40627a:	jne    0x406295
  40627c:	xor    eax,eax
  40627e:	mov    WORD PTR [esi],ax
  406281:	call   0x402568
  406286:	push   0x16
  406288:	pop    esi
  406289:	mov    DWORD PTR [eax],esi
  40628b:	call   0x4016b6
  406290:	mov    eax,esi
  406292:	pop    esi
  406293:	pop    ebp
  406294:	ret
  406295:	push   edi
  406296:	mov    edi,esi
  406298:	sub    edi,ecx
  40629a:	movzx  eax,WORD PTR [ecx]
  40629d:	mov    WORD PTR [edi+ecx*1],ax
  4062a1:	lea    ecx,[ecx+0x2]
  4062a4:	test   ax,ax
  4062a7:	je     0x4062ac
  4062a9:	dec    edx
  4062aa:	jne    0x40629a
  4062ac:	xor    eax,eax
  4062ae:	pop    edi
  4062af:	test   edx,edx
  4062b1:	jne    0x406292
  4062b3:	mov    WORD PTR [esi],ax
  4062b6:	call   0x402568
  4062bb:	push   0x22
  4062bd:	jmp    0x406288
  4062bf:	push   ebp
  4062c0:	mov    ebp,esp
  4062c2:	mov    eax,DWORD PTR [ebp+0x8]
  4062c5:	mov    cx,WORD PTR [eax]
  4062c8:	add    eax,0x2
  4062cb:	test   cx,cx
  4062ce:	jne    0x4062c5
  4062d0:	sub    eax,DWORD PTR [ebp+0x8]
  4062d3:	sar    eax,1
  4062d5:	dec    eax
  4062d6:	pop    ebp
  4062d7:	ret
  4062d8:	push   ebp
  4062d9:	mov    ebp,esp
  4062db:	mov    edx,DWORD PTR [ebp+0x14]
  4062de:	mov    ecx,DWORD PTR [ebp+0x8]
  4062e1:	push   esi
  4062e2:	test   edx,edx
  4062e4:	jne    0x4062f3
  4062e6:	test   ecx,ecx
  4062e8:	jne    0x4062f7
  4062ea:	cmp    DWORD PTR [ebp+0xc],ecx
  4062ed:	jne    0x406315
  4062ef:	xor    eax,eax
  4062f1:	jmp    0x406326
  4062f3:	test   ecx,ecx
  4062f5:	je     0x406315
  4062f7:	mov    eax,DWORD PTR [ebp+0xc]
  4062fa:	test   eax,eax
  4062fc:	je     0x406315
  4062fe:	test   edx,edx
  406300:	jne    0x406309
  406302:	xor    eax,eax
  406304:	mov    WORD PTR [ecx],ax
  406307:	jmp    0x4062ef
  406309:	mov    esi,DWORD PTR [ebp+0x10]
  40630c:	test   esi,esi
  40630e:	jne    0x406329
  406310:	xor    eax,eax
  406312:	mov    WORD PTR [ecx],ax
  406315:	call   0x402568
  40631a:	push   0x16
  40631c:	pop    esi
  40631d:	mov    DWORD PTR [eax],esi
  40631f:	call   0x4016b6
  406324:	mov    eax,esi
  406326:	pop    esi
  406327:	pop    ebp
  406328:	ret
  406329:	push   ebx
  40632a:	mov    ebx,ecx
  40632c:	push   edi
  40632d:	mov    edi,eax
  40632f:	cmp    edx,0xffffffff
  406332:	jne    0x40634a
  406334:	sub    ebx,esi
  406336:	movzx  eax,WORD PTR [esi]
  406339:	mov    WORD PTR [ebx+esi*1],ax
  40633d:	lea    esi,[esi+0x2]
  406340:	test   ax,ax
  406343:	je     0x40636a
  406345:	dec    edi
  406346:	jne    0x406336
  406348:	jmp    0x40636a
  40634a:	sub    esi,ecx
  40634c:	movzx  eax,WORD PTR [esi+ebx*1]
  406350:	mov    WORD PTR [ebx],ax
  406353:	lea    ebx,[ebx+0x2]
  406356:	test   ax,ax
  406359:	je     0x406361
  40635b:	dec    edi
  40635c:	je     0x406361
  40635e:	dec    edx
  40635f:	jne    0x40634c
  406361:	test   edx,edx
  406363:	jne    0x40636a
  406365:	xor    eax,eax
  406367:	mov    WORD PTR [ebx],ax
  40636a:	test   edi,edi
  40636c:	pop    edi
  40636d:	pop    ebx
  40636e:	jne    0x4062ef
  406374:	cmp    edx,0xffffffff
  406377:	jne    0x406388
  406379:	mov    eax,DWORD PTR [ebp+0xc]
  40637c:	xor    edx,edx
  40637e:	push   0x50
  406380:	mov    WORD PTR [ecx+eax*2-0x2],dx
  406385:	pop    eax
  406386:	jmp    0x406326
  406388:	xor    eax,eax
  40638a:	mov    WORD PTR [ecx],ax
  40638d:	call   0x402568
  406392:	push   0x22
  406394:	jmp    0x40631c
  406396:	push   ebp
  406397:	mov    ebp,esp
  406399:	sub    esp,0x24
  40639c:	mov    eax,ds:0x412000
  4063a1:	xor    eax,ebp
  4063a3:	mov    DWORD PTR [ebp-0x4],eax
  4063a6:	mov    eax,DWORD PTR [ebp+0x8]
  4063a9:	push   ebx
  4063aa:	mov    ebx,DWORD PTR ds:0x40d020
  4063b0:	push   esi
  4063b1:	push   edi
  4063b2:	mov    DWORD PTR [ebp-0x1c],eax
  4063b5:	xor    esi,esi
  4063b7:	mov    eax,DWORD PTR [ebp+0xc]
  4063ba:	push   esi
  4063bb:	mov    DWORD PTR [ebp-0x20],eax
  4063be:	call   ebx
  4063c0:	mov    edi,eax
  4063c2:	mov    DWORD PTR [ebp-0x18],edi
  4063c5:	call   0x4037e1
  4063ca:	mov    DWORD PTR [ebp-0x14],eax
  4063cd:	cmp    DWORD PTR ds:0x413e48,esi
  4063d3:	jne    0x406489
  4063d9:	push   0x800
  4063de:	push   esi
  4063df:	push   0x40e3f0
  4063e4:	call   DWORD PTR ds:0x40d0d0
  4063ea:	mov    edi,eax
  4063ec:	test   edi,edi
  4063ee:	jne    0x406416
  4063f0:	call   DWORD PTR ds:0x40d028
  4063f6:	cmp    eax,0x57
  4063f9:	jne    0x406569
  4063ff:	push   esi
  406400:	push   esi
  406401:	push   0x40e3f0
  406406:	call   DWORD PTR ds:0x40d0d0
  40640c:	mov    edi,eax
  40640e:	test   edi,edi
  406410:	je     0x406569
  406416:	push   0x40e408
  40641b:	push   edi
  40641c:	call   DWORD PTR ds:0x40d03c
  406422:	test   eax,eax
  406424:	je     0x406569
  40642a:	push   eax
  40642b:	call   ebx
  40642d:	push   0x40e414
  406432:	push   edi
  406433:	mov    ds:0x413e48,eax
  406438:	call   DWORD PTR ds:0x40d03c
  40643e:	push   eax
  40643f:	call   ebx
  406441:	push   0x40e424
  406446:	push   edi
  406447:	mov    ds:0x413e4c,eax
  40644c:	call   DWORD PTR ds:0x40d03c
  406452:	push   eax
  406453:	call   ebx
  406455:	push   0x40e438
  40645a:	push   edi
  40645b:	mov    ds:0x413e50,eax
  406460:	call   DWORD PTR ds:0x40d03c
  406466:	push   eax
  406467:	call   ebx
  406469:	mov    ds:0x413e58,eax
  40646e:	test   eax,eax
  406470:	je     0x406486
  406472:	push   0x40e454
  406477:	push   edi
  406478:	call   DWORD PTR ds:0x40d03c
  40647e:	push   eax
  40647f:	call   ebx
  406481:	mov    ds:0x413e54,eax
  406486:	mov    edi,DWORD PTR [ebp-0x18]
  406489:	call   DWORD PTR ds:0x40d018
  40648f:	test   eax,eax
  406491:	je     0x4064ae
  406493:	mov    eax,DWORD PTR [ebp-0x1c]
  406496:	test   eax,eax
  406498:	je     0x4064a1
  40649a:	push   eax
  40649b:	call   DWORD PTR ds:0x40d0d8
  4064a1:	cmp    DWORD PTR [ebp-0x14],esi
  4064a4:	je     0x4064c3
  4064a6:	push   0x4
  4064a8:	pop    eax
  4064a9:	jmp    0x40656b
  4064ae:	cmp    DWORD PTR [ebp-0x14],esi
  4064b1:	je     0x4064c3
  4064b3:	push   DWORD PTR ds:0x413e48
  4064b9:	call   DWORD PTR ds:0x40d024
  4064bf:	push   0x3
  4064c1:	jmp    0x4064a8
  4064c3:	mov    eax,ds:0x413e54
  4064c8:	mov    ebx,DWORD PTR ds:0x40d024
  4064ce:	cmp    eax,edi
  4064d0:	je     0x406521
  4064d2:	cmp    DWORD PTR ds:0x413e58,edi
  4064d8:	je     0x406521
  4064da:	push   eax
  4064db:	call   ebx
  4064dd:	push   DWORD PTR ds:0x413e58
  4064e3:	mov    DWORD PTR [ebp-0x14],eax
  4064e6:	call   ebx
  4064e8:	mov    ecx,DWORD PTR [ebp-0x14]
  4064eb:	mov    DWORD PTR [ebp-0x18],eax
  4064ee:	test   ecx,ecx
  4064f0:	je     0x406521
  4064f2:	test   eax,eax
  4064f4:	je     0x406521
  4064f6:	call   ecx
  4064f8:	test   eax,eax
  4064fa:	je     0x406516
  4064fc:	lea    ecx,[ebp-0x24]
  4064ff:	push   ecx
  406500:	push   0xc
  406502:	lea    ecx,[ebp-0x10]
  406505:	push   ecx
  406506:	push   0x1
  406508:	push   eax
  406509:	call   DWORD PTR [ebp-0x18]
  40650c:	test   eax,eax
  40650e:	je     0x406516
  406510:	test   BYTE PTR [ebp-0x8],0x1
  406514:	jne    0x406521
  406516:	mov    edi,DWORD PTR [ebp+0x10]
  406519:	or     edi,0x200000
  40651f:	jmp    0x406551
  406521:	mov    eax,ds:0x413e4c
  406526:	cmp    eax,edi
  406528:	je     0x40654e
  40652a:	push   eax
  40652b:	call   ebx
  40652d:	test   eax,eax
  40652f:	je     0x40654e
  406531:	call   eax
  406533:	mov    esi,eax
  406535:	test   esi,esi
  406537:	je     0x40654e
  406539:	mov    eax,ds:0x413e50
  40653e:	cmp    eax,edi
  406540:	je     0x40654e
  406542:	push   eax
  406543:	call   ebx
  406545:	test   eax,eax
  406547:	je     0x40654e
  406549:	push   esi
  40654a:	call   eax
  40654c:	mov    esi,eax
  40654e:	mov    edi,DWORD PTR [ebp+0x10]
  406551:	push   DWORD PTR ds:0x413e48
  406557:	call   ebx
  406559:	test   eax,eax
  40655b:	je     0x406569
  40655d:	push   edi
  40655e:	push   DWORD PTR [ebp-0x20]
  406561:	push   DWORD PTR [ebp-0x1c]
  406564:	push   esi
  406565:	call   eax
  406567:	jmp    0x40656b
  406569:	xor    eax,eax
  40656b:	mov    ecx,DWORD PTR [ebp-0x4]
  40656e:	pop    edi
  40656f:	pop    esi
  406570:	xor    ecx,ebp
  406572:	pop    ebx
  406573:	call   0x40120d
  406578:	mov    esp,ebp
  40657a:	pop    ebp
  40657b:	ret
  40657c:	test   eax,eax
  40657e:	jne    0x406586
  406580:	pxor   xmm0,xmm0
  406584:	jmp    0x406597
  406586:	movd   xmm0,eax
  40658a:	punpcklbw xmm0,xmm0
  40658e:	punpcklwd xmm0,xmm0
  406592:	pshufd xmm0,xmm0,0x0
  406597:	push   ebx
  406598:	push   ecx
  406599:	mov    ebx,ecx
  40659b:	and    ebx,0xf
  40659e:	test   ebx,ebx
  4065a0:	jne    0x40661a
  4065a2:	mov    ebx,edx
  4065a4:	and    edx,0x7f
  4065a7:	shr    ebx,0x7
  4065aa:	je     0x4065dc
  4065ac:	movdqa XMMWORD PTR [ecx],xmm0
  4065b0:	movdqa XMMWORD PTR [ecx+0x10],xmm0
  4065b5:	movdqa XMMWORD PTR [ecx+0x20],xmm0
  4065ba:	movdqa XMMWORD PTR [ecx+0x30],xmm0
  4065bf:	movdqa XMMWORD PTR [ecx+0x40],xmm0
  4065c4:	movdqa XMMWORD PTR [ecx+0x50],xmm0
  4065c9:	movdqa XMMWORD PTR [ecx+0x60],xmm0
  4065ce:	movdqa XMMWORD PTR [ecx+0x70],xmm0
  4065d3:	lea    ecx,[ecx+0x80]
  4065d9:	dec    ebx
  4065da:	jne    0x4065ac
  4065dc:	test   edx,edx
  4065de:	je     0x406617
  4065e0:	mov    ebx,edx
  4065e2:	shr    ebx,0x4
  4065e5:	je     0x4065f6
  4065e7:	jmp    0x4065ec
  4065e9:	lea    ecx,[ecx+0x0]
  4065ec:	movdqa XMMWORD PTR [ecx],xmm0
  4065f0:	lea    ecx,[ecx+0x10]
  4065f3:	dec    ebx
  4065f4:	jne    0x4065ec
  4065f6:	and    edx,0xf
  4065f9:	je     0x406617
  4065fb:	mov    ebx,edx
  4065fd:	shr    edx,0x2
  406600:	je     0x40660c
  406602:	movd   DWORD PTR [ecx],xmm0
  406606:	lea    ecx,[ecx+0x4]
  406609:	dec    edx
  40660a:	jne    0x406602
  40660c:	and    ebx,0x3
  40660f:	je     0x406617
  406611:	mov    BYTE PTR [ecx],al
  406613:	inc    ecx
  406614:	dec    ebx
  406615:	jne    0x406611
  406617:	pop    eax
  406618:	pop    ebx
  406619:	ret
  40661a:	neg    ebx
  40661c:	add    ebx,0x10
  40661f:	sub    edx,ebx
  406621:	push   edx
  406622:	mov    edx,ebx
  406624:	and    edx,0x3
  406627:	je     0x40662f
  406629:	mov    BYTE PTR [ecx],al
  40662b:	inc    ecx
  40662c:	dec    edx
  40662d:	jne    0x406629
  40662f:	shr    ebx,0x2
  406632:	je     0x40663e
  406634:	movd   DWORD PTR [ecx],xmm0
  406638:	lea    ecx,[ecx+0x4]
  40663b:	dec    ebx
  40663c:	jne    0x406634
  40663e:	pop    edx
  40663f:	jmp    0x4065a2
  406644:	push   ebp
  406645:	mov    ebp,esp
  406647:	and    DWORD PTR ds:0x413e5c,0x0
  40664e:	sub    esp,0x1c
  406651:	push   ebx
  406652:	xor    ebx,ebx
  406654:	inc    ebx
  406655:	or     DWORD PTR ds:0x412cf0,ebx
  40665b:	push   0xa
  40665d:	call   0x40c208
  406662:	test   eax,eax
  406664:	je     0x4067b6
  40666a:	xor    ecx,ecx
  40666c:	mov    DWORD PTR ds:0x413e5c,ebx
  406672:	xor    eax,eax
  406674:	cpuid
  406676:	push   esi
  406677:	mov    esi,DWORD PTR ds:0x412cf0
  40667d:	push   edi
  40667e:	lea    edi,[ebp-0x1c]
  406681:	or     esi,0x2
  406684:	mov    DWORD PTR [edi],eax
  406686:	mov    DWORD PTR [edi+0x4],ebx
  406689:	mov    DWORD PTR [edi+0x8],ecx
  40668c:	mov    DWORD PTR [edi+0xc],edx
  40668f:	mov    eax,DWORD PTR [ebp-0x1c]
  406692:	mov    ecx,DWORD PTR [ebp-0x10]
  406695:	mov    DWORD PTR [ebp-0xc],eax
  406698:	xor    ecx,0x49656e69
  40669e:	mov    eax,DWORD PTR [ebp-0x14]
  4066a1:	xor    eax,0x6c65746e
  4066a6:	mov    DWORD PTR ds:0x412cf0,esi
  4066ac:	or     ecx,eax
  4066ae:	mov    eax,DWORD PTR [ebp-0x18]
  4066b1:	xor    eax,0x756e6547
  4066b6:	or     ecx,eax
  4066b8:	neg    ecx
  4066ba:	push   0x1
  4066bc:	sbb    cl,cl
  4066be:	pop    eax
  4066bf:	inc    cl
  4066c1:	push   0x0
  4066c3:	pop    ecx
  4066c4:	cpuid
  4066c6:	mov    DWORD PTR [edi],eax
  4066c8:	mov    DWORD PTR [edi+0x4],ebx
  4066cb:	mov    DWORD PTR [edi+0x8],ecx
  4066ce:	mov    DWORD PTR [edi+0xc],edx
  4066d1:	mov    ecx,DWORD PTR [ebp-0x14]
  4066d4:	mov    DWORD PTR [ebp-0x8],ecx
  4066d7:	je     0x40671c
  4066d9:	mov    eax,DWORD PTR [ebp-0x1c]
  4066dc:	and    eax,0xfff3ff0
  4066e1:	cmp    eax,0x106c0
  4066e6:	je     0x40670b
  4066e8:	cmp    eax,0x20660
  4066ed:	je     0x40670b
  4066ef:	cmp    eax,0x20670
  4066f4:	je     0x40670b
  4066f6:	cmp    eax,0x30650
  4066fb:	je     0x40670b
  4066fd:	cmp    eax,0x30660
  406702:	je     0x40670b
  406704:	cmp    eax,0x30670
  406709:	jne    0x40671c
  40670b:	mov    edi,DWORD PTR ds:0x413e60
  406711:	or     edi,0x1
  406714:	mov    DWORD PTR ds:0x413e60,edi
  40671a:	jmp    0x406722
  40671c:	mov    edi,DWORD PTR ds:0x413e60
  406722:	cmp    DWORD PTR [ebp-0xc],0x7
  406726:	jl     0x40675d
  406728:	push   0x7
  40672a:	xor    ecx,ecx
  40672c:	lea    esi,[ebp-0x1c]
  40672f:	pop    eax
  406730:	cpuid
  406732:	mov    DWORD PTR [esi],eax
  406734:	mov    eax,esi
  406736:	mov    esi,DWORD PTR ds:0x412cf0
  40673c:	mov    DWORD PTR [eax+0x4],ebx
  40673f:	mov    DWORD PTR [eax+0x8],ecx
  406742:	mov    ecx,DWORD PTR [ebp-0x8]
  406745:	mov    DWORD PTR [eax+0xc],edx
  406748:	mov    eax,DWORD PTR [ebp-0x18]
  40674b:	test   eax,0x200
  406750:	je     0x40675f
  406752:	or     edi,0x2
  406755:	mov    DWORD PTR ds:0x413e60,edi
  40675b:	jmp    0x40675f
  40675d:	xor    eax,eax
  40675f:	test   ecx,0x100000
  406765:	je     0x4067b4
  406767:	or     esi,0x4
  40676a:	mov    DWORD PTR ds:0x413e5c,0x2
  406774:	mov    DWORD PTR ds:0x412cf0,esi
  40677a:	test   ecx,0x8000000
  406780:	je     0x4067b4
  406782:	test   ecx,0x10000000
  406788:	je     0x4067b4
  40678a:	or     esi,0x8
  40678d:	mov    DWORD PTR ds:0x413e5c,0x3
  406797:	mov    DWORD PTR ds:0x412cf0,esi
  40679d:	test   al,0x20
  40679f:	je     0x4067b4
  4067a1:	or     esi,0x20
  4067a4:	mov    DWORD PTR ds:0x413e5c,0x5
  4067ae:	mov    DWORD PTR ds:0x412cf0,esi
  4067b4:	pop    edi
  4067b5:	pop    esi
  4067b6:	xor    eax,eax
  4067b8:	pop    ebx
  4067b9:	mov    esp,ebp
  4067bb:	pop    ebp
  4067bc:	ret
  4067bd:	push   0x10
  4067bf:	push   0x4110d0
  4067c4:	call   0x403b60
  4067c9:	xor    edi,edi
  4067cb:	mov    DWORD PTR [ebp-0x1c],edi
  4067ce:	push   0x1
  4067d0:	call   0x405969
  4067d5:	pop    ecx
  4067d6:	and    DWORD PTR [ebp-0x4],edi
  4067d9:	push   0x3
  4067db:	pop    esi
  4067dc:	mov    DWORD PTR [ebp-0x20],esi
  4067df:	cmp    esi,DWORD PTR ds:0x414ea4
  4067e5:	jge    0x40683a
  4067e7:	mov    eax,ds:0x414ea0
  4067ec:	mov    eax,DWORD PTR [eax+esi*4]
  4067ef:	test   eax,eax
  4067f1:	je     0x406837
  4067f3:	test   BYTE PTR [eax+0xc],0x83
  4067f7:	je     0x406809
  4067f9:	push   eax
  4067fa:	call   0x408103
  4067ff:	pop    ecx
  406800:	cmp    eax,0xffffffff
  406803:	je     0x406809
  406805:	inc    edi
  406806:	mov    DWORD PTR [ebp-0x1c],edi
  406809:	cmp    esi,0x14
  40680c:	jl     0x406837
  40680e:	mov    eax,ds:0x414ea0
  406813:	mov    eax,DWORD PTR [eax+esi*4]
  406816:	add    eax,0x20
  406819:	push   eax
  40681a:	call   DWORD PTR ds:0x40d054
  406820:	mov    eax,ds:0x414ea0
  406825:	push   DWORD PTR [eax+esi*4]
  406828:	call   0x40575f
  40682d:	pop    ecx
  40682e:	mov    eax,ds:0x414ea0
  406833:	and    DWORD PTR [eax+esi*4],0x0
  406837:	inc    esi
  406838:	jmp    0x4067dc
  40683a:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  406841:	call   0x406851
  406846:	mov    eax,edi
  406848:	call   0x403ba5
  40684d:	ret
  40684e:	mov    edi,DWORD PTR [ebp-0x1c]
  406851:	push   0x1
  406853:	call   0x405ad3
  406858:	pop    ecx
  406859:	ret
  40685a:	push   ebp
  40685b:	mov    ebp,esp
  40685d:	push   esi
  40685e:	mov    esi,DWORD PTR [ebp+0x8]
  406861:	test   esi,esi
  406863:	jne    0x40686e
  406865:	push   esi
  406866:	call   0x40690d
  40686b:	pop    ecx
  40686c:	jmp    0x40689d
  40686e:	push   esi
  40686f:	call   0x4068a0
  406874:	pop    ecx
  406875:	test   eax,eax
  406877:	je     0x40687e
  406879:	or     eax,0xffffffff
  40687c:	jmp    0x40689d
  40687e:	test   DWORD PTR [esi+0xc],0x4000
  406885:	je     0x40689b
  406887:	push   esi
  406888:	call   0x403f66
  40688d:	push   eax
  40688e:	call   0x40817a
  406893:	neg    eax
  406895:	pop    ecx
  406896:	pop    ecx
  406897:	sbb    eax,eax
  406899:	jmp    0x40689d
  40689b:	xor    eax,eax
  40689d:	pop    esi
  40689e:	pop    ebp
  40689f:	ret
  4068a0:	push   ebp
  4068a1:	mov    ebp,esp
  4068a3:	push   ebx
  4068a4:	push   esi
  4068a5:	mov    esi,DWORD PTR [ebp+0x8]
  4068a8:	xor    ebx,ebx
  4068aa:	mov    eax,DWORD PTR [esi+0xc]
  4068ad:	and    al,0x3
  4068af:	cmp    al,0x2
  4068b1:	jne    0x4068f5
  4068b3:	test   DWORD PTR [esi+0xc],0x108
  4068ba:	je     0x4068f5
  4068bc:	push   edi
  4068bd:	mov    edi,DWORD PTR [esi]
  4068bf:	sub    edi,DWORD PTR [esi+0x8]
  4068c2:	test   edi,edi
  4068c4:	jle    0x4068f4
  4068c6:	push   edi
  4068c7:	push   DWORD PTR [esi+0x8]
  4068ca:	push   esi
  4068cb:	call   0x403f66
  4068d0:	pop    ecx
  4068d1:	push   eax
  4068d2:	call   0x403fde
  4068d7:	add    esp,0xc
  4068da:	cmp    eax,edi
  4068dc:	jne    0x4068ed
  4068de:	mov    eax,DWORD PTR [esi+0xc]
  4068e1:	test   al,al
  4068e3:	jns    0x4068f4
  4068e5:	and    eax,0xfffffffd
  4068e8:	mov    DWORD PTR [esi+0xc],eax
  4068eb:	jmp    0x4068f4
  4068ed:	or     DWORD PTR [esi+0xc],0x20
  4068f1:	or     ebx,0xffffffff
  4068f4:	pop    edi
  4068f5:	mov    ecx,DWORD PTR [esi+0x8]
  4068f8:	mov    eax,ebx
  4068fa:	and    DWORD PTR [esi+0x4],0x0
  4068fe:	mov    DWORD PTR [esi],ecx
  406900:	pop    esi
  406901:	pop    ebx
  406902:	pop    ebp
  406903:	ret
  406904:	push   0x1
  406906:	call   0x40690d
  40690b:	pop    ecx
  40690c:	ret
  40690d:	push   0x14
  40690f:	push   0x4110f0
  406914:	call   0x403b60
  406919:	xor    edi,edi
  40691b:	mov    DWORD PTR [ebp-0x1c],edi
  40691e:	and    DWORD PTR [ebp-0x24],edi
  406921:	push   0x1
  406923:	call   0x405969
  406928:	pop    ecx
  406929:	and    DWORD PTR [ebp-0x4],edi
  40692c:	xor    esi,esi
  40692e:	mov    ebx,DWORD PTR [ebp+0x8]
  406931:	mov    DWORD PTR [ebp-0x20],esi
  406934:	cmp    esi,DWORD PTR ds:0x414ea4
  40693a:	jge    0x4069c6
  406940:	mov    eax,ds:0x414ea0
  406945:	mov    eax,DWORD PTR [eax+esi*4]
  406948:	test   eax,eax
  40694a:	je     0x4069a9
  40694c:	test   BYTE PTR [eax+0xc],0x83
  406950:	je     0x4069a9
  406952:	push   eax
  406953:	push   esi
  406954:	call   0x403ecf
  406959:	pop    ecx
  40695a:	pop    ecx
  40695b:	mov    DWORD PTR [ebp-0x4],0x1
  406962:	mov    eax,ds:0x414ea0
  406967:	mov    eax,DWORD PTR [eax+esi*4]
  40696a:	test   BYTE PTR [eax+0xc],0x83
  40696e:	je     0x4069a0
  406970:	cmp    ebx,0x1
  406973:	jne    0x406987
  406975:	push   eax
  406976:	call   0x40685a
  40697b:	pop    ecx
  40697c:	cmp    eax,0xffffffff
  40697f:	je     0x4069a0
  406981:	inc    edi
  406982:	mov    DWORD PTR [ebp-0x1c],edi
  406985:	jmp    0x4069a0
  406987:	test   ebx,ebx
  406989:	jne    0x4069a0
  40698b:	test   BYTE PTR [eax+0xc],0x2
  40698f:	je     0x4069a0
  406991:	push   eax
  406992:	call   0x40685a
  406997:	pop    ecx
  406998:	cmp    eax,0xffffffff
  40699b:	jne    0x4069a0
  40699d:	or     DWORD PTR [ebp-0x24],eax
  4069a0:	and    DWORD PTR [ebp-0x4],0x0
  4069a4:	call   0x4069b5
  4069a9:	inc    esi
  4069aa:	jmp    0x406931
  4069ac:	mov    ebx,DWORD PTR [ebp+0x8]
  4069af:	mov    edi,DWORD PTR [ebp-0x1c]
  4069b2:	mov    esi,DWORD PTR [ebp-0x20]
  4069b5:	mov    eax,ds:0x414ea0
  4069ba:	push   DWORD PTR [eax+esi*4]
  4069bd:	push   esi
  4069be:	call   0x403f39
  4069c3:	pop    ecx
  4069c4:	pop    ecx
  4069c5:	ret
  4069c6:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  4069cd:	call   0x4069e8
  4069d2:	cmp    ebx,0x1
  4069d5:	mov    eax,edi
  4069d7:	je     0x4069dc
  4069d9:	mov    eax,DWORD PTR [ebp-0x24]
  4069dc:	call   0x403ba5
  4069e1:	ret
  4069e2:	mov    ebx,DWORD PTR [ebp+0x8]
  4069e5:	mov    edi,DWORD PTR [ebp-0x1c]
  4069e8:	push   0x1
  4069ea:	call   0x405ad3
  4069ef:	pop    ecx
  4069f0:	ret
  4069f1:	push   0x8
  4069f3:	push   0x411118
  4069f8:	call   0x403b60
  4069fd:	mov    edi,DWORD PTR [ebp+0x8]
  406a00:	mov    eax,edi
  406a02:	sar    eax,0x5
  406a05:	mov    esi,edi
  406a07:	and    esi,0x1f
  406a0a:	shl    esi,0x6
  406a0d:	add    esi,DWORD PTR [eax*4+0x413468]
  406a14:	xor    ebx,ebx
  406a16:	cmp    DWORD PTR [esi+0x8],ebx
  406a19:	jne    0x406a4c
  406a1b:	push   0xa
  406a1d:	call   0x405969
  406a22:	pop    ecx
  406a23:	mov    DWORD PTR [ebp-0x4],ebx
  406a26:	cmp    DWORD PTR [esi+0x8],ebx
  406a29:	jne    0x406a40
  406a2b:	push   ebx
  406a2c:	push   0xfa0
  406a31:	lea    eax,[esi+0xc]
  406a34:	push   eax
  406a35:	call   0x4037b3
  406a3a:	add    esp,0xc
  406a3d:	inc    DWORD PTR [esi+0x8]
  406a40:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  406a47:	call   0x406a76
  406a4c:	mov    eax,edi
  406a4e:	sar    eax,0x5
  406a51:	and    edi,0x1f
  406a54:	shl    edi,0x6
  406a57:	mov    eax,DWORD PTR [eax*4+0x413468]
  406a5e:	add    eax,0xc
  406a61:	add    eax,edi
  406a63:	push   eax
  406a64:	call   DWORD PTR ds:0x40d0a8
  406a6a:	xor    eax,eax
  406a6c:	inc    eax
  406a6d:	call   0x403ba5
  406a72:	ret
  406a73:	mov    edi,DWORD PTR [ebp+0x8]
  406a76:	push   0xa
  406a78:	call   0x405ad3
  406a7d:	pop    ecx
  406a7e:	ret
  406a7f:	push   ebp
  406a80:	mov    ebp,esp
  406a82:	mov    eax,DWORD PTR [ebp+0x8]
  406a85:	push   esi
  406a86:	push   edi
  406a87:	test   eax,eax
  406a89:	js     0x406aeb
  406a8b:	cmp    eax,DWORD PTR ds:0x414f44
  406a91:	jae    0x406aeb
  406a93:	mov    edi,eax
  406a95:	mov    esi,eax
  406a97:	sar    edi,0x5
  406a9a:	and    esi,0x1f
  406a9d:	shl    esi,0x6
  406aa0:	mov    ecx,DWORD PTR [edi*4+0x413468]
  406aa7:	test   BYTE PTR [esi+ecx*1+0x4],0x1
  406aac:	je     0x406aeb
  406aae:	cmp    DWORD PTR [esi+ecx*1],0xffffffff
  406ab2:	je     0x406aeb
  406ab4:	cmp    DWORD PTR ds:0x413670,0x1
  406abb:	jne    0x406adc
  406abd:	xor    ecx,ecx
  406abf:	sub    eax,ecx
  406ac1:	je     0x406ad3
  406ac3:	dec    eax
  406ac4:	je     0x406ace
  406ac6:	dec    eax
  406ac7:	jne    0x406adc
  406ac9:	push   ecx
  406aca:	push   0xfffffff4
  406acc:	jmp    0x406ad6
  406ace:	push   ecx
  406acf:	push   0xfffffff5
  406ad1:	jmp    0x406ad6
  406ad3:	push   ecx
  406ad4:	push   0xfffffff6
  406ad6:	call   DWORD PTR ds:0x40d0dc
  406adc:	mov    eax,DWORD PTR [edi*4+0x413468]
  406ae3:	or     DWORD PTR [esi+eax*1],0xffffffff
  406ae7:	xor    eax,eax
  406ae9:	jmp    0x406b01
  406aeb:	call   0x402568
  406af0:	mov    DWORD PTR [eax],0x9
  406af6:	call   0x402534
  406afb:	and    DWORD PTR [eax],0x0
  406afe:	or     eax,0xffffffff
  406b01:	pop    edi
  406b02:	pop    esi
  406b03:	pop    ebp
  406b04:	ret
  406b05:	push   ebp
  406b06:	mov    ebp,esp
  406b08:	mov    ecx,DWORD PTR [ebp+0x8]
  406b0b:	cmp    ecx,0xfffffffe
  406b0e:	jne    0x406b25
  406b10:	call   0x402534
  406b15:	and    DWORD PTR [eax],0x0
  406b18:	call   0x402568
  406b1d:	mov    DWORD PTR [eax],0x9
  406b23:	jmp    0x406b67
  406b25:	test   ecx,ecx
  406b27:	js     0x406b4f
  406b29:	cmp    ecx,DWORD PTR ds:0x414f44
  406b2f:	jae    0x406b4f
  406b31:	mov    eax,ecx
  406b33:	and    ecx,0x1f
  406b36:	sar    eax,0x5
  406b39:	shl    ecx,0x6
  406b3c:	mov    eax,DWORD PTR [eax*4+0x413468]
  406b43:	test   BYTE PTR [eax+ecx*1+0x4],0x1
  406b48:	je     0x406b4f
  406b4a:	mov    eax,DWORD PTR [eax+ecx*1]
  406b4d:	pop    ebp
  406b4e:	ret
  406b4f:	call   0x402534
  406b54:	and    DWORD PTR [eax],0x0
  406b57:	call   0x402568
  406b5c:	mov    DWORD PTR [eax],0x9
  406b62:	call   0x4016b6
  406b67:	or     eax,0xffffffff
  406b6a:	pop    ebp
  406b6b:	ret
  406b6c:	push   ebp
  406b6d:	mov    ebp,esp
  406b6f:	mov    ecx,DWORD PTR [ebp+0x8]
  406b72:	mov    eax,ecx
  406b74:	sar    eax,0x5
  406b77:	and    ecx,0x1f
  406b7a:	shl    ecx,0x6
  406b7d:	add    ecx,0xc
  406b80:	mov    eax,DWORD PTR [eax*4+0x413468]
  406b87:	add    eax,ecx
  406b89:	push   eax
  406b8a:	call   DWORD PTR ds:0x40d0ac
  406b90:	pop    ebp
  406b91:	ret
  406b92:	push   ebp
  406b93:	mov    ebp,esp
  406b95:	sub    esp,0x10
  406b98:	push   ebx
  406b99:	push   esi
  406b9a:	mov    esi,DWORD PTR [ebp+0xc]
  406b9d:	test   esi,esi
  406b9f:	je     0x406bb9
  406ba1:	mov    ebx,DWORD PTR [ebp+0x10]
  406ba4:	test   ebx,ebx
  406ba6:	je     0x406bb9
  406ba8:	cmp    BYTE PTR [esi],0x0
  406bab:	jne    0x406bc1
  406bad:	mov    eax,DWORD PTR [ebp+0x8]
  406bb0:	test   eax,eax
  406bb2:	je     0x406bb9
  406bb4:	xor    ecx,ecx
  406bb6:	mov    WORD PTR [eax],cx
  406bb9:	xor    eax,eax
  406bbb:	pop    esi
  406bbc:	pop    ebx
  406bbd:	mov    esp,ebp
  406bbf:	pop    ebp
  406bc0:	ret
  406bc1:	push   edi
  406bc2:	push   DWORD PTR [ebp+0x14]
  406bc5:	lea    ecx,[ebp-0x10]
  406bc8:	call   0x401840
  406bcd:	mov    eax,DWORD PTR [ebp-0x10]
  406bd0:	cmp    DWORD PTR [eax+0xa8],0x0
  406bd7:	jne    0x406bee
  406bd9:	mov    ecx,DWORD PTR [ebp+0x8]
  406bdc:	test   ecx,ecx
  406bde:	je     0x406be6
  406be0:	movzx  eax,BYTE PTR [esi]
  406be3:	mov    WORD PTR [ecx],ax
  406be6:	xor    edi,edi
  406be8:	inc    edi
  406be9:	jmp    0x406c72
  406bee:	lea    eax,[ebp-0x10]
  406bf1:	push   eax
  406bf2:	movzx  eax,BYTE PTR [esi]
  406bf5:	push   eax
  406bf6:	call   0x405531
  406bfb:	pop    ecx
  406bfc:	pop    ecx
  406bfd:	test   eax,eax
  406bff:	je     0x406c41
  406c01:	mov    edi,DWORD PTR [ebp-0x10]
  406c04:	cmp    DWORD PTR [edi+0x74],0x1
  406c08:	jle    0x406c31
  406c0a:	cmp    ebx,DWORD PTR [edi+0x74]
  406c0d:	jl     0x406c34
  406c0f:	xor    eax,eax
  406c11:	cmp    DWORD PTR [ebp+0x8],eax
  406c14:	setne  al
  406c17:	push   eax
  406c18:	push   DWORD PTR [ebp+0x8]
  406c1b:	push   DWORD PTR [edi+0x74]
  406c1e:	push   esi
  406c1f:	push   0x9
  406c21:	push   DWORD PTR [edi+0x4]
  406c24:	call   DWORD PTR ds:0x40d040
  406c2a:	mov    edi,DWORD PTR [ebp-0x10]
  406c2d:	test   eax,eax
  406c2f:	jne    0x406c3c
  406c31:	cmp    ebx,DWORD PTR [edi+0x74]
  406c34:	jb     0x406c64
  406c36:	cmp    BYTE PTR [esi+0x1],0x0
  406c3a:	je     0x406c64
  406c3c:	mov    edi,DWORD PTR [edi+0x74]
  406c3f:	jmp    0x406c72
  406c41:	xor    eax,eax
  406c43:	cmp    DWORD PTR [ebp+0x8],eax
  406c46:	setne  al
  406c49:	xor    edi,edi
  406c4b:	push   eax
  406c4c:	push   DWORD PTR [ebp+0x8]
  406c4f:	mov    eax,DWORD PTR [ebp-0x10]
  406c52:	inc    edi
  406c53:	push   edi
  406c54:	push   esi
  406c55:	push   0x9
  406c57:	push   DWORD PTR [eax+0x4]
  406c5a:	call   DWORD PTR ds:0x40d040
  406c60:	test   eax,eax
  406c62:	jne    0x406c72
  406c64:	call   0x402568
  406c69:	or     edi,0xffffffff
  406c6c:	mov    DWORD PTR [eax],0x2a
  406c72:	cmp    BYTE PTR [ebp-0x4],0x0
  406c76:	je     0x406c7f
  406c78:	mov    ecx,DWORD PTR [ebp-0x8]
  406c7b:	and    DWORD PTR [ecx+0x70],0xfffffffd
  406c7f:	mov    eax,edi
  406c81:	pop    edi
  406c82:	jmp    0x406bbb
  406c87:	push   ebp
  406c88:	mov    ebp,esp
  406c8a:	push   0x0
  406c8c:	push   DWORD PTR [ebp+0x10]
  406c8f:	push   DWORD PTR [ebp+0xc]
  406c92:	push   DWORD PTR [ebp+0x8]
  406c95:	call   0x406b92
  406c9a:	add    esp,0x10
  406c9d:	pop    ebp
  406c9e:	ret
  406c9f:	push   ebp
  406ca0:	mov    ebp,esp
  406ca2:	push   ecx
  406ca3:	mov    eax,ds:0x412d80
  406ca8:	cmp    eax,0xfffffffe
  406cab:	jne    0x406cb7
  406cad:	call   0x40827a
  406cb2:	mov    eax,ds:0x412d80
  406cb7:	cmp    eax,0xffffffff
  406cba:	jne    0x406cc3
  406cbc:	mov    eax,0xffff
  406cc1:	jmp    0x406cde
  406cc3:	push   0x0
  406cc5:	lea    ecx,[ebp-0x4]
  406cc8:	push   ecx
  406cc9:	push   0x1
  406ccb:	lea    ecx,[ebp+0x8]
  406cce:	push   ecx
  406ccf:	push   eax
  406cd0:	call   DWORD PTR ds:0x40d0e0
  406cd6:	test   eax,eax
  406cd8:	je     0x406cbc
  406cda:	mov    ax,WORD PTR [ebp+0x8]
  406cde:	mov    esp,ebp
  406ce0:	pop    ebp
  406ce1:	ret
  406ce2:	int3
  406ce3:	int3
  406ce4:	int3
  406ce5:	int3
  406ce6:	int3
  406ce7:	int3
  406ce8:	int3
  406ce9:	int3
  406cea:	int3
  406ceb:	int3
  406cec:	int3
  406ced:	int3
  406cee:	int3
  406cef:	int3
  406cf0:	push   ecx
  406cf1:	lea    ecx,[esp+0x4]
  406cf5:	sub    ecx,eax
  406cf7:	sbb    eax,eax
  406cf9:	not    eax
  406cfb:	and    ecx,eax
  406cfd:	mov    eax,esp
  406cff:	and    eax,0xfffff000
  406d04:	cmp    ecx,eax
  406d06:	jb     0x406d12
  406d08:	mov    eax,ecx
  406d0a:	pop    ecx
  406d0b:	xchg   esp,eax
  406d0c:	mov    eax,DWORD PTR [eax]
  406d0e:	mov    DWORD PTR [esp],eax
  406d11:	ret
  406d12:	sub    eax,0x1000
  406d17:	test   DWORD PTR [eax],eax
  406d19:	jmp    0x406d04
  406d1b:	push   ebp
  406d1c:	mov    ebp,esp
  406d1e:	push   esi
  406d1f:	mov    esi,DWORD PTR [ebp+0x8]
  406d22:	test   esi,esi
  406d24:	je     0x406e14
  406d2a:	mov    eax,DWORD PTR [esi+0xc]
  406d2d:	cmp    eax,DWORD PTR ds:0x412d14
  406d33:	je     0x406d3c
  406d35:	push   eax
  406d36:	call   0x40575f
  406d3b:	pop    ecx
  406d3c:	mov    eax,DWORD PTR [esi+0x10]
  406d3f:	cmp    eax,DWORD PTR ds:0x412d18
  406d45:	je     0x406d4e
  406d47:	push   eax
  406d48:	call   0x40575f
  406d4d:	pop    ecx
  406d4e:	mov    eax,DWORD PTR [esi+0x14]
  406d51:	cmp    eax,DWORD PTR ds:0x412d1c
  406d57:	je     0x406d60
  406d59:	push   eax
  406d5a:	call   0x40575f
  406d5f:	pop    ecx
  406d60:	mov    eax,DWORD PTR [esi+0x18]
  406d63:	cmp    eax,DWORD PTR ds:0x412d20
  406d69:	je     0x406d72
  406d6b:	push   eax
  406d6c:	call   0x40575f
  406d71:	pop    ecx
  406d72:	mov    eax,DWORD PTR [esi+0x1c]
  406d75:	cmp    eax,DWORD PTR ds:0x412d24
  406d7b:	je     0x406d84
  406d7d:	push   eax
  406d7e:	call   0x40575f
  406d83:	pop    ecx
  406d84:	mov    eax,DWORD PTR [esi+0x20]
  406d87:	cmp    eax,DWORD PTR ds:0x412d28
  406d8d:	je     0x406d96
  406d8f:	push   eax
  406d90:	call   0x40575f
  406d95:	pop    ecx
  406d96:	mov    eax,DWORD PTR [esi+0x24]
  406d99:	cmp    eax,DWORD PTR ds:0x412d2c
  406d9f:	je     0x406da8
  406da1:	push   eax
  406da2:	call   0x40575f
  406da7:	pop    ecx
  406da8:	mov    eax,DWORD PTR [esi+0x38]
  406dab:	cmp    eax,DWORD PTR ds:0x412d40
  406db1:	je     0x406dba
  406db3:	push   eax
  406db4:	call   0x40575f
  406db9:	pop    ecx
  406dba:	mov    eax,DWORD PTR [esi+0x3c]
  406dbd:	cmp    eax,DWORD PTR ds:0x412d44
  406dc3:	je     0x406dcc
  406dc5:	push   eax
  406dc6:	call   0x40575f
  406dcb:	pop    ecx
  406dcc:	mov    eax,DWORD PTR [esi+0x40]
  406dcf:	cmp    eax,DWORD PTR ds:0x412d48
  406dd5:	je     0x406dde
  406dd7:	push   eax
  406dd8:	call   0x40575f
  406ddd:	pop    ecx
  406dde:	mov    eax,DWORD PTR [esi+0x44]
  406de1:	cmp    eax,DWORD PTR ds:0x412d4c
  406de7:	je     0x406df0
  406de9:	push   eax
  406dea:	call   0x40575f
  406def:	pop    ecx
  406df0:	mov    eax,DWORD PTR [esi+0x48]
  406df3:	cmp    eax,DWORD PTR ds:0x412d50
  406df9:	je     0x406e02
  406dfb:	push   eax
  406dfc:	call   0x40575f
  406e01:	pop    ecx
  406e02:	mov    eax,DWORD PTR [esi+0x4c]
  406e05:	cmp    eax,DWORD PTR ds:0x412d54
  406e0b:	je     0x406e14
  406e0d:	push   eax
  406e0e:	call   0x40575f
  406e13:	pop    ecx
  406e14:	pop    esi
  406e15:	pop    ebp
  406e16:	ret
  406e17:	push   ebp
  406e18:	mov    ebp,esp
  406e1a:	push   esi
  406e1b:	mov    esi,DWORD PTR [ebp+0x8]
  406e1e:	test   esi,esi
  406e20:	je     0x406e7b
  406e22:	mov    eax,DWORD PTR [esi]
  406e24:	cmp    eax,DWORD PTR ds:0x412d08
  406e2a:	je     0x406e33
  406e2c:	push   eax
  406e2d:	call   0x40575f
  406e32:	pop    ecx
  406e33:	mov    eax,DWORD PTR [esi+0x4]
  406e36:	cmp    eax,DWORD PTR ds:0x412d0c
  406e3c:	je     0x406e45
  406e3e:	push   eax
  406e3f:	call   0x40575f
  406e44:	pop    ecx
  406e45:	mov    eax,DWORD PTR [esi+0x8]
  406e48:	cmp    eax,DWORD PTR ds:0x412d10
  406e4e:	je     0x406e57
  406e50:	push   eax
  406e51:	call   0x40575f
  406e56:	pop    ecx
  406e57:	mov    eax,DWORD PTR [esi+0x30]
  406e5a:	cmp    eax,DWORD PTR ds:0x412d38
  406e60:	je     0x406e69
  406e62:	push   eax
  406e63:	call   0x40575f
  406e68:	pop    ecx
  406e69:	mov    eax,DWORD PTR [esi+0x34]
  406e6c:	cmp    eax,DWORD PTR ds:0x412d3c
  406e72:	je     0x406e7b
  406e74:	push   eax
  406e75:	call   0x40575f
  406e7a:	pop    ecx
  406e7b:	pop    esi
  406e7c:	pop    ebp
  406e7d:	ret
  406e7e:	push   ebp
  406e7f:	mov    ebp,esp
  406e81:	push   esi
  406e82:	mov    esi,DWORD PTR [ebp+0x8]
  406e85:	test   esi,esi
  406e87:	je     0x4071fb
  406e8d:	push   DWORD PTR [esi+0x4]
  406e90:	call   0x40575f
  406e95:	push   DWORD PTR [esi+0x8]
  406e98:	call   0x40575f
  406e9d:	push   DWORD PTR [esi+0xc]
  406ea0:	call   0x40575f
  406ea5:	push   DWORD PTR [esi+0x10]
  406ea8:	call   0x40575f
  406ead:	push   DWORD PTR [esi+0x14]
  406eb0:	call   0x40575f
  406eb5:	push   DWORD PTR [esi+0x18]
  406eb8:	call   0x40575f
  406ebd:	push   DWORD PTR [esi]
  406ebf:	call   0x40575f
  406ec4:	push   DWORD PTR [esi+0x20]
  406ec7:	call   0x40575f
  406ecc:	push   DWORD PTR [esi+0x24]
  406ecf:	call   0x40575f
  406ed4:	push   DWORD PTR [esi+0x28]
  406ed7:	call   0x40575f
  406edc:	push   DWORD PTR [esi+0x2c]
  406edf:	call   0x40575f
  406ee4:	push   DWORD PTR [esi+0x30]
  406ee7:	call   0x40575f
  406eec:	push   DWORD PTR [esi+0x34]
  406eef:	call   0x40575f
  406ef4:	push   DWORD PTR [esi+0x1c]
  406ef7:	call   0x40575f
  406efc:	push   DWORD PTR [esi+0x38]
  406eff:	call   0x40575f
  406f04:	push   DWORD PTR [esi+0x3c]
  406f07:	call   0x40575f
  406f0c:	add    esp,0x40
  406f0f:	push   DWORD PTR [esi+0x40]
  406f12:	call   0x40575f
  406f17:	push   DWORD PTR [esi+0x44]
  406f1a:	call   0x40575f
  406f1f:	push   DWORD PTR [esi+0x48]
  406f22:	call   0x40575f
  406f27:	push   DWORD PTR [esi+0x4c]
  406f2a:	call   0x40575f
  406f2f:	push   DWORD PTR [esi+0x50]
  406f32:	call   0x40575f
  406f37:	push   DWORD PTR [esi+0x54]
  406f3a:	call   0x40575f
  406f3f:	push   DWORD PTR [esi+0x58]
  406f42:	call   0x40575f
  406f47:	push   DWORD PTR [esi+0x5c]
  406f4a:	call   0x40575f
  406f4f:	push   DWORD PTR [esi+0x60]
  406f52:	call   0x40575f
  406f57:	push   DWORD PTR [esi+0x64]
  406f5a:	call   0x40575f
  406f5f:	push   DWORD PTR [esi+0x68]
  406f62:	call   0x40575f
  406f67:	push   DWORD PTR [esi+0x6c]
  406f6a:	call   0x40575f
  406f6f:	push   DWORD PTR [esi+0x70]
  406f72:	call   0x40575f
  406f77:	push   DWORD PTR [esi+0x74]
  406f7a:	call   0x40575f
  406f7f:	push   DWORD PTR [esi+0x78]
  406f82:	call   0x40575f
  406f87:	push   DWORD PTR [esi+0x7c]
  406f8a:	call   0x40575f
  406f8f:	add    esp,0x40
  406f92:	push   DWORD PTR [esi+0x80]
  406f98:	call   0x40575f
  406f9d:	push   DWORD PTR [esi+0x84]
  406fa3:	call   0x40575f
  406fa8:	push   DWORD PTR [esi+0x88]
  406fae:	call   0x40575f
  406fb3:	push   DWORD PTR [esi+0x8c]
  406fb9:	call   0x40575f
  406fbe:	push   DWORD PTR [esi+0x90]
  406fc4:	call   0x40575f
  406fc9:	push   DWORD PTR [esi+0x94]
  406fcf:	call   0x40575f
  406fd4:	push   DWORD PTR [esi+0x98]
  406fda:	call   0x40575f
  406fdf:	push   DWORD PTR [esi+0x9c]
  406fe5:	call   0x40575f
  406fea:	push   DWORD PTR [esi+0xa0]
  406ff0:	call   0x40575f
  406ff5:	push   DWORD PTR [esi+0xa4]
  406ffb:	call   0x40575f
  407000:	push   DWORD PTR [esi+0xa8]
  407006:	call   0x40575f
  40700b:	push   DWORD PTR [esi+0xb8]
  407011:	call   0x40575f
  407016:	push   DWORD PTR [esi+0xbc]
  40701c:	call   0x40575f
  407021:	push   DWORD PTR [esi+0xc0]
  407027:	call   0x40575f
  40702c:	push   DWORD PTR [esi+0xc4]
  407032:	call   0x40575f
  407037:	push   DWORD PTR [esi+0xc8]
  40703d:	call   0x40575f
  407042:	add    esp,0x40
  407045:	push   DWORD PTR [esi+0xcc]
  40704b:	call   0x40575f
  407050:	push   DWORD PTR [esi+0xb4]
  407056:	call   0x40575f
  40705b:	push   DWORD PTR [esi+0xd4]
  407061:	call   0x40575f
  407066:	push   DWORD PTR [esi+0xd8]
  40706c:	call   0x40575f
  407071:	push   DWORD PTR [esi+0xdc]
  407077:	call   0x40575f
  40707c:	push   DWORD PTR [esi+0xe0]
  407082:	call   0x40575f
  407087:	push   DWORD PTR [esi+0xe4]
  40708d:	call   0x40575f
  407092:	push   DWORD PTR [esi+0xe8]
  407098:	call   0x40575f
  40709d:	push   DWORD PTR [esi+0xd0]
  4070a3:	call   0x40575f
  4070a8:	push   DWORD PTR [esi+0xec]
  4070ae:	call   0x40575f
  4070b3:	push   DWORD PTR [esi+0xf0]
  4070b9:	call   0x40575f
  4070be:	push   DWORD PTR [esi+0xf4]
  4070c4:	call   0x40575f
  4070c9:	push   DWORD PTR [esi+0xf8]
  4070cf:	call   0x40575f
  4070d4:	push   DWORD PTR [esi+0xfc]
  4070da:	call   0x40575f
  4070df:	push   DWORD PTR [esi+0x100]
  4070e5:	call   0x40575f
  4070ea:	push   DWORD PTR [esi+0x104]
  4070f0:	call   0x40575f
  4070f5:	add    esp,0x40
  4070f8:	push   DWORD PTR [esi+0x108]
  4070fe:	call   0x40575f
  407103:	push   DWORD PTR [esi+0x10c]
  407109:	call   0x40575f
  40710e:	push   DWORD PTR [esi+0x110]
  407114:	call   0x40575f
  407119:	push   DWORD PTR [esi+0x114]
  40711f:	call   0x40575f
  407124:	push   DWORD PTR [esi+0x118]
  40712a:	call   0x40575f
  40712f:	push   DWORD PTR [esi+0x11c]
  407135:	call   0x40575f
  40713a:	push   DWORD PTR [esi+0x120]
  407140:	call   0x40575f
  407145:	push   DWORD PTR [esi+0x124]
  40714b:	call   0x40575f
  407150:	push   DWORD PTR [esi+0x128]
  407156:	call   0x40575f
  40715b:	push   DWORD PTR [esi+0x12c]
  407161:	call   0x40575f
  407166:	push   DWORD PTR [esi+0x130]
  40716c:	call   0x40575f
  407171:	push   DWORD PTR [esi+0x134]
  407177:	call   0x40575f
  40717c:	push   DWORD PTR [esi+0x138]
  407182:	call   0x40575f
  407187:	push   DWORD PTR [esi+0x13c]
  40718d:	call   0x40575f
  407192:	push   DWORD PTR [esi+0x140]
  407198:	call   0x40575f
  40719d:	push   DWORD PTR [esi+0x144]
  4071a3:	call   0x40575f
  4071a8:	add    esp,0x40
  4071ab:	push   DWORD PTR [esi+0x148]
  4071b1:	call   0x40575f
  4071b6:	push   DWORD PTR [esi+0x14c]
  4071bc:	call   0x40575f
  4071c1:	push   DWORD PTR [esi+0x150]
  4071c7:	call   0x40575f
  4071cc:	push   DWORD PTR [esi+0x154]
  4071d2:	call   0x40575f
  4071d7:	push   DWORD PTR [esi+0x158]
  4071dd:	call   0x40575f
  4071e2:	push   DWORD PTR [esi+0x15c]
  4071e8:	call   0x40575f
  4071ed:	push   DWORD PTR [esi+0x160]
  4071f3:	call   0x40575f
  4071f8:	add    esp,0x1c
  4071fb:	pop    esi
  4071fc:	pop    ebp
  4071fd:	ret
  4071fe:	push   ebp
  4071ff:	mov    ebp,esp
  407201:	push   ecx
  407202:	push   ecx
  407203:	mov    eax,ds:0x412000
  407208:	xor    eax,ebp
  40720a:	mov    DWORD PTR [ebp-0x4],eax
  40720d:	push   ebx
  40720e:	push   esi
  40720f:	mov    esi,DWORD PTR [ebp+0x18]
  407212:	push   edi
  407213:	test   esi,esi
  407215:	jle    0x407238
  407217:	mov    eax,DWORD PTR [ebp+0x14]
  40721a:	mov    ecx,esi
  40721c:	dec    ecx
  40721d:	cmp    BYTE PTR [eax],0x0
  407220:	je     0x40722a
  407222:	inc    eax
  407223:	test   ecx,ecx
  407225:	jne    0x40721c
  407227:	or     ecx,0xffffffff
  40722a:	mov    eax,esi
  40722c:	sub    eax,ecx
  40722e:	dec    eax
  40722f:	cmp    eax,esi
  407231:	lea    esi,[eax+0x1]
  407234:	jl     0x407238
  407236:	mov    esi,eax
  407238:	mov    ecx,DWORD PTR [ebp+0x24]
  40723b:	xor    edi,edi
  40723d:	test   ecx,ecx
  40723f:	jne    0x40724e
  407241:	mov    eax,DWORD PTR [ebp+0x8]
  407244:	mov    eax,DWORD PTR [eax]
  407246:	mov    eax,DWORD PTR [eax+0x4]
  407249:	mov    ecx,eax
  40724b:	mov    DWORD PTR [ebp+0x24],eax
  40724e:	xor    eax,eax
  407250:	cmp    DWORD PTR [ebp+0x28],eax
  407253:	push   0x0
  407255:	push   0x0
  407257:	push   esi
  407258:	push   DWORD PTR [ebp+0x14]
  40725b:	setne  al
  40725e:	lea    eax,[eax*8+0x1]
  407265:	push   eax
  407266:	push   ecx
  407267:	call   DWORD PTR ds:0x40d040
  40726d:	mov    ecx,eax
  40726f:	mov    DWORD PTR [ebp-0x8],ecx
  407272:	test   ecx,ecx
  407274:	jne    0x40727d
  407276:	xor    eax,eax
  407278:	jmp    0x4073ee
  40727d:	jle    0x4072d6
  40727f:	push   0xffffffe0
  407281:	xor    edx,edx
  407283:	pop    eax
  407284:	div    ecx
  407286:	cmp    eax,0x2
  407289:	jb     0x4072d6
  40728b:	add    ecx,ecx
  40728d:	lea    eax,[ecx+0x8]
  407290:	cmp    eax,ecx
  407292:	jbe    0x4072d3
  407294:	mov    eax,DWORD PTR [ebp-0x8]
  407297:	lea    eax,[eax*2+0x8]
  40729e:	cmp    eax,0x400
  4072a3:	ja     0x4072b8
  4072a5:	call   0x4083a0
  4072aa:	mov    ebx,esp
  4072ac:	test   ebx,ebx
  4072ae:	je     0x4072ce
  4072b0:	mov    DWORD PTR [ebx],0xcccc
  4072b6:	jmp    0x4072cb
  4072b8:	push   eax
  4072b9:	call   0x40759e
  4072be:	mov    ebx,eax
  4072c0:	pop    ecx
  4072c1:	test   ebx,ebx
  4072c3:	je     0x4072ce
  4072c5:	mov    DWORD PTR [ebx],0xdddd
  4072cb:	add    ebx,0x8
  4072ce:	mov    ecx,DWORD PTR [ebp-0x8]
  4072d1:	jmp    0x4072d8
  4072d3:	mov    ecx,DWORD PTR [ebp-0x8]
  4072d6:	xor    ebx,ebx
  4072d8:	test   ebx,ebx
  4072da:	je     0x407276
  4072dc:	push   ecx
  4072dd:	push   ebx
  4072de:	push   esi
  4072df:	push   DWORD PTR [ebp+0x14]
  4072e2:	push   0x1
  4072e4:	push   DWORD PTR [ebp+0x24]
  4072e7:	call   DWORD PTR ds:0x40d040
  4072ed:	test   eax,eax
  4072ef:	je     0x4073e5
  4072f5:	mov    esi,DWORD PTR [ebp-0x8]
  4072f8:	push   0x0
  4072fa:	push   0x0
  4072fc:	push   esi
  4072fd:	push   ebx
  4072fe:	push   DWORD PTR [ebp+0x10]
  407301:	push   DWORD PTR [ebp+0xc]
  407304:	call   0x40784a
  407309:	mov    edi,eax
  40730b:	add    esp,0x18
  40730e:	test   edi,edi
  407310:	je     0x4073e5
  407316:	test   DWORD PTR [ebp+0x10],0x400
  40731d:	je     0x40734b
  40731f:	mov    ecx,DWORD PTR [ebp+0x20]
  407322:	test   ecx,ecx
  407324:	je     0x4073e5
  40732a:	cmp    edi,ecx
  40732c:	jg     0x4073e5
  407332:	push   ecx
  407333:	push   DWORD PTR [ebp+0x1c]
  407336:	push   esi
  407337:	push   ebx
  407338:	push   DWORD PTR [ebp+0x10]
  40733b:	push   DWORD PTR [ebp+0xc]
  40733e:	call   0x40784a
  407343:	add    esp,0x18
  407346:	jmp    0x4073e5
  40734b:	test   edi,edi
  40734d:	jle    0x40739e
  40734f:	push   0xffffffe0
  407351:	xor    edx,edx
  407353:	pop    eax
  407354:	div    edi
  407356:	cmp    eax,0x2
  407359:	jb     0x40739e
  40735b:	lea    ecx,[edi+edi*1]
  40735e:	lea    eax,[ecx+0x8]
  407361:	cmp    eax,ecx
  407363:	jbe    0x40739e
  407365:	lea    eax,[edi*2+0x8]
  40736c:	cmp    eax,0x400
  407371:	ja     0x407386
  407373:	call   0x4083a0
  407378:	mov    esi,esp
  40737a:	test   esi,esi
  40737c:	je     0x4073e5
  40737e:	mov    DWORD PTR [esi],0xcccc
  407384:	jmp    0x407399
  407386:	push   eax
  407387:	call   0x40759e
  40738c:	mov    esi,eax
  40738e:	pop    ecx
  40738f:	test   esi,esi
  407391:	je     0x4073e5
  407393:	mov    DWORD PTR [esi],0xdddd
  407399:	add    esi,0x8
  40739c:	jmp    0x4073a0
  40739e:	xor    esi,esi
  4073a0:	test   esi,esi
  4073a2:	je     0x4073e5
  4073a4:	mov    eax,DWORD PTR [ebp-0x8]
  4073a7:	push   edi
  4073a8:	push   esi
  4073a9:	push   eax
  4073aa:	push   ebx
  4073ab:	push   DWORD PTR [ebp+0x10]
  4073ae:	push   DWORD PTR [ebp+0xc]
  4073b1:	call   0x40784a
  4073b6:	add    esp,0x18
  4073b9:	test   eax,eax
  4073bb:	je     0x4073de
  4073bd:	xor    eax,eax
  4073bf:	push   eax
  4073c0:	push   eax
  4073c1:	cmp    DWORD PTR [ebp+0x20],eax
  4073c4:	jne    0x4073ca
  4073c6:	push   eax
  4073c7:	push   eax
  4073c8:	jmp    0x4073d0
  4073ca:	push   DWORD PTR [ebp+0x20]
  4073cd:	push   DWORD PTR [ebp+0x1c]
  4073d0:	push   edi
  4073d1:	push   esi
  4073d2:	push   eax
  4073d3:	push   DWORD PTR [ebp+0x24]
  4073d6:	call   DWORD PTR ds:0x40d044
  4073dc:	mov    edi,eax
  4073de:	push   esi
  4073df:	call   0x407448
  4073e4:	pop    ecx
  4073e5:	push   ebx
  4073e6:	call   0x407448
  4073eb:	pop    ecx
  4073ec:	mov    eax,edi
  4073ee:	lea    esp,[ebp-0x14]
  4073f1:	pop    edi
  4073f2:	pop    esi
  4073f3:	pop    ebx
  4073f4:	mov    ecx,DWORD PTR [ebp-0x4]
  4073f7:	xor    ecx,ebp
  4073f9:	call   0x40120d
  4073fe:	mov    esp,ebp
  407400:	pop    ebp
  407401:	ret
  407402:	push   ebp
  407403:	mov    ebp,esp
  407405:	sub    esp,0x10
  407408:	push   DWORD PTR [ebp+0x8]
  40740b:	lea    ecx,[ebp-0x10]
  40740e:	call   0x401840
  407413:	push   DWORD PTR [ebp+0x28]
  407416:	lea    eax,[ebp-0x10]
  407419:	push   DWORD PTR [ebp+0x24]
  40741c:	push   DWORD PTR [ebp+0x20]
  40741f:	push   DWORD PTR [ebp+0x1c]
  407422:	push   DWORD PTR [ebp+0x18]
  407425:	push   DWORD PTR [ebp+0x14]
  407428:	push   DWORD PTR [ebp+0x10]
  40742b:	push   DWORD PTR [ebp+0xc]
  40742e:	push   eax
  40742f:	call   0x4071fe
  407434:	add    esp,0x24
  407437:	cmp    BYTE PTR [ebp-0x4],0x0
  40743b:	je     0x407444
  40743d:	mov    ecx,DWORD PTR [ebp-0x8]
  407440:	and    DWORD PTR [ecx+0x70],0xfffffffd
  407444:	mov    esp,ebp
  407446:	pop    ebp
  407447:	ret
  407448:	push   ebp
  407449:	mov    ebp,esp
  40744b:	mov    eax,DWORD PTR [ebp+0x8]
  40744e:	test   eax,eax
  407450:	je     0x407464
  407452:	sub    eax,0x8
  407455:	cmp    DWORD PTR [eax],0xdddd
  40745b:	jne    0x407464
  40745d:	push   eax
  40745e:	call   0x40575f
  407463:	pop    ecx
  407464:	pop    ebp
  407465:	ret
  407466:	push   ebp
  407467:	mov    ebp,esp
  407469:	push   ecx
  40746a:	mov    eax,ds:0x412000
  40746f:	xor    eax,ebp
  407471:	mov    DWORD PTR [ebp-0x4],eax
  407474:	mov    ecx,DWORD PTR [ebp+0x1c]
  407477:	push   ebx
  407478:	push   esi
  407479:	push   edi
  40747a:	xor    edi,edi
  40747c:	test   ecx,ecx
  40747e:	jne    0x40748d
  407480:	mov    eax,DWORD PTR [ebp+0x8]
  407483:	mov    eax,DWORD PTR [eax]
  407485:	mov    eax,DWORD PTR [eax+0x4]
  407488:	mov    ecx,eax
  40748a:	mov    DWORD PTR [ebp+0x1c],eax
  40748d:	push   edi
  40748e:	xor    eax,eax
  407490:	cmp    DWORD PTR [ebp+0x20],eax
  407493:	push   edi
  407494:	push   DWORD PTR [ebp+0x14]
  407497:	setne  al
  40749a:	push   DWORD PTR [ebp+0x10]
  40749d:	lea    eax,[eax*8+0x1]
  4074a4:	push   eax
  4074a5:	push   ecx
  4074a6:	call   DWORD PTR ds:0x40d040
  4074ac:	mov    ebx,eax
  4074ae:	test   ebx,ebx
  4074b0:	jne    0x4074b9
  4074b2:	xor    eax,eax
  4074b4:	jmp    0x40754a
  4074b9:	jle    0x407506
  4074bb:	cmp    ebx,0x7ffffff0
  4074c1:	ja     0x407506
  4074c3:	lea    ecx,[ebx+ebx*1]
  4074c6:	lea    eax,[ecx+0x8]
  4074c9:	cmp    eax,ecx
  4074cb:	jbe    0x407506
  4074cd:	lea    eax,[ebx*2+0x8]
  4074d4:	cmp    eax,0x400
  4074d9:	ja     0x4074ee
  4074db:	call   0x4083a0
  4074e0:	mov    esi,esp
  4074e2:	test   esi,esi
  4074e4:	je     0x4074b2
  4074e6:	mov    DWORD PTR [esi],0xcccc
  4074ec:	jmp    0x407501
  4074ee:	push   eax
  4074ef:	call   0x40759e
  4074f4:	mov    esi,eax
  4074f6:	pop    ecx
  4074f7:	test   esi,esi
  4074f9:	je     0x4074b2
  4074fb:	mov    DWORD PTR [esi],0xdddd
  407501:	add    esi,0x8
  407504:	jmp    0x407508
  407506:	mov    esi,edi
  407508:	test   esi,esi
  40750a:	je     0x4074b2
  40750c:	lea    eax,[ebx+ebx*1]
  40750f:	push   eax
  407510:	push   edi
  407511:	push   esi
  407512:	call   0x403d60
  407517:	add    esp,0xc
  40751a:	push   ebx
  40751b:	push   esi
  40751c:	push   DWORD PTR [ebp+0x14]
  40751f:	push   DWORD PTR [ebp+0x10]
  407522:	push   0x1
  407524:	push   DWORD PTR [ebp+0x1c]
  407527:	call   DWORD PTR ds:0x40d040
  40752d:	test   eax,eax
  40752f:	je     0x407541
  407531:	push   DWORD PTR [ebp+0x18]
  407534:	push   eax
  407535:	push   esi
  407536:	push   DWORD PTR [ebp+0xc]
  407539:	call   DWORD PTR ds:0x40d0e4
  40753f:	mov    edi,eax
  407541:	push   esi
  407542:	call   0x407448
  407547:	pop    ecx
  407548:	mov    eax,edi
  40754a:	lea    esp,[ebp-0x10]
  40754d:	pop    edi
  40754e:	pop    esi
  40754f:	pop    ebx
  407550:	mov    ecx,DWORD PTR [ebp-0x4]
  407553:	xor    ecx,ebp
  407555:	call   0x40120d
  40755a:	mov    esp,ebp
  40755c:	pop    ebp
  40755d:	ret
  40755e:	push   ebp
  40755f:	mov    ebp,esp
  407561:	sub    esp,0x10
  407564:	push   DWORD PTR [ebp+0x8]
  407567:	lea    ecx,[ebp-0x10]
  40756a:	call   0x401840
  40756f:	push   DWORD PTR [ebp+0x20]
  407572:	lea    eax,[ebp-0x10]
  407575:	push   DWORD PTR [ebp+0x1c]
  407578:	push   DWORD PTR [ebp+0x18]
  40757b:	push   DWORD PTR [ebp+0x14]
  40757e:	push   DWORD PTR [ebp+0x10]
  407581:	push   DWORD PTR [ebp+0xc]
  407584:	push   eax
  407585:	call   0x407466
  40758a:	add    esp,0x1c
  40758d:	cmp    BYTE PTR [ebp-0x4],0x0
  407591:	je     0x40759a
  407593:	mov    ecx,DWORD PTR [ebp-0x8]
  407596:	and    DWORD PTR [ecx+0x70],0xfffffffd
  40759a:	mov    esp,ebp
  40759c:	pop    ebp
  40759d:	ret
  40759e:	push   ebp
  40759f:	mov    ebp,esp
  4075a1:	push   esi
  4075a2:	mov    esi,DWORD PTR [ebp+0x8]
  4075a5:	cmp    esi,0xffffffe0
  4075a8:	ja     0x407619
  4075aa:	push   ebx
  4075ab:	push   edi
  4075ac:	mov    eax,ds:0x413460
  4075b1:	test   eax,eax
  4075b3:	jne    0x4075d2
  4075b5:	call   0x403342
  4075ba:	push   0x1e
  4075bc:	call   0x40339f
  4075c1:	push   0xff
  4075c6:	call   0x402a9c
  4075cb:	mov    eax,ds:0x413460
  4075d0:	pop    ecx
  4075d1:	pop    ecx
  4075d2:	test   esi,esi
  4075d4:	je     0x4075da
  4075d6:	mov    ecx,esi
  4075d8:	jmp    0x4075dd
  4075da:	xor    ecx,ecx
  4075dc:	inc    ecx
  4075dd:	push   ecx
  4075de:	push   0x0
  4075e0:	push   eax
  4075e1:	call   DWORD PTR ds:0x40d0e8
  4075e7:	mov    edi,eax
  4075e9:	test   edi,edi
  4075eb:	jne    0x407613
  4075ed:	push   0xc
  4075ef:	pop    ebx
  4075f0:	cmp    DWORD PTR ds:0x413e74,eax
  4075f6:	je     0x407605
  4075f8:	push   esi
  4075f9:	call   0x405d71
  4075fe:	pop    ecx
  4075ff:	test   eax,eax
  407601:	jne    0x4075ac
  407603:	jmp    0x40760c
  407605:	call   0x402568
  40760a:	mov    DWORD PTR [eax],ebx
  40760c:	call   0x402568
  407611:	mov    DWORD PTR [eax],ebx
  407613:	mov    eax,edi
  407615:	pop    edi
  407616:	pop    ebx
  407617:	jmp    0x40762d
  407619:	push   esi
  40761a:	call   0x405d71
  40761f:	pop    ecx
  407620:	call   0x402568
  407625:	mov    DWORD PTR [eax],0xc
  40762b:	xor    eax,eax
  40762d:	pop    esi
  40762e:	pop    ebp
  40762f:	ret
  407630:	push   ebp
  407631:	mov    ebp,esp
  407633:	cmp    DWORD PTR [ebp+0x8],0x0
  407637:	jne    0x407644
  407639:	push   DWORD PTR [ebp+0xc]
  40763c:	call   0x40759e
  407641:	pop    ecx
  407642:	pop    ebp
  407643:	ret
  407644:	push   esi
  407645:	mov    esi,DWORD PTR [ebp+0xc]
  407648:	test   esi,esi
  40764a:	jne    0x407659
  40764c:	push   DWORD PTR [ebp+0x8]
  40764f:	call   0x40575f
  407654:	pop    ecx
  407655:	xor    eax,eax
  407657:	jmp    0x4076a6
  407659:	push   ebx
  40765a:	jmp    0x40768c
  40765c:	test   esi,esi
  40765e:	jne    0x407661
  407660:	inc    esi
  407661:	push   esi
  407662:	push   DWORD PTR [ebp+0x8]
  407665:	push   0x0
  407667:	push   DWORD PTR ds:0x413460
  40766d:	call   DWORD PTR ds:0x40d0ec
  407673:	mov    ebx,eax
  407675:	test   ebx,ebx
  407677:	jne    0x4076d7
  407679:	cmp    DWORD PTR ds:0x413e74,eax
  40767f:	je     0x4076c1
  407681:	push   esi
  407682:	call   0x405d71
  407687:	pop    ecx
  407688:	test   eax,eax
  40768a:	je     0x4076a9
  40768c:	cmp    esi,0xffffffe0
  40768f:	jbe    0x40765c
  407691:	push   esi
  407692:	call   0x405d71
  407697:	pop    ecx
  407698:	call   0x402568
  40769d:	mov    DWORD PTR [eax],0xc
  4076a3:	xor    eax,eax
  4076a5:	pop    ebx
  4076a6:	pop    esi
  4076a7:	pop    ebp
  4076a8:	ret
  4076a9:	call   0x402568
  4076ae:	mov    esi,eax
  4076b0:	call   DWORD PTR ds:0x40d028
  4076b6:	push   eax
  4076b7:	call   0x40257b
  4076bc:	pop    ecx
  4076bd:	mov    DWORD PTR [esi],eax
  4076bf:	jmp    0x4076a3
  4076c1:	call   0x402568
  4076c6:	mov    esi,eax
  4076c8:	call   DWORD PTR ds:0x40d028
  4076ce:	push   eax
  4076cf:	call   0x40257b
  4076d4:	pop    ecx
  4076d5:	mov    DWORD PTR [esi],eax
  4076d7:	mov    eax,ebx
  4076d9:	jmp    0x4076a5
  4076db:	push   ebp
  4076dc:	mov    ebp,esp
  4076de:	push   esi
  4076df:	mov    esi,DWORD PTR [ebp+0x8]
  4076e2:	test   esi,esi
  4076e4:	je     0x407701
  4076e6:	push   0xffffffe0
  4076e8:	xor    edx,edx
  4076ea:	pop    eax
  4076eb:	div    esi
  4076ed:	cmp    eax,DWORD PTR [ebp+0xc]
  4076f0:	jae    0x407701
  4076f2:	call   0x402568
  4076f7:	mov    DWORD PTR [eax],0xc
  4076fd:	xor    eax,eax
  4076ff:	jmp    0x407752
  407701:	imul   esi,DWORD PTR [ebp+0xc]
  407705:	test   esi,esi
  407707:	jne    0x40770a
  407709:	inc    esi
  40770a:	xor    ecx,ecx
  40770c:	cmp    esi,0xffffffe0
  40770f:	ja     0x407726
  407711:	push   esi
  407712:	push   0x8
  407714:	push   DWORD PTR ds:0x413460
  40771a:	call   DWORD PTR ds:0x40d0e8
  407720:	mov    ecx,eax
  407722:	test   ecx,ecx
  407724:	jne    0x407750
  407726:	cmp    DWORD PTR ds:0x413e74,0x0
  40772d:	je     0x407743
  40772f:	push   esi
  407730:	call   0x405d71
  407735:	pop    ecx
  407736:	test   eax,eax
  407738:	jne    0x40770a
  40773a:	mov    eax,DWORD PTR [ebp+0x10]
  40773d:	test   eax,eax
  40773f:	je     0x4076fd
  407741:	jmp    0x4076f7
  407743:	mov    eax,DWORD PTR [ebp+0x10]
  407746:	test   eax,eax
  407748:	je     0x407750
  40774a:	mov    DWORD PTR [eax],0xc
  407750:	mov    eax,ecx
  407752:	pop    esi
  407753:	pop    ebp
  407754:	ret
  407755:	push   0x2
  407757:	call   0x402ab2
  40775c:	pop    ecx
  40775d:	ret
  40775e:	call   0x405db1
  407763:	test   eax,eax
  407765:	je     0x40776f
  407767:	push   0x16
  407769:	call   0x405dda
  40776e:	pop    ecx
  40776f:	test   BYTE PTR ds:0x412d64,0x2
  407776:	je     0x407799
  407778:	push   0x17
  40777a:	call   0x40c208
  40777f:	test   eax,eax
  407781:	je     0x407788
  407783:	push   0x7
  407785:	pop    ecx
  407786:	int    0x29
  407788:	push   0x1
  40778a:	push   0x40000015
  40778f:	push   0x3
  407791:	call   0x401559
  407796:	add    esp,0xc
  407799:	push   0x3
  40779b:	call   0x402b70
  4077a0:	int3
  4077a1:	push   ebp
  4077a2:	mov    ebp,esp
  4077a4:	cmp    DWORD PTR [ebp+0x8],0x0
  4077a8:	jne    0x4077bf
  4077aa:	call   0x402568
  4077af:	mov    DWORD PTR [eax],0x16
  4077b5:	call   0x4016b6
  4077ba:	or     eax,0xffffffff
  4077bd:	pop    ebp
  4077be:	ret
  4077bf:	push   DWORD PTR [ebp+0x8]
  4077c2:	push   0x0
  4077c4:	push   DWORD PTR ds:0x413460
  4077ca:	call   DWORD PTR ds:0x40d0f0
  4077d0:	pop    ebp
  4077d1:	ret
  4077d2:	push   ebp
  4077d3:	mov    ebp,esp
  4077d5:	push   ebx
  4077d6:	push   esi
  4077d7:	push   edi
  4077d8:	xor    edi,edi
  4077da:	mov    ebx,0xe3
  4077df:	lea    eax,[ebx+edi*1]
  4077e2:	cdq
  4077e3:	sub    eax,edx
  4077e5:	mov    esi,eax
  4077e7:	sar    esi,1
  4077e9:	push   0x55
  4077eb:	push   DWORD PTR [esi*8+0x40f398]
  4077f2:	push   DWORD PTR [ebp+0x8]
  4077f5:	call   0x407896
  4077fa:	add    esp,0xc
  4077fd:	test   eax,eax
  4077ff:	je     0x407814
  407801:	jns    0x407808
  407803:	lea    ebx,[esi-0x1]
  407806:	jmp    0x40780b
  407808:	lea    edi,[esi+0x1]
  40780b:	cmp    edi,ebx
  40780d:	jle    0x4077df
  40780f:	or     eax,0xffffffff
  407812:	jmp    0x40781b
  407814:	mov    eax,DWORD PTR [esi*8+0x40f39c]
  40781b:	pop    edi
  40781c:	pop    esi
  40781d:	pop    ebx
  40781e:	pop    ebp
  40781f:	ret
  407820:	push   ebp
  407821:	mov    ebp,esp
  407823:	cmp    DWORD PTR [ebp+0x8],0x0
  407827:	je     0x407846
  407829:	push   DWORD PTR [ebp+0x8]
  40782c:	call   0x4077d2
  407831:	pop    ecx
  407832:	test   eax,eax
  407834:	js     0x407846
  407836:	cmp    eax,0xe4
  40783b:	jae    0x407846
  40783d:	mov    eax,DWORD PTR [eax*8+0x40ec78]
  407844:	pop    ebp
  407845:	ret
  407846:	xor    eax,eax
  407848:	pop    ebp
  407849:	ret
  40784a:	push   ebp
  40784b:	mov    ebp,esp
  40784d:	mov    eax,ds:0x414f30
  407852:	xor    eax,DWORD PTR ds:0x412000
  407858:	je     0x407875
  40785a:	xor    ecx,ecx
  40785c:	push   ecx
  40785d:	push   ecx
  40785e:	push   ecx
  40785f:	push   DWORD PTR [ebp+0x1c]
  407862:	push   DWORD PTR [ebp+0x18]
  407865:	push   DWORD PTR [ebp+0x14]
  407868:	push   DWORD PTR [ebp+0x10]
  40786b:	push   DWORD PTR [ebp+0xc]
  40786e:	push   DWORD PTR [ebp+0x8]
  407871:	call   eax
  407873:	pop    ebp
  407874:	ret
  407875:	push   DWORD PTR [ebp+0x1c]
  407878:	push   DWORD PTR [ebp+0x18]
  40787b:	push   DWORD PTR [ebp+0x14]
  40787e:	push   DWORD PTR [ebp+0x10]
  407881:	push   DWORD PTR [ebp+0xc]
  407884:	push   DWORD PTR [ebp+0x8]
  407887:	call   0x407820
  40788c:	pop    ecx
  40788d:	push   eax
  40788e:	call   DWORD PTR ds:0x40d010
  407894:	pop    ebp
  407895:	ret
  407896:	push   ebp
  407897:	mov    ebp,esp
  407899:	push   esi
  40789a:	mov    esi,DWORD PTR [ebp+0x10]
  40789d:	xor    eax,eax
  40789f:	test   esi,esi
  4078a1:	je     0x407901
  4078a3:	mov    ecx,DWORD PTR [ebp+0xc]
  4078a6:	push   ebx
  4078a7:	push   edi
  4078a8:	mov    edi,DWORD PTR [ebp+0x8]
  4078ab:	push   0x41
  4078ad:	pop    ebx
  4078ae:	push   0x5a
  4078b0:	pop    edx
  4078b1:	sub    edi,ecx
  4078b3:	mov    DWORD PTR [ebp+0x10],edx
  4078b6:	jmp    0x4078bb
  4078b8:	push   0x5a
  4078ba:	pop    edx
  4078bb:	movzx  eax,WORD PTR [edi+ecx*1]
  4078bf:	cmp    ax,bx
  4078c2:	jb     0x4078d1
  4078c4:	cmp    ax,dx
  4078c7:	ja     0x4078d1
  4078c9:	add    eax,0x20
  4078cc:	movzx  edx,ax
  4078cf:	jmp    0x4078d3
  4078d1:	mov    edx,eax
  4078d3:	movzx  eax,WORD PTR [ecx]
  4078d6:	cmp    ax,bx
  4078d9:	jb     0x4078e7
  4078db:	cmp    ax,WORD PTR [ebp+0x10]
  4078df:	ja     0x4078e7
  4078e1:	add    eax,0x20
  4078e4:	movzx  eax,ax
  4078e7:	add    ecx,0x2
  4078ea:	dec    esi
  4078eb:	je     0x4078f7
  4078ed:	test   dx,dx
  4078f0:	je     0x4078f7
  4078f2:	cmp    dx,ax
  4078f5:	je     0x4078b8
  4078f7:	movzx  ecx,ax
  4078fa:	movzx  eax,dx
  4078fd:	pop    edi
  4078fe:	sub    eax,ecx
  407900:	pop    ebx
  407901:	pop    esi
  407902:	pop    ebp
  407903:	ret
  407904:	int3
  407905:	int3
  407906:	int3
  407907:	int3
  407908:	int3
  407909:	int3
  40790a:	int3
  40790b:	int3
  40790c:	int3
  40790d:	int3
  40790e:	int3
  40790f:	int3
  407910:	push   edi
  407911:	push   esi
  407912:	mov    esi,DWORD PTR [esp+0x10]
  407916:	mov    ecx,DWORD PTR [esp+0x14]
  40791a:	mov    edi,DWORD PTR [esp+0xc]
  40791e:	mov    eax,ecx
  407920:	mov    edx,ecx
  407922:	add    eax,esi
  407924:	cmp    edi,esi
  407926:	jbe    0x407930
  407928:	cmp    edi,eax
  40792a:	jb     0x407c98
  407930:	bt     DWORD PTR ds:0x413e60,0x1
  407938:	jae    0x407941
  40793a:	rep movs BYTE PTR es:[edi],BYTE PTR ds:[esi]
  40793c:	jmp    0x407c58
  407941:	cmp    ecx,0x80
  407947:	jb     0x407b1b
  40794d:	mov    eax,edi
  40794f:	xor    eax,esi
  407951:	test   eax,0xf
  407956:	jne    0x407966
  407958:	bt     DWORD PTR ds:0x412cf0,0x1
  407960:	jb     0x407e40
  407966:	bt     DWORD PTR ds:0x413e60,0x0
  40796e:	jae    0x407b1b
  407974:	test   edi,0x3
  40797a:	jne    0x407b38
  407980:	test   esi,0x3
  407986:	jne    0x407b23
  40798c:	bt     edi,0x2
  407990:	jae    0x40799f
  407992:	mov    eax,DWORD PTR [esi]
  407994:	sub    ecx,0x4
  407997:	lea    esi,[esi+0x4]
  40799a:	mov    DWORD PTR [edi],eax
  40799c:	lea    edi,[edi+0x4]
  40799f:	bt     edi,0x3
  4079a3:	jae    0x4079b6
  4079a5:	movq   xmm1,QWORD PTR [esi]
  4079a9:	sub    ecx,0x8
  4079ac:	lea    esi,[esi+0x8]
  4079af:	movq   QWORD PTR [edi],xmm1
  4079b3:	lea    edi,[edi+0x8]
  4079b6:	test   esi,0x7
  4079bc:	je     0x407a21
  4079be:	bt     esi,0x3
  4079c2:	jae    0x407a7a
  4079c8:	movdqa xmm1,XMMWORD PTR [esi-0xc]
  4079cd:	lea    esi,[esi-0xc]
  4079d0:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  4079d5:	sub    ecx,0x30
  4079d8:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  4079dd:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  4079e2:	lea    esi,[esi+0x30]
  4079e5:	cmp    ecx,0x30
  4079e8:	movdqa xmm2,xmm3
  4079ec:	palignr xmm3,xmm1,0xc
  4079f2:	movdqa XMMWORD PTR [edi],xmm3
  4079f6:	movdqa xmm4,xmm0
  4079fa:	palignr xmm0,xmm2,0xc
  407a00:	movdqa XMMWORD PTR [edi+0x10],xmm0
  407a05:	movdqa xmm1,xmm5
  407a09:	palignr xmm5,xmm4,0xc
  407a0f:	movdqa XMMWORD PTR [edi+0x20],xmm5
  407a14:	lea    edi,[edi+0x30]
  407a17:	jge    0x4079d0
  407a19:	lea    esi,[esi+0xc]
  407a1c:	jmp    0x407ad0
  407a21:	movdqa xmm1,XMMWORD PTR [esi-0x8]
  407a26:	lea    esi,[esi-0x8]
  407a29:	lea    ecx,[ecx+0x0]
  407a2c:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  407a31:	sub    ecx,0x30
  407a34:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  407a39:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  407a3e:	lea    esi,[esi+0x30]
  407a41:	cmp    ecx,0x30
  407a44:	movdqa xmm2,xmm3
  407a48:	palignr xmm3,xmm1,0x8
  407a4e:	movdqa XMMWORD PTR [edi],xmm3
  407a52:	movdqa xmm4,xmm0
  407a56:	palignr xmm0,xmm2,0x8
  407a5c:	movdqa XMMWORD PTR [edi+0x10],xmm0
  407a61:	movdqa xmm1,xmm5
  407a65:	palignr xmm5,xmm4,0x8
  407a6b:	movdqa XMMWORD PTR [edi+0x20],xmm5
  407a70:	lea    edi,[edi+0x30]
  407a73:	jge    0x407a2c
  407a75:	lea    esi,[esi+0x8]
  407a78:	jmp    0x407ad0
  407a7a:	movdqa xmm1,XMMWORD PTR [esi-0x4]
  407a7f:	lea    esi,[esi-0x4]
  407a82:	mov    edi,edi
  407a84:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  407a89:	sub    ecx,0x30
  407a8c:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  407a91:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  407a96:	lea    esi,[esi+0x30]
  407a99:	cmp    ecx,0x30
  407a9c:	movdqa xmm2,xmm3
  407aa0:	palignr xmm3,xmm1,0x4
  407aa6:	movdqa XMMWORD PTR [edi],xmm3
  407aaa:	movdqa xmm4,xmm0
  407aae:	palignr xmm0,xmm2,0x4
  407ab4:	movdqa XMMWORD PTR [edi+0x10],xmm0
  407ab9:	movdqa xmm1,xmm5
  407abd:	palignr xmm5,xmm4,0x4
  407ac3:	movdqa XMMWORD PTR [edi+0x20],xmm5
  407ac8:	lea    edi,[edi+0x30]
  407acb:	jge    0x407a84
  407acd:	lea    esi,[esi+0x4]
  407ad0:	cmp    ecx,0x10
  407ad3:	jl     0x407ae8
  407ad5:	movdqu xmm1,XMMWORD PTR [esi]
  407ad9:	sub    ecx,0x10
  407adc:	lea    esi,[esi+0x10]
  407adf:	movdqa XMMWORD PTR [edi],xmm1
  407ae3:	lea    edi,[edi+0x10]
  407ae6:	jmp    0x407ad0
  407ae8:	bt     ecx,0x2
  407aec:	jae    0x407afb
  407aee:	mov    eax,DWORD PTR [esi]
  407af0:	sub    ecx,0x4
  407af3:	lea    esi,[esi+0x4]
  407af6:	mov    DWORD PTR [edi],eax
  407af8:	lea    edi,[edi+0x4]
  407afb:	bt     ecx,0x3
  407aff:	jae    0x407b12
  407b01:	movq   xmm1,QWORD PTR [esi]
  407b05:	sub    ecx,0x8
  407b08:	lea    esi,[esi+0x8]
  407b0b:	movq   QWORD PTR [edi],xmm1
  407b0f:	lea    edi,[edi+0x8]
  407b12:	mov    eax,DWORD PTR [ecx*4+0x407c48]
  407b19:	jmp    eax
  407b1b:	test   edi,0x3
  407b21:	jne    0x407b38
  407b23:	shr    ecx,0x2
  407b26:	and    edx,0x3
  407b29:	cmp    ecx,0x8
  407b2c:	jb     0x407b58
  407b2e:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407b30:	jmp    DWORD PTR [edx*4+0x407c48]
  407b37:	nop
  407b38:	mov    eax,edi
  407b3a:	mov    edx,0x3
  407b3f:	sub    ecx,0x4
  407b42:	jb     0x407b50
  407b44:	and    eax,0x3
  407b47:	add    ecx,eax
  407b49:	jmp    DWORD PTR [eax*4+0x407b5c]
  407b50:	jmp    DWORD PTR [ecx*4+0x407c58]
  407b57:	nop
  407b58:	jmp    DWORD PTR [ecx*4+0x407bdc]
  407b5f:	nop
  407b60:	ins    BYTE PTR es:[edi],dx
  407b61:	jnp    0x407ba3
  407b63:	add    BYTE PTR [eax-0x43ffbf85],bl
  407b69:	jnp    0x407bab
  407b6b:	add    BYTE PTR [ebx],ah
  407b6d:	ror    DWORD PTR [edx-0x75f877fa],1
  407b73:	inc    esi
  407b74:	add    DWORD PTR [eax+0x468a0147],ecx
  407b7a:	add    al,cl
  407b7c:	jmp    0x2880383
  407b81:	add    esi,0x3
  407b84:	add    edi,0x3
  407b87:	cmp    ecx,0x8
  407b8a:	jb     0x407b58
  407b8c:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407b8e:	jmp    DWORD PTR [edx*4+0x407c48]
  407b95:	lea    ecx,[ecx+0x0]
  407b98:	and    edx,ecx
  407b9a:	mov    al,BYTE PTR [esi]
  407b9c:	mov    BYTE PTR [edi],al
  407b9e:	mov    al,BYTE PTR [esi+0x1]
  407ba1:	shr    ecx,0x2
  407ba4:	mov    BYTE PTR [edi+0x1],al
  407ba7:	add    esi,0x2
  407baa:	add    edi,0x2
  407bad:	cmp    ecx,0x8
  407bb0:	jb     0x407b58
  407bb2:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407bb4:	jmp    DWORD PTR [edx*4+0x407c48]
  407bbb:	nop
  407bbc:	and    edx,ecx
  407bbe:	mov    al,BYTE PTR [esi]
  407bc0:	mov    BYTE PTR [edi],al
  407bc2:	add    esi,0x1
  407bc5:	shr    ecx,0x2
  407bc8:	add    edi,0x1
  407bcb:	cmp    ecx,0x8
  407bce:	jb     0x407b58
  407bd0:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407bd2:	jmp    DWORD PTR [edx*4+0x407c48]
  407bd9:	lea    ecx,[ecx+0x0]
  407bdc:	aas
  407bdd:	jl     0x407c1f
  407bdf:	add    BYTE PTR [esp+edi*2],ch
  407be2:	inc    eax
  407be3:	add    BYTE PTR [esp+edi*2],ah
  407be6:	inc    eax
  407be7:	add    BYTE PTR [esp+edi*2],bl
  407bea:	inc    eax
  407beb:	add    BYTE PTR [esp+edi*2],dl
  407bee:	inc    eax
  407bef:	add    BYTE PTR [esp+edi*2],cl
  407bf2:	inc    eax
  407bf3:	add    BYTE PTR [esp+edi*2],al
  407bf6:	inc    eax
  407bf7:	add    ah,bh
  407bf9:	jnp    0x407c3b
  407bfb:	add    BYTE PTR [ebx-0x761b71bc],cl
  407c01:	inc    esp
  407c02:	(bad)
  407c03:	in     al,0x8b
  407c05:	inc    esp
  407c06:	mov    gs,eax
  407c08:	mov    DWORD PTR [edi+ecx*4-0x18],eax
  407c0c:	mov    eax,DWORD PTR [esi+ecx*4-0x14]
  407c10:	mov    DWORD PTR [edi+ecx*4-0x14],eax
  407c14:	mov    eax,DWORD PTR [esi+ecx*4-0x10]
  407c18:	mov    DWORD PTR [edi+ecx*4-0x10],eax
  407c1c:	mov    eax,DWORD PTR [esi+ecx*4-0xc]
  407c20:	mov    DWORD PTR [edi+ecx*4-0xc],eax
  407c24:	mov    eax,DWORD PTR [esi+ecx*4-0x8]
  407c28:	mov    DWORD PTR [edi+ecx*4-0x8],eax
  407c2c:	mov    eax,DWORD PTR [esi+ecx*4-0x4]
  407c30:	mov    DWORD PTR [edi+ecx*4-0x4],eax
  407c34:	lea    eax,[ecx*4+0x0]
  407c3b:	add    esi,eax
  407c3d:	add    edi,eax
  407c3f:	jmp    DWORD PTR [edx*4+0x407c48]
  407c46:	mov    edi,edi
  407c48:	pop    eax
  407c49:	jl     0x407c8b
  407c4b:	add    BYTE PTR [eax+0x7c],ah
  407c4e:	inc    eax
  407c4f:	add    BYTE PTR [esp+edi*2+0x40],ch
  407c53:	add    BYTE PTR [eax-0x74ffbf84],al
  407c59:	inc    esp
  407c5a:	and    al,0xc
  407c5c:	pop    esi
  407c5d:	pop    edi
  407c5e:	ret
  407c5f:	nop
  407c60:	mov    al,BYTE PTR [esi]
  407c62:	mov    BYTE PTR [edi],al
  407c64:	mov    eax,DWORD PTR [esp+0xc]
  407c68:	pop    esi
  407c69:	pop    edi
  407c6a:	ret
  407c6b:	nop
  407c6c:	mov    al,BYTE PTR [esi]
  407c6e:	mov    BYTE PTR [edi],al
  407c70:	mov    al,BYTE PTR [esi+0x1]
  407c73:	mov    BYTE PTR [edi+0x1],al
  407c76:	mov    eax,DWORD PTR [esp+0xc]
  407c7a:	pop    esi
  407c7b:	pop    edi
  407c7c:	ret
  407c7d:	lea    ecx,[ecx+0x0]
  407c80:	mov    al,BYTE PTR [esi]
  407c82:	mov    BYTE PTR [edi],al
  407c84:	mov    al,BYTE PTR [esi+0x1]
  407c87:	mov    BYTE PTR [edi+0x1],al
  407c8a:	mov    al,BYTE PTR [esi+0x2]
  407c8d:	mov    BYTE PTR [edi+0x2],al
  407c90:	mov    eax,DWORD PTR [esp+0xc]
  407c94:	pop    esi
  407c95:	pop    edi
  407c96:	ret
  407c97:	nop
  407c98:	lea    esi,[ecx+esi*1-0x4]
  407c9c:	lea    edi,[ecx+edi*1-0x4]
  407ca0:	test   edi,0x3
  407ca6:	jne    0x407ccc
  407ca8:	shr    ecx,0x2
  407cab:	and    edx,0x3
  407cae:	cmp    ecx,0x8
  407cb1:	jb     0x407cc0
  407cb3:	std
  407cb4:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407cb6:	cld
  407cb7:	jmp    DWORD PTR [edx*4+0x407de4]
  407cbe:	mov    edi,edi
  407cc0:	neg    ecx
  407cc2:	jmp    DWORD PTR [ecx*4+0x407d94]
  407cc9:	lea    ecx,[ecx+0x0]
  407ccc:	mov    eax,edi
  407cce:	mov    edx,0x3
  407cd3:	cmp    ecx,0x4
  407cd6:	jb     0x407ce4
  407cd8:	and    eax,0x3
  407cdb:	sub    ecx,eax
  407cdd:	jmp    DWORD PTR [eax*4+0x407ce8]
  407ce4:	jmp    DWORD PTR [ecx*4+0x407de4]
  407ceb:	nop
  407cec:	clc
  407ced:	jl     0x407d2f
  407cef:	add    BYTE PTR [edi*2+0x7d440040],bl
  407cf6:	inc    eax
  407cf7:	add    BYTE PTR [edx-0x2edcfcba],cl
  407cfd:	mov    BYTE PTR [edi+0x3],al
  407d00:	sub    esi,0x1
  407d03:	shr    ecx,0x2
  407d06:	sub    edi,0x1
  407d09:	cmp    ecx,0x8
  407d0c:	jb     0x407cc0
  407d0e:	std
  407d0f:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407d11:	cld
  407d12:	jmp    DWORD PTR [edx*4+0x407de4]
  407d19:	lea    ecx,[ecx+0x0]
  407d1c:	mov    al,BYTE PTR [esi+0x3]
  407d1f:	and    edx,ecx
  407d21:	mov    BYTE PTR [edi+0x3],al
  407d24:	mov    al,BYTE PTR [esi+0x2]
  407d27:	shr    ecx,0x2
  407d2a:	mov    BYTE PTR [edi+0x2],al
  407d2d:	sub    esi,0x2
  407d30:	sub    edi,0x2
  407d33:	cmp    ecx,0x8
  407d36:	jb     0x407cc0
  407d38:	std
  407d39:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407d3b:	cld
  407d3c:	jmp    DWORD PTR [edx*4+0x407de4]
  407d43:	nop
  407d44:	mov    al,BYTE PTR [esi+0x3]
  407d47:	and    edx,ecx
  407d49:	mov    BYTE PTR [edi+0x3],al
  407d4c:	mov    al,BYTE PTR [esi+0x2]
  407d4f:	mov    BYTE PTR [edi+0x2],al
  407d52:	mov    al,BYTE PTR [esi+0x1]
  407d55:	shr    ecx,0x2
  407d58:	mov    BYTE PTR [edi+0x1],al
  407d5b:	sub    esi,0x3
  407d5e:	sub    edi,0x3
  407d61:	cmp    ecx,0x8
  407d64:	jb     0x407cc0
  407d6a:	std
  407d6b:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  407d6d:	cld
  407d6e:	jmp    DWORD PTR [edx*4+0x407de4]
  407d75:	lea    ecx,[ecx+0x0]
  407d78:	cwde
  407d79:	jge    0x407dbb
  407d7b:	add    BYTE PTR [eax-0x57ffbf83],ah
  407d81:	jge    0x407dc3
  407d83:	add    BYTE PTR [eax-0x47ffbf83],dh
  407d89:	jge    0x407dcb
  407d8b:	add    al,al
  407d8d:	jge    0x407dcf
  407d8f:	add    al,cl
  407d91:	jge    0x407dd3
  407d93:	add    bl,bl
  407d95:	jge    0x407dd7
  407d97:	add    BYTE PTR [ebx-0x76e371bc],cl
  407d9d:	inc    esp
  407d9e:	(bad)
  407d9f:	sbb    al,0x8b
  407da1:	inc    esp
  407da2:	mov    ds,WORD PTR [eax]
  407da4:	mov    DWORD PTR [edi+ecx*4+0x18],eax
  407da8:	mov    eax,DWORD PTR [esi+ecx*4+0x14]
  407dac:	mov    DWORD PTR [edi+ecx*4+0x14],eax
  407db0:	mov    eax,DWORD PTR [esi+ecx*4+0x10]
  407db4:	mov    DWORD PTR [edi+ecx*4+0x10],eax
  407db8:	mov    eax,DWORD PTR [esi+ecx*4+0xc]
  407dbc:	mov    DWORD PTR [edi+ecx*4+0xc],eax
  407dc0:	mov    eax,DWORD PTR [esi+ecx*4+0x8]
  407dc4:	mov    DWORD PTR [edi+ecx*4+0x8],eax
  407dc8:	mov    eax,DWORD PTR [esi+ecx*4+0x4]
  407dcc:	mov    DWORD PTR [edi+ecx*4+0x4],eax
  407dd0:	lea    eax,[ecx*4+0x0]
  407dd7:	add    esi,eax
  407dd9:	add    edi,eax
  407ddb:	jmp    DWORD PTR [edx*4+0x407de4]
  407de2:	mov    edi,edi
  407de4:	hlt
  407de5:	jge    0x407e27
  407de7:	add    ah,bh
  407de9:	jge    0x407e2b
  407deb:	add    BYTE PTR [esi+edi*2],cl
  407dee:	inc    eax
  407def:	add    BYTE PTR [eax],ah
  407df1:	jle    0x407e33
  407df3:	add    BYTE PTR [ebx+0x5e0c2444],cl
  407df9:	pop    edi
  407dfa:	ret
  407dfb:	nop
  407dfc:	mov    al,BYTE PTR [esi+0x3]
  407dff:	mov    BYTE PTR [edi+0x3],al
  407e02:	mov    eax,DWORD PTR [esp+0xc]
  407e06:	pop    esi
  407e07:	pop    edi
  407e08:	ret
  407e09:	lea    ecx,[ecx+0x0]
  407e0c:	mov    al,BYTE PTR [esi+0x3]
  407e0f:	mov    BYTE PTR [edi+0x3],al
  407e12:	mov    al,BYTE PTR [esi+0x2]
  407e15:	mov    BYTE PTR [edi+0x2],al
  407e18:	mov    eax,DWORD PTR [esp+0xc]
  407e1c:	pop    esi
  407e1d:	pop    edi
  407e1e:	ret
  407e1f:	nop
  407e20:	mov    al,BYTE PTR [esi+0x3]
  407e23:	mov    BYTE PTR [edi+0x3],al
  407e26:	mov    al,BYTE PTR [esi+0x2]
  407e29:	mov    BYTE PTR [edi+0x2],al
  407e2c:	mov    al,BYTE PTR [esi+0x1]
  407e2f:	mov    BYTE PTR [edi+0x1],al
  407e32:	mov    eax,DWORD PTR [esp+0xc]
  407e36:	pop    esi
  407e37:	pop    edi
  407e38:	ret
  407e39:	lea    esp,[esp+0x0]
  407e40:	push   edi
  407e41:	mov    eax,esi
  407e43:	and    eax,0xf
  407e46:	test   eax,eax
  407e48:	jne    0x407f20
  407e4e:	mov    edx,ecx
  407e50:	and    ecx,0x7f
  407e53:	shr    edx,0x7
  407e56:	je     0x407ebd
  407e58:	lea    esp,[esp+0x0]
  407e5f:	nop
  407e60:	movdqa xmm0,XMMWORD PTR [esi]
  407e64:	movdqa xmm1,XMMWORD PTR [esi+0x10]
  407e69:	movdqa xmm2,XMMWORD PTR [esi+0x20]
  407e6e:	movdqa xmm3,XMMWORD PTR [esi+0x30]
  407e73:	movdqa XMMWORD PTR [edi],xmm0
  407e77:	movdqa XMMWORD PTR [edi+0x10],xmm1
  407e7c:	movdqa XMMWORD PTR [edi+0x20],xmm2
  407e81:	movdqa XMMWORD PTR [edi+0x30],xmm3
  407e86:	movdqa xmm4,XMMWORD PTR [esi+0x40]
  407e8b:	movdqa xmm5,XMMWORD PTR [esi+0x50]
  407e90:	movdqa xmm6,XMMWORD PTR [esi+0x60]
  407e95:	movdqa xmm7,XMMWORD PTR [esi+0x70]
  407e9a:	movdqa XMMWORD PTR [edi+0x40],xmm4
  407e9f:	movdqa XMMWORD PTR [edi+0x50],xmm5
  407ea4:	movdqa XMMWORD PTR [edi+0x60],xmm6
  407ea9:	movdqa XMMWORD PTR [edi+0x70],xmm7
  407eae:	lea    esi,[esi+0x80]
  407eb4:	lea    edi,[edi+0x80]
  407eba:	dec    edx
  407ebb:	jne    0x407e60
  407ebd:	test   ecx,ecx
  407ebf:	je     0x407f10
  407ec1:	mov    edx,ecx
  407ec3:	shr    edx,0x4
  407ec6:	test   edx,edx
  407ec8:	je     0x407ee1
  407eca:	lea    ebx,[ebx+0x0]
  407ed0:	movdqa xmm0,XMMWORD PTR [esi]
  407ed4:	movdqa XMMWORD PTR [edi],xmm0
  407ed8:	lea    esi,[esi+0x10]
  407edb:	lea    edi,[edi+0x10]
  407ede:	dec    edx
  407edf:	jne    0x407ed0
  407ee1:	and    ecx,0xf
  407ee4:	je     0x407f10
  407ee6:	mov    eax,ecx
  407ee8:	shr    ecx,0x2
  407eeb:	je     0x407efa
  407eed:	mov    edx,DWORD PTR [esi]
  407eef:	mov    DWORD PTR [edi],edx
  407ef1:	lea    esi,[esi+0x4]
  407ef4:	lea    edi,[edi+0x4]
  407ef7:	dec    ecx
  407ef8:	jne    0x407eed
  407efa:	mov    ecx,eax
  407efc:	and    ecx,0x3
  407eff:	je     0x407f10
  407f01:	mov    al,BYTE PTR [esi]
  407f03:	mov    BYTE PTR [edi],al
  407f05:	inc    esi
  407f06:	inc    edi
  407f07:	dec    ecx
  407f08:	jne    0x407f01
  407f0a:	lea    ebx,[ebx+0x0]
  407f10:	pop    eax
  407f11:	pop    esi
  407f12:	pop    edi
  407f13:	ret
  407f14:	lea    esp,[esp+0x0]
  407f1b:	jmp    0x407f20
  407f1d:	int3
  407f1e:	int3
  407f1f:	int3
  407f20:	mov    edx,0x10
  407f25:	sub    edx,eax
  407f27:	sub    ecx,edx
  407f29:	push   ecx
  407f2a:	mov    eax,edx
  407f2c:	mov    ecx,eax
  407f2e:	and    ecx,0x3
  407f31:	je     0x407f3c
  407f33:	mov    dl,BYTE PTR [esi]
  407f35:	mov    BYTE PTR [edi],dl
  407f37:	inc    esi
  407f38:	inc    edi
  407f39:	dec    ecx
  407f3a:	jne    0x407f33
  407f3c:	shr    eax,0x2
  407f3f:	je     0x407f4e
  407f41:	mov    edx,DWORD PTR [esi]
  407f43:	mov    DWORD PTR [edi],edx
  407f45:	lea    esi,[esi+0x4]
  407f48:	lea    edi,[edi+0x4]
  407f4b:	dec    eax
  407f4c:	jne    0x407f41
  407f4e:	pop    ecx
  407f4f:	jmp    0x407e4e
  407f54:	int3
  407f55:	int3
  407f56:	int3
  407f57:	int3
  407f58:	int3
  407f59:	int3
  407f5a:	int3
  407f5b:	int3
  407f5c:	int3
  407f5d:	int3
  407f5e:	int3
  407f5f:	int3
  407f60:	push   ebp
  407f61:	mov    ebp,esp
  407f63:	push   ebx
  407f64:	push   esi
  407f65:	push   edi
  407f66:	push   ebp
  407f67:	push   0x0
  407f69:	push   0x0
  407f6b:	push   0x407f78
  407f70:	push   DWORD PTR [ebp+0x8]
  407f73:	call   0x40c20e
  407f78:	pop    ebp
  407f79:	pop    edi
  407f7a:	pop    esi
  407f7b:	pop    ebx
  407f7c:	mov    esp,ebp
  407f7e:	pop    ebp
  407f7f:	ret
  407f80:	mov    ecx,DWORD PTR [esp+0x4]
  407f84:	test   DWORD PTR [ecx+0x4],0x6
  407f8b:	mov    eax,0x1
  407f90:	je     0x407fc4
  407f92:	mov    eax,DWORD PTR [esp+0x14]
  407f96:	mov    ecx,DWORD PTR [eax-0x4]
  407f99:	xor    ecx,eax
  407f9b:	call   0x40120d
  407fa0:	push   ebp
  407fa1:	mov    ebp,DWORD PTR [eax+0x10]
  407fa4:	mov    edx,DWORD PTR [eax+0x28]
  407fa7:	push   edx
  407fa8:	mov    edx,DWORD PTR [eax+0x24]
  407fab:	push   edx
  407fac:	call   0x407fc5
  407fb1:	add    esp,0x8
  407fb4:	pop    ebp
  407fb5:	mov    eax,DWORD PTR [esp+0x8]
  407fb9:	mov    edx,DWORD PTR [esp+0x10]
  407fbd:	mov    DWORD PTR [edx],eax
  407fbf:	mov    eax,0x3
  407fc4:	ret
  407fc5:	push   ebx
  407fc6:	push   esi
  407fc7:	push   edi
  407fc8:	mov    eax,DWORD PTR [esp+0x10]
  407fcc:	push   ebp
  407fcd:	push   eax
  407fce:	push   0xfffffffe
  407fd0:	push   0x407f80
  407fd5:	push   DWORD PTR fs:0x0
  407fdc:	mov    eax,ds:0x412000
  407fe1:	xor    eax,esp
  407fe3:	push   eax
  407fe4:	lea    eax,[esp+0x4]
  407fe8:	mov    fs:0x0,eax
  407fee:	mov    eax,DWORD PTR [esp+0x28]
  407ff2:	mov    ebx,DWORD PTR [eax+0x8]
  407ff5:	mov    esi,DWORD PTR [eax+0xc]
  407ff8:	cmp    esi,0xffffffff
  407ffb:	je     0x408037
  407ffd:	cmp    DWORD PTR [esp+0x2c],0xffffffff
  408002:	je     0x40800a
  408004:	cmp    esi,DWORD PTR [esp+0x2c]
  408008:	jbe    0x408037
  40800a:	lea    esi,[esi+esi*2]
  40800d:	mov    ecx,DWORD PTR [ebx+esi*4]
  408010:	mov    DWORD PTR [esp+0xc],ecx
  408014:	mov    DWORD PTR [eax+0xc],ecx
  408017:	cmp    DWORD PTR [ebx+esi*4+0x4],0x0
  40801c:	jne    0x408035
  40801e:	push   0x101
  408023:	mov    eax,DWORD PTR [ebx+esi*4+0x8]
  408027:	call   0x408075
  40802c:	mov    eax,DWORD PTR [ebx+esi*4+0x8]
  408030:	call   0x408094
  408035:	jmp    0x407fee
  408037:	mov    ecx,DWORD PTR [esp+0x4]
  40803b:	mov    DWORD PTR fs:0x0,ecx
  408042:	add    esp,0x18
  408045:	pop    edi
  408046:	pop    esi
  408047:	pop    ebx
  408048:	ret
  408049:	xor    eax,eax
  40804b:	mov    ecx,DWORD PTR fs:0x0
  408052:	cmp    DWORD PTR [ecx+0x4],0x407f80
  408059:	jne    0x40806b
  40805b:	mov    edx,DWORD PTR [ecx+0xc]
  40805e:	mov    edx,DWORD PTR [edx+0xc]
  408061:	cmp    DWORD PTR [ecx+0x8],edx
  408064:	jne    0x40806b
  408066:	mov    eax,0x1
  40806b:	ret
  40806c:	push   ebx
  40806d:	push   ecx
  40806e:	mov    ebx,0x412d70
  408073:	jmp    0x408080
  408075:	push   ebx
  408076:	push   ecx
  408077:	mov    ebx,0x412d70
  40807c:	mov    ecx,DWORD PTR [esp+0xc]
  408080:	mov    DWORD PTR [ebx+0x8],ecx
  408083:	mov    DWORD PTR [ebx+0x4],eax
  408086:	mov    DWORD PTR [ebx+0xc],ebp
  408089:	push   ebp
  40808a:	push   ecx
  40808b:	push   eax
  40808c:	pop    eax
  40808d:	pop    ecx
  40808e:	pop    ebp
  40808f:	pop    ecx
  408090:	pop    ebx
  408091:	ret    0x4
  408094:	call   eax
  408096:	ret
  408097:	push   ebp
  408098:	mov    ebp,esp
  40809a:	push   esi
  40809b:	mov    esi,DWORD PTR [ebp+0x8]
  40809e:	push   edi
  40809f:	or     edi,0xffffffff
  4080a2:	test   esi,esi
  4080a4:	jne    0x4080ba
  4080a6:	call   0x402568
  4080ab:	mov    DWORD PTR [eax],0x16
  4080b1:	call   0x4016b6
  4080b6:	or     eax,edi
  4080b8:	jmp    0x4080ff
  4080ba:	test   BYTE PTR [esi+0xc],0x83
  4080be:	je     0x4080f9
  4080c0:	push   esi
  4080c1:	call   0x4068a0
  4080c6:	push   esi
  4080c7:	mov    edi,eax
  4080c9:	call   0x408541
  4080ce:	push   esi
  4080cf:	call   0x403f66
  4080d4:	push   eax
  4080d5:	call   0x4083cc
  4080da:	add    esp,0x10
  4080dd:	test   eax,eax
  4080df:	jns    0x4080e6
  4080e1:	or     edi,0xffffffff
  4080e4:	jmp    0x4080f9
  4080e6:	cmp    DWORD PTR [esi+0x1c],0x0
  4080ea:	je     0x4080f9
  4080ec:	push   DWORD PTR [esi+0x1c]
  4080ef:	call   0x40575f
  4080f4:	and    DWORD PTR [esi+0x1c],0x0
  4080f8:	pop    ecx
  4080f9:	and    DWORD PTR [esi+0xc],0x0
  4080fd:	mov    eax,edi
  4080ff:	pop    edi
  408100:	pop    esi
  408101:	pop    ebp
  408102:	ret
  408103:	push   0xc
  408105:	push   0x411138
  40810a:	call   0x403b60
  40810f:	or     edi,0xffffffff
  408112:	mov    DWORD PTR [ebp-0x1c],edi
  408115:	xor    eax,eax
  408117:	mov    esi,DWORD PTR [ebp+0x8]
  40811a:	test   esi,esi
  40811c:	setne  al
  40811f:	test   eax,eax
  408121:	jne    0x40813b
  408123:	call   0x402568
  408128:	mov    DWORD PTR [eax],0x16
  40812e:	call   0x4016b6
  408133:	mov    eax,edi
  408135:	call   0x403ba5
  40813a:	ret
  40813b:	test   BYTE PTR [esi+0xc],0x40
  40813f:	je     0x408147
  408141:	and    DWORD PTR [esi+0xc],0x0
  408145:	jmp    0x408133
  408147:	push   esi
  408148:	call   0x403e90
  40814d:	pop    ecx
  40814e:	and    DWORD PTR [ebp-0x4],0x0
  408152:	push   esi
  408153:	call   0x408097
  408158:	pop    ecx
  408159:	mov    edi,eax
  40815b:	mov    DWORD PTR [ebp-0x1c],edi
  40815e:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  408165:	call   0x408172
  40816a:	jmp    0x408133
  40816c:	mov    esi,DWORD PTR [ebp+0x8]
  40816f:	mov    edi,DWORD PTR [ebp-0x1c]
  408172:	push   esi
  408173:	call   0x403eff
  408178:	pop    ecx
  408179:	ret
  40817a:	push   0x14
  40817c:	push   0x411158
  408181:	call   0x403b60
  408186:	xor    esi,esi
  408188:	mov    DWORD PTR [ebp-0x1c],esi
  40818b:	mov    edi,DWORD PTR [ebp+0x8]
  40818e:	cmp    edi,0xfffffffe
  408191:	jne    0x4081a3
  408193:	call   0x402568
  408198:	mov    DWORD PTR [eax],0x9
  40819e:	jmp    0x40825a
  4081a3:	test   edi,edi
  4081a5:	js     0x40824a
  4081ab:	cmp    edi,DWORD PTR ds:0x414f44
  4081b1:	jae    0x40824a
  4081b7:	mov    eax,edi
  4081b9:	sar    eax,0x5
  4081bc:	mov    DWORD PTR [ebp-0x20],eax
  4081bf:	mov    ebx,edi
  4081c1:	and    ebx,0x1f
  4081c4:	shl    ebx,0x6
  4081c7:	mov    eax,DWORD PTR [eax*4+0x413468]
  4081ce:	movsx  eax,BYTE PTR [ebx+eax*1+0x4]
  4081d3:	and    eax,0x1
  4081d6:	je     0x40824a
  4081d8:	push   edi
  4081d9:	call   0x4069f1
  4081de:	pop    ecx
  4081df:	mov    DWORD PTR [ebp-0x4],esi
  4081e2:	mov    eax,DWORD PTR [ebp-0x20]
  4081e5:	mov    eax,DWORD PTR [eax*4+0x413468]
  4081ec:	test   BYTE PTR [ebx+eax*1+0x4],0x1
  4081f1:	je     0x40821b
  4081f3:	push   edi
  4081f4:	call   0x406b05
  4081f9:	pop    ecx
  4081fa:	push   eax
  4081fb:	call   DWORD PTR ds:0x40d00c
  408201:	test   eax,eax
  408203:	jne    0x40820d
  408205:	call   DWORD PTR ds:0x40d028
  40820b:	mov    esi,eax
  40820d:	mov    DWORD PTR [ebp-0x1c],esi
  408210:	test   esi,esi
  408212:	je     0x40822c
  408214:	call   0x402534
  408219:	mov    DWORD PTR [eax],esi
  40821b:	call   0x402568
  408220:	mov    DWORD PTR [eax],0x9
  408226:	or     esi,0xffffffff
  408229:	mov    DWORD PTR [ebp-0x1c],esi
  40822c:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  408233:	call   0x408242
  408238:	mov    eax,esi
  40823a:	jmp    0x40825d
  40823c:	mov    edi,DWORD PTR [ebp+0x8]
  40823f:	mov    esi,DWORD PTR [ebp-0x1c]
  408242:	push   edi
  408243:	call   0x406b6c
  408248:	pop    ecx
  408249:	ret
  40824a:	call   0x402568
  40824f:	mov    DWORD PTR [eax],0x9
  408255:	call   0x4016b6
  40825a:	or     eax,0xffffffff
  40825d:	call   0x403ba5
  408262:	ret
  408263:	mov    eax,ds:0x412d80
  408268:	cmp    eax,0xffffffff
  40826b:	je     0x408279
  40826d:	cmp    eax,0xfffffffe
  408270:	je     0x408279
  408272:	push   eax
  408273:	call   DWORD PTR ds:0x40d0f4
  408279:	ret
  40827a:	xor    eax,eax
  40827c:	push   eax
  40827d:	push   eax
  40827e:	push   0x3
  408280:	push   eax
  408281:	push   0x3
  408283:	push   0x40000000
  408288:	push   0x410cf0
  40828d:	call   DWORD PTR ds:0x40d008
  408293:	mov    ds:0x412d80,eax
  408298:	ret
  408299:	push   ebp
  40829a:	mov    ebp,esp
  40829c:	sub    esp,0x18
  40829f:	lea    ecx,[ebp-0x18]
  4082a2:	push   ebx
  4082a3:	push   DWORD PTR [ebp+0x10]
  4082a6:	call   0x401840
  4082ab:	mov    ebx,DWORD PTR [ebp+0x8]
  4082ae:	lea    eax,[ebx+0x1]
  4082b1:	cmp    eax,0x100
  4082b6:	ja     0x4082c7
  4082b8:	mov    eax,DWORD PTR [ebp-0x18]
  4082bb:	mov    eax,DWORD PTR [eax+0x90]
  4082c1:	movzx  eax,WORD PTR [eax+ebx*2]
  4082c5:	jmp    0x408335
  4082c7:	mov    eax,ebx
  4082c9:	lea    ecx,[ebp-0x18]
  4082cc:	sar    eax,0x8
  4082cf:	mov    DWORD PTR [ebp+0x8],eax
  4082d2:	push   ecx
  4082d3:	movzx  eax,al
  4082d6:	push   eax
  4082d7:	call   0x405531
  4082dc:	pop    ecx
  4082dd:	pop    ecx
  4082de:	test   eax,eax
  4082e0:	je     0x4082f4
  4082e2:	mov    eax,DWORD PTR [ebp+0x8]
  4082e5:	push   0x2
  4082e7:	mov    BYTE PTR [ebp-0x8],al
  4082ea:	mov    BYTE PTR [ebp-0x7],bl
  4082ed:	mov    BYTE PTR [ebp-0x6],0x0
  4082f1:	pop    ecx
  4082f2:	jmp    0x4082fe
  4082f4:	xor    ecx,ecx
  4082f6:	mov    BYTE PTR [ebp-0x8],bl
  4082f9:	mov    BYTE PTR [ebp-0x7],0x0
  4082fd:	inc    ecx
  4082fe:	mov    eax,DWORD PTR [ebp-0x18]
  408301:	push   0x1
  408303:	push   DWORD PTR [eax+0x4]
  408306:	lea    eax,[ebp-0x4]
  408309:	push   eax
  40830a:	push   ecx
  40830b:	lea    eax,[ebp-0x8]
  40830e:	push   eax
  40830f:	lea    eax,[ebp-0x18]
  408312:	push   0x1
  408314:	push   eax
  408315:	call   0x40755e
  40831a:	add    esp,0x1c
  40831d:	test   eax,eax
  40831f:	jne    0x408331
  408321:	cmp    BYTE PTR [ebp-0xc],al
  408324:	je     0x40832d
  408326:	mov    eax,DWORD PTR [ebp-0x10]
  408329:	and    DWORD PTR [eax+0x70],0xfffffffd
  40832d:	xor    eax,eax
  40832f:	jmp    0x408345
  408331:	movzx  eax,WORD PTR [ebp-0x4]
  408335:	and    eax,DWORD PTR [ebp+0xc]
  408338:	cmp    BYTE PTR [ebp-0xc],0x0
  40833c:	je     0x408345
  40833e:	mov    ecx,DWORD PTR [ebp-0x10]
  408341:	and    DWORD PTR [ecx+0x70],0xfffffffd
  408345:	pop    ebx
  408346:	mov    esp,ebp
  408348:	pop    ebp
  408349:	ret
  40834a:	push   0x8
  40834c:	push   0x411178
  408351:	call   0x403b60
  408356:	mov    esi,0x412ae0
  40835b:	cmp    DWORD PTR ds:0x412adc,esi
  408361:	je     0x40838d
  408363:	push   0xc
  408365:	call   0x405969
  40836a:	pop    ecx
  40836b:	and    DWORD PTR [ebp-0x4],0x0
  40836f:	push   esi
  408370:	push   0x412adc
  408375:	call   0x404df6
  40837a:	pop    ecx
  40837b:	pop    ecx
  40837c:	mov    ds:0x412adc,eax
  408381:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  408388:	call   0x408393
  40838d:	call   0x403ba5
  408392:	ret
  408393:	push   0xc
  408395:	call   0x405ad3
  40839a:	pop    ecx
  40839b:	ret
  40839c:	int3
  40839d:	int3
  40839e:	int3
  40839f:	int3
  4083a0:	push   ecx
  4083a1:	lea    ecx,[esp+0x8]
  4083a5:	sub    ecx,eax
  4083a7:	and    ecx,0xf
  4083aa:	add    eax,ecx
  4083ac:	sbb    ecx,ecx
  4083ae:	or     eax,ecx
  4083b0:	pop    ecx
  4083b1:	jmp    0x406cf0
  4083b6:	push   ecx
  4083b7:	lea    ecx,[esp+0x8]
  4083bb:	sub    ecx,eax
  4083bd:	and    ecx,0x7
  4083c0:	add    eax,ecx
  4083c2:	sbb    ecx,ecx
  4083c4:	or     eax,ecx
  4083c6:	pop    ecx
  4083c7:	jmp    0x406cf0
  4083cc:	push   0x10
  4083ce:	push   0x411198
  4083d3:	call   0x403b60
  4083d8:	xor    ebx,ebx
  4083da:	mov    DWORD PTR [ebp-0x1c],ebx
  4083dd:	mov    esi,DWORD PTR [ebp+0x8]
  4083e0:	cmp    esi,0xfffffffe
  4083e3:	jne    0x4083fc
  4083e5:	call   0x402534
  4083ea:	mov    DWORD PTR [eax],ebx
  4083ec:	call   0x402568
  4083f1:	mov    DWORD PTR [eax],0x9
  4083f7:	jmp    0x40849e
  4083fc:	test   esi,esi
  4083fe:	js     0x408487
  408404:	cmp    esi,DWORD PTR ds:0x414f44
  40840a:	jae    0x408487
  40840c:	mov    ebx,esi
  40840e:	sar    ebx,0x5
  408411:	mov    edi,esi
  408413:	and    edi,0x1f
  408416:	shl    edi,0x6
  408419:	mov    eax,DWORD PTR [ebx*4+0x413468]
  408420:	movsx  eax,BYTE PTR [eax+edi*1+0x4]
  408425:	and    eax,0x1
  408428:	jne    0x408434
  40842a:	call   0x402534
  40842f:	and    DWORD PTR [eax],0x0
  408432:	jmp    0x40848e
  408434:	push   esi
  408435:	call   0x4069f1
  40843a:	pop    ecx
  40843b:	and    DWORD PTR [ebp-0x4],0x0
  40843f:	mov    eax,DWORD PTR [ebx*4+0x413468]
  408446:	test   BYTE PTR [eax+edi*1+0x4],0x1
  40844b:	je     0x408458
  40844d:	push   esi
  40844e:	call   0x4084a7
  408453:	pop    ecx
  408454:	mov    edi,eax
  408456:	jmp    0x408466
  408458:	call   0x402568
  40845d:	mov    DWORD PTR [eax],0x9
  408463:	or     edi,0xffffffff
  408466:	mov    DWORD PTR [ebp-0x1c],edi
  408469:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  408470:	call   0x40847f
  408475:	mov    eax,edi
  408477:	jmp    0x4084a1
  408479:	mov    esi,DWORD PTR [ebp+0x8]
  40847c:	mov    edi,DWORD PTR [ebp-0x1c]
  40847f:	push   esi
  408480:	call   0x406b6c
  408485:	pop    ecx
  408486:	ret
  408487:	call   0x402534
  40848c:	mov    DWORD PTR [eax],ebx
  40848e:	call   0x402568
  408493:	mov    DWORD PTR [eax],0x9
  408499:	call   0x4016b6
  40849e:	or     eax,0xffffffff
  4084a1:	call   0x403ba5
  4084a6:	ret
  4084a7:	push   ebp
  4084a8:	mov    ebp,esp
  4084aa:	push   esi
  4084ab:	push   edi
  4084ac:	mov    edi,DWORD PTR [ebp+0x8]
  4084af:	push   edi
  4084b0:	call   0x406b05
  4084b5:	pop    ecx
  4084b6:	cmp    eax,0xffffffff
  4084b9:	je     0x40850b
  4084bb:	mov    eax,ds:0x413468
  4084c0:	cmp    edi,0x1
  4084c3:	jne    0x4084ce
  4084c5:	test   BYTE PTR [eax+0x84],0x1
  4084cc:	jne    0x4084d9
  4084ce:	cmp    edi,0x2
  4084d1:	jne    0x4084ef
  4084d3:	test   BYTE PTR [eax+0x44],0x1
  4084d7:	je     0x4084ef
  4084d9:	push   0x2
  4084db:	call   0x406b05
  4084e0:	push   0x1
  4084e2:	mov    esi,eax
  4084e4:	call   0x406b05
  4084e9:	pop    ecx
  4084ea:	pop    ecx
  4084eb:	cmp    eax,esi
  4084ed:	je     0x40850b
  4084ef:	push   edi
  4084f0:	call   0x406b05
  4084f5:	pop    ecx
  4084f6:	push   eax
  4084f7:	call   DWORD PTR ds:0x40d0f4
  4084fd:	test   eax,eax
  4084ff:	jne    0x40850b
  408501:	call   DWORD PTR ds:0x40d028
  408507:	mov    esi,eax
  408509:	jmp    0x40850d
  40850b:	xor    esi,esi
  40850d:	push   edi
  40850e:	call   0x406a7f
  408513:	pop    ecx
  408514:	mov    ecx,edi
  408516:	and    edi,0x1f
  408519:	sar    ecx,0x5
  40851c:	shl    edi,0x6
  40851f:	mov    ecx,DWORD PTR [ecx*4+0x413468]
  408526:	mov    BYTE PTR [ecx+edi*1+0x4],0x0
  40852b:	test   esi,esi
  40852d:	je     0x40853b
  40852f:	push   esi
  408530:	call   0x402547
  408535:	pop    ecx
  408536:	or     eax,0xffffffff
  408539:	jmp    0x40853d
  40853b:	xor    eax,eax
  40853d:	pop    edi
  40853e:	pop    esi
  40853f:	pop    ebp
  408540:	ret
  408541:	push   ebp
  408542:	mov    ebp,esp
  408544:	push   esi
  408545:	mov    esi,DWORD PTR [ebp+0x8]
  408548:	test   BYTE PTR [esi+0xc],0x83
  40854c:	je     0x40856e
  40854e:	test   BYTE PTR [esi+0xc],0x8
  408552:	je     0x40856e
  408554:	push   DWORD PTR [esi+0x8]
  408557:	call   0x40575f
  40855c:	and    DWORD PTR [esi+0xc],0xfffffbf7
  408563:	xor    eax,eax
  408565:	pop    ecx
  408566:	mov    DWORD PTR [esi],eax
  408568:	mov    DWORD PTR [esi+0x8],eax
  40856b:	mov    DWORD PTR [esi+0x4],eax
  40856e:	pop    esi
  40856f:	pop    ebp
  408570:	ret
  408571:	push   ebp
  408572:	mov    ebp,esp
  408574:	sub    esp,0x2c
  408577:	mov    eax,ds:0x412000
  40857c:	xor    eax,ebp
  40857e:	mov    DWORD PTR [ebp-0x4],eax
  408581:	mov    eax,DWORD PTR [ebp+0x8]
  408584:	lea    ecx,[ebp-0x2c]
  408587:	push   ebx
  408588:	push   esi
  408589:	mov    esi,DWORD PTR [ebp+0xc]
  40858c:	push   edi
  40858d:	push   DWORD PTR [ebp+0x10]
  408590:	mov    DWORD PTR [ebp-0x14],eax
  408593:	mov    eax,DWORD PTR [ebp+0x14]
  408596:	mov    DWORD PTR [ebp-0x1c],eax
  408599:	call   0x401840
  40859e:	lea    eax,[ebp-0x2c]
  4085a1:	xor    edi,edi
  4085a3:	push   eax
  4085a4:	push   edi
  4085a5:	push   edi
  4085a6:	push   edi
  4085a7:	push   edi
  4085a8:	push   esi
  4085a9:	lea    eax,[ebp-0x18]
  4085ac:	push   eax
  4085ad:	lea    eax,[ebp-0x10]
  4085b0:	push   eax
  4085b1:	call   0x409254
  4085b6:	mov    ebx,eax
  4085b8:	add    esp,0x20
  4085bb:	mov    eax,DWORD PTR [ebp-0x1c]
  4085be:	test   eax,eax
  4085c0:	je     0x4085c7
  4085c2:	mov    ecx,DWORD PTR [ebp-0x18]
  4085c5:	mov    DWORD PTR [eax],ecx
  4085c7:	push   DWORD PTR [ebp-0x14]
  4085ca:	lea    eax,[ebp-0x10]
  4085cd:	push   eax
  4085ce:	call   0x408ce2
  4085d3:	pop    ecx
  4085d4:	pop    ecx
  4085d5:	test   bl,0x3
  4085d8:	jne    0x4085e8
  4085da:	cmp    eax,0x1
  4085dd:	je     0x4085f2
  4085df:	cmp    eax,0x2
  4085e2:	jne    0x4085f5
  4085e4:	push   0x4
  4085e6:	jmp    0x4085f4
  4085e8:	test   bl,0x1
  4085eb:	jne    0x4085e4
  4085ed:	test   bl,0x2
  4085f0:	je     0x4085f5
  4085f2:	push   0x3
  4085f4:	pop    edi
  4085f5:	cmp    BYTE PTR [ebp-0x20],0x0
  4085f9:	je     0x408602
  4085fb:	mov    ecx,DWORD PTR [ebp-0x24]
  4085fe:	and    DWORD PTR [ecx+0x70],0xfffffffd
  408602:	mov    ecx,DWORD PTR [ebp-0x4]
  408605:	mov    eax,edi
  408607:	pop    edi
  408608:	pop    esi
  408609:	xor    ecx,ebp
  40860b:	pop    ebx
  40860c:	call   0x40120d
  408611:	mov    esp,ebp
  408613:	pop    ebp
  408614:	ret
  408615:	push   ebp
  408616:	mov    ebp,esp
  408618:	sub    esp,0x28
  40861b:	mov    eax,ds:0x412000
  408620:	xor    eax,ebp
  408622:	mov    DWORD PTR [ebp-0x4],eax
  408625:	push   ebx
  408626:	push   esi
  408627:	mov    esi,DWORD PTR [ebp+0xc]
  40862a:	lea    ecx,[ebp-0x28]
  40862d:	push   edi
  40862e:	push   DWORD PTR [ebp+0x10]
  408631:	mov    edi,DWORD PTR [ebp+0x8]
  408634:	call   0x401840
  408639:	lea    eax,[ebp-0x28]
  40863c:	xor    ebx,ebx
  40863e:	push   eax
  40863f:	push   ebx
  408640:	push   ebx
  408641:	push   ebx
  408642:	push   ebx
  408643:	push   esi
  408644:	lea    eax,[ebp-0x18]
  408647:	push   eax
  408648:	lea    eax,[ebp-0x10]
  40864b:	push   eax
  40864c:	call   0x409254
  408651:	mov    DWORD PTR [ebp-0x14],eax
  408654:	lea    eax,[ebp-0x10]
  408657:	push   edi
  408658:	push   eax
  408659:	call   0x408770
  40865e:	mov    ecx,eax
  408660:	add    esp,0x28
  408663:	mov    eax,DWORD PTR [ebp-0x14]
  408666:	test   al,0x3
  408668:	jne    0x408678
  40866a:	cmp    ecx,0x1
  40866d:	je     0x408680
  40866f:	cmp    ecx,0x2
  408672:	jne    0x408683
  408674:	push   0x4
  408676:	jmp    0x408682
  408678:	test   al,0x1
  40867a:	jne    0x408674
  40867c:	test   al,0x2
  40867e:	je     0x408683
  408680:	push   0x3
  408682:	pop    ebx
  408683:	cmp    BYTE PTR [ebp-0x1c],0x0
  408687:	je     0x408690
  408689:	mov    ecx,DWORD PTR [ebp-0x20]
  40868c:	and    DWORD PTR [ecx+0x70],0xfffffffd
  408690:	mov    ecx,DWORD PTR [ebp-0x4]
  408693:	mov    eax,ebx
  408695:	pop    edi
  408696:	pop    esi
  408697:	xor    ecx,ebp
  408699:	pop    ebx
  40869a:	call   0x40120d
  40869f:	mov    esp,ebp
  4086a1:	pop    ebp
  4086a2:	ret
  4086a3:	push   ebp
  4086a4:	mov    ebp,esp
  4086a6:	push   0x0
  4086a8:	push   DWORD PTR [ebp+0x10]
  4086ab:	push   DWORD PTR [ebp+0xc]
  4086ae:	push   DWORD PTR [ebp+0x8]
  4086b1:	call   0x408571
  4086b6:	add    esp,0x10
  4086b9:	pop    ebp
  4086ba:	ret
  4086bb:	int3
  4086bc:	int3
  4086bd:	int3
  4086be:	int3
  4086bf:	int3
  4086c0:	mov    eax,DWORD PTR [esp+0x8]
  4086c4:	mov    ecx,DWORD PTR [esp+0x10]
  4086c8:	or     ecx,eax
  4086ca:	mov    ecx,DWORD PTR [esp+0xc]
  4086ce:	jne    0x4086d9
  4086d0:	mov    eax,DWORD PTR [esp+0x4]
  4086d4:	mul    ecx
  4086d6:	ret    0x10
  4086d9:	push   ebx
  4086da:	mul    ecx
  4086dc:	mov    ebx,eax
  4086de:	mov    eax,DWORD PTR [esp+0x8]
  4086e2:	mul    DWORD PTR [esp+0x14]
  4086e6:	add    ebx,eax
  4086e8:	mov    eax,DWORD PTR [esp+0x8]
  4086ec:	mul    ecx
  4086ee:	add    edx,ebx
  4086f0:	pop    ebx
  4086f1:	ret    0x10
  4086f4:	push   ebp
  4086f5:	mov    ebp,esp
  4086f7:	call   0x40870b
  4086fc:	cmp    DWORD PTR [ebp+0x8],0x0
  408700:	je     0x408707
  408702:	call   0x40a49a
  408707:	fnclex
  408709:	pop    ebp
  40870a:	ret
  40870b:	mov    eax,0x4099fc
  408710:	mov    DWORD PTR ds:0x412ba0,0x40a2e8
  40871a:	mov    ds:0x412b9c,eax
  40871f:	mov    DWORD PTR ds:0x412ba4,0x40a379
  408729:	mov    DWORD PTR ds:0x412ba8,0x40a3d3
  408733:	mov    DWORD PTR ds:0x412bac,0x40a458
  40873d:	mov    ds:0x412bb0,eax
  408742:	mov    DWORD PTR ds:0x412bb4,0x409a1d
  40874c:	mov    DWORD PTR ds:0x412bb8,0x40a391
  408756:	mov    DWORD PTR ds:0x412bbc,0x40a2f9
  408760:	mov    DWORD PTR ds:0x412bc0,0x40a3e4
  40876a:	ret
  40876b:	int3
  40876c:	int3
  40876d:	int3
  40876e:	int3
  40876f:	int3
  408770:	push   ebp
  408771:	mov    ebp,esp
  408773:	sub    esp,0x44
  408776:	mov    eax,ds:0x412000
  40877b:	xor    eax,ebp
  40877d:	mov    DWORD PTR [ebp-0x4],eax
  408780:	mov    ecx,DWORD PTR [ebp+0x8]
  408783:	push   ebx
  408784:	push   esi
  408785:	push   edi
  408786:	movzx  eax,WORD PTR [ecx+0xa]
  40878a:	xor    ebx,ebx
  40878c:	mov    edi,DWORD PTR [ebp+0xc]
  40878f:	mov    edx,eax
  408791:	and    eax,0x8000
  408796:	mov    DWORD PTR [ebp-0x40],edi
  408799:	mov    DWORD PTR [ebp-0x44],eax
  40879c:	and    edx,0x7fff
  4087a2:	mov    eax,DWORD PTR [ecx+0x6]
  4087a5:	sub    edx,0x3fff
  4087ab:	mov    DWORD PTR [ebp-0x10],eax
  4087ae:	mov    eax,DWORD PTR [ecx+0x2]
  4087b1:	mov    DWORD PTR [ebp-0xc],eax
  4087b4:	movzx  eax,WORD PTR [ecx]
  4087b7:	shl    eax,0x10
  4087ba:	mov    DWORD PTR [ebp-0x20],edx
  4087bd:	mov    DWORD PTR [ebp-0x8],eax
  4087c0:	cmp    edx,0xffffc001
  4087c6:	jne    0x4087ed
  4087c8:	mov    esi,ebx
  4087ca:	mov    eax,ebx
  4087cc:	cmp    DWORD PTR [ebp+eax*4-0x10],ebx
  4087d0:	jne    0x4087dd
  4087d2:	inc    eax
  4087d3:	cmp    eax,0x3
  4087d6:	jl     0x4087cc
  4087d8:	jmp    0x408c96
  4087dd:	xor    eax,eax
  4087df:	lea    edi,[ebp-0x10]
  4087e2:	stos   DWORD PTR es:[edi],eax
  4087e3:	stos   DWORD PTR es:[edi],eax
  4087e4:	stos   DWORD PTR es:[edi],eax
  4087e5:	push   0x2
  4087e7:	pop    ebx
  4087e8:	jmp    0x408c93
  4087ed:	mov    eax,ds:0x412db0
  4087f2:	lea    esi,[ebp-0x10]
  4087f5:	lea    edi,[ebp-0x1c]
  4087f8:	mov    DWORD PTR [ebp-0x24],edx
  4087fb:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  4087fc:	dec    eax
  4087fd:	mov    DWORD PTR [ebp-0x34],eax
  408800:	push   0x1f
  408802:	mov    DWORD PTR [ebp-0x2c],ebx
  408805:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408806:	lea    ecx,[eax+0x1]
  408809:	mov    eax,ecx
  40880b:	cdq
  40880c:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40880d:	pop    esi
  40880e:	and    edx,esi
  408810:	add    edx,eax
  408812:	sar    edx,0x5
  408815:	mov    DWORD PTR [ebp-0x3c],edx
  408818:	and    ecx,0x8000001f
  40881e:	jns    0x408825
  408820:	dec    ecx
  408821:	or     ecx,0xffffffe0
  408824:	inc    ecx
  408825:	sub    esi,ecx
  408827:	xor    eax,eax
  408829:	inc    eax
  40882a:	mov    DWORD PTR [ebp-0x30],esi
  40882d:	mov    ecx,esi
  40882f:	or     edi,0xffffffff
  408832:	shl    eax,cl
  408834:	push   0x3
  408836:	pop    esi
  408837:	test   DWORD PTR [ebp+edx*4-0x10],eax
  40883b:	je     0x4088e5
  408841:	mov    eax,edi
  408843:	shl    eax,cl
  408845:	not    eax
  408847:	test   DWORD PTR [ebp+edx*4-0x10],eax
  40884b:	jmp    0x408851
  40884d:	cmp    DWORD PTR [ebp+edx*4-0x10],ebx
  408851:	jne    0x40885d
  408853:	inc    edx
  408854:	cmp    edx,esi
  408856:	jl     0x40884d
  408858:	jmp    0x4088e2
  40885d:	mov    eax,DWORD PTR [ebp-0x34]
  408860:	cdq
  408861:	push   0x1f
  408863:	pop    ecx
  408864:	and    edx,ecx
  408866:	add    edx,eax
  408868:	mov    eax,DWORD PTR [ebp-0x34]
  40886b:	sar    edx,0x5
  40886e:	and    eax,0x8000001f
  408873:	jns    0x40887a
  408875:	dec    eax
  408876:	or     eax,0xffffffe0
  408879:	inc    eax
  40887a:	sub    ecx,eax
  40887c:	mov    DWORD PTR [ebp-0x2c],ebx
  40887f:	xor    eax,eax
  408881:	inc    eax
  408882:	shl    eax,cl
  408884:	mov    DWORD PTR [ebp-0x38],eax
  408887:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  40888b:	mov    ecx,DWORD PTR [ebp-0x38]
  40888e:	add    ecx,eax
  408890:	mov    DWORD PTR [ebp-0x28],ecx
  408893:	cmp    ecx,eax
  408895:	mov    eax,DWORD PTR [ebp-0x28]
  408898:	mov    ecx,ebx
  40889a:	push   0xffffffff
  40889c:	pop    edi
  40889d:	jb     0x4088a4
  40889f:	cmp    eax,DWORD PTR [ebp-0x38]
  4088a2:	jae    0x4088aa
  4088a4:	xor    ecx,ecx
  4088a6:	inc    ecx
  4088a7:	mov    DWORD PTR [ebp-0x2c],ecx
  4088aa:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  4088ae:	dec    edx
  4088af:	js     0x4088df
  4088b1:	test   ecx,ecx
  4088b3:	je     0x4088dc
  4088b5:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  4088b9:	mov    ecx,ebx
  4088bb:	mov    DWORD PTR [ebp-0x2c],ebx
  4088be:	lea    edi,[eax+0x1]
  4088c1:	cmp    edi,eax
  4088c3:	mov    DWORD PTR [ebp-0x28],edi
  4088c6:	mov    eax,edi
  4088c8:	jb     0x4088cf
  4088ca:	cmp    eax,0x1
  4088cd:	jae    0x4088d5
  4088cf:	xor    ecx,ecx
  4088d1:	inc    ecx
  4088d2:	mov    DWORD PTR [ebp-0x2c],ecx
  4088d5:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  4088d9:	dec    edx
  4088da:	jns    0x4088b1
  4088dc:	or     edi,0xffffffff
  4088df:	mov    ecx,DWORD PTR [ebp-0x30]
  4088e2:	mov    edx,DWORD PTR [ebp-0x3c]
  4088e5:	mov    eax,edi
  4088e7:	shl    eax,cl
  4088e9:	and    DWORD PTR [ebp+edx*4-0x10],eax
  4088ed:	lea    eax,[edx+0x1]
  4088f0:	cmp    eax,esi
  4088f2:	jge    0x408905
  4088f4:	lea    edi,[ebp-0x10]
  4088f7:	mov    ecx,esi
  4088f9:	lea    edi,[edi+eax*4]
  4088fc:	sub    ecx,eax
  4088fe:	xor    eax,eax
  408900:	rep stos DWORD PTR es:[edi],eax
  408902:	or     edi,0xffffffff
  408905:	mov    ecx,DWORD PTR [ebp-0x20]
  408908:	cmp    DWORD PTR [ebp-0x2c],ebx
  40890b:	je     0x40890e
  40890d:	inc    ecx
  40890e:	mov    edx,DWORD PTR ds:0x412dac
  408914:	mov    eax,edx
  408916:	sub    eax,DWORD PTR ds:0x412db0
  40891c:	cmp    ecx,eax
  40891e:	jge    0x40892f
  408920:	xor    eax,eax
  408922:	lea    edi,[ebp-0x10]
  408925:	stos   DWORD PTR es:[edi],eax
  408926:	stos   DWORD PTR es:[edi],eax
  408927:	stos   DWORD PTR es:[edi],eax
  408928:	mov    esi,ebx
  40892a:	jmp    0x4087e5
  40892f:	cmp    ecx,edx
  408931:	jg     0x408b50
  408937:	sub    edx,DWORD PTR [ebp-0x24]
  40893a:	lea    esi,[ebp-0x1c]
  40893d:	mov    DWORD PTR [ebp-0x30],edx
  408940:	lea    edi,[ebp-0x10]
  408943:	mov    eax,edx
  408945:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408946:	cdq
  408947:	and    edx,0x1f
  40894a:	add    eax,edx
  40894c:	sar    eax,0x5
  40894f:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408950:	mov    DWORD PTR [ebp-0x3c],eax
  408953:	mov    eax,DWORD PTR [ebp-0x30]
  408956:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408957:	and    eax,0x8000001f
  40895c:	jns    0x408963
  40895e:	dec    eax
  40895f:	or     eax,0xffffffe0
  408962:	inc    eax
  408963:	mov    DWORD PTR [ebp-0x30],eax
  408966:	or     edi,0xffffffff
  408969:	mov    eax,edi
  40896b:	mov    DWORD PTR [ebp-0x20],ebx
  40896e:	mov    edi,DWORD PTR [ebp-0x30]
  408971:	mov    ecx,edi
  408973:	shl    eax,cl
  408975:	not    eax
  408977:	push   0x20
  408979:	mov    DWORD PTR [ebp-0x28],eax
  40897c:	pop    eax
  40897d:	sub    eax,edi
  40897f:	push   0x3
  408981:	mov    DWORD PTR [ebp-0x38],eax
  408984:	pop    esi
  408985:	mov    edx,DWORD PTR [ebp+ebx*4-0x10]
  408989:	mov    ecx,edi
  40898b:	mov    eax,edx
  40898d:	shr    edx,cl
  40898f:	or     edx,DWORD PTR [ebp-0x20]
  408992:	and    eax,DWORD PTR [ebp-0x28]
  408995:	mov    ecx,DWORD PTR [ebp-0x38]
  408998:	shl    eax,cl
  40899a:	mov    DWORD PTR [ebp+ebx*4-0x10],edx
  40899e:	inc    ebx
  40899f:	mov    DWORD PTR [ebp-0x20],eax
  4089a2:	cmp    ebx,esi
  4089a4:	jl     0x408985
  4089a6:	mov    eax,DWORD PTR [ebp-0x3c]
  4089a9:	lea    edx,[ebp-0x8]
  4089ac:	shl    eax,0x2
  4089af:	xor    ebx,ebx
  4089b1:	push   0x2
  4089b3:	sub    edx,eax
  4089b5:	or     edi,0xffffffff
  4089b8:	mov    eax,DWORD PTR [ebp-0x3c]
  4089bb:	pop    ecx
  4089bc:	cmp    ecx,eax
  4089be:	jl     0x4089cb
  4089c0:	mov    eax,DWORD PTR [edx]
  4089c2:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  4089c6:	mov    eax,DWORD PTR [ebp-0x3c]
  4089c9:	jmp    0x4089cf
  4089cb:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  4089cf:	sub    edx,0x4
  4089d2:	dec    ecx
  4089d3:	jns    0x4089bc
  4089d5:	mov    ecx,DWORD PTR [ebp-0x34]
  4089d8:	inc    ecx
  4089d9:	mov    eax,ecx
  4089db:	cdq
  4089dc:	and    edx,0x1f
  4089df:	add    edx,eax
  4089e1:	sar    edx,0x5
  4089e4:	mov    DWORD PTR [ebp-0x2c],edx
  4089e7:	and    ecx,0x8000001f
  4089ed:	jns    0x4089f4
  4089ef:	dec    ecx
  4089f0:	or     ecx,0xffffffe0
  4089f3:	inc    ecx
  4089f4:	push   0x1f
  4089f6:	pop    eax
  4089f7:	sub    eax,ecx
  4089f9:	mov    DWORD PTR [ebp-0x30],eax
  4089fc:	xor    eax,eax
  4089fe:	mov    ecx,DWORD PTR [ebp-0x30]
  408a01:	inc    eax
  408a02:	shl    eax,cl
  408a04:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408a08:	je     0x408aa0
  408a0e:	mov    eax,edi
  408a10:	shl    eax,cl
  408a12:	not    eax
  408a14:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408a18:	jmp    0x408a1e
  408a1a:	cmp    DWORD PTR [ebp+edx*4-0x10],ebx
  408a1e:	jne    0x408a27
  408a20:	inc    edx
  408a21:	cmp    edx,esi
  408a23:	jl     0x408a1a
  408a25:	jmp    0x408a9d
  408a27:	mov    edi,DWORD PTR [ebp-0x34]
  408a2a:	mov    eax,edi
  408a2c:	push   0x1f
  408a2e:	cdq
  408a2f:	pop    ecx
  408a30:	and    edx,ecx
  408a32:	add    edx,eax
  408a34:	sar    edx,0x5
  408a37:	and    edi,0x8000001f
  408a3d:	jns    0x408a44
  408a3f:	dec    edi
  408a40:	or     edi,0xffffffe0
  408a43:	inc    edi
  408a44:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408a48:	sub    ecx,edi
  408a4a:	xor    edi,edi
  408a4c:	inc    edi
  408a4d:	shl    edi,cl
  408a4f:	mov    ecx,ebx
  408a51:	mov    DWORD PTR [ebp-0x24],edi
  408a54:	add    edi,eax
  408a56:	mov    DWORD PTR [ebp-0x20],edi
  408a59:	cmp    edi,eax
  408a5b:	mov    eax,DWORD PTR [ebp-0x20]
  408a5e:	push   0xffffffff
  408a60:	pop    edi
  408a61:	jb     0x408a68
  408a63:	cmp    eax,DWORD PTR [ebp-0x24]
  408a66:	jae    0x408a6b
  408a68:	xor    ecx,ecx
  408a6a:	inc    ecx
  408a6b:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  408a6f:	dec    edx
  408a70:	js     0x408a9a
  408a72:	test   ecx,ecx
  408a74:	je     0x408a97
  408a76:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408a7a:	mov    ecx,ebx
  408a7c:	lea    edi,[eax+0x1]
  408a7f:	cmp    edi,eax
  408a81:	mov    DWORD PTR [ebp-0x20],edi
  408a84:	mov    eax,edi
  408a86:	jb     0x408a8d
  408a88:	cmp    eax,0x1
  408a8b:	jae    0x408a90
  408a8d:	xor    ecx,ecx
  408a8f:	inc    ecx
  408a90:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  408a94:	dec    edx
  408a95:	jns    0x408a72
  408a97:	or     edi,0xffffffff
  408a9a:	mov    ecx,DWORD PTR [ebp-0x30]
  408a9d:	mov    edx,DWORD PTR [ebp-0x2c]
  408aa0:	mov    eax,edi
  408aa2:	shl    eax,cl
  408aa4:	and    DWORD PTR [ebp+edx*4-0x10],eax
  408aa8:	inc    edx
  408aa9:	cmp    edx,esi
  408aab:	jge    0x408abe
  408aad:	lea    edi,[ebp-0x10]
  408ab0:	mov    ecx,esi
  408ab2:	lea    edi,[edi+edx*4]
  408ab5:	sub    ecx,edx
  408ab7:	xor    eax,eax
  408ab9:	rep stos DWORD PTR es:[edi],eax
  408abb:	or     edi,0xffffffff
  408abe:	mov    ecx,DWORD PTR ds:0x412db4
  408ac4:	inc    ecx
  408ac5:	mov    eax,ecx
  408ac7:	cdq
  408ac8:	and    edx,0x1f
  408acb:	add    eax,edx
  408acd:	sar    eax,0x5
  408ad0:	mov    DWORD PTR [ebp-0x28],eax
  408ad3:	and    ecx,0x8000001f
  408ad9:	jns    0x408ae0
  408adb:	dec    ecx
  408adc:	or     ecx,0xffffffe0
  408adf:	inc    ecx
  408ae0:	mov    DWORD PTR [ebp-0x24],ecx
  408ae3:	mov    eax,ebx
  408ae5:	shl    edi,cl
  408ae7:	push   0x20
  408ae9:	mov    DWORD PTR [ebp-0x20],ebx
  408aec:	not    edi
  408aee:	mov    ebx,DWORD PTR [ebp-0x24]
  408af1:	pop    ecx
  408af2:	sub    ecx,ebx
  408af4:	mov    DWORD PTR [ebp-0x34],eax
  408af7:	mov    DWORD PTR [ebp-0x24],ecx
  408afa:	mov    edx,DWORD PTR [ebp+eax*4-0x10]
  408afe:	mov    ecx,ebx
  408b00:	mov    eax,edx
  408b02:	shr    edx,cl
  408b04:	mov    ecx,DWORD PTR [ebp-0x34]
  408b07:	and    eax,edi
  408b09:	or     edx,DWORD PTR [ebp-0x20]
  408b0c:	mov    DWORD PTR [ebp+ecx*4-0x10],edx
  408b10:	mov    ecx,DWORD PTR [ebp-0x24]
  408b13:	shl    eax,cl
  408b15:	mov    DWORD PTR [ebp-0x20],eax
  408b18:	mov    eax,DWORD PTR [ebp-0x34]
  408b1b:	inc    eax
  408b1c:	mov    DWORD PTR [ebp-0x34],eax
  408b1f:	cmp    eax,esi
  408b21:	jl     0x408afa
  408b23:	mov    esi,DWORD PTR [ebp-0x28]
  408b26:	lea    edx,[ebp-0x8]
  408b29:	mov    eax,esi
  408b2b:	shl    eax,0x2
  408b2e:	push   0x2
  408b30:	sub    edx,eax
  408b32:	xor    ebx,ebx
  408b34:	pop    ecx
  408b35:	cmp    ecx,esi
  408b37:	jl     0x408b41
  408b39:	mov    eax,DWORD PTR [edx]
  408b3b:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  408b3f:	jmp    0x408b45
  408b41:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  408b45:	sub    edx,0x4
  408b48:	dec    ecx
  408b49:	jns    0x408b35
  408b4b:	jmp    0x408928
  408b50:	cmp    ecx,DWORD PTR ds:0x412da8
  408b56:	jl     0x408bfe
  408b5c:	mov    ecx,DWORD PTR ds:0x412db4
  408b62:	lea    edi,[ebp-0x10]
  408b65:	xor    eax,eax
  408b67:	stos   DWORD PTR es:[edi],eax
  408b68:	stos   DWORD PTR es:[edi],eax
  408b69:	stos   DWORD PTR es:[edi],eax
  408b6a:	mov    eax,ecx
  408b6c:	or     DWORD PTR [ebp-0x10],0x80000000
  408b73:	cdq
  408b74:	and    edx,0x1f
  408b77:	add    eax,edx
  408b79:	sar    eax,0x5
  408b7c:	mov    DWORD PTR [ebp-0x34],eax
  408b7f:	and    ecx,0x8000001f
  408b85:	jns    0x408b8c
  408b87:	dec    ecx
  408b88:	or     ecx,0xffffffe0
  408b8b:	inc    ecx
  408b8c:	or     edi,0xffffffff
  408b8f:	mov    DWORD PTR [ebp-0x38],ecx
  408b92:	push   0x20
  408b94:	shl    edi,cl
  408b96:	pop    eax
  408b97:	sub    eax,ecx
  408b99:	mov    DWORD PTR [ebp-0x20],ebx
  408b9c:	not    edi
  408b9e:	mov    DWORD PTR [ebp-0x28],eax
  408ba1:	mov    edx,DWORD PTR [ebp+ebx*4-0x10]
  408ba5:	mov    eax,edx
  408ba7:	shr    edx,cl
  408ba9:	and    eax,edi
  408bab:	or     edx,DWORD PTR [ebp-0x20]
  408bae:	mov    ecx,DWORD PTR [ebp-0x28]
  408bb1:	shl    eax,cl
  408bb3:	mov    ecx,DWORD PTR [ebp-0x38]
  408bb6:	mov    DWORD PTR [ebp+ebx*4-0x10],edx
  408bba:	inc    ebx
  408bbb:	mov    DWORD PTR [ebp-0x20],eax
  408bbe:	cmp    ebx,esi
  408bc0:	jl     0x408ba1
  408bc2:	mov    esi,DWORD PTR [ebp-0x34]
  408bc5:	lea    edx,[ebp-0x8]
  408bc8:	mov    eax,esi
  408bca:	shl    eax,0x2
  408bcd:	push   0x2
  408bcf:	sub    edx,eax
  408bd1:	xor    ebx,ebx
  408bd3:	pop    ecx
  408bd4:	cmp    ecx,esi
  408bd6:	jl     0x408be0
  408bd8:	mov    eax,DWORD PTR [edx]
  408bda:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  408bde:	jmp    0x408be4
  408be0:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  408be4:	sub    edx,0x4
  408be7:	dec    ecx
  408be8:	jns    0x408bd4
  408bea:	mov    esi,DWORD PTR ds:0x412dbc
  408bf0:	xor    ebx,ebx
  408bf2:	add    esi,DWORD PTR ds:0x412da8
  408bf8:	inc    ebx
  408bf9:	jmp    0x408c93
  408bfe:	mov    esi,DWORD PTR ds:0x412dbc
  408c04:	and    DWORD PTR [ebp-0x10],0x7fffffff
  408c0b:	add    esi,ecx
  408c0d:	mov    ecx,DWORD PTR ds:0x412db4
  408c13:	mov    eax,ecx
  408c15:	cdq
  408c16:	and    edx,0x1f
  408c19:	mov    DWORD PTR [ebp-0x38],esi
  408c1c:	add    eax,edx
  408c1e:	sar    eax,0x5
  408c21:	mov    DWORD PTR [ebp-0x28],eax
  408c24:	and    ecx,0x8000001f
  408c2a:	jns    0x408c31
  408c2c:	dec    ecx
  408c2d:	or     ecx,0xffffffe0
  408c30:	inc    ecx
  408c31:	push   0x20
  408c33:	mov    DWORD PTR [ebp-0x20],ebx
  408c36:	mov    esi,ebx
  408c38:	shl    edi,cl
  408c3a:	mov    ebx,ecx
  408c3c:	pop    eax
  408c3d:	sub    eax,ebx
  408c3f:	mov    DWORD PTR [ebp-0x24],ecx
  408c42:	not    edi
  408c44:	mov    DWORD PTR [ebp-0x24],eax
  408c47:	mov    edx,DWORD PTR [ebp+esi*4-0x10]
  408c4b:	mov    ecx,ebx
  408c4d:	mov    eax,edx
  408c4f:	shr    edx,cl
  408c51:	or     edx,DWORD PTR [ebp-0x20]
  408c54:	and    eax,edi
  408c56:	mov    ecx,DWORD PTR [ebp-0x24]
  408c59:	shl    eax,cl
  408c5b:	mov    DWORD PTR [ebp+esi*4-0x10],edx
  408c5f:	inc    esi
  408c60:	mov    DWORD PTR [ebp-0x20],eax
  408c63:	cmp    esi,0x3
  408c66:	jl     0x408c47
  408c68:	mov    edi,DWORD PTR [ebp-0x28]
  408c6b:	lea    edx,[ebp-0x8]
  408c6e:	mov    esi,DWORD PTR [ebp-0x38]
  408c71:	mov    eax,edi
  408c73:	shl    eax,0x2
  408c76:	push   0x2
  408c78:	sub    edx,eax
  408c7a:	xor    ebx,ebx
  408c7c:	pop    ecx
  408c7d:	cmp    ecx,edi
  408c7f:	jl     0x408c89
  408c81:	mov    eax,DWORD PTR [edx]
  408c83:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  408c87:	jmp    0x408c8d
  408c89:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  408c8d:	sub    edx,0x4
  408c90:	dec    ecx
  408c91:	jns    0x408c7d
  408c93:	mov    edi,DWORD PTR [ebp-0x40]
  408c96:	push   0x1f
  408c98:	pop    eax
  408c99:	sub    eax,DWORD PTR ds:0x412db4
  408c9f:	mov    ecx,eax
  408ca1:	mov    eax,DWORD PTR [ebp-0x44]
  408ca4:	shl    esi,cl
  408ca6:	neg    eax
  408ca8:	sbb    eax,eax
  408caa:	and    eax,0x80000000
  408caf:	or     esi,eax
  408cb1:	mov    eax,ds:0x412db8
  408cb6:	or     esi,DWORD PTR [ebp-0x10]
  408cb9:	cmp    eax,0x40
  408cbc:	jne    0x408cc8
  408cbe:	mov    eax,DWORD PTR [ebp-0xc]
  408cc1:	mov    DWORD PTR [edi+0x4],esi
  408cc4:	mov    DWORD PTR [edi],eax
  408cc6:	jmp    0x408ccf
  408cc8:	cmp    eax,0x20
  408ccb:	jne    0x408ccf
  408ccd:	mov    DWORD PTR [edi],esi
  408ccf:	mov    ecx,DWORD PTR [ebp-0x4]
  408cd2:	mov    eax,ebx
  408cd4:	pop    edi
  408cd5:	pop    esi
  408cd6:	xor    ecx,ebp
  408cd8:	pop    ebx
  408cd9:	call   0x40120d
  408cde:	mov    esp,ebp
  408ce0:	pop    ebp
  408ce1:	ret
  408ce2:	push   ebp
  408ce3:	mov    ebp,esp
  408ce5:	sub    esp,0x44
  408ce8:	mov    eax,ds:0x412000
  408ced:	xor    eax,ebp
  408cef:	mov    DWORD PTR [ebp-0x4],eax
  408cf2:	mov    ecx,DWORD PTR [ebp+0x8]
  408cf5:	push   ebx
  408cf6:	push   esi
  408cf7:	push   edi
  408cf8:	movzx  eax,WORD PTR [ecx+0xa]
  408cfc:	xor    ebx,ebx
  408cfe:	mov    edi,DWORD PTR [ebp+0xc]
  408d01:	mov    edx,eax
  408d03:	and    eax,0x8000
  408d08:	mov    DWORD PTR [ebp-0x40],edi
  408d0b:	mov    DWORD PTR [ebp-0x44],eax
  408d0e:	and    edx,0x7fff
  408d14:	mov    eax,DWORD PTR [ecx+0x6]
  408d17:	sub    edx,0x3fff
  408d1d:	mov    DWORD PTR [ebp-0x10],eax
  408d20:	mov    eax,DWORD PTR [ecx+0x2]
  408d23:	mov    DWORD PTR [ebp-0xc],eax
  408d26:	movzx  eax,WORD PTR [ecx]
  408d29:	shl    eax,0x10
  408d2c:	mov    DWORD PTR [ebp-0x20],edx
  408d2f:	mov    DWORD PTR [ebp-0x8],eax
  408d32:	cmp    edx,0xffffc001
  408d38:	jne    0x408d5f
  408d3a:	mov    esi,ebx
  408d3c:	mov    eax,ebx
  408d3e:	cmp    DWORD PTR [ebp+eax*4-0x10],ebx
  408d42:	jne    0x408d4f
  408d44:	inc    eax
  408d45:	cmp    eax,0x3
  408d48:	jl     0x408d3e
  408d4a:	jmp    0x409208
  408d4f:	xor    eax,eax
  408d51:	lea    edi,[ebp-0x10]
  408d54:	stos   DWORD PTR es:[edi],eax
  408d55:	stos   DWORD PTR es:[edi],eax
  408d56:	stos   DWORD PTR es:[edi],eax
  408d57:	push   0x2
  408d59:	pop    ebx
  408d5a:	jmp    0x409205
  408d5f:	mov    eax,ds:0x412dc8
  408d64:	lea    esi,[ebp-0x10]
  408d67:	lea    edi,[ebp-0x1c]
  408d6a:	mov    DWORD PTR [ebp-0x24],edx
  408d6d:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408d6e:	dec    eax
  408d6f:	mov    DWORD PTR [ebp-0x34],eax
  408d72:	push   0x1f
  408d74:	mov    DWORD PTR [ebp-0x2c],ebx
  408d77:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408d78:	lea    ecx,[eax+0x1]
  408d7b:	mov    eax,ecx
  408d7d:	cdq
  408d7e:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408d7f:	pop    esi
  408d80:	and    edx,esi
  408d82:	add    edx,eax
  408d84:	sar    edx,0x5
  408d87:	mov    DWORD PTR [ebp-0x3c],edx
  408d8a:	and    ecx,0x8000001f
  408d90:	jns    0x408d97
  408d92:	dec    ecx
  408d93:	or     ecx,0xffffffe0
  408d96:	inc    ecx
  408d97:	sub    esi,ecx
  408d99:	xor    eax,eax
  408d9b:	inc    eax
  408d9c:	mov    DWORD PTR [ebp-0x30],esi
  408d9f:	mov    ecx,esi
  408da1:	or     edi,0xffffffff
  408da4:	shl    eax,cl
  408da6:	push   0x3
  408da8:	pop    esi
  408da9:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408dad:	je     0x408e57
  408db3:	mov    eax,edi
  408db5:	shl    eax,cl
  408db7:	not    eax
  408db9:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408dbd:	jmp    0x408dc3
  408dbf:	cmp    DWORD PTR [ebp+edx*4-0x10],ebx
  408dc3:	jne    0x408dcf
  408dc5:	inc    edx
  408dc6:	cmp    edx,esi
  408dc8:	jl     0x408dbf
  408dca:	jmp    0x408e54
  408dcf:	mov    eax,DWORD PTR [ebp-0x34]
  408dd2:	cdq
  408dd3:	push   0x1f
  408dd5:	pop    ecx
  408dd6:	and    edx,ecx
  408dd8:	add    edx,eax
  408dda:	mov    eax,DWORD PTR [ebp-0x34]
  408ddd:	sar    edx,0x5
  408de0:	and    eax,0x8000001f
  408de5:	jns    0x408dec
  408de7:	dec    eax
  408de8:	or     eax,0xffffffe0
  408deb:	inc    eax
  408dec:	sub    ecx,eax
  408dee:	mov    DWORD PTR [ebp-0x2c],ebx
  408df1:	xor    eax,eax
  408df3:	inc    eax
  408df4:	shl    eax,cl
  408df6:	mov    DWORD PTR [ebp-0x38],eax
  408df9:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408dfd:	mov    ecx,DWORD PTR [ebp-0x38]
  408e00:	add    ecx,eax
  408e02:	mov    DWORD PTR [ebp-0x28],ecx
  408e05:	cmp    ecx,eax
  408e07:	mov    eax,DWORD PTR [ebp-0x28]
  408e0a:	mov    ecx,ebx
  408e0c:	push   0xffffffff
  408e0e:	pop    edi
  408e0f:	jb     0x408e16
  408e11:	cmp    eax,DWORD PTR [ebp-0x38]
  408e14:	jae    0x408e1c
  408e16:	xor    ecx,ecx
  408e18:	inc    ecx
  408e19:	mov    DWORD PTR [ebp-0x2c],ecx
  408e1c:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  408e20:	dec    edx
  408e21:	js     0x408e51
  408e23:	test   ecx,ecx
  408e25:	je     0x408e4e
  408e27:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408e2b:	mov    ecx,ebx
  408e2d:	mov    DWORD PTR [ebp-0x2c],ebx
  408e30:	lea    edi,[eax+0x1]
  408e33:	cmp    edi,eax
  408e35:	mov    DWORD PTR [ebp-0x28],edi
  408e38:	mov    eax,edi
  408e3a:	jb     0x408e41
  408e3c:	cmp    eax,0x1
  408e3f:	jae    0x408e47
  408e41:	xor    ecx,ecx
  408e43:	inc    ecx
  408e44:	mov    DWORD PTR [ebp-0x2c],ecx
  408e47:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  408e4b:	dec    edx
  408e4c:	jns    0x408e23
  408e4e:	or     edi,0xffffffff
  408e51:	mov    ecx,DWORD PTR [ebp-0x30]
  408e54:	mov    edx,DWORD PTR [ebp-0x3c]
  408e57:	mov    eax,edi
  408e59:	shl    eax,cl
  408e5b:	and    DWORD PTR [ebp+edx*4-0x10],eax
  408e5f:	lea    eax,[edx+0x1]
  408e62:	cmp    eax,esi
  408e64:	jge    0x408e77
  408e66:	lea    edi,[ebp-0x10]
  408e69:	mov    ecx,esi
  408e6b:	lea    edi,[edi+eax*4]
  408e6e:	sub    ecx,eax
  408e70:	xor    eax,eax
  408e72:	rep stos DWORD PTR es:[edi],eax
  408e74:	or     edi,0xffffffff
  408e77:	mov    ecx,DWORD PTR [ebp-0x20]
  408e7a:	cmp    DWORD PTR [ebp-0x2c],ebx
  408e7d:	je     0x408e80
  408e7f:	inc    ecx
  408e80:	mov    edx,DWORD PTR ds:0x412dc4
  408e86:	mov    eax,edx
  408e88:	sub    eax,DWORD PTR ds:0x412dc8
  408e8e:	cmp    ecx,eax
  408e90:	jge    0x408ea1
  408e92:	xor    eax,eax
  408e94:	lea    edi,[ebp-0x10]
  408e97:	stos   DWORD PTR es:[edi],eax
  408e98:	stos   DWORD PTR es:[edi],eax
  408e99:	stos   DWORD PTR es:[edi],eax
  408e9a:	mov    esi,ebx
  408e9c:	jmp    0x408d57
  408ea1:	cmp    ecx,edx
  408ea3:	jg     0x4090c2
  408ea9:	sub    edx,DWORD PTR [ebp-0x24]
  408eac:	lea    esi,[ebp-0x1c]
  408eaf:	mov    DWORD PTR [ebp-0x30],edx
  408eb2:	lea    edi,[ebp-0x10]
  408eb5:	mov    eax,edx
  408eb7:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408eb8:	cdq
  408eb9:	and    edx,0x1f
  408ebc:	add    eax,edx
  408ebe:	sar    eax,0x5
  408ec1:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408ec2:	mov    DWORD PTR [ebp-0x3c],eax
  408ec5:	mov    eax,DWORD PTR [ebp-0x30]
  408ec8:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  408ec9:	and    eax,0x8000001f
  408ece:	jns    0x408ed5
  408ed0:	dec    eax
  408ed1:	or     eax,0xffffffe0
  408ed4:	inc    eax
  408ed5:	mov    DWORD PTR [ebp-0x30],eax
  408ed8:	or     edi,0xffffffff
  408edb:	mov    eax,edi
  408edd:	mov    DWORD PTR [ebp-0x20],ebx
  408ee0:	mov    edi,DWORD PTR [ebp-0x30]
  408ee3:	mov    ecx,edi
  408ee5:	shl    eax,cl
  408ee7:	not    eax
  408ee9:	push   0x20
  408eeb:	mov    DWORD PTR [ebp-0x28],eax
  408eee:	pop    eax
  408eef:	sub    eax,edi
  408ef1:	push   0x3
  408ef3:	mov    DWORD PTR [ebp-0x38],eax
  408ef6:	pop    esi
  408ef7:	mov    edx,DWORD PTR [ebp+ebx*4-0x10]
  408efb:	mov    ecx,edi
  408efd:	mov    eax,edx
  408eff:	shr    edx,cl
  408f01:	or     edx,DWORD PTR [ebp-0x20]
  408f04:	and    eax,DWORD PTR [ebp-0x28]
  408f07:	mov    ecx,DWORD PTR [ebp-0x38]
  408f0a:	shl    eax,cl
  408f0c:	mov    DWORD PTR [ebp+ebx*4-0x10],edx
  408f10:	inc    ebx
  408f11:	mov    DWORD PTR [ebp-0x20],eax
  408f14:	cmp    ebx,esi
  408f16:	jl     0x408ef7
  408f18:	mov    eax,DWORD PTR [ebp-0x3c]
  408f1b:	lea    edx,[ebp-0x8]
  408f1e:	shl    eax,0x2
  408f21:	xor    ebx,ebx
  408f23:	push   0x2
  408f25:	sub    edx,eax
  408f27:	or     edi,0xffffffff
  408f2a:	mov    eax,DWORD PTR [ebp-0x3c]
  408f2d:	pop    ecx
  408f2e:	cmp    ecx,eax
  408f30:	jl     0x408f3d
  408f32:	mov    eax,DWORD PTR [edx]
  408f34:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  408f38:	mov    eax,DWORD PTR [ebp-0x3c]
  408f3b:	jmp    0x408f41
  408f3d:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  408f41:	sub    edx,0x4
  408f44:	dec    ecx
  408f45:	jns    0x408f2e
  408f47:	mov    ecx,DWORD PTR [ebp-0x34]
  408f4a:	inc    ecx
  408f4b:	mov    eax,ecx
  408f4d:	cdq
  408f4e:	and    edx,0x1f
  408f51:	add    edx,eax
  408f53:	sar    edx,0x5
  408f56:	mov    DWORD PTR [ebp-0x2c],edx
  408f59:	and    ecx,0x8000001f
  408f5f:	jns    0x408f66
  408f61:	dec    ecx
  408f62:	or     ecx,0xffffffe0
  408f65:	inc    ecx
  408f66:	push   0x1f
  408f68:	pop    eax
  408f69:	sub    eax,ecx
  408f6b:	mov    DWORD PTR [ebp-0x30],eax
  408f6e:	xor    eax,eax
  408f70:	mov    ecx,DWORD PTR [ebp-0x30]
  408f73:	inc    eax
  408f74:	shl    eax,cl
  408f76:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408f7a:	je     0x409012
  408f80:	mov    eax,edi
  408f82:	shl    eax,cl
  408f84:	not    eax
  408f86:	test   DWORD PTR [ebp+edx*4-0x10],eax
  408f8a:	jmp    0x408f90
  408f8c:	cmp    DWORD PTR [ebp+edx*4-0x10],ebx
  408f90:	jne    0x408f99
  408f92:	inc    edx
  408f93:	cmp    edx,esi
  408f95:	jl     0x408f8c
  408f97:	jmp    0x40900f
  408f99:	mov    edi,DWORD PTR [ebp-0x34]
  408f9c:	mov    eax,edi
  408f9e:	push   0x1f
  408fa0:	cdq
  408fa1:	pop    ecx
  408fa2:	and    edx,ecx
  408fa4:	add    edx,eax
  408fa6:	sar    edx,0x5
  408fa9:	and    edi,0x8000001f
  408faf:	jns    0x408fb6
  408fb1:	dec    edi
  408fb2:	or     edi,0xffffffe0
  408fb5:	inc    edi
  408fb6:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408fba:	sub    ecx,edi
  408fbc:	xor    edi,edi
  408fbe:	inc    edi
  408fbf:	shl    edi,cl
  408fc1:	mov    ecx,ebx
  408fc3:	mov    DWORD PTR [ebp-0x24],edi
  408fc6:	add    edi,eax
  408fc8:	mov    DWORD PTR [ebp-0x20],edi
  408fcb:	cmp    edi,eax
  408fcd:	mov    eax,DWORD PTR [ebp-0x20]
  408fd0:	push   0xffffffff
  408fd2:	pop    edi
  408fd3:	jb     0x408fda
  408fd5:	cmp    eax,DWORD PTR [ebp-0x24]
  408fd8:	jae    0x408fdd
  408fda:	xor    ecx,ecx
  408fdc:	inc    ecx
  408fdd:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  408fe1:	dec    edx
  408fe2:	js     0x40900c
  408fe4:	test   ecx,ecx
  408fe6:	je     0x409009
  408fe8:	mov    eax,DWORD PTR [ebp+edx*4-0x10]
  408fec:	mov    ecx,ebx
  408fee:	lea    edi,[eax+0x1]
  408ff1:	cmp    edi,eax
  408ff3:	mov    DWORD PTR [ebp-0x20],edi
  408ff6:	mov    eax,edi
  408ff8:	jb     0x408fff
  408ffa:	cmp    eax,0x1
  408ffd:	jae    0x409002
  408fff:	xor    ecx,ecx
  409001:	inc    ecx
  409002:	mov    DWORD PTR [ebp+edx*4-0x10],eax
  409006:	dec    edx
  409007:	jns    0x408fe4
  409009:	or     edi,0xffffffff
  40900c:	mov    ecx,DWORD PTR [ebp-0x30]
  40900f:	mov    edx,DWORD PTR [ebp-0x2c]
  409012:	mov    eax,edi
  409014:	shl    eax,cl
  409016:	and    DWORD PTR [ebp+edx*4-0x10],eax
  40901a:	inc    edx
  40901b:	cmp    edx,esi
  40901d:	jge    0x409030
  40901f:	lea    edi,[ebp-0x10]
  409022:	mov    ecx,esi
  409024:	lea    edi,[edi+edx*4]
  409027:	sub    ecx,edx
  409029:	xor    eax,eax
  40902b:	rep stos DWORD PTR es:[edi],eax
  40902d:	or     edi,0xffffffff
  409030:	mov    ecx,DWORD PTR ds:0x412dcc
  409036:	inc    ecx
  409037:	mov    eax,ecx
  409039:	cdq
  40903a:	and    edx,0x1f
  40903d:	add    eax,edx
  40903f:	sar    eax,0x5
  409042:	mov    DWORD PTR [ebp-0x28],eax
  409045:	and    ecx,0x8000001f
  40904b:	jns    0x409052
  40904d:	dec    ecx
  40904e:	or     ecx,0xffffffe0
  409051:	inc    ecx
  409052:	mov    DWORD PTR [ebp-0x24],ecx
  409055:	mov    eax,ebx
  409057:	shl    edi,cl
  409059:	push   0x20
  40905b:	mov    DWORD PTR [ebp-0x20],ebx
  40905e:	not    edi
  409060:	mov    ebx,DWORD PTR [ebp-0x24]
  409063:	pop    ecx
  409064:	sub    ecx,ebx
  409066:	mov    DWORD PTR [ebp-0x34],eax
  409069:	mov    DWORD PTR [ebp-0x24],ecx
  40906c:	mov    edx,DWORD PTR [ebp+eax*4-0x10]
  409070:	mov    ecx,ebx
  409072:	mov    eax,edx
  409074:	shr    edx,cl
  409076:	mov    ecx,DWORD PTR [ebp-0x34]
  409079:	and    eax,edi
  40907b:	or     edx,DWORD PTR [ebp-0x20]
  40907e:	mov    DWORD PTR [ebp+ecx*4-0x10],edx
  409082:	mov    ecx,DWORD PTR [ebp-0x24]
  409085:	shl    eax,cl
  409087:	mov    DWORD PTR [ebp-0x20],eax
  40908a:	mov    eax,DWORD PTR [ebp-0x34]
  40908d:	inc    eax
  40908e:	mov    DWORD PTR [ebp-0x34],eax
  409091:	cmp    eax,esi
  409093:	jl     0x40906c
  409095:	mov    esi,DWORD PTR [ebp-0x28]
  409098:	lea    edx,[ebp-0x8]
  40909b:	mov    eax,esi
  40909d:	shl    eax,0x2
  4090a0:	push   0x2
  4090a2:	sub    edx,eax
  4090a4:	xor    ebx,ebx
  4090a6:	pop    ecx
  4090a7:	cmp    ecx,esi
  4090a9:	jl     0x4090b3
  4090ab:	mov    eax,DWORD PTR [edx]
  4090ad:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  4090b1:	jmp    0x4090b7
  4090b3:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  4090b7:	sub    edx,0x4
  4090ba:	dec    ecx
  4090bb:	jns    0x4090a7
  4090bd:	jmp    0x408e9a
  4090c2:	cmp    ecx,DWORD PTR ds:0x412dc0
  4090c8:	jl     0x409170
  4090ce:	mov    ecx,DWORD PTR ds:0x412dcc
  4090d4:	lea    edi,[ebp-0x10]
  4090d7:	xor    eax,eax
  4090d9:	stos   DWORD PTR es:[edi],eax
  4090da:	stos   DWORD PTR es:[edi],eax
  4090db:	stos   DWORD PTR es:[edi],eax
  4090dc:	mov    eax,ecx
  4090de:	or     DWORD PTR [ebp-0x10],0x80000000
  4090e5:	cdq
  4090e6:	and    edx,0x1f
  4090e9:	add    eax,edx
  4090eb:	sar    eax,0x5
  4090ee:	mov    DWORD PTR [ebp-0x34],eax
  4090f1:	and    ecx,0x8000001f
  4090f7:	jns    0x4090fe
  4090f9:	dec    ecx
  4090fa:	or     ecx,0xffffffe0
  4090fd:	inc    ecx
  4090fe:	or     edi,0xffffffff
  409101:	mov    DWORD PTR [ebp-0x38],ecx
  409104:	push   0x20
  409106:	shl    edi,cl
  409108:	pop    eax
  409109:	sub    eax,ecx
  40910b:	mov    DWORD PTR [ebp-0x20],ebx
  40910e:	not    edi
  409110:	mov    DWORD PTR [ebp-0x28],eax
  409113:	mov    edx,DWORD PTR [ebp+ebx*4-0x10]
  409117:	mov    eax,edx
  409119:	shr    edx,cl
  40911b:	and    eax,edi
  40911d:	or     edx,DWORD PTR [ebp-0x20]
  409120:	mov    ecx,DWORD PTR [ebp-0x28]
  409123:	shl    eax,cl
  409125:	mov    ecx,DWORD PTR [ebp-0x38]
  409128:	mov    DWORD PTR [ebp+ebx*4-0x10],edx
  40912c:	inc    ebx
  40912d:	mov    DWORD PTR [ebp-0x20],eax
  409130:	cmp    ebx,esi
  409132:	jl     0x409113
  409134:	mov    esi,DWORD PTR [ebp-0x34]
  409137:	lea    edx,[ebp-0x8]
  40913a:	mov    eax,esi
  40913c:	shl    eax,0x2
  40913f:	push   0x2
  409141:	sub    edx,eax
  409143:	xor    ebx,ebx
  409145:	pop    ecx
  409146:	cmp    ecx,esi
  409148:	jl     0x409152
  40914a:	mov    eax,DWORD PTR [edx]
  40914c:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  409150:	jmp    0x409156
  409152:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  409156:	sub    edx,0x4
  409159:	dec    ecx
  40915a:	jns    0x409146
  40915c:	mov    esi,DWORD PTR ds:0x412dd4
  409162:	xor    ebx,ebx
  409164:	add    esi,DWORD PTR ds:0x412dc0
  40916a:	inc    ebx
  40916b:	jmp    0x409205
  409170:	mov    esi,DWORD PTR ds:0x412dd4
  409176:	and    DWORD PTR [ebp-0x10],0x7fffffff
  40917d:	add    esi,ecx
  40917f:	mov    ecx,DWORD PTR ds:0x412dcc
  409185:	mov    eax,ecx
  409187:	cdq
  409188:	and    edx,0x1f
  40918b:	mov    DWORD PTR [ebp-0x38],esi
  40918e:	add    eax,edx
  409190:	sar    eax,0x5
  409193:	mov    DWORD PTR [ebp-0x28],eax
  409196:	and    ecx,0x8000001f
  40919c:	jns    0x4091a3
  40919e:	dec    ecx
  40919f:	or     ecx,0xffffffe0
  4091a2:	inc    ecx
  4091a3:	push   0x20
  4091a5:	mov    DWORD PTR [ebp-0x20],ebx
  4091a8:	mov    esi,ebx
  4091aa:	shl    edi,cl
  4091ac:	mov    ebx,ecx
  4091ae:	pop    eax
  4091af:	sub    eax,ebx
  4091b1:	mov    DWORD PTR [ebp-0x24],ecx
  4091b4:	not    edi
  4091b6:	mov    DWORD PTR [ebp-0x24],eax
  4091b9:	mov    edx,DWORD PTR [ebp+esi*4-0x10]
  4091bd:	mov    ecx,ebx
  4091bf:	mov    eax,edx
  4091c1:	shr    edx,cl
  4091c3:	or     edx,DWORD PTR [ebp-0x20]
  4091c6:	and    eax,edi
  4091c8:	mov    ecx,DWORD PTR [ebp-0x24]
  4091cb:	shl    eax,cl
  4091cd:	mov    DWORD PTR [ebp+esi*4-0x10],edx
  4091d1:	inc    esi
  4091d2:	mov    DWORD PTR [ebp-0x20],eax
  4091d5:	cmp    esi,0x3
  4091d8:	jl     0x4091b9
  4091da:	mov    edi,DWORD PTR [ebp-0x28]
  4091dd:	lea    edx,[ebp-0x8]
  4091e0:	mov    esi,DWORD PTR [ebp-0x38]
  4091e3:	mov    eax,edi
  4091e5:	shl    eax,0x2
  4091e8:	push   0x2
  4091ea:	sub    edx,eax
  4091ec:	xor    ebx,ebx
  4091ee:	pop    ecx
  4091ef:	cmp    ecx,edi
  4091f1:	jl     0x4091fb
  4091f3:	mov    eax,DWORD PTR [edx]
  4091f5:	mov    DWORD PTR [ebp+ecx*4-0x10],eax
  4091f9:	jmp    0x4091ff
  4091fb:	mov    DWORD PTR [ebp+ecx*4-0x10],ebx
  4091ff:	sub    edx,0x4
  409202:	dec    ecx
  409203:	jns    0x4091ef
  409205:	mov    edi,DWORD PTR [ebp-0x40]
  409208:	push   0x1f
  40920a:	pop    eax
  40920b:	sub    eax,DWORD PTR ds:0x412dcc
  409211:	mov    ecx,eax
  409213:	mov    eax,DWORD PTR [ebp-0x44]
  409216:	shl    esi,cl
  409218:	neg    eax
  40921a:	sbb    eax,eax
  40921c:	and    eax,0x80000000
  409221:	or     esi,eax
  409223:	mov    eax,ds:0x412dd0
  409228:	or     esi,DWORD PTR [ebp-0x10]
  40922b:	cmp    eax,0x40
  40922e:	jne    0x40923a
  409230:	mov    eax,DWORD PTR [ebp-0xc]
  409233:	mov    DWORD PTR [edi+0x4],esi
  409236:	mov    DWORD PTR [edi],eax
  409238:	jmp    0x409241
  40923a:	cmp    eax,0x20
  40923d:	jne    0x409241
  40923f:	mov    DWORD PTR [edi],esi
  409241:	mov    ecx,DWORD PTR [ebp-0x4]
  409244:	mov    eax,ebx
  409246:	pop    edi
  409247:	pop    esi
  409248:	xor    ecx,ebp
  40924a:	pop    ebx
  40924b:	call   0x40120d
  409250:	mov    esp,ebp
  409252:	pop    ebp
  409253:	ret
  409254:	push   ebp
  409255:	mov    ebp,esp
  409257:	sub    esp,0x80
  40925d:	mov    eax,ds:0x412000
  409262:	xor    eax,ebp
  409264:	mov    DWORD PTR [ebp-0x4],eax
  409267:	mov    eax,DWORD PTR [ebp+0x8]
  40926a:	mov    DWORD PTR [ebp-0x80],eax
  40926d:	mov    eax,DWORD PTR [ebp+0xc]
  409270:	mov    DWORD PTR [ebp-0x68],eax
  409273:	xor    eax,eax
  409275:	push   ebx
  409276:	xor    ebx,ebx
  409278:	inc    eax
  409279:	push   esi
  40927a:	mov    DWORD PTR [ebp-0x6c],eax
  40927d:	mov    esi,ebx
  40927f:	mov    eax,ebx
  409281:	mov    DWORD PTR [ebp-0x70],ebx
  409284:	push   edi
  409285:	lea    edi,[ebp-0x20]
  409288:	mov    DWORD PTR [ebp-0x4c],ebx
  40928b:	mov    DWORD PTR [ebp-0x60],ebx
  40928e:	mov    DWORD PTR [ebp-0x5c],ebx
  409291:	mov    DWORD PTR [ebp-0x64],ebx
  409294:	mov    DWORD PTR [ebp-0x54],ebx
  409297:	cmp    DWORD PTR [ebp+0x24],eax
  40929a:	jne    0x4092b3
  40929c:	call   0x402568
  4092a1:	mov    DWORD PTR [eax],0x16
  4092a7:	call   0x4016b6
  4092ac:	xor    eax,eax
  4092ae:	jmp    0x4099bb
  4092b3:	mov    edx,DWORD PTR [ebp+0x10]
  4092b6:	mov    ecx,edx
  4092b8:	mov    DWORD PTR [ebp-0x50],ecx
  4092bb:	mov    cl,BYTE PTR [edx]
  4092bd:	cmp    cl,0x20
  4092c0:	je     0x4092d1
  4092c2:	cmp    cl,0x9
  4092c5:	je     0x4092d1
  4092c7:	cmp    cl,0xa
  4092ca:	je     0x4092d1
  4092cc:	cmp    cl,0xd
  4092cf:	jne    0x4092d4
  4092d1:	inc    edx
  4092d2:	jmp    0x4092bb
  4092d4:	mov    cl,BYTE PTR [edx]
  4092d6:	inc    edx
  4092d7:	mov    BYTE PTR [ebp-0x55],cl
  4092da:	cmp    eax,0xb
  4092dd:	ja     0x40955e
  4092e3:	jmp    DWORD PTR [eax*4+0x4099cc]
  4092ea:	lea    eax,[ecx-0x31]
  4092ed:	cmp    al,0x8
  4092ef:	ja     0x4092f7
  4092f1:	push   0x3
  4092f3:	pop    eax
  4092f4:	dec    edx
  4092f5:	jmp    0x4092d4
  4092f7:	mov    eax,DWORD PTR [ebp+0x24]
  4092fa:	mov    eax,DWORD PTR [eax]
  4092fc:	mov    eax,DWORD PTR [eax+0x84]
  409302:	mov    eax,DWORD PTR [eax]
  409304:	cmp    cl,BYTE PTR [eax]
  409306:	jne    0x40930d
  409308:	push   0x5
  40930a:	pop    eax
  40930b:	jmp    0x4092d4
  40930d:	movsx  eax,cl
  409310:	sub    eax,0x2b
  409313:	je     0x409334
  409315:	dec    eax
  409316:	dec    eax
  409317:	je     0x409327
  409319:	sub    eax,0x3
  40931c:	jne    0x4095b0
  409322:	xor    eax,eax
  409324:	inc    eax
  409325:	jmp    0x4092d4
  409327:	push   0x2
  409329:	mov    ecx,0x8000
  40932e:	pop    eax
  40932f:	mov    DWORD PTR [ebp-0x70],ecx
  409332:	jmp    0x4092d4
  409334:	push   0x2
  409336:	pop    eax
  409337:	mov    DWORD PTR [ebp-0x70],ebx
  40933a:	jmp    0x4092d4
  40933c:	xor    eax,eax
  40933e:	inc    eax
  40933f:	mov    DWORD PTR [ebp-0x60],eax
  409342:	lea    eax,[ecx-0x31]
  409345:	cmp    al,0x8
  409347:	jbe    0x4092f1
  409349:	mov    eax,DWORD PTR [ebp+0x24]
  40934c:	mov    eax,DWORD PTR [eax]
  40934e:	mov    eax,DWORD PTR [eax+0x84]
  409354:	mov    eax,DWORD PTR [eax]
  409356:	cmp    cl,BYTE PTR [eax]
  409358:	jne    0x40935e
  40935a:	push   0x4
  40935c:	jmp    0x40930a
  40935e:	cmp    cl,0x2b
  409361:	je     0x40938e
  409363:	cmp    cl,0x2d
  409366:	je     0x40938e
  409368:	cmp    cl,0x30
  40936b:	je     0x409322
  40936d:	cmp    cl,0x43
  409370:	jle    0x4095b0
  409376:	cmp    cl,0x45
  409379:	jle    0x409387
  40937b:	sub    cl,0x64
  40937e:	cmp    cl,0x1
  409381:	ja     0x4095b0
  409387:	push   0x6
  409389:	jmp    0x40930a
  40938e:	dec    edx
  40938f:	push   0xb
  409391:	jmp    0x40930a
  409396:	lea    eax,[ecx-0x31]
  409399:	cmp    al,0x8
  40939b:	jbe    0x4092f1
  4093a1:	mov    eax,DWORD PTR [ebp+0x24]
  4093a4:	mov    eax,DWORD PTR [eax]
  4093a6:	mov    eax,DWORD PTR [eax+0x84]
  4093ac:	mov    eax,DWORD PTR [eax]
  4093ae:	cmp    cl,BYTE PTR [eax]
  4093b0:	je     0x409308
  4093b6:	cmp    cl,0x30
  4093b9:	je     0x409322
  4093bf:	mov    edx,DWORD PTR [ebp-0x50]
  4093c2:	jmp    0x4095b1
  4093c7:	xor    eax,eax
  4093c9:	inc    eax
  4093ca:	mov    DWORD PTR [ebp-0x60],eax
  4093cd:	cmp    cl,0x30
  4093d0:	jl     0x4093fc
  4093d2:	mov    eax,DWORD PTR [ebp-0x4c]
  4093d5:	mov    esi,DWORD PTR [ebp-0x54]
  4093d8:	cmp    cl,0x39
  4093db:	jg     0x4093f4
  4093dd:	cmp    eax,0x19
  4093e0:	jae    0x4093eb
  4093e2:	sub    cl,0x30
  4093e5:	inc    eax
  4093e6:	mov    BYTE PTR [edi],cl
  4093e8:	inc    edi
  4093e9:	jmp    0x4093ec
  4093eb:	inc    esi
  4093ec:	mov    cl,BYTE PTR [edx]
  4093ee:	inc    edx
  4093ef:	cmp    cl,0x30
  4093f2:	jge    0x4093d8
  4093f4:	mov    DWORD PTR [ebp-0x54],esi
  4093f7:	mov    esi,ebx
  4093f9:	mov    DWORD PTR [ebp-0x4c],eax
  4093fc:	mov    eax,DWORD PTR [ebp+0x24]
  4093ff:	mov    eax,DWORD PTR [eax]
  409401:	mov    eax,DWORD PTR [eax+0x84]
  409407:	mov    eax,DWORD PTR [eax]
  409409:	cmp    cl,BYTE PTR [eax]
  40940b:	je     0x40935a
  409411:	cmp    cl,0x2b
  409414:	je     0x40938e
  40941a:	cmp    cl,0x2d
  40941d:	je     0x40938e
  409423:	jmp    0x40936d
  409428:	xor    eax,eax
  40942a:	inc    eax
  40942b:	mov    DWORD PTR [ebp-0x60],eax
  40942e:	mov    DWORD PTR [ebp-0x5c],eax
  409431:	mov    eax,DWORD PTR [ebp-0x4c]
  409434:	test   eax,eax
  409436:	jne    0x40944f
  409438:	cmp    cl,0x30
  40943b:	jne    0x409452
  40943d:	mov    eax,DWORD PTR [ebp-0x54]
  409440:	mov    cl,BYTE PTR [edx]
  409442:	dec    eax
  409443:	inc    edx
  409444:	cmp    cl,0x30
  409447:	je     0x409440
  409449:	mov    DWORD PTR [ebp-0x54],eax
  40944c:	mov    eax,DWORD PTR [ebp-0x4c]
  40944f:	cmp    cl,0x30
  409452:	jl     0x409479
  409454:	mov    esi,DWORD PTR [ebp-0x54]
  409457:	cmp    cl,0x39
  40945a:	jg     0x409471
  40945c:	cmp    eax,0x19
  40945f:	jae    0x409469
  409461:	sub    cl,0x30
  409464:	inc    eax
  409465:	mov    BYTE PTR [edi],cl
  409467:	inc    edi
  409468:	dec    esi
  409469:	mov    cl,BYTE PTR [edx]
  40946b:	inc    edx
  40946c:	cmp    cl,0x30
  40946f:	jge    0x409457
  409471:	mov    DWORD PTR [ebp-0x54],esi
  409474:	mov    esi,ebx
  409476:	mov    DWORD PTR [ebp-0x4c],eax
  409479:	cmp    cl,0x2b
  40947c:	je     0x40938e
  409482:	cmp    cl,0x2d
  409485:	je     0x40938e
  40948b:	cmp    cl,0x43
  40948e:	jle    0x4094a5
  409490:	cmp    cl,0x45
  409493:	jle    0x409387
  409499:	sub    cl,0x64
  40949c:	cmp    cl,0x1
  40949f:	jbe    0x409387
  4094a5:	dec    edx
  4094a6:	jmp    0x4095b4
  4094ab:	xor    eax,eax
  4094ad:	sub    cl,0x30
  4094b0:	inc    eax
  4094b1:	mov    DWORD PTR [ebp-0x5c],eax
  4094b4:	cmp    cl,0x9
  4094b7:	ja     0x4093bf
  4094bd:	push   0x4
  4094bf:	jmp    0x4092f3
  4094c4:	lea    eax,[edx-0x2]
  4094c7:	mov    DWORD PTR [ebp-0x50],eax
  4094ca:	lea    eax,[ecx-0x31]
  4094cd:	cmp    al,0x8
  4094cf:	ja     0x4094d8
  4094d1:	push   0x9
  4094d3:	jmp    0x4092f3
  4094d8:	movsx  eax,cl
  4094db:	sub    eax,0x2b
  4094de:	je     0x409502
  4094e0:	dec    eax
  4094e1:	dec    eax
  4094e2:	je     0x4094f4
  4094e4:	sub    eax,0x3
  4094e7:	jne    0x4093bf
  4094ed:	push   0x8
  4094ef:	jmp    0x40930a
  4094f4:	push   0x7
  4094f6:	or     ecx,0xffffffff
  4094f9:	pop    eax
  4094fa:	mov    DWORD PTR [ebp-0x6c],ecx
  4094fd:	jmp    0x4092d4
  409502:	push   0x7
  409504:	jmp    0x40930a
  409509:	xor    eax,eax
  40950b:	inc    eax
  40950c:	mov    DWORD PTR [ebp-0x64],eax
  40950f:	jmp    0x409514
  409511:	mov    cl,BYTE PTR [edx]
  409513:	inc    edx
  409514:	cmp    cl,0x30
  409517:	je     0x409511
  409519:	sub    cl,0x31
  40951c:	cmp    cl,0x8
  40951f:	ja     0x4095b0
  409525:	jmp    0x4094d1
  409527:	lea    eax,[ecx-0x31]
  40952a:	cmp    al,0x8
  40952c:	jbe    0x4094d1
  40952e:	cmp    cl,0x30
  409531:	jmp    0x4094e7
  409533:	cmp    DWORD PTR [ebp+0x20],ebx
  409536:	je     0x40955a
  409538:	lea    eax,[edx-0x1]
  40953b:	mov    DWORD PTR [ebp-0x50],eax
  40953e:	movsx  eax,cl
  409541:	sub    eax,0x2b
  409544:	je     0x409502
  409546:	dec    eax
  409547:	dec    eax
  409548:	jne    0x4093bf
  40954e:	or     DWORD PTR [ebp-0x6c],0xffffffff
  409552:	push   0x7
  409554:	pop    eax
  409555:	jmp    0x4092d4
  40955a:	push   0xa
  40955c:	pop    eax
  40955d:	dec    edx
  40955e:	cmp    eax,0xa
  409561:	jne    0x4092d4
  409567:	jmp    0x4095b1
  409569:	xor    eax,eax
  40956b:	mov    esi,ebx
  40956d:	inc    eax
  40956e:	mov    DWORD PTR [ebp-0x64],eax
  409571:	jmp    0x409592
  409573:	cmp    cl,0x39
  409576:	jg     0x4095ab
  409578:	imul   ecx,esi,0xa
  40957b:	movsx  esi,BYTE PTR [ebp-0x55]
  40957f:	add    esi,0xffffffd0
  409582:	add    esi,ecx
  409584:	cmp    esi,0x1450
  40958a:	jg     0x409599
  40958c:	mov    cl,BYTE PTR [edx]
  40958e:	inc    edx
  40958f:	mov    BYTE PTR [ebp-0x55],cl
  409592:	cmp    cl,0x30
  409595:	jge    0x409573
  409597:	jmp    0x4095ab
  409599:	mov    cl,BYTE PTR [ebp-0x55]
  40959c:	mov    esi,0x1451
  4095a1:	jmp    0x4095ab
  4095a3:	cmp    cl,0x39
  4095a6:	jg     0x4095b0
  4095a8:	mov    cl,BYTE PTR [edx]
  4095aa:	inc    edx
  4095ab:	cmp    cl,0x30
  4095ae:	jge    0x4095a3
  4095b0:	dec    edx
  4095b1:	mov    eax,DWORD PTR [ebp-0x4c]
  4095b4:	mov    ecx,DWORD PTR [ebp-0x68]
  4095b7:	mov    DWORD PTR [ecx],edx
  4095b9:	mov    ecx,DWORD PTR [ebp-0x60]
  4095bc:	test   ecx,ecx
  4095be:	je     0x40999b
  4095c4:	cmp    eax,0x18
  4095c7:	jbe    0x4095e2
  4095c9:	mov    al,BYTE PTR [ebp-0x9]
  4095cc:	cmp    al,0x5
  4095ce:	jl     0x4095d5
  4095d0:	inc    al
  4095d2:	mov    BYTE PTR [ebp-0x9],al
  4095d5:	mov    ecx,DWORD PTR [ebp-0x54]
  4095d8:	dec    edi
  4095d9:	push   0x18
  4095db:	inc    ecx
  4095dc:	pop    eax
  4095dd:	mov    DWORD PTR [ebp-0x54],ecx
  4095e0:	jmp    0x4095e5
  4095e2:	mov    ecx,DWORD PTR [ebp-0x54]
  4095e5:	test   eax,eax
  4095e7:	je     0x409991
  4095ed:	dec    edi
  4095ee:	cmp    BYTE PTR [edi],bl
  4095f0:	jne    0x4095fc
  4095f2:	dec    eax
  4095f3:	inc    ecx
  4095f4:	dec    edi
  4095f5:	cmp    BYTE PTR [edi],bl
  4095f7:	je     0x4095f2
  4095f9:	mov    DWORD PTR [ebp-0x54],ecx
  4095fc:	lea    ecx,[ebp-0x3c]
  4095ff:	push   ecx
  409600:	push   eax
  409601:	lea    eax,[ebp-0x20]
  409604:	push   eax
  409605:	call   0x40a4c1
  40960a:	mov    ecx,DWORD PTR [ebp-0x6c]
  40960d:	add    esp,0xc
  409610:	test   ecx,ecx
  409612:	jns    0x409616
  409614:	neg    esi
  409616:	add    esi,DWORD PTR [ebp-0x54]
  409619:	mov    eax,DWORD PTR [ebp-0x64]
  40961c:	test   eax,eax
  40961e:	jne    0x409623
  409620:	add    esi,DWORD PTR [ebp+0x18]
  409623:	mov    eax,DWORD PTR [ebp-0x5c]
  409626:	test   eax,eax
  409628:	jne    0x40962d
  40962a:	sub    esi,DWORD PTR [ebp+0x1c]
  40962d:	cmp    esi,0x1450
  409633:	jg     0x409983
  409639:	cmp    esi,0xffffebb0
  40963f:	jl     0x409974
  409645:	mov    edx,0x412dd8
  40964a:	sub    edx,0x60
  40964d:	test   esi,esi
  40964f:	je     0x409962
  409655:	jns    0x409661
  409657:	mov    edx,0x412f38
  40965c:	neg    esi
  40965e:	sub    edx,0x60
  409661:	cmp    DWORD PTR [ebp+0x14],ebx
  409664:	jne    0x40995a
  40966a:	xor    eax,eax
  40966c:	mov    WORD PTR [ebp-0x3c],ax
  409670:	jmp    0x40995a
  409675:	mov    eax,esi
  409677:	add    edx,0x54
  40967a:	sar    esi,0x3
  40967d:	mov    DWORD PTR [ebp-0x54],edx
  409680:	mov    DWORD PTR [ebp-0x4c],esi
  409683:	and    eax,0x7
  409686:	je     0x40995a
  40968c:	imul   ecx,eax,0xc
  40968f:	mov    eax,0x8000
  409694:	add    ecx,edx
  409696:	mov    DWORD PTR [ebp-0x50],ecx
  409699:	cmp    WORD PTR [ecx],ax
  40969c:	jb     0x4096af
  40969e:	mov    esi,ecx
  4096a0:	lea    edi,[ebp-0x48]
  4096a3:	lea    ecx,[ebp-0x48]
  4096a6:	mov    DWORD PTR [ebp-0x50],ecx
  4096a9:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  4096aa:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  4096ab:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  4096ac:	dec    DWORD PTR [ebp-0x46]
  4096af:	movzx  edi,WORD PTR [ecx+0xa]
  4096b3:	mov    edx,DWORD PTR [ebp-0x32]
  4096b6:	mov    eax,edi
  4096b8:	xor    eax,edx
  4096ba:	mov    DWORD PTR [ebp-0x7c],ebx
  4096bd:	and    eax,0x8000
  4096c2:	mov    DWORD PTR [ebp-0x2c],ebx
  4096c5:	mov    DWORD PTR [ebp-0x60],eax
  4096c8:	mov    eax,0x7fff
  4096cd:	and    edx,eax
  4096cf:	mov    DWORD PTR [ebp-0x28],ebx
  4096d2:	and    edi,eax
  4096d4:	mov    DWORD PTR [ebp-0x24],ebx
  4096d7:	lea    eax,[edi+edx*1]
  4096da:	movzx  esi,ax
  4096dd:	mov    eax,0x7fff
  4096e2:	mov    DWORD PTR [ebp-0x6c],esi
  4096e5:	cmp    dx,ax
  4096e8:	jae    0x409937
  4096ee:	cmp    di,ax
  4096f1:	jae    0x409937
  4096f7:	mov    eax,0xbffd
  4096fc:	cmp    si,ax
  4096ff:	ja     0x409937
  409705:	mov    eax,0x3fbf
  40970a:	cmp    si,ax
  40970d:	ja     0x409717
  40970f:	mov    DWORD PTR [ebp-0x34],ebx
  409712:	jmp    0x40994e
  409717:	test   dx,dx
  40971a:	jne    0x409740
  40971c:	inc    esi
  40971d:	test   DWORD PTR [ebp-0x34],0x7fffffff
  409724:	mov    DWORD PTR [ebp-0x6c],esi
  409727:	jne    0x409740
  409729:	cmp    DWORD PTR [ebp-0x38],0x0
  40972d:	jne    0x409740
  40972f:	cmp    DWORD PTR [ebp-0x3c],0x0
  409733:	jne    0x409740
  409735:	xor    eax,eax
  409737:	mov    WORD PTR [ebp-0x32],ax
  40973b:	jmp    0x409954
  409740:	test   di,di
  409743:	jne    0x40975b
  409745:	inc    esi
  409746:	test   DWORD PTR [ecx+0x8],0x7fffffff
  40974d:	mov    DWORD PTR [ebp-0x6c],esi
  409750:	jne    0x40975b
  409752:	cmp    DWORD PTR [ecx+0x4],ebx
  409755:	jne    0x40975b
  409757:	cmp    DWORD PTR [ecx],ebx
  409759:	je     0x40970f
  40975b:	push   0x5
  40975d:	mov    eax,ebx
  40975f:	lea    edx,[ebp-0x28]
  409762:	pop    edi
  409763:	mov    DWORD PTR [ebp-0x74],eax
  409766:	mov    DWORD PTR [ebp-0x68],edi
  409769:	mov    DWORD PTR [ebp-0x5c],edi
  40976c:	test   edi,edi
  40976e:	jle    0x4097c8
  409770:	lea    esi,[ebp-0x3c]
  409773:	lea    esi,[esi+eax*2]
  409776:	lea    eax,[ecx+0x8]
  409779:	mov    DWORD PTR [ebp-0x64],eax
  40977c:	movzx  eax,WORD PTR [esi]
  40977f:	mov    DWORD PTR [ebp-0x5c],eax
  409782:	mov    eax,DWORD PTR [ebp-0x64]
  409785:	mov    ecx,DWORD PTR [ebp-0x5c]
  409788:	mov    DWORD PTR [ebp-0x78],ebx
  40978b:	movzx  eax,WORD PTR [eax]
  40978e:	imul   ecx,eax
  409791:	mov    DWORD PTR [ebp-0x5c],ecx
  409794:	add    ecx,DWORD PTR [edx-0x4]
  409797:	cmp    ecx,DWORD PTR [edx-0x4]
  40979a:	jb     0x4097a1
  40979c:	cmp    ecx,DWORD PTR [ebp-0x5c]
  40979f:	jae    0x4097a6
  4097a1:	xor    eax,eax
  4097a3:	inc    eax
  4097a4:	jmp    0x4097a9
  4097a6:	mov    eax,DWORD PTR [ebp-0x78]
  4097a9:	mov    DWORD PTR [edx-0x4],ecx
  4097ac:	test   eax,eax
  4097ae:	je     0x4097b3
  4097b0:	inc    WORD PTR [edx]
  4097b3:	sub    DWORD PTR [ebp-0x64],0x2
  4097b7:	add    esi,0x2
  4097ba:	dec    edi
  4097bb:	test   edi,edi
  4097bd:	jg     0x40977c
  4097bf:	mov    ecx,DWORD PTR [ebp-0x50]
  4097c2:	mov    edi,DWORD PTR [ebp-0x68]
  4097c5:	mov    eax,DWORD PTR [ebp-0x74]
  4097c8:	add    edx,0x2
  4097cb:	inc    eax
  4097cc:	dec    edi
  4097cd:	mov    DWORD PTR [ebp-0x74],eax
  4097d0:	mov    DWORD PTR [ebp-0x68],edi
  4097d3:	test   edi,edi
  4097d5:	jg     0x409769
  4097d7:	mov    esi,DWORD PTR [ebp-0x6c]
  4097da:	mov    edx,DWORD PTR [ebp-0x24]
  4097dd:	add    esi,0xc002
  4097e3:	mov    edi,DWORD PTR [ebp-0x2c]
  4097e6:	mov    DWORD PTR [ebp-0x50],edx
  4097e9:	test   si,si
  4097ec:	jle    0x409829
  4097ee:	test   edx,edx
  4097f0:	js     0x409824
  4097f2:	mov    eax,DWORD PTR [ebp-0x28]
  4097f5:	mov    edx,edi
  4097f7:	shr    edx,0x1f
  4097fa:	mov    ecx,eax
  4097fc:	add    eax,eax
  4097fe:	shr    ecx,0x1f
  409801:	or     eax,edx
  409803:	add    edi,edi
  409805:	mov    edx,DWORD PTR [ebp-0x50]
  409808:	mov    DWORD PTR [ebp-0x28],eax
  40980b:	add    edx,edx
  40980d:	mov    eax,0xffff
  409812:	mov    DWORD PTR [ebp-0x2c],edi
  409815:	or     edx,ecx
  409817:	add    esi,eax
  409819:	mov    DWORD PTR [ebp-0x50],edx
  40981c:	mov    DWORD PTR [ebp-0x24],edx
  40981f:	test   si,si
  409822:	jg     0x4097ee
  409824:	test   si,si
  409827:	jg     0x409892
  409829:	mov    eax,0xffff
  40982e:	add    esi,eax
  409830:	test   si,si
  409833:	jns    0x409892
  409835:	mov    ebx,DWORD PTR [ebp-0x7c]
  409838:	mov    eax,esi
  40983a:	neg    eax
  40983c:	movzx  eax,ax
  40983f:	mov    DWORD PTR [ebp-0x68],eax
  409842:	add    esi,eax
  409844:	test   BYTE PTR [ebp-0x2c],0x1
  409848:	je     0x40984b
  40984a:	inc    ebx
  40984b:	mov    ecx,DWORD PTR [ebp-0x28]
  40984e:	mov    eax,edx
  409850:	shl    eax,0x1f
  409853:	mov    DWORD PTR [ebp-0x50],ecx
  409856:	shr    DWORD PTR [ebp-0x50],1
  409859:	or     DWORD PTR [ebp-0x50],eax
  40985c:	mov    eax,DWORD PTR [ebp-0x50]
  40985f:	shl    ecx,0x1f
  409862:	shr    edi,1
  409864:	shr    edx,1
  409866:	or     edi,ecx
  409868:	dec    DWORD PTR [ebp-0x68]
  40986b:	mov    DWORD PTR [ebp-0x24],edx
  40986e:	mov    DWORD PTR [ebp-0x28],eax
  409871:	mov    DWORD PTR [ebp-0x2c],edi
  409874:	jne    0x409844
  409876:	push   0x0
  409878:	test   ebx,ebx
  40987a:	mov    DWORD PTR [ebp-0x50],edx
  40987d:	pop    ebx
  40987e:	je     0x409892
  409880:	mov    ax,di
  409883:	xor    edi,edi
  409885:	inc    edi
  409886:	or     ax,di
  409889:	mov    WORD PTR [ebp-0x2c],ax
  40988d:	mov    edi,DWORD PTR [ebp-0x2c]
  409890:	jmp    0x409896
  409892:	mov    ax,WORD PTR [ebp-0x2c]
  409896:	mov    edx,0x8000
  40989b:	cmp    ax,dx
  40989e:	ja     0x4098ae
  4098a0:	and    edi,0x1ffff
  4098a6:	cmp    edi,0x18000
  4098ac:	jne    0x4098ee
  4098ae:	mov    eax,DWORD PTR [ebp-0x2a]
  4098b1:	cmp    eax,0xffffffff
  4098b4:	jne    0x4098ea
  4098b6:	mov    eax,DWORD PTR [ebp-0x26]
  4098b9:	mov    DWORD PTR [ebp-0x2a],ebx
  4098bc:	cmp    eax,0xffffffff
  4098bf:	jne    0x4098e1
  4098c1:	mov    ax,WORD PTR [ebp-0x22]
  4098c5:	mov    ecx,0xffff
  4098ca:	mov    DWORD PTR [ebp-0x26],ebx
  4098cd:	cmp    ax,cx
  4098d0:	jne    0x4098d9
  4098d2:	mov    WORD PTR [ebp-0x22],dx
  4098d6:	inc    esi
  4098d7:	jmp    0x4098e5
  4098d9:	inc    ax
  4098db:	mov    WORD PTR [ebp-0x22],ax
  4098df:	jmp    0x4098e5
  4098e1:	inc    eax
  4098e2:	mov    DWORD PTR [ebp-0x26],eax
  4098e5:	mov    ecx,DWORD PTR [ebp-0x24]
  4098e8:	jmp    0x4098f1
  4098ea:	inc    eax
  4098eb:	mov    DWORD PTR [ebp-0x2a],eax
  4098ee:	mov    ecx,DWORD PTR [ebp-0x50]
  4098f1:	mov    edx,DWORD PTR [ebp-0x54]
  4098f4:	mov    eax,0x7fff
  4098f9:	cmp    si,ax
  4098fc:	jb     0x40991d
  4098fe:	xor    eax,eax
  409900:	mov    DWORD PTR [ebp-0x38],ebx
  409903:	cmp    WORD PTR [ebp-0x60],ax
  409907:	mov    DWORD PTR [ebp-0x3c],ebx
  40990a:	sete   al
  40990d:	dec    eax
  40990e:	and    eax,0x80000000
  409913:	add    eax,0x7fff8000
  409918:	mov    DWORD PTR [ebp-0x34],eax
  40991b:	jmp    0x409957
  40991d:	mov    ax,WORD PTR [ebp-0x2a]
  409921:	or     esi,DWORD PTR [ebp-0x60]
  409924:	mov    WORD PTR [ebp-0x3c],ax
  409928:	mov    eax,DWORD PTR [ebp-0x28]
  40992b:	mov    DWORD PTR [ebp-0x3a],eax
  40992e:	mov    DWORD PTR [ebp-0x36],ecx
  409931:	mov    WORD PTR [ebp-0x32],si
  409935:	jmp    0x409957
  409937:	xor    eax,eax
  409939:	cmp    WORD PTR [ebp-0x60],ax
  40993d:	sete   al
  409940:	dec    eax
  409941:	and    eax,0x80000000
  409946:	add    eax,0x7fff8000
  40994b:	mov    DWORD PTR [ebp-0x34],eax
  40994e:	mov    DWORD PTR [ebp-0x38],ebx
  409951:	mov    DWORD PTR [ebp-0x3c],ebx
  409954:	mov    edx,DWORD PTR [ebp-0x54]
  409957:	mov    esi,DWORD PTR [ebp-0x4c]
  40995a:	test   esi,esi
  40995c:	jne    0x409675
  409962:	mov    eax,DWORD PTR [ebp-0x34]
  409965:	movzx  ecx,WORD PTR [ebp-0x3c]
  409969:	mov    edx,DWORD PTR [ebp-0x3a]
  40996c:	mov    esi,DWORD PTR [ebp-0x36]
  40996f:	shr    eax,0x10
  409972:	jmp    0x4099a6
  409974:	xor    edi,edi
  409976:	mov    ecx,ebx
  409978:	mov    eax,ebx
  40997a:	mov    esi,ebx
  40997c:	mov    edx,ebx
  40997e:	lea    ebx,[edi+0x1]
  409981:	jmp    0x4099a6
  409983:	mov    eax,0x7fff
  409988:	mov    esi,0x80000000
  40998d:	push   0x2
  40998f:	jmp    0x4099a1
  409991:	mov    ecx,ebx
  409993:	mov    eax,ebx
  409995:	mov    esi,ebx
  409997:	mov    edx,ebx
  409999:	jmp    0x4099a6
  40999b:	mov    eax,ebx
  40999d:	mov    esi,ebx
  40999f:	push   0x4
  4099a1:	mov    ecx,ebx
  4099a3:	mov    edx,ebx
  4099a5:	pop    ebx
  4099a6:	mov    edi,DWORD PTR [ebp-0x80]
  4099a9:	or     eax,DWORD PTR [ebp-0x70]
  4099ac:	mov    WORD PTR [edi+0xa],ax
  4099b0:	mov    eax,ebx
  4099b2:	mov    WORD PTR [edi],cx
  4099b5:	mov    DWORD PTR [edi+0x2],edx
  4099b8:	mov    DWORD PTR [edi+0x6],esi
  4099bb:	mov    ecx,DWORD PTR [ebp-0x4]
  4099be:	pop    edi
  4099bf:	pop    esi
  4099c0:	xor    ecx,ebp
  4099c2:	pop    ebx
  4099c3:	call   0x40120d
  4099c8:	mov    esp,ebp
  4099ca:	pop    ebp
  4099cb:	ret
  4099cc:	jmp    0x4093:0x3c004092
  4099d3:	add    BYTE PTR [esi-0x38ffbf6d],dl
  4099d9:	xchg   ebx,eax
  4099da:	inc    eax
  4099db:	add    BYTE PTR [eax],ch
  4099dd:	xchg   esp,eax
  4099de:	inc    eax
  4099df:	add    BYTE PTR [ebx-0x3bffbf6c],ch
  4099e5:	xchg   esp,eax
  4099e6:	inc    eax
  4099e7:	add    BYTE PTR [edi],ah
  4099e9:	xchg   ebp,eax
  4099ea:	inc    eax
  4099eb:	add    BYTE PTR [ecx],cl
  4099ed:	xchg   ebp,eax
  4099ee:	inc    eax
  4099ef:	add    BYTE PTR [ecx-0x6b],ch
  4099f2:	inc    eax
  4099f3:	add    BYTE PTR [esi-0x6b],bl
  4099f6:	inc    eax
  4099f7:	add    BYTE PTR [ebx],dh
  4099f9:	xchg   ebp,eax
  4099fa:	inc    eax
  4099fb:	add    BYTE PTR [ebp-0x75],dl
  4099fe:	in     al,dx
  4099ff:	push   0x0
  409a01:	push   DWORD PTR [ebp+0x1c]
  409a04:	push   DWORD PTR [ebp+0x18]
  409a07:	push   DWORD PTR [ebp+0x14]
  409a0a:	push   DWORD PTR [ebp+0x10]
  409a0d:	push   DWORD PTR [ebp+0xc]
  409a10:	push   DWORD PTR [ebp+0x8]
  409a13:	call   0x409a1d
  409a18:	add    esp,0x1c
  409a1b:	pop    ebp
  409a1c:	ret
  409a1d:	push   ebp
  409a1e:	mov    ebp,esp
  409a20:	mov    eax,DWORD PTR [ebp+0x14]
  409a23:	cmp    eax,0x65
  409a26:	je     0x409a87
  409a28:	cmp    eax,0x45
  409a2b:	je     0x409a87
  409a2d:	cmp    eax,0x66
  409a30:	jne    0x409a4b
  409a32:	push   DWORD PTR [ebp+0x20]
  409a35:	push   DWORD PTR [ebp+0x18]
  409a38:	push   DWORD PTR [ebp+0x10]
  409a3b:	push   DWORD PTR [ebp+0xc]
  409a3e:	push   DWORD PTR [ebp+0x8]
  409a41:	call   0x40a128
  409a46:	add    esp,0x14
  409a49:	pop    ebp
  409a4a:	ret
  409a4b:	cmp    eax,0x61
  409a4e:	je     0x409a6e
  409a50:	cmp    eax,0x41
  409a53:	je     0x409a6e
  409a55:	push   DWORD PTR [ebp+0x20]
  409a58:	push   DWORD PTR [ebp+0x1c]
  409a5b:	push   DWORD PTR [ebp+0x18]
  409a5e:	push   DWORD PTR [ebp+0x10]
  409a61:	push   DWORD PTR [ebp+0xc]
  409a64:	push   DWORD PTR [ebp+0x8]
  409a67:	call   0x40a1e9
  409a6c:	jmp    0x409a9e
  409a6e:	push   DWORD PTR [ebp+0x20]
  409a71:	push   DWORD PTR [ebp+0x1c]
  409a74:	push   DWORD PTR [ebp+0x18]
  409a77:	push   DWORD PTR [ebp+0x10]
  409a7a:	push   DWORD PTR [ebp+0xc]
  409a7d:	push   DWORD PTR [ebp+0x8]
  409a80:	call   0x409aa3
  409a85:	jmp    0x409a9e
  409a87:	push   DWORD PTR [ebp+0x20]
  409a8a:	push   DWORD PTR [ebp+0x1c]
  409a8d:	push   DWORD PTR [ebp+0x18]
  409a90:	push   DWORD PTR [ebp+0x10]
  409a93:	push   DWORD PTR [ebp+0xc]
  409a96:	push   DWORD PTR [ebp+0x8]
  409a99:	call   0x409f6e
  409a9e:	add    esp,0x18
  409aa1:	pop    ebp
  409aa2:	ret
  409aa3:	push   ebp
  409aa4:	mov    ebp,esp
  409aa6:	sub    esp,0x2c
  409aa9:	push   ebx
  409aaa:	push   esi
  409aab:	push   edi
  409aac:	push   0x30
  409aae:	pop    eax
  409aaf:	push   DWORD PTR [ebp+0x1c]
  409ab2:	mov    ecx,eax
  409ab4:	mov    DWORD PTR [ebp-0x8],0x3ff
  409abb:	mov    DWORD PTR [ebp-0x4],ecx
  409abe:	xor    ebx,ebx
  409ac0:	lea    ecx,[ebp-0x2c]
  409ac3:	call   0x401840
  409ac8:	mov    edi,DWORD PTR [ebp+0x14]
  409acb:	test   edi,edi
  409acd:	jns    0x409ad1
  409acf:	mov    edi,ebx
  409ad1:	mov    esi,DWORD PTR [ebp+0xc]
  409ad4:	test   esi,esi
  409ad6:	je     0x409adf
  409ad8:	mov    ecx,DWORD PTR [ebp+0x10]
  409adb:	test   ecx,ecx
  409add:	jne    0x409ae8
  409adf:	call   0x402568
  409ae4:	push   0x16
  409ae6:	jmp    0x409af8
  409ae8:	lea    eax,[edi+0xb]
  409aeb:	mov    BYTE PTR [esi],bl
  409aed:	cmp    ecx,eax
  409aef:	ja     0x409b05
  409af1:	call   0x402568
  409af6:	push   0x22
  409af8:	pop    edi
  409af9:	mov    DWORD PTR [eax],edi
  409afb:	call   0x4016b6
  409b00:	jmp    0x409de9
  409b05:	mov    edx,DWORD PTR [ebp+0x8]
  409b08:	mov    eax,DWORD PTR [edx]
  409b0a:	mov    ebx,DWORD PTR [edx+0x4]
  409b0d:	mov    DWORD PTR [ebp-0x14],eax
  409b10:	mov    eax,ebx
  409b12:	shr    eax,0x14
  409b15:	and    eax,0x7ff
  409b1a:	cmp    eax,0x7ff
  409b1f:	jne    0x409b9a
  409b21:	xor    eax,eax
  409b23:	cmp    eax,eax
  409b25:	jne    0x409b9c
  409b27:	or     eax,0xffffffff
  409b2a:	cmp    ecx,eax
  409b2c:	je     0x409b31
  409b2e:	lea    eax,[ecx-0x2]
  409b31:	push   0x0
  409b33:	push   edi
  409b34:	push   eax
  409b35:	lea    ebx,[esi+0x2]
  409b38:	push   ebx
  409b39:	push   edx
  409b3a:	call   0x409dff
  409b3f:	mov    edi,eax
  409b41:	add    esp,0x14
  409b44:	test   edi,edi
  409b46:	je     0x409b50
  409b48:	mov    BYTE PTR [esi],0x0
  409b4b:	jmp    0x409de9
  409b50:	cmp    BYTE PTR [ebx],0x2d
  409b53:	jne    0x409b59
  409b55:	mov    BYTE PTR [esi],0x2d
  409b58:	inc    esi
  409b59:	mov    edi,DWORD PTR [ebp+0x18]
  409b5c:	test   edi,edi
  409b5e:	push   0x30
  409b60:	pop    eax
  409b61:	mov    BYTE PTR [esi],al
  409b63:	sete   al
  409b66:	dec    al
  409b68:	and    al,0xe0
  409b6a:	add    al,0x78
  409b6c:	mov    BYTE PTR [esi+0x1],al
  409b6f:	lea    eax,[esi+0x2]
  409b72:	push   0x65
  409b74:	push   eax
  409b75:	call   0x40aee0
  409b7a:	pop    ecx
  409b7b:	pop    ecx
  409b7c:	test   eax,eax
  409b7e:	je     0x409b93
  409b80:	test   edi,edi
  409b82:	sete   cl
  409b85:	dec    cl
  409b87:	and    cl,0xe0
  409b8a:	add    cl,0x70
  409b8d:	mov    BYTE PTR [eax],cl
  409b8f:	mov    BYTE PTR [eax+0x3],0x0
  409b93:	xor    edi,edi
  409b95:	jmp    0x409de9
  409b9a:	xor    eax,eax
  409b9c:	and    ebx,0x80000000
  409ba2:	or     eax,ebx
  409ba4:	je     0x409baa
  409ba6:	mov    BYTE PTR [esi],0x2d
  409ba9:	inc    esi
  409baa:	cmp    DWORD PTR [ebp+0x18],0x0
  409bae:	mov    ebx,DWORD PTR [ebp+0x18]
  409bb1:	push   0x30
  409bb3:	pop    eax
  409bb4:	mov    BYTE PTR [esi],al
  409bb6:	sete   al
  409bb9:	dec    al
  409bbb:	and    al,0xe0
  409bbd:	add    al,0x78
  409bbf:	neg    ebx
  409bc1:	mov    BYTE PTR [esi+0x1],al
  409bc4:	mov    ecx,DWORD PTR [edx+0x4]
  409bc7:	sbb    ebx,ebx
  409bc9:	and    ebx,0xffffffe0
  409bcc:	and    ecx,0x7ff00000
  409bd2:	add    ebx,0x27
  409bd5:	xor    eax,eax
  409bd7:	or     eax,ecx
  409bd9:	mov    DWORD PTR [ebp-0x10],ebx
  409bdc:	jne    0x409c05
  409bde:	push   0x30
  409be0:	pop    eax
  409be1:	mov    BYTE PTR [esi+0x2],al
  409be4:	add    esi,0x3
  409be7:	mov    eax,DWORD PTR [edx+0x4]
  409bea:	mov    ecx,DWORD PTR [edx]
  409bec:	and    eax,0xfffff
  409bf1:	or     ecx,eax
  409bf3:	jne    0x409bfc
  409bf5:	xor    eax,eax
  409bf7:	mov    DWORD PTR [ebp-0x8],eax
  409bfa:	jmp    0x409c0c
  409bfc:	mov    DWORD PTR [ebp-0x8],0x3fe
  409c03:	jmp    0x409c0c
  409c05:	mov    BYTE PTR [esi+0x2],0x31
  409c09:	add    esi,0x3
  409c0c:	mov    ecx,esi
  409c0e:	inc    esi
  409c0f:	mov    DWORD PTR [ebp-0xc],ecx
  409c12:	test   edi,edi
  409c14:	jne    0x409c1b
  409c16:	mov    BYTE PTR [ecx],0x0
  409c19:	jmp    0x409c2a
  409c1b:	mov    eax,DWORD PTR [ebp-0x2c]
  409c1e:	mov    eax,DWORD PTR [eax+0x84]
  409c24:	mov    eax,DWORD PTR [eax]
  409c26:	mov    al,BYTE PTR [eax]
  409c28:	mov    BYTE PTR [ecx],al
  409c2a:	mov    eax,DWORD PTR [edx+0x4]
  409c2d:	and    eax,0xfffff
  409c32:	mov    DWORD PTR [ebp-0x18],eax
  409c35:	ja     0x409c40
  409c37:	cmp    DWORD PTR [edx],0x0
  409c3a:	jbe    0x409d02
  409c40:	and    DWORD PTR [ebp+0x14],0x0
  409c44:	mov    ecx,0xf0000
  409c49:	mov    eax,DWORD PTR [ebp-0x4]
  409c4c:	mov    DWORD PTR [ebp+0xc],ecx
  409c4f:	test   edi,edi
  409c51:	jle    0x409ca6
  409c53:	mov    eax,DWORD PTR [edx]
  409c55:	mov    edx,DWORD PTR [edx+0x4]
  409c58:	and    eax,DWORD PTR [ebp+0x14]
  409c5b:	and    edx,ecx
  409c5d:	mov    ecx,DWORD PTR [ebp-0x4]
  409c60:	and    edx,0xfffff
  409c66:	movsx  ecx,cx
  409c69:	call   0x40b300
  409c6e:	push   0x30
  409c70:	pop    ecx
  409c71:	add    ax,cx
  409c74:	movzx  eax,ax
  409c77:	cmp    eax,0x39
  409c7a:	jbe    0x409c7e
  409c7c:	add    eax,ebx
  409c7e:	mov    ecx,DWORD PTR [ebp+0xc]
  409c81:	mov    edx,DWORD PTR [ebp+0x8]
  409c84:	mov    BYTE PTR [esi],al
  409c86:	inc    esi
  409c87:	mov    eax,DWORD PTR [ebp+0x14]
  409c8a:	shrd   eax,ecx,0x4
  409c8e:	mov    DWORD PTR [ebp+0x14],eax
  409c91:	mov    eax,DWORD PTR [ebp-0x4]
  409c94:	shr    ecx,0x4
  409c97:	sub    eax,0x4
  409c9a:	dec    edi
  409c9b:	mov    DWORD PTR [ebp+0xc],ecx
  409c9e:	mov    DWORD PTR [ebp-0x4],eax
  409ca1:	test   ax,ax
  409ca4:	jns    0x409c4f
  409ca6:	test   ax,ax
  409ca9:	js     0x409d02
  409cab:	mov    eax,DWORD PTR [edx]
  409cad:	mov    edx,DWORD PTR [edx+0x4]
  409cb0:	and    eax,DWORD PTR [ebp+0x14]
  409cb3:	and    edx,ecx
  409cb5:	mov    ecx,DWORD PTR [ebp-0x4]
  409cb8:	and    edx,0xfffff
  409cbe:	movsx  ecx,cx
  409cc1:	call   0x40b300
  409cc6:	cmp    ax,0x8
  409cca:	jbe    0x409d02
  409ccc:	push   0x30
  409cce:	lea    eax,[esi-0x1]
  409cd1:	pop    ebx
  409cd2:	mov    cl,BYTE PTR [eax]
  409cd4:	cmp    cl,0x66
  409cd7:	je     0x409cde
  409cd9:	cmp    cl,0x46
  409cdc:	jne    0x409ce3
  409cde:	mov    BYTE PTR [eax],bl
  409ce0:	dec    eax
  409ce1:	jmp    0x409cd2
  409ce3:	mov    ebx,DWORD PTR [ebp-0x10]
  409ce6:	cmp    eax,DWORD PTR [ebp-0xc]
  409ce9:	je     0x409cff
  409ceb:	mov    cl,BYTE PTR [eax]
  409ced:	cmp    cl,0x39
  409cf0:	jne    0x409cf9
  409cf2:	add    bl,0x3a
  409cf5:	mov    BYTE PTR [eax],bl
  409cf7:	jmp    0x409d02
  409cf9:	inc    cl
  409cfb:	mov    BYTE PTR [eax],cl
  409cfd:	jmp    0x409d02
  409cff:	inc    BYTE PTR [eax-0x1]
  409d02:	test   edi,edi
  409d04:	jle    0x409d16
  409d06:	push   edi
  409d07:	push   0x30
  409d09:	pop    eax
  409d0a:	push   eax
  409d0b:	push   esi
  409d0c:	call   0x403d60
  409d11:	add    esp,0xc
  409d14:	add    esi,edi
  409d16:	mov    eax,DWORD PTR [ebp-0xc]
  409d19:	cmp    BYTE PTR [eax],0x0
  409d1c:	jne    0x409d20
  409d1e:	mov    esi,eax
  409d20:	cmp    DWORD PTR [ebp+0x18],0x0
  409d24:	mov    cl,0x34
  409d26:	mov    edx,DWORD PTR [ebp+0x8]
  409d29:	sete   al
  409d2c:	dec    al
  409d2e:	and    al,0xe0
  409d30:	add    al,0x70
  409d32:	mov    BYTE PTR [esi],al
  409d34:	mov    eax,DWORD PTR [edx]
  409d36:	mov    edx,DWORD PTR [edx+0x4]
  409d39:	call   0x40b300
  409d3e:	mov    ecx,eax
  409d40:	mov    ebx,edx
  409d42:	xor    eax,eax
  409d44:	and    ecx,0x7ff
  409d4a:	and    ebx,eax
  409d4c:	sub    ecx,DWORD PTR [ebp-0x8]
  409d4f:	sbb    ebx,eax
  409d51:	js     0x409d62
  409d53:	jg     0x409d59
  409d55:	cmp    ecx,eax
  409d57:	jb     0x409d62
  409d59:	mov    BYTE PTR [esi+0x1],0x2b
  409d5d:	add    esi,0x2
  409d60:	jmp    0x409d6f
  409d62:	mov    BYTE PTR [esi+0x1],0x2d
  409d66:	add    esi,0x2
  409d69:	neg    ecx
  409d6b:	adc    ebx,eax
  409d6d:	neg    ebx
  409d6f:	mov    BYTE PTR [esi],0x30
  409d72:	mov    edi,esi
  409d74:	cmp    ebx,eax
  409d76:	jl     0x409db9
  409d78:	mov    edx,0x3e8
  409d7d:	jg     0x409d83
  409d7f:	cmp    ecx,edx
  409d81:	jb     0x409d9a
  409d83:	push   eax
  409d84:	push   edx
  409d85:	push   ebx
  409d86:	push   ecx
  409d87:	call   0x40b220
  409d8c:	add    al,0x30
  409d8e:	mov    DWORD PTR [ebp-0x18],edx
  409d91:	mov    BYTE PTR [esi],al
  409d93:	inc    esi
  409d94:	xor    eax,eax
  409d96:	cmp    esi,edi
  409d98:	jne    0x409da5
  409d9a:	cmp    ebx,eax
  409d9c:	jl     0x409db9
  409d9e:	jg     0x409da5
  409da0:	cmp    ecx,0x64
  409da3:	jb     0x409db9
  409da5:	push   eax
  409da6:	push   0x64
  409da8:	push   ebx
  409da9:	push   ecx
  409daa:	call   0x40b220
  409daf:	add    al,0x30
  409db1:	mov    DWORD PTR [ebp-0x18],edx
  409db4:	mov    BYTE PTR [esi],al
  409db6:	inc    esi
  409db7:	xor    eax,eax
  409db9:	cmp    esi,edi
  409dbb:	jne    0x409dc8
  409dbd:	cmp    ebx,eax
  409dbf:	jl     0x409ddf
  409dc1:	jg     0x409dc8
  409dc3:	cmp    ecx,0xa
  409dc6:	jb     0x409ddf
  409dc8:	push   eax
  409dc9:	push   0xa
  409dcb:	push   ebx
  409dcc:	push   ecx
  409dcd:	call   0x40b220
  409dd2:	add    al,0x30
  409dd4:	mov    DWORD PTR [ebp-0x18],edx
  409dd7:	mov    BYTE PTR [esi],al
  409dd9:	inc    esi
  409dda:	mov    DWORD PTR [ebp-0x18],ebx
  409ddd:	xor    eax,eax
  409ddf:	add    cl,0x30
  409de2:	mov    edi,eax
  409de4:	mov    BYTE PTR [esi],cl
  409de6:	mov    BYTE PTR [esi+0x1],al
  409de9:	cmp    BYTE PTR [ebp-0x20],0x0
  409ded:	je     0x409df6
  409def:	mov    ecx,DWORD PTR [ebp-0x24]
  409df2:	and    DWORD PTR [ecx+0x70],0xfffffffd
  409df6:	mov    eax,edi
  409df8:	pop    edi
  409df9:	pop    esi
  409dfa:	pop    ebx
  409dfb:	mov    esp,ebp
  409dfd:	pop    ebp
  409dfe:	ret
  409dff:	push   ebp
  409e00:	mov    ebp,esp
  409e02:	push   0x0
  409e04:	push   DWORD PTR [ebp+0x18]
  409e07:	push   DWORD PTR [ebp+0x14]
  409e0a:	push   DWORD PTR [ebp+0x10]
  409e0d:	push   DWORD PTR [ebp+0xc]
  409e10:	push   DWORD PTR [ebp+0x8]
  409e13:	call   0x409f6e
  409e18:	add    esp,0x18
  409e1b:	pop    ebp
  409e1c:	ret
  409e1d:	push   ebp
  409e1e:	mov    ebp,esp
  409e20:	sub    esp,0x10
  409e23:	lea    ecx,[ebp-0x10]
  409e26:	push   ebx
  409e27:	push   edi
  409e28:	push   DWORD PTR [ebp+0x20]
  409e2b:	call   0x401840
  409e30:	mov    ebx,DWORD PTR [ebp+0x8]
  409e33:	test   ebx,ebx
  409e35:	je     0x409e3d
  409e37:	cmp    DWORD PTR [ebp+0xc],0x0
  409e3b:	ja     0x409e46
  409e3d:	call   0x402568
  409e42:	push   0x16
  409e44:	jmp    0x409e62
  409e46:	mov    edx,DWORD PTR [ebp+0x10]
  409e49:	xor    edi,edi
  409e4b:	mov    eax,edx
  409e4d:	test   edx,edx
  409e4f:	jg     0x409e53
  409e51:	mov    eax,edi
  409e53:	add    eax,0x9
  409e56:	cmp    DWORD PTR [ebp+0xc],eax
  409e59:	ja     0x409e6f
  409e5b:	call   0x402568
  409e60:	push   0x22
  409e62:	pop    edi
  409e63:	mov    DWORD PTR [eax],edi
  409e65:	call   0x4016b6
  409e6a:	jmp    0x409f4e
  409e6f:	cmp    BYTE PTR [ebp+0x1c],0x0
  409e73:	je     0x409e95
  409e75:	mov    ecx,DWORD PTR [ebp+0x18]
  409e78:	xor    eax,eax
  409e7a:	test   edx,edx
  409e7c:	setg   al
  409e7f:	push   eax
  409e80:	xor    eax,eax
  409e82:	cmp    DWORD PTR [ecx],0x2d
  409e85:	sete   al
  409e88:	add    eax,ebx
  409e8a:	push   eax
  409e8b:	call   0x40a472
  409e90:	mov    edx,DWORD PTR [ebp+0x10]
  409e93:	pop    ecx
  409e94:	pop    ecx
  409e95:	mov    eax,DWORD PTR [ebp+0x18]
  409e98:	push   esi
  409e99:	mov    esi,ebx
  409e9b:	cmp    DWORD PTR [eax],0x2d
  409e9e:	jne    0x409ea6
  409ea0:	mov    BYTE PTR [ebx],0x2d
  409ea3:	lea    esi,[ebx+0x1]
  409ea6:	test   edx,edx
  409ea8:	jle    0x409ebf
  409eaa:	mov    al,BYTE PTR [esi+0x1]
  409ead:	mov    BYTE PTR [esi],al
  409eaf:	inc    esi
  409eb0:	mov    eax,DWORD PTR [ebp-0x10]
  409eb3:	mov    eax,DWORD PTR [eax+0x84]
  409eb9:	mov    eax,DWORD PTR [eax]
  409ebb:	mov    al,BYTE PTR [eax]
  409ebd:	mov    BYTE PTR [esi],al
  409ebf:	xor    eax,eax
  409ec1:	cmp    BYTE PTR [ebp+0x1c],al
  409ec4:	sete   al
  409ec7:	add    eax,edx
  409ec9:	add    esi,eax
  409ecb:	or     eax,0xffffffff
  409ece:	cmp    DWORD PTR [ebp+0xc],eax
  409ed1:	je     0x409eda
  409ed3:	mov    eax,ebx
  409ed5:	sub    eax,esi
  409ed7:	add    eax,DWORD PTR [ebp+0xc]
  409eda:	push   0x410d8c
  409edf:	push   eax
  409ee0:	push   esi
  409ee1:	call   0x4061a2
  409ee6:	add    esp,0xc
  409ee9:	test   eax,eax
  409eeb:	jne    0x409f63
  409eed:	lea    ecx,[esi+0x2]
  409ef0:	cmp    DWORD PTR [ebp+0x14],edi
  409ef3:	je     0x409ef8
  409ef5:	mov    BYTE PTR [esi],0x45
  409ef8:	mov    edx,DWORD PTR [ebp+0x18]
  409efb:	mov    eax,DWORD PTR [edx+0xc]
  409efe:	cmp    BYTE PTR [eax],0x30
  409f01:	je     0x409f30
  409f03:	mov    edx,DWORD PTR [edx+0x4]
  409f06:	dec    edx
  409f07:	jns    0x409f0f
  409f09:	neg    edx
  409f0b:	mov    BYTE PTR [esi+0x1],0x2d
  409f0f:	push   0x64
  409f11:	pop    ebx
  409f12:	cmp    edx,ebx
  409f14:	jl     0x409f1e
  409f16:	mov    eax,edx
  409f18:	cdq
  409f19:	idiv   ebx
  409f1b:	add    BYTE PTR [esi+0x2],al
  409f1e:	push   0xa
  409f20:	pop    ebx
  409f21:	cmp    edx,ebx
  409f23:	jl     0x409f2d
  409f25:	mov    eax,edx
  409f27:	cdq
  409f28:	idiv   ebx
  409f2a:	add    BYTE PTR [esi+0x3],al
  409f2d:	add    BYTE PTR [esi+0x4],dl
  409f30:	test   BYTE PTR ds:0x413e7c,0x1
  409f37:	pop    esi
  409f38:	je     0x409f4e
  409f3a:	cmp    BYTE PTR [ecx],0x30
  409f3d:	jne    0x409f4e
  409f3f:	push   0x3
  409f41:	lea    eax,[ecx+0x1]
  409f44:	push   eax
  409f45:	push   ecx
  409f46:	call   0x40a890
  409f4b:	add    esp,0xc
  409f4e:	cmp    BYTE PTR [ebp-0x4],0x0
  409f52:	je     0x409f5b
  409f54:	mov    ecx,DWORD PTR [ebp-0x8]
  409f57:	and    DWORD PTR [ecx+0x70],0xfffffffd
  409f5b:	mov    eax,edi
  409f5d:	pop    edi
  409f5e:	pop    ebx
  409f5f:	mov    esp,ebp
  409f61:	pop    ebp
  409f62:	ret
  409f63:	push   edi
  409f64:	push   edi
  409f65:	push   edi
  409f66:	push   edi
  409f67:	push   edi
  409f68:	call   0x4016c6
  409f6d:	int3
  409f6e:	push   ebp
  409f6f:	mov    ebp,esp
  409f71:	sub    esp,0x2c
  409f74:	mov    eax,ds:0x412000
  409f79:	xor    eax,ebp
  409f7b:	mov    DWORD PTR [ebp-0x4],eax
  409f7e:	mov    eax,DWORD PTR [ebp+0x8]
  409f81:	lea    ecx,[ebp-0x1c]
  409f84:	push   ebx
  409f85:	mov    ebx,DWORD PTR [ebp+0x14]
  409f88:	push   esi
  409f89:	push   edi
  409f8a:	mov    edi,DWORD PTR [ebp+0xc]
  409f8d:	push   0x16
  409f8f:	pop    esi
  409f90:	push   esi
  409f91:	push   ecx
  409f92:	lea    ecx,[ebp-0x2c]
  409f95:	push   ecx
  409f96:	push   DWORD PTR [eax+0x4]
  409f99:	push   DWORD PTR [eax]
  409f9b:	call   0x40b18f
  409fa0:	add    esp,0x14
  409fa3:	test   edi,edi
  409fa5:	jne    0x409fb7
  409fa7:	call   0x402568
  409fac:	mov    DWORD PTR [eax],esi
  409fae:	call   0x4016b6
  409fb3:	mov    eax,esi
  409fb5:	jmp    0x40a02b
  409fb7:	mov    esi,DWORD PTR [ebp+0x10]
  409fba:	test   esi,esi
  409fbc:	jne    0x409fc8
  409fbe:	call   0x402568
  409fc3:	push   0x16
  409fc5:	pop    esi
  409fc6:	jmp    0x409fac
  409fc8:	or     ecx,0xffffffff
  409fcb:	cmp    esi,ecx
  409fcd:	je     0x409fe5
  409fcf:	xor    eax,eax
  409fd1:	mov    ecx,esi
  409fd3:	cmp    DWORD PTR [ebp-0x2c],0x2d
  409fd7:	sete   al
  409fda:	sub    ecx,eax
  409fdc:	xor    eax,eax
  409fde:	test   ebx,ebx
  409fe0:	setg   al
  409fe3:	sub    ecx,eax
  409fe5:	lea    eax,[ebp-0x2c]
  409fe8:	push   eax
  409fe9:	lea    eax,[ebx+0x1]
  409fec:	push   eax
  409fed:	push   ecx
  409fee:	xor    ecx,ecx
  409ff0:	cmp    DWORD PTR [ebp-0x2c],0x2d
  409ff4:	sete   cl
  409ff7:	xor    eax,eax
  409ff9:	test   ebx,ebx
  409ffb:	setg   al
  409ffe:	add    ecx,edi
  40a000:	add    eax,ecx
  40a002:	push   eax
  40a003:	call   0x40b017
  40a008:	add    esp,0x10
  40a00b:	test   eax,eax
  40a00d:	je     0x40a014
  40a00f:	mov    BYTE PTR [edi],0x0
  40a012:	jmp    0x40a02b
  40a014:	push   DWORD PTR [ebp+0x1c]
  40a017:	lea    eax,[ebp-0x2c]
  40a01a:	push   0x0
  40a01c:	push   eax
  40a01d:	push   DWORD PTR [ebp+0x18]
  40a020:	push   ebx
  40a021:	push   esi
  40a022:	push   edi
  40a023:	call   0x409e1d
  40a028:	add    esp,0x1c
  40a02b:	mov    ecx,DWORD PTR [ebp-0x4]
  40a02e:	pop    edi
  40a02f:	pop    esi
  40a030:	xor    ecx,ebp
  40a032:	pop    ebx
  40a033:	call   0x40120d
  40a038:	mov    esp,ebp
  40a03a:	pop    ebp
  40a03b:	ret
  40a03c:	push   ebp
  40a03d:	mov    ebp,esp
  40a03f:	sub    esp,0x14
  40a042:	mov    eax,DWORD PTR [ebp+0x14]
  40a045:	lea    ecx,[ebp-0x14]
  40a048:	push   ebx
  40a049:	push   esi
  40a04a:	push   DWORD PTR [ebp+0x1c]
  40a04d:	mov    eax,DWORD PTR [eax+0x4]
  40a050:	dec    eax
  40a051:	mov    DWORD PTR [ebp-0x4],eax
  40a054:	call   0x401840
  40a059:	mov    esi,DWORD PTR [ebp+0x8]
  40a05c:	test   esi,esi
  40a05e:	je     0x40a066
  40a060:	cmp    DWORD PTR [ebp+0xc],0x0
  40a064:	ja     0x40a07a
  40a066:	call   0x402568
  40a06b:	push   0x16
  40a06d:	pop    ebx
  40a06e:	mov    DWORD PTR [eax],ebx
  40a070:	call   0x4016b6
  40a075:	jmp    0x40a113
  40a07a:	xor    ebx,ebx
  40a07c:	push   edi
  40a07d:	mov    edi,DWORD PTR [ebp+0x10]
  40a080:	cmp    BYTE PTR [ebp+0x18],bl
  40a083:	je     0x40a09f
  40a085:	mov    ecx,DWORD PTR [ebp-0x4]
  40a088:	cmp    ecx,edi
  40a08a:	jne    0x40a09f
  40a08c:	mov    edx,DWORD PTR [ebp+0x14]
  40a08f:	xor    eax,eax
  40a091:	cmp    DWORD PTR [edx],0x2d
  40a094:	sete   al
  40a097:	add    eax,ecx
  40a099:	mov    WORD PTR [eax+esi*1],0x30
  40a09f:	mov    eax,DWORD PTR [ebp+0x14]
  40a0a2:	cmp    DWORD PTR [eax],0x2d
  40a0a5:	jne    0x40a0ab
  40a0a7:	mov    BYTE PTR [esi],0x2d
  40a0aa:	inc    esi
  40a0ab:	mov    eax,DWORD PTR [eax+0x4]
  40a0ae:	test   eax,eax
  40a0b0:	jg     0x40a0c2
  40a0b2:	push   0x1
  40a0b4:	push   esi
  40a0b5:	call   0x40a472
  40a0ba:	pop    ecx
  40a0bb:	mov    BYTE PTR [esi],0x30
  40a0be:	inc    esi
  40a0bf:	pop    ecx
  40a0c0:	jmp    0x40a0c4
  40a0c2:	add    esi,eax
  40a0c4:	test   edi,edi
  40a0c6:	jle    0x40a112
  40a0c8:	push   0x1
  40a0ca:	push   esi
  40a0cb:	call   0x40a472
  40a0d0:	mov    eax,DWORD PTR [ebp-0x14]
  40a0d3:	pop    ecx
  40a0d4:	pop    ecx
  40a0d5:	mov    eax,DWORD PTR [eax+0x84]
  40a0db:	mov    eax,DWORD PTR [eax]
  40a0dd:	mov    al,BYTE PTR [eax]
  40a0df:	mov    BYTE PTR [esi],al
  40a0e1:	inc    esi
  40a0e2:	mov    eax,DWORD PTR [ebp+0x14]
  40a0e5:	mov    eax,DWORD PTR [eax+0x4]
  40a0e8:	test   eax,eax
  40a0ea:	jns    0x40a112
  40a0ec:	cmp    BYTE PTR [ebp+0x18],bl
  40a0ef:	je     0x40a0f7
  40a0f1:	mov    edi,eax
  40a0f3:	neg    edi
  40a0f5:	jmp    0x40a0ff
  40a0f7:	neg    eax
  40a0f9:	cmp    edi,eax
  40a0fb:	jl     0x40a0ff
  40a0fd:	mov    edi,eax
  40a0ff:	push   edi
  40a100:	push   esi
  40a101:	call   0x40a472
  40a106:	push   edi
  40a107:	push   0x30
  40a109:	push   esi
  40a10a:	call   0x403d60
  40a10f:	add    esp,0x14
  40a112:	pop    edi
  40a113:	cmp    BYTE PTR [ebp-0x8],0x0
  40a117:	je     0x40a120
  40a119:	mov    ecx,DWORD PTR [ebp-0xc]
  40a11c:	and    DWORD PTR [ecx+0x70],0xfffffffd
  40a120:	pop    esi
  40a121:	mov    eax,ebx
  40a123:	pop    ebx
  40a124:	mov    esp,ebp
  40a126:	pop    ebp
  40a127:	ret
  40a128:	push   ebp
  40a129:	mov    ebp,esp
  40a12b:	sub    esp,0x2c
  40a12e:	mov    eax,ds:0x412000
  40a133:	xor    eax,ebp
  40a135:	mov    DWORD PTR [ebp-0x4],eax
  40a138:	mov    eax,DWORD PTR [ebp+0x8]
  40a13b:	lea    ecx,[ebp-0x1c]
  40a13e:	push   ebx
  40a13f:	push   edi
  40a140:	mov    edi,DWORD PTR [ebp+0xc]
  40a143:	push   0x16
  40a145:	pop    ebx
  40a146:	push   ebx
  40a147:	push   ecx
  40a148:	lea    ecx,[ebp-0x2c]
  40a14b:	push   ecx
  40a14c:	push   DWORD PTR [eax+0x4]
  40a14f:	push   DWORD PTR [eax]
  40a151:	call   0x40b18f
  40a156:	add    esp,0x14
  40a159:	test   edi,edi
  40a15b:	jne    0x40a16d
  40a15d:	call   0x402568
  40a162:	mov    DWORD PTR [eax],ebx
  40a164:	call   0x4016b6
  40a169:	mov    eax,ebx
  40a16b:	jmp    0x40a1d9
  40a16d:	push   esi
  40a16e:	mov    esi,DWORD PTR [ebp+0x10]
  40a171:	test   esi,esi
  40a173:	jne    0x40a185
  40a175:	call   0x402568
  40a17a:	mov    DWORD PTR [eax],ebx
  40a17c:	call   0x4016b6
  40a181:	mov    eax,ebx
  40a183:	jmp    0x40a1d8
  40a185:	or     ecx,0xffffffff
  40a188:	cmp    esi,ecx
  40a18a:	je     0x40a199
  40a18c:	xor    eax,eax
  40a18e:	mov    ecx,esi
  40a190:	cmp    DWORD PTR [ebp-0x2c],0x2d
  40a194:	sete   al
  40a197:	sub    ecx,eax
  40a199:	mov    ebx,DWORD PTR [ebp+0x14]
  40a19c:	lea    eax,[ebp-0x2c]
  40a19f:	push   eax
  40a1a0:	mov    eax,DWORD PTR [ebp-0x28]
  40a1a3:	add    eax,ebx
  40a1a5:	push   eax
  40a1a6:	xor    eax,eax
  40a1a8:	cmp    DWORD PTR [ebp-0x2c],0x2d
  40a1ac:	push   ecx
  40a1ad:	sete   al
  40a1b0:	add    eax,edi
  40a1b2:	push   eax
  40a1b3:	call   0x40b017
  40a1b8:	add    esp,0x10
  40a1bb:	test   eax,eax
  40a1bd:	je     0x40a1c4
  40a1bf:	mov    BYTE PTR [edi],0x0
  40a1c2:	jmp    0x40a1d8
  40a1c4:	push   DWORD PTR [ebp+0x18]
  40a1c7:	lea    eax,[ebp-0x2c]
  40a1ca:	push   0x0
  40a1cc:	push   eax
  40a1cd:	push   ebx
  40a1ce:	push   esi
  40a1cf:	push   edi
  40a1d0:	call   0x40a03c
  40a1d5:	add    esp,0x18
  40a1d8:	pop    esi
  40a1d9:	mov    ecx,DWORD PTR [ebp-0x4]
  40a1dc:	pop    edi
  40a1dd:	xor    ecx,ebp
  40a1df:	pop    ebx
  40a1e0:	call   0x40120d
  40a1e5:	mov    esp,ebp
  40a1e7:	pop    ebp
  40a1e8:	ret
  40a1e9:	push   ebp
  40a1ea:	mov    ebp,esp
  40a1ec:	sub    esp,0x30
  40a1ef:	mov    eax,ds:0x412000
  40a1f4:	xor    eax,ebp
  40a1f6:	mov    DWORD PTR [ebp-0x4],eax
  40a1f9:	mov    eax,DWORD PTR [ebp+0x8]
  40a1fc:	lea    ecx,[ebp-0x1c]
  40a1ff:	push   ebx
  40a200:	push   edi
  40a201:	mov    edi,DWORD PTR [ebp+0xc]
  40a204:	push   0x16
  40a206:	pop    ebx
  40a207:	push   ebx
  40a208:	push   ecx
  40a209:	lea    ecx,[ebp-0x30]
  40a20c:	push   ecx
  40a20d:	push   DWORD PTR [eax+0x4]
  40a210:	push   DWORD PTR [eax]
  40a212:	call   0x40b18f
  40a217:	add    esp,0x14
  40a21a:	test   edi,edi
  40a21c:	jne    0x40a231
  40a21e:	call   0x402568
  40a223:	mov    DWORD PTR [eax],ebx
  40a225:	call   0x4016b6
  40a22a:	mov    eax,ebx
  40a22c:	jmp    0x40a2d8
  40a231:	push   esi
  40a232:	mov    esi,DWORD PTR [ebp+0x10]
  40a235:	test   esi,esi
  40a237:	jne    0x40a24c
  40a239:	call   0x402568
  40a23e:	mov    DWORD PTR [eax],ebx
  40a240:	call   0x4016b6
  40a245:	mov    eax,ebx
  40a247:	jmp    0x40a2d7
  40a24c:	mov    eax,DWORD PTR [ebp-0x2c]
  40a24f:	xor    ecx,ecx
  40a251:	dec    eax
  40a252:	cmp    DWORD PTR [ebp-0x30],0x2d
  40a256:	mov    DWORD PTR [ebp-0x20],eax
  40a259:	sete   cl
  40a25c:	or     eax,0xffffffff
  40a25f:	lea    ebx,[ecx+edi*1]
  40a262:	cmp    esi,eax
  40a264:	je     0x40a26a
  40a266:	mov    eax,esi
  40a268:	sub    eax,ecx
  40a26a:	lea    ecx,[ebp-0x30]
  40a26d:	push   ecx
  40a26e:	push   DWORD PTR [ebp+0x14]
  40a271:	push   eax
  40a272:	push   ebx
  40a273:	call   0x40b017
  40a278:	add    esp,0x10
  40a27b:	test   eax,eax
  40a27d:	je     0x40a284
  40a27f:	mov    BYTE PTR [edi],0x0
  40a282:	jmp    0x40a2d7
  40a284:	mov    eax,DWORD PTR [ebp-0x2c]
  40a287:	dec    eax
  40a288:	cmp    DWORD PTR [ebp-0x20],eax
  40a28b:	setl   cl
  40a28e:	cmp    eax,0xfffffffc
  40a291:	jl     0x40a2be
  40a293:	cmp    eax,DWORD PTR [ebp+0x14]
  40a296:	jge    0x40a2be
  40a298:	test   cl,cl
  40a29a:	je     0x40a2a6
  40a29c:	mov    al,BYTE PTR [ebx]
  40a29e:	inc    ebx
  40a29f:	test   al,al
  40a2a1:	jne    0x40a29c
  40a2a3:	mov    BYTE PTR [ebx-0x2],al
  40a2a6:	push   DWORD PTR [ebp+0x1c]
  40a2a9:	lea    eax,[ebp-0x30]
  40a2ac:	push   0x1
  40a2ae:	push   eax
  40a2af:	push   DWORD PTR [ebp+0x14]
  40a2b2:	push   esi
  40a2b3:	push   edi
  40a2b4:	call   0x40a03c
  40a2b9:	add    esp,0x18
  40a2bc:	jmp    0x40a2d7
  40a2be:	push   DWORD PTR [ebp+0x1c]
  40a2c1:	lea    eax,[ebp-0x30]
  40a2c4:	push   0x1
  40a2c6:	push   eax
  40a2c7:	push   DWORD PTR [ebp+0x18]
  40a2ca:	push   DWORD PTR [ebp+0x14]
  40a2cd:	push   esi
  40a2ce:	push   edi
  40a2cf:	call   0x409e1d
  40a2d4:	add    esp,0x1c
  40a2d7:	pop    esi
  40a2d8:	mov    ecx,DWORD PTR [ebp-0x4]
  40a2db:	pop    edi
  40a2dc:	xor    ecx,ebp
  40a2de:	pop    ebx
  40a2df:	call   0x40120d
  40a2e4:	mov    esp,ebp
  40a2e6:	pop    ebp
  40a2e7:	ret
  40a2e8:	push   ebp
  40a2e9:	mov    ebp,esp
  40a2eb:	push   0x0
  40a2ed:	push   DWORD PTR [ebp+0x8]
  40a2f0:	call   0x40a2f9
  40a2f5:	pop    ecx
  40a2f6:	pop    ecx
  40a2f7:	pop    ebp
  40a2f8:	ret
  40a2f9:	push   ebp
  40a2fa:	mov    ebp,esp
  40a2fc:	sub    esp,0x10
  40a2ff:	push   edi
  40a300:	push   DWORD PTR [ebp+0xc]
  40a303:	lea    ecx,[ebp-0x10]
  40a306:	call   0x401840
  40a30b:	mov    edx,DWORD PTR [ebp+0x8]
  40a30e:	mov    edi,DWORD PTR [ebp-0x10]
  40a311:	mov    cl,BYTE PTR [edx]
  40a313:	test   cl,cl
  40a315:	je     0x40a32c
  40a317:	mov    eax,DWORD PTR [edi+0x84]
  40a31d:	mov    eax,DWORD PTR [eax]
  40a31f:	mov    al,BYTE PTR [eax]
  40a321:	cmp    cl,al
  40a323:	je     0x40a32c
  40a325:	inc    edx
  40a326:	mov    cl,BYTE PTR [edx]
  40a328:	test   cl,cl
  40a32a:	jne    0x40a321
  40a32c:	mov    al,BYTE PTR [edx]
  40a32e:	inc    edx
  40a32f:	test   al,al
  40a331:	je     0x40a367
  40a333:	jmp    0x40a33e
  40a335:	cmp    al,0x65
  40a337:	je     0x40a344
  40a339:	cmp    al,0x45
  40a33b:	je     0x40a344
  40a33d:	inc    edx
  40a33e:	mov    al,BYTE PTR [edx]
  40a340:	test   al,al
  40a342:	jne    0x40a335
  40a344:	push   esi
  40a345:	mov    esi,edx
  40a347:	dec    edx
  40a348:	cmp    BYTE PTR [edx],0x30
  40a34b:	je     0x40a347
  40a34d:	mov    eax,DWORD PTR [edi+0x84]
  40a353:	mov    ecx,DWORD PTR [eax]
  40a355:	mov    al,BYTE PTR [edx]
  40a357:	cmp    al,BYTE PTR [ecx]
  40a359:	jne    0x40a35c
  40a35b:	dec    edx
  40a35c:	mov    al,BYTE PTR [esi]
  40a35e:	inc    edx
  40a35f:	inc    esi
  40a360:	mov    BYTE PTR [edx],al
  40a362:	test   al,al
  40a364:	jne    0x40a35c
  40a366:	pop    esi
  40a367:	cmp    BYTE PTR [ebp-0x4],0x0
  40a36b:	pop    edi
  40a36c:	je     0x40a375
  40a36e:	mov    eax,DWORD PTR [ebp-0x8]
  40a371:	and    DWORD PTR [eax+0x70],0xfffffffd
  40a375:	mov    esp,ebp
  40a377:	pop    ebp
  40a378:	ret
  40a379:	push   ebp
  40a37a:	mov    ebp,esp
  40a37c:	push   0x0
  40a37e:	push   DWORD PTR [ebp+0x10]
  40a381:	push   DWORD PTR [ebp+0xc]
  40a384:	push   DWORD PTR [ebp+0x8]
  40a387:	call   0x40a391
  40a38c:	add    esp,0x10
  40a38f:	pop    ebp
  40a390:	ret
  40a391:	push   ebp
  40a392:	mov    ebp,esp
  40a394:	push   ecx
  40a395:	push   ecx
  40a396:	cmp    DWORD PTR [ebp+0x8],0x0
  40a39a:	push   DWORD PTR [ebp+0x14]
  40a39d:	push   DWORD PTR [ebp+0x10]
  40a3a0:	je     0x40a3bb
  40a3a2:	lea    eax,[ebp-0x8]
  40a3a5:	push   eax
  40a3a6:	call   0x408615
  40a3ab:	mov    ecx,DWORD PTR [ebp+0xc]
  40a3ae:	mov    eax,DWORD PTR [ebp-0x8]
  40a3b1:	mov    DWORD PTR [ecx],eax
  40a3b3:	mov    eax,DWORD PTR [ebp-0x4]
  40a3b6:	mov    DWORD PTR [ecx+0x4],eax
  40a3b9:	jmp    0x40a3cc
  40a3bb:	lea    eax,[ebp+0x8]
  40a3be:	push   eax
  40a3bf:	call   0x4086a3
  40a3c4:	mov    ecx,DWORD PTR [ebp+0xc]
  40a3c7:	mov    eax,DWORD PTR [ebp+0x8]
  40a3ca:	mov    DWORD PTR [ecx],eax
  40a3cc:	add    esp,0xc
  40a3cf:	mov    esp,ebp
  40a3d1:	pop    ebp
  40a3d2:	ret
  40a3d3:	push   ebp
  40a3d4:	mov    ebp,esp
  40a3d6:	push   0x0
  40a3d8:	push   DWORD PTR [ebp+0x8]
  40a3db:	call   0x40a3e4
  40a3e0:	pop    ecx
  40a3e1:	pop    ecx
  40a3e2:	pop    ebp
  40a3e3:	ret
  40a3e4:	push   ebp
  40a3e5:	mov    ebp,esp
  40a3e7:	sub    esp,0x10
  40a3ea:	lea    ecx,[ebp-0x10]
  40a3ed:	push   esi
  40a3ee:	push   DWORD PTR [ebp+0xc]
  40a3f1:	call   0x401840
  40a3f6:	mov    esi,DWORD PTR [ebp+0x8]
  40a3f9:	movsx  eax,BYTE PTR [esi]
  40a3fc:	push   eax
  40a3fd:	call   0x40a861
  40a402:	cmp    eax,0x65
  40a405:	jmp    0x40a413
  40a407:	inc    esi
  40a408:	movzx  eax,BYTE PTR [esi]
  40a40b:	push   eax
  40a40c:	call   0x40a6f3
  40a411:	test   eax,eax
  40a413:	pop    ecx
  40a414:	jne    0x40a407
  40a416:	movsx  eax,BYTE PTR [esi]
  40a419:	push   eax
  40a41a:	call   0x40a861
  40a41f:	pop    ecx
  40a420:	cmp    eax,0x78
  40a423:	jne    0x40a428
  40a425:	add    esi,0x2
  40a428:	mov    eax,DWORD PTR [ebp-0x10]
  40a42b:	mov    cl,BYTE PTR [esi]
  40a42d:	mov    eax,DWORD PTR [eax+0x84]
  40a433:	mov    eax,DWORD PTR [eax]
  40a435:	mov    al,BYTE PTR [eax]
  40a437:	mov    BYTE PTR [esi],al
  40a439:	inc    esi
  40a43a:	mov    al,BYTE PTR [esi]
  40a43c:	mov    BYTE PTR [esi],cl
  40a43e:	mov    cl,al
  40a440:	mov    al,BYTE PTR [esi]
  40a442:	inc    esi
  40a443:	test   al,al
  40a445:	jne    0x40a43a
  40a447:	pop    esi
  40a448:	cmp    BYTE PTR [ebp-0x4],al
  40a44b:	je     0x40a454
  40a44d:	mov    eax,DWORD PTR [ebp-0x8]
  40a450:	and    DWORD PTR [eax+0x70],0xfffffffd
  40a454:	mov    esp,ebp
  40a456:	pop    ebp
  40a457:	ret
  40a458:	push   ebp
  40a459:	mov    ebp,esp
  40a45b:	mov    eax,DWORD PTR [ebp+0x8]
  40a45e:	fldz
  40a460:	fcomp  QWORD PTR [eax]
  40a462:	fnstsw ax
  40a464:	test   ah,0x41
  40a467:	jp     0x40a46e
  40a469:	xor    eax,eax
  40a46b:	inc    eax
  40a46c:	pop    ebp
  40a46d:	ret
  40a46e:	xor    eax,eax
  40a470:	pop    ebp
  40a471:	ret
  40a472:	push   ebp
  40a473:	mov    ebp,esp
  40a475:	push   edi
  40a476:	mov    edi,DWORD PTR [ebp+0xc]
  40a479:	test   edi,edi
  40a47b:	je     0x40a497
  40a47d:	push   esi
  40a47e:	mov    esi,DWORD PTR [ebp+0x8]
  40a481:	push   esi
  40a482:	call   0x405580
  40a487:	inc    eax
  40a488:	push   eax
  40a489:	lea    eax,[esi+edi*1]
  40a48c:	push   esi
  40a48d:	push   eax
  40a48e:	call   0x40a890
  40a493:	add    esp,0x10
  40a496:	pop    esi
  40a497:	pop    edi
  40a498:	pop    ebp
  40a499:	ret
  40a49a:	push   esi
  40a49b:	push   0x30000
  40a4a0:	push   0x10000
  40a4a5:	xor    esi,esi
  40a4a7:	push   esi
  40a4a8:	call   0x40b31f
  40a4ad:	add    esp,0xc
  40a4b0:	test   eax,eax
  40a4b2:	jne    0x40a4b6
  40a4b4:	pop    esi
  40a4b5:	ret
  40a4b6:	push   esi
  40a4b7:	push   esi
  40a4b8:	push   esi
  40a4b9:	push   esi
  40a4ba:	push   esi
  40a4bb:	call   0x4016c6
  40a4c0:	int3
  40a4c1:	push   ebp
  40a4c2:	mov    ebp,esp
  40a4c4:	sub    esp,0x1c
  40a4c7:	push   ebx
  40a4c8:	mov    ebx,DWORD PTR [ebp+0x10]
  40a4cb:	xor    edx,edx
  40a4cd:	mov    eax,0x404e
  40a4d2:	push   esi
  40a4d3:	push   edi
  40a4d4:	mov    DWORD PTR [ebp-0x4],eax
  40a4d7:	mov    DWORD PTR [ebx],edx
  40a4d9:	mov    DWORD PTR [ebx+0x4],edx
  40a4dc:	mov    DWORD PTR [ebx+0x8],edx
  40a4df:	cmp    DWORD PTR [ebp+0xc],edx
  40a4e2:	jbe    0x40a624
  40a4e8:	mov    ecx,edx
  40a4ea:	mov    DWORD PTR [ebp+0x10],edx
  40a4ed:	mov    DWORD PTR [ebp-0xc],ecx
  40a4f0:	mov    DWORD PTR [ebp-0x8],edx
  40a4f3:	mov    edx,DWORD PTR [ebp-0xc]
  40a4f6:	lea    edi,[ebp-0x1c]
  40a4f9:	mov    esi,ebx
  40a4fb:	mov    eax,ecx
  40a4fd:	shr    eax,0x1f
  40a500:	add    edx,edx
  40a502:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40a503:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40a504:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40a505:	mov    esi,DWORD PTR [ebp+0x10]
  40a508:	mov    ecx,esi
  40a50a:	mov    edi,DWORD PTR [ebp-0x8]
  40a50d:	add    esi,esi
  40a50f:	or     esi,eax
  40a511:	shr    ecx,0x1f
  40a514:	add    edi,edi
  40a516:	mov    eax,edx
  40a518:	or     edi,ecx
  40a51a:	shr    eax,0x1f
  40a51d:	mov    ecx,esi
  40a51f:	add    edx,edx
  40a521:	add    esi,esi
  40a523:	shr    ecx,0x1f
  40a526:	or     esi,eax
  40a528:	mov    DWORD PTR [ebx],edx
  40a52a:	mov    eax,DWORD PTR [ebp-0x1c]
  40a52d:	add    edi,edi
  40a52f:	or     edi,ecx
  40a531:	mov    DWORD PTR [ebx+0x4],esi
  40a534:	add    eax,edx
  40a536:	mov    DWORD PTR [ebx+0x8],edi
  40a539:	xor    ecx,ecx
  40a53b:	mov    DWORD PTR [ebp+0x10],eax
  40a53e:	cmp    eax,edx
  40a540:	jb     0x40a547
  40a542:	cmp    eax,DWORD PTR [ebp-0x1c]
  40a545:	jae    0x40a54a
  40a547:	xor    ecx,ecx
  40a549:	inc    ecx
  40a54a:	mov    DWORD PTR [ebx],eax
  40a54c:	test   ecx,ecx
  40a54e:	je     0x40a56e
  40a550:	mov    eax,esi
  40a552:	xor    ecx,ecx
  40a554:	lea    esi,[eax+0x1]
  40a557:	cmp    esi,eax
  40a559:	jb     0x40a560
  40a55b:	cmp    esi,0x1
  40a55e:	jae    0x40a563
  40a560:	xor    ecx,ecx
  40a562:	inc    ecx
  40a563:	mov    DWORD PTR [ebx+0x4],esi
  40a566:	test   ecx,ecx
  40a568:	je     0x40a56e
  40a56a:	inc    edi
  40a56b:	mov    DWORD PTR [ebx+0x8],edi
  40a56e:	mov    edx,DWORD PTR [ebp-0x18]
  40a571:	xor    eax,eax
  40a573:	lea    ecx,[esi+edx*1]
  40a576:	mov    DWORD PTR [ebp-0xc],ecx
  40a579:	cmp    ecx,esi
  40a57b:	jb     0x40a581
  40a57d:	cmp    ecx,edx
  40a57f:	jae    0x40a584
  40a581:	xor    eax,eax
  40a583:	inc    eax
  40a584:	mov    DWORD PTR [ebx+0x4],ecx
  40a587:	test   eax,eax
  40a589:	je     0x40a58f
  40a58b:	inc    edi
  40a58c:	mov    DWORD PTR [ebx+0x8],edi
  40a58f:	mov    edx,DWORD PTR [ebp+0x10]
  40a592:	mov    eax,edx
  40a594:	mov    esi,DWORD PTR [ebp-0xc]
  40a597:	add    edx,edx
  40a599:	add    edi,DWORD PTR [ebp-0x14]
  40a59c:	add    esi,esi
  40a59e:	and    DWORD PTR [ebp-0x10],0x0
  40a5a2:	add    edi,edi
  40a5a4:	shr    eax,0x1f
  40a5a7:	or     esi,eax
  40a5a9:	shr    ecx,0x1f
  40a5ac:	mov    eax,DWORD PTR [ebp+0x8]
  40a5af:	or     edi,ecx
  40a5b1:	mov    DWORD PTR [ebx],edx
  40a5b3:	mov    DWORD PTR [ebx+0x4],esi
  40a5b6:	mov    DWORD PTR [ebx+0x8],edi
  40a5b9:	movsx  eax,BYTE PTR [eax]
  40a5bc:	mov    DWORD PTR [ebp+0x10],esi
  40a5bf:	mov    DWORD PTR [ebp-0x8],edi
  40a5c2:	mov    DWORD PTR [ebp-0x1c],eax
  40a5c5:	lea    ecx,[edx+eax*1]
  40a5c8:	mov    DWORD PTR [ebp-0xc],ecx
  40a5cb:	cmp    ecx,edx
  40a5cd:	jb     0x40a5d3
  40a5cf:	cmp    ecx,eax
  40a5d1:	jae    0x40a5d8
  40a5d3:	xor    eax,eax
  40a5d5:	inc    eax
  40a5d6:	jmp    0x40a5db
  40a5d8:	mov    eax,DWORD PTR [ebp-0x10]
  40a5db:	mov    DWORD PTR [ebx],ecx
  40a5dd:	test   eax,eax
  40a5df:	je     0x40a605
  40a5e1:	mov    eax,esi
  40a5e3:	xor    edx,edx
  40a5e5:	lea    esi,[eax+0x1]
  40a5e8:	mov    DWORD PTR [ebp+0x10],esi
  40a5eb:	cmp    esi,eax
  40a5ed:	jb     0x40a5f4
  40a5ef:	cmp    esi,0x1
  40a5f2:	jae    0x40a5f7
  40a5f4:	xor    edx,edx
  40a5f6:	inc    edx
  40a5f7:	mov    DWORD PTR [ebx+0x4],esi
  40a5fa:	test   edx,edx
  40a5fc:	je     0x40a605
  40a5fe:	inc    edi
  40a5ff:	mov    DWORD PTR [ebp-0x8],edi
  40a602:	mov    DWORD PTR [ebx+0x8],edi
  40a605:	mov    eax,DWORD PTR [ebp+0xc]
  40a608:	dec    eax
  40a609:	mov    DWORD PTR [ebx+0x4],esi
  40a60c:	inc    DWORD PTR [ebp+0x8]
  40a60f:	mov    DWORD PTR [ebx+0x8],edi
  40a612:	mov    DWORD PTR [ebp+0xc],eax
  40a615:	test   eax,eax
  40a617:	jne    0x40a4f3
  40a61d:	mov    eax,0x404e
  40a622:	xor    edx,edx
  40a624:	cmp    DWORD PTR [ebx+0x8],edx
  40a627:	jne    0x40a657
  40a629:	mov    edx,DWORD PTR [ebx+0x4]
  40a62c:	mov    ecx,DWORD PTR [ebx]
  40a62e:	mov    esi,edx
  40a630:	mov    eax,ecx
  40a632:	shl    edx,0x10
  40a635:	shr    eax,0x10
  40a638:	or     edx,eax
  40a63a:	shr    esi,0x10
  40a63d:	mov    eax,DWORD PTR [ebp-0x4]
  40a640:	shl    ecx,0x10
  40a643:	add    eax,0xfff0
  40a648:	mov    DWORD PTR [ebx],ecx
  40a64a:	mov    DWORD PTR [ebp-0x4],eax
  40a64d:	test   esi,esi
  40a64f:	je     0x40a62c
  40a651:	mov    DWORD PTR [ebx+0x4],edx
  40a654:	mov    DWORD PTR [ebx+0x8],esi
  40a657:	mov    edx,DWORD PTR [ebx+0x8]
  40a65a:	test   edx,0x8000
  40a660:	jne    0x40a696
  40a662:	mov    edi,DWORD PTR [ebx]
  40a664:	mov    esi,DWORD PTR [ebx+0x4]
  40a667:	mov    eax,edi
  40a669:	mov    ecx,esi
  40a66b:	shr    eax,0x1f
  40a66e:	add    esi,esi
  40a670:	or     esi,eax
  40a672:	shr    ecx,0x1f
  40a675:	mov    eax,DWORD PTR [ebp-0x4]
  40a678:	add    edx,edx
  40a67a:	or     edx,ecx
  40a67c:	add    eax,0xffff
  40a681:	add    edi,edi
  40a683:	mov    DWORD PTR [ebp-0x4],eax
  40a686:	test   edx,0x8000
  40a68c:	je     0x40a667
  40a68e:	mov    DWORD PTR [ebx],edi
  40a690:	mov    DWORD PTR [ebx+0x4],esi
  40a693:	mov    DWORD PTR [ebx+0x8],edx
  40a696:	pop    edi
  40a697:	pop    esi
  40a698:	mov    WORD PTR [ebx+0xa],ax
  40a69c:	pop    ebx
  40a69d:	mov    esp,ebp
  40a69f:	pop    ebp
  40a6a0:	ret
  40a6a1:	push   ebp
  40a6a2:	mov    ebp,esp
  40a6a4:	sub    esp,0x10
  40a6a7:	push   DWORD PTR [ebp+0xc]
  40a6aa:	lea    ecx,[ebp-0x10]
  40a6ad:	call   0x401840
  40a6b2:	mov    ecx,DWORD PTR [ebp-0x10]
  40a6b5:	cmp    DWORD PTR [ecx+0x74],0x1
  40a6b9:	jle    0x40a6d0
  40a6bb:	lea    eax,[ebp-0x10]
  40a6be:	push   eax
  40a6bf:	push   0x4
  40a6c1:	push   DWORD PTR [ebp+0x8]
  40a6c4:	call   0x408299
  40a6c9:	add    esp,0xc
  40a6cc:	mov    ecx,eax
  40a6ce:	jmp    0x40a6e0
  40a6d0:	mov    ecx,DWORD PTR [ecx+0x90]
  40a6d6:	mov    eax,DWORD PTR [ebp+0x8]
  40a6d9:	movzx  ecx,WORD PTR [ecx+eax*2]
  40a6dd:	and    ecx,0x4
  40a6e0:	cmp    BYTE PTR [ebp-0x4],0x0
  40a6e4:	je     0x40a6ed
  40a6e6:	mov    eax,DWORD PTR [ebp-0x8]
  40a6e9:	and    DWORD PTR [eax+0x70],0xfffffffd
  40a6ed:	mov    eax,ecx
  40a6ef:	mov    esp,ebp
  40a6f1:	pop    ebp
  40a6f2:	ret
  40a6f3:	push   ebp
  40a6f4:	mov    ebp,esp
  40a6f6:	cmp    DWORD PTR ds:0x413e70,0x0
  40a6fd:	jne    0x40a710
  40a6ff:	mov    ecx,DWORD PTR [ebp+0x8]
  40a702:	mov    eax,ds:0x412b70
  40a707:	movzx  eax,WORD PTR [eax+ecx*2]
  40a70b:	and    eax,0x4
  40a70e:	pop    ebp
  40a70f:	ret
  40a710:	push   0x0
  40a712:	push   DWORD PTR [ebp+0x8]
  40a715:	call   0x40a6a1
  40a71a:	pop    ecx
  40a71b:	pop    ecx
  40a71c:	pop    ebp
  40a71d:	ret
  40a71e:	push   ebp
  40a71f:	mov    ebp,esp
  40a721:	sub    esp,0x18
  40a724:	lea    ecx,[ebp-0x18]
  40a727:	push   ebx
  40a728:	push   edi
  40a729:	push   DWORD PTR [ebp+0xc]
  40a72c:	call   0x401840
  40a731:	mov    ebx,DWORD PTR [ebp+0x8]
  40a734:	mov    edi,0x100
  40a739:	cmp    ebx,edi
  40a73b:	jae    0x40a79d
  40a73d:	mov    ecx,DWORD PTR [ebp-0x18]
  40a740:	cmp    DWORD PTR [ecx+0x74],0x1
  40a744:	jle    0x40a75a
  40a746:	lea    eax,[ebp-0x18]
  40a749:	push   eax
  40a74a:	push   0x1
  40a74c:	push   ebx
  40a74d:	call   0x408299
  40a752:	mov    ecx,DWORD PTR [ebp-0x18]
  40a755:	add    esp,0xc
  40a758:	jmp    0x40a767
  40a75a:	mov    eax,DWORD PTR [ecx+0x90]
  40a760:	movzx  eax,WORD PTR [eax+ebx*2]
  40a764:	and    eax,0x1
  40a767:	test   eax,eax
  40a769:	je     0x40a789
  40a76b:	cmp    BYTE PTR [ebp-0xc],0x0
  40a76f:	mov    eax,DWORD PTR [ecx+0x94]
  40a775:	movzx  ecx,BYTE PTR [eax+ebx*1]
  40a779:	je     0x40a782
  40a77b:	mov    eax,DWORD PTR [ebp-0x10]
  40a77e:	and    DWORD PTR [eax+0x70],0xfffffffd
  40a782:	mov    eax,ecx
  40a784:	jmp    0x40a85b
  40a789:	cmp    BYTE PTR [ebp-0xc],0x0
  40a78d:	je     0x40a796
  40a78f:	mov    ecx,DWORD PTR [ebp-0x10]
  40a792:	and    DWORD PTR [ecx+0x70],0xfffffffd
  40a796:	mov    eax,ebx
  40a798:	jmp    0x40a85b
  40a79d:	mov    eax,DWORD PTR [ebp-0x18]
  40a7a0:	cmp    DWORD PTR [eax+0x74],0x1
  40a7a4:	jle    0x40a7d3
  40a7a6:	mov    eax,ebx
  40a7a8:	lea    ecx,[ebp-0x18]
  40a7ab:	sar    eax,0x8
  40a7ae:	mov    DWORD PTR [ebp+0x8],eax
  40a7b1:	push   ecx
  40a7b2:	movzx  eax,al
  40a7b5:	push   eax
  40a7b6:	call   0x405531
  40a7bb:	pop    ecx
  40a7bc:	pop    ecx
  40a7bd:	test   eax,eax
  40a7bf:	je     0x40a7d3
  40a7c1:	mov    eax,DWORD PTR [ebp+0x8]
  40a7c4:	push   0x2
  40a7c6:	mov    BYTE PTR [ebp-0x4],al
  40a7c9:	mov    BYTE PTR [ebp-0x3],bl
  40a7cc:	mov    BYTE PTR [ebp-0x2],0x0
  40a7d0:	pop    ecx
  40a7d1:	jmp    0x40a7e8
  40a7d3:	call   0x402568
  40a7d8:	xor    ecx,ecx
  40a7da:	inc    ecx
  40a7db:	mov    DWORD PTR [eax],0x2a
  40a7e1:	mov    BYTE PTR [ebp-0x4],bl
  40a7e4:	mov    BYTE PTR [ebp-0x3],0x0
  40a7e8:	mov    eax,DWORD PTR [ebp-0x18]
  40a7eb:	lea    edx,[ebp-0x8]
  40a7ee:	push   0x1
  40a7f0:	push   DWORD PTR [eax+0x4]
  40a7f3:	push   0x3
  40a7f5:	push   edx
  40a7f6:	push   ecx
  40a7f7:	lea    ecx,[ebp-0x4]
  40a7fa:	push   ecx
  40a7fb:	push   edi
  40a7fc:	push   DWORD PTR [eax+0xa8]
  40a802:	lea    eax,[ebp-0x18]
  40a805:	push   eax
  40a806:	call   0x407402
  40a80b:	add    esp,0x24
  40a80e:	test   eax,eax
  40a810:	jne    0x40a827
  40a812:	cmp    BYTE PTR [ebp-0xc],al
  40a815:	je     0x40a796
  40a81b:	mov    eax,DWORD PTR [ebp-0x10]
  40a81e:	and    DWORD PTR [eax+0x70],0xfffffffd
  40a822:	jmp    0x40a796
  40a827:	cmp    eax,0x1
  40a82a:	jne    0x40a83f
  40a82c:	cmp    BYTE PTR [ebp-0xc],0x0
  40a830:	movzx  eax,BYTE PTR [ebp-0x8]
  40a834:	je     0x40a85b
  40a836:	mov    ecx,DWORD PTR [ebp-0x10]
  40a839:	and    DWORD PTR [ecx+0x70],0xfffffffd
  40a83d:	jmp    0x40a85b
  40a83f:	movzx  edx,BYTE PTR [ebp-0x8]
  40a843:	movzx  eax,BYTE PTR [ebp-0x7]
  40a847:	shl    edx,0x8
  40a84a:	or     edx,eax
  40a84c:	cmp    BYTE PTR [ebp-0xc],0x0
  40a850:	je     0x40a859
  40a852:	mov    ecx,DWORD PTR [ebp-0x10]
  40a855:	and    DWORD PTR [ecx+0x70],0xfffffffd
  40a859:	mov    eax,edx
  40a85b:	pop    edi
  40a85c:	pop    ebx
  40a85d:	mov    esp,ebp
  40a85f:	pop    ebp
  40a860:	ret
  40a861:	push   ebp
  40a862:	mov    ebp,esp
  40a864:	cmp    DWORD PTR ds:0x413e70,0x0
  40a86b:	jne    0x40a87f
  40a86d:	mov    ecx,DWORD PTR [ebp+0x8]
  40a870:	lea    eax,[ecx-0x41]
  40a873:	cmp    eax,0x19
  40a876:	ja     0x40a87b
  40a878:	add    ecx,0x20
  40a87b:	mov    eax,ecx
  40a87d:	pop    ebp
  40a87e:	ret
  40a87f:	push   0x0
  40a881:	push   DWORD PTR [ebp+0x8]
  40a884:	call   0x40a71e
  40a889:	pop    ecx
  40a88a:	pop    ecx
  40a88b:	pop    ebp
  40a88c:	ret
  40a88d:	int3
  40a88e:	int3
  40a88f:	int3
  40a890:	push   edi
  40a891:	push   esi
  40a892:	mov    esi,DWORD PTR [esp+0x10]
  40a896:	mov    ecx,DWORD PTR [esp+0x14]
  40a89a:	mov    edi,DWORD PTR [esp+0xc]
  40a89e:	mov    eax,ecx
  40a8a0:	mov    edx,ecx
  40a8a2:	add    eax,esi
  40a8a4:	cmp    edi,esi
  40a8a6:	jbe    0x40a8b0
  40a8a8:	cmp    edi,eax
  40a8aa:	jb     0x40ac18
  40a8b0:	bt     DWORD PTR ds:0x413e60,0x1
  40a8b8:	jae    0x40a8c1
  40a8ba:	rep movs BYTE PTR es:[edi],BYTE PTR ds:[esi]
  40a8bc:	jmp    0x40abd8
  40a8c1:	cmp    ecx,0x80
  40a8c7:	jb     0x40aa9b
  40a8cd:	mov    eax,edi
  40a8cf:	xor    eax,esi
  40a8d1:	test   eax,0xf
  40a8d6:	jne    0x40a8e6
  40a8d8:	bt     DWORD PTR ds:0x412cf0,0x1
  40a8e0:	jb     0x40adc0
  40a8e6:	bt     DWORD PTR ds:0x413e60,0x0
  40a8ee:	jae    0x40aa9b
  40a8f4:	test   edi,0x3
  40a8fa:	jne    0x40aab8
  40a900:	test   esi,0x3
  40a906:	jne    0x40aaa3
  40a90c:	bt     edi,0x2
  40a910:	jae    0x40a91f
  40a912:	mov    eax,DWORD PTR [esi]
  40a914:	sub    ecx,0x4
  40a917:	lea    esi,[esi+0x4]
  40a91a:	mov    DWORD PTR [edi],eax
  40a91c:	lea    edi,[edi+0x4]
  40a91f:	bt     edi,0x3
  40a923:	jae    0x40a936
  40a925:	movq   xmm1,QWORD PTR [esi]
  40a929:	sub    ecx,0x8
  40a92c:	lea    esi,[esi+0x8]
  40a92f:	movq   QWORD PTR [edi],xmm1
  40a933:	lea    edi,[edi+0x8]
  40a936:	test   esi,0x7
  40a93c:	je     0x40a9a1
  40a93e:	bt     esi,0x3
  40a942:	jae    0x40a9fa
  40a948:	movdqa xmm1,XMMWORD PTR [esi-0xc]
  40a94d:	lea    esi,[esi-0xc]
  40a950:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  40a955:	sub    ecx,0x30
  40a958:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  40a95d:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  40a962:	lea    esi,[esi+0x30]
  40a965:	cmp    ecx,0x30
  40a968:	movdqa xmm2,xmm3
  40a96c:	palignr xmm3,xmm1,0xc
  40a972:	movdqa XMMWORD PTR [edi],xmm3
  40a976:	movdqa xmm4,xmm0
  40a97a:	palignr xmm0,xmm2,0xc
  40a980:	movdqa XMMWORD PTR [edi+0x10],xmm0
  40a985:	movdqa xmm1,xmm5
  40a989:	palignr xmm5,xmm4,0xc
  40a98f:	movdqa XMMWORD PTR [edi+0x20],xmm5
  40a994:	lea    edi,[edi+0x30]
  40a997:	jge    0x40a950
  40a999:	lea    esi,[esi+0xc]
  40a99c:	jmp    0x40aa50
  40a9a1:	movdqa xmm1,XMMWORD PTR [esi-0x8]
  40a9a6:	lea    esi,[esi-0x8]
  40a9a9:	lea    ecx,[ecx+0x0]
  40a9ac:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  40a9b1:	sub    ecx,0x30
  40a9b4:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  40a9b9:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  40a9be:	lea    esi,[esi+0x30]
  40a9c1:	cmp    ecx,0x30
  40a9c4:	movdqa xmm2,xmm3
  40a9c8:	palignr xmm3,xmm1,0x8
  40a9ce:	movdqa XMMWORD PTR [edi],xmm3
  40a9d2:	movdqa xmm4,xmm0
  40a9d6:	palignr xmm0,xmm2,0x8
  40a9dc:	movdqa XMMWORD PTR [edi+0x10],xmm0
  40a9e1:	movdqa xmm1,xmm5
  40a9e5:	palignr xmm5,xmm4,0x8
  40a9eb:	movdqa XMMWORD PTR [edi+0x20],xmm5
  40a9f0:	lea    edi,[edi+0x30]
  40a9f3:	jge    0x40a9ac
  40a9f5:	lea    esi,[esi+0x8]
  40a9f8:	jmp    0x40aa50
  40a9fa:	movdqa xmm1,XMMWORD PTR [esi-0x4]
  40a9ff:	lea    esi,[esi-0x4]
  40aa02:	mov    edi,edi
  40aa04:	movdqa xmm3,XMMWORD PTR [esi+0x10]
  40aa09:	sub    ecx,0x30
  40aa0c:	movdqa xmm0,XMMWORD PTR [esi+0x20]
  40aa11:	movdqa xmm5,XMMWORD PTR [esi+0x30]
  40aa16:	lea    esi,[esi+0x30]
  40aa19:	cmp    ecx,0x30
  40aa1c:	movdqa xmm2,xmm3
  40aa20:	palignr xmm3,xmm1,0x4
  40aa26:	movdqa XMMWORD PTR [edi],xmm3
  40aa2a:	movdqa xmm4,xmm0
  40aa2e:	palignr xmm0,xmm2,0x4
  40aa34:	movdqa XMMWORD PTR [edi+0x10],xmm0
  40aa39:	movdqa xmm1,xmm5
  40aa3d:	palignr xmm5,xmm4,0x4
  40aa43:	movdqa XMMWORD PTR [edi+0x20],xmm5
  40aa48:	lea    edi,[edi+0x30]
  40aa4b:	jge    0x40aa04
  40aa4d:	lea    esi,[esi+0x4]
  40aa50:	cmp    ecx,0x10
  40aa53:	jl     0x40aa68
  40aa55:	movdqu xmm1,XMMWORD PTR [esi]
  40aa59:	sub    ecx,0x10
  40aa5c:	lea    esi,[esi+0x10]
  40aa5f:	movdqa XMMWORD PTR [edi],xmm1
  40aa63:	lea    edi,[edi+0x10]
  40aa66:	jmp    0x40aa50
  40aa68:	bt     ecx,0x2
  40aa6c:	jae    0x40aa7b
  40aa6e:	mov    eax,DWORD PTR [esi]
  40aa70:	sub    ecx,0x4
  40aa73:	lea    esi,[esi+0x4]
  40aa76:	mov    DWORD PTR [edi],eax
  40aa78:	lea    edi,[edi+0x4]
  40aa7b:	bt     ecx,0x3
  40aa7f:	jae    0x40aa92
  40aa81:	movq   xmm1,QWORD PTR [esi]
  40aa85:	sub    ecx,0x8
  40aa88:	lea    esi,[esi+0x8]
  40aa8b:	movq   QWORD PTR [edi],xmm1
  40aa8f:	lea    edi,[edi+0x8]
  40aa92:	mov    eax,DWORD PTR [ecx*4+0x40abc8]
  40aa99:	jmp    eax
  40aa9b:	test   edi,0x3
  40aaa1:	jne    0x40aab8
  40aaa3:	shr    ecx,0x2
  40aaa6:	and    edx,0x3
  40aaa9:	cmp    ecx,0x8
  40aaac:	jb     0x40aad8
  40aaae:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40aab0:	jmp    DWORD PTR [edx*4+0x40abc8]
  40aab7:	nop
  40aab8:	mov    eax,edi
  40aaba:	mov    edx,0x3
  40aabf:	sub    ecx,0x4
  40aac2:	jb     0x40aad0
  40aac4:	and    eax,0x3
  40aac7:	add    ecx,eax
  40aac9:	jmp    DWORD PTR [eax*4+0x40aadc]
  40aad0:	jmp    DWORD PTR [ecx*4+0x40abd8]
  40aad7:	nop
  40aad8:	jmp    DWORD PTR [ecx*4+0x40ab5c]
  40aadf:	nop
  40aae0:	in     al,dx
  40aae1:	stos   BYTE PTR es:[edi],al
  40aae2:	inc    eax
  40aae3:	add    BYTE PTR [eax],bl
  40aae5:	stos   DWORD PTR es:[edi],eax
  40aae6:	inc    eax
  40aae7:	add    BYTE PTR [ebx+ebp*4],bh
  40aaea:	inc    eax
  40aaeb:	add    BYTE PTR [ebx],ah
  40aaed:	ror    DWORD PTR [edx-0x75f877fa],1
  40aaf3:	inc    esi
  40aaf4:	add    DWORD PTR [eax+0x468a0147],ecx
  40aafa:	add    al,cl
  40aafc:	jmp    0x2883303
  40ab01:	add    esi,0x3
  40ab04:	add    edi,0x3
  40ab07:	cmp    ecx,0x8
  40ab0a:	jb     0x40aad8
  40ab0c:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40ab0e:	jmp    DWORD PTR [edx*4+0x40abc8]
  40ab15:	lea    ecx,[ecx+0x0]
  40ab18:	and    edx,ecx
  40ab1a:	mov    al,BYTE PTR [esi]
  40ab1c:	mov    BYTE PTR [edi],al
  40ab1e:	mov    al,BYTE PTR [esi+0x1]
  40ab21:	shr    ecx,0x2
  40ab24:	mov    BYTE PTR [edi+0x1],al
  40ab27:	add    esi,0x2
  40ab2a:	add    edi,0x2
  40ab2d:	cmp    ecx,0x8
  40ab30:	jb     0x40aad8
  40ab32:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40ab34:	jmp    DWORD PTR [edx*4+0x40abc8]
  40ab3b:	nop
  40ab3c:	and    edx,ecx
  40ab3e:	mov    al,BYTE PTR [esi]
  40ab40:	mov    BYTE PTR [edi],al
  40ab42:	add    esi,0x1
  40ab45:	shr    ecx,0x2
  40ab48:	add    edi,0x1
  40ab4b:	cmp    ecx,0x8
  40ab4e:	jb     0x40aad8
  40ab50:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40ab52:	jmp    DWORD PTR [edx*4+0x40abc8]
  40ab59:	lea    ecx,[ecx+0x0]
  40ab5c:	mov    edi,0xac0040ab
  40ab61:	stos   DWORD PTR es:[edi],eax
  40ab62:	inc    eax
  40ab63:	add    BYTE PTR [ebx+ebp*4-0x5463ffc0],ah
  40ab6a:	inc    eax
  40ab6b:	add    BYTE PTR [ebx+ebp*4-0x5473ffc0],dl
  40ab72:	inc    eax
  40ab73:	add    BYTE PTR [ebx+ebp*4-0x5483ffc0],al
  40ab7a:	inc    eax
  40ab7b:	add    BYTE PTR [ebx-0x761b71bc],cl
  40ab81:	inc    esp
  40ab82:	(bad)
  40ab83:	in     al,0x8b
  40ab85:	inc    esp
  40ab86:	mov    gs,eax
  40ab88:	mov    DWORD PTR [edi+ecx*4-0x18],eax
  40ab8c:	mov    eax,DWORD PTR [esi+ecx*4-0x14]
  40ab90:	mov    DWORD PTR [edi+ecx*4-0x14],eax
  40ab94:	mov    eax,DWORD PTR [esi+ecx*4-0x10]
  40ab98:	mov    DWORD PTR [edi+ecx*4-0x10],eax
  40ab9c:	mov    eax,DWORD PTR [esi+ecx*4-0xc]
  40aba0:	mov    DWORD PTR [edi+ecx*4-0xc],eax
  40aba4:	mov    eax,DWORD PTR [esi+ecx*4-0x8]
  40aba8:	mov    DWORD PTR [edi+ecx*4-0x8],eax
  40abac:	mov    eax,DWORD PTR [esi+ecx*4-0x4]
  40abb0:	mov    DWORD PTR [edi+ecx*4-0x4],eax
  40abb4:	lea    eax,[ecx*4+0x0]
  40abbb:	add    esi,eax
  40abbd:	add    edi,eax
  40abbf:	jmp    DWORD PTR [edx*4+0x40abc8]
  40abc6:	mov    edi,edi
  40abc8:	fsubr  DWORD PTR [ebx-0x541fffc0]
  40abce:	inc    eax
  40abcf:	add    ah,ch
  40abd1:	stos   DWORD PTR es:[edi],eax
  40abd2:	inc    eax
  40abd3:	add    BYTE PTR [eax],al
  40abd5:	lods   al,BYTE PTR ds:[esi]
  40abd6:	inc    eax
  40abd7:	add    BYTE PTR [ebx+0x5e0c2444],cl
  40abdd:	pop    edi
  40abde:	ret
  40abdf:	nop
  40abe0:	mov    al,BYTE PTR [esi]
  40abe2:	mov    BYTE PTR [edi],al
  40abe4:	mov    eax,DWORD PTR [esp+0xc]
  40abe8:	pop    esi
  40abe9:	pop    edi
  40abea:	ret
  40abeb:	nop
  40abec:	mov    al,BYTE PTR [esi]
  40abee:	mov    BYTE PTR [edi],al
  40abf0:	mov    al,BYTE PTR [esi+0x1]
  40abf3:	mov    BYTE PTR [edi+0x1],al
  40abf6:	mov    eax,DWORD PTR [esp+0xc]
  40abfa:	pop    esi
  40abfb:	pop    edi
  40abfc:	ret
  40abfd:	lea    ecx,[ecx+0x0]
  40ac00:	mov    al,BYTE PTR [esi]
  40ac02:	mov    BYTE PTR [edi],al
  40ac04:	mov    al,BYTE PTR [esi+0x1]
  40ac07:	mov    BYTE PTR [edi+0x1],al
  40ac0a:	mov    al,BYTE PTR [esi+0x2]
  40ac0d:	mov    BYTE PTR [edi+0x2],al
  40ac10:	mov    eax,DWORD PTR [esp+0xc]
  40ac14:	pop    esi
  40ac15:	pop    edi
  40ac16:	ret
  40ac17:	nop
  40ac18:	lea    esi,[ecx+esi*1-0x4]
  40ac1c:	lea    edi,[ecx+edi*1-0x4]
  40ac20:	test   edi,0x3
  40ac26:	jne    0x40ac4c
  40ac28:	shr    ecx,0x2
  40ac2b:	and    edx,0x3
  40ac2e:	cmp    ecx,0x8
  40ac31:	jb     0x40ac40
  40ac33:	std
  40ac34:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40ac36:	cld
  40ac37:	jmp    DWORD PTR [edx*4+0x40ad64]
  40ac3e:	mov    edi,edi
  40ac40:	neg    ecx
  40ac42:	jmp    DWORD PTR [ecx*4+0x40ad14]
  40ac49:	lea    ecx,[ecx+0x0]
  40ac4c:	mov    eax,edi
  40ac4e:	mov    edx,0x3
  40ac53:	cmp    ecx,0x4
  40ac56:	jb     0x40ac64
  40ac58:	and    eax,0x3
  40ac5b:	sub    ecx,eax
  40ac5d:	jmp    DWORD PTR [eax*4+0x40ac68]
  40ac64:	jmp    DWORD PTR [ecx*4+0x40ad64]
  40ac6b:	nop
  40ac6c:	js     0x40ac1a
  40ac6e:	inc    eax
  40ac6f:	add    BYTE PTR [esp+ebp*4-0x533bffc0],bl
  40ac76:	inc    eax
  40ac77:	add    BYTE PTR [edx-0x2edcfcba],cl
  40ac7d:	mov    BYTE PTR [edi+0x3],al
  40ac80:	sub    esi,0x1
  40ac83:	shr    ecx,0x2
  40ac86:	sub    edi,0x1
  40ac89:	cmp    ecx,0x8
  40ac8c:	jb     0x40ac40
  40ac8e:	std
  40ac8f:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40ac91:	cld
  40ac92:	jmp    DWORD PTR [edx*4+0x40ad64]
  40ac99:	lea    ecx,[ecx+0x0]
  40ac9c:	mov    al,BYTE PTR [esi+0x3]
  40ac9f:	and    edx,ecx
  40aca1:	mov    BYTE PTR [edi+0x3],al
  40aca4:	mov    al,BYTE PTR [esi+0x2]
  40aca7:	shr    ecx,0x2
  40acaa:	mov    BYTE PTR [edi+0x2],al
  40acad:	sub    esi,0x2
  40acb0:	sub    edi,0x2
  40acb3:	cmp    ecx,0x8
  40acb6:	jb     0x40ac40
  40acb8:	std
  40acb9:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40acbb:	cld
  40acbc:	jmp    DWORD PTR [edx*4+0x40ad64]
  40acc3:	nop
  40acc4:	mov    al,BYTE PTR [esi+0x3]
  40acc7:	and    edx,ecx
  40acc9:	mov    BYTE PTR [edi+0x3],al
  40accc:	mov    al,BYTE PTR [esi+0x2]
  40accf:	mov    BYTE PTR [edi+0x2],al
  40acd2:	mov    al,BYTE PTR [esi+0x1]
  40acd5:	shr    ecx,0x2
  40acd8:	mov    BYTE PTR [edi+0x1],al
  40acdb:	sub    esi,0x3
  40acde:	sub    edi,0x3
  40ace1:	cmp    ecx,0x8
  40ace4:	jb     0x40ac40
  40acea:	std
  40aceb:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40aced:	cld
  40acee:	jmp    DWORD PTR [edx*4+0x40ad64]
  40acf5:	lea    ecx,[ecx+0x0]
  40acf8:	sbb    BYTE PTR [ebp-0x52dfffc0],ch
  40acfe:	inc    eax
  40acff:	add    BYTE PTR [eax],ch
  40ad01:	lods   eax,DWORD PTR ds:[esi]
  40ad02:	inc    eax
  40ad03:	add    BYTE PTR [eax],dh
  40ad05:	lods   eax,DWORD PTR ds:[esi]
  40ad06:	inc    eax
  40ad07:	add    BYTE PTR [eax],bh
  40ad09:	lods   eax,DWORD PTR ds:[esi]
  40ad0a:	inc    eax
  40ad0b:	add    BYTE PTR [eax-0x53],al
  40ad0e:	inc    eax
  40ad0f:	add    BYTE PTR [eax-0x53],cl
  40ad12:	inc    eax
  40ad13:	add    BYTE PTR [ebx-0x53],bl
  40ad16:	inc    eax
  40ad17:	add    BYTE PTR [ebx-0x76e371bc],cl
  40ad1d:	inc    esp
  40ad1e:	(bad)
  40ad1f:	sbb    al,0x8b
  40ad21:	inc    esp
  40ad22:	mov    ds,WORD PTR [eax]
  40ad24:	mov    DWORD PTR [edi+ecx*4+0x18],eax
  40ad28:	mov    eax,DWORD PTR [esi+ecx*4+0x14]
  40ad2c:	mov    DWORD PTR [edi+ecx*4+0x14],eax
  40ad30:	mov    eax,DWORD PTR [esi+ecx*4+0x10]
  40ad34:	mov    DWORD PTR [edi+ecx*4+0x10],eax
  40ad38:	mov    eax,DWORD PTR [esi+ecx*4+0xc]
  40ad3c:	mov    DWORD PTR [edi+ecx*4+0xc],eax
  40ad40:	mov    eax,DWORD PTR [esi+ecx*4+0x8]
  40ad44:	mov    DWORD PTR [edi+ecx*4+0x8],eax
  40ad48:	mov    eax,DWORD PTR [esi+ecx*4+0x4]
  40ad4c:	mov    DWORD PTR [edi+ecx*4+0x4],eax
  40ad50:	lea    eax,[ecx*4+0x0]
  40ad57:	add    esi,eax
  40ad59:	add    edi,eax
  40ad5b:	jmp    DWORD PTR [edx*4+0x40ad64]
  40ad62:	mov    edi,edi
  40ad64:	je     0x40ad13
  40ad66:	inc    eax
  40ad67:	add    BYTE PTR [ebp+ebp*4+0x40],bh
  40ad6b:	add    BYTE PTR [ebp+ebp*4-0x525fffc0],cl
  40ad72:	inc    eax
  40ad73:	add    BYTE PTR [ebx+0x5e0c2444],cl
  40ad79:	pop    edi
  40ad7a:	ret
  40ad7b:	nop
  40ad7c:	mov    al,BYTE PTR [esi+0x3]
  40ad7f:	mov    BYTE PTR [edi+0x3],al
  40ad82:	mov    eax,DWORD PTR [esp+0xc]
  40ad86:	pop    esi
  40ad87:	pop    edi
  40ad88:	ret
  40ad89:	lea    ecx,[ecx+0x0]
  40ad8c:	mov    al,BYTE PTR [esi+0x3]
  40ad8f:	mov    BYTE PTR [edi+0x3],al
  40ad92:	mov    al,BYTE PTR [esi+0x2]
  40ad95:	mov    BYTE PTR [edi+0x2],al
  40ad98:	mov    eax,DWORD PTR [esp+0xc]
  40ad9c:	pop    esi
  40ad9d:	pop    edi
  40ad9e:	ret
  40ad9f:	nop
  40ada0:	mov    al,BYTE PTR [esi+0x3]
  40ada3:	mov    BYTE PTR [edi+0x3],al
  40ada6:	mov    al,BYTE PTR [esi+0x2]
  40ada9:	mov    BYTE PTR [edi+0x2],al
  40adac:	mov    al,BYTE PTR [esi+0x1]
  40adaf:	mov    BYTE PTR [edi+0x1],al
  40adb2:	mov    eax,DWORD PTR [esp+0xc]
  40adb6:	pop    esi
  40adb7:	pop    edi
  40adb8:	ret
  40adb9:	lea    esp,[esp+0x0]
  40adc0:	push   edi
  40adc1:	mov    eax,esi
  40adc3:	and    eax,0xf
  40adc6:	test   eax,eax
  40adc8:	jne    0x40aea0
  40adce:	mov    edx,ecx
  40add0:	and    ecx,0x7f
  40add3:	shr    edx,0x7
  40add6:	je     0x40ae3d
  40add8:	lea    esp,[esp+0x0]
  40addf:	nop
  40ade0:	movdqa xmm0,XMMWORD PTR [esi]
  40ade4:	movdqa xmm1,XMMWORD PTR [esi+0x10]
  40ade9:	movdqa xmm2,XMMWORD PTR [esi+0x20]
  40adee:	movdqa xmm3,XMMWORD PTR [esi+0x30]
  40adf3:	movdqa XMMWORD PTR [edi],xmm0
  40adf7:	movdqa XMMWORD PTR [edi+0x10],xmm1
  40adfc:	movdqa XMMWORD PTR [edi+0x20],xmm2
  40ae01:	movdqa XMMWORD PTR [edi+0x30],xmm3
  40ae06:	movdqa xmm4,XMMWORD PTR [esi+0x40]
  40ae0b:	movdqa xmm5,XMMWORD PTR [esi+0x50]
  40ae10:	movdqa xmm6,XMMWORD PTR [esi+0x60]
  40ae15:	movdqa xmm7,XMMWORD PTR [esi+0x70]
  40ae1a:	movdqa XMMWORD PTR [edi+0x40],xmm4
  40ae1f:	movdqa XMMWORD PTR [edi+0x50],xmm5
  40ae24:	movdqa XMMWORD PTR [edi+0x60],xmm6
  40ae29:	movdqa XMMWORD PTR [edi+0x70],xmm7
  40ae2e:	lea    esi,[esi+0x80]
  40ae34:	lea    edi,[edi+0x80]
  40ae3a:	dec    edx
  40ae3b:	jne    0x40ade0
  40ae3d:	test   ecx,ecx
  40ae3f:	je     0x40ae90
  40ae41:	mov    edx,ecx
  40ae43:	shr    edx,0x4
  40ae46:	test   edx,edx
  40ae48:	je     0x40ae61
  40ae4a:	lea    ebx,[ebx+0x0]
  40ae50:	movdqa xmm0,XMMWORD PTR [esi]
  40ae54:	movdqa XMMWORD PTR [edi],xmm0
  40ae58:	lea    esi,[esi+0x10]
  40ae5b:	lea    edi,[edi+0x10]
  40ae5e:	dec    edx
  40ae5f:	jne    0x40ae50
  40ae61:	and    ecx,0xf
  40ae64:	je     0x40ae90
  40ae66:	mov    eax,ecx
  40ae68:	shr    ecx,0x2
  40ae6b:	je     0x40ae7a
  40ae6d:	mov    edx,DWORD PTR [esi]
  40ae6f:	mov    DWORD PTR [edi],edx
  40ae71:	lea    esi,[esi+0x4]
  40ae74:	lea    edi,[edi+0x4]
  40ae77:	dec    ecx
  40ae78:	jne    0x40ae6d
  40ae7a:	mov    ecx,eax
  40ae7c:	and    ecx,0x3
  40ae7f:	je     0x40ae90
  40ae81:	mov    al,BYTE PTR [esi]
  40ae83:	mov    BYTE PTR [edi],al
  40ae85:	inc    esi
  40ae86:	inc    edi
  40ae87:	dec    ecx
  40ae88:	jne    0x40ae81
  40ae8a:	lea    ebx,[ebx+0x0]
  40ae90:	pop    eax
  40ae91:	pop    esi
  40ae92:	pop    edi
  40ae93:	ret
  40ae94:	lea    esp,[esp+0x0]
  40ae9b:	jmp    0x40aea0
  40ae9d:	int3
  40ae9e:	int3
  40ae9f:	int3
  40aea0:	mov    edx,0x10
  40aea5:	sub    edx,eax
  40aea7:	sub    ecx,edx
  40aea9:	push   ecx
  40aeaa:	mov    eax,edx
  40aeac:	mov    ecx,eax
  40aeae:	and    ecx,0x3
  40aeb1:	je     0x40aebc
  40aeb3:	mov    dl,BYTE PTR [esi]
  40aeb5:	mov    BYTE PTR [edi],dl
  40aeb7:	inc    esi
  40aeb8:	inc    edi
  40aeb9:	dec    ecx
  40aeba:	jne    0x40aeb3
  40aebc:	shr    eax,0x2
  40aebf:	je     0x40aece
  40aec1:	mov    edx,DWORD PTR [esi]
  40aec3:	mov    DWORD PTR [edi],edx
  40aec5:	lea    esi,[esi+0x4]
  40aec8:	lea    edi,[edi+0x4]
  40aecb:	dec    eax
  40aecc:	jne    0x40aec1
  40aece:	pop    ecx
  40aecf:	jmp    0x40adce
  40aed4:	int3
  40aed5:	int3
  40aed6:	int3
  40aed7:	int3
  40aed8:	int3
  40aed9:	int3
  40aeda:	int3
  40aedb:	int3
  40aedc:	int3
  40aedd:	int3
  40aede:	int3
  40aedf:	int3
  40aee0:	push   ebp
  40aee1:	mov    ebp,esp
  40aee3:	push   edi
  40aee4:	cmp    DWORD PTR ds:0x413e5c,0x1
  40aeeb:	jb     0x40afee
  40aef1:	mov    edi,DWORD PTR [ebp+0x8]
  40aef4:	ja     0x40af6d
  40aef6:	movzx  edx,BYTE PTR [ebp+0xc]
  40aefa:	mov    eax,edx
  40aefc:	shl    edx,0x8
  40aeff:	or     edx,eax
  40af01:	movd   xmm3,edx
  40af05:	pshuflw xmm3,xmm3,0x0
  40af0a:	movlhps xmm3,xmm3
  40af0d:	mov    ecx,0xf
  40af12:	and    ecx,edi
  40af14:	or     eax,0xffffffff
  40af17:	shl    eax,cl
  40af19:	sub    edi,ecx
  40af1b:	xor    edx,edx
  40af1d:	movdqu xmm1,XMMWORD PTR [edi]
  40af21:	pxor   xmm2,xmm2
  40af25:	pcmpeqb xmm2,xmm1
  40af29:	pcmpeqb xmm1,xmm3
  40af2d:	pmovmskb ecx,xmm2
  40af31:	and    ecx,eax
  40af33:	jne    0x40af4d
  40af35:	pmovmskb ecx,xmm1
  40af39:	and    ecx,eax
  40af3b:	bsr    eax,ecx
  40af3e:	add    eax,edi
  40af40:	test   ecx,ecx
  40af42:	cmovne edx,eax
  40af45:	or     eax,0xffffffff
  40af48:	add    edi,0x10
  40af4b:	jmp    0x40af1d
  40af4d:	push   ebx
  40af4e:	pmovmskb ebx,xmm1
  40af52:	and    ebx,eax
  40af54:	shl    ecx,1
  40af56:	xor    eax,eax
  40af58:	sub    eax,ecx
  40af5a:	and    ecx,eax
  40af5c:	dec    ecx
  40af5d:	and    ecx,ebx
  40af5f:	pop    ebx
  40af60:	bsr    eax,ecx
  40af63:	add    eax,edi
  40af65:	test   ecx,ecx
  40af67:	cmove  eax,edx
  40af6a:	pop    edi
  40af6b:	leave
  40af6c:	ret
  40af6d:	movzx  edx,BYTE PTR [ebp+0xc]
  40af71:	test   edx,edx
  40af73:	je     0x40afae
  40af75:	xor    eax,eax
  40af77:	test   edi,0xf
  40af7d:	je     0x40af94
  40af7f:	movzx  ecx,BYTE PTR [edi]
  40af82:	cmp    ecx,edx
  40af84:	cmove  eax,edi
  40af87:	test   ecx,ecx
  40af89:	je     0x40afab
  40af8b:	inc    edi
  40af8c:	test   edi,0xf
  40af92:	jne    0x40af7f
  40af94:	movd   xmm0,edx
  40af98:	add    edi,0x10
  40af9b:	pcmpistri xmm0,XMMWORD PTR [edi-0x10],0x40
  40afa2:	lea    ecx,[edi+ecx*1-0x10]
  40afa6:	cmovb  eax,ecx
  40afa9:	jne    0x40af98
  40afab:	pop    edi
  40afac:	leave
  40afad:	ret
  40afae:	mov    eax,0xfffffff0
  40afb3:	and    eax,edi
  40afb5:	pxor   xmm0,xmm0
  40afb9:	pcmpeqb xmm0,XMMWORD PTR [eax]
  40afbd:	mov    ecx,0xf
  40afc2:	and    ecx,edi
  40afc4:	mov    edx,0xffffffff
  40afc9:	shl    edx,cl
  40afcb:	pmovmskb edi,xmm0
  40afcf:	and    edi,edx
  40afd1:	jne    0x40afe7
  40afd3:	pxor   xmm0,xmm0
  40afd7:	pcmpeqb xmm0,XMMWORD PTR [eax+0x10]
  40afdc:	add    eax,0x10
  40afdf:	pmovmskb edi,xmm0
  40afe3:	test   edi,edi
  40afe5:	je     0x40afd3
  40afe7:	bsf    edx,edi
  40afea:	add    eax,edx
  40afec:	jmp    0x40afab
  40afee:	mov    edi,DWORD PTR [ebp+0x8]
  40aff1:	xor    eax,eax
  40aff3:	or     ecx,0xffffffff
  40aff6:	repnz scas al,BYTE PTR es:[edi]
  40aff8:	add    ecx,0x1
  40affb:	neg    ecx
  40affd:	sub    edi,0x1
  40b000:	mov    al,BYTE PTR [ebp+0xc]
  40b003:	std
  40b004:	repnz scas al,BYTE PTR es:[edi]
  40b006:	add    edi,0x1
  40b009:	cmp    BYTE PTR [edi],al
  40b00b:	je     0x40b011
  40b00d:	xor    eax,eax
  40b00f:	jmp    0x40b013
  40b011:	mov    eax,edi
  40b013:	cld
  40b014:	pop    edi
  40b015:	leave
  40b016:	ret
  40b017:	push   ebp
  40b018:	mov    ebp,esp
  40b01a:	mov    edx,DWORD PTR [ebp+0x14]
  40b01d:	push   esi
  40b01e:	mov    esi,DWORD PTR [ebp+0x8]
  40b021:	push   edi
  40b022:	mov    edi,DWORD PTR [edx+0xc]
  40b025:	test   esi,esi
  40b027:	jne    0x40b03f
  40b029:	call   0x402568
  40b02e:	push   0x16
  40b030:	pop    esi
  40b031:	mov    DWORD PTR [eax],esi
  40b033:	call   0x4016b6
  40b038:	mov    eax,esi
  40b03a:	jmp    0x40b0c3
  40b03f:	cmp    DWORD PTR [ebp+0xc],0x0
  40b043:	jbe    0x40b029
  40b045:	mov    ecx,DWORD PTR [ebp+0x10]
  40b048:	mov    BYTE PTR [esi],0x0
  40b04b:	test   ecx,ecx
  40b04d:	jle    0x40b053
  40b04f:	mov    eax,ecx
  40b051:	jmp    0x40b055
  40b053:	xor    eax,eax
  40b055:	inc    eax
  40b056:	cmp    DWORD PTR [ebp+0xc],eax
  40b059:	ja     0x40b064
  40b05b:	call   0x402568
  40b060:	push   0x22
  40b062:	jmp    0x40b030
  40b064:	mov    BYTE PTR [esi],0x30
  40b067:	push   ebx
  40b068:	lea    ebx,[esi+0x1]
  40b06b:	mov    eax,ebx
  40b06d:	test   ecx,ecx
  40b06f:	jle    0x40b08b
  40b071:	mov    dl,BYTE PTR [edi]
  40b073:	test   dl,dl
  40b075:	je     0x40b07d
  40b077:	movsx  edx,dl
  40b07a:	inc    edi
  40b07b:	jmp    0x40b080
  40b07d:	push   0x30
  40b07f:	pop    edx
  40b080:	mov    BYTE PTR [eax],dl
  40b082:	inc    eax
  40b083:	dec    ecx
  40b084:	test   ecx,ecx
  40b086:	jg     0x40b071
  40b088:	mov    edx,DWORD PTR [ebp+0x14]
  40b08b:	mov    BYTE PTR [eax],0x0
  40b08e:	test   ecx,ecx
  40b090:	js     0x40b0a4
  40b092:	cmp    BYTE PTR [edi],0x35
  40b095:	jl     0x40b0a4
  40b097:	jmp    0x40b09c
  40b099:	mov    BYTE PTR [eax],0x30
  40b09c:	dec    eax
  40b09d:	cmp    BYTE PTR [eax],0x39
  40b0a0:	je     0x40b099
  40b0a2:	inc    BYTE PTR [eax]
  40b0a4:	cmp    BYTE PTR [esi],0x31
  40b0a7:	jne    0x40b0ae
  40b0a9:	inc    DWORD PTR [edx+0x4]
  40b0ac:	jmp    0x40b0c0
  40b0ae:	push   ebx
  40b0af:	call   0x405580
  40b0b4:	inc    eax
  40b0b5:	push   eax
  40b0b6:	push   ebx
  40b0b7:	push   esi
  40b0b8:	call   0x40a890
  40b0bd:	add    esp,0x10
  40b0c0:	xor    eax,eax
  40b0c2:	pop    ebx
  40b0c3:	pop    edi
  40b0c4:	pop    esi
  40b0c5:	pop    ebp
  40b0c6:	ret
  40b0c7:	push   ebp
  40b0c8:	mov    ebp,esp
  40b0ca:	push   ecx
  40b0cb:	push   ecx
  40b0cc:	mov    eax,DWORD PTR [ebp+0xc]
  40b0cf:	push   ebx
  40b0d0:	push   esi
  40b0d1:	push   edi
  40b0d2:	movzx  edi,WORD PTR [eax+0x6]
  40b0d6:	mov    ebx,0x80000000
  40b0db:	mov    edx,DWORD PTR [eax+0x4]
  40b0de:	mov    ecx,edi
  40b0e0:	mov    eax,DWORD PTR [eax]
  40b0e2:	and    edi,0x8000
  40b0e8:	shr    ecx,0x4
  40b0eb:	and    edx,0xfffff
  40b0f1:	and    ecx,0x7ff
  40b0f7:	mov    DWORD PTR [ebp-0x8],edi
  40b0fa:	mov    esi,ecx
  40b0fc:	mov    DWORD PTR [ebp-0x4],eax
  40b0ff:	test   esi,esi
  40b101:	je     0x40b11a
  40b103:	cmp    esi,0x7ff
  40b109:	je     0x40b113
  40b10b:	lea    eax,[ecx+0x3c00]
  40b111:	jmp    0x40b138
  40b113:	mov    eax,0x7fff
  40b118:	jmp    0x40b13b
  40b11a:	test   edx,edx
  40b11c:	jne    0x40b130
  40b11e:	test   eax,eax
  40b120:	jne    0x40b130
  40b122:	mov    eax,DWORD PTR [ebp+0x8]
  40b125:	and    DWORD PTR [eax+0x4],edx
  40b128:	and    DWORD PTR [eax],edx
  40b12a:	mov    WORD PTR [eax+0x8],di
  40b12e:	jmp    0x40b188
  40b130:	lea    eax,[ecx+0x3c01]
  40b136:	xor    ebx,ebx
  40b138:	movzx  eax,ax
  40b13b:	mov    ecx,DWORD PTR [ebp-0x4]
  40b13e:	mov    esi,ecx
  40b140:	shr    esi,0x15
  40b143:	shl    edx,0xb
  40b146:	or     esi,edx
  40b148:	shl    ecx,0xb
  40b14b:	or     esi,ebx
  40b14d:	mov    DWORD PTR [ebp+0xc],eax
  40b150:	mov    ebx,DWORD PTR [ebp+0x8]
  40b153:	mov    DWORD PTR [ebx+0x4],esi
  40b156:	mov    DWORD PTR [ebx],ecx
  40b158:	test   esi,esi
  40b15a:	js     0x40b182
  40b15c:	mov    edi,eax
  40b15e:	mov    edx,DWORD PTR [ebx]
  40b160:	add    esi,esi
  40b162:	mov    ecx,edx
  40b164:	add    edi,0xffff
  40b16a:	shr    ecx,0x1f
  40b16d:	or     esi,ecx
  40b16f:	lea    eax,[edx+edx*1]
  40b172:	mov    DWORD PTR [ebx],eax
  40b174:	jns    0x40b15e
  40b176:	mov    DWORD PTR [ebp+0xc],edi
  40b179:	mov    edi,DWORD PTR [ebp-0x8]
  40b17c:	mov    eax,DWORD PTR [ebp+0xc]
  40b17f:	mov    DWORD PTR [ebx+0x4],esi
  40b182:	or     edi,eax
  40b184:	mov    WORD PTR [ebx+0x8],di
  40b188:	pop    edi
  40b189:	pop    esi
  40b18a:	pop    ebx
  40b18b:	mov    esp,ebp
  40b18d:	pop    ebp
  40b18e:	ret
  40b18f:	push   ebp
  40b190:	mov    ebp,esp
  40b192:	sub    esp,0x30
  40b195:	mov    eax,ds:0x412000
  40b19a:	xor    eax,ebp
  40b19c:	mov    DWORD PTR [ebp-0x4],eax
  40b19f:	mov    eax,DWORD PTR [ebp+0x14]
  40b1a2:	push   ebx
  40b1a3:	mov    ebx,DWORD PTR [ebp+0x10]
  40b1a6:	push   esi
  40b1a7:	mov    DWORD PTR [ebp-0x24],eax
  40b1aa:	lea    eax,[ebp+0x8]
  40b1ad:	push   edi
  40b1ae:	push   eax
  40b1af:	lea    eax,[ebp-0x30]
  40b1b2:	push   eax
  40b1b3:	call   0x40b0c7
  40b1b8:	pop    ecx
  40b1b9:	pop    ecx
  40b1ba:	lea    eax,[ebp-0x20]
  40b1bd:	push   eax
  40b1be:	push   0x0
  40b1c0:	push   0x11
  40b1c2:	sub    esp,0xc
  40b1c5:	lea    esi,[ebp-0x30]
  40b1c8:	mov    edi,esp
  40b1ca:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40b1cb:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40b1cc:	movs   WORD PTR es:[edi],WORD PTR ds:[esi]
  40b1ce:	call   0x40b37c
  40b1d3:	mov    esi,DWORD PTR [ebp-0x24]
  40b1d6:	mov    DWORD PTR [ebx+0x8],eax
  40b1d9:	movsx  eax,BYTE PTR [ebp-0x1e]
  40b1dd:	mov    DWORD PTR [ebx],eax
  40b1df:	movsx  eax,WORD PTR [ebp-0x20]
  40b1e3:	mov    DWORD PTR [ebx+0x4],eax
  40b1e6:	lea    eax,[ebp-0x1c]
  40b1e9:	push   eax
  40b1ea:	push   DWORD PTR [ebp+0x18]
  40b1ed:	push   esi
  40b1ee:	call   0x4061a2
  40b1f3:	add    esp,0x24
  40b1f6:	test   eax,eax
  40b1f8:	jne    0x40b210
  40b1fa:	mov    ecx,DWORD PTR [ebp-0x4]
  40b1fd:	mov    eax,ebx
  40b1ff:	pop    edi
  40b200:	mov    DWORD PTR [ebx+0xc],esi
  40b203:	xor    ecx,ebp
  40b205:	pop    esi
  40b206:	pop    ebx
  40b207:	call   0x40120d
  40b20c:	mov    esp,ebp
  40b20e:	pop    ebp
  40b20f:	ret
  40b210:	xor    eax,eax
  40b212:	push   eax
  40b213:	push   eax
  40b214:	push   eax
  40b215:	push   eax
  40b216:	push   eax
  40b217:	call   0x4016c6
  40b21c:	int3
  40b21d:	int3
  40b21e:	int3
  40b21f:	int3
  40b220:	push   edi
  40b221:	push   esi
  40b222:	push   ebp
  40b223:	xor    edi,edi
  40b225:	xor    ebp,ebp
  40b227:	mov    eax,DWORD PTR [esp+0x14]
  40b22b:	or     eax,eax
  40b22d:	jge    0x40b244
  40b22f:	inc    edi
  40b230:	inc    ebp
  40b231:	mov    edx,DWORD PTR [esp+0x10]
  40b235:	neg    eax
  40b237:	neg    edx
  40b239:	sbb    eax,0x0
  40b23c:	mov    DWORD PTR [esp+0x14],eax
  40b240:	mov    DWORD PTR [esp+0x10],edx
  40b244:	mov    eax,DWORD PTR [esp+0x1c]
  40b248:	or     eax,eax
  40b24a:	jge    0x40b260
  40b24c:	inc    edi
  40b24d:	mov    edx,DWORD PTR [esp+0x18]
  40b251:	neg    eax
  40b253:	neg    edx
  40b255:	sbb    eax,0x0
  40b258:	mov    DWORD PTR [esp+0x1c],eax
  40b25c:	mov    DWORD PTR [esp+0x18],edx
  40b260:	or     eax,eax
  40b262:	jne    0x40b28c
  40b264:	mov    ecx,DWORD PTR [esp+0x18]
  40b268:	mov    eax,DWORD PTR [esp+0x14]
  40b26c:	xor    edx,edx
  40b26e:	div    ecx
  40b270:	mov    ebx,eax
  40b272:	mov    eax,DWORD PTR [esp+0x10]
  40b276:	div    ecx
  40b278:	mov    esi,eax
  40b27a:	mov    eax,ebx
  40b27c:	mul    DWORD PTR [esp+0x18]
  40b280:	mov    ecx,eax
  40b282:	mov    eax,esi
  40b284:	mul    DWORD PTR [esp+0x18]
  40b288:	add    edx,ecx
  40b28a:	jmp    0x40b2d3
  40b28c:	mov    ebx,eax
  40b28e:	mov    ecx,DWORD PTR [esp+0x18]
  40b292:	mov    edx,DWORD PTR [esp+0x14]
  40b296:	mov    eax,DWORD PTR [esp+0x10]
  40b29a:	shr    ebx,1
  40b29c:	rcr    ecx,1
  40b29e:	shr    edx,1
  40b2a0:	rcr    eax,1
  40b2a2:	or     ebx,ebx
  40b2a4:	jne    0x40b29a
  40b2a6:	div    ecx
  40b2a8:	mov    esi,eax
  40b2aa:	mul    DWORD PTR [esp+0x1c]
  40b2ae:	mov    ecx,eax
  40b2b0:	mov    eax,DWORD PTR [esp+0x18]
  40b2b4:	mul    esi
  40b2b6:	add    edx,ecx
  40b2b8:	jb     0x40b2c8
  40b2ba:	cmp    edx,DWORD PTR [esp+0x14]
  40b2be:	ja     0x40b2c8
  40b2c0:	jb     0x40b2d1
  40b2c2:	cmp    eax,DWORD PTR [esp+0x10]
  40b2c6:	jbe    0x40b2d1
  40b2c8:	dec    esi
  40b2c9:	sub    eax,DWORD PTR [esp+0x18]
  40b2cd:	sbb    edx,DWORD PTR [esp+0x1c]
  40b2d1:	xor    ebx,ebx
  40b2d3:	sub    eax,DWORD PTR [esp+0x10]
  40b2d7:	sbb    edx,DWORD PTR [esp+0x14]
  40b2db:	dec    ebp
  40b2dc:	jns    0x40b2e5
  40b2de:	neg    edx
  40b2e0:	neg    eax
  40b2e2:	sbb    edx,0x0
  40b2e5:	mov    ecx,edx
  40b2e7:	mov    edx,ebx
  40b2e9:	mov    ebx,ecx
  40b2eb:	mov    ecx,eax
  40b2ed:	mov    eax,esi
  40b2ef:	dec    edi
  40b2f0:	jne    0x40b2f9
  40b2f2:	neg    edx
  40b2f4:	neg    eax
  40b2f6:	sbb    edx,0x0
  40b2f9:	pop    ebp
  40b2fa:	pop    esi
  40b2fb:	pop    edi
  40b2fc:	ret    0x10
  40b2ff:	int3
  40b300:	cmp    cl,0x40
  40b303:	jae    0x40b31a
  40b305:	cmp    cl,0x20
  40b308:	jae    0x40b310
  40b30a:	shrd   eax,edx,cl
  40b30d:	shr    edx,cl
  40b30f:	ret
  40b310:	mov    eax,edx
  40b312:	xor    edx,edx
  40b314:	and    cl,0x1f
  40b317:	shr    eax,cl
  40b319:	ret
  40b31a:	xor    eax,eax
  40b31c:	xor    edx,edx
  40b31e:	ret
  40b31f:	push   ebp
  40b320:	mov    ebp,esp
  40b322:	mov    ecx,DWORD PTR [ebp+0x10]
  40b325:	mov    eax,DWORD PTR [ebp+0xc]
  40b328:	and    ecx,0xfff7ffff
  40b32e:	and    eax,ecx
  40b330:	push   esi
  40b331:	mov    esi,DWORD PTR [ebp+0x8]
  40b334:	test   eax,0xfcf0fce0
  40b339:	je     0x40b35f
  40b33b:	test   esi,esi
  40b33d:	je     0x40b34c
  40b33f:	push   0x0
  40b341:	push   0x0
  40b343:	call   0x40bdf9
  40b348:	pop    ecx
  40b349:	pop    ecx
  40b34a:	mov    DWORD PTR [esi],eax
  40b34c:	call   0x402568
  40b351:	push   0x16
  40b353:	pop    esi
  40b354:	mov    DWORD PTR [eax],esi
  40b356:	call   0x4016b6
  40b35b:	mov    eax,esi
  40b35d:	jmp    0x40b379
  40b35f:	push   ecx
  40b360:	push   DWORD PTR [ebp+0xc]
  40b363:	test   esi,esi
  40b365:	je     0x40b370
  40b367:	call   0x40bdf9
  40b36c:	mov    DWORD PTR [esi],eax
  40b36e:	jmp    0x40b375
  40b370:	call   0x40bdf9
  40b375:	pop    ecx
  40b376:	pop    ecx
  40b377:	xor    eax,eax
  40b379:	pop    esi
  40b37a:	pop    ebp
  40b37b:	ret
  40b37c:	push   ebp
  40b37d:	mov    ebp,esp
  40b37f:	sub    esp,0x88
  40b385:	mov    eax,ds:0x412000
  40b38a:	xor    eax,ebp
  40b38c:	mov    DWORD PTR [ebp-0x4],eax
  40b38f:	movzx  edx,WORD PTR [ebp+0x10]
  40b393:	xor    ecx,ecx
  40b395:	push   ebx
  40b396:	mov    ebx,DWORD PTR [ebp+0x1c]
  40b399:	mov    eax,0x7fff
  40b39e:	push   esi
  40b39f:	mov    esi,0x8000
  40b3a4:	mov    DWORD PTR [ebp-0x74],ebx
  40b3a7:	and    edx,esi
  40b3a9:	mov    DWORD PTR [ebp-0x30],0xcccccccc
  40b3b0:	movzx  esi,WORD PTR [ebp+0x10]
  40b3b4:	inc    ecx
  40b3b5:	and    esi,eax
  40b3b7:	mov    DWORD PTR [ebp-0x2c],0xcccccccc
  40b3be:	mov    DWORD PTR [ebp-0x28],0x3ffbcccc
  40b3c5:	mov    DWORD PTR [ebp-0x80],edx
  40b3c8:	mov    DWORD PTR [ebp-0x64],eax
  40b3cb:	push   edi
  40b3cc:	test   dx,dx
  40b3cf:	je     0x40b3d7
  40b3d1:	mov    BYTE PTR [ebx+0x2],0x2d
  40b3d5:	jmp    0x40b3db
  40b3d7:	mov    BYTE PTR [ebx+0x2],0x20
  40b3db:	mov    edi,DWORD PTR [ebp+0xc]
  40b3de:	test   si,si
  40b3e1:	jne    0x40b41d
  40b3e3:	test   edi,edi
  40b3e5:	jne    0x40b4b2
  40b3eb:	cmp    DWORD PTR [ebp+0x8],edi
  40b3ee:	jne    0x40b4b2
  40b3f4:	xor    eax,eax
  40b3f6:	mov    BYTE PTR [ebx+0x3],cl
  40b3f9:	mov    WORD PTR [ebx],ax
  40b3fc:	mov    eax,0x8000
  40b401:	cmp    dx,ax
  40b404:	setne  al
  40b407:	dec    al
  40b409:	and    al,0xd
  40b40b:	add    al,0x20
  40b40d:	mov    BYTE PTR [ebx+0x2],al
  40b410:	mov    eax,ecx
  40b412:	mov    WORD PTR [ebx+0x4],0x30
  40b418:	jmp    0x40bcf9
  40b41d:	cmp    si,ax
  40b420:	jne    0x40b4b2
  40b426:	mov    eax,DWORD PTR [ebp+0xc]
  40b429:	mov    edx,0x80000000
  40b42e:	mov    WORD PTR [ebx],cx
  40b431:	mov    ecx,DWORD PTR [ebp+0x8]
  40b434:	cmp    eax,edx
  40b436:	jne    0x40b43c
  40b438:	test   ecx,ecx
  40b43a:	je     0x40b44a
  40b43c:	test   eax,0x40000000
  40b441:	jne    0x40b44a
  40b443:	push   0x410d94
  40b448:	jmp    0x40b491
  40b44a:	cmp    WORD PTR [ebp-0x80],0x0
  40b44f:	je     0x40b463
  40b451:	cmp    eax,0xc0000000
  40b456:	jne    0x40b463
  40b458:	test   ecx,ecx
  40b45a:	jne    0x40b48c
  40b45c:	push   0x410d9c
  40b461:	jmp    0x40b470
  40b463:	cmp    eax,edx
  40b465:	jne    0x40b48c
  40b467:	test   ecx,ecx
  40b469:	jne    0x40b48c
  40b46b:	push   0x410da4
  40b470:	lea    eax,[ebx+0x4]
  40b473:	push   0x16
  40b475:	push   eax
  40b476:	call   0x4061a2
  40b47b:	add    esp,0xc
  40b47e:	test   eax,eax
  40b480:	jne    0x40bd43
  40b486:	mov    BYTE PTR [ebx+0x3],0x5
  40b48a:	jmp    0x40b4ab
  40b48c:	push   0x410dac
  40b491:	lea    eax,[ebx+0x4]
  40b494:	push   0x16
  40b496:	push   eax
  40b497:	call   0x4061a2
  40b49c:	add    esp,0xc
  40b49f:	test   eax,eax
  40b4a1:	jne    0x40bd43
  40b4a7:	mov    BYTE PTR [ebx+0x3],0x6
  40b4ab:	xor    eax,eax
  40b4ad:	jmp    0x40bcf9
  40b4b2:	movzx  edx,si
  40b4b5:	mov    ecx,edi
  40b4b7:	shr    ecx,0x18
  40b4ba:	mov    eax,edx
  40b4bc:	shr    eax,0x8
  40b4bf:	xor    ebx,ebx
  40b4c1:	mov    DWORD PTR [ebp-0x1a],edi
  40b4c4:	mov    edi,0x412dd8
  40b4c9:	sub    edi,0x60
  40b4cc:	mov    WORD PTR [ebp-0x16],si
  40b4d0:	mov    DWORD PTR [ebp-0x58],0x5
  40b4d7:	lea    eax,[eax+ecx*2]
  40b4da:	mov    DWORD PTR [ebp-0x70],0xbffd
  40b4e1:	imul   ecx,eax,0x4d
  40b4e4:	imul   eax,edx,0x4d10
  40b4ea:	mov    DWORD PTR [ebp-0x54],0x3fbf
  40b4f1:	add    eax,0xecbced0c
  40b4f6:	add    eax,ecx
  40b4f8:	sar    eax,0x10
  40b4fb:	movzx  ecx,ax
  40b4fe:	mov    eax,DWORD PTR [ebp+0x8]
  40b501:	mov    DWORD PTR [ebp-0x1e],eax
  40b504:	xor    eax,eax
  40b506:	mov    WORD PTR [ebp-0x20],ax
  40b50a:	movsx  eax,cx
  40b50d:	neg    eax
  40b50f:	mov    DWORD PTR [ebp-0x48],ecx
  40b512:	mov    DWORD PTR [ebp-0x44],eax
  40b515:	test   eax,eax
  40b517:	je     0x40b84c
  40b51d:	jns    0x40b52e
  40b51f:	neg    eax
  40b521:	mov    edi,0x412f38
  40b526:	sub    edi,0x60
  40b529:	mov    DWORD PTR [ebp-0x44],eax
  40b52c:	test   eax,eax
  40b52e:	je     0x40b84c
  40b534:	mov    esi,DWORD PTR [ebp-0x20]
  40b537:	mov    edx,DWORD PTR [ebp-0x1c]
  40b53a:	mov    DWORD PTR [ebp-0x40],esi
  40b53d:	sar    DWORD PTR [ebp-0x44],0x3
  40b541:	add    edi,0x54
  40b544:	mov    DWORD PTR [ebp-0x6c],edi
  40b547:	and    eax,0x7
  40b54a:	je     0x40b83c
  40b550:	imul   ecx,eax,0xc
  40b553:	mov    eax,0x8000
  40b558:	add    ecx,edi
  40b55a:	mov    DWORD PTR [ebp-0x68],ecx
  40b55d:	cmp    WORD PTR [ecx],ax
  40b560:	jb     0x40b573
  40b562:	mov    esi,ecx
  40b564:	lea    edi,[ebp-0x3c]
  40b567:	lea    ecx,[ebp-0x3c]
  40b56a:	mov    DWORD PTR [ebp-0x68],ecx
  40b56d:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40b56e:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40b56f:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40b570:	dec    DWORD PTR [ebp-0x3a]
  40b573:	movzx  edi,WORD PTR [ecx+0xa]
  40b577:	mov    esi,0x8000
  40b57c:	mov    eax,DWORD PTR [ebp-0x16]
  40b57f:	mov    DWORD PTR [ebp-0x5c],edi
  40b582:	and    edi,0x7fff
  40b588:	xor    DWORD PTR [ebp-0x5c],eax
  40b58b:	and    eax,0x7fff
  40b590:	and    DWORD PTR [ebp-0x5c],esi
  40b593:	mov    DWORD PTR [ebp-0x50],eax
  40b596:	add    eax,edi
  40b598:	mov    DWORD PTR [ebp-0x60],edi
  40b59b:	dec    esi
  40b59c:	movzx  edi,ax
  40b59f:	mov    eax,DWORD PTR [ebp-0x50]
  40b5a2:	cmp    ax,si
  40b5a5:	mov    esi,DWORD PTR [ebp-0x40]
  40b5a8:	mov    DWORD PTR [ebp-0x7c],ebx
  40b5ab:	mov    DWORD PTR [ebp-0x10],ebx
  40b5ae:	mov    DWORD PTR [ebp-0xc],ebx
  40b5b1:	mov    DWORD PTR [ebp-0x8],ebx
  40b5b4:	mov    DWORD PTR [ebp-0x4c],edi
  40b5b7:	jae    0x40b815
  40b5bd:	mov    ecx,0x7fff
  40b5c2:	cmp    WORD PTR [ebp-0x60],cx
  40b5c6:	mov    ecx,DWORD PTR [ebp-0x68]
  40b5c9:	jae    0x40b815
  40b5cf:	cmp    di,WORD PTR [ebp-0x70]
  40b5d3:	ja     0x40b815
  40b5d9:	cmp    di,WORD PTR [ebp-0x54]
  40b5dd:	ja     0x40b5e7
  40b5df:	mov    DWORD PTR [ebp-0x18],ebx
  40b5e2:	jmp    0x40b82c
  40b5e7:	test   ax,ax
  40b5ea:	jne    0x40b60c
  40b5ec:	inc    edi
  40b5ed:	test   DWORD PTR [ebp-0x18],0x7fffffff
  40b5f4:	mov    DWORD PTR [ebp-0x4c],edi
  40b5f7:	jne    0x40b60c
  40b5f9:	test   edx,edx
  40b5fb:	jne    0x40b60c
  40b5fd:	test   esi,esi
  40b5ff:	jne    0x40b60c
  40b601:	xor    eax,eax
  40b603:	mov    WORD PTR [ebp-0x16],ax
  40b607:	jmp    0x40b839
  40b60c:	cmp    WORD PTR [ebp-0x60],0x0
  40b611:	jne    0x40b629
  40b613:	inc    edi
  40b614:	test   DWORD PTR [ecx+0x8],0x7fffffff
  40b61b:	mov    DWORD PTR [ebp-0x4c],edi
  40b61e:	jne    0x40b629
  40b620:	cmp    DWORD PTR [ecx+0x4],ebx
  40b623:	jne    0x40b629
  40b625:	cmp    DWORD PTR [ecx],ebx
  40b627:	je     0x40b5df
  40b629:	push   0x5
  40b62b:	mov    eax,ebx
  40b62d:	lea    edx,[ebp-0xc]
  40b630:	pop    esi
  40b631:	mov    DWORD PTR [ebp-0x84],eax
  40b637:	mov    DWORD PTR [ebp-0x50],esi
  40b63a:	mov    DWORD PTR [ebp-0x60],esi
  40b63d:	test   esi,esi
  40b63f:	jle    0x40b6b3
  40b641:	lea    esi,[ebp-0x20]
  40b644:	lea    eax,[esi+eax*2]
  40b647:	lea    esi,[ecx+0x8]
  40b64a:	mov    DWORD PTR [ebp-0x88],eax
  40b650:	mov    DWORD PTR [ebp-0x40],esi
  40b653:	mov    esi,DWORD PTR [ebp-0x60]
  40b656:	mov    ecx,DWORD PTR [ebp-0x40]
  40b659:	movzx  edi,WORD PTR [eax]
  40b65c:	movzx  eax,WORD PTR [ecx]
  40b65f:	imul   edi,eax
  40b662:	mov    eax,DWORD PTR [edx-0x4]
  40b665:	mov    DWORD PTR [ebp-0x78],ebx
  40b668:	lea    ecx,[eax+edi*1]
  40b66b:	cmp    ecx,eax
  40b66d:	mov    DWORD PTR [ebp-0x60],ecx
  40b670:	mov    eax,ecx
  40b672:	jb     0x40b678
  40b674:	cmp    eax,edi
  40b676:	jae    0x40b67d
  40b678:	xor    ecx,ecx
  40b67a:	inc    ecx
  40b67b:	jmp    0x40b680
  40b67d:	mov    ecx,DWORD PTR [ebp-0x78]
  40b680:	mov    DWORD PTR [edx-0x4],eax
  40b683:	test   ecx,ecx
  40b685:	je     0x40b68a
  40b687:	inc    WORD PTR [edx]
  40b68a:	mov    eax,DWORD PTR [ebp-0x88]
  40b690:	mov    ecx,DWORD PTR [ebp-0x40]
  40b693:	add    eax,0x2
  40b696:	sub    ecx,0x2
  40b699:	mov    DWORD PTR [ebp-0x88],eax
  40b69f:	dec    esi
  40b6a0:	mov    DWORD PTR [ebp-0x40],ecx
  40b6a3:	test   esi,esi
  40b6a5:	jg     0x40b659
  40b6a7:	mov    ecx,DWORD PTR [ebp-0x68]
  40b6aa:	mov    esi,DWORD PTR [ebp-0x50]
  40b6ad:	mov    eax,DWORD PTR [ebp-0x84]
  40b6b3:	add    edx,0x2
  40b6b6:	inc    eax
  40b6b7:	dec    esi
  40b6b8:	mov    DWORD PTR [ebp-0x84],eax
  40b6be:	mov    DWORD PTR [ebp-0x50],esi
  40b6c1:	test   esi,esi
  40b6c3:	jg     0x40b63a
  40b6c9:	mov    edi,DWORD PTR [ebp-0x4c]
  40b6cc:	mov    eax,DWORD PTR [ebp-0x8]
  40b6cf:	add    edi,0xc002
  40b6d5:	mov    esi,DWORD PTR [ebp-0x10]
  40b6d8:	mov    DWORD PTR [ebp-0x40],eax
  40b6db:	test   di,di
  40b6de:	jle    0x40b71b
  40b6e0:	test   eax,eax
  40b6e2:	js     0x40b716
  40b6e4:	mov    eax,DWORD PTR [ebp-0xc]
  40b6e7:	mov    edx,esi
  40b6e9:	mov    ecx,eax
  40b6eb:	shr    edx,0x1f
  40b6ee:	add    eax,eax
  40b6f0:	shr    ecx,0x1f
  40b6f3:	or     eax,edx
  40b6f5:	add    esi,esi
  40b6f7:	mov    DWORD PTR [ebp-0xc],eax
  40b6fa:	mov    eax,DWORD PTR [ebp-0x40]
  40b6fd:	add    eax,eax
  40b6ff:	mov    DWORD PTR [ebp-0x10],esi
  40b702:	or     eax,ecx
  40b704:	mov    ecx,0xffff
  40b709:	add    edi,ecx
  40b70b:	mov    DWORD PTR [ebp-0x40],eax
  40b70e:	mov    DWORD PTR [ebp-0x8],eax
  40b711:	test   di,di
  40b714:	jg     0x40b6e0
  40b716:	test   di,di
  40b719:	jg     0x40b78c
  40b71b:	mov    eax,0xffff
  40b720:	add    edi,eax
  40b722:	test   di,di
  40b725:	jns    0x40b78c
  40b727:	mov    ebx,DWORD PTR [ebp-0x40]
  40b72a:	mov    eax,edi
  40b72c:	neg    eax
  40b72e:	xor    edx,edx
  40b730:	movzx  eax,ax
  40b733:	add    edi,eax
  40b735:	mov    DWORD PTR [ebp-0x50],eax
  40b738:	mov    DWORD PTR [ebp-0x4c],edi
  40b73b:	inc    edx
  40b73c:	mov    edi,DWORD PTR [ebp-0x7c]
  40b73f:	test   BYTE PTR [ebp-0x10],dl
  40b742:	je     0x40b745
  40b744:	inc    edi
  40b745:	mov    ecx,DWORD PTR [ebp-0xc]
  40b748:	mov    eax,ebx
  40b74a:	shl    eax,0x1f
  40b74d:	mov    DWORD PTR [ebp-0x40],ecx
  40b750:	shr    DWORD PTR [ebp-0x40],1
  40b753:	or     DWORD PTR [ebp-0x40],eax
  40b756:	mov    eax,DWORD PTR [ebp-0x40]
  40b759:	shl    ecx,0x1f
  40b75c:	shr    esi,1
  40b75e:	shr    ebx,1
  40b760:	or     esi,ecx
  40b762:	dec    DWORD PTR [ebp-0x50]
  40b765:	mov    DWORD PTR [ebp-0x8],ebx
  40b768:	mov    DWORD PTR [ebp-0xc],eax
  40b76b:	mov    DWORD PTR [ebp-0x10],esi
  40b76e:	jne    0x40b73f
  40b770:	push   0x0
  40b772:	mov    DWORD PTR [ebp-0x40],ebx
  40b775:	test   edi,edi
  40b777:	mov    edi,DWORD PTR [ebp-0x4c]
  40b77a:	pop    ebx
  40b77b:	je     0x40b78c
  40b77d:	mov    ax,si
  40b780:	or     ax,dx
  40b783:	mov    WORD PTR [ebp-0x10],ax
  40b787:	mov    esi,DWORD PTR [ebp-0x10]
  40b78a:	jmp    0x40b790
  40b78c:	mov    ax,WORD PTR [ebp-0x10]
  40b790:	mov    ecx,0x8000
  40b795:	cmp    ax,cx
  40b798:	ja     0x40b7a8
  40b79a:	and    esi,0x1ffff
  40b7a0:	cmp    esi,0x18000
  40b7a6:	jne    0x40b7e8
  40b7a8:	mov    eax,DWORD PTR [ebp-0xe]
  40b7ab:	cmp    eax,0xffffffff
  40b7ae:	jne    0x40b7e4
  40b7b0:	mov    eax,DWORD PTR [ebp-0xa]
  40b7b3:	mov    DWORD PTR [ebp-0xe],ebx
  40b7b6:	cmp    eax,0xffffffff
  40b7b9:	jne    0x40b7db
  40b7bb:	mov    ax,WORD PTR [ebp-0x6]
  40b7bf:	mov    edx,0xffff
  40b7c4:	mov    DWORD PTR [ebp-0xa],ebx
  40b7c7:	cmp    ax,dx
  40b7ca:	jne    0x40b7d3
  40b7cc:	mov    WORD PTR [ebp-0x6],cx
  40b7d0:	inc    edi
  40b7d1:	jmp    0x40b7df
  40b7d3:	inc    ax
  40b7d5:	mov    WORD PTR [ebp-0x6],ax
  40b7d9:	jmp    0x40b7df
  40b7db:	inc    eax
  40b7dc:	mov    DWORD PTR [ebp-0xa],eax
  40b7df:	mov    ecx,DWORD PTR [ebp-0x8]
  40b7e2:	jmp    0x40b7eb
  40b7e4:	inc    eax
  40b7e5:	mov    DWORD PTR [ebp-0xe],eax
  40b7e8:	mov    ecx,DWORD PTR [ebp-0x40]
  40b7eb:	mov    eax,0x7fff
  40b7f0:	cmp    di,ax
  40b7f3:	jae    0x40b815
  40b7f5:	mov    ax,WORD PTR [ebp-0xe]
  40b7f9:	or     edi,DWORD PTR [ebp-0x5c]
  40b7fc:	mov    WORD PTR [ebp-0x20],ax
  40b800:	mov    eax,DWORD PTR [ebp-0xc]
  40b803:	mov    DWORD PTR [ebp-0x1e],eax
  40b806:	mov    esi,DWORD PTR [ebp-0x20]
  40b809:	mov    DWORD PTR [ebp-0x1a],ecx
  40b80c:	mov    edx,DWORD PTR [ebp-0x1c]
  40b80f:	mov    WORD PTR [ebp-0x16],di
  40b813:	jmp    0x40b836
  40b815:	xor    eax,eax
  40b817:	cmp    WORD PTR [ebp-0x5c],ax
  40b81b:	sete   al
  40b81e:	dec    eax
  40b81f:	and    eax,0x80000000
  40b824:	add    eax,0x7fff8000
  40b829:	mov    DWORD PTR [ebp-0x18],eax
  40b82c:	mov    esi,ebx
  40b82e:	mov    edx,ebx
  40b830:	mov    DWORD PTR [ebp-0x20],esi
  40b833:	mov    DWORD PTR [ebp-0x1c],edx
  40b836:	mov    DWORD PTR [ebp-0x40],esi
  40b839:	mov    edi,DWORD PTR [ebp-0x6c]
  40b83c:	mov    eax,DWORD PTR [ebp-0x44]
  40b83f:	test   eax,eax
  40b841:	jne    0x40b53d
  40b847:	mov    ecx,DWORD PTR [ebp-0x48]
  40b84a:	jmp    0x40b852
  40b84c:	mov    edx,DWORD PTR [ebp-0x1c]
  40b84f:	mov    esi,DWORD PTR [ebp-0x20]
  40b852:	mov    eax,DWORD PTR [ebp-0x18]
  40b855:	mov    edi,0x3fff
  40b85a:	shr    eax,0x10
  40b85d:	cmp    ax,di
  40b860:	jb     0x40bb05
  40b866:	inc    ecx
  40b867:	mov    DWORD PTR [ebp-0x78],ebx
  40b86a:	mov    DWORD PTR [ebp-0x48],ecx
  40b86d:	mov    ecx,eax
  40b86f:	mov    eax,DWORD PTR [ebp-0x26]
  40b872:	mov    edi,eax
  40b874:	xor    edi,ecx
  40b876:	mov    DWORD PTR [ebp-0x10],ebx
  40b879:	and    edi,0x8000
  40b87f:	mov    DWORD PTR [ebp-0xc],ebx
  40b882:	mov    DWORD PTR [ebp-0x44],edi
  40b885:	mov    edi,0x7fff
  40b88a:	and    eax,edi
  40b88c:	mov    DWORD PTR [ebp-0x8],ebx
  40b88f:	and    ecx,edi
  40b891:	mov    DWORD PTR [ebp-0x7c],eax
  40b894:	add    eax,ecx
  40b896:	movzx  edi,ax
  40b899:	mov    eax,0x7fff
  40b89e:	mov    DWORD PTR [ebp-0x4c],edi
  40b8a1:	cmp    cx,ax
  40b8a4:	jae    0x40baea
  40b8aa:	mov    eax,DWORD PTR [ebp-0x7c]
  40b8ad:	cmp    ax,WORD PTR [ebp-0x64]
  40b8b1:	jae    0x40baea
  40b8b7:	cmp    di,WORD PTR [ebp-0x70]
  40b8bb:	ja     0x40baea
  40b8c1:	cmp    di,WORD PTR [ebp-0x54]
  40b8c5:	ja     0x40b8cf
  40b8c7:	mov    DWORD PTR [ebp-0x18],ebx
  40b8ca:	jmp    0x40bb01
  40b8cf:	test   cx,cx
  40b8d2:	jne    0x40b8f4
  40b8d4:	inc    edi
  40b8d5:	test   DWORD PTR [ebp-0x18],0x7fffffff
  40b8dc:	mov    DWORD PTR [ebp-0x4c],edi
  40b8df:	jne    0x40b8f4
  40b8e1:	test   edx,edx
  40b8e3:	jne    0x40b8f4
  40b8e5:	test   esi,esi
  40b8e7:	jne    0x40b8f4
  40b8e9:	xor    eax,eax
  40b8eb:	mov    WORD PTR [ebp-0x16],ax
  40b8ef:	jmp    0x40bb05
  40b8f4:	test   ax,ax
  40b8f7:	jne    0x40b912
  40b8f9:	inc    edi
  40b8fa:	test   DWORD PTR [ebp-0x28],0x7fffffff
  40b901:	mov    DWORD PTR [ebp-0x4c],edi
  40b904:	jne    0x40b912
  40b906:	cmp    DWORD PTR [ebp-0x2c],0x0
  40b90a:	jne    0x40b912
  40b90c:	cmp    DWORD PTR [ebp-0x30],0x0
  40b910:	je     0x40b8c7
  40b912:	mov    edx,ebx
  40b914:	lea    ecx,[ebp-0xc]
  40b917:	push   0x5
  40b919:	mov    DWORD PTR [ebp-0x50],edx
  40b91c:	pop    eax
  40b91d:	mov    esi,eax
  40b91f:	test   eax,eax
  40b921:	jle    0x40b97b
  40b923:	lea    edi,[ebp-0x20]
  40b926:	lea    eax,[ebp-0x28]
  40b929:	lea    edi,[edi+edx*2]
  40b92c:	mov    DWORD PTR [ebp-0x70],eax
  40b92f:	mov    DWORD PTR [ebp-0x54],edi
  40b932:	movzx  edx,WORD PTR [eax]
  40b935:	movzx  eax,WORD PTR [edi]
  40b938:	imul   edx,eax
  40b93b:	mov    eax,DWORD PTR [ecx-0x4]
  40b93e:	mov    DWORD PTR [ebp-0x64],ebx
  40b941:	lea    edi,[eax+edx*1]
  40b944:	cmp    edi,eax
  40b946:	jb     0x40b94c
  40b948:	cmp    edi,edx
  40b94a:	jae    0x40b951
  40b94c:	xor    eax,eax
  40b94e:	inc    eax
  40b94f:	jmp    0x40b954
  40b951:	mov    eax,DWORD PTR [ebp-0x64]
  40b954:	mov    DWORD PTR [ecx-0x4],edi
  40b957:	test   eax,eax
  40b959:	je     0x40b95e
  40b95b:	inc    WORD PTR [ecx]
  40b95e:	mov    edi,DWORD PTR [ebp-0x54]
  40b961:	mov    eax,DWORD PTR [ebp-0x70]
  40b964:	add    edi,0x2
  40b967:	sub    eax,0x2
  40b96a:	mov    DWORD PTR [ebp-0x54],edi
  40b96d:	dec    esi
  40b96e:	mov    DWORD PTR [ebp-0x70],eax
  40b971:	test   esi,esi
  40b973:	jg     0x40b932
  40b975:	mov    edx,DWORD PTR [ebp-0x50]
  40b978:	mov    eax,DWORD PTR [ebp-0x58]
  40b97b:	add    ecx,0x2
  40b97e:	inc    edx
  40b97f:	dec    eax
  40b980:	mov    DWORD PTR [ebp-0x50],edx
  40b983:	mov    DWORD PTR [ebp-0x58],eax
  40b986:	test   eax,eax
  40b988:	jg     0x40b91d
  40b98a:	mov    edi,DWORD PTR [ebp-0x4c]
  40b98d:	mov    esi,DWORD PTR [ebp-0x8]
  40b990:	add    edi,0xc002
  40b996:	test   di,di
  40b999:	jle    0x40ba3b
  40b99f:	mov    ebx,DWORD PTR [ebp-0x10]
  40b9a2:	mov    DWORD PTR [ebp-0x68],ebx
  40b9a5:	test   esi,esi
  40b9a7:	js     0x40b9d5
  40b9a9:	mov    eax,DWORD PTR [ebp-0xc]
  40b9ac:	mov    edx,ebx
  40b9ae:	mov    ecx,eax
  40b9b0:	shr    edx,0x1f
  40b9b3:	add    eax,eax
  40b9b5:	shr    ecx,0x1f
  40b9b8:	or     eax,edx
  40b9ba:	add    esi,esi
  40b9bc:	mov    DWORD PTR [ebp-0xc],eax
  40b9bf:	add    ebx,ebx
  40b9c1:	mov    eax,0xffff
  40b9c6:	mov    DWORD PTR [ebp-0x10],ebx
  40b9c9:	or     esi,ecx
  40b9cb:	add    edi,eax
  40b9cd:	mov    DWORD PTR [ebp-0x8],esi
  40b9d0:	test   di,di
  40b9d3:	jg     0x40b9a5
  40b9d5:	mov    DWORD PTR [ebp-0x68],ebx
  40b9d8:	mov    edx,DWORD PTR [ebp-0x68]
  40b9db:	push   0x0
  40b9dd:	pop    ebx
  40b9de:	test   di,di
  40b9e1:	jle    0x40ba3e
  40b9e3:	mov    cx,WORD PTR [ebp-0x10]
  40b9e7:	mov    eax,0x8000
  40b9ec:	cmp    cx,ax
  40b9ef:	ja     0x40ba03
  40b9f1:	and    edx,0x1ffff
  40b9f7:	cmp    edx,0x18000
  40b9fd:	jne    0x40bac0
  40ba03:	mov    eax,DWORD PTR [ebp-0xe]
  40ba06:	cmp    eax,0xffffffff
  40ba09:	jne    0x40babc
  40ba0f:	mov    eax,DWORD PTR [ebp-0xa]
  40ba12:	mov    DWORD PTR [ebp-0xe],ebx
  40ba15:	cmp    eax,0xffffffff
  40ba18:	jne    0x40bab3
  40ba1e:	mov    ax,WORD PTR [ebp-0x6]
  40ba22:	mov    ecx,0xffff
  40ba27:	mov    DWORD PTR [ebp-0xa],ebx
  40ba2a:	cmp    ax,cx
  40ba2d:	jne    0x40baab
  40ba2f:	mov    eax,0x8000
  40ba34:	inc    edi
  40ba35:	mov    WORD PTR [ebp-0x6],ax
  40ba39:	jmp    0x40bab7
  40ba3b:	mov    edx,DWORD PTR [ebp-0x10]
  40ba3e:	mov    eax,0xffff
  40ba43:	add    edi,eax
  40ba45:	test   di,di
  40ba48:	jns    0x40b9e3
  40ba4a:	mov    eax,edi
  40ba4c:	neg    eax
  40ba4e:	movzx  eax,ax
  40ba51:	add    edi,eax
  40ba53:	mov    DWORD PTR [ebp-0x58],eax
  40ba56:	mov    DWORD PTR [ebp-0x4c],edi
  40ba59:	mov    edi,DWORD PTR [ebp-0x78]
  40ba5c:	test   BYTE PTR [ebp-0x10],0x1
  40ba60:	je     0x40ba63
  40ba62:	inc    edi
  40ba63:	mov    ebx,DWORD PTR [ebp-0xc]
  40ba66:	mov    eax,esi
  40ba68:	mov    ecx,ebx
  40ba6a:	shl    eax,0x1f
  40ba6d:	shl    ecx,0x1f
  40ba70:	shr    ebx,1
  40ba72:	shr    edx,1
  40ba74:	or     ebx,eax
  40ba76:	or     edx,ecx
  40ba78:	shr    esi,1
  40ba7a:	dec    DWORD PTR [ebp-0x58]
  40ba7d:	mov    DWORD PTR [ebp-0xc],ebx
  40ba80:	mov    DWORD PTR [ebp-0x10],edx
  40ba83:	jne    0x40ba5c
  40ba85:	push   0x0
  40ba87:	test   edi,edi
  40ba89:	mov    DWORD PTR [ebp-0x8],esi
  40ba8c:	mov    edi,DWORD PTR [ebp-0x4c]
  40ba8f:	pop    ebx
  40ba90:	je     0x40b9e3
  40ba96:	xor    eax,eax
  40ba98:	mov    cx,dx
  40ba9b:	inc    eax
  40ba9c:	or     cx,ax
  40ba9f:	mov    WORD PTR [ebp-0x10],cx
  40baa3:	mov    edx,DWORD PTR [ebp-0x10]
  40baa6:	jmp    0x40b9e7
  40baab:	inc    ax
  40baad:	mov    WORD PTR [ebp-0x6],ax
  40bab1:	jmp    0x40bab7
  40bab3:	inc    eax
  40bab4:	mov    DWORD PTR [ebp-0xa],eax
  40bab7:	mov    esi,DWORD PTR [ebp-0x8]
  40baba:	jmp    0x40bac0
  40babc:	inc    eax
  40babd:	mov    DWORD PTR [ebp-0xe],eax
  40bac0:	mov    eax,0x7fff
  40bac5:	cmp    di,ax
  40bac8:	jae    0x40baea
  40baca:	mov    ax,WORD PTR [ebp-0xe]
  40bace:	or     edi,DWORD PTR [ebp-0x44]
  40bad1:	mov    WORD PTR [ebp-0x20],ax
  40bad5:	mov    eax,DWORD PTR [ebp-0xc]
  40bad8:	mov    DWORD PTR [ebp-0x1e],eax
  40badb:	mov    DWORD PTR [ebp-0x1a],esi
  40bade:	mov    edx,DWORD PTR [ebp-0x1c]
  40bae1:	mov    esi,DWORD PTR [ebp-0x20]
  40bae4:	mov    WORD PTR [ebp-0x16],di
  40bae8:	jmp    0x40bb05
  40baea:	xor    eax,eax
  40baec:	cmp    WORD PTR [ebp-0x44],ax
  40baf0:	sete   al
  40baf3:	dec    eax
  40baf4:	and    eax,0x80000000
  40baf9:	add    eax,0x7fff8000
  40bafe:	mov    DWORD PTR [ebp-0x18],eax
  40bb01:	mov    esi,ebx
  40bb03:	mov    edx,ebx
  40bb05:	test   BYTE PTR [ebp+0x18],0x1
  40bb09:	mov    ecx,DWORD PTR [ebp-0x74]
  40bb0c:	mov    eax,DWORD PTR [ebp-0x48]
  40bb0f:	mov    edi,DWORD PTR [ebp+0x14]
  40bb12:	mov    WORD PTR [ecx],ax
  40bb15:	je     0x40bb4d
  40bb17:	cwde
  40bb18:	add    edi,eax
  40bb1a:	mov    DWORD PTR [ebp-0x48],edi
  40bb1d:	test   edi,edi
  40bb1f:	jg     0x40bb50
  40bb21:	xor    eax,eax
  40bb23:	mov    WORD PTR [ecx],ax
  40bb26:	mov    eax,0x8000
  40bb2b:	cmp    WORD PTR [ebp-0x80],ax
  40bb2f:	setne  al
  40bb32:	dec    al
  40bb34:	and    al,0xd
  40bb36:	add    al,0x20
  40bb38:	mov    BYTE PTR [ecx+0x2],al
  40bb3b:	xor    eax,eax
  40bb3d:	inc    eax
  40bb3e:	mov    BYTE PTR [ecx+0x3],al
  40bb41:	mov    BYTE PTR [ecx+0x4],0x30
  40bb45:	mov    BYTE PTR [ecx+0x5],bl
  40bb48:	jmp    0x40bcf9
  40bb4d:	mov    DWORD PTR [ebp-0x48],edi
  40bb50:	push   0x15
  40bb52:	pop    eax
  40bb53:	cmp    edi,eax
  40bb55:	jle    0x40bb5a
  40bb57:	mov    DWORD PTR [ebp-0x48],eax
  40bb5a:	mov    edi,DWORD PTR [ebp-0x18]
  40bb5d:	shr    edi,0x10
  40bb60:	sub    edi,0x3ffe
  40bb66:	xor    eax,eax
  40bb68:	push   0x8
  40bb6a:	mov    DWORD PTR [ebp-0x64],edi
  40bb6d:	mov    WORD PTR [ebp-0x16],ax
  40bb71:	mov    ebx,DWORD PTR [ebp-0x18]
  40bb74:	pop    edi
  40bb75:	mov    ecx,edx
  40bb77:	mov    eax,esi
  40bb79:	shr    eax,0x1f
  40bb7c:	add    edx,edx
  40bb7e:	shr    ecx,0x1f
  40bb81:	add    ebx,ebx
  40bb83:	add    esi,esi
  40bb85:	or     ebx,ecx
  40bb87:	or     edx,eax
  40bb89:	mov    DWORD PTR [ebp-0x20],esi
  40bb8c:	mov    DWORD PTR [ebp-0x18],ebx
  40bb8f:	dec    edi
  40bb90:	jne    0x40bb75
  40bb92:	mov    edi,DWORD PTR [ebp-0x64]
  40bb95:	mov    DWORD PTR [ebp-0x44],ebx
  40bb98:	mov    DWORD PTR [ebp-0x1c],edx
  40bb9b:	mov    DWORD PTR [ebp-0x40],esi
  40bb9e:	push   0x0
  40bba0:	pop    ebx
  40bba1:	test   edi,edi
  40bba3:	jns    0x40bbdc
  40bba5:	neg    edi
  40bba7:	and    edi,0xff
  40bbad:	jle    0x40bbdc
  40bbaf:	mov    ebx,DWORD PTR [ebp-0x44]
  40bbb2:	mov    ecx,edx
  40bbb4:	shr    esi,1
  40bbb6:	mov    eax,ebx
  40bbb8:	shl    ecx,0x1f
  40bbbb:	shl    eax,0x1f
  40bbbe:	or     esi,ecx
  40bbc0:	shr    edx,1
  40bbc2:	shr    ebx,1
  40bbc4:	or     edx,eax
  40bbc6:	dec    edi
  40bbc7:	mov    DWORD PTR [ebp-0x18],ebx
  40bbca:	mov    DWORD PTR [ebp-0x20],esi
  40bbcd:	test   edi,edi
  40bbcf:	jg     0x40bbb2
  40bbd1:	mov    DWORD PTR [ebp-0x44],ebx
  40bbd4:	xor    ebx,ebx
  40bbd6:	mov    DWORD PTR [ebp-0x1c],edx
  40bbd9:	mov    DWORD PTR [ebp-0x40],esi
  40bbdc:	mov    esi,DWORD PTR [ebp-0x74]
  40bbdf:	mov    eax,DWORD PTR [ebp-0x48]
  40bbe2:	inc    eax
  40bbe3:	mov    DWORD PTR [ebp-0x54],eax
  40bbe6:	lea    edi,[esi+0x4]
  40bbe9:	mov    DWORD PTR [ebp-0x64],edi
  40bbec:	mov    ecx,edi
  40bbee:	mov    DWORD PTR [ebp-0x58],ecx
  40bbf1:	test   eax,eax
  40bbf3:	jle    0x40bcc1
  40bbf9:	lea    esi,[ebp-0x20]
  40bbfc:	mov    ecx,edx
  40bbfe:	lea    edi,[ebp-0x3c]
  40bc01:	shr    ecx,0x1f
  40bc04:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40bc05:	add    edx,edx
  40bc07:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40bc08:	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  40bc09:	mov    edi,DWORD PTR [ebp-0x40]
  40bc0c:	mov    eax,edi
  40bc0e:	shr    eax,0x1f
  40bc11:	add    edi,edi
  40bc13:	or     edx,eax
  40bc15:	mov    eax,DWORD PTR [ebp-0x44]
  40bc18:	lea    esi,[eax+eax*1]
  40bc1b:	mov    eax,edi
  40bc1d:	or     esi,ecx
  40bc1f:	shr    eax,0x1f
  40bc22:	mov    ecx,edx
  40bc24:	add    edi,edi
  40bc26:	add    edx,edx
  40bc28:	shr    ecx,0x1f
  40bc2b:	or     edx,eax
  40bc2d:	add    esi,esi
  40bc2f:	mov    eax,DWORD PTR [ebp-0x3c]
  40bc32:	or     esi,ecx
  40bc34:	lea    ecx,[eax+edi*1]
  40bc37:	mov    DWORD PTR [ebp-0x48],ecx
  40bc3a:	cmp    ecx,edi
  40bc3c:	jb     0x40bc42
  40bc3e:	cmp    ecx,eax
  40bc40:	jae    0x40bc5d
  40bc42:	lea    eax,[edx+0x1]
  40bc45:	mov    ecx,ebx
  40bc47:	cmp    eax,edx
  40bc49:	jb     0x40bc50
  40bc4b:	cmp    eax,0x1
  40bc4e:	jae    0x40bc53
  40bc50:	xor    ecx,ecx
  40bc52:	inc    ecx
  40bc53:	test   ecx,ecx
  40bc55:	mov    edx,eax
  40bc57:	mov    ecx,DWORD PTR [ebp-0x48]
  40bc5a:	je     0x40bc5d
  40bc5c:	inc    esi
  40bc5d:	mov    eax,DWORD PTR [ebp-0x38]
  40bc60:	lea    edi,[eax+edx*1]
  40bc63:	cmp    edi,edx
  40bc65:	jb     0x40bc6b
  40bc67:	cmp    edi,eax
  40bc69:	jae    0x40bc6c
  40bc6b:	inc    esi
  40bc6c:	add    esi,DWORD PTR [ebp-0x34]
  40bc6f:	mov    eax,ecx
  40bc71:	mov    edx,DWORD PTR [ebp-0x48]
  40bc74:	mov    ecx,edi
  40bc76:	add    edx,edx
  40bc78:	shr    eax,0x1f
  40bc7b:	mov    DWORD PTR [ebp-0x40],edx
  40bc7e:	mov    DWORD PTR [ebp-0x20],edx
  40bc81:	lea    edx,[edi+edi*1]
  40bc84:	or     edx,eax
  40bc86:	shr    ecx,0x1f
  40bc89:	lea    eax,[esi+esi*1]
  40bc8c:	mov    DWORD PTR [ebp-0x1c],edx
  40bc8f:	or     eax,ecx
  40bc91:	mov    ecx,DWORD PTR [ebp-0x58]
  40bc94:	mov    DWORD PTR [ebp-0x18],eax
  40bc97:	shr    eax,0x18
  40bc9a:	add    al,0x30
  40bc9c:	mov    BYTE PTR [ebp-0x15],bl
  40bc9f:	mov    BYTE PTR [ecx],al
  40bca1:	inc    ecx
  40bca2:	mov    eax,DWORD PTR [ebp-0x54]
  40bca5:	dec    eax
  40bca6:	mov    DWORD PTR [ebp-0x58],ecx
  40bca9:	mov    DWORD PTR [ebp-0x54],eax
  40bcac:	test   eax,eax
  40bcae:	jle    0x40bcbb
  40bcb0:	mov    eax,DWORD PTR [ebp-0x18]
  40bcb3:	mov    DWORD PTR [ebp-0x44],eax
  40bcb6:	jmp    0x40bbf9
  40bcbb:	mov    esi,DWORD PTR [ebp-0x74]
  40bcbe:	mov    edi,DWORD PTR [ebp-0x64]
  40bcc1:	mov    al,BYTE PTR [ecx-0x1]
  40bcc4:	sub    ecx,0x2
  40bcc7:	cmp    al,0x35
  40bcc9:	jl     0x40bd10
  40bccb:	jmp    0x40bcd6
  40bccd:	cmp    BYTE PTR [ecx],0x39
  40bcd0:	jne    0x40bcda
  40bcd2:	mov    BYTE PTR [ecx],0x30
  40bcd5:	dec    ecx
  40bcd6:	cmp    ecx,edi
  40bcd8:	jae    0x40bccd
  40bcda:	cmp    ecx,edi
  40bcdc:	jae    0x40bce2
  40bcde:	inc    ecx
  40bcdf:	inc    WORD PTR [esi]
  40bce2:	inc    BYTE PTR [ecx]
  40bce4:	mov    eax,DWORD PTR [ebp-0x74]
  40bce7:	sub    cl,al
  40bce9:	sub    cl,0x3
  40bcec:	mov    BYTE PTR [eax+0x3],cl
  40bcef:	movsx  ecx,cl
  40bcf2:	mov    BYTE PTR [ecx+eax*1+0x4],bl
  40bcf6:	xor    eax,eax
  40bcf8:	inc    eax
  40bcf9:	mov    ecx,DWORD PTR [ebp-0x4]
  40bcfc:	pop    edi
  40bcfd:	pop    esi
  40bcfe:	xor    ecx,ebp
  40bd00:	pop    ebx
  40bd01:	call   0x40120d
  40bd06:	mov    esp,ebp
  40bd08:	pop    ebp
  40bd09:	ret
  40bd0a:	cmp    BYTE PTR [ecx],0x30
  40bd0d:	jne    0x40bd14
  40bd0f:	dec    ecx
  40bd10:	cmp    ecx,edi
  40bd12:	jae    0x40bd0a
  40bd14:	cmp    ecx,edi
  40bd16:	jae    0x40bce4
  40bd18:	mov    ecx,DWORD PTR [ebp-0x74]
  40bd1b:	xor    eax,eax
  40bd1d:	mov    WORD PTR [ecx],ax
  40bd20:	mov    eax,0x8000
  40bd25:	cmp    WORD PTR [ebp-0x80],ax
  40bd29:	setne  al
  40bd2c:	dec    al
  40bd2e:	and    al,0xd
  40bd30:	add    al,0x20
  40bd32:	mov    BYTE PTR [ecx+0x2],al
  40bd35:	xor    eax,eax
  40bd37:	inc    eax
  40bd38:	mov    BYTE PTR [ecx+0x3],al
  40bd3b:	mov    BYTE PTR [edi],0x30
  40bd3e:	jmp    0x40bb45
  40bd43:	xor    ebx,ebx
  40bd45:	push   ebx
  40bd46:	push   ebx
  40bd47:	push   ebx
  40bd48:	push   ebx
  40bd49:	push   ebx
  40bd4a:	call   0x4016c6
  40bd4f:	int3
  40bd50:	push   ebp
  40bd51:	mov    ebp,esp
  40bd53:	mov    ecx,DWORD PTR [ebp+0x8]
  40bd56:	xor    eax,eax
  40bd58:	test   cl,0x10
  40bd5b:	je     0x40bd62
  40bd5d:	mov    eax,0x80
  40bd62:	push   ebx
  40bd63:	push   esi
  40bd64:	push   edi
  40bd65:	mov    edi,0x200
  40bd6a:	test   cl,0x8
  40bd6d:	je     0x40bd71
  40bd6f:	or     eax,edi
  40bd71:	test   cl,0x4
  40bd74:	je     0x40bd7b
  40bd76:	or     eax,0x400
  40bd7b:	test   cl,0x2
  40bd7e:	je     0x40bd85
  40bd80:	or     eax,0x800
  40bd85:	test   cl,0x1
  40bd88:	je     0x40bd8f
  40bd8a:	or     eax,0x1000
  40bd8f:	mov    esi,0x100
  40bd94:	test   ecx,0x80000
  40bd9a:	je     0x40bd9e
  40bd9c:	or     eax,esi
  40bd9e:	mov    edx,ecx
  40bda0:	mov    ebx,0x300
  40bda5:	and    edx,ebx
  40bda7:	je     0x40bdc8
  40bda9:	cmp    edx,esi
  40bdab:	je     0x40bdc3
  40bdad:	cmp    edx,edi
  40bdaf:	je     0x40bdbc
  40bdb1:	cmp    edx,ebx
  40bdb3:	jne    0x40bdc8
  40bdb5:	or     eax,0x6000
  40bdba:	jmp    0x40bdc8
  40bdbc:	or     eax,0x4000
  40bdc1:	jmp    0x40bdc8
  40bdc3:	or     eax,0x2000
  40bdc8:	mov    edx,0x3000000
  40bdcd:	pop    edi
  40bdce:	and    ecx,edx
  40bdd0:	pop    esi
  40bdd1:	pop    ebx
  40bdd2:	cmp    ecx,0x1000000
  40bdd8:	je     0x40bdf2
  40bdda:	cmp    ecx,0x2000000
  40bde0:	je     0x40bded
  40bde2:	cmp    ecx,edx
  40bde4:	jne    0x40bdf7
  40bde6:	or     eax,0x8000
  40bdeb:	pop    ebp
  40bdec:	ret
  40bded:	or     eax,0x40
  40bdf0:	pop    ebp
  40bdf1:	ret
  40bdf2:	or     eax,0x8040
  40bdf7:	pop    ebp
  40bdf8:	ret
  40bdf9:	push   ebp
  40bdfa:	mov    ebp,esp
  40bdfc:	sub    esp,0xc
  40bdff:	fstcw  WORD PTR [ebp-0x4]
  40be03:	mov    ax,WORD PTR [ebp-0x4]
  40be07:	xor    ecx,ecx
  40be09:	test   al,0x1
  40be0b:	je     0x40be10
  40be0d:	push   0x10
  40be0f:	pop    ecx
  40be10:	test   al,0x4
  40be12:	je     0x40be17
  40be14:	or     ecx,0x8
  40be17:	test   al,0x8
  40be19:	je     0x40be1e
  40be1b:	or     ecx,0x4
  40be1e:	test   al,0x10
  40be20:	je     0x40be25
  40be22:	or     ecx,0x2
  40be25:	test   al,0x20
  40be27:	je     0x40be2c
  40be29:	or     ecx,0x1
  40be2c:	test   al,0x2
  40be2e:	je     0x40be36
  40be30:	or     ecx,0x80000
  40be36:	push   ebx
  40be37:	push   esi
  40be38:	movzx  esi,ax
  40be3b:	mov    ebx,0xc00
  40be40:	mov    edx,esi
  40be42:	push   edi
  40be43:	mov    edi,0x200
  40be48:	and    edx,ebx
  40be4a:	je     0x40be72
  40be4c:	cmp    edx,0x400
  40be52:	je     0x40be6c
  40be54:	cmp    edx,0x800
  40be5a:	je     0x40be68
  40be5c:	cmp    edx,ebx
  40be5e:	jne    0x40be72
  40be60:	or     ecx,0x300
  40be66:	jmp    0x40be72
  40be68:	or     ecx,edi
  40be6a:	jmp    0x40be72
  40be6c:	or     ecx,0x100
  40be72:	and    esi,0x300
  40be78:	je     0x40be86
  40be7a:	cmp    esi,edi
  40be7c:	jne    0x40be8c
  40be7e:	or     ecx,0x10000
  40be84:	jmp    0x40be8c
  40be86:	or     ecx,0x20000
  40be8c:	movzx  eax,ax
  40be8f:	mov    edx,0x1000
  40be94:	test   edx,eax
  40be96:	je     0x40be9e
  40be98:	or     ecx,0x40000
  40be9e:	mov    edi,DWORD PTR [ebp+0xc]
  40bea1:	mov    esi,edi
  40bea3:	mov    eax,DWORD PTR [ebp+0x8]
  40bea6:	not    esi
  40bea8:	and    esi,ecx
  40beaa:	and    eax,edi
  40beac:	or     esi,eax
  40beae:	cmp    esi,ecx
  40beb0:	je     0x40bf5c
  40beb6:	push   esi
  40beb7:	call   0x40c0fb
  40bebc:	movzx  eax,ax
  40bebf:	pop    ecx
  40bec0:	mov    DWORD PTR [ebp-0x8],eax
  40bec3:	fldcw  WORD PTR [ebp-0x8]
  40bec6:	fstcw  WORD PTR [ebp-0x8]
  40beca:	mov    eax,DWORD PTR [ebp-0x8]
  40becd:	xor    esi,esi
  40becf:	test   al,0x1
  40bed1:	je     0x40bed6
  40bed3:	push   0x10
  40bed5:	pop    esi
  40bed6:	test   al,0x4
  40bed8:	je     0x40bedd
  40beda:	or     esi,0x8
  40bedd:	test   al,0x8
  40bedf:	je     0x40bee4
  40bee1:	or     esi,0x4
  40bee4:	test   al,0x10
  40bee6:	je     0x40beeb
  40bee8:	or     esi,0x2
  40beeb:	test   al,0x20
  40beed:	je     0x40bef2
  40beef:	or     esi,0x1
  40bef2:	test   al,0x2
  40bef4:	je     0x40befc
  40bef6:	or     esi,0x80000
  40befc:	movzx  edx,ax
  40beff:	mov    ecx,edx
  40bf01:	and    ecx,ebx
  40bf03:	je     0x40bf2f
  40bf05:	cmp    ecx,0x400
  40bf0b:	je     0x40bf29
  40bf0d:	cmp    ecx,0x800
  40bf13:	je     0x40bf21
  40bf15:	cmp    ecx,ebx
  40bf17:	jne    0x40bf2f
  40bf19:	or     esi,0x300
  40bf1f:	jmp    0x40bf2f
  40bf21:	or     esi,0x200
  40bf27:	jmp    0x40bf2f
  40bf29:	or     esi,0x100
  40bf2f:	and    edx,0x300
  40bf35:	je     0x40bf47
  40bf37:	cmp    edx,0x200
  40bf3d:	jne    0x40bf4d
  40bf3f:	or     esi,0x10000
  40bf45:	jmp    0x40bf4d
  40bf47:	or     esi,0x20000
  40bf4d:	mov    edx,0x1000
  40bf52:	test   edx,eax
  40bf54:	je     0x40bf5c
  40bf56:	or     esi,0x40000
  40bf5c:	cmp    DWORD PTR ds:0x413e5c,0x1
  40bf63:	jl     0x40c0f2
  40bf69:	and    edi,0x308031f
  40bf6f:	stmxcsr DWORD PTR [ebp-0xc]
  40bf73:	mov    eax,DWORD PTR [ebp-0xc]
  40bf76:	xor    ecx,ecx
  40bf78:	test   al,al
  40bf7a:	jns    0x40bf7f
  40bf7c:	push   0x10
  40bf7e:	pop    ecx
  40bf7f:	test   eax,0x200
  40bf84:	je     0x40bf89
  40bf86:	or     ecx,0x8
  40bf89:	test   eax,0x400
  40bf8e:	je     0x40bf93
  40bf90:	or     ecx,0x4
  40bf93:	test   eax,0x800
  40bf98:	je     0x40bf9d
  40bf9a:	or     ecx,0x2
  40bf9d:	test   edx,eax
  40bf9f:	je     0x40bfa4
  40bfa1:	or     ecx,0x1
  40bfa4:	test   eax,0x100
  40bfa9:	je     0x40bfb1
  40bfab:	or     ecx,0x80000
  40bfb1:	mov    edx,eax
  40bfb3:	mov    ebx,0x6000
  40bfb8:	and    edx,ebx
  40bfba:	je     0x40bfe6
  40bfbc:	cmp    edx,0x2000
  40bfc2:	je     0x40bfe0
  40bfc4:	cmp    edx,0x4000
  40bfca:	je     0x40bfd8
  40bfcc:	cmp    edx,ebx
  40bfce:	jne    0x40bfe6
  40bfd0:	or     ecx,0x300
  40bfd6:	jmp    0x40bfe6
  40bfd8:	or     ecx,0x200
  40bfde:	jmp    0x40bfe6
  40bfe0:	or     ecx,0x100
  40bfe6:	push   0x40
  40bfe8:	and    eax,0x8040
  40bfed:	pop    ebx
  40bfee:	sub    eax,ebx
  40bff0:	je     0x40c00d
  40bff2:	sub    eax,0x7fc0
  40bff7:	je     0x40c005
  40bff9:	sub    eax,ebx
  40bffb:	jne    0x40c013
  40bffd:	or     ecx,0x1000000
  40c003:	jmp    0x40c013
  40c005:	or     ecx,0x3000000
  40c00b:	jmp    0x40c013
  40c00d:	or     ecx,0x2000000
  40c013:	mov    eax,edi
  40c015:	and    edi,DWORD PTR [ebp+0x8]
  40c018:	not    eax
  40c01a:	and    eax,ecx
  40c01c:	or     eax,edi
  40c01e:	cmp    eax,ecx
  40c020:	je     0x40c0db
  40c026:	push   eax
  40c027:	call   0x40bd50
  40c02c:	push   eax
  40c02d:	mov    DWORD PTR [ebp+0xc],eax
  40c030:	call   0x40c192
  40c035:	pop    ecx
  40c036:	pop    ecx
  40c037:	stmxcsr DWORD PTR [ebp+0xc]
  40c03b:	mov    eax,DWORD PTR [ebp+0xc]
  40c03e:	xor    ecx,ecx
  40c040:	test   al,al
  40c042:	jns    0x40c047
  40c044:	push   0x10
  40c046:	pop    ecx
  40c047:	test   eax,0x200
  40c04c:	je     0x40c051
  40c04e:	or     ecx,0x8
  40c051:	test   eax,0x400
  40c056:	je     0x40c05b
  40c058:	or     ecx,0x4
  40c05b:	test   eax,0x800
  40c060:	je     0x40c065
  40c062:	or     ecx,0x2
  40c065:	test   eax,0x1000
  40c06a:	je     0x40c06f
  40c06c:	or     ecx,0x1
  40c06f:	test   eax,0x100
  40c074:	je     0x40c07c
  40c076:	or     ecx,0x80000
  40c07c:	mov    edx,eax
  40c07e:	mov    edi,0x6000
  40c083:	and    edx,edi
  40c085:	je     0x40c0b1
  40c087:	cmp    edx,0x2000
  40c08d:	je     0x40c0ab
  40c08f:	cmp    edx,0x4000
  40c095:	je     0x40c0a3
  40c097:	cmp    edx,edi
  40c099:	jne    0x40c0b1
  40c09b:	or     ecx,0x300
  40c0a1:	jmp    0x40c0b1
  40c0a3:	or     ecx,0x200
  40c0a9:	jmp    0x40c0b1
  40c0ab:	or     ecx,0x100
  40c0b1:	and    eax,0x8040
  40c0b6:	sub    eax,ebx
  40c0b8:	je     0x40c0d5
  40c0ba:	sub    eax,0x7fc0
  40c0bf:	je     0x40c0cd
  40c0c1:	sub    eax,ebx
  40c0c3:	jne    0x40c0db
  40c0c5:	or     ecx,0x1000000
  40c0cb:	jmp    0x40c0db
  40c0cd:	or     ecx,0x3000000
  40c0d3:	jmp    0x40c0db
  40c0d5:	or     ecx,0x2000000
  40c0db:	mov    eax,ecx
  40c0dd:	or     ecx,esi
  40c0df:	xor    eax,esi
  40c0e1:	test   eax,0x8031f
  40c0e6:	je     0x40c0ee
  40c0e8:	or     ecx,0x80000000
  40c0ee:	mov    eax,ecx
  40c0f0:	jmp    0x40c0f4
  40c0f2:	mov    eax,esi
  40c0f4:	pop    edi
  40c0f5:	pop    esi
  40c0f6:	pop    ebx
  40c0f7:	mov    esp,ebp
  40c0f9:	pop    ebp
  40c0fa:	ret
  40c0fb:	push   ebp
  40c0fc:	mov    ebp,esp
  40c0fe:	mov    ecx,DWORD PTR [ebp+0x8]
  40c101:	xor    eax,eax
  40c103:	test   cl,0x10
  40c106:	je     0x40c109
  40c108:	inc    eax
  40c109:	test   cl,0x8
  40c10c:	je     0x40c111
  40c10e:	or     eax,0x4
  40c111:	test   cl,0x4
  40c114:	je     0x40c119
  40c116:	or     eax,0x8
  40c119:	test   cl,0x2
  40c11c:	je     0x40c121
  40c11e:	or     eax,0x10
  40c121:	test   cl,0x1
  40c124:	je     0x40c129
  40c126:	or     eax,0x20
  40c129:	test   ecx,0x80000
  40c12f:	je     0x40c134
  40c131:	or     eax,0x2
  40c134:	push   esi
  40c135:	mov    edx,ecx
  40c137:	mov    esi,0x300
  40c13c:	push   edi
  40c13d:	mov    edi,0x200
  40c142:	and    edx,esi
  40c144:	je     0x40c169
  40c146:	cmp    edx,0x100
  40c14c:	je     0x40c164
  40c14e:	cmp    edx,edi
  40c150:	je     0x40c15d
  40c152:	cmp    edx,esi
  40c154:	jne    0x40c169
  40c156:	or     eax,0xc00
  40c15b:	jmp    0x40c169
  40c15d:	or     eax,0x800
  40c162:	jmp    0x40c169
  40c164:	or     eax,0x400
  40c169:	mov    edx,ecx
  40c16b:	and    edx,0x30000
  40c171:	je     0x40c17f
  40c173:	cmp    edx,0x10000
  40c179:	jne    0x40c181
  40c17b:	or     eax,edi
  40c17d:	jmp    0x40c181
  40c17f:	or     eax,esi
  40c181:	pop    edi
  40c182:	pop    esi
  40c183:	test   ecx,0x40000
  40c189:	je     0x40c190
  40c18b:	or     eax,0x1000
  40c190:	pop    ebp
  40c191:	ret
  40c192:	push   0x8
  40c194:	push   0x4111b8
  40c199:	call   0x403b60
  40c19e:	cmp    DWORD PTR ds:0x413e5c,0x1
  40c1a5:	jl     0x40c202
  40c1a7:	mov    eax,DWORD PTR [ebp+0x8]
  40c1aa:	test   al,0x40
  40c1ac:	je     0x40c1f8
  40c1ae:	cmp    DWORD PTR ds:0x4130b8,0x0
  40c1b5:	je     0x40c1f8
  40c1b7:	and    DWORD PTR [ebp-0x4],0x0
  40c1bb:	ldmxcsr DWORD PTR [ebp+0x8]
  40c1bf:	jmp    0x40c1ef
  40c1c1:	mov    eax,DWORD PTR [ebp-0x14]
  40c1c4:	mov    eax,DWORD PTR [eax]
  40c1c6:	cmp    DWORD PTR [eax],0xc0000005
  40c1cc:	je     0x40c1d9
  40c1ce:	cmp    DWORD PTR [eax],0xc000001d
  40c1d4:	je     0x40c1d9
  40c1d6:	xor    eax,eax
  40c1d8:	ret
  40c1d9:	xor    eax,eax
  40c1db:	inc    eax
  40c1dc:	ret
  40c1dd:	mov    esp,DWORD PTR [ebp-0x18]
  40c1e0:	and    DWORD PTR ds:0x4130b8,0x0
  40c1e7:	and    DWORD PTR [ebp+0x8],0xffffffbf
  40c1eb:	ldmxcsr DWORD PTR [ebp+0x8]
  40c1ef:	mov    DWORD PTR [ebp-0x4],0xfffffffe
  40c1f6:	jmp    0x40c202
  40c1f8:	and    eax,0xffffffbf
  40c1fb:	mov    DWORD PTR [ebp+0x8],eax
  40c1fe:	ldmxcsr DWORD PTR [ebp+0x8]
  40c202:	call   0x403ba5
  40c207:	ret
  40c208:	jmp    DWORD PTR ds:0x40d01c
  40c20e:	jmp    DWORD PTR ds:0x40d0d4
