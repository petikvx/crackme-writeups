
veil:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <.init>:
  401000:	50                   	push   rax
  401001:	58                   	pop    rax
  401002:	c3                   	ret

Disassembly of section .text:

0000000000401040 <.text>:
  401040:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  401047:	00 00 
  401049:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
  40104c:	31 c0                	xor    eax,eax
  40104e:	f0 0f b1 15 52 03 01 	lock cmpxchg DWORD PTR [rip+0x10352],edx        # 0x4113a8
  401055:	00 
  401056:	39 d0                	cmp    eax,edx
  401058:	74 0d                	je     0x401067
  40105a:	85 c0                	test   eax,eax
  40105c:	74 0a                	je     0x401068
  40105e:	b8 22 00 00 00       	mov    eax,0x22
  401063:	0f 05                	syscall
  401065:	eb f7                	jmp    0x40105e
  401067:	f4                   	hlt
  401068:	53                   	push   rbx
  401069:	89 fb                	mov    ebx,edi
  40106b:	e8 40 33 00 00       	call   0x4043b0
  401070:	e8 9f 34 00 00       	call   0x404514
  401075:	31 c0                	xor    eax,eax
  401077:	e8 3f 92 00 00       	call   0x40a2bb
  40107c:	89 df                	mov    edi,ebx
  40107e:	e8 d0 7f 00 00       	call   0x409053
  401083:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40108a:	00 00 00 
  40108d:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401094:	00 00 00 
  401097:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40109e:	00 00 00 
  4010a1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4010a8:	00 00 00 
  4010ab:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4010b2:	00 00 00 
  4010b5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4010bc:	00 00 00 
  4010bf:	90                   	nop
  4010c0:	48 81 ec f8 20 00 00 	sub    rsp,0x20f8
  4010c7:	48 89 9c 24 c8 20 00 	mov    QWORD PTR [rsp+0x20c8],rbx
  4010ce:	00 
  4010cf:	48 89 ac 24 d0 20 00 	mov    QWORD PTR [rsp+0x20d0],rbp
  4010d6:	00 
  4010d7:	4c 89 a4 24 d8 20 00 	mov    QWORD PTR [rsp+0x20d8],r12
  4010de:	00 
  4010df:	4c 89 ac 24 e0 20 00 	mov    QWORD PTR [rsp+0x20e0],r13
  4010e6:	00 
  4010e7:	4c 89 b4 24 e8 20 00 	mov    QWORD PTR [rsp+0x20e8],r14
  4010ee:	00 
  4010ef:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4010f6:	00 00 
  4010f8:	48 89 84 24 b8 20 00 	mov    QWORD PTR [rsp+0x20b8],rax
  4010ff:	00 
  401100:	31 c0                	xor    eax,eax
  401102:	83 ff 01             	cmp    edi,0x1
  401105:	0f 8e 30 06 00 00    	jle    0x40173b
  40110b:	4c 89 bc 24 f0 20 00 	mov    QWORD PTR [rsp+0x20f0],r15
  401112:	00 
  401113:	41 89 fd             	mov    r13d,edi
  401116:	49 89 f6             	mov    r14,rsi
  401119:	41 bf 01 00 00 00    	mov    r15d,0x1
  40111f:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  401126:	00 
  401127:	45 31 e4             	xor    r12d,r12d
  40112a:	c7 44 24 0c ff ff ff 	mov    DWORD PTR [rsp+0xc],0xffffffff
  401131:	ff 
  401132:	c7 44 24 08 00 00 00 	mov    DWORD PTR [rsp+0x8],0x0
  401139:	00 
  40113a:	eb 47                	jmp    0x401183
  40113c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401140:	48 8d 35 c6 9e 00 00 	lea    rsi,[rip+0x9ec6]        # 0x40b00d
  401147:	48 89 df             	mov    rdi,rbx
  40114a:	e8 91 72 00 00       	call   0x4083e0
  40114f:	85 c0                	test   eax,eax
  401151:	0f 85 e1 00 00 00    	jne    0x401238
  401157:	41 83 c7 01          	add    r15d,0x1
  40115b:	45 39 fd             	cmp    r13d,r15d
  40115e:	0f 8e 4a 01 00 00    	jle    0x4012ae
  401164:	4c 0b 24 24          	or     r12,QWORD PTR [rsp]
  401168:	0f 85 40 01 00 00    	jne    0x4012ae
  40116e:	49 8b 44 ee 08       	mov    rax,QWORD PTR [r14+rbp*8+0x8]
  401173:	45 31 e4             	xor    r12d,r12d
  401176:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  40117a:	41 83 c7 01          	add    r15d,0x1
  40117e:	45 39 fd             	cmp    r13d,r15d
  401181:	7e 2b                	jle    0x4011ae
  401183:	49 63 ef             	movsxd rbp,r15d
  401186:	48 8d 35 78 9e 00 00 	lea    rsi,[rip+0x9e78]        # 0x40b005
  40118d:	49 8b 1c ee          	mov    rbx,QWORD PTR [r14+rbp*8]
  401191:	48 89 df             	mov    rdi,rbx
  401194:	e8 47 72 00 00       	call   0x4083e0
  401199:	85 c0                	test   eax,eax
  40119b:	75 a3                	jne    0x401140
  40119d:	41 83 c7 01          	add    r15d,0x1
  4011a1:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  4011a8:	00 
  4011a9:	45 39 fd             	cmp    r13d,r15d
  4011ac:	7f d5                	jg     0x401183
  4011ae:	83 7c 24 0c ff       	cmp    DWORD PTR [rsp+0xc],0xffffffff
  4011b3:	74 0b                	je     0x4011c0
  4011b5:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
  4011ba:	0f 85 ee 00 00 00    	jne    0x4012ae
  4011c0:	e8 eb 2c 00 00       	call   0x403eb0
  4011c5:	89 c3                	mov    ebx,eax
  4011c7:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4011cc:	0f 84 33 02 00 00    	je     0x401405
  4011d2:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  4011d6:	e8 45 72 00 00       	call   0x408420
  4011db:	4c 8b 05 c6 ed 00 00 	mov    r8,QWORD PTR [rip+0xedc6]        # 0x40ffa8
  4011e2:	49 89 c1             	mov    r9,rax
  4011e5:	48 8d 40 ff          	lea    rax,[rax-0x1]
  4011e9:	48 83 f8 7f          	cmp    rax,0x7f
  4011ed:	77 30                	ja     0x40121f
  4011ef:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4011f3:	48 8b 0c 24          	mov    rcx,QWORD PTR [rsp]
  4011f7:	4a 8d 34 08          	lea    rsi,[rax+r9*1]
  4011fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401200:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  401203:	89 d0                	mov    eax,edx
  401205:	83 ea 30             	sub    edx,0x30
  401208:	83 fa 09             	cmp    edx,0x9
  40120b:	0f 86 ff 00 00 00    	jbe    0x401310
  401211:	83 e0 df             	and    eax,0xffffffdf
  401214:	83 e8 41             	sub    eax,0x41
  401217:	3c 05                	cmp    al,0x5
  401219:	0f 86 f1 00 00 00    	jbe    0x401310
  40121f:	4c 89 c7             	mov    rdi,r8
  401222:	e8 e9 06 00 00       	call   0x401910
  401227:	4c 8b bc 24 f0 20 00 	mov    r15,QWORD PTR [rsp+0x20f0]
  40122e:	00 
  40122f:	e9 8e 00 00 00       	jmp    0x4012c2
  401234:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401238:	48 8d 35 d5 9d 00 00 	lea    rsi,[rip+0x9dd5]        # 0x40b014
  40123f:	48 89 df             	mov    rdi,rbx
  401242:	e8 99 71 00 00       	call   0x4083e0
  401247:	85 c0                	test   eax,eax
  401249:	75 3d                	jne    0x401288
  40124b:	41 83 c7 01          	add    r15d,0x1
  40124f:	45 39 fd             	cmp    r13d,r15d
  401252:	7e 5a                	jle    0x4012ae
  401254:	49 8b 7c ee 08       	mov    rdi,QWORD PTR [r14+rbp*8+0x8]
  401259:	ba 0a 00 00 00       	mov    edx,0xa
  40125e:	48 8d 74 24 18       	lea    rsi,[rsp+0x18]
  401263:	e8 c7 6e 00 00       	call   0x40812f
  401268:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  40126d:	80 3a 00             	cmp    BYTE PTR [rdx],0x0
  401270:	75 3c                	jne    0x4012ae
  401272:	48 83 f8 0c          	cmp    rax,0xc
  401276:	77 36                	ja     0x4012ae
  401278:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40127c:	e9 f9 fe ff ff       	jmp    0x40117a
  401281:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401288:	80 3b 2d             	cmp    BYTE PTR [rbx],0x2d
  40128b:	74 1b                	je     0x4012a8
  40128d:	4c 0b 24 24          	or     r12,QWORD PTR [rsp]
  401291:	75 1b                	jne    0x4012ae
  401293:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  40129a:	00 
  40129b:	49 89 dc             	mov    r12,rbx
  40129e:	e9 d7 fe ff ff       	jmp    0x40117a
  4012a3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4012a8:	80 7b 01 00          	cmp    BYTE PTR [rbx+0x1],0x0
  4012ac:	74 df                	je     0x40128d
  4012ae:	48 8b 3d f3 ec 00 00 	mov    rdi,QWORD PTR [rip+0xecf3]        # 0x40ffa8
  4012b5:	e8 56 06 00 00       	call   0x401910
  4012ba:	4c 8b bc 24 f0 20 00 	mov    r15,QWORD PTR [rsp+0x20f0]
  4012c1:	00 
  4012c2:	b8 02 00 00 00       	mov    eax,0x2
  4012c7:	48 8b 94 24 b8 20 00 	mov    rdx,QWORD PTR [rsp+0x20b8]
  4012ce:	00 
  4012cf:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4012d6:	00 00 
  4012d8:	0f 85 fa 04 00 00    	jne    0x4017d8
  4012de:	48 8b 9c 24 c8 20 00 	mov    rbx,QWORD PTR [rsp+0x20c8]
  4012e5:	00 
  4012e6:	48 8b ac 24 d0 20 00 	mov    rbp,QWORD PTR [rsp+0x20d0]
  4012ed:	00 
  4012ee:	4c 8b a4 24 d8 20 00 	mov    r12,QWORD PTR [rsp+0x20d8]
  4012f5:	00 
  4012f6:	4c 8b ac 24 e0 20 00 	mov    r13,QWORD PTR [rsp+0x20e0]
  4012fd:	00 
  4012fe:	4c 8b b4 24 e8 20 00 	mov    r14,QWORD PTR [rsp+0x20e8]
  401305:	00 
  401306:	48 81 c4 f8 20 00 00 	add    rsp,0x20f8
  40130d:	c3                   	ret
  40130e:	66 90                	xchg   ax,ax
  401310:	48 83 c1 01          	add    rcx,0x1
  401314:	48 39 f1             	cmp    rcx,rsi
  401317:	0f 85 e3 fe ff ff    	jne    0x401200
  40131d:	b8 30 00 00 00       	mov    eax,0x30
  401322:	4c 8d a4 24 20 1a 00 	lea    r12,[rsp+0x1a20]
  401329:	00 
  40132a:	48 8b 34 24          	mov    rsi,QWORD PTR [rsp]
  40132e:	b9 80 00 00 00       	mov    ecx,0x80
  401333:	4c 89 e7             	mov    rdi,r12
  401336:	42 8d 14 8d 00 00 00 	lea    edx,[r9*4+0x0]
  40133d:	00 
  40133e:	f3 aa                	rep stos BYTE PTR es:[rdi],al
  401340:	4c 89 e0             	mov    rax,r12
  401343:	44 89 c9             	mov    ecx,r9d
  401346:	4c 29 c8             	sub    rax,r9
  401349:	48 8d b8 80 00 00 00 	lea    rdi,[rax+0x80]
  401350:	31 c0                	xor    eax,eax
  401352:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
  401354:	48 8d 35 5d a0 00 00 	lea    rsi,[rip+0xa05d]        # 0x40b3b8
  40135b:	4c 89 c7             	mov    rdi,r8
  40135e:	c6 84 24 a0 1a 00 00 	mov    BYTE PTR [rsp+0x1aa0],0x0
  401365:	00 
  401366:	e8 d2 39 00 00       	call   0x404d3d
  40136b:	4c 8b bc 24 f0 20 00 	mov    r15,QWORD PTR [rsp+0x20f0]
  401372:	00 
  401373:	4c 89 e7             	mov    rdi,r12
  401376:	e8 a5 70 00 00       	call   0x408420
  40137b:	48 3d 80 00 00 00    	cmp    rax,0x80
  401381:	0f 85 94 00 00 00    	jne    0x40141b
  401387:	48 8d 8c 24 b0 1e 00 	lea    rcx,[rsp+0x1eb0]
  40138e:	00 
  40138f:	48 8d bc 24 f0 1e 00 	lea    rdi,[rsp+0x1ef0]
  401396:	00 
  401397:	eb 48                	jmp    0x4013e1
  401399:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4013a0:	8d 42 bf             	lea    eax,[rdx-0x41]
  4013a3:	83 f8 05             	cmp    eax,0x5
  4013a6:	77 73                	ja     0x40141b
  4013a8:	8d 42 c9             	lea    eax,[rdx-0x37]
  4013ab:	41 0f b6 74 24 01    	movzx  esi,BYTE PTR [r12+0x1]
  4013b1:	8d 56 d0             	lea    edx,[rsi-0x30]
  4013b4:	83 fa 09             	cmp    edx,0x9
  4013b7:	76 13                	jbe    0x4013cc
  4013b9:	8d 56 9f             	lea    edx,[rsi-0x61]
  4013bc:	83 fa 05             	cmp    edx,0x5
  4013bf:	76 3f                	jbe    0x401400
  4013c1:	8d 56 bf             	lea    edx,[rsi-0x41]
  4013c4:	83 fa 05             	cmp    edx,0x5
  4013c7:	77 52                	ja     0x40141b
  4013c9:	8d 56 c9             	lea    edx,[rsi-0x37]
  4013cc:	c1 e0 04             	shl    eax,0x4
  4013cf:	48 83 c1 01          	add    rcx,0x1
  4013d3:	49 83 c4 02          	add    r12,0x2
  4013d7:	09 d0                	or     eax,edx
  4013d9:	88 41 ff             	mov    BYTE PTR [rcx-0x1],al
  4013dc:	48 39 f9             	cmp    rcx,rdi
  4013df:	74 4b                	je     0x40142c
  4013e1:	41 0f b6 14 24       	movzx  edx,BYTE PTR [r12]
  4013e6:	8d 42 d0             	lea    eax,[rdx-0x30]
  4013e9:	83 f8 09             	cmp    eax,0x9
  4013ec:	76 bd                	jbe    0x4013ab
  4013ee:	8d 42 9f             	lea    eax,[rdx-0x61]
  4013f1:	83 f8 05             	cmp    eax,0x5
  4013f4:	77 aa                	ja     0x4013a0
  4013f6:	8d 42 a9             	lea    eax,[rdx-0x57]
  4013f9:	eb b0                	jmp    0x4013ab
  4013fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401400:	8d 56 a9             	lea    edx,[rsi-0x57]
  401403:	eb c7                	jmp    0x4013cc
  401405:	4c 8b bc 24 f0 20 00 	mov    r15,QWORD PTR [rsp+0x20f0]
  40140c:	00 
  40140d:	4d 85 e4             	test   r12,r12
  401410:	0f 85 5d ff ff ff    	jne    0x401373
  401416:	e9 35 03 00 00       	jmp    0x401750
  40141b:	48 8b 3d 86 eb 00 00 	mov    rdi,QWORD PTR [rip+0xeb86]        # 0x40ffa8
  401422:	e8 e9 04 00 00       	call   0x401910
  401427:	e9 96 fe ff ff       	jmp    0x4012c2
  40142c:	48 8d 8c 24 b0 1a 00 	lea    rcx,[rsp+0x1ab0]
  401433:	00 
  401434:	31 c0                	xor    eax,eax
  401436:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40143d:	00 00 00 
  401440:	89 c2                	mov    edx,eax
  401442:	c1 fa 03             	sar    edx,0x3
  401445:	0f b6 b4 14 b0 1e 00 	movzx  esi,BYTE PTR [rsp+rdx*1+0x1eb0]
  40144c:	00 
  40144d:	89 c2                	mov    edx,eax
  40144f:	f7 d2                	not    edx
  401451:	83 e2 07             	and    edx,0x7
  401454:	0f a3 d6             	bt     esi,edx
  401457:	0f 92 01             	setb   BYTE PTR [rcx]
  40145a:	83 c0 01             	add    eax,0x1
  40145d:	48 83 c1 01          	add    rcx,0x1
  401461:	3d 00 02 00 00       	cmp    eax,0x200
  401466:	75 d8                	jne    0x401440
  401468:	e8 13 06 00 00       	call   0x401a80
  40146d:	89 df                	mov    edi,ebx
  40146f:	e8 ec 07 00 00       	call   0x401c60
  401474:	e8 47 2b 00 00       	call   0x403fc0
  401479:	83 7c 24 0c ff       	cmp    DWORD PTR [rsp+0xc],0xffffffff
  40147e:	41 0f 94 c5          	sete   r13b
  401482:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
  401487:	75 12                	jne    0x40149b
  401489:	45 84 ed             	test   r13b,r13b
  40148c:	74 0d                	je     0x40149b
  40148e:	e8 0d 28 00 00       	call   0x403ca0
  401493:	85 c0                	test   eax,eax
  401495:	0f 85 5f 01 00 00    	jne    0x4015fa
  40149b:	31 db                	xor    ebx,ebx
  40149d:	4c 8d a4 24 b0 1c 00 	lea    r12,[rsp+0x1cb0]
  4014a4:	00 
  4014a5:	48 8d ac 24 b0 1a 00 	lea    rbp,[rsp+0x1ab0]
  4014ac:	00 
  4014ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4014b0:	8b 54 24 08          	mov    edx,DWORD PTR [rsp+0x8]
  4014b4:	85 d2                	test   edx,edx
  4014b6:	75 13                	jne    0x4014cb
  4014b8:	3b 5c 24 0c          	cmp    ebx,DWORD PTR [rsp+0xc]
  4014bc:	0f 84 1d 01 00 00    	je     0x4015df
  4014c2:	45 84 ed             	test   r13b,r13b
  4014c5:	0f 85 14 01 00 00    	jne    0x4015df
  4014cb:	83 fb 06             	cmp    ebx,0x6
  4014ce:	0f 84 d8 00 00 00    	je     0x4015ac
  4014d4:	83 fb 0c             	cmp    ebx,0xc
  4014d7:	0f 85 e4 00 00 00    	jne    0x4015c1
  4014dd:	45 31 e4             	xor    r12d,r12d
  4014e0:	e8 eb 2a 00 00       	call   0x403fd0
  4014e5:	48 8d b4 24 b0 1e 00 	lea    rsi,[rsp+0x1eb0]
  4014ec:	00 
  4014ed:	48 89 ef             	mov    rdi,rbp
  4014f0:	f2 0f 11 04 24       	movsd  QWORD PTR [rsp],xmm0
  4014f5:	e8 d6 07 00 00       	call   0x401cd0
  4014fa:	89 c3                	mov    ebx,eax
  4014fc:	e8 cf 2a 00 00       	call   0x403fd0
  401501:	f2 0f 5c 04 24       	subsd  xmm0,QWORD PTR [rsp]
  401506:	f2 0f 11 04 24       	movsd  QWORD PTR [rsp],xmm0
  40150b:	e8 30 2b 00 00       	call   0x404040
  401510:	f2 0f 10 04 24       	movsd  xmm0,QWORD PTR [rsp]
  401515:	66 0f 2f 05 13 9f 00 	comisd xmm0,QWORD PTR [rip+0x9f13]        # 0x40b430
  40151c:	00 
  40151d:	0f 87 cd 00 00 00    	ja     0x4015f0
  401523:	31 d2                	xor    edx,edx
  401525:	85 c0                	test   eax,eax
  401527:	74 1e                	je     0x401547
  401529:	83 e0 40             	and    eax,0x40
  40152c:	09 d0                	or     eax,edx
  40152e:	89 c7                	mov    edi,eax
  401530:	e8 2b 07 00 00       	call   0x401c60
  401535:	48 8d b4 24 b0 1e 00 	lea    rsi,[rsp+0x1eb0]
  40153c:	00 
  40153d:	48 89 ef             	mov    rdi,rbp
  401540:	e8 8b 07 00 00       	call   0x401cd0
  401545:	89 c3                	mov    ebx,eax
  401547:	45 31 ed             	xor    r13d,r13d
  40154a:	81 fb 00 04 00 00    	cmp    ebx,0x400
  401550:	41 0f 94 c5          	sete   r13b
  401554:	45 85 e4             	test   r12d,r12d
  401557:	74 36                	je     0x40158f
  401559:	be 0c 00 00 00       	mov    esi,0xc
  40155e:	48 89 ef             	mov    rdi,rbp
  401561:	81 fb 00 04 00 00    	cmp    ebx,0x400
  401567:	0f 84 c4 01 00 00    	je     0x401731
  40156d:	e8 7e 1b 00 00       	call   0x4030f0
  401572:	48 8b 0d 3f ea 00 00 	mov    rcx,QWORD PTR [rip+0xea3f]        # 0x40ffb8
  401579:	ba 05 00 00 00       	mov    edx,0x5
  40157e:	be 01 00 00 00       	mov    esi,0x1
  401583:	48 8d 3d 99 9a 00 00 	lea    rdi,[rip+0x9a99]        # 0x40b023
  40158a:	e8 7a 3a 00 00       	call   0x405009
  40158f:	44 89 ef             	mov    edi,r13d
  401592:	e8 79 22 00 00       	call   0x403810
  401597:	e8 64 11 00 00       	call   0x402700
  40159c:	31 c0                	xor    eax,eax
  40159e:	81 fb 00 04 00 00    	cmp    ebx,0x400
  4015a4:	0f 95 c0             	setne  al
  4015a7:	e9 1b fd ff ff       	jmp    0x4012c7
  4015ac:	ba 00 02 00 00       	mov    edx,0x200
  4015b1:	48 89 ee             	mov    rsi,rbp
  4015b4:	48 8d bc 24 b0 1e 00 	lea    rdi,[rsp+0x1eb0]
  4015bb:	00 
  4015bc:	e8 42 74 00 00       	call   0x408a03
  4015c1:	89 da                	mov    edx,ebx
  4015c3:	4c 89 e6             	mov    rsi,r12
  4015c6:	48 89 ef             	mov    rdi,rbp
  4015c9:	83 c3 01             	add    ebx,0x1
  4015cc:	e8 cf 03 00 00       	call   0x4019a0
  4015d1:	48 89 e8             	mov    rax,rbp
  4015d4:	4c 89 e5             	mov    rbp,r12
  4015d7:	49 89 c4             	mov    r12,rax
  4015da:	e9 d1 fe ff ff       	jmp    0x4014b0
  4015df:	31 d2                	xor    edx,edx
  4015e1:	89 de                	mov    esi,ebx
  4015e3:	48 89 ef             	mov    rdi,rbp
  4015e6:	e8 45 16 00 00       	call   0x402c30
  4015eb:	e9 db fe ff ff       	jmp    0x4014cb
  4015f0:	ba 20 00 00 00       	mov    edx,0x20
  4015f5:	e9 2f ff ff ff       	jmp    0x401529
  4015fa:	ba 00 02 00 00       	mov    edx,0x200
  4015ff:	48 8d b4 24 b0 1a 00 	lea    rsi,[rsp+0x1ab0]
  401606:	00 
  401607:	31 db                	xor    ebx,ebx
  401609:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
  40160e:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
  401613:	e8 eb 73 00 00       	call   0x408a03
  401618:	4c 8d a4 24 20 02 00 	lea    r12,[rsp+0x220]
  40161f:	00 
  401620:	48 8d ac 24 b0 1c 00 	lea    rbp,[rsp+0x1cb0]
  401627:	00 
  401628:	4c 8d b4 24 b0 1a 00 	lea    r14,[rsp+0x1ab0]
  40162f:	00 
  401630:	eb 03                	jmp    0x401635
  401632:	49 87 ee             	xchg   r14,rbp
  401635:	89 da                	mov    edx,ebx
  401637:	48 89 ee             	mov    rsi,rbp
  40163a:	4c 89 f7             	mov    rdi,r14
  40163d:	83 c3 01             	add    ebx,0x1
  401640:	e8 5b 03 00 00       	call   0x4019a0
  401645:	4c 89 e7             	mov    rdi,r12
  401648:	ba 00 02 00 00       	mov    edx,0x200
  40164d:	48 89 ee             	mov    rsi,rbp
  401650:	e8 ae 73 00 00       	call   0x408a03
  401655:	49 81 c4 00 02 00 00 	add    r12,0x200
  40165c:	83 fb 0c             	cmp    ebx,0xc
  40165f:	75 d1                	jne    0x401632
  401661:	48 8d b4 24 20 0c 00 	lea    rsi,[rsp+0xc20]
  401668:	00 
  401669:	ba 00 02 00 00       	mov    edx,0x200
  40166e:	48 8d bc 24 b0 1e 00 	lea    rdi,[rsp+0x1eb0]
  401675:	00 
  401676:	31 db                	xor    ebx,ebx
  401678:	e8 86 73 00 00       	call   0x408a03
  40167d:	e8 0e 10 00 00       	call   0x402690
  401682:	e8 c9 10 00 00       	call   0x402750
  401687:	e8 04 15 00 00       	call   0x402b90
  40168c:	89 df                	mov    edi,ebx
  40168e:	83 c3 01             	add    ebx,0x1
  401691:	e8 fa 15 00 00       	call   0x402c90
  401696:	83 fb 0d             	cmp    ebx,0xd
  401699:	75 f1                	jne    0x40168c
  40169b:	e8 40 15 00 00       	call   0x402be0
  4016a0:	be 0e 00 00 00       	mov    esi,0xe
  4016a5:	31 c0                	xor    eax,eax
  4016a7:	31 db                	xor    ebx,ebx
  4016a9:	48 8d 3d 6c 99 00 00 	lea    rdi,[rip+0x996c]        # 0x40b01c
  4016b0:	4c 8b 25 01 e9 00 00 	mov    r12,QWORD PTR [rip+0xe901]        # 0x40ffb8
  4016b7:	e8 05 3a 00 00       	call   0x4050c1
  4016bc:	31 d2                	xor    edx,edx
  4016be:	31 f6                	xor    esi,esi
  4016c0:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
  4016c5:	e8 16 16 00 00       	call   0x402ce0
  4016ca:	bf 64 00 00 00       	mov    edi,0x64
  4016cf:	83 c3 01             	add    ebx,0x1
  4016d2:	49 81 c5 00 02 00 00 	add    r13,0x200
  4016d9:	e8 02 26 00 00       	call   0x403ce0
  4016de:	ba 05 00 00 00       	mov    edx,0x5
  4016e3:	be 01 00 00 00       	mov    esi,0x1
  4016e8:	4c 89 e1             	mov    rcx,r12
  4016eb:	48 8d 3d 37 99 00 00 	lea    rdi,[rip+0x9937]        # 0x40b029
  4016f2:	e8 12 39 00 00       	call   0x405009
  4016f7:	31 d2                	xor    edx,edx
  4016f9:	89 de                	mov    esi,ebx
  4016fb:	4c 89 ef             	mov    rdi,r13
  4016fe:	e8 dd 15 00 00       	call   0x402ce0
  401703:	83 fb 0c             	cmp    ebx,0xc
  401706:	75 c2                	jne    0x4016ca
  401708:	4c 89 e1             	mov    rcx,r12
  40170b:	ba 05 00 00 00       	mov    edx,0x5
  401710:	be 01 00 00 00       	mov    esi,0x1
  401715:	41 bc 01 00 00 00    	mov    r12d,0x1
  40171b:	48 8d 3d 01 99 00 00 	lea    rdi,[rip+0x9901]        # 0x40b023
  401722:	e8 e2 38 00 00       	call   0x405009
  401727:	e8 34 1f 00 00       	call   0x403660
  40172c:	e9 af fd ff ff       	jmp    0x4014e0
  401731:	e8 3a 1c 00 00       	call   0x403370
  401736:	e9 37 fe ff ff       	jmp    0x401572
  40173b:	e8 70 27 00 00       	call   0x403eb0
  401740:	c7 44 24 0c ff ff ff 	mov    DWORD PTR [rsp+0xc],0xffffffff
  401747:	ff 
  401748:	89 c3                	mov    ebx,eax
  40174a:	31 c0                	xor    eax,eax
  40174c:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  401750:	e8 6b 25 00 00       	call   0x403cc0
  401755:	85 c0                	test   eax,eax
  401757:	75 6e                	jne    0x4017c7
  401759:	48 8b 15 50 e8 00 00 	mov    rdx,QWORD PTR [rip+0xe850]        # 0x40ffb0
  401760:	be 82 00 00 00       	mov    esi,0x82
  401765:	48 8d bc 24 20 1a 00 	lea    rdi,[rsp+0x1a20]
  40176c:	00 
  40176d:	e8 3d 34 00 00       	call   0x404baf
  401772:	48 85 c0             	test   rax,rax
  401775:	0f 84 a0 fc ff ff    	je     0x40141b
  40177b:	48 8d bc 24 20 1a 00 	lea    rdi,[rsp+0x1a20]
  401782:	00 
  401783:	e8 98 6c 00 00       	call   0x408420
  401788:	b9 09 00 40 00       	mov    ecx,0x400009
  40178d:	eb 26                	jmp    0x4017b5
  40178f:	48 83 e8 01          	sub    rax,0x1
  401793:	0f b6 bc 04 20 1a 00 	movzx  edi,BYTE PTR [rsp+rax*1+0x1a20]
  40179a:	00 
  40179b:	8d 57 f6             	lea    edx,[rdi-0xa]
  40179e:	40 88 3c 24          	mov    BYTE PTR [rsp],dil
  4017a2:	80 fa 16             	cmp    dl,0x16
  4017a5:	77 13                	ja     0x4017ba
  4017a7:	48 0f a3 d1          	bt     rcx,rdx
  4017ab:	73 0d                	jae    0x4017ba
  4017ad:	c6 84 04 20 1a 00 00 	mov    BYTE PTR [rsp+rax*1+0x1a20],0x0
  4017b4:	00 
  4017b5:	48 85 c0             	test   rax,rax
  4017b8:	75 d5                	jne    0x40178f
  4017ba:	4c 8d a4 24 20 1a 00 	lea    r12,[rsp+0x1a20]
  4017c1:	00 
  4017c2:	e9 ac fb ff ff       	jmp    0x401373
  4017c7:	48 8b 3d ea e7 00 00 	mov    rdi,QWORD PTR [rip+0xe7ea]        # 0x40ffb8
  4017ce:	e8 3d 01 00 00       	call   0x401910
  4017d3:	e9 ea fa ff ff       	jmp    0x4012c2
  4017d8:	4c 89 bc 24 f0 20 00 	mov    QWORD PTR [rsp+0x20f0],r15
  4017df:	00 
  4017e0:	e8 67 2b 00 00       	call   0x40434c
  4017e5:	48 31 ed             	xor    rbp,rbp
  4017e8:	48 89 e7             	mov    rdi,rsp
  4017eb:	48 8d 35 0e e8 bf ff 	lea    rsi,[rip+0xffffffffffbfe80e]        # 0x0
  4017f2:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4017f6:	e8 00 00 00 00       	call   0x4017fb
  4017fb:	8b 37                	mov    esi,DWORD PTR [rdi]
  4017fd:	48 8d 57 08          	lea    rdx,[rdi+0x8]
  401801:	49 c7 c0 94 a3 40 00 	mov    r8,0x40a394
  401808:	45 31 c9             	xor    r9d,r9d
  40180b:	48 c7 c1 00 10 40 00 	mov    rcx,0x401000
  401812:	48 c7 c7 c0 10 40 00 	mov    rdi,0x4010c0
  401819:	e9 9e 2a 00 00       	jmp    0x4042bc
  40181e:	66 90                	xchg   ax,ax
  401820:	48 8d 3d f1 ea 00 00 	lea    rdi,[rip+0xeaf1]        # 0x410318
  401827:	48 8d 05 ea ea 00 00 	lea    rax,[rip+0xeaea]        # 0x410318
  40182e:	48 39 f8             	cmp    rax,rdi
  401831:	74 1d                	je     0x401850
  401833:	48 c7 c0 00 00 00 00 	mov    rax,0x0
  40183a:	48 85 c0             	test   rax,rax
  40183d:	74 11                	je     0x401850
  40183f:	ff e0                	jmp    rax
  401841:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401845:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40184c:	00 00 00 00 
  401850:	c3                   	ret
  401851:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401855:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40185c:	00 00 00 00 
  401860:	48 8d 3d b1 ea 00 00 	lea    rdi,[rip+0xeab1]        # 0x410318
  401867:	48 8d 35 aa ea 00 00 	lea    rsi,[rip+0xeaaa]        # 0x410318
  40186e:	48 29 fe             	sub    rsi,rdi
  401871:	48 89 f0             	mov    rax,rsi
  401874:	48 c1 f8 03          	sar    rax,0x3
  401878:	48 c1 ee 3f          	shr    rsi,0x3f
  40187c:	48 01 c6             	add    rsi,rax
  40187f:	48 d1 fe             	sar    rsi,1
  401882:	74 1c                	je     0x4018a0
  401884:	48 c7 c0 00 00 00 00 	mov    rax,0x0
  40188b:	48 85 c0             	test   rax,rax
  40188e:	74 10                	je     0x4018a0
  401890:	ff e0                	jmp    rax
  401892:	0f 1f 00             	nop    DWORD PTR [rax]
  401895:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40189c:	00 00 00 00 
  4018a0:	c3                   	ret
  4018a1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4018a5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4018ac:	00 00 00 00 
  4018b0:	f3 0f 1e fa          	endbr64
  4018b4:	80 3d 65 ea 00 00 00 	cmp    BYTE PTR [rip+0xea65],0x0        # 0x410320
  4018bb:	75 33                	jne    0x4018f0
  4018bd:	48 83 3d 13 e7 00 00 	cmp    QWORD PTR [rip+0xe713],0x0        # 0x40ffd8
  4018c4:	00 
  4018c5:	55                   	push   rbp
  4018c6:	48 89 e5             	mov    rbp,rsp
  4018c9:	74 0d                	je     0x4018d8
  4018cb:	48 8b 3d 2e e7 00 00 	mov    rdi,QWORD PTR [rip+0xe72e]        # 0x410000
  4018d2:	67 e8 6e 2b 00 00    	addr32 call 0x404446
  4018d8:	e8 43 ff ff ff       	call   0x401820
  4018dd:	c6 05 3c ea 00 00 01 	mov    BYTE PTR [rip+0xea3c],0x1        # 0x410320
  4018e4:	5d                   	pop    rbp
  4018e5:	c3                   	ret
  4018e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4018ed:	00 00 00 
  4018f0:	c3                   	ret
  4018f1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4018f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4018fc:	00 00 00 00 
  401900:	f3 0f 1e fa          	endbr64
  401904:	e9 57 ff ff ff       	jmp    0x401860
  401909:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401910:	53                   	push   rbx
  401911:	41 b8 80 00 00 00    	mov    r8d,0x80
  401917:	48 89 fb             	mov    rbx,rdi
  40191a:	31 c0                	xor    eax,eax
  40191c:	48 8d 0d 38 98 00 00 	lea    rcx,[rip+0x9838]        # 0x40b15b
  401923:	48 8d 15 d6 96 00 00 	lea    rdx,[rip+0x96d6]        # 0x40b000
  40192a:	48 8d 35 7f 99 00 00 	lea    rsi,[rip+0x997f]        # 0x40b2b0
  401931:	e8 07 34 00 00       	call   0x404d3d
  401936:	48 89 df             	mov    rdi,rbx
  401939:	48 8d 15 c0 96 00 00 	lea    rdx,[rip+0x96c0]        # 0x40b000
  401940:	31 c0                	xor    eax,eax
  401942:	48 8d 35 97 99 00 00 	lea    rsi,[rip+0x9997]        # 0x40b2e0
  401949:	e8 ef 33 00 00       	call   0x404d3d
  40194e:	48 89 d9             	mov    rcx,rbx
  401951:	ba 21 00 00 00       	mov    edx,0x21
  401956:	be 01 00 00 00       	mov    esi,0x1
  40195b:	48 8d 3d b6 99 00 00 	lea    rdi,[rip+0x99b6]        # 0x40b318
  401962:	e8 a2 36 00 00       	call   0x405009
  401967:	48 89 d9             	mov    rcx,rbx
  40196a:	ba 40 00 00 00       	mov    edx,0x40
  40196f:	be 01 00 00 00       	mov    esi,0x1
  401974:	48 8d 3d c5 99 00 00 	lea    rdi,[rip+0x99c5]        # 0x40b340
  40197b:	e8 89 36 00 00       	call   0x405009
  401980:	48 89 d9             	mov    rcx,rbx
  401983:	5b                   	pop    rbx
  401984:	ba 2c 00 00 00       	mov    edx,0x2c
  401989:	be 01 00 00 00       	mov    esi,0x1
  40198e:	48 8d 3d f3 99 00 00 	lea    rdi,[rip+0x99f3]        # 0x40b388
  401995:	e9 6f 36 00 00       	jmp    0x405009
  40199a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4019a0:	83 e2 03             	and    edx,0x3
  4019a3:	48 8d 05 d6 9a 00 00 	lea    rax,[rip+0x9ad6]        # 0x40b480
  4019aa:	b9 01 00 00 00       	mov    ecx,0x1
  4019af:	4c 8d 04 d0          	lea    r8,[rax+rdx*8]
  4019b3:	66 90                	xchg   ax,ax
  4019b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4019bc:	00 00 00 00 
  4019c0:	48 89 c8             	mov    rax,rcx
  4019c3:	0f b6 54 0f ff       	movzx  edx,BYTE PTR [rdi+rcx*1-0x1]
  4019c8:	25 ff 01 00 00       	and    eax,0x1ff
  4019cd:	0f b6 04 07          	movzx  eax,BYTE PTR [rdi+rax*1]
  4019d1:	01 d2                	add    edx,edx
  4019d3:	09 d0                	or     eax,edx
  4019d5:	8d 91 fe 01 00 00    	lea    edx,[rcx+0x1fe]
  4019db:	81 e2 ff 01 00 00    	and    edx,0x1ff
  4019e1:	0f b6 14 17          	movzx  edx,BYTE PTR [rdi+rdx*1]
  4019e5:	c1 e2 02             	shl    edx,0x2
  4019e8:	09 d0                	or     eax,edx
  4019ea:	83 f0 05             	xor    eax,0x5
  4019ed:	41 0f b6 04 00       	movzx  eax,BYTE PTR [r8+rax*1]
  4019f2:	83 f0 01             	xor    eax,0x1
  4019f5:	88 44 0e ff          	mov    BYTE PTR [rsi+rcx*1-0x1],al
  4019f9:	48 83 c1 01          	add    rcx,0x1
  4019fd:	48 81 f9 01 02 00 00 	cmp    rcx,0x201
  401a04:	75 ba                	jne    0x4019c0
  401a06:	c3                   	ret
  401a07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401a0e:	00 00 
  401a10:	85 d2                	test   edx,edx
  401a12:	7e 2c                	jle    0x401a40
  401a14:	41 89 d2             	mov    r10d,edx
  401a17:	45 31 c9             	xor    r9d,r9d
  401a1a:	eb 0d                	jmp    0x401a29
  401a1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401a20:	48 89 f8             	mov    rax,rdi
  401a23:	48 89 f7             	mov    rdi,rsi
  401a26:	48 89 c6             	mov    rsi,rax
  401a29:	44 89 ca             	mov    edx,r9d
  401a2c:	41 83 c1 01          	add    r9d,0x1
  401a30:	e8 6b ff ff ff       	call   0x4019a0
  401a35:	45 39 ca             	cmp    r10d,r9d
  401a38:	75 e6                	jne    0x401a20
  401a3a:	48 89 f0             	mov    rax,rsi
  401a3d:	c3                   	ret
  401a3e:	66 90                	xchg   ax,ax
  401a40:	48 89 fe             	mov    rsi,rdi
  401a43:	48 89 f0             	mov    rax,rsi
  401a46:	c3                   	ret
  401a47:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a4e:	00 00 00 
  401a51:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a58:	00 00 00 
  401a5b:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a62:	00 00 00 
  401a65:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a6c:	00 00 00 
  401a6f:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a76:	00 00 00 
  401a79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401a80:	41 57                	push   r15
  401a82:	31 d2                	xor    edx,edx
  401a84:	31 ff                	xor    edi,edi
  401a86:	48 8d 35 d3 f0 00 00 	lea    rsi,[rip+0xf0d3]        # 0x410b60
  401a8d:	41 56                	push   r14
  401a8f:	4c 8d 1d ca ee 00 00 	lea    r11,[rip+0xeeca]        # 0x410960
  401a96:	45 31 f6             	xor    r14d,r14d
  401a99:	4c 8d 15 c0 ec 00 00 	lea    r10,[rip+0xecc0]        # 0x410760
  401aa0:	41 55                	push   r13
  401aa2:	4c 8d 0d f7 a7 00 00 	lea    r9,[rip+0xa7f7]        # 0x40c2a0
  401aa9:	4c 8d 2d f0 af 00 00 	lea    r13,[rip+0xaff0]        # 0x40caa0
  401ab0:	41 54                	push   r12
  401ab2:	4c 8d 05 e7 a5 00 00 	lea    r8,[rip+0xa5e7]        # 0x40c0a0
  401ab9:	4c 8d 25 e0 ad 00 00 	lea    r12,[rip+0xade0]        # 0x40c8a0
  401ac0:	55                   	push   rbp
  401ac1:	4c 8d 3d 98 e8 00 00 	lea    r15,[rip+0xe898]        # 0x410360
  401ac8:	48 8d 2d d1 ab 00 00 	lea    rbp,[rip+0xabd1]        # 0x40c6a0
  401acf:	53                   	push   rbx
  401ad0:	48 8d 1d c9 a9 00 00 	lea    rbx,[rip+0xa9c9]        # 0x40c4a0
  401ad7:	48 81 ec 18 02 00 00 	sub    rsp,0x218
  401ade:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401ae5:	00 00 
  401ae7:	48 89 84 24 08 02 00 	mov    QWORD PTR [rsp+0x208],rax
  401aee:	00 
  401aef:	31 c0                	xor    eax,eax
  401af1:	66 89 15 50 e8 00 00 	mov    WORD PTR [rip+0xe850],dx        # 0x410348
  401af8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401aff:	00 
  401b00:	41 0f b6 54 05 00    	movzx  edx,BYTE PTR [r13+rax*1+0x0]
  401b06:	41 32 14 04          	xor    dl,BYTE PTR [r12+rax*1]
  401b0a:	88 14 06             	mov    BYTE PTR [rsi+rax*1],dl
  401b0d:	0f b6 0c 03          	movzx  ecx,BYTE PTR [rbx+rax*1]
  401b11:	0f b6 54 05 00       	movzx  edx,BYTE PTR [rbp+rax*1+0x0]
  401b16:	31 ca                	xor    edx,ecx
  401b18:	41 88 14 03          	mov    BYTE PTR [r11+rax*1],dl
  401b1c:	41 0f b6 14 01       	movzx  edx,BYTE PTR [r9+rax*1]
  401b21:	41 32 14 00          	xor    dl,BYTE PTR [r8+rax*1]
  401b25:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  401b29:	38 4c 05 00          	cmp    BYTE PTR [rbp+rax*1+0x0],cl
  401b2d:	75 11                	jne    0x401b40
  401b2f:	0f b7 d7             	movzx  edx,di
  401b32:	41 be 01 00 00 00    	mov    r14d,0x1
  401b38:	83 c7 01             	add    edi,0x1
  401b3b:	66 41 89 04 57       	mov    WORD PTR [r15+rdx*2],ax
  401b40:	48 83 c0 01          	add    rax,0x1
  401b44:	48 3d 00 02 00 00    	cmp    rax,0x200
  401b4a:	75 b4                	jne    0x401b00
  401b4c:	45 84 f6             	test   r14b,r14b
  401b4f:	74 07                	je     0x401b58
  401b51:	66 89 3d f0 e7 00 00 	mov    WORD PTR [rip+0xe7f0],di        # 0x410348
  401b58:	ba 00 02 00 00       	mov    edx,0x200
  401b5d:	48 8d 3d fc f3 00 00 	lea    rdi,[rip+0xf3fc]        # 0x410f60
  401b64:	bb 06 00 00 00       	mov    ebx,0x6
  401b69:	c7 05 d1 e7 00 00 00 	mov    DWORD PTR [rip+0xe7d1],0x0        # 0x410344
  401b70:	00 00 00 
  401b73:	e8 8b 6e 00 00       	call   0x408a03
  401b78:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401b7f:	00 
  401b80:	89 da                	mov    edx,ebx
  401b82:	48 89 e6             	mov    rsi,rsp
  401b85:	48 8d 3d d4 f3 00 00 	lea    rdi,[rip+0xf3d4]        # 0x410f60
  401b8c:	83 c3 01             	add    ebx,0x1
  401b8f:	e8 0c fe ff ff       	call   0x4019a0
  401b94:	ba 00 02 00 00       	mov    edx,0x200
  401b99:	48 89 e6             	mov    rsi,rsp
  401b9c:	48 8d 3d bd f3 00 00 	lea    rdi,[rip+0xf3bd]        # 0x410f60
  401ba3:	e8 5b 6e 00 00       	call   0x408a03
  401ba8:	83 fb 0c             	cmp    ebx,0xc
  401bab:	75 d3                	jne    0x401b80
  401bad:	ba 00 02 00 00       	mov    edx,0x200
  401bb2:	48 89 e6             	mov    rsi,rsp
  401bb5:	48 8d 3d a4 f1 00 00 	lea    rdi,[rip+0xf1a4]        # 0x410d60
  401bbc:	e8 42 6e 00 00       	call   0x408a03
  401bc1:	31 d2                	xor    edx,edx
  401bc3:	b8 b9 79 37 9e       	mov    eax,0x9e3779b9
  401bc8:	4c 8d 1d d1 a2 00 00 	lea    r11,[rip+0xa2d1]        # 0x40bea0
  401bcf:	4c 8d 15 ca a0 00 00 	lea    r10,[rip+0xa0ca]        # 0x40bca0
  401bd6:	4c 8d 0d c3 9e 00 00 	lea    r9,[rip+0x9ec3]        # 0x40baa0
  401bdd:	4c 8d 05 bc 9c 00 00 	lea    r8,[rip+0x9cbc]        # 0x40b8a0
  401be4:	48 8d 3d b5 9a 00 00 	lea    rdi,[rip+0x9ab5]        # 0x40b6a0
  401beb:	48 8d 35 ae 98 00 00 	lea    rsi,[rip+0x98ae]        # 0x40b4a0
  401bf2:	0f 1f 00             	nop    DWORD PTR [rax]
  401bf5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401bfc:	00 00 00 00 
  401c00:	89 c1                	mov    ecx,eax
  401c02:	c1 e1 05             	shl    ecx,0x5
  401c05:	29 c1                	sub    ecx,eax
  401c07:	41 0f b6 04 13       	movzx  eax,BYTE PTR [r11+rdx*1]
  401c0c:	41 32 04 12          	xor    al,BYTE PTR [r10+rdx*1]
  401c10:	41 32 04 11          	xor    al,BYTE PTR [r9+rdx*1]
  401c14:	41 32 04 10          	xor    al,BYTE PTR [r8+rdx*1]
  401c18:	32 04 17             	xor    al,BYTE PTR [rdi+rdx*1]
  401c1b:	32 04 16             	xor    al,BYTE PTR [rsi+rdx*1]
  401c1e:	48 83 c2 25          	add    rdx,0x25
  401c22:	0f b6 c0             	movzx  eax,al
  401c25:	01 c8                	add    eax,ecx
  401c27:	48 81 fa 06 02 00 00 	cmp    rdx,0x206
  401c2e:	75 d0                	jne    0x401c00
  401c30:	31 05 0a e7 00 00    	xor    DWORD PTR [rip+0xe70a],eax        # 0x410340
  401c36:	48 8b 84 24 08 02 00 	mov    rax,QWORD PTR [rsp+0x208]
  401c3d:	00 
  401c3e:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  401c45:	00 00 
  401c47:	75 12                	jne    0x401c5b
  401c49:	48 81 c4 18 02 00 00 	add    rsp,0x218
  401c50:	5b                   	pop    rbx
  401c51:	5d                   	pop    rbp
  401c52:	41 5c                	pop    r12
  401c54:	41 5d                	pop    r13
  401c56:	41 5e                	pop    r14
  401c58:	41 5f                	pop    r15
  401c5a:	c3                   	ret
  401c5b:	e8 ec 26 00 00       	call   0x40434c
  401c60:	53                   	push   rbx
  401c61:	8b 1d dd e6 00 00    	mov    ebx,DWORD PTR [rip+0xe6dd]        # 0x410344
  401c67:	83 e7 7f             	and    edi,0x7f
  401c6a:	ba 00 02 00 00       	mov    edx,0x200
  401c6f:	48 8d 35 ea f2 00 00 	lea    rsi,[rip+0xf2ea]        # 0x410f60
  401c76:	09 fb                	or     ebx,edi
  401c78:	48 8d 3d e1 f0 00 00 	lea    rdi,[rip+0xf0e1]        # 0x410d60
  401c7f:	89 1d bf e6 00 00    	mov    DWORD PTR [rip+0xe6bf],ebx        # 0x410344
  401c85:	e8 79 6d 00 00       	call   0x408a03
  401c8a:	85 db                	test   ebx,ebx
  401c8c:	74 32                	je     0x401cc0
  401c8e:	0f b7 15 b3 e6 00 00 	movzx  edx,WORD PTR [rip+0xe6b3]        # 0x410348
  401c95:	66 85 d2             	test   dx,dx
  401c98:	74 26                	je     0x401cc0
  401c9a:	69 c3 b1 79 37 9e    	imul   eax,ebx,0x9e3779b1
  401ca0:	0f b7 ca             	movzx  ecx,dx
  401ca3:	31 d2                	xor    edx,edx
  401ca5:	c1 e8 0d             	shr    eax,0xd
  401ca8:	f7 f1                	div    ecx
  401caa:	48 8d 05 af e6 00 00 	lea    rax,[rip+0xe6af]        # 0x410360
  401cb1:	48 8d 0d a8 f0 00 00 	lea    rcx,[rip+0xf0a8]        # 0x410d60
  401cb8:	0f b7 04 50          	movzx  eax,WORD PTR [rax+rdx*2]
  401cbc:	80 34 01 01          	xor    BYTE PTR [rcx+rax*1],0x1
  401cc0:	5b                   	pop    rbx
  401cc1:	c3                   	ret
  401cc2:	0f 1f 00             	nop    DWORD PTR [rax]
  401cc5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401ccc:	00 00 00 00 
  401cd0:	44 8b 05 6d e6 00 00 	mov    r8d,DWORD PTR [rip+0xe66d]        # 0x410344
  401cd7:	53                   	push   rbx
  401cd8:	49 89 f1             	mov    r9,rsi
  401cdb:	49 89 fb             	mov    r11,rdi
  401cde:	41 ba 0b 27 ed 51    	mov    r10d,0x51ed270b
  401ce4:	31 c0                	xor    eax,eax
  401ce6:	31 f6                	xor    esi,esi
  401ce8:	41 83 e0 01          	and    r8d,0x1
  401cec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401cf0:	81 fe 00 02 00 00    	cmp    esi,0x200
  401cf6:	75 70                	jne    0x401d68
  401cf8:	31 ff                	xor    edi,edi
  401cfa:	48 8d 1d 5f ea 00 00 	lea    rbx,[rip+0xea5f]        # 0x410760
  401d01:	4c 8d 1d 58 ee 00 00 	lea    r11,[rip+0xee58]        # 0x410b60
  401d08:	89 fe                	mov    esi,edi
  401d0a:	83 c7 01             	add    edi,0x1
  401d0d:	41 0f b6 14 31       	movzx  edx,BYTE PTR [r9+rsi*1]
  401d12:	41 32 14 33          	xor    dl,BYTE PTR [r11+rsi*1]
  401d16:	0f b6 d2             	movzx  edx,dl
  401d19:	0f b6 0c 33          	movzx  ecx,BYTE PTR [rbx+rsi*1]
  401d1d:	89 d6                	mov    esi,edx
  401d1f:	f7 de                	neg    esi
  401d21:	09 d6                	or     esi,edx
  401d23:	c1 fe 1f             	sar    esi,0x1f
  401d26:	83 c6 01             	add    esi,0x1
  401d29:	09 ce                	or     esi,ecx
  401d2b:	01 c9                	add    ecx,ecx
  401d2d:	d3 e2                	shl    edx,cl
  401d2f:	31 f2                	xor    edx,esi
  401d31:	83 ca 01             	or     edx,0x1
  401d34:	89 d1                	mov    ecx,edx
  401d36:	44 31 d2             	xor    edx,r10d
  401d39:	44 21 d1             	and    ecx,r10d
  401d3c:	44 8d 14 4a          	lea    r10d,[rdx+rcx*2]
  401d40:	89 f2                	mov    edx,esi
  401d42:	31 c6                	xor    esi,eax
  401d44:	21 c2                	and    edx,eax
  401d46:	8d 04 56             	lea    eax,[rsi+rdx*2]
  401d49:	81 ff 00 02 00 00    	cmp    edi,0x200
  401d4f:	75 b7                	jne    0x401d08
  401d51:	45 85 c0             	test   r8d,r8d
  401d54:	74 07                	je     0x401d5d
  401d56:	44 89 15 e3 e5 00 00 	mov    DWORD PTR [rip+0xe5e3],r10d        # 0x410340
  401d5d:	0f b7 c0             	movzx  eax,ax
  401d60:	5b                   	pop    rbx
  401d61:	c3                   	ret
  401d62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401d68:	89 f7                	mov    edi,esi
  401d6a:	48 8d 15 ef eb 00 00 	lea    rdx,[rip+0xebef]        # 0x410960
  401d71:	48 8d 1d e8 ef 00 00 	lea    rbx,[rip+0xefe8]        # 0x410d60
  401d78:	83 c6 01             	add    esi,0x1
  401d7b:	0f b6 0c 3a          	movzx  ecx,BYTE PTR [rdx+rdi*1]
  401d7f:	41 0f b6 14 3b       	movzx  edx,BYTE PTR [r11+rdi*1]
  401d84:	32 14 3b             	xor    dl,BYTE PTR [rbx+rdi*1]
  401d87:	0f b6 d2             	movzx  edx,dl
  401d8a:	89 d7                	mov    edi,edx
  401d8c:	f7 df                	neg    edi
  401d8e:	09 d7                	or     edi,edx
  401d90:	c1 ff 1f             	sar    edi,0x1f
  401d93:	83 c7 01             	add    edi,0x1
  401d96:	09 cf                	or     edi,ecx
  401d98:	01 c9                	add    ecx,ecx
  401d9a:	d3 e2                	shl    edx,cl
  401d9c:	31 fa                	xor    edx,edi
  401d9e:	83 ca 01             	or     edx,0x1
  401da1:	89 d1                	mov    ecx,edx
  401da3:	44 31 d2             	xor    edx,r10d
  401da6:	44 21 d1             	and    ecx,r10d
  401da9:	44 8d 14 4a          	lea    r10d,[rdx+rcx*2]
  401dad:	89 fa                	mov    edx,edi
  401daf:	31 c7                	xor    edi,eax
  401db1:	21 c2                	and    edx,eax
  401db3:	8d 04 57             	lea    eax,[rdi+rdx*2]
  401db6:	e9 35 ff ff ff       	jmp    0x401cf0
  401dbb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401dc0:	48 81 ec 98 00 00 00 	sub    rsp,0x98
  401dc7:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401dce:	00 00 
  401dd0:	48 89 44 24 68       	mov    QWORD PTR [rsp+0x68],rax
  401dd5:	8b 05 2d e2 00 00    	mov    eax,DWORD PTR [rip+0xe22d]        # 0x410008
  401ddb:	85 c0                	test   eax,eax
  401ddd:	78 21                	js     0x401e00
  401ddf:	48 8b 54 24 68       	mov    rdx,QWORD PTR [rsp+0x68]
  401de4:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  401deb:	00 00 
  401ded:	0f 85 4a 01 00 00    	jne    0x401f3d
  401df3:	48 81 c4 98 00 00 00 	add    rsp,0x98
  401dfa:	c3                   	ret
  401dfb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401e00:	f3 0f 7e 05 80 e1 00 	movq   xmm0,QWORD PTR [rip+0xe180]        # 0x40ff88
  401e07:	00 
  401e08:	48 8d 05 30 92 00 00 	lea    rax,[rip+0x9230]        # 0x40b03f
  401e0f:	48 89 5c 24 70       	mov    QWORD PTR [rsp+0x70],rbx
  401e14:	48 8d 3d 14 92 00 00 	lea    rdi,[rip+0x9214]        # 0x40b02f
  401e1b:	66 48 0f 6e c8       	movq   xmm1,rax
  401e20:	4c 89 b4 24 90 00 00 	mov    QWORD PTR [rsp+0x90],r14
  401e27:	00 
  401e28:	49 89 e6             	mov    r14,rsp
  401e2b:	66 0f 6c c1          	punpcklqdq xmm0,xmm1
  401e2f:	48 89 6c 24 78       	mov    QWORD PTR [rsp+0x78],rbp
  401e34:	4c 89 a4 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r12
  401e3b:	00 
  401e3c:	4c 89 ac 24 88 00 00 	mov    QWORD PTR [rsp+0x88],r13
  401e43:	00 
  401e44:	c7 05 ba e1 00 00 00 	mov    DWORD PTR [rip+0xe1ba],0x0        # 0x410008
  401e4b:	00 00 00 
  401e4e:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
  401e55:	00 00 
  401e57:	0f 11 44 24 08       	movups XMMWORD PTR [rsp+0x8],xmm0
  401e5c:	eb 13                	jmp    0x401e71
  401e5e:	66 90                	xchg   ax,ax
  401e60:	49 8b 7e 08          	mov    rdi,QWORD PTR [r14+0x8]
  401e64:	49 83 c6 08          	add    r14,0x8
  401e68:	48 85 ff             	test   rdi,rdi
  401e6b:	0f 84 9f 00 00 00    	je     0x401f10
  401e71:	e8 d8 24 00 00       	call   0x40434e
  401e76:	48 89 c5             	mov    rbp,rax
  401e79:	48 85 c0             	test   rax,rax
  401e7c:	74 e2                	je     0x401e60
  401e7e:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401e81:	74 dd                	je     0x401e60
  401e83:	48 89 c7             	mov    rdi,rax
  401e86:	41 bc 3f 00 00 00    	mov    r12d,0x3f
  401e8c:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
  401e91:	e8 8a 65 00 00       	call   0x408420
  401e96:	4c 39 e0             	cmp    rax,r12
  401e99:	4c 0f 46 e0          	cmovbe r12,rax
  401e9d:	48 85 c0             	test   rax,rax
  401ea0:	74 26                	je     0x401ec8
  401ea2:	31 db                	xor    ebx,ebx
  401ea4:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
  401ea9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401eb0:	0f b6 7c 1d 00       	movzx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401eb5:	e8 ad 21 00 00       	call   0x404067
  401eba:	41 88 44 1d 00       	mov    BYTE PTR [r13+rbx*1+0x0],al
  401ebf:	48 83 c3 01          	add    rbx,0x1
  401ec3:	4c 39 e3             	cmp    rbx,r12
  401ec6:	72 e8                	jb     0x401eb0
  401ec8:	48 8d 35 75 91 00 00 	lea    rsi,[rip+0x9175]        # 0x40b044
  401ecf:	4c 89 ef             	mov    rdi,r13
  401ed2:	42 c6 44 24 20 00    	mov    BYTE PTR [rsp+r12*1+0x20],0x0
  401ed8:	e8 c3 69 00 00       	call   0x4088a0
  401edd:	48 85 c0             	test   rax,rax
  401ee0:	75 18                	jne    0x401efa
  401ee2:	48 8d 35 61 91 00 00 	lea    rsi,[rip+0x9161]        # 0x40b04a
  401ee9:	4c 89 ef             	mov    rdi,r13
  401eec:	e8 af 69 00 00       	call   0x4088a0
  401ef1:	48 85 c0             	test   rax,rax
  401ef4:	0f 84 66 ff ff ff    	je     0x401e60
  401efa:	c7 05 04 e1 00 00 01 	mov    DWORD PTR [rip+0xe104],0x1        # 0x410008
  401f01:	00 00 00 
  401f04:	b8 01 00 00 00       	mov    eax,0x1
  401f09:	eb 0b                	jmp    0x401f16
  401f0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401f10:	8b 05 f2 e0 00 00    	mov    eax,DWORD PTR [rip+0xe0f2]        # 0x410008
  401f16:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
  401f1b:	48 8b 6c 24 78       	mov    rbp,QWORD PTR [rsp+0x78]
  401f20:	4c 8b a4 24 80 00 00 	mov    r12,QWORD PTR [rsp+0x80]
  401f27:	00 
  401f28:	4c 8b ac 24 88 00 00 	mov    r13,QWORD PTR [rsp+0x88]
  401f2f:	00 
  401f30:	4c 8b b4 24 90 00 00 	mov    r14,QWORD PTR [rsp+0x90]
  401f37:	00 
  401f38:	e9 a2 fe ff ff       	jmp    0x401ddf
  401f3d:	48 89 5c 24 70       	mov    QWORD PTR [rsp+0x70],rbx
  401f42:	48 89 6c 24 78       	mov    QWORD PTR [rsp+0x78],rbp
  401f47:	4c 89 a4 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r12
  401f4e:	00 
  401f4f:	4c 89 ac 24 88 00 00 	mov    QWORD PTR [rsp+0x88],r13
  401f56:	00 
  401f57:	4c 89 b4 24 90 00 00 	mov    QWORD PTR [rsp+0x90],r14
  401f5e:	00 
  401f5f:	e8 e8 23 00 00       	call   0x40434c
  401f64:	90                   	nop
  401f65:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401f6c:	00 00 00 00 
  401f70:	8b 05 96 e0 00 00    	mov    eax,DWORD PTR [rip+0xe096]        # 0x41000c
  401f76:	85 c0                	test   eax,eax
  401f78:	78 06                	js     0x401f80
  401f7a:	c3                   	ret
  401f7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401f80:	48 83 ec 18          	sub    rsp,0x18
  401f84:	48 8d 3d c4 90 00 00 	lea    rdi,[rip+0x90c4]        # 0x40b04f
  401f8b:	e8 be 23 00 00       	call   0x40434e
  401f90:	48 89 c2             	mov    rdx,rax
  401f93:	48 85 c0             	test   rax,rax
  401f96:	74 07                	je     0x401f9f
  401f98:	31 c0                	xor    eax,eax
  401f9a:	80 3a 00             	cmp    BYTE PTR [rdx],0x0
  401f9d:	75 7f                	jne    0x40201e
  401f9f:	bf 01 00 00 00       	mov    edi,0x1
  401fa4:	e8 26 6d 00 00       	call   0x408ccf
  401fa9:	85 c0                	test   eax,eax
  401fab:	74 71                	je     0x40201e
  401fad:	48 8d 3d a4 90 00 00 	lea    rdi,[rip+0x90a4]        # 0x40b058
  401fb4:	e8 95 23 00 00       	call   0x40434e
  401fb9:	48 89 c7             	mov    rdi,rax
  401fbc:	48 85 c0             	test   rax,rax
  401fbf:	74 2c                	je     0x401fed
  401fc1:	48 8d 35 9a 90 00 00 	lea    rsi,[rip+0x909a]        # 0x40b062
  401fc8:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  401fcd:	e8 ce 68 00 00       	call   0x4088a0
  401fd2:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  401fd7:	48 85 c0             	test   rax,rax
  401fda:	75 54                	jne    0x402030
  401fdc:	48 8d 35 89 90 00 00 	lea    rsi,[rip+0x9089]        # 0x40b06c
  401fe3:	e8 b8 68 00 00       	call   0x4088a0
  401fe8:	48 85 c0             	test   rax,rax
  401feb:	75 43                	jne    0x402030
  401fed:	48 8d 3d 69 90 00 00 	lea    rdi,[rip+0x9069]        # 0x40b05d
  401ff4:	e8 55 23 00 00       	call   0x40434e
  401ff9:	48 89 c7             	mov    rdi,rax
  401ffc:	b8 01 00 00 00       	mov    eax,0x1
  402001:	48 85 ff             	test   rdi,rdi
  402004:	74 18                	je     0x40201e
  402006:	48 8d 35 65 90 00 00 	lea    rsi,[rip+0x9065]        # 0x40b072
  40200d:	e8 8e 68 00 00       	call   0x4088a0
  402012:	48 83 f8 01          	cmp    rax,0x1
  402016:	b8 01 00 00 00       	mov    eax,0x1
  40201b:	83 d8 ff             	sbb    eax,0xffffffff
  40201e:	89 05 e8 df 00 00    	mov    DWORD PTR [rip+0xdfe8],eax        # 0x41000c
  402024:	48 83 c4 18          	add    rsp,0x18
  402028:	c3                   	ret
  402029:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402030:	b8 02 00 00 00       	mov    eax,0x2
  402035:	eb e7                	jmp    0x40201e
  402037:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40203e:	00 00 
  402040:	55                   	push   rbp
  402041:	89 fd                	mov    ebp,edi
  402043:	53                   	push   rbx
  402044:	48 8d 1d 34 90 00 00 	lea    rbx,[rip+0x9034]        # 0x40b07f
  40204b:	48 83 ec 08          	sub    rsp,0x8
  40204f:	e8 6c fd ff ff       	call   0x401dc0
  402054:	85 c0                	test   eax,eax
  402056:	48 8d 05 1e 90 00 00 	lea    rax,[rip+0x901e]        # 0x40b07b
  40205d:	48 0f 45 d8          	cmovne rbx,rax
  402061:	e8 0a ff ff ff       	call   0x401f70
  402066:	85 c0                	test   eax,eax
  402068:	75 56                	jne    0x4020c0
  40206a:	48 8b 35 47 df 00 00 	mov    rsi,QWORD PTR [rip+0xdf47]        # 0x40ffb8
  402071:	48 89 df             	mov    rdi,rbx
  402074:	e8 73 2e 00 00       	call   0x404eec
  402079:	e8 f2 fe ff ff       	call   0x401f70
  40207e:	85 c0                	test   eax,eax
  402080:	0f 85 b2 00 00 00    	jne    0x402138
  402086:	e8 e5 fe ff ff       	call   0x401f70
  40208b:	85 c0                	test   eax,eax
  40208d:	0f 85 7d 00 00 00    	jne    0x402110
  402093:	89 ee                	mov    esi,ebp
  402095:	48 8d 3d ea 8f 00 00 	lea    rdi,[rip+0x8fea]        # 0x40b086
  40209c:	31 c0                	xor    eax,eax
  40209e:	e8 1e 30 00 00       	call   0x4050c1
  4020a3:	e8 c8 fe ff ff       	call   0x401f70
  4020a8:	85 c0                	test   eax,eax
  4020aa:	75 34                	jne    0x4020e0
  4020ac:	48 83 c4 08          	add    rsp,0x8
  4020b0:	bf 20 00 00 00       	mov    edi,0x20
  4020b5:	5b                   	pop    rbx
  4020b6:	5d                   	pop    rbp
  4020b7:	e9 76 31 00 00       	jmp    0x405232
  4020bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4020c0:	48 8b 0d f1 de 00 00 	mov    rcx,QWORD PTR [rip+0xdef1]        # 0x40ffb8
  4020c7:	ba 05 00 00 00       	mov    edx,0x5
  4020cc:	be 01 00 00 00       	mov    esi,0x1
  4020d1:	48 8d 3d 5b 90 00 00 	lea    rdi,[rip+0x905b]        # 0x40b133
  4020d8:	e8 2c 2f 00 00       	call   0x405009
  4020dd:	eb 8b                	jmp    0x40206a
  4020df:	90                   	nop
  4020e0:	48 8b 0d d1 de 00 00 	mov    rcx,QWORD PTR [rip+0xded1]        # 0x40ffb8
  4020e7:	ba 04 00 00 00       	mov    edx,0x4
  4020ec:	be 01 00 00 00       	mov    esi,0x1
  4020f1:	48 8d 3d 89 8f 00 00 	lea    rdi,[rip+0x8f89]        # 0x40b081
  4020f8:	e8 0c 2f 00 00       	call   0x405009
  4020fd:	48 83 c4 08          	add    rsp,0x8
  402101:	bf 20 00 00 00       	mov    edi,0x20
  402106:	5b                   	pop    rbx
  402107:	5d                   	pop    rbp
  402108:	e9 25 31 00 00       	jmp    0x405232
  40210d:	0f 1f 00             	nop    DWORD PTR [rax]
  402110:	48 8b 0d a1 de 00 00 	mov    rcx,QWORD PTR [rip+0xdea1]        # 0x40ffb8
  402117:	ba 05 00 00 00       	mov    edx,0x5
  40211c:	be 01 00 00 00       	mov    esi,0x1
  402121:	48 8d 3d 0b 90 00 00 	lea    rdi,[rip+0x900b]        # 0x40b133
  402128:	e8 dc 2e 00 00       	call   0x405009
  40212d:	e9 61 ff ff ff       	jmp    0x402093
  402132:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402138:	48 8b 0d 79 de 00 00 	mov    rcx,QWORD PTR [rip+0xde79]        # 0x40ffb8
  40213f:	ba 04 00 00 00       	mov    edx,0x4
  402144:	be 01 00 00 00       	mov    esi,0x1
  402149:	48 8d 3d 31 8f 00 00 	lea    rdi,[rip+0x8f31]        # 0x40b081
  402150:	e8 b4 2e 00 00       	call   0x405009
  402155:	e9 2c ff ff ff       	jmp    0x402086
  40215a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402160:	55                   	push   rbp
  402161:	89 fd                	mov    ebp,edi
  402163:	53                   	push   rbx
  402164:	48 8d 1d 14 8f 00 00 	lea    rbx,[rip+0x8f14]        # 0x40b07f
  40216b:	48 83 ec 08          	sub    rsp,0x8
  40216f:	e8 4c fc ff ff       	call   0x401dc0
  402174:	bf 20 00 00 00       	mov    edi,0x20
  402179:	85 c0                	test   eax,eax
  40217b:	48 8d 05 f9 8e 00 00 	lea    rax,[rip+0x8ef9]        # 0x40b07b
  402182:	48 0f 45 d8          	cmovne rbx,rax
  402186:	e8 a7 30 00 00       	call   0x405232
  40218b:	e8 e0 fd ff ff       	call   0x401f70
  402190:	85 c0                	test   eax,eax
  402192:	75 2c                	jne    0x4021c0
  402194:	48 8b 35 1d de 00 00 	mov    rsi,QWORD PTR [rip+0xde1d]        # 0x40ffb8
  40219b:	48 89 df             	mov    rdi,rbx
  40219e:	e8 49 2d 00 00       	call   0x404eec
  4021a3:	e8 c8 fd ff ff       	call   0x401f70
  4021a8:	85 c0                	test   eax,eax
  4021aa:	75 44                	jne    0x4021f0
  4021ac:	85 ed                	test   ebp,ebp
  4021ae:	75 30                	jne    0x4021e0
  4021b0:	48 83 c4 08          	add    rsp,0x8
  4021b4:	5b                   	pop    rbx
  4021b5:	5d                   	pop    rbp
  4021b6:	c3                   	ret
  4021b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4021be:	00 00 
  4021c0:	48 8b 0d f1 dd 00 00 	mov    rcx,QWORD PTR [rip+0xddf1]        # 0x40ffb8
  4021c7:	ba 05 00 00 00       	mov    edx,0x5
  4021cc:	be 01 00 00 00       	mov    esi,0x1
  4021d1:	48 8d 3d 5b 8f 00 00 	lea    rdi,[rip+0x8f5b]        # 0x40b133
  4021d8:	e8 2c 2e 00 00       	call   0x405009
  4021dd:	eb b5                	jmp    0x402194
  4021df:	90                   	nop
  4021e0:	48 83 c4 08          	add    rsp,0x8
  4021e4:	bf 0a 00 00 00       	mov    edi,0xa
  4021e9:	5b                   	pop    rbx
  4021ea:	5d                   	pop    rbp
  4021eb:	e9 42 30 00 00       	jmp    0x405232
  4021f0:	48 8b 0d c1 dd 00 00 	mov    rcx,QWORD PTR [rip+0xddc1]        # 0x40ffb8
  4021f7:	ba 04 00 00 00       	mov    edx,0x4
  4021fc:	be 01 00 00 00       	mov    esi,0x1
  402201:	48 8d 3d 79 8e 00 00 	lea    rdi,[rip+0x8e79]        # 0x40b081
  402208:	e8 fc 2d 00 00       	call   0x405009
  40220d:	eb 9d                	jmp    0x4021ac
  40220f:	90                   	nop
  402210:	41 55                	push   r13
  402212:	49 89 f5             	mov    r13,rsi
  402215:	41 54                	push   r12
  402217:	49 89 d4             	mov    r12,rdx
  40221a:	55                   	push   rbp
  40221b:	53                   	push   rbx
  40221c:	48 89 fb             	mov    rbx,rdi
  40221f:	48 83 ec 08          	sub    rsp,0x8
  402223:	e8 48 fd ff ff       	call   0x401f70
  402228:	48 8b 2d 89 dd 00 00 	mov    rbp,QWORD PTR [rip+0xdd89]        # 0x40ffb8
  40222f:	85 c0                	test   eax,eax
  402231:	75 5d                	jne    0x402290
  402233:	48 89 df             	mov    rdi,rbx
  402236:	48 89 ee             	mov    rsi,rbp
  402239:	bb 45 00 00 00       	mov    ebx,0x45
  40223e:	e8 a9 2c 00 00       	call   0x404eec
  402243:	66 90                	xchg   ax,ax
  402245:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40224c:	00 00 00 00 
  402250:	48 89 ee             	mov    rsi,rbp
  402253:	4c 89 e7             	mov    rdi,r12
  402256:	e8 91 2c 00 00       	call   0x404eec
  40225b:	83 eb 01             	sub    ebx,0x1
  40225e:	75 f0                	jne    0x402250
  402260:	48 89 ee             	mov    rsi,rbp
  402263:	4c 89 ef             	mov    rdi,r13
  402266:	e8 81 2c 00 00       	call   0x404eec
  40226b:	e8 00 fd ff ff       	call   0x401f70
  402270:	85 c0                	test   eax,eax
  402272:	75 3c                	jne    0x4022b0
  402274:	48 83 c4 08          	add    rsp,0x8
  402278:	bf 0a 00 00 00       	mov    edi,0xa
  40227d:	5b                   	pop    rbx
  40227e:	5d                   	pop    rbp
  40227f:	41 5c                	pop    r12
  402281:	41 5d                	pop    r13
  402283:	e9 aa 2f 00 00       	jmp    0x405232
  402288:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40228f:	00 
  402290:	48 89 e9             	mov    rcx,rbp
  402293:	ba 05 00 00 00       	mov    edx,0x5
  402298:	be 01 00 00 00       	mov    esi,0x1
  40229d:	48 8d 3d 8f 8e 00 00 	lea    rdi,[rip+0x8e8f]        # 0x40b133
  4022a4:	e8 60 2d 00 00       	call   0x405009
  4022a9:	eb 88                	jmp    0x402233
  4022ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022b0:	48 89 e9             	mov    rcx,rbp
  4022b3:	ba 04 00 00 00       	mov    edx,0x4
  4022b8:	be 01 00 00 00       	mov    esi,0x1
  4022bd:	48 8d 3d bd 8d 00 00 	lea    rdi,[rip+0x8dbd]        # 0x40b081
  4022c4:	e8 40 2d 00 00       	call   0x405009
  4022c9:	eb a9                	jmp    0x402274
  4022cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022d0:	8b 05 8a ee 00 00    	mov    eax,DWORD PTR [rip+0xee8a]        # 0x411160
  4022d6:	85 c0                	test   eax,eax
  4022d8:	75 06                	jne    0x4022e0
  4022da:	c3                   	ret
  4022db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022e0:	48 83 ec 08          	sub    rsp,0x8
  4022e4:	48 8b 0d cd dc 00 00 	mov    rcx,QWORD PTR [rip+0xdccd]        # 0x40ffb8
  4022eb:	ba 06 00 00 00       	mov    edx,0x6
  4022f0:	be 01 00 00 00       	mov    esi,0x1
  4022f5:	48 8d 3d 90 8d 00 00 	lea    rdi,[rip+0x8d90]        # 0x40b08c
  4022fc:	e8 08 2d 00 00       	call   0x405009
  402301:	48 8b 3d b0 dc 00 00 	mov    rdi,QWORD PTR [rip+0xdcb0]        # 0x40ffb8
  402308:	e8 4d 27 00 00       	call   0x404a5a
  40230d:	c7 05 49 ee 00 00 00 	mov    DWORD PTR [rip+0xee49],0x0        # 0x411160
  402314:	00 00 00 
  402317:	48 83 c4 08          	add    rsp,0x8
  40231b:	c3                   	ret
  40231c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402320:	41 56                	push   r14
  402322:	41 89 f6             	mov    r14d,esi
  402325:	41 55                	push   r13
  402327:	41 89 cd             	mov    r13d,ecx
  40232a:	41 54                	push   r12
  40232c:	41 89 d4             	mov    r12d,edx
  40232f:	55                   	push   rbp
  402330:	89 fd                	mov    ebp,edi
  402332:	53                   	push   rbx
  402333:	48 83 ec 10          	sub    rsp,0x10
  402337:	e8 34 fc ff ff       	call   0x401f70
  40233c:	89 c3                	mov    ebx,eax
  40233e:	e8 7d fa ff ff       	call   0x401dc0
  402343:	85 c0                	test   eax,eax
  402345:	0f 84 95 00 00 00    	je     0x4023e0
  40234b:	4c 8d 05 41 8d 00 00 	lea    r8,[rip+0x8d41]        # 0x40b093
  402352:	4c 8d 0d 3e 8d 00 00 	lea    r9,[rip+0x8d3e]        # 0x40b097
  402359:	85 db                	test   ebx,ebx
  40235b:	0f 84 95 00 00 00    	je     0x4023f6
  402361:	45 85 ed             	test   r13d,r13d
  402364:	0f 85 b6 00 00 00    	jne    0x402420
  40236a:	41 83 fc 01          	cmp    r12d,0x1
  40236e:	0f 84 5c 01 00 00    	je     0x4024d0
  402374:	41 83 fc 02          	cmp    r12d,0x2
  402378:	0f 84 12 01 00 00    	je     0x402490
  40237e:	85 ed                	test   ebp,ebp
  402380:	0f 84 8a 01 00 00    	je     0x402510
  402386:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  40238a:	83 fb 02             	cmp    ebx,0x2
  40238d:	0f 84 2d 02 00 00    	je     0x4025c0
  402393:	e8 d8 fb ff ff       	call   0x401f70
  402398:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  40239c:	83 f8 02             	cmp    eax,0x2
  40239f:	0f 84 8b 02 00 00    	je     0x402630
  4023a5:	43 8d 14 b6          	lea    edx,[r14+r14*4]
  4023a9:	48 63 c2             	movsxd rax,edx
  4023ac:	c1 fa 1f             	sar    edx,0x1f
  4023af:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  4023b6:	48 c1 f8 21          	sar    rax,0x21
  4023ba:	29 d0                	sub    eax,edx
  4023bc:	48 8d 15 ed a8 00 00 	lea    rdx,[rip+0xa8ed]        # 0x40ccb0
  4023c3:	48 98                	cdqe
  4023c5:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  4023c8:	48 8d 3d 19 8d 00 00 	lea    rdi,[rip+0x8d19]        # 0x40b0e8
  4023cf:	31 c0                	xor    eax,eax
  4023d1:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4023d5:	e8 e7 2c 00 00       	call   0x4050c1
  4023da:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  4023de:	eb 72                	jmp    0x402452
  4023e0:	4c 8d 05 b3 8c 00 00 	lea    r8,[rip+0x8cb3]        # 0x40b09a
  4023e7:	4c 8d 0d ae 8c 00 00 	lea    r9,[rip+0x8cae]        # 0x40b09c
  4023ee:	85 db                	test   ebx,ebx
  4023f0:	0f 85 6b ff ff ff    	jne    0x402361
  4023f6:	85 ed                	test   ebp,ebp
  4023f8:	48 8b 35 b9 db 00 00 	mov    rsi,QWORD PTR [rip+0xdbb9]        # 0x40ffb8
  4023ff:	4d 0f 45 c8          	cmovne r9,r8
  402403:	48 83 c4 10          	add    rsp,0x10
  402407:	5b                   	pop    rbx
  402408:	5d                   	pop    rbp
  402409:	4c 89 cf             	mov    rdi,r9
  40240c:	41 5c                	pop    r12
  40240e:	41 5d                	pop    r13
  402410:	41 5e                	pop    r14
  402412:	e9 d5 2a 00 00       	jmp    0x404eec
  402417:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40241e:	00 00 
  402420:	48 8b 0d 91 db 00 00 	mov    rcx,QWORD PTR [rip+0xdb91]        # 0x40ffb8
  402427:	ba 07 00 00 00       	mov    edx,0x7
  40242c:	4c 89 0c 24          	mov    QWORD PTR [rsp],r9
  402430:	be 01 00 00 00       	mov    esi,0x1
  402435:	48 8d 3d 76 8c 00 00 	lea    rdi,[rip+0x8c76]        # 0x40b0b2
  40243c:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  402441:	e8 c3 2b 00 00       	call   0x405009
  402446:	4c 8b 44 24 08       	mov    r8,QWORD PTR [rsp+0x8]
  40244b:	85 ed                	test   ebp,ebp
  40244d:	4c 0f 44 04 24       	cmove  r8,QWORD PTR [rsp]
  402452:	48 8b 35 5f db 00 00 	mov    rsi,QWORD PTR [rip+0xdb5f]        # 0x40ffb8
  402459:	4c 89 c7             	mov    rdi,r8
  40245c:	e8 8b 2a 00 00       	call   0x404eec
  402461:	ba 04 00 00 00       	mov    edx,0x4
  402466:	48 8b 0d 4b db 00 00 	mov    rcx,QWORD PTR [rip+0xdb4b]        # 0x40ffb8
  40246d:	48 83 c4 10          	add    rsp,0x10
  402471:	5b                   	pop    rbx
  402472:	be 01 00 00 00       	mov    esi,0x1
  402477:	48 8d 3d 03 8c 00 00 	lea    rdi,[rip+0x8c03]        # 0x40b081
  40247e:	5d                   	pop    rbp
  40247f:	41 5c                	pop    r12
  402481:	41 5d                	pop    r13
  402483:	41 5e                	pop    r14
  402485:	e9 7f 2b 00 00       	jmp    0x405009
  40248a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402490:	85 ed                	test   ebp,ebp
  402492:	0f 84 d8 00 00 00    	je     0x402570
  402498:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  40249c:	48 8b 0d 15 db 00 00 	mov    rcx,QWORD PTR [rip+0xdb15]        # 0x40ffb8
  4024a3:	83 fb 02             	cmp    ebx,0x2
  4024a6:	0f 84 64 01 00 00    	je     0x402610
  4024ac:	ba 05 00 00 00       	mov    edx,0x5
  4024b1:	be 01 00 00 00       	mov    esi,0x1
  4024b6:	48 8d 3d 1a 8c 00 00 	lea    rdi,[rip+0x8c1a]        # 0x40b0d7
  4024bd:	e8 47 2b 00 00       	call   0x405009
  4024c2:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  4024c6:	eb 8a                	jmp    0x402452
  4024c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4024cf:	00 
  4024d0:	85 ed                	test   ebp,ebp
  4024d2:	74 74                	je     0x402548
  4024d4:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4024d8:	48 8b 0d d9 da 00 00 	mov    rcx,QWORD PTR [rip+0xdad9]        # 0x40ffb8
  4024df:	83 fb 02             	cmp    ebx,0x2
  4024e2:	0f 84 b8 00 00 00    	je     0x4025a0
  4024e8:	ba 05 00 00 00       	mov    edx,0x5
  4024ed:	be 01 00 00 00       	mov    esi,0x1
  4024f2:	48 8d 3d c1 8b 00 00 	lea    rdi,[rip+0x8bc1]        # 0x40b0ba
  4024f9:	e8 0b 2b 00 00       	call   0x405009
  4024fe:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  402502:	e9 4b ff ff ff       	jmp    0x402452
  402507:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40250e:	00 00 
  402510:	83 fb 02             	cmp    ebx,0x2
  402513:	48 8d 05 84 8b 00 00 	lea    rax,[rip+0x8b84]        # 0x40b09e
  40251a:	4c 89 0c 24          	mov    QWORD PTR [rsp],r9
  40251e:	48 8d 3d 85 8b 00 00 	lea    rdi,[rip+0x8b85]        # 0x40b0aa
  402525:	48 0f 44 f8          	cmove  rdi,rax
  402529:	48 8b 35 88 da 00 00 	mov    rsi,QWORD PTR [rip+0xda88]        # 0x40ffb8
  402530:	e8 b7 29 00 00       	call   0x404eec
  402535:	4c 8b 0c 24          	mov    r9,QWORD PTR [rsp]
  402539:	4d 89 c8             	mov    r8,r9
  40253c:	e9 11 ff ff ff       	jmp    0x402452
  402541:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402548:	48 8b 0d 69 da 00 00 	mov    rcx,QWORD PTR [rip+0xda69]        # 0x40ffb8
  40254f:	ba 07 00 00 00       	mov    edx,0x7
  402554:	be 01 00 00 00       	mov    esi,0x1
  402559:	48 8d 3d 4a 8b 00 00 	lea    rdi,[rip+0x8b4a]        # 0x40b0aa
  402560:	4c 89 0c 24          	mov    QWORD PTR [rsp],r9
  402564:	e8 a0 2a 00 00       	call   0x405009
  402569:	4c 8b 0c 24          	mov    r9,QWORD PTR [rsp]
  40256d:	eb ca                	jmp    0x402539
  40256f:	90                   	nop
  402570:	48 8b 0d 41 da 00 00 	mov    rcx,QWORD PTR [rip+0xda41]        # 0x40ffb8
  402577:	ba 07 00 00 00       	mov    edx,0x7
  40257c:	be 01 00 00 00       	mov    esi,0x1
  402581:	48 8d 3d 22 8b 00 00 	lea    rdi,[rip+0x8b22]        # 0x40b0aa
  402588:	4c 89 0c 24          	mov    QWORD PTR [rsp],r9
  40258c:	e8 78 2a 00 00       	call   0x405009
  402591:	4c 8b 0c 24          	mov    r9,QWORD PTR [rsp]
  402595:	eb a2                	jmp    0x402539
  402597:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40259e:	00 00 
  4025a0:	ba 0b 00 00 00       	mov    edx,0xb
  4025a5:	be 01 00 00 00       	mov    esi,0x1
  4025aa:	48 8d 3d 0f 8b 00 00 	lea    rdi,[rip+0x8b0f]        # 0x40b0c0
  4025b1:	e8 53 2a 00 00       	call   0x405009
  4025b6:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  4025ba:	e9 93 fe ff ff       	jmp    0x402452
  4025bf:	90                   	nop
  4025c0:	e8 ab f9 ff ff       	call   0x401f70
  4025c5:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  4025c9:	83 f8 02             	cmp    eax,0x2
  4025cc:	0f 84 8a 00 00 00    	je     0x40265c
  4025d2:	43 8d 14 b6          	lea    edx,[r14+r14*4]
  4025d6:	48 63 c2             	movsxd rax,edx
  4025d9:	c1 fa 1f             	sar    edx,0x1f
  4025dc:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  4025e3:	48 c1 f8 21          	sar    rax,0x21
  4025e7:	29 d0                	sub    eax,edx
  4025e9:	48 8d 15 c0 a6 00 00 	lea    rdx,[rip+0xa6c0]        # 0x40ccb0
  4025f0:	48 98                	cdqe
  4025f2:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  4025f5:	48 8d 3d e1 8a 00 00 	lea    rdi,[rip+0x8ae1]        # 0x40b0dd
  4025fc:	31 c0                	xor    eax,eax
  4025fe:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  402602:	e8 ba 2a 00 00       	call   0x4050c1
  402607:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  40260b:	e9 42 fe ff ff       	jmp    0x402452
  402610:	ba 0a 00 00 00       	mov    edx,0xa
  402615:	be 01 00 00 00       	mov    esi,0x1
  40261a:	48 8d 3d ab 8a 00 00 	lea    rdi,[rip+0x8aab]        # 0x40b0cc
  402621:	e8 e3 29 00 00       	call   0x405009
  402626:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  40262a:	e9 23 fe ff ff       	jmp    0x402452
  40262f:	90                   	nop
  402630:	43 8d 04 b6          	lea    eax,[r14+r14*4]
  402634:	41 8d 14 46          	lea    edx,[r14+rax*2]
  402638:	48 63 c2             	movsxd rax,edx
  40263b:	c1 fa 1f             	sar    edx,0x1f
  40263e:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  402645:	48 c1 f8 21          	sar    rax,0x21
  402649:	29 d0                	sub    eax,edx
  40264b:	48 8d 15 8e a6 00 00 	lea    rdx,[rip+0xa68e]        # 0x40cce0
  402652:	48 98                	cdqe
  402654:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  402657:	e9 6c fd ff ff       	jmp    0x4023c8
  40265c:	43 8d 04 b6          	lea    eax,[r14+r14*4]
  402660:	41 8d 14 46          	lea    edx,[r14+rax*2]
  402664:	48 63 c2             	movsxd rax,edx
  402667:	c1 fa 1f             	sar    edx,0x1f
  40266a:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  402671:	48 c1 f8 21          	sar    rax,0x21
  402675:	29 d0                	sub    eax,edx
  402677:	48 8d 15 62 a6 00 00 	lea    rdx,[rip+0xa662]        # 0x40cce0
  40267e:	48 98                	cdqe
  402680:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  402683:	e9 6d ff ff ff       	jmp    0x4025f5
  402688:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40268f:	00 
  402690:	48 83 ec 08          	sub    rsp,0x8
  402694:	bf 01 00 00 00       	mov    edi,0x1
  402699:	e8 31 66 00 00       	call   0x408ccf
  40269e:	85 c0                	test   eax,eax
  4026a0:	75 0e                	jne    0x4026b0
  4026a2:	48 83 c4 08          	add    rsp,0x8
  4026a6:	c3                   	ret
  4026a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4026ae:	00 00 
  4026b0:	48 8b 0d 01 d9 00 00 	mov    rcx,QWORD PTR [rip+0xd901]        # 0x40ffb8
  4026b7:	ba 0d 00 00 00       	mov    edx,0xd
  4026bc:	be 01 00 00 00       	mov    esi,0x1
  4026c1:	48 8d 3d 26 8a 00 00 	lea    rdi,[rip+0x8a26]        # 0x40b0ee
  4026c8:	e8 3c 29 00 00       	call   0x405009
  4026cd:	48 8b 3d e4 d8 00 00 	mov    rdi,QWORD PTR [rip+0xd8e4]        # 0x40ffb8
  4026d4:	e8 81 23 00 00       	call   0x404a5a
  4026d9:	48 8d 3d f0 fb ff ff 	lea    rdi,[rip+0xfffffffffffffbf0]        # 0x4022d0
  4026e0:	c7 05 76 ea 00 00 01 	mov    DWORD PTR [rip+0xea76],0x1        # 0x411160
  4026e7:	00 00 00 
  4026ea:	48 83 c4 08          	add    rsp,0x8
  4026ee:	e9 0f 1e 00 00       	jmp    0x404502
  4026f3:	66 90                	xchg   ax,ax
  4026f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4026fc:	00 00 00 00 
  402700:	8b 05 5a ea 00 00    	mov    eax,DWORD PTR [rip+0xea5a]        # 0x411160
  402706:	85 c0                	test   eax,eax
  402708:	75 06                	jne    0x402710
  40270a:	c3                   	ret
  40270b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402710:	48 83 ec 08          	sub    rsp,0x8
  402714:	48 8b 0d 9d d8 00 00 	mov    rcx,QWORD PTR [rip+0xd89d]        # 0x40ffb8
  40271b:	ba 06 00 00 00       	mov    edx,0x6
  402720:	be 01 00 00 00       	mov    esi,0x1
  402725:	48 8d 3d 60 89 00 00 	lea    rdi,[rip+0x8960]        # 0x40b08c
  40272c:	e8 d8 28 00 00       	call   0x405009
  402731:	48 8b 3d 80 d8 00 00 	mov    rdi,QWORD PTR [rip+0xd880]        # 0x40ffb8
  402738:	e8 1d 23 00 00       	call   0x404a5a
  40273d:	c7 05 19 ea 00 00 00 	mov    DWORD PTR [rip+0xea19],0x0        # 0x411160
  402744:	00 00 00 
  402747:	48 83 c4 08          	add    rsp,0x8
  40274b:	c3                   	ret
  40274c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402750:	48 83 ec 48          	sub    rsp,0x48
  402754:	48 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],rbp
  402759:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  402760:	00 00 
  402762:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  402767:	31 c0                	xor    eax,eax
  402769:	e8 02 f8 ff ff       	call   0x401f70
  40276e:	89 c5                	mov    ebp,eax
  402770:	e8 4b f6 ff ff       	call   0x401dc0
  402775:	85 c0                	test   eax,eax
  402777:	0f 84 33 01 00 00    	je     0x4028b0
  40277d:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
  402782:	48 8b 1d 2f d8 00 00 	mov    rbx,QWORD PTR [rip+0xd82f]        # 0x40ffb8
  402789:	83 fd 02             	cmp    ebp,0x2
  40278c:	0f 84 a6 02 00 00    	je     0x402a38
  402792:	85 ed                	test   ebp,ebp
  402794:	0f 85 26 01 00 00    	jne    0x4028c0
  40279a:	48 89 d9             	mov    rcx,rbx
  40279d:	ba 1e 00 00 00       	mov    edx,0x1e
  4027a2:	be 01 00 00 00       	mov    esi,0x1
  4027a7:	48 8d 3d 3a 8c 00 00 	lea    rdi,[rip+0x8c3a]        # 0x40b3e8
  4027ae:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
  4027b3:	e8 51 28 00 00       	call   0x405009
  4027b8:	bf 0a 00 00 00       	mov    edi,0xa
  4027bd:	e8 70 2a 00 00       	call   0x405232
  4027c2:	48 89 df             	mov    rdi,rbx
  4027c5:	e8 90 22 00 00       	call   0x404a5a
  4027ca:	66 0f 6f 05 7e a5 00 	movdqa xmm0,XMMWORD PTR [rip+0xa57e]        # 0x40cd50
  4027d1:	00 
  4027d2:	31 f6                	xor    esi,esi
  4027d4:	48 89 ef             	mov    rdi,rbp
  4027d7:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
  4027db:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
  4027e0:	e8 c8 64 00 00       	call   0x408cad
  4027e5:	48 89 d9             	mov    rcx,rbx
  4027e8:	ba 1c 00 00 00       	mov    edx,0x1c
  4027ed:	be 01 00 00 00       	mov    esi,0x1
  4027f2:	48 8d 3d 19 89 00 00 	lea    rdi,[rip+0x8919]        # 0x40b112
  4027f9:	e8 0b 28 00 00       	call   0x405009
  4027fe:	48 89 d9             	mov    rcx,rbx
  402801:	ba 0b 00 00 00       	mov    edx,0xb
  402806:	be 01 00 00 00       	mov    esi,0x1
  40280b:	48 8d 3d 27 89 00 00 	lea    rdi,[rip+0x8927]        # 0x40b139
  402812:	e8 f2 27 00 00       	call   0x405009
  402817:	bf 0a 00 00 00       	mov    edi,0xa
  40281c:	e8 11 2a 00 00       	call   0x405232
  402821:	48 89 df             	mov    rdi,rbx
  402824:	e8 31 22 00 00       	call   0x404a5a
  402829:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  40282e:	31 f6                	xor    esi,esi
  402830:	48 89 ef             	mov    rdi,rbp
  402833:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
  402838:	e8 70 64 00 00       	call   0x408cad
  40283d:	48 89 d9             	mov    rcx,rbx
  402840:	ba 24 00 00 00       	mov    edx,0x24
  402845:	be 01 00 00 00       	mov    esi,0x1
  40284a:	48 8d 3d b7 8b 00 00 	lea    rdi,[rip+0x8bb7]        # 0x40b408
  402851:	e8 b3 27 00 00       	call   0x405009
  402856:	bf 0a 00 00 00       	mov    edi,0xa
  40285b:	e8 d2 29 00 00       	call   0x405232
  402860:	48 89 df             	mov    rdi,rbx
  402863:	e8 f2 21 00 00       	call   0x404a5a
  402868:	66 0f 6f 0c 24       	movdqa xmm1,XMMWORD PTR [rsp]
  40286d:	31 f6                	xor    esi,esi
  40286f:	48 89 ef             	mov    rdi,rbp
  402872:	0f 29 4c 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm1
  402877:	e8 31 64 00 00       	call   0x408cad
  40287c:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
  402881:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  402886:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40288d:	00 00 
  40288f:	0f 85 e0 02 00 00    	jne    0x402b75
  402895:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40289a:	bf 0a 00 00 00       	mov    edi,0xa
  40289f:	48 83 c4 48          	add    rsp,0x48
  4028a3:	e9 8a 29 00 00       	jmp    0x405232
  4028a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4028af:	00 
  4028b0:	48 8d 3d 9f 88 00 00 	lea    rdi,[rip+0x889f]        # 0x40b156
  4028b7:	e8 d3 29 00 00       	call   0x40528f
  4028bc:	eb c3                	jmp    0x402881
  4028be:	66 90                	xchg   ax,ax
  4028c0:	48 89 d9             	mov    rcx,rbx
  4028c3:	ba 05 00 00 00       	mov    edx,0x5
  4028c8:	be 01 00 00 00       	mov    esi,0x1
  4028cd:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
  4028d2:	48 8d 3d 77 88 00 00 	lea    rdi,[rip+0x8877]        # 0x40b150
  4028d9:	4c 8d 35 a1 87 00 00 	lea    r14,[rip+0x87a1]        # 0x40b081
  4028e0:	e8 24 27 00 00       	call   0x405009
  4028e5:	48 89 d9             	mov    rcx,rbx
  4028e8:	ba 1e 00 00 00       	mov    edx,0x1e
  4028ed:	be 01 00 00 00       	mov    esi,0x1
  4028f2:	48 8d 3d ef 8a 00 00 	lea    rdi,[rip+0x8aef]        # 0x40b3e8
  4028f9:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
  4028fe:	e8 06 27 00 00       	call   0x405009
  402903:	48 89 d9             	mov    rcx,rbx
  402906:	ba 04 00 00 00       	mov    edx,0x4
  40290b:	4c 89 f7             	mov    rdi,r14
  40290e:	be 01 00 00 00       	mov    esi,0x1
  402913:	e8 f1 26 00 00       	call   0x405009
  402918:	bf 0a 00 00 00       	mov    edi,0xa
  40291d:	e8 10 29 00 00       	call   0x405232
  402922:	48 89 df             	mov    rdi,rbx
  402925:	e8 30 21 00 00       	call   0x404a5a
  40292a:	66 0f 6f 15 1e a4 00 	movdqa xmm2,XMMWORD PTR [rip+0xa41e]        # 0x40cd50
  402931:	00 
  402932:	31 f6                	xor    esi,esi
  402934:	48 89 ef             	mov    rdi,rbp
  402937:	0f 29 14 24          	movaps XMMWORD PTR [rsp],xmm2
  40293b:	0f 29 54 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm2
  402940:	e8 68 63 00 00       	call   0x408cad
  402945:	48 89 d9             	mov    rcx,rbx
  402948:	ba 05 00 00 00       	mov    edx,0x5
  40294d:	be 01 00 00 00       	mov    esi,0x1
  402952:	48 8d 3d f7 87 00 00 	lea    rdi,[rip+0x87f7]        # 0x40b150
  402959:	e8 ab 26 00 00       	call   0x405009
  40295e:	48 89 d9             	mov    rcx,rbx
  402961:	ba 1c 00 00 00       	mov    edx,0x1c
  402966:	be 01 00 00 00       	mov    esi,0x1
  40296b:	48 8d 3d a0 87 00 00 	lea    rdi,[rip+0x87a0]        # 0x40b112
  402972:	e8 92 26 00 00       	call   0x405009
  402977:	48 89 d9             	mov    rcx,rbx
  40297a:	ba 09 00 00 00       	mov    edx,0x9
  40297f:	be 01 00 00 00       	mov    esi,0x1
  402984:	48 8d 3d a4 87 00 00 	lea    rdi,[rip+0x87a4]        # 0x40b12f
  40298b:	e8 79 26 00 00       	call   0x405009
  402990:	48 89 d9             	mov    rcx,rbx
  402993:	ba 0b 00 00 00       	mov    edx,0xb
  402998:	be 01 00 00 00       	mov    esi,0x1
  40299d:	48 8d 3d 95 87 00 00 	lea    rdi,[rip+0x8795]        # 0x40b139
  4029a4:	e8 60 26 00 00       	call   0x405009
  4029a9:	48 89 d9             	mov    rcx,rbx
  4029ac:	ba 04 00 00 00       	mov    edx,0x4
  4029b1:	4c 89 f7             	mov    rdi,r14
  4029b4:	be 01 00 00 00       	mov    esi,0x1
  4029b9:	e8 4b 26 00 00       	call   0x405009
  4029be:	bf 0a 00 00 00       	mov    edi,0xa
  4029c3:	e8 6a 28 00 00       	call   0x405232
  4029c8:	48 89 df             	mov    rdi,rbx
  4029cb:	e8 8a 20 00 00       	call   0x404a5a
  4029d0:	66 0f 6f 14 24       	movdqa xmm2,XMMWORD PTR [rsp]
  4029d5:	31 f6                	xor    esi,esi
  4029d7:	48 89 ef             	mov    rdi,rbp
  4029da:	0f 29 54 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm2
  4029df:	e8 c9 62 00 00       	call   0x408cad
  4029e4:	48 89 d9             	mov    rcx,rbx
  4029e7:	ba 05 00 00 00       	mov    edx,0x5
  4029ec:	be 01 00 00 00       	mov    esi,0x1
  4029f1:	48 8d 3d 58 87 00 00 	lea    rdi,[rip+0x8758]        # 0x40b150
  4029f8:	e8 0c 26 00 00       	call   0x405009
  4029fd:	48 89 d9             	mov    rcx,rbx
  402a00:	ba 24 00 00 00       	mov    edx,0x24
  402a05:	be 01 00 00 00       	mov    esi,0x1
  402a0a:	48 8d 3d f7 89 00 00 	lea    rdi,[rip+0x89f7]        # 0x40b408
  402a11:	e8 f3 25 00 00       	call   0x405009
  402a16:	4c 89 f7             	mov    rdi,r14
  402a19:	48 89 d9             	mov    rcx,rbx
  402a1c:	ba 04 00 00 00       	mov    edx,0x4
  402a21:	be 01 00 00 00       	mov    esi,0x1
  402a26:	e8 de 25 00 00       	call   0x405009
  402a2b:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
  402a30:	e9 21 fe ff ff       	jmp    0x402856
  402a35:	0f 1f 00             	nop    DWORD PTR [rax]
  402a38:	48 89 d9             	mov    rcx,rbx
  402a3b:	ba 0a 00 00 00       	mov    edx,0xa
  402a40:	be 01 00 00 00       	mov    esi,0x1
  402a45:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
  402a4a:	48 8d 3d ab 86 00 00 	lea    rdi,[rip+0x86ab]        # 0x40b0fc
  402a51:	4c 8d 35 29 86 00 00 	lea    r14,[rip+0x8629]        # 0x40b081
  402a58:	e8 ac 25 00 00       	call   0x405009
  402a5d:	48 89 d9             	mov    rcx,rbx
  402a60:	ba 1e 00 00 00       	mov    edx,0x1e
  402a65:	be 01 00 00 00       	mov    esi,0x1
  402a6a:	48 8d 3d 77 89 00 00 	lea    rdi,[rip+0x8977]        # 0x40b3e8
  402a71:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
  402a76:	e8 8e 25 00 00       	call   0x405009
  402a7b:	48 89 d9             	mov    rcx,rbx
  402a7e:	ba 04 00 00 00       	mov    edx,0x4
  402a83:	4c 89 f7             	mov    rdi,r14
  402a86:	be 01 00 00 00       	mov    esi,0x1
  402a8b:	e8 79 25 00 00       	call   0x405009
  402a90:	bf 0a 00 00 00       	mov    edi,0xa
  402a95:	e8 98 27 00 00       	call   0x405232
  402a9a:	48 89 df             	mov    rdi,rbx
  402a9d:	e8 b8 1f 00 00       	call   0x404a5a
  402aa2:	66 0f 6f 1d a6 a2 00 	movdqa xmm3,XMMWORD PTR [rip+0xa2a6]        # 0x40cd50
  402aa9:	00 
  402aaa:	31 f6                	xor    esi,esi
  402aac:	48 89 ef             	mov    rdi,rbp
  402aaf:	0f 29 1c 24          	movaps XMMWORD PTR [rsp],xmm3
  402ab3:	0f 29 5c 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm3
  402ab8:	e8 f0 61 00 00       	call   0x408cad
  402abd:	48 89 d9             	mov    rcx,rbx
  402ac0:	ba 0a 00 00 00       	mov    edx,0xa
  402ac5:	be 01 00 00 00       	mov    esi,0x1
  402aca:	48 8d 3d 36 86 00 00 	lea    rdi,[rip+0x8636]        # 0x40b107
  402ad1:	e8 33 25 00 00       	call   0x405009
  402ad6:	48 89 d9             	mov    rcx,rbx
  402ad9:	ba 1c 00 00 00       	mov    edx,0x1c
  402ade:	be 01 00 00 00       	mov    esi,0x1
  402ae3:	48 8d 3d 28 86 00 00 	lea    rdi,[rip+0x8628]        # 0x40b112
  402aea:	e8 1a 25 00 00       	call   0x405009
  402aef:	48 89 d9             	mov    rcx,rbx
  402af2:	ba 09 00 00 00       	mov    edx,0x9
  402af7:	be 01 00 00 00       	mov    esi,0x1
  402afc:	48 8d 3d 2c 86 00 00 	lea    rdi,[rip+0x862c]        # 0x40b12f
  402b03:	e8 01 25 00 00       	call   0x405009
  402b08:	48 89 d9             	mov    rcx,rbx
  402b0b:	ba 0b 00 00 00       	mov    edx,0xb
  402b10:	be 01 00 00 00       	mov    esi,0x1
  402b15:	48 8d 3d 1d 86 00 00 	lea    rdi,[rip+0x861d]        # 0x40b139
  402b1c:	e8 e8 24 00 00       	call   0x405009
  402b21:	48 89 d9             	mov    rcx,rbx
  402b24:	ba 04 00 00 00       	mov    edx,0x4
  402b29:	4c 89 f7             	mov    rdi,r14
  402b2c:	be 01 00 00 00       	mov    esi,0x1
  402b31:	e8 d3 24 00 00       	call   0x405009
  402b36:	bf 0a 00 00 00       	mov    edi,0xa
  402b3b:	e8 f2 26 00 00       	call   0x405232
  402b40:	48 89 df             	mov    rdi,rbx
  402b43:	e8 12 1f 00 00       	call   0x404a5a
  402b48:	66 0f 6f 1c 24       	movdqa xmm3,XMMWORD PTR [rsp]
  402b4d:	31 f6                	xor    esi,esi
  402b4f:	48 89 ef             	mov    rdi,rbp
  402b52:	0f 29 5c 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm3
  402b57:	e8 51 61 00 00       	call   0x408cad
  402b5c:	48 89 d9             	mov    rcx,rbx
  402b5f:	ba 0a 00 00 00       	mov    edx,0xa
  402b64:	be 01 00 00 00       	mov    esi,0x1
  402b69:	48 8d 3d d5 85 00 00 	lea    rdi,[rip+0x85d5]        # 0x40b145
  402b70:	e9 83 fe ff ff       	jmp    0x4029f8
  402b75:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
  402b7a:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
  402b7f:	e8 c8 17 00 00       	call   0x40434c
  402b84:	90                   	nop
  402b85:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  402b8c:	00 00 00 00 
  402b90:	48 83 ec 08          	sub    rsp,0x8
  402b94:	e8 27 f2 ff ff       	call   0x401dc0
  402b99:	85 c0                	test   eax,eax
  402b9b:	74 23                	je     0x402bc0
  402b9d:	48 8d 3d bc 85 00 00 	lea    rdi,[rip+0x85bc]        # 0x40b160
  402ba4:	48 8d 35 b9 85 00 00 	lea    rsi,[rip+0x85b9]        # 0x40b164
  402bab:	48 83 c4 08          	add    rsp,0x8
  402baf:	48 8d 15 b2 85 00 00 	lea    rdx,[rip+0x85b2]        # 0x40b168
  402bb6:	e9 55 f6 ff ff       	jmp    0x402210
  402bbb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402bc0:	48 8d 3d a5 85 00 00 	lea    rdi,[rip+0x85a5]        # 0x40b16c
  402bc7:	48 8d 15 a0 85 00 00 	lea    rdx,[rip+0x85a0]        # 0x40b16e
  402bce:	48 83 c4 08          	add    rsp,0x8
  402bd2:	48 89 fe             	mov    rsi,rdi
  402bd5:	e9 36 f6 ff ff       	jmp    0x402210
  402bda:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402be0:	48 83 ec 08          	sub    rsp,0x8
  402be4:	e8 d7 f1 ff ff       	call   0x401dc0
  402be9:	85 c0                	test   eax,eax
  402beb:	74 23                	je     0x402c10
  402bed:	48 8d 3d 7c 85 00 00 	lea    rdi,[rip+0x857c]        # 0x40b170
  402bf4:	48 8d 35 79 85 00 00 	lea    rsi,[rip+0x8579]        # 0x40b174
  402bfb:	48 83 c4 08          	add    rsp,0x8
  402bff:	48 8d 15 62 85 00 00 	lea    rdx,[rip+0x8562]        # 0x40b168
  402c06:	e9 05 f6 ff ff       	jmp    0x402210
  402c0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402c10:	48 8d 3d 55 85 00 00 	lea    rdi,[rip+0x8555]        # 0x40b16c
  402c17:	48 8d 15 50 85 00 00 	lea    rdx,[rip+0x8550]        # 0x40b16e
  402c1e:	48 83 c4 08          	add    rsp,0x8
  402c22:	48 89 fe             	mov    rsi,rdi
  402c25:	e9 e6 f5 ff ff       	jmp    0x402210
  402c2a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402c30:	41 55                	push   r13
  402c32:	31 c0                	xor    eax,eax
  402c34:	41 89 d5             	mov    r13d,edx
  402c37:	41 54                	push   r12
  402c39:	55                   	push   rbp
  402c3a:	89 f5                	mov    ebp,esi
  402c3c:	8d 76 01             	lea    esi,[rsi+0x1]
  402c3f:	53                   	push   rbx
  402c40:	48 89 fb             	mov    rbx,rdi
  402c43:	48 8d 3d 2e 85 00 00 	lea    rdi,[rip+0x852e]        # 0x40b178
  402c4a:	4c 8d a3 00 02 00 00 	lea    r12,[rbx+0x200]
  402c51:	48 83 ec 08          	sub    rsp,0x8
  402c55:	e8 67 24 00 00       	call   0x4050c1
  402c5a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402c60:	0f b6 3b             	movzx  edi,BYTE PTR [rbx]
  402c63:	31 c9                	xor    ecx,ecx
  402c65:	44 89 ea             	mov    edx,r13d
  402c68:	89 ee                	mov    esi,ebp
  402c6a:	48 83 c3 08          	add    rbx,0x8
  402c6e:	e8 ad f6 ff ff       	call   0x402320
  402c73:	4c 39 e3             	cmp    rbx,r12
  402c76:	75 e8                	jne    0x402c60
  402c78:	48 83 c4 08          	add    rsp,0x8
  402c7c:	bf 0a 00 00 00       	mov    edi,0xa
  402c81:	5b                   	pop    rbx
  402c82:	5d                   	pop    rbp
  402c83:	41 5c                	pop    r12
  402c85:	41 5d                	pop    r13
  402c87:	e9 a6 25 00 00       	jmp    0x405232
  402c8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402c90:	55                   	push   rbp
  402c91:	89 fd                	mov    ebp,edi
  402c93:	53                   	push   rbx
  402c94:	bb 40 00 00 00       	mov    ebx,0x40
  402c99:	48 83 ec 08          	sub    rsp,0x8
  402c9d:	e8 9e f3 ff ff       	call   0x402040
  402ca2:	0f 1f 00             	nop    DWORD PTR [rax]
  402ca5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  402cac:	00 00 00 00 
  402cb0:	31 c9                	xor    ecx,ecx
  402cb2:	31 d2                	xor    edx,edx
  402cb4:	31 ff                	xor    edi,edi
  402cb6:	89 ee                	mov    esi,ebp
  402cb8:	e8 63 f6 ff ff       	call   0x402320
  402cbd:	83 eb 01             	sub    ebx,0x1
  402cc0:	75 ee                	jne    0x402cb0
  402cc2:	48 83 c4 08          	add    rsp,0x8
  402cc6:	bf 01 00 00 00       	mov    edi,0x1
  402ccb:	5b                   	pop    rbx
  402ccc:	5d                   	pop    rbp
  402ccd:	e9 8e f4 ff ff       	jmp    0x402160
  402cd2:	0f 1f 00             	nop    DWORD PTR [rax]
  402cd5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  402cdc:	00 00 00 00 
  402ce0:	41 57                	push   r15
  402ce2:	41 56                	push   r14
  402ce4:	41 55                	push   r13
  402ce6:	41 54                	push   r12
  402ce8:	55                   	push   rbp
  402ce9:	53                   	push   rbx
  402cea:	89 f3                	mov    ebx,esi
  402cec:	48 83 ec 58          	sub    rsp,0x58
  402cf0:	89 74 24 0c          	mov    DWORD PTR [rsp+0xc],esi
  402cf4:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  402cf9:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  402d00:	00 00 
  402d02:	4c 89 6c 24 48       	mov    QWORD PTR [rsp+0x48],r13
  402d07:	41 89 d5             	mov    r13d,edx
  402d0a:	e8 61 f2 ff ff       	call   0x401f70
  402d0f:	89 df                	mov    edi,ebx
  402d11:	41 89 c6             	mov    r14d,eax
  402d14:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
  402d18:	e8 23 f3 ff ff       	call   0x402040
  402d1d:	4c 8b 3d 94 d2 00 00 	mov    r15,QWORD PTR [rip+0xd294]        # 0x40ffb8
  402d24:	4c 89 ff             	mov    rdi,r15
  402d27:	e8 2e 1d 00 00       	call   0x404a5a
  402d2c:	31 c0                	xor    eax,eax
  402d2e:	45 85 f6             	test   r14d,r14d
  402d31:	0f 95 c0             	setne  al
  402d34:	45 31 f6             	xor    r14d,r14d
  402d37:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  402d3b:	8d 04 9b             	lea    eax,[rbx+rbx*4]
  402d3e:	89 44 24 24          	mov    DWORD PTR [rsp+0x24],eax
  402d42:	48 98                	cdqe
  402d44:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  402d4b:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  402d50:	eb 4f                	jmp    0x402da1
  402d52:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402d58:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
  402d5d:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402d61:	44 89 ea             	mov    edx,r13d
  402d64:	8b 74 24 0c          	mov    esi,DWORD PTR [rsp+0xc]
  402d68:	42 0f b6 3c f0       	movzx  edi,BYTE PTR [rax+r14*8]
  402d6d:	49 83 c6 01          	add    r14,0x1
  402d71:	e8 aa f5 ff ff       	call   0x402320
  402d76:	4c 89 ff             	mov    rdi,r15
  402d79:	e8 dc 1c 00 00       	call   0x404a5a
  402d7e:	66 0f 6f 05 da 9f 00 	movdqa xmm0,XMMWORD PTR [rip+0x9fda]        # 0x40cd60
  402d85:	00 
  402d86:	31 f6                	xor    esi,esi
  402d88:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
  402d8d:	0f 29 44 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm0
  402d92:	e8 16 5f 00 00       	call   0x408cad
  402d97:	49 83 fe 40          	cmp    r14,0x40
  402d9b:	0f 84 cb 02 00 00    	je     0x40306c
  402da1:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
  402da5:	85 d2                	test   edx,edx
  402da7:	74 af                	je     0x402d58
  402da9:	44 89 f5             	mov    ebp,r14d
  402dac:	45 85 f6             	test   r14d,r14d
  402daf:	75 48                	jne    0x402df9
  402db1:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
  402db6:	8b 74 24 0c          	mov    esi,DWORD PTR [rsp+0xc]
  402dba:	b9 01 00 00 00       	mov    ecx,0x1
  402dbf:	44 89 ea             	mov    edx,r13d
  402dc2:	42 0f b6 3c f0       	movzx  edi,BYTE PTR [rax+r14*8]
  402dc7:	49 83 c6 01          	add    r14,0x1
  402dcb:	44 89 f5             	mov    ebp,r14d
  402dce:	e8 4d f5 ff ff       	call   0x402320
  402dd3:	4c 89 ff             	mov    rdi,r15
  402dd6:	e8 7f 1c 00 00       	call   0x404a5a
  402ddb:	66 0f 6f 0d 7d 9f 00 	movdqa xmm1,XMMWORD PTR [rip+0x9f7d]        # 0x40cd60
  402de2:	00 
  402de3:	31 f6                	xor    esi,esi
  402de5:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
  402dea:	0f 29 4c 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm1
  402def:	e8 b9 5e 00 00       	call   0x408cad
  402df4:	45 85 f6             	test   r14d,r14d
  402df7:	74 b8                	je     0x402db1
  402df9:	bb 02 00 00 00       	mov    ebx,0x2
  402dfe:	48 8d 3d a4 83 00 00 	lea    rdi,[rip+0x83a4]        # 0x40b1a9
  402e05:	39 dd                	cmp    ebp,ebx
  402e07:	0f 4e dd             	cmovle ebx,ebp
  402e0a:	31 c0                	xor    eax,eax
  402e0c:	89 de                	mov    esi,ebx
  402e0e:	29 dd                	sub    ebp,ebx
  402e10:	e8 ac 22 00 00       	call   0x4050c1
  402e15:	44 39 f5             	cmp    ebp,r14d
  402e18:	7d 97                	jge    0x402db1
  402e1a:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
  402e1f:	48 63 ed             	movsxd rbp,ebp
  402e22:	48 8d 2c e8          	lea    rbp,[rax+rbp*8]
  402e26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402e2d:	00 00 00 
  402e30:	44 0f b6 65 00       	movzx  r12d,BYTE PTR [rbp+0x0]
  402e35:	e8 36 f1 ff ff       	call   0x401f70
  402e3a:	85 c0                	test   eax,eax
  402e3c:	0f 84 be 00 00 00    	je     0x402f00
  402e42:	83 fb 01             	cmp    ebx,0x1
  402e45:	0f 85 b5 00 00 00    	jne    0x402f00
  402e4b:	89 44 24 18          	mov    DWORD PTR [rsp+0x18],eax
  402e4f:	e8 6c ef ff ff       	call   0x401dc0
  402e54:	8b 54 24 18          	mov    edx,DWORD PTR [rsp+0x18]
  402e58:	85 c0                	test   eax,eax
  402e5a:	0f 84 d0 00 00 00    	je     0x402f30
  402e60:	48 8d 1d 2c 82 00 00 	lea    rbx,[rip+0x822c]        # 0x40b093
  402e67:	48 8d 2d 29 82 00 00 	lea    rbp,[rip+0x8229]        # 0x40b097
  402e6e:	41 83 fd 01          	cmp    r13d,0x1
  402e72:	0f 84 d0 00 00 00    	je     0x402f48
  402e78:	41 83 fd 02          	cmp    r13d,0x2
  402e7c:	0f 84 f6 00 00 00    	je     0x402f78
  402e82:	45 85 e4             	test   r12d,r12d
  402e85:	0f 84 15 01 00 00    	je     0x402fa0
  402e8b:	83 fa 02             	cmp    edx,0x2
  402e8e:	0f 84 34 01 00 00    	je     0x402fc8
  402e94:	e8 d7 f0 ff ff       	call   0x401f70
  402e99:	83 f8 02             	cmp    eax,0x2
  402e9c:	0f 84 66 01 00 00    	je     0x403008
  402ea2:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  402ea7:	8b 54 24 24          	mov    edx,DWORD PTR [rsp+0x24]
  402eab:	48 c1 f8 21          	sar    rax,0x21
  402eaf:	c1 fa 1f             	sar    edx,0x1f
  402eb2:	29 d0                	sub    eax,edx
  402eb4:	48 8d 15 f5 9d 00 00 	lea    rdx,[rip+0x9df5]        # 0x40ccb0
  402ebb:	48 98                	cdqe
  402ebd:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  402ec0:	48 8d 3d f5 82 00 00 	lea    rdi,[rip+0x82f5]        # 0x40b1bc
  402ec7:	31 c0                	xor    eax,eax
  402ec9:	e8 f3 21 00 00       	call   0x4050c1
  402ece:	66 90                	xchg   ax,ax
  402ed0:	4c 89 fe             	mov    rsi,r15
  402ed3:	48 89 df             	mov    rdi,rbx
  402ed6:	e8 11 20 00 00       	call   0x404eec
  402edb:	4c 89 f9             	mov    rcx,r15
  402ede:	ba 04 00 00 00       	mov    edx,0x4
  402ee3:	be 01 00 00 00       	mov    esi,0x1
  402ee8:	48 8d 3d 92 81 00 00 	lea    rdi,[rip+0x8192]        # 0x40b081
  402eef:	e8 15 21 00 00       	call   0x405009
  402ef4:	e9 5f fe ff ff       	jmp    0x402d58
  402ef9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402f00:	8b 74 24 0c          	mov    esi,DWORD PTR [rsp+0xc]
  402f04:	31 c9                	xor    ecx,ecx
  402f06:	44 89 ea             	mov    edx,r13d
  402f09:	44 89 e7             	mov    edi,r12d
  402f0c:	48 83 c5 08          	add    rbp,0x8
  402f10:	e8 0b f4 ff ff       	call   0x402320
  402f15:	83 fb 01             	cmp    ebx,0x1
  402f18:	0f 84 3a fe ff ff    	je     0x402d58
  402f1e:	bb 01 00 00 00       	mov    ebx,0x1
  402f23:	e9 08 ff ff ff       	jmp    0x402e30
  402f28:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402f2f:	00 
  402f30:	48 8d 1d 63 81 00 00 	lea    rbx,[rip+0x8163]        # 0x40b09a
  402f37:	48 8d 2d 5e 81 00 00 	lea    rbp,[rip+0x815e]        # 0x40b09c
  402f3e:	41 83 fd 01          	cmp    r13d,0x1
  402f42:	0f 85 30 ff ff ff    	jne    0x402e78
  402f48:	83 fa 02             	cmp    edx,0x2
  402f4b:	48 8d 3d 3a 82 00 00 	lea    rdi,[rip+0x823a]        # 0x40b18c
  402f52:	48 8d 05 25 82 00 00 	lea    rax,[rip+0x8225]        # 0x40b17e
  402f59:	4c 89 fe             	mov    rsi,r15
  402f5c:	48 0f 44 f8          	cmove  rdi,rax
  402f60:	e8 87 1f 00 00       	call   0x404eec
  402f65:	45 85 e4             	test   r12d,r12d
  402f68:	48 0f 44 dd          	cmove  rbx,rbp
  402f6c:	e9 5f ff ff ff       	jmp    0x402ed0
  402f71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402f78:	83 fa 02             	cmp    edx,0x2
  402f7b:	48 8d 3d 1f 82 00 00 	lea    rdi,[rip+0x821f]        # 0x40b1a1
  402f82:	48 8d 05 0b 82 00 00 	lea    rax,[rip+0x820b]        # 0x40b194
  402f89:	4c 89 fe             	mov    rsi,r15
  402f8c:	48 0f 44 f8          	cmove  rdi,rax
  402f90:	e8 57 1f 00 00       	call   0x404eec
  402f95:	eb ce                	jmp    0x402f65
  402f97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402f9e:	00 00 
  402fa0:	4c 89 f9             	mov    rcx,r15
  402fa3:	ba 05 00 00 00       	mov    edx,0x5
  402fa8:	be 01 00 00 00       	mov    esi,0x1
  402fad:	48 89 eb             	mov    rbx,rbp
  402fb0:	48 8d 3d 7c 81 00 00 	lea    rdi,[rip+0x817c]        # 0x40b133
  402fb7:	e8 4d 20 00 00       	call   0x405009
  402fbc:	e9 0f ff ff ff       	jmp    0x402ed0
  402fc1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402fc8:	e8 a3 ef ff ff       	call   0x401f70
  402fcd:	83 f8 02             	cmp    eax,0x2
  402fd0:	74 6e                	je     0x403040
  402fd2:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  402fd7:	8b 54 24 24          	mov    edx,DWORD PTR [rsp+0x24]
  402fdb:	48 c1 f8 21          	sar    rax,0x21
  402fdf:	c1 fa 1f             	sar    edx,0x1f
  402fe2:	29 d0                	sub    eax,edx
  402fe4:	48 8d 15 c5 9c 00 00 	lea    rdx,[rip+0x9cc5]        # 0x40ccb0
  402feb:	48 98                	cdqe
  402fed:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  402ff0:	48 8d 3d b8 81 00 00 	lea    rdi,[rip+0x81b8]        # 0x40b1af
  402ff7:	31 c0                	xor    eax,eax
  402ff9:	e8 c3 20 00 00       	call   0x4050c1
  402ffe:	e9 cd fe ff ff       	jmp    0x402ed0
  403003:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403008:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  40300c:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  403010:	8d 14 48             	lea    edx,[rax+rcx*2]
  403013:	48 63 c2             	movsxd rax,edx
  403016:	c1 fa 1f             	sar    edx,0x1f
  403019:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  403020:	48 c1 f8 21          	sar    rax,0x21
  403024:	29 d0                	sub    eax,edx
  403026:	48 8d 15 b3 9c 00 00 	lea    rdx,[rip+0x9cb3]        # 0x40cce0
  40302d:	48 98                	cdqe
  40302f:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  403032:	e9 89 fe ff ff       	jmp    0x402ec0
  403037:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40303e:	00 00 
  403040:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  403044:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  403048:	8d 14 48             	lea    edx,[rax+rcx*2]
  40304b:	48 63 c2             	movsxd rax,edx
  40304e:	c1 fa 1f             	sar    edx,0x1f
  403051:	48 69 c0 ab aa aa 2a 	imul   rax,rax,0x2aaaaaab
  403058:	48 c1 f8 21          	sar    rax,0x21
  40305c:	29 d0                	sub    eax,edx
  40305e:	48 8d 15 7b 9c 00 00 	lea    rdx,[rip+0x9c7b]        # 0x40cce0
  403065:	48 98                	cdqe
  403067:	8b 34 82             	mov    esi,DWORD PTR [rdx+rax*4]
  40306a:	eb 84                	jmp    0x402ff0
  40306c:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
  403070:	85 c0                	test   eax,eax
  403072:	75 2d                	jne    0x4030a1
  403074:	31 ff                	xor    edi,edi
  403076:	e8 e5 f0 ff ff       	call   0x402160
  40307b:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
  403080:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  403087:	00 00 
  403089:	75 5d                	jne    0x4030e8
  40308b:	48 83 c4 58          	add    rsp,0x58
  40308f:	4c 89 ff             	mov    rdi,r15
  403092:	5b                   	pop    rbx
  403093:	5d                   	pop    rbp
  403094:	41 5c                	pop    r12
  403096:	41 5d                	pop    r13
  403098:	41 5e                	pop    r14
  40309a:	41 5f                	pop    r15
  40309c:	e9 b9 19 00 00       	jmp    0x404a5a
  4030a1:	be 02 00 00 00       	mov    esi,0x2
  4030a6:	48 8d 3d fc 80 00 00 	lea    rdi,[rip+0x80fc]        # 0x40b1a9
  4030ad:	31 c0                	xor    eax,eax
  4030af:	e8 0d 20 00 00       	call   0x4050c1
  4030b4:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  4030b9:	31 c9                	xor    ecx,ecx
  4030bb:	44 89 ea             	mov    edx,r13d
  4030be:	44 8b 74 24 0c       	mov    r14d,DWORD PTR [rsp+0xc]
  4030c3:	0f b6 bb f0 01 00 00 	movzx  edi,BYTE PTR [rbx+0x1f0]
  4030ca:	44 89 f6             	mov    esi,r14d
  4030cd:	e8 4e f2 ff ff       	call   0x402320
  4030d2:	31 c9                	xor    ecx,ecx
  4030d4:	44 89 ea             	mov    edx,r13d
  4030d7:	44 89 f6             	mov    esi,r14d
  4030da:	0f b6 bb f8 01 00 00 	movzx  edi,BYTE PTR [rbx+0x1f8]
  4030e1:	e8 3a f2 ff ff       	call   0x402320
  4030e6:	eb 8c                	jmp    0x403074
  4030e8:	e8 5f 12 00 00       	call   0x40434c
  4030ed:	0f 1f 00             	nop    DWORD PTR [rax]
  4030f0:	41 57                	push   r15
  4030f2:	41 56                	push   r14
  4030f4:	49 89 fe             	mov    r14,rdi
  4030f7:	41 55                	push   r13
  4030f9:	4d 89 f7             	mov    r15,r14
  4030fc:	41 bd b9 79 37 9e    	mov    r13d,0x9e3779b9
  403102:	41 54                	push   r12
  403104:	55                   	push   rbp
  403105:	53                   	push   rbx
  403106:	48 83 ec 48          	sub    rsp,0x48
  40310a:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  40310f:	64 4c 8b 24 25 28 00 	mov    r12,QWORD PTR fs:0x28
  403116:	00 00 
  403118:	4c 89 64 24 38       	mov    QWORD PTR [rsp+0x38],r12
  40311d:	41 89 f4             	mov    r12d,esi
  403120:	e8 9b ec ff ff       	call   0x401dc0
  403125:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  403129:	e8 42 ee ff ff       	call   0x401f70
  40312e:	89 c3                	mov    ebx,eax
  403130:	4c 89 f0             	mov    rax,r14
  403133:	4d 8d b6 00 02 00 00 	lea    r14,[r14+0x200]
  40313a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  403140:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  403143:	48 83 c0 01          	add    rax,0x1
  403147:	44 89 ee             	mov    esi,r13d
  40314a:	89 d1                	mov    ecx,edx
  40314c:	44 31 e9             	xor    ecx,r13d
  40314f:	44 69 e9 6b ca eb 85 	imul   r13d,ecx,0x85ebca6b
  403156:	49 39 c6             	cmp    r14,rax
  403159:	75 e5                	jne    0x403140
  40315b:	39 f2                	cmp    edx,esi
  40315d:	b8 67 45 23 01       	mov    eax,0x1234567
  403162:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
  403169:	00 
  40316a:	48 8b 2d 47 ce 00 00 	mov    rbp,QWORD PTR [rip+0xce47]        # 0x40ffb8
  403171:	4c 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],r15
  403176:	44 0f 44 e8          	cmove  r13d,eax
  40317a:	48 8d 3d 43 80 00 00 	lea    rdi,[rip+0x8043]        # 0x40b1c4
  403181:	48 89 ee             	mov    rsi,rbp
  403184:	e8 63 1d 00 00       	call   0x404eec
  403189:	44 89 e7             	mov    edi,r12d
  40318c:	e8 af ee ff ff       	call   0x402040
  403191:	4c 8b 7c 24 10       	mov    r15,QWORD PTR [rsp+0x10]
  403196:	e9 84 00 00 00       	jmp    0x40321f
  40319b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4031a0:	83 fb 02             	cmp    ebx,0x2
  4031a3:	0f 84 87 01 00 00    	je     0x403330
  4031a9:	48 89 e9             	mov    rcx,rbp
  4031ac:	ba 05 00 00 00       	mov    edx,0x5
  4031b1:	be 01 00 00 00       	mov    esi,0x1
  4031b6:	48 8d 3d fd 7e 00 00 	lea    rdi,[rip+0x7efd]        # 0x40b0ba
  4031bd:	e8 47 1e 00 00       	call   0x405009
  4031c2:	44 89 ea             	mov    edx,r13d
  4031c5:	b9 ab aa aa aa       	mov    ecx,0xaaaaaaab
  4031ca:	c1 ea 09             	shr    edx,0x9
  4031cd:	89 d0                	mov    eax,edx
  4031cf:	48 0f af c1          	imul   rax,rcx
  4031d3:	48 c1 e8 21          	shr    rax,0x21
  4031d7:	8d 0c 40             	lea    ecx,[rax+rax*2]
  4031da:	89 d0                	mov    eax,edx
  4031dc:	8b 54 24 08          	mov    edx,DWORD PTR [rsp+0x8]
  4031e0:	29 c8                	sub    eax,ecx
  4031e2:	85 d2                	test   edx,edx
  4031e4:	0f 84 36 01 00 00    	je     0x403320
  4031ea:	48 8d 35 7f cd 00 00 	lea    rsi,[rip+0xcd7f]        # 0x40ff70
  4031f1:	48 8b 3c c6          	mov    rdi,QWORD PTR [rsi+rax*8]
  4031f5:	48 89 ee             	mov    rsi,rbp
  4031f8:	49 83 c7 08          	add    r15,0x8
  4031fc:	e8 eb 1c 00 00       	call   0x404eec
  403201:	48 89 e9             	mov    rcx,rbp
  403204:	ba 04 00 00 00       	mov    edx,0x4
  403209:	be 01 00 00 00       	mov    esi,0x1
  40320e:	48 8d 3d 6c 7e 00 00 	lea    rdi,[rip+0x7e6c]        # 0x40b081
  403215:	e8 ef 1d 00 00       	call   0x405009
  40321a:	4d 39 fe             	cmp    r14,r15
  40321d:	74 44                	je     0x403263
  40321f:	44 89 ea             	mov    edx,r13d
  403222:	c1 e2 0d             	shl    edx,0xd
  403225:	44 31 ea             	xor    edx,r13d
  403228:	89 d0                	mov    eax,edx
  40322a:	c1 e8 11             	shr    eax,0x11
  40322d:	31 d0                	xor    eax,edx
  40322f:	41 89 c5             	mov    r13d,eax
  403232:	41 c1 e5 05          	shl    r13d,0x5
  403236:	41 31 c5             	xor    r13d,eax
  403239:	85 db                	test   ebx,ebx
  40323b:	74 0a                	je     0x403247
  40323d:	41 80 fd 59          	cmp    r13b,0x59
  403241:	0f 86 59 ff ff ff    	jbe    0x4031a0
  403247:	41 0f b6 3f          	movzx  edi,BYTE PTR [r15]
  40324b:	31 c9                	xor    ecx,ecx
  40324d:	ba 01 00 00 00       	mov    edx,0x1
  403252:	44 89 e6             	mov    esi,r12d
  403255:	49 83 c7 08          	add    r15,0x8
  403259:	e8 c2 f0 ff ff       	call   0x402320
  40325e:	4d 39 fe             	cmp    r14,r15
  403261:	75 bc                	jne    0x40321f
  403263:	31 ff                	xor    edi,edi
  403265:	e8 f6 ee ff ff       	call   0x402160
  40326a:	48 89 ef             	mov    rdi,rbp
  40326d:	e8 e8 17 00 00       	call   0x404a5a
  403272:	66 0f 6f 05 f6 9a 00 	movdqa xmm0,XMMWORD PTR [rip+0x9af6]        # 0x40cd70
  403279:	00 
  40327a:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
  40327f:	31 f6                	xor    esi,esi
  403281:	0f 29 44 24 20       	movaps XMMWORD PTR [rsp+0x20],xmm0
  403286:	e8 22 5a 00 00       	call   0x408cad
  40328b:	83 44 24 0c 01       	add    DWORD PTR [rsp+0xc],0x1
  403290:	48 8d 3d 31 7f 00 00 	lea    rdi,[rip+0x7f31]        # 0x40b1c8
  403297:	83 7c 24 0c 06       	cmp    DWORD PTR [rsp+0xc],0x6
  40329c:	0f 85 df fe ff ff    	jne    0x403181
  4032a2:	48 89 e9             	mov    rcx,rbp
  4032a5:	ba 05 00 00 00       	mov    edx,0x5
  4032aa:	be 01 00 00 00       	mov    esi,0x1
  4032af:	4c 8b 7c 24 18       	mov    r15,QWORD PTR [rsp+0x18]
  4032b4:	e8 50 1d 00 00       	call   0x405009
  4032b9:	44 89 e7             	mov    edi,r12d
  4032bc:	e8 7f ed ff ff       	call   0x402040
  4032c1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4032c5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4032cc:	00 00 00 00 
  4032d0:	41 0f b6 3f          	movzx  edi,BYTE PTR [r15]
  4032d4:	31 c9                	xor    ecx,ecx
  4032d6:	ba 01 00 00 00       	mov    edx,0x1
  4032db:	44 89 e6             	mov    esi,r12d
  4032de:	49 83 c7 08          	add    r15,0x8
  4032e2:	e8 39 f0 ff ff       	call   0x402320
  4032e7:	4d 39 fe             	cmp    r14,r15
  4032ea:	75 e4                	jne    0x4032d0
  4032ec:	31 ff                	xor    edi,edi
  4032ee:	e8 6d ee ff ff       	call   0x402160
  4032f3:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
  4032f8:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4032ff:	00 00 
  403301:	75 64                	jne    0x403367
  403303:	48 83 c4 48          	add    rsp,0x48
  403307:	48 89 ef             	mov    rdi,rbp
  40330a:	5b                   	pop    rbx
  40330b:	5d                   	pop    rbp
  40330c:	41 5c                	pop    r12
  40330e:	41 5d                	pop    r13
  403310:	41 5e                	pop    r14
  403312:	41 5f                	pop    r15
  403314:	e9 41 17 00 00       	jmp    0x404a5a
  403319:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  403320:	48 8d 35 29 cc 00 00 	lea    rsi,[rip+0xcc29]        # 0x40ff50
  403327:	48 8b 3c c6          	mov    rdi,QWORD PTR [rsi+rax*8]
  40332b:	e9 c5 fe ff ff       	jmp    0x4031f5
  403330:	44 89 ea             	mov    edx,r13d
  403333:	b9 ab aa aa aa       	mov    ecx,0xaaaaaaab
  403338:	48 8d 3d 9e 7d 00 00 	lea    rdi,[rip+0x7d9e]        # 0x40b0dd
  40333f:	c1 ea 0c             	shr    edx,0xc
  403342:	89 d0                	mov    eax,edx
  403344:	48 0f af c1          	imul   rax,rcx
  403348:	48 c1 e8 21          	shr    rax,0x21
  40334c:	8d 04 40             	lea    eax,[rax+rax*2]
  40334f:	29 c2                	sub    edx,eax
  403351:	48 8d 05 48 99 00 00 	lea    rax,[rip+0x9948]        # 0x40cca0
  403358:	8b 34 90             	mov    esi,DWORD PTR [rax+rdx*4]
  40335b:	31 c0                	xor    eax,eax
  40335d:	e8 5f 1d 00 00       	call   0x4050c1
  403362:	e9 5b fe ff ff       	jmp    0x4031c2
  403367:	e8 e0 0f 00 00       	call   0x40434c
  40336c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  403370:	48 83 ec 68          	sub    rsp,0x68
  403374:	48 89 6c 24 40       	mov    QWORD PTR [rsp+0x40],rbp
  403379:	48 89 fd             	mov    rbp,rdi
  40337c:	48 89 5c 24 38       	mov    QWORD PTR [rsp+0x38],rbx
  403381:	4c 89 64 24 48       	mov    QWORD PTR [rsp+0x48],r12
  403386:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  40338b:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
  403392:	00 00 
  403394:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  403399:	89 f3                	mov    ebx,esi
  40339b:	e8 d0 eb ff ff       	call   0x401f70
  4033a0:	85 c0                	test   eax,eax
  4033a2:	0f 84 1c 02 00 00    	je     0x4035c4
  4033a8:	4c 89 6c 24 50       	mov    QWORD PTR [rsp+0x50],r13
  4033ad:	45 31 ed             	xor    r13d,r13d
  4033b0:	48 8b 0d 01 cc 00 00 	mov    rcx,QWORD PTR [rip+0xcc01]        # 0x40ffb8
  4033b7:	4c 89 74 24 58       	mov    QWORD PTR [rsp+0x58],r14
  4033bc:	49 89 ee             	mov    r14,rbp
  4033bf:	4c 89 7c 24 60       	mov    QWORD PTR [rsp+0x60],r15
  4033c4:	4d 85 ed             	test   r13,r13
  4033c7:	0f 84 f0 00 00 00    	je     0x4034bd
  4033cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4033d0:	ba 05 00 00 00       	mov    edx,0x5
  4033d5:	be 01 00 00 00       	mov    esi,0x1
  4033da:	48 8d 3d e7 7d 00 00 	lea    rdi,[rip+0x7de7]        # 0x40b1c8
  4033e1:	e8 23 1c 00 00       	call   0x405009
  4033e6:	89 df                	mov    edi,ebx
  4033e8:	e8 53 ec ff ff       	call   0x402040
  4033ed:	4c 8b 64 24 08       	mov    r12,QWORD PTR [rsp+0x8]
  4033f2:	0f 1f 00             	nop    DWORD PTR [rax]
  4033f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4033fc:	00 00 00 00 
  403400:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
  403405:	31 c9                	xor    ecx,ecx
  403407:	ba 02 00 00 00       	mov    edx,0x2
  40340c:	89 de                	mov    esi,ebx
  40340e:	49 83 c4 08          	add    r12,0x8
  403412:	e8 09 ef ff ff       	call   0x402320
  403417:	49 39 ec             	cmp    r12,rbp
  40341a:	75 e4                	jne    0x403400
  40341c:	0f b6 7d 00          	movzx  edi,BYTE PTR [rbp+0x0]
  403420:	b9 01 00 00 00       	mov    ecx,0x1
  403425:	ba 02 00 00 00       	mov    edx,0x2
  40342a:	89 de                	mov    esi,ebx
  40342c:	e8 ef ee ff ff       	call   0x402320
  403431:	49 83 fd 3f          	cmp    r13,0x3f
  403435:	0f 84 c5 00 00 00    	je     0x403500
  40343b:	44 89 ea             	mov    edx,r13d
  40343e:	b8 3e 00 00 00       	mov    eax,0x3e
  403443:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  403448:	49 89 ef             	mov    r15,rbp
  40344b:	29 d0                	sub    eax,edx
  40344d:	4c 01 e8             	add    rax,r13
  403450:	4c 8d 64 c1 08       	lea    r12,[rcx+rax*8+0x8]
  403455:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40345c:	00 00 00 00 
  403460:	41 0f b6 7f 08       	movzx  edi,BYTE PTR [r15+0x8]
  403465:	31 c9                	xor    ecx,ecx
  403467:	31 d2                	xor    edx,edx
  403469:	89 de                	mov    esi,ebx
  40346b:	49 83 c7 08          	add    r15,0x8
  40346f:	e8 ac ee ff ff       	call   0x402320
  403474:	4d 39 e7             	cmp    r15,r12
  403477:	75 e7                	jne    0x403460
  403479:	31 ff                	xor    edi,edi
  40347b:	49 83 c5 01          	add    r13,0x1
  40347f:	48 83 c5 08          	add    rbp,0x8
  403483:	e8 d8 ec ff ff       	call   0x402160
  403488:	48 8b 3d 29 cb 00 00 	mov    rdi,QWORD PTR [rip+0xcb29]        # 0x40ffb8
  40348f:	e8 c6 15 00 00       	call   0x404a5a
  403494:	66 0f 6f 05 c4 98 00 	movdqa xmm0,XMMWORD PTR [rip+0x98c4]        # 0x40cd60
  40349b:	00 
  40349c:	31 f6                	xor    esi,esi
  40349e:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4034a3:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
  4034a8:	e8 00 58 00 00       	call   0x408cad
  4034ad:	48 8b 0d 04 cb 00 00 	mov    rcx,QWORD PTR [rip+0xcb04]        # 0x40ffb8
  4034b4:	4d 85 ed             	test   r13,r13
  4034b7:	0f 85 13 ff ff ff    	jne    0x4033d0
  4034bd:	ba 09 00 00 00       	mov    edx,0x9
  4034c2:	be 01 00 00 00       	mov    esi,0x1
  4034c7:	48 8d 3d f6 7c 00 00 	lea    rdi,[rip+0x7cf6]        # 0x40b1c4
  4034ce:	e8 36 1b 00 00       	call   0x405009
  4034d3:	89 df                	mov    edi,ebx
  4034d5:	e8 66 eb ff ff       	call   0x402040
  4034da:	0f b6 7d 00          	movzx  edi,BYTE PTR [rbp+0x0]
  4034de:	ba 02 00 00 00       	mov    edx,0x2
  4034e3:	89 de                	mov    esi,ebx
  4034e5:	b9 01 00 00 00       	mov    ecx,0x1
  4034ea:	e8 31 ee ff ff       	call   0x402320
  4034ef:	31 d2                	xor    edx,edx
  4034f1:	e9 48 ff ff ff       	jmp    0x40343e
  4034f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4034fd:	00 00 00 
  403500:	31 ff                	xor    edi,edi
  403502:	e8 59 ec ff ff       	call   0x402160
  403507:	48 8b 3d aa ca 00 00 	mov    rdi,QWORD PTR [rip+0xcaaa]        # 0x40ffb8
  40350e:	e8 47 15 00 00       	call   0x404a5a
  403513:	66 0f 6f 0d 45 98 00 	movdqa xmm1,XMMWORD PTR [rip+0x9845]        # 0x40cd60
  40351a:	00 
  40351b:	31 f6                	xor    esi,esi
  40351d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  403522:	0f 29 4c 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm1
  403527:	e8 81 57 00 00       	call   0x408cad
  40352c:	ba 05 00 00 00       	mov    edx,0x5
  403531:	48 8b 0d 80 ca 00 00 	mov    rcx,QWORD PTR [rip+0xca80]        # 0x40ffb8
  403538:	be 01 00 00 00       	mov    esi,0x1
  40353d:	48 8d 3d 84 7c 00 00 	lea    rdi,[rip+0x7c84]        # 0x40b1c8
  403544:	e8 c0 1a 00 00       	call   0x405009
  403549:	89 df                	mov    edi,ebx
  40354b:	e8 f0 ea ff ff       	call   0x402040
  403550:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  403555:	48 81 c5 00 02 00 00 	add    rbp,0x200
  40355c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  403560:	41 0f b6 3e          	movzx  edi,BYTE PTR [r14]
  403564:	31 c9                	xor    ecx,ecx
  403566:	ba 02 00 00 00       	mov    edx,0x2
  40356b:	89 de                	mov    esi,ebx
  40356d:	49 83 c6 08          	add    r14,0x8
  403571:	e8 aa ed ff ff       	call   0x402320
  403576:	4c 39 f5             	cmp    rbp,r14
  403579:	75 e5                	jne    0x403560
  40357b:	31 ff                	xor    edi,edi
  40357d:	e8 de eb ff ff       	call   0x402160
  403582:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  403587:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40358e:	00 00 
  403590:	0f 85 bc 00 00 00    	jne    0x403652
  403596:	48 8b 3d 1b ca 00 00 	mov    rdi,QWORD PTR [rip+0xca1b]        # 0x40ffb8
  40359d:	4c 8b 6c 24 50       	mov    r13,QWORD PTR [rsp+0x50]
  4035a2:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
  4035a7:	4c 8b 7c 24 60       	mov    r15,QWORD PTR [rsp+0x60]
  4035ac:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
  4035b1:	48 8b 6c 24 40       	mov    rbp,QWORD PTR [rsp+0x40]
  4035b6:	4c 8b 64 24 48       	mov    r12,QWORD PTR [rsp+0x48]
  4035bb:	48 83 c4 68          	add    rsp,0x68
  4035bf:	e9 96 14 00 00       	jmp    0x404a5a
  4035c4:	48 8b 0d ed c9 00 00 	mov    rcx,QWORD PTR [rip+0xc9ed]        # 0x40ffb8
  4035cb:	ba 09 00 00 00       	mov    edx,0x9
  4035d0:	be 01 00 00 00       	mov    esi,0x1
  4035d5:	48 8d 3d e8 7b 00 00 	lea    rdi,[rip+0x7be8]        # 0x40b1c4
  4035dc:	e8 28 1a 00 00       	call   0x405009
  4035e1:	89 df                	mov    edi,ebx
  4035e3:	e8 58 ea ff ff       	call   0x402040
  4035e8:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  4035ed:	4c 8d a5 00 02 00 00 	lea    r12,[rbp+0x200]
  4035f4:	90                   	nop
  4035f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4035fc:	00 00 00 00 
  403600:	0f b6 7d 00          	movzx  edi,BYTE PTR [rbp+0x0]
  403604:	31 c9                	xor    ecx,ecx
  403606:	ba 02 00 00 00       	mov    edx,0x2
  40360b:	89 de                	mov    esi,ebx
  40360d:	48 83 c5 08          	add    rbp,0x8
  403611:	e8 0a ed ff ff       	call   0x402320
  403616:	4c 39 e5             	cmp    rbp,r12
  403619:	75 e5                	jne    0x403600
  40361b:	31 ff                	xor    edi,edi
  40361d:	e8 3e eb ff ff       	call   0x402160
  403622:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  403627:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40362e:	00 00 
  403630:	75 0c                	jne    0x40363e
  403632:	48 8b 3d 7f c9 00 00 	mov    rdi,QWORD PTR [rip+0xc97f]        # 0x40ffb8
  403639:	e9 6e ff ff ff       	jmp    0x4035ac
  40363e:	4c 89 6c 24 50       	mov    QWORD PTR [rsp+0x50],r13
  403643:	4c 89 74 24 58       	mov    QWORD PTR [rsp+0x58],r14
  403648:	4c 89 7c 24 60       	mov    QWORD PTR [rsp+0x60],r15
  40364d:	e8 fa 0c 00 00       	call   0x40434c
  403652:	e8 f5 0c 00 00       	call   0x40434c
  403657:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40365e:	00 00 
  403660:	48 83 ec 48          	sub    rsp,0x48
  403664:	48 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],rbp
  403669:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403670:	00 00 
  403672:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403677:	31 c0                	xor    eax,eax
  403679:	e8 42 e7 ff ff       	call   0x401dc0
  40367e:	bf 01 00 00 00       	mov    edi,0x1
  403683:	83 f8 01             	cmp    eax,0x1
  403686:	19 ed                	sbb    ebp,ebp
  403688:	83 e5 fa             	and    ebp,0xfffffffa
  40368b:	83 c5 0a             	add    ebp,0xa
  40368e:	e8 3c 56 00 00       	call   0x408ccf
  403693:	85 c0                	test   eax,eax
  403695:	0f 84 35 01 00 00    	je     0x4037d0
  40369b:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
  4036a0:	31 db                	xor    ebx,ebx
  4036a2:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
  4036a7:	4c 8b 25 0a c9 00 00 	mov    r12,QWORD PTR [rip+0xc90a]        # 0x40ffb8
  4036ae:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
  4036b3:	4c 8d 2d 46 c8 00 00 	lea    r13,[rip+0xc846]        # 0x40ff00
  4036ba:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
  4036bf:	4c 8d 35 1a c8 00 00 	lea    r14,[rip+0xc81a]        # 0x40fee0
  4036c6:	eb 4a                	jmp    0x403712
  4036c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4036cf:	00 
  4036d0:	49 8b 74 d5 00       	mov    rsi,QWORD PTR [r13+rdx*8+0x0]
  4036d5:	48 8d 3d f2 7a 00 00 	lea    rdi,[rip+0x7af2]        # 0x40b1ce
  4036dc:	31 c0                	xor    eax,eax
  4036de:	e8 de 19 00 00       	call   0x4050c1
  4036e3:	e8 88 e8 ff ff       	call   0x401f70
  4036e8:	85 c0                	test   eax,eax
  4036ea:	75 6c                	jne    0x403758
  4036ec:	4c 89 e7             	mov    rdi,r12
  4036ef:	83 c3 01             	add    ebx,0x1
  4036f2:	e8 63 13 00 00       	call   0x404a5a
  4036f7:	66 0f 6f 05 51 96 00 	movdqa xmm0,XMMWORD PTR [rip+0x9651]        # 0x40cd50
  4036fe:	00 
  4036ff:	31 f6                	xor    esi,esi
  403701:	48 89 e7             	mov    rdi,rsp
  403704:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
  403708:	e8 a0 55 00 00       	call   0x408cad
  40370d:	83 fb 0c             	cmp    ebx,0xc
  403710:	74 6e                	je     0x403780
  403712:	e8 59 e8 ff ff       	call   0x401f70
  403717:	85 c0                	test   eax,eax
  403719:	75 1d                	jne    0x403738
  40371b:	e8 a0 e6 ff ff       	call   0x401dc0
  403720:	89 c1                	mov    ecx,eax
  403722:	89 d8                	mov    eax,ebx
  403724:	99                   	cdq
  403725:	f7 fd                	idiv   ebp
  403727:	89 d2                	mov    edx,edx
  403729:	85 c9                	test   ecx,ecx
  40372b:	75 a3                	jne    0x4036d0
  40372d:	49 8b 34 d6          	mov    rsi,QWORD PTR [r14+rdx*8]
  403731:	eb a2                	jmp    0x4036d5
  403733:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403738:	4c 89 e1             	mov    rcx,r12
  40373b:	ba 05 00 00 00       	mov    edx,0x5
  403740:	be 01 00 00 00       	mov    esi,0x1
  403745:	48 8d 3d e7 79 00 00 	lea    rdi,[rip+0x79e7]        # 0x40b133
  40374c:	e8 b8 18 00 00       	call   0x405009
  403751:	eb c8                	jmp    0x40371b
  403753:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403758:	4c 89 e1             	mov    rcx,r12
  40375b:	ba 04 00 00 00       	mov    edx,0x4
  403760:	be 01 00 00 00       	mov    esi,0x1
  403765:	48 8d 3d 15 79 00 00 	lea    rdi,[rip+0x7915]        # 0x40b081
  40376c:	e8 98 18 00 00       	call   0x405009
  403771:	e9 76 ff ff ff       	jmp    0x4036ec
  403776:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40377d:	00 00 00 
  403780:	4c 89 e1             	mov    rcx,r12
  403783:	ba 05 00 00 00       	mov    edx,0x5
  403788:	be 01 00 00 00       	mov    esi,0x1
  40378d:	48 8d 3d 34 7a 00 00 	lea    rdi,[rip+0x7a34]        # 0x40b1c8
  403794:	e8 70 18 00 00       	call   0x405009
  403799:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40379e:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4037a5:	00 00 
  4037a7:	75 55                	jne    0x4037fe
  4037a9:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
  4037ae:	4c 8b 6c 24 38       	mov    r13,QWORD PTR [rsp+0x38]
  4037b3:	4c 89 e7             	mov    rdi,r12
  4037b6:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
  4037bb:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
  4037c0:	48 8b 6c 24 28       	mov    rbp,QWORD PTR [rsp+0x28]
  4037c5:	48 83 c4 48          	add    rsp,0x48
  4037c9:	e9 8c 12 00 00       	jmp    0x404a5a
  4037ce:	66 90                	xchg   ax,ax
  4037d0:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  4037d5:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4037dc:	00 00 
  4037de:	75 0a                	jne    0x4037ea
  4037e0:	48 8b 6c 24 28       	mov    rbp,QWORD PTR [rsp+0x28]
  4037e5:	48 83 c4 48          	add    rsp,0x48
  4037e9:	c3                   	ret
  4037ea:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
  4037ef:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
  4037f4:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
  4037f9:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
  4037fe:	e8 49 0b 00 00       	call   0x40434c
  403803:	66 90                	xchg   ax,ax
  403805:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40380c:	00 00 00 00 
  403810:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  403817:	48 89 5c 24 58       	mov    QWORD PTR [rsp+0x58],rbx
  40381c:	48 89 6c 24 60       	mov    QWORD PTR [rsp+0x60],rbp
  403821:	4c 89 64 24 68       	mov    QWORD PTR [rsp+0x68],r12
  403826:	4c 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],r13
  40382b:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  403832:	00 00 
  403834:	4c 89 6c 24 48       	mov    QWORD PTR [rsp+0x48],r13
  403839:	41 89 fd             	mov    r13d,edi
  40383c:	85 ff                	test   edi,edi
  40383e:	0f 84 14 01 00 00    	je     0x403958
  403844:	bb 0e 00 00 00       	mov    ebx,0xe
  403849:	48 8d 0d e0 94 00 00 	lea    rcx,[rip+0x94e0]        # 0x40cd30
  403850:	48 8d 05 e9 94 00 00 	lea    rax,[rip+0x94e9]        # 0x40cd40
  403857:	41 bc 0f 00 00 00    	mov    r12d,0xf
  40385d:	48 8d 74 24 30       	lea    rsi,[rsp+0x30]
  403862:	4a 8d 3c 20          	lea    rdi,[rax+r12*1]
  403866:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  40386a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403871:	00 00 00 00 
  403875:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40387c:	00 00 00 00 
  403880:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  403883:	48 83 c0 01          	add    rax,0x1
  403887:	32 11                	xor    dl,BYTE PTR [rcx]
  403889:	48 83 c6 01          	add    rsi,0x1
  40388d:	88 56 ff             	mov    BYTE PTR [rsi-0x1],dl
  403890:	48 83 c1 01          	add    rcx,0x1
  403894:	48 39 c7             	cmp    rdi,rax
  403897:	75 e7                	jne    0x403880
  403899:	89 d8                	mov    eax,ebx
  40389b:	bf 01 00 00 00       	mov    edi,0x1
  4038a0:	c6 44 04 30 00       	mov    BYTE PTR [rsp+rax*1+0x30],0x0
  4038a5:	e8 25 54 00 00       	call   0x408ccf
  4038aa:	48 8b 2d 07 c7 00 00 	mov    rbp,QWORD PTR [rip+0xc707]        # 0x40ffb8
  4038b1:	85 c0                	test   eax,eax
  4038b3:	0f 84 7f 02 00 00    	je     0x403b38
  4038b9:	4c 89 74 24 78       	mov    QWORD PTR [rsp+0x78],r14
  4038be:	4c 89 bc 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r15
  4038c5:	00 
  4038c6:	e8 f5 e4 ff ff       	call   0x401dc0
  4038cb:	85 c0                	test   eax,eax
  4038cd:	0f 84 a3 00 00 00    	je     0x403976
  4038d3:	48 8d 05 fa 78 00 00 	lea    rax,[rip+0x78fa]        # 0x40b1d4
  4038da:	4c 8d 35 9a 77 00 00 	lea    r14,[rip+0x779a]        # 0x40b07b
  4038e1:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  4038e6:	48 8d 05 eb 78 00 00 	lea    rax,[rip+0x78eb]        # 0x40b1d8
  4038ed:	4c 8d 25 74 78 00 00 	lea    r12,[rip+0x7874]        # 0x40b168
  4038f4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4038f9:	48 8d 05 dc 78 00 00 	lea    rax,[rip+0x78dc]        # 0x40b1dc
  403900:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403905:	48 8d 05 d4 78 00 00 	lea    rax,[rip+0x78d4]        # 0x40b1e0
  40390c:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  403911:	e8 aa e4 ff ff       	call   0x401dc0
  403916:	85 c0                	test   eax,eax
  403918:	0f 84 b2 00 00 00    	je     0x4039d0
  40391e:	45 85 ed             	test   r13d,r13d
  403921:	0f 84 8c 02 00 00    	je     0x403bb3
  403927:	e8 44 e6 ff ff       	call   0x401f70
  40392c:	4c 8d 3d b1 78 00 00 	lea    r15,[rip+0x78b1]        # 0x40b1e4
  403933:	83 f8 02             	cmp    eax,0x2
  403936:	0f 84 27 03 00 00    	je     0x403c63
  40393c:	48 8d 05 a5 78 00 00 	lea    rax,[rip+0x78a5]        # 0x40b1e8
  403943:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  403948:	b8 04 00 00 00       	mov    eax,0x4
  40394d:	e9 ae 00 00 00       	jmp    0x403a00
  403952:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  403958:	bb 0d 00 00 00       	mov    ebx,0xd
  40395d:	48 8d 0d ac 93 00 00 	lea    rcx,[rip+0x93ac]        # 0x40cd10
  403964:	48 8d 05 b5 93 00 00 	lea    rax,[rip+0x93b5]        # 0x40cd20
  40396b:	41 bc 0e 00 00 00    	mov    r12d,0xe
  403971:	e9 e7 fe ff ff       	jmp    0x40385d
  403976:	e8 45 e4 ff ff       	call   0x401dc0
  40397b:	85 c0                	test   eax,eax
  40397d:	0f 84 5b 02 00 00    	je     0x403bde
  403983:	48 8d 05 ea 77 00 00 	lea    rax,[rip+0x77ea]        # 0x40b174
  40398a:	4c 8d 35 ea 76 00 00 	lea    r14,[rip+0x76ea]        # 0x40b07b
  403991:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  403996:	48 8d 05 d3 77 00 00 	lea    rax,[rip+0x77d3]        # 0x40b170
  40399d:	4c 8d 25 c4 77 00 00 	lea    r12,[rip+0x77c4]        # 0x40b168
  4039a4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4039a9:	48 8d 05 b4 77 00 00 	lea    rax,[rip+0x77b4]        # 0x40b164
  4039b0:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4039b5:	48 8d 05 a4 77 00 00 	lea    rax,[rip+0x77a4]        # 0x40b160
  4039bc:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  4039c1:	e8 fa e3 ff ff       	call   0x401dc0
  4039c6:	85 c0                	test   eax,eax
  4039c8:	0f 85 50 ff ff ff    	jne    0x40391e
  4039ce:	66 90                	xchg   ax,ax
  4039d0:	45 85 ed             	test   r13d,r13d
  4039d3:	0f 85 b3 01 00 00    	jne    0x403b8c
  4039d9:	e8 92 e5 ff ff       	call   0x401f70
  4039de:	45 31 ff             	xor    r15d,r15d
  4039e1:	83 f8 02             	cmp    eax,0x2
  4039e4:	0f 84 8f 02 00 00    	je     0x403c79
  4039ea:	48 8d 05 9b 77 00 00 	lea    rax,[rip+0x779b]        # 0x40b18c
  4039f1:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  4039f6:	b8 02 00 00 00       	mov    eax,0x2
  4039fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403a00:	bf 0a 00 00 00       	mov    edi,0xa
  403a05:	44 8d 2c 18          	lea    r13d,[rax+rbx*1]
  403a09:	e8 24 18 00 00       	call   0x405232
  403a0e:	e8 5d e5 ff ff       	call   0x401f70
  403a13:	85 c0                	test   eax,eax
  403a15:	0f 85 f1 01 00 00    	jne    0x403c0c
  403a1b:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  403a20:	48 89 ee             	mov    rsi,rbp
  403a23:	bb 2c 00 00 00       	mov    ebx,0x2c
  403a28:	e8 bf 14 00 00       	call   0x404eec
  403a2d:	0f 1f 00             	nop    DWORD PTR [rax]
  403a30:	48 89 ee             	mov    rsi,rbp
  403a33:	4c 89 e7             	mov    rdi,r12
  403a36:	e8 b1 14 00 00       	call   0x404eec
  403a3b:	83 eb 01             	sub    ebx,0x1
  403a3e:	75 f0                	jne    0x403a30
  403a40:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  403a45:	48 89 ee             	mov    rsi,rbp
  403a48:	e8 9f 14 00 00       	call   0x404eec
  403a4d:	bf 0a 00 00 00       	mov    edi,0xa
  403a52:	e8 db 17 00 00       	call   0x405232
  403a57:	48 89 ee             	mov    rsi,rbp
  403a5a:	4c 89 f7             	mov    rdi,r14
  403a5d:	e8 8a 14 00 00       	call   0x404eec
  403a62:	48 89 e9             	mov    rcx,rbp
  403a65:	ba 02 00 00 00       	mov    edx,0x2
  403a6a:	be 01 00 00 00       	mov    esi,0x1
  403a6f:	48 8d 3d b6 76 00 00 	lea    rdi,[rip+0x76b6]        # 0x40b12c
  403a76:	e8 8e 15 00 00       	call   0x405009
  403a7b:	4d 85 ff             	test   r15,r15
  403a7e:	74 15                	je     0x403a95
  403a80:	4c 89 ff             	mov    rdi,r15
  403a83:	48 89 ee             	mov    rsi,rbp
  403a86:	e8 61 14 00 00       	call   0x404eec
  403a8b:	bf 20 00 00 00       	mov    edi,0x20
  403a90:	e8 9d 17 00 00       	call   0x405232
  403a95:	48 89 ee             	mov    rsi,rbp
  403a98:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
  403a9d:	e8 4a 14 00 00       	call   0x404eec
  403aa2:	0f 1f 00             	nop    DWORD PTR [rax]
  403aa5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403aac:	00 00 00 00 
  403ab0:	bf 20 00 00 00       	mov    edi,0x20
  403ab5:	41 83 c5 01          	add    r13d,0x1
  403ab9:	e8 74 17 00 00       	call   0x405232
  403abe:	41 83 fd 2c          	cmp    r13d,0x2c
  403ac2:	75 ec                	jne    0x403ab0
  403ac4:	48 89 ee             	mov    rsi,rbp
  403ac7:	4c 89 f7             	mov    rdi,r14
  403aca:	bb 2c 00 00 00       	mov    ebx,0x2c
  403acf:	e8 18 14 00 00       	call   0x404eec
  403ad4:	bf 0a 00 00 00       	mov    edi,0xa
  403ad9:	e8 54 17 00 00       	call   0x405232
  403ade:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
  403ae3:	48 89 ee             	mov    rsi,rbp
  403ae6:	e8 01 14 00 00       	call   0x404eec
  403aeb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403af0:	48 89 ee             	mov    rsi,rbp
  403af3:	4c 89 e7             	mov    rdi,r12
  403af6:	e8 f1 13 00 00       	call   0x404eec
  403afb:	83 eb 01             	sub    ebx,0x1
  403afe:	75 f0                	jne    0x403af0
  403b00:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  403b05:	48 89 ee             	mov    rsi,rbp
  403b08:	e8 df 13 00 00       	call   0x404eec
  403b0d:	e8 5e e4 ff ff       	call   0x401f70
  403b12:	85 c0                	test   eax,eax
  403b14:	0f 85 04 01 00 00    	jne    0x403c1e
  403b1a:	bf 0a 00 00 00       	mov    edi,0xa
  403b1f:	e8 0e 17 00 00       	call   0x405232
  403b24:	4c 8b 74 24 78       	mov    r14,QWORD PTR [rsp+0x78]
  403b29:	4c 8b bc 24 80 00 00 	mov    r15,QWORD PTR [rsp+0x80]
  403b30:	00 
  403b31:	eb 29                	jmp    0x403b5c
  403b33:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403b38:	be 01 00 00 00       	mov    esi,0x1
  403b3d:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
  403b42:	49 8d 54 24 ff       	lea    rdx,[r12-0x1]
  403b47:	48 89 e9             	mov    rcx,rbp
  403b4a:	e8 ba 14 00 00       	call   0x405009
  403b4f:	48 89 ee             	mov    rsi,rbp
  403b52:	bf 0a 00 00 00       	mov    edi,0xa
  403b57:	e8 3b 13 00 00       	call   0x404e97
  403b5c:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
  403b61:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  403b68:	00 00 
  403b6a:	0f 85 1a 01 00 00    	jne    0x403c8a
  403b70:	48 8b 5c 24 58       	mov    rbx,QWORD PTR [rsp+0x58]
  403b75:	48 8b 6c 24 60       	mov    rbp,QWORD PTR [rsp+0x60]
  403b7a:	4c 8b 64 24 68       	mov    r12,QWORD PTR [rsp+0x68]
  403b7f:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
  403b84:	48 81 c4 88 00 00 00 	add    rsp,0x88
  403b8b:	c3                   	ret
  403b8c:	e8 df e3 ff ff       	call   0x401f70
  403b91:	45 31 ff             	xor    r15d,r15d
  403b94:	83 f8 02             	cmp    eax,0x2
  403b97:	0f 84 9f 00 00 00    	je     0x403c3c
  403b9d:	48 8d 05 44 76 00 00 	lea    rax,[rip+0x7644]        # 0x40b1e8
  403ba4:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  403ba9:	b8 02 00 00 00       	mov    eax,0x2
  403bae:	e9 4d fe ff ff       	jmp    0x403a00
  403bb3:	e8 b8 e3 ff ff       	call   0x401f70
  403bb8:	4c 8d 3d 31 76 00 00 	lea    r15,[rip+0x7631]        # 0x40b1f0
  403bbf:	83 f8 02             	cmp    eax,0x2
  403bc2:	0f 84 85 00 00 00    	je     0x403c4d
  403bc8:	48 8d 05 bd 75 00 00 	lea    rax,[rip+0x75bd]        # 0x40b18c
  403bcf:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  403bd4:	b8 04 00 00 00       	mov    eax,0x4
  403bd9:	e9 22 fe ff ff       	jmp    0x403a00
  403bde:	48 8d 05 87 75 00 00 	lea    rax,[rip+0x7587]        # 0x40b16c
  403be5:	4c 8d 35 93 74 00 00 	lea    r14,[rip+0x7493]        # 0x40b07f
  403bec:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  403bf1:	4c 8d 25 76 75 00 00 	lea    r12,[rip+0x7576]        # 0x40b16e
  403bf8:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403bfd:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403c02:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  403c07:	e9 05 fd ff ff       	jmp    0x403911
  403c0c:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
  403c11:	48 89 ee             	mov    rsi,rbp
  403c14:	e8 d3 12 00 00       	call   0x404eec
  403c19:	e9 fd fd ff ff       	jmp    0x403a1b
  403c1e:	48 89 e9             	mov    rcx,rbp
  403c21:	ba 04 00 00 00       	mov    edx,0x4
  403c26:	be 01 00 00 00       	mov    esi,0x1
  403c2b:	48 8d 3d 4f 74 00 00 	lea    rdi,[rip+0x744f]        # 0x40b081
  403c32:	e8 d2 13 00 00       	call   0x405009
  403c37:	e9 de fe ff ff       	jmp    0x403b1a
  403c3c:	48 8d 0d 51 75 00 00 	lea    rcx,[rip+0x7551]        # 0x40b194
  403c43:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
  403c48:	e9 b3 fd ff ff       	jmp    0x403a00
  403c4d:	48 8d 05 2a 75 00 00 	lea    rax,[rip+0x752a]        # 0x40b17e
  403c54:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  403c59:	b8 04 00 00 00       	mov    eax,0x4
  403c5e:	e9 9d fd ff ff       	jmp    0x403a00
  403c63:	48 8d 05 2a 75 00 00 	lea    rax,[rip+0x752a]        # 0x40b194
  403c6a:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  403c6f:	b8 04 00 00 00       	mov    eax,0x4
  403c74:	e9 87 fd ff ff       	jmp    0x403a00
  403c79:	48 8d 0d fe 74 00 00 	lea    rcx,[rip+0x74fe]        # 0x40b17e
  403c80:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
  403c85:	e9 76 fd ff ff       	jmp    0x403a00
  403c8a:	4c 89 74 24 78       	mov    QWORD PTR [rsp+0x78],r14
  403c8f:	4c 89 bc 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r15
  403c96:	00 
  403c97:	e8 b0 06 00 00       	call   0x40434c
  403c9c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  403ca0:	48 83 ec 08          	sub    rsp,0x8
  403ca4:	bf 01 00 00 00       	mov    edi,0x1
  403ca9:	e8 21 50 00 00       	call   0x408ccf
  403cae:	85 c0                	test   eax,eax
  403cb0:	0f 95 c0             	setne  al
  403cb3:	48 83 c4 08          	add    rsp,0x8
  403cb7:	0f b6 c0             	movzx  eax,al
  403cba:	c3                   	ret
  403cbb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403cc0:	48 83 ec 08          	sub    rsp,0x8
  403cc4:	31 ff                	xor    edi,edi
  403cc6:	e8 04 50 00 00       	call   0x408ccf
  403ccb:	85 c0                	test   eax,eax
  403ccd:	0f 95 c0             	setne  al
  403cd0:	48 83 c4 08          	add    rsp,0x8
  403cd4:	0f b6 c0             	movzx  eax,al
  403cd7:	c3                   	ret
  403cd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  403cdf:	00 
  403ce0:	48 83 ec 28          	sub    rsp,0x28
  403ce4:	89 fa                	mov    edx,edi
  403ce6:	31 f6                	xor    esi,esi
  403ce8:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403cef:	00 00 
  403cf1:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403cf6:	48 63 c7             	movsxd rax,edi
  403cf9:	c1 fa 1f             	sar    edx,0x1f
  403cfc:	48 69 c0 d3 4d 62 10 	imul   rax,rax,0x10624dd3
  403d03:	48 c1 f8 26          	sar    rax,0x26
  403d07:	29 d0                	sub    eax,edx
  403d09:	48 63 d0             	movsxd rdx,eax
  403d0c:	69 c0 e8 03 00 00    	imul   eax,eax,0x3e8
  403d12:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
  403d16:	29 c7                	sub    edi,eax
  403d18:	48 63 ff             	movsxd rdi,edi
  403d1b:	48 69 ff 40 42 0f 00 	imul   rdi,rdi,0xf4240
  403d22:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  403d27:	48 89 e7             	mov    rdi,rsp
  403d2a:	e8 7e 4f 00 00       	call   0x408cad
  403d2f:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  403d34:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  403d3b:	00 00 
  403d3d:	75 05                	jne    0x403d44
  403d3f:	48 83 c4 28          	add    rsp,0x28
  403d43:	c3                   	ret
  403d44:	e8 03 06 00 00       	call   0x40434c
  403d49:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403d50:	00 00 00 
  403d53:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403d5a:	00 00 00 
  403d5d:	0f 1f 00             	nop    DWORD PTR [rax]
  403d60:	48 81 ec 38 08 00 00 	sub    rsp,0x838
  403d67:	31 c9                	xor    ecx,ecx
  403d69:	be 9c ff ff ff       	mov    esi,0xffffff9c
  403d6e:	bf 01 01 00 00       	mov    edi,0x101
  403d73:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403d7a:	00 00 
  403d7c:	48 89 84 24 08 08 00 	mov    QWORD PTR [rsp+0x808],rax
  403d83:	00 
  403d84:	31 c0                	xor    eax,eax
  403d86:	48 8d 15 a3 74 00 00 	lea    rdx,[rip+0x74a3]        # 0x40b230
  403d8d:	e8 84 0b 00 00       	call   0x404916
  403d92:	48 85 c0             	test   rax,rax
  403d95:	0f 88 b2 00 00 00    	js     0x403e4d
  403d9b:	48 89 ac 24 20 08 00 	mov    QWORD PTR [rsp+0x820],rbp
  403da2:	00 
  403da3:	31 ed                	xor    ebp,ebp
  403da5:	4c 89 a4 24 28 08 00 	mov    QWORD PTR [rsp+0x828],r12
  403dac:	00 
  403dad:	49 89 c4             	mov    r12,rax
  403db0:	b9 ff 07 00 00       	mov    ecx,0x7ff
  403db5:	31 ff                	xor    edi,edi
  403db7:	31 c0                	xor    eax,eax
  403db9:	4c 89 e6             	mov    rsi,r12
  403dbc:	48 29 e9             	sub    rcx,rbp
  403dbf:	48 8d 14 2c          	lea    rdx,[rsp+rbp*1]
  403dc3:	e8 4e 0b 00 00       	call   0x404916
  403dc8:	48 85 c0             	test   rax,rax
  403dcb:	7e 0c                	jle    0x403dd9
  403dcd:	48 01 c5             	add    rbp,rax
  403dd0:	48 81 fd fe 07 00 00 	cmp    rbp,0x7fe
  403dd7:	76 d7                	jbe    0x403db0
  403dd9:	bf 03 00 00 00       	mov    edi,0x3
  403dde:	4c 89 e6             	mov    rsi,r12
  403de1:	31 c0                	xor    eax,eax
  403de3:	e8 2e 0b 00 00       	call   0x404916
  403de8:	c6 04 2c 00          	mov    BYTE PTR [rsp+rbp*1],0x0
  403dec:	48 89 e7             	mov    rdi,rsp
  403def:	90                   	nop
  403df0:	48 8d 35 4b 74 00 00 	lea    rsi,[rip+0x744b]        # 0x40b242
  403df7:	e8 a4 4a 00 00       	call   0x4088a0
  403dfc:	48 89 c2             	mov    rdx,rax
  403dff:	48 85 c0             	test   rax,rax
  403e02:	74 39                	je     0x403e3d
  403e04:	0f b6 42 0a          	movzx  eax,BYTE PTR [rdx+0xa]
  403e08:	48 8d 7a 0a          	lea    rdi,[rdx+0xa]
  403e0c:	3c 09                	cmp    al,0x9
  403e0e:	74 10                	je     0x403e20
  403e10:	3c 20                	cmp    al,0x20
  403e12:	75 1c                	jne    0x403e30
  403e14:	90                   	nop
  403e15:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403e1c:	00 00 00 00 
  403e20:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
  403e24:	48 83 c7 01          	add    rdi,0x1
  403e28:	3c 20                	cmp    al,0x20
  403e2a:	74 f4                	je     0x403e20
  403e2c:	3c 09                	cmp    al,0x9
  403e2e:	74 f0                	je     0x403e20
  403e30:	83 e8 30             	sub    eax,0x30
  403e33:	3c 09                	cmp    al,0x9
  403e35:	76 33                	jbe    0x403e6a
  403e37:	48 8d 7a 01          	lea    rdi,[rdx+0x1]
  403e3b:	eb b3                	jmp    0x403df0
  403e3d:	48 8b ac 24 20 08 00 	mov    rbp,QWORD PTR [rsp+0x820]
  403e44:	00 
  403e45:	4c 8b a4 24 28 08 00 	mov    r12,QWORD PTR [rsp+0x828]
  403e4c:	00 
  403e4d:	31 c0                	xor    eax,eax
  403e4f:	48 8b 94 24 08 08 00 	mov    rdx,QWORD PTR [rsp+0x808]
  403e56:	00 
  403e57:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403e5e:	00 00 
  403e60:	75 26                	jne    0x403e88
  403e62:	48 81 c4 38 08 00 00 	add    rsp,0x838
  403e69:	c3                   	ret
  403e6a:	ba 0a 00 00 00       	mov    edx,0xa
  403e6f:	31 f6                	xor    esi,esi
  403e71:	e8 11 42 00 00       	call   0x408087
  403e76:	48 8b ac 24 20 08 00 	mov    rbp,QWORD PTR [rsp+0x820]
  403e7d:	00 
  403e7e:	4c 8b a4 24 28 08 00 	mov    r12,QWORD PTR [rsp+0x828]
  403e85:	00 
  403e86:	eb c7                	jmp    0x403e4f
  403e88:	48 89 9c 24 18 08 00 	mov    QWORD PTR [rsp+0x818],rbx
  403e8f:	00 
  403e90:	48 89 ac 24 20 08 00 	mov    QWORD PTR [rsp+0x820],rbp
  403e97:	00 
  403e98:	4c 89 a4 24 28 08 00 	mov    QWORD PTR [rsp+0x828],r12
  403e9f:	00 
  403ea0:	4c 89 ac 24 30 08 00 	mov    QWORD PTR [rsp+0x830],r13
  403ea7:	00 
  403ea8:	e8 9f 04 00 00       	call   0x40434c
  403ead:	0f 1f 00             	nop    DWORD PTR [rax]
  403eb0:	53                   	push   rbx
  403eb1:	31 ff                	xor    edi,edi
  403eb3:	4c 8d 05 06 c1 00 00 	lea    r8,[rip+0xc106]        # 0x40ffc0
  403eba:	48 83 ec 10          	sub    rsp,0x10
  403ebe:	c6 44 24 0f cc       	mov    BYTE PTR [rsp+0xf],0xcc
  403ec3:	49 8b 04 f8          	mov    rax,QWORD PTR [r8+rdi*8]
  403ec7:	31 d2                	xor    edx,edx
  403ec9:	48 8d 70 10          	lea    rsi,[rax+0x10]
  403ecd:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  403ed4:	00 
  403ed5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403edc:	00 00 00 00 
  403ee0:	31 c9                	xor    ecx,ecx
  403ee2:	0f b6 5c 24 0f       	movzx  ebx,BYTE PTR [rsp+0xf]
  403ee7:	38 18                	cmp    BYTE PTR [rax],bl
  403ee9:	0f 94 c1             	sete   cl
  403eec:	48 83 c0 01          	add    rax,0x1
  403ef0:	01 ca                	add    edx,ecx
  403ef2:	48 39 c6             	cmp    rsi,rax
  403ef5:	75 e9                	jne    0x403ee0
  403ef7:	83 fa 01             	cmp    edx,0x1
  403efa:	7f 23                	jg     0x403f1f
  403efc:	48 83 c7 01          	add    rdi,0x1
  403f00:	48 83 ff 03          	cmp    rdi,0x3
  403f04:	75 bd                	jne    0x403ec3
  403f06:	31 db                	xor    ebx,ebx
  403f08:	e8 53 fe ff ff       	call   0x403d60
  403f0d:	89 c2                	mov    edx,eax
  403f0f:	89 d8                	mov    eax,ebx
  403f11:	83 c8 10             	or     eax,0x10
  403f14:	85 d2                	test   edx,edx
  403f16:	0f 44 c3             	cmove  eax,ebx
  403f19:	48 83 c4 10          	add    rsp,0x10
  403f1d:	5b                   	pop    rbx
  403f1e:	c3                   	ret
  403f1f:	bb 40 00 00 00       	mov    ebx,0x40
  403f24:	eb e2                	jmp    0x403f08
  403f26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403f2d:	00 00 00 
  403f30:	45 31 c9             	xor    r9d,r9d
  403f33:	ba 78 56 34 12       	mov    edx,0x12345678
  403f38:	4c 8d 15 81 c0 00 00 	lea    r10,[rip+0xc081]        # 0x40ffc0
  403f3f:	4b 8b 34 ca          	mov    rsi,QWORD PTR [r10+r9*8]
  403f43:	44 69 c2 93 01 00 01 	imul   r8d,edx,0x1000193
  403f4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403f4f:	48 8d 7e 40          	lea    rdi,[rsi+0x40]
  403f53:	66 90                	xchg   ax,ax
  403f55:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403f5c:	00 00 00 00 
  403f60:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  403f63:	31 d0                	xor    eax,edx
  403f65:	ba 08 00 00 00       	mov    edx,0x8
  403f6a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403f71:	00 00 00 00 
  403f75:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403f7c:	00 00 00 00 
  403f80:	89 c1                	mov    ecx,eax
  403f82:	83 e0 01             	and    eax,0x1
  403f85:	f7 d8                	neg    eax
  403f87:	d1 e9                	shr    ecx,1
  403f89:	25 20 83 b8 ed       	and    eax,0xedb88320
  403f8e:	31 c8                	xor    eax,ecx
  403f90:	83 ea 01             	sub    edx,0x1
  403f93:	75 eb                	jne    0x403f80
  403f95:	48 83 c6 01          	add    rsi,0x1
  403f99:	48 39 fe             	cmp    rsi,rdi
  403f9c:	75 c2                	jne    0x403f60
  403f9e:	41 8d 50 ff          	lea    edx,[r8-0x1]
  403fa2:	49 83 c1 01          	add    r9,0x1
  403fa6:	29 c2                	sub    edx,eax
  403fa8:	49 83 f9 03          	cmp    r9,0x3
  403fac:	75 91                	jne    0x403f3f
  403fae:	89 d0                	mov    eax,edx
  403fb0:	c3                   	ret
  403fb1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  403fb5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  403fbc:	00 00 00 00 
  403fc0:	e8 6b ff ff ff       	call   0x403f30
  403fc5:	89 05 99 d1 00 00    	mov    DWORD PTR [rip+0xd199],eax        # 0x411164
  403fcb:	c3                   	ret
  403fcc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  403fd0:	48 83 ec 28          	sub    rsp,0x28
  403fd4:	bf 01 00 00 00       	mov    edi,0x1
  403fd9:	64 48 8b 34 25 28 00 	mov    rsi,QWORD PTR fs:0x28
  403fe0:	00 00 
  403fe2:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  403fe7:	48 89 e6             	mov    rsi,rsp
  403fea:	e8 45 4c 00 00       	call   0x408c34
  403fef:	66 0f ef c0          	pxor   xmm0,xmm0
  403ff3:	f2 48 0f 2a 04 24    	cvtsi2sd xmm0,QWORD PTR [rsp]
  403ff9:	66 0f ef c9          	pxor   xmm1,xmm1
  403ffd:	f2 0f 59 05 33 74 00 	mulsd  xmm0,QWORD PTR [rip+0x7433]        # 0x40b438
  404004:	00 
  404005:	f2 48 0f 2a 4c 24 08 	cvtsi2sd xmm1,QWORD PTR [rsp+0x8]
  40400c:	f2 0f 5e 0d 2c 74 00 	divsd  xmm1,QWORD PTR [rip+0x742c]        # 0x40b440
  404013:	00 
  404014:	f2 0f 58 c1          	addsd  xmm0,xmm1
  404018:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40401d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  404024:	00 00 
  404026:	75 05                	jne    0x40402d
  404028:	48 83 c4 28          	add    rsp,0x28
  40402c:	c3                   	ret
  40402d:	e8 1a 03 00 00       	call   0x40434c
  404032:	0f 1f 00             	nop    DWORD PTR [rax]
  404035:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40403c:	00 00 00 00 
  404040:	53                   	push   rbx
  404041:	31 db                	xor    ebx,ebx
  404043:	e8 e8 fe ff ff       	call   0x403f30
  404048:	39 05 16 d1 00 00    	cmp    DWORD PTR [rip+0xd116],eax        # 0x411164
  40404e:	0f 95 c3             	setne  bl
  404051:	e8 0a fd ff ff       	call   0x403d60
  404056:	c1 e3 06             	shl    ebx,0x6
  404059:	89 c2                	mov    edx,eax
  40405b:	89 d8                	mov    eax,ebx
  40405d:	83 c8 10             	or     eax,0x10
  404060:	85 d2                	test   edx,edx
  404062:	0f 44 c3             	cmove  eax,ebx
  404065:	5b                   	pop    rbx
  404066:	c3                   	ret
  404067:	8d 57 bf             	lea    edx,[rdi-0x41]
  40406a:	89 f8                	mov    eax,edi
  40406c:	83 c8 20             	or     eax,0x20
  40406f:	83 fa 1a             	cmp    edx,0x1a
  404072:	0f 43 c7             	cmovae eax,edi
  404075:	c3                   	ret
  404076:	e9 ec ff ff ff       	jmp    0x404067
  40407b:	c3                   	ret
  40407c:	c3                   	ret
  40407d:	0f 1f 00             	nop    DWORD PTR [rax]
  404080:	48 81 ec 58 01 00 00 	sub    rsp,0x158
  404087:	49 89 f8             	mov    r8,rdi
  40408a:	31 c0                	xor    eax,eax
  40408c:	48 89 f2             	mov    rdx,rsi
  40408f:	b9 26 00 00 00       	mov    ecx,0x26
  404094:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
  404099:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  40409c:	48 c7 c0 c8 1c 41 00 	mov    rax,0x411cc8
  4040a3:	4c 89 00             	mov    QWORD PTR [rax],r8
  4040a6:	31 c0                	xor    eax,eax
  4040a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4040af:	00 
  4040b0:	49 8b 0c c0          	mov    rcx,QWORD PTR [r8+rax*8]
  4040b4:	48 83 c0 01          	add    rax,0x1
  4040b8:	48 85 c9             	test   rcx,rcx
  4040bb:	75 f3                	jne    0x4040b0
  4040bd:	49 8d 04 c0          	lea    rax,[r8+rax*8]
  4040c1:	48 89 05 20 d3 00 00 	mov    QWORD PTR [rip+0xd320],rax        # 0x4113e8
  4040c8:	eb 1a                	jmp    0x4040e4
  4040ca:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4040d1:	00 00 00 00 
  4040d5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4040dc:	00 00 00 00 
  4040e0:	48 83 c0 10          	add    rax,0x10
  4040e4:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  4040e7:	48 85 c9             	test   rcx,rcx
  4040ea:	74 11                	je     0x4040fd
  4040ec:	48 83 f9 25          	cmp    rcx,0x25
  4040f0:	77 ee                	ja     0x4040e0
  4040f2:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
  4040f6:	48 89 74 cc 20       	mov    QWORD PTR [rsp+rcx*8+0x20],rsi
  4040fb:	eb e3                	jmp    0x4040e0
  4040fd:	48 8b 84 24 a0 00 00 	mov    rax,QWORD PTR [rsp+0xa0]
  404104:	00 
  404105:	48 89 05 bc d2 00 00 	mov    QWORD PTR [rip+0xd2bc],rax        # 0x4113c8
  40410c:	48 8b 84 24 20 01 00 	mov    rax,QWORD PTR [rsp+0x120]
  404113:	00 
  404114:	48 85 c0             	test   rax,rax
  404117:	74 07                	je     0x404120
  404119:	48 89 05 90 d2 00 00 	mov    QWORD PTR [rip+0xd290],rax        # 0x4113b0
  404120:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
  404125:	48 89 05 e4 d2 00 00 	mov    QWORD PTR [rip+0xd2e4],rax        # 0x411410
  40412c:	48 85 d2             	test   rdx,rdx
  40412f:	74 1a                	je     0x40414b
  404131:	48 c7 c0 b8 13 41 00 	mov    rax,0x4113b8
  404138:	48 c7 c1 c0 13 41 00 	mov    rcx,0x4113c0
  40413f:	48 89 10             	mov    QWORD PTR [rax],rdx
  404142:	48 8d 42 01          	lea    rax,[rdx+0x1]
  404146:	48 89 11             	mov    QWORD PTR [rcx],rdx
  404149:	eb 39                	jmp    0x404184
  40414b:	48 8b 84 24 18 01 00 	mov    rax,QWORD PTR [rsp+0x118]
  404152:	00 
  404153:	48 8d 15 c8 6e 00 00 	lea    rdx,[rip+0x6ec8]        # 0x40b022
  40415a:	48 85 c0             	test   rax,rax
  40415d:	48 0f 45 d0          	cmovne rdx,rax
  404161:	eb ce                	jmp    0x404131
  404163:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  40416a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  404171:	00 00 00 00 
  404175:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40417c:	00 00 00 00 
  404180:	48 83 c0 01          	add    rax,0x1
  404184:	0f b6 50 ff          	movzx  edx,BYTE PTR [rax-0x1]
  404188:	84 d2                	test   dl,dl
  40418a:	74 0a                	je     0x404196
  40418c:	80 fa 2f             	cmp    dl,0x2f
  40418f:	75 ef                	jne    0x404180
  404191:	48 89 01             	mov    QWORD PTR [rcx],rax
  404194:	eb ea                	jmp    0x404180
  404196:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
  40419b:	e8 80 4c 00 00       	call   0x408e20
  4041a0:	48 8b bc 24 e8 00 00 	mov    rdi,QWORD PTR [rsp+0xe8]
  4041a7:	00 
  4041a8:	e8 49 01 00 00       	call   0x4042f6
  4041ad:	48 8b 84 24 80 00 00 	mov    rax,QWORD PTR [rsp+0x80]
  4041b4:	00 
  4041b5:	48 39 44 24 78       	cmp    QWORD PTR [rsp+0x78],rax
  4041ba:	74 4c                	je     0x404208
  4041bc:	66 0f ef c0          	pxor   xmm0,xmm0
  4041c0:	48 89 e7             	mov    rdi,rsp
  4041c3:	b8 07 00 00 00       	mov    eax,0x7
  4041c8:	31 d2                	xor    edx,edx
  4041ca:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4041d1:	00 00 
  4041d3:	be 03 00 00 00       	mov    esi,0x3
  4041d8:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
  4041dc:	c7 44 24 10 02 00 00 	mov    DWORD PTR [rsp+0x10],0x2
  4041e3:	00 
  4041e4:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  4041eb:	00 
  4041ec:	0f 05                	syscall
  4041ee:	85 c0                	test   eax,eax
  4041f0:	78 35                	js     0x404227
  4041f2:	48 89 fa             	mov    rdx,rdi
  4041f5:	4c 8d 44 24 18       	lea    r8,[rsp+0x18]
  4041fa:	be 02 80 00 00       	mov    esi,0x8002
  4041ff:	48 8d 3d 47 70 00 00 	lea    rdi,[rip+0x7047]        # 0x40b24d
  404206:	eb 31                	jmp    0x404239
  404208:	48 8b 84 24 90 00 00 	mov    rax,QWORD PTR [rsp+0x90]
  40420f:	00 
  404210:	48 39 84 24 88 00 00 	cmp    QWORD PTR [rsp+0x88],rax
  404217:	00 
  404218:	75 a2                	jne    0x4041bc
  40421a:	48 83 bc 24 d8 00 00 	cmp    QWORD PTR [rsp+0xd8],0x0
  404221:	00 00 
  404223:	75 97                	jne    0x4041bc
  404225:	eb 2e                	jmp    0x404255
  404227:	f4                   	hlt
  404228:	eb c8                	jmp    0x4041f2
  40422a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  404230:	48 83 c2 08          	add    rdx,0x8
  404234:	49 39 d0             	cmp    r8,rdx
  404237:	74 15                	je     0x40424e
  404239:	f6 42 06 20          	test   BYTE PTR [rdx+0x6],0x20
  40423d:	74 f1                	je     0x404230
  40423f:	b8 02 00 00 00       	mov    eax,0x2
  404244:	0f 05                	syscall
  404246:	48 85 c0             	test   rax,rax
  404249:	79 e5                	jns    0x404230
  40424b:	f4                   	hlt
  40424c:	eb e2                	jmp    0x404230
  40424e:	c6 05 8d d1 00 00 01 	mov    BYTE PTR [rip+0xd18d],0x1        # 0x4113e2
  404255:	48 81 c4 58 01 00 00 	add    rsp,0x158
  40425c:	c3                   	ret
  40425d:	55                   	push   rbp
  40425e:	53                   	push   rbx
  40425f:	48 83 ec 08          	sub    rsp,0x8
  404263:	e8 98 cd ff ff       	call   0x401000
  404268:	48 c7 c3 d0 fe 40 00 	mov    rbx,0x40fed0
  40426f:	48 c7 c5 d8 fe 40 00 	mov    rbp,0x40fed8
  404276:	eb 06                	jmp    0x40427e
  404278:	ff 13                	call   QWORD PTR [rbx]
  40427a:	48 83 c3 08          	add    rbx,0x8
  40427e:	48 39 eb             	cmp    rbx,rbp
  404281:	72 f5                	jb     0x404278
  404283:	48 83 c4 08          	add    rsp,0x8
  404287:	5b                   	pop    rbx
  404288:	5d                   	pop    rbp
  404289:	c3                   	ret
  40428a:	41 55                	push   r13
  40428c:	48 63 c6             	movsxd rax,esi
  40428f:	41 54                	push   r12
  404291:	4c 8d 6c c2 08       	lea    r13,[rdx+rax*8+0x8]
  404296:	49 89 fc             	mov    r12,rdi
  404299:	55                   	push   rbp
  40429a:	48 89 d5             	mov    rbp,rdx
  40429d:	53                   	push   rbx
  40429e:	48 89 c3             	mov    rbx,rax
  4042a1:	48 83 ec 08          	sub    rsp,0x8
  4042a5:	e8 b3 ff ff ff       	call   0x40425d
  4042aa:	89 df                	mov    edi,ebx
  4042ac:	4c 89 ea             	mov    rdx,r13
  4042af:	48 89 ee             	mov    rsi,rbp
  4042b2:	41 ff d4             	call   r12
  4042b5:	89 c7                	mov    edi,eax
  4042b7:	e8 84 cd ff ff       	call   0x401040
  4042bc:	55                   	push   rbp
  4042bd:	48 63 c6             	movsxd rax,esi
  4042c0:	48 89 fd             	mov    rbp,rdi
  4042c3:	53                   	push   rbx
  4042c4:	48 8d 7c c2 08       	lea    rdi,[rdx+rax*8+0x8]
  4042c9:	48 89 c3             	mov    rbx,rax
  4042cc:	48 83 ec 18          	sub    rsp,0x18
  4042d0:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
  4042d3:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  4042d8:	e8 a3 fd ff ff       	call   0x404080
  4042dd:	48 8d 05 a6 ff ff ff 	lea    rax,[rip+0xffffffffffffffa6]        # 0x40428a
  4042e4:	89 de                	mov    esi,ebx
  4042e6:	48 89 ef             	mov    rdi,rbp
  4042e9:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  4042ee:	48 83 c4 18          	add    rsp,0x18
  4042f2:	5b                   	pop    rbx
  4042f3:	5d                   	pop    rbp
  4042f4:	ff e0                	jmp    rax
  4042f6:	48 83 ec 18          	sub    rsp,0x18
  4042fa:	48 85 ff             	test   rdi,rdi
  4042fd:	74 3a                	je     0x404339
  4042ff:	48 c7 c1 68 11 41 00 	mov    rcx,0x411168
  404306:	48 89 fe             	mov    rsi,rdi
  404309:	ba 08 00 00 00       	mov    edx,0x8
  40430e:	48 89 cf             	mov    rdi,rcx
  404311:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  404316:	e8 e8 46 00 00       	call   0x408a03
  40431b:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  404320:	c6 41 01 00          	mov    BYTE PTR [rcx+0x1],0x0
  404324:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  404327:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  40432e:	00 00 
  404330:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
  404334:	48 83 c4 18          	add    rsp,0x18
  404338:	c3                   	ret
  404339:	48 c7 c1 68 11 41 00 	mov    rcx,0x411168
  404340:	48 69 c1 6d 4e c6 41 	imul   rax,rcx,0x41c64e6d
  404347:	48 89 01             	mov    QWORD PTR [rcx],rax
  40434a:	eb d4                	jmp    0x404320
  40434c:	f4                   	hlt
  40434d:	c3                   	ret
  40434e:	41 54                	push   r12
  404350:	be 3d 00 00 00       	mov    esi,0x3d
  404355:	55                   	push   rbp
  404356:	48 89 fd             	mov    rbp,rdi
  404359:	53                   	push   rbx
  40435a:	e8 a1 3f 00 00       	call   0x408300
  40435f:	49 89 c4             	mov    r12,rax
  404362:	49 29 ec             	sub    r12,rbp
  404365:	74 14                	je     0x40437b
  404367:	80 38 00             	cmp    BYTE PTR [rax],0x0
  40436a:	75 0f                	jne    0x40437b
  40436c:	48 c7 c0 c8 1c 41 00 	mov    rax,0x411cc8
  404373:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  404376:	48 85 db             	test   rbx,rbx
  404379:	75 0b                	jne    0x404386
  40437b:	31 c0                	xor    eax,eax
  40437d:	5b                   	pop    rbx
  40437e:	5d                   	pop    rbp
  40437f:	41 5c                	pop    r12
  404381:	c3                   	ret
  404382:	48 83 c3 08          	add    rbx,0x8
  404386:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
  404389:	48 85 f6             	test   rsi,rsi
  40438c:	74 ed                	je     0x40437b
  40438e:	4c 89 e2             	mov    rdx,r12
  404391:	48 89 ef             	mov    rdi,rbp
  404394:	e8 27 41 00 00       	call   0x4084c0
  404399:	85 c0                	test   eax,eax
  40439b:	75 e5                	jne    0x404382
  40439d:	48 8b 03             	mov    rax,QWORD PTR [rbx]
  4043a0:	42 80 3c 20 3d       	cmp    BYTE PTR [rax+r12*1],0x3d
  4043a5:	75 db                	jne    0x404382
  4043a7:	4a 8d 44 20 01       	lea    rax,[rax+r12*1+0x1]
  4043ac:	eb cf                	jmp    0x40437d
  4043ae:	ff e7                	jmp    rdi
  4043b0:	55                   	push   rbp
  4043b1:	48 8d 3d b8 cd 00 00 	lea    rdi,[rip+0xcdb8]        # 0x411170
  4043b8:	53                   	push   rbx
  4043b9:	48 83 ec 08          	sub    rsp,0x8
  4043bd:	e8 37 47 00 00       	call   0x408af9
  4043c2:	48 8b 15 b7 cd 00 00 	mov    rdx,QWORD PTR [rip+0xcdb7]        # 0x411180
  4043c9:	eb 5a                	jmp    0x404425
  4043cb:	48 98                	cdqe
  4043cd:	48 8d 3d 9c cd 00 00 	lea    rdi,[rip+0xcd9c]        # 0x411170
  4043d4:	48 8b ac c2 08 01 00 	mov    rbp,QWORD PTR [rdx+rax*8+0x108]
  4043db:	00 
  4043dc:	48 8b 5c c2 08       	mov    rbx,QWORD PTR [rdx+rax*8+0x8]
  4043e1:	e8 c4 47 00 00       	call   0x408baa
  4043e6:	48 89 ef             	mov    rdi,rbp
  4043e9:	ff d3                	call   rbx
  4043eb:	48 8d 3d 7e cd 00 00 	lea    rdi,[rip+0xcd7e]        # 0x411170
  4043f2:	e8 02 47 00 00       	call   0x408af9
  4043f7:	48 8b 15 82 cd 00 00 	mov    rdx,QWORD PTR [rip+0xcd82]        # 0x411180
  4043fe:	8b 0d 70 cd 00 00    	mov    ecx,DWORD PTR [rip+0xcd70]        # 0x411174
  404404:	8d 41 ff             	lea    eax,[rcx-0x1]
  404407:	89 05 67 cd 00 00    	mov    DWORD PTR [rip+0xcd67],eax        # 0x411174
  40440d:	85 c9                	test   ecx,ecx
  40440f:	7f ba                	jg     0x4043cb
  404411:	c7 05 59 cd 00 00 20 	mov    DWORD PTR [rip+0xcd59],0x20        # 0x411174
  404418:	00 00 00 
  40441b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40441e:	48 89 15 5b cd 00 00 	mov    QWORD PTR [rip+0xcd5b],rdx        # 0x411180
  404425:	48 85 d2             	test   rdx,rdx
  404428:	75 d4                	jne    0x4043fe
  40442a:	c7 05 44 cd 00 00 01 	mov    DWORD PTR [rip+0xcd44],0x1        # 0x411178
  404431:	00 00 00 
  404434:	48 83 c4 08          	add    rsp,0x8
  404438:	48 8d 3d 31 cd 00 00 	lea    rdi,[rip+0xcd31]        # 0x411170
  40443f:	5b                   	pop    rbx
  404440:	5d                   	pop    rbp
  404441:	e9 64 47 00 00       	jmp    0x408baa
  404446:	c3                   	ret
  404447:	41 54                	push   r12
  404449:	55                   	push   rbp
  40444a:	48 89 fd             	mov    rbp,rdi
  40444d:	48 8d 3d 1c cd 00 00 	lea    rdi,[rip+0xcd1c]        # 0x411170
  404454:	53                   	push   rbx
  404455:	48 89 f3             	mov    rbx,rsi
  404458:	e8 9c 46 00 00       	call   0x408af9
  40445d:	44 8b 25 14 cd 00 00 	mov    r12d,DWORD PTR [rip+0xcd14]        # 0x411178
  404464:	45 85 e4             	test   r12d,r12d
  404467:	75 47                	jne    0x4044b0
  404469:	48 83 3d 0f cd 00 00 	cmp    QWORD PTR [rip+0xcd0f],0x0        # 0x411180
  404470:	00 
  404471:	74 51                	je     0x4044c4
  404473:	48 63 15 fa cc 00 00 	movsxd rdx,DWORD PTR [rip+0xccfa]        # 0x411174
  40447a:	83 fa 20             	cmp    edx,0x20
  40447d:	74 55                	je     0x4044d4
  40447f:	48 8b 05 fa cc 00 00 	mov    rax,QWORD PTR [rip+0xccfa]        # 0x411180
  404486:	8d 4a 01             	lea    ecx,[rdx+0x1]
  404489:	48 89 6c d0 08       	mov    QWORD PTR [rax+rdx*8+0x8],rbp
  40448e:	48 8d 3d db cc 00 00 	lea    rdi,[rip+0xccdb]        # 0x411170
  404495:	48 89 9c d0 08 01 00 	mov    QWORD PTR [rax+rdx*8+0x108],rbx
  40449c:	00 
  40449d:	89 0d d1 cc 00 00    	mov    DWORD PTR [rip+0xccd1],ecx        # 0x411174
  4044a3:	e8 02 47 00 00       	call   0x408baa
  4044a8:	44 89 e0             	mov    eax,r12d
  4044ab:	5b                   	pop    rbx
  4044ac:	5d                   	pop    rbp
  4044ad:	41 5c                	pop    r12
  4044af:	c3                   	ret
  4044b0:	48 8d 3d b9 cc 00 00 	lea    rdi,[rip+0xccb9]        # 0x411170
  4044b7:	41 bc ff ff ff ff    	mov    r12d,0xffffffff
  4044bd:	e8 e8 46 00 00       	call   0x408baa
  4044c2:	eb e4                	jmp    0x4044a8
  4044c4:	48 8d 05 d5 cc 00 00 	lea    rax,[rip+0xccd5]        # 0x4111a0
  4044cb:	48 89 05 ae cc 00 00 	mov    QWORD PTR [rip+0xccae],rax        # 0x411180
  4044d2:	eb 9f                	jmp    0x404473
  4044d4:	be 01 00 00 00       	mov    esi,0x1
  4044d9:	bf 08 02 00 00       	mov    edi,0x208
  4044de:	e8 9d 00 00 00       	call   0x404580
  4044e3:	48 85 c0             	test   rax,rax
  4044e6:	74 c8                	je     0x4044b0
  4044e8:	48 8b 15 91 cc 00 00 	mov    rdx,QWORD PTR [rip+0xcc91]        # 0x411180
  4044ef:	b9 01 00 00 00       	mov    ecx,0x1
  4044f4:	48 89 05 85 cc 00 00 	mov    QWORD PTR [rip+0xcc85],rax        # 0x411180
  4044fb:	48 89 10             	mov    QWORD PTR [rax],rdx
  4044fe:	31 d2                	xor    edx,edx
  404500:	eb 87                	jmp    0x404489
  404502:	48 89 fe             	mov    rsi,rdi
  404505:	31 d2                	xor    edx,edx
  404507:	48 8d 3d a0 fe ff ff 	lea    rdi,[rip+0xfffffffffffffea0]        # 0x4043ae
  40450e:	e9 34 ff ff ff       	jmp    0x404447
  404513:	c3                   	ret
  404514:	55                   	push   rbp
  404515:	53                   	push   rbx
  404516:	48 83 ec 08          	sub    rsp,0x8
  40451a:	48 c7 c3 e0 fe 40 00 	mov    rbx,0x40fee0
  404521:	48 c7 c5 d8 fe 40 00 	mov    rbp,0x40fed8
  404528:	eb 08                	jmp    0x404532
  40452a:	48 83 eb 08          	sub    rbx,0x8
  40452e:	31 c0                	xor    eax,eax
  404530:	ff 13                	call   QWORD PTR [rbx]
  404532:	48 39 dd             	cmp    rbp,rbx
  404535:	72 f3                	jb     0x40452a
  404537:	48 83 c4 08          	add    rsp,0x8
  40453b:	31 c0                	xor    eax,eax
  40453d:	5b                   	pop    rbx
  40453e:	5d                   	pop    rbp
  40453f:	e9 50 5e 00 00       	jmp    0x40a394
  404544:	31 c0                	xor    eax,eax
  404546:	c3                   	ret
  404547:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40454e:	00 00 00 
  404551:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  404558:	00 00 00 
  40455b:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  404562:	00 00 00 
  404565:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40456c:	00 00 00 
  40456f:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  404576:	00 00 00 
  404579:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404580:	41 54                	push   r12
  404582:	49 89 f4             	mov    r12,rsi
  404585:	55                   	push   rbp
  404586:	53                   	push   rbx
  404587:	48 85 f6             	test   rsi,rsi
  40458a:	74 08                	je     0x404594
  40458c:	48 89 f0             	mov    rax,rsi
  40458f:	48 f7 e7             	mul    rdi
  404592:	70 3f                	jo     0x4045d3
  404594:	4c 0f af e7          	imul   r12,rdi
  404598:	4c 89 e7             	mov    rdi,r12
  40459b:	e8 6c 03 00 00       	call   0x40490c
  4045a0:	48 89 c3             	mov    rbx,rax
  4045a3:	48 85 c0             	test   rax,rax
  4045a6:	74 36                	je     0x4045de
  4045a8:	8b 05 c2 ce 00 00    	mov    eax,DWORD PTR [rip+0xcec2]        # 0x411470
  4045ae:	85 c0                	test   eax,eax
  4045b0:	74 36                	je     0x4045e8
  4045b2:	49 81 fc ff 0f 00 00 	cmp    r12,0xfff
  4045b9:	0f 86 9a 00 00 00    	jbe    0x404659
  4045bf:	4a 8d 3c 23          	lea    rdi,[rbx+r12*1]
  4045c3:	bd 00 10 00 00       	mov    ebp,0x1000
  4045c8:	48 89 fa             	mov    rdx,rdi
  4045cb:	81 e2 ff 0f 00 00    	and    edx,0xfff
  4045d1:	eb 5e                	jmp    0x404631
  4045d3:	e8 2c 4a 00 00       	call   0x409004
  4045d8:	c7 00 0c 00 00 00    	mov    DWORD PTR [rax],0xc
  4045de:	31 db                	xor    ebx,ebx
  4045e0:	48 89 d8             	mov    rax,rbx
  4045e3:	5b                   	pop    rbx
  4045e4:	5d                   	pop    rbp
  4045e5:	41 5c                	pop    r12
  4045e7:	c3                   	ret
  4045e8:	48 89 df             	mov    rdi,rbx
  4045eb:	e8 54 ff ff ff       	call   0x404544
  4045f0:	85 c0                	test   eax,eax
  4045f2:	74 be                	je     0x4045b2
  4045f4:	eb ea                	jmp    0x4045e0
  4045f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4045fd:	00 00 00 
  404600:	48 83 ea 10          	sub    rdx,0x10
  404604:	48 39 d7             	cmp    rdi,rdx
  404607:	74 1f                	je     0x404628
  404609:	f3 0f 6f 42 f0       	movdqu xmm0,XMMWORD PTR [rdx-0x10]
  40460e:	66 0f 6f c8          	movdqa xmm1,xmm0
  404612:	66 0f 73 d9 08       	psrldq xmm1,0x8
  404617:	66 0f eb c1          	por    xmm0,xmm1
  40461b:	66 48 0f 7e c0       	movq   rax,xmm0
  404620:	48 85 c0             	test   rax,rax
  404623:	74 db                	je     0x404600
  404625:	48 89 d7             	mov    rdi,rdx
  404628:	48 89 e8             	mov    rax,rbp
  40462b:	48 29 c8             	sub    rax,rcx
  40462e:	48 01 c2             	add    rdx,rax
  404631:	48 29 d7             	sub    rdi,rdx
  404634:	31 f6                	xor    esi,esi
  404636:	e8 fa 43 00 00       	call   0x408a35
  40463b:	49 89 c4             	mov    r12,rax
  40463e:	48 89 c1             	mov    rcx,rax
  404641:	49 29 dc             	sub    r12,rbx
  404644:	49 81 fc ff 0f 00 00 	cmp    r12,0xfff
  40464b:	76 0c                	jbe    0x404659
  40464d:	48 8d b8 00 f0 ff ff 	lea    rdi,[rax-0x1000]
  404654:	48 89 c2             	mov    rdx,rax
  404657:	eb ab                	jmp    0x404604
  404659:	4c 89 e2             	mov    rdx,r12
  40465c:	48 89 df             	mov    rdi,rbx
  40465f:	31 f6                	xor    esi,esi
  404661:	5b                   	pop    rbx
  404662:	5d                   	pop    rbp
  404663:	41 5c                	pop    r12
  404665:	e9 cb 43 00 00       	jmp    0x408a35
  40466a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  404670:	55                   	push   rbp
  404671:	bd 01 00 00 00       	mov    ebp,0x1
  404676:	53                   	push   rbx
  404677:	bb 01 00 00 00       	mov    ebx,0x1
  40467c:	48 83 ec 28          	sub    rsp,0x28
  404680:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404687:	00 00 
  404689:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40468e:	31 c0                	xor    eax,eax
  404690:	48 85 ff             	test   rdi,rdi
  404693:	48 0f 45 ef          	cmovne rbp,rdi
  404697:	79 1a                	jns    0x4046b3
  404699:	e8 66 49 00 00       	call   0x409004
  40469e:	c7 00 0c 00 00 00    	mov    DWORD PTR [rax],0xc
  4046a4:	31 db                	xor    ebx,ebx
  4046a6:	e9 f2 01 00 00       	jmp    0x40489d
  4046ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4046b0:	48 01 db             	add    rbx,rbx
  4046b3:	48 39 eb             	cmp    rbx,rbp
  4046b6:	73 06                	jae    0x4046be
  4046b8:	48 83 fb 0f          	cmp    rbx,0xf
  4046bc:	76 f2                	jbe    0x4046b0
  4046be:	48 8d 3d a3 cd 00 00 	lea    rdi,[rip+0xcda3]        # 0x411468
  4046c5:	48 83 eb 01          	sub    rbx,0x1
  4046c9:	e8 2b 44 00 00       	call   0x408af9
  4046ce:	48 8b 05 8b cd 00 00 	mov    rax,QWORD PTR [rip+0xcd8b]        # 0x411460
  4046d5:	48 8b 15 7c cd 00 00 	mov    rdx,QWORD PTR [rip+0xcd7c]        # 0x411458
  4046dc:	48 89 c7             	mov    rdi,rax
  4046df:	48 f7 df             	neg    rdi
  4046e2:	48 21 df             	and    rdi,rbx
  4046e5:	48 01 c7             	add    rdi,rax
  4046e8:	48 89 d0             	mov    rax,rdx
  4046eb:	48 29 f8             	sub    rax,rdi
  4046ee:	48 89 3d 6b cd 00 00 	mov    QWORD PTR [rip+0xcd6b],rdi        # 0x411460
  4046f5:	48 39 e8             	cmp    rax,rbp
  4046f8:	0f 83 d6 00 00 00    	jae    0x4047d4
  4046fe:	48 85 ff             	test   rdi,rdi
  404701:	0f 85 d5 00 00 00    	jne    0x4047dc
  404707:	b8 0c 00 00 00       	mov    eax,0xc
  40470c:	0f 05                	syscall
  40470e:	48 89 c1             	mov    rcx,rax
  404711:	48 f7 d9             	neg    rcx
  404714:	81 e1 ff 0f 00 00    	and    ecx,0xfff
  40471a:	48 01 c8             	add    rax,rcx
  40471d:	48 89 05 2c cd 00 00 	mov    QWORD PTR [rip+0xcd2c],rax        # 0x411450
  404724:	48 89 05 2d cd 00 00 	mov    QWORD PTR [rip+0xcd2d],rax        # 0x411458
  40472b:	48 89 05 2e cd 00 00 	mov    QWORD PTR [rip+0xcd2e],rax        # 0x411460
  404732:	48 89 e9             	mov    rcx,rbp
  404735:	48 29 d1             	sub    rcx,rdx
  404738:	48 8d 94 0f ff 0f 00 	lea    rdx,[rdi+rcx*1+0xfff]
  40473f:	00 
  404740:	48 89 c1             	mov    rcx,rax
  404743:	48 81 e2 00 f0 ff ff 	and    rdx,0xfffffffffffff000
  40474a:	48 f7 d1             	not    rcx
  40474d:	48 39 ca             	cmp    rdx,rcx
  404750:	0f 83 96 00 00 00    	jae    0x4047ec
  404756:	48 8b 35 8b cc 00 00 	mov    rsi,QWORD PTR [rip+0xcc8b]        # 0x4113e8
  40475d:	41 b8 00 00 00 00    	mov    r8d,0x0
  404763:	48 8d 3c 02          	lea    rdi,[rdx+rax*1]
  404767:	48 89 f1             	mov    rcx,rsi
  40476a:	48 81 e9 00 00 80 00 	sub    rcx,0x800000
  404771:	49 0f 42 c8          	cmovb  rcx,r8
  404775:	48 39 f9             	cmp    rcx,rdi
  404778:	73 05                	jae    0x40477f
  40477a:	48 39 f0             	cmp    rax,rsi
  40477d:	72 6d                	jb     0x4047ec
  40477f:	48 8d 74 24 10       	lea    rsi,[rsp+0x10]
  404784:	41 b8 00 00 00 00    	mov    r8d,0x0
  40478a:	48 89 f1             	mov    rcx,rsi
  40478d:	48 81 e9 00 00 80 00 	sub    rcx,0x800000
  404794:	49 0f 42 c8          	cmovb  rcx,r8
  404798:	48 39 f9             	cmp    rcx,rdi
  40479b:	73 05                	jae    0x4047a2
  40479d:	48 39 f0             	cmp    rax,rsi
  4047a0:	72 4a                	jb     0x4047ec
  4047a2:	b8 0c 00 00 00       	mov    eax,0xc
  4047a7:	0f 05                	syscall
  4047a9:	48 8b 0d a0 cc 00 00 	mov    rcx,QWORD PTR [rip+0xcca0]        # 0x411450
  4047b0:	48 01 d1             	add    rcx,rdx
  4047b3:	48 39 c1             	cmp    rcx,rax
  4047b6:	75 34                	jne    0x4047ec
  4047b8:	48 03 15 99 cc 00 00 	add    rdx,QWORD PTR [rip+0xcc99]        # 0x411458
  4047bf:	48 8b 3d 9a cc 00 00 	mov    rdi,QWORD PTR [rip+0xcc9a]        # 0x411460
  4047c6:	48 89 15 8b cc 00 00 	mov    QWORD PTR [rip+0xcc8b],rdx        # 0x411458
  4047cd:	48 89 15 7c cc 00 00 	mov    QWORD PTR [rip+0xcc7c],rdx        # 0x411450
  4047d4:	48 89 fb             	mov    rbx,rdi
  4047d7:	e9 ab 00 00 00       	jmp    0x404887
  4047dc:	48 8b 05 6d cc 00 00 	mov    rax,QWORD PTR [rip+0xcc6d]        # 0x411450
  4047e3:	48 39 c2             	cmp    rdx,rax
  4047e6:	0f 84 46 ff ff ff    	je     0x404732
  4047ec:	48 8d b5 ff 0f 00 00 	lea    rsi,[rbp+0xfff]
  4047f3:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
  4047fa:	48 89 f0             	mov    rax,rsi
  4047fd:	48 89 f2             	mov    rdx,rsi
  404800:	48 29 e8             	sub    rax,rbp
  404803:	48 c1 ea 03          	shr    rdx,0x3
  404807:	48 39 c2             	cmp    rdx,rax
  40480a:	0f 83 c3 00 00 00    	jae    0x4048d3
  404810:	8b 3d 32 cc 00 00    	mov    edi,DWORD PTR [rip+0xcc32]        # 0x411448
  404816:	b8 00 10 00 00       	mov    eax,0x1000
  40481b:	48 8b 15 36 cc 00 00 	mov    rdx,QWORD PTR [rip+0xcc36]        # 0x411458
  404822:	48 2b 15 37 cc 00 00 	sub    rdx,QWORD PTR [rip+0xcc37]        # 0x411460
  404829:	89 f9                	mov    ecx,edi
  40482b:	d1 e9                	shr    ecx,1
  40482d:	d3 e0                	shl    eax,cl
  40482f:	48 98                	cdqe
  404831:	48 89 c1             	mov    rcx,rax
  404834:	48 29 e9             	sub    rcx,rbp
  404837:	48 39 ca             	cmp    rdx,rcx
  40483a:	0f 83 93 00 00 00    	jae    0x4048d3
  404840:	48 39 c6             	cmp    rsi,rax
  404843:	73 08                	jae    0x40484d
  404845:	83 ff 0b             	cmp    edi,0xb
  404848:	76 6d                	jbe    0x4048b7
  40484a:	48 89 c6             	mov    rsi,rax
  40484d:	45 31 c9             	xor    r9d,r9d
  404850:	31 ff                	xor    edi,edi
  404852:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  404858:	b9 22 00 00 00       	mov    ecx,0x22
  40485d:	ba 03 00 00 00       	mov    edx,0x3
  404862:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
  404867:	e8 34 01 00 00       	call   0x4049a0
  40486c:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
  404871:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  404875:	48 89 c3             	mov    rbx,rax
  404878:	74 48                	je     0x4048c2
  40487a:	48 01 c6             	add    rsi,rax
  40487d:	48 89 c7             	mov    rdi,rax
  404880:	48 89 35 d1 cb 00 00 	mov    QWORD PTR [rip+0xcbd1],rsi        # 0x411458
  404887:	48 01 fd             	add    rbp,rdi
  40488a:	48 8d 3d d7 cb 00 00 	lea    rdi,[rip+0xcbd7]        # 0x411468
  404891:	48 89 2d c8 cb 00 00 	mov    QWORD PTR [rip+0xcbc8],rbp        # 0x411460
  404898:	e8 0d 43 00 00       	call   0x408baa
  40489d:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  4048a2:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4048a9:	00 00 
  4048ab:	75 5a                	jne    0x404907
  4048ad:	48 83 c4 28          	add    rsp,0x28
  4048b1:	48 89 d8             	mov    rax,rbx
  4048b4:	5b                   	pop    rbx
  4048b5:	5d                   	pop    rbp
  4048b6:	c3                   	ret
  4048b7:	83 c7 01             	add    edi,0x1
  4048ba:	89 3d 88 cb 00 00    	mov    DWORD PTR [rip+0xcb88],edi        # 0x411448
  4048c0:	eb 88                	jmp    0x40484a
  4048c2:	48 8d 3d 9f cb 00 00 	lea    rdi,[rip+0xcb9f]        # 0x411468
  4048c9:	e8 dc 42 00 00       	call   0x408baa
  4048ce:	e9 d1 fd ff ff       	jmp    0x4046a4
  4048d3:	31 ff                	xor    edi,edi
  4048d5:	45 31 c9             	xor    r9d,r9d
  4048d8:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  4048de:	b9 22 00 00 00       	mov    ecx,0x22
  4048e3:	ba 03 00 00 00       	mov    edx,0x3
  4048e8:	e8 b3 00 00 00       	call   0x4049a0
  4048ed:	48 8d 3d 74 cb 00 00 	lea    rdi,[rip+0xcb74]        # 0x411468
  4048f4:	48 89 c3             	mov    rbx,rax
  4048f7:	e8 ae 42 00 00       	call   0x408baa
  4048fc:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
  404900:	75 9b                	jne    0x40489d
  404902:	e9 9d fd ff ff       	jmp    0x4046a4
  404907:	e8 40 fa ff ff       	call   0x40434c
  40490c:	e9 5f fd ff ff       	jmp    0x404670
  404911:	e9 5a fd ff ff       	jmp    0x404670
  404916:	48 83 ec 58          	sub    rsp,0x58
  40491a:	48 89 f8             	mov    rax,rdi
  40491d:	4d 89 c2             	mov    r10,r8
  404920:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  404925:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
  40492a:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40492f:	48 8d 4c 24 60       	lea    rcx,[rsp+0x60]
  404934:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  404939:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
  40493e:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  404943:	4d 89 c8             	mov    r8,r9
  404946:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40494b:	4c 8b 4c 24 60       	mov    r9,QWORD PTR [rsp+0x60]
  404950:	64 48 8b 14 25 28 00 	mov    rdx,QWORD PTR fs:0x28
  404957:	00 00 
  404959:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  40495e:	31 d2                	xor    edx,edx
  404960:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  404965:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
  40496a:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
  40496f:	c7 04 24 08 00 00 00 	mov    DWORD PTR [rsp],0x8
  404976:	48 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],rcx
  40497b:	0f 05                	syscall
  40497d:	48 89 c7             	mov    rdi,rax
  404980:	e8 43 4d 00 00       	call   0x4096c8
  404985:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  40498a:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404991:	00 00 
  404993:	75 05                	jne    0x40499a
  404995:	48 83 c4 58          	add    rsp,0x58
  404999:	c3                   	ret
  40499a:	e8 ad f9 ff ff       	call   0x40434c
  40499f:	c3                   	ret
  4049a0:	53                   	push   rbx
  4049a1:	48 83 ec 20          	sub    rsp,0x20
  4049a5:	41 f7 c1 ff 0f 00 00 	test   r9d,0xfff
  4049ac:	75 4f                	jne    0x4049fd
  4049ae:	48 b8 fe ff ff ff ff 	movabs rax,0x7ffffffffffffffe
  4049b5:	ff ff 7f 
  4049b8:	48 39 f0             	cmp    rax,rsi
  4049bb:	72 58                	jb     0x404a15
  4049bd:	89 cb                	mov    ebx,ecx
  4049bf:	f6 c1 10             	test   cl,0x10
  4049c2:	75 5e                	jne    0x404a22
  4049c4:	48 63 d2             	movsxd rdx,edx
  4049c7:	4c 63 d3             	movsxd r10,ebx
  4049ca:	4d 63 c0             	movsxd r8,r8d
  4049cd:	b8 09 00 00 00       	mov    eax,0x9
  4049d2:	0f 05                	syscall
  4049d4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  4049d8:	75 16                	jne    0x4049f0
  4049da:	48 85 ff             	test   rdi,rdi
  4049dd:	75 11                	jne    0x4049f0
  4049df:	83 e3 30             	and    ebx,0x30
  4049e2:	48 c7 c2 f4 ff ff ff 	mov    rdx,0xfffffffffffffff4
  4049e9:	83 fb 20             	cmp    ebx,0x20
  4049ec:	48 0f 44 c2          	cmove  rax,rdx
  4049f0:	48 83 c4 20          	add    rsp,0x20
  4049f4:	48 89 c7             	mov    rdi,rax
  4049f7:	5b                   	pop    rbx
  4049f8:	e9 cb 4c 00 00       	jmp    0x4096c8
  4049fd:	e8 02 46 00 00       	call   0x409004
  404a02:	c7 00 16 00 00 00    	mov    DWORD PTR [rax],0x16
  404a08:	48 83 c4 20          	add    rsp,0x20
  404a0c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  404a13:	5b                   	pop    rbx
  404a14:	c3                   	ret
  404a15:	e8 ea 45 00 00       	call   0x409004
  404a1a:	c7 00 0c 00 00 00    	mov    DWORD PTR [rax],0xc
  404a20:	eb e6                	jmp    0x404a08
  404a22:	4c 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],r9
  404a27:	44 89 44 24 14       	mov    DWORD PTR [rsp+0x14],r8d
  404a2c:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  404a30:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
  404a35:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  404a39:	e8 61 ff ff ff       	call   0x40499f
  404a3e:	4c 8b 4c 24 18       	mov    r9,QWORD PTR [rsp+0x18]
  404a43:	44 8b 44 24 14       	mov    r8d,DWORD PTR [rsp+0x14]
  404a48:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  404a4c:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
  404a51:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  404a55:	e9 6a ff ff ff       	jmp    0x4049c4
  404a5a:	55                   	push   rbp
  404a5b:	53                   	push   rbx
  404a5c:	48 83 ec 18          	sub    rsp,0x18
  404a60:	48 85 ff             	test   rdi,rdi
  404a63:	74 74                	je     0x404ad9
  404a65:	8b 87 8c 00 00 00    	mov    eax,DWORD PTR [rdi+0x8c]
  404a6b:	48 89 fb             	mov    rbx,rdi
  404a6e:	31 ed                	xor    ebp,ebp
  404a70:	85 c0                	test   eax,eax
  404a72:	0f 89 06 01 00 00    	jns    0x404b7e
  404a78:	48 8b 43 38          	mov    rax,QWORD PTR [rbx+0x38]
  404a7c:	48 39 43 28          	cmp    QWORD PTR [rbx+0x28],rax
  404a80:	74 15                	je     0x404a97
  404a82:	31 d2                	xor    edx,edx
  404a84:	31 f6                	xor    esi,esi
  404a86:	48 89 df             	mov    rdi,rbx
  404a89:	ff 53 48             	call   QWORD PTR [rbx+0x48]
  404a8c:	48 83 7b 28 00       	cmp    QWORD PTR [rbx+0x28],0x0
  404a91:	0f 84 f3 00 00 00    	je     0x404b8a
  404a97:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  404a9b:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
  404a9f:	48 39 c6             	cmp    rsi,rax
  404aa2:	74 0e                	je     0x404ab2
  404aa4:	48 29 c6             	sub    rsi,rax
  404aa7:	ba 01 00 00 00       	mov    edx,0x1
  404aac:	48 89 df             	mov    rdi,rbx
  404aaf:	ff 53 50             	call   QWORD PTR [rbx+0x50]
  404ab2:	66 0f ef c0          	pxor   xmm0,xmm0
  404ab6:	48 c7 43 38 00 00 00 	mov    QWORD PTR [rbx+0x38],0x0
  404abd:	00 
  404abe:	0f 11 43 20          	movups XMMWORD PTR [rbx+0x20],xmm0
  404ac2:	0f 11 43 08          	movups XMMWORD PTR [rbx+0x8],xmm0
  404ac6:	85 ed                	test   ebp,ebp
  404ac8:	0f 85 d4 00 00 00    	jne    0x404ba2
  404ace:	31 ed                	xor    ebp,ebp
  404ad0:	48 83 c4 18          	add    rsp,0x18
  404ad4:	89 e8                	mov    eax,ebp
  404ad6:	5b                   	pop    rbx
  404ad7:	5d                   	pop    rbp
  404ad8:	c3                   	ret
  404ad9:	48 8b 05 28 b7 00 00 	mov    rax,QWORD PTR [rip+0xb728]        # 0x410208
  404ae0:	31 ed                	xor    ebp,ebp
  404ae2:	48 85 c0             	test   rax,rax
  404ae5:	74 0e                	je     0x404af5
  404ae7:	48 8b 3d 1a b7 00 00 	mov    rdi,QWORD PTR [rip+0xb71a]        # 0x410208
  404aee:	e8 67 ff ff ff       	call   0x404a5a
  404af3:	89 c5                	mov    ebp,eax
  404af5:	48 8b 05 14 b5 00 00 	mov    rax,QWORD PTR [rip+0xb514]        # 0x410010
  404afc:	48 85 c0             	test   rax,rax
  404aff:	74 0e                	je     0x404b0f
  404b01:	48 8b 3d 08 b5 00 00 	mov    rdi,QWORD PTR [rip+0xb508]        # 0x410010
  404b08:	e8 4d ff ff ff       	call   0x404a5a
  404b0d:	09 c5                	or     ebp,eax
  404b0f:	e8 85 05 00 00       	call   0x405099
  404b14:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  404b17:	eb 36                	jmp    0x404b4f
  404b19:	48 89 df             	mov    rdi,rbx
  404b1c:	e8 67 50 00 00       	call   0x409b88
  404b21:	89 c2                	mov    edx,eax
  404b23:	48 8b 43 38          	mov    rax,QWORD PTR [rbx+0x38]
  404b27:	48 39 43 28          	cmp    QWORD PTR [rbx+0x28],rax
  404b2b:	74 12                	je     0x404b3f
  404b2d:	48 89 df             	mov    rdi,rbx
  404b30:	89 54 24 0c          	mov    DWORD PTR [rsp+0xc],edx
  404b34:	e8 21 ff ff ff       	call   0x404a5a
  404b39:	8b 54 24 0c          	mov    edx,DWORD PTR [rsp+0xc]
  404b3d:	09 c5                	or     ebp,eax
  404b3f:	85 d2                	test   edx,edx
  404b41:	74 08                	je     0x404b4b
  404b43:	48 89 df             	mov    rdi,rbx
  404b46:	e8 d0 50 00 00       	call   0x409c1b
  404b4b:	48 8b 5b 70          	mov    rbx,QWORD PTR [rbx+0x70]
  404b4f:	48 85 db             	test   rbx,rbx
  404b52:	74 20                	je     0x404b74
  404b54:	8b 83 8c 00 00 00    	mov    eax,DWORD PTR [rbx+0x8c]
  404b5a:	85 c0                	test   eax,eax
  404b5c:	79 bb                	jns    0x404b19
  404b5e:	48 8b 43 38          	mov    rax,QWORD PTR [rbx+0x38]
  404b62:	48 39 43 28          	cmp    QWORD PTR [rbx+0x28],rax
  404b66:	74 e3                	je     0x404b4b
  404b68:	48 89 df             	mov    rdi,rbx
  404b6b:	e8 ea fe ff ff       	call   0x404a5a
  404b70:	09 c5                	or     ebp,eax
  404b72:	eb d7                	jmp    0x404b4b
  404b74:	e8 3c 05 00 00       	call   0x4050b5
  404b79:	e9 52 ff ff ff       	jmp    0x404ad0
  404b7e:	e8 05 50 00 00       	call   0x409b88
  404b83:	89 c5                	mov    ebp,eax
  404b85:	e9 ee fe ff ff       	jmp    0x404a78
  404b8a:	85 ed                	test   ebp,ebp
  404b8c:	75 0a                	jne    0x404b98
  404b8e:	bd ff ff ff ff       	mov    ebp,0xffffffff
  404b93:	e9 38 ff ff ff       	jmp    0x404ad0
  404b98:	48 89 df             	mov    rdi,rbx
  404b9b:	e8 7b 50 00 00       	call   0x409c1b
  404ba0:	eb ec                	jmp    0x404b8e
  404ba2:	48 89 df             	mov    rdi,rbx
  404ba5:	e8 71 50 00 00       	call   0x409c1b
  404baa:	e9 1f ff ff ff       	jmp    0x404ace
  404baf:	41 57                	push   r15
  404bb1:	41 89 f7             	mov    r15d,esi
  404bb4:	41 56                	push   r14
  404bb6:	41 55                	push   r13
  404bb8:	49 89 fd             	mov    r13,rdi
  404bbb:	41 54                	push   r12
  404bbd:	55                   	push   rbp
  404bbe:	53                   	push   rbx
  404bbf:	48 89 d3             	mov    rbx,rdx
  404bc2:	48 83 ec 18          	sub    rsp,0x18
  404bc6:	8b 82 8c 00 00 00    	mov    eax,DWORD PTR [rdx+0x8c]
  404bcc:	85 c0                	test   eax,eax
  404bce:	79 3e                	jns    0x404c0e
  404bd0:	45 31 f6             	xor    r14d,r14d
  404bd3:	83 fe 01             	cmp    esi,0x1
  404bd6:	7e 0c                	jle    0x404be4
  404bd8:	41 83 ef 01          	sub    r15d,0x1
  404bdc:	4d 89 ec             	mov    r12,r13
  404bdf:	e9 b1 00 00 00       	jmp    0x404c95
  404be4:	8b 92 88 00 00 00    	mov    edx,DWORD PTR [rdx+0x88]
  404bea:	8d 42 ff             	lea    eax,[rdx-0x1]
  404bed:	09 d0                	or     eax,edx
  404bef:	89 83 88 00 00 00    	mov    DWORD PTR [rbx+0x88],eax
  404bf5:	31 c0                	xor    eax,eax
  404bf7:	41 83 ff 01          	cmp    r15d,0x1
  404bfb:	0f 85 ef 00 00 00    	jne    0x404cf0
  404c01:	41 c6 45 00 00       	mov    BYTE PTR [r13+0x0],0x0
  404c06:	4c 89 e8             	mov    rax,r13
  404c09:	e9 e2 00 00 00       	jmp    0x404cf0
  404c0e:	48 89 d7             	mov    rdi,rdx
  404c11:	e8 72 4f 00 00       	call   0x409b88
  404c16:	41 89 c6             	mov    r14d,eax
  404c19:	41 83 ff 01          	cmp    r15d,0x1
  404c1d:	7f b9                	jg     0x404bd8
  404c1f:	8b 93 88 00 00 00    	mov    edx,DWORD PTR [rbx+0x88]
  404c25:	8d 42 ff             	lea    eax,[rdx-0x1]
  404c28:	09 d0                	or     eax,edx
  404c2a:	89 83 88 00 00 00    	mov    DWORD PTR [rbx+0x88],eax
  404c30:	45 85 f6             	test   r14d,r14d
  404c33:	74 c0                	je     0x404bf5
  404c35:	48 89 df             	mov    rdi,rbx
  404c38:	e8 de 4f 00 00       	call   0x409c1b
  404c3d:	eb b6                	jmp    0x404bf5
  404c3f:	48 8b 6b 10          	mov    rbp,QWORD PTR [rbx+0x10]
  404c43:	4c 89 e7             	mov    rdi,r12
  404c46:	48 29 f5             	sub    rbp,rsi
  404c49:	48 39 d5             	cmp    rbp,rdx
  404c4c:	48 0f 47 ea          	cmova  rbp,rdx
  404c50:	48 89 ea             	mov    rdx,rbp
  404c53:	e8 ab 3d 00 00       	call   0x408a03
  404c58:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  404c5c:	49 8d 14 2c          	lea    rdx,[r12+rbp*1]
  404c60:	48 01 e8             	add    rax,rbp
  404c63:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  404c67:	41 29 ef             	sub    r15d,ebp
  404c6a:	0f 84 b4 00 00 00    	je     0x404d24
  404c70:	48 3b 43 10          	cmp    rax,QWORD PTR [rbx+0x10]
  404c74:	0f 84 85 00 00 00    	je     0x404cff
  404c7a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  404c7e:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
  404c82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  404c85:	88 02                	mov    BYTE PTR [rdx],al
  404c87:	4c 8d 62 01          	lea    r12,[rdx+0x1]
  404c8b:	3c 0a                	cmp    al,0xa
  404c8d:	74 4f                	je     0x404cde
  404c8f:	41 83 ef 01          	sub    r15d,0x1
  404c93:	74 49                	je     0x404cde
  404c95:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  404c99:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  404c9d:	48 39 d7             	cmp    rdi,rdx
  404ca0:	74 60                	je     0x404d02
  404ca2:	48 29 fa             	sub    rdx,rdi
  404ca5:	be 0a 00 00 00       	mov    esi,0xa
  404caa:	e8 51 35 00 00       	call   0x408200
  404caf:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  404cb3:	49 63 d7             	movsxd rdx,r15d
  404cb6:	48 85 c0             	test   rax,rax
  404cb9:	74 84                	je     0x404c3f
  404cbb:	48 29 f0             	sub    rax,rsi
  404cbe:	4c 89 e7             	mov    rdi,r12
  404cc1:	48 83 c0 01          	add    rax,0x1
  404cc5:	48 39 c2             	cmp    rdx,rax
  404cc8:	48 0f 46 c2          	cmovbe rax,rdx
  404ccc:	48 89 c2             	mov    rdx,rax
  404ccf:	48 89 c5             	mov    rbp,rax
  404cd2:	e8 2c 3d 00 00       	call   0x408a03
  404cd7:	48 01 6b 08          	add    QWORD PTR [rbx+0x8],rbp
  404cdb:	49 01 ec             	add    r12,rbp
  404cde:	4d 85 ed             	test   r13,r13
  404ce1:	74 05                	je     0x404ce8
  404ce3:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  404ce8:	4c 89 e8             	mov    rax,r13
  404ceb:	45 85 f6             	test   r14d,r14d
  404cee:	75 39                	jne    0x404d29
  404cf0:	48 83 c4 18          	add    rsp,0x18
  404cf4:	5b                   	pop    rbx
  404cf5:	5d                   	pop    rbp
  404cf6:	41 5c                	pop    r12
  404cf8:	41 5d                	pop    r13
  404cfa:	41 5e                	pop    r14
  404cfc:	41 5f                	pop    r15
  404cfe:	c3                   	ret
  404cff:	49 89 d4             	mov    r12,rdx
  404d02:	48 89 df             	mov    rdi,rbx
  404d05:	e8 fd 52 00 00       	call   0x40a007
  404d0a:	85 c0                	test   eax,eax
  404d0c:	78 08                	js     0x404d16
  404d0e:	4c 89 e2             	mov    rdx,r12
  404d11:	e9 6f ff ff ff       	jmp    0x404c85
  404d16:	31 c0                	xor    eax,eax
  404d18:	4d 39 e5             	cmp    r13,r12
  404d1b:	74 ce                	je     0x404ceb
  404d1d:	f6 03 10             	test   BYTE PTR [rbx],0x10
  404d20:	74 c9                	je     0x404ceb
  404d22:	eb ba                	jmp    0x404cde
  404d24:	49 89 d4             	mov    r12,rdx
  404d27:	eb b5                	jmp    0x404cde
  404d29:	48 89 df             	mov    rdi,rbx
  404d2c:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  404d31:	e8 e5 4e 00 00       	call   0x409c1b
  404d36:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  404d3b:	eb b3                	jmp    0x404cf0
  404d3d:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  404d44:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  404d49:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  404d4e:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  404d53:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  404d58:	84 c0                	test   al,al
  404d5a:	74 37                	je     0x404d93
  404d5c:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  404d61:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  404d66:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  404d6b:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  404d72:	00 
  404d73:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  404d7a:	00 
  404d7b:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  404d82:	00 
  404d83:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  404d8a:	00 
  404d8b:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  404d92:	00 
  404d93:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404d9a:	00 00 
  404d9c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  404da1:	31 c0                	xor    eax,eax
  404da3:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  404daa:	00 
  404dab:	48 89 e2             	mov    rdx,rsp
  404dae:	c7 04 24 10 00 00 00 	mov    DWORD PTR [rsp],0x10
  404db5:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  404dba:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  404dbf:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  404dc6:	00 
  404dc7:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  404dcc:	e8 7e 2f 00 00       	call   0x407d4f
  404dd1:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  404dd6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404ddd:	00 00 
  404ddf:	75 08                	jne    0x404de9
  404de1:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  404de8:	c3                   	ret
  404de9:	e8 5e f5 ff ff       	call   0x40434c
  404dee:	55                   	push   rbp
  404def:	89 f9                	mov    ecx,edi
  404df1:	48 8d ae 8c 00 00 00 	lea    rbp,[rsi+0x8c]
  404df8:	31 c0                	xor    eax,eax
  404dfa:	53                   	push   rbx
  404dfb:	ba ff ff ff 3f       	mov    edx,0x3fffffff
  404e00:	48 89 f3             	mov    rbx,rsi
  404e03:	48 83 ec 18          	sub    rsp,0x18
  404e07:	f0 0f b1 96 8c 00 00 	lock cmpxchg DWORD PTR [rsi+0x8c],edx
  404e0e:	00 
  404e0f:	85 c0                	test   eax,eax
  404e11:	75 54                	jne    0x404e67
  404e13:	44 0f b6 c1          	movzx  r8d,cl
  404e17:	44 39 83 90 00 00 00 	cmp    DWORD PTR [rbx+0x90],r8d
  404e1e:	74 59                	je     0x404e79
  404e20:	48 8b 43 28          	mov    rax,QWORD PTR [rbx+0x28]
  404e24:	48 3b 43 20          	cmp    rax,QWORD PTR [rbx+0x20]
  404e28:	74 4f                	je     0x404e79
  404e2a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  404e2e:	48 89 53 28          	mov    QWORD PTR [rbx+0x28],rdx
  404e32:	88 08                	mov    BYTE PTR [rax],cl
  404e34:	31 c0                	xor    eax,eax
  404e36:	87 83 8c 00 00 00    	xchg   DWORD PTR [rbx+0x8c],eax
  404e3c:	a9 00 00 00 40       	test   eax,0x40000000
  404e41:	74 1a                	je     0x404e5d
  404e43:	be 81 00 00 00       	mov    esi,0x81
  404e48:	b8 ca 00 00 00       	mov    eax,0xca
  404e4d:	48 89 ef             	mov    rdi,rbp
  404e50:	ba 01 00 00 00       	mov    edx,0x1
  404e55:	0f 05                	syscall
  404e57:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  404e5b:	74 2c                	je     0x404e89
  404e5d:	48 83 c4 18          	add    rsp,0x18
  404e61:	44 89 c0             	mov    eax,r8d
  404e64:	5b                   	pop    rbx
  404e65:	5d                   	pop    rbp
  404e66:	c3                   	ret
  404e67:	89 7c 24 0c          	mov    DWORD PTR [rsp+0xc],edi
  404e6b:	48 89 f7             	mov    rdi,rsi
  404e6e:	e8 15 4d 00 00       	call   0x409b88
  404e73:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  404e77:	eb 9a                	jmp    0x404e13
  404e79:	44 89 c6             	mov    esi,r8d
  404e7c:	48 89 df             	mov    rdi,rbx
  404e7f:	e8 d5 4d 00 00       	call   0x409c59
  404e84:	41 89 c0             	mov    r8d,eax
  404e87:	eb ab                	jmp    0x404e34
  404e89:	b8 ca 00 00 00       	mov    eax,0xca
  404e8e:	be 01 00 00 00       	mov    esi,0x1
  404e93:	0f 05                	syscall
  404e95:	eb c6                	jmp    0x404e5d
  404e97:	8b 86 8c 00 00 00    	mov    eax,DWORD PTR [rsi+0x8c]
  404e9d:	89 fa                	mov    edx,edi
  404e9f:	48 89 f7             	mov    rdi,rsi
  404ea2:	85 c0                	test   eax,eax
  404ea4:	78 1f                	js     0x404ec5
  404ea6:	74 13                	je     0x404ebb
  404ea8:	25 ff ff ff bf       	and    eax,0xbfffffff
  404ead:	64 48 8b 0c 25 00 00 	mov    rcx,QWORD PTR fs:0x0
  404eb4:	00 00 
  404eb6:	3b 41 30             	cmp    eax,DWORD PTR [rcx+0x30]
  404eb9:	74 0a                	je     0x404ec5
  404ebb:	48 89 fe             	mov    rsi,rdi
  404ebe:	89 d7                	mov    edi,edx
  404ec0:	e9 29 ff ff ff       	jmp    0x404dee
  404ec5:	0f b6 c2             	movzx  eax,dl
  404ec8:	3b 87 90 00 00 00    	cmp    eax,DWORD PTR [rdi+0x90]
  404ece:	74 15                	je     0x404ee5
  404ed0:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
  404ed4:	48 3b 4f 20          	cmp    rcx,QWORD PTR [rdi+0x20]
  404ed8:	74 0b                	je     0x404ee5
  404eda:	48 8d 71 01          	lea    rsi,[rcx+0x1]
  404ede:	48 89 77 28          	mov    QWORD PTR [rdi+0x28],rsi
  404ee2:	88 11                	mov    BYTE PTR [rcx],dl
  404ee4:	c3                   	ret
  404ee5:	89 c6                	mov    esi,eax
  404ee7:	e9 6d 4d 00 00       	jmp    0x409c59
  404eec:	55                   	push   rbp
  404eed:	48 89 f5             	mov    rbp,rsi
  404ef0:	53                   	push   rbx
  404ef1:	48 83 ec 18          	sub    rsp,0x18
  404ef5:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  404efa:	e8 21 35 00 00       	call   0x408420
  404eff:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  404f04:	48 89 e9             	mov    rcx,rbp
  404f07:	be 01 00 00 00       	mov    esi,0x1
  404f0c:	48 89 c2             	mov    rdx,rax
  404f0f:	48 89 c3             	mov    rbx,rax
  404f12:	e8 f2 00 00 00       	call   0x405009
  404f17:	48 39 d8             	cmp    rax,rbx
  404f1a:	0f 95 c0             	setne  al
  404f1d:	48 83 c4 18          	add    rsp,0x18
  404f21:	0f b6 c0             	movzx  eax,al
  404f24:	5b                   	pop    rbx
  404f25:	5d                   	pop    rbp
  404f26:	f7 d8                	neg    eax
  404f28:	c3                   	ret
  404f29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404f30:	55                   	push   rbp
  404f31:	48 89 f9             	mov    rcx,rdi
  404f34:	48 89 f5             	mov    rbp,rsi
  404f37:	53                   	push   rbx
  404f38:	48 89 d3             	mov    rbx,rdx
  404f3b:	48 83 ec 18          	sub    rsp,0x18
  404f3f:	48 8b 42 20          	mov    rax,QWORD PTR [rdx+0x20]
  404f43:	48 85 c0             	test   rax,rax
  404f46:	74 3d                	je     0x404f85
  404f48:	48 8b 7b 28          	mov    rdi,QWORD PTR [rbx+0x28]
  404f4c:	48 29 f8             	sub    rax,rdi
  404f4f:	48 39 e8             	cmp    rax,rbp
  404f52:	72 4b                	jb     0x404f9f
  404f54:	8b 83 90 00 00 00    	mov    eax,DWORD PTR [rbx+0x90]
  404f5a:	48 89 ea             	mov    rdx,rbp
  404f5d:	85 c0                	test   eax,eax
  404f5f:	79 63                	jns    0x404fc4
  404f61:	49 89 e8             	mov    r8,rbp
  404f64:	4c 89 c2             	mov    rdx,r8
  404f67:	48 89 ce             	mov    rsi,rcx
  404f6a:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  404f6e:	e8 90 3a 00 00       	call   0x408a03
  404f73:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  404f77:	4c 01 43 28          	add    QWORD PTR [rbx+0x28],r8
  404f7b:	48 89 e8             	mov    rax,rbp
  404f7e:	48 83 c4 18          	add    rsp,0x18
  404f82:	5b                   	pop    rbx
  404f83:	5d                   	pop    rbp
  404f84:	c3                   	ret
  404f85:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  404f89:	48 89 d7             	mov    rdi,rdx
  404f8c:	e8 23 50 00 00       	call   0x409fb4
  404f91:	85 c0                	test   eax,eax
  404f93:	75 6d                	jne    0x405002
  404f95:	48 8b 43 20          	mov    rax,QWORD PTR [rbx+0x20]
  404f99:	48 8b 0c 24          	mov    rcx,QWORD PTR [rsp]
  404f9d:	eb a9                	jmp    0x404f48
  404f9f:	48 8b 43 48          	mov    rax,QWORD PTR [rbx+0x48]
  404fa3:	48 83 c4 18          	add    rsp,0x18
  404fa7:	48 89 ea             	mov    rdx,rbp
  404faa:	48 89 df             	mov    rdi,rbx
  404fad:	48 89 ce             	mov    rsi,rcx
  404fb0:	5b                   	pop    rbx
  404fb1:	5d                   	pop    rbp
  404fb2:	ff e0                	jmp    rax
  404fb4:	90                   	nop
  404fb5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  404fbc:	00 00 00 00 
  404fc0:	48 83 ea 01          	sub    rdx,0x1
  404fc4:	48 85 d2             	test   rdx,rdx
  404fc7:	74 98                	je     0x404f61
  404fc9:	80 7c 11 ff 0a       	cmp    BYTE PTR [rcx+rdx*1-0x1],0xa
  404fce:	75 f0                	jne    0x404fc0
  404fd0:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
  404fd4:	48 89 ce             	mov    rsi,rcx
  404fd7:	48 89 df             	mov    rdi,rbx
  404fda:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  404fdf:	ff 53 48             	call   QWORD PTR [rbx+0x48]
  404fe2:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
  404fe6:	48 39 d0             	cmp    rax,rdx
  404fe9:	72 93                	jb     0x404f7e
  404feb:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  404ff0:	49 89 e8             	mov    r8,rbp
  404ff3:	48 8b 7b 28          	mov    rdi,QWORD PTR [rbx+0x28]
  404ff7:	49 29 d0             	sub    r8,rdx
  404ffa:	48 01 d1             	add    rcx,rdx
  404ffd:	e9 62 ff ff ff       	jmp    0x404f64
  405002:	31 c0                	xor    eax,eax
  405004:	e9 75 ff ff ff       	jmp    0x404f7e
  405009:	41 56                	push   r14
  40500b:	31 c0                	xor    eax,eax
  40500d:	41 55                	push   r13
  40500f:	49 89 f5             	mov    r13,rsi
  405012:	41 54                	push   r12
  405014:	4c 0f af ea          	imul   r13,rdx
  405018:	55                   	push   rbp
  405019:	48 89 cd             	mov    rbp,rcx
  40501c:	53                   	push   rbx
  40501d:	48 89 f3             	mov    rbx,rsi
  405020:	48 83 ec 10          	sub    rsp,0x10
  405024:	48 85 f6             	test   rsi,rsi
  405027:	48 0f 45 c2          	cmovne rax,rdx
  40502b:	49 89 c4             	mov    r12,rax
  40502e:	8b 81 8c 00 00 00    	mov    eax,DWORD PTR [rcx+0x8c]
  405034:	85 c0                	test   eax,eax
  405036:	79 28                	jns    0x405060
  405038:	48 89 ca             	mov    rdx,rcx
  40503b:	4c 89 ee             	mov    rsi,r13
  40503e:	e8 ed fe ff ff       	call   0x404f30
  405043:	49 39 c5             	cmp    r13,rax
  405046:	74 08                	je     0x405050
  405048:	31 d2                	xor    edx,edx
  40504a:	48 f7 f3             	div    rbx
  40504d:	49 89 c4             	mov    r12,rax
  405050:	48 83 c4 10          	add    rsp,0x10
  405054:	4c 89 e0             	mov    rax,r12
  405057:	5b                   	pop    rbx
  405058:	5d                   	pop    rbp
  405059:	41 5c                	pop    r12
  40505b:	41 5d                	pop    r13
  40505d:	41 5e                	pop    r14
  40505f:	c3                   	ret
  405060:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  405065:	48 89 cf             	mov    rdi,rcx
  405068:	e8 1b 4b 00 00       	call   0x409b88
  40506d:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  405072:	48 89 ea             	mov    rdx,rbp
  405075:	4c 89 ee             	mov    rsi,r13
  405078:	41 89 c6             	mov    r14d,eax
  40507b:	e8 b0 fe ff ff       	call   0x404f30
  405080:	45 85 f6             	test   r14d,r14d
  405083:	74 be                	je     0x405043
  405085:	48 89 ef             	mov    rdi,rbp
  405088:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  40508d:	e8 89 4b 00 00       	call   0x409c1b
  405092:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  405097:	eb aa                	jmp    0x405043
  405099:	48 83 ec 08          	sub    rsp,0x8
  40509d:	48 8d 3d dc c3 00 00 	lea    rdi,[rip+0xc3dc]        # 0x411480
  4050a4:	e8 50 3a 00 00       	call   0x408af9
  4050a9:	48 8d 05 d8 c3 00 00 	lea    rax,[rip+0xc3d8]        # 0x411488
  4050b0:	48 83 c4 08          	add    rsp,0x8
  4050b4:	c3                   	ret
  4050b5:	48 8d 3d c4 c3 00 00 	lea    rdi,[rip+0xc3c4]        # 0x411480
  4050bc:	e9 e9 3a 00 00       	jmp    0x408baa
  4050c1:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4050c8:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  4050cd:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4050d2:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4050d7:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4050dc:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4050e1:	84 c0                	test   al,al
  4050e3:	74 37                	je     0x40511c
  4050e5:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4050ea:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4050ef:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4050f4:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4050fb:	00 
  4050fc:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  405103:	00 
  405104:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40510b:	00 
  40510c:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  405113:	00 
  405114:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40511b:	00 
  40511c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  405123:	00 00 
  405125:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40512a:	31 c0                	xor    eax,eax
  40512c:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  405133:	00 
  405134:	48 89 e2             	mov    rdx,rsp
  405137:	48 89 fe             	mov    rsi,rdi
  40513a:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  40513f:	48 8d 3d da b0 00 00 	lea    rdi,[rip+0xb0da]        # 0x410220
  405146:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40514b:	c7 04 24 08 00 00 00 	mov    DWORD PTR [rsp],0x8
  405152:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  405159:	00 
  40515a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  40515f:	e8 eb 2b 00 00       	call   0x407d4f
  405164:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  405169:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  405170:	00 00 
  405172:	75 08                	jne    0x40517c
  405174:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40517b:	c3                   	ret
  40517c:	e8 cb f1 ff ff       	call   0x40434c
  405181:	48 83 ec 18          	sub    rsp,0x18
  405185:	89 f9                	mov    ecx,edi
  405187:	31 c0                	xor    eax,eax
  405189:	ba ff ff ff 3f       	mov    edx,0x3fffffff
  40518e:	f0 0f b1 15 16 b1 00 	lock cmpxchg DWORD PTR [rip+0xb116],edx        # 0x4102ac
  405195:	00 
  405196:	85 c0                	test   eax,eax
  405198:	75 60                	jne    0x4051fa
  40519a:	44 0f b6 c1          	movzx  r8d,cl
  40519e:	44 3b 05 0b b1 00 00 	cmp    r8d,DWORD PTR [rip+0xb10b]        # 0x4102b0
  4051a5:	74 69                	je     0x405210
  4051a7:	48 8b 05 9a b0 00 00 	mov    rax,QWORD PTR [rip+0xb09a]        # 0x410248
  4051ae:	48 3b 05 8b b0 00 00 	cmp    rax,QWORD PTR [rip+0xb08b]        # 0x410240
  4051b5:	74 59                	je     0x405210
  4051b7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4051bb:	48 89 15 86 b0 00 00 	mov    QWORD PTR [rip+0xb086],rdx        # 0x410248
  4051c2:	88 08                	mov    BYTE PTR [rax],cl
  4051c4:	31 d2                	xor    edx,edx
  4051c6:	87 15 e0 b0 00 00    	xchg   DWORD PTR [rip+0xb0e0],edx        # 0x4102ac
  4051cc:	81 e2 00 00 00 40    	and    edx,0x40000000
  4051d2:	74 1e                	je     0x4051f2
  4051d4:	be 81 00 00 00       	mov    esi,0x81
  4051d9:	b8 ca 00 00 00       	mov    eax,0xca
  4051de:	ba 01 00 00 00       	mov    edx,0x1
  4051e3:	48 8d 3d c2 b0 00 00 	lea    rdi,[rip+0xb0c2]        # 0x4102ac
  4051ea:	0f 05                	syscall
  4051ec:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  4051f0:	74 32                	je     0x405224
  4051f2:	44 89 c0             	mov    eax,r8d
  4051f5:	48 83 c4 18          	add    rsp,0x18
  4051f9:	c3                   	ret
  4051fa:	89 7c 24 0c          	mov    DWORD PTR [rsp+0xc],edi
  4051fe:	48 8d 3d 1b b0 00 00 	lea    rdi,[rip+0xb01b]        # 0x410220
  405205:	e8 7e 49 00 00       	call   0x409b88
  40520a:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  40520e:	eb 8a                	jmp    0x40519a
  405210:	44 89 c6             	mov    esi,r8d
  405213:	48 8d 3d 06 b0 00 00 	lea    rdi,[rip+0xb006]        # 0x410220
  40521a:	e8 3a 4a 00 00       	call   0x409c59
  40521f:	41 89 c0             	mov    r8d,eax
  405222:	eb a0                	jmp    0x4051c4
  405224:	b8 ca 00 00 00       	mov    eax,0xca
  405229:	be 01 00 00 00       	mov    esi,0x1
  40522e:	0f 05                	syscall
  405230:	eb c0                	jmp    0x4051f2
  405232:	8b 05 74 b0 00 00    	mov    eax,DWORD PTR [rip+0xb074]        # 0x4102ac
  405238:	85 c0                	test   eax,eax
  40523a:	78 1a                	js     0x405256
  40523c:	74 13                	je     0x405251
  40523e:	25 ff ff ff bf       	and    eax,0xbfffffff
  405243:	64 48 8b 14 25 00 00 	mov    rdx,QWORD PTR fs:0x0
  40524a:	00 00 
  40524c:	3b 42 30             	cmp    eax,DWORD PTR [rdx+0x30]
  40524f:	74 05                	je     0x405256
  405251:	e9 2b ff ff ff       	jmp    0x405181
  405256:	40 0f b6 c7          	movzx  eax,dil
  40525a:	3b 05 50 b0 00 00    	cmp    eax,DWORD PTR [rip+0xb050]        # 0x4102b0
  405260:	74 1f                	je     0x405281
  405262:	48 8b 15 df af 00 00 	mov    rdx,QWORD PTR [rip+0xafdf]        # 0x410248
  405269:	48 3b 15 d0 af 00 00 	cmp    rdx,QWORD PTR [rip+0xafd0]        # 0x410240
  405270:	74 0f                	je     0x405281
  405272:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
  405276:	48 89 0d cb af 00 00 	mov    QWORD PTR [rip+0xafcb],rcx        # 0x410248
  40527d:	40 88 3a             	mov    BYTE PTR [rdx],dil
  405280:	c3                   	ret
  405281:	89 c6                	mov    esi,eax
  405283:	48 8d 3d 96 af 00 00 	lea    rdi,[rip+0xaf96]        # 0x410220
  40528a:	e9 ca 49 00 00       	jmp    0x409c59
  40528f:	53                   	push   rbx
  405290:	48 83 ec 10          	sub    rsp,0x10
  405294:	8b 05 12 b0 00 00    	mov    eax,DWORD PTR [rip+0xb012]        # 0x4102ac
  40529a:	85 c0                	test   eax,eax
  40529c:	79 4a                	jns    0x4052e8
  40529e:	48 8d 35 7b af 00 00 	lea    rsi,[rip+0xaf7b]        # 0x410220
  4052a5:	e8 42 fc ff ff       	call   0x404eec
  4052aa:	85 c0                	test   eax,eax
  4052ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4052b1:	78 2f                	js     0x4052e2
  4052b3:	31 db                	xor    ebx,ebx
  4052b5:	83 3d f4 af 00 00 0a 	cmp    DWORD PTR [rip+0xaff4],0xa        # 0x4102b0
  4052bc:	74 59                	je     0x405317
  4052be:	48 8b 05 83 af 00 00 	mov    rax,QWORD PTR [rip+0xaf83]        # 0x410248
  4052c5:	48 3b 05 74 af 00 00 	cmp    rax,QWORD PTR [rip+0xaf74]        # 0x410240
  4052cc:	74 49                	je     0x405317
  4052ce:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4052d2:	48 89 15 6f af 00 00 	mov    QWORD PTR [rip+0xaf6f],rdx        # 0x410248
  4052d9:	c6 00 0a             	mov    BYTE PTR [rax],0xa
  4052dc:	31 c0                	xor    eax,eax
  4052de:	85 db                	test   ebx,ebx
  4052e0:	75 4b                	jne    0x40532d
  4052e2:	48 83 c4 10          	add    rsp,0x10
  4052e6:	5b                   	pop    rbx
  4052e7:	c3                   	ret
  4052e8:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  4052ed:	48 8d 3d 2c af 00 00 	lea    rdi,[rip+0xaf2c]        # 0x410220
  4052f4:	e8 8f 48 00 00       	call   0x409b88
  4052f9:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  4052fe:	48 8d 35 1b af 00 00 	lea    rsi,[rip+0xaf1b]        # 0x410220
  405305:	89 c3                	mov    ebx,eax
  405307:	e8 e0 fb ff ff       	call   0x404eec
  40530c:	85 c0                	test   eax,eax
  40530e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  405313:	79 a0                	jns    0x4052b5
  405315:	eb c7                	jmp    0x4052de
  405317:	be 0a 00 00 00       	mov    esi,0xa
  40531c:	48 8d 3d fd ae 00 00 	lea    rdi,[rip+0xaefd]        # 0x410220
  405323:	e8 31 49 00 00       	call   0x409c59
  405328:	c1 f8 1f             	sar    eax,0x1f
  40532b:	eb b1                	jmp    0x4052de
  40532d:	48 8d 3d ec ae 00 00 	lea    rdi,[rip+0xaeec]        # 0x410220
  405334:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  405338:	e8 de 48 00 00       	call   0x409c1b
  40533d:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  405341:	eb 9f                	jmp    0x4052e2
  405343:	83 ee 09             	sub    esi,0x9
  405346:	83 fe 11             	cmp    esi,0x11
  405349:	0f 87 63 01 00 00    	ja     0x4054b2
  40534f:	48 8d 0d 3a 7a 00 00 	lea    rcx,[rip+0x7a3a]        # 0x40cd90
  405356:	48 63 04 b1          	movsxd rax,DWORD PTR [rcx+rsi*4]
  40535a:	48 01 c8             	add    rax,rcx
  40535d:	ff e0                	jmp    rax
  40535f:	8b 02                	mov    eax,DWORD PTR [rdx]
  405361:	83 f8 2f             	cmp    eax,0x2f
  405364:	77 12                	ja     0x405378
  405366:	89 c1                	mov    ecx,eax
  405368:	83 c0 08             	add    eax,0x8
  40536b:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  40536f:	89 02                	mov    DWORD PTR [rdx],eax
  405371:	48 63 01             	movsxd rax,DWORD PTR [rcx]
  405374:	48 89 07             	mov    QWORD PTR [rdi],rax
  405377:	c3                   	ret
  405378:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40537c:	48 8d 41 08          	lea    rax,[rcx+0x8]
  405380:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  405384:	eb eb                	jmp    0x405371
  405386:	8b 02                	mov    eax,DWORD PTR [rdx]
  405388:	83 f8 2f             	cmp    eax,0x2f
  40538b:	77 11                	ja     0x40539e
  40538d:	89 c1                	mov    ecx,eax
  40538f:	83 c0 08             	add    eax,0x8
  405392:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  405396:	89 02                	mov    DWORD PTR [rdx],eax
  405398:	8b 01                	mov    eax,DWORD PTR [rcx]
  40539a:	48 89 07             	mov    QWORD PTR [rdi],rax
  40539d:	c3                   	ret
  40539e:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  4053a2:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4053a6:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  4053aa:	eb ec                	jmp    0x405398
  4053ac:	8b 02                	mov    eax,DWORD PTR [rdx]
  4053ae:	83 f8 2f             	cmp    eax,0x2f
  4053b1:	77 13                	ja     0x4053c6
  4053b3:	89 c1                	mov    ecx,eax
  4053b5:	83 c0 08             	add    eax,0x8
  4053b8:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  4053bc:	89 02                	mov    DWORD PTR [rdx],eax
  4053be:	48 0f bf 01          	movsx  rax,WORD PTR [rcx]
  4053c2:	48 89 07             	mov    QWORD PTR [rdi],rax
  4053c5:	c3                   	ret
  4053c6:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  4053ca:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4053ce:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  4053d2:	eb ea                	jmp    0x4053be
  4053d4:	8b 02                	mov    eax,DWORD PTR [rdx]
  4053d6:	83 f8 2f             	cmp    eax,0x2f
  4053d9:	77 12                	ja     0x4053ed
  4053db:	89 c1                	mov    ecx,eax
  4053dd:	83 c0 08             	add    eax,0x8
  4053e0:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  4053e4:	89 02                	mov    DWORD PTR [rdx],eax
  4053e6:	0f b7 01             	movzx  eax,WORD PTR [rcx]
  4053e9:	48 89 07             	mov    QWORD PTR [rdi],rax
  4053ec:	c3                   	ret
  4053ed:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  4053f1:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4053f5:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  4053f9:	eb eb                	jmp    0x4053e6
  4053fb:	8b 02                	mov    eax,DWORD PTR [rdx]
  4053fd:	83 f8 2f             	cmp    eax,0x2f
  405400:	77 13                	ja     0x405415
  405402:	89 c1                	mov    ecx,eax
  405404:	83 c0 08             	add    eax,0x8
  405407:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  40540b:	89 02                	mov    DWORD PTR [rdx],eax
  40540d:	48 0f be 01          	movsx  rax,BYTE PTR [rcx]
  405411:	48 89 07             	mov    QWORD PTR [rdi],rax
  405414:	c3                   	ret
  405415:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  405419:	48 8d 41 08          	lea    rax,[rcx+0x8]
  40541d:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  405421:	eb ea                	jmp    0x40540d
  405423:	8b 02                	mov    eax,DWORD PTR [rdx]
  405425:	83 f8 2f             	cmp    eax,0x2f
  405428:	77 12                	ja     0x40543c
  40542a:	89 c1                	mov    ecx,eax
  40542c:	83 c0 08             	add    eax,0x8
  40542f:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  405433:	89 02                	mov    DWORD PTR [rdx],eax
  405435:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  405438:	48 89 07             	mov    QWORD PTR [rdi],rax
  40543b:	c3                   	ret
  40543c:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  405440:	48 8d 41 08          	lea    rax,[rcx+0x8]
  405444:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  405448:	eb eb                	jmp    0x405435
  40544a:	8b 02                	mov    eax,DWORD PTR [rdx]
  40544c:	83 f8 2f             	cmp    eax,0x2f
  40544f:	77 12                	ja     0x405463
  405451:	89 c1                	mov    ecx,eax
  405453:	83 c0 08             	add    eax,0x8
  405456:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  40545a:	89 02                	mov    DWORD PTR [rdx],eax
  40545c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  40545f:	48 89 07             	mov    QWORD PTR [rdi],rax
  405462:	c3                   	ret
  405463:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  405467:	48 8d 41 08          	lea    rax,[rcx+0x8]
  40546b:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  40546f:	eb eb                	jmp    0x40545c
  405471:	8b 42 04             	mov    eax,DWORD PTR [rdx+0x4]
  405474:	3d af 00 00 00       	cmp    eax,0xaf
  405479:	77 11                	ja     0x40548c
  40547b:	89 c1                	mov    ecx,eax
  40547d:	83 c0 10             	add    eax,0x10
  405480:	48 03 4a 10          	add    rcx,QWORD PTR [rdx+0x10]
  405484:	89 42 04             	mov    DWORD PTR [rdx+0x4],eax
  405487:	dd 01                	fld    QWORD PTR [rcx]
  405489:	db 3f                	fstp   TBYTE PTR [rdi]
  40548b:	c3                   	ret
  40548c:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  405490:	48 8d 41 08          	lea    rax,[rcx+0x8]
  405494:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
  405498:	eb ed                	jmp    0x405487
  40549a:	48 8b 42 08          	mov    rax,QWORD PTR [rdx+0x8]
  40549e:	48 83 c0 0f          	add    rax,0xf
  4054a2:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
  4054a6:	48 8d 48 10          	lea    rcx,[rax+0x10]
  4054aa:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  4054ae:	db 28                	fld    TBYTE PTR [rax]
  4054b0:	db 3f                	fstp   TBYTE PTR [rdi]
  4054b2:	c3                   	ret
  4054b3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4054ba:	00 00 00 
  4054bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4054c0:	41 55                	push   r13
  4054c2:	29 ca                	sub    edx,ecx
  4054c4:	40 0f be f6          	movsx  esi,sil
  4054c8:	41 54                	push   r12
  4054ca:	4c 63 e2             	movsxd r12,edx
  4054cd:	ba 00 01 00 00       	mov    edx,0x100
  4054d2:	55                   	push   rbp
  4054d3:	53                   	push   rbx
  4054d4:	44 89 e3             	mov    ebx,r12d
  4054d7:	48 81 ec 18 01 00 00 	sub    rsp,0x118
  4054de:	41 39 d4             	cmp    r12d,edx
  4054e1:	64 48 8b 2c 25 28 00 	mov    rbp,QWORD PTR fs:0x28
  4054e8:	00 00 
  4054ea:	48 89 ac 24 08 01 00 	mov    QWORD PTR [rsp+0x108],rbp
  4054f1:	00 
  4054f2:	48 89 fd             	mov    rbp,rdi
  4054f5:	49 0f 4e d4          	cmovle rdx,r12
  4054f9:	48 89 e7             	mov    rdi,rsp
  4054fc:	e8 34 35 00 00       	call   0x408a35
  405501:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  405504:	eb 20                	jmp    0x405526
  405506:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  40550a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405511:	00 00 00 00 
  405515:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40551c:	00 00 00 00 
  405520:	81 eb 00 01 00 00    	sub    ebx,0x100
  405526:	81 fb ff 00 00 00    	cmp    ebx,0xff
  40552c:	76 19                	jbe    0x405547
  40552e:	a8 20                	test   al,0x20
  405530:	75 ee                	jne    0x405520
  405532:	48 89 ea             	mov    rdx,rbp
  405535:	be 00 01 00 00       	mov    esi,0x100
  40553a:	48 89 e7             	mov    rdi,rsp
  40553d:	e8 ee f9 ff ff       	call   0x404f30
  405542:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  405545:	eb d9                	jmp    0x405520
  405547:	a8 20                	test   al,0x20
  405549:	74 21                	je     0x40556c
  40554b:	48 8b 84 24 08 01 00 	mov    rax,QWORD PTR [rsp+0x108]
  405552:	00 
  405553:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40555a:	00 00 
  40555c:	75 1f                	jne    0x40557d
  40555e:	48 81 c4 18 01 00 00 	add    rsp,0x118
  405565:	5b                   	pop    rbx
  405566:	5d                   	pop    rbp
  405567:	41 5c                	pop    r12
  405569:	41 5d                	pop    r13
  40556b:	c3                   	ret
  40556c:	41 0f b6 f4          	movzx  esi,r12b
  405570:	48 89 ea             	mov    rdx,rbp
  405573:	48 89 e7             	mov    rdi,rsp
  405576:	e8 b5 f9 ff ff       	call   0x404f30
  40557b:	eb ce                	jmp    0x40554b
  40557d:	e8 ca ed ff ff       	call   0x40434c
  405582:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  405589:	00 00 00 
  40558c:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  405593:	00 00 00 
  405596:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40559d:	00 00 00 
  4055a0:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4055a7:	00 00 00 
  4055aa:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4055b1:	00 00 00 
  4055b4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4055bb:	00 00 00 
  4055be:	66 90                	xchg   ax,ax
  4055c0:	55                   	push   rbp
  4055c1:	48 89 e5             	mov    rbp,rsp
  4055c4:	41 57                	push   r15
  4055c6:	45 31 ff             	xor    r15d,r15d
  4055c9:	41 56                	push   r14
  4055cb:	49 89 f6             	mov    r14,rsi
  4055ce:	41 55                	push   r13
  4055d0:	41 54                	push   r12
  4055d2:	53                   	push   rbx
  4055d3:	48 81 ec 48 01 00 00 	sub    rsp,0x148
  4055da:	48 89 bd 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rdi
  4055e1:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  4055e8:	48 89 8d f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rcx
  4055ef:	4c 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],r8
  4055f6:	64 4c 8b 04 25 28 00 	mov    r8,QWORD PTR fs:0x28
  4055fd:	00 00 
  4055ff:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  405603:	45 31 c0             	xor    r8d,r8d
  405606:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
  40560d:	00 00 00 
  405610:	eb 72                	jmp    0x405684
  405612:	0f 1f 00             	nop    DWORD PTR [rax]
  405615:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40561c:	00 00 00 00 
  405620:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
  405626:	49 83 c4 01          	add    r12,0x1
  40562a:	84 c0                	test   al,al
  40562c:	74 04                	je     0x405632
  40562e:	3c 25                	cmp    al,0x25
  405630:	75 ee                	jne    0x405620
  405632:	4c 89 e3             	mov    rbx,r12
  405635:	eb 11                	jmp    0x405648
  405637:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40563e:	00 00 
  405640:	49 83 c4 01          	add    r12,0x1
  405644:	48 83 c3 02          	add    rbx,0x2
  405648:	80 3b 25             	cmp    BYTE PTR [rbx],0x25
  40564b:	75 06                	jne    0x405653
  40564d:	80 7b 01 25          	cmp    BYTE PTR [rbx+0x1],0x25
  405651:	74 ed                	je     0x405640
  405653:	45 89 cb             	mov    r11d,r9d
  405656:	4d 29 f4             	sub    r12,r14
  405659:	45 29 fb             	sub    r11d,r15d
  40565c:	49 63 c3             	movsxd rax,r11d
  40565f:	49 39 c4             	cmp    r12,rax
  405662:	0f 8f 3c 03 00 00    	jg     0x4059a4
  405668:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  40566f:	45 89 e0             	mov    r8d,r12d
  405672:	48 85 c0             	test   rax,rax
  405675:	74 05                	je     0x40567c
  405677:	f6 00 20             	test   BYTE PTR [rax],0x20
  40567a:	74 36                	je     0x4056b2
  40567c:	45 85 e4             	test   r12d,r12d
  40567f:	74 63                	je     0x4056e4
  405681:	49 89 de             	mov    r14,rbx
  405684:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  405689:	44 29 f8             	sub    eax,r15d
  40568c:	44 39 c0             	cmp    eax,r8d
  40568f:	0f 8c 0f 03 00 00    	jl     0x4059a4
  405695:	41 b9 ff ff ff 7f    	mov    r9d,0x7fffffff
  40569b:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
  40569f:	45 01 c7             	add    r15d,r8d
  4056a2:	84 c0                	test   al,al
  4056a4:	0f 84 94 25 00 00    	je     0x407c3e
  4056aa:	4d 89 f4             	mov    r12,r14
  4056ad:	e9 78 ff ff ff       	jmp    0x40562a
  4056b2:	49 63 f4             	movsxd rsi,r12d
  4056b5:	48 89 c2             	mov    rdx,rax
  4056b8:	4c 89 f7             	mov    rdi,r14
  4056bb:	44 89 9d 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r11d
  4056c2:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  4056c9:	e8 62 f8 ff ff       	call   0x404f30
  4056ce:	44 8b 85 28 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xd8]
  4056d5:	44 8b 9d 38 ff ff ff 	mov    r11d,DWORD PTR [rbp-0xc8]
  4056dc:	41 b9 ff ff ff 7f    	mov    r9d,0x7fffffff
  4056e2:	eb 98                	jmp    0x40567c
  4056e4:	0f be 53 01          	movsx  edx,BYTE PTR [rbx+0x1]
  4056e8:	8d 42 d0             	lea    eax,[rdx-0x30]
  4056eb:	89 d6                	mov    esi,edx
  4056ed:	83 f8 09             	cmp    eax,0x9
  4056f0:	77 06                	ja     0x4056f8
  4056f2:	80 7b 02 24          	cmp    BYTE PTR [rbx+0x2],0x24
  4056f6:	74 18                	je     0x405710
  4056f8:	c7 85 10 ff ff ff ff 	mov    DWORD PTR [rbp-0xf0],0xffffffff
  4056ff:	ff ff ff 
  405702:	48 8d 43 01          	lea    rax,[rbx+0x1]
  405706:	45 31 ed             	xor    r13d,r13d
  405709:	bf 89 28 01 00       	mov    edi,0x12889
  40570e:	eb 43                	jmp    0x405753
  405710:	0f be 53 03          	movsx  edx,BYTE PTR [rbx+0x3]
  405714:	89 85 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],eax
  40571a:	48 8d 43 03          	lea    rax,[rbx+0x3]
  40571e:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
  405725:	00 00 00 
  405728:	89 d6                	mov    esi,edx
  40572a:	eb da                	jmp    0x405706
  40572c:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  405733:	00 00 
  405735:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40573c:	00 00 00 00 
  405740:	ba 01 00 00 00       	mov    edx,0x1
  405745:	48 83 c0 01          	add    rax,0x1
  405749:	d3 e2                	shl    edx,cl
  40574b:	41 09 d5             	or     r13d,edx
  40574e:	0f be 10             	movsx  edx,BYTE PTR [rax]
  405751:	89 d6                	mov    esi,edx
  405753:	8d 4a e0             	lea    ecx,[rdx-0x20]
  405756:	83 f9 1f             	cmp    ecx,0x1f
  405759:	0f 87 55 02 00 00    	ja     0x4059b4
  40575f:	0f a3 cf             	bt     edi,ecx
  405762:	72 dc                	jb     0x405740
  405764:	40 80 fe 2a          	cmp    sil,0x2a
  405768:	0f 85 46 02 00 00    	jne    0x4059b4
  40576e:	0f be 50 01          	movsx  edx,BYTE PTR [rax+0x1]
  405772:	89 d6                	mov    esi,edx
  405774:	83 ea 30             	sub    edx,0x30
  405777:	83 fa 09             	cmp    edx,0x9
  40577a:	0f 87 9e 00 00 00    	ja     0x40581e
  405780:	80 78 02 24          	cmp    BYTE PTR [rax+0x2],0x24
  405784:	74 3d                	je     0x4057c3
  405786:	8b 9d 24 ff ff ff    	mov    ebx,DWORD PTR [rbp-0xdc]
  40578c:	85 db                	test   ebx,ebx
  40578e:	0f 85 25 25 00 00    	jne    0x407cb9
  405794:	48 8d 58 01          	lea    rbx,[rax+0x1]
  405798:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  40579f:	00 
  4057a0:	0f 85 9d 00 00 00    	jne    0x405843
  4057a6:	44 89 a5 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r12d
  4057ad:	44 89 a5 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r12d
  4057b4:	c7 85 28 ff ff ff ff 	mov    DWORD PTR [rbp-0xd8],0xffffffff
  4057bb:	ff ff ff 
  4057be:	e9 30 03 00 00       	jmp    0x405af3
  4057c3:	48 0f be d6          	movsx  rdx,sil
  4057c7:	48 8d 58 03          	lea    rbx,[rax+0x3]
  4057cb:	48 83 ea 30          	sub    rdx,0x30
  4057cf:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  4057d6:	00 
  4057d7:	74 20                	je     0x4057f9
  4057d9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  4057e0:	48 c1 e2 04          	shl    rdx,0x4
  4057e4:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
  4057eb:	00 00 00 
  4057ee:	8b 04 10             	mov    eax,DWORD PTR [rax+rdx*1]
  4057f1:	89 85 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],eax
  4057f7:	eb 79                	jmp    0x405872
  4057f9:	48 8b bd f8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x108]
  405800:	44 89 a5 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r12d
  405807:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
  40580e:	00 00 00 
  405811:	c7 04 97 0a 00 00 00 	mov    DWORD PTR [rdi+rdx*4],0xa
  405818:	0f b6 70 03          	movzx  esi,BYTE PTR [rax+0x3]
  40581c:	eb 78                	jmp    0x405896
  40581e:	44 8b 95 24 ff ff ff 	mov    r10d,DWORD PTR [rbp-0xdc]
  405825:	45 85 d2             	test   r10d,r10d
  405828:	0f 85 8b 24 00 00    	jne    0x407cb9
  40582e:	44 89 a5 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r12d
  405835:	48 8d 58 01          	lea    rbx,[rax+0x1]
  405839:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  405840:	00 
  405841:	74 53                	je     0x405896
  405843:	48 8b bd 18 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xe8]
  40584a:	8b 07                	mov    eax,DWORD PTR [rdi]
  40584c:	83 f8 2f             	cmp    eax,0x2f
  40584f:	0f 87 c5 00 00 00    	ja     0x40591a
  405855:	89 c2                	mov    edx,eax
  405857:	83 c0 08             	add    eax,0x8
  40585a:	48 03 57 10          	add    rdx,QWORD PTR [rdi+0x10]
  40585e:	89 07                	mov    DWORD PTR [rdi],eax
  405860:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
  405867:	00 00 00 
  40586a:	8b 02                	mov    eax,DWORD PTR [rdx]
  40586c:	89 85 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],eax
  405872:	8b bd 38 ff ff ff    	mov    edi,DWORD PTR [rbp-0xc8]
  405878:	44 89 e8             	mov    eax,r13d
  40587b:	0f b6 33             	movzx  esi,BYTE PTR [rbx]
  40587e:	80 cc 20             	or     ah,0x20
  405881:	85 ff                	test   edi,edi
  405883:	44 0f 48 e8          	cmovs  r13d,eax
  405887:	89 f8                	mov    eax,edi
  405889:	f7 d8                	neg    eax
  40588b:	85 ff                	test   edi,edi
  40588d:	0f 49 c7             	cmovns eax,edi
  405890:	89 85 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],eax
  405896:	40 80 fe 2e          	cmp    sil,0x2e
  40589a:	0f 85 42 02 00 00    	jne    0x405ae2
  4058a0:	0f be 53 01          	movsx  edx,BYTE PTR [rbx+0x1]
  4058a4:	80 fa 2a             	cmp    dl,0x2a
  4058a7:	0f 85 ac 01 00 00    	jne    0x405a59
  4058ad:	0f be 43 02          	movsx  eax,BYTE PTR [rbx+0x2]
  4058b1:	89 c2                	mov    edx,eax
  4058b3:	83 e8 30             	sub    eax,0x30
  4058b6:	83 f8 09             	cmp    eax,0x9
  4058b9:	77 0a                	ja     0x4058c5
  4058bb:	80 7b 03 24          	cmp    BYTE PTR [rbx+0x3],0x24
  4058bf:	0f 84 0a 01 00 00    	je     0x4059cf
  4058c5:	8b bd 24 ff ff ff    	mov    edi,DWORD PTR [rbp-0xdc]
  4058cb:	85 ff                	test   edi,edi
  4058cd:	0f 85 e6 23 00 00    	jne    0x407cb9
  4058d3:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  4058da:	00 
  4058db:	0f 84 62 01 00 00    	je     0x405a43
  4058e1:	48 8b bd 18 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xe8]
  4058e8:	8b 07                	mov    eax,DWORD PTR [rdi]
  4058ea:	83 f8 2f             	cmp    eax,0x2f
  4058ed:	0f 87 38 01 00 00    	ja     0x405a2b
  4058f3:	89 c2                	mov    edx,eax
  4058f5:	83 c0 08             	add    eax,0x8
  4058f8:	48 03 57 10          	add    rdx,QWORD PTR [rdi+0x10]
  4058fc:	89 07                	mov    DWORD PTR [rdi],eax
  4058fe:	8b 02                	mov    eax,DWORD PTR [rdx]
  405900:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  405906:	f7 d0                	not    eax
  405908:	c1 e8 1f             	shr    eax,0x1f
  40590b:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
  405911:	48 83 c3 02          	add    rbx,0x2
  405915:	e9 d9 01 00 00       	jmp    0x405af3
  40591a:	48 8b bd 18 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xe8]
  405921:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
  405925:	48 8d 42 08          	lea    rax,[rdx+0x8]
  405929:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
  40592d:	e9 2e ff ff ff       	jmp    0x405860
  405932:	48 89 c3             	mov    rbx,rax
  405935:	eb 51                	jmp    0x405988
  405937:	29 ca                	sub    edx,ecx
  405939:	48 83 c0 01          	add    rax,0x1
  40593d:	89 95 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],edx
  405943:	0f be 10             	movsx  edx,BYTE PTR [rax]
  405946:	89 d6                	mov    esi,edx
  405948:	83 ea 30             	sub    edx,0x30
  40594b:	83 fa 09             	cmp    edx,0x9
  40594e:	77 6d                	ja     0x4059bd
  405950:	81 bd 38 ff ff ff cc 	cmp    DWORD PTR [rbp-0xc8],0xccccccc
  405957:	cc cc 0c 
  40595a:	7f d6                	jg     0x405932
  40595c:	6b 8d 38 ff ff ff f6 	imul   ecx,DWORD PTR [rbp-0xc8],0xfffffff6
  405963:	8d b1 ff ff ff 7f    	lea    esi,[rcx+0x7fffffff]
  405969:	39 f2                	cmp    edx,esi
  40596b:	7e ca                	jle    0x405937
  40596d:	0f be 50 01          	movsx  edx,BYTE PTR [rax+0x1]
  405971:	83 ea 30             	sub    edx,0x30
  405974:	83 fa 09             	cmp    edx,0x9
  405977:	77 2b                	ja     0x4059a4
  405979:	48 8d 58 02          	lea    rbx,[rax+0x2]
  40597d:	0f be 03             	movsx  eax,BYTE PTR [rbx]
  405980:	83 e8 30             	sub    eax,0x30
  405983:	83 f8 09             	cmp    eax,0x9
  405986:	77 1c                	ja     0x4059a4
  405988:	0f be 43 01          	movsx  eax,BYTE PTR [rbx+0x1]
  40598c:	83 e8 30             	sub    eax,0x30
  40598f:	83 f8 09             	cmp    eax,0x9
  405992:	77 10                	ja     0x4059a4
  405994:	0f be 43 02          	movsx  eax,BYTE PTR [rbx+0x2]
  405998:	48 83 c3 02          	add    rbx,0x2
  40599c:	83 e8 30             	sub    eax,0x30
  40599f:	83 f8 09             	cmp    eax,0x9
  4059a2:	76 e4                	jbe    0x405988
  4059a4:	e8 5b 36 00 00       	call   0x409004
  4059a9:	c7 00 4b 00 00 00    	mov    DWORD PTR [rax],0x4b
  4059af:	e9 10 23 00 00       	jmp    0x407cc4
  4059b4:	44 89 a5 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r12d
  4059bb:	eb 8b                	jmp    0x405948
  4059bd:	48 89 c3             	mov    rbx,rax
  4059c0:	83 bd 38 ff ff ff ff 	cmp    DWORD PTR [rbp-0xc8],0xffffffff
  4059c7:	0f 85 c9 fe ff ff    	jne    0x405896
  4059cd:	eb d5                	jmp    0x4059a4
  4059cf:	48 0f be c2          	movsx  rax,dl
  4059d3:	48 83 e8 30          	sub    rax,0x30
  4059d7:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  4059de:	00 
  4059df:	74 29                	je     0x405a0a
  4059e1:	48 8b bd f0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x110]
  4059e8:	48 c1 e0 04          	shl    rax,0x4
  4059ec:	48 8b 04 07          	mov    rax,QWORD PTR [rdi+rax*1]
  4059f0:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  4059f6:	f7 d0                	not    eax
  4059f8:	c1 e8 1f             	shr    eax,0x1f
  4059fb:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
  405a01:	48 83 c3 04          	add    rbx,0x4
  405a05:	e9 e9 00 00 00       	jmp    0x405af3
  405a0a:	48 8b bd f8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x108]
  405a11:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  405a18:	c7 85 00 ff ff ff 01 	mov    DWORD PTR [rbp-0x100],0x1
  405a1f:	00 00 00 
  405a22:	c7 04 87 0a 00 00 00 	mov    DWORD PTR [rdi+rax*4],0xa
  405a29:	eb d6                	jmp    0x405a01
  405a2b:	48 8b bd 18 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xe8]
  405a32:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
  405a36:	48 8d 42 08          	lea    rax,[rdx+0x8]
  405a3a:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
  405a3e:	e9 bb fe ff ff       	jmp    0x4058fe
  405a43:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  405a4a:	c7 85 00 ff ff ff 01 	mov    DWORD PTR [rbp-0x100],0x1
  405a51:	00 00 00 
  405a54:	e9 b8 fe ff ff       	jmp    0x405911
  405a59:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  405a60:	48 8d 43 01          	lea    rax,[rbx+0x1]
  405a64:	eb 0f                	jmp    0x405a75
  405a66:	29 ca                	sub    edx,ecx
  405a68:	48 83 c0 01          	add    rax,0x1
  405a6c:	89 95 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edx
  405a72:	0f be 10             	movsx  edx,BYTE PTR [rax]
  405a75:	83 ea 30             	sub    edx,0x30
  405a78:	83 fa 09             	cmp    edx,0x9
  405a7b:	77 56                	ja     0x405ad3
  405a7d:	81 bd 28 ff ff ff cc 	cmp    DWORD PTR [rbp-0xd8],0xccccccc
  405a84:	cc cc 0c 
  405a87:	7f 11                	jg     0x405a9a
  405a89:	6b 8d 28 ff ff ff f6 	imul   ecx,DWORD PTR [rbp-0xd8],0xfffffff6
  405a90:	8d b1 ff ff ff 7f    	lea    esi,[rcx+0x7fffffff]
  405a96:	39 f2                	cmp    edx,esi
  405a98:	7e cc                	jle    0x405a66
  405a9a:	0f be 50 01          	movsx  edx,BYTE PTR [rax+0x1]
  405a9e:	48 8d 58 01          	lea    rbx,[rax+0x1]
  405aa2:	83 ea 30             	sub    edx,0x30
  405aa5:	83 fa 09             	cmp    edx,0x9
  405aa8:	77 13                	ja     0x405abd
  405aaa:	0f be 50 02          	movsx  edx,BYTE PTR [rax+0x2]
  405aae:	48 83 c0 02          	add    rax,0x2
  405ab2:	83 ea 30             	sub    edx,0x30
  405ab5:	83 fa 09             	cmp    edx,0x9
  405ab8:	76 e0                	jbe    0x405a9a
  405aba:	48 89 c3             	mov    rbx,rax
  405abd:	c7 85 00 ff ff ff 01 	mov    DWORD PTR [rbp-0x100],0x1
  405ac4:	00 00 00 
  405ac7:	c7 85 28 ff ff ff ff 	mov    DWORD PTR [rbp-0xd8],0xffffffff
  405ace:	ff ff ff 
  405ad1:	eb 20                	jmp    0x405af3
  405ad3:	c7 85 00 ff ff ff 01 	mov    DWORD PTR [rbp-0x100],0x1
  405ada:	00 00 00 
  405add:	48 89 c3             	mov    rbx,rax
  405ae0:	eb 11                	jmp    0x405af3
  405ae2:	44 89 a5 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r12d
  405ae9:	c7 85 28 ff ff ff ff 	mov    DWORD PTR [rbp-0xd8],0xffffffff
  405af0:	ff ff ff 
  405af3:	45 31 d2             	xor    r10d,r10d
  405af6:	eb 0b                	jmp    0x405b03
  405af8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  405aff:	00 
  405b00:	41 89 f2             	mov    r10d,esi
  405b03:	0f be 13             	movsx  edx,BYTE PTR [rbx]
  405b06:	83 ea 41             	sub    edx,0x41
  405b09:	83 fa 39             	cmp    edx,0x39
  405b0c:	0f 87 a7 21 00 00    	ja     0x407cb9
  405b12:	44 89 d0             	mov    eax,r10d
  405b15:	48 8d 3d e4 73 00 00 	lea    rdi,[rip+0x73e4]        # 0x40cf00
  405b1c:	48 63 d2             	movsxd rdx,edx
  405b1f:	48 83 c3 01          	add    rbx,0x1
  405b23:	48 6b c8 3a          	imul   rcx,rax,0x3a
  405b27:	48 01 f9             	add    rcx,rdi
  405b2a:	0f b6 34 11          	movzx  esi,BYTE PTR [rcx+rdx*1]
  405b2e:	8d 56 ff             	lea    edx,[rsi-0x1]
  405b31:	83 fa 07             	cmp    edx,0x7
  405b34:	76 ca                	jbe    0x405b00
  405b36:	85 f6                	test   esi,esi
  405b38:	0f 84 7b 21 00 00    	je     0x407cb9
  405b3e:	83 fe 1b             	cmp    esi,0x1b
  405b41:	0f 84 a5 00 00 00    	je     0x405bec
  405b47:	8b bd 10 ff ff ff    	mov    edi,DWORD PTR [rbp-0xf0]
  405b4d:	83 ff ff             	cmp    edi,0xffffffff
  405b50:	0f 84 c5 00 00 00    	je     0x405c1b
  405b56:	48 63 d7             	movsxd rdx,edi
  405b59:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  405b60:	00 
  405b61:	0f 84 a2 00 00 00    	je     0x405c09
  405b67:	48 8b bd f0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x110]
  405b6e:	48 c1 e2 04          	shl    rdx,0x4
  405b72:	66 0f 6f 04 17       	movdqa xmm0,XMMWORD PTR [rdi+rdx*1]
  405b77:	0f 29 85 50 ff ff ff 	movaps XMMWORD PTR [rbp-0xb0],xmm0
  405b7e:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  405b85:	f6 07 20             	test   BYTE PTR [rdi],0x20
  405b88:	0f 85 36 21 00 00    	jne    0x407cc4
  405b8e:	0f be 7b ff          	movsx  edi,BYTE PTR [rbx-0x1]
  405b92:	89 bd 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],edi
  405b98:	89 fa                	mov    edx,edi
  405b9a:	45 85 d2             	test   r10d,r10d
  405b9d:	74 17                	je     0x405bb6
  405b9f:	89 f9                	mov    ecx,edi
  405ba1:	83 e2 df             	and    edx,0xffffffdf
  405ba4:	83 e1 0f             	and    ecx,0xf
  405ba7:	0f be d2             	movsx  edx,dl
  405baa:	80 f9 03             	cmp    cl,0x3
  405bad:	0f 45 d7             	cmovne edx,edi
  405bb0:	89 95 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],edx
  405bb6:	44 89 ea             	mov    edx,r13d
  405bb9:	8b bd 10 ff ff ff    	mov    edi,DWORD PTR [rbp-0xf0]
  405bbf:	81 e2 ff ff fe ff    	and    edx,0xfffeffff
  405bc5:	41 f7 c5 00 20 00 00 	test   r13d,0x2000
  405bcc:	44 0f 45 ea          	cmovne r13d,edx
  405bd0:	8d 57 bf             	lea    edx,[rdi-0x41]
  405bd3:	83 fa 37             	cmp    edx,0x37
  405bd6:	0f 87 51 1e 00 00    	ja     0x407a2d
  405bdc:	48 8d 0d f5 71 00 00 	lea    rcx,[rip+0x71f5]        # 0x40cdd8
  405be3:	48 63 14 91          	movsxd rdx,DWORD PTR [rcx+rdx*4]
  405be7:	48 01 ca             	add    rdx,rcx
  405bea:	ff e2                	jmp    rdx
  405bec:	83 bd 10 ff ff ff ff 	cmp    DWORD PTR [rbp-0xf0],0xffffffff
  405bf3:	0f 85 c0 20 00 00    	jne    0x407cb9
  405bf9:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  405c00:	00 
  405c01:	0f 85 77 ff ff ff    	jne    0x405b7e
  405c07:	eb 0a                	jmp    0x405c13
  405c09:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  405c10:	89 34 90             	mov    DWORD PTR [rax+rdx*4],esi
  405c13:	49 89 de             	mov    r14,rbx
  405c16:	e9 80 fa ff ff       	jmp    0x40569b
  405c1b:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  405c22:	00 
  405c23:	0f 84 c2 20 00 00    	je     0x407ceb
  405c29:	48 8b 95 18 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xe8]
  405c30:	48 8d bd 50 ff ff ff 	lea    rdi,[rbp-0xb0]
  405c37:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  405c3e:	e8 00 f7 ff ff       	call   0x405343
  405c43:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  405c4a:	e9 2f ff ff ff       	jmp    0x405b7e
  405c4f:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405c56:	e9 01 05 00 00       	jmp    0x40615c
  405c5b:	8b b5 10 ff ff ff    	mov    esi,DWORD PTR [rbp-0xf0]
  405c61:	83 e6 20             	and    esi,0x20
  405c64:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405c6b:	4c 8d 45 98          	lea    r8,[rbp-0x68]
  405c6f:	48 8d 3d 6a 72 00 00 	lea    rdi,[rip+0x726a]        # 0x40cee0
  405c76:	4d 89 c6             	mov    r14,r8
  405c79:	48 89 c2             	mov    rdx,rax
  405c7c:	e9 38 01 00 00       	jmp    0x405db9
  405c81:	48 63 85 28 ff ff ff 	movsxd rax,DWORD PTR [rbp-0xd8]
  405c88:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  405c8f:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405c96:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  405c9d:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  405ca4:	4c 8b b5 10 ff ff ff 	mov    r14,QWORD PTR [rbp-0xf0]
  405cab:	45 31 e4             	xor    r12d,r12d
  405cae:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
  405cb5:	4c 3b a5 28 ff ff ff 	cmp    r12,QWORD PTR [rbp-0xd8]
  405cbc:	0f 83 0e 05 00 00    	jae    0x4061d0
  405cc2:	41 8b 36             	mov    esi,DWORD PTR [r14]
  405cc5:	85 f6                	test   esi,esi
  405cc7:	0f 84 03 05 00 00    	je     0x4061d0
  405ccd:	48 8b bd 00 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x100]
  405cd4:	e8 97 3e 00 00       	call   0x409b70
  405cd9:	85 c0                	test   eax,eax
  405cdb:	0f 88 e3 1f 00 00    	js     0x407cc4
  405ce1:	48 8b 8d 28 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd8]
  405ce8:	48 98                	cdqe
  405cea:	4c 29 e1             	sub    rcx,r12
  405ced:	48 39 c1             	cmp    rcx,rax
  405cf0:	0f 82 da 04 00 00    	jb     0x4061d0
  405cf6:	49 83 c6 04          	add    r14,0x4
  405cfa:	49 01 c4             	add    r12,rax
  405cfd:	eb b6                	jmp    0x405cb5
  405cff:	41 83 fa 07          	cmp    r10d,0x7
  405d03:	0f 87 0a ff ff ff    	ja     0x405c13
  405d09:	48 8d 15 a8 71 00 00 	lea    rdx,[rip+0x71a8]        # 0x40ceb8
  405d10:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
  405d14:	48 01 d0             	add    rax,rdx
  405d17:	ff e0                	jmp    rax
  405d19:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405d20:	44 89 38             	mov    DWORD PTR [rax],r15d
  405d23:	e9 eb fe ff ff       	jmp    0x405c13
  405d28:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405d2f:	66 44 89 38          	mov    WORD PTR [rax],r15w
  405d33:	e9 db fe ff ff       	jmp    0x405c13
  405d38:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405d3f:	44 88 38             	mov    BYTE PTR [rax],r15b
  405d42:	e9 cc fe ff ff       	jmp    0x405c13
  405d47:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
  405d4e:	49 63 c7             	movsxd rax,r15d
  405d51:	48 89 02             	mov    QWORD PTR [rdx],rax
  405d54:	e9 ba fe ff ff       	jmp    0x405c13
  405d59:	8b bd 28 ff ff ff    	mov    edi,DWORD PTR [rbp-0xd8]
  405d5f:	b8 10 00 00 00       	mov    eax,0x10
  405d64:	be 20 00 00 00       	mov    esi,0x20
  405d69:	c7 85 10 ff ff ff 78 	mov    DWORD PTR [rbp-0xf0],0x78
  405d70:	00 00 00 
  405d73:	39 c7                	cmp    edi,eax
  405d75:	0f 43 c7             	cmovae eax,edi
  405d78:	41 83 cd 08          	or     r13d,0x8
  405d7c:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  405d82:	e9 dd fe ff ff       	jmp    0x405c64
  405d87:	0f 1f 00             	nop    DWORD PTR [rax]
  405d8a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405d91:	00 00 00 00 
  405d95:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405d9c:	00 00 00 00 
  405da0:	48 89 d1             	mov    rcx,rdx
  405da3:	49 83 ee 01          	sub    r14,0x1
  405da7:	48 c1 ea 04          	shr    rdx,0x4
  405dab:	83 e1 0f             	and    ecx,0xf
  405dae:	44 0f b6 0c 0f       	movzx  r9d,BYTE PTR [rdi+rcx*1]
  405db3:	41 09 f1             	or     r9d,esi
  405db6:	45 88 0e             	mov    BYTE PTR [r14],r9b
  405db9:	48 85 d2             	test   rdx,rdx
  405dbc:	75 e2                	jne    0x405da0
  405dbe:	48 85 c0             	test   rax,rax
  405dc1:	0f 84 b4 01 00 00    	je     0x405f7b
  405dc7:	41 f6 c5 08          	test   r13b,0x8
  405dcb:	0f 84 aa 01 00 00    	je     0x405f7b
  405dd1:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  405dd7:	48 8d 15 79 54 00 00 	lea    rdx,[rip+0x5479]        # 0x40b257
  405dde:	41 ba 02 00 00 00    	mov    r10d,0x2
  405de4:	c1 f8 04             	sar    eax,0x4
  405de7:	48 98                	cdqe
  405de9:	48 01 d0             	add    rax,rdx
  405dec:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  405df3:	e9 94 01 00 00       	jmp    0x405f8c
  405df8:	4c 8d 45 98          	lea    r8,[rbp-0x68]
  405dfc:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405e03:	4d 89 c6             	mov    r14,r8
  405e06:	eb 2b                	jmp    0x405e33
  405e08:	66 90                	xchg   ax,ax
  405e0a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405e11:	00 00 00 00 
  405e15:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405e1c:	00 00 00 00 
  405e20:	89 c2                	mov    edx,eax
  405e22:	49 83 ee 01          	sub    r14,0x1
  405e26:	48 c1 e8 03          	shr    rax,0x3
  405e2a:	83 e2 07             	and    edx,0x7
  405e2d:	83 c2 30             	add    edx,0x30
  405e30:	41 88 16             	mov    BYTE PTR [r14],dl
  405e33:	48 85 c0             	test   rax,rax
  405e36:	75 e8                	jne    0x405e20
  405e38:	41 f6 c5 08          	test   r13b,0x8
  405e3c:	0f 84 39 01 00 00    	je     0x405f7b
  405e42:	4c 89 c0             	mov    rax,r8
  405e45:	48 63 95 28 ff ff ff 	movsxd rdx,DWORD PTR [rbp-0xd8]
  405e4c:	4c 29 f0             	sub    rax,r14
  405e4f:	48 39 d0             	cmp    rax,rdx
  405e52:	0f 8c 23 01 00 00    	jl     0x405f7b
  405e58:	83 c0 01             	add    eax,0x1
  405e5b:	45 89 e2             	mov    r10d,r12d
  405e5e:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  405e64:	48 8d 05 ec 53 00 00 	lea    rax,[rip+0x53ec]        # 0x40b257
  405e6b:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  405e72:	e9 15 01 00 00       	jmp    0x405f8c
  405e77:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405e7e:	48 85 c0             	test   rax,rax
  405e81:	78 25                	js     0x405ea8
  405e83:	41 f7 c5 00 08 00 00 	test   r13d,0x800
  405e8a:	75 6d                	jne    0x405ef9
  405e8c:	41 f6 c5 01          	test   r13b,0x1
  405e90:	74 7d                	je     0x405f0f
  405e92:	48 8d 3d c0 53 00 00 	lea    rdi,[rip+0x53c0]        # 0x40b259
  405e99:	41 ba 01 00 00 00    	mov    r10d,0x1
  405e9f:	48 89 bd e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdi
  405ea6:	eb 1e                	jmp    0x405ec6
  405ea8:	48 f7 d8             	neg    rax
  405eab:	48 8d 3d a5 53 00 00 	lea    rdi,[rip+0x53a5]        # 0x40b257
  405eb2:	41 ba 01 00 00 00    	mov    r10d,0x1
  405eb8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
  405ebf:	48 89 bd e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdi
  405ec6:	4c 8d 45 98          	lea    r8,[rbp-0x68]
  405eca:	48 89 c1             	mov    rcx,rax
  405ecd:	48 be cd cc cc cc cc 	movabs rsi,0xcccccccccccccccd
  405ed4:	cc cc cc 
  405ed7:	4d 89 c6             	mov    r14,r8
  405eda:	e9 85 00 00 00       	jmp    0x405f64
  405edf:	48 8d 05 71 53 00 00 	lea    rax,[rip+0x5371]        # 0x40b257
  405ee6:	45 89 e2             	mov    r10d,r12d
  405ee9:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  405ef0:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  405ef7:	eb cd                	jmp    0x405ec6
  405ef9:	48 8d 3d 58 53 00 00 	lea    rdi,[rip+0x5358]        # 0x40b258
  405f00:	41 ba 01 00 00 00    	mov    r10d,0x1
  405f06:	48 89 bd e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdi
  405f0d:	eb b7                	jmp    0x405ec6
  405f0f:	48 8d 3d 41 53 00 00 	lea    rdi,[rip+0x5341]        # 0x40b257
  405f16:	45 89 e2             	mov    r10d,r12d
  405f19:	48 89 bd e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdi
  405f20:	eb a4                	jmp    0x405ec6
  405f22:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  405f29:	00 
  405f2a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405f31:	00 00 00 00 
  405f35:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  405f3c:	00 00 00 00 
  405f40:	48 89 c8             	mov    rax,rcx
  405f43:	49 83 ee 01          	sub    r14,0x1
  405f47:	48 f7 e6             	mul    rsi
  405f4a:	48 89 c8             	mov    rax,rcx
  405f4d:	48 c1 ea 03          	shr    rdx,0x3
  405f51:	48 8d 3c 92          	lea    rdi,[rdx+rdx*4]
  405f55:	48 89 d1             	mov    rcx,rdx
  405f58:	48 01 ff             	add    rdi,rdi
  405f5b:	48 29 f8             	sub    rax,rdi
  405f5e:	83 c0 30             	add    eax,0x30
  405f61:	41 88 06             	mov    BYTE PTR [r14],al
  405f64:	48 83 f9 09          	cmp    rcx,0x9
  405f68:	77 d6                	ja     0x405f40
  405f6a:	48 85 c9             	test   rcx,rcx
  405f6d:	74 1d                	je     0x405f8c
  405f6f:	8d 41 30             	lea    eax,[rcx+0x30]
  405f72:	49 83 ee 01          	sub    r14,0x1
  405f76:	41 88 06             	mov    BYTE PTR [r14],al
  405f79:	eb 11                	jmp    0x405f8c
  405f7b:	48 8d 05 d5 52 00 00 	lea    rax,[rip+0x52d5]        # 0x40b257
  405f82:	45 89 e2             	mov    r10d,r12d
  405f85:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  405f8c:	8b b5 28 ff ff ff    	mov    esi,DWORD PTR [rbp-0xd8]
  405f92:	85 f6                	test   esi,esi
  405f94:	79 0d                	jns    0x405fa3
  405f96:	f6 85 00 ff ff ff 01 	test   BYTE PTR [rbp-0x100],0x1
  405f9d:	0f 85 01 fa ff ff    	jne    0x4059a4
  405fa3:	8b 95 00 ff ff ff    	mov    edx,DWORD PTR [rbp-0x100]
  405fa9:	44 89 e8             	mov    eax,r13d
  405fac:	8b 8d 28 ff ff ff    	mov    ecx,DWORD PTR [rbp-0xd8]
  405fb2:	25 ff ff fe ff       	and    eax,0xfffeffff
  405fb7:	85 d2                	test   edx,edx
  405fb9:	44 0f 45 e8          	cmovne r13d,eax
  405fbd:	48 83 bd 50 ff ff ff 	cmp    QWORD PTR [rbp-0xb0],0x0
  405fc4:	00 
  405fc5:	0f 94 c0             	sete   al
  405fc8:	85 c9                	test   ecx,ecx
  405fca:	75 08                	jne    0x405fd4
  405fcc:	84 c0                	test   al,al
  405fce:	0f 85 95 1a 00 00    	jne    0x407a69
  405fd4:	4c 89 c7             	mov    rdi,r8
  405fd7:	48 63 95 28 ff ff ff 	movsxd rdx,DWORD PTR [rbp-0xd8]
  405fde:	0f b6 c0             	movzx  eax,al
  405fe1:	4c 29 f7             	sub    rdi,r14
  405fe4:	48 01 f8             	add    rax,rdi
  405fe7:	48 89 bd 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdi
  405fee:	48 39 d0             	cmp    rax,rdx
  405ff1:	48 0f 4c c2          	cmovl  rax,rdx
  405ff5:	48 63 d0             	movsxd rdx,eax
  405ff8:	48 39 d7             	cmp    rdi,rdx
  405ffb:	0f 4e f8             	cmovle edi,eax
  405ffe:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  406003:	44 29 d0             	sub    eax,r10d
  406006:	89 bd 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edi
  40600c:	39 f8                	cmp    eax,edi
  40600e:	0f 8c 90 f9 ff ff    	jl     0x4059a4
  406014:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  40601a:	46 8d 0c 10          	lea    r9d,[rax+r10*1]
  40601e:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [rbp-0xc8]
  406024:	44 39 c8             	cmp    eax,r9d
  406027:	41 89 c0             	mov    r8d,eax
  40602a:	45 0f 4c c1          	cmovl  r8d,r9d
  40602e:	45 39 c3             	cmp    r11d,r8d
  406031:	0f 8c 6d f9 ff ff    	jl     0x4059a4
  406037:	41 f7 c5 00 20 01 00 	test   r13d,0x12000
  40603e:	0f 85 9f 1a 00 00    	jne    0x407ae3
  406044:	44 39 c8             	cmp    eax,r9d
  406047:	0f 8f 45 1a 00 00    	jg     0x407a92
  40604d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  406054:	f6 00 20             	test   BYTE PTR [rax],0x20
  406057:	0f 84 92 1a 00 00    	je     0x407aef
  40605d:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  406064:	89 c1                	mov    ecx,eax
  406066:	3b 85 28 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xd8]
  40606c:	0f 8d 0f f6 ff ff    	jge    0x405681
  406072:	44 39 8d 38 ff ff ff 	cmp    DWORD PTR [rbp-0xc8],r9d
  406079:	41 0f 9e c4          	setle  r12b
  40607d:	e9 02 1b 00 00       	jmp    0x407b84
  406082:	44 89 9d 10 ff ff ff 	mov    DWORD PTR [rbp-0xf0],r11d
  406089:	e8 76 2f 00 00       	call   0x409004
  40608e:	8b 38                	mov    edi,DWORD PTR [rax]
  406090:	e8 a9 2f 00 00       	call   0x40903e
  406095:	44 8b 9d 10 ff ff ff 	mov    r11d,DWORD PTR [rbp-0xf0]
  40609c:	49 89 c6             	mov    r14,rax
  40609f:	44 8b 95 28 ff ff ff 	mov    r10d,DWORD PTR [rbp-0xd8]
  4060a6:	45 85 d2             	test   r10d,r10d
  4060a9:	78 78                	js     0x406123
  4060ab:	48 63 b5 28 ff ff ff 	movsxd rsi,DWORD PTR [rbp-0xd8]
  4060b2:	4c 89 f7             	mov    rdi,r14
  4060b5:	44 89 9d 10 ff ff ff 	mov    DWORD PTR [rbp-0xf0],r11d
  4060bc:	e8 75 24 00 00       	call   0x408536
  4060c1:	44 8b 9d 10 ff ff ff 	mov    r11d,DWORD PTR [rbp-0xf0]
  4060c8:	49 89 c1             	mov    r9,rax
  4060cb:	4d 8d 14 06          	lea    r10,[r14+rax*1]
  4060cf:	4d 29 f2             	sub    r10,r14
  4060d2:	49 63 c1             	movsxd rax,r9d
  4060d5:	44 89 8d 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r9d
  4060dc:	41 81 e5 ff ff fe ff 	and    r13d,0xfffeffff
  4060e3:	4c 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r10
  4060ea:	49 39 c2             	cmp    r10,rax
  4060ed:	0f 8f 11 19 00 00    	jg     0x407a04
  4060f3:	48 8d 05 5d 51 00 00 	lea    rax,[rip+0x515d]        # 0x40b257
  4060fa:	45 89 e2             	mov    r10d,r12d
  4060fd:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  406104:	e9 15 ff ff ff       	jmp    0x40601e
  406109:	4c 8b b5 50 ff ff ff 	mov    r14,QWORD PTR [rbp-0xb0]
  406110:	48 8d 05 4a 51 00 00 	lea    rax,[rip+0x514a]        # 0x40b261
  406117:	4d 85 f6             	test   r14,r14
  40611a:	4c 0f 44 f0          	cmove  r14,rax
  40611e:	e9 7c ff ff ff       	jmp    0x40609f
  406123:	be ff ff ff 7f       	mov    esi,0x7fffffff
  406128:	4c 89 f7             	mov    rdi,r14
  40612b:	44 89 9d 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r11d
  406132:	e8 ff 23 00 00       	call   0x408536
  406137:	44 8b 9d 28 ff ff ff 	mov    r11d,DWORD PTR [rbp-0xd8]
  40613e:	4d 8d 14 06          	lea    r10,[r14+rax*1]
  406142:	49 89 c1             	mov    r9,rax
  406145:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
  406149:	74 84                	je     0x4060cf
  40614b:	e9 54 f8 ff ff       	jmp    0x4059a4
  406150:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  406157:	48 85 c0             	test   rax,rax
  40615a:	75 3f                	jne    0x40619b
  40615c:	88 45 97             	mov    BYTE PTR [rbp-0x69],al
  40615f:	45 89 e2             	mov    r10d,r12d
  406162:	41 b9 01 00 00 00    	mov    r9d,0x1
  406168:	4c 8d 75 97          	lea    r14,[rbp-0x69]
  40616c:	48 8d 05 e4 50 00 00 	lea    rax,[rip+0x50e4]        # 0x40b257
  406173:	41 81 e5 ff ff fe ff 	and    r13d,0xfffeffff
  40617a:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  406181:	00 00 00 
  406184:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  40618b:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x1
  406192:	01 00 00 00 
  406196:	e9 83 fe ff ff       	jmp    0x40601e
  40619b:	4c 8d a5 68 ff ff ff 	lea    r12,[rbp-0x98]
  4061a2:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax
  4061a8:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  4061af:	00 00 00 
  4061b2:	4c 89 a5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],r12
  4061b9:	4c 89 a5 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r12
  4061c0:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0xffffffffffffffff
  4061c7:	ff ff ff ff 
  4061cb:	e9 cd fa ff ff       	jmp    0x405c9d
  4061d0:	49 81 fc ff ff ff 7f 	cmp    r12,0x7fffffff
  4061d7:	0f 87 c7 f7 ff ff    	ja     0x4059a4
  4061dd:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4061e3:	44 89 a5 e0 fe ff ff 	mov    DWORD PTR [rbp-0x120],r12d
  4061ea:	44 89 e1             	mov    ecx,r12d
  4061ed:	41 39 d4             	cmp    r12d,edx
  4061f0:	0f 9d 85 00 ff ff ff 	setge  BYTE PTR [rbp-0x100]
  4061f7:	41 f7 c5 00 20 01 00 	test   r13d,0x12000
  4061fe:	75 09                	jne    0x406209
  406200:	80 bd 00 ff ff ff 00 	cmp    BYTE PTR [rbp-0x100],0x0
  406207:	74 5f                	je     0x406268
  406209:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  406210:	45 31 f6             	xor    r14d,r14d
  406213:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  40621a:	4d 39 e6             	cmp    r14,r12
  40621d:	73 5c                	jae    0x40627b
  40621f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  406226:	8b 30                	mov    esi,DWORD PTR [rax]
  406228:	85 f6                	test   esi,esi
  40622a:	74 4f                	je     0x40627b
  40622c:	48 8b bd 28 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd8]
  406233:	e8 38 39 00 00       	call   0x409b70
  406238:	48 63 f0             	movsxd rsi,eax
  40623b:	49 01 f6             	add    r14,rsi
  40623e:	4d 39 f4             	cmp    r12,r14
  406241:	72 38                	jb     0x40627b
  406243:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  40624a:	48 83 85 10 ff ff ff 	add    QWORD PTR [rbp-0xf0],0x4
  406251:	04 
  406252:	f6 00 20             	test   BYTE PTR [rax],0x20
  406255:	75 c3                	jne    0x40621a
  406257:	48 8b bd 28 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd8]
  40625e:	48 89 c2             	mov    rdx,rax
  406261:	e8 ca ec ff ff       	call   0x404f30
  406266:	eb b2                	jmp    0x40621a
  406268:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  40626f:	be 20 00 00 00       	mov    esi,0x20
  406274:	e8 47 f2 ff ff       	call   0x4054c0
  406279:	eb 8e                	jmp    0x406209
  40627b:	41 81 f5 00 20 00 00 	xor    r13d,0x2000
  406282:	41 81 e5 00 20 01 00 	and    r13d,0x12000
  406289:	75 09                	jne    0x406294
  40628b:	80 bd 00 ff ff ff 00 	cmp    BYTE PTR [rbp-0x100],0x0
  406292:	74 19                	je     0x4062ad
  406294:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  40629a:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  4062a1:	44 39 c0             	cmp    eax,r8d
  4062a4:	44 0f 4d c0          	cmovge r8d,eax
  4062a8:	e9 d4 f3 ff ff       	jmp    0x405681
  4062ad:	8b 8d e0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x120]
  4062b3:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4062b9:	be 20 00 00 00       	mov    esi,0x20
  4062be:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4062c5:	e8 f6 f1 ff ff       	call   0x4054c0
  4062ca:	eb c8                	jmp    0x406294
  4062cc:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  4062d2:	c1 e8 1f             	shr    eax,0x1f
  4062d5:	22 85 00 ff ff ff    	and    al,BYTE PTR [rbp-0x100]
  4062db:	88 85 23 ff ff ff    	mov    BYTE PTR [rbp-0xdd],al
  4062e1:	0f 85 bd f6 ff ff    	jne    0x4059a4
  4062e7:	41 83 fa 05          	cmp    r10d,0x5
  4062eb:	ba b8 1c 00 00       	mov    edx,0x1cb8
  4062f0:	b8 00 02 00 00       	mov    eax,0x200
  4062f5:	41 be 7b 00 00 00    	mov    r14d,0x7b
  4062fb:	48 0f 44 c2          	cmove  rax,rdx
  4062ff:	ba 27 07 00 00       	mov    edx,0x727
  406304:	48 89 a5 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rsp
  40630b:	4c 0f 44 f2          	cmove  r14,rdx
  40630f:	48 83 c0 0f          	add    rax,0xf
  406313:	db ad 50 ff ff ff    	fld    TBYTE PTR [rbp-0xb0]
  406319:	25 f0 3f 00 00       	and    eax,0x3ff0
  40631e:	48 29 c4             	sub    rsp,rax
  406321:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
  406328:	00 00 00 
  40632b:	48 89 a5 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rsp
  406332:	48 83 ec 10          	sub    rsp,0x10
  406336:	d9 c0                	fld    st(0)
  406338:	db 3c 24             	fstp   TBYTE PTR [rsp]
  40633b:	44 89 85 e0 fe ff ff 	mov    DWORD PTR [rbp-0x120],r8d
  406342:	db bd 00 ff ff ff    	fstp   TBYTE PTR [rbp-0x100]
  406348:	e8 0b 37 00 00       	call   0x409a58
  40634d:	db ad 00 ff ff ff    	fld    TBYTE PTR [rbp-0x100]
  406353:	41 58                	pop    r8
  406355:	85 c0                	test   eax,eax
  406357:	44 8b 85 e0 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x120]
  40635e:	41 59                	pop    r9
  406360:	0f 84 e8 00 00 00    	je     0x40644e
  406366:	48 8d 05 fb 4e 00 00 	lea    rax,[rip+0x4efb]        # 0x40b268
  40636d:	d9 e0                	fchs
  40636f:	c7 85 d0 fe ff ff 01 	mov    DWORD PTR [rbp-0x130],0x1
  406376:	00 00 00 
  406379:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  406380:	48 83 ec 10          	sub    rsp,0x10
  406384:	44 89 85 e0 fe ff ff 	mov    DWORD PTR [rbp-0x120],r8d
  40638b:	d9 c0                	fld    st(0)
  40638d:	db 3c 24             	fstp   TBYTE PTR [rsp]
  406390:	db bd 00 ff ff ff    	fstp   TBYTE PTR [rbp-0x100]
  406396:	e8 70 36 00 00       	call   0x409a0b
  40639b:	5e                   	pop    rsi
  40639c:	5f                   	pop    rdi
  40639d:	db ad 00 ff ff ff    	fld    TBYTE PTR [rbp-0x100]
  4063a3:	83 f8 01             	cmp    eax,0x1
  4063a6:	44 8b 85 e0 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x120]
  4063ad:	0f 8e eb 00 00 00    	jle    0x40649e
  4063b3:	48 83 ec 10          	sub    rsp,0x10
  4063b7:	44 89 85 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r8d
  4063be:	48 8d bd 4c ff ff ff 	lea    rdi,[rbp-0xb4]
  4063c5:	db 3c 24             	fstp   TBYTE PTR [rsp]
  4063c8:	e8 98 36 00 00       	call   0x409a65
  4063cd:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  4063d3:	44 8b 85 00 ff ff ff 	mov    r8d,DWORD PTR [rbp-0x100]
  4063da:	d8 c0                	fadd   st,st(0)
  4063dc:	83 c8 20             	or     eax,0x20
  4063df:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  4063e5:	5a                   	pop    rdx
  4063e6:	d9 ee                	fldz
  4063e8:	d9 c9                	fxch   st(1)
  4063ea:	59                   	pop    rcx
  4063eb:	db e9                	fucomi st,st(1)
  4063ed:	dd d9                	fstp   st(1)
  4063ef:	0f 8a cb 01 00 00    	jp     0x4065c0
  4063f5:	0f 85 c5 01 00 00    	jne    0x4065c0
  4063fb:	83 f8 61             	cmp    eax,0x61
  4063fe:	0f 84 c8 02 00 00    	je     0x4066cc
  406404:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  40640a:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
  406410:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  406416:	85 c0                	test   eax,eax
  406418:	0f 88 50 07 00 00    	js     0x406b6e
  40641e:	0f 95 85 a4 fe ff ff 	setne  BYTE PTR [rbp-0x15c]
  406425:	83 c0 1d             	add    eax,0x1d
  406428:	48 69 c0 39 8e e3 38 	imul   rax,rax,0x38e38e39
  40642f:	48 c1 e8 21          	shr    rax,0x21
  406433:	48 83 c0 01          	add    rax,0x1
  406437:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
  40643e:	48 c1 e0 02          	shl    rax,0x2
  406442:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
  406449:	e9 d3 01 00 00       	jmp    0x406621
  40644e:	41 f7 c5 00 08 00 00 	test   r13d,0x800
  406455:	75 2a                	jne    0x406481
  406457:	31 c0                	xor    eax,eax
  406459:	41 f6 c5 01          	test   r13b,0x1
  40645d:	48 8d 3d 05 4e 00 00 	lea    rdi,[rip+0x4e05]        # 0x40b269
  406464:	0f 95 c0             	setne  al
  406467:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
  40646d:	48 8d 47 05          	lea    rax,[rdi+0x5]
  406471:	48 0f 44 c7          	cmove  rax,rdi
  406475:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  40647c:	e9 ff fe ff ff       	jmp    0x406380
  406481:	48 8d 05 e3 4d 00 00 	lea    rax,[rip+0x4de3]        # 0x40b26b
  406488:	c7 85 d0 fe ff ff 01 	mov    DWORD PTR [rbp-0x130],0x1
  40648f:	00 00 00 
  406492:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  406499:	e9 e2 fe ff ff       	jmp    0x406380
  40649e:	f6 85 10 ff ff ff 20 	test   BYTE PTR [rbp-0xf0],0x20
  4064a5:	0f 85 81 00 00 00    	jne    0x40652c
  4064ab:	df e8                	fucomip st,st(0)
  4064ad:	48 8d 15 cf 4d 00 00 	lea    rdx,[rip+0x4dcf]        # 0x40b283
  4064b4:	48 8d 05 cc 4d 00 00 	lea    rax,[rip+0x4dcc]        # 0x40b287
  4064bb:	48 0f 4a c2          	cmovp  rax,rdx
  4064bf:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  4064c6:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  4064cc:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4064d2:	44 8d 60 03          	lea    r12d,[rax+0x3]
  4064d6:	41 39 d4             	cmp    r12d,edx
  4064d9:	41 0f 9d c6          	setge  r14b
  4064dd:	41 f7 c5 00 20 00 00 	test   r13d,0x2000
  4064e4:	75 05                	jne    0x4064eb
  4064e6:	45 84 f6             	test   r14b,r14b
  4064e9:	74 61                	je     0x40654c
  4064eb:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  4064f2:	f6 00 20             	test   BYTE PTR [rax],0x20
  4064f5:	74 6b                	je     0x406562
  4064f7:	41 81 f5 00 20 00 00 	xor    r13d,0x2000
  4064fe:	41 81 e5 00 20 01 00 	and    r13d,0x12000
  406505:	75 09                	jne    0x406510
  406507:	45 84 f6             	test   r14b,r14b
  40650a:	0f 84 91 00 00 00    	je     0x4065a1
  406510:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [rbp-0xc8]
  406516:	48 8b a5 c0 fe ff ff 	mov    rsp,QWORD PTR [rbp-0x140]
  40651d:	41 39 c4             	cmp    r12d,eax
  406520:	41 0f 4d c4          	cmovge eax,r12d
  406524:	41 89 c0             	mov    r8d,eax
  406527:	e9 55 f1 ff ff       	jmp    0x405681
  40652c:	df e8                	fucomip st,st(0)
  40652e:	48 8d 15 46 4d 00 00 	lea    rdx,[rip+0x4d46]        # 0x40b27b
  406535:	48 8d 05 43 4d 00 00 	lea    rax,[rip+0x4d43]        # 0x40b27f
  40653c:	48 0f 4a c2          	cmovp  rax,rdx
  406540:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  406547:	e9 7a ff ff ff       	jmp    0x4064c6
  40654c:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  406553:	44 89 e1             	mov    ecx,r12d
  406556:	be 20 00 00 00       	mov    esi,0x20
  40655b:	e8 60 ef ff ff       	call   0x4054c0
  406560:	eb 89                	jmp    0x4064eb
  406562:	48 63 b5 d0 fe ff ff 	movsxd rsi,DWORD PTR [rbp-0x130]
  406569:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
  406570:	48 89 c2             	mov    rdx,rax
  406573:	e8 b8 e9 ff ff       	call   0x404f30
  406578:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  40657f:	f6 00 20             	test   BYTE PTR [rax],0x20
  406582:	0f 85 6f ff ff ff    	jne    0x4064f7
  406588:	48 8b bd 28 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd8]
  40658f:	48 89 c2             	mov    rdx,rax
  406592:	be 03 00 00 00       	mov    esi,0x3
  406597:	e8 94 e9 ff ff       	call   0x404f30
  40659c:	e9 56 ff ff ff       	jmp    0x4064f7
  4065a1:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4065a7:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4065ae:	44 89 e1             	mov    ecx,r12d
  4065b1:	be 20 00 00 00       	mov    esi,0x20
  4065b6:	e8 05 ef ff ff       	call   0x4054c0
  4065bb:	e9 50 ff ff ff       	jmp    0x406510
  4065c0:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [rbp-0xb4]
  4065c6:	83 bd e0 fe ff ff 61 	cmp    DWORD PTR [rbp-0x120],0x61
  4065cd:	0f 84 f0 00 00 00    	je     0x4066c3
  4065d3:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  4065d9:	85 c0                	test   eax,eax
  4065db:	0f 88 61 05 00 00    	js     0x406b42
  4065e1:	0f 95 85 a4 fe ff ff 	setne  BYTE PTR [rbp-0x15c]
  4065e8:	83 c0 1d             	add    eax,0x1d
  4065eb:	48 69 c0 39 8e e3 38 	imul   rax,rax,0x38e38e39
  4065f2:	48 c1 e8 21          	shr    rax,0x21
  4065f6:	48 83 c0 01          	add    rax,0x1
  4065fa:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
  406601:	48 c1 e0 02          	shl    rax,0x2
  406605:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
  40660c:	8d 42 e3             	lea    eax,[rdx-0x1d]
  40660f:	d8 0d cb 6a 00 00    	fmul   DWORD PTR [rip+0x6acb]        # 0x40d0e0
  406615:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
  40661b:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
  406621:	d9 bd 3e ff ff ff    	fnstcw WORD PTR [rbp-0xc2]
  406627:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
  40662e:	44 8b 8d 00 ff ff ff 	mov    r9d,DWORD PTR [rbp-0x100]
  406635:	4a 8d 44 b7 fc       	lea    rax,[rdi+r14*4-0x4]
  40663a:	45 85 c9             	test   r9d,r9d
  40663d:	48 0f 48 c7          	cmovs  rax,rdi
  406641:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
  406648:	49 89 c6             	mov    r14,rax
  40664b:	0f b7 85 3e ff ff ff 	movzx  eax,WORD PTR [rbp-0xc2]
  406652:	80 cc 0c             	or     ah,0xc
  406655:	66 89 85 3c ff ff ff 	mov    WORD PTR [rbp-0xc4],ax
  40665c:	d9 c0                	fld    st(0)
  40665e:	d9 ad 3c ff ff ff    	fldcw  WORD PTR [rbp-0xc4]
  406664:	df bd b8 fe ff ff    	fistp  QWORD PTR [rbp-0x148]
  40666a:	d9 ad 3e ff ff ff    	fldcw  WORD PTR [rbp-0xc2]
  406670:	49 83 c6 04          	add    r14,0x4
  406674:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
  40667b:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
  40667f:	89 c0                	mov    eax,eax
  406681:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
  406688:	df ad b8 fe ff ff    	fild   QWORD PTR [rbp-0x148]
  40668e:	de e9                	fsubp  st(1),st
  406690:	d8 0d 4e 6a 00 00    	fmul   DWORD PTR [rip+0x6a4e]        # 0x40d0e4
  406696:	d9 ee                	fldz
  406698:	d9 c9                	fxch   st(1)
  40669a:	db e9                	fucomi st,st(1)
  40669c:	dd d9                	fstp   st(1)
  40669e:	7a bc                	jp     0x40665c
  4066a0:	75 ba                	jne    0x40665c
  4066a2:	dd d8                	fstp   st(0)
  4066a4:	44 8b 95 00 ff ff ff 	mov    r10d,DWORD PTR [rbp-0x100]
  4066ab:	31 c0                	xor    eax,eax
  4066ad:	4c 8b 9d d8 fe ff ff 	mov    r11,QWORD PTR [rbp-0x128]
  4066b4:	49 b9 53 5a 9b a0 2f 	movabs r9,0x44b82fa09b5a53
  4066bb:	b8 44 00 
  4066be:	e9 56 05 00 00       	jmp    0x406c19
  4066c3:	83 ea 01             	sub    edx,0x1
  4066c6:	89 95 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],edx
  4066cc:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
  4066d3:	f6 85 10 ff ff ff 20 	test   BYTE PTR [rbp-0xf0],0x20
  4066da:	44 8b b5 d0 fe ff ff 	mov    r14d,DWORD PTR [rbp-0x130]
  4066e1:	48 8d 47 09          	lea    rax,[rdi+0x9]
  4066e5:	48 0f 44 c7          	cmove  rax,rdi
  4066e9:	41 83 c6 02          	add    r14d,0x2
  4066ed:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  4066f4:	83 bd 28 ff ff ff 0f 	cmp    DWORD PTR [rbp-0xd8],0xf
  4066fb:	76 26                	jbe    0x406723
  4066fd:	8b bd 4c ff ff ff    	mov    edi,DWORD PTR [rbp-0xb4]
  406703:	4c 8d 55 80          	lea    r10,[rbp-0x80]
  406707:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  40670e:	cc cc cc 
  406711:	4c 89 d6             	mov    rsi,r10
  406714:	89 f9                	mov    ecx,edi
  406716:	f7 d9                	neg    ecx
  406718:	0f 48 cf             	cmovs  ecx,edi
  40671b:	48 63 c9             	movsxd rcx,ecx
  40671e:	e9 7d 00 00 00       	jmp    0x4067a0
  406723:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  406729:	f2 0f 10 05 17 4d 00 	movsd  xmm0,QWORD PTR [rip+0x4d17]        # 0x40b448
  406730:	00 
  406731:	bf 3f 00 00 00       	mov    edi,0x3f
  406736:	db bd e0 fe ff ff    	fstp   TBYTE PTR [rbp-0x120]
  40673c:	c1 e0 02             	shl    eax,0x2
  40673f:	29 c7                	sub    edi,eax
  406741:	e8 a4 33 00 00       	call   0x409aea
  406746:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  40674d:	f2 0f 11 85 00 ff ff 	movsd  QWORD PTR [rbp-0x100],xmm0
  406754:	ff 
  406755:	dd 85 00 ff ff ff    	fld    QWORD PTR [rbp-0x100]
  40675b:	db ad e0 fe ff ff    	fld    TBYTE PTR [rbp-0x120]
  406761:	80 38 2d             	cmp    BYTE PTR [rax],0x2d
  406764:	74 06                	je     0x40676c
  406766:	d8 c1                	fadd   st,st(1)
  406768:	de e1                	fsubrp st(1),st
  40676a:	eb 91                	jmp    0x4066fd
  40676c:	d9 e0                	fchs
  40676e:	d8 e1                	fsub   st,st(1)
  406770:	de c1                	faddp  st(1),st
  406772:	d9 e0                	fchs
  406774:	eb 87                	jmp    0x4066fd
  406776:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40677d:	00 00 00 
  406780:	48 89 c8             	mov    rax,rcx
  406783:	48 83 ee 01          	sub    rsi,0x1
  406787:	49 f7 e0             	mul    r8
  40678a:	48 c1 ea 03          	shr    rdx,0x3
  40678e:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  406792:	48 01 c0             	add    rax,rax
  406795:	48 29 c1             	sub    rcx,rax
  406798:	83 c1 30             	add    ecx,0x30
  40679b:	88 0e                	mov    BYTE PTR [rsi],cl
  40679d:	48 89 d1             	mov    rcx,rdx
  4067a0:	48 83 f9 09          	cmp    rcx,0x9
  4067a4:	77 da                	ja     0x406780
  4067a6:	48 85 c9             	test   rcx,rcx
  4067a9:	74 09                	je     0x4067b4
  4067ab:	83 c1 30             	add    ecx,0x30
  4067ae:	48 83 ee 01          	sub    rsi,0x1
  4067b2:	88 0e                	mov    BYTE PTR [rsi],cl
  4067b4:	4c 39 d6             	cmp    rsi,r10
  4067b7:	74 69                	je     0x406822
  4067b9:	c1 ff 1f             	sar    edi,0x1f
  4067bc:	44 8b 9d 28 ff ff ff 	mov    r11d,DWORD PTR [rbp-0xd8]
  4067c3:	d9 ee                	fldz
  4067c5:	d9 c9                	fxch   st(1)
  4067c7:	48 8d 46 fe          	lea    rax,[rsi-0x2]
  4067cb:	83 e7 02             	and    edi,0x2
  4067ce:	4c 8d 65 a0          	lea    r12,[rbp-0x60]
  4067d2:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  4067d9:	41 b8 01 00 00 00    	mov    r8d,0x1
  4067df:	83 c7 2b             	add    edi,0x2b
  4067e2:	45 85 db             	test   r11d,r11d
  4067e5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  4067e9:	8b bd 10 ff ff ff    	mov    edi,DWORD PTR [rbp-0xf0]
  4067ef:	41 0f 9f c1          	setg   r9b
  4067f3:	8d 47 0f             	lea    eax,[rdi+0xf]
  4067f6:	83 e7 20             	and    edi,0x20
  4067f9:	88 46 fe             	mov    BYTE PTR [rsi-0x2],al
  4067fc:	4c 89 e0             	mov    rax,r12
  4067ff:	48 8d 35 da 66 00 00 	lea    rsi,[rip+0x66da]        # 0x40cee0
  406806:	d9 bd 3e ff ff ff    	fnstcw WORD PTR [rbp-0xc2]
  40680c:	0f b7 95 3e ff ff ff 	movzx  edx,WORD PTR [rbp-0xc2]
  406813:	80 ce 0c             	or     dh,0xc
  406816:	66 89 95 3c ff ff ff 	mov    WORD PTR [rbp-0xc4],dx
  40681d:	e9 b9 00 00 00       	jmp    0x4068db
  406822:	c6 85 7f ff ff ff 30 	mov    BYTE PTR [rbp-0x81],0x30
  406829:	48 8d b5 7f ff ff ff 	lea    rsi,[rbp-0x81]
  406830:	eb 87                	jmp    0x4067b9
  406832:	d9 c1                	fld    st(1)
  406834:	df e9                	fucomip st,st(1)
  406836:	0f 9a c1             	setp   cl
  406839:	41 0f 45 c8          	cmovne ecx,r8d
  40683d:	84 c9                	test   cl,cl
  40683f:	0f 85 82 00 00 00    	jne    0x4068c7
  406845:	45 84 c9             	test   r9b,r9b
  406848:	75 7d                	jne    0x4068c7
  40684a:	dd d8                	fstp   st(0)
  40684c:	dd d8                	fstp   st(0)
  40684e:	41 f6 c5 08          	test   r13b,0x8
  406852:	74 08                	je     0x40685c
  406854:	c6 40 01 2e          	mov    BYTE PTR [rax+0x1],0x2e
  406858:	48 8d 50 02          	lea    rdx,[rax+0x2]
  40685c:	4c 2b 95 e0 fe ff ff 	sub    r10,QWORD PTR [rbp-0x120]
  406863:	be fd ff ff 7f       	mov    esi,0x7ffffffd
  406868:	49 63 c6             	movsxd rax,r14d
  40686b:	48 63 8d 28 ff ff ff 	movsxd rcx,DWORD PTR [rbp-0xd8]
  406872:	4c 29 d6             	sub    rsi,r10
  406875:	4c 89 95 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],r10
  40687c:	48 29 c6             	sub    rsi,rax
  40687f:	48 39 f1             	cmp    rcx,rsi
  406882:	0f 8f 9d 07 00 00    	jg     0x407025
  406888:	48 89 d7             	mov    rdi,rdx
  40688b:	8b b5 28 ff ff ff    	mov    esi,DWORD PTR [rbp-0xd8]
  406891:	4c 29 e7             	sub    rdi,r12
  406894:	48 89 bd d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rdi
  40689b:	85 f6                	test   esi,esi
  40689d:	0f 84 87 00 00 00    	je     0x40692a
  4068a3:	48 8d 57 ff          	lea    rdx,[rdi-0x1]
  4068a7:	48 39 d1             	cmp    rcx,rdx
  4068aa:	7c 7e                	jl     0x40692a
  4068ac:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
  4068b3:	8d 74 0e 02          	lea    esi,[rsi+rcx*1+0x2]
  4068b7:	01 cf                	add    edi,ecx
  4068b9:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi
  4068bf:	89 bd 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],edi
  4068c5:	eb 7b                	jmp    0x406942
  4068c7:	c6 40 01 2e          	mov    BYTE PTR [rax+0x1],0x2e
  4068cb:	48 83 c0 02          	add    rax,0x2
  4068cf:	d9 c1                	fld    st(1)
  4068d1:	d9 c9                	fxch   st(1)
  4068d3:	db e9                	fucomi st,st(1)
  4068d5:	dd d9                	fstp   st(1)
  4068d7:	7a 02                	jp     0x4068db
  4068d9:	74 43                	je     0x40691e
  4068db:	d9 c0                	fld    st(0)
  4068dd:	d9 ad 3c ff ff ff    	fldcw  WORD PTR [rbp-0xc4]
  4068e3:	db 9d 10 ff ff ff    	fistp  DWORD PTR [rbp-0xf0]
  4068e9:	d9 ad 3e ff ff ff    	fldcw  WORD PTR [rbp-0xc2]
  4068ef:	48 63 95 10 ff ff ff 	movsxd rdx,DWORD PTR [rbp-0xf0]
  4068f6:	db 85 10 ff ff ff    	fild   DWORD PTR [rbp-0xf0]
  4068fc:	0f b6 0c 16          	movzx  ecx,BYTE PTR [rsi+rdx*1]
  406900:	48 8d 50 01          	lea    rdx,[rax+0x1]
  406904:	de e9                	fsubp  st(1),st
  406906:	d8 0d d0 67 00 00    	fmul   DWORD PTR [rip+0x67d0]        # 0x40d0dc
  40690c:	09 f9                	or     ecx,edi
  40690e:	88 08                	mov    BYTE PTR [rax],cl
  406910:	4c 39 e0             	cmp    rax,r12
  406913:	0f 84 19 ff ff ff    	je     0x406832
  406919:	48 89 d0             	mov    rax,rdx
  40691c:	eb b1                	jmp    0x4068cf
  40691e:	dd d8                	fstp   st(0)
  406920:	dd d8                	fstp   st(0)
  406922:	48 89 c2             	mov    rdx,rax
  406925:	e9 32 ff ff ff       	jmp    0x40685c
  40692a:	8b bd 00 ff ff ff    	mov    edi,DWORD PTR [rbp-0x100]
  406930:	03 bd d8 fe ff ff    	add    edi,DWORD PTR [rbp-0x128]
  406936:	89 bd 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],edi
  40693c:	89 bd 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edi
  406942:	44 03 b5 28 ff ff ff 	add    r14d,DWORD PTR [rbp-0xd8]
  406949:	41 f7 c5 00 20 01 00 	test   r13d,0x12000
  406950:	0f 85 a0 01 00 00    	jne    0x406af6
  406956:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  40695c:	41 39 d6             	cmp    r14d,edx
  40695f:	0f 8c ca 00 00 00    	jl     0x406a2f
  406965:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  40696c:	f6 07 20             	test   BYTE PTR [rdi],0x20
  40696f:	0f 84 ec 00 00 00    	je     0x406a61
  406975:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  40697b:	2b 95 10 ff ff ff    	sub    edx,DWORD PTR [rbp-0xf0]
  406981:	85 d2                	test   edx,edx
  406983:	0f 8e 8a 00 00 00    	jle    0x406a13
  406989:	44 3b b5 38 ff ff ff 	cmp    r14d,DWORD PTR [rbp-0xc8]
  406990:	41 0f 9d c0          	setge  r8b
  406994:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  40699b:	31 c9                	xor    ecx,ecx
  40699d:	be 30 00 00 00       	mov    esi,0x30
  4069a2:	44 88 85 28 ff ff ff 	mov    BYTE PTR [rbp-0xd8],r8b
  4069a9:	e8 12 eb ff ff       	call   0x4054c0
  4069ae:	44 0f b6 85 28 ff ff 	movzx  r8d,BYTE PTR [rbp-0xd8]
  4069b5:	ff 
  4069b6:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  4069bd:	f6 02 20             	test   BYTE PTR [rdx],0x20
  4069c0:	75 22                	jne    0x4069e4
  4069c2:	48 8b b5 00 ff ff ff 	mov    rsi,QWORD PTR [rbp-0x100]
  4069c9:	48 8b bd e0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x120]
  4069d0:	44 88 85 28 ff ff ff 	mov    BYTE PTR [rbp-0xd8],r8b
  4069d7:	e8 54 e5 ff ff       	call   0x404f30
  4069dc:	44 0f b6 85 28 ff ff 	movzx  r8d,BYTE PTR [rbp-0xd8]
  4069e3:	ff 
  4069e4:	41 81 f5 00 20 00 00 	xor    r13d,0x2000
  4069eb:	41 81 e5 00 20 01 00 	and    r13d,0x12000
  4069f2:	75 1f                	jne    0x406a13
  4069f4:	45 84 c0             	test   r8b,r8b
  4069f7:	75 1a                	jne    0x406a13
  4069f9:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4069ff:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  406a06:	44 89 f1             	mov    ecx,r14d
  406a09:	be 20 00 00 00       	mov    esi,0x20
  406a0e:	e8 ad ea ff ff       	call   0x4054c0
  406a13:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [rbp-0xc8]
  406a19:	48 8b a5 c0 fe ff ff 	mov    rsp,QWORD PTR [rbp-0x140]
  406a20:	41 39 c6             	cmp    r14d,eax
  406a23:	41 0f 4d c6          	cmovge eax,r14d
  406a27:	41 89 c0             	mov    r8d,eax
  406a2a:	e9 52 ec ff ff       	jmp    0x405681
  406a2f:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  406a36:	44 89 f1             	mov    ecx,r14d
  406a39:	be 20 00 00 00       	mov    esi,0x20
  406a3e:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
  406a45:	e8 76 ea ff ff       	call   0x4054c0
  406a4a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  406a51:	f6 00 20             	test   BYTE PTR [rax],0x20
  406a54:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  406a5b:	0f 85 14 ff ff ff    	jne    0x406975
  406a61:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  406a68:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
  406a6f:	48 89 c6             	mov    rsi,rax
  406a72:	e8 b9 e4 ff ff       	call   0x404f30
  406a77:	44 3b b5 38 ff ff ff 	cmp    r14d,DWORD PTR [rbp-0xc8]
  406a7e:	44 89 e8             	mov    eax,r13d
  406a81:	41 0f 9d c0          	setge  r8b
  406a85:	35 00 00 01 00       	xor    eax,0x10000
  406a8a:	a9 00 20 01 00       	test   eax,0x12000
  406a8f:	75 22                	jne    0x406ab3
  406a91:	45 84 c0             	test   r8b,r8b
  406a94:	75 1d                	jne    0x406ab3
  406a96:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  406a9c:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  406aa3:	44 89 f1             	mov    ecx,r14d
  406aa6:	be 30 00 00 00       	mov    esi,0x30
  406aab:	e8 10 ea ff ff       	call   0x4054c0
  406ab0:	45 31 c0             	xor    r8d,r8d
  406ab3:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  406aba:	f6 02 20             	test   BYTE PTR [rdx],0x20
  406abd:	75 6a                	jne    0x406b29
  406abf:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
  406ac6:	4c 89 e7             	mov    rdi,r12
  406ac9:	44 88 85 d0 fe ff ff 	mov    BYTE PTR [rbp-0x130],r8b
  406ad0:	e8 5b e4 ff ff       	call   0x404f30
  406ad5:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  406adb:	2b 95 10 ff ff ff    	sub    edx,DWORD PTR [rbp-0xf0]
  406ae1:	85 d2                	test   edx,edx
  406ae3:	44 0f b6 85 d0 fe ff 	movzx  r8d,BYTE PTR [rbp-0x130]
  406aea:	ff 
  406aeb:	0f 8e c5 fe ff ff    	jle    0x4069b6
  406af1:	e9 9e fe ff ff       	jmp    0x406994
  406af6:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  406afd:	f6 07 20             	test   BYTE PTR [rdi],0x20
  406b00:	0f 84 5b ff ff ff    	je     0x406a61
  406b06:	44 3b b5 38 ff ff ff 	cmp    r14d,DWORD PTR [rbp-0xc8]
  406b0d:	44 89 e8             	mov    eax,r13d
  406b10:	41 0f 9d c0          	setge  r8b
  406b14:	35 00 00 01 00       	xor    eax,0x10000
  406b19:	a9 00 20 01 00       	test   eax,0x12000
  406b1e:	75 09                	jne    0x406b29
  406b20:	45 84 c0             	test   r8b,r8b
  406b23:	0f 84 6d ff ff ff    	je     0x406a96
  406b29:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  406b2f:	2b 95 10 ff ff ff    	sub    edx,DWORD PTR [rbp-0xf0]
  406b35:	85 d2                	test   edx,edx
  406b37:	0f 8e a7 fe ff ff    	jle    0x4069e4
  406b3d:	e9 52 fe ff ff       	jmp    0x406994
  406b42:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x10
  406b49:	10 00 00 00 
  406b4d:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x4
  406b54:	04 00 00 00 
  406b58:	c6 85 a4 fe ff ff 01 	mov    BYTE PTR [rbp-0x15c],0x1
  406b5f:	c7 85 28 ff ff ff 06 	mov    DWORD PTR [rbp-0xd8],0x6
  406b66:	00 00 00 
  406b69:	e9 9e fa ff ff       	jmp    0x40660c
  406b6e:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x10
  406b75:	10 00 00 00 
  406b79:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x4
  406b80:	04 00 00 00 
  406b84:	c6 85 a4 fe ff ff 01 	mov    BYTE PTR [rbp-0x15c],0x1
  406b8b:	c7 85 28 ff ff ff 06 	mov    DWORD PTR [rbp-0xd8],0x6
  406b92:	00 00 00 
  406b95:	e9 87 fa ff ff       	jmp    0x406621
  406b9a:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  406b9f:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406ba6:	00 00 00 00 
  406baa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406bb1:	00 00 00 00 
  406bb5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406bbc:	00 00 00 00 
  406bc0:	8b 37                	mov    esi,DWORD PTR [rdi]
  406bc2:	89 d2                	mov    edx,edx
  406bc4:	48 83 ef 04          	sub    rdi,0x4
  406bc8:	48 d3 e6             	shl    rsi,cl
  406bcb:	48 01 d6             	add    rsi,rdx
  406bce:	48 89 f2             	mov    rdx,rsi
  406bd1:	48 c1 ea 09          	shr    rdx,0x9
  406bd5:	48 89 d0             	mov    rax,rdx
  406bd8:	49 f7 e1             	mul    r9
  406bdb:	48 c1 ea 0b          	shr    rdx,0xb
  406bdf:	48 69 c2 00 ca 9a 3b 	imul   rax,rdx,0x3b9aca00
  406be6:	48 29 c6             	sub    rsi,rax
  406be9:	89 77 04             	mov    DWORD PTR [rdi+0x4],esi
  406bec:	4c 39 df             	cmp    rdi,r11
  406bef:	73 cf                	jae    0x406bc0
  406bf1:	85 d2                	test   edx,edx
  406bf3:	74 0f                	je     0x406c04
  406bf5:	41 89 53 fc          	mov    DWORD PTR [r11-0x4],edx
  406bf9:	49 83 eb 04          	sub    r11,0x4
  406bfd:	eb 05                	jmp    0x406c04
  406bff:	90                   	nop
  406c00:	49 83 ee 04          	sub    r14,0x4
  406c04:	4d 39 f3             	cmp    r11,r14
  406c07:	73 08                	jae    0x406c11
  406c09:	41 8b 76 fc          	mov    esi,DWORD PTR [r14-0x4]
  406c0d:	85 f6                	test   esi,esi
  406c0f:	74 ef                	je     0x406c00
  406c11:	41 29 ca             	sub    r10d,ecx
  406c14:	b8 01 00 00 00       	mov    eax,0x1
  406c19:	45 85 d2             	test   r10d,r10d
  406c1c:	7e 14                	jle    0x406c32
  406c1e:	b9 1d 00 00 00       	mov    ecx,0x1d
  406c23:	49 8d 7e fc          	lea    rdi,[r14-0x4]
  406c27:	41 39 ca             	cmp    r10d,ecx
  406c2a:	41 0f 4e ca          	cmovle ecx,r10d
  406c2e:	31 d2                	xor    edx,edx
  406c30:	eb ba                	jmp    0x406bec
  406c32:	84 c0                	test   al,al
  406c34:	0f 84 b0 00 00 00    	je     0x406cea
  406c3a:	44 89 95 4c ff ff ff 	mov    DWORD PTR [rbp-0xb4],r10d
  406c41:	44 89 95 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r10d
  406c48:	e9 9d 00 00 00       	jmp    0x406cea
  406c4d:	8b 8d 00 ff ff ff    	mov    ecx,DWORD PTR [rbp-0x100]
  406c53:	44 89 85 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r8d
  406c5a:	f7 d9                	neg    ecx
  406c5c:	e9 b0 00 00 00       	jmp    0x406d11
  406c61:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  406c68:	00 00 
  406c6a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406c71:	00 00 00 00 
  406c75:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406c7c:	00 00 00 00 
  406c80:	8b 10                	mov    edx,DWORD PTR [rax]
  406c82:	48 83 c0 04          	add    rax,0x4
  406c86:	89 d6                	mov    esi,edx
  406c88:	44 21 ca             	and    edx,r9d
  406c8b:	d3 ee                	shr    esi,cl
  406c8d:	01 fe                	add    esi,edi
  406c8f:	89 d7                	mov    edi,edx
  406c91:	89 70 fc             	mov    DWORD PTR [rax-0x4],esi
  406c94:	41 0f af fa          	imul   edi,r10d
  406c98:	4c 39 f0             	cmp    rax,r14
  406c9b:	72 e3                	jb     0x406c80
  406c9d:	41 8b 13             	mov    edx,DWORD PTR [r11]
  406ca0:	49 8d 43 04          	lea    rax,[r11+0x4]
  406ca4:	85 d2                	test   edx,edx
  406ca6:	4c 0f 44 d8          	cmove  r11,rax
  406caa:	85 ff                	test   edi,edi
  406cac:	74 07                	je     0x406cb5
  406cae:	41 89 3e             	mov    DWORD PTR [r14],edi
  406cb1:	49 83 c6 04          	add    r14,0x4
  406cb5:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
  406cbc:	83 bd e0 fe ff ff 66 	cmp    DWORD PTR [rbp-0x120],0x66
  406cc3:	4c 89 f2             	mov    rdx,r14
  406cc6:	c6 85 23 ff ff ff 01 	mov    BYTE PTR [rbp-0xdd],0x1
  406ccd:	49 0f 45 c3          	cmovne rax,r11
  406cd1:	48 29 c2             	sub    rdx,rax
  406cd4:	48 03 85 a8 fe ff ff 	add    rax,QWORD PTR [rbp-0x158]
  406cdb:	48 c1 fa 02          	sar    rdx,0x2
  406cdf:	48 3b 95 b0 fe ff ff 	cmp    rdx,QWORD PTR [rbp-0x150]
  406ce6:	4c 0f 4f f0          	cmovg  r14,rax
  406cea:	8b 85 00 ff ff ff    	mov    eax,DWORD PTR [rbp-0x100]
  406cf0:	85 c0                	test   eax,eax
  406cf2:	79 3d                	jns    0x406d31
  406cf4:	8b 85 00 ff ff ff    	mov    eax,DWORD PTR [rbp-0x100]
  406cfa:	83 f8 f7             	cmp    eax,0xfffffff7
  406cfd:	0f 8d 4a ff ff ff    	jge    0x406c4d
  406d03:	83 c0 09             	add    eax,0x9
  406d06:	b9 09 00 00 00       	mov    ecx,0x9
  406d0b:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
  406d11:	41 b9 01 00 00 00    	mov    r9d,0x1
  406d17:	41 ba 00 ca 9a 3b    	mov    r10d,0x3b9aca00
  406d1d:	31 ff                	xor    edi,edi
  406d1f:	4c 89 d8             	mov    rax,r11
  406d22:	41 d3 e1             	shl    r9d,cl
  406d25:	41 d3 fa             	sar    r10d,cl
  406d28:	41 83 e9 01          	sub    r9d,0x1
  406d2c:	e9 67 ff ff ff       	jmp    0x406c98
  406d31:	80 bd 23 ff ff ff 00 	cmp    BYTE PTR [rbp-0xdd],0x0
  406d38:	74 0c                	je     0x406d46
  406d3a:	8b 85 00 ff ff ff    	mov    eax,DWORD PTR [rbp-0x100]
  406d40:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
  406d46:	4d 39 f3             	cmp    r11,r14
  406d49:	0f 83 aa 00 00 00    	jae    0x406df9
  406d4f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
  406d56:	83 bd e0 fe ff ff 66 	cmp    DWORD PTR [rbp-0x120],0x66
  406d5d:	0f 95 c1             	setne  cl
  406d60:	41 8b 13             	mov    edx,DWORD PTR [r11]
  406d63:	4c 29 d8             	sub    rax,r11
  406d66:	48 c1 f8 02          	sar    rax,0x2
  406d6a:	8d 34 c0             	lea    esi,[rax+rax*8]
  406d6d:	b8 0a 00 00 00       	mov    eax,0xa
  406d72:	eb 08                	jmp    0x406d7c
  406d74:	8d 04 80             	lea    eax,[rax+rax*4]
  406d77:	83 c6 01             	add    esi,0x1
  406d7a:	01 c0                	add    eax,eax
  406d7c:	39 c2                	cmp    edx,eax
  406d7e:	73 f4                	jae    0x406d74
  406d80:	31 d2                	xor    edx,edx
  406d82:	84 c9                	test   cl,cl
  406d84:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  406d8a:	0f 45 d6             	cmovne edx,esi
  406d8d:	29 d0                	sub    eax,edx
  406d8f:	31 d2                	xor    edx,edx
  406d91:	83 bd e0 fe ff ff 67 	cmp    DWORD PTR [rbp-0x120],0x67
  406d98:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
  406d9f:	0f 94 c2             	sete   dl
  406da2:	23 95 a4 fe ff ff    	and    edx,DWORD PTR [rbp-0x15c]
  406da8:	29 d0                	sub    eax,edx
  406daa:	4c 89 f2             	mov    rdx,r14
  406dad:	48 29 fa             	sub    rdx,rdi
  406db0:	48 63 c8             	movsxd rcx,eax
  406db3:	48 c1 fa 02          	sar    rdx,0x2
  406db7:	48 8d 54 d2 f7       	lea    rdx,[rdx+rdx*8-0x9]
  406dbc:	48 39 d1             	cmp    rcx,rdx
  406dbf:	0f 8d 9f 01 00 00    	jge    0x406f64
  406dc5:	05 00 40 02 00       	add    eax,0x24000
  406dca:	48 63 d0             	movsxd rdx,eax
  406dcd:	89 c1                	mov    ecx,eax
  406dcf:	48 69 d2 39 8e e3 38 	imul   rdx,rdx,0x38e38e39
  406dd6:	c1 f9 1f             	sar    ecx,0x1f
  406dd9:	48 c1 fa 21          	sar    rdx,0x21
  406ddd:	29 ca                	sub    edx,ecx
  406ddf:	48 63 ca             	movsxd rcx,edx
  406de2:	8d 14 d2             	lea    edx,[rdx+rdx*8]
  406de5:	29 d0                	sub    eax,edx
  406de7:	48 8d 8c 8f 04 00 ff 	lea    rcx,[rdi+rcx*4-0xfffc]
  406dee:	ff 
  406def:	bf 0a 00 00 00       	mov    edi,0xa
  406df4:	83 c0 01             	add    eax,0x1
  406df7:	eb 14                	jmp    0x406e0d
  406df9:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  406dff:	44 89 e6             	mov    esi,r12d
  406e02:	eb 8b                	jmp    0x406d8f
  406e04:	8d 14 bf             	lea    edx,[rdi+rdi*4]
  406e07:	83 c0 01             	add    eax,0x1
  406e0a:	8d 3c 12             	lea    edi,[rdx+rdx*1]
  406e0d:	83 f8 09             	cmp    eax,0x9
  406e10:	75 f2                	jne    0x406e04
  406e12:	44 8b 09             	mov    r9d,DWORD PTR [rcx]
  406e15:	31 d2                	xor    edx,edx
  406e17:	44 89 c8             	mov    eax,r9d
  406e1a:	f7 f7                	div    edi
  406e1c:	41 89 d0             	mov    r8d,edx
  406e1f:	85 d2                	test   edx,edx
  406e21:	75 3a                	jne    0x406e5d
  406e23:	48 8d 51 04          	lea    rdx,[rcx+0x4]
  406e27:	49 39 d6             	cmp    r14,rdx
  406e2a:	0f 84 89 00 00 00    	je     0x406eb9
  406e30:	a8 01                	test   al,0x1
  406e32:	0f 85 a2 00 00 00    	jne    0x406eda
  406e38:	49 39 cb             	cmp    r11,rcx
  406e3b:	73 12                	jae    0x406e4f
  406e3d:	81 ff 00 ca 9a 3b    	cmp    edi,0x3b9aca00
  406e43:	75 0a                	jne    0x406e4f
  406e45:	f6 41 fc 01          	test   BYTE PTR [rcx-0x4],0x1
  406e49:	0f 85 8b 00 00 00    	jne    0x406eda
  406e4f:	d9 05 7b 62 00 00    	fld    DWORD PTR [rip+0x627b]        # 0x40d0d0
  406e55:	d9 05 79 62 00 00    	fld    DWORD PTR [rip+0x6279]        # 0x40d0d4
  406e5b:	eb 2e                	jmp    0x406e8b
  406e5d:	a8 01                	test   al,0x1
  406e5f:	75 13                	jne    0x406e74
  406e61:	81 ff 00 ca 9a 3b    	cmp    edi,0x3b9aca00
  406e67:	75 5c                	jne    0x406ec5
  406e69:	49 39 cb             	cmp    r11,rcx
  406e6c:	73 57                	jae    0x406ec5
  406e6e:	f6 41 fc 01          	test   BYTE PTR [rcx-0x4],0x1
  406e72:	74 51                	je     0x406ec5
  406e74:	db 2d 06 5f 00 00    	fld    TBYTE PTR [rip+0x5f06]        # 0x40cd80
  406e7a:	89 f8                	mov    eax,edi
  406e7c:	d1 f8                	sar    eax,1
  406e7e:	41 39 c0             	cmp    r8d,eax
  406e81:	72 5d                	jb     0x406ee0
  406e83:	74 48                	je     0x406ecd
  406e85:	d9 05 4d 62 00 00    	fld    DWORD PTR [rip+0x624d]        # 0x40d0d8
  406e8b:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  406e91:	85 c0                	test   eax,eax
  406e93:	74 0c                	je     0x406ea1
  406e95:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  406e9c:	80 38 2d             	cmp    BYTE PTR [rax],0x2d
  406e9f:	74 47                	je     0x406ee8
  406ea1:	d8 c1                	fadd   st,st(1)
  406ea3:	d9 c9                	fxch   st(1)
  406ea5:	44 89 c8             	mov    eax,r9d
  406ea8:	44 29 c0             	sub    eax,r8d
  406eab:	df e9                	fucomip st,st(1)
  406ead:	dd d8                	fstp   st(0)
  406eaf:	7a 41                	jp     0x406ef2
  406eb1:	75 3f                	jne    0x406ef2
  406eb3:	89 01                	mov    DWORD PTR [rcx],eax
  406eb5:	48 8d 51 04          	lea    rdx,[rcx+0x4]
  406eb9:	49 39 d6             	cmp    r14,rdx
  406ebc:	4c 0f 47 f2          	cmova  r14,rdx
  406ec0:	e9 9f 00 00 00       	jmp    0x406f64
  406ec5:	d9 05 05 62 00 00    	fld    DWORD PTR [rip+0x6205]        # 0x40d0d0
  406ecb:	eb ad                	jmp    0x406e7a
  406ecd:	48 8d 41 04          	lea    rax,[rcx+0x4]
  406ed1:	49 39 c6             	cmp    r14,rax
  406ed4:	75 af                	jne    0x406e85
  406ed6:	d9 e8                	fld1
  406ed8:	eb b1                	jmp    0x406e8b
  406eda:	db 2d a0 5e 00 00    	fld    TBYTE PTR [rip+0x5ea0]        # 0x40cd80
  406ee0:	d9 05 ee 61 00 00    	fld    DWORD PTR [rip+0x61ee]        # 0x40d0d4
  406ee6:	eb a3                	jmp    0x406e8b
  406ee8:	d9 c9                	fxch   st(1)
  406eea:	d9 e0                	fchs
  406eec:	d9 c9                	fxch   st(1)
  406eee:	d9 e0                	fchs
  406ef0:	eb af                	jmp    0x406ea1
  406ef2:	01 f8                	add    eax,edi
  406ef4:	89 01                	mov    DWORD PTR [rcx],eax
  406ef6:	eb 03                	jmp    0x406efb
  406ef8:	83 01 01             	add    DWORD PTR [rcx],0x1
  406efb:	81 39 ff c9 9a 3b    	cmp    DWORD PTR [rcx],0x3b9ac9ff
  406f01:	76 1e                	jbe    0x406f21
  406f03:	48 83 e9 04          	sub    rcx,0x4
  406f07:	c7 41 04 00 00 00 00 	mov    DWORD PTR [rcx+0x4],0x0
  406f0e:	4c 39 d9             	cmp    rcx,r11
  406f11:	73 e5                	jae    0x406ef8
  406f13:	41 c7 43 fc 00 00 00 	mov    DWORD PTR [r11-0x4],0x0
  406f1a:	00 
  406f1b:	49 83 eb 04          	sub    r11,0x4
  406f1f:	eb d7                	jmp    0x406ef8
  406f21:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
  406f28:	41 8b 13             	mov    edx,DWORD PTR [r11]
  406f2b:	4c 29 d8             	sub    rax,r11
  406f2e:	48 c1 f8 02          	sar    rax,0x2
  406f32:	8d 34 c0             	lea    esi,[rax+rax*8]
  406f35:	b8 0a 00 00 00       	mov    eax,0xa
  406f3a:	eb 08                	jmp    0x406f44
  406f3c:	8d 04 80             	lea    eax,[rax+rax*4]
  406f3f:	83 c6 01             	add    esi,0x1
  406f42:	01 c0                	add    eax,eax
  406f44:	39 c2                	cmp    edx,eax
  406f46:	73 f4                	jae    0x406f3c
  406f48:	48 8d 51 04          	lea    rdx,[rcx+0x4]
  406f4c:	e9 68 ff ff ff       	jmp    0x406eb9
  406f51:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  406f55:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  406f5c:	00 00 00 00 
  406f60:	49 83 ee 04          	sub    r14,0x4
  406f64:	4d 39 f3             	cmp    r11,r14
  406f67:	73 09                	jae    0x406f72
  406f69:	45 8b 56 fc          	mov    r10d,DWORD PTR [r14-0x4]
  406f6d:	45 85 d2             	test   r10d,r10d
  406f70:	74 ee                	je     0x406f60
  406f72:	83 bd e0 fe ff ff 67 	cmp    DWORD PTR [rbp-0x120],0x67
  406f79:	74 41                	je     0x406fbc
  406f7b:	44 8b 85 28 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xd8]
  406f82:	45 85 c0             	test   r8d,r8d
  406f85:	0f 85 1a 01 00 00    	jne    0x4070a5
  406f8b:	41 f6 c5 08          	test   r13b,0x8
  406f8f:	0f 84 20 02 00 00    	je     0x4071b5
  406f95:	83 bd e0 fe ff ff 66 	cmp    DWORD PTR [rbp-0x120],0x66
  406f9c:	0f 85 7e 02 00 00    	jne    0x407220
  406fa2:	81 fe fd ff ff 7f    	cmp    esi,0x7ffffffd
  406fa8:	7f 7b                	jg     0x407025
  406faa:	bf 02 00 00 00       	mov    edi,0x2
  406faf:	85 f6                	test   esi,esi
  406fb1:	0f 8f de 01 00 00    	jg     0x407195
  406fb7:	e9 23 03 00 00       	jmp    0x4072df
  406fbc:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  406fc2:	bf 01 00 00 00       	mov    edi,0x1
  406fc7:	85 c0                	test   eax,eax
  406fc9:	0f 4f f8             	cmovg  edi,eax
  406fcc:	44 89 e8             	mov    eax,r13d
  406fcf:	83 e0 08             	and    eax,0x8
  406fd2:	39 f7                	cmp    edi,esi
  406fd4:	7e 5b                	jle    0x407031
  406fd6:	83 fe fc             	cmp    esi,0xfffffffc
  406fd9:	7c 56                	jl     0x407031
  406fdb:	8d 56 01             	lea    edx,[rsi+0x1]
  406fde:	83 ad 10 ff ff ff 01 	sub    DWORD PTR [rbp-0xf0],0x1
  406fe5:	29 d7                	sub    edi,edx
  406fe7:	89 bd 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edi
  406fed:	85 c0                	test   eax,eax
  406fef:	0f 84 06 01 00 00    	je     0x4070fb
  406ff5:	44 8b 8d 28 ff ff ff 	mov    r9d,DWORD PTR [rbp-0xd8]
  406ffc:	45 85 c9             	test   r9d,r9d
  406fff:	0f 85 a0 00 00 00    	jne    0x4070a5
  407005:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  40700b:	83 c8 20             	or     eax,0x20
  40700e:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  407014:	83 f8 66             	cmp    eax,0x66
  407017:	0f 85 03 02 00 00    	jne    0x407220
  40701d:	81 fe fe ff ff 7f    	cmp    esi,0x7ffffffe
  407023:	75 85                	jne    0x406faa
  407025:	48 8b a5 c0 fe ff ff 	mov    rsp,QWORD PTR [rbp-0x140]
  40702c:	e9 73 e9 ff ff       	jmp    0x4059a4
  407031:	8d 4f ff             	lea    ecx,[rdi-0x1]
  407034:	83 ad 10 ff ff ff 02 	sub    DWORD PTR [rbp-0xf0],0x2
  40703b:	89 8d 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],ecx
  407041:	85 c0                	test   eax,eax
  407043:	0f 85 c6 0c 00 00    	jne    0x407d0f
  407049:	4d 39 f3             	cmp    r11,r14
  40704c:	73 0d                	jae    0x40705b
  40704e:	45 8b 46 fc          	mov    r8d,DWORD PTR [r14-0x4]
  407052:	45 85 c0             	test   r8d,r8d
  407055:	0f 85 b3 00 00 00    	jne    0x40710e
  40705b:	bf 09 00 00 00       	mov    edi,0x9
  407060:	4c 89 f0             	mov    rax,r14
  407063:	48 2b 85 d8 fe ff ff 	sub    rax,QWORD PTR [rbp-0x128]
  40706a:	48 63 d6             	movsxd rdx,esi
  40706d:	48 63 ff             	movsxd rdi,edi
  407070:	48 c1 f8 02          	sar    rax,0x2
  407074:	48 8d 44 c0 f7       	lea    rax,[rax+rax*8-0x9]
  407079:	48 01 d0             	add    rax,rdx
  40707c:	ba 00 00 00 00       	mov    edx,0x0
  407081:	48 29 f8             	sub    rax,rdi
  407084:	48 0f 48 c2          	cmovs  rax,rdx
  407088:	48 63 95 28 ff ff ff 	movsxd rdx,DWORD PTR [rbp-0xd8]
  40708f:	48 39 d0             	cmp    rax,rdx
  407092:	48 0f 4f c2          	cmovg  rax,rdx
  407096:	48 85 c0             	test   rax,rax
  407099:	0f 84 07 01 00 00    	je     0x4071a6
  40709f:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  4070a5:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  4070ab:	3d fd ff ff 7f       	cmp    eax,0x7ffffffd
  4070b0:	0f 8f 6f ff ff ff    	jg     0x407025
  4070b6:	8b 8d 10 ff ff ff    	mov    ecx,DWORD PTR [rbp-0xf0]
  4070bc:	8d 78 02             	lea    edi,[rax+0x2]
  4070bf:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4070c4:	29 f8                	sub    eax,edi
  4070c6:	83 c9 20             	or     ecx,0x20
  4070c9:	41 89 c1             	mov    r9d,eax
  4070cc:	89 8d e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],ecx
  4070d2:	83 f9 66             	cmp    ecx,0x66
  4070d5:	0f 85 f5 00 00 00    	jne    0x4071d0
  4070db:	44 39 ce             	cmp    esi,r9d
  4070de:	0f 8f 41 ff ff ff    	jg     0x407025
  4070e4:	c7 85 e0 fe ff ff 66 	mov    DWORD PTR [rbp-0x120],0x66
  4070eb:	00 00 00 
  4070ee:	85 f6                	test   esi,esi
  4070f0:	0f 8f 9f 00 00 00    	jg     0x407195
  4070f6:	e9 d1 01 00 00       	jmp    0x4072cc
  4070fb:	bf 09 00 00 00       	mov    edi,0x9
  407100:	4d 39 f3             	cmp    r11,r14
  407103:	73 26                	jae    0x40712b
  407105:	45 8b 46 fc          	mov    r8d,DWORD PTR [r14-0x4]
  407109:	45 85 c0             	test   r8d,r8d
  40710c:	74 1d                	je     0x40712b
  40710e:	44 89 e7             	mov    edi,r12d
  407111:	b9 0a 00 00 00       	mov    ecx,0xa
  407116:	44 89 c0             	mov    eax,r8d
  407119:	31 d2                	xor    edx,edx
  40711b:	f7 f1                	div    ecx
  40711d:	85 d2                	test   edx,edx
  40711f:	75 0a                	jne    0x40712b
  407121:	8d 0c 89             	lea    ecx,[rcx+rcx*4]
  407124:	83 c7 01             	add    edi,0x1
  407127:	01 c9                	add    ecx,ecx
  407129:	eb eb                	jmp    0x407116
  40712b:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  407131:	83 c8 20             	or     eax,0x20
  407134:	83 f8 66             	cmp    eax,0x66
  407137:	0f 85 23 ff ff ff    	jne    0x407060
  40713d:	4c 89 f0             	mov    rax,r14
  407140:	48 2b 85 d8 fe ff ff 	sub    rax,QWORD PTR [rbp-0x128]
  407147:	48 63 d7             	movsxd rdx,edi
  40714a:	48 c1 f8 02          	sar    rax,0x2
  40714e:	48 83 e8 01          	sub    rax,0x1
  407152:	48 8d 04 c0          	lea    rax,[rax+rax*8]
  407156:	48 29 d0             	sub    rax,rdx
  407159:	ba 00 00 00 00       	mov    edx,0x0
  40715e:	48 0f 48 c2          	cmovs  rax,rdx
  407162:	48 63 95 28 ff ff ff 	movsxd rdx,DWORD PTR [rbp-0xd8]
  407169:	48 39 d0             	cmp    rax,rdx
  40716c:	48 0f 4f c2          	cmovg  rax,rdx
  407170:	48 85 c0             	test   rax,rax
  407173:	0f 85 83 00 00 00    	jne    0x4071fc
  407179:	bf 01 00 00 00       	mov    edi,0x1
  40717e:	81 fe fe ff ff 7f    	cmp    esi,0x7ffffffe
  407184:	0f 8f 9b fe ff ff    	jg     0x407025
  40718a:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  407191:	85 f6                	test   esi,esi
  407193:	7e 58                	jle    0x4071ed
  407195:	c7 85 e0 fe ff ff 66 	mov    DWORD PTR [rbp-0x120],0x66
  40719c:	00 00 00 
  40719f:	01 f7                	add    edi,esi
  4071a1:	e9 26 01 00 00       	jmp    0x4072cc
  4071a6:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  4071ac:	83 c8 20             	or     eax,0x20
  4071af:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  4071b5:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  4071bc:	bf 01 00 00 00       	mov    edi,0x1
  4071c1:	41 b9 fe ff ff 7f    	mov    r9d,0x7ffffffe
  4071c7:	83 bd e0 fe ff ff 66 	cmp    DWORD PTR [rbp-0x120],0x66
  4071ce:	74 ae                	je     0x40717e
  4071d0:	49 bc cd cc cc cc cc 	movabs r12,0xcccccccccccccccd
  4071d7:	cc cc cc 
  4071da:	89 f1                	mov    ecx,esi
  4071dc:	4c 8d 55 80          	lea    r10,[rbp-0x80]
  4071e0:	f7 d9                	neg    ecx
  4071e2:	4d 89 d0             	mov    r8,r10
  4071e5:	0f 48 ce             	cmovs  ecx,esi
  4071e8:	48 63 c9             	movsxd rcx,ecx
  4071eb:	eb 74                	jmp    0x407261
  4071ed:	c7 85 e0 fe ff ff 66 	mov    DWORD PTR [rbp-0x120],0x66
  4071f4:	00 00 00 
  4071f7:	e9 e3 00 00 00       	jmp    0x4072df
  4071fc:	48 3d fd ff ff 7f    	cmp    rax,0x7ffffffd
  407202:	0f 8f 1d fe ff ff    	jg     0x407025
  407208:	8d 78 02             	lea    edi,[rax+0x2]
  40720b:	89 85 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],eax
  407211:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  407216:	29 f8                	sub    eax,edi
  407218:	41 89 c1             	mov    r9d,eax
  40721b:	e9 bb fe ff ff       	jmp    0x4070db
  407220:	41 b9 fd ff ff 7f    	mov    r9d,0x7ffffffd
  407226:	bf 02 00 00 00       	mov    edi,0x2
  40722b:	eb a3                	jmp    0x4071d0
  40722d:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  407234:	00 
  407235:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40723c:	00 00 00 00 
  407240:	48 89 c8             	mov    rax,rcx
  407243:	49 83 e8 01          	sub    r8,0x1
  407247:	49 f7 e4             	mul    r12
  40724a:	48 c1 ea 03          	shr    rdx,0x3
  40724e:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  407252:	48 01 c0             	add    rax,rax
  407255:	48 29 c1             	sub    rcx,rax
  407258:	83 c1 30             	add    ecx,0x30
  40725b:	41 88 08             	mov    BYTE PTR [r8],cl
  40725e:	48 89 d1             	mov    rcx,rdx
  407261:	48 83 f9 09          	cmp    rcx,0x9
  407265:	77 d9                	ja     0x407240
  407267:	48 85 c9             	test   rcx,rcx
  40726a:	74 1d                	je     0x407289
  40726c:	83 c1 30             	add    ecx,0x30
  40726f:	49 83 e8 01          	sub    r8,0x1
  407273:	41 88 08             	mov    BYTE PTR [r8],cl
  407276:	eb 11                	jmp    0x407289
  407278:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40727f:	00 
  407280:	41 c6 40 ff 30       	mov    BYTE PTR [r8-0x1],0x30
  407285:	49 83 e8 01          	sub    r8,0x1
  407289:	4c 89 d0             	mov    rax,r10
  40728c:	4c 29 c0             	sub    rax,r8
  40728f:	48 83 f8 01          	cmp    rax,0x1
  407293:	7e eb                	jle    0x407280
  407295:	89 f0                	mov    eax,esi
  407297:	0f b6 b5 10 ff ff ff 	movzx  esi,BYTE PTR [rbp-0xf0]
  40729e:	c1 f8 1f             	sar    eax,0x1f
  4072a1:	83 e0 02             	and    eax,0x2
  4072a4:	41 88 70 fe          	mov    BYTE PTR [r8-0x2],sil
  4072a8:	83 c0 2b             	add    eax,0x2b
  4072ab:	41 88 40 ff          	mov    BYTE PTR [r8-0x1],al
  4072af:	49 8d 40 fe          	lea    rax,[r8-0x2]
  4072b3:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
  4072ba:	49 29 c2             	sub    r10,rax
  4072bd:	49 63 c1             	movsxd rax,r9d
  4072c0:	49 39 c2             	cmp    r10,rax
  4072c3:	0f 8f 5c fd ff ff    	jg     0x407025
  4072c9:	44 01 d7             	add    edi,r10d
  4072cc:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4072d1:	2b 85 d0 fe ff ff    	sub    eax,DWORD PTR [rbp-0x130]
  4072d7:	39 f8                	cmp    eax,edi
  4072d9:	0f 8c 46 fd ff ff    	jl     0x407025
  4072df:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  4072e5:	8d 0c 38             	lea    ecx,[rax+rdi*1]
  4072e8:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [rbp-0xc8]
  4072ee:	89 8d 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],ecx
  4072f4:	39 c1                	cmp    ecx,eax
  4072f6:	0f 9d 85 00 ff ff ff 	setge  BYTE PTR [rbp-0x100]
  4072fd:	41 f7 c5 00 20 01 00 	test   r13d,0x12000
  407304:	75 43                	jne    0x407349
  407306:	39 c1                	cmp    ecx,eax
  407308:	7c 12                	jl     0x40731c
  40730a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407311:	f6 00 20             	test   BYTE PTR [rax],0x20
  407314:	0f 85 a6 00 00 00    	jne    0x4073c0
  40731a:	eb 39                	jmp    0x407355
  40731c:	4c 8b a5 30 ff ff ff 	mov    r12,QWORD PTR [rbp-0xd0]
  407323:	89 c2                	mov    edx,eax
  407325:	be 20 00 00 00       	mov    esi,0x20
  40732a:	4c 89 9d b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],r11
  407331:	4c 89 e7             	mov    rdi,r12
  407334:	e8 87 e1 ff ff       	call   0x4054c0
  407339:	41 f6 04 24 20       	test   BYTE PTR [r12],0x20
  40733e:	4c 8b 9d b8 fe ff ff 	mov    r11,QWORD PTR [rbp-0x148]
  407345:	75 79                	jne    0x4073c0
  407347:	eb 0c                	jmp    0x407355
  407349:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407350:	f6 00 20             	test   BYTE PTR [rax],0x20
  407353:	75 28                	jne    0x40737d
  407355:	48 63 b5 d0 fe ff ff 	movsxd rsi,DWORD PTR [rbp-0x130]
  40735c:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  407363:	4c 89 9d b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],r11
  40736a:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
  407371:	e8 ba db ff ff       	call   0x404f30
  407376:	4c 8b 9d b8 fe ff ff 	mov    r11,QWORD PTR [rbp-0x148]
  40737d:	44 89 e8             	mov    eax,r13d
  407380:	35 00 00 01 00       	xor    eax,0x10000
  407385:	a9 00 20 01 00       	test   eax,0x12000
  40738a:	75 34                	jne    0x4073c0
  40738c:	80 bd 00 ff ff ff 00 	cmp    BYTE PTR [rbp-0x100],0x0
  407393:	75 2b                	jne    0x4073c0
  407395:	8b 8d 10 ff ff ff    	mov    ecx,DWORD PTR [rbp-0xf0]
  40739b:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4073a1:	be 30 00 00 00       	mov    esi,0x30
  4073a6:	4c 89 9d d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],r11
  4073ad:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4073b4:	e8 07 e1 ff ff       	call   0x4054c0
  4073b9:	4c 8b 9d d0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x130]
  4073c0:	83 bd e0 fe ff ff 66 	cmp    DWORD PTR [rbp-0x120],0x66
  4073c7:	74 1d                	je     0x4073e6
  4073c9:	49 8d 43 04          	lea    rax,[r11+0x4]
  4073cd:	4d 39 f3             	cmp    r11,r14
  4073d0:	4d 89 da             	mov    r10,r11
  4073d3:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  4073da:	cc cc cc 
  4073dd:	4c 0f 43 f0          	cmovae r14,rax
  4073e1:	e9 d7 03 00 00       	jmp    0x4077bd
  4073e6:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
  4073ed:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  4073f4:	cc cc cc 
  4073f7:	4c 39 d8             	cmp    rax,r11
  4073fa:	4c 0f 46 d8          	cmovbe r11,rax
  4073fe:	4d 89 da             	mov    r10,r11
  407401:	e9 c4 00 00 00       	jmp    0x4074ca
  407406:	0f 1f 00             	nop    DWORD PTR [rax]
  407409:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  407410:	00 00 00 00 
  407414:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40741b:	00 00 00 00 
  40741f:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  407426:	00 00 00 00 
  40742a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  407431:	00 00 00 00 
  407435:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40743c:	00 00 00 00 
  407440:	48 89 c8             	mov    rax,rcx
  407443:	48 83 ef 01          	sub    rdi,0x1
  407447:	49 f7 e0             	mul    r8
  40744a:	48 c1 ea 03          	shr    rdx,0x3
  40744e:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  407452:	48 01 c0             	add    rax,rax
  407455:	48 29 c1             	sub    rcx,rax
  407458:	83 c1 30             	add    ecx,0x30
  40745b:	88 0f                	mov    BYTE PTR [rdi],cl
  40745d:	48 89 d1             	mov    rcx,rdx
  407460:	48 83 f9 09          	cmp    rcx,0x9
  407464:	77 da                	ja     0x407440
  407466:	48 85 c9             	test   rcx,rcx
  407469:	74 09                	je     0x407474
  40746b:	83 c1 30             	add    ecx,0x30
  40746e:	48 83 ef 01          	sub    rdi,0x1
  407472:	88 0f                	mov    BYTE PTR [rdi],cl
  407474:	48 89 f8             	mov    rax,rdi
  407477:	4c 8d 65 a0          	lea    r12,[rbp-0x60]
  40747b:	4d 39 d3             	cmp    r11,r10
  40747e:	74 5f                	je     0x4074df
  407480:	40 f6 c7 01          	test   dil,0x1
  407484:	74 1a                	je     0x4074a0
  407486:	49 39 fc             	cmp    r12,rdi
  407489:	73 1a                	jae    0x4074a5
  40748b:	c6 47 ff 30          	mov    BYTE PTR [rdi-0x1],0x30
  40748f:	48 8d 47 ff          	lea    rax,[rdi-0x1]
  407493:	eb 0b                	jmp    0x4074a0
  407495:	c6 40 ff 30          	mov    BYTE PTR [rax-0x1],0x30
  407499:	48 83 e8 02          	sub    rax,0x2
  40749d:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4074a0:	49 39 c4             	cmp    r12,rax
  4074a3:	72 f0                	jb     0x407495
  4074a5:	4c 89 e0             	mov    rax,r12
  4074a8:	31 d2                	xor    edx,edx
  4074aa:	48 29 f8             	sub    rax,rdi
  4074ad:	4c 39 e7             	cmp    rdi,r12
  4074b0:	48 0f 42 c2          	cmovb  rax,rdx
  4074b4:	48 01 c7             	add    rdi,rax
  4074b7:	49 29 f9             	sub    r9,rdi
  4074ba:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  4074c1:	f6 00 20             	test   BYTE PTR [rax],0x20
  4074c4:	74 33                	je     0x4074f9
  4074c6:	49 83 c2 04          	add    r10,0x4
  4074ca:	4c 39 95 d8 fe ff ff 	cmp    QWORD PTR [rbp-0x128],r10
  4074d1:	72 59                	jb     0x40752c
  4074d3:	4c 8d 4d a9          	lea    r9,[rbp-0x57]
  4074d7:	41 8b 0a             	mov    ecx,DWORD PTR [r10]
  4074da:	4c 89 cf             	mov    rdi,r9
  4074dd:	eb 81                	jmp    0x407460
  4074df:	4c 39 cf             	cmp    rdi,r9
  4074e2:	74 05                	je     0x4074e9
  4074e4:	49 29 f9             	sub    r9,rdi
  4074e7:	eb d1                	jmp    0x4074ba
  4074e9:	c6 45 a8 30          	mov    BYTE PTR [rbp-0x58],0x30
  4074ed:	41 b9 01 00 00 00    	mov    r9d,0x1
  4074f3:	48 8d 7d a8          	lea    rdi,[rbp-0x58]
  4074f7:	eb c1                	jmp    0x4074ba
  4074f9:	48 89 c2             	mov    rdx,rax
  4074fc:	4c 89 ce             	mov    rsi,r9
  4074ff:	4c 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],r10
  407506:	4c 89 9d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],r11
  40750d:	e8 1e da ff ff       	call   0x404f30
  407512:	4c 8b 95 d0 fe ff ff 	mov    r10,QWORD PTR [rbp-0x130]
  407519:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
  407520:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  407527:	cc cc cc 
  40752a:	eb 9a                	jmp    0x4074c6
  40752c:	44 89 e8             	mov    eax,r13d
  40752f:	83 e0 08             	and    eax,0x8
  407532:	0b 85 28 ff ff ff    	or     eax,DWORD PTR [rbp-0xd8]
  407538:	0f 84 3e 04 00 00    	je     0x40797c
  40753e:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
  407545:	49 8d 53 fd          	lea    rdx,[r11-0x3]
  407549:	48 8d 47 04          	lea    rax,[rdi+0x4]
  40754d:	48 8d 4f 01          	lea    rcx,[rdi+0x1]
  407551:	4c 29 d8             	sub    rax,r11
  407554:	48 39 d1             	cmp    rcx,rdx
  407557:	ba 00 00 00 00       	mov    edx,0x0
  40755c:	48 0f 42 c2          	cmovb  rax,rdx
  407560:	49 01 c3             	add    r11,rax
  407563:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  40756a:	f6 00 20             	test   BYTE PTR [rax],0x20
  40756d:	74 0f                	je     0x40757e
  40756f:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  407576:	cc cc cc 
  407579:	e9 b9 00 00 00       	jmp    0x407637
  40757e:	48 89 c2             	mov    rdx,rax
  407581:	be 01 00 00 00       	mov    esi,0x1
  407586:	48 8d 3d 0f 3b 00 00 	lea    rdi,[rip+0x3b0f]        # 0x40b09c
  40758d:	4c 89 9d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],r11
  407594:	e8 97 d9 ff ff       	call   0x404f30
  407599:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
  4075a0:	eb cd                	jmp    0x40756f
  4075a2:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4075a9:	00 
  4075aa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4075b1:	00 00 00 00 
  4075b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4075bc:	00 00 00 00 
  4075c0:	48 89 c8             	mov    rax,rcx
  4075c3:	48 83 ee 01          	sub    rsi,0x1
  4075c7:	49 f7 e0             	mul    r8
  4075ca:	48 c1 ea 03          	shr    rdx,0x3
  4075ce:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4075d2:	48 01 c0             	add    rax,rax
  4075d5:	48 29 c1             	sub    rcx,rax
  4075d8:	83 c1 30             	add    ecx,0x30
  4075db:	88 0e                	mov    BYTE PTR [rsi],cl
  4075dd:	48 89 d1             	mov    rcx,rdx
  4075e0:	48 83 f9 09          	cmp    rcx,0x9
  4075e4:	77 da                	ja     0x4075c0
  4075e6:	48 85 c9             	test   rcx,rcx
  4075e9:	74 09                	je     0x4075f4
  4075eb:	83 c1 30             	add    ecx,0x30
  4075ee:	48 83 ee 01          	sub    rsi,0x1
  4075f2:	88 0e                	mov    BYTE PTR [rsi],cl
  4075f4:	48 89 f0             	mov    rax,rsi
  4075f7:	4c 8d 65 a0          	lea    r12,[rbp-0x60]
  4075fb:	40 f6 c6 01          	test   sil,0x1
  4075ff:	74 1a                	je     0x40761b
  407601:	49 39 f4             	cmp    r12,rsi
  407604:	73 1a                	jae    0x407620
  407606:	c6 46 ff 30          	mov    BYTE PTR [rsi-0x1],0x30
  40760a:	48 8d 46 ff          	lea    rax,[rsi-0x1]
  40760e:	eb 0b                	jmp    0x40761b
  407610:	c6 40 ff 30          	mov    BYTE PTR [rax-0x1],0x30
  407614:	48 83 e8 02          	sub    rax,0x2
  407618:	c6 00 30             	mov    BYTE PTR [rax],0x30
  40761b:	49 39 c4             	cmp    r12,rax
  40761e:	72 f0                	jb     0x407610
  407620:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407627:	f6 00 20             	test   BYTE PTR [rax],0x20
  40762a:	74 23                	je     0x40764f
  40762c:	83 ad 28 ff ff ff 09 	sub    DWORD PTR [rbp-0xd8],0x9
  407633:	49 83 c3 04          	add    r11,0x4
  407637:	4d 39 f3             	cmp    r11,r14
  40763a:	73 5e                	jae    0x40769a
  40763c:	8b bd 28 ff ff ff    	mov    edi,DWORD PTR [rbp-0xd8]
  407642:	85 ff                	test   edi,edi
  407644:	7e 54                	jle    0x40769a
  407646:	41 8b 0b             	mov    ecx,DWORD PTR [r11]
  407649:	48 8d 75 a9          	lea    rsi,[rbp-0x57]
  40764d:	eb 91                	jmp    0x4075e0
  40764f:	4c 89 e7             	mov    rdi,r12
  407652:	31 c0                	xor    eax,eax
  407654:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  40765b:	4c 89 9d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],r11
  407662:	48 29 f7             	sub    rdi,rsi
  407665:	4c 39 e6             	cmp    rsi,r12
  407668:	48 0f 42 f8          	cmovb  rdi,rax
  40766c:	b8 09 00 00 00       	mov    eax,0x9
  407671:	48 01 f7             	add    rdi,rsi
  407674:	8b b5 28 ff ff ff    	mov    esi,DWORD PTR [rbp-0xd8]
  40767a:	39 c6                	cmp    esi,eax
  40767c:	0f 4e c6             	cmovle eax,esi
  40767f:	48 63 f0             	movsxd rsi,eax
  407682:	e8 a9 d8 ff ff       	call   0x404f30
  407687:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
  40768e:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  407695:	cc cc cc 
  407698:	eb 92                	jmp    0x40762c
  40769a:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  4076a0:	83 c2 09             	add    edx,0x9
  4076a3:	83 fa 09             	cmp    edx,0x9
  4076a6:	0f 8e d0 02 00 00    	jle    0x40797c
  4076ac:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4076b3:	b9 09 00 00 00       	mov    ecx,0x9
  4076b8:	be 30 00 00 00       	mov    esi,0x30
  4076bd:	e8 fe dd ff ff       	call   0x4054c0
  4076c2:	e9 b5 02 00 00       	jmp    0x40797c
  4076c7:	66 90                	xchg   ax,ax
  4076c9:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4076d0:	00 00 00 00 
  4076d4:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4076db:	00 00 00 00 
  4076df:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4076e6:	00 00 00 00 
  4076ea:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4076f1:	00 00 00 00 
  4076f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4076fc:	00 00 00 00 
  407700:	48 89 c8             	mov    rax,rcx
  407703:	48 83 ef 01          	sub    rdi,0x1
  407707:	49 f7 e0             	mul    r8
  40770a:	48 c1 ea 03          	shr    rdx,0x3
  40770e:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  407712:	48 01 c0             	add    rax,rax
  407715:	48 29 c1             	sub    rcx,rax
  407718:	83 c1 30             	add    ecx,0x30
  40771b:	88 0f                	mov    BYTE PTR [rdi],cl
  40771d:	48 89 d1             	mov    rcx,rdx
  407720:	48 83 f9 09          	cmp    rcx,0x9
  407724:	77 da                	ja     0x407700
  407726:	48 85 c9             	test   rcx,rcx
  407729:	74 09                	je     0x407734
  40772b:	83 c1 30             	add    ecx,0x30
  40772e:	48 83 ef 01          	sub    rdi,0x1
  407732:	88 0f                	mov    BYTE PTR [rdi],cl
  407734:	4c 39 cf             	cmp    rdi,r9
  407737:	74 25                	je     0x40775e
  407739:	48 89 f8             	mov    rax,rdi
  40773c:	4c 8d 65 a0          	lea    r12,[rbp-0x60]
  407740:	4d 39 d3             	cmp    r11,r10
  407743:	0f 84 9a 00 00 00    	je     0x4077e3
  407749:	40 f6 c7 01          	test   dil,0x1
  40774d:	74 24                	je     0x407773
  40774f:	49 39 fc             	cmp    r12,rdi
  407752:	73 24                	jae    0x407778
  407754:	c6 47 ff 30          	mov    BYTE PTR [rdi-0x1],0x30
  407758:	48 8d 47 ff          	lea    rax,[rdi-0x1]
  40775c:	eb 15                	jmp    0x407773
  40775e:	c6 45 a8 30          	mov    BYTE PTR [rbp-0x58],0x30
  407762:	48 8d 7d a8          	lea    rdi,[rbp-0x58]
  407766:	eb d1                	jmp    0x407739
  407768:	c6 40 ff 30          	mov    BYTE PTR [rax-0x1],0x30
  40776c:	48 83 e8 02          	sub    rax,0x2
  407770:	c6 00 30             	mov    BYTE PTR [rax],0x30
  407773:	49 39 c4             	cmp    r12,rax
  407776:	72 f0                	jb     0x407768
  407778:	4c 89 e0             	mov    rax,r12
  40777b:	31 d2                	xor    edx,edx
  40777d:	48 29 f8             	sub    rax,rdi
  407780:	4c 39 e7             	cmp    rdi,r12
  407783:	44 8b a5 28 ff ff ff 	mov    r12d,DWORD PTR [rbp-0xd8]
  40778a:	48 0f 42 c2          	cmovb  rax,rdx
  40778e:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  407792:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407799:	8b 00                	mov    eax,DWORD PTR [rax]
  40779b:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  4077a1:	83 e0 20             	and    eax,0x20
  4077a4:	49 29 c9             	sub    r9,rcx
  4077a7:	85 c0                	test   eax,eax
  4077a9:	0f 84 5d 01 00 00    	je     0x40790c
  4077af:	45 29 cc             	sub    r12d,r9d
  4077b2:	49 83 c2 04          	add    r10,0x4
  4077b6:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  4077bd:	4d 39 f2             	cmp    r10,r14
  4077c0:	0f 83 9c 01 00 00    	jae    0x407962
  4077c6:	8b b5 28 ff ff ff    	mov    esi,DWORD PTR [rbp-0xd8]
  4077cc:	85 f6                	test   esi,esi
  4077ce:	0f 88 8e 01 00 00    	js     0x407962
  4077d4:	4c 8d 4d a9          	lea    r9,[rbp-0x57]
  4077d8:	41 8b 0a             	mov    ecx,DWORD PTR [r10]
  4077db:	4c 89 cf             	mov    rdi,r9
  4077de:	e9 3d ff ff ff       	jmp    0x407720
  4077e3:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  4077ea:	48 8d 4f 01          	lea    rcx,[rdi+0x1]
  4077ee:	f6 00 20             	test   BYTE PTR [rax],0x20
  4077f1:	74 1e                	je     0x407811
  4077f3:	44 8b a5 28 ff ff ff 	mov    r12d,DWORD PTR [rbp-0xd8]
  4077fa:	44 89 e8             	mov    eax,r13d
  4077fd:	83 e0 08             	and    eax,0x8
  407800:	44 09 e0             	or     eax,r12d
  407803:	0f 85 f3 00 00 00    	jne    0x4078fc
  407809:	49 29 c9             	sub    r9,rcx
  40780c:	45 31 e4             	xor    r12d,r12d
  40780f:	eb 9e                	jmp    0x4077af
  407811:	4c 8b a5 30 ff ff ff 	mov    r12,QWORD PTR [rbp-0xd0]
  407818:	be 01 00 00 00       	mov    esi,0x1
  40781d:	4c 89 8d b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],r9
  407824:	48 89 8d c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rcx
  40782b:	4c 89 e2             	mov    rdx,r12
  40782e:	4c 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],r10
  407835:	4c 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],r11
  40783c:	e8 ef d6 ff ff       	call   0x404f30
  407841:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
  407845:	44 89 ea             	mov    edx,r13d
  407848:	8b bd 28 ff ff ff    	mov    edi,DWORD PTR [rbp-0xd8]
  40784e:	83 e2 08             	and    edx,0x8
  407851:	4c 8b 9d d8 fe ff ff 	mov    r11,QWORD PTR [rbp-0x128]
  407858:	4c 8b 95 d0 fe ff ff 	mov    r10,QWORD PTR [rbp-0x130]
  40785f:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  407866:	cc cc cc 
  407869:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  40786f:	83 e0 20             	and    eax,0x20
  407872:	09 fa                	or     edx,edi
  407874:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
  40787b:	4c 8b 8d b8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x148]
  407882:	41 89 fc             	mov    r12d,edi
  407885:	74 7d                	je     0x407904
  407887:	85 c0                	test   eax,eax
  407889:	75 71                	jne    0x4078fc
  40788b:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  407892:	be 01 00 00 00       	mov    esi,0x1
  407897:	48 8d 3d fe 37 00 00 	lea    rdi,[rip+0x37fe]        # 0x40b09c
  40789e:	4c 89 8d b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],r9
  4078a5:	48 89 8d c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rcx
  4078ac:	4c 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],r10
  4078b3:	4c 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],r11
  4078ba:	e8 71 d6 ff ff       	call   0x404f30
  4078bf:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  4078c6:	4c 8b 9d d8 fe ff ff 	mov    r11,QWORD PTR [rbp-0x128]
  4078cd:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  4078d4:	cc cc cc 
  4078d7:	4c 8b 95 d0 fe ff ff 	mov    r10,QWORD PTR [rbp-0x130]
  4078de:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
  4078e5:	8b 00                	mov    eax,DWORD PTR [rax]
  4078e7:	4c 8b 8d b8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x148]
  4078ee:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  4078f4:	83 e0 20             	and    eax,0x20
  4078f7:	e9 a8 fe ff ff       	jmp    0x4077a4
  4078fc:	49 29 c9             	sub    r9,rcx
  4078ff:	e9 ab fe ff ff       	jmp    0x4077af
  407904:	45 31 e4             	xor    r12d,r12d
  407907:	e9 98 fe ff ff       	jmp    0x4077a4
  40790c:	48 63 b5 28 ff ff ff 	movsxd rsi,DWORD PTR [rbp-0xd8]
  407913:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  40791a:	48 89 cf             	mov    rdi,rcx
  40791d:	4c 89 95 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],r10
  407924:	4c 89 9d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],r11
  40792b:	4c 39 ce             	cmp    rsi,r9
  40792e:	4c 89 8d 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],r9
  407935:	49 0f 4f f1          	cmovg  rsi,r9
  407939:	e8 f2 d5 ff ff       	call   0x404f30
  40793e:	4c 8b 95 d8 fe ff ff 	mov    r10,QWORD PTR [rbp-0x128]
  407945:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
  40794c:	49 b8 cd cc cc cc cc 	movabs r8,0xcccccccccccccccd
  407953:	cc cc cc 
  407956:	4c 8b 8d 28 ff ff ff 	mov    r9,QWORD PTR [rbp-0xd8]
  40795d:	e9 4d fe ff ff       	jmp    0x4077af
  407962:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  407968:	83 c2 12             	add    edx,0x12
  40796b:	83 fa 12             	cmp    edx,0x12
  40796e:	7f 45                	jg     0x4079b5
  407970:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407977:	f6 00 20             	test   BYTE PTR [rax],0x20
  40797a:	74 51                	je     0x4079cd
  40797c:	41 81 f5 00 20 00 00 	xor    r13d,0x2000
  407983:	41 81 e5 00 20 01 00 	and    r13d,0x12000
  40798a:	75 09                	jne    0x407995
  40798c:	80 bd 00 ff ff ff 00 	cmp    BYTE PTR [rbp-0x100],0x0
  407993:	74 50                	je     0x4079e5
  407995:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  40799b:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  4079a2:	48 8b a5 c0 fe ff ff 	mov    rsp,QWORD PTR [rbp-0x140]
  4079a9:	44 39 c0             	cmp    eax,r8d
  4079ac:	44 0f 4d c0          	cmovge r8d,eax
  4079b0:	e9 cc dc ff ff       	jmp    0x405681
  4079b5:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4079bc:	b9 12 00 00 00       	mov    ecx,0x12
  4079c1:	be 30 00 00 00       	mov    esi,0x30
  4079c6:	e8 f5 da ff ff       	call   0x4054c0
  4079cb:	eb a3                	jmp    0x407970
  4079cd:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
  4079d4:	48 8d 75 80          	lea    rsi,[rbp-0x80]
  4079d8:	48 89 c2             	mov    rdx,rax
  4079db:	48 29 fe             	sub    rsi,rdi
  4079de:	e8 4d d5 ff ff       	call   0x404f30
  4079e3:	eb 97                	jmp    0x40797c
  4079e5:	8b 8d 10 ff ff ff    	mov    ecx,DWORD PTR [rbp-0xf0]
  4079eb:	8b 95 38 ff ff ff    	mov    edx,DWORD PTR [rbp-0xc8]
  4079f1:	be 20 00 00 00       	mov    esi,0x20
  4079f6:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  4079fd:	e8 be da ff ff       	call   0x4054c0
  407a02:	eb 91                	jmp    0x407995
  407a04:	8b bd 10 ff ff ff    	mov    edi,DWORD PTR [rbp-0xf0]
  407a0a:	48 8d 05 46 38 00 00 	lea    rax,[rip+0x3846]        # 0x40b257
  407a11:	44 8b 8d 10 ff ff ff 	mov    r9d,DWORD PTR [rbp-0xf0]
  407a18:	45 89 e2             	mov    r10d,r12d
  407a1b:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  407a22:	89 bd 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edi
  407a28:	e9 f1 e5 ff ff       	jmp    0x40601e
  407a2d:	48 8d 45 98          	lea    rax,[rbp-0x68]
  407a31:	4c 29 f0             	sub    rax,r14
  407a34:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  407a3b:	48 89 c7             	mov    rdi,rax
  407a3e:	48 63 85 28 ff ff ff 	movsxd rax,DWORD PTR [rbp-0xd8]
  407a45:	48 39 c7             	cmp    rdi,rax
  407a48:	7e 3c                	jle    0x407a86
  407a4a:	48 8d 05 06 38 00 00 	lea    rax,[rip+0x3806]        # 0x40b257
  407a51:	89 bd 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],edi
  407a57:	41 89 f9             	mov    r9d,edi
  407a5a:	45 89 e2             	mov    r10d,r12d
  407a5d:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  407a64:	e9 b5 e5 ff ff       	jmp    0x40601e
  407a69:	44 89 a5 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r12d
  407a70:	45 89 d1             	mov    r9d,r10d
  407a73:	4d 89 c6             	mov    r14,r8
  407a76:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  407a7d:	00 00 00 00 
  407a81:	e9 98 e5 ff ff       	jmp    0x40601e
  407a86:	44 8b 8d 28 ff ff ff 	mov    r9d,DWORD PTR [rbp-0xd8]
  407a8d:	e9 61 e6 ff ff       	jmp    0x4060f3
  407a92:	4c 8b a5 30 ff ff ff 	mov    r12,QWORD PTR [rbp-0xd0]
  407a99:	44 89 c9             	mov    ecx,r9d
  407a9c:	44 89 c2             	mov    edx,r8d
  407a9f:	be 20 00 00 00       	mov    esi,0x20
  407aa4:	44 89 95 d0 fe ff ff 	mov    DWORD PTR [rbp-0x130],r10d
  407aab:	4c 89 e7             	mov    rdi,r12
  407aae:	44 89 8d d8 fe ff ff 	mov    DWORD PTR [rbp-0x128],r9d
  407ab5:	44 89 85 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r8d
  407abc:	e8 ff d9 ff ff       	call   0x4054c0
  407ac1:	41 f6 04 24 20       	test   BYTE PTR [r12],0x20
  407ac6:	44 8b 85 00 ff ff ff 	mov    r8d,DWORD PTR [rbp-0x100]
  407acd:	44 8b 8d d8 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x128]
  407ad4:	44 8b 95 d0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x130]
  407adb:	0f 85 7c e5 ff ff    	jne    0x40605d
  407ae1:	eb 0c                	jmp    0x407aef
  407ae3:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407aea:	f6 00 20             	test   BYTE PTR [rax],0x20
  407aed:	75 32                	jne    0x407b21
  407aef:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  407af6:	48 8b bd e0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x120]
  407afd:	49 63 f2             	movsxd rsi,r10d
  407b00:	44 89 8d d8 fe ff ff 	mov    DWORD PTR [rbp-0x128],r9d
  407b07:	44 89 85 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r8d
  407b0e:	e8 1d d4 ff ff       	call   0x404f30
  407b13:	44 8b 85 00 ff ff ff 	mov    r8d,DWORD PTR [rbp-0x100]
  407b1a:	44 8b 8d d8 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x128]
  407b21:	44 39 8d 38 ff ff ff 	cmp    DWORD PTR [rbp-0xc8],r9d
  407b28:	44 89 e8             	mov    eax,r13d
  407b2b:	41 0f 9e c4          	setle  r12b
  407b2f:	35 00 00 01 00       	xor    eax,0x10000
  407b34:	a9 00 20 01 00       	test   eax,0x12000
  407b39:	75 38                	jne    0x407b73
  407b3b:	45 84 e4             	test   r12b,r12b
  407b3e:	75 33                	jne    0x407b73
  407b40:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  407b47:	44 89 c9             	mov    ecx,r9d
  407b4a:	44 89 c2             	mov    edx,r8d
  407b4d:	be 30 00 00 00       	mov    esi,0x30
  407b52:	44 89 8d 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r9d
  407b59:	44 89 85 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r8d
  407b60:	e8 5b d9 ff ff       	call   0x4054c0
  407b65:	44 8b 8d 00 ff ff ff 	mov    r9d,DWORD PTR [rbp-0x100]
  407b6c:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  407b73:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  407b7a:	89 c1                	mov    ecx,eax
  407b7c:	3b 85 28 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xd8]
  407b82:	7d 33                	jge    0x407bb7
  407b84:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  407b8a:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  407b91:	be 30 00 00 00       	mov    esi,0x30
  407b96:	44 89 8d 00 ff ff ff 	mov    DWORD PTR [rbp-0x100],r9d
  407b9d:	44 89 85 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r8d
  407ba4:	e8 17 d9 ff ff       	call   0x4054c0
  407ba9:	44 8b 8d 00 ff ff ff 	mov    r9d,DWORD PTR [rbp-0x100]
  407bb0:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  407bb7:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  407bbe:	f6 00 20             	test   BYTE PTR [rax],0x20
  407bc1:	74 47                	je     0x407c0a
  407bc3:	41 81 f5 00 20 00 00 	xor    r13d,0x2000
  407bca:	41 81 e5 00 20 01 00 	and    r13d,0x12000
  407bd1:	0f 85 aa da ff ff    	jne    0x405681
  407bd7:	45 84 e4             	test   r12b,r12b
  407bda:	0f 85 a1 da ff ff    	jne    0x405681
  407be0:	48 8b bd 30 ff ff ff 	mov    rdi,QWORD PTR [rbp-0xd0]
  407be7:	44 89 c2             	mov    edx,r8d
  407bea:	44 89 c9             	mov    ecx,r9d
  407bed:	be 20 00 00 00       	mov    esi,0x20
  407bf2:	44 89 85 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r8d
  407bf9:	e8 c2 d8 ff ff       	call   0x4054c0
  407bfe:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  407c05:	e9 77 da ff ff       	jmp    0x405681
  407c0a:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
  407c11:	48 8b b5 10 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xf0]
  407c18:	4c 89 f7             	mov    rdi,r14
  407c1b:	44 89 8d 28 ff ff ff 	mov    DWORD PTR [rbp-0xd8],r9d
  407c22:	44 89 85 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r8d
  407c29:	e8 02 d3 ff ff       	call   0x404f30
  407c2e:	44 8b 85 38 ff ff ff 	mov    r8d,DWORD PTR [rbp-0xc8]
  407c35:	44 8b 8d 28 ff ff ff 	mov    r9d,DWORD PTR [rbp-0xd8]
  407c3c:	eb 85                	jmp    0x407bc3
  407c3e:	48 83 bd 30 ff ff ff 	cmp    QWORD PTR [rbp-0xd0],0x0
  407c45:	00 
  407c46:	0f 85 7e 00 00 00    	jne    0x407cca
  407c4c:	8b 8d 24 ff ff ff    	mov    ecx,DWORD PTR [rbp-0xdc]
  407c52:	85 c9                	test   ecx,ecx
  407c54:	0f 84 91 00 00 00    	je     0x407ceb
  407c5a:	48 8b bd f0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x110]
  407c61:	41 b8 01 00 00 00    	mov    r8d,0x1
  407c67:	48 83 c7 10          	add    rdi,0x10
  407c6b:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  407c72:	42 8b 34 80          	mov    esi,DWORD PTR [rax+r8*4]
  407c76:	85 f6                	test   esi,esi
  407c78:	74 2a                	je     0x407ca4
  407c7a:	48 8b 95 18 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xe8]
  407c81:	49 83 c0 01          	add    r8,0x1
  407c85:	e8 b9 d6 ff ff       	call   0x405343
  407c8a:	48 83 c7 10          	add    rdi,0x10
  407c8e:	49 83 f8 0a          	cmp    r8,0xa
  407c92:	75 d7                	jne    0x407c6b
  407c94:	41 bf 01 00 00 00    	mov    r15d,0x1
  407c9a:	eb 2e                	jmp    0x407cca
  407c9c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  407ca0:	49 83 c0 01          	add    r8,0x1
  407ca4:	49 83 f8 0a          	cmp    r8,0xa
  407ca8:	74 ea                	je     0x407c94
  407caa:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  407cb1:	42 8b 14 80          	mov    edx,DWORD PTR [rax+r8*4]
  407cb5:	85 d2                	test   edx,edx
  407cb7:	74 e7                	je     0x407ca0
  407cb9:	e8 46 13 00 00       	call   0x409004
  407cbe:	c7 00 16 00 00 00    	mov    DWORD PTR [rax],0x16
  407cc4:	41 bf ff ff ff ff    	mov    r15d,0xffffffff
  407cca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  407cce:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  407cd5:	00 00 
  407cd7:	75 71                	jne    0x407d4a
  407cd9:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  407cdd:	44 89 f8             	mov    eax,r15d
  407ce0:	5b                   	pop    rbx
  407ce1:	41 5c                	pop    r12
  407ce3:	41 5d                	pop    r13
  407ce5:	41 5e                	pop    r14
  407ce7:	41 5f                	pop    r15
  407ce9:	5d                   	pop    rbp
  407cea:	c3                   	ret
  407ceb:	45 31 ff             	xor    r15d,r15d
  407cee:	eb da                	jmp    0x407cca
  407cf0:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  407cf6:	41 b9 fd ff ff 7f    	mov    r9d,0x7ffffffd
  407cfc:	bf 02 00 00 00       	mov    edi,0x2
  407d01:	83 c8 20             	or     eax,0x20
  407d04:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  407d0a:	e9 c1 f4 ff ff       	jmp    0x4071d0
  407d0f:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
  407d15:	85 c0                	test   eax,eax
  407d17:	74 d7                	je     0x407cf0
  407d19:	81 bd 28 ff ff ff fe 	cmp    DWORD PTR [rbp-0xd8],0x7ffffffe
  407d20:	ff ff 7f 
  407d23:	0f 84 fc f2 ff ff    	je     0x407025
  407d29:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
  407d2f:	83 c7 01             	add    edi,0x1
  407d32:	83 c8 20             	or     eax,0x20
  407d35:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
  407d3b:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  407d40:	29 f8                	sub    eax,edi
  407d42:	41 89 c1             	mov    r9d,eax
  407d45:	e9 86 f4 ff ff       	jmp    0x4071d0
  407d4a:	e8 fd c5 ff ff       	call   0x40434c
  407d4f:	41 57                	push   r15
  407d51:	66 0f ef c0          	pxor   xmm0,xmm0
  407d55:	41 56                	push   r14
  407d57:	41 55                	push   r13
  407d59:	41 54                	push   r12
  407d5b:	55                   	push   rbp
  407d5c:	48 89 fd             	mov    rbp,rdi
  407d5f:	31 ff                	xor    edi,edi
  407d61:	53                   	push   rbx
  407d62:	48 81 ec 78 01 00 00 	sub    rsp,0x178
  407d69:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  407d6e:	4c 8d 74 24 40       	lea    r14,[rsp+0x40]
  407d73:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
  407d78:	4d 89 f0             	mov    r8,r14
  407d7b:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  407d82:	00 00 
  407d84:	48 89 84 24 68 01 00 	mov    QWORD PTR [rsp+0x168],rax
  407d8b:	00 
  407d8c:	31 c0                	xor    eax,eax
  407d8e:	0f 29 44 24 40       	movaps XMMWORD PTR [rsp+0x40],xmm0
  407d93:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
  407d9a:	00 00 
  407d9c:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  407da1:	f3 0f 6f 02          	movdqu xmm0,XMMWORD PTR [rdx]
  407da5:	0f 11 44 24 28       	movups XMMWORD PTR [rsp+0x28],xmm0
  407daa:	48 8b 42 10          	mov    rax,QWORD PTR [rdx+0x10]
  407dae:	48 8d 54 24 28       	lea    rdx,[rsp+0x28]
  407db3:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
  407db8:	e8 03 d8 ff ff       	call   0x4055c0
  407dbd:	85 c0                	test   eax,eax
  407dbf:	0f 88 5f 01 00 00    	js     0x407f24
  407dc5:	8b 85 8c 00 00 00    	mov    eax,DWORD PTR [rbp+0x8c]
  407dcb:	31 db                	xor    ebx,ebx
  407dcd:	85 c0                	test   eax,eax
  407dcf:	0f 89 f8 00 00 00    	jns    0x407ecd
  407dd5:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  407dd8:	89 c1                	mov    ecx,eax
  407dda:	83 e0 df             	and    eax,0xffffffdf
  407ddd:	83 e1 20             	and    ecx,0x20
  407de0:	89 45 00             	mov    DWORD PTR [rbp+0x0],eax
  407de3:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  407de7:	48 83 7d 60 00       	cmp    QWORD PTR [rbp+0x60],0x0
  407dec:	0f 85 ea 00 00 00    	jne    0x407edc
  407df2:	48 8b 45 58          	mov    rax,QWORD PTR [rbp+0x58]
  407df6:	48 c7 45 60 50 00 00 	mov    QWORD PTR [rbp+0x60],0x50
  407dfd:	00 
  407dfe:	66 0f ef c0          	pxor   xmm0,xmm0
  407e02:	48 89 ef             	mov    rdi,rbp
  407e05:	48 c7 45 38 00 00 00 	mov    QWORD PTR [rbp+0x38],0x0
  407e0c:	00 
  407e0d:	41 bf ff ff ff ff    	mov    r15d,0xffffffff
  407e13:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  407e18:	48 8d 84 24 10 01 00 	lea    rax,[rsp+0x110]
  407e1f:	00 
  407e20:	48 89 45 58          	mov    QWORD PTR [rbp+0x58],rax
  407e24:	0f 11 45 20          	movups XMMWORD PTR [rbp+0x20],xmm0
  407e28:	e8 87 21 00 00       	call   0x409fb4
  407e2d:	85 c0                	test   eax,eax
  407e2f:	75 1d                	jne    0x407e4e
  407e31:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  407e36:	4d 89 f0             	mov    r8,r14
  407e39:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
  407e3e:	48 89 ef             	mov    rdi,rbp
  407e41:	48 8d 54 24 28       	lea    rdx,[rsp+0x28]
  407e46:	e8 75 d7 ff ff       	call   0x4055c0
  407e4b:	41 89 c7             	mov    r15d,eax
  407e4e:	4c 8b 74 24 18       	mov    r14,QWORD PTR [rsp+0x18]
  407e53:	4d 85 f6             	test   r14,r14
  407e56:	74 34                	je     0x407e8c
  407e58:	31 d2                	xor    edx,edx
  407e5a:	31 f6                	xor    esi,esi
  407e5c:	48 89 ef             	mov    rdi,rbp
  407e5f:	ff 55 48             	call   QWORD PTR [rbp+0x48]
  407e62:	48 83 7d 28 00       	cmp    QWORD PTR [rbp+0x28],0x0
  407e67:	4c 89 75 58          	mov    QWORD PTR [rbp+0x58],r14
  407e6b:	66 0f ef c0          	pxor   xmm0,xmm0
  407e6f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  407e74:	48 c7 45 60 00 00 00 	mov    QWORD PTR [rbp+0x60],0x0
  407e7b:	00 
  407e7c:	48 c7 45 38 00 00 00 	mov    QWORD PTR [rbp+0x38],0x0
  407e83:	00 
  407e84:	44 0f 44 f8          	cmove  r15d,eax
  407e88:	0f 11 45 20          	movups XMMWORD PTR [rbp+0x20],xmm0
  407e8c:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  407e8f:	ba ff ff ff ff       	mov    edx,0xffffffff
  407e94:	a8 20                	test   al,0x20
  407e96:	44 0f 45 fa          	cmovne r15d,edx
  407e9a:	0b 44 24 0c          	or     eax,DWORD PTR [rsp+0xc]
  407e9e:	89 45 00             	mov    DWORD PTR [rbp+0x0],eax
  407ea1:	85 db                	test   ebx,ebx
  407ea3:	75 75                	jne    0x407f1a
  407ea5:	48 8b 84 24 68 01 00 	mov    rax,QWORD PTR [rsp+0x168]
  407eac:	00 
  407ead:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  407eb4:	00 00 
  407eb6:	75 77                	jne    0x407f2f
  407eb8:	48 81 c4 78 01 00 00 	add    rsp,0x178
  407ebf:	44 89 f8             	mov    eax,r15d
  407ec2:	5b                   	pop    rbx
  407ec3:	5d                   	pop    rbp
  407ec4:	41 5c                	pop    r12
  407ec6:	41 5d                	pop    r13
  407ec8:	41 5e                	pop    r14
  407eca:	41 5f                	pop    r15
  407ecc:	c3                   	ret
  407ecd:	48 89 ef             	mov    rdi,rbp
  407ed0:	e8 b3 1c 00 00       	call   0x409b88
  407ed5:	89 c3                	mov    ebx,eax
  407ed7:	e9 f9 fe ff ff       	jmp    0x407dd5
  407edc:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
  407ee1:	74 1f                	je     0x407f02
  407ee3:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  407ee8:	4d 89 f0             	mov    r8,r14
  407eeb:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
  407ef0:	48 89 ef             	mov    rdi,rbp
  407ef3:	48 8d 54 24 28       	lea    rdx,[rsp+0x28]
  407ef8:	e8 c3 d6 ff ff       	call   0x4055c0
  407efd:	41 89 c7             	mov    r15d,eax
  407f00:	eb 8a                	jmp    0x407e8c
  407f02:	48 89 ef             	mov    rdi,rbp
  407f05:	41 bf ff ff ff ff    	mov    r15d,0xffffffff
  407f0b:	e8 a4 20 00 00       	call   0x409fb4
  407f10:	85 c0                	test   eax,eax
  407f12:	0f 85 74 ff ff ff    	jne    0x407e8c
  407f18:	eb c9                	jmp    0x407ee3
  407f1a:	48 89 ef             	mov    rdi,rbp
  407f1d:	e8 f9 1c 00 00       	call   0x409c1b
  407f22:	eb 81                	jmp    0x407ea5
  407f24:	41 bf ff ff ff ff    	mov    r15d,0xffffffff
  407f2a:	e9 76 ff ff ff       	jmp    0x407ea5
  407f2f:	e8 18 c4 ff ff       	call   0x40434c
  407f34:	41 55                	push   r13
  407f36:	66 48 0f 6e c7       	movq   xmm0,rdi
  407f3b:	41 54                	push   r12
  407f3d:	49 89 f4             	mov    r12,rsi
  407f40:	31 f6                	xor    esi,esi
  407f42:	55                   	push   rbp
  407f43:	53                   	push   rbx
  407f44:	48 89 fb             	mov    rbx,rdi
  407f47:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
  407f4e:	0f 16 05 fb 34 00 00 	movhps xmm0,QWORD PTR [rip+0x34fb]        # 0x40b450
  407f55:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  407f5c:	00 00 
  407f5e:	4c 89 ac 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],r13
  407f65:	00 
  407f66:	41 89 d5             	mov    r13d,edx
  407f69:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
  407f6e:	48 89 e7             	mov    rdi,rsp
  407f71:	0f 11 44 24 08       	movups XMMWORD PTR [rsp+0x8],xmm0
  407f76:	e8 5b 16 00 00       	call   0x4095d6
  407f7b:	ba 01 00 00 00       	mov    edx,0x1
  407f80:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  407f87:	48 89 e7             	mov    rdi,rsp
  407f8a:	44 89 ee             	mov    esi,r13d
  407f8d:	e8 ee 10 00 00       	call   0x409080
  407f92:	48 89 c2             	mov    rdx,rax
  407f95:	4d 85 e4             	test   r12,r12
  407f98:	74 19                	je     0x407fb3
  407f9a:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  407f9f:	48 2b 44 24 58       	sub    rax,QWORD PTR [rsp+0x58]
  407fa4:	48 03 84 24 c8 00 00 	add    rax,QWORD PTR [rsp+0xc8]
  407fab:	00 
  407fac:	48 01 c3             	add    rbx,rax
  407faf:	49 89 1c 24          	mov    QWORD PTR [r12],rbx
  407fb3:	48 8b 84 24 e8 00 00 	mov    rax,QWORD PTR [rsp+0xe8]
  407fba:	00 
  407fbb:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  407fc2:	00 00 
  407fc4:	75 11                	jne    0x407fd7
  407fc6:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
  407fcd:	48 89 d0             	mov    rax,rdx
  407fd0:	5b                   	pop    rbx
  407fd1:	5d                   	pop    rbp
  407fd2:	41 5c                	pop    r12
  407fd4:	41 5d                	pop    r13
  407fd6:	c3                   	ret
  407fd7:	e8 70 c3 ff ff       	call   0x40434c
  407fdc:	41 55                	push   r13
  407fde:	66 48 0f 6e c7       	movq   xmm0,rdi
  407fe3:	41 54                	push   r12
  407fe5:	49 89 f4             	mov    r12,rsi
  407fe8:	31 f6                	xor    esi,esi
  407fea:	55                   	push   rbp
  407feb:	53                   	push   rbx
  407fec:	48 89 fb             	mov    rbx,rdi
  407fef:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
  407ff6:	0f 16 05 53 34 00 00 	movhps xmm0,QWORD PTR [rip+0x3453]        # 0x40b450
  407ffd:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  408004:	00 00 
  408006:	4c 89 ac 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],r13
  40800d:	00 
  40800e:	41 89 d5             	mov    r13d,edx
  408011:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
  408016:	48 89 e7             	mov    rdi,rsp
  408019:	0f 11 44 24 08       	movups XMMWORD PTR [rsp+0x8],xmm0
  40801e:	e8 b3 15 00 00       	call   0x4095d6
  408023:	ba 01 00 00 00       	mov    edx,0x1
  408028:	48 89 e7             	mov    rdi,rsp
  40802b:	48 b9 00 00 00 00 00 	movabs rcx,0x8000000000000000
  408032:	00 00 80 
  408035:	44 89 ee             	mov    esi,r13d
  408038:	e8 43 10 00 00       	call   0x409080
  40803d:	48 89 c2             	mov    rdx,rax
  408040:	4d 85 e4             	test   r12,r12
  408043:	74 19                	je     0x40805e
  408045:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  40804a:	48 2b 44 24 58       	sub    rax,QWORD PTR [rsp+0x58]
  40804f:	48 03 84 24 c8 00 00 	add    rax,QWORD PTR [rsp+0xc8]
  408056:	00 
  408057:	48 01 c3             	add    rbx,rax
  40805a:	49 89 1c 24          	mov    QWORD PTR [r12],rbx
  40805e:	48 8b 84 24 e8 00 00 	mov    rax,QWORD PTR [rsp+0xe8]
  408065:	00 
  408066:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40806d:	00 00 
  40806f:	75 11                	jne    0x408082
  408071:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
  408078:	48 89 d0             	mov    rax,rdx
  40807b:	5b                   	pop    rbx
  40807c:	5d                   	pop    rbp
  40807d:	41 5c                	pop    r12
  40807f:	41 5d                	pop    r13
  408081:	c3                   	ret
  408082:	e8 c5 c2 ff ff       	call   0x40434c
  408087:	41 55                	push   r13
  408089:	66 48 0f 6e c7       	movq   xmm0,rdi
  40808e:	41 54                	push   r12
  408090:	49 89 f4             	mov    r12,rsi
  408093:	31 f6                	xor    esi,esi
  408095:	55                   	push   rbp
  408096:	53                   	push   rbx
  408097:	48 89 fb             	mov    rbx,rdi
  40809a:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
  4080a1:	0f 16 05 a8 33 00 00 	movhps xmm0,QWORD PTR [rip+0x33a8]        # 0x40b450
  4080a8:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  4080af:	00 00 
  4080b1:	4c 89 ac 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],r13
  4080b8:	00 
  4080b9:	41 89 d5             	mov    r13d,edx
  4080bc:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
  4080c1:	48 89 e7             	mov    rdi,rsp
  4080c4:	0f 11 44 24 08       	movups XMMWORD PTR [rsp+0x8],xmm0
  4080c9:	e8 08 15 00 00       	call   0x4095d6
  4080ce:	ba 01 00 00 00       	mov    edx,0x1
  4080d3:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  4080da:	48 89 e7             	mov    rdi,rsp
  4080dd:	44 89 ee             	mov    esi,r13d
  4080e0:	e8 9b 0f 00 00       	call   0x409080
  4080e5:	48 89 c2             	mov    rdx,rax
  4080e8:	4d 85 e4             	test   r12,r12
  4080eb:	74 19                	je     0x408106
  4080ed:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  4080f2:	48 2b 44 24 58       	sub    rax,QWORD PTR [rsp+0x58]
  4080f7:	48 03 84 24 c8 00 00 	add    rax,QWORD PTR [rsp+0xc8]
  4080fe:	00 
  4080ff:	48 01 c3             	add    rbx,rax
  408102:	49 89 1c 24          	mov    QWORD PTR [r12],rbx
  408106:	48 8b 84 24 e8 00 00 	mov    rax,QWORD PTR [rsp+0xe8]
  40810d:	00 
  40810e:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  408115:	00 00 
  408117:	75 11                	jne    0x40812a
  408119:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
  408120:	48 89 d0             	mov    rax,rdx
  408123:	5b                   	pop    rbx
  408124:	5d                   	pop    rbp
  408125:	41 5c                	pop    r12
  408127:	41 5d                	pop    r13
  408129:	c3                   	ret
  40812a:	e8 1d c2 ff ff       	call   0x40434c
  40812f:	41 55                	push   r13
  408131:	66 48 0f 6e c7       	movq   xmm0,rdi
  408136:	41 54                	push   r12
  408138:	49 89 f4             	mov    r12,rsi
  40813b:	31 f6                	xor    esi,esi
  40813d:	55                   	push   rbp
  40813e:	53                   	push   rbx
  40813f:	48 89 fb             	mov    rbx,rdi
  408142:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
  408149:	0f 16 05 00 33 00 00 	movhps xmm0,QWORD PTR [rip+0x3300]        # 0x40b450
  408150:	64 4c 8b 2c 25 28 00 	mov    r13,QWORD PTR fs:0x28
  408157:	00 00 
  408159:	4c 89 ac 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],r13
  408160:	00 
  408161:	41 89 d5             	mov    r13d,edx
  408164:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
  408169:	48 89 e7             	mov    rdi,rsp
  40816c:	0f 11 44 24 08       	movups XMMWORD PTR [rsp+0x8],xmm0
  408171:	e8 60 14 00 00       	call   0x4095d6
  408176:	ba 01 00 00 00       	mov    edx,0x1
  40817b:	48 89 e7             	mov    rdi,rsp
  40817e:	48 b9 00 00 00 00 00 	movabs rcx,0x8000000000000000
  408185:	00 00 80 
  408188:	44 89 ee             	mov    esi,r13d
  40818b:	e8 f0 0e 00 00       	call   0x409080
  408190:	48 89 c2             	mov    rdx,rax
  408193:	4d 85 e4             	test   r12,r12
  408196:	74 19                	je     0x4081b1
  408198:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  40819d:	48 2b 44 24 58       	sub    rax,QWORD PTR [rsp+0x58]
  4081a2:	48 03 84 24 c8 00 00 	add    rax,QWORD PTR [rsp+0xc8]
  4081a9:	00 
  4081aa:	48 01 c3             	add    rbx,rax
  4081ad:	49 89 1c 24          	mov    QWORD PTR [r12],rbx
  4081b1:	48 8b 84 24 e8 00 00 	mov    rax,QWORD PTR [rsp+0xe8]
  4081b8:	00 
  4081b9:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4081c0:	00 00 
  4081c2:	75 11                	jne    0x4081d5
  4081c4:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
  4081cb:	48 89 d0             	mov    rax,rdx
  4081ce:	5b                   	pop    rbx
  4081cf:	5d                   	pop    rbp
  4081d0:	41 5c                	pop    r12
  4081d2:	41 5d                	pop    r13
  4081d4:	c3                   	ret
  4081d5:	e8 72 c1 ff ff       	call   0x40434c
  4081da:	e9 fd fd ff ff       	jmp    0x407fdc
  4081df:	e9 50 fd ff ff       	jmp    0x407f34
  4081e4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4081eb:	00 00 00 
  4081ee:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4081f5:	00 00 00 
  4081f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4081ff:	00 
  408200:	48 89 f9             	mov    rcx,rdi
  408203:	40 0f b6 f6          	movzx  esi,sil
  408207:	eb 08                	jmp    0x408211
  408209:	48 83 c1 01          	add    rcx,0x1
  40820d:	48 83 ea 01          	sub    rdx,0x1
  408211:	f6 c1 07             	test   cl,0x7
  408214:	74 4d                	je     0x408263
  408216:	48 85 d2             	test   rdx,rdx
  408219:	0f 84 d6 00 00 00    	je     0x4082f5
  40821f:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  408222:	39 f0                	cmp    eax,esi
  408224:	75 e3                	jne    0x408209
  408226:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  408229:	39 f0                	cmp    eax,esi
  40822b:	74 3e                	je     0x40826b
  40822d:	48 b8 01 01 01 01 01 	movabs rax,0x101010101010101
  408234:	01 01 01 
  408237:	4c 63 ce             	movsxd r9,esi
  40823a:	53                   	push   rbx
  40823b:	4c 8d 14 11          	lea    r10,[rcx+rdx*1]
  40823f:	48 bb ff fe fe fe fe 	movabs rbx,0xfefefefefefefeff
  408246:	fe fe fe 
  408249:	4c 0f af c8          	imul   r9,rax
  40824d:	48 89 d0             	mov    rax,rdx
  408250:	49 bb 80 80 80 80 80 	movabs r11,0x8080808080808080
  408257:	80 80 80 
  40825a:	48 83 e0 f8          	and    rax,0xfffffffffffffff8
  40825e:	48 01 c8             	add    rax,rcx
  408261:	eb 21                	jmp    0x408284
  408263:	31 c0                	xor    eax,eax
  408265:	48 85 d2             	test   rdx,rdx
  408268:	75 bc                	jne    0x408226
  40826a:	c3                   	ret
  40826b:	48 89 c8             	mov    rax,rcx
  40826e:	eb 78                	jmp    0x4082e8
  408270:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  408275:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40827c:	00 00 00 00 
  408280:	48 83 c1 08          	add    rcx,0x8
  408284:	4c 89 d2             	mov    rdx,r10
  408287:	48 29 ca             	sub    rdx,rcx
  40828a:	48 39 c1             	cmp    rcx,rax
  40828d:	74 39                	je     0x4082c8
  40828f:	48 8b 39             	mov    rdi,QWORD PTR [rcx]
  408292:	4c 31 cf             	xor    rdi,r9
  408295:	4c 8d 04 1f          	lea    r8,[rdi+rbx*1]
  408299:	48 f7 d7             	not    rdi
  40829c:	4c 21 c7             	and    rdi,r8
  40829f:	4c 85 df             	test   rdi,r11
  4082a2:	74 dc                	je     0x408280
  4082a4:	48 89 c8             	mov    rax,rcx
  4082a7:	eb 1f                	jmp    0x4082c8
  4082a9:	90                   	nop
  4082aa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4082b1:	00 00 00 00 
  4082b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4082bc:	00 00 00 00 
  4082c0:	48 83 c0 01          	add    rax,0x1
  4082c4:	48 83 ea 01          	sub    rdx,0x1
  4082c8:	48 85 d2             	test   rdx,rdx
  4082cb:	74 09                	je     0x4082d6
  4082cd:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
  4082d0:	39 f1                	cmp    ecx,esi
  4082d2:	75 ec                	jne    0x4082c0
  4082d4:	5b                   	pop    rbx
  4082d5:	c3                   	ret
  4082d6:	31 c0                	xor    eax,eax
  4082d8:	eb fa                	jmp    0x4082d4
  4082da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4082e0:	48 83 c0 01          	add    rax,0x1
  4082e4:	48 83 ea 01          	sub    rdx,0x1
  4082e8:	48 85 d2             	test   rdx,rdx
  4082eb:	74 08                	je     0x4082f5
  4082ed:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
  4082f0:	39 f1                	cmp    ecx,esi
  4082f2:	75 ec                	jne    0x4082e0
  4082f4:	c3                   	ret
  4082f5:	31 c0                	xor    eax,eax
  4082f7:	c3                   	ret
  4082f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4082ff:	00 
  408300:	48 89 fa             	mov    rdx,rdi
  408303:	81 e6 ff 00 00 00    	and    esi,0xff
  408309:	74 1e                	je     0x408329
  40830b:	f6 c2 07             	test   dl,0x7
  40830e:	74 37                	je     0x408347
  408310:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  408313:	84 c0                	test   al,al
  408315:	0f 84 a4 00 00 00    	je     0x4083bf
  40831b:	39 f0                	cmp    eax,esi
  40831d:	0f 84 9c 00 00 00    	je     0x4083bf
  408323:	48 83 c2 01          	add    rdx,0x1
  408327:	eb e2                	jmp    0x40830b
  408329:	48 83 ec 18          	sub    rsp,0x18
  40832d:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  408332:	e8 e9 00 00 00       	call   0x408420
  408337:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  40833c:	48 83 c4 18          	add    rsp,0x18
  408340:	48 01 c2             	add    rdx,rax
  408343:	48 89 d0             	mov    rax,rdx
  408346:	c3                   	ret
  408347:	48 b8 01 01 01 01 01 	movabs rax,0x101010101010101
  40834e:	01 01 01 
  408351:	4c 63 ce             	movsxd r9,esi
  408354:	49 b8 ff fe fe fe fe 	movabs r8,0xfefefefefefefeff
  40835b:	fe fe fe 
  40835e:	49 ba 80 80 80 80 80 	movabs r10,0x8080808080808080
  408365:	80 80 80 
  408368:	4c 0f af c8          	imul   r9,rax
  40836c:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  408373:	00 00 
  408375:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40837c:	00 00 00 00 
  408380:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
  408383:	48 89 cf             	mov    rdi,rcx
  408386:	4a 8d 04 01          	lea    rax,[rcx+r8*1]
  40838a:	48 f7 d1             	not    rcx
  40838d:	4c 31 cf             	xor    rdi,r9
  408390:	48 21 c8             	and    rax,rcx
  408393:	48 89 f9             	mov    rcx,rdi
  408396:	4c 01 c7             	add    rdi,r8
  408399:	48 f7 d1             	not    rcx
  40839c:	48 21 f9             	and    rcx,rdi
  40839f:	48 09 c8             	or     rax,rcx
  4083a2:	4c 85 d0             	test   rax,r10
  4083a5:	75 0d                	jne    0x4083b4
  4083a7:	48 83 c2 08          	add    rdx,0x8
  4083ab:	eb d3                	jmp    0x408380
  4083ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4083b0:	48 83 c2 01          	add    rdx,0x1
  4083b4:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  4083b7:	84 c0                	test   al,al
  4083b9:	74 04                	je     0x4083bf
  4083bb:	39 f0                	cmp    eax,esi
  4083bd:	75 f1                	jne    0x4083b0
  4083bf:	48 89 d0             	mov    rax,rdx
  4083c2:	c3                   	ret
  4083c3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4083ca:	00 00 00 
  4083cd:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4083d4:	00 00 00 
  4083d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4083de:	00 00 
  4083e0:	31 c0                	xor    eax,eax
  4083e2:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4083e9:	00 
  4083ea:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4083f1:	00 00 00 00 
  4083f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4083fc:	00 00 00 00 
  408400:	0f b6 0c 07          	movzx  ecx,BYTE PTR [rdi+rax*1]
  408404:	0f b6 14 06          	movzx  edx,BYTE PTR [rsi+rax*1]
  408408:	38 d1                	cmp    cl,dl
  40840a:	75 0c                	jne    0x408418
  40840c:	48 83 c0 01          	add    rax,0x1
  408410:	84 d2                	test   dl,dl
  408412:	75 ec                	jne    0x408400
  408414:	31 c0                	xor    eax,eax
  408416:	eb 03                	jmp    0x40841b
  408418:	0f b6 c1             	movzx  eax,cl
  40841b:	29 d0                	sub    eax,edx
  40841d:	c3                   	ret
  40841e:	66 90                	xchg   ax,ax
  408420:	49 89 f8             	mov    r8,rdi
  408423:	48 89 f8             	mov    rax,rdi
  408426:	eb 0c                	jmp    0x408434
  408428:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40842f:	00 
  408430:	48 83 c0 01          	add    rax,0x1
  408434:	a8 07                	test   al,0x7
  408436:	74 07                	je     0x40843f
  408438:	80 38 00             	cmp    BYTE PTR [rax],0x0
  40843b:	75 f3                	jne    0x408430
  40843d:	eb 4a                	jmp    0x408489
  40843f:	48 bf ff fe fe fe fe 	movabs rdi,0xfefefefefefefeff
  408446:	fe fe fe 
  408449:	48 be 80 80 80 80 80 	movabs rsi,0x8080808080808080
  408450:	80 80 80 
  408453:	eb 0f                	jmp    0x408464
  408455:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40845c:	00 00 00 00 
  408460:	48 83 c0 08          	add    rax,0x8
  408464:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  408467:	48 8d 0c 3a          	lea    rcx,[rdx+rdi*1]
  40846b:	48 f7 d2             	not    rdx
  40846e:	48 21 ca             	and    rdx,rcx
  408471:	48 85 f2             	test   rdx,rsi
  408474:	74 ea                	je     0x408460
  408476:	eb 0c                	jmp    0x408484
  408478:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40847f:	00 
  408480:	48 83 c0 01          	add    rax,0x1
  408484:	80 38 00             	cmp    BYTE PTR [rax],0x0
  408487:	75 f7                	jne    0x408480
  408489:	4c 29 c0             	sub    rax,r8
  40848c:	c3                   	ret
  40848d:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408494:	00 00 00 
  408497:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40849e:	00 00 00 
  4084a1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4084a8:	00 00 00 
  4084ab:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4084b2:	00 00 00 
  4084b5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4084bc:	00 00 00 
  4084bf:	90                   	nop
  4084c0:	49 89 f9             	mov    r9,rdi
  4084c3:	49 89 f2             	mov    r10,rsi
  4084c6:	31 c0                	xor    eax,eax
  4084c8:	48 85 d2             	test   rdx,rdx
  4084cb:	74 64                	je     0x408531
  4084cd:	48 83 ea 01          	sub    rdx,0x1
  4084d1:	31 c9                	xor    ecx,ecx
  4084d3:	90                   	nop
  4084d4:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4084db:	00 00 00 00 
  4084df:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4084e6:	00 00 00 00 
  4084ea:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4084f1:	00 00 00 00 
  4084f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4084fc:	00 00 00 00 
  408500:	41 0f b6 04 09       	movzx  eax,BYTE PTR [r9+rcx*1]
  408505:	41 0f b6 3c 0a       	movzx  edi,BYTE PTR [r10+rcx*1]
  40850a:	84 c0                	test   al,al
  40850c:	74 24                	je     0x408532
  40850e:	40 84 ff             	test   dil,dil
  408511:	40 0f 95 c6          	setne  sil
  408515:	40 38 f8             	cmp    al,dil
  408518:	41 0f 94 c0          	sete   r8b
  40851c:	44 21 c6             	and    esi,r8d
  40851f:	48 39 ca             	cmp    rdx,rcx
  408522:	41 0f 95 c0          	setne  r8b
  408526:	48 83 c1 01          	add    rcx,0x1
  40852a:	44 84 c6             	test   sil,r8b
  40852d:	75 d1                	jne    0x408500
  40852f:	29 f8                	sub    eax,edi
  408531:	c3                   	ret
  408532:	31 c0                	xor    eax,eax
  408534:	eb f9                	jmp    0x40852f
  408536:	55                   	push   rbp
  408537:	48 89 f2             	mov    rdx,rsi
  40853a:	48 89 fd             	mov    rbp,rdi
  40853d:	53                   	push   rbx
  40853e:	48 89 f3             	mov    rbx,rsi
  408541:	31 f6                	xor    esi,esi
  408543:	48 83 ec 08          	sub    rsp,0x8
  408547:	e8 b4 fc ff ff       	call   0x408200
  40854c:	48 89 c2             	mov    rdx,rax
  40854f:	48 29 e8             	sub    rax,rbp
  408552:	48 85 d2             	test   rdx,rdx
  408555:	48 0f 44 c3          	cmove  rax,rbx
  408559:	48 83 c4 08          	add    rsp,0x8
  40855d:	5b                   	pop    rbx
  40855e:	5d                   	pop    rbp
  40855f:	c3                   	ret
  408560:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408567:	00 00 00 
  40856a:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408571:	00 00 00 
  408574:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40857b:	00 00 00 
  40857e:	66 90                	xchg   ax,ax
  408580:	41 57                	push   r15
  408582:	66 0f ef c0          	pxor   xmm0,xmm0
  408586:	45 31 ff             	xor    r15d,r15d
  408589:	41 56                	push   r14
  40858b:	41 55                	push   r13
  40858d:	41 54                	push   r12
  40858f:	49 89 fc             	mov    r12,rdi
  408592:	55                   	push   rbp
  408593:	53                   	push   rbx
  408594:	48 81 ec 58 08 00 00 	sub    rsp,0x858
  40859b:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
  4085a2:	00 00 
  4085a4:	48 89 9c 24 48 08 00 	mov    QWORD PTR [rsp+0x848],rbx
  4085ab:	00 
  4085ac:	48 89 f3             	mov    rbx,rsi
  4085af:	0f 29 44 24 20       	movaps XMMWORD PTR [rsp+0x20],xmm0
  4085b4:	0f 29 44 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm0
  4085b9:	eb 23                	jmp    0x4085de
  4085bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4085c0:	89 c8                	mov    eax,ecx
  4085c2:	ba 01 00 00 00       	mov    edx,0x1
  4085c7:	49 83 c7 01          	add    r15,0x1
  4085cb:	c0 e8 06             	shr    al,0x6
  4085ce:	48 d3 e2             	shl    rdx,cl
  4085d1:	4c 89 7c cc 40       	mov    QWORD PTR [rsp+rcx*8+0x40],r15
  4085d6:	0f b6 c0             	movzx  eax,al
  4085d9:	48 09 54 c4 20       	or     QWORD PTR [rsp+rax*8+0x20],rdx
  4085de:	42 0f b6 0c 3b       	movzx  ecx,BYTE PTR [rbx+r15*1]
  4085e3:	84 c9                	test   cl,cl
  4085e5:	0f 84 93 00 00 00    	je     0x40867e
  4085eb:	43 80 3c 3c 00       	cmp    BYTE PTR [r12+r15*1],0x0
  4085f0:	75 ce                	jne    0x4085c0
  4085f2:	45 31 f6             	xor    r14d,r14d
  4085f5:	48 8b 84 24 48 08 00 	mov    rax,QWORD PTR [rsp+0x848]
  4085fc:	00 
  4085fd:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  408604:	00 00 
  408606:	0f 85 7b 02 00 00    	jne    0x408887
  40860c:	48 81 c4 58 08 00 00 	add    rsp,0x858
  408613:	4c 89 f0             	mov    rax,r14
  408616:	5b                   	pop    rbx
  408617:	5d                   	pop    rbp
  408618:	41 5c                	pop    r12
  40861a:	41 5d                	pop    r13
  40861c:	41 5e                	pop    r14
  40861e:	41 5f                	pop    r15
  408620:	c3                   	ret
  408621:	48 3b 54 24 10       	cmp    rdx,QWORD PTR [rsp+0x10]
  408626:	74 06                	je     0x40862e
  408628:	48 83 c2 01          	add    rdx,0x1
  40862c:	eb 08                	jmp    0x408636
  40862e:	48 89 c7             	mov    rdi,rax
  408631:	ba 01 00 00 00       	mov    edx,0x1
  408636:	48 8d 04 17          	lea    rax,[rdi+rdx*1]
  40863a:	4c 39 f8             	cmp    rax,r15
  40863d:	73 59                	jae    0x408698
  40863f:	48 8b 0c 24          	mov    rcx,QWORD PTR [rsp]
  408643:	0f b6 34 03          	movzx  esi,BYTE PTR [rbx+rax*1]
  408647:	48 01 d9             	add    rcx,rbx
  40864a:	0f b6 0c 11          	movzx  ecx,BYTE PTR [rcx+rdx*1]
  40864e:	40 38 f1             	cmp    cl,sil
  408651:	74 ce                	je     0x408621
  408653:	40 38 ce             	cmp    sil,cl
  408656:	73 0e                	jae    0x408666
  408658:	48 89 c1             	mov    rcx,rax
  40865b:	48 2b 0c 24          	sub    rcx,QWORD PTR [rsp]
  40865f:	48 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],rcx
  408664:	eb c8                	jmp    0x40862e
  408666:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  40866a:	ba 01 00 00 00       	mov    edx,0x1
  40866f:	48 83 c7 01          	add    rdi,0x1
  408673:	48 c7 44 24 10 01 00 	mov    QWORD PTR [rsp+0x10],0x1
  40867a:	00 00 
  40867c:	eb b8                	jmp    0x408636
  40867e:	48 c7 44 24 10 01 00 	mov    QWORD PTR [rsp+0x10],0x1
  408685:	00 00 
  408687:	ba 01 00 00 00       	mov    edx,0x1
  40868c:	31 ff                	xor    edi,edi
  40868e:	48 c7 04 24 ff ff ff 	mov    QWORD PTR [rsp],0xffffffffffffffff
  408695:	ff 
  408696:	eb 9e                	jmp    0x408636
  408698:	41 ba 01 00 00 00    	mov    r10d,0x1
  40869e:	ba 01 00 00 00       	mov    edx,0x1
  4086a3:	31 c9                	xor    ecx,ecx
  4086a5:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  4086ac:	eb 13                	jmp    0x4086c1
  4086ae:	4c 39 d2             	cmp    rdx,r10
  4086b1:	74 06                	je     0x4086b9
  4086b3:	48 83 c2 01          	add    rdx,0x1
  4086b7:	eb 08                	jmp    0x4086c1
  4086b9:	48 89 c1             	mov    rcx,rax
  4086bc:	ba 01 00 00 00       	mov    edx,0x1
  4086c1:	48 8d 04 11          	lea    rax,[rcx+rdx*1]
  4086c5:	4c 39 f8             	cmp    rax,r15
  4086c8:	73 2d                	jae    0x4086f7
  4086ca:	48 8d 3c 13          	lea    rdi,[rbx+rdx*1]
  4086ce:	44 0f b6 04 03       	movzx  r8d,BYTE PTR [rbx+rax*1]
  4086d3:	44 38 04 37          	cmp    BYTE PTR [rdi+rsi*1],r8b
  4086d7:	74 d5                	je     0x4086ae
  4086d9:	73 08                	jae    0x4086e3
  4086db:	49 89 c2             	mov    r10,rax
  4086de:	49 29 f2             	sub    r10,rsi
  4086e1:	eb d6                	jmp    0x4086b9
  4086e3:	48 89 ce             	mov    rsi,rcx
  4086e6:	41 ba 01 00 00 00    	mov    r10d,0x1
  4086ec:	48 83 c1 01          	add    rcx,0x1
  4086f0:	ba 01 00 00 00       	mov    edx,0x1
  4086f5:	eb ca                	jmp    0x4086c1
  4086f7:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  4086fb:	48 8d 46 01          	lea    rax,[rsi+0x1]
  4086ff:	48 8d 6f 01          	lea    rbp,[rdi+0x1]
  408703:	48 39 c5             	cmp    rbp,rax
  408706:	4c 0f 43 54 24 10    	cmovae r10,QWORD PTR [rsp+0x10]
  40870c:	48 0f 43 f7          	cmovae rsi,rdi
  408710:	48 0f 42 e8          	cmovb  rbp,rax
  408714:	48 89 df             	mov    rdi,rbx
  408717:	4d 89 d6             	mov    r14,r10
  40871a:	4c 89 54 24 10       	mov    QWORD PTR [rsp+0x10],r10
  40871f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
  408723:	49 89 f5             	mov    r13,rsi
  408726:	48 89 ea             	mov    rdx,rbp
  408729:	4a 8d 34 13          	lea    rsi,[rbx+r10*1]
  40872d:	e8 4e 19 00 00       	call   0x40a080
  408732:	4c 89 f9             	mov    rcx,r15
  408735:	4c 29 f1             	sub    rcx,r14
  408738:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  40873d:	85 c0                	test   eax,eax
  40873f:	74 20                	je     0x408761
  408741:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
  408748:	00 00 
  40874a:	49 8d 47 ff          	lea    rax,[r15-0x1]
  40874e:	4c 29 e8             	sub    rax,r13
  408751:	4c 39 e8             	cmp    rax,r13
  408754:	49 0f 42 c5          	cmovb  rax,r13
  408758:	48 83 c0 01          	add    rax,0x1
  40875c:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  408761:	4c 89 f8             	mov    rax,r15
  408764:	4d 89 e6             	mov    r14,r12
  408767:	45 31 ed             	xor    r13d,r13d
  40876a:	48 83 c8 3f          	or     rax,0x3f
  40876e:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  408773:	eb 51                	jmp    0x4087c6
  408775:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  40877a:	31 f6                	xor    esi,esi
  40877c:	4c 89 e7             	mov    rdi,r12
  40877f:	e8 7c fa ff ff       	call   0x408200
  408784:	48 85 c0             	test   rax,rax
  408787:	74 14                	je     0x40879d
  408789:	48 89 c2             	mov    rdx,rax
  40878c:	4c 29 f2             	sub    rdx,r14
  40878f:	4c 39 fa             	cmp    rdx,r15
  408792:	0f 82 5a fe ff ff    	jb     0x4085f2
  408798:	49 89 c4             	mov    r12,rax
  40879b:	eb 34                	jmp    0x4087d1
  40879d:	4c 03 64 24 08       	add    r12,QWORD PTR [rsp+0x8]
  4087a2:	eb 2d                	jmp    0x4087d1
  4087a4:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4087aa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4087b1:	00 00 00 00 
  4087b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4087bc:	00 00 00 00 
  4087c0:	4d 01 fe             	add    r14,r15
  4087c3:	45 31 ed             	xor    r13d,r13d
  4087c6:	4c 89 e0             	mov    rax,r12
  4087c9:	4c 29 f0             	sub    rax,r14
  4087cc:	4c 39 f8             	cmp    rax,r15
  4087cf:	72 a4                	jb     0x408775
  4087d1:	43 0f b6 44 3e ff    	movzx  eax,BYTE PTR [r14+r15*1-0x1]
  4087d7:	89 c2                	mov    edx,eax
  4087d9:	c0 ea 06             	shr    dl,0x6
  4087dc:	0f b6 d2             	movzx  edx,dl
  4087df:	48 8b 54 d4 20       	mov    rdx,QWORD PTR [rsp+rdx*8+0x20]
  4087e4:	48 0f a3 c2          	bt     rdx,rax
  4087e8:	73 d6                	jae    0x4087c0
  4087ea:	4c 89 fe             	mov    rsi,r15
  4087ed:	48 2b 74 c4 40       	sub    rsi,QWORD PTR [rsp+rax*8+0x40]
  4087f2:	48 89 f0             	mov    rax,rsi
  4087f5:	74 0f                	je     0x408806
  4087f7:	49 39 f5             	cmp    r13,rsi
  4087fa:	49 0f 43 c5          	cmovae rax,r13
  4087fe:	45 31 ed             	xor    r13d,r13d
  408801:	49 01 c6             	add    r14,rax
  408804:	eb c0                	jmp    0x4087c6
  408806:	49 39 ed             	cmp    r13,rbp
  408809:	48 89 e8             	mov    rax,rbp
  40880c:	49 0f 43 c5          	cmovae rax,r13
  408810:	eb 12                	jmp    0x408824
  408812:	0f 1f 00             	nop    DWORD PTR [rax]
  408815:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40881c:	00 00 00 00 
  408820:	48 83 c0 01          	add    rax,0x1
  408824:	0f b6 14 03          	movzx  edx,BYTE PTR [rbx+rax*1]
  408828:	84 d2                	test   dl,dl
  40882a:	74 12                	je     0x40883e
  40882c:	41 3a 14 06          	cmp    dl,BYTE PTR [r14+rax*1]
  408830:	74 ee                	je     0x408820
  408832:	48 2b 04 24          	sub    rax,QWORD PTR [rsp]
  408836:	45 31 ed             	xor    r13d,r13d
  408839:	49 01 c6             	add    r14,rax
  40883c:	eb 88                	jmp    0x4087c6
  40883e:	48 89 e8             	mov    rax,rbp
  408841:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  408848:	00 00 
  40884a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  408851:	00 00 00 00 
  408855:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40885c:	00 00 00 00 
  408860:	49 39 c5             	cmp    r13,rax
  408863:	0f 83 8c fd ff ff    	jae    0x4085f5
  408869:	48 83 e8 01          	sub    rax,0x1
  40886d:	41 0f b6 3c 06       	movzx  edi,BYTE PTR [r14+rax*1]
  408872:	40 38 3c 03          	cmp    BYTE PTR [rbx+rax*1],dil
  408876:	74 e8                	je     0x408860
  408878:	4c 8b 6c 24 18       	mov    r13,QWORD PTR [rsp+0x18]
  40887d:	4c 03 74 24 10       	add    r14,QWORD PTR [rsp+0x10]
  408882:	e9 3f ff ff ff       	jmp    0x4087c6
  408887:	e8 c0 ba ff ff       	call   0x40434c
  40888c:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408893:	00 00 00 
  408896:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40889d:	00 00 00 
  4088a0:	48 89 f2             	mov    rdx,rsi
  4088a3:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  4088a6:	48 89 f8             	mov    rax,rdi
  4088a9:	40 84 f6             	test   sil,sil
  4088ac:	75 01                	jne    0x4088af
  4088ae:	c3                   	ret
  4088af:	48 83 ec 18          	sub    rsp,0x18
  4088b3:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  4088b8:	e8 07 18 00 00       	call   0x40a0c4
  4088bd:	48 85 c0             	test   rax,rax
  4088c0:	0f 84 38 01 00 00    	je     0x4089fe
  4088c6:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  4088cb:	0f b6 72 01          	movzx  esi,BYTE PTR [rdx+0x1]
  4088cf:	40 84 f6             	test   sil,sil
  4088d2:	0f 84 26 01 00 00    	je     0x4089fe
  4088d8:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
  4088dc:	84 c9                	test   cl,cl
  4088de:	0f 84 18 01 00 00    	je     0x4089fc
  4088e4:	0f b6 7a 02          	movzx  edi,BYTE PTR [rdx+0x2]
  4088e8:	40 84 ff             	test   dil,dil
  4088eb:	74 37                	je     0x408924
  4088ed:	44 0f b6 40 02       	movzx  r8d,BYTE PTR [rax+0x2]
  4088f2:	45 84 c0             	test   r8b,r8b
  4088f5:	0f 84 01 01 00 00    	je     0x4089fc
  4088fb:	80 7a 03 00          	cmp    BYTE PTR [rdx+0x3],0x0
  4088ff:	74 63                	je     0x408964
  408901:	80 78 03 00          	cmp    BYTE PTR [rax+0x3],0x0
  408905:	0f 84 f1 00 00 00    	je     0x4089fc
  40890b:	80 7a 04 00          	cmp    BYTE PTR [rdx+0x4],0x0
  40890f:	0f 84 a7 00 00 00    	je     0x4089bc
  408915:	48 89 d6             	mov    rsi,rdx
  408918:	48 89 c7             	mov    rdi,rax
  40891b:	48 83 c4 18          	add    rsp,0x18
  40891f:	e9 5c fc ff ff       	jmp    0x408580
  408924:	0f b7 12             	movzx  edx,WORD PTR [rdx]
  408927:	48 83 c0 01          	add    rax,0x1
  40892b:	66 c1 c2 08          	rol    dx,0x8
  40892f:	89 d6                	mov    esi,edx
  408931:	0f b7 50 ff          	movzx  edx,WORD PTR [rax-0x1]
  408935:	66 c1 c2 08          	rol    dx,0x8
  408939:	eb 12                	jmp    0x40894d
  40893b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  408940:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
  408944:	c1 e2 08             	shl    edx,0x8
  408947:	48 83 c0 01          	add    rax,0x1
  40894b:	09 ca                	or     edx,ecx
  40894d:	80 38 00             	cmp    BYTE PTR [rax],0x0
  408950:	0f 84 a6 00 00 00    	je     0x4089fc
  408956:	66 39 f2             	cmp    dx,si
  408959:	75 e5                	jne    0x408940
  40895b:	48 83 e8 01          	sub    rax,0x1
  40895f:	e9 9a 00 00 00       	jmp    0x4089fe
  408964:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  408967:	c1 e6 10             	shl    esi,0x10
  40896a:	c1 e7 08             	shl    edi,0x8
  40896d:	48 83 c0 02          	add    rax,0x2
  408971:	09 fe                	or     esi,edi
  408973:	41 c1 e0 08          	shl    r8d,0x8
  408977:	c1 e2 18             	shl    edx,0x18
  40897a:	09 d6                	or     esi,edx
  40897c:	0f b6 d1             	movzx  edx,cl
  40897f:	0f b6 48 fe          	movzx  ecx,BYTE PTR [rax-0x2]
  408983:	c1 e2 10             	shl    edx,0x10
  408986:	44 09 c2             	or     edx,r8d
  408989:	c1 e1 18             	shl    ecx,0x18
  40898c:	09 ca                	or     edx,ecx
  40898e:	eb 1d                	jmp    0x4089ad
  408990:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  408995:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40899c:	00 00 00 00 
  4089a0:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
  4089a4:	48 83 c0 01          	add    rax,0x1
  4089a8:	09 ca                	or     edx,ecx
  4089aa:	c1 e2 08             	shl    edx,0x8
  4089ad:	80 38 00             	cmp    BYTE PTR [rax],0x0
  4089b0:	74 4a                	je     0x4089fc
  4089b2:	39 d6                	cmp    esi,edx
  4089b4:	75 ea                	jne    0x4089a0
  4089b6:	48 83 e8 02          	sub    rax,0x2
  4089ba:	eb 42                	jmp    0x4089fe
  4089bc:	8b 32                	mov    esi,DWORD PTR [rdx]
  4089be:	8b 10                	mov    edx,DWORD PTR [rax]
  4089c0:	48 83 c0 03          	add    rax,0x3
  4089c4:	0f ce                	bswap  esi
  4089c6:	0f ca                	bswap  edx
  4089c8:	eb 23                	jmp    0x4089ed
  4089ca:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4089d1:	00 00 00 00 
  4089d5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4089dc:	00 00 00 00 
  4089e0:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
  4089e4:	c1 e2 08             	shl    edx,0x8
  4089e7:	48 83 c0 01          	add    rax,0x1
  4089eb:	09 ca                	or     edx,ecx
  4089ed:	80 38 00             	cmp    BYTE PTR [rax],0x0
  4089f0:	74 0a                	je     0x4089fc
  4089f2:	39 d6                	cmp    esi,edx
  4089f4:	75 ea                	jne    0x4089e0
  4089f6:	48 83 e8 03          	sub    rax,0x3
  4089fa:	eb 02                	jmp    0x4089fe
  4089fc:	31 c0                	xor    eax,eax
  4089fe:	48 83 c4 18          	add    rsp,0x18
  408a02:	c3                   	ret
  408a03:	48 89 f8             	mov    rax,rdi
  408a06:	48 83 fa 08          	cmp    rdx,0x8
  408a0a:	72 14                	jb     0x408a20
  408a0c:	f7 c7 07 00 00 00    	test   edi,0x7
  408a12:	74 0c                	je     0x408a20
  408a14:	a4                   	movs   BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
  408a15:	48 ff ca             	dec    rdx
  408a18:	f7 c7 07 00 00 00    	test   edi,0x7
  408a1e:	75 f4                	jne    0x408a14
  408a20:	48 89 d1             	mov    rcx,rdx
  408a23:	48 c1 e9 03          	shr    rcx,0x3
  408a27:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  408a2a:	83 e2 07             	and    edx,0x7
  408a2d:	74 05                	je     0x408a34
  408a2f:	a4                   	movs   BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
  408a30:	ff ca                	dec    edx
  408a32:	75 fb                	jne    0x408a2f
  408a34:	c3                   	ret
  408a35:	48 0f b6 c6          	movzx  rax,sil
  408a39:	49 b8 01 01 01 01 01 	movabs r8,0x101010101010101
  408a40:	01 01 01 
  408a43:	49 0f af c0          	imul   rax,r8
  408a47:	48 83 fa 7e          	cmp    rdx,0x7e
  408a4b:	77 78                	ja     0x408ac5
  408a4d:	85 d2                	test   edx,edx
  408a4f:	74 70                	je     0x408ac1
  408a51:	40 88 37             	mov    BYTE PTR [rdi],sil
  408a54:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  408a59:	83 fa 02             	cmp    edx,0x2
  408a5c:	76 63                	jbe    0x408ac1
  408a5e:	66 89 47 01          	mov    WORD PTR [rdi+0x1],ax
  408a62:	66 89 44 17 fd       	mov    WORD PTR [rdi+rdx*1-0x3],ax
  408a67:	83 fa 06             	cmp    edx,0x6
  408a6a:	76 55                	jbe    0x408ac1
  408a6c:	89 47 03             	mov    DWORD PTR [rdi+0x3],eax
  408a6f:	89 44 17 f9          	mov    DWORD PTR [rdi+rdx*1-0x7],eax
  408a73:	83 fa 0e             	cmp    edx,0xe
  408a76:	76 49                	jbe    0x408ac1
  408a78:	48 89 47 07          	mov    QWORD PTR [rdi+0x7],rax
  408a7c:	48 89 44 17 f1       	mov    QWORD PTR [rdi+rdx*1-0xf],rax
  408a81:	83 fa 1e             	cmp    edx,0x1e
  408a84:	76 3b                	jbe    0x408ac1
  408a86:	48 89 47 0f          	mov    QWORD PTR [rdi+0xf],rax
  408a8a:	48 89 47 17          	mov    QWORD PTR [rdi+0x17],rax
  408a8e:	48 89 44 17 e1       	mov    QWORD PTR [rdi+rdx*1-0x1f],rax
  408a93:	48 89 44 17 e9       	mov    QWORD PTR [rdi+rdx*1-0x17],rax
  408a98:	83 fa 3e             	cmp    edx,0x3e
  408a9b:	76 24                	jbe    0x408ac1
  408a9d:	48 89 47 1f          	mov    QWORD PTR [rdi+0x1f],rax
  408aa1:	48 89 47 27          	mov    QWORD PTR [rdi+0x27],rax
  408aa5:	48 89 47 2f          	mov    QWORD PTR [rdi+0x2f],rax
  408aa9:	48 89 47 37          	mov    QWORD PTR [rdi+0x37],rax
  408aad:	48 89 44 17 c1       	mov    QWORD PTR [rdi+rdx*1-0x3f],rax
  408ab2:	48 89 44 17 c9       	mov    QWORD PTR [rdi+rdx*1-0x37],rax
  408ab7:	48 89 44 17 d1       	mov    QWORD PTR [rdi+rdx*1-0x2f],rax
  408abc:	48 89 44 17 d9       	mov    QWORD PTR [rdi+rdx*1-0x27],rax
  408ac1:	48 89 f8             	mov    rax,rdi
  408ac4:	c3                   	ret
  408ac5:	f7 c7 0f 00 00 00    	test   edi,0xf
  408acb:	49 89 f8             	mov    r8,rdi
  408ace:	48 89 44 17 f8       	mov    QWORD PTR [rdi+rdx*1-0x8],rax
  408ad3:	48 89 d1             	mov    rcx,rdx
  408ad6:	75 0b                	jne    0x408ae3
  408ad8:	48 c1 e9 03          	shr    rcx,0x3
  408adc:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  408adf:	4c 89 c0             	mov    rax,r8
  408ae2:	c3                   	ret
  408ae3:	31 d2                	xor    edx,edx
  408ae5:	29 fa                	sub    edx,edi
  408ae7:	83 e2 0f             	and    edx,0xf
  408aea:	48 89 07             	mov    QWORD PTR [rdi],rax
  408aed:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
  408af1:	48 29 d1             	sub    rcx,rdx
  408af4:	48 01 d7             	add    rdi,rdx
  408af7:	eb df                	jmp    0x408ad8
  408af9:	0f be 0d e3 88 00 00 	movsx  ecx,BYTE PTR [rip+0x88e3]        # 0x4113e3
  408b00:	85 c9                	test   ecx,ecx
  408b02:	74 1a                	je     0x408b1e
  408b04:	31 c0                	xor    eax,eax
  408b06:	ba 01 00 00 80       	mov    edx,0x80000001
  408b0b:	f0 0f b1 17          	lock cmpxchg DWORD PTR [rdi],edx
  408b0f:	89 c2                	mov    edx,eax
  408b11:	85 c9                	test   ecx,ecx
  408b13:	78 0a                	js     0x408b1f
  408b15:	be 0b 00 00 00       	mov    esi,0xb
  408b1a:	85 c0                	test   eax,eax
  408b1c:	75 20                	jne    0x408b3e
  408b1e:	c3                   	ret
  408b1f:	c6 05 bd 88 00 00 00 	mov    BYTE PTR [rip+0x88bd],0x0        # 0x4113e3
  408b26:	eb ed                	jmp    0x408b15
  408b28:	8d 8a ff ff ff 7f    	lea    ecx,[rdx+0x7fffffff]
  408b2e:	41 89 d0             	mov    r8d,edx
  408b31:	89 c8                	mov    eax,ecx
  408b33:	f0 44 0f b1 07       	lock cmpxchg DWORD PTR [rdi],r8d
  408b38:	89 c2                	mov    edx,eax
  408b3a:	39 c1                	cmp    ecx,eax
  408b3c:	74 e0                	je     0x408b1e
  408b3e:	83 ee 01             	sub    esi,0x1
  408b41:	74 0f                	je     0x408b52
  408b43:	85 d2                	test   edx,edx
  408b45:	78 e1                	js     0x408b28
  408b47:	44 8d 82 01 00 00 80 	lea    r8d,[rdx-0x7fffffff]
  408b4e:	89 d1                	mov    ecx,edx
  408b50:	eb df                	jmp    0x408b31
  408b52:	41 b8 01 00 00 00    	mov    r8d,0x1
  408b58:	f0 44 0f c1 07       	lock xadd DWORD PTR [rdi],r8d
  408b5d:	41 83 c0 01          	add    r8d,0x1
  408b61:	eb 1c                	jmp    0x408b7f
  408b63:	41 8d 90 ff ff ff 7f 	lea    edx,[r8+0x7fffffff]
  408b6a:	44 8d 82 00 00 00 80 	lea    r8d,[rdx-0x80000000]
  408b71:	89 d0                	mov    eax,edx
  408b73:	f0 44 0f b1 07       	lock cmpxchg DWORD PTR [rdi],r8d
  408b78:	41 89 c0             	mov    r8d,eax
  408b7b:	39 c2                	cmp    edx,eax
  408b7d:	74 9f                	je     0x408b1e
  408b7f:	44 89 c2             	mov    edx,r8d
  408b82:	45 85 c0             	test   r8d,r8d
  408b85:	79 e3                	jns    0x408b6a
  408b87:	49 63 d0             	movsxd rdx,r8d
  408b8a:	45 31 d2             	xor    r10d,r10d
  408b8d:	b8 ca 00 00 00       	mov    eax,0xca
  408b92:	be 80 00 00 00       	mov    esi,0x80
  408b97:	0f 05                	syscall
  408b99:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  408b9d:	75 c4                	jne    0x408b63
  408b9f:	31 f6                	xor    esi,esi
  408ba1:	b8 ca 00 00 00       	mov    eax,0xca
  408ba6:	0f 05                	syscall
  408ba8:	eb b9                	jmp    0x408b63
  408baa:	8b 07                	mov    eax,DWORD PTR [rdi]
  408bac:	85 c0                	test   eax,eax
  408bae:	78 01                	js     0x408bb1
  408bb0:	c3                   	ret
  408bb1:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  408bb6:	f0 0f c1 07          	lock xadd DWORD PTR [rdi],eax
  408bba:	3d 01 00 00 80       	cmp    eax,0x80000001
  408bbf:	74 ef                	je     0x408bb0
  408bc1:	be 81 00 00 00       	mov    esi,0x81
  408bc6:	b8 ca 00 00 00       	mov    eax,0xca
  408bcb:	ba 01 00 00 00       	mov    edx,0x1
  408bd0:	0f 05                	syscall
  408bd2:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  408bd6:	75 d8                	jne    0x408bb0
  408bd8:	b8 ca 00 00 00       	mov    eax,0xca
  408bdd:	be 01 00 00 00       	mov    esi,0x1
  408be2:	0f 05                	syscall
  408be4:	c3                   	ret
  408be5:	55                   	push   rbp
  408be6:	48 89 f5             	mov    rbp,rsi
  408be9:	48 8d 35 9b 26 00 00 	lea    rsi,[rip+0x269b]        # 0x40b28b
  408bf0:	53                   	push   rbx
  408bf1:	89 fb                	mov    ebx,edi
  408bf3:	48 8d 3d a6 26 00 00 	lea    rdi,[rip+0x26a6]        # 0x40b2a0
  408bfa:	48 83 ec 08          	sub    rsp,0x8
  408bfe:	e8 fd 0a 00 00       	call   0x409700
  408c03:	48 89 c2             	mov    rdx,rax
  408c06:	48 8d 05 d8 ff ff ff 	lea    rax,[rip+0xffffffffffffffd8]        # 0x408be5
  408c0d:	f0 48 0f b1 15 f2 76 	lock cmpxchg QWORD PTR [rip+0x76f2],rdx        # 0x410308
  408c14:	00 00 
  408c16:	48 85 d2             	test   rdx,rdx
  408c19:	74 0d                	je     0x408c28
  408c1b:	48 83 c4 08          	add    rsp,0x8
  408c1f:	48 89 ee             	mov    rsi,rbp
  408c22:	89 df                	mov    edi,ebx
  408c24:	5b                   	pop    rbx
  408c25:	5d                   	pop    rbp
  408c26:	ff e2                	jmp    rdx
  408c28:	48 83 c4 08          	add    rsp,0x8
  408c2c:	b8 da ff ff ff       	mov    eax,0xffffffda
  408c31:	5b                   	pop    rbx
  408c32:	5d                   	pop    rbp
  408c33:	c3                   	ret
  408c34:	55                   	push   rbp
  408c35:	89 fd                	mov    ebp,edi
  408c37:	53                   	push   rbx
  408c38:	48 89 f3             	mov    rbx,rsi
  408c3b:	48 83 ec 08          	sub    rsp,0x8
  408c3f:	48 8b 05 c2 76 00 00 	mov    rax,QWORD PTR [rip+0x76c2]        # 0x410308
  408c46:	48 85 c0             	test   rax,rax
  408c49:	74 0b                	je     0x408c56
  408c4b:	ff d0                	call   rax
  408c4d:	85 c0                	test   eax,eax
  408c4f:	74 3b                	je     0x408c8c
  408c51:	83 f8 ea             	cmp    eax,0xffffffea
  408c54:	74 3a                	je     0x408c90
  408c56:	48 63 fd             	movsxd rdi,ebp
  408c59:	b8 e4 00 00 00       	mov    eax,0xe4
  408c5e:	48 89 de             	mov    rsi,rbx
  408c61:	0f 05                	syscall
  408c63:	83 f8 da             	cmp    eax,0xffffffda
  408c66:	75 36                	jne    0x408c9e
  408c68:	48 c7 c7 ea ff ff ff 	mov    rdi,0xffffffffffffffea
  408c6f:	85 ed                	test   ebp,ebp
  408c71:	75 2e                	jne    0x408ca1
  408c73:	b8 60 00 00 00       	mov    eax,0x60
  408c78:	48 89 df             	mov    rdi,rbx
  408c7b:	31 f6                	xor    esi,esi
  408c7d:	0f 05                	syscall
  408c7f:	69 43 08 e8 03 00 00 	imul   eax,DWORD PTR [rbx+0x8],0x3e8
  408c86:	48 98                	cdqe
  408c88:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  408c8c:	31 c0                	xor    eax,eax
  408c8e:	eb 16                	jmp    0x408ca6
  408c90:	48 c7 c7 ea ff ff ff 	mov    rdi,0xffffffffffffffea
  408c97:	e8 2c 0a 00 00       	call   0x4096c8
  408c9c:	eb 08                	jmp    0x408ca6
  408c9e:	48 63 f8             	movsxd rdi,eax
  408ca1:	e8 22 0a 00 00       	call   0x4096c8
  408ca6:	48 83 c4 08          	add    rsp,0x8
  408caa:	5b                   	pop    rbx
  408cab:	5d                   	pop    rbp
  408cac:	c3                   	ret
  408cad:	48 83 ec 08          	sub    rsp,0x8
  408cb1:	48 89 fa             	mov    rdx,rdi
  408cb4:	48 89 f1             	mov    rcx,rsi
  408cb7:	31 ff                	xor    edi,edi
  408cb9:	31 f6                	xor    esi,esi
  408cbb:	e8 26 14 00 00       	call   0x40a0e6
  408cc0:	f7 d8                	neg    eax
  408cc2:	48 63 f8             	movsxd rdi,eax
  408cc5:	e8 fe 09 00 00       	call   0x4096c8
  408cca:	48 83 c4 08          	add    rsp,0x8
  408cce:	c3                   	ret
  408ccf:	48 83 ec 18          	sub    rsp,0x18
  408cd3:	48 63 ff             	movsxd rdi,edi
  408cd6:	be 13 54 00 00       	mov    esi,0x5413
  408cdb:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  408ce2:	00 00 
  408ce4:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  408ce9:	31 c0                	xor    eax,eax
  408ceb:	48 89 e2             	mov    rdx,rsp
  408cee:	b8 10 00 00 00       	mov    eax,0x10
  408cf3:	0f 05                	syscall
  408cf5:	48 89 c7             	mov    rdi,rax
  408cf8:	e8 cb 09 00 00       	call   0x4096c8
  408cfd:	83 c0 01             	add    eax,0x1
  408d00:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  408d05:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  408d0c:	00 00 
  408d0e:	75 05                	jne    0x408d15
  408d10:	48 83 c4 18          	add    rsp,0x18
  408d14:	c3                   	ret
  408d15:	e8 32 b6 ff ff       	call   0x40434c
  408d1a:	53                   	push   rbx
  408d1b:	48 89 fb             	mov    rbx,rdi
  408d1e:	48 89 3f             	mov    QWORD PTR [rdi],rdi
  408d21:	e8 b0 13 00 00       	call   0x40a0d6
  408d26:	85 c0                	test   eax,eax
  408d28:	78 59                	js     0x408d83
  408d2a:	66 48 0f 6e c3       	movq   xmm0,rbx
  408d2f:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
  408d33:	75 07                	jne    0x408d3c
  408d35:	c6 05 a4 86 00 00 01 	mov    BYTE PTR [rip+0x86a4],0x1        # 0x4113e0
  408d3c:	c7 43 38 02 00 00 00 	mov    DWORD PTR [rbx+0x38],0x2
  408d43:	b8 da 00 00 00       	mov    eax,0xda
  408d48:	48 8d 3d 21 91 00 00 	lea    rdi,[rip+0x9121]        # 0x411e70
  408d4f:	0f 05                	syscall
  408d51:	89 43 30             	mov    DWORD PTR [rbx+0x30],eax
  408d54:	48 8d 05 bd 86 00 00 	lea    rax,[rip+0x86bd]        # 0x411418
  408d5b:	48 89 83 a8 00 00 00 	mov    QWORD PTR [rbx+0xa8],rax
  408d62:	48 8d 83 88 00 00 00 	lea    rax,[rbx+0x88]
  408d69:	48 89 83 88 00 00 00 	mov    QWORD PTR [rbx+0x88],rax
  408d70:	48 8b 05 39 86 00 00 	mov    rax,QWORD PTR [rip+0x8639]        # 0x4113b0
  408d77:	0f 11 43 10          	movups XMMWORD PTR [rbx+0x10],xmm0
  408d7b:	48 89 43 20          	mov    QWORD PTR [rbx+0x20],rax
  408d7f:	31 c0                	xor    eax,eax
  408d81:	5b                   	pop    rbx
  408d82:	c3                   	ret
  408d83:	b8 ff ff ff ff       	mov    eax,0xffffffff
  408d88:	eb f7                	jmp    0x408d81
  408d8a:	41 55                	push   r13
  408d8c:	49 89 fd             	mov    r13,rdi
  408d8f:	41 54                	push   r12
  408d91:	55                   	push   rbp
  408d92:	48 8d 6f 08          	lea    rbp,[rdi+0x8]
  408d96:	53                   	push   rbx
  408d97:	48 83 ec 08          	sub    rsp,0x8
  408d9b:	48 8b 05 56 86 00 00 	mov    rax,QWORD PTR [rip+0x8656]        # 0x4113f8
  408da2:	4c 8b 25 57 86 00 00 	mov    r12,QWORD PTR [rip+0x8657]        # 0x411400
  408da9:	48 8b 1d 40 86 00 00 	mov    rbx,QWORD PTR [rip+0x8640]        # 0x4113f0
  408db0:	48 8d 84 07 38 ff ff 	lea    rax,[rdi+rax*1-0xc8]
  408db7:	ff 
  408db8:	49 f7 dc             	neg    r12
  408dbb:	49 21 c4             	and    r12,rax
  408dbe:	eb 26                	jmp    0x408de6
  408dc0:	4c 89 e0             	mov    rax,r12
  408dc3:	48 2b 43 28          	sub    rax,QWORD PTR [rbx+0x28]
  408dc7:	4c 89 e7             	mov    rdi,r12
  408dca:	48 83 c5 08          	add    rbp,0x8
  408dce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  408dd2:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  408dd6:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  408dda:	48 2b 7b 28          	sub    rdi,QWORD PTR [rbx+0x28]
  408dde:	e8 20 fc ff ff       	call   0x408a03
  408de3:	48 8b 1b             	mov    rbx,QWORD PTR [rbx]
  408de6:	48 85 db             	test   rbx,rbx
  408de9:	75 d5                	jne    0x408dc0
  408deb:	48 8b 05 16 86 00 00 	mov    rax,QWORD PTR [rip+0x8616]        # 0x411408
  408df2:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
  408df6:	4c 89 e0             	mov    rax,r12
  408df9:	4d 89 6c 24 08       	mov    QWORD PTR [r12+0x8],r13
  408dfe:	48 83 c4 08          	add    rsp,0x8
  408e02:	5b                   	pop    rbx
  408e03:	5d                   	pop    rbp
  408e04:	41 5c                	pop    r12
  408e06:	41 5d                	pop    r13
  408e08:	c3                   	ret
  408e09:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408e10:	00 00 00 
  408e13:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  408e1a:	00 00 00 
  408e1d:	0f 1f 00             	nop    DWORD PTR [rax]
  408e20:	53                   	push   rbx
  408e21:	4c 8b 57 18          	mov    r10,QWORD PTR [rdi+0x18]
  408e25:	31 f6                	xor    esi,esi
  408e27:	45 31 c0             	xor    r8d,r8d
  408e2a:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
  408e2e:	4c 89 d0             	mov    rax,r10
  408e31:	eb 1c                	jmp    0x408e4f
  408e33:	66 90                	xchg   ax,ax
  408e35:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  408e3c:	00 00 00 00 
  408e40:	4c 89 d6             	mov    rsi,r10
  408e43:	48 2b 70 10          	sub    rsi,QWORD PTR [rax+0x10]
  408e47:	48 83 e9 01          	sub    rcx,0x1
  408e4b:	48 03 47 20          	add    rax,QWORD PTR [rdi+0x20]
  408e4f:	48 85 c9             	test   rcx,rcx
  408e52:	74 58                	je     0x408eac
  408e54:	8b 10                	mov    edx,DWORD PTR [rax]
  408e56:	83 fa 06             	cmp    edx,0x6
  408e59:	74 e5                	je     0x408e40
  408e5b:	83 fa 02             	cmp    edx,0x2
  408e5e:	75 15                	jne    0x408e75
  408e60:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  408e67:	48 85 d2             	test   rdx,rdx
  408e6a:	74 db                	je     0x408e47
  408e6c:	48 89 d6             	mov    rsi,rdx
  408e6f:	48 2b 70 10          	sub    rsi,QWORD PTR [rax+0x10]
  408e73:	eb d2                	jmp    0x408e47
  408e75:	83 fa 07             	cmp    edx,0x7
  408e78:	75 05                	jne    0x408e7f
  408e7a:	49 89 c0             	mov    r8,rax
  408e7d:	eb c8                	jmp    0x408e47
  408e7f:	81 fa 51 e5 74 64    	cmp    edx,0x6474e551
  408e85:	75 c0                	jne    0x408e47
  408e87:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  408e8b:	44 8b 0d 82 74 00 00 	mov    r9d,DWORD PTR [rip+0x7482]        # 0x410314
  408e92:	49 39 d1             	cmp    r9,rdx
  408e95:	73 b0                	jae    0x408e47
  408e97:	41 b9 00 00 80 00    	mov    r9d,0x800000
  408e9d:	4c 39 ca             	cmp    rdx,r9
  408ea0:	49 0f 47 d1          	cmova  rdx,r9
  408ea4:	89 15 6a 74 00 00    	mov    DWORD PTR [rip+0x746a],edx        # 0x410314
  408eaa:	eb 9b                	jmp    0x408e47
  408eac:	4d 85 c0             	test   r8,r8
  408eaf:	0f 84 32 01 00 00    	je     0x408fe7
  408eb5:	49 8b 40 20          	mov    rax,QWORD PTR [r8+0x20]
  408eb9:	49 03 70 10          	add    rsi,QWORD PTR [r8+0x10]
  408ebd:	48 8d 1d 1c 8e 00 00 	lea    rbx,[rip+0x8e1c]        # 0x411ce0
  408ec4:	49 8b 50 28          	mov    rdx,QWORD PTR [r8+0x28]
  408ec8:	48 89 35 19 8e 00 00 	mov    QWORD PTR [rip+0x8e19],rsi        # 0x411ce8
  408ecf:	48 89 05 1a 8e 00 00 	mov    QWORD PTR [rip+0x8e1a],rax        # 0x411cf0
  408ed6:	49 8b 40 30          	mov    rax,QWORD PTR [r8+0x30]
  408eda:	48 c7 05 23 85 00 00 	mov    QWORD PTR [rip+0x8523],0x1        # 0x411408
  408ee1:	01 00 00 00 
  408ee5:	48 89 05 14 8e 00 00 	mov    QWORD PTR [rip+0x8e14],rax        # 0x411d00
  408eec:	48 89 1d fd 84 00 00 	mov    QWORD PTR [rip+0x84fd],rbx        # 0x4113f0
  408ef3:	48 01 d6             	add    rsi,rdx
  408ef6:	48 8d 48 ff          	lea    rcx,[rax-0x1]
  408efa:	48 f7 de             	neg    rsi
  408efd:	48 21 ce             	and    rsi,rcx
  408f00:	48 01 d6             	add    rsi,rdx
  408f03:	48 8d 90 df 00 00 00 	lea    rdx,[rax+0xdf]
  408f0a:	48 89 35 e7 8d 00 00 	mov    QWORD PTR [rip+0x8de7],rsi        # 0x411cf8
  408f11:	48 89 35 f0 8d 00 00 	mov    QWORD PTR [rip+0x8df0],rsi        # 0x411d08
  408f18:	48 83 f8 07          	cmp    rax,0x7
  408f1c:	77 15                	ja     0x408f33
  408f1e:	48 c7 05 d7 8d 00 00 	mov    QWORD PTR [rip+0x8dd7],0x8        # 0x411d00
  408f25:	08 00 00 00 
  408f29:	ba e7 00 00 00       	mov    edx,0xe7
  408f2e:	b8 08 00 00 00       	mov    eax,0x8
  408f33:	48 01 d6             	add    rsi,rdx
  408f36:	48 89 05 c3 84 00 00 	mov    QWORD PTR [rip+0x84c3],rax        # 0x411400
  408f3d:	48 8d 3d dc 8d 00 00 	lea    rdi,[rip+0x8ddc]        # 0x411d20
  408f44:	48 83 e6 f8          	and    rsi,0xfffffffffffffff8
  408f48:	48 89 35 a9 84 00 00 	mov    QWORD PTR [rip+0x84a9],rsi        # 0x4113f8
  408f4f:	48 81 fe 50 01 00 00 	cmp    rsi,0x150
  408f56:	76 21                	jbe    0x408f79
  408f58:	41 ba 22 00 00 00    	mov    r10d,0x22
  408f5e:	45 31 c9             	xor    r9d,r9d
  408f61:	b8 09 00 00 00       	mov    eax,0x9
  408f66:	31 ff                	xor    edi,edi
  408f68:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
  408f6f:	ba 03 00 00 00       	mov    edx,0x3
  408f74:	0f 05                	syscall
  408f76:	48 89 c7             	mov    rdi,rax
  408f79:	e8 0c fe ff ff       	call   0x408d8a
  408f7e:	48 89 00             	mov    QWORD PTR [rax],rax
  408f81:	48 89 c7             	mov    rdi,rax
  408f84:	48 89 c3             	mov    rbx,rax
  408f87:	e8 4a 11 00 00       	call   0x40a0d6
  408f8c:	85 c0                	test   eax,eax
  408f8e:	78 71                	js     0x409001
  408f90:	66 48 0f 6e c3       	movq   xmm0,rbx
  408f95:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
  408f99:	75 07                	jne    0x408fa2
  408f9b:	c6 05 3e 84 00 00 01 	mov    BYTE PTR [rip+0x843e],0x1        # 0x4113e0
  408fa2:	c7 43 38 02 00 00 00 	mov    DWORD PTR [rbx+0x38],0x2
  408fa9:	b8 da 00 00 00       	mov    eax,0xda
  408fae:	48 8d 3d bb 8e 00 00 	lea    rdi,[rip+0x8ebb]        # 0x411e70
  408fb5:	0f 05                	syscall
  408fb7:	89 43 30             	mov    DWORD PTR [rbx+0x30],eax
  408fba:	48 8d 05 57 84 00 00 	lea    rax,[rip+0x8457]        # 0x411418
  408fc1:	48 89 83 a8 00 00 00 	mov    QWORD PTR [rbx+0xa8],rax
  408fc8:	48 8d 83 88 00 00 00 	lea    rax,[rbx+0x88]
  408fcf:	48 89 83 88 00 00 00 	mov    QWORD PTR [rbx+0x88],rax
  408fd6:	48 8b 05 d3 83 00 00 	mov    rax,QWORD PTR [rip+0x83d3]        # 0x4113b0
  408fdd:	0f 11 43 10          	movups XMMWORD PTR [rbx+0x10],xmm0
  408fe1:	48 89 43 20          	mov    QWORD PTR [rbx+0x20],rax
  408fe5:	5b                   	pop    rbx
  408fe6:	c3                   	ret
  408fe7:	48 8b 15 0a 8d 00 00 	mov    rdx,QWORD PTR [rip+0x8d0a]        # 0x411cf8
  408fee:	48 8b 35 f3 8c 00 00 	mov    rsi,QWORD PTR [rip+0x8cf3]        # 0x411ce8
  408ff5:	48 8b 05 04 8d 00 00 	mov    rax,QWORD PTR [rip+0x8d04]        # 0x411d00
  408ffc:	e9 f2 fe ff ff       	jmp    0x408ef3
  409001:	f4                   	hlt
  409002:	eb e1                	jmp    0x408fe5
  409004:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  40900b:	00 00 
  40900d:	48 83 c0 34          	add    rax,0x34
  409011:	c3                   	ret
  409012:	48 8d 05 07 42 00 00 	lea    rax,[rip+0x4207]        # 0x40d220
  409019:	81 ff 83 00 00 00    	cmp    edi,0x83
  40901f:	77 11                	ja     0x409032
  409021:	48 63 ff             	movsxd rdi,edi
  409024:	48 8d 15 d5 40 00 00 	lea    rdx,[rip+0x40d5]        # 0x40d100
  40902b:	0f b7 14 7a          	movzx  edx,WORD PTR [rdx+rdi*2]
  40902f:	48 01 d0             	add    rax,rdx
  409032:	48 8b 76 28          	mov    rsi,QWORD PTR [rsi+0x28]
  409036:	48 89 c7             	mov    rdi,rax
  409039:	e9 af 09 00 00       	jmp    0x4099ed
  40903e:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  409045:	00 00 
  409047:	48 8b b0 a8 00 00 00 	mov    rsi,QWORD PTR [rax+0xa8]
  40904e:	e9 bf ff ff ff       	jmp    0x409012
  409053:	48 63 ff             	movsxd rdi,edi
  409056:	b8 e7 00 00 00       	mov    eax,0xe7
  40905b:	0f 05                	syscall
  40905d:	b8 3c 00 00 00       	mov    eax,0x3c
  409062:	0f 05                	syscall
  409064:	eb f7                	jmp    0x40905d
  409066:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40906d:	00 00 00 
  409070:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  409077:	00 00 00 
  40907a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  409080:	41 57                	push   r15
  409082:	41 56                	push   r14
  409084:	41 55                	push   r13
  409086:	41 54                	push   r12
  409088:	55                   	push   rbp
  409089:	53                   	push   rbx
  40908a:	48 83 ec 18          	sub    rsp,0x18
  40908e:	83 fe 24             	cmp    esi,0x24
  409091:	0f 87 d2 01 00 00    	ja     0x409269
  409097:	48 89 fb             	mov    rbx,rdi
  40909a:	41 89 f6             	mov    r14d,esi
  40909d:	89 d5                	mov    ebp,edx
  40909f:	49 89 cc             	mov    r12,rcx
  4090a2:	83 fe 01             	cmp    esi,0x1
  4090a5:	0f 84 be 01 00 00    	je     0x409269
  4090ab:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4090b2:	00 00 00 
  4090b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4090bc:	00 00 00 00 
  4090c0:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4090c4:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  4090cb:	0f 84 92 00 00 00    	je     0x409163
  4090d1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4090d5:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  4090d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4090dc:	8d 50 f7             	lea    edx,[rax-0x9]
  4090df:	83 fa 04             	cmp    edx,0x4
  4090e2:	76 dc                	jbe    0x4090c0
  4090e4:	83 f8 20             	cmp    eax,0x20
  4090e7:	74 d7                	je     0x4090c0
  4090e9:	8d 50 d5             	lea    edx,[rax-0x2b]
  4090ec:	45 31 ed             	xor    r13d,r13d
  4090ef:	83 e2 fd             	and    edx,0xfffffffd
  4090f2:	75 25                	jne    0x409119
  4090f4:	45 31 ed             	xor    r13d,r13d
  4090f7:	83 f8 2d             	cmp    eax,0x2d
  4090fa:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4090fe:	41 0f 94 c5          	sete   r13b
  409102:	41 f7 dd             	neg    r13d
  409105:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  40910c:	74 6e                	je     0x40917c
  40910e:	48 8d 50 01          	lea    rdx,[rax+0x1]
  409112:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  409116:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  409119:	41 f7 c6 ef ff ff ff 	test   r14d,0xffffffef
  409120:	0f 85 5f 01 00 00    	jne    0x409285
  409126:	83 f8 30             	cmp    eax,0x30
  409129:	74 5b                	je     0x409186
  40912b:	48 63 d0             	movsxd rdx,eax
  40912e:	4c 8d 3d ac 48 00 00 	lea    r15,[rip+0x48ac]        # 0x40d9e1
  409135:	41 0f b6 34 17       	movzx  esi,BYTE PTR [r15+rdx*1]
  40913a:	45 85 f6             	test   r14d,r14d
  40913d:	0f 84 03 01 00 00    	je     0x409246
  409143:	40 80 fe 0f          	cmp    sil,0xf
  409147:	0f 87 03 01 00 00    	ja     0x409250
  40914d:	b9 04 00 00 00       	mov    ecx,0x4
  409152:	41 be 10 00 00 00    	mov    r14d,0x10
  409158:	40 0f b6 fe          	movzx  edi,sil
  40915c:	31 ed                	xor    ebp,ebp
  40915e:	e9 53 02 00 00       	jmp    0x4093b6
  409163:	48 89 df             	mov    rdi,rbx
  409166:	e8 a5 04 00 00       	call   0x409610
  40916b:	8d 50 f7             	lea    edx,[rax-0x9]
  40916e:	83 fa 04             	cmp    edx,0x4
  409171:	0f 87 6d ff ff ff    	ja     0x4090e4
  409177:	e9 44 ff ff ff       	jmp    0x4090c0
  40917c:	48 89 df             	mov    rdi,rbx
  40917f:	e8 8c 04 00 00       	call   0x409610
  409184:	eb 93                	jmp    0x409119
  409186:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  40918a:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  409191:	74 39                	je     0x4091cc
  409193:	48 8d 50 01          	lea    rdx,[rax+0x1]
  409197:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  40919b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  40919e:	89 c2                	mov    edx,eax
  4091a0:	83 ca 20             	or     edx,0x20
  4091a3:	83 fa 78             	cmp    edx,0x78
  4091a6:	74 2e                	je     0x4091d6
  4091a8:	48 98                	cdqe
  4091aa:	4c 8d 3d 30 48 00 00 	lea    r15,[rip+0x4830]        # 0x40d9e1
  4091b1:	41 0f b6 34 07       	movzx  esi,BYTE PTR [r15+rax*1]
  4091b6:	45 85 f6             	test   r14d,r14d
  4091b9:	75 92                	jne    0x40914d
  4091bb:	b9 03 00 00 00       	mov    ecx,0x3
  4091c0:	41 be 08 00 00 00    	mov    r14d,0x8
  4091c6:	40 0f b6 fe          	movzx  edi,sil
  4091ca:	eb 90                	jmp    0x40915c
  4091cc:	48 89 df             	mov    rdi,rbx
  4091cf:	e8 3c 04 00 00       	call   0x409610
  4091d4:	eb c8                	jmp    0x40919e
  4091d6:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4091da:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  4091e1:	74 3f                	je     0x409222
  4091e3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4091e7:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  4091eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4091ee:	48 98                	cdqe
  4091f0:	4c 8d 3d ea 47 00 00 	lea    r15,[rip+0x47ea]        # 0x40d9e1
  4091f7:	41 0f b6 34 07       	movzx  esi,BYTE PTR [r15+rax*1]
  4091fc:	40 80 fe 0f          	cmp    sil,0xf
  409200:	0f 86 47 ff ff ff    	jbe    0x40914d
  409206:	48 83 bb c0 00 00 00 	cmp    QWORD PTR [rbx+0xc0],0x0
  40920d:	00 
  40920e:	78 1c                	js     0x40922c
  409210:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  409214:	85 ed                	test   ebp,ebp
  409216:	74 1a                	je     0x409232
  409218:	48 83 e8 02          	sub    rax,0x2
  40921c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  409220:	eb 52                	jmp    0x409274
  409222:	48 89 df             	mov    rdi,rbx
  409225:	e8 e6 03 00 00       	call   0x409610
  40922a:	eb c2                	jmp    0x4091ee
  40922c:	85 ed                	test   ebp,ebp
  40922e:	75 44                	jne    0x409274
  409230:	eb 08                	jmp    0x40923a
  409232:	48 83 e8 01          	sub    rax,0x1
  409236:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40923a:	31 f6                	xor    esi,esi
  40923c:	48 89 df             	mov    rdi,rbx
  40923f:	e8 92 03 00 00       	call   0x4095d6
  409244:	eb 2e                	jmp    0x409274
  409246:	40 80 fe 09          	cmp    sil,0x9
  40924a:	0f 86 83 00 00 00    	jbe    0x4092d3
  409250:	48 83 bb c0 00 00 00 	cmp    QWORD PTR [rbx+0xc0],0x0
  409257:	00 
  409258:	78 05                	js     0x40925f
  40925a:	48 83 6b 08 01       	sub    QWORD PTR [rbx+0x8],0x1
  40925f:	31 f6                	xor    esi,esi
  409261:	48 89 df             	mov    rdi,rbx
  409264:	e8 6d 03 00 00       	call   0x4095d6
  409269:	e8 96 fd ff ff       	call   0x409004
  40926e:	c7 00 16 00 00 00    	mov    DWORD PTR [rax],0x16
  409274:	31 c0                	xor    eax,eax
  409276:	48 83 c4 18          	add    rsp,0x18
  40927a:	5b                   	pop    rbx
  40927b:	5d                   	pop    rbp
  40927c:	41 5c                	pop    r12
  40927e:	41 5d                	pop    r13
  409280:	41 5e                	pop    r14
  409282:	41 5f                	pop    r15
  409284:	c3                   	ret
  409285:	48 63 d0             	movsxd rdx,eax
  409288:	4c 8d 3d 52 47 00 00 	lea    r15,[rip+0x4752]        # 0x40d9e1
  40928f:	41 0f b6 3c 17       	movzx  edi,BYTE PTR [r15+rdx*1]
  409294:	48 89 fe             	mov    rsi,rdi
  409297:	44 39 f7             	cmp    edi,r14d
  40929a:	73 b4                	jae    0x409250
  40929c:	41 83 fe 0a          	cmp    r14d,0xa
  4092a0:	74 65                	je     0x409307
  4092a2:	41 8d 46 ff          	lea    eax,[r14-0x1]
  4092a6:	31 ed                	xor    ebp,ebp
  4092a8:	44 85 f0             	test   eax,r14d
  4092ab:	0f 85 a5 01 00 00    	jne    0x409456
  4092b1:	41 6b c6 17          	imul   eax,r14d,0x17
  4092b5:	48 8d 15 0c 47 00 00 	lea    rdx,[rip+0x470c]        # 0x40d9c8
  4092bc:	c1 e8 05             	shr    eax,0x5
  4092bf:	83 e0 07             	and    eax,0x7
  4092c2:	0f be 0c 02          	movsx  ecx,BYTE PTR [rdx+rax*1]
  4092c6:	e9 91 fe ff ff       	jmp    0x40915c
  4092cb:	48 89 df             	mov    rdi,rbx
  4092ce:	e8 3d 03 00 00       	call   0x409610
  4092d3:	8d 50 d0             	lea    edx,[rax-0x30]
  4092d6:	83 fa 09             	cmp    edx,0x9
  4092d9:	77 31                	ja     0x40930c
  4092db:	41 81 fe 98 99 99 19 	cmp    r14d,0x19999998
  4092e2:	77 28                	ja     0x40930c
  4092e4:	43 8d 14 b6          	lea    edx,[r14+r14*4]
  4092e8:	44 8d 74 50 d0       	lea    r14d,[rax+rdx*2-0x30]
  4092ed:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4092f1:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  4092f8:	74 d1                	je     0x4092cb
  4092fa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4092fe:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  409302:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  409305:	eb cc                	jmp    0x4092d3
  409307:	45 31 f6             	xor    r14d,r14d
  40930a:	eb c7                	jmp    0x4092d3
  40930c:	44 89 f5             	mov    ebp,r14d
  40930f:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  409316:	99 99 19 
  409319:	eb 0b                	jmp    0x409326
  40931b:	48 89 df             	mov    rdi,rbx
  40931e:	e8 ed 02 00 00       	call   0x409610
  409323:	8d 50 d0             	lea    edx,[rax-0x30]
  409326:	83 fa 09             	cmp    edx,0x9
  409329:	77 48                	ja     0x409373
  40932b:	49 39 ee             	cmp    r14,rbp
  40932e:	72 2d                	jb     0x40935d
  409330:	48 8d 4c ad 00       	lea    rcx,[rbp+rbp*4+0x0]
  409335:	48 63 d2             	movsxd rdx,edx
  409338:	48 01 c9             	add    rcx,rcx
  40933b:	48 01 ca             	add    rdx,rcx
  40933e:	72 22                	jb     0x409362
  409340:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  409344:	48 89 d5             	mov    rbp,rdx
  409347:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  40934e:	74 cb                	je     0x40931b
  409350:	48 8d 50 01          	lea    rdx,[rax+0x1]
  409354:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  409358:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  40935b:	eb c6                	jmp    0x409323
  40935d:	83 fa 09             	cmp    edx,0x9
  409360:	77 11                	ja     0x409373
  409362:	48 98                	cdqe
  409364:	41 0f b6 34 07       	movzx  esi,BYTE PTR [r15+rax*1]
  409369:	40 80 fe 09          	cmp    sil,0x9
  40936d:	0f 86 bb 01 00 00    	jbe    0x40952e
  409373:	48 83 bb c0 00 00 00 	cmp    QWORD PTR [rbx+0xc0],0x0
  40937a:	00 
  40937b:	78 05                	js     0x409382
  40937d:	48 83 6b 08 01       	sub    QWORD PTR [rbx+0x8],0x1
  409382:	4c 39 e5             	cmp    rbp,r12
  409385:	0f 83 06 02 00 00    	jae    0x409591
  40938b:	4d 63 ed             	movsxd r13,r13d
  40938e:	48 89 e8             	mov    rax,rbp
  409391:	4c 31 e8             	xor    rax,r13
  409394:	4c 29 e8             	sub    rax,r13
  409397:	e9 da fe ff ff       	jmp    0x409276
  40939c:	48 89 df             	mov    rdi,rbx
  40939f:	89 4c 24 08          	mov    DWORD PTR [rsp+0x8],ecx
  4093a3:	e8 68 02 00 00       	call   0x409610
  4093a8:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
  4093ac:	48 98                	cdqe
  4093ae:	41 0f b6 3c 07       	movzx  edi,BYTE PTR [r15+rax*1]
  4093b3:	48 89 fe             	mov    rsi,rdi
  4093b6:	44 39 f7             	cmp    edi,r14d
  4093b9:	73 26                	jae    0x4093e1
  4093bb:	81 fd ff ff ff 07    	cmp    ebp,0x7ffffff
  4093c1:	77 1e                	ja     0x4093e1
  4093c3:	d3 e5                	shl    ebp,cl
  4093c5:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4093c9:	09 fd                	or     ebp,edi
  4093cb:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  4093d2:	74 c8                	je     0x40939c
  4093d4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4093d8:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  4093dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4093df:	eb cb                	jmp    0x4093ac
  4093e1:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
  4093e8:	eb 16                	jmp    0x409400
  4093ea:	48 8d 70 01          	lea    rsi,[rax+0x1]
  4093ee:	48 89 73 08          	mov    QWORD PTR [rbx+0x8],rsi
  4093f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4093f5:	48 98                	cdqe
  4093f7:	41 0f b6 34 07       	movzx  esi,BYTE PTR [r15+rax*1]
  4093fc:	40 0f b6 fe          	movzx  edi,sil
  409400:	44 39 f7             	cmp    edi,r14d
  409403:	0f 83 6a ff ff ff    	jae    0x409373
  409409:	48 89 d0             	mov    rax,rdx
  40940c:	48 d3 e8             	shr    rax,cl
  40940f:	48 39 e8             	cmp    rax,rbp
  409412:	0f 82 fa 00 00 00    	jb     0x409512
  409418:	48 d3 e5             	shl    rbp,cl
  40941b:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  40941f:	48 09 f5             	or     rbp,rsi
  409422:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  409429:	75 bf                	jne    0x4093ea
  40942b:	48 89 df             	mov    rdi,rbx
  40942e:	89 4c 24 08          	mov    DWORD PTR [rsp+0x8],ecx
  409432:	e8 d9 01 00 00       	call   0x409610
  409437:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
  40943b:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
  409442:	eb b1                	jmp    0x4093f5
  409444:	48 89 df             	mov    rdi,rbx
  409447:	e8 c4 01 00 00       	call   0x409610
  40944c:	48 98                	cdqe
  40944e:	41 0f b6 3c 07       	movzx  edi,BYTE PTR [r15+rax*1]
  409453:	48 89 fe             	mov    rsi,rdi
  409456:	44 39 f7             	cmp    edi,r14d
  409459:	73 28                	jae    0x409483
  40945b:	81 fd c6 71 1c 07    	cmp    ebp,0x71c71c6
  409461:	77 20                	ja     0x409483
  409463:	41 0f af ee          	imul   ebp,r14d
  409467:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  40946b:	01 fd                	add    ebp,edi
  40946d:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  409474:	74 ce                	je     0x409444
  409476:	48 8d 50 01          	lea    rdx,[rax+0x1]
  40947a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  40947e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  409481:	eb c9                	jmp    0x40944c
  409483:	44 89 f1             	mov    ecx,r14d
  409486:	eb 1c                	jmp    0x4094a4
  409488:	48 89 df             	mov    rdi,rbx
  40948b:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  409490:	e8 7b 01 00 00       	call   0x409610
  409495:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  40949a:	48 98                	cdqe
  40949c:	41 0f b6 3c 07       	movzx  edi,BYTE PTR [r15+rax*1]
  4094a1:	48 89 fe             	mov    rsi,rdi
  4094a4:	44 39 f7             	cmp    edi,r14d
  4094a7:	0f 83 c6 fe ff ff    	jae    0x409373
  4094ad:	48 89 e8             	mov    rax,rbp
  4094b0:	48 f7 e1             	mul    rcx
  4094b3:	70 5d                	jo     0x409512
  4094b5:	48 01 c6             	add    rsi,rax
  4094b8:	72 58                	jb     0x409512
  4094ba:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  4094be:	48 89 f5             	mov    rbp,rsi
  4094c1:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  4094c8:	74 be                	je     0x409488
  4094ca:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4094ce:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  4094d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4094d5:	eb c3                	jmp    0x40949a
  4094d7:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4094de:	00 
  4094df:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4094e6:	00 00 00 00 
  4094ea:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4094f1:	00 00 00 00 
  4094f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4094fc:	00 00 00 00 
  409500:	48 8d 50 01          	lea    rdx,[rax+0x1]
  409504:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
  409508:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  40950b:	48 98                	cdqe
  40950d:	41 0f b6 3c 07       	movzx  edi,BYTE PTR [r15+rax*1]
  409512:	44 39 f7             	cmp    edi,r14d
  409515:	73 23                	jae    0x40953a
  409517:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  40951b:	48 3b 83 b8 00 00 00 	cmp    rax,QWORD PTR [rbx+0xb8]
  409522:	75 dc                	jne    0x409500
  409524:	48 89 df             	mov    rdi,rbx
  409527:	e8 e4 00 00 00       	call   0x409610
  40952c:	eb dd                	jmp    0x40950b
  40952e:	41 be 0a 00 00 00    	mov    r14d,0xa
  409534:	40 0f b6 fe          	movzx  edi,sil
  409538:	eb d8                	jmp    0x409512
  40953a:	e8 c5 fa ff ff       	call   0x409004
  40953f:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
  409545:	48 8b 93 c0 00 00 00 	mov    rdx,QWORD PTR [rbx+0xc0]
  40954c:	41 f6 c4 01          	test   r12b,0x1
  409550:	74 25                	je     0x409577
  409552:	4c 89 e0             	mov    rax,r12
  409555:	48 85 d2             	test   rdx,rdx
  409558:	0f 88 18 fd ff ff    	js     0x409276
  40955e:	48 83 6b 08 01       	sub    QWORD PTR [rbx+0x8],0x1
  409563:	45 31 ed             	xor    r13d,r13d
  409566:	4d 63 ed             	movsxd r13,r13d
  409569:	4c 89 e0             	mov    rax,r12
  40956c:	4c 31 e8             	xor    rax,r13
  40956f:	4c 29 e8             	sub    rax,r13
  409572:	e9 ff fc ff ff       	jmp    0x409276
  409577:	48 85 d2             	test   rdx,rdx
  40957a:	78 05                	js     0x409581
  40957c:	48 83 6b 08 01       	sub    QWORD PTR [rbx+0x8],0x1
  409581:	45 85 ed             	test   r13d,r13d
  409584:	74 33                	je     0x4095b9
  409586:	4c 89 e0             	mov    rax,r12
  409589:	48 f7 d8             	neg    rax
  40958c:	e9 e5 fc ff ff       	jmp    0x409276
  409591:	41 f6 c4 01          	test   r12b,0x1
  409595:	74 18                	je     0x4095af
  409597:	49 39 ec             	cmp    r12,rbp
  40959a:	73 35                	jae    0x4095d1
  40959c:	e8 63 fa ff ff       	call   0x409004
  4095a1:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
  4095a7:	4c 89 e0             	mov    rax,r12
  4095aa:	e9 c7 fc ff ff       	jmp    0x409276
  4095af:	45 85 ed             	test   r13d,r13d
  4095b2:	75 15                	jne    0x4095c9
  4095b4:	e8 4b fa ff ff       	call   0x409004
  4095b9:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
  4095bf:	49 8d 44 24 ff       	lea    rax,[r12-0x1]
  4095c4:	e9 ad fc ff ff       	jmp    0x409276
  4095c9:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
  4095cf:	eb c6                	jmp    0x409597
  4095d1:	49 89 ec             	mov    r12,rbp
  4095d4:	eb 90                	jmp    0x409566
  4095d6:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
  4095da:	48 8b 57 58          	mov    rdx,QWORD PTR [rdi+0x58]
  4095de:	48 89 b7 c0 00 00 00 	mov    QWORD PTR [rdi+0xc0],rsi
  4095e5:	48 29 c2             	sub    rdx,rax
  4095e8:	48 89 97 c8 00 00 00 	mov    QWORD PTR [rdi+0xc8],rdx
  4095ef:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  4095f3:	48 85 f6             	test   rsi,rsi
  4095f6:	74 10                	je     0x409608
  4095f8:	48 89 d1             	mov    rcx,rdx
  4095fb:	48 29 c1             	sub    rcx,rax
  4095fe:	48 01 f0             	add    rax,rsi
  409601:	48 39 f1             	cmp    rcx,rsi
  409604:	48 0f 4f d0          	cmovg  rdx,rax
  409608:	48 89 97 b8 00 00 00 	mov    QWORD PTR [rdi+0xb8],rdx
  40960f:	c3                   	ret
  409610:	55                   	push   rbp
  409611:	53                   	push   rbx
  409612:	48 89 fb             	mov    rbx,rdi
  409615:	48 83 ec 08          	sub    rsp,0x8
  409619:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
  40961d:	48 8b 4f 58          	mov    rcx,QWORD PTR [rdi+0x58]
  409621:	48 8b 87 c0 00 00 00 	mov    rax,QWORD PTR [rdi+0xc0]
  409628:	48 89 d5             	mov    rbp,rdx
  40962b:	48 29 cd             	sub    rbp,rcx
  40962e:	48 03 af c8 00 00 00 	add    rbp,QWORD PTR [rdi+0xc8]
  409635:	48 85 c0             	test   rax,rax
  409638:	74 05                	je     0x40963f
  40963a:	48 39 e8             	cmp    rax,rbp
  40963d:	7e 62                	jle    0x4096a1
  40963f:	48 89 df             	mov    rdi,rbx
  409642:	e8 c0 09 00 00       	call   0x40a007
  409647:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40964b:	48 8b 4b 58          	mov    rcx,QWORD PTR [rbx+0x58]
  40964f:	85 c0                	test   eax,eax
  409651:	78 4e                	js     0x4096a1
  409653:	48 8b b3 c0 00 00 00 	mov    rsi,QWORD PTR [rbx+0xc0]
  40965a:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
  40965e:	48 83 c5 01          	add    rbp,0x1
  409662:	48 85 f6             	test   rsi,rsi
  409665:	74 14                	je     0x40967b
  409667:	49 89 f9             	mov    r9,rdi
  40966a:	48 29 ee             	sub    rsi,rbp
  40966d:	49 29 d1             	sub    r9,rdx
  409670:	4c 8d 04 32          	lea    r8,[rdx+rsi*1]
  409674:	49 39 f1             	cmp    r9,rsi
  409677:	49 0f 4f f8          	cmovg  rdi,r8
  40967b:	48 89 ce             	mov    rsi,rcx
  40967e:	48 89 bb b8 00 00 00 	mov    QWORD PTR [rbx+0xb8],rdi
  409685:	48 29 d6             	sub    rsi,rdx
  409688:	48 01 ee             	add    rsi,rbp
  40968b:	48 89 b3 c8 00 00 00 	mov    QWORD PTR [rbx+0xc8],rsi
  409692:	48 39 d1             	cmp    rcx,rdx
  409695:	72 03                	jb     0x40969a
  409697:	88 42 ff             	mov    BYTE PTR [rdx-0x1],al
  40969a:	48 83 c4 08          	add    rsp,0x8
  40969e:	5b                   	pop    rbx
  40969f:	5d                   	pop    rbp
  4096a0:	c3                   	ret
  4096a1:	48 29 d1             	sub    rcx,rdx
  4096a4:	48 89 93 b8 00 00 00 	mov    QWORD PTR [rbx+0xb8],rdx
  4096ab:	48 c7 83 c0 00 00 00 	mov    QWORD PTR [rbx+0xc0],0xffffffffffffffff
  4096b2:	ff ff ff ff 
  4096b6:	48 8d 04 29          	lea    rax,[rcx+rbp*1]
  4096ba:	48 89 83 c8 00 00 00 	mov    QWORD PTR [rbx+0xc8],rax
  4096c1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4096c6:	eb d2                	jmp    0x40969a
  4096c8:	48 81 ff 00 f0 ff ff 	cmp    rdi,0xfffffffffffff000
  4096cf:	77 04                	ja     0x4096d5
  4096d1:	48 89 f8             	mov    rax,rdi
  4096d4:	c3                   	ret
  4096d5:	53                   	push   rbx
  4096d6:	48 89 fb             	mov    rbx,rdi
  4096d9:	e8 26 f9 ff ff       	call   0x409004
  4096de:	89 df                	mov    edi,ebx
  4096e0:	f7 df                	neg    edi
  4096e2:	89 38                	mov    DWORD PTR [rax],edi
  4096e4:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  4096eb:	5b                   	pop    rbx
  4096ec:	c3                   	ret
  4096ed:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4096f4:	00 00 00 
  4096f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4096fe:	00 00 
  409700:	48 8b 0d e1 7c 00 00 	mov    rcx,QWORD PTR [rip+0x7ce1]        # 0x4113e8
  409707:	49 89 f2             	mov    r10,rsi
  40970a:	31 c0                	xor    eax,eax
  40970c:	eb 16                	jmp    0x409724
  40970e:	31 c0                	xor    eax,eax
  409710:	48 83 c4 28          	add    rsp,0x28
  409714:	5b                   	pop    rbx
  409715:	5d                   	pop    rbp
  409716:	41 5c                	pop    r12
  409718:	41 5d                	pop    r13
  40971a:	41 5e                	pop    r14
  40971c:	41 5f                	pop    r15
  40971e:	c3                   	ret
  40971f:	90                   	nop
  409720:	48 83 c0 02          	add    rax,0x2
  409724:	48 8b 14 c1          	mov    rdx,QWORD PTR [rcx+rax*8]
  409728:	48 83 fa 21          	cmp    rdx,0x21
  40972c:	74 08                	je     0x409736
  40972e:	48 85 d2             	test   rdx,rdx
  409731:	75 ed                	jne    0x409720
  409733:	31 c0                	xor    eax,eax
  409735:	c3                   	ret
  409736:	4c 8b 4c c1 08       	mov    r9,QWORD PTR [rcx+rax*8+0x8]
  40973b:	4d 85 c9             	test   r9,r9
  40973e:	74 f3                	je     0x409733
  409740:	49 8b 51 20          	mov    rdx,QWORD PTR [r9+0x20]
  409744:	45 0f b7 59 38       	movzx  r11d,WORD PTR [r9+0x38]
  409749:	31 c0                	xor    eax,eax
  40974b:	31 f6                	xor    esi,esi
  40974d:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  409754:	4c 01 ca             	add    rdx,r9
  409757:	eb 3e                	jmp    0x409797
  409759:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  40975f:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  409766:	00 00 00 00 
  40976a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  409771:	00 00 00 00 
  409775:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40977c:	00 00 00 00 
  409780:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  409784:	4c 01 c9             	add    rcx,r9
  409787:	48 2b 4a 10          	sub    rcx,QWORD PTR [rdx+0x10]
  40978b:	45 0f b7 41 36       	movzx  r8d,WORD PTR [r9+0x36]
  409790:	48 83 c6 01          	add    rsi,0x1
  409794:	4c 01 c2             	add    rdx,r8
  409797:	49 39 f3             	cmp    r11,rsi
  40979a:	74 18                	je     0x4097b4
  40979c:	44 8b 02             	mov    r8d,DWORD PTR [rdx]
  40979f:	41 83 f8 01          	cmp    r8d,0x1
  4097a3:	74 db                	je     0x409780
  4097a5:	41 83 f8 02          	cmp    r8d,0x2
  4097a9:	75 e0                	jne    0x40978b
  4097ab:	48 8b 42 08          	mov    rax,QWORD PTR [rdx+0x8]
  4097af:	4c 01 c8             	add    rax,r9
  4097b2:	eb d7                	jmp    0x40978b
  4097b4:	48 85 c0             	test   rax,rax
  4097b7:	0f 84 76 ff ff ff    	je     0x409733
  4097bd:	48 83 f9 ff          	cmp    rcx,0xffffffffffffffff
  4097c1:	0f 84 6c ff ff ff    	je     0x409733
  4097c7:	41 57                	push   r15
  4097c9:	45 31 db             	xor    r11d,r11d
  4097cc:	45 31 c9             	xor    r9d,r9d
  4097cf:	45 31 c0             	xor    r8d,r8d
  4097d2:	41 56                	push   r14
  4097d4:	41 55                	push   r13
  4097d6:	41 54                	push   r12
  4097d8:	45 31 e4             	xor    r12d,r12d
  4097db:	55                   	push   rbp
  4097dc:	31 ed                	xor    ebp,ebp
  4097de:	53                   	push   rbx
  4097df:	31 db                	xor    ebx,ebx
  4097e1:	48 83 ec 28          	sub    rsp,0x28
  4097e5:	eb 18                	jmp    0x4097ff
  4097e7:	48 81 fa f0 ff ff 6f 	cmp    rdx,0x6ffffff0
  4097ee:	74 4e                	je     0x40983e
  4097f0:	48 81 fa fc ff ff 6f 	cmp    rdx,0x6ffffffc
  4097f7:	4c 0f 44 e6          	cmove  r12,rsi
  4097fb:	48 83 c0 10          	add    rax,0x10
  4097ff:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  409802:	48 85 d2             	test   rdx,rdx
  409805:	74 3c                	je     0x409843
  409807:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
  40980b:	48 01 ce             	add    rsi,rcx
  40980e:	48 81 fa f5 fe ff 6f 	cmp    rdx,0x6ffffef5
  409815:	74 18                	je     0x40982f
  409817:	77 ce                	ja     0x4097e7
  409819:	48 83 fa 05          	cmp    rdx,0x5
  40981d:	74 15                	je     0x409834
  40981f:	48 83 fa 06          	cmp    rdx,0x6
  409823:	74 14                	je     0x409839
  409825:	48 83 fa 04          	cmp    rdx,0x4
  409829:	4c 0f 44 ce          	cmove  r9,rsi
  40982d:	eb cc                	jmp    0x4097fb
  40982f:	49 89 f3             	mov    r11,rsi
  409832:	eb c7                	jmp    0x4097fb
  409834:	48 89 f5             	mov    rbp,rsi
  409837:	eb c2                	jmp    0x4097fb
  409839:	49 89 f0             	mov    r8,rsi
  40983c:	eb bd                	jmp    0x4097fb
  40983e:	48 89 f3             	mov    rbx,rsi
  409841:	eb b8                	jmp    0x4097fb
  409843:	48 85 ed             	test   rbp,rbp
  409846:	0f 84 c2 fe ff ff    	je     0x40970e
  40984c:	4d 85 c0             	test   r8,r8
  40984f:	0f 84 b9 fe ff ff    	je     0x40970e
  409855:	4d 85 e4             	test   r12,r12
  409858:	48 0f 44 da          	cmove  rbx,rdx
  40985c:	4d 85 c9             	test   r9,r9
  40985f:	74 15                	je     0x409876
  409861:	45 8b 49 04          	mov    r9d,DWORD PTR [r9+0x4]
  409865:	4d 89 d6             	mov    r14,r10
  409868:	49 89 ff             	mov    r15,rdi
  40986b:	41 ba 27 00 00 00    	mov    r10d,0x27
  409871:	e9 f2 00 00 00       	jmp    0x409968
  409876:	45 31 c9             	xor    r9d,r9d
  409879:	4d 85 db             	test   r11,r11
  40987c:	74 e7                	je     0x409865
  40987e:	41 8b 43 08          	mov    eax,DWORD PTR [r11+0x8]
  409882:	45 8b 33             	mov    r14d,DWORD PTR [r11]
  409885:	49 8d 74 c3 10       	lea    rsi,[r11+rax*8+0x10]
  40988a:	4d 89 f5             	mov    r13,r14
  40988d:	49 89 f7             	mov    r15,rsi
  409890:	48 89 f0             	mov    rax,rsi
  409893:	4e 8d 34 b6          	lea    r14,[rsi+r14*4]
  409897:	eb 14                	jmp    0x4098ad
  409899:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4098a0:	8b 30                	mov    esi,DWORD PTR [rax]
  4098a2:	49 39 f1             	cmp    r9,rsi
  4098a5:	4c 0f 42 ce          	cmovb  r9,rsi
  4098a9:	48 83 c0 04          	add    rax,0x4
  4098ad:	4c 39 f0             	cmp    rax,r14
  4098b0:	75 ee                	jne    0x4098a0
  4098b2:	4d 85 c9             	test   r9,r9
  4098b5:	74 ae                	je     0x409865
  4098b7:	41 8b 73 04          	mov    esi,DWORD PTR [r11+0x4]
  4098bb:	4c 89 e8             	mov    rax,r13
  4098be:	48 29 f0             	sub    rax,rsi
  4098c1:	49 8d 04 87          	lea    rax,[r15+rax*4]
  4098c5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4098cc:	00 00 00 00 
  4098d0:	49 83 c1 01          	add    r9,0x1
  4098d4:	42 f6 44 88 fc 01    	test   BYTE PTR [rax+r9*4-0x4],0x1
  4098da:	74 f4                	je     0x4098d0
  4098dc:	eb 87                	jmp    0x409865
  4098de:	66 90                	xchg   ax,ax
  4098e0:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
  4098e3:	85 c0                	test   eax,eax
  4098e5:	74 79                	je     0x409960
  4098e7:	48 01 c6             	add    rsi,rax
  4098ea:	f6 46 02 01          	test   BYTE PTR [rsi+0x2],0x1
  4098ee:	75 f0                	jne    0x4098e0
  4098f0:	0f b7 46 04          	movzx  eax,WORD PTR [rsi+0x4]
  4098f4:	31 f8                	xor    eax,edi
  4098f6:	66 a9 ff 7f          	test   ax,0x7fff
  4098fa:	75 e4                	jne    0x4098e0
  4098fc:	8b 46 0c             	mov    eax,DWORD PTR [rsi+0xc]
  4098ff:	4c 89 ff             	mov    rdi,r15
  409902:	4c 89 44 24 18       	mov    QWORD PTR [rsp+0x18],r8
  409907:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
  40990c:	8b 34 06             	mov    esi,DWORD PTR [rsi+rax*1]
  40990f:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  409914:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
  409918:	48 01 ee             	add    rsi,rbp
  40991b:	e8 c0 ea ff ff       	call   0x4083e0
  409920:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
  409924:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  409929:	41 ba 27 00 00 00    	mov    r10d,0x27
  40992f:	85 c0                	test   eax,eax
  409931:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
  409936:	4c 8b 44 24 18       	mov    r8,QWORD PTR [rsp+0x18]
  40993b:	75 23                	jne    0x409960
  40993d:	49 8b 40 08          	mov    rax,QWORD PTR [r8+0x8]
  409941:	48 01 c8             	add    rax,rcx
  409944:	e9 c7 fd ff ff       	jmp    0x409710
  409949:	90                   	nop
  40994a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  409951:	00 00 00 00 
  409955:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40995c:	00 00 00 00 
  409960:	48 83 c2 01          	add    rdx,0x1
  409964:	49 83 c0 18          	add    r8,0x18
  409968:	4c 39 ca             	cmp    rdx,r9
  40996b:	0f 84 9d fd ff ff    	je     0x40970e
  409971:	41 0f b6 40 04       	movzx  eax,BYTE PTR [r8+0x4]
  409976:	89 c6                	mov    esi,eax
  409978:	83 e6 0f             	and    esi,0xf
  40997b:	41 0f a3 f2          	bt     r10d,esi
  40997f:	73 df                	jae    0x409960
  409981:	c0 e8 04             	shr    al,0x4
  409984:	be 06 04 00 00       	mov    esi,0x406
  409989:	0f a3 c6             	bt     esi,eax
  40998c:	73 d2                	jae    0x409960
  40998e:	66 41 83 78 06 00    	cmp    WORD PTR [r8+0x6],0x0
  409994:	74 ca                	je     0x409960
  409996:	41 8b 30             	mov    esi,DWORD PTR [r8]
  409999:	4c 89 f7             	mov    rdi,r14
  40999c:	4c 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],r9
  4099a1:	48 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],rcx
  4099a6:	48 01 ee             	add    rsi,rbp
  4099a9:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  4099ae:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4099b2:	e8 29 ea ff ff       	call   0x4083e0
  4099b7:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
  4099bb:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  4099c0:	41 ba 27 00 00 00    	mov    r10d,0x27
  4099c6:	85 c0                	test   eax,eax
  4099c8:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  4099cd:	4c 8b 4c 24 18       	mov    r9,QWORD PTR [rsp+0x18]
  4099d2:	75 8c                	jne    0x409960
  4099d4:	48 85 db             	test   rbx,rbx
  4099d7:	0f 84 60 ff ff ff    	je     0x40993d
  4099dd:	0f b7 3c 53          	movzx  edi,WORD PTR [rbx+rdx*2]
  4099e1:	4c 89 e6             	mov    rsi,r12
  4099e4:	e9 01 ff ff ff       	jmp    0x4098ea
  4099e9:	48 89 f8             	mov    rax,rdi
  4099ec:	c3                   	ret
  4099ed:	e9 f7 ff ff ff       	jmp    0x4099e9
  4099f2:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  4099f9:	00 00 
  4099fb:	48 8b 80 a8 00 00 00 	mov    rax,QWORD PTR [rax+0xa8]
  409a02:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  409a06:	e9 de ff ff ff       	jmp    0x4099e9
  409a0b:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  409a10:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
  409a15:	48 89 ca             	mov    rdx,rcx
  409a18:	89 c6                	mov    esi,eax
  409a1a:	25 ff 7f 00 00       	and    eax,0x7fff
  409a1f:	48 c1 ea 3f          	shr    rdx,0x3f
  409a23:	66 81 e6 ff 7f       	and    si,0x7fff
  409a28:	09 d0                	or     eax,edx
  409a2a:	74 0f                	je     0x409a3b
  409a2c:	8d 04 95 00 00 00 00 	lea    eax,[rdx*4+0x0]
  409a33:	66 81 fe ff 7f       	cmp    si,0x7fff
  409a38:	74 0e                	je     0x409a48
  409a3a:	c3                   	ret
  409a3b:	48 83 f9 01          	cmp    rcx,0x1
  409a3f:	b8 02 00 00 00       	mov    eax,0x2
  409a44:	83 d8 ff             	sbb    eax,0xffffffff
  409a47:	c3                   	ret
  409a48:	31 c0                	xor    eax,eax
  409a4a:	48 85 d2             	test   rdx,rdx
  409a4d:	74 eb                	je     0x409a3a
  409a4f:	31 c0                	xor    eax,eax
  409a51:	48 01 c9             	add    rcx,rcx
  409a54:	0f 94 c0             	sete   al
  409a57:	c3                   	ret
  409a58:	0f b7 44 24 10       	movzx  eax,WORD PTR [rsp+0x10]
  409a5d:	66 c1 e8 0f          	shr    ax,0xf
  409a61:	0f b7 c0             	movzx  eax,ax
  409a64:	c3                   	ret
  409a65:	48 83 ec 28          	sub    rsp,0x28
  409a69:	db 6c 24 30          	fld    TBYTE PTR [rsp+0x30]
  409a6d:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
  409a72:	89 c2                	mov    edx,eax
  409a74:	d9 c0                	fld    st(0)
  409a76:	db 7c 24 10          	fstp   TBYTE PTR [rsp+0x10]
  409a7a:	66 81 e2 ff 7f       	and    dx,0x7fff
  409a7f:	74 2a                	je     0x409aab
  409a81:	dd d8                	fstp   st(0)
  409a83:	66 81 fa ff 7f       	cmp    dx,0x7fff
  409a88:	74 33                	je     0x409abd
  409a8a:	0f b7 d2             	movzx  edx,dx
  409a8d:	66 25 00 80          	and    ax,0x8000
  409a91:	81 ea fe 3f 00 00    	sub    edx,0x3ffe
  409a97:	66 0d fe 3f          	or     ax,0x3ffe
  409a9b:	66 89 44 24 18       	mov    WORD PTR [rsp+0x18],ax
  409aa0:	db 6c 24 10          	fld    TBYTE PTR [rsp+0x10]
  409aa4:	89 17                	mov    DWORD PTR [rdi],edx
  409aa6:	48 83 c4 28          	add    rsp,0x28
  409aaa:	c3                   	ret
  409aab:	d9 ee                	fldz
  409aad:	d9 c9                	fxch   st(1)
  409aaf:	df e9                	fucomip st,st(1)
  409ab1:	dd d8                	fstp   st(0)
  409ab3:	7a 0e                	jp     0x409ac3
  409ab5:	75 0c                	jne    0x409ac3
  409ab7:	c7 07 00 00 00 00    	mov    DWORD PTR [rdi],0x0
  409abd:	db 6c 24 30          	fld    TBYTE PTR [rsp+0x30]
  409ac1:	eb e3                	jmp    0x409aa6
  409ac3:	db 6c 24 30          	fld    TBYTE PTR [rsp+0x30]
  409ac7:	d8 0d 1b 36 00 00    	fmul   DWORD PTR [rip+0x361b]        # 0x40d0e8
  409acd:	48 83 ec 10          	sub    rsp,0x10
  409ad1:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
  409ad6:	db 3c 24             	fstp   TBYTE PTR [rsp]
  409ad9:	e8 87 ff ff ff       	call   0x409a65
  409ade:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
  409ae3:	83 2f 78             	sub    DWORD PTR [rdi],0x78
  409ae6:	58                   	pop    rax
  409ae7:	5a                   	pop    rdx
  409ae8:	eb bc                	jmp    0x409aa6
  409aea:	81 ff ff 03 00 00    	cmp    edi,0x3ff
  409af0:	7e 30                	jle    0x409b22
  409af2:	f2 0f 10 0d 5e 19 00 	movsd  xmm1,QWORD PTR [rip+0x195e]        # 0x40b458
  409af9:	00 
  409afa:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  409afe:	81 ff fe 07 00 00    	cmp    edi,0x7fe
  409b04:	7e 2a                	jle    0x409b30
  409b06:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  409b0a:	81 ef fe 07 00 00    	sub    edi,0x7fe
  409b10:	b8 ff 03 00 00       	mov    eax,0x3ff
  409b15:	39 c7                	cmp    edi,eax
  409b17:	0f 4f f8             	cmovg  edi,eax
  409b1a:	81 c7 ff 03 00 00    	add    edi,0x3ff
  409b20:	eb 0e                	jmp    0x409b30
  409b22:	81 ff 02 fc ff ff    	cmp    edi,0xfffffc02
  409b28:	7c 14                	jl     0x409b3e
  409b2a:	81 c7 ff 03 00 00    	add    edi,0x3ff
  409b30:	48 c1 e7 34          	shl    rdi,0x34
  409b34:	66 48 0f 6e d7       	movq   xmm2,rdi
  409b39:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  409b3d:	c3                   	ret
  409b3e:	f2 0f 10 0d 1a 19 00 	movsd  xmm1,QWORD PTR [rip+0x191a]        # 0x40b460
  409b45:	00 
  409b46:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  409b4a:	81 ff 39 f8 ff ff    	cmp    edi,0xfffff839
  409b50:	7c 08                	jl     0x409b5a
  409b52:	81 c7 c8 07 00 00    	add    edi,0x7c8
  409b58:	eb d6                	jmp    0x409b30
  409b5a:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  409b5e:	81 c7 92 07 00 00    	add    edi,0x792
  409b64:	b8 02 fc ff ff       	mov    eax,0xfffffc02
  409b69:	39 c7                	cmp    edi,eax
  409b6b:	0f 4c f8             	cmovl  edi,eax
  409b6e:	eb ba                	jmp    0x409b2a
  409b70:	48 85 ff             	test   rdi,rdi
  409b73:	74 10                	je     0x409b85
  409b75:	48 83 ec 08          	sub    rsp,0x8
  409b79:	31 d2                	xor    edx,edx
  409b7b:	e8 df 05 00 00       	call   0x40a15f
  409b80:	48 83 c4 08          	add    rsp,0x8
  409b84:	c3                   	ret
  409b85:	31 c0                	xor    eax,eax
  409b87:	c3                   	ret
  409b88:	53                   	push   rbx
  409b89:	8b 8f 8c 00 00 00    	mov    ecx,DWORD PTR [rdi+0x8c]
  409b8f:	64 48 8b 04 25 00 00 	mov    rax,QWORD PTR fs:0x0
  409b96:	00 00 
  409b98:	44 8b 40 30          	mov    r8d,DWORD PTR [rax+0x30]
  409b9c:	81 e1 ff ff ff bf    	and    ecx,0xbfffffff
  409ba2:	31 c0                	xor    eax,eax
  409ba4:	44 39 c1             	cmp    ecx,r8d
  409ba7:	74 23                	je     0x409bcc
  409ba9:	48 89 fa             	mov    rdx,rdi
  409bac:	48 8d bf 8c 00 00 00 	lea    rdi,[rdi+0x8c]
  409bb3:	f0 44 0f b1 82 8c 00 	lock cmpxchg DWORD PTR [rdx+0x8c],r8d
  409bba:	00 00 
  409bbc:	41 81 c8 00 00 00 40 	or     r8d,0x40000000
  409bc3:	85 c0                	test   eax,eax
  409bc5:	75 11                	jne    0x409bd8
  409bc7:	b8 01 00 00 00       	mov    eax,0x1
  409bcc:	5b                   	pop    rbx
  409bcd:	c3                   	ret
  409bce:	89 c8                	mov    eax,ecx
  409bd0:	f0 0f b1 17          	lock cmpxchg DWORD PTR [rdi],edx
  409bd4:	39 c8                	cmp    eax,ecx
  409bd6:	74 1d                	je     0x409bf5
  409bd8:	31 c0                	xor    eax,eax
  409bda:	f0 44 0f b1 07       	lock cmpxchg DWORD PTR [rdi],r8d
  409bdf:	89 c1                	mov    ecx,eax
  409be1:	85 c0                	test   eax,eax
  409be3:	74 e2                	je     0x409bc7
  409be5:	89 ca                	mov    edx,ecx
  409be7:	81 ca 00 00 00 40    	or     edx,0x40000000
  409bed:	f7 c1 00 00 00 40    	test   ecx,0x40000000
  409bf3:	74 d9                	je     0x409bce
  409bf5:	48 63 d2             	movsxd rdx,edx
  409bf8:	45 31 d2             	xor    r10d,r10d
  409bfb:	b8 ca 00 00 00       	mov    eax,0xca
  409c00:	be 80 00 00 00       	mov    esi,0x80
  409c05:	0f 05                	syscall
  409c07:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  409c0b:	75 cb                	jne    0x409bd8
  409c0d:	45 31 d2             	xor    r10d,r10d
  409c10:	31 f6                	xor    esi,esi
  409c12:	b8 ca 00 00 00       	mov    eax,0xca
  409c17:	0f 05                	syscall
  409c19:	eb bd                	jmp    0x409bd8
  409c1b:	48 89 fa             	mov    rdx,rdi
  409c1e:	31 c0                	xor    eax,eax
  409c20:	48 8d bf 8c 00 00 00 	lea    rdi,[rdi+0x8c]
  409c27:	87 82 8c 00 00 00    	xchg   DWORD PTR [rdx+0x8c],eax
  409c2d:	a9 00 00 00 40       	test   eax,0x40000000
  409c32:	74 17                	je     0x409c4b
  409c34:	be 81 00 00 00       	mov    esi,0x81
  409c39:	b8 ca 00 00 00       	mov    eax,0xca
  409c3e:	ba 01 00 00 00       	mov    edx,0x1
  409c43:	0f 05                	syscall
  409c45:	48 83 f8 da          	cmp    rax,0xffffffffffffffda
  409c49:	74 01                	je     0x409c4c
  409c4b:	c3                   	ret
  409c4c:	b8 ca 00 00 00       	mov    eax,0xca
  409c51:	be 01 00 00 00       	mov    esi,0x1
  409c56:	0f 05                	syscall
  409c58:	c3                   	ret
  409c59:	48 83 ec 28          	sub    rsp,0x28
  409c5d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  409c64:	00 00 
  409c66:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  409c6b:	31 c0                	xor    eax,eax
  409c6d:	48 8b 47 20          	mov    rax,QWORD PTR [rdi+0x20]
  409c71:	40 88 74 24 17       	mov    BYTE PTR [rsp+0x17],sil
  409c76:	48 85 c0             	test   rax,rax
  409c79:	74 22                	je     0x409c9d
  409c7b:	48 8b 57 28          	mov    rdx,QWORD PTR [rdi+0x28]
  409c7f:	48 39 c2             	cmp    rdx,rax
  409c82:	74 39                	je     0x409cbd
  409c84:	0f b6 44 24 17       	movzx  eax,BYTE PTR [rsp+0x17]
  409c89:	3b 87 90 00 00 00    	cmp    eax,DWORD PTR [rdi+0x90]
  409c8f:	74 2c                	je     0x409cbd
  409c91:	48 8d 72 01          	lea    rsi,[rdx+0x1]
  409c95:	48 89 77 28          	mov    QWORD PTR [rdi+0x28],rsi
  409c99:	88 02                	mov    BYTE PTR [rdx],al
  409c9b:	eb 38                	jmp    0x409cd5
  409c9d:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  409ca2:	e8 0d 03 00 00       	call   0x409fb4
  409ca7:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  409cac:	85 c0                	test   eax,eax
  409cae:	75 06                	jne    0x409cb6
  409cb0:	48 8b 47 20          	mov    rax,QWORD PTR [rdi+0x20]
  409cb4:	eb c5                	jmp    0x409c7b
  409cb6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  409cbb:	eb 18                	jmp    0x409cd5
  409cbd:	48 8d 74 24 17       	lea    rsi,[rsp+0x17]
  409cc2:	ba 01 00 00 00       	mov    edx,0x1
  409cc7:	ff 57 48             	call   QWORD PTR [rdi+0x48]
  409cca:	48 83 f8 01          	cmp    rax,0x1
  409cce:	75 e6                	jne    0x409cb6
  409cd0:	0f b6 44 24 17       	movzx  eax,BYTE PTR [rsp+0x17]
  409cd5:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  409cda:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  409ce1:	00 00 
  409ce3:	75 05                	jne    0x409cea
  409ce5:	48 83 c4 28          	add    rsp,0x28
  409ce9:	c3                   	ret
  409cea:	e8 5d a6 ff ff       	call   0x40434c
  409cef:	89 f8                	mov    eax,edi
  409cf1:	c3                   	ret
  409cf2:	48 83 ec 08          	sub    rsp,0x8
  409cf6:	8b 7f 78             	mov    edi,DWORD PTR [rdi+0x78]
  409cf9:	e8 f1 ff ff ff       	call   0x409cef
  409cfe:	48 63 f8             	movsxd rdi,eax
  409d01:	b8 03 00 00 00       	mov    eax,0x3
  409d06:	0f 05                	syscall
  409d08:	48 89 c7             	mov    rdi,rax
  409d0b:	e8 b8 f9 ff ff       	call   0x4096c8
  409d10:	48 83 c4 08          	add    rsp,0x8
  409d14:	c3                   	ret
  409d15:	41 54                	push   r12
  409d17:	49 89 fc             	mov    r12,rdi
  409d1a:	55                   	push   rbp
  409d1b:	48 89 f5             	mov    rbp,rsi
  409d1e:	53                   	push   rbx
  409d1f:	48 83 ec 30          	sub    rsp,0x30
  409d23:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
  409d2a:	00 00 
  409d2c:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  409d31:	48 89 d3             	mov    rbx,rdx
  409d34:	48 8b 57 60          	mov    rdx,QWORD PTR [rdi+0x60]
  409d38:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
  409d3c:	48 8b 77 58          	mov    rsi,QWORD PTR [rdi+0x58]
  409d40:	48 63 7f 78          	movsxd rdi,DWORD PTR [rdi+0x78]
  409d44:	48 83 fa 01          	cmp    rdx,0x1
  409d48:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  409d4d:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  409d52:	48 89 d8             	mov    rax,rbx
  409d55:	48 83 d0 ff          	adc    rax,0xffffffffffffffff
  409d59:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  409d5e:	48 85 c0             	test   rax,rax
  409d61:	74 55                	je     0x409db8
  409d63:	48 89 e6             	mov    rsi,rsp
  409d66:	b8 13 00 00 00       	mov    eax,0x13
  409d6b:	ba 02 00 00 00       	mov    edx,0x2
  409d70:	0f 05                	syscall
  409d72:	48 89 c7             	mov    rdi,rax
  409d75:	e8 4e f9 ff ff       	call   0x4096c8
  409d7a:	48 85 c0             	test   rax,rax
  409d7d:	7e 45                	jle    0x409dc4
  409d7f:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  409d84:	48 89 c2             	mov    rdx,rax
  409d87:	48 39 c1             	cmp    rcx,rax
  409d8a:	73 4a                	jae    0x409dd6
  409d8c:	49 8b 54 24 58       	mov    rdx,QWORD PTR [r12+0x58]
  409d91:	48 29 c8             	sub    rax,rcx
  409d94:	48 01 d0             	add    rax,rdx
  409d97:	66 48 0f 6e c2       	movq   xmm0,rdx
  409d9c:	66 48 0f 6e c8       	movq   xmm1,rax
  409da1:	66 0f 6c c1          	punpcklqdq xmm0,xmm1
  409da5:	41 0f 11 44 24 08    	movups XMMWORD PTR [r12+0x8],xmm0
  409dab:	49 83 7c 24 60 00    	cmp    QWORD PTR [r12+0x60],0x0
  409db1:	75 3f                	jne    0x409df2
  409db3:	48 89 da             	mov    rdx,rbx
  409db6:	eb 1e                	jmp    0x409dd6
  409db8:	0f 05                	syscall
  409dba:	48 89 c7             	mov    rdi,rax
  409dbd:	e8 06 f9 ff ff       	call   0x4096c8
  409dc2:	eb b6                	jmp    0x409d7a
  409dc4:	48 83 f8 01          	cmp    rax,0x1
  409dc8:	19 c0                	sbb    eax,eax
  409dca:	31 d2                	xor    edx,edx
  409dcc:	83 e0 f0             	and    eax,0xfffffff0
  409dcf:	83 c0 20             	add    eax,0x20
  409dd2:	41 09 04 24          	or     DWORD PTR [r12],eax
  409dd6:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  409ddb:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  409de2:	00 00 
  409de4:	75 1e                	jne    0x409e04
  409de6:	48 83 c4 30          	add    rsp,0x30
  409dea:	48 89 d0             	mov    rax,rdx
  409ded:	5b                   	pop    rbx
  409dee:	5d                   	pop    rbp
  409def:	41 5c                	pop    r12
  409df1:	c3                   	ret
  409df2:	48 8d 42 01          	lea    rax,[rdx+0x1]
  409df6:	49 89 44 24 08       	mov    QWORD PTR [r12+0x8],rax
  409dfb:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  409dfe:	88 44 1d ff          	mov    BYTE PTR [rbp+rbx*1-0x1],al
  409e02:	eb af                	jmp    0x409db3
  409e04:	e8 43 a5 ff ff       	call   0x40434c
  409e09:	8b 7f 78             	mov    edi,DWORD PTR [rdi+0x78]
  409e0c:	e9 39 03 00 00       	jmp    0x40a14a
  409e11:	41 57                	push   r15
  409e13:	48 89 d1             	mov    rcx,rdx
  409e16:	41 56                	push   r14
  409e18:	41 55                	push   r13
  409e1a:	41 54                	push   r12
  409e1c:	55                   	push   rbp
  409e1d:	53                   	push   rbx
  409e1e:	48 89 fb             	mov    rbx,rdi
  409e21:	48 83 ec 48          	sub    rsp,0x48
  409e25:	48 8b 47 28          	mov    rax,QWORD PTR [rdi+0x28]
  409e29:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  409e2e:	64 48 8b 14 25 28 00 	mov    rdx,QWORD PTR fs:0x28
  409e35:	00 00 
  409e37:	48 89 54 24 38       	mov    QWORD PTR [rsp+0x38],rdx
  409e3c:	48 8b 57 38          	mov    rdx,QWORD PTR [rdi+0x38]
  409e40:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
  409e45:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
  409e4a:	48 29 d0             	sub    rax,rdx
  409e4d:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
  409e52:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  409e57:	4c 8d 34 08          	lea    r14,[rax+rcx*1]
  409e5b:	74 12                	je     0x409e6f
  409e5d:	bd 02 00 00 00       	mov    ebp,0x2
  409e62:	4c 8d 7c 24 10       	lea    r15,[rsp+0x10]
  409e67:	4c 63 e5             	movsxd r12,ebp
  409e6a:	e9 84 00 00 00       	jmp    0x409ef3
  409e6f:	bd 01 00 00 00       	mov    ebp,0x1
  409e74:	4c 8d 7c 24 20       	lea    r15,[rsp+0x20]
  409e79:	eb ec                	jmp    0x409e67
  409e7b:	48 8b 43 58          	mov    rax,QWORD PTR [rbx+0x58]
  409e7f:	48 8b 4b 60          	mov    rcx,QWORD PTR [rbx+0x60]
  409e83:	48 01 c1             	add    rcx,rax
  409e86:	66 48 0f 6e c8       	movq   xmm1,rax
  409e8b:	48 89 43 38          	mov    QWORD PTR [rbx+0x38],rax
  409e8f:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  409e94:	66 48 0f 6e c1       	movq   xmm0,rcx
  409e99:	66 0f 6c c1          	punpcklqdq xmm0,xmm1
  409e9d:	0f 11 43 20          	movups XMMWORD PTR [rbx+0x20],xmm0
  409ea1:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
  409ea6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  409ead:	00 00 
  409eaf:	0f 85 84 00 00 00    	jne    0x409f39
  409eb5:	48 83 c4 48          	add    rsp,0x48
  409eb9:	5b                   	pop    rbx
  409eba:	5d                   	pop    rbp
  409ebb:	41 5c                	pop    r12
  409ebd:	41 5d                	pop    r13
  409ebf:	41 5e                	pop    r14
  409ec1:	41 5f                	pop    r15
  409ec3:	c3                   	ret
  409ec4:	66 0f ef c0          	pxor   xmm0,xmm0
  409ec8:	83 0b 20             	or     DWORD PTR [rbx],0x20
  409ecb:	31 c0                	xor    eax,eax
  409ecd:	48 c7 43 38 00 00 00 	mov    QWORD PTR [rbx+0x38],0x0
  409ed4:	00 
  409ed5:	0f 11 43 20          	movups XMMWORD PTR [rbx+0x20],xmm0
  409ed9:	83 fd 02             	cmp    ebp,0x2
  409edc:	74 c3                	je     0x409ea1
  409ede:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  409ee3:	49 2b 47 08          	sub    rax,QWORD PTR [r15+0x8]
  409ee7:	eb b8                	jmp    0x409ea1
  409ee9:	48 29 c2             	sub    rdx,rax
  409eec:	49 01 07             	add    QWORD PTR [r15],rax
  409eef:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  409ef3:	48 63 7b 78          	movsxd rdi,DWORD PTR [rbx+0x78]
  409ef7:	b8 14 00 00 00       	mov    eax,0x14
  409efc:	4c 89 fe             	mov    rsi,r15
  409eff:	4c 89 e2             	mov    rdx,r12
  409f02:	0f 05                	syscall
  409f04:	48 89 c7             	mov    rdi,rax
  409f07:	e8 bc f7 ff ff       	call   0x4096c8
  409f0c:	49 39 c6             	cmp    r14,rax
  409f0f:	0f 84 66 ff ff ff    	je     0x409e7b
  409f15:	48 85 c0             	test   rax,rax
  409f18:	78 aa                	js     0x409ec4
  409f1a:	49 8b 57 08          	mov    rdx,QWORD PTR [r15+0x8]
  409f1e:	49 29 c6             	sub    r14,rax
  409f21:	48 39 c2             	cmp    rdx,rax
  409f24:	73 c3                	jae    0x409ee9
  409f26:	83 ed 01             	sub    ebp,0x1
  409f29:	48 29 d0             	sub    rax,rdx
  409f2c:	49 83 c7 10          	add    r15,0x10
  409f30:	49 8b 57 08          	mov    rdx,QWORD PTR [r15+0x8]
  409f34:	4c 63 e5             	movsxd r12,ebp
  409f37:	eb b0                	jmp    0x409ee9
  409f39:	e8 0e a4 ff ff       	call   0x40434c
  409f3e:	48 83 ec 18          	sub    rsp,0x18
  409f42:	48 8d 05 c8 fe ff ff 	lea    rax,[rip+0xfffffffffffffec8]        # 0x409e11
  409f49:	49 89 f8             	mov    r8,rdi
  409f4c:	49 89 f1             	mov    r9,rsi
  409f4f:	64 4c 8b 14 25 28 00 	mov    r10,QWORD PTR fs:0x28
  409f56:	00 00 
  409f58:	4c 89 54 24 08       	mov    QWORD PTR [rsp+0x8],r10
  409f5d:	49 89 d2             	mov    r10,rdx
  409f60:	48 89 47 48          	mov    QWORD PTR [rdi+0x48],rax
  409f64:	f6 07 40             	test   BYTE PTR [rdi],0x40
  409f67:	75 23                	jne    0x409f8c
  409f69:	48 63 7f 78          	movsxd rdi,DWORD PTR [rdi+0x78]
  409f6d:	48 89 e2             	mov    rdx,rsp
  409f70:	b8 10 00 00 00       	mov    eax,0x10
  409f75:	be 13 54 00 00       	mov    esi,0x5413
  409f7a:	0f 05                	syscall
  409f7c:	48 85 c0             	test   rax,rax
  409f7f:	74 0b                	je     0x409f8c
  409f81:	41 c7 80 90 00 00 00 	mov    DWORD PTR [r8+0x90],0xffffffff
  409f88:	ff ff ff ff 
  409f8c:	4c 89 d2             	mov    rdx,r10
  409f8f:	4c 89 ce             	mov    rsi,r9
  409f92:	4c 89 c7             	mov    rdi,r8
  409f95:	e8 77 fe ff ff       	call   0x409e11
  409f9a:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  409f9f:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  409fa6:	00 00 
  409fa8:	75 05                	jne    0x409faf
  409faa:	48 83 c4 18          	add    rsp,0x18
  409fae:	c3                   	ret
  409faf:	e8 98 a3 ff ff       	call   0x40434c
  409fb4:	8b 97 88 00 00 00    	mov    edx,DWORD PTR [rdi+0x88]
  409fba:	8d 42 ff             	lea    eax,[rdx-0x1]
  409fbd:	09 d0                	or     eax,edx
  409fbf:	89 87 88 00 00 00    	mov    DWORD PTR [rdi+0x88],eax
  409fc5:	8b 07                	mov    eax,DWORD PTR [rdi]
  409fc7:	a8 08                	test   al,0x8
  409fc9:	75 2c                	jne    0x409ff7
  409fcb:	48 8b 47 58          	mov    rax,QWORD PTR [rdi+0x58]
  409fcf:	48 8b 4f 60          	mov    rcx,QWORD PTR [rdi+0x60]
  409fd3:	66 0f ef c0          	pxor   xmm0,xmm0
  409fd7:	0f 11 47 08          	movups XMMWORD PTR [rdi+0x8],xmm0
  409fdb:	48 01 c1             	add    rcx,rax
  409fde:	66 48 0f 6e c8       	movq   xmm1,rax
  409fe3:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
  409fe7:	31 c0                	xor    eax,eax
  409fe9:	66 48 0f 6e c1       	movq   xmm0,rcx
  409fee:	66 0f 6c c1          	punpcklqdq xmm0,xmm1
  409ff2:	0f 11 47 20          	movups XMMWORD PTR [rdi+0x20],xmm0
  409ff6:	c3                   	ret
  409ff7:	83 c8 20             	or     eax,0x20
  409ffa:	89 07                	mov    DWORD PTR [rdi],eax
  409ffc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40a001:	c3                   	ret
  40a002:	e9 b4 02 00 00       	jmp    0x40a2bb
  40a007:	53                   	push   rbx
  40a008:	48 83 ec 10          	sub    rsp,0x10
  40a00c:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
  40a013:	00 00 
  40a015:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
  40a01a:	48 89 fb             	mov    rbx,rdi
  40a01d:	e8 da 02 00 00       	call   0x40a2fc
  40a022:	85 c0                	test   eax,eax
  40a024:	75 31                	jne    0x40a057
  40a026:	48 8d 74 24 07       	lea    rsi,[rsp+0x7]
  40a02b:	ba 01 00 00 00       	mov    edx,0x1
  40a030:	48 89 df             	mov    rdi,rbx
  40a033:	ff 53 40             	call   QWORD PTR [rbx+0x40]
  40a036:	48 83 f8 01          	cmp    rax,0x1
  40a03a:	75 1b                	jne    0x40a057
  40a03c:	0f b6 44 24 07       	movzx  eax,BYTE PTR [rsp+0x7]
  40a041:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
  40a046:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40a04d:	00 00 
  40a04f:	75 0d                	jne    0x40a05e
  40a051:	48 83 c4 10          	add    rsp,0x10
  40a055:	5b                   	pop    rbx
  40a056:	c3                   	ret
  40a057:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40a05c:	eb e3                	jmp    0x40a041
  40a05e:	e8 e9 a2 ff ff       	call   0x40434c
  40a063:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40a06a:	00 00 00 
  40a06d:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40a074:	00 00 00 
  40a077:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40a07e:	00 00 
  40a080:	eb 2a                	jmp    0x40a0ac
  40a082:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40a089:	00 
  40a08a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40a091:	00 00 00 00 
  40a095:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  40a09c:	00 00 00 00 
  40a0a0:	48 83 ea 01          	sub    rdx,0x1
  40a0a4:	48 83 c7 01          	add    rdi,0x1
  40a0a8:	48 83 c6 01          	add    rsi,0x1
  40a0ac:	48 85 d2             	test   rdx,rdx
  40a0af:	74 10                	je     0x40a0c1
  40a0b1:	0f b6 06             	movzx  eax,BYTE PTR [rsi]
  40a0b4:	38 07                	cmp    BYTE PTR [rdi],al
  40a0b6:	74 e8                	je     0x40a0a0
  40a0b8:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
  40a0bb:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  40a0be:	29 d0                	sub    eax,edx
  40a0c0:	c3                   	ret
  40a0c1:	31 c0                	xor    eax,eax
  40a0c3:	c3                   	ret
  40a0c4:	53                   	push   rbx
  40a0c5:	89 f3                	mov    ebx,esi
  40a0c7:	e8 34 e2 ff ff       	call   0x408300
  40a0cc:	31 d2                	xor    edx,edx
  40a0ce:	38 18                	cmp    BYTE PTR [rax],bl
  40a0d0:	5b                   	pop    rbx
  40a0d1:	48 0f 45 c2          	cmovne rax,rdx
  40a0d5:	c3                   	ret
  40a0d6:	48 89 fe             	mov    rsi,rdi
  40a0d9:	bf 02 10 00 00       	mov    edi,0x1002
  40a0de:	b8 9e 00 00 00       	mov    eax,0x9e
  40a0e3:	0f 05                	syscall
  40a0e5:	c3                   	ret
  40a0e6:	83 ff 03             	cmp    edi,0x3
  40a0e9:	74 59                	je     0x40a144
  40a0eb:	49 89 ca             	mov    r10,rcx
  40a0ee:	89 f9                	mov    ecx,edi
  40a0f0:	48 83 ec 08          	sub    rsp,0x8
  40a0f4:	09 f1                	or     ecx,esi
  40a0f6:	74 28                	je     0x40a120
  40a0f8:	48 83 ec 08          	sub    rsp,0x8
  40a0fc:	48 89 d1             	mov    rcx,rdx
  40a0ff:	45 31 c9             	xor    r9d,r9d
  40a102:	48 63 d6             	movsxd rdx,esi
  40a105:	6a 00                	push   0x0
  40a107:	48 63 f7             	movsxd rsi,edi
  40a10a:	4d 89 d0             	mov    r8,r10
  40a10d:	bf e6 00 00 00       	mov    edi,0xe6
  40a112:	e8 78 02 00 00       	call   0x40a38f
  40a117:	5a                   	pop    rdx
  40a118:	59                   	pop    rcx
  40a119:	f7 d8                	neg    eax
  40a11b:	48 83 c4 08          	add    rsp,0x8
  40a11f:	c3                   	ret
  40a120:	48 83 ec 08          	sub    rsp,0x8
  40a124:	48 89 d6             	mov    rsi,rdx
  40a127:	bf 23 00 00 00       	mov    edi,0x23
  40a12c:	45 31 c9             	xor    r9d,r9d
  40a12f:	6a 00                	push   0x0
  40a131:	45 31 c0             	xor    r8d,r8d
  40a134:	31 c9                	xor    ecx,ecx
  40a136:	4c 89 d2             	mov    rdx,r10
  40a139:	e8 51 02 00 00       	call   0x40a38f
  40a13e:	5e                   	pop    rsi
  40a13f:	5f                   	pop    rdi
  40a140:	f7 d8                	neg    eax
  40a142:	eb d7                	jmp    0x40a11b
  40a144:	b8 16 00 00 00       	mov    eax,0x16
  40a149:	c3                   	ret
  40a14a:	48 63 ff             	movsxd rdi,edi
  40a14d:	48 63 d2             	movsxd rdx,edx
  40a150:	b8 08 00 00 00       	mov    eax,0x8
  40a155:	0f 05                	syscall
  40a157:	48 89 c7             	mov    rdi,rax
  40a15a:	e9 69 f5 ff ff       	jmp    0x4096c8
  40a15f:	48 85 ff             	test   rdi,rdi
  40a162:	0f 84 fd 00 00 00    	je     0x40a265
  40a168:	83 fe 7f             	cmp    esi,0x7f
  40a16b:	0f 86 f1 00 00 00    	jbe    0x40a262
  40a171:	48 83 ec 08          	sub    rsp,0x8
  40a175:	89 f0                	mov    eax,esi
  40a177:	48 89 f9             	mov    rcx,rdi
  40a17a:	64 48 8b 14 25 00 00 	mov    rdx,QWORD PTR fs:0x0
  40a181:	00 00 
  40a183:	48 8b 92 a8 00 00 00 	mov    rdx,QWORD PTR [rdx+0xa8]
  40a18a:	48 83 3a 00          	cmp    QWORD PTR [rdx],0x0
  40a18e:	74 40                	je     0x40a1d0
  40a190:	81 fe ff 07 00 00    	cmp    esi,0x7ff
  40a196:	76 4f                	jbe    0x40a1e7
  40a198:	8d 96 00 20 ff ff    	lea    edx,[rsi-0xe000]
  40a19e:	81 fa ff 1f 00 00    	cmp    edx,0x1fff
  40a1a4:	76 5b                	jbe    0x40a201
  40a1a6:	81 fe ff d7 00 00    	cmp    esi,0xd7ff
  40a1ac:	76 53                	jbe    0x40a201
  40a1ae:	8d 96 00 00 ff ff    	lea    edx,[rsi-0x10000]
  40a1b4:	81 fa ff ff 0f 00    	cmp    edx,0xfffff
  40a1ba:	76 6d                	jbe    0x40a229
  40a1bc:	e8 43 ee ff ff       	call   0x409004
  40a1c1:	c7 00 54 00 00 00    	mov    DWORD PTR [rax],0x54
  40a1c7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  40a1ce:	eb 12                	jmp    0x40a1e2
  40a1d0:	2d 80 df 00 00       	sub    eax,0xdf80
  40a1d5:	83 f8 7f             	cmp    eax,0x7f
  40a1d8:	77 e2                	ja     0x40a1bc
  40a1da:	40 88 37             	mov    BYTE PTR [rdi],sil
  40a1dd:	b8 01 00 00 00       	mov    eax,0x1
  40a1e2:	48 83 c4 08          	add    rsp,0x8
  40a1e6:	c3                   	ret
  40a1e7:	89 f2                	mov    edx,esi
  40a1e9:	83 e0 3f             	and    eax,0x3f
  40a1ec:	c1 fa 06             	sar    edx,0x6
  40a1ef:	83 c8 80             	or     eax,0xffffff80
  40a1f2:	83 ca c0             	or     edx,0xffffffc0
  40a1f5:	88 47 01             	mov    BYTE PTR [rdi+0x1],al
  40a1f8:	b8 02 00 00 00       	mov    eax,0x2
  40a1fd:	88 17                	mov    BYTE PTR [rdi],dl
  40a1ff:	eb e1                	jmp    0x40a1e2
  40a201:	89 c2                	mov    edx,eax
  40a203:	c1 fa 0c             	sar    edx,0xc
  40a206:	83 ca e0             	or     edx,0xffffffe0
  40a209:	88 11                	mov    BYTE PTR [rcx],dl
  40a20b:	89 c2                	mov    edx,eax
  40a20d:	83 e0 3f             	and    eax,0x3f
  40a210:	c1 fa 06             	sar    edx,0x6
  40a213:	83 c8 80             	or     eax,0xffffff80
  40a216:	83 e2 3f             	and    edx,0x3f
  40a219:	88 41 02             	mov    BYTE PTR [rcx+0x2],al
  40a21c:	b8 03 00 00 00       	mov    eax,0x3
  40a221:	83 ca 80             	or     edx,0xffffff80
  40a224:	88 51 01             	mov    BYTE PTR [rcx+0x1],dl
  40a227:	eb b9                	jmp    0x40a1e2
  40a229:	89 c7                	mov    edi,eax
  40a22b:	83 e0 3f             	and    eax,0x3f
  40a22e:	89 f2                	mov    edx,esi
  40a230:	c1 fe 0c             	sar    esi,0xc
  40a233:	c1 ff 06             	sar    edi,0x6
  40a236:	c1 e0 08             	shl    eax,0x8
  40a239:	83 e6 3f             	and    esi,0x3f
  40a23c:	83 e7 3f             	and    edi,0x3f
  40a23f:	c1 fa 12             	sar    edx,0x12
  40a242:	09 f8                	or     eax,edi
  40a244:	0f b6 d2             	movzx  edx,dl
  40a247:	c1 e0 08             	shl    eax,0x8
  40a24a:	09 f0                	or     eax,esi
  40a24c:	8b 35 9a 2e 00 00    	mov    esi,DWORD PTR [rip+0x2e9a]        # 0x40d0ec
  40a252:	c1 e0 08             	shl    eax,0x8
  40a255:	09 d0                	or     eax,edx
  40a257:	09 f0                	or     eax,esi
  40a259:	89 01                	mov    DWORD PTR [rcx],eax
  40a25b:	b8 04 00 00 00       	mov    eax,0x4
  40a260:	eb 80                	jmp    0x40a1e2
  40a262:	40 88 37             	mov    BYTE PTR [rdi],sil
  40a265:	b8 01 00 00 00       	mov    eax,0x1
  40a26a:	c3                   	ret
  40a26b:	48 85 ff             	test   rdi,rdi
  40a26e:	74 4a                	je     0x40a2ba
  40a270:	53                   	push   rbx
  40a271:	8b 87 8c 00 00 00    	mov    eax,DWORD PTR [rdi+0x8c]
  40a277:	48 89 fb             	mov    rbx,rdi
  40a27a:	85 c0                	test   eax,eax
  40a27c:	79 33                	jns    0x40a2b1
  40a27e:	48 8b 43 38          	mov    rax,QWORD PTR [rbx+0x38]
  40a282:	48 39 43 28          	cmp    QWORD PTR [rbx+0x28],rax
  40a286:	74 0a                	je     0x40a292
  40a288:	31 d2                	xor    edx,edx
  40a28a:	31 f6                	xor    esi,esi
  40a28c:	48 89 df             	mov    rdi,rbx
  40a28f:	ff 53 48             	call   QWORD PTR [rbx+0x48]
  40a292:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40a296:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
  40a29a:	48 39 c6             	cmp    rsi,rax
  40a29d:	74 19                	je     0x40a2b8
  40a29f:	48 29 c6             	sub    rsi,rax
  40a2a2:	48 89 df             	mov    rdi,rbx
  40a2a5:	48 8b 43 50          	mov    rax,QWORD PTR [rbx+0x50]
  40a2a9:	ba 01 00 00 00       	mov    edx,0x1
  40a2ae:	5b                   	pop    rbx
  40a2af:	ff e0                	jmp    rax
  40a2b1:	e8 d2 f8 ff ff       	call   0x409b88
  40a2b6:	eb c6                	jmp    0x40a27e
  40a2b8:	5b                   	pop    rbx
  40a2b9:	c3                   	ret
  40a2ba:	c3                   	ret
  40a2bb:	53                   	push   rbx
  40a2bc:	e8 d8 ad ff ff       	call   0x405099
  40a2c1:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  40a2c4:	eb 0c                	jmp    0x40a2d2
  40a2c6:	48 89 df             	mov    rdi,rbx
  40a2c9:	e8 9d ff ff ff       	call   0x40a26b
  40a2ce:	48 8b 5b 70          	mov    rbx,QWORD PTR [rbx+0x70]
  40a2d2:	48 85 db             	test   rbx,rbx
  40a2d5:	75 ef                	jne    0x40a2c6
  40a2d7:	48 8b 3d 2a 5e 00 00 	mov    rdi,QWORD PTR [rip+0x5e2a]        # 0x410108
  40a2de:	e8 88 ff ff ff       	call   0x40a26b
  40a2e3:	48 8b 3d 1e 5f 00 00 	mov    rdi,QWORD PTR [rip+0x5f1e]        # 0x410208
  40a2ea:	e8 7c ff ff ff       	call   0x40a26b
  40a2ef:	48 8b 3d 1a 5d 00 00 	mov    rdi,QWORD PTR [rip+0x5d1a]        # 0x410010
  40a2f6:	5b                   	pop    rbx
  40a2f7:	e9 6f ff ff ff       	jmp    0x40a26b
  40a2fc:	48 83 ec 18          	sub    rsp,0x18
  40a300:	8b 97 88 00 00 00    	mov    edx,DWORD PTR [rdi+0x88]
  40a306:	8d 42 ff             	lea    eax,[rdx-0x1]
  40a309:	09 d0                	or     eax,edx
  40a30b:	89 87 88 00 00 00    	mov    DWORD PTR [rdi+0x88],eax
  40a311:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
  40a315:	48 39 47 28          	cmp    QWORD PTR [rdi+0x28],rax
  40a319:	74 11                	je     0x40a32c
  40a31b:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
  40a320:	31 d2                	xor    edx,edx
  40a322:	31 f6                	xor    esi,esi
  40a324:	ff 57 48             	call   QWORD PTR [rdi+0x48]
  40a327:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  40a32c:	8b 07                	mov    eax,DWORD PTR [rdi]
  40a32e:	66 0f ef c0          	pxor   xmm0,xmm0
  40a332:	48 c7 47 38 00 00 00 	mov    QWORD PTR [rdi+0x38],0x0
  40a339:	00 
  40a33a:	0f 11 47 20          	movups XMMWORD PTR [rdi+0x20],xmm0
  40a33e:	a8 04                	test   al,0x4
  40a340:	75 22                	jne    0x40a364
  40a342:	48 8b 57 60          	mov    rdx,QWORD PTR [rdi+0x60]
  40a346:	48 03 57 58          	add    rdx,QWORD PTR [rdi+0x58]
  40a34a:	c1 e8 04             	shr    eax,0x4
  40a34d:	66 48 0f 6e c2       	movq   xmm0,rdx
  40a352:	83 e0 01             	and    eax,0x1
  40a355:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
  40a359:	f7 d8                	neg    eax
  40a35b:	0f 11 47 08          	movups XMMWORD PTR [rdi+0x8],xmm0
  40a35f:	48 83 c4 18          	add    rsp,0x18
  40a363:	c3                   	ret
  40a364:	83 c8 20             	or     eax,0x20
  40a367:	89 07                	mov    DWORD PTR [rdi],eax
  40a369:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40a36e:	eb ef                	jmp    0x40a35f
  40a370:	e9 46 ff ff ff       	jmp    0x40a2bb
  40a375:	48 89 f8             	mov    rax,rdi
  40a378:	4d 89 c2             	mov    r10,r8
  40a37b:	48 89 f7             	mov    rdi,rsi
  40a37e:	4d 89 c8             	mov    r8,r9
  40a381:	48 89 d6             	mov    rsi,rdx
  40a384:	4c 8b 4c 24 08       	mov    r9,QWORD PTR [rsp+0x8]
  40a389:	48 89 ca             	mov    rdx,rcx
  40a38c:	0f 05                	syscall
  40a38e:	c3                   	ret
  40a38f:	e9 e1 ff ff ff       	jmp    0x40a375

Disassembly of section .fini:

000000000040a394 <.fini>:
  40a394:	50                   	push   rax
  40a395:	58                   	pop    rax
  40a396:	c3                   	ret
