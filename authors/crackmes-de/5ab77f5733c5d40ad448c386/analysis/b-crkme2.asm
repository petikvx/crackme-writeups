
analysis/x/B-CRKME2.EXE:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	07                   	pop    es
  401001:	00 08                	add    BYTE PTR [eax],cl
  401003:	00 c6                	add    dh,al
  401005:	21 40 00             	and    DWORD PTR [eax+0x0],eax
  401008:	26 22 40 00          	and    al,BYTE PTR es:[eax+0x0]
  40100c:	cd 21                	int    0x21
  40100e:	40                   	inc    eax
  40100f:	00 ff                	add    bh,bh
  401011:	25 00 41 40 00       	and    eax,0x404100
  401016:	ff 25 1c 41 40 00    	jmp    DWORD PTR ds:0x40411c
  40101c:	ff 25 28 41 40 00    	jmp    DWORD PTR ds:0x404128
  401022:	ff 25 f0 40 40 00    	jmp    DWORD PTR ds:0x4040f0
  401028:	ff 25 e8 40 40 00    	jmp    DWORD PTR ds:0x4040e8
  40102e:	ff 25 30 41 40 00    	jmp    DWORD PTR ds:0x404130
  401034:	ff 25 dc 40 40 00    	jmp    DWORD PTR ds:0x4040dc
  40103a:	ff 25 3c 41 40 00    	jmp    DWORD PTR ds:0x40413c
  401040:	ff 25 f4 40 40 00    	jmp    DWORD PTR ds:0x4040f4
  401046:	ff 25 38 41 40 00    	jmp    DWORD PTR ds:0x404138
  40104c:	ff 25 34 41 40 00    	jmp    DWORD PTR ds:0x404134
  401052:	ff 25 24 41 40 00    	jmp    DWORD PTR ds:0x404124
  401058:	ff 25 0c 41 40 00    	jmp    DWORD PTR ds:0x40410c
  40105e:	ff 25 20 41 40 00    	jmp    DWORD PTR ds:0x404120
  401064:	ff 25 e0 40 40 00    	jmp    DWORD PTR ds:0x4040e0
  40106a:	ff 25 cc 40 40 00    	jmp    DWORD PTR ds:0x4040cc
  401070:	ff 25 4c 41 40 00    	jmp    DWORD PTR ds:0x40414c
  401076:	ff 25 c8 40 40 00    	jmp    DWORD PTR ds:0x4040c8
  40107c:	ff 25 58 41 40 00    	jmp    DWORD PTR ds:0x404158
  401082:	ff 25 2c 41 40 00    	jmp    DWORD PTR ds:0x40412c
  401088:	ff 25 f8 40 40 00    	jmp    DWORD PTR ds:0x4040f8
  40108e:	ff 25 14 41 40 00    	jmp    DWORD PTR ds:0x404114
  401094:	ff 25 54 41 40 00    	jmp    DWORD PTR ds:0x404154
  40109a:	ff 25 50 41 40 00    	jmp    DWORD PTR ds:0x404150
  4010a0:	ff 25 60 41 40 00    	jmp    DWORD PTR ds:0x404160
  4010a6:	ff 25 d8 40 40 00    	jmp    DWORD PTR ds:0x4040d8
  4010ac:	ff 25 5c 41 40 00    	jmp    DWORD PTR ds:0x40415c
  4010b2:	ff 25 44 41 40 00    	jmp    DWORD PTR ds:0x404144
  4010b8:	ff 25 e4 40 40 00    	jmp    DWORD PTR ds:0x4040e4
  4010be:	ff 25 ec 40 40 00    	jmp    DWORD PTR ds:0x4040ec
  4010c4:	ff 25 08 41 40 00    	jmp    DWORD PTR ds:0x404108
  4010ca:	ff 25 d4 40 40 00    	jmp    DWORD PTR ds:0x4040d4
  4010d0:	ff 25 fc 40 40 00    	jmp    DWORD PTR ds:0x4040fc
  4010d6:	ff 25 d0 40 40 00    	jmp    DWORD PTR ds:0x4040d0
  4010dc:	ff 25 48 41 40 00    	jmp    DWORD PTR ds:0x404148
  4010e2:	ff 25 18 41 40 00    	jmp    DWORD PTR ds:0x404118
  4010e8:	ff 25 04 41 40 00    	jmp    DWORD PTR ds:0x404104
  4010ee:	ff 25 10 41 40 00    	jmp    DWORD PTR ds:0x404110
  4010f4:	ff 25 40 41 40 00    	jmp    DWORD PTR ds:0x404140
  4010fa:	00 00                	add    BYTE PTR [eax],al
  4010fc:	68 10 13 40 00       	push   0x401310
  401101:	e8 ee ff ff ff       	call   0x4010f4
  401106:	00 00                	add    BYTE PTR [eax],al
  401108:	00 00                	add    BYTE PTR [eax],al
  40110a:	00 00                	add    BYTE PTR [eax],al
  40110c:	30 00                	xor    BYTE PTR [eax],al
  40110e:	00 00                	add    BYTE PTR [eax],al
  401110:	40                   	inc    eax
  401111:	00 00                	add    BYTE PTR [eax],al
  401113:	00 00                	add    BYTE PTR [eax],al
  401115:	00 00                	add    BYTE PTR [eax],al
  401117:	00 8c 7b 03 23 d2 ff 	add    BYTE PTR [ebx+edi*2-0x2ddcfd],cl
  40111e:	d1 11                	rcl    DWORD PTR [ecx],1
  401120:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  401125:	6a 49                	push   0x49
  401127:	ba 00 00 00 00       	mov    edx,0x0
  40112c:	00 00                	add    BYTE PTR [eax],al
  40112e:	01 00                	add    DWORD PTR [eax],eax
	...
  401138:	43                   	inc    ebx
  401139:	72 61                	jb     0x40119c
  40113b:	63 6b 6d             	arpl   WORD PTR [ebx+0x6d],ebp
  40113e:	65 32 37             	xor    dh,BYTE PTR gs:[edi]
  401141:	35 00 00 00 00       	xor    eax,0x0
  401146:	00 00                	add    BYTE PTR [eax],al
  401148:	00 00                	add    BYTE PTR [eax],al
  40114a:	00 00                	add    BYTE PTR [eax],al
  40114c:	ff cc                	dec    esp
  40114e:	31 00                	xor    DWORD PTR [eax],eax
  401150:	02 c0                	add    al,al
  401152:	78 03                	js     0x401157
  401154:	23 d2                	and    edx,edx
  401156:	ff d1                	call   ecx
  401158:	11 bb 07 00 a0 24    	adc    DWORD PTR [ebx+0x24a00007],edi
  40115e:	6a 49                	push   0x49
  401160:	ba c1 78 03 23       	mov    edx,0x230378c1
  401165:	d2 ff                	sar    bh,cl
  401167:	d1 11                	rcl    DWORD PTR [ecx],1
  401169:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  40116e:	6a 49                	push   0x49
  401170:	ba 3a 4f ad 33       	mov    edx,0x33ad4f3a
  401175:	99                   	cdq
  401176:	66 cf                	iretw
  401178:	11 b7 0c 00 aa 00    	adc    DWORD PTR [edi+0xaa000c],esi
  40117e:	60                   	pusha
  40117f:	d3 93 00 00 00 00    	rcl    DWORD PTR [ebx+0x0],cl
	...
  4011a5:	1a 01                	sbb    al,BYTE PTR [ecx]
  4011a7:	00 00                	add    BYTE PTR [eax],al
  4011a9:	7b 00                	jnp    0x4011ab
  4011ab:	00 00                	add    BYTE PTR [eax],al
  4011ad:	00 05 00 46 6f 72    	add    BYTE PTR ds:0x726f4600,al
  4011b3:	6d                   	ins    DWORD PTR es:[edi],dx
  4011b4:	31 00                	xor    DWORD PTR [eax],eax
  4011b6:	0d 01 1f 00 43       	or     eax,0x43001f01
  4011bb:	72 61                	jb     0x40121e
  4011bd:	63 6b 4d             	arpl   WORD PTR [ebx+0x4d],ebp
  4011c0:	65 20 23             	and    BYTE PTR gs:[ebx],ah
  4011c3:	32 20                	xor    ah,BYTE PTR [eax]
  4011c5:	42                   	inc    edx
  4011c6:	79 20                	jns    0x4011e8
  4011c8:	42                   	inc    edx
  4011c9:	75 4c                	jne    0x401217
  4011cb:	4c                   	dec    esp
  4011cc:	65 54                	gs push esp
  4011ce:	20 2d 20 5b 54 4f    	and    BYTE PTR ds:0x4f545b20,ch
  4011d4:	4c                   	dec    esp
  4011d5:	27                   	daa
  4011d6:	39 38                	cmp    DWORD PTR [eax],edi
  4011d8:	5d                   	pop    ebp
  4011d9:	00 19                	add    BYTE PTR [ecx],bl
  4011db:	01 00                	add    DWORD PTR [eax],eax
  4011dd:	42                   	inc    edx
  4011de:	00 22                	add    BYTE PTR [edx],ah
  4011e0:	01 23                	add    DWORD PTR [ebx],esp
  4011e2:	ff                   	(bad)
  4011e3:	ff                   	(bad)
  4011e4:	ff                   	(bad)
  4011e5:	ff 24 05 00 46 6f 72 	jmp    DWORD PTR [eax*1+0x726f4600]
  4011ec:	6d                   	ins    DWORD PTR es:[edi],dx
  4011ed:	31 00                	xor    DWORD PTR [eax],eax
  4011ef:	26 00 27             	add    BYTE PTR es:[edi],ah
  4011f2:	00 32                	add    BYTE PTR [edx],dh
  4011f4:	00 35 2d 00 00 00    	add    BYTE PTR ds:0x2d,dh
  4011fa:	4a                   	dec    edx
  4011fb:	01 00                	add    DWORD PTR [eax],eax
  4011fd:	00 ef                	add    bh,ch
  4011ff:	10 00                	adc    BYTE PTR [eax],al
  401201:	00 fe                	add    dh,bh
  401203:	01 00                	add    DWORD PTR [eax],eax
  401205:	00 3e                	add    BYTE PTR [esi],bh
  401207:	00 40 01             	add    BYTE PTR [eax+0x1],al
  40120a:	00 00                	add    BYTE PTR [eax],al
  40120c:	00 90 01 dc 7c 01    	add    BYTE PTR [eax+0x17cdc01],dl
  401212:	00 0d 4d 53 20 53    	add    BYTE PTR ds:0x5320534d,cl
  401218:	61                   	popa
  401219:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40121a:	73 20                	jae    0x40123c
  40121c:	53                   	push   ebx
  40121d:	65 72 69             	gs jb  0x401289
  401220:	66 46                	inc    si
  401222:	02 ff                	add    bh,bh
  401224:	01 41 00             	add    DWORD PTR [ecx+0x0],eax
  401227:	00 00                	add    BYTE PTR [eax],al
  401229:	01 08                	add    DWORD PTR [eax],ecx
  40122b:	00 43 6f             	add    BYTE PTR [ebx+0x6f],al
  40122e:	6d                   	ins    DWORD PTR es:[edi],dx
  40122f:	6d                   	ins    DWORD PTR es:[edi],dx
  401230:	61                   	popa
  401231:	6e                   	outs   dx,BYTE PTR ds:[esi]
  401232:	64 31 00             	xor    DWORD PTR fs:[eax],eax
  401235:	04 01                	add    al,0x1
  401237:	06                   	push   es
  401238:	00 56 65             	add    BYTE PTR [esi+0x65],dl
  40123b:	72 69                	jb     0x4012a6
  40123d:	66 79 00             	data16 jns 0x401240
  401240:	04 20                	add    al,0x20
  401242:	0d 78 00 57 03       	or     eax,0x3570078
  401247:	ff 00                	inc    DWORD PTR [eax]
  401249:	11 01                	adc    DWORD PTR [ecx],eax
  40124b:	00 1d 01 00 00 00    	add    BYTE PTR ds:0x1,bl
  401251:	90                   	nop
  401252:	01 44 42 01          	add    DWORD PTR [edx+eax*2+0x1],eax
  401256:	00 0d 4d 53 20 53    	add    BYTE PTR ds:0x5320534d,cl
  40125c:	61                   	popa
  40125d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40125e:	73 20                	jae    0x401280
  401260:	53                   	push   ebx
  401261:	65 72 69             	gs jb  0x4012cd
  401264:	66 ff 03             	inc    WORD PTR [ebx]
  401267:	56                   	push   esi
  401268:	00 00                	add    BYTE PTR [eax],al
  40126a:	00 02                	add    BYTE PTR [edx],al
  40126c:	05 00 54 65 78       	add    eax,0x78655400
  401271:	74 31                	je     0x4012a4
  401273:	00 02                	add    BYTE PTR [edx],al
  401275:	04 78                	add    al,0x78
  401277:	00 78 00             	add    BYTE PTR [eax+0x0],bh
  40127a:	c7                   	(bad)
  40127b:	0b 1d 01 12 00 00    	or     ebx,DWORD PTR ds:0x1201
  401281:	25 1b 00 00 00       	and    eax,0x1b
  401286:	28 03                	sub    BYTE PTR [ebx],al
  401288:	2e 01 00             	add    DWORD PTR cs:[eax],eax
  40128b:	00 00                	add    BYTE PTR [eax],al
  40128d:	90                   	nop
  40128e:	01 dc                	add    esp,ebx
  401290:	7c 01                	jl     0x401293
  401292:	00 0f                	add    BYTE PTR [edi],cl
  401294:	54                   	push   esp
  401295:	69 6d 65 73 20 4e 65 	imul   ebp,DWORD PTR [ebp+0x65],0x654e2073
  40129c:	77 20                	ja     0x4012be
  40129e:	52                   	push   edx
  40129f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4012a0:	6d                   	ins    DWORD PTR es:[edi],dx
  4012a1:	61                   	popa
  4012a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4012a3:	33 15 00 45 6e 74    	xor    edx,DWORD PTR ds:0x746e4500
  4012a9:	65 72 20             	gs jb  0x4012cc
  4012ac:	70 61                	jo     0x40130f
  4012ae:	73 73                	jae    0x401323
  4012b0:	77 6f                	ja     0x401321
  4012b2:	72 64                	jb     0x401318
  4012b4:	20 68 65             	and    BYTE PTR [eax+0x65],ch
  4012b7:	72 65                	jb     0x40131e
  4012b9:	20 21                	and    BYTE PTR [ecx],ah
  4012bb:	00 ff                	add    bh,bh
  4012bd:	02 04 00             	add    al,BYTE PTR [eax+eax*1]
  4012c0:	50                   	push   eax
  4012c1:	00 00                	add    BYTE PTR [eax],al
  4012c3:	00 c0                	add    al,al
  4012c5:	78 03                	js     0x4012ca
  4012c7:	23 d2                	and    edx,edx
  4012c9:	ff d1                	call   ecx
  4012cb:	11 bb 07 00 a0 24    	adc    DWORD PTR [ebx+0x24a00007],edi
  4012d1:	6a 49                	push   0x49
  4012d3:	ba 00 00 00 00       	mov    edx,0x0
	...
  4012e8:	10 01                	adc    BYTE PTR [ecx],al
	...
  4012fe:	00 00                	add    BYTE PTR [eax],al
  401300:	73 01                	jae    0x401303
  401302:	00 00                	add    BYTE PTR [eax],al
  401304:	00 00                	add    BYTE PTR [eax],al
  401306:	00 00                	add    BYTE PTR [eax],al
  401308:	4c                   	dec    esp
  401309:	11 40 00             	adc    DWORD PTR [eax+0x0],eax
  40130c:	74 46                	je     0x401354
  40130e:	b5 00                	mov    ch,0x0
  401310:	56                   	push   esi
  401311:	42                   	inc    edx
  401312:	35 21 89 0e 2a       	xor    eax,0x2a0e8921
	...
  401323:	00 7e 00             	add    BYTE PTR [esi+0x0],bh
	...
  401332:	04 00                	add    al,0x0
  401334:	09 04 00             	or     DWORD PTR [eax+eax*1],eax
	...
  40133f:	00 9c 13 40 00 14 f0 	add    BYTE PTR [ebx+edx*1-0xfebffc0],bl
  401346:	30 00                	xor    BYTE PTR [eax],al
  401348:	00 ff                	add    bh,bh
  40134a:	ff                   	(bad)
  40134b:	ff 08                	dec    DWORD PTR [eax]
  40134d:	00 00                	add    BYTE PTR [eax],al
  40134f:	00 01                	add    BYTE PTR [ecx],al
  401351:	00 00                	add    BYTE PTR [eax],al
  401353:	00 01                	add    BYTE PTR [ecx],al
  401355:	00 00                	add    BYTE PTR [eax],al
  401357:	00 e9                	add    cl,ch
  401359:	00 00                	add    BYTE PTR [eax],al
  40135b:	00 c0                	add    al,al
  40135d:	12 40 00             	adc    al,BYTE PTR [eax+0x0]
  401360:	c0 12 40             	rcl    BYTE PTR [edx],0x40
  401363:	00 08                	add    BYTE PTR [eax],cl
  401365:	11 40 00             	adc    DWORD PTR [eax+0x0],eax
  401368:	68 00 00 00 71       	push   0x71000000
  40136d:	00 00                	add    BYTE PTR [eax],al
  40136f:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
  401372:	00 00                	add    BYTE PTR [eax],al
  401374:	80 00 00             	add    BYTE PTR [eax],0x0
  401377:	00 42 2d             	add    BYTE PTR [edx+0x2d],al
  40137a:	43                   	inc    ebx
  40137b:	72 6b                	jb     0x4013e8
  40137d:	4d                   	dec    ebp
  40137e:	65 32 00             	xor    al,BYTE PTR gs:[eax]
  401381:	43                   	inc    ebx
  401382:	72 61                	jb     0x4013e5
  401384:	63 6b 4d             	arpl   WORD PTR [ebx+0x4d],ebp
  401387:	65 20 76 32          	and    BYTE PTR gs:[esi+0x32],dh
  40138b:	2e 37                	cs aaa
  40138d:	35 00 00 43 72       	xor    eax,0x72430000
  401392:	61                   	popa
  401393:	63 6b 6d             	arpl   WORD PTR [ebx+0x6d],ebp
  401396:	65 32 37             	xor    dh,BYTE PTR gs:[edi]
  401399:	35 00 00 f4 01       	xor    eax,0x1f40000
  40139e:	00 00                	add    BYTE PTR [eax],al
  4013a0:	48                   	dec    eax
  4013a1:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  4013a4:	00 00                	add    BYTE PTR [eax],al
  4013a6:	00 00                	add    BYTE PTR [eax],al
  4013a8:	20 1d 40 00 90 22    	and    BYTE PTR ds:0x22900040,bl
  4013ae:	40                   	inc    eax
  4013af:	00 e0                	add    al,ah
  4013b1:	09 00                	or     DWORD PTR [eax],eax
  4013b3:	00 08                	add    BYTE PTR [eax],cl
  4013b5:	30 40 00             	xor    BYTE PTR [eax+0x0],al
  4013b8:	16                   	push   ss
  4013b9:	10 40 00             	adc    BYTE PTR [eax+0x0],al
  4013bc:	00 30                	add    BYTE PTR [eax],dh
  4013be:	40                   	inc    eax
  4013bf:	00 2a                	add    BYTE PTR [edx],ch
  4013c1:	00 5c 00 41          	add    BYTE PTR [eax+eax*1+0x41],bl
  4013c5:	00 43 00             	add    BYTE PTR [ebx+0x0],al
  4013c8:	3a 00                	cmp    al,BYTE PTR [eax]
  4013ca:	5c                   	pop    esp
  4013cb:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  4013ce:	72 00                	jb     0x4013d0
  4013d0:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4013d1:	00 67 00             	add    BYTE PTR [edi+0x0],ah
  4013d4:	72 00                	jb     0x4013d6
  4013d6:	61                   	popa
  4013d7:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
  4013da:	6d                   	ins    DWORD PTR es:[edi],dx
  4013db:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
  4013de:	72 00                	jb     0x4013e0
  4013e0:	5c                   	pop    esp
  4013e1:	00 56 00             	add    BYTE PTR [esi+0x0],dl
  4013e4:	42                   	inc    edx
  4013e5:	00 35 00 5c 00 42    	add    BYTE PTR ds:0x42005c00,dh
  4013eb:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
  4013ee:	4c                   	dec    esp
  4013ef:	00 4c 00 65          	add    BYTE PTR [eax+eax*1+0x65],cl
  4013f3:	00 54 00 5c          	add    BYTE PTR [eax+eax*1+0x5c],dl
  4013f7:	00 43 00             	add    BYTE PTR [ebx+0x0],al
  4013fa:	72 00                	jb     0x4013fc
  4013fc:	61                   	popa
  4013fd:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
  401400:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
  401403:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
  401406:	32 00                	xor    al,BYTE PTR [eax]
  401408:	37                   	aaa
  401409:	00 35 00 5c 00 50    	add    BYTE PTR ds:0x50005c00,dh
  40140f:	00 72 00             	add    BYTE PTR [edx+0x0],dh
  401412:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401413:	00 6a 00             	add    BYTE PTR [edx+0x0],ch
  401416:	65 00 63 00          	add    BYTE PTR gs:[ebx+0x0],ah
  40141a:	74 00                	je     0x40141c
  40141c:	31 00                	xor    DWORD PTR [eax],eax
  40141e:	2e 00 76 00          	add    BYTE PTR cs:[esi+0x0],dh
  401422:	62 00                	bound  eax,QWORD PTR [eax]
  401424:	70 00                	jo     0x401426
	...
  4015ce:	00 00                	add    BYTE PTR [eax],al
  4015d0:	c0 12 40             	rcl    BYTE PTR [edx],0x40
  4015d3:	00 00                	add    BYTE PTR [eax],al
  4015d5:	00 00                	add    BYTE PTR [eax],al
  4015d7:	00 01                	add    BYTE PTR [ecx],al
  4015d9:	00 00                	add    BYTE PTR [eax],al
  4015db:	00 48 18             	add    BYTE PTR [eax+0x18],cl
  4015de:	40                   	inc    eax
  4015df:	00 00                	add    BYTE PTR [eax],al
  4015e1:	00 00                	add    BYTE PTR [eax],al
  4015e3:	00 90 1c 40 00 ff    	add    BYTE PTR [eax-0xffbfe4],dl
  4015e9:	ff                   	(bad)
  4015ea:	ff                   	(bad)
  4015eb:	ff 00                	inc    DWORD PTR [eax]
  4015ed:	00 00                	add    BYTE PTR [eax],al
  4015ef:	00 9c 18 40 00 08 30 	add    BYTE PTR [eax+ebx*1+0x30080040],bl
  4015f6:	40                   	inc    eax
  4015f7:	00 00                	add    BYTE PTR [eax],al
  4015f9:	00 00                	add    BYTE PTR [eax],al
  4015fb:	00 74 94 5f          	add    BYTE PTR [esp+edx*4+0x5f],dh
	...
  40160b:	00 50 16             	add    BYTE PTR [eax+0x16],dl
  40160e:	40                   	inc    eax
  40160f:	00 01                	add    BYTE PTR [ecx],al
  401611:	00 00                	add    BYTE PTR [eax],al
  401613:	00 f4                	add    ah,dh
  401615:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  401618:	00 00                	add    BYTE PTR [eax],al
  40161a:	00 00                	add    BYTE PTR [eax],al
  40161c:	50                   	push   eax
  40161d:	16                   	push   ss
  40161e:	40                   	inc    eax
  40161f:	00 01                	add    BYTE PTR [ecx],al
  401621:	00 00                	add    BYTE PTR [eax],al
  401623:	00 58 16             	add    BYTE PTR [eax+0x16],bl
  401626:	40                   	inc    eax
  401627:	00 00                	add    BYTE PTR [eax],al
  401629:	00 00                	add    BYTE PTR [eax],al
  40162b:	00 54 16 40          	add    BYTE PTR [esi+edx*1+0x40],dl
  40162f:	00 03                	add    BYTE PTR [ebx],al
  401631:	00 00                	add    BYTE PTR [eax],al
  401633:	00 58 16             	add    BYTE PTR [eax+0x16],bl
  401636:	40                   	inc    eax
  401637:	00 01                	add    BYTE PTR [ecx],al
  401639:	00 b7 01 68 00 6c    	add    BYTE PTR [edi+0x6c006801],dh
  40163f:	00 d0                	add    al,dl
  401641:	16                   	push   ss
  401642:	40                   	inc    eax
  401643:	00 e0                	add    al,ah
  401645:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
  401648:	00 00                	add    BYTE PTR [eax],al
  40164a:	00 00                	add    BYTE PTR [eax],al
  40164c:	ec                   	in     al,dx
  40164d:	9f                   	lahf
  40164e:	60                   	pusha
  40164f:	00 04 19             	add    BYTE PTR [ecx+ebx*1],al
  401652:	40                   	inc    eax
  401653:	00 14 19             	add    BYTE PTR [ecx+ebx*1],dl
  401656:	40                   	inc    eax
  401657:	00 40 00             	add    BYTE PTR [eax+0x0],al
  40165a:	1f                   	pop    ds
  40165b:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
  40165e:	00 00                	add    BYTE PTR [eax],al
  401660:	24 19                	and    al,0x19
  401662:	40                   	inc    eax
  401663:	00 ff                	add    bh,bh
  401665:	ff                   	(bad)
  401666:	ff                   	(bad)
  401667:	ff 00                	inc    DWORD PTR [eax]
  401669:	00 00                	add    BYTE PTR [eax],al
  40166b:	00 00                	add    BYTE PTR [eax],al
  40166d:	00 00                	add    BYTE PTR [eax],al
  40166f:	00 d4                	add    ah,dl
  401671:	16                   	push   ss
  401672:	40                   	inc    eax
  401673:	00 68 b2             	add    BYTE PTR [eax-0x4e],ch
  401676:	60                   	pusha
  401677:	00 34 19             	add    BYTE PTR [ecx+ebx*1],dh
  40167a:	40                   	inc    eax
  40167b:	00 ff                	add    bh,bh
  40167d:	ff                   	(bad)
  40167e:	ff                   	(bad)
  40167f:	ff 40 00             	inc    DWORD PTR [eax+0x0]
  401682:	11 00                	adc    DWORD PTR [eax],eax
  401684:	38 00                	cmp    BYTE PTR [eax],al
  401686:	00 00                	add    BYTE PTR [eax],al
  401688:	94                   	xchg   esp,eax
  401689:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  40168c:	01 00                	add    DWORD PTR [eax],eax
  40168e:	03 00                	add    eax,DWORD PTR [eax]
	...
  401698:	68 17 40 00 78       	push   0x78004017
  40169d:	b2 60                	mov    dl,0x60
  40169f:	00 a4 19 40 00 01 00 	add    BYTE PTR [ecx+ebx*1+0x10040],ah
  4016a6:	03 00                	add    eax,DWORD PTR [eax]
  4016a8:	40                   	inc    eax
  4016a9:	00 17                	add    BYTE PTR [edi],dl
  4016ab:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
  4016ae:	00 00                	add    BYTE PTR [eax],al
  4016b0:	b0 19                	mov    al,0x19
  4016b2:	40                   	inc    eax
  4016b3:	00 02                	add    BYTE PTR [edx],al
  4016b5:	00 03                	add    BYTE PTR [ebx],al
	...
  4016bf:	00 c4                	add    ah,al
  4016c1:	17                   	pop    ss
  4016c2:	40                   	inc    eax
  4016c3:	00 88 b2 60 00 c0    	add    BYTE PTR [eax-0x3fff9f4e],cl
  4016c9:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  4016cc:	02 00                	add    al,BYTE PTR [eax]
  4016ce:	03 00                	add    eax,DWORD PTR [eax]
  4016d0:	40                   	inc    eax
  4016d1:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  4016d4:	00 00                	add    BYTE PTR [eax],al
  4016d6:	00 00                	add    BYTE PTR [eax],al
  4016d8:	58                   	pop    eax
  4016d9:	16                   	push   ss
  4016da:	40                   	inc    eax
  4016db:	00 d8                	add    al,bl
  4016dd:	15 40 00 e2 10       	adc    eax,0x10e20040
  4016e2:	40                   	inc    eax
  4016e3:	00 e8                	add    al,ch
  4016e5:	10 40 00             	adc    BYTE PTR [eax+0x0],al
  4016e8:	ee                   	out    dx,al
  4016e9:	10 40 00             	adc    BYTE PTR [eax+0x0],al
	...
  40176c:	80 16 40             	adc    BYTE PTR [esi],0x40
  40176f:	00 d8                	add    al,bl
  401771:	15 40 00 e2 10       	adc    eax,0x10e20040
  401776:	40                   	inc    eax
  401777:	00 e8                	add    al,ch
  401779:	10 40 00             	adc    BYTE PTR [eax+0x0],al
  40177c:	ee                   	out    dx,al
  40177d:	10 40 00             	adc    BYTE PTR [eax+0x0],al
  401780:	38 18                	cmp    BYTE PTR [eax],bl
  401782:	40                   	inc    eax
	...
  4017c7:	00 a8 16 40 00 d8    	add    BYTE PTR [eax-0x27ffbfea],ch
  4017cd:	15 40 00 e2 10       	adc    eax,0x10e20040
  4017d2:	40                   	inc    eax
  4017d3:	00 e8                	add    al,ch
  4017d5:	10 40 00             	adc    BYTE PTR [eax+0x0],al
  4017d8:	ee                   	out    dx,al
  4017d9:	10 40 00             	adc    BYTE PTR [eax+0x0],al
	...
  401838:	81 6c 24 04 37 00 00 	sub    DWORD PTR [esp+0x4],0x37
  40183f:	00 
  401840:	e9 df 04 00 00       	jmp    0x401d24
  401845:	00 00                	add    BYTE PTR [eax],al
  401847:	00 00                	add    BYTE PTR [eax],al
  401849:	00 00                	add    BYTE PTR [eax],al
  40184b:	00 2c 30             	add    BYTE PTR [eax+esi*1],ch
  40184e:	40                   	inc    eax
  40184f:	00 d0                	add    al,dl
  401851:	1c 40                	sbb    al,0x40
  401853:	00 ff                	add    bh,bh
  401855:	ff                   	(bad)
  401856:	ff                   	(bad)
  401857:	ff 00                	inc    DWORD PTR [eax]
  401859:	00 00                	add    BYTE PTR [eax],al
  40185b:	00 1c 30             	add    BYTE PTR [eax+esi*1],bl
  40185e:	40                   	inc    eax
  40185f:	00 89 7b 03 23 d2    	add    BYTE PTR [ecx-0x2ddcfc85],cl
  401865:	ff d1                	call   ecx
  401867:	11 bb 07 00 a0 24    	adc    DWORD PTR [ebx+0x24a00007],edi
  40186d:	6a 49                	push   0x49
  40186f:	ba 0a 00 01 00       	mov    edx,0x1000a
  401874:	01 00                	add    DWORD PTR [eax],eax
  401876:	01 00                	add    DWORD PTR [eax],eax
  401878:	9c                   	pushf
  401879:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
	...
  401888:	d8 18                	fcomp  DWORD PTR [eax]
  40188a:	40                   	inc    eax
  40188b:	00 09                	add    BYTE PTR [ecx],cl
  40188d:	04 00                	add    al,0x0
  40188f:	00 06                	add    BYTE PTR [esi],al
  401891:	04 00                	add    al,0x0
  401893:	00 00                	add    BYTE PTR [eax],al
  401895:	00 00                	add    BYTE PTR [eax],al
  401897:	00 02                	add    BYTE PTR [edx],al
  401899:	00 00                	add    BYTE PTR [eax],al
  40189b:	00 d8                	add    al,bl
  40189d:	15 40 00 ff ff       	adc    eax,0xffff0040
  4018a2:	ff                   	(bad)
  4018a3:	ff                   	call   (bad)
  4018a4:	d8 19                	fcomp  DWORD PTR [ecx]
  4018a6:	40                   	inc    eax
	...
  4018b3:	00 d0                	add    al,dl
  4018b5:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  4018b8:	01 00                	add    DWORD PTR [eax],eax
  4018ba:	00 00                	add    BYTE PTR [eax],al
  4018bc:	cc                   	int3
  4018bd:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  4018c0:	ff                   	(bad)
  4018c1:	ff 00                	inc    DWORD PTR [eax]
  4018c3:	00 83 80 01 00 00    	add    BYTE PTR [ebx+0x180],al
  4018c9:	00 00                	add    BYTE PTR [eax],al
  4018cb:	00 c8                	add    al,cl
  4018cd:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  4018d0:	46                   	inc    esi
  4018d1:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4018d2:	72 6d                	jb     0x401941
  4018d4:	31 00                	xor    DWORD PTR [eax],eax
  4018d6:	00 00                	add    BYTE PTR [eax],al
  4018d8:	43                   	inc    ebx
  4018d9:	72 61                	jb     0x40193c
  4018db:	63 6b 6d             	arpl   WORD PTR [ebx+0x6d],ebp
  4018de:	65 32 37             	xor    dh,BYTE PTR gs:[edi]
  4018e1:	35 00 00 c1 78       	xor    eax,0x78c10000
  4018e6:	03 23                	add    esp,DWORD PTR [ebx]
  4018e8:	d2 ff                	sar    bh,cl
  4018ea:	d1 11                	rcl    DWORD PTR [ecx],1
  4018ec:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  4018f1:	6a 49                	push   0x49
  4018f3:	ba 8b 7b 03 23       	mov    edx,0x23037b8b
  4018f8:	d2 ff                	sar    bh,cl
  4018fa:	d1 11                	rcl    DWORD PTR [ecx],1
  4018fc:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  401901:	6a 49                	push   0x49
  401903:	ba c0 78 03 23       	mov    edx,0x230378c0
  401908:	d2 ff                	sar    bh,cl
  40190a:	d1 11                	rcl    DWORD PTR [ecx],1
  40190c:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  401911:	6a 49                	push   0x49
  401913:	ba 8a 7b 03 23       	mov    edx,0x23037b8a
  401918:	d2 ff                	sar    bh,cl
  40191a:	d1 11                	rcl    DWORD PTR [ecx],1
  40191c:	bb 07 00 a0 24       	mov    ebx,0x24a00007
  401921:	6a 49                	push   0x49
  401923:	ba 3a 4f ad 33       	mov    edx,0x33ad4f3a
  401928:	99                   	cdq
  401929:	66 cf                	iretw
  40192b:	11 b7 0c 00 aa 00    	adc    DWORD PTR [edi+0xaa000c],esi
  401931:	60                   	pusha
  401932:	d3 93 46 6f 72 6d    	rcl    DWORD PTR [ebx+0x6d726f46],cl
  401938:	00 00                	add    BYTE PTR [eax],al
  40193a:	00 00                	add    BYTE PTR [eax],al
  40193c:	2e 3d fb fc fa a0    	cs cmp eax,0xa0fafcfb
  401942:	68 10 a7 38 08       	push   0x838a710
  401947:	00 2b                	add    BYTE PTR [ebx],ch
  401949:	33 71 b5             	xor    esi,DWORD PTR [ecx-0x4b]
  40194c:	43                   	inc    ebx
  40194d:	3a 5c 50 72          	cmp    bl,BYTE PTR [eax+edx*2+0x72]
  401951:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401952:	67 72 61             	addr16 jb 0x4019b6
  401955:	6d                   	ins    DWORD PTR es:[edi],dx
  401956:	6d                   	ins    DWORD PTR es:[edi],dx
  401957:	65 72 5c             	gs jb  0x4019b6
  40195a:	56                   	push   esi
  40195b:	42                   	inc    edx
  40195c:	35 5c 56 42 35       	xor    eax,0x3542565c
  401961:	2e 4f                	cs dec edi
  401963:	4c                   	dec    esp
  401964:	42                   	inc    edx
  401965:	00 00                	add    BYTE PTR [eax],al
  401967:	00 56 42             	add    BYTE PTR [esi+0x42],dl
  40196a:	00 00                	add    BYTE PTR [eax],al
  40196c:	3c 19                	cmp    al,0x19
  40196e:	40                   	inc    eax
  40196f:	00 00                	add    BYTE PTR [eax],al
  401971:	00 00                	add    BYTE PTR [eax],al
  401973:	00 05 00 00 00 09    	add    BYTE PTR ds:0x9000000,al
  401979:	00 00                	add    BYTE PTR [eax],al
  40197b:	00 4c 19 40          	add    BYTE PTR [ecx+ebx*1+0x40],cl
  40197f:	00 68 19             	add    BYTE PTR [eax+0x19],ch
  401982:	40                   	inc    eax
  401983:	00 d0                	add    al,dl
  401985:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
	...
  401990:	14 bf                	adc    al,0xbf
  401992:	5d                   	pop    ebp
  401993:	00 f2                	add    dl,dh
  401995:	4e                   	dec    esi
  401996:	ad                   	lods   eax,DWORD PTR ds:[esi]
  401997:	33 99 66 cf 11 b7    	xor    ebx,DWORD PTR [ecx-0x48ee309a]
  40199d:	0c 00                	or     al,0x0
  40199f:	aa                   	stos   BYTE PTR es:[edi],al
  4019a0:	00 60 d3             	add    BYTE PTR [eax-0x2d],ah
  4019a3:	93                   	xchg   ebx,eax
  4019a4:	43                   	inc    ebx
  4019a5:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4019a6:	6d                   	ins    DWORD PTR es:[edi],dx
  4019a7:	6d                   	ins    DWORD PTR es:[edi],dx
  4019a8:	61                   	popa
  4019a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4019aa:	64 31 00             	xor    DWORD PTR fs:[eax],eax
  4019ad:	00 00                	add    BYTE PTR [eax],al
  4019af:	00 e2                	add    dl,ah
  4019b1:	4e                   	dec    esi
  4019b2:	ad                   	lods   eax,DWORD PTR ds:[esi]
  4019b3:	33 99 66 cf 11 b7    	xor    ebx,DWORD PTR [ecx-0x48ee309a]
  4019b9:	0c 00                	or     al,0x0
  4019bb:	aa                   	stos   BYTE PTR es:[edi],al
  4019bc:	00 60 d3             	add    BYTE PTR [eax-0x2d],ah
  4019bf:	93                   	xchg   ebx,eax
  4019c0:	54                   	push   esp
  4019c1:	65 78 74             	gs js  0x401a38
  4019c4:	31 00                	xor    DWORD PTR [eax],eax
  4019c6:	00 00                	add    BYTE PTR [eax],al
  4019c8:	43                   	inc    ebx
  4019c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4019ca:	6d                   	ins    DWORD PTR es:[edi],dx
  4019cb:	6d                   	ins    DWORD PTR es:[edi],dx
  4019cc:	61                   	popa
  4019cd:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4019ce:	64 31 5f 43          	xor    DWORD PTR fs:[edi+0x43],ebx
  4019d2:	6c                   	ins    BYTE PTR es:[edi],dx
  4019d3:	69 63 6b 00 00 0c 00 	imul   esp,DWORD PTR [ebx+0x6b],0xc0000
  4019da:	48                   	dec    eax
	...
  4019e3:	00 56 42             	add    BYTE PTR [esi+0x42],dl
  4019e6:	41                   	inc    ecx
  4019e7:	35 2e 44 4c 4c       	xor    eax,0x4c4c442e
  4019ec:	00 00                	add    BYTE PTR [eax],al
  4019ee:	00 00                	add    BYTE PTR [eax],al
  4019f0:	5f                   	pop    edi
  4019f1:	5f                   	pop    edi
  4019f2:	76 62                	jbe    0x401a56
  4019f4:	61                   	popa
  4019f5:	46                   	inc    esi
  4019f6:	72 65                	jb     0x401a5d
  4019f8:	65 53                	gs push ebx
  4019fa:	74 72                	je     0x401a6e
  4019fc:	00 00                	add    BYTE PTR [eax],al
  4019fe:	00 00                	add    BYTE PTR [eax],al
  401a00:	8a 00                	mov    al,BYTE PTR [eax]
  401a02:	00 00                	add    BYTE PTR [eax],al
  401a04:	6c                   	ins    BYTE PTR es:[edi],dx
  401a05:	00 32                	add    BYTE PTR [edx],dh
  401a07:	00 72 00             	add    BYTE PTR [edx+0x0],dh
  401a0a:	4b                   	dec    ebx
  401a0b:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
  401a0e:	73 00                	jae    0x401a10
  401a10:	64 00 67 00          	add    BYTE PTR fs:[edi+0x0],ah
  401a14:	36 00 6c 00 6b       	add    BYTE PTR ss:[eax+eax*1+0x6b],ch
  401a19:	00 37                	add    BYTE PTR [edi],dh
  401a1b:	00 6e 00             	add    BYTE PTR [esi+0x0],ch
  401a1e:	38 00                	cmp    BYTE PTR [eax],al
  401a20:	52                   	push   edx
  401a21:	00 67 00             	add    BYTE PTR [edi+0x0],ah
  401a24:	32 00                	xor    al,BYTE PTR [eax]
  401a26:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401a27:	00 76 00             	add    BYTE PTR [esi+0x0],dh
  401a2a:	63 00                	arpl   WORD PTR [eax],eax
  401a2c:	6e                   	outs   dx,BYTE PTR ds:[esi]
  401a2d:	00 73 00             	add    BYTE PTR [ebx+0x0],dh
  401a30:	36 00 61 00          	add    BYTE PTR ss:[ecx+0x0],ah
  401a34:	37                   	aaa
  401a35:	00 6b 00             	add    BYTE PTR [ebx+0x0],ch
  401a38:	53                   	push   ebx
  401a39:	00 6c 00 6b          	add    BYTE PTR [eax+eax*1+0x6b],ch
  401a3d:	00 30                	add    BYTE PTR [eax],dh
  401a3f:	00 39                	add    BYTE PTR [ecx],bh
  401a41:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
  401a44:	73 00                	jae    0x401a46
  401a46:	68 00 34 00 64       	push   0x64003400
  401a4b:	00 67 00             	add    BYTE PTR [edi+0x0],ah
  401a4e:	33 00                	xor    eax,DWORD PTR [eax]
  401a50:	33 00                	xor    eax,DWORD PTR [eax]
  401a52:	31 00                	xor    DWORD PTR [eax],eax
  401a54:	32 00                	xor    al,BYTE PTR [eax]
  401a56:	64 00 6b 00          	add    BYTE PTR fs:[ebx+0x0],ch
  401a5a:	6c                   	ins    BYTE PTR es:[edi],dx
  401a5b:	00 66 00             	add    BYTE PTR [esi+0x0],ah
  401a5e:	76 00                	jbe    0x401a60
  401a60:	e6 00                	out    0x0,al
  401a62:	6b 00 6a             	imul   eax,DWORD PTR [eax],0x6a
  401a65:	00 67 00             	add    BYTE PTR [edi+0x0],ah
  401a68:	e6 00                	out    0x0,al
  401a6a:	68 00 34 00 33       	push   0x33003400
  401a6f:	00 35 00 36 00 e6    	add    BYTE PTR ds:0xe6003600,dh
  401a75:	00 6c 00 6b          	add    BYTE PTR [eax+eax*1+0x6b],ch
  401a79:	00 61 00             	add    BYTE PTR [ecx+0x0],ah
  401a7c:	73 00                	jae    0x401a7e
  401a7e:	64 00 66 00          	add    BYTE PTR fs:[esi+0x0],ah
  401a82:	66 00 63 00          	data16 add BYTE PTR [ebx+0x0],ah
  401a86:	31 00                	xor    DWORD PTR [eax],eax
  401a88:	74 00                	je     0x401a8a
  401a8a:	67 00 35             	add    BYTE PTR [di],dh
  401a8d:	00 00                	add    BYTE PTR [eax],al
  401a8f:	00 80 00 00 00 44    	add    BYTE PTR [eax+0x44000000],al
  401a95:	00 46 00             	add    BYTE PTR [esi+0x0],al
  401a98:	47                   	inc    edi
  401a99:	00 4b 00             	add    BYTE PTR [ebx+0x0],cl
  401a9c:	48                   	dec    eax
  401a9d:	00 4a 00             	add    BYTE PTR [edx+0x0],cl
  401aa0:	34 00                	xor    al,0x0
  401aa2:	35 00 54 00 44       	xor    eax,0x44005400
  401aa7:	00 4c 00 4b          	add    BYTE PTR [eax+eax*1+0x4b],cl
  401aab:	00 44 00 53          	add    BYTE PTR [eax+eax*1+0x53],al
  401aaf:	00 46 00             	add    BYTE PTR [esi+0x0],al
  401ab2:	56                   	push   esi
  401ab3:	00 4c 00 4b          	add    BYTE PTR [eax+eax*1+0x4b],cl
  401ab7:	00 32                	add    BYTE PTR [edx],dh
  401ab9:	00 33                	add    BYTE PTR [ebx],dh
  401abb:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
  401abe:	52                   	push   edx
  401abf:	00 54 00 30          	add    BYTE PTR [eax+eax*1+0x30],dl
  401ac3:	00 39                	add    BYTE PTR [ecx],bh
  401ac5:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
  401ac8:	57                   	push   edi
  401ac9:	00 43 00             	add    BYTE PTR [ebx+0x0],al
  401acc:	46                   	inc    esi
  401acd:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  401ad0:	4f                   	dec    edi
  401ad1:	00 4d 00             	add    BYTE PTR [ebp+0x0],cl
  401ad4:	47                   	inc    edi
  401ad5:	00 42 00             	add    BYTE PTR [edx+0x0],al
  401ad8:	48                   	dec    eax
  401ad9:	00 36                	add    BYTE PTR [esi],dh
  401adb:	00 39                	add    BYTE PTR [ecx],bh
  401add:	00 38                	add    BYTE PTR [eax],bh
  401adf:	00 55 00             	add    BYTE PTR [ebp+0x0],dl
  401ae2:	47                   	inc    edi
  401ae3:	00 53 00             	add    BYTE PTR [ebx+0x0],dl
  401ae6:	45                   	inc    ebp
  401ae7:	00 4f 00             	add    BYTE PTR [edi+0x0],cl
  401aea:	49                   	dec    ecx
  401aeb:	00 56 00             	add    BYTE PTR [esi+0x0],dl
  401aee:	4e                   	dec    esi
  401aef:	00 2d 00 35 00 4e    	add    BYTE PTR ds:0x4e003500,ch
  401af5:	00 56 00             	add    BYTE PTR [esi+0x0],dl
  401af8:	45                   	inc    ebp
  401af9:	00 57 00             	add    BYTE PTR [edi+0x0],dl
  401afc:	54                   	push   esp
  401afd:	00 4f 00             	add    BYTE PTR [edi+0x0],cl
  401b00:	38 00                	cmp    BYTE PTR [eax],al
  401b02:	34 00                	xor    al,0x0
  401b04:	35 00 56 00 4b       	xor    eax,0x4b005600
  401b09:	00 4a 00             	add    BYTE PTR [edx+0x0],cl
  401b0c:	4c                   	dec    esp
  401b0d:	00 4c 00 4b          	add    BYTE PTR [eax+eax*1+0x4b],cl
  401b11:	00 4e 00             	add    BYTE PTR [esi+0x0],cl
  401b14:	00 00                	add    BYTE PTR [eax],al
  401b16:	00 00                	add    BYTE PTR [eax],al
  401b18:	e1 4e                	loope  0x401b68
  401b1a:	ad                   	lods   eax,DWORD PTR ds:[esi]
  401b1b:	33 99 66 cf 11 b7    	xor    ebx,DWORD PTR [ecx-0x48ee309a]
  401b21:	0c 00                	or     al,0x0
  401b23:	aa                   	stos   BYTE PTR es:[edi],al
  401b24:	00 60 d3             	add    BYTE PTR [eax-0x2d],ah
  401b27:	93                   	xchg   ebx,eax
  401b28:	02 00                	add    al,BYTE PTR [eax]
  401b2a:	00 00                	add    BYTE PTR [eax],al
  401b2c:	2d 00 00 00 10       	sub    eax,0x10000000
  401b31:	00 00                	add    BYTE PTR [eax],al
  401b33:	00 43 00             	add    BYTE PTR [ebx+0x0],al
  401b36:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401b37:	00 6e 00             	add    BYTE PTR [esi+0x0],ch
  401b3a:	74 00                	je     0x401b3c
  401b3c:	61                   	popa
  401b3d:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
  401b40:	74 00                	je     0x401b42
  401b42:	3a 00                	cmp    al,BYTE PTR [eax]
  401b44:	00 00                	add    BYTE PTR [eax],al
  401b46:	00 00                	add    BYTE PTR [eax],al
  401b48:	f1                   	int1
  401b49:	4e                   	dec    esi
  401b4a:	ad                   	lods   eax,DWORD PTR ds:[esi]
  401b4b:	33 99 66 cf 11 b7    	xor    ebx,DWORD PTR [ecx-0x48ee309a]
  401b51:	0c 00                	or     al,0x0
  401b53:	aa                   	stos   BYTE PTR es:[edi],al
  401b54:	00 60 d3             	add    BYTE PTR [eax-0x2d],ah
  401b57:	93                   	xchg   ebx,eax
  401b58:	26 00 00             	add    BYTE PTR es:[eax],al
  401b5b:	00 42 00             	add    BYTE PTR [edx+0x0],al
  401b5e:	75 00                	jne    0x401b60
  401b60:	4c                   	dec    esp
  401b61:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
  401b64:	4c                   	dec    esp
  401b65:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
  401b68:	54                   	push   esp
  401b69:	00 40 00             	add    BYTE PTR [eax+0x0],al
  401b6c:	68 00 6f 00 74       	push   0x74006f00
  401b71:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
  401b74:	61                   	popa
  401b75:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
  401b78:	6c                   	ins    BYTE PTR es:[edi],dx
  401b79:	00 2e                	add    BYTE PTR [esi],ch
  401b7b:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
  401b7e:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401b7f:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
  401b82:	00 00                	add    BYTE PTR [eax],al
  401b84:	0c 00                	or     al,0x0
  401b86:	00 00                	add    BYTE PTR [eax],al
  401b88:	56                   	push   esi
  401b89:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
  401b8c:	72 00                	jb     0x401b8e
  401b8e:	69 00 66 00 79 00    	imul   eax,DWORD PTR [eax],0x790066
  401b94:	00 00                	add    BYTE PTR [eax],al
  401b96:	00 00                	add    BYTE PTR [eax],al
  401b98:	32 00                	xor    al,BYTE PTR [eax]
  401b9a:	00 00                	add    BYTE PTR [eax],al
  401b9c:	4e                   	dec    esi
  401b9d:	00 6f 00             	add    BYTE PTR [edi+0x0],ch
  401ba0:	70 00                	jo     0x401ba2
  401ba2:	65 00 2e             	add    BYTE PTR gs:[esi],ch
  401ba5:	00 20                	add    BYTE PTR [eax],ah
  401ba7:	00 54 00 68          	add    BYTE PTR [eax+eax*1+0x68],dl
  401bab:	00 61 00             	add    BYTE PTR [ecx+0x0],ah
  401bae:	74 00                	je     0x401bb0
  401bb0:	27                   	daa
  401bb1:	00 73 00             	add    BYTE PTR [ebx+0x0],dh
  401bb4:	20 00                	and    BYTE PTR [eax],al
  401bb6:	6e                   	outs   dx,BYTE PTR ds:[esi]
  401bb7:	00 6f 00             	add    BYTE PTR [edi+0x0],ch
  401bba:	74 00                	je     0x401bbc
  401bbc:	20 00                	and    BYTE PTR [eax],al
  401bbe:	74 00                	je     0x401bc0
  401bc0:	68 00 65 00 20       	push   0x20006500
  401bc5:	00 6f 00             	add    BYTE PTR [edi+0x0],ch
  401bc8:	6e                   	outs   dx,BYTE PTR ds:[esi]
  401bc9:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
  401bcc:	21 00                	and    DWORD PTR [eax],eax
  401bce:	00 00                	add    BYTE PTR [eax],al
  401bd0:	5f                   	pop    edi
  401bd1:	5f                   	pop    edi
  401bd2:	76 62                	jbe    0x401c36
  401bd4:	61                   	popa
  401bd5:	46                   	inc    esi
  401bd6:	72 65                	jb     0x401c3d
  401bd8:	65 56                	gs push esi
  401bda:	61                   	popa
  401bdb:	72 4c                	jb     0x401c29
  401bdd:	69 73 74 00 00 00 00 	imul   esi,DWORD PTR [ebx+0x74],0x0
  401be4:	5f                   	pop    edi
  401be5:	5f                   	pop    edi
  401be6:	76 62                	jbe    0x401c4a
  401be8:	61                   	popa
  401be9:	46                   	inc    esi
  401bea:	72 65                	jb     0x401c51
  401bec:	65 4f                	gs dec edi
  401bee:	62 6a 00             	bound  ebp,QWORD PTR [edx+0x0]
  401bf1:	00 00                	add    BYTE PTR [eax],al
  401bf3:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
  401bf6:	76 62                	jbe    0x401c5a
  401bf8:	61                   	popa
  401bf9:	56                   	push   esi
  401bfa:	61                   	popa
  401bfb:	72 41                	jb     0x401c3e
  401bfd:	64 64 00 5f 5f       	fs add BYTE PTR fs:[edi+0x5f],bl
  401c02:	76 62                	jbe    0x401c66
  401c04:	61                   	popa
  401c05:	48                   	dec    eax
  401c06:	72 65                	jb     0x401c6d
  401c08:	73 75                	jae    0x401c7f
  401c0a:	6c                   	ins    BYTE PTR es:[edi],dx
  401c0b:	74 43                	je     0x401c50
  401c0d:	68 65 63 6b 4f       	push   0x4f6b6365
  401c12:	62 6a 00             	bound  ebp,QWORD PTR [edx+0x0]
  401c15:	00 00                	add    BYTE PTR [eax],al
  401c17:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
  401c1a:	76 62                	jbe    0x401c7e
  401c1c:	61                   	popa
  401c1d:	4f                   	dec    edi
  401c1e:	62 6a 53             	bound  ebp,QWORD PTR [edx+0x53]
  401c21:	65 74 00             	gs je  0x401c24
  401c24:	5f                   	pop    edi
  401c25:	5f                   	pop    edi
  401c26:	76 62                	jbe    0x401c8a
  401c28:	61                   	popa
  401c29:	56                   	push   esi
  401c2a:	61                   	popa
  401c2b:	72 54                	jb     0x401c81
  401c2d:	73 74                	jae    0x401ca3
  401c2f:	45                   	inc    ebp
  401c30:	71 00                	jno    0x401c32
  401c32:	00 00                	add    BYTE PTR [eax],al
  401c34:	5f                   	pop    edi
  401c35:	5f                   	pop    edi
  401c36:	76 62                	jbe    0x401c9a
  401c38:	61                   	popa
  401c39:	46                   	inc    esi
  401c3a:	72 65                	jb     0x401ca1
  401c3c:	65 56                	gs push esi
  401c3e:	61                   	popa
  401c3f:	72 00                	jb     0x401c41
  401c41:	00 00                	add    BYTE PTR [eax],al
  401c43:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
  401c46:	76 62                	jbe    0x401caa
  401c48:	61                   	popa
  401c49:	56                   	push   esi
  401c4a:	61                   	popa
  401c4b:	72 4d                	jb     0x401c9a
  401c4d:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401c4e:	76 65                	jbe    0x401cb5
  401c50:	00 00                	add    BYTE PTR [eax],al
  401c52:	00 00                	add    BYTE PTR [eax],al
  401c54:	5f                   	pop    edi
  401c55:	5f                   	pop    edi
  401c56:	76 62                	jbe    0x401cba
  401c58:	61                   	popa
  401c59:	56                   	push   esi
  401c5a:	61                   	popa
  401c5b:	72 43                	jb     0x401ca0
  401c5d:	6f                   	outs   dx,DWORD PTR ds:[esi]
  401c5e:	70 79                	jo     0x401cd9
  401c60:	00 00                	add    BYTE PTR [eax],al
  401c62:	00 00                	add    BYTE PTR [eax],al
  401c64:	90                   	nop
  401c65:	1c 40                	sbb    al,0x40
  401c67:	00 6c 1c 40          	add    BYTE PTR [esp+ebx*1+0x40],ch
  401c6b:	00 00                	add    BYTE PTR [eax],al
  401c6d:	00 f8                	add    al,bh
  401c6f:	06                   	push   es
  401c70:	0c 00                	or     al,0x0
	...
  401c7a:	03 60 64             	add    esp,DWORD PTR [eax+0x64]
  401c7d:	1c 40                	sbb    al,0x40
	...
  401c8b:	00 1e                	add    BYTE PTR [esi],bl
  401c8d:	00 00                	add    BYTE PTR [eax],al
  401c8f:	00 00                	add    BYTE PTR [eax],al
  401c91:	00 00                	add    BYTE PTR [eax],al
  401c93:	00 d8                	add    al,bl
  401c95:	15 40 00 ff ff       	adc    eax,0xffff0040
  401c9a:	ff                   	(bad)
  401c9b:	ff 00                	inc    DWORD PTR [eax]
	...
  401ca5:	00 00                	add    BYTE PTR [eax],al
  401ca7:	00 68 1c             	add    BYTE PTR [eax+0x1c],ch
  401caa:	40                   	inc    eax
  401cab:	00 00                	add    BYTE PTR [eax],al
  401cad:	00 00                	add    BYTE PTR [eax],al
  401caf:	00 64 1c 40          	add    BYTE PTR [esp+ebx*1+0x40],ah
  401cb3:	00 64 1c 40          	add    BYTE PTR [esp+ebx*1+0x40],ah
  401cb7:	00 64 1c 40          	add    BYTE PTR [esp+ebx*1+0x40],ah
	...
  401cc7:	00 48 00             	add    BYTE PTR [eax+0x0],cl
  401cca:	00 00                	add    BYTE PTR [eax],al
  401ccc:	04 00                	add    al,0x0
  401cce:	00 00                	add    BYTE PTR [eax],al
  401cd0:	00 00                	add    BYTE PTR [eax],al
  401cd2:	00 00                	add    BYTE PTR [eax],al
  401cd4:	48                   	dec    eax
  401cd5:	18 40 00             	sbb    BYTE PTR [eax+0x0],al
  401cd8:	ff                   	(bad)
  401cd9:	ff                   	(bad)
  401cda:	ff                   	(bad)
  401cdb:	ff 00                	inc    DWORD PTR [eax]
  401cdd:	00 00                	add    BYTE PTR [eax],al
  401cdf:	00 64 1c 40          	add    BYTE PTR [esp+ebx*1+0x40],ah
	...
  401cef:	00 ff                	add    bh,bh
  401cf1:	ff                   	(bad)
  401cf2:	ff                   	(bad)
  401cf3:	ff 00                	inc    DWORD PTR [eax]
  401cf5:	00 00                	add    BYTE PTR [eax],al
  401cf7:	00 6c 19 40          	add    BYTE PTR [ecx+ebx*1+0x40],ch
  401cfb:	00 24 19             	add    BYTE PTR [ecx+ebx*1],ah
  401cfe:	40                   	inc    eax
  401cff:	00 d4                	add    ah,dl
  401d01:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
  401d04:	6c                   	ins    BYTE PTR es:[edi],dx
  401d05:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  401d08:	94                   	xchg   esp,eax
  401d09:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  401d0c:	d8 32                	fdiv   DWORD PTR [edx]
  401d0e:	40                   	inc    eax
  401d0f:	00 6c 19 40          	add    BYTE PTR [ecx+ebx*1+0x40],ch
  401d13:	00 b0 19 40 00 dc    	add    BYTE PTR [eax-0x23ffbfe7],dh
  401d19:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
  401d1c:	cc                   	int3
  401d1d:	cc                   	int3
  401d1e:	cc                   	int3
  401d1f:	cc                   	int3
  401d20:	e9 e9 e9 e9 55       	jmp    0x562a070e
  401d25:	8b ec                	mov    ebp,esp
  401d27:	83 ec 0c             	sub    esp,0xc
  401d2a:	68 16 10 40 00       	push   0x401016
  401d2f:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401d35:	50                   	push   eax
  401d36:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  401d3d:	81 ec 34 01 00 00    	sub    esp,0x134
  401d43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401d46:	83 65 08 fe          	and    DWORD PTR [ebp+0x8],0xfffffffe
  401d4a:	83 e0 01             	and    eax,0x1
  401d4d:	c7 45 f8 00 10 40 00 	mov    DWORD PTR [ebp-0x8],0x401000
  401d54:	53                   	push   ebx
  401d55:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  401d58:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401d5b:	56                   	push   esi
  401d5c:	57                   	push   edi
  401d5d:	8b 18                	mov    ebx,DWORD PTR [eax]
  401d5f:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  401d62:	50                   	push   eax
  401d63:	ff 53 04             	call   DWORD PTR [ebx+0x4]
  401d66:	6a 08                	push   0x8
  401d68:	33 ff                	xor    edi,edi
  401d6a:	5e                   	pop    esi
  401d6b:	89 bd d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],edi
  401d71:	8d 95 d4 fe ff ff    	lea    edx,[ebp-0x12c]
  401d77:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  401d7a:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  401d7d:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  401d80:	89 7d bc             	mov    DWORD PTR [ebp-0x44],edi
  401d83:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  401d86:	89 7d 9c             	mov    DWORD PTR [ebp-0x64],edi
  401d89:	89 7d 8c             	mov    DWORD PTR [ebp-0x74],edi
  401d8c:	89 bd 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],edi
  401d92:	89 bd 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],edi
  401d98:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  401d9e:	89 bd 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],edi
  401da4:	89 bd 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],edi
  401daa:	89 bd 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],edi
  401db0:	89 bd 34 ff ff ff    	mov    DWORD PTR [ebp-0xcc],edi
  401db6:	89 bd 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],edi
  401dbc:	89 bd 14 ff ff ff    	mov    DWORD PTR [ebp-0xec],edi
  401dc2:	89 bd 04 ff ff ff    	mov    DWORD PTR [ebp-0xfc],edi
  401dc8:	89 bd f4 fe ff ff    	mov    DWORD PTR [ebp-0x10c],edi
  401dce:	89 bd e4 fe ff ff    	mov    DWORD PTR [ebp-0x11c],edi
  401dd4:	c7 85 dc fe ff ff 04 	mov    DWORD PTR [ebp-0x124],0x401a04
  401ddb:	1a 40 00 
  401dde:	89 b5 d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],esi
  401de4:	e8 f3 f2 ff ff       	call   0x4010dc
  401de9:	8d 95 d4 fe ff ff    	lea    edx,[ebp-0x12c]
  401def:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  401df5:	c7 85 dc fe ff ff 94 	mov    DWORD PTR [ebp-0x124],0x401a94
  401dfc:	1a 40 00 
  401dff:	89 b5 d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],esi
  401e05:	e8 d2 f2 ff ff       	call   0x4010dc
  401e0a:	6a 02                	push   0x2
  401e0c:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401e12:	5e                   	pop    esi
  401e13:	c7 85 5c ff ff ff 04 	mov    DWORD PTR [ebp-0xa4],0x4
  401e1a:	00 00 00 
  401e1d:	50                   	push   eax
  401e1e:	8d 45 9c             	lea    eax,[ebp-0x64]
  401e21:	56                   	push   esi
  401e22:	50                   	push   eax
  401e23:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401e29:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401e2f:	50                   	push   eax
  401e30:	e8 9b f2 ff ff       	call   0x4010d0
  401e35:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401e3b:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  401e3e:	e8 93 f2 ff ff       	call   0x4010d6
  401e43:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401e49:	e8 7c f2 ff ff       	call   0x4010ca
  401e4e:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401e54:	c7 85 5c ff ff ff 05 	mov    DWORD PTR [ebp-0xa4],0x5
  401e5b:	00 00 00 
  401e5e:	50                   	push   eax
  401e5f:	8d 45 9c             	lea    eax,[ebp-0x64]
  401e62:	6a 0c                	push   0xc
  401e64:	50                   	push   eax
  401e65:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401e6b:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401e71:	50                   	push   eax
  401e72:	e8 59 f2 ff ff       	call   0x4010d0
  401e77:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401e7d:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  401e83:	e8 4e f2 ff ff       	call   0x4010d6
  401e88:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401e8e:	e8 37 f2 ff ff       	call   0x4010ca
  401e93:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401e99:	c7 85 5c ff ff ff 06 	mov    DWORD PTR [ebp-0xa4],0x6
  401ea0:	00 00 00 
  401ea3:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401ea9:	50                   	push   eax
  401eaa:	8d 45 9c             	lea    eax,[ebp-0x64]
  401ead:	6a 17                	push   0x17
  401eaf:	50                   	push   eax
  401eb0:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401eb6:	50                   	push   eax
  401eb7:	e8 14 f2 ff ff       	call   0x4010d0
  401ebc:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401ec2:	8d 4d dc             	lea    ecx,[ebp-0x24]
  401ec5:	e8 0c f2 ff ff       	call   0x4010d6
  401eca:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401ed0:	e8 f5 f1 ff ff       	call   0x4010ca
  401ed5:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401edb:	c7 85 5c ff ff ff 03 	mov    DWORD PTR [ebp-0xa4],0x3
  401ee2:	00 00 00 
  401ee5:	50                   	push   eax
  401ee6:	8d 45 9c             	lea    eax,[ebp-0x64]
  401ee9:	6a 25                	push   0x25
  401eeb:	50                   	push   eax
  401eec:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401ef2:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401ef8:	50                   	push   eax
  401ef9:	e8 d2 f1 ff ff       	call   0x4010d0
  401efe:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401f04:	8d 4d cc             	lea    ecx,[ebp-0x34]
  401f07:	e8 ca f1 ff ff       	call   0x4010d6
  401f0c:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401f12:	e8 b3 f1 ff ff       	call   0x4010ca
  401f17:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401f1d:	c7 85 5c ff ff ff 03 	mov    DWORD PTR [ebp-0xa4],0x3
  401f24:	00 00 00 
  401f27:	50                   	push   eax
  401f28:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  401f2e:	6a 05                	push   0x5
  401f30:	50                   	push   eax
  401f31:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401f37:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401f3d:	50                   	push   eax
  401f3e:	e8 8d f1 ff ff       	call   0x4010d0
  401f43:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401f49:	8d 4d bc             	lea    ecx,[ebp-0x44]
  401f4c:	e8 85 f1 ff ff       	call   0x4010d6
  401f51:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401f57:	e8 6e f1 ff ff       	call   0x4010ca
  401f5c:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  401f62:	c7 85 5c ff ff ff 05 	mov    DWORD PTR [ebp-0xa4],0x5
  401f69:	00 00 00 
  401f6c:	50                   	push   eax
  401f6d:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  401f73:	6a 17                	push   0x17
  401f75:	50                   	push   eax
  401f76:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  401f7c:	89 b5 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],esi
  401f82:	50                   	push   eax
  401f83:	e8 48 f1 ff ff       	call   0x4010d0
  401f88:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  401f8e:	8d 4d ac             	lea    ecx,[ebp-0x54]
  401f91:	e8 40 f1 ff ff       	call   0x4010d6
  401f96:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  401f9c:	e8 29 f1 ff ff       	call   0x4010ca
  401fa1:	8b 83 00 03 00 00    	mov    eax,DWORD PTR [ebx+0x300]
  401fa7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401faa:	89 85 b8 fe ff ff    	mov    DWORD PTR [ebp-0x148],eax
  401fb0:	ff d0                	call   eax
  401fb2:	50                   	push   eax
  401fb3:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  401fb9:	50                   	push   eax
  401fba:	e8 ff f0 ff ff       	call   0x4010be
  401fbf:	8b f0                	mov    esi,eax
  401fc1:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  401fc7:	51                   	push   ecx
  401fc8:	56                   	push   esi
  401fc9:	8b 06                	mov    eax,DWORD PTR [esi]
  401fcb:	ff 90 a0 00 00 00    	call   DWORD PTR [eax+0xa0]
  401fd1:	3b c7                	cmp    eax,edi
  401fd3:	7d 11                	jge    0x401fe6
  401fd5:	68 a0 00 00 00       	push   0xa0
  401fda:	68 18 1b 40 00       	push   0x401b18
  401fdf:	56                   	push   esi
  401fe0:	50                   	push   eax
  401fe1:	e8 d2 f0 ff ff       	call   0x4010b8
  401fe6:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
  401fec:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  401ff2:	89 85 fc fe ff ff    	mov    DWORD PTR [ebp-0x104],eax
  401ff8:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
  401ffe:	50                   	push   eax
  401fff:	8d 45 8c             	lea    eax,[ebp-0x74]
  402002:	50                   	push   eax
  402003:	8d 45 bc             	lea    eax,[ebp-0x44]
  402006:	50                   	push   eax
  402007:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  40200d:	50                   	push   eax
  40200e:	c7 85 f4 fe ff ff 08 	mov    DWORD PTR [ebp-0x10c],0x8008
  402015:	80 00 00 
  402018:	c7 85 dc fe ff ff 2c 	mov    DWORD PTR [ebp-0x124],0x401b2c
  40201f:	1b 40 00 
  402022:	c7 85 d4 fe ff ff 08 	mov    DWORD PTR [ebp-0x12c],0x8
  402029:	00 00 00 
  40202c:	e8 81 f0 ff ff       	call   0x4010b2
  402031:	50                   	push   eax
  402032:	8d 85 d4 fe ff ff    	lea    eax,[ebp-0x12c]
  402038:	50                   	push   eax
  402039:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  40203f:	50                   	push   eax
  402040:	e8 6d f0 ff ff       	call   0x4010b2
  402045:	50                   	push   eax
  402046:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
  40204c:	50                   	push   eax
  40204d:	8d 85 34 ff ff ff    	lea    eax,[ebp-0xcc]
  402053:	50                   	push   eax
  402054:	e8 59 f0 ff ff       	call   0x4010b2
  402059:	50                   	push   eax
  40205a:	8d 45 ac             	lea    eax,[ebp-0x54]
  40205d:	50                   	push   eax
  40205e:	8d 85 24 ff ff ff    	lea    eax,[ebp-0xdc]
  402064:	50                   	push   eax
  402065:	e8 48 f0 ff ff       	call   0x4010b2
  40206a:	50                   	push   eax
  40206b:	8d 45 dc             	lea    eax,[ebp-0x24]
  40206e:	50                   	push   eax
  40206f:	8d 85 14 ff ff ff    	lea    eax,[ebp-0xec]
  402075:	50                   	push   eax
  402076:	e8 37 f0 ff ff       	call   0x4010b2
  40207b:	50                   	push   eax
  40207c:	8d 45 cc             	lea    eax,[ebp-0x34]
  40207f:	50                   	push   eax
  402080:	8d 85 04 ff ff ff    	lea    eax,[ebp-0xfc]
  402086:	50                   	push   eax
  402087:	e8 26 f0 ff ff       	call   0x4010b2
  40208c:	50                   	push   eax
  40208d:	e8 32 f0 ff ff       	call   0x4010c4
  402092:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  402098:	8b f0                	mov    esi,eax
  40209a:	e8 0d f0 ff ff       	call   0x4010ac
  40209f:	8d 85 04 ff ff ff    	lea    eax,[ebp-0xfc]
  4020a5:	50                   	push   eax
  4020a6:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
  4020ac:	50                   	push   eax
  4020ad:	8d 85 14 ff ff ff    	lea    eax,[ebp-0xec]
  4020b3:	50                   	push   eax
  4020b4:	8d 85 24 ff ff ff    	lea    eax,[ebp-0xdc]
  4020ba:	50                   	push   eax
  4020bb:	8d 85 34 ff ff ff    	lea    eax,[ebp-0xcc]
  4020c1:	50                   	push   eax
  4020c2:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  4020c8:	50                   	push   eax
  4020c9:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  4020cf:	50                   	push   eax
  4020d0:	6a 07                	push   0x7
  4020d2:	e8 cf ef ff ff       	call   0x4010a6
  4020d7:	83 c4 20             	add    esp,0x20
  4020da:	66 3b f7             	cmp    si,di
  4020dd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4020e0:	74 5e                	je     0x402140
  4020e2:	ff 93 fc 02 00 00    	call   DWORD PTR [ebx+0x2fc]
  4020e8:	50                   	push   eax
  4020e9:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  4020ef:	50                   	push   eax
  4020f0:	e8 c9 ef ff ff       	call   0x4010be
  4020f5:	8b f0                	mov    esi,eax
  4020f7:	68 34 1b 40 00       	push   0x401b34
  4020fc:	56                   	push   esi
  4020fd:	8b 06                	mov    eax,DWORD PTR [esi]
  4020ff:	ff 50 54             	call   DWORD PTR [eax+0x54]
  402102:	3b c7                	cmp    eax,edi
  402104:	7d 0e                	jge    0x402114
  402106:	6a 54                	push   0x54
  402108:	68 48 1b 40 00       	push   0x401b48
  40210d:	56                   	push   esi
  40210e:	50                   	push   eax
  40210f:	e8 a4 ef ff ff       	call   0x4010b8
  402114:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  40211a:	e8 8d ef ff ff       	call   0x4010ac
  40211f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402122:	ff 95 b8 fe ff ff    	call   DWORD PTR [ebp-0x148]
  402128:	50                   	push   eax
  402129:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  40212f:	50                   	push   eax
  402130:	e8 89 ef ff ff       	call   0x4010be
  402135:	8b f0                	mov    esi,eax
  402137:	68 5c 1b 40 00       	push   0x401b5c
  40213c:	8b 06                	mov    eax,DWORD PTR [esi]
  40213e:	eb 5c                	jmp    0x40219c
  402140:	ff 93 fc 02 00 00    	call   DWORD PTR [ebx+0x2fc]
  402146:	50                   	push   eax
  402147:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  40214d:	50                   	push   eax
  40214e:	e8 6b ef ff ff       	call   0x4010be
  402153:	8b f0                	mov    esi,eax
  402155:	68 88 1b 40 00       	push   0x401b88
  40215a:	56                   	push   esi
  40215b:	8b 06                	mov    eax,DWORD PTR [esi]
  40215d:	ff 50 54             	call   DWORD PTR [eax+0x54]
  402160:	3b c7                	cmp    eax,edi
  402162:	7d 0e                	jge    0x402172
  402164:	6a 54                	push   0x54
  402166:	68 48 1b 40 00       	push   0x401b48
  40216b:	56                   	push   esi
  40216c:	50                   	push   eax
  40216d:	e8 46 ef ff ff       	call   0x4010b8
  402172:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  402178:	e8 2f ef ff ff       	call   0x4010ac
  40217d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  402180:	ff 95 b8 fe ff ff    	call   DWORD PTR [ebp-0x148]
  402186:	50                   	push   eax
  402187:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  40218d:	50                   	push   eax
  40218e:	e8 2b ef ff ff       	call   0x4010be
  402193:	8b f0                	mov    esi,eax
  402195:	68 9c 1b 40 00       	push   0x401b9c
  40219a:	8b 06                	mov    eax,DWORD PTR [esi]
  40219c:	56                   	push   esi
  40219d:	ff 90 a4 00 00 00    	call   DWORD PTR [eax+0xa4]
  4021a3:	3b c7                	cmp    eax,edi
  4021a5:	7d 11                	jge    0x4021b8
  4021a7:	68 a4 00 00 00       	push   0xa4
  4021ac:	68 18 1b 40 00       	push   0x401b18
  4021b1:	56                   	push   esi
  4021b2:	50                   	push   eax
  4021b3:	e8 00 ef ff ff       	call   0x4010b8
  4021b8:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  4021be:	e8 e9 ee ff ff       	call   0x4010ac
  4021c3:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
  4021c6:	68 6d 22 40 00       	push   0x40226d
  4021cb:	eb 59                	jmp    0x402226
  4021cd:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4021d3:	e8 c8 ee ff ff       	call   0x4010a0
  4021d8:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  4021de:	e8 c9 ee ff ff       	call   0x4010ac
  4021e3:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  4021e9:	50                   	push   eax
  4021ea:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
  4021f0:	50                   	push   eax
  4021f1:	8d 85 04 ff ff ff    	lea    eax,[ebp-0xfc]
  4021f7:	50                   	push   eax
  4021f8:	8d 85 14 ff ff ff    	lea    eax,[ebp-0xec]
  4021fe:	50                   	push   eax
  4021ff:	8d 85 24 ff ff ff    	lea    eax,[ebp-0xdc]
  402205:	50                   	push   eax
  402206:	8d 85 34 ff ff ff    	lea    eax,[ebp-0xcc]
  40220c:	50                   	push   eax
  40220d:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  402213:	50                   	push   eax
  402214:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  40221a:	50                   	push   eax
  40221b:	6a 08                	push   0x8
  40221d:	e8 84 ee ff ff       	call   0x4010a6
  402222:	83 c4 24             	add    esp,0x24
  402225:	c3                   	ret
  402226:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402229:	e8 9c ee ff ff       	call   0x4010ca
  40222e:	8d 4d cc             	lea    ecx,[ebp-0x34]
  402231:	e8 94 ee ff ff       	call   0x4010ca
  402236:	8d 4d bc             	lea    ecx,[ebp-0x44]
  402239:	e8 8c ee ff ff       	call   0x4010ca
  40223e:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402241:	e8 84 ee ff ff       	call   0x4010ca
  402246:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  402249:	e8 7c ee ff ff       	call   0x4010ca
  40224e:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  402251:	e8 74 ee ff ff       	call   0x4010ca
  402256:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  40225c:	e8 69 ee ff ff       	call   0x4010ca
  402261:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  402267:	e9 5e ee ff ff       	jmp    0x4010ca
  40226c:	c3                   	ret
  40226d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  402270:	50                   	push   eax
  402271:	8b 08                	mov    ecx,DWORD PTR [eax]
  402273:	ff 51 08             	call   DWORD PTR [ecx+0x8]
  402276:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  402279:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  40227c:	5f                   	pop    edi
  40227d:	5e                   	pop    esi
  40227e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402285:	5b                   	pop    ebx
  402286:	c9                   	leave
  402287:	c2 04 00             	ret    0x4
  40228a:	cc                   	int3
  40228b:	cc                   	int3
  40228c:	cc                   	int3
  40228d:	cc                   	int3
  40228e:	cc                   	int3
  40228f:	cc                   	int3
  402290:	9e                   	sahf
  402291:	9e                   	sahf
  402292:	9e                   	sahf
  402293:	9e                   	sahf
