
orbital:     file format binary


Disassembly of section .data:

0000000000001000 <.data+0x1000>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 0x3fe8
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     0x1016
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret
    101b:	00 00                	add    BYTE PTR [rax],al
    101d:	00 00                	add    BYTE PTR [rax],al
    101f:	00 ff                	add    bh,bh
    1021:	35 7a 2f 00 00       	xor    eax,0x2f7a
    1026:	ff 25 7c 2f 00 00    	jmp    QWORD PTR [rip+0x2f7c]        # 0x3fa8
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   0x0
    1039:	e9 e2 ff ff ff       	jmp    0x1020
    103e:	66 90                	xchg   ax,ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   0x1
    1049:	e9 d2 ff ff ff       	jmp    0x1020
    104e:	66 90                	xchg   ax,ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   0x2
    1059:	e9 c2 ff ff ff       	jmp    0x1020
    105e:	66 90                	xchg   ax,ax
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   0x3
    1069:	e9 b2 ff ff ff       	jmp    0x1020
    106e:	66 90                	xchg   ax,ax
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   0x4
    1079:	e9 a2 ff ff ff       	jmp    0x1020
    107e:	66 90                	xchg   ax,ax
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 6e 2f 00 00    	jmp    QWORD PTR [rip+0x2f6e]        # 0x3ff8
    108a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 16 2f 00 00    	jmp    QWORD PTR [rip+0x2f16]        # 0x3fb0
    109a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	ff 25 0e 2f 00 00    	jmp    QWORD PTR [rip+0x2f0e]        # 0x3fb8
    10aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	ff 25 06 2f 00 00    	jmp    QWORD PTR [rip+0x2f06]        # 0x3fc0
    10ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	ff 25 fe 2e 00 00    	jmp    QWORD PTR [rip+0x2efe]        # 0x3fc8
    10ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	ff 25 f6 2e 00 00    	jmp    QWORD PTR [rip+0x2ef6]        # 0x3fd0
    10da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	41 57                	push   r15
    10e6:	41 56                	push   r14
    10e8:	55                   	push   rbp
    10e9:	53                   	push   rbx
    10ea:	48 83 ec 38          	sub    rsp,0x38
    10ee:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    10f5:	00 00 
    10f7:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
    10fc:	31 c0                	xor    eax,eax
    10fe:	83 ff 03             	cmp    edi,0x3
    1101:	74 73                	je     0x1176
    1103:	89 fb                	mov    ebx,edi
    1105:	48 8d 3d 6c 0f 00 00 	lea    rdi,[rip+0xf6c]        # 0x2078
    110c:	e8 7f ff ff ff       	call   0x1090
    1111:	48 8d 3d 88 0f 00 00 	lea    rdi,[rip+0xf88]        # 0x20a0
    1118:	e8 73 ff ff ff       	call   0x1090
    111d:	48 8d 3d a4 0f 00 00 	lea    rdi,[rip+0xfa4]        # 0x20c8
    1124:	e8 67 ff ff ff       	call   0x1090
    1129:	48 8d 3d c8 0f 00 00 	lea    rdi,[rip+0xfc8]        # 0x20f8
    1130:	e8 5b ff ff ff       	call   0x1090
    1135:	48 8d 3d fc 0f 00 00 	lea    rdi,[rip+0xffc]        # 0x2138
    113c:	e8 4f ff ff ff       	call   0x1090
    1141:	48 8d 3d 30 10 00 00 	lea    rdi,[rip+0x1030]        # 0x2178
    1148:	e8 43 ff ff ff       	call   0x1090
    114d:	31 c0                	xor    eax,eax
    114f:	83 eb 01             	sub    ebx,0x1
    1152:	0f 95 c0             	setne  al
    1155:	01 c0                	add    eax,eax
    1157:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
    115c:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1163:	00 00 
    1165:	0f 85 92 03 00 00    	jne    0x14fd
    116b:	48 83 c4 38          	add    rsp,0x38
    116f:	5b                   	pop    rbx
    1170:	5d                   	pop    rbp
    1171:	41 5e                	pop    r14
    1173:	41 5f                	pop    r15
    1175:	c3                   	ret
    1176:	48 8b 5e 08          	mov    rbx,QWORD PTR [rsi+0x8]
    117a:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    117f:	48 89 df             	mov    rdi,rbx
    1182:	e8 19 ff ff ff       	call   0x10a0
    1187:	48 83 e8 03          	sub    rax,0x3
    118b:	48 83 f8 1d          	cmp    rax,0x1d
    118f:	77 33                	ja     0x11c4
    1191:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    1194:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
    1199:	84 c0                	test   al,al
    119b:	74 6f                	je     0x120c
    119d:	48 bf 04 e0 ff ff ff 	movabs rdi,0xfffbffffffffe004
    11a4:	ff fb ff 
    11a7:	48 89 d9             	mov    rcx,rbx
    11aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    11b0:	89 c2                	mov    edx,eax
    11b2:	83 e2 df             	and    edx,0xffffffdf
    11b5:	83 ea 41             	sub    edx,0x41
    11b8:	80 fa 19             	cmp    dl,0x19
    11bb:	76 43                	jbe    0x1200
    11bd:	83 e8 2d             	sub    eax,0x2d
    11c0:	3c 32                	cmp    al,0x32
    11c2:	76 27                	jbe    0x11eb
    11c4:	48 8b 0d 55 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2e55]        # 0x4020
    11cb:	ba 16 00 00 00       	mov    edx,0x16
    11d0:	be 01 00 00 00       	mov    esi,0x1
    11d5:	48 8d 3d 3c 0e 00 00 	lea    rdi,[rip+0xe3c]        # 0x2018
    11dc:	e8 ef fe ff ff       	call   0x10d0
    11e1:	b8 02 00 00 00       	mov    eax,0x2
    11e6:	e9 6c ff ff ff       	jmp    0x1157
    11eb:	48 0f a3 c7          	bt     rdi,rax
    11ef:	72 d3                	jb     0x11c4
    11f1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    11f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    11fc:	00 00 00 00 
    1200:	0f b6 41 01          	movzx  eax,BYTE PTR [rcx+0x1]
    1204:	48 83 c1 01          	add    rcx,0x1
    1208:	84 c0                	test   al,al
    120a:	75 a4                	jne    0x11b0
    120c:	48 8b 46 10          	mov    rax,QWORD PTR [rsi+0x10]
    1210:	48 89 c7             	mov    rdi,rax
    1213:	49 89 c6             	mov    r14,rax
    1216:	e8 85 fe ff ff       	call   0x10a0
    121b:	48 83 f8 23          	cmp    rax,0x23
    121f:	0f 85 10 02 00 00    	jne    0x1435
    1225:	4c 89 f1             	mov    rcx,r14
    1228:	31 ff                	xor    edi,edi
    122a:	48 85 ff             	test   rdi,rdi
    122d:	74 11                	je     0x1240
    122f:	8d 04 ff             	lea    eax,[rdi+rdi*8]
    1232:	83 e8 01             	sub    eax,0x1
    1235:	41 80 3c 06 2d       	cmp    BYTE PTR [r14+rax*1],0x2d
    123a:	0f 85 f5 01 00 00    	jne    0x1435
    1240:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
    1243:	8d 50 d0             	lea    edx,[rax-0x30]
    1246:	80 fa 09             	cmp    dl,0x9
    1249:	0f 86 08 02 00 00    	jbe    0x1457
    124f:	8d 50 9f             	lea    edx,[rax-0x61]
    1252:	80 fa 05             	cmp    dl,0x5
    1255:	0f 86 44 02 00 00    	jbe    0x149f
    125b:	8d 50 bf             	lea    edx,[rax-0x41]
    125e:	80 fa 05             	cmp    dl,0x5
    1261:	0f 87 ce 01 00 00    	ja     0x1435
    1267:	0f be d0             	movsx  edx,al
    126a:	83 ea 37             	sub    edx,0x37
    126d:	0f be 41 01          	movsx  eax,BYTE PTR [rcx+0x1]
    1271:	44 8d 40 d0          	lea    r8d,[rax-0x30]
    1275:	41 80 f8 09          	cmp    r8b,0x9
    1279:	0f 86 e3 01 00 00    	jbe    0x1462
    127f:	44 8d 40 9f          	lea    r8d,[rax-0x61]
    1283:	41 80 f8 05          	cmp    r8b,0x5
    1287:	0f 86 1d 02 00 00    	jbe    0x14aa
    128d:	44 8d 40 bf          	lea    r8d,[rax-0x41]
    1291:	41 80 f8 05          	cmp    r8b,0x5
    1295:	0f 87 9a 01 00 00    	ja     0x1435
    129b:	44 8d 50 c9          	lea    r10d,[rax-0x37]
    129f:	44 0f be 41 02       	movsx  r8d,BYTE PTR [rcx+0x2]
    12a4:	41 8d 40 d0          	lea    eax,[r8-0x30]
    12a8:	3c 09                	cmp    al,0x9
    12aa:	0f 86 bb 01 00 00    	jbe    0x146b
    12b0:	41 8d 40 9f          	lea    eax,[r8-0x61]
    12b4:	3c 05                	cmp    al,0x5
    12b6:	0f 86 f7 01 00 00    	jbe    0x14b3
    12bc:	41 8d 40 bf          	lea    eax,[r8-0x41]
    12c0:	3c 05                	cmp    al,0x5
    12c2:	0f 87 6d 01 00 00    	ja     0x1435
    12c8:	41 83 e8 37          	sub    r8d,0x37
    12cc:	44 0f be 49 03       	movsx  r9d,BYTE PTR [rcx+0x3]
    12d1:	41 8d 41 d0          	lea    eax,[r9-0x30]
    12d5:	3c 09                	cmp    al,0x9
    12d7:	0f 86 97 01 00 00    	jbe    0x1474
    12dd:	41 8d 41 9f          	lea    eax,[r9-0x61]
    12e1:	3c 05                	cmp    al,0x5
    12e3:	0f 86 d3 01 00 00    	jbe    0x14bc
    12e9:	41 8d 41 bf          	lea    eax,[r9-0x41]
    12ed:	3c 05                	cmp    al,0x5
    12ef:	0f 87 40 01 00 00    	ja     0x1435
    12f5:	41 83 e9 37          	sub    r9d,0x37
    12f9:	0f be 41 04          	movsx  eax,BYTE PTR [rcx+0x4]
    12fd:	44 8d 58 d0          	lea    r11d,[rax-0x30]
    1301:	41 80 fb 09          	cmp    r11b,0x9
    1305:	0f 86 72 01 00 00    	jbe    0x147d
    130b:	44 8d 58 9f          	lea    r11d,[rax-0x61]
    130f:	41 80 fb 05          	cmp    r11b,0x5
    1313:	0f 86 c2 01 00 00    	jbe    0x14db
    1319:	44 8d 58 bf          	lea    r11d,[rax-0x41]
    131d:	41 80 fb 05          	cmp    r11b,0x5
    1321:	0f 87 0e 01 00 00    	ja     0x1435
    1327:	44 8d 58 c9          	lea    r11d,[rax-0x37]
    132b:	0f be 41 05          	movsx  eax,BYTE PTR [rcx+0x5]
    132f:	8d 70 d0             	lea    esi,[rax-0x30]
    1332:	40 80 fe 09          	cmp    sil,0x9
    1336:	0f 86 4a 01 00 00    	jbe    0x1486
    133c:	8d 70 9f             	lea    esi,[rax-0x61]
    133f:	40 80 fe 05          	cmp    sil,0x5
    1343:	0f 86 9b 01 00 00    	jbe    0x14e4
    1349:	8d 70 bf             	lea    esi,[rax-0x41]
    134c:	40 80 fe 05          	cmp    sil,0x5
    1350:	0f 87 df 00 00 00    	ja     0x1435
    1356:	44 8d 78 c9          	lea    r15d,[rax-0x37]
    135a:	0f be 41 06          	movsx  eax,BYTE PTR [rcx+0x6]
    135e:	8d 70 d0             	lea    esi,[rax-0x30]
    1361:	40 80 fe 09          	cmp    sil,0x9
    1365:	0f 86 24 01 00 00    	jbe    0x148f
    136b:	8d 70 9f             	lea    esi,[rax-0x61]
    136e:	40 80 fe 05          	cmp    sil,0x5
    1372:	0f 86 75 01 00 00    	jbe    0x14ed
    1378:	8d 70 bf             	lea    esi,[rax-0x41]
    137b:	40 80 fe 05          	cmp    sil,0x5
    137f:	0f 87 b0 00 00 00    	ja     0x1435
    1385:	8d 68 c9             	lea    ebp,[rax-0x37]
    1388:	0f be 41 07          	movsx  eax,BYTE PTR [rcx+0x7]
    138c:	8d 70 d0             	lea    esi,[rax-0x30]
    138f:	40 80 fe 09          	cmp    sil,0x9
    1393:	0f 86 fe 00 00 00    	jbe    0x1497
    1399:	8d 70 9f             	lea    esi,[rax-0x61]
    139c:	40 80 fe 05          	cmp    sil,0x5
    13a0:	0f 86 4f 01 00 00    	jbe    0x14f5
    13a6:	8d 70 bf             	lea    esi,[rax-0x41]
    13a9:	40 80 fe 05          	cmp    sil,0x5
    13ad:	0f 87 82 00 00 00    	ja     0x1435
    13b3:	83 e8 37             	sub    eax,0x37
    13b6:	c1 e2 04             	shl    edx,0x4
    13b9:	89 ee                	mov    esi,ebp
    13bb:	48 83 c1 09          	add    rcx,0x9
    13bf:	44 09 d2             	or     edx,r10d
    13c2:	c1 e2 04             	shl    edx,0x4
    13c5:	41 09 d0             	or     r8d,edx
    13c8:	44 89 fa             	mov    edx,r15d
    13cb:	41 c1 e0 04          	shl    r8d,0x4
    13cf:	45 09 c1             	or     r9d,r8d
    13d2:	4c 8d 44 24 10       	lea    r8,[rsp+0x10]
    13d7:	41 c1 e1 04          	shl    r9d,0x4
    13db:	45 09 cb             	or     r11d,r9d
    13de:	41 c1 e3 04          	shl    r11d,0x4
    13e2:	44 09 da             	or     edx,r11d
    13e5:	c1 e2 04             	shl    edx,0x4
    13e8:	09 d6                	or     esi,edx
    13ea:	89 f2                	mov    edx,esi
    13ec:	c1 e2 04             	shl    edx,0x4
    13ef:	09 d0                	or     eax,edx
    13f1:	41 89 04 b8          	mov    DWORD PTR [r8+rdi*4],eax
    13f5:	48 83 c7 01          	add    rdi,0x1
    13f9:	48 83 ff 04          	cmp    rdi,0x4
    13fd:	0f 85 27 fe ff ff    	jne    0x122a
    1403:	4c 89 c6             	mov    rsi,r8
    1406:	48 89 df             	mov    rdi,rbx
    1409:	e8 52 05 00 00       	call   0x1960
    140e:	84 c0                	test   al,al
    1410:	0f 84 af 00 00 00    	je     0x14c5
    1416:	48 8d 3d 40 0c 00 00 	lea    rdi,[rip+0xc40]        # 0x205d
    141d:	e8 6e fc ff ff       	call   0x1090
    1422:	48 8d 3d 9f 0d 00 00 	lea    rdi,[rip+0xd9f]        # 0x21c8
    1429:	e8 62 fc ff ff       	call   0x1090
    142e:	31 c0                	xor    eax,eax
    1430:	e9 22 fd ff ff       	jmp    0x1157
    1435:	48 8b 0d e4 2b 00 00 	mov    rcx,QWORD PTR [rip+0x2be4]        # 0x4020
    143c:	ba 1b 00 00 00       	mov    edx,0x1b
    1441:	be 01 00 00 00       	mov    esi,0x1
    1446:	48 8d 3d e2 0b 00 00 	lea    rdi,[rip+0xbe2]        # 0x202f
    144d:	e8 7e fc ff ff       	call   0x10d0
    1452:	e9 8a fd ff ff       	jmp    0x11e1
    1457:	0f be d0             	movsx  edx,al
    145a:	83 ea 30             	sub    edx,0x30
    145d:	e9 0b fe ff ff       	jmp    0x126d
    1462:	44 8d 50 d0          	lea    r10d,[rax-0x30]
    1466:	e9 34 fe ff ff       	jmp    0x129f
    146b:	41 83 e8 30          	sub    r8d,0x30
    146f:	e9 58 fe ff ff       	jmp    0x12cc
    1474:	41 83 e9 30          	sub    r9d,0x30
    1478:	e9 7c fe ff ff       	jmp    0x12f9
    147d:	44 8d 58 d0          	lea    r11d,[rax-0x30]
    1481:	e9 a5 fe ff ff       	jmp    0x132b
    1486:	44 8d 78 d0          	lea    r15d,[rax-0x30]
    148a:	e9 cb fe ff ff       	jmp    0x135a
    148f:	8d 68 d0             	lea    ebp,[rax-0x30]
    1492:	e9 f1 fe ff ff       	jmp    0x1388
    1497:	83 e8 30             	sub    eax,0x30
    149a:	e9 17 ff ff ff       	jmp    0x13b6
    149f:	0f be d0             	movsx  edx,al
    14a2:	83 ea 57             	sub    edx,0x57
    14a5:	e9 c3 fd ff ff       	jmp    0x126d
    14aa:	44 8d 50 a9          	lea    r10d,[rax-0x57]
    14ae:	e9 ec fd ff ff       	jmp    0x129f
    14b3:	41 83 e8 57          	sub    r8d,0x57
    14b7:	e9 10 fe ff ff       	jmp    0x12cc
    14bc:	41 83 e9 57          	sub    r9d,0x57
    14c0:	e9 34 fe ff ff       	jmp    0x12f9
    14c5:	48 8d 3d 7f 0b 00 00 	lea    rdi,[rip+0xb7f]        # 0x204b
    14cc:	e8 bf fb ff ff       	call   0x1090
    14d1:	b8 01 00 00 00       	mov    eax,0x1
    14d6:	e9 7c fc ff ff       	jmp    0x1157
    14db:	44 8d 58 a9          	lea    r11d,[rax-0x57]
    14df:	e9 47 fe ff ff       	jmp    0x132b
    14e4:	44 8d 78 a9          	lea    r15d,[rax-0x57]
    14e8:	e9 6d fe ff ff       	jmp    0x135a
    14ed:	8d 68 a9             	lea    ebp,[rax-0x57]
    14f0:	e9 93 fe ff ff       	jmp    0x1388
    14f5:	83 e8 57             	sub    eax,0x57
    14f8:	e9 b9 fe ff ff       	jmp    0x13b6
    14fd:	e8 ae fb ff ff       	call   0x10b0
    1502:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1509:	00 00 00 
    150c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1510:	f3 0f 1e fa          	endbr64
    1514:	31 ed                	xor    ebp,ebp
    1516:	49 89 d1             	mov    r9,rdx
    1519:	5e                   	pop    rsi
    151a:	48 89 e2             	mov    rdx,rsp
    151d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1521:	50                   	push   rax
    1522:	54                   	push   rsp
    1523:	45 31 c0             	xor    r8d,r8d
    1526:	31 c9                	xor    ecx,ecx
    1528:	48 8d 3d b1 fb ff ff 	lea    rdi,[rip+0xfffffffffffffbb1]        # 0x10e0
    152f:	ff 15 a3 2a 00 00    	call   QWORD PTR [rip+0x2aa3]        # 0x3fd8
    1535:	f4                   	hlt
    1536:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    153d:	00 00 00 
    1540:	48 8d 3d c1 2a 00 00 	lea    rdi,[rip+0x2ac1]        # 0x4008
    1547:	48 8d 05 ba 2a 00 00 	lea    rax,[rip+0x2aba]        # 0x4008
    154e:	48 39 f8             	cmp    rax,rdi
    1551:	74 15                	je     0x1568
    1553:	48 8b 05 86 2a 00 00 	mov    rax,QWORD PTR [rip+0x2a86]        # 0x3fe0
    155a:	48 85 c0             	test   rax,rax
    155d:	74 09                	je     0x1568
    155f:	ff e0                	jmp    rax
    1561:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1568:	c3                   	ret
    1569:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1570:	48 8d 3d 91 2a 00 00 	lea    rdi,[rip+0x2a91]        # 0x4008
    1577:	48 8d 35 8a 2a 00 00 	lea    rsi,[rip+0x2a8a]        # 0x4008
    157e:	48 29 fe             	sub    rsi,rdi
    1581:	48 89 f0             	mov    rax,rsi
    1584:	48 c1 ee 3f          	shr    rsi,0x3f
    1588:	48 c1 f8 03          	sar    rax,0x3
    158c:	48 01 c6             	add    rsi,rax
    158f:	48 d1 fe             	sar    rsi,1
    1592:	74 14                	je     0x15a8
    1594:	48 8b 05 55 2a 00 00 	mov    rax,QWORD PTR [rip+0x2a55]        # 0x3ff0
    159b:	48 85 c0             	test   rax,rax
    159e:	74 08                	je     0x15a8
    15a0:	ff e0                	jmp    rax
    15a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    15a8:	c3                   	ret
    15a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    15b0:	f3 0f 1e fa          	endbr64
    15b4:	80 3d 6d 2a 00 00 00 	cmp    BYTE PTR [rip+0x2a6d],0x0        # 0x4028
    15bb:	75 2b                	jne    0x15e8
    15bd:	55                   	push   rbp
    15be:	48 83 3d 32 2a 00 00 	cmp    QWORD PTR [rip+0x2a32],0x0        # 0x3ff8
    15c5:	00 
    15c6:	48 89 e5             	mov    rbp,rsp
    15c9:	74 0c                	je     0x15d7
    15cb:	48 8b 3d 2e 2a 00 00 	mov    rdi,QWORD PTR [rip+0x2a2e]        # 0x4000
    15d2:	e8 a9 fa ff ff       	call   0x1080
    15d7:	e8 64 ff ff ff       	call   0x1540
    15dc:	c6 05 45 2a 00 00 01 	mov    BYTE PTR [rip+0x2a45],0x1        # 0x4028
    15e3:	5d                   	pop    rbp
    15e4:	c3                   	ret
    15e5:	0f 1f 00             	nop    DWORD PTR [rax]
    15e8:	c3                   	ret
    15e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    15f0:	f3 0f 1e fa          	endbr64
    15f4:	e9 77 ff ff ff       	jmp    0x1570
    15f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1600:	41 57                	push   r15
    1602:	41 56                	push   r14
    1604:	41 55                	push   r13
    1606:	41 54                	push   r12
    1608:	55                   	push   rbp
    1609:	53                   	push   rbx
    160a:	48 81 ec 38 01 00 00 	sub    rsp,0x138
    1611:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    1616:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    161d:	00 00 
    161f:	48 89 84 24 28 01 00 	mov    QWORD PTR [rsp+0x128],rax
    1626:	00 
    1627:	31 c0                	xor    eax,eax
    1629:	48 01 57 60          	add    QWORD PTR [rdi+0x60],rdx
    162d:	48 85 d2             	test   rdx,rdx
    1630:	0f 84 f3 02 00 00    	je     0x1929
    1636:	48 8b 47 68          	mov    rax,QWORD PTR [rdi+0x68]
    163a:	48 89 fb             	mov    rbx,rdi
    163d:	48 8d 7f 20          	lea    rdi,[rdi+0x20]
    1641:	49 89 d7             	mov    r15,rdx
    1644:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
    1649:	eb 0e                	jmp    0x1659
    164b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1650:	4d 85 ff             	test   r15,r15
    1653:	0f 84 d0 02 00 00    	je     0x1929
    1659:	bd 40 00 00 00       	mov    ebp,0x40
    165e:	4c 8b 74 24 08       	mov    r14,QWORD PTR [rsp+0x8]
    1663:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
    1668:	48 29 c5             	sub    rbp,rax
    166b:	4c 39 fd             	cmp    rbp,r15
    166e:	4c 89 f6             	mov    rsi,r14
    1671:	49 0f 47 ef          	cmova  rbp,r15
    1675:	48 01 c7             	add    rdi,rax
    1678:	48 89 ea             	mov    rdx,rbp
    167b:	49 01 ee             	add    r14,rbp
    167e:	49 29 ef             	sub    r15,rbp
    1681:	e8 3a fa ff ff       	call   0x10c0
    1686:	48 8b 43 68          	mov    rax,QWORD PTR [rbx+0x68]
    168a:	4c 89 74 24 08       	mov    QWORD PTR [rsp+0x8],r14
    168f:	48 01 e8             	add    rax,rbp
    1692:	48 89 43 68          	mov    QWORD PTR [rbx+0x68],rax
    1696:	48 83 f8 40          	cmp    rax,0x40
    169a:	75 b4                	jne    0x1650
    169c:	8b 43 20             	mov    eax,DWORD PTR [rbx+0x20]
    169f:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
    16a4:	48 8d 94 24 20 01 00 	lea    rdx,[rsp+0x120]
    16ab:	00 
    16ac:	0f c8                	bswap  eax
    16ae:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
    16b2:	8b 43 24             	mov    eax,DWORD PTR [rbx+0x24]
    16b5:	0f c8                	bswap  eax
    16b7:	89 44 24 24          	mov    DWORD PTR [rsp+0x24],eax
    16bb:	8b 43 28             	mov    eax,DWORD PTR [rbx+0x28]
    16be:	0f c8                	bswap  eax
    16c0:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
    16c4:	8b 43 2c             	mov    eax,DWORD PTR [rbx+0x2c]
    16c7:	0f c8                	bswap  eax
    16c9:	89 44 24 2c          	mov    DWORD PTR [rsp+0x2c],eax
    16cd:	8b 43 30             	mov    eax,DWORD PTR [rbx+0x30]
    16d0:	0f c8                	bswap  eax
    16d2:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
    16d6:	8b 43 34             	mov    eax,DWORD PTR [rbx+0x34]
    16d9:	0f c8                	bswap  eax
    16db:	89 44 24 34          	mov    DWORD PTR [rsp+0x34],eax
    16df:	8b 43 38             	mov    eax,DWORD PTR [rbx+0x38]
    16e2:	0f c8                	bswap  eax
    16e4:	89 44 24 38          	mov    DWORD PTR [rsp+0x38],eax
    16e8:	8b 43 3c             	mov    eax,DWORD PTR [rbx+0x3c]
    16eb:	0f c8                	bswap  eax
    16ed:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
    16f1:	8b 43 40             	mov    eax,DWORD PTR [rbx+0x40]
    16f4:	0f c8                	bswap  eax
    16f6:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
    16fa:	8b 43 44             	mov    eax,DWORD PTR [rbx+0x44]
    16fd:	0f c8                	bswap  eax
    16ff:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
    1703:	8b 43 48             	mov    eax,DWORD PTR [rbx+0x48]
    1706:	0f c8                	bswap  eax
    1708:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
    170c:	8b 43 4c             	mov    eax,DWORD PTR [rbx+0x4c]
    170f:	0f c8                	bswap  eax
    1711:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
    1715:	8b 43 50             	mov    eax,DWORD PTR [rbx+0x50]
    1718:	0f c8                	bswap  eax
    171a:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
    171e:	8b 43 54             	mov    eax,DWORD PTR [rbx+0x54]
    1721:	0f c8                	bswap  eax
    1723:	89 44 24 54          	mov    DWORD PTR [rsp+0x54],eax
    1727:	8b 43 58             	mov    eax,DWORD PTR [rbx+0x58]
    172a:	0f c8                	bswap  eax
    172c:	89 44 24 58          	mov    DWORD PTR [rsp+0x58],eax
    1730:	8b 43 5c             	mov    eax,DWORD PTR [rbx+0x5c]
    1733:	0f c8                	bswap  eax
    1735:	89 44 24 5c          	mov    DWORD PTR [rsp+0x5c],eax
    1739:	f3 0f 7e 44 24 58    	movq   xmm0,QWORD PTR [rsp+0x58]
    173f:	48 8d 44 24 60       	lea    rax,[rsp+0x60]
    1744:	90                   	nop
    1745:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    174c:	00 00 00 00 
    1750:	66 0f 6f c8          	movdqa xmm1,xmm0
    1754:	66 0f 6f d8          	movdqa xmm3,xmm0
    1758:	66 0f 6f e0          	movdqa xmm4,xmm0
    175c:	48 83 c0 08          	add    rax,0x8
    1760:	66 0f 72 f3 0d       	pslld  xmm3,0xd
    1765:	66 0f 72 d1 13       	psrld  xmm1,0x13
    176a:	f3 0f 7e 50 bc       	movq   xmm2,QWORD PTR [rax-0x44]
    176f:	66 0f eb cb          	por    xmm1,xmm3
    1773:	66 0f 72 f4 0f       	pslld  xmm4,0xf
    1778:	66 0f 6f d8          	movdqa xmm3,xmm0
    177c:	66 0f 72 d3 11       	psrld  xmm3,0x11
    1781:	66 0f 72 d0 0a       	psrld  xmm0,0xa
    1786:	66 0f eb dc          	por    xmm3,xmm4
    178a:	66 0f 6f e2          	movdqa xmm4,xmm2
    178e:	66 0f ef cb          	pxor   xmm1,xmm3
    1792:	66 0f 72 f4 19       	pslld  xmm4,0x19
    1797:	66 0f 6f da          	movdqa xmm3,xmm2
    179b:	66 0f ef c8          	pxor   xmm1,xmm0
    179f:	66 0f 72 f3 0e       	pslld  xmm3,0xe
    17a4:	66 0f 6f c2          	movdqa xmm0,xmm2
    17a8:	66 0f 72 d0 12       	psrld  xmm0,0x12
    17ad:	66 0f eb c3          	por    xmm0,xmm3
    17b1:	66 0f 6f da          	movdqa xmm3,xmm2
    17b5:	66 0f 72 d3 07       	psrld  xmm3,0x7
    17ba:	66 0f 72 d2 03       	psrld  xmm2,0x3
    17bf:	66 0f eb dc          	por    xmm3,xmm4
    17c3:	66 0f ef c3          	pxor   xmm0,xmm3
    17c7:	66 0f ef c2          	pxor   xmm0,xmm2
    17cb:	f3 0f 7e 50 b8       	movq   xmm2,QWORD PTR [rax-0x48]
    17d0:	66 0f fe c8          	paddd  xmm1,xmm0
    17d4:	f3 0f 7e 40 dc       	movq   xmm0,QWORD PTR [rax-0x24]
    17d9:	66 0f fe c2          	paddd  xmm0,xmm2
    17dd:	66 0f fe c1          	paddd  xmm0,xmm1
    17e1:	66 0f d6 40 f8       	movq   QWORD PTR [rax-0x8],xmm0
    17e6:	48 39 d0             	cmp    rax,rdx
    17e9:	0f 85 61 ff ff ff    	jne    0x1750
    17ef:	4c 8d 05 2a 0a 00 00 	lea    r8,[rip+0xa2a]        # 0x2220
    17f6:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
    17fa:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
    17fd:	4c 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],r15
    1802:	44 8b 63 0c          	mov    r12d,DWORD PTR [rbx+0xc]
    1806:	f3 0f 6f 4b 10       	movdqu xmm1,XMMWORD PTR [rbx+0x10]
    180b:	4d 8d a8 00 01 00 00 	lea    r13,[r8+0x100]
    1812:	8b 33                	mov    esi,DWORD PTR [rbx]
    1814:	8b 7b 04             	mov    edi,DWORD PTR [rbx+0x4]
    1817:	44 8b 4b 08          	mov    r9d,DWORD PTR [rbx+0x8]
    181b:	8b 4b 10             	mov    ecx,DWORD PTR [rbx+0x10]
    181e:	44 8b 53 14          	mov    r10d,DWORD PTR [rbx+0x14]
    1822:	44 8b 5b 18          	mov    r11d,DWORD PTR [rbx+0x18]
    1826:	eb 18                	jmp    0x1840
    1828:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    182f:	00 
    1830:	41 89 f9             	mov    r9d,edi
    1833:	45 89 d3             	mov    r11d,r10d
    1836:	89 f7                	mov    edi,esi
    1838:	41 89 ca             	mov    r10d,ecx
    183b:	89 c6                	mov    esi,eax
    183d:	44 89 f1             	mov    ecx,r14d
    1840:	89 c8                	mov    eax,ecx
    1842:	41 89 ce             	mov    r14d,ecx
    1845:	45 89 d7             	mov    r15d,r10d
    1848:	49 83 c0 04          	add    r8,0x4
    184c:	41 c1 ce 0b          	ror    r14d,0xb
    1850:	c1 c8 06             	ror    eax,0x6
    1853:	41 21 cf             	and    r15d,ecx
    1856:	48 83 c5 04          	add    rbp,0x4
    185a:	44 31 f0             	xor    eax,r14d
    185d:	41 89 ce             	mov    r14d,ecx
    1860:	41 c1 c6 07          	rol    r14d,0x7
    1864:	44 31 f0             	xor    eax,r14d
    1867:	44 8b 75 fc          	mov    r14d,DWORD PTR [rbp-0x4]
    186b:	45 03 70 fc          	add    r14d,DWORD PTR [r8-0x4]
    186f:	44 01 f0             	add    eax,r14d
    1872:	41 89 ce             	mov    r14d,ecx
    1875:	41 f7 d6             	not    r14d
    1878:	45 21 de             	and    r14d,r11d
    187b:	45 31 fe             	xor    r14d,r15d
    187e:	45 89 cf             	mov    r15d,r9d
    1881:	44 01 f0             	add    eax,r14d
    1884:	41 89 f6             	mov    r14d,esi
    1887:	41 21 ff             	and    r15d,edi
    188a:	01 d0                	add    eax,edx
    188c:	89 f2                	mov    edx,esi
    188e:	41 c1 ce 0d          	ror    r14d,0xd
    1892:	c1 ca 02             	ror    edx,0x2
    1895:	44 31 f2             	xor    edx,r14d
    1898:	41 89 f6             	mov    r14d,esi
    189b:	41 c1 c6 0a          	rol    r14d,0xa
    189f:	44 31 f2             	xor    edx,r14d
    18a2:	45 89 ce             	mov    r14d,r9d
    18a5:	41 31 fe             	xor    r14d,edi
    18a8:	41 21 f6             	and    r14d,esi
    18ab:	45 31 fe             	xor    r14d,r15d
    18ae:	44 01 f2             	add    edx,r14d
    18b1:	45 8d 34 04          	lea    r14d,[r12+rax*1]
    18b5:	45 89 cc             	mov    r12d,r9d
    18b8:	01 d0                	add    eax,edx
    18ba:	44 89 da             	mov    edx,r11d
    18bd:	4d 39 c5             	cmp    r13,r8
    18c0:	0f 85 6a ff ff ff    	jne    0x1830
    18c6:	66 41 0f 6e e9       	movd   xmm5,r9d
    18cb:	66 0f 6e c0          	movd   xmm0,eax
    18cf:	66 0f 6e df          	movd   xmm3,edi
    18d3:	31 c0                	xor    eax,eax
    18d5:	66 0f 6e f6          	movd   xmm6,esi
    18d9:	66 0f 62 dd          	punpckldq xmm3,xmm5
    18dd:	66 41 0f 6e fb       	movd   xmm7,r11d
    18e2:	4c 8b 7c 24 18       	mov    r15,QWORD PTR [rsp+0x18]
    18e7:	66 0f 62 c6          	punpckldq xmm0,xmm6
    18eb:	66 0f 6e e9          	movd   xmm5,ecx
    18ef:	48 c7 43 68 00 00 00 	mov    QWORD PTR [rbx+0x68],0x0
    18f6:	00 
    18f7:	66 0f 6c c3          	punpcklqdq xmm0,xmm3
    18fb:	66 0f fe c2          	paddd  xmm0,xmm2
    18ff:	66 41 0f 6e d2       	movd   xmm2,r10d
    1904:	0f 11 03             	movups XMMWORD PTR [rbx],xmm0
    1907:	66 41 0f 6e c6       	movd   xmm0,r14d
    190c:	66 0f 62 d7          	punpckldq xmm2,xmm7
    1910:	66 0f 62 c5          	punpckldq xmm0,xmm5
    1914:	66 0f 6c c2          	punpcklqdq xmm0,xmm2
    1918:	66 0f fe c1          	paddd  xmm0,xmm1
    191c:	0f 11 43 10          	movups XMMWORD PTR [rbx+0x10],xmm0
    1920:	4d 85 ff             	test   r15,r15
    1923:	0f 85 30 fd ff ff    	jne    0x1659
    1929:	48 8b 84 24 28 01 00 	mov    rax,QWORD PTR [rsp+0x128]
    1930:	00 
    1931:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1938:	00 00 
    193a:	75 12                	jne    0x194e
    193c:	48 81 c4 38 01 00 00 	add    rsp,0x138
    1943:	5b                   	pop    rbx
    1944:	5d                   	pop    rbp
    1945:	41 5c                	pop    r12
    1947:	41 5d                	pop    r13
    1949:	41 5e                	pop    r14
    194b:	41 5f                	pop    r15
    194d:	c3                   	ret
    194e:	e8 5d f7 ff ff       	call   0x10b0
    1953:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    195a:	00 00 00 
    195d:	0f 1f 00             	nop    DWORD PTR [rax]
    1960:	41 54                	push   r12
    1962:	ba 0b 00 00 00       	mov    edx,0xb
    1967:	49 89 fc             	mov    r12,rdi
    196a:	55                   	push   rbp
    196b:	53                   	push   rbx
    196c:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    1973:	66 0f 6f 05 85 08 00 	movdqa xmm0,XMMWORD PTR [rip+0x885]        # 0x2200
    197a:	00 
    197b:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
    1982:	00 00 
    1984:	48 89 9c 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rbx
    198b:	00 
    198c:	48 89 f3             	mov    rbx,rsi
    198f:	48 89 e7             	mov    rdi,rsp
    1992:	48 8d 35 67 06 00 00 	lea    rsi,[rip+0x667]        # 0x2000
    1999:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
    199d:	66 0f 6f 05 6b 08 00 	movdqa xmm0,XMMWORD PTR [rip+0x86b]        # 0x2210
    19a4:	00 
    19a5:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
    19aa:	66 0f ef c0          	pxor   xmm0,xmm0
    19ae:	0f 29 44 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm0
    19b3:	e8 48 fc ff ff       	call   0x1600
    19b8:	4c 89 e7             	mov    rdi,r12
    19bb:	e8 e0 f6 ff ff       	call   0x10a0
    19c0:	4c 89 e6             	mov    rsi,r12
    19c3:	48 89 e7             	mov    rdi,rsp
    19c6:	48 89 c2             	mov    rdx,rax
    19c9:	e8 32 fc ff ff       	call   0x1600
    19ce:	ba 0b 00 00 00       	mov    edx,0xb
    19d3:	48 8d 35 32 06 00 00 	lea    rsi,[rip+0x632]        # 0x200c
    19da:	48 89 e7             	mov    rdi,rsp
    19dd:	e8 1e fc ff ff       	call   0x1600
    19e2:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
    19e7:	66 0f ef c0          	pxor   xmm0,xmm0
    19eb:	48 89 e7             	mov    rdi,rsp
    19ee:	48 8b 4c 24 68       	mov    rcx,QWORD PTR [rsp+0x68]
    19f3:	ba 78 00 00 00       	mov    edx,0x78
    19f8:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    19ff:	00 
    1a00:	0f 29 84 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm0
    1a07:	00 
    1a08:	4c 8d 24 c5 00 00 00 	lea    r12,[rax*8+0x0]
    1a0f:	00 
    1a10:	b8 38 00 00 00       	mov    eax,0x38
    1a15:	0f 29 84 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm0
    1a1c:	00 
    1a1d:	48 29 c8             	sub    rax,rcx
    1a20:	48 29 ca             	sub    rdx,rcx
    1a23:	48 83 f9 37          	cmp    rcx,0x37
    1a27:	0f 29 84 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm0
    1a2e:	00 
    1a2f:	48 0f 46 d0          	cmovbe rdx,rax
    1a33:	49 0f cc             	bswap  r12
    1a36:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x80
    1a3d:	00 80 00 00 00 
    1a42:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    1a49:	00 00 00 00 00 
    1a4e:	e8 ad fb ff ff       	call   0x1600
    1a53:	48 8d 74 24 78       	lea    rsi,[rsp+0x78]
    1a58:	ba 08 00 00 00       	mov    edx,0x8
    1a5d:	48 89 e7             	mov    rdi,rsp
    1a60:	4c 89 64 24 78       	mov    QWORD PTR [rsp+0x78],r12
    1a65:	e8 96 fb ff ff       	call   0x1600
    1a6a:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
    1a6d:	8b 7b 0c             	mov    edi,DWORD PTR [rbx+0xc]
    1a70:	8b 53 04             	mov    edx,DWORD PTR [rbx+0x4]
    1a73:	f3 0f 7e 04 24       	movq   xmm0,QWORD PTR [rsp]
    1a78:	89 c6                	mov    esi,eax
    1a7a:	89 c1                	mov    ecx,eax
    1a7c:	41 89 fa             	mov    r10d,edi
    1a7f:	f3 0f 7e 7c 24 08    	movq   xmm7,QWORD PTR [rsp+0x8]
    1a85:	c1 c6 03             	rol    esi,0x3
    1a88:	66 0f 6f d8          	movdqa xmm3,xmm0
    1a8c:	66 0f 6f c8          	movdqa xmm1,xmm0
    1a90:	81 f1 d5 41 8f e2    	xor    ecx,0xe28f41d5
    1a96:	81 f6 12 7b 9e 6c    	xor    esi,0x6c9e7b12
    1a9c:	01 f9                	add    ecx,edi
    1a9e:	41 81 f2 c9 a6 23 75 	xor    r10d,0x7523a6c9
    1aa5:	f3 0f 7e 54 24 10    	movq   xmm2,QWORD PTR [rsp+0x10]
    1aab:	01 d6                	add    esi,edx
    1aad:	c1 c1 0b             	rol    ecx,0xb
    1ab0:	f3 0f 7e 6c 24 18    	movq   xmm5,QWORD PTR [rsp+0x18]
    1ab6:	66 0f 61 df          	punpcklwd xmm3,xmm7
    1aba:	66 0f 70 db 4e       	pshufd xmm3,xmm3,0x4e
    1abf:	c1 c6 07             	rol    esi,0x7
    1ac2:	66 0f 61 cf          	punpcklwd xmm1,xmm7
    1ac6:	66 0f 6f e2          	movdqa xmm4,xmm2
    1aca:	31 ce                	xor    esi,ecx
    1acc:	66 0f 61 cb          	punpcklwd xmm1,xmm3
    1ad0:	66 0f 61 e5          	punpcklwd xmm4,xmm5
    1ad4:	89 f9                	mov    ecx,edi
    1ad6:	c1 c1 04             	rol    ecx,0x4
    1ad9:	81 ee 47 86 c8 61    	sub    esi,0x61c88647
    1adf:	66 0f 6f da          	movdqa xmm3,xmm2
    1ae3:	33 33                	xor    esi,DWORD PTR [rbx]
    1ae5:	81 f1 a9 3f 4d 91    	xor    ecx,0x914d3fa9
    1aeb:	41 01 f2             	add    r10d,esi
    1aee:	66 0f 70 e4 4e       	pshufd xmm4,xmm4,0x4e
    1af3:	f3 0f 7e 35 25 08 00 	movq   xmm6,QWORD PTR [rip+0x825]        # 0x2320
    1afa:	00 
    1afb:	01 c1                	add    ecx,eax
    1afd:	41 c1 c2 0c          	rol    r10d,0xc
    1b01:	66 0f 61 dd          	punpcklwd xmm3,xmm5
    1b05:	c1 c1 08             	rol    ecx,0x8
    1b08:	66 0f 61 dc          	punpcklwd xmm3,xmm4
    1b0c:	66 44 0f 6f c6       	movdqa xmm8,xmm6
    1b11:	44 31 d1             	xor    ecx,r10d
    1b14:	66 0f 6f e6          	movdqa xmm4,xmm6
    1b18:	66 44 0f db c1       	pand   xmm8,xmm1
    1b1d:	41 89 f2             	mov    r10d,esi
    1b20:	81 c1 72 f3 6e 3c    	add    ecx,0x3c6ef372
    1b26:	41 81 f2 83 bd 19 4f 	xor    r10d,0x4f19bd83
    1b2d:	66 0f db e3          	pand   xmm4,xmm3
    1b31:	31 d1                	xor    ecx,edx
    1b33:	89 f2                	mov    edx,esi
    1b35:	66 44 0f 67 c4       	packuswb xmm8,xmm4
    1b3a:	66 0f 71 d1 08       	psrlw  xmm1,0x8
    1b3f:	c1 c2 05             	rol    edx,0x5
    1b42:	66 0f 71 d3 08       	psrlw  xmm3,0x8
    1b47:	41 01 ca             	add    r10d,ecx
    1b4a:	81 f2 0f e5 b4 3d    	xor    edx,0x3db4e50f
    1b50:	41 c1 c2 0d          	rol    r10d,0xd
    1b54:	66 0f db de          	pand   xmm3,xmm6
    1b58:	66 0f db ce          	pand   xmm1,xmm6
    1b5c:	01 fa                	add    edx,edi
    1b5e:	66 0f 67 cb          	packuswb xmm1,xmm3
    1b62:	66 45 0f 70 c0 08    	pshufd xmm8,xmm8,0x8
    1b68:	c1 c2 09             	rol    edx,0x9
    1b6b:	66 0f 70 c9 08       	pshufd xmm1,xmm1,0x8
    1b70:	44 31 d2             	xor    edx,r10d
    1b73:	66 0f 6f e1          	movdqa xmm4,xmm1
    1b77:	66 0f 6f d9          	movdqa xmm3,xmm1
    1b7b:	41 89 ca             	mov    r10d,ecx
    1b7e:	81 ea d5 92 59 25    	sub    edx,0x255992d5
    1b84:	66 0f 6f c8          	movdqa xmm1,xmm0
    1b88:	66 41 0f 60 e0       	punpcklbw xmm4,xmm8
    1b8d:	31 c2                	xor    edx,eax
    1b8f:	89 c8                	mov    eax,ecx
    1b91:	66 41 0f 60 d8       	punpcklbw xmm3,xmm8
    1b96:	c1 c0 06             	rol    eax,0x6
    1b99:	66 0f 72 d1 10       	psrld  xmm1,0x10
    1b9e:	66 44 0f 6f c7       	movdqa xmm8,xmm7
    1ba3:	41 81 f2 37 5a 0e 9c 	xor    r10d,0x9c0e5a37
    1baa:	35 61 87 c2 b5       	xor    eax,0xb5c28761
    1baf:	41 01 d2             	add    r10d,edx
    1bb2:	66 44 0f 6f c9       	movdqa xmm9,xmm1
    1bb7:	01 f0                	add    eax,esi
    1bb9:	41 c1 c2 0e          	rol    r10d,0xe
    1bbd:	66 0f 72 d0 18       	psrld  xmm0,0x18
    1bc2:	66 0f 70 db 4e       	pshufd xmm3,xmm3,0x4e
    1bc7:	66 41 0f 72 d0 10    	psrld  xmm8,0x10
    1bcd:	c1 c0 0a             	rol    eax,0xa
    1bd0:	66 0f 72 d7 18       	psrld  xmm7,0x18
    1bd5:	44 31 d0             	xor    eax,r10d
    1bd8:	66 45 0f 61 c8       	punpcklwd xmm9,xmm8
    1bdd:	66 41 0f 61 c8       	punpcklwd xmm1,xmm8
    1be2:	41 89 d2             	mov    r10d,edx
    1be5:	05 e4 e6 dd 78       	add    eax,0x78dde6e4
    1bea:	66 45 0f 70 c9 4e    	pshufd xmm9,xmm9,0x4e
    1bf0:	66 44 0f 6f c2       	movdqa xmm8,xmm2
    1bf5:	41 81 f2 d1 f6 7b 12 	xor    r10d,0x127bf6d1
    1bfc:	31 f8                	xor    eax,edi
    1bfe:	89 d7                	mov    edi,edx
    1c00:	66 41 0f 61 c9       	punpcklwd xmm1,xmm9
    1c05:	c1 c7 07             	rol    edi,0x7
    1c08:	66 41 0f 72 d0 10    	psrld  xmm8,0x10
    1c0e:	66 0f db ce          	pand   xmm1,xmm6
    1c12:	41 01 c2             	add    r10d,eax
    1c15:	81 f7 4b d9 76 0a    	xor    edi,0xa76d94b
    1c1b:	41 c1 c2 0f          	rol    r10d,0xf
    1c1f:	66 44 0f 6f cd       	movdqa xmm9,xmm5
    1c24:	66 45 0f 6f d0       	movdqa xmm10,xmm8
    1c29:	66 41 0f 72 d1 10    	psrld  xmm9,0x10
    1c2f:	66 0f 72 d2 18       	psrld  xmm2,0x18
    1c34:	01 cf                	add    edi,ecx
    1c36:	c1 c7 0b             	rol    edi,0xb
    1c39:	66 45 0f 61 d1       	punpcklwd xmm10,xmm9
    1c3e:	66 45 0f 61 c1       	punpcklwd xmm8,xmm9
    1c43:	44 31 d7             	xor    edi,r10d
    1c46:	41 89 c2             	mov    r10d,eax
    1c49:	66 45 0f 70 d2 4e    	pshufd xmm10,xmm10,0x4e
    1c4f:	81 c7 9d 60 15 17    	add    edi,0x1715609d
    1c55:	66 0f 72 d5 18       	psrld  xmm5,0x18
    1c5a:	66 45 0f 61 c2       	punpcklwd xmm8,xmm10
    1c5f:	41 81 f2 02 a4 65 db 	xor    r10d,0xdb65a402
    1c66:	31 f7                	xor    edi,esi
    1c68:	89 c6                	mov    esi,eax
    1c6a:	66 44 0f db c6       	pand   xmm8,xmm6
    1c6f:	c1 c6 08             	rol    esi,0x8
    1c72:	41 01 fa             	add    r10d,edi
    1c75:	66 41 0f 67 c8       	packuswb xmm1,xmm8
    1c7a:	81 f6 d5 41 8f e2    	xor    esi,0xe28f41d5
    1c80:	41 c1 c2 10          	rol    r10d,0x10
    1c84:	66 44 0f 6f c0       	movdqa xmm8,xmm0
    1c89:	66 0f 61 c7          	punpcklwd xmm0,xmm7
    1c8d:	01 d6                	add    esi,edx
    1c8f:	66 44 0f 61 c7       	punpcklwd xmm8,xmm7
    1c94:	66 0f 6f fa          	movdqa xmm7,xmm2
    1c98:	66 0f 61 fd          	punpcklwd xmm7,xmm5
    1c9c:	c1 c6 0c             	rol    esi,0xc
    1c9f:	66 0f 61 d5          	punpcklwd xmm2,xmm5
    1ca3:	66 0f 70 c9 08       	pshufd xmm1,xmm1,0x8
    1ca8:	44 31 d6             	xor    esi,r10d
    1cab:	41 89 fa             	mov    r10d,edi
    1cae:	66 45 0f 70 c0 4e    	pshufd xmm8,xmm8,0x4e
    1cb4:	81 ee aa 25 b3 4a    	sub    esi,0x4ab325aa
    1cba:	66 0f 70 ff 4e       	pshufd xmm7,xmm7,0x4e
    1cbf:	66 41 0f 61 c0       	punpcklwd xmm0,xmm8
    1cc4:	31 ce                	xor    esi,ecx
    1cc6:	66 0f 61 d7          	punpcklwd xmm2,xmm7
    1cca:	66 0f db c6          	pand   xmm0,xmm6
    1cce:	89 f9                	mov    ecx,edi
    1cd0:	c1 c1 09             	rol    ecx,0x9
    1cd3:	66 0f db f2          	pand   xmm6,xmm2
    1cd7:	81 f1 c9 a6 23 75    	xor    ecx,0x7523a6c9
    1cdd:	66 0f 67 c6          	packuswb xmm0,xmm6
    1ce1:	01 c1                	add    ecx,eax
    1ce3:	41 81 f2 3b c1 f9 86 	xor    r10d,0x86f9c13b
    1cea:	66 0f 70 c0 08       	pshufd xmm0,xmm0,0x8
    1cef:	41 01 f2             	add    r10d,esi
    1cf2:	c1 c1 0d             	rol    ecx,0xd
    1cf5:	66 0f 6f d0          	movdqa xmm2,xmm0
    1cf9:	66 0f 60 c1          	punpcklbw xmm0,xmm1
    1cfd:	41 c1 ca 0f          	ror    r10d,0xf
    1d01:	66 0f 70 c0 4e       	pshufd xmm0,xmm0,0x4e
    1d06:	66 0f 60 d1          	punpcklbw xmm2,xmm1
    1d0a:	44 31 d1             	xor    ecx,r10d
    1d0d:	66 0f 6f c8          	movdqa xmm1,xmm0
    1d11:	66 0f 6f ea          	movdqa xmm5,xmm2
    1d15:	41 89 f2             	mov    r10d,esi
    1d18:	81 c1 0f 54 84 53    	add    ecx,0x5384540f
    1d1e:	41 81 f2 e5 70 ad 29 	xor    r10d,0x29ad70e5
    1d25:	66 0f 61 cb          	punpcklwd xmm1,xmm3
    1d29:	31 d1                	xor    ecx,edx
    1d2b:	66 0f 61 ec          	punpcklwd xmm5,xmm4
    1d2f:	66 41 0f 7e c8       	movd   r8d,xmm1
    1d34:	89 f2                	mov    edx,esi
    1d36:	c1 c2 0a             	rol    edx,0xa
    1d39:	41 01 ca             	add    r10d,ecx
    1d3c:	66 41 0f 7e e9       	movd   r9d,xmm5
    1d41:	41 0f c8             	bswap  r8d
    1d44:	81 f2 83 bd 19 4f    	xor    edx,0x4f19bd83
    1d4a:	41 c1 ca 0e          	ror    r10d,0xe
    1d4e:	41 0f c9             	bswap  r9d
    1d51:	01 fa                	add    edx,edi
    1d53:	c1 c2 0e             	rol    edx,0xe
    1d56:	44 31 d2             	xor    edx,r10d
    1d59:	41 89 ca             	mov    r10d,ecx
    1d5c:	81 ea 38 32 44 0e    	sub    edx,0xe443238
    1d62:	41 81 f2 a1 82 6c f3 	xor    r10d,0xf36c82a1
    1d69:	31 c2                	xor    edx,eax
    1d6b:	89 c8                	mov    eax,ecx
    1d6d:	c1 c0 0b             	rol    eax,0xb
    1d70:	41 01 d2             	add    r10d,edx
    1d73:	35 37 5a 0e 9c       	xor    eax,0x9c0e5a37
    1d78:	41 c1 ca 0d          	ror    r10d,0xd
    1d7c:	01 f0                	add    eax,esi
    1d7e:	c1 c0 0f             	rol    eax,0xf
    1d81:	44 31 d0             	xor    eax,r10d
    1d84:	41 89 d2             	mov    r10d,edx
    1d87:	2d 7f b8 0c 70       	sub    eax,0x700cb87f
    1d8c:	31 f8                	xor    eax,edi
    1d8e:	89 d7                	mov    edi,edx
    1d90:	c1 c7 0c             	rol    edi,0xc
    1d93:	81 f7 d1 f6 7b 12    	xor    edi,0x127bf6d1
    1d99:	01 cf                	add    edi,ecx
    1d9b:	c1 c7 10             	rol    edi,0x10
    1d9e:	41 81 f2 d7 04 b1 58 	xor    r10d,0x58b104d7
    1da5:	41 01 c2             	add    r10d,eax
    1da8:	41 c1 ca 0c          	ror    r10d,0xc
    1dac:	44 31 d7             	xor    edi,r10d
    1daf:	41 89 c2             	mov    r10d,eax
    1db2:	81 c7 3a c1 2a 2e    	add    edi,0x2e2ac13a
    1db8:	41 81 f2 f2 96 4e c7 	xor    r10d,0xc74e96f2
    1dbf:	31 fe                	xor    esi,edi
    1dc1:	89 c7                	mov    edi,eax
    1dc3:	c1 c7 0d             	rol    edi,0xd
    1dc6:	41 01 f2             	add    r10d,esi
    1dc9:	81 f7 02 a4 65 db    	xor    edi,0xdb65a402
    1dcf:	41 c1 ca 0b          	ror    r10d,0xb
    1dd3:	01 d7                	add    edi,edx
    1dd5:	c1 cf 0f             	ror    edi,0xf
    1dd8:	44 31 d7             	xor    edi,r10d
    1ddb:	41 89 f2             	mov    r10d,esi
    1dde:	81 ef 0d c5 9d 33    	sub    edi,0x339dc50d
    1de4:	41 81 f2 12 7b 9e 6c 	xor    r10d,0x6c9e7b12
    1deb:	31 f9                	xor    ecx,edi
    1ded:	89 f7                	mov    edi,esi
    1def:	c1 c7 03             	rol    edi,0x3
    1df2:	41 01 ca             	add    r10d,ecx
    1df5:	81 f7 3b c1 f9 86    	xor    edi,0x86f9c13b
    1dfb:	41 c1 ca 0a          	ror    r10d,0xa
    1dff:	01 c7                	add    edi,eax
    1e01:	c1 cf 0e             	ror    edi,0xe
    1e04:	44 31 d7             	xor    edi,r10d
    1e07:	41 89 ca             	mov    r10d,ecx
    1e0a:	81 c7 ac b4 99 6a    	add    edi,0x6a99b4ac
    1e10:	41 81 f2 a9 3f 4d 91 	xor    r10d,0x914d3fa9
    1e17:	31 fa                	xor    edx,edi
    1e19:	89 cf                	mov    edi,ecx
    1e1b:	c1 c7 04             	rol    edi,0x4
    1e1e:	41 01 d2             	add    r10d,edx
    1e21:	81 f7 e5 70 ad 29    	xor    edi,0x29ad70e5
    1e27:	01 f7                	add    edi,esi
    1e29:	c1 cf 0d             	ror    edi,0xd
    1e2c:	41 c1 ca 09          	ror    r10d,0x9
    1e30:	44 31 d7             	xor    edi,r10d
    1e33:	41 c1 c0 05          	rol    r8d,0x5
    1e37:	81 c7 65 2e d1 08    	add    edi,0x8d12e65
    1e3d:	45 31 c8             	xor    r8d,r9d
    1e40:	31 f8                	xor    eax,edi
    1e42:	31 ff                	xor    edi,edi
    1e44:	41 39 c0             	cmp    r8d,eax
    1e47:	74 25                	je     0x1e6e
    1e49:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
    1e50:	00 
    1e51:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1e58:	00 00 
    1e5a:	0f 85 07 01 00 00    	jne    0x1f67
    1e60:	48 81 c4 d0 00 00 00 	add    rsp,0xd0
    1e67:	89 f8                	mov    eax,edi
    1e69:	5b                   	pop    rbx
    1e6a:	5d                   	pop    rbp
    1e6b:	41 5c                	pop    r12
    1e6d:	c3                   	ret
    1e6e:	89 d0                	mov    eax,edx
    1e70:	66 0f 61 c3          	punpcklwd xmm0,xmm3
    1e74:	66 0f 61 d4          	punpcklwd xmm2,xmm4
    1e78:	41 89 d3             	mov    r11d,edx
    1e7b:	c1 c0 05             	rol    eax,0x5
    1e7e:	66 0f 70 c0 4e       	pshufd xmm0,xmm0,0x4e
    1e83:	66 0f 70 d2 4e       	pshufd xmm2,xmm2,0x4e
    1e88:	41 81 f3 0f e5 b4 3d 	xor    r11d,0x3db4e50f
    1e8f:	35 a1 82 6c f3       	xor    eax,0xf36c82a1
    1e94:	45 01 c3             	add    r11d,r8d
    1e97:	66 41 0f 7e c1       	movd   r9d,xmm0
    1e9c:	01 c8                	add    eax,ecx
    1e9e:	41 c1 c3 0b          	rol    r11d,0xb
    1ea2:	66 41 0f 7e d2       	movd   r10d,xmm2
    1ea7:	41 0f c9             	bswap  r9d
    1eaa:	c1 c8 0c             	ror    eax,0xc
    1ead:	41 c1 c1 0d          	rol    r9d,0xd
    1eb1:	41 0f ca             	bswap  r10d
    1eb4:	44 31 d8             	xor    eax,r11d
    1eb7:	45 89 c3             	mov    r11d,r8d
    1eba:	45 31 d1             	xor    r9d,r10d
    1ebd:	2d e2 57 f7 58       	sub    eax,0x58f757e2
    1ec2:	41 81 f3 61 87 c2 b5 	xor    r11d,0xb5c28761
    1ec9:	31 f0                	xor    eax,esi
    1ecb:	44 89 c6             	mov    esi,r8d
    1ece:	c1 c6 06             	rol    esi,0x6
    1ed1:	41 01 c3             	add    r11d,eax
    1ed4:	81 f6 d7 04 b1 58    	xor    esi,0x58b104d7
    1eda:	41 c1 c3 0c          	rol    r11d,0xc
    1ede:	01 d6                	add    esi,edx
    1ee0:	c1 ce 0b             	ror    esi,0xb
    1ee3:	44 31 de             	xor    esi,r11d
    1ee6:	81 c6 d7 21 40 45    	add    esi,0x454021d7
    1eec:	31 f1                	xor    ecx,esi
    1eee:	41 39 c9             	cmp    r9d,ecx
    1ef1:	0f 85 52 ff ff ff    	jne    0x1e49
    1ef7:	66 0f 70 f5 e5       	pshufd xmm6,xmm5,0xe5
    1efc:	66 0f 7e f6          	movd   esi,xmm6
    1f00:	66 0f 70 f1 e5       	pshufd xmm6,xmm1,0xe5
    1f05:	66 0f 7e f1          	movd   ecx,xmm6
    1f09:	0f c9                	bswap  ecx
    1f0b:	c1 c1 09             	rol    ecx,0x9
    1f0e:	0f ce                	bswap  esi
    1f10:	01 f1                	add    ecx,esi
    1f12:	39 c1                	cmp    ecx,eax
    1f14:	0f 85 2f ff ff ff    	jne    0x1e49
    1f1a:	89 cf                	mov    edi,ecx
    1f1c:	81 f1 4b d9 76 0a    	xor    ecx,0xa76d94b
    1f22:	66 0f 70 f2 e5       	pshufd xmm6,xmm2,0xe5
    1f27:	66 0f 7e f6          	movd   esi,xmm6
    1f2b:	c1 c7 07             	rol    edi,0x7
    1f2e:	44 01 c9             	add    ecx,r9d
    1f31:	66 0f 70 f0 e5       	pshufd xmm6,xmm0,0xe5
    1f36:	66 0f 7e f0          	movd   eax,xmm6
    1f3a:	81 f7 f2 96 4e c7    	xor    edi,0xc74e96f2
    1f40:	c1 c1 0d             	rol    ecx,0xd
    1f43:	0f c8                	bswap  eax
    1f45:	0f ce                	bswap  esi
    1f47:	44 01 c7             	add    edi,r8d
    1f4a:	c1 c8 0f             	ror    eax,0xf
    1f4d:	c1 cf 0a             	ror    edi,0xa
    1f50:	01 f0                	add    eax,esi
    1f52:	31 f9                	xor    ecx,edi
    1f54:	81 e9 70 64 88 1c    	sub    ecx,0x1c886470
    1f5a:	31 ca                	xor    edx,ecx
    1f5c:	39 c2                	cmp    edx,eax
    1f5e:	40 0f 94 c7          	sete   dil
    1f62:	e9 e2 fe ff ff       	jmp    0x1e49
    1f67:	e8 44 f1 ff ff       	call   0x10b0
    1f6c:	f3 0f 1e fa          	endbr64
    1f70:	48 83 ec 08          	sub    rsp,0x8
    1f74:	48 83 c4 08          	add    rsp,0x8
    1f78:	c3                   	ret
    1f79:	00 00                	add    BYTE PTR [rax],al
    1f7b:	00 00                	add    BYTE PTR [rax],al
    1f7d:	00 00                	add    BYTE PTR [rax],al
	...
