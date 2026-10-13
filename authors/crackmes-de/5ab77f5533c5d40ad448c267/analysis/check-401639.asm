00401639 <.text+0x639>:
  401639:	6a 32                	push   0x32
  40163b:	8d 95 e4 fe ff ff    	lea    edx,[ebp-0x11c]
  401641:	52                   	push   edx
  401642:	6a 01                	push   0x1
  401644:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401647:	50                   	push   eax
  401648:	ff 15 c4 50 40 00    	call   DWORD PTR ds:0x4050c4
  40164e:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
  401654:	6a 32                	push   0x32
  401656:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  40165c:	51                   	push   ecx
  40165d:	6a 02                	push   0x2
  40165f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  401662:	52                   	push   edx
  401663:	ff 15 c4 50 40 00    	call   DWORD PTR ds:0x4050c4
  401669:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
  40166f:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [ebp-0xa8],0x0
  401676:	74 09                	je     0x401681
  401678:	83 bd 54 ff ff ff 00 	cmp    DWORD PTR [ebp-0xac],0x0
  40167f:	75 05                	jne    0x401686
  401681:	e9 0d 01 00 00       	jmp    0x401793
  401686:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40168d:	83 bd 58 ff ff ff 04 	cmp    DWORD PTR [ebp-0xa8],0x4
  401694:	72 09                	jb     0x40169f
  401696:	83 bd 54 ff ff ff 04 	cmp    DWORD PTR [ebp-0xac],0x4
  40169d:	73 12                	jae    0x4016b1
  40169f:	33 c0                	xor    eax,eax
  4016a1:	83 bd 50 ff ff ff 00 	cmp    DWORD PTR [ebp-0xb0],0x0
  4016a8:	0f 94 c0             	sete   al
  4016ab:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
  4016b1:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [ebp-0xb4],0x0
  4016b8:	00 00 00 
  4016bb:	eb 0f                	jmp    0x4016cc
  4016bd:	8b 8d 4c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xb4]
  4016c3:	83 c1 01             	add    ecx,0x1
  4016c6:	89 8d 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],ecx
  4016cc:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [ebp-0xb4]
  4016d2:	3b 95 58 ff ff ff    	cmp    edx,DWORD PTR [ebp-0xa8]
  4016d8:	73 26                	jae    0x401700
  4016da:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [ebp-0xb4]
  4016e0:	8a 8c 05 e4 fe ff ff 	mov    cl,BYTE PTR [ebp+eax*1-0x11c]
  4016e7:	51                   	push   ecx
  4016e8:	e8 b3 02 00 00       	call   0x4019a0
  4016ed:	83 c4 04             	add    esp,0x4
  4016f0:	8b 95 50 ff ff ff    	mov    edx,DWORD PTR [ebp-0xb0]
  4016f6:	23 d0                	and    edx,eax
  4016f8:	89 95 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],edx
  4016fe:	eb bd                	jmp    0x4016bd
  401700:	83 bd 50 ff ff ff 00 	cmp    DWORD PTR [ebp-0xb0],0x0
  401707:	74 1d                	je     0x401726
  401709:	8d 85 18 ff ff ff    	lea    eax,[ebp-0xe8]
  40170f:	50                   	push   eax
  401710:	8d 8d e4 fe ff ff    	lea    ecx,[ebp-0x11c]
  401716:	51                   	push   ecx
  401717:	8d 55 d8             	lea    edx,[ebp-0x28]
  40171a:	52                   	push   edx
  40171b:	e8 40 02 00 00       	call   0x401960
  401720:	83 c4 0c             	add    esp,0xc
  401723:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  401726:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  401729:	33 d2                	xor    edx,edx
  40172b:	f7 75 d8             	div    DWORD PTR [ebp-0x28]
  40172e:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
  401734:	c7 85 50 ff ff ff 00 	mov    DWORD PTR [ebp-0xb0],0x0
  40173b:	00 00 00 
  40173e:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  401745:	eb 1f                	jmp    0x401766
  401747:	b8 01 00 00 00       	mov    eax,0x1
  40174c:	c3                   	ret
  40174d:	8b 65 e8             	mov    esp,DWORD PTR [ebp-0x18]
  401750:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb0]
  401756:	83 e0 01             	and    eax,0x1
  401759:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
  40175f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  401766:	83 bd 50 ff ff ff 00 	cmp    DWORD PTR [ebp-0xb0],0x0
  40176d:	74 13                	je     0x401782
  40176f:	68 80 60 40 00       	push   0x406080
  401774:	6a 02                	push   0x2
  401776:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  401779:	51                   	push   ecx
  40177a:	ff 15 c8 50 40 00    	call   DWORD PTR ds:0x4050c8
  401780:	eb 11                	jmp    0x401793
  401782:	68 70 60 40 00       	push   0x406070
  401787:	6a 02                	push   0x2
  401789:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40178c:	52                   	push   edx
  40178d:	ff 15 c8 50 40 00    	call   DWORD PTR ds:0x4050c8
