
original/[crackme #2]-FindMe.exe:     file format pei-i386


Disassembly of section .text:

00401214 <_convert>:
  401214:	55                   	push   ebp
  401215:	89 e5                	mov    ebp,esp
  401217:	83 ec 18             	sub    esp,0x18
  40121a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401221:	8d 76 00             	lea    esi,[esi+0x0]
  401224:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401227:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40122a:	01 d0                	add    eax,edx
  40122c:	80 38 00             	cmp    BYTE PTR [eax],0x0
  40122f:	75 03                	jne    401234 <_convert+0x20>
  401231:	eb 65                	jmp    401298 <_convert+0x84>
  401233:	90                   	nop
  401234:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401237:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40123a:	01 d0                	add    eax,edx
  40123c:	8a 10                	mov    dl,BYTE PTR [eax]
  40123e:	88 55 fb             	mov    BYTE PTR [ebp-0x5],dl
  401241:	8a 45 fb             	mov    al,BYTE PTR [ebp-0x5]
  401244:	c0 e8 04             	shr    al,0x4
  401247:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
  40124a:	80 7d fa 09          	cmp    BYTE PTR [ebp-0x6],0x9
  40124e:	76 08                	jbe    401258 <_convert+0x44>
  401250:	80 45 fa 36          	add    BYTE PTR [ebp-0x6],0x36
  401254:	eb 06                	jmp    40125c <_convert+0x48>
  401256:	89 f6                	mov    esi,esi
  401258:	80 45 fa 30          	add    BYTE PTR [ebp-0x6],0x30
  40125c:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40125f:	8d 04 12             	lea    eax,[edx+edx*1]
  401262:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  401265:	8a 4d fa             	mov    cl,BYTE PTR [ebp-0x6]
  401268:	88 0c 02             	mov    BYTE PTR [edx+eax*1],cl
  40126b:	80 65 fb 0f          	and    BYTE PTR [ebp-0x5],0xf
  40126f:	80 7d fb 09          	cmp    BYTE PTR [ebp-0x5],0x9
  401273:	76 07                	jbe    40127c <_convert+0x68>
  401275:	80 45 fb 36          	add    BYTE PTR [ebp-0x5],0x36
  401279:	eb 05                	jmp    401280 <_convert+0x6c>
  40127b:	90                   	nop
  40127c:	80 45 fb 30          	add    BYTE PTR [ebp-0x5],0x30
  401280:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  401283:	8d 14 00             	lea    edx,[eax+eax*1]
  401286:	89 d0                	mov    eax,edx
  401288:	03 45 0c             	add    eax,DWORD PTR [ebp+0xc]
  40128b:	8d 50 01             	lea    edx,[eax+0x1]
  40128e:	8a 45 fb             	mov    al,BYTE PTR [ebp-0x5]
  401291:	88 02                	mov    BYTE PTR [edx],al
  401293:	ff 45 fc             	inc    DWORD PTR [ebp-0x4]
  401296:	eb 8c                	jmp    401224 <_convert+0x10>
  401298:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  40129b:	8d 14 00             	lea    edx,[eax+eax*1]
  40129e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  4012a1:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
  4012a5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012a8:	89 c2                	mov    edx,eax
  4012aa:	8d 0c 12             	lea    ecx,[edx+edx*1]
  4012ad:	89 c8                	mov    eax,ecx
  4012af:	eb 03                	jmp    4012b4 <_convert+0xa0>
  4012b1:	8d 76 00             	lea    esi,[esi+0x0]
  4012b4:	c9                   	leave
  4012b5:	c3                   	ret
  4012b6:	89 f6                	mov    esi,esi

004012b8 <_check>:
  4012b8:	55                   	push   ebp
  4012b9:	89 e5                	mov    ebp,esp
  4012bb:	83 ec 28             	sub    esp,0x28
  4012be:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
  4012c5:	6a 00                	push   0x0
  4012c7:	6a 00                	push   0x0
  4012c9:	6a 0e                	push   0xe
  4012cb:	a1 20 30 40 00       	mov    eax,ds:0x403020
  4012d0:	50                   	push   eax
  4012d1:	e8 8a 04 00 00       	call   401760 <_SendMessageA@16>
  4012d6:	a3 00 30 40 00       	mov    ds:0x403000,eax
  4012db:	83 3d 00 30 40 00 00 	cmp    DWORD PTR ds:0x403000,0x0
  4012e2:	0f 8e 73 01 00 00    	jle    40145b <_check+0x1a3>
  4012e8:	83 c4 f8             	add    esp,0xfffffff8
  4012eb:	a1 00 30 40 00       	mov    eax,ds:0x403000
  4012f0:	40                   	inc    eax
  4012f1:	50                   	push   eax
  4012f2:	6a 40                	push   0x40
  4012f4:	e8 9f 04 00 00       	call   401798 <_GlobalAlloc@8>
  4012f9:	83 c4 08             	add    esp,0x8
  4012fc:	a3 30 30 40 00       	mov    ds:0x403030,eax
  401301:	a1 30 30 40 00       	mov    eax,ds:0x403030
  401306:	50                   	push   eax
  401307:	a1 00 30 40 00       	mov    eax,ds:0x403000
  40130c:	40                   	inc    eax
  40130d:	50                   	push   eax
  40130e:	6a 0d                	push   0xd
  401310:	a1 20 30 40 00       	mov    eax,ds:0x403020
  401315:	50                   	push   eax
  401316:	e8 45 04 00 00       	call   401760 <_SendMessageA@16>
  40131b:	83 c4 f8             	add    esp,0xfffffff8
  40131e:	a1 00 30 40 00       	mov    eax,ds:0x403000
  401323:	89 c2                	mov    edx,eax
  401325:	8d 04 12             	lea    eax,[edx+edx*1]
  401328:	8d 50 01             	lea    edx,[eax+0x1]
  40132b:	52                   	push   edx
  40132c:	6a 40                	push   0x40
  40132e:	e8 65 04 00 00       	call   401798 <_GlobalAlloc@8>
  401333:	83 c4 08             	add    esp,0x8
  401336:	89 c0                	mov    eax,eax
  401338:	a3 10 30 40 00       	mov    ds:0x403010,eax
  40133d:	83 c4 f8             	add    esp,0xfffffff8
  401340:	a1 00 30 40 00       	mov    eax,ds:0x403000
  401345:	89 c2                	mov    edx,eax
  401347:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
  40134e:	8d 50 01             	lea    edx,[eax+0x1]
  401351:	52                   	push   edx
  401352:	6a 40                	push   0x40
  401354:	e8 3f 04 00 00       	call   401798 <_GlobalAlloc@8>
  401359:	83 c4 08             	add    esp,0x8
  40135c:	89 c0                	mov    eax,eax
  40135e:	a3 14 30 40 00       	mov    ds:0x403014,eax
  401363:	83 c4 f8             	add    esp,0xfffffff8
  401366:	a1 00 30 40 00       	mov    eax,ds:0x403000
  40136b:	89 c2                	mov    edx,eax
  40136d:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
  401374:	8d 50 01             	lea    edx,[eax+0x1]
  401377:	52                   	push   edx
  401378:	6a 40                	push   0x40
  40137a:	e8 19 04 00 00       	call   401798 <_GlobalAlloc@8>
  40137f:	83 c4 08             	add    esp,0x8
  401382:	89 c0                	mov    eax,eax
  401384:	a3 18 30 40 00       	mov    ds:0x403018,eax
  401389:	83 c4 f8             	add    esp,0xfffffff8
  40138c:	a1 10 30 40 00       	mov    eax,ds:0x403010
  401391:	50                   	push   eax
  401392:	a1 30 30 40 00       	mov    eax,ds:0x403030
  401397:	50                   	push   eax
  401398:	e8 77 fe ff ff       	call   401214 <_convert>
  40139d:	83 c4 10             	add    esp,0x10
  4013a0:	89 c0                	mov    eax,eax
  4013a2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4013a5:	83 c4 f8             	add    esp,0xfffffff8
  4013a8:	a1 14 30 40 00       	mov    eax,ds:0x403014
  4013ad:	50                   	push   eax
  4013ae:	a1 10 30 40 00       	mov    eax,ds:0x403010
  4013b3:	50                   	push   eax
  4013b4:	e8 5b fe ff ff       	call   401214 <_convert>
  4013b9:	83 c4 10             	add    esp,0x10
  4013bc:	89 c0                	mov    eax,eax
  4013be:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4013c1:	83 c4 f8             	add    esp,0xfffffff8
  4013c4:	a1 18 30 40 00       	mov    eax,ds:0x403018
  4013c9:	50                   	push   eax
  4013ca:	a1 14 30 40 00       	mov    eax,ds:0x403014
  4013cf:	50                   	push   eax
  4013d0:	e8 3f fe ff ff       	call   401214 <_convert>
  4013d5:	83 c4 10             	add    esp,0x10
  4013d8:	89 c0                	mov    eax,eax
  4013da:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  4013dd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4013e0:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  4013e3:	01 d0                	add    eax,edx
  4013e5:	89 c2                	mov    edx,eax
  4013e7:	03 55 f4             	add    edx,DWORD PTR [ebp-0xc]
  4013ea:	81 fa d2 00 00 00    	cmp    edx,0xd2
  4013f0:	75 3e                	jne    401430 <_check+0x178>
  4013f2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  4013f9:	8d 76 00             	lea    esi,[esi+0x0]
  4013fc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4013ff:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
  401402:	7c 04                	jl     401408 <_check+0x150>
  401404:	eb 2a                	jmp    401430 <_check+0x178>
  401406:	89 f6                	mov    esi,esi
  401408:	a1 18 30 40 00       	mov    eax,ds:0x403018
  40140d:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
  401410:	01 d0                	add    eax,edx
  401412:	8a 10                	mov    dl,BYTE PTR [eax]
  401414:	b1 ff                	mov    cl,0xff
  401416:	88 c8                	mov    al,cl
  401418:	28 d0                	sub    al,dl
  40141a:	ba 1a 20 40 00       	mov    edx,0x40201a
  40141f:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  401422:	3a 04 11             	cmp    al,BYTE PTR [ecx+edx*1]
  401425:	75 03                	jne    40142a <_check+0x172>
  401427:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  40142a:	ff 45 f0             	inc    DWORD PTR [ebp-0x10]
  40142d:	eb cd                	jmp    4013fc <_check+0x144>
  40142f:	90                   	nop
  401430:	c7 45 e8 10 20 40 00 	mov    DWORD PTR [ebp-0x18],0x402010
  401437:	83 7d ec 78          	cmp    DWORD PTR [ebp-0x14],0x78
  40143b:	75 04                	jne    401441 <_check+0x189>
  40143d:	83 45 e8 02          	add    DWORD PTR [ebp-0x18],0x2
  401441:	83 c4 fc             	add    esp,0xfffffffc
  401444:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  401447:	50                   	push   eax
  401448:	68 9a 02 00 00       	push   0x29a
  40144d:	a1 40 30 40 00       	mov    eax,ds:0x403040
  401452:	50                   	push   eax
  401453:	e8 10 03 00 00       	call   401768 <_SetDlgItemTextA@12>
  401458:	83 c4 04             	add    esp,0x4
  40145b:	83 c4 f4             	add    esp,0xfffffff4
  40145e:	a1 30 30 40 00       	mov    eax,ds:0x403030
  401463:	50                   	push   eax
  401464:	e8 37 03 00 00       	call   4017a0 <_GlobalFree@4>
  401469:	83 c4 0c             	add    esp,0xc
  40146c:	83 c4 f4             	add    esp,0xfffffff4
  40146f:	a1 10 30 40 00       	mov    eax,ds:0x403010
  401474:	50                   	push   eax
  401475:	e8 26 03 00 00       	call   4017a0 <_GlobalFree@4>
  40147a:	83 c4 0c             	add    esp,0xc
  40147d:	83 c4 f4             	add    esp,0xfffffff4
  401480:	a1 14 30 40 00       	mov    eax,ds:0x403014
  401485:	50                   	push   eax
  401486:	e8 15 03 00 00       	call   4017a0 <_GlobalFree@4>
  40148b:	83 c4 0c             	add    esp,0xc
  40148e:	83 c4 f4             	add    esp,0xfffffff4
  401491:	a1 18 30 40 00       	mov    eax,ds:0x403018
  401496:	50                   	push   eax
  401497:	e8 04 03 00 00       	call   4017a0 <_GlobalFree@4>
  40149c:	83 c4 0c             	add    esp,0xc
  40149f:	c9                   	leave
  4014a0:	c3                   	ret
