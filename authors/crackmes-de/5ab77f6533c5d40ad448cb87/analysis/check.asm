
original/safe.exe:     file format pei-i386


Disassembly of section .text:

004010d3 <.text+0xd3>:
  4010d3:	56                   	push   esi
  4010d4:	57                   	push   edi
  4010d5:	33 c9                	xor    ecx,ecx
  4010d7:	33 c0                	xor    eax,eax
  4010d9:	33 db                	xor    ebx,ebx
  4010db:	68 00 30 40 00       	push   0x403000
  4010e0:	e8 cd 00 00 00       	call   0x4011b2
  4010e5:	83 f8 06             	cmp    eax,0x6
  4010e8:	74 03                	je     0x4010ed
  4010ea:	5f                   	pop    edi
  4010eb:	5e                   	pop    esi
  4010ec:	c3                   	ret
  4010ed:	be 00 30 40 00       	mov    esi,0x403000
  4010f2:	bf ff 30 40 00       	mov    edi,0x4030ff
  4010f7:	8a 06                	mov    al,BYTE PTR [esi]
  4010f9:	8a 5f 04             	mov    bl,BYTE PTR [edi+0x4]
  4010fc:	80 c3 02             	add    bl,0x2
  4010ff:	80 eb 03             	sub    bl,0x3
  401102:	38 d8                	cmp    al,bl
  401104:	74 05                	je     0x40110b
  401106:	e8 7a 00 00 00       	call   0x401185
  40110b:	8a 46 02             	mov    al,BYTE PTR [esi+0x2]
  40110e:	8a 5f 04             	mov    bl,BYTE PTR [edi+0x4]
  401111:	38 d8                	cmp    al,bl
  401113:	74 05                	je     0x40111a
  401115:	e8 6b 00 00 00       	call   0x401185
  40111a:	8a 46 01             	mov    al,BYTE PTR [esi+0x1]
  40111d:	8a 5f 02             	mov    bl,BYTE PTR [edi+0x2]
  401120:	38 d8                	cmp    al,bl
  401122:	74 05                	je     0x401129
  401124:	e8 5c 00 00 00       	call   0x401185
  401129:	8a 46 04             	mov    al,BYTE PTR [esi+0x4]
  40112c:	8a 1f                	mov    bl,BYTE PTR [edi]
  40112e:	38 d8                	cmp    al,bl
  401130:	74 05                	je     0x401137
  401132:	e8 4e 00 00 00       	call   0x401185
  401137:	8a 46 05             	mov    al,BYTE PTR [esi+0x5]
  40113a:	8a 5f 02             	mov    bl,BYTE PTR [edi+0x2]
  40113d:	38 d8                	cmp    al,bl
  40113f:	74 05                	je     0x401146
  401141:	e8 3f 00 00 00       	call   0x401185
  401146:	8a 46 03             	mov    al,BYTE PTR [esi+0x3]
  401149:	8a 5f 04             	mov    bl,BYTE PTR [edi+0x4]
  40114c:	38 d8                	cmp    al,bl
  40114e:	74 05                	je     0x401155
  401150:	e8 30 00 00 00       	call   0x401185
  401155:	80 3d 09 31 40 00 01 	cmp    BYTE PTR ds:0x403109,0x1
  40115c:	74 18                	je     0x401176
  40115e:	6a 00                	push   0x0
  401160:	68 14 32 40 00       	push   0x403214
  401165:	68 08 32 40 00       	push   0x403208
  40116a:	6a 00                	push   0x0
  40116c:	e8 29 00 00 00       	call   0x40119a
  401171:	5f                   	pop    edi
  401172:	5e                   	pop    esi
  401173:	c3                   	ret
  401174:	eb 0f                	jmp    0x401185
  401176:	68 e8 03 00 00       	push   0x3e8
  40117b:	6a 64                	push   0x64
  40117d:	e8 1e 00 00 00       	call   0x4011a0
  401182:	5f                   	pop    edi
  401183:	5e                   	pop    esi
  401184:	c3                   	ret
  401185:	c6 05 09 31 40 00 01 	mov    BYTE PTR ds:0x403109,0x1
  40118c:	c3                   	ret
