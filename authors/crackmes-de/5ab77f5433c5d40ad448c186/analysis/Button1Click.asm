004417d0 <CODE+0x407d0>:
  4417d0:	55                   	push   ebp
  4417d1:	8b ec                	mov    ebp,esp
  4417d3:	6a 00                	push   0x0
  4417d5:	6a 00                	push   0x0
  4417d7:	53                   	push   ebx
  4417d8:	56                   	push   esi
  4417d9:	8b d8                	mov    ebx,eax
  4417db:	33 c0                	xor    eax,eax
  4417dd:	55                   	push   ebp
  4417de:	68 6e 18 44 00       	push   0x44186e
  4417e3:	64 ff 30             	push   DWORD PTR fs:[eax]
  4417e6:	64 89 20             	mov    DWORD PTR fs:[eax],esp
  4417e9:	8d 55 f8             	lea    edx,[ebp-0x8]
  4417ec:	8b 83 cc 02 00 00    	mov    eax,DWORD PTR [ebx+0x2cc]
  4417f2:	e8 89 1a fe ff       	call   0x423280
  4417f7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4417fa:	e8 c5 5e fc ff       	call   0x4076c4
  4417ff:	8b c8                	mov    ecx,eax
  441801:	8b c1                	mov    eax,ecx
  441803:	b9 8c 07 00 00       	mov    ecx,0x78c
  441808:	99                   	cdq
  441809:	f7 f9                	idiv   ecx
  44180b:	69 c0 99 03 00 00    	imul   eax,eax,0x399
  441811:	c1 e0 11             	shl    eax,0x11
  441814:	c1 e8 09             	shr    eax,0x9
  441817:	b9 0c 00 00 00       	mov    ecx,0xc
  44181c:	99                   	cdq
  44181d:	f7 f9                	idiv   ecx
  44181f:	8b f0                	mov    esi,eax
  441821:	8d 55 fc             	lea    edx,[ebp-0x4]
  441824:	8b c6                	mov    eax,esi
  441826:	e8 69 5e fc ff       	call   0x407694
  44182b:	8d 55 f8             	lea    edx,[ebp-0x8]
  44182e:	8b 83 c4 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c4]
  441834:	e8 47 1a fe ff       	call   0x423280
  441839:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  44183c:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  44183f:	e8 5c 23 fc ff       	call   0x403ba0
  441844:	75 0a                	jne    0x441850
  441846:	b8 84 18 44 00       	mov    eax,0x441884
  44184b:	e8 dc fb ff ff       	call   0x44142c
  441850:	33 c0                	xor    eax,eax
  441852:	5a                   	pop    edx
  441853:	59                   	pop    ecx
  441854:	59                   	pop    ecx
  441855:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  441858:	68 75 18 44 00       	push   0x441875
  44185d:	8d 45 f8             	lea    eax,[ebp-0x8]
  441860:	e8 af 1f fc ff       	call   0x403814
  441865:	8d 45 fc             	lea    eax,[ebp-0x4]
  441868:	e8 a7 1f fc ff       	call   0x403814
  44186d:	c3                   	ret
  44186e:	e9 61 1a fc ff       	jmp    0x4032d4
  441873:	eb e8                	jmp    0x44185d
  441875:	5e                   	pop    esi
  441876:	5b                   	pop    ebx
  441877:	59                   	pop    ecx
  441878:	59                   	pop    ecx
  441879:	5d                   	pop    ebp
  44187a:	c3                   	ret
  44187b:	00 ff                	add    bh,bh
  44187d:	ff                   	(bad)
  44187e:	ff                   	(bad)
  44187f:	ff                   	.byte 0xff
