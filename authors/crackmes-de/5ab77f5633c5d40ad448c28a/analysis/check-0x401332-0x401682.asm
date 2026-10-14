  401332:	55                   	push   ebp
  401333:	89 e5                	mov    ebp,esp
  401335:	57                   	push   edi
  401336:	56                   	push   esi
  401337:	53                   	push   ebx
  401338:	83 ec 7c             	sub    esp,0x7c
  40133b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40133e:	66 c7 45 d8 00 00    	mov    WORD PTR [ebp-0x28],0x0
  401344:	c6 45 da 00          	mov    BYTE PTR [ebp-0x26],0x0
  401348:	8d 7d a8             	lea    edi,[ebp-0x58]
  40134b:	fc                   	cld
  40134c:	b9 08 00 00 00       	mov    ecx,0x8
  401351:	b8 00 00 00 00       	mov    eax,0x0
  401356:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  401358:	c6 07 00             	mov    BYTE PTR [edi],0x0
  40135b:	89 df                	mov    edi,ebx
  40135d:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  401362:	f2 ae                	repnz scas al,BYTE PTR es:[edi]
  401364:	ba ff ff ff ff       	mov    edx,0xffffffff
  401369:	83 f9 d3             	cmp    ecx,0xffffffd3
  40136c:	0f 85 0c 02 00 00    	jne    0x40157e
  401372:	8d 55 a8             	lea    edx,[ebp-0x58]
  401375:	8d 45 c0             	lea    eax,[ebp-0x40]
  401378:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  40137c:	8d 45 b8             	lea    eax,[ebp-0x48]
  40137f:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  401383:	8d 45 b0             	lea    eax,[ebp-0x50]
  401386:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40138a:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  40138e:	8d 45 d8             	lea    eax,[ebp-0x28]
  401391:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401395:	c7 44 24 04 00 40 40 	mov    DWORD PTR [esp+0x4],0x404000
  40139c:	00 
  40139d:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4013a0:	e8 0b 0c 00 00       	call   0x401fb0
  4013a5:	ba ff ff ff ff       	mov    edx,0xffffffff
  4013aa:	83 f8 05             	cmp    eax,0x5
  4013ad:	0f 85 cb 01 00 00    	jne    0x40157e
  4013b3:	c7 44 24 04 a4 32 40 	mov    DWORD PTR [esp+0x4],0x4032a4
  4013ba:	00 
  4013bb:	0f be 45 d8          	movsx  eax,BYTE PTR [ebp-0x28]
  4013bf:	89 04 24             	mov    DWORD PTR [esp],eax
  4013c2:	e8 8f 02 00 00       	call   0x401656
  4013c7:	ba ff ff ff ff       	mov    edx,0xffffffff
  4013cc:	83 f8 ff             	cmp    eax,0xffffffff
  4013cf:	0f 84 a9 01 00 00    	je     0x40157e
  4013d5:	c7 44 24 04 b2 32 40 	mov    DWORD PTR [esp+0x4],0x4032b2
  4013dc:	00 
  4013dd:	0f be 45 d9          	movsx  eax,BYTE PTR [ebp-0x27]
  4013e1:	89 04 24             	mov    DWORD PTR [esp],eax
  4013e4:	e8 6d 02 00 00       	call   0x401656
  4013e9:	ba ff ff ff ff       	mov    edx,0xffffffff
  4013ee:	83 f8 ff             	cmp    eax,0xffffffff
  4013f1:	0f 84 87 01 00 00    	je     0x40157e
  4013f7:	eb 1e                	jmp    0x401417
  4013f9:	ba ff ff ff ff       	mov    edx,0xffffffff
  4013fe:	e9 7b 01 00 00       	jmp    0x40157e
  401403:	ba ff ff ff ff       	mov    edx,0xffffffff
  401408:	e9 71 01 00 00       	jmp    0x40157e
  40140d:	ba ff ff ff ff       	mov    edx,0xffffffff
  401412:	e9 67 01 00 00       	jmp    0x40157e
  401417:	c7 44 24 04 a4 32 40 	mov    DWORD PTR [esp+0x4],0x4032a4
  40141e:	00 
  40141f:	0f be 45 d8          	movsx  eax,BYTE PTR [ebp-0x28]
  401423:	89 04 24             	mov    DWORD PTR [esp],eax
  401426:	e8 0f 02 00 00       	call   0x40163a
  40142b:	89 c2                	mov    edx,eax
  40142d:	bf 00 00 00 00       	mov    edi,0x0
  401432:	0f b6 82 a4 32 40 00 	movzx  eax,BYTE PTR [edx+0x4032a4]
  401439:	88 87 18 50 40 00    	mov    BYTE PTR [edi+0x405018],al
  40143f:	42                   	inc    edx
  401440:	83 fa 0d             	cmp    edx,0xd
  401443:	0f 95 c0             	setne  al
  401446:	0f b6 c0             	movzx  eax,al
  401449:	f7 d8                	neg    eax
  40144b:	21 c2                	and    edx,eax
  40144d:	47                   	inc    edi
  40144e:	83 ff 0c             	cmp    edi,0xc
  401451:	7e df                	jle    0x401432
  401453:	c7 44 24 04 b2 32 40 	mov    DWORD PTR [esp+0x4],0x4032b2
  40145a:	00 
  40145b:	0f be 45 d9          	movsx  eax,BYTE PTR [ebp-0x27]
  40145f:	89 04 24             	mov    DWORD PTR [esp],eax
  401462:	e8 d3 01 00 00       	call   0x40163a
  401467:	89 c2                	mov    edx,eax
  401469:	bf 00 00 00 00       	mov    edi,0x0
  40146e:	0f b6 82 b2 32 40 00 	movzx  eax,BYTE PTR [edx+0x4032b2]
  401475:	88 87 26 50 40 00    	mov    BYTE PTR [edi+0x405026],al
  40147b:	42                   	inc    edx
  40147c:	83 fa 0d             	cmp    edx,0xd
  40147f:	0f 95 c0             	setne  al
  401482:	0f b6 c0             	movzx  eax,al
  401485:	f7 d8                	neg    eax
  401487:	21 c2                	and    edx,eax
  401489:	47                   	inc    edi
  40148a:	83 ff 0c             	cmp    edi,0xc
  40148d:	7e df                	jle    0x40146e
  40148f:	8d 7d a8             	lea    edi,[ebp-0x58]
  401492:	fc                   	cld
  401493:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  401498:	b0 00                	mov    al,0x0
  40149a:	f2 ae                	repnz scas al,BYTE PTR es:[edi]
  40149c:	f7 d1                	not    ecx
  40149e:	8d 59 ff             	lea    ebx,[ecx-0x1]
  4014a1:	bf 00 00 00 00       	mov    edi,0x0
  4014a6:	39 df                	cmp    edi,ebx
  4014a8:	7d 42                	jge    0x4014ec
  4014aa:	f7 c7 01 00 00 00    	test   edi,0x1
  4014b0:	74 17                	je     0x4014c9
  4014b2:	c7 44 24 04 26 50 40 	mov    DWORD PTR [esp+0x4],0x405026
  4014b9:	00 
  4014ba:	0f be 44 2f a8       	movsx  eax,BYTE PTR [edi+ebp*1-0x58]
  4014bf:	89 04 24             	mov    DWORD PTR [esp],eax
  4014c2:	e8 8f 01 00 00       	call   0x401656
  4014c7:	eb 15                	jmp    0x4014de
  4014c9:	c7 44 24 04 18 50 40 	mov    DWORD PTR [esp+0x4],0x405018
  4014d0:	00 
  4014d1:	0f be 44 2f a8       	movsx  eax,BYTE PTR [edi+ebp*1-0x58]
  4014d6:	89 04 24             	mov    DWORD PTR [esp],eax
  4014d9:	e8 78 01 00 00       	call   0x401656
  4014de:	83 f8 ff             	cmp    eax,0xffffffff
  4014e1:	0f 84 12 ff ff ff    	je     0x4013f9
  4014e7:	47                   	inc    edi
  4014e8:	39 df                	cmp    edi,ebx
  4014ea:	7c be                	jl     0x4014aa
  4014ec:	c7 45 a4 ff ff ff ff 	mov    DWORD PTR [ebp-0x5c],0xffffffff
  4014f3:	c7 45 a0 ff ff ff ff 	mov    DWORD PTR [ebp-0x60],0xffffffff
  4014fa:	bf 00 00 00 00       	mov    edi,0x0
  4014ff:	0f be 44 7d a8       	movsx  eax,BYTE PTR [ebp+edi*2-0x58]
  401504:	0f be 5c 7d a9       	movsx  ebx,BYTE PTR [ebp+edi*2-0x57]
  401509:	c7 44 24 04 18 50 40 	mov    DWORD PTR [esp+0x4],0x405018
  401510:	00 
  401511:	89 04 24             	mov    DWORD PTR [esp],eax
  401514:	e8 21 01 00 00       	call   0x40163a
  401519:	89 c6                	mov    esi,eax
  40151b:	c7 44 24 04 26 50 40 	mov    DWORD PTR [esp+0x4],0x405026
  401522:	00 
  401523:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401526:	e8 0f 01 00 00       	call   0x40163a
  40152b:	89 c3                	mov    ebx,eax
  40152d:	c7 44 24 08 00 30 40 	mov    DWORD PTR [esp+0x8],0x403000
  401534:	00 
  401535:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401539:	89 34 24             	mov    DWORD PTR [esp],esi
  40153c:	e8 d9 00 00 00       	call   0x40161a
  401541:	83 f8 ff             	cmp    eax,0xffffffff
  401544:	0f 84 b9 fe ff ff    	je     0x401403
  40154a:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  40154e:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401552:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
  401555:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401559:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  40155c:	89 04 24             	mov    DWORD PTR [esp],eax
  40155f:	e8 24 00 00 00       	call   0x401588
  401564:	83 f8 ff             	cmp    eax,0xffffffff
  401567:	0f 84 a0 fe ff ff    	je     0x40140d
  40156d:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  401570:	89 5d a0             	mov    DWORD PTR [ebp-0x60],ebx
  401573:	47                   	inc    edi
  401574:	83 ff 0f             	cmp    edi,0xf
  401577:	7e 86                	jle    0x4014ff
  401579:	ba 00 00 00 00       	mov    edx,0x0
  40157e:	89 d0                	mov    eax,edx
  401580:	83 c4 7c             	add    esp,0x7c
  401583:	5b                   	pop    ebx
  401584:	5e                   	pop    esi
  401585:	5f                   	pop    edi
  401586:	5d                   	pop    ebp
  401587:	c3                   	ret
  401588:	55                   	push   ebp
  401589:	89 e5                	mov    ebp,esp
  40158b:	83 ec 0c             	sub    esp,0xc
  40158e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401591:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401595:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401599:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40159c:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
  40159f:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
  4015a2:	83 fb ff             	cmp    ebx,0xffffffff
  4015a5:	0f 94 c2             	sete   dl
  4015a8:	85 f6                	test   esi,esi
  4015aa:	0f 9f c0             	setg   al
  4015ad:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  4015b2:	84 d0                	test   al,dl
  4015b4:	75 52                	jne    0x401608
  4015b6:	83 fb 0c             	cmp    ebx,0xc
  4015b9:	74 4d                	je     0x401608
  4015bb:	89 d8                	mov    eax,ebx
  4015bd:	f7 d0                	not    eax
  4015bf:	c1 e8 1f             	shr    eax,0x1f
  4015c2:	89 fa                	mov    edx,edi
  4015c4:	f7 d2                	not    edx
  4015c6:	c1 ea 1f             	shr    edx,0x1f
  4015c9:	20 d0                	and    al,dl
  4015cb:	b9 00 00 00 00       	mov    ecx,0x0
  4015d0:	84 c0                	test   al,al
  4015d2:	74 34                	je     0x401608
  4015d4:	39 f3                	cmp    ebx,esi
  4015d6:	75 14                	jne    0x4015ec
  4015d8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  4015db:	48                   	dec    eax
  4015dc:	39 f8                	cmp    eax,edi
  4015de:	74 28                	je     0x401608
  4015e0:	39 f3                	cmp    ebx,esi
  4015e2:	75 08                	jne    0x4015ec
  4015e4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  4015e7:	40                   	inc    eax
  4015e8:	39 f8                	cmp    eax,edi
  4015ea:	74 1c                	je     0x401608
  4015ec:	8d 46 ff             	lea    eax,[esi-0x1]
  4015ef:	39 d8                	cmp    eax,ebx
  4015f1:	0f 94 c2             	sete   dl
  4015f4:	3b 7d 14             	cmp    edi,DWORD PTR [ebp+0x14]
  4015f7:	0f 94 c0             	sete   al
  4015fa:	b9 00 00 00 00       	mov    ecx,0x0
  4015ff:	84 d0                	test   al,dl
  401601:	75 05                	jne    0x401608
  401603:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  401608:	89 c8                	mov    eax,ecx
  40160a:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
  40160d:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  401611:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
  401615:	89 ec                	mov    esp,ebp
  401617:	5d                   	pop    ebp
  401618:	c3                   	ret
  401619:	90                   	nop
  40161a:	55                   	push   ebp
  40161b:	89 e5                	mov    ebp,esp
  40161d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401620:	8d 14 40             	lea    edx,[eax+eax*2]
  401623:	8d 14 90             	lea    edx,[eax+edx*4]
  401626:	03 55 08             	add    edx,DWORD PTR [ebp+0x8]
  401629:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  40162c:	83 3c 90 01          	cmp    DWORD PTR [eax+edx*4],0x1
  401630:	0f 94 c0             	sete   al
  401633:	0f b6 c0             	movzx  eax,al
  401636:	48                   	dec    eax
  401637:	5d                   	pop    ebp
  401638:	c3                   	ret
  401639:	90                   	nop
  40163a:	55                   	push   ebp
  40163b:	89 e5                	mov    ebp,esp
  40163d:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  401640:	0f b6 55 08          	movzx  edx,BYTE PTR [ebp+0x8]
  401644:	b8 00 00 00 00       	mov    eax,0x0
  401649:	38 14 08             	cmp    BYTE PTR [eax+ecx*1],dl
  40164c:	74 06                	je     0x401654
  40164e:	40                   	inc    eax
  40164f:	83 f8 0c             	cmp    eax,0xc
  401652:	7e f5                	jle    0x401649
  401654:	5d                   	pop    ebp
  401655:	c3                   	ret
  401656:	55                   	push   ebp
  401657:	89 e5                	mov    ebp,esp
  401659:	53                   	push   ebx
  40165a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  40165d:	0f b6 4d 08          	movzx  ecx,BYTE PTR [ebp+0x8]
  401661:	bb ff ff ff ff       	mov    ebx,0xffffffff
  401666:	ba 00 00 00 00       	mov    edx,0x0
  40166b:	38 0c 02             	cmp    BYTE PTR [edx+eax*1],cl
  40166e:	75 07                	jne    0x401677
  401670:	bb 00 00 00 00       	mov    ebx,0x0
  401675:	eb 06                	jmp    0x40167d
  401677:	42                   	inc    edx
  401678:	83 fa 0c             	cmp    edx,0xc
  40167b:	7e ee                	jle    0x40166b
  40167d:	89 d8                	mov    eax,ebx
  40167f:	5b                   	pop    ebx
  401680:	5d                   	pop    ebp
  401681:	c3                   	ret
  401682:	55                   	push   ebp
