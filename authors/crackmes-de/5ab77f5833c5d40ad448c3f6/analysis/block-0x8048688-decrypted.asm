
authors/crackmes-de/5ab77f5833c5d40ad448c3f6/analysis/block-0x8048688-decrypted.bin:     file format binary


Disassembly of section .data:

08048688 <.data>:
 8048688:	55                   	push   ebp
 8048689:	83 c9 ff             	or     ecx,0xffffffff
 804868c:	31 c0                	xor    eax,eax
 804868e:	fc                   	cld
 804868f:	89 e5                	mov    ebp,esp
 8048691:	57                   	push   edi
 8048692:	56                   	push   esi
 8048693:	31 f6                	xor    esi,esi
 8048695:	53                   	push   ebx
 8048696:	83 ec 3c             	sub    esp,0x3c
 8048699:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
 804869c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 804869f:	f2 ae                	repnz scas al,BYTE PTR es:[edi]
 80486a1:	bf 01 00 00 00       	mov    edi,0x1
 80486a6:	66 c7 45 d2 00 00    	mov    WORD PTR [ebp-0x2e],0x0
 80486ac:	f7 d1                	not    ecx
 80486ae:	49                   	dec    ecx
 80486af:	89 4d cc             	mov    DWORD PTR [ebp-0x34],ecx
 80486b2:	89 f0                	mov    eax,esi
 80486b4:	31 d2                	xor    edx,edx
 80486b6:	0f b7 cf             	movzx  ecx,di
 80486b9:	f7 75 cc             	div    DWORD PTR [ebp-0x34]
 80486bc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 80486bf:	46                   	inc    esi
 80486c0:	0f be 14 10          	movsx  edx,BYTE PTR [eax+edx*1]
 80486c4:	8d 04 11             	lea    eax,[ecx+edx*1]
 80486c7:	b9 fb 00 00 00       	mov    ecx,0xfb
 80486cc:	99                   	cdq
 80486cd:	f7 f9                	idiv   ecx
 80486cf:	0f b7 45 d2          	movzx  eax,WORD PTR [ebp-0x2e]
 80486d3:	89 d7                	mov    edi,edx
 80486d5:	0f b7 d2             	movzx  edx,dx
 80486d8:	01 d0                	add    eax,edx
 80486da:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 80486dd:	99                   	cdq
 80486de:	f7 f9                	idiv   ecx
 80486e0:	81 fe 00 04 00 00    	cmp    esi,0x400
 80486e6:	66 89 55 d2          	mov    WORD PTR [ebp-0x2e],dx
 80486ea:	75 c6                	jne    0x80486b2
 80486ec:	89 d8                	mov    eax,ebx
 80486ee:	c1 e8 10             	shr    eax,0x10
 80486f1:	0f b6 d0             	movzx  edx,al
 80486f4:	0f b6 c3             	movzx  eax,bl
 80486f7:	31 d0                	xor    eax,edx
 80486f9:	3b 45 c4             	cmp    eax,DWORD PTR [ebp-0x3c]
 80486fc:	0f 85 96 00 00 00    	jne    0x8048798
 8048702:	0f b7 45 d2          	movzx  eax,WORD PTR [ebp-0x2e]
 8048706:	0f b6 cf             	movzx  ecx,bh
 8048709:	c1 eb 18             	shr    ebx,0x18
 804870c:	31 cb                	xor    ebx,ecx
 804870e:	39 c3                	cmp    ebx,eax
 8048710:	0f 85 82 00 00 00    	jne    0x8048798
 8048716:	31 d1                	xor    ecx,edx
 8048718:	81 f9 8a 00 00 00    	cmp    ecx,0x8a
 804871e:	75 76                	jne    0x8048796
 8048720:	83 7d cc 03          	cmp    DWORD PTR [ebp-0x34],0x3
 8048724:	76 72                	jbe    0x8048798
 8048726:	31 db                	xor    ebx,ebx
 8048728:	c6 45 e2 85          	mov    BYTE PTR [ebp-0x1e],0x85
 804872c:	c6 45 e3 b3          	mov    BYTE PTR [ebp-0x1d],0xb3
 8048730:	c6 45 e4 a9          	mov    BYTE PTR [ebp-0x1c],0xa9
 8048734:	c6 45 e5 fc          	mov    BYTE PTR [ebp-0x1b],0xfc
 8048738:	c6 45 e6 bb          	mov    BYTE PTR [ebp-0x1a],0xbb
 804873c:	c6 45 e7 b3          	mov    BYTE PTR [ebp-0x19],0xb3
 8048740:	c6 45 f1 25          	mov    BYTE PTR [ebp-0xf],0x25
 8048744:	c6 45 e8 a8          	mov    BYTE PTR [ebp-0x18],0xa8
 8048748:	c6 45 e9 fc          	mov    BYTE PTR [ebp-0x17],0xfc
 804874c:	c6 45 ea b5          	mov    BYTE PTR [ebp-0x16],0xb5
 8048750:	c6 45 eb a8          	mov    BYTE PTR [ebp-0x15],0xa8
 8048754:	c6 45 f2 63          	mov    BYTE PTR [ebp-0xe],0x63
 8048758:	c6 45 ec fc          	mov    BYTE PTR [ebp-0x14],0xfc
 804875c:	c6 45 ed e7          	mov    BYTE PTR [ebp-0x13],0xe7
 8048760:	c6 45 ee f5          	mov    BYTE PTR [ebp-0x12],0xf5
 8048764:	c6 45 ef d6          	mov    BYTE PTR [ebp-0x11],0xd6
 8048768:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
 804876c:	c6 45 f0 00          	mov    BYTE PTR [ebp-0x10],0x0
 8048770:	eb 18                	jmp    0x804878a
 8048772:	32 05 38 9a 04 08    	xor    al,BYTE PTR ds:0x8049a38
 8048778:	56                   	push   esi
 8048779:	8d 55 f1             	lea    edx,[ebp-0xf]
 804877c:	56                   	push   esi
 804877d:	0f b6 c0             	movzx  eax,al
 8048780:	50                   	push   eax
 8048781:	52                   	push   edx
 8048782:	e8 2d fc ff ff       	call   0x80483b4
 8048787:	83 c4 10             	add    esp,0x10
 804878a:	0f b6 c3             	movzx  eax,bl
 804878d:	43                   	inc    ebx
 804878e:	8a 44 05 e2          	mov    al,BYTE PTR [ebp+eax*1-0x1e]
 8048792:	84 c0                	test   al,al
 8048794:	75 dc                	jne    0x8048772
 8048796:	90                   	nop
 8048797:	90                   	nop
 8048798:	8d 65 f4             	lea    esp,[ebp-0xc]
 804879b:	5b                   	pop    ebx
 804879c:	5e                   	pop    esi
 804879d:	5f                   	pop    edi
 804879e:	c9                   	leave
 804879f:	c3                   	ret
