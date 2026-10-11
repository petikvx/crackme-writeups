
/tmp/f13/dump.bin:     file format binary


Disassembly of section .data:

004554b8 <.data+0x554b8>:
  4554b8:	55                   	push   ebp
  4554b9:	8b ec                	mov    ebp,esp
  4554bb:	33 c9                	xor    ecx,ecx
  4554bd:	51                   	push   ecx
  4554be:	51                   	push   ecx
  4554bf:	51                   	push   ecx
  4554c0:	51                   	push   ecx
  4554c1:	51                   	push   ecx
  4554c2:	53                   	push   ebx
  4554c3:	56                   	push   esi
  4554c4:	57                   	push   edi
  4554c5:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4554c8:	33 c0                	xor    eax,eax
  4554ca:	55                   	push   ebp
  4554cb:	68 af 55 45 00       	push   0x4555af
  4554d0:	64 ff 30             	push   DWORD PTR fs:[eax]
  4554d3:	64 89 20             	mov    DWORD PTR fs:[eax],esp
  4554d6:	8d 55 f8             	lea    edx,[ebp-0x8]
  4554d9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4554dc:	8b 80 c4 02 00 00    	mov    eax,DWORD PTR [eax+0x2c4]
  4554e2:	e8 cd e0 fc ff       	call   0x4235b4
  4554e7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4554ea:	e8 75 e5 fa ff       	call   0x403a64
  4554ef:	8b f0                	mov    esi,eax
  4554f1:	83 ee 02             	sub    esi,0x2
  4554f4:	0f 8c 92 00 00 00    	jl     0x45558c
  4554fa:	46                   	inc    esi
  4554fb:	bb 02 00 00 00       	mov    ebx,0x2
  455500:	33 c0                	xor    eax,eax
  455502:	8b d3                	mov    edx,ebx
  455504:	c1 e2 0c             	shl    edx,0xc
  455507:	33 c2                	xor    eax,edx
  455509:	8b d3                	mov    edx,ebx
  45550b:	0f af d3             	imul   edx,ebx
  45550e:	03 c2                	add    eax,edx
  455510:	8b d0                	mov    edx,eax
  455512:	83 f2 00             	xor    edx,0x0
  455515:	81 ea 21 30 00 00    	sub    edx,0x3021
  45551b:	81 c2 a4 a9 44 1c    	add    edx,0x1c44a9a4
  455521:	8b c8                	mov    ecx,eax
  455523:	0f af c8             	imul   ecx,eax
  455526:	03 d1                	add    edx,ecx
  455528:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
  45552b:	ba 99 24 01 00       	mov    edx,0x12499
  455530:	8d 88 d8 29 00 00    	lea    ecx,[eax+0x29d8]
  455536:	8b f8                	mov    edi,eax
  455538:	0f af 7d f0          	imul   edi,DWORD PTR [ebp-0x10]
  45553c:	0f af fa             	imul   edi,edx
  45553f:	2b cf                	sub    ecx,edi
  455541:	8b f9                	mov    edi,ecx
  455543:	0f af f8             	imul   edi,eax
  455546:	0f af fa             	imul   edi,edx
  455549:	6b ff 58             	imul   edi,edi,0x58
  45554c:	83 c7 02             	add    edi,0x2
  45554f:	83 f7 0a             	xor    edi,0xa
  455552:	03 f9                	add    edi,ecx
  455554:	8d 55 f4             	lea    edx,[ebp-0xc]
  455557:	8b c7                	mov    eax,edi
  455559:	e8 1a 21 fb ff       	call   0x407678
  45555e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  455561:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  455564:	e8 0b e6 fa ff       	call   0x403b74
  455569:	75 19                	jne    0x455584
  45556b:	8d 55 ec             	lea    edx,[ebp-0x14]
  45556e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  455571:	8b 80 cc 02 00 00    	mov    eax,DWORD PTR [eax+0x2cc]
  455577:	e8 38 e0 fc ff       	call   0x4235b4
  45557c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  45557f:	e8 dc c1 fe ff       	call   0x441760
  455584:	43                   	inc    ebx
  455585:	4e                   	dec    esi
  455586:	0f 85 74 ff ff ff    	jne    0x455500
  45558c:	33 c0                	xor    eax,eax
  45558e:	5a                   	pop    edx
  45558f:	59                   	pop    ecx
  455590:	59                   	pop    ecx
  455591:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  455594:	68 b6 55 45 00       	push   0x4555b6
  455599:	8d 45 ec             	lea    eax,[ebp-0x14]
  45559c:	e8 47 e2 fa ff       	call   0x4037e8
  4555a1:	8d 45 f4             	lea    eax,[ebp-0xc]
  4555a4:	ba 02 00 00 00       	mov    edx,0x2
  4555a9:	e8 5e e2 fa ff       	call   0x40380c
  4555ae:	c3                   	ret
  4555af:	e9 f4 dc fa ff       	jmp    0x4032a8
  4555b4:	eb e3                	jmp    0x455599
  4555b6:	5f                   	pop    edi
  4555b7:	5e                   	pop    esi
  4555b8:	5b                   	pop    ebx
  4555b9:	8b e5                	mov    esp,ebp
  4555bb:	5d                   	pop    ebp
  4555bc:	c3                   	ret
