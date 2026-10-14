
original/My First Crackme.exe:     file format pei-i386


Disassembly of section .text:

00402410 <.text+0x1410>:
  402410:	55                   	push   ebp
  402411:	8b ec                	mov    ebp,esp
  402413:	51                   	push   ecx
  402414:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40241b:	eb 09                	jmp    0x402426
  40241d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  402420:	83 c0 01             	add    eax,0x1
  402423:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  402426:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402429:	51                   	push   ecx
  40242a:	e8 ad fd ff ff       	call   0x4021dc
  40242f:	83 c4 04             	add    esp,0x4
  402432:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
  402435:	0f 83 c0 00 00 00    	jae    0x4024fb
  40243b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40243e:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  402441:	0f be 02             	movsx  eax,BYTE PTR [edx]
  402444:	83 f0 33             	xor    eax,0x33
  402447:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40244a:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  40244d:	88 01                	mov    BYTE PTR [ecx],al
  40244f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402452:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  402455:	8a 02                	mov    al,BYTE PTR [edx]
  402457:	d0 e0                	shl    al,1
  402459:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40245c:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  40245f:	88 01                	mov    BYTE PTR [ecx],al
  402461:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402464:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  402467:	0f be 02             	movsx  eax,BYTE PTR [edx]
  40246a:	35 89 00 00 00       	xor    eax,0x89
  40246f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402472:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  402475:	88 01                	mov    BYTE PTR [ecx],al
  402477:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40247a:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  40247d:	0f be 02             	movsx  eax,BYTE PTR [edx]
  402480:	85 c0                	test   eax,eax
  402482:	75 09                	jne    0x40248d
  402484:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402487:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  40248a:	c6 01 61             	mov    BYTE PTR [ecx],0x61
  40248d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402490:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  402493:	0f be 02             	movsx  eax,BYTE PTR [edx]
  402496:	83 f8 41             	cmp    eax,0x41
  402499:	7d 14                	jge    0x4024af
  40249b:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40249e:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  4024a1:	8a 11                	mov    dl,BYTE PTR [ecx]
  4024a3:	d0 e2                	shl    dl,1
  4024a5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4024a8:	03 45 fc             	add    eax,DWORD PTR [ebp-0x4]
  4024ab:	88 10                	mov    BYTE PTR [eax],dl
  4024ad:	eb de                	jmp    0x40248d
  4024af:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4024b2:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  4024b5:	0f be 11             	movsx  edx,BYTE PTR [ecx]
  4024b8:	83 fa 7a             	cmp    edx,0x7a
  4024bb:	7e 14                	jle    0x4024d1
  4024bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4024c0:	03 45 fc             	add    eax,DWORD PTR [ebp-0x4]
  4024c3:	8a 08                	mov    cl,BYTE PTR [eax]
  4024c5:	d0 f9                	sar    cl,1
  4024c7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4024ca:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  4024cd:	88 0a                	mov    BYTE PTR [edx],cl
  4024cf:	eb de                	jmp    0x4024af
  4024d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4024d4:	03 45 fc             	add    eax,DWORD PTR [ebp-0x4]
  4024d7:	0f be 08             	movsx  ecx,BYTE PTR [eax]
  4024da:	83 f9 7a             	cmp    ecx,0x7a
  4024dd:	7f 0e                	jg     0x4024ed
  4024df:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4024e2:	03 55 fc             	add    edx,DWORD PTR [ebp-0x4]
  4024e5:	0f be 02             	movsx  eax,BYTE PTR [edx]
  4024e8:	83 f8 41             	cmp    eax,0x41
  4024eb:	7d 09                	jge    0x4024f6
  4024ed:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4024f0:	03 4d fc             	add    ecx,DWORD PTR [ebp-0x4]
  4024f3:	c6 01 31             	mov    BYTE PTR [ecx],0x31
  4024f6:	e9 22 ff ff ff       	jmp    0x40241d
  4024fb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4024fe:	52                   	push   edx
  4024ff:	e8 d8 fc ff ff       	call   0x4021dc
  402504:	83 c4 04             	add    esp,0x4
  402507:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40250a:	c6 04 01 00          	mov    BYTE PTR [ecx+eax*1],0x0
  40250e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402511:	8b e5                	mov    esp,ebp
  402513:	5d                   	pop    ebp
  402514:	c3                   	ret
