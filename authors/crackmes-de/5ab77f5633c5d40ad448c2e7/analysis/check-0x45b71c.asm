45b71c:	55                   	push   ebp
45b71d:	8b ec                	mov    ebp,esp
45b71f:	b9 07 00 00 00       	mov    ecx,0x7
45b724:	6a 00                	push   0x0
45b726:	6a 00                	push   0x0
45b728:	49                   	dec    ecx
45b729:	75 f9                	jne    0x45b724
45b72b:	51                   	push   ecx
45b72c:	53                   	push   ebx
45b72d:	56                   	push   esi
45b72e:	57                   	push   edi
45b72f:	33 c0                	xor    eax,eax
45b731:	55                   	push   ebp
45b732:	68 71 b9 45 00       	push   0x45b971
45b737:	64 ff 30             	push   DWORD PTR fs:[eax]
45b73a:	64 89 20             	mov    DWORD PTR fs:[eax],esp
45b73d:	c6 45 ff 00          	mov    BYTE PTR [ebp-0x1],0x0
45b741:	8d 55 dc             	lea    edx,[ebp-0x24]
45b744:	a1 7c e8 45 00       	mov    eax,ds:0x45e87c
45b749:	8b 80 d8 02 00 00    	mov    eax,DWORD PTR [eax+0x2d8]
45b74f:	e8 f8 99 fc ff       	call   0x42514c
45b754:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
45b757:	8d 55 f8             	lea    edx,[ebp-0x8]
45b75a:	e8 81 c3 fa ff       	call   0x407ae0
45b75f:	8d 55 d8             	lea    edx,[ebp-0x28]
45b762:	a1 7c e8 45 00       	mov    eax,ds:0x45e87c
45b767:	8b 80 dc 02 00 00    	mov    eax,DWORD PTR [eax+0x2dc]
45b76d:	e8 da 99 fc ff       	call   0x42514c
45b772:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
45b775:	8d 55 f4             	lea    edx,[ebp-0xc]
45b778:	e8 63 c3 fa ff       	call   0x407ae0
45b77d:	33 c0                	xor    eax,eax
45b77f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
45b782:	33 c0                	xor    eax,eax
45b784:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
45b787:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
45b78a:	e8 b1 85 fa ff       	call   0x403d40
45b78f:	e8 c8 c6 fa ff       	call   0x407e5c
45b794:	8b d8                	mov    ebx,eax
45b796:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
45b799:	e8 a2 85 fa ff       	call   0x403d40
45b79e:	8b f8                	mov    edi,eax
45b7a0:	8b c7                	mov    eax,edi
45b7a2:	e8 b5 c6 fa ff       	call   0x407e5c
45b7a7:	85 c0                	test   eax,eax
45b7a9:	0f 84 8d 01 00 00    	je     0x45b93c
45b7af:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
45b7b2:	e8 89 85 fa ff       	call   0x403d40
45b7b7:	e8 a0 c6 fa ff       	call   0x407e5c
45b7bc:	85 c0                	test   eax,eax
45b7be:	0f 84 78 01 00 00    	je     0x45b93c
45b7c4:	8b c7                	mov    eax,edi
45b7c6:	e8 91 c6 fa ff       	call   0x407e5c
45b7cb:	83 f8 05             	cmp    eax,0x5
45b7ce:	0f 82 68 01 00 00    	jb     0x45b93c
45b7d4:	8b fb                	mov    edi,ebx
45b7d6:	85 ff                	test   edi,edi
45b7d8:	7e 1b                	jle    0x45b7f5
45b7da:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
45b7e1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
45b7e4:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
45b7e7:	0f b6 44 10 ff       	movzx  eax,BYTE PTR [eax+edx*1-0x1]
45b7ec:	01 45 e0             	add    DWORD PTR [ebp-0x20],eax
45b7ef:	ff 45 e8             	inc    DWORD PTR [ebp-0x18]
45b7f2:	4f                   	dec    edi
45b7f3:	75 ec                	jne    0x45b7e1
45b7f5:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
45b7f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
45b7fb:	f7 6d e0             	imul   DWORD PTR [ebp-0x20]
45b7fe:	8b d3                	mov    edx,ebx
45b800:	03 d2                	add    edx,edx
45b802:	8d 14 52             	lea    edx,[edx+edx*2]
45b805:	f7 ea                	imul   edx
45b807:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
45b80a:	8d 55 f0             	lea    edx,[ebp-0x10]
45b80d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
45b810:	e8 7f c3 fa ff       	call   0x407b94
45b815:	8b fb                	mov    edi,ebx
45b817:	85 ff                	test   edi,edi
45b819:	7e 5c                	jle    0x45b877
45b81b:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
45b822:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
45b825:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
45b828:	0f b6 44 10 ff       	movzx  eax,BYTE PTR [eax+edx*1-0x1]
45b82d:	01 45 e0             	add    DWORD PTR [ebp-0x20],eax
45b830:	8d 55 ec             	lea    edx,[ebp-0x14]
45b833:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
45b836:	e8 59 c3 fa ff       	call   0x407b94
45b83b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
45b83e:	e8 fd 84 fa ff       	call   0x403d40
45b843:	e8 14 c6 fa ff       	call   0x407e5c
45b848:	8b d8                	mov    ebx,eax
45b84a:	85 db                	test   ebx,ebx
45b84c:	7e 23                	jle    0x45b871
45b84e:	be 01 00 00 00       	mov    esi,0x1
45b853:	8d 45 d4             	lea    eax,[ebp-0x2c]
45b856:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
45b859:	8a 54 32 ff          	mov    dl,BYTE PTR [edx+esi*1-0x1]
45b85d:	e8 42 82 fa ff       	call   0x403aa4
45b862:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
45b865:	e8 5a c3 fa ff       	call   0x407bc4
45b86a:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
45b86d:	46                   	inc    esi
45b86e:	4b                   	dec    ebx
45b86f:	75 e2                	jne    0x45b853
45b871:	ff 45 e8             	inc    DWORD PTR [ebp-0x18]
45b874:	4f                   	dec    edi
45b875:	75 ab                	jne    0x45b822
45b877:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
45b87a:	f7 ee                	imul   esi
45b87c:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
45b87f:	8d 55 d0             	lea    edx,[ebp-0x30]
45b882:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
45b885:	e8 0a c3 fa ff       	call   0x407b94
45b88a:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
45b88d:	8d 45 f0             	lea    eax,[ebp-0x10]
45b890:	e8 ef 82 fa ff       	call   0x403b84
45b895:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
45b898:	e8 a3 84 fa ff       	call   0x403d40
45b89d:	e8 ba c5 fa ff       	call   0x407e5c
45b8a2:	8b d8                	mov    ebx,eax
45b8a4:	8d 45 ec             	lea    eax,[ebp-0x14]
45b8a7:	e8 50 80 fa ff       	call   0x4038fc
45b8ac:	8b fb                	mov    edi,ebx
45b8ae:	4f                   	dec    edi
45b8af:	85 ff                	test   edi,edi
45b8b1:	7e 60                	jle    0x45b913
45b8b3:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
45b8ba:	8d 45 cc             	lea    eax,[ebp-0x34]
45b8bd:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
45b8c0:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
45b8c3:	8a 54 0a ff          	mov    dl,BYTE PTR [edx+ecx*1-0x1]
45b8c7:	e8 d8 81 fa ff       	call   0x403aa4
45b8cc:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
45b8cf:	e8 f0 c2 fa ff       	call   0x407bc4
45b8d4:	8b d8                	mov    ebx,eax
45b8d6:	83 c3 41             	add    ebx,0x41
45b8d9:	8d 45 c8             	lea    eax,[ebp-0x38]
45b8dc:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
45b8df:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
45b8e2:	8a 14 0a             	mov    dl,BYTE PTR [edx+ecx*1]
45b8e5:	e8 ba 81 fa ff       	call   0x403aa4
45b8ea:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
45b8ed:	e8 d2 c2 fa ff       	call   0x407bc4
45b8f2:	03 d8                	add    ebx,eax
45b8f4:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
45b8f7:	8d 45 c4             	lea    eax,[ebp-0x3c]
45b8fa:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
45b8fd:	e8 a2 81 fa ff       	call   0x403aa4
45b902:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
45b905:	8d 45 ec             	lea    eax,[ebp-0x14]
45b908:	e8 77 82 fa ff       	call   0x403b84
45b90d:	ff 45 e8             	inc    DWORD PTR [ebp-0x18]
45b910:	4f                   	dec    edi
45b911:	75 a7                	jne    0x45b8ba
45b913:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
45b916:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
45b919:	68 8c b9 45 00       	push   0x45b98c
45b91e:	8d 45 f0             	lea    eax,[ebp-0x10]
45b921:	ba 03 00 00 00       	mov    edx,0x3
45b926:	e8 11 83 fa ff       	call   0x403c3c
45b92b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
45b92e:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
45b931:	e8 56 83 fa ff       	call   0x403c8c
45b936:	75 04                	jne    0x45b93c
45b938:	c6 45 ff 01          	mov    BYTE PTR [ebp-0x1],0x1
45b93c:	33 c0                	xor    eax,eax
45b93e:	5a                   	pop    edx
45b93f:	59                   	pop    ecx
45b940:	59                   	pop    ecx
45b941:	64 89 10             	mov    DWORD PTR fs:[eax],edx
45b944:	68 78 b9 45 00       	push   0x45b978
45b949:	8d 45 c4             	lea    eax,[ebp-0x3c]
45b94c:	ba 05 00 00 00       	mov    edx,0x5
45b951:	e8 ca 7f fa ff       	call   0x403920
45b956:	8d 45 d8             	lea    eax,[ebp-0x28]
45b959:	ba 02 00 00 00       	mov    edx,0x2
45b95e:	e8 bd 7f fa ff       	call   0x403920
45b963:	8d 45 ec             	lea    eax,[ebp-0x14]
45b966:	ba 04 00 00 00       	mov    edx,0x4
45b96b:	e8 b0 7f fa ff       	call   0x403920
45b970:	c3                   	ret
45b971:	e9 1e 7a fa ff       	jmp    0x403394
45b976:	eb d1                	jmp    0x45b949
45b978:	8a 45 ff             	mov    al,BYTE PTR [ebp-0x1]
45b97b:	5f                   	pop    edi
45b97c:	5e                   	pop    esi
45b97d:	5b                   	pop    ebx
45b97e:	8b e5                	mov    esp,ebp
45b980:	5d                   	pop    ebp
45b981:	c3                   	ret
45b982:	00 00                	add    BYTE PTR [eax],al
45b984:	ff                   	(bad)
45b985:	ff                   	(bad)
45b986:	ff                   	(bad)
45b987:	ff 03                	inc    DWORD PTR [ebx]
45b989:	00 00                	add    BYTE PTR [eax],al
45b98b:	00 2d 41 53 00 55    	add    BYTE PTR ds:0x55005341,ch
45b991:	8b ec                	mov    ebp,esp
45b993:	53                   	push   ebx
45b994:	8b d8                	mov    ebx,eax
45b996:	e8 81 fd ff ff       	call   0x45b71c
45b99b:	3c 01                	cmp    al,0x1
45b99d:	75 0f                	jne    0x45b9ae
45b99f:	b2 01                	mov    dl,0x1
45b9a1:	8b 83 e0 02 00 00    	mov    eax,DWORD PTR [ebx+0x2e0]
45b9a7:	8b 08                	mov    ecx,DWORD PTR [eax]
45b9a9:	ff 51 5c             	call   DWORD PTR [ecx+0x5c]
45b9ac:	eb 0d                	jmp    0x45b9bb
45b9ae:	33 d2                	xor    edx,edx
45b9b0:	8b 83 e0 02 00 00    	mov    eax,DWORD PTR [ebx+0x2e0]
45b9b6:	8b 08                	mov    ecx,DWORD PTR [eax]
45b9b8:	ff 51 5c             	call   DWORD PTR [ecx+0x5c]
45b9bb:	5b                   	pop    ebx
45b9bc:	5d                   	pop    ebp
45b9bd:	c2 04 00             	ret    0x4
45b9c0:	e8 57 fd ff ff       	call   0x45b71c
45b9c5:	3c 01                	cmp    al,0x1
45b9c7:	75 19                	jne    0x45b9e2
45b9c9:	6a 40                	push   0x40
45b9cb:	b9 f4 b9 45 00       	mov    ecx,0x45b9f4
45b9d0:	ba 08 ba 45 00       	mov    edx,0x45ba08
45b9d5:	a1 2c d6 45 00       	mov    eax,ds:0x45d62c
45b9da:	8b 00                	mov    eax,DWORD PTR [eax]
45b9dc:	e8 9b 79 fe ff       	call   0x44337c
45b9e1:	c3                   	ret
45b9e2:	b8 cc ba 45 00       	mov    eax,0x45bacc
45b9e7:	e8 78 9f fe ff       	call   0x445964
45b9ec:	e8 d3 7d fa ff       	call   0x4037c4
45b9f1:	c3                   	ret
45b9f2:	00 00                	add    BYTE PTR [eax],al
