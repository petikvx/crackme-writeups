
original/CrackMe3.exe:     file format pei-i386


Disassembly of section .text:

00402740 <.text+0x1740>:
  402740:	55                   	push   ebp
  402741:	8b ec                	mov    ebp,esp
  402743:	83 ec 18             	sub    esp,0x18
  402746:	68 c6 10 40 00       	push   0x4010c6
  40274b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402751:	50                   	push   eax
  402752:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  402759:	b8 a8 00 00 00       	mov    eax,0xa8
  40275e:	e8 5d e9 ff ff       	call   0x4010c0
  402763:	53                   	push   ebx
  402764:	56                   	push   esi
  402765:	57                   	push   edi
  402766:	89 65 e8             	mov    DWORD PTR [ebp-0x18],esp
  402769:	c7 45 ec 10 10 40 00 	mov    DWORD PTR [ebp-0x14],0x401010
  402770:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402773:	83 e0 01             	and    eax,0x1
  402776:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  402779:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40277c:	83 e1 fe             	and    ecx,0xfffffffe
  40277f:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
  402782:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  402789:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40278c:	8b 02                	mov    eax,DWORD PTR [edx]
  40278e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  402791:	51                   	push   ecx
  402792:	ff 50 04             	call   DWORD PTR [eax+0x4]
  402795:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40279c:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  4027a3:	6a ff                	push   0xffffffff
  4027a5:	ff 15 f8 40 40 00    	call   DWORD PTR ds:0x4040f8
  4027ab:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  4027b2:	68 54 1e 40 00       	push   0x401e54
  4027b7:	6a 01                	push   0x1
  4027b9:	6a ff                	push   0xffffffff
  4027bb:	6a 01                	push   0x1
  4027bd:	ff 15 44 41 40 00    	call   DWORD PTR ds:0x404144
  4027c3:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  4027ca:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4027cd:	83 c2 34             	add    edx,0x34
  4027d0:	52                   	push   edx
  4027d1:	6a 01                	push   0x1
  4027d3:	68 74 1e 40 00       	push   0x401e74
  4027d8:	ff 15 30 41 40 00    	call   DWORD PTR ds:0x404130
  4027de:	83 c4 0c             	add    esp,0xc
  4027e1:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
  4027e8:	6a 01                	push   0x1
  4027ea:	ff 15 10 41 40 00    	call   DWORD PTR ds:0x404110
  4027f0:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  4027f7:	c7 45 94 7c 1e 40 00 	mov    DWORD PTR [ebp-0x6c],0x401e7c
  4027fe:	c7 45 8c 08 80 00 00 	mov    DWORD PTR [ebp-0x74],0x8008
  402805:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402808:	83 c0 34             	add    eax,0x34
  40280b:	50                   	push   eax
  40280c:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40280f:	51                   	push   ecx
  402810:	ff 15 18 41 40 00    	call   DWORD PTR ds:0x404118
  402816:	0f bf d0             	movsx  edx,ax
  402819:	85 d2                	test   edx,edx
  40281b:	0f 84 8e 00 00 00    	je     0x4028af
  402821:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
  402828:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40282b:	8b 08                	mov    ecx,DWORD PTR [eax]
  40282d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402830:	52                   	push   edx
  402831:	ff 91 00 03 00 00    	call   DWORD PTR [ecx+0x300]
  402837:	50                   	push   eax
  402838:	8d 45 dc             	lea    eax,[ebp-0x24]
  40283b:	50                   	push   eax
  40283c:	ff 15 fc 40 40 00    	call   DWORD PTR ds:0x4040fc
  402842:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
  402848:	68 a0 1e 40 00       	push   0x401ea0
  40284d:	8b 8d 58 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xa8]
  402853:	8b 11                	mov    edx,DWORD PTR [ecx]
  402855:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa8]
  40285b:	50                   	push   eax
  40285c:	ff 92 a4 00 00 00    	call   DWORD PTR [edx+0xa4]
  402862:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
  402868:	83 bd 54 ff ff ff 00 	cmp    DWORD PTR [ebp-0xac],0x0
  40286f:	7d 26                	jge    0x402897
  402871:	68 a4 00 00 00       	push   0xa4
  402876:	68 b8 1e 40 00       	push   0x401eb8
  40287b:	8b 8d 58 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xa8]
  402881:	51                   	push   ecx
  402882:	8b 95 54 ff ff ff    	mov    edx,DWORD PTR [ebp-0xac]
  402888:	52                   	push   edx
  402889:	ff 15 ec 40 40 00    	call   DWORD PTR ds:0x4040ec
  40288f:	89 85 3c ff ff ff    	mov    DWORD PTR [ebp-0xc4],eax
  402895:	eb 0a                	jmp    0x4028a1
  402897:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [ebp-0xc4],0x0
  40289e:	00 00 00 
  4028a1:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4028a4:	ff 15 70 41 40 00    	call   DWORD PTR ds:0x404170
  4028aa:	e9 07 01 00 00       	jmp    0x4029b6
  4028af:	c7                   	.byte 0xc7
