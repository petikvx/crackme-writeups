
/tmp/c1/crackme0x1.exe:     file format pei-i386


Disassembly of section .text:

00401050 <.text+0x50>:
  401050:	a1 58 20 40 00       	mov    eax,ds:0x402058
  401055:	83 ec 0c             	sub    esp,0xc
  401058:	53                   	push   ebx
  401059:	55                   	push   ebp
  40105a:	56                   	push   esi
  40105b:	57                   	push   edi
  40105c:	68 4c 21 40 00       	push   0x40214c
  401061:	50                   	push   eax
  401062:	e8 59 03 00 00       	call   0x4013c0
  401067:	8b 0d 60 20 40 00    	mov    ecx,DWORD PTR ds:0x402060
  40106d:	68 28 37 40 00       	push   0x403728
  401072:	51                   	push   ecx
  401073:	ff 15 5c 20 40 00    	call   DWORD PTR ds:0x40205c
  401079:	b8 24 30 40 00       	mov    eax,0x403024
  40107e:	83 c4 10             	add    esp,0x10
  401081:	33 f6                	xor    esi,esi
  401083:	8d 50 01             	lea    edx,[eax+0x1]
  401086:	8a 08                	mov    cl,BYTE PTR [eax]
  401088:	83 c0 01             	add    eax,0x1
  40108b:	84 c9                	test   cl,cl
  40108d:	75 f7                	jne    0x401086
  40108f:	2b c2                	sub    eax,edx
  401091:	0f 84 d8 01 00 00    	je     0x40126f
  401097:	8a 5c 24 17          	mov    bl,BYTE PTR [esp+0x17]
  40109b:	0f be 96 24 30 40 00 	movsx  edx,BYTE PTR [esi+0x403024]
  4010a2:	0f be 86 28 37 40 00 	movsx  eax,BYTE PTR [esi+0x403728]
  4010a9:	33 d6                	xor    edx,esi
  4010ab:	3b d0                	cmp    edx,eax
  4010ad:	0f 85 18 01 00 00    	jne    0x4011cb
  4010b3:	b8 28 37 40 00       	mov    eax,0x403728
  4010b8:	8d 50 01             	lea    edx,[eax+0x1]
  4010bb:	eb 03                	jmp    0x4010c0
  4010bd:	8d 49 00             	lea    ecx,[ecx+0x0]
  4010c0:	8a 08                	mov    cl,BYTE PTR [eax]
  4010c2:	83 c0 01             	add    eax,0x1
  4010c5:	84 c9                	test   cl,cl
  4010c7:	75 f7                	jne    0x4010c0
  4010c9:	2b c2                	sub    eax,edx
  4010cb:	8b d0                	mov    edx,eax
  4010cd:	b8 24 30 40 00       	mov    eax,0x403024
  4010d2:	8d 78 01             	lea    edi,[eax+0x1]
  4010d5:	8a 08                	mov    cl,BYTE PTR [eax]
  4010d7:	83 c0 01             	add    eax,0x1
  4010da:	84 c9                	test   cl,cl
  4010dc:	75 f7                	jne    0x4010d5
  4010de:	2b c7                	sub    eax,edi
  4010e0:	3b d0                	cmp    edx,eax
  4010e2:	0f 87 e3 00 00 00    	ja     0x4011cb
  4010e8:	83 c9 ff             	or     ecx,0xffffffff
  4010eb:	bf 95 03 00 00       	mov    edi,0x395
  4010f0:	0f be 86 24 30 40 00 	movsx  eax,BYTE PTR [esi+0x403024]
  4010f7:	0f be a9 24 30 40 00 	movsx  ebp,BYTE PTR [ecx+0x403024]
  4010fe:	99                   	cdq
  4010ff:	83 e2 03             	and    edx,0x3
  401102:	03 c2                	add    eax,edx
  401104:	c1 f8 02             	sar    eax,0x2
  401107:	33 e8                	xor    ebp,eax
  401109:	0f be 81 38 30 40 00 	movsx  eax,BYTE PTR [ecx+0x403038]
  401110:	03 ee                	add    ebp,esi
  401112:	03 c5                	add    eax,ebp
  401114:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  401118:	0f be 81 25 30 40 00 	movsx  eax,BYTE PTR [ecx+0x403025]
  40111f:	99                   	cdq
  401120:	2b c2                	sub    eax,edx
  401122:	d1 f8                	sar    eax,1
  401124:	6b c0 64             	imul   eax,eax,0x64
  401127:	25 01 00 00 80       	and    eax,0x80000001
  40112c:	79 05                	jns    0x401133
  40112e:	48                   	dec    eax
  40112f:	83 c8 fe             	or     eax,0xfffffffe
  401132:	40                   	inc    eax
  401133:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  401137:	83 f0 03             	xor    eax,0x3
  40113a:	3b e8                	cmp    ebp,eax
  40113c:	0f 94 c2             	sete   dl
  40113f:	32 da                	xor    bl,dl
  401141:	80 c3 01             	add    bl,0x1
  401144:	83 c1 01             	add    ecx,0x1
  401147:	83 ef 01             	sub    edi,0x1
  40114a:	75 a4                	jne    0x4010f0
  40114c:	0f be 86 24 30 40 00 	movsx  eax,BYTE PTR [esi+0x403024]
  401153:	0f be cb             	movsx  ecx,bl
  401156:	35 95 03 00 00       	xor    eax,0x395
  40115b:	3b c8                	cmp    ecx,eax
  40115d:	75 06                	jne    0x401165
  40115f:	8a 9e 2c 30 40 00    	mov    bl,BYTE PTR [esi+0x40302c]
  401165:	b8 24 30 40 00       	mov    eax,0x403024
  40116a:	8d 50 01             	lea    edx,[eax+0x1]
  40116d:	8d 49 00             	lea    ecx,[ecx+0x0]
  401170:	8a 08                	mov    cl,BYTE PTR [eax]
  401172:	83 c0 01             	add    eax,0x1
  401175:	84 c9                	test   cl,cl
  401177:	75 f7                	jne    0x401170
  401179:	2b c2                	sub    eax,edx
  40117b:	83 c0 ff             	add    eax,0xffffffff
  40117e:	3b f0                	cmp    esi,eax
  401180:	74 2b                	je     0x4011ad
  401182:	b8 24 30 40 00       	mov    eax,0x403024
  401187:	83 c6 01             	add    esi,0x1
  40118a:	8d 50 01             	lea    edx,[eax+0x1]
  40118d:	8d 49 00             	lea    ecx,[ecx+0x0]
  401190:	8a 08                	mov    cl,BYTE PTR [eax]
  401192:	83 c0 01             	add    eax,0x1
  401195:	84 c9                	test   cl,cl
  401197:	75 f7                	jne    0x401190
  401199:	2b c2                	sub    eax,edx
  40119b:	3b f0                	cmp    esi,eax
  40119d:	0f 82 f8 fe ff ff    	jb     0x40109b
  4011a3:	32 c0                	xor    al,al
  4011a5:	5f                   	pop    edi
  4011a6:	5e                   	pop    esi
  4011a7:	5d                   	pop    ebp
  4011a8:	5b                   	pop    ebx
  4011a9:	83 c4 0c             	add    esp,0xc
  4011ac:	c3                   	ret
  4011ad:	8b 15 58 20 40 00    	mov    edx,DWORD PTR ds:0x402058
  4011b3:	68 64 21 40 00       	push   0x402164
  4011b8:	52                   	push   edx
  4011b9:	e8 02 02 00 00       	call   0x4013c0
  4011be:	83 c4 08             	add    esp,0x8
  4011c1:	b0 01                	mov    al,0x1
  4011c3:	5f                   	pop    edi
  4011c4:	5e                   	pop    esi
  4011c5:	5d                   	pop    ebp
  4011c6:	5b                   	pop    ebx
  4011c7:	83 c4 0c             	add    esp,0xc
  4011ca:	c3                   	ret
