
/tmp/x182/Crackme2.exe:     file format pei-i386


Disassembly of section CODE:

004416ec <CODE+0x406ec>:
  4416ec:	55                   	push   ebp
  4416ed:	8b ec                	mov    ebp,esp
  4416ef:	33 c9                	xor    ecx,ecx
  4416f1:	51                   	push   ecx
  4416f2:	51                   	push   ecx
  4416f3:	51                   	push   ecx
  4416f4:	51                   	push   ecx
  4416f5:	53                   	push   ebx
  4416f6:	8b d8                	mov    ebx,eax
  4416f8:	33 c0                	xor    eax,eax
  4416fa:	55                   	push   ebp
  4416fb:	68 a8 17 44 00       	push   0x4417a8
  441700:	64 ff 30             	push   DWORD PTR fs:[eax]
  441703:	64 89 20             	mov    DWORD PTR fs:[eax],esp
  441706:	8d 55 fc             	lea    edx,[ebp-0x4]
  441709:	8b 83 c8 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c8]
  44170f:	e8 90 1a fe ff       	call   0x4231a4
  441714:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  441717:	50                   	push   eax
  441718:	8d 55 f4             	lea    edx,[ebp-0xc]
  44171b:	8b 83 c4 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c4]
  441721:	e8 7e 1a fe ff       	call   0x4231a4
  441726:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
  441729:	8d 55 f0             	lea    edx,[ebp-0x10]
  44172c:	8b 83 c4 02 00 00    	mov    eax,DWORD PTR [ebx+0x2c4]
  441732:	e8 6d 1a fe ff       	call   0x4231a4
  441737:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  44173a:	68 bc 17 44 00       	push   0x4417bc
  44173f:	68 c8 17 44 00       	push   0x4417c8
  441744:	68 d4 17 44 00       	push   0x4417d4
  441749:	8d 45 f8             	lea    eax,[ebp-0x8]
  44174c:	ba 05 00 00 00       	mov    edx,0x5
  441751:	e8 9e 23 fc ff       	call   0x403af4
  441756:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  441759:	58                   	pop    eax
  44175a:	e8 e5 23 fc ff       	call   0x403b44
  44175f:	75 17                	jne    0x441778
  441761:	6a 00                	push   0x0
  441763:	66 8b 0d d8 17 44 00 	mov    cx,WORD PTR ds:0x4417d8
  44176a:	b2 02                	mov    dl,0x2
  44176c:	b8 e4 17 44 00       	mov    eax,0x4417e4
  441771:	e8 02 fb ff ff       	call   0x441278
  441776:	eb 15                	jmp    0x44178d
  441778:	6a 00                	push   0x0
  44177a:	66 8b 0d d8 17 44 00 	mov    cx,WORD PTR ds:0x4417d8
  441781:	b2 01                	mov    dl,0x1
  441783:	b8 f8 17 44 00       	mov    eax,0x4417f8
  441788:	e8 eb fa ff ff       	call   0x441278
  44178d:	33 c0                	xor    eax,eax
  44178f:	5a                   	pop    edx
  441790:	59                   	pop    ecx
  441791:	59                   	pop    ecx
  441792:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  441795:	68 af 17 44 00       	push   0x4417af
  44179a:	8d 45 f0             	lea    eax,[ebp-0x10]
  44179d:	ba 04 00 00 00       	mov    edx,0x4
  4417a2:	e8 35 20 fc ff       	call   0x4037dc
  4417a7:	c3                   	ret
