
ZEXOR-01.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <__mingw_invalidParameterHandler>:
   140001000:	c3                   	ret
   140001001:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001005:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000100c:	00 00 00 00 

0000000140001010 <__tmainCRTStartup>:
   140001010:	41 57                	push   r15
   140001012:	41 56                	push   r14
   140001014:	41 55                	push   r13
   140001016:	41 54                	push   r12
   140001018:	55                   	push   rbp
   140001019:	57                   	push   rdi
   14000101a:	56                   	push   rsi
   14000101b:	53                   	push   rbx
   14000101c:	48 83 ec 58          	sub    rsp,0x58
   140001020:	b8 30 00 00 00       	mov    eax,0x30
   140001025:	65 67 48 8b 00       	mov    rax,QWORD PTR gs:[eax]
   14000102a:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
   14000102e:	48 8b 1d 5b 35 00 00 	mov    rbx,QWORD PTR [rip+0x355b]        # 140004590 <.refptr.__native_startup_lock>
   140001035:	48 8b 3d 0c 73 00 00 	mov    rdi,QWORD PTR [rip+0x730c]        # 140008348 <__imp_Sleep>
   14000103c:	eb 12                	jmp    140001050 <__tmainCRTStartup+0x40>
   14000103e:	66 90                	xchg   ax,ax
   140001040:	48 39 c6             	cmp    rsi,rax
   140001043:	0f 84 b7 00 00 00    	je     140001100 <__tmainCRTStartup+0xf0>
   140001049:	b9 e8 03 00 00       	mov    ecx,0x3e8
   14000104e:	ff d7                	call   rdi
   140001050:	31 c0                	xor    eax,eax
   140001052:	f0 48 0f b1 33       	lock cmpxchg QWORD PTR [rbx],rsi
   140001057:	75 e7                	jne    140001040 <__tmainCRTStartup+0x30>
   140001059:	45 31 f6             	xor    r14d,r14d
   14000105c:	48 8b 2d 3d 35 00 00 	mov    rbp,QWORD PTR [rip+0x353d]        # 1400045a0 <.refptr.__native_startup_state>
   140001063:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
   140001066:	83 f8 01             	cmp    eax,0x1
   140001069:	0f 84 59 03 00 00    	je     1400013c8 <__tmainCRTStartup+0x3b8>
   14000106f:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
   140001072:	85 c0                	test   eax,eax
   140001074:	0f 84 96 00 00 00    	je     140001110 <__tmainCRTStartup+0x100>
   14000107a:	c7 05 80 5f 00 00 01 	mov    DWORD PTR [rip+0x5f80],0x1        # 140007004 <has_cctor>
   140001081:	00 00 00 
   140001084:	45 85 f6             	test   r14d,r14d
   140001087:	0f 84 9b 02 00 00    	je     140001328 <__tmainCRTStartup+0x318>
   14000108d:	48 8b 05 7c 34 00 00 	mov    rax,QWORD PTR [rip+0x347c]        # 140004510 <.refptr.__dyn_tls_init_callback>
   140001094:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001097:	48 85 c0             	test   rax,rax
   14000109a:	74 0c                	je     1400010a8 <__tmainCRTStartup+0x98>
   14000109c:	45 31 c0             	xor    r8d,r8d
   14000109f:	ba 02 00 00 00       	mov    edx,0x2
   1400010a4:	31 c9                	xor    ecx,ecx
   1400010a6:	ff d0                	call   rax
   1400010a8:	e8 f3 1a 00 00       	call   140002ba0 <__p___initenv>
   1400010ad:	4c 8b 05 5c 5f 00 00 	mov    r8,QWORD PTR [rip+0x5f5c]        # 140007010 <envp>
   1400010b4:	8b 0d 66 5f 00 00    	mov    ecx,DWORD PTR [rip+0x5f66]        # 140007020 <argc>
   1400010ba:	4c 89 00             	mov    QWORD PTR [rax],r8
   1400010bd:	48 8b 15 54 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5f54]        # 140007018 <argv>
   1400010c4:	e8 77 1d 00 00       	call   140002e40 <main>
   1400010c9:	8b 0d 39 5f 00 00    	mov    ecx,DWORD PTR [rip+0x5f39]        # 140007008 <managedapp>
   1400010cf:	85 c9                	test   ecx,ecx
   1400010d1:	0f 84 fb 02 00 00    	je     1400013d2 <__tmainCRTStartup+0x3c2>
   1400010d7:	8b 15 27 5f 00 00    	mov    edx,DWORD PTR [rip+0x5f27]        # 140007004 <has_cctor>
   1400010dd:	85 d2                	test   edx,edx
   1400010df:	0f 84 2b 02 00 00    	je     140001310 <__tmainCRTStartup+0x300>
   1400010e5:	48 83 c4 58          	add    rsp,0x58
   1400010e9:	5b                   	pop    rbx
   1400010ea:	5e                   	pop    rsi
   1400010eb:	5f                   	pop    rdi
   1400010ec:	5d                   	pop    rbp
   1400010ed:	41 5c                	pop    r12
   1400010ef:	41 5d                	pop    r13
   1400010f1:	41 5e                	pop    r14
   1400010f3:	41 5f                	pop    r15
   1400010f5:	c3                   	ret
   1400010f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400010fd:	00 00 00 
   140001100:	41 be 01 00 00 00    	mov    r14d,0x1
   140001106:	e9 51 ff ff ff       	jmp    14000105c <__tmainCRTStartup+0x4c>
   14000110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001110:	c7 45 00 01 00 00 00 	mov    DWORD PTR [rbp+0x0],0x1
   140001117:	e8 54 0d 00 00       	call   140001e70 <_pei386_runtime_relocator>
   14000111c:	48 8d 0d 2d 11 00 00 	lea    rcx,[rip+0x112d]        # 140002250 <_gnu_exception_handler>
   140001123:	ff 15 17 72 00 00    	call   QWORD PTR [rip+0x7217]        # 140008340 <__imp_SetUnhandledExceptionFilter>
   140001129:	48 8b 15 50 34 00 00 	mov    rdx,QWORD PTR [rip+0x3450]        # 140004580 <.refptr.__mingw_oldexcpt_handler>
   140001130:	48 8d 0d c9 fe ff ff 	lea    rcx,[rip+0xfffffffffffffec9]        # 140001000 <__mingw_invalidParameterHandler>
   140001137:	48 89 02             	mov    QWORD PTR [rdx],rax
   14000113a:	e8 99 1b 00 00       	call   140002cd8 <_set_invalid_parameter_handler>
   14000113f:	e8 7c 15 00 00       	call   1400026c0 <_fpreset>
   140001144:	48 8b 05 05 34 00 00 	mov    rax,QWORD PTR [rip+0x3405]        # 140004550 <.refptr.__mingw_initltsdrot_force>
   14000114b:	31 c9                	xor    ecx,ecx
   14000114d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001153:	48 8b 05 06 34 00 00 	mov    rax,QWORD PTR [rip+0x3406]        # 140004560 <.refptr.__mingw_initltsdyn_force>
   14000115a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001160:	48 8b 05 09 34 00 00 	mov    rax,QWORD PTR [rip+0x3409]        # 140004570 <.refptr.__mingw_initltssuo_force>
   140001167:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000116d:	48 8b 05 6c 33 00 00 	mov    rax,QWORD PTR [rip+0x336c]        # 1400044e0 <.refptr.__ImageBase>
   140001174:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   140001179:	75 45                	jne    1400011c0 <__tmainCRTStartup+0x1b0>
   14000117b:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   14000117f:	48 01 d0             	add    rax,rdx
   140001182:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   140001188:	75 36                	jne    1400011c0 <__tmainCRTStartup+0x1b0>
   14000118a:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
   14000118e:	66 81 fa 0b 01       	cmp    dx,0x10b
   140001193:	0f 84 11 02 00 00    	je     1400013aa <__tmainCRTStartup+0x39a>
   140001199:	66 81 fa 0b 02       	cmp    dx,0x20b
   14000119e:	75 20                	jne    1400011c0 <__tmainCRTStartup+0x1b0>
   1400011a0:	83 b8 84 00 00 00 0e 	cmp    DWORD PTR [rax+0x84],0xe
   1400011a7:	76 17                	jbe    1400011c0 <__tmainCRTStartup+0x1b0>
   1400011a9:	44 8b 88 f8 00 00 00 	mov    r9d,DWORD PTR [rax+0xf8]
   1400011b0:	31 c9                	xor    ecx,ecx
   1400011b2:	45 85 c9             	test   r9d,r9d
   1400011b5:	0f 95 c1             	setne  cl
   1400011b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400011bf:	00 
   1400011c0:	48 8b 05 79 33 00 00 	mov    rax,QWORD PTR [rip+0x3379]        # 140004540 <.refptr.__mingw_app_type>
   1400011c7:	89 0d 3b 5e 00 00    	mov    DWORD PTR [rip+0x5e3b],ecx        # 140007008 <managedapp>
   1400011cd:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   1400011d0:	45 85 c0             	test   r8d,r8d
   1400011d3:	0f 85 5f 01 00 00    	jne    140001338 <__tmainCRTStartup+0x328>
   1400011d9:	b9 01 00 00 00       	mov    ecx,0x1
   1400011de:	e8 dd 1a 00 00       	call   140002cc0 <__set_app_type>
   1400011e3:	e8 88 1a 00 00       	call   140002c70 <__p__fmode>
   1400011e8:	48 8b 15 21 34 00 00 	mov    rdx,QWORD PTR [rip+0x3421]        # 140004610 <.refptr._fmode>
   1400011ef:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400011f1:	89 10                	mov    DWORD PTR [rax],edx
   1400011f3:	e8 70 1a 00 00       	call   140002c68 <__p__commode>
   1400011f8:	48 8b 15 f1 33 00 00 	mov    rdx,QWORD PTR [rip+0x33f1]        # 1400045f0 <.refptr._commode>
   1400011ff:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001201:	89 10                	mov    DWORD PTR [rax],edx
   140001203:	e8 d8 08 00 00       	call   140001ae0 <_setargv>
   140001208:	85 c0                	test   eax,eax
   14000120a:	0f 88 f1 00 00 00    	js     140001301 <__tmainCRTStartup+0x2f1>
   140001210:	48 8b 05 a9 32 00 00 	mov    rax,QWORD PTR [rip+0x32a9]        # 1400044c0 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
   140001217:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14000121a:	0f 84 79 01 00 00    	je     140001399 <__tmainCRTStartup+0x389>
   140001220:	48 8b 05 f9 32 00 00 	mov    rax,QWORD PTR [rip+0x32f9]        # 140004520 <.refptr.__globallocalestatus>
   140001227:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
   14000122a:	0f 84 5a 01 00 00    	je     14000138a <__tmainCRTStartup+0x37a>
   140001230:	48 8b 15 a9 33 00 00 	mov    rdx,QWORD PTR [rip+0x33a9]        # 1400045e0 <.refptr.__xi_z>
   140001237:	48 8b 0d 92 33 00 00 	mov    rcx,QWORD PTR [rip+0x3392]        # 1400045d0 <.refptr.__xi_a>
   14000123e:	e8 8d 1a 00 00       	call   140002cd0 <_initterm_e>
   140001243:	85 c0                	test   eax,eax
   140001245:	0f 85 35 01 00 00    	jne    140001380 <__tmainCRTStartup+0x370>
   14000124b:	48 8b 05 ee 33 00 00 	mov    rax,QWORD PTR [rip+0x33ee]        # 140004640 <.refptr._newmode>
   140001252:	4c 8d 05 b7 5d 00 00 	lea    r8,[rip+0x5db7]        # 140007010 <envp>
   140001259:	48 8d 15 b8 5d 00 00 	lea    rdx,[rip+0x5db8]        # 140007018 <argv>
   140001260:	48 8d 0d b9 5d 00 00 	lea    rcx,[rip+0x5db9]        # 140007020 <argc>
   140001267:	8b 00                	mov    eax,DWORD PTR [rax]
   140001269:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
   14000126d:	48 8b 05 8c 33 00 00 	mov    rax,QWORD PTR [rip+0x338c]        # 140004600 <.refptr._dowildcard>
   140001274:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   140001277:	48 8d 44 24 4c       	lea    rax,[rsp+0x4c]
   14000127c:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140001281:	e8 5a 19 00 00       	call   140002be0 <__getmainargs>
   140001286:	85 c0                	test   eax,eax
   140001288:	78 77                	js     140001301 <__tmainCRTStartup+0x2f1>
   14000128a:	4c 63 25 8f 5d 00 00 	movsxd r12,DWORD PTR [rip+0x5d8f]        # 140007020 <argc>
   140001291:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
   140001296:	48 63 c9             	movsxd rcx,ecx
   140001299:	48 c1 e1 03          	shl    rcx,0x3
   14000129d:	e8 b6 1a 00 00       	call   140002d58 <malloc>
   1400012a2:	49 89 c5             	mov    r13,rax
   1400012a5:	48 85 c0             	test   rax,rax
   1400012a8:	74 57                	je     140001301 <__tmainCRTStartup+0x2f1>
   1400012aa:	45 85 e4             	test   r12d,r12d
   1400012ad:	0f 8e 99 00 00 00    	jle    14000134c <__tmainCRTStartup+0x33c>
   1400012b3:	4c 8b 3d 5e 5d 00 00 	mov    r15,QWORD PTR [rip+0x5d5e]        # 140007018 <argv>
   1400012ba:	be 01 00 00 00       	mov    esi,0x1
   1400012bf:	eb 20                	jmp    1400012e1 <__tmainCRTStartup+0x2d1>
   1400012c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400012c8:	49 8b 54 f7 f8       	mov    rdx,QWORD PTR [r15+rsi*8-0x8]
   1400012cd:	49 89 f8             	mov    r8,rdi
   1400012d0:	48 89 c1             	mov    rcx,rax
   1400012d3:	e8 30 1a 00 00       	call   140002d08 <memcpy>
   1400012d8:	49 39 f4             	cmp    r12,rsi
   1400012db:	74 6a                	je     140001347 <__tmainCRTStartup+0x337>
   1400012dd:	48 83 c6 01          	add    rsi,0x1
   1400012e1:	49 8b 4c f7 f8       	mov    rcx,QWORD PTR [r15+rsi*8-0x8]
   1400012e6:	e8 5d 19 00 00       	call   140002c48 <strlen>
   1400012eb:	48 8d 78 01          	lea    rdi,[rax+0x1]
   1400012ef:	48 89 f9             	mov    rcx,rdi
   1400012f2:	e8 61 1a 00 00       	call   140002d58 <malloc>
   1400012f7:	49 89 44 f5 f8       	mov    QWORD PTR [r13+rsi*8-0x8],rax
   1400012fc:	48 85 c0             	test   rax,rax
   1400012ff:	75 c7                	jne    1400012c8 <__tmainCRTStartup+0x2b8>
   140001301:	b9 08 00 00 00       	mov    ecx,0x8
   140001306:	e8 a5 18 00 00       	call   140002bb0 <_amsg_exit>
   14000130b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001310:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   140001314:	e8 7f 19 00 00       	call   140002c98 <_cexit>
   140001319:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   14000131d:	e9 c3 fd ff ff       	jmp    1400010e5 <__tmainCRTStartup+0xd5>
   140001322:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001328:	31 c0                	xor    eax,eax
   14000132a:	48 87 03             	xchg   QWORD PTR [rbx],rax
   14000132d:	e9 5b fd ff ff       	jmp    14000108d <__tmainCRTStartup+0x7d>
   140001332:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001338:	b9 02 00 00 00       	mov    ecx,0x2
   14000133d:	e8 7e 19 00 00       	call   140002cc0 <__set_app_type>
   140001342:	e9 9c fe ff ff       	jmp    1400011e3 <__tmainCRTStartup+0x1d3>
   140001347:	4b 8d 44 e5 00       	lea    rax,[r13+r12*8+0x0]
   14000134c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   140001353:	48 8b 15 66 32 00 00 	mov    rdx,QWORD PTR [rip+0x3266]        # 1400045c0 <.refptr.__xc_z>
   14000135a:	48 8b 0d 4f 32 00 00 	mov    rcx,QWORD PTR [rip+0x324f]        # 1400045b0 <.refptr.__xc_a>
   140001361:	4c 89 2d b0 5c 00 00 	mov    QWORD PTR [rip+0x5cb0],r13        # 140007018 <argv>
   140001368:	e8 5b 19 00 00       	call   140002cc8 <_initterm>
   14000136d:	e8 4e 07 00 00       	call   140001ac0 <__main>
   140001372:	c7 45 00 02 00 00 00 	mov    DWORD PTR [rbp+0x0],0x2
   140001379:	e9 06 fd ff ff       	jmp    140001084 <__tmainCRTStartup+0x74>
   14000137e:	66 90                	xchg   ax,ax
   140001380:	b8 ff 00 00 00       	mov    eax,0xff
   140001385:	e9 5b fd ff ff       	jmp    1400010e5 <__tmainCRTStartup+0xd5>
   14000138a:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   14000138f:	e8 9c 19 00 00       	call   140002d30 <_configthreadlocale>
   140001394:	e9 97 fe ff ff       	jmp    140001230 <__tmainCRTStartup+0x220>
   140001399:	48 8d 0d 00 08 00 00 	lea    rcx,[rip+0x800]        # 140001ba0 <_matherr>
   1400013a0:	e8 9b 0e 00 00       	call   140002240 <__mingw_setusermatherr>
   1400013a5:	e9 76 fe ff ff       	jmp    140001220 <__tmainCRTStartup+0x210>
   1400013aa:	83 78 74 0e          	cmp    DWORD PTR [rax+0x74],0xe
   1400013ae:	0f 86 0c fe ff ff    	jbe    1400011c0 <__tmainCRTStartup+0x1b0>
   1400013b4:	44 8b 90 e8 00 00 00 	mov    r10d,DWORD PTR [rax+0xe8]
   1400013bb:	31 c9                	xor    ecx,ecx
   1400013bd:	45 85 d2             	test   r10d,r10d
   1400013c0:	0f 95 c1             	setne  cl
   1400013c3:	e9 f8 fd ff ff       	jmp    1400011c0 <__tmainCRTStartup+0x1b0>
   1400013c8:	b9 1f 00 00 00       	mov    ecx,0x1f
   1400013cd:	e8 de 17 00 00       	call   140002bb0 <_amsg_exit>
   1400013d2:	89 c1                	mov    ecx,eax
   1400013d4:	e8 0f 19 00 00       	call   140002ce8 <exit>
   1400013d9:	90                   	nop
   1400013da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000001400013e0 <WinMainCRTStartup>:
   1400013e0:	48 83 ec 28          	sub    rsp,0x28

00000001400013e4 <.l_startw>:
   1400013e4:	48 8b 05 55 31 00 00 	mov    rax,QWORD PTR [rip+0x3155]        # 140004540 <.refptr.__mingw_app_type>
   1400013eb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013f1:	e8 1a fc ff ff       	call   140001010 <__tmainCRTStartup>
   1400013f6:	90                   	nop

00000001400013f7 <.l_endw>:
   1400013f7:	90                   	nop
   1400013f8:	48 83 c4 28          	add    rsp,0x28
   1400013fc:	c3                   	ret
   1400013fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000140001400 <mainCRTStartup>:
   140001400:	48 83 ec 28          	sub    rsp,0x28

0000000140001404 <.l_start>:
   140001404:	48 8b 05 35 31 00 00 	mov    rax,QWORD PTR [rip+0x3135]        # 140004540 <.refptr.__mingw_app_type>
   14000140b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001411:	e8 fa fb ff ff       	call   140001010 <__tmainCRTStartup>
   140001416:	90                   	nop

0000000140001417 <.l_end>:
   140001417:	90                   	nop
   140001418:	48 83 c4 28          	add    rsp,0x28
   14000141c:	c3                   	ret
   14000141d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000140001420 <atexit>:
   140001420:	e9 83 18 00 00       	jmp    140002ca8 <_crt_atexit>
   140001425:	90                   	nop
   140001426:	90                   	nop
   140001427:	90                   	nop
   140001428:	90                   	nop
   140001429:	90                   	nop
   14000142a:	90                   	nop
   14000142b:	90                   	nop
   14000142c:	90                   	nop
   14000142d:	90                   	nop
   14000142e:	90                   	nop
   14000142f:	90                   	nop

0000000140001430 <__gcc_register_frame>:
   140001430:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 140001440 <__gcc_deregister_frame>
   140001437:	e9 e4 ff ff ff       	jmp    140001420 <atexit>
   14000143c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140001440 <__gcc_deregister_frame>:
   140001440:	c3                   	ret
   140001441:	90                   	nop
   140001442:	90                   	nop
   140001443:	90                   	nop
   140001444:	90                   	nop
   140001445:	90                   	nop
   140001446:	90                   	nop
   140001447:	90                   	nop
   140001448:	90                   	nop
   140001449:	90                   	nop
   14000144a:	90                   	nop
   14000144b:	90                   	nop
   14000144c:	90                   	nop
   14000144d:	90                   	nop
   14000144e:	90                   	nop
   14000144f:	90                   	nop

0000000140001450 <_Z12CheckLicensePKc>:
   140001450:	55                   	push   rbp
   140001451:	48 89 e5             	mov    rbp,rsp
   140001454:	48 83 ec 20          	sub    rsp,0x20
   140001458:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000145c:	48 8b 15 9d 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b9d]        # 140003000 <LICENO>
   140001463:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001467:	48 89 c1             	mov    rcx,rax
   14000146a:	e8 d1 17 00 00       	call   140002c40 <strcmp>
   14000146f:	85 c0                	test   eax,eax
   140001471:	0f 94 c0             	sete   al
   140001474:	48 83 c4 20          	add    rsp,0x20
   140001478:	5d                   	pop    rbp
   140001479:	c3                   	ret

000000014000147a <_Z7WndProcP6HWND__jyx>:
   14000147a:	55                   	push   rbp
   14000147b:	48 81 ec 60 01 00 00 	sub    rsp,0x160
   140001482:	48 8d ac 24 80 00 00 	lea    rbp,[rsp+0x80]
   140001489:	00 
   14000148a:	48 89 8d f0 00 00 00 	mov    QWORD PTR [rbp+0xf0],rcx
   140001491:	89 95 f8 00 00 00    	mov    DWORD PTR [rbp+0xf8],edx
   140001497:	4c 89 85 00 01 00 00 	mov    QWORD PTR [rbp+0x100],r8
   14000149e:	4c 89 8d 08 01 00 00 	mov    QWORD PTR [rbp+0x108],r9
   1400014a5:	81 bd f8 00 00 00 11 	cmp    DWORD PTR [rbp+0xf8],0x111
   1400014ac:	01 00 00 
   1400014af:	0f 84 1b 02 00 00    	je     1400016d0 <_Z7WndProcP6HWND__jyx+0x256>
   1400014b5:	81 bd f8 00 00 00 11 	cmp    DWORD PTR [rbp+0xf8],0x111
   1400014bc:	01 00 00 
   1400014bf:	0f 87 fd 02 00 00    	ja     1400017c2 <_Z7WndProcP6HWND__jyx+0x348>
   1400014c5:	83 bd f8 00 00 00 10 	cmp    DWORD PTR [rbp+0xf8],0x10
   1400014cc:	0f 84 cb 02 00 00    	je     14000179d <_Z7WndProcP6HWND__jyx+0x323>
   1400014d2:	83 bd f8 00 00 00 10 	cmp    DWORD PTR [rbp+0xf8],0x10
   1400014d9:	0f 87 e3 02 00 00    	ja     1400017c2 <_Z7WndProcP6HWND__jyx+0x348>
   1400014df:	83 bd f8 00 00 00 01 	cmp    DWORD PTR [rbp+0xf8],0x1
   1400014e6:	74 12                	je     1400014fa <_Z7WndProcP6HWND__jyx+0x80>
   1400014e8:	83 bd f8 00 00 00 02 	cmp    DWORD PTR [rbp+0xf8],0x2
   1400014ef:	0f 84 bd 02 00 00    	je     1400017b2 <_Z7WndProcP6HWND__jyx+0x338>
   1400014f5:	e9 c8 02 00 00       	jmp    1400017c2 <_Z7WndProcP6HWND__jyx+0x348>
   1400014fa:	48 8d 0d 12 2b 00 00 	lea    rcx,[rip+0x2b12]        # 140004013 <.rdata+0x13>
   140001501:	48 8d 05 1e 2b 00 00 	lea    rax,[rip+0x2b1e]        # 140004026 <.rdata+0x26>
   140001508:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   14000150f:	00 00 
   140001511:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   140001518:	00 00 
   14000151a:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   140001521:	00 00 
   140001523:	48 8b 95 f0 00 00 00 	mov    rdx,QWORD PTR [rbp+0xf0]
   14000152a:	48 89 54 24 40       	mov    QWORD PTR [rsp+0x40],rdx
   14000152f:	c7 44 24 38 14 00 00 	mov    DWORD PTR [rsp+0x38],0x14
   140001536:	00 
   140001537:	c7 44 24 30 c8 00 00 	mov    DWORD PTR [rsp+0x30],0xc8
   14000153e:	00 
   14000153f:	c7 44 24 28 14 00 00 	mov    DWORD PTR [rsp+0x28],0x14
   140001546:	00 
   140001547:	c7 44 24 20 14 00 00 	mov    DWORD PTR [rsp+0x20],0x14
   14000154e:	00 
   14000154f:	41 b9 00 00 00 50    	mov    r9d,0x50000000
   140001555:	49 89 c8             	mov    r8,rcx
   140001558:	48 89 c2             	mov    rdx,rax
   14000155b:	b9 00 00 00 00       	mov    ecx,0x0
   140001560:	48 8b 05 51 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f51]        # 1400084b8 <__imp_CreateWindowExA>
   140001567:	ff d0                	call   rax
   140001569:	48 8d 0d bd 2a 00 00 	lea    rcx,[rip+0x2abd]        # 14000402d <.rdata+0x2d>
   140001570:	48 8d 05 b7 2a 00 00 	lea    rax,[rip+0x2ab7]        # 14000402e <.rdata+0x2e>
   140001577:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   14000157e:	00 00 
   140001580:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   140001587:	00 00 
   140001589:	48 c7 44 24 48 01 00 	mov    QWORD PTR [rsp+0x48],0x1
   140001590:	00 00 
   140001592:	48 8b 95 f0 00 00 00 	mov    rdx,QWORD PTR [rbp+0xf0]
   140001599:	48 89 54 24 40       	mov    QWORD PTR [rsp+0x40],rdx
   14000159e:	c7 44 24 38 19 00 00 	mov    DWORD PTR [rsp+0x38],0x19
   1400015a5:	00 
   1400015a6:	c7 44 24 30 68 01 00 	mov    DWORD PTR [rsp+0x30],0x168
   1400015ad:	00 
   1400015ae:	c7 44 24 28 32 00 00 	mov    DWORD PTR [rsp+0x28],0x32
   1400015b5:	00 
   1400015b6:	c7 44 24 20 14 00 00 	mov    DWORD PTR [rsp+0x20],0x14
   1400015bd:	00 
   1400015be:	41 b9 80 00 00 50    	mov    r9d,0x50000080
   1400015c4:	49 89 c8             	mov    r8,rcx
   1400015c7:	48 89 c2             	mov    rdx,rax
   1400015ca:	b9 00 02 00 00       	mov    ecx,0x200
   1400015cf:	48 8b 05 e2 6e 00 00 	mov    rax,QWORD PTR [rip+0x6ee2]        # 1400084b8 <__imp_CreateWindowExA>
   1400015d6:	ff d0                	call   rax
   1400015d8:	48 89 05 51 5a 00 00 	mov    QWORD PTR [rip+0x5a51],rax        # 140007030 <hEdit>
   1400015df:	48 8d 0d 4d 2a 00 00 	lea    rcx,[rip+0x2a4d]        # 140004033 <.rdata+0x33>
   1400015e6:	48 8d 05 54 2a 00 00 	lea    rax,[rip+0x2a54]        # 140004041 <.rdata+0x41>
   1400015ed:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   1400015f4:	00 00 
   1400015f6:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   1400015fd:	00 00 
   1400015ff:	48 c7 44 24 48 02 00 	mov    QWORD PTR [rsp+0x48],0x2
   140001606:	00 00 
   140001608:	48 8b 95 f0 00 00 00 	mov    rdx,QWORD PTR [rbp+0xf0]
   14000160f:	48 89 54 24 40       	mov    QWORD PTR [rsp+0x40],rdx
   140001614:	c7 44 24 38 1e 00 00 	mov    DWORD PTR [rsp+0x38],0x1e
   14000161b:	00 
   14000161c:	c7 44 24 30 78 00 00 	mov    DWORD PTR [rsp+0x30],0x78
   140001623:	00 
   140001624:	c7 44 24 28 5a 00 00 	mov    DWORD PTR [rsp+0x28],0x5a
   14000162b:	00 
   14000162c:	c7 44 24 20 14 00 00 	mov    DWORD PTR [rsp+0x20],0x14
   140001633:	00 
   140001634:	41 b9 00 00 00 50    	mov    r9d,0x50000000
   14000163a:	49 89 c8             	mov    r8,rcx
   14000163d:	48 89 c2             	mov    rdx,rax
   140001640:	b9 00 00 00 00       	mov    ecx,0x0
   140001645:	48 8b 05 6c 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e6c]        # 1400084b8 <__imp_CreateWindowExA>
   14000164c:	ff d0                	call   rax
   14000164e:	48 89 05 e3 59 00 00 	mov    QWORD PTR [rip+0x59e3],rax        # 140007038 <hButton>
   140001655:	48 8d 0d d1 29 00 00 	lea    rcx,[rip+0x29d1]        # 14000402d <.rdata+0x2d>
   14000165c:	48 8d 05 c3 29 00 00 	lea    rax,[rip+0x29c3]        # 140004026 <.rdata+0x26>
   140001663:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   14000166a:	00 00 
   14000166c:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   140001673:	00 00 
   140001675:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   14000167c:	00 00 
   14000167e:	48 8b 95 f0 00 00 00 	mov    rdx,QWORD PTR [rbp+0xf0]
   140001685:	48 89 54 24 40       	mov    QWORD PTR [rsp+0x40],rdx
   14000168a:	c7 44 24 38 28 00 00 	mov    DWORD PTR [rsp+0x38],0x28
   140001691:	00 
   140001692:	c7 44 24 30 68 01 00 	mov    DWORD PTR [rsp+0x30],0x168
   140001699:	00 
   14000169a:	c7 44 24 28 8c 00 00 	mov    DWORD PTR [rsp+0x28],0x8c
   1400016a1:	00 
   1400016a2:	c7 44 24 20 14 00 00 	mov    DWORD PTR [rsp+0x20],0x14
   1400016a9:	00 
   1400016aa:	41 b9 01 00 00 50    	mov    r9d,0x50000001
   1400016b0:	49 89 c8             	mov    r8,rcx
   1400016b3:	48 89 c2             	mov    rdx,rax
   1400016b6:	b9 00 00 00 00       	mov    ecx,0x0
   1400016bb:	48 8b 05 f6 6d 00 00 	mov    rax,QWORD PTR [rip+0x6df6]        # 1400084b8 <__imp_CreateWindowExA>
   1400016c2:	ff d0                	call   rax
   1400016c4:	48 89 05 75 59 00 00 	mov    QWORD PTR [rip+0x5975],rax        # 140007040 <hStatus>
   1400016cb:	e9 22 01 00 00       	jmp    1400017f2 <_Z7WndProcP6HWND__jyx+0x378>
   1400016d0:	48 8b 85 00 01 00 00 	mov    rax,QWORD PTR [rbp+0x100]
   1400016d7:	66 83 f8 02          	cmp    ax,0x2
   1400016db:	0f 85 10 01 00 00    	jne    1400017f1 <_Z7WndProcP6HWND__jyx+0x377>
   1400016e1:	48 8b 05 48 59 00 00 	mov    rax,QWORD PTR [rip+0x5948]        # 140007030 <hEdit>
   1400016e8:	48 8d 55 e0          	lea    rdx,[rbp-0x20]
   1400016ec:	41 b8 00 01 00 00    	mov    r8d,0x100
   1400016f2:	48 89 c1             	mov    rcx,rax
   1400016f5:	48 8b 05 e4 6d 00 00 	mov    rax,QWORD PTR [rip+0x6de4]        # 1400084e0 <__imp_GetWindowTextA>
   1400016fc:	ff d0                	call   rax
   1400016fe:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140001702:	48 89 c1             	mov    rcx,rax
   140001705:	e8 46 fd ff ff       	call   140001450 <_Z12CheckLicensePKc>
   14000170a:	84 c0                	test   al,al
   14000170c:	74 49                	je     140001757 <_Z7WndProcP6HWND__jyx+0x2dd>
   14000170e:	48 8b 05 2b 59 00 00 	mov    rax,QWORD PTR [rip+0x592b]        # 140007040 <hStatus>
   140001715:	48 8d 15 2c 29 00 00 	lea    rdx,[rip+0x292c]        # 140004048 <.rdata+0x48>
   14000171c:	48 89 c1             	mov    rcx,rax
   14000171f:	48 8b 05 e2 6d 00 00 	mov    rax,QWORD PTR [rip+0x6de2]        # 140008508 <__imp_SetWindowTextA>
   140001726:	ff d0                	call   rax
   140001728:	48 8d 0d 54 29 00 00 	lea    rcx,[rip+0x2954]        # 140004083 <.rdata+0x83>
   14000172f:	48 8d 15 5a 29 00 00 	lea    rdx,[rip+0x295a]        # 140004090 <.rdata+0x90>
   140001736:	48 8b 85 f0 00 00 00 	mov    rax,QWORD PTR [rbp+0xf0]
   14000173d:	41 b9 40 00 00 00    	mov    r9d,0x40
   140001743:	49 89 c8             	mov    r8,rcx
   140001746:	48 89 c1             	mov    rcx,rax
   140001749:	48 8b 05 a0 6d 00 00 	mov    rax,QWORD PTR [rip+0x6da0]        # 1400084f0 <__imp_MessageBoxA>
   140001750:	ff d0                	call   rax
   140001752:	e9 9a 00 00 00       	jmp    1400017f1 <_Z7WndProcP6HWND__jyx+0x377>
   140001757:	48 8b 05 e2 58 00 00 	mov    rax,QWORD PTR [rip+0x58e2]        # 140007040 <hStatus>
   14000175e:	48 8d 15 53 29 00 00 	lea    rdx,[rip+0x2953]        # 1400040b8 <.rdata+0xb8>
   140001765:	48 89 c1             	mov    rcx,rax
   140001768:	48 8b 05 99 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d99]        # 140008508 <__imp_SetWindowTextA>
   14000176f:	ff d0                	call   rax
   140001771:	48 8d 0d 66 29 00 00 	lea    rcx,[rip+0x2966]        # 1400040de <.rdata+0xde>
   140001778:	48 8d 15 69 29 00 00 	lea    rdx,[rip+0x2969]        # 1400040e8 <.rdata+0xe8>
   14000177f:	48 8b 85 f0 00 00 00 	mov    rax,QWORD PTR [rbp+0xf0]
   140001786:	41 b9 10 00 00 00    	mov    r9d,0x10
   14000178c:	49 89 c8             	mov    r8,rcx
   14000178f:	48 89 c1             	mov    rcx,rax
   140001792:	48 8b 05 57 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d57]        # 1400084f0 <__imp_MessageBoxA>
   140001799:	ff d0                	call   rax
   14000179b:	eb 54                	jmp    1400017f1 <_Z7WndProcP6HWND__jyx+0x377>
   14000179d:	48 8b 85 f0 00 00 00 	mov    rax,QWORD PTR [rbp+0xf0]
   1400017a4:	48 89 c1             	mov    rcx,rax
   1400017a7:	48 8b 05 1a 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d1a]        # 1400084c8 <__imp_DestroyWindow>
   1400017ae:	ff d0                	call   rax
   1400017b0:	eb 40                	jmp    1400017f2 <_Z7WndProcP6HWND__jyx+0x378>
   1400017b2:	b9 00 00 00 00       	mov    ecx,0x0
   1400017b7:	48 8b 05 3a 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d3a]        # 1400084f8 <__imp_PostQuitMessage>
   1400017be:	ff d0                	call   rax
   1400017c0:	eb 30                	jmp    1400017f2 <_Z7WndProcP6HWND__jyx+0x378>
   1400017c2:	4c 8b 85 08 01 00 00 	mov    r8,QWORD PTR [rbp+0x108]
   1400017c9:	48 8b 8d 00 01 00 00 	mov    rcx,QWORD PTR [rbp+0x100]
   1400017d0:	8b 95 f8 00 00 00    	mov    edx,DWORD PTR [rbp+0xf8]
   1400017d6:	48 8b 85 f0 00 00 00 	mov    rax,QWORD PTR [rbp+0xf0]
   1400017dd:	4d 89 c1             	mov    r9,r8
   1400017e0:	49 89 c8             	mov    r8,rcx
   1400017e3:	48 89 c1             	mov    rcx,rax
   1400017e6:	48 8b 05 d3 6c 00 00 	mov    rax,QWORD PTR [rip+0x6cd3]        # 1400084c0 <__imp_DefWindowProcA>
   1400017ed:	ff d0                	call   rax
   1400017ef:	eb 06                	jmp    1400017f7 <_Z7WndProcP6HWND__jyx+0x37d>
   1400017f1:	90                   	nop
   1400017f2:	b8 00 00 00 00       	mov    eax,0x0
   1400017f7:	48 81 c4 60 01 00 00 	add    rsp,0x160
   1400017fe:	5d                   	pop    rbp
   1400017ff:	c3                   	ret

0000000140001800 <WinMain>:
   140001800:	55                   	push   rbp
   140001801:	48 89 e5             	mov    rbp,rsp
   140001804:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   14000180b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000180f:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140001813:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001817:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   14000181b:	66 0f ef c0          	pxor   xmm0,xmm0
   14000181f:	0f 11 45 a0          	movups XMMWORD PTR [rbp-0x60],xmm0
   140001823:	0f 11 45 b0          	movups XMMWORD PTR [rbp-0x50],xmm0
   140001827:	0f 11 45 c0          	movups XMMWORD PTR [rbp-0x40],xmm0
   14000182b:	0f 11 45 d0          	movups XMMWORD PTR [rbp-0x30],xmm0
   14000182f:	0f 11 45 e0          	movups XMMWORD PTR [rbp-0x20],xmm0
   140001833:	c7 45 a0 50 00 00 00 	mov    DWORD PTR [rbp-0x60],0x50
   14000183a:	48 8d 05 39 fc ff ff 	lea    rax,[rip+0xfffffffffffffc39]        # 14000147a <_Z7WndProcP6HWND__jyx>
   140001841:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
   140001845:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001849:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000184d:	ba 00 7f 00 00       	mov    edx,0x7f00
   140001852:	b9 00 00 00 00       	mov    ecx,0x0
   140001857:	48 8b 05 8a 6c 00 00 	mov    rax,QWORD PTR [rip+0x6c8a]        # 1400084e8 <__imp_LoadCursorA>
   14000185e:	ff d0                	call   rax
   140001860:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   140001864:	48 c7 45 d0 06 00 00 	mov    QWORD PTR [rbp-0x30],0x6
   14000186b:	00 
   14000186c:	48 8d 05 95 28 00 00 	lea    rax,[rip+0x2895]        # 140004108 <.rdata+0x108>
   140001873:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140001877:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   14000187b:	48 89 c1             	mov    rcx,rax
   14000187e:	48 8b 05 7b 6c 00 00 	mov    rax,QWORD PTR [rip+0x6c7b]        # 140008500 <__imp_RegisterClassExA>
   140001885:	ff d0                	call   rax
   140001887:	66 85 c0             	test   ax,ax
   14000188a:	0f 94 c0             	sete   al
   14000188d:	84 c0                	test   al,al
   14000188f:	74 32                	je     1400018c3 <WinMain+0xc3>
   140001891:	48 8d 15 46 28 00 00 	lea    rdx,[rip+0x2846]        # 1400040de <.rdata+0xde>
   140001898:	48 8d 05 71 28 00 00 	lea    rax,[rip+0x2871]        # 140004110 <.rdata+0x110>
   14000189f:	41 b9 30 00 00 00    	mov    r9d,0x30
   1400018a5:	49 89 d0             	mov    r8,rdx
   1400018a8:	48 89 c2             	mov    rdx,rax
   1400018ab:	b9 00 00 00 00       	mov    ecx,0x0
   1400018b0:	48 8b 05 39 6c 00 00 	mov    rax,QWORD PTR [rip+0x6c39]        # 1400084f0 <__imp_MessageBoxA>
   1400018b7:	ff d0                	call   rax
   1400018b9:	b8 00 00 00 00       	mov    eax,0x0
   1400018be:	e9 22 01 00 00       	jmp    1400019e5 <WinMain+0x1e5>
   1400018c3:	48 8d 0d 62 28 00 00 	lea    rcx,[rip+0x2862]        # 14000412c <.rdata+0x12c>
   1400018ca:	48 8d 05 37 28 00 00 	lea    rax,[rip+0x2837]        # 140004108 <.rdata+0x108>
   1400018d1:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   1400018d8:	00 00 
   1400018da:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   1400018de:	48 89 54 24 50       	mov    QWORD PTR [rsp+0x50],rdx
   1400018e3:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   1400018ea:	00 00 
   1400018ec:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   1400018f3:	00 00 
   1400018f5:	c7 44 24 38 fa 00 00 	mov    DWORD PTR [rsp+0x38],0xfa
   1400018fc:	00 
   1400018fd:	c7 44 24 30 a4 01 00 	mov    DWORD PTR [rsp+0x30],0x1a4
   140001904:	00 
   140001905:	c7 44 24 28 00 00 00 	mov    DWORD PTR [rsp+0x28],0x80000000
   14000190c:	80 
   14000190d:	c7 44 24 20 00 00 00 	mov    DWORD PTR [rsp+0x20],0x80000000
   140001914:	80 
   140001915:	41 b9 00 00 ca 00    	mov    r9d,0xca0000
   14000191b:	49 89 c8             	mov    r8,rcx
   14000191e:	48 89 c2             	mov    rdx,rax
   140001921:	b9 00 02 00 00       	mov    ecx,0x200
   140001926:	48 8b 05 8b 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b8b]        # 1400084b8 <__imp_CreateWindowExA>
   14000192d:	ff d0                	call   rax
   14000192f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001933:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140001938:	75 2f                	jne    140001969 <WinMain+0x169>
   14000193a:	48 8d 15 9d 27 00 00 	lea    rdx,[rip+0x279d]        # 1400040de <.rdata+0xde>
   140001941:	48 8d 05 ef 27 00 00 	lea    rax,[rip+0x27ef]        # 140004137 <.rdata+0x137>
   140001948:	41 b9 30 00 00 00    	mov    r9d,0x30
   14000194e:	49 89 d0             	mov    r8,rdx
   140001951:	48 89 c2             	mov    rdx,rax
   140001954:	b9 00 00 00 00       	mov    ecx,0x0
   140001959:	48 8b 05 90 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b90]        # 1400084f0 <__imp_MessageBoxA>
   140001960:	ff d0                	call   rax
   140001962:	b8 00 00 00 00       	mov    eax,0x0
   140001967:	eb 7c                	jmp    1400019e5 <WinMain+0x1e5>
   140001969:	8b 55 28             	mov    edx,DWORD PTR [rbp+0x28]
   14000196c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001970:	48 89 c1             	mov    rcx,rax
   140001973:	48 8b 05 96 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b96]        # 140008510 <__imp_ShowWindow>
   14000197a:	ff d0                	call   rax
   14000197c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001980:	48 89 c1             	mov    rcx,rax
   140001983:	48 8b 05 96 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b96]        # 140008520 <__imp_UpdateWindow>
   14000198a:	ff d0                	call   rax
   14000198c:	eb 26                	jmp    1400019b4 <WinMain+0x1b4>
   14000198e:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   140001995:	48 89 c1             	mov    rcx,rax
   140001998:	48 8b 05 79 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b79]        # 140008518 <__imp_TranslateMessage>
   14000199f:	ff d0                	call   rax
   1400019a1:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   1400019a8:	48 89 c1             	mov    rcx,rax
   1400019ab:	48 8b 05 1e 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b1e]        # 1400084d0 <__imp_DispatchMessageA>
   1400019b2:	ff d0                	call   rax
   1400019b4:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   1400019bb:	41 b9 00 00 00 00    	mov    r9d,0x0
   1400019c1:	41 b8 00 00 00 00    	mov    r8d,0x0
   1400019c7:	ba 00 00 00 00       	mov    edx,0x0
   1400019cc:	48 89 c1             	mov    rcx,rax
   1400019cf:	48 8b 05 02 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b02]        # 1400084d8 <__imp_GetMessageA>
   1400019d6:	ff d0                	call   rax
   1400019d8:	85 c0                	test   eax,eax
   1400019da:	0f 9f c0             	setg   al
   1400019dd:	84 c0                	test   al,al
   1400019df:	75 ad                	jne    14000198e <WinMain+0x18e>
   1400019e1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
   1400019e5:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   1400019ec:	5d                   	pop    rbp
   1400019ed:	c3                   	ret
   1400019ee:	90                   	nop
   1400019ef:	90                   	nop

00000001400019f0 <__do_global_dtors>:
   1400019f0:	48 83 ec 28          	sub    rsp,0x28
   1400019f4:	48 8b 05 15 16 00 00 	mov    rax,QWORD PTR [rip+0x1615]        # 140003010 <p.0>
   1400019fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400019fe:	48 85 c0             	test   rax,rax
   140001a01:	74 2a                	je     140001a2d <__do_global_dtors+0x3d>
   140001a03:	66 90                	xchg   ax,ax
   140001a05:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001a0c:	00 00 00 00 
   140001a10:	ff d0                	call   rax
   140001a12:	48 8b 05 f7 15 00 00 	mov    rax,QWORD PTR [rip+0x15f7]        # 140003010 <p.0>
   140001a19:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140001a1d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001a21:	48 89 15 e8 15 00 00 	mov    QWORD PTR [rip+0x15e8],rdx        # 140003010 <p.0>
   140001a28:	48 85 c0             	test   rax,rax
   140001a2b:	75 e3                	jne    140001a10 <__do_global_dtors+0x20>
   140001a2d:	48 83 c4 28          	add    rsp,0x28
   140001a31:	c3                   	ret
   140001a32:	0f 1f 00             	nop    DWORD PTR [rax]
   140001a35:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001a3c:	00 00 00 00 

0000000140001a40 <__do_global_ctors>:
   140001a40:	56                   	push   rsi
   140001a41:	53                   	push   rbx
   140001a42:	48 83 ec 28          	sub    rsp,0x28
   140001a46:	48 8b 15 83 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2a83]        # 1400044d0 <.refptr.__CTOR_LIST__>
   140001a4d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001a50:	89 c1                	mov    ecx,eax
   140001a52:	83 f8 ff             	cmp    eax,0xffffffff
   140001a55:	74 39                	je     140001a90 <__do_global_ctors+0x50>
   140001a57:	85 c9                	test   ecx,ecx
   140001a59:	74 20                	je     140001a7b <__do_global_ctors+0x3b>
   140001a5b:	89 c8                	mov    eax,ecx
   140001a5d:	83 e9 01             	sub    ecx,0x1
   140001a60:	48 8d 1c c2          	lea    rbx,[rdx+rax*8]
   140001a64:	48 29 c8             	sub    rax,rcx
   140001a67:	48 8d 74 c2 f8       	lea    rsi,[rdx+rax*8-0x8]
   140001a6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001a70:	ff 13                	call   QWORD PTR [rbx]
   140001a72:	48 83 eb 08          	sub    rbx,0x8
   140001a76:	48 39 f3             	cmp    rbx,rsi
   140001a79:	75 f5                	jne    140001a70 <__do_global_ctors+0x30>
   140001a7b:	48 8d 0d 6e ff ff ff 	lea    rcx,[rip+0xffffffffffffff6e]        # 1400019f0 <__do_global_dtors>
   140001a82:	48 83 c4 28          	add    rsp,0x28
   140001a86:	5b                   	pop    rbx
   140001a87:	5e                   	pop    rsi
   140001a88:	e9 93 f9 ff ff       	jmp    140001420 <atexit>
   140001a8d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001a90:	31 c0                	xor    eax,eax
   140001a92:	0f 1f 00             	nop    DWORD PTR [rax]
   140001a95:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001a9c:	00 00 00 00 
   140001aa0:	44 8d 40 01          	lea    r8d,[rax+0x1]
   140001aa4:	89 c1                	mov    ecx,eax
   140001aa6:	4c 89 c0             	mov    rax,r8
   140001aa9:	4a 83 3c c2 00       	cmp    QWORD PTR [rdx+r8*8],0x0
   140001aae:	75 f0                	jne    140001aa0 <__do_global_ctors+0x60>
   140001ab0:	eb a5                	jmp    140001a57 <__do_global_ctors+0x17>
   140001ab2:	0f 1f 00             	nop    DWORD PTR [rax]
   140001ab5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001abc:	00 00 00 00 

0000000140001ac0 <__main>:
   140001ac0:	8b 05 8a 55 00 00    	mov    eax,DWORD PTR [rip+0x558a]        # 140007050 <initialized>
   140001ac6:	85 c0                	test   eax,eax
   140001ac8:	74 06                	je     140001ad0 <__main+0x10>
   140001aca:	c3                   	ret
   140001acb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001ad0:	c7 05 76 55 00 00 01 	mov    DWORD PTR [rip+0x5576],0x1        # 140007050 <initialized>
   140001ad7:	00 00 00 
   140001ada:	e9 61 ff ff ff       	jmp    140001a40 <__do_global_ctors>
   140001adf:	90                   	nop

0000000140001ae0 <_setargv>:
   140001ae0:	31 c0                	xor    eax,eax
   140001ae2:	c3                   	ret
   140001ae3:	90                   	nop
   140001ae4:	90                   	nop
   140001ae5:	90                   	nop
   140001ae6:	90                   	nop
   140001ae7:	90                   	nop
   140001ae8:	90                   	nop
   140001ae9:	90                   	nop
   140001aea:	90                   	nop
   140001aeb:	90                   	nop
   140001aec:	90                   	nop
   140001aed:	90                   	nop
   140001aee:	90                   	nop
   140001aef:	90                   	nop

0000000140001af0 <__dyn_tls_dtor>:
   140001af0:	83 fa 03             	cmp    edx,0x3
   140001af3:	74 0b                	je     140001b00 <__dyn_tls_dtor+0x10>
   140001af5:	85 d2                	test   edx,edx
   140001af7:	74 07                	je     140001b00 <__dyn_tls_dtor+0x10>
   140001af9:	c3                   	ret
   140001afa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001b00:	e9 ab 0a 00 00       	jmp    1400025b0 <__mingw_TLScallback>
   140001b05:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001b0c:	00 00 00 00 

0000000140001b10 <__dyn_tls_init>:
   140001b10:	56                   	push   rsi
   140001b11:	53                   	push   rbx
   140001b12:	48 83 ec 28          	sub    rsp,0x28
   140001b16:	48 8b 05 93 29 00 00 	mov    rax,QWORD PTR [rip+0x2993]        # 1400044b0 <.refptr._CRT_MT>
   140001b1d:	83 38 02             	cmp    DWORD PTR [rax],0x2
   140001b20:	74 06                	je     140001b28 <__dyn_tls_init+0x18>
   140001b22:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140001b28:	83 fa 02             	cmp    edx,0x2
   140001b2b:	74 13                	je     140001b40 <__dyn_tls_init+0x30>
   140001b2d:	83 fa 01             	cmp    edx,0x1
   140001b30:	74 4e                	je     140001b80 <__dyn_tls_init+0x70>
   140001b32:	48 83 c4 28          	add    rsp,0x28
   140001b36:	5b                   	pop    rbx
   140001b37:	5e                   	pop    rsi
   140001b38:	c3                   	ret
   140001b39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001b40:	48 8d 1d d9 31 00 00 	lea    rbx,[rip+0x31d9]        # 140004d20 <__xd_z>
   140001b47:	48 8d 35 d2 31 00 00 	lea    rsi,[rip+0x31d2]        # 140004d20 <__xd_z>
   140001b4e:	48 39 f3             	cmp    rbx,rsi
   140001b51:	74 df                	je     140001b32 <__dyn_tls_init+0x22>
   140001b53:	66 90                	xchg   ax,ax
   140001b55:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001b5c:	00 00 00 00 
   140001b60:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001b63:	48 85 c0             	test   rax,rax
   140001b66:	74 02                	je     140001b6a <__dyn_tls_init+0x5a>
   140001b68:	ff d0                	call   rax
   140001b6a:	48 83 c3 08          	add    rbx,0x8
   140001b6e:	48 39 f3             	cmp    rbx,rsi
   140001b71:	75 ed                	jne    140001b60 <__dyn_tls_init+0x50>
   140001b73:	48 83 c4 28          	add    rsp,0x28
   140001b77:	5b                   	pop    rbx
   140001b78:	5e                   	pop    rsi
   140001b79:	c3                   	ret
   140001b7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001b80:	48 83 c4 28          	add    rsp,0x28
   140001b84:	5b                   	pop    rbx
   140001b85:	5e                   	pop    rsi
   140001b86:	e9 25 0a 00 00       	jmp    1400025b0 <__mingw_TLScallback>
   140001b8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000140001b90 <__tlregdtor>:
   140001b90:	31 c0                	xor    eax,eax
   140001b92:	c3                   	ret
   140001b93:	90                   	nop
   140001b94:	90                   	nop
   140001b95:	90                   	nop
   140001b96:	90                   	nop
   140001b97:	90                   	nop
   140001b98:	90                   	nop
   140001b99:	90                   	nop
   140001b9a:	90                   	nop
   140001b9b:	90                   	nop
   140001b9c:	90                   	nop
   140001b9d:	90                   	nop
   140001b9e:	90                   	nop
   140001b9f:	90                   	nop

0000000140001ba0 <_matherr>:
   140001ba0:	56                   	push   rsi
   140001ba1:	53                   	push   rbx
   140001ba2:	48 83 ec 78          	sub    rsp,0x78
   140001ba6:	0f 11 74 24 40       	movups XMMWORD PTR [rsp+0x40],xmm6
   140001bab:	0f 11 7c 24 50       	movups XMMWORD PTR [rsp+0x50],xmm7
   140001bb0:	44 0f 11 44 24 60    	movups XMMWORD PTR [rsp+0x60],xmm8
   140001bb6:	83 39 06             	cmp    DWORD PTR [rcx],0x6
   140001bb9:	0f 87 cd 00 00 00    	ja     140001c8c <_matherr+0xec>
   140001bbf:	8b 01                	mov    eax,DWORD PTR [rcx]
   140001bc1:	48 8d 15 1c 27 00 00 	lea    rdx,[rip+0x271c]        # 1400042e4 <.rdata+0x124>
   140001bc8:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001bcc:	48 01 d0             	add    rax,rdx
   140001bcf:	ff e0                	jmp    rax
   140001bd1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001bd8:	48 8d 1d 00 26 00 00 	lea    rbx,[rip+0x2600]        # 1400041df <.rdata+0x1f>
   140001bdf:	f2 44 0f 10 41 20    	movsd  xmm8,QWORD PTR [rcx+0x20]
   140001be5:	f2 0f 10 79 18       	movsd  xmm7,QWORD PTR [rcx+0x18]
   140001bea:	f2 0f 10 71 10       	movsd  xmm6,QWORD PTR [rcx+0x10]
   140001bef:	48 8b 71 08          	mov    rsi,QWORD PTR [rcx+0x8]
   140001bf3:	b9 02 00 00 00       	mov    ecx,0x2
   140001bf8:	e8 63 10 00 00       	call   140002c60 <__acrt_iob_func>
   140001bfd:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001c04:	49 89 d8             	mov    r8,rbx
   140001c07:	48 8d 15 aa 26 00 00 	lea    rdx,[rip+0x26aa]        # 1400042b8 <.rdata+0xf8>
   140001c0e:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001c14:	49 89 f1             	mov    r9,rsi
   140001c17:	48 89 c1             	mov    rcx,rax
   140001c1a:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001c20:	e8 1b 0f 00 00       	call   140002b40 <fprintf>
   140001c25:	90                   	nop
   140001c26:	0f 10 74 24 40       	movups xmm6,XMMWORD PTR [rsp+0x40]
   140001c2b:	0f 10 7c 24 50       	movups xmm7,XMMWORD PTR [rsp+0x50]
   140001c30:	31 c0                	xor    eax,eax
   140001c32:	44 0f 10 44 24 60    	movups xmm8,XMMWORD PTR [rsp+0x60]
   140001c38:	48 83 c4 78          	add    rsp,0x78
   140001c3c:	5b                   	pop    rbx
   140001c3d:	5e                   	pop    rsi
   140001c3e:	c3                   	ret
   140001c3f:	90                   	nop
   140001c40:	48 8d 1d 79 25 00 00 	lea    rbx,[rip+0x2579]        # 1400041c0 <.rdata>
   140001c47:	eb 96                	jmp    140001bdf <_matherr+0x3f>
   140001c49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001c50:	48 8d 1d c9 25 00 00 	lea    rbx,[rip+0x25c9]        # 140004220 <.rdata+0x60>
   140001c57:	eb 86                	jmp    140001bdf <_matherr+0x3f>
   140001c59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001c60:	48 8d 1d 99 25 00 00 	lea    rbx,[rip+0x2599]        # 140004200 <.rdata+0x40>
   140001c67:	e9 73 ff ff ff       	jmp    140001bdf <_matherr+0x3f>
   140001c6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001c70:	48 8d 1d f9 25 00 00 	lea    rbx,[rip+0x25f9]        # 140004270 <.rdata+0xb0>
   140001c77:	e9 63 ff ff ff       	jmp    140001bdf <_matherr+0x3f>
   140001c7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001c80:	48 8d 1d c1 25 00 00 	lea    rbx,[rip+0x25c1]        # 140004248 <.rdata+0x88>
   140001c87:	e9 53 ff ff ff       	jmp    140001bdf <_matherr+0x3f>
   140001c8c:	48 8d 1d 13 26 00 00 	lea    rbx,[rip+0x2613]        # 1400042a6 <.rdata+0xe6>
   140001c93:	e9 47 ff ff ff       	jmp    140001bdf <_matherr+0x3f>
   140001c98:	90                   	nop
   140001c99:	90                   	nop
   140001c9a:	90                   	nop
   140001c9b:	90                   	nop
   140001c9c:	90                   	nop
   140001c9d:	90                   	nop
   140001c9e:	90                   	nop
   140001c9f:	90                   	nop

0000000140001ca0 <__report_error>:
   140001ca0:	56                   	push   rsi
   140001ca1:	53                   	push   rbx
   140001ca2:	48 83 ec 38          	sub    rsp,0x38
   140001ca6:	48 89 cb             	mov    rbx,rcx
   140001ca9:	48 8d 44 24 58       	lea    rax,[rsp+0x58]
   140001cae:	b9 02 00 00 00       	mov    ecx,0x2
   140001cb3:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   140001cb8:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   140001cbd:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   140001cc2:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140001cc7:	e8 94 0f 00 00       	call   140002c60 <__acrt_iob_func>
   140001ccc:	48 8d 15 2d 26 00 00 	lea    rdx,[rip+0x262d]        # 140004300 <.rdata>
   140001cd3:	48 89 c1             	mov    rcx,rax
   140001cd6:	e8 65 0e 00 00       	call   140002b40 <fprintf>
   140001cdb:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   140001ce0:	b9 02 00 00 00       	mov    ecx,0x2
   140001ce5:	e8 76 0f 00 00       	call   140002c60 <__acrt_iob_func>
   140001cea:	48 89 da             	mov    rdx,rbx
   140001ced:	49 89 f0             	mov    r8,rsi
   140001cf0:	48 89 c1             	mov    rcx,rax
   140001cf3:	e8 08 0e 00 00       	call   140002b00 <vfprintf>
   140001cf8:	e8 e3 0f 00 00       	call   140002ce0 <abort>
   140001cfd:	90                   	nop
   140001cfe:	66 90                	xchg   ax,ax

0000000140001d00 <mark_section_writable>:
   140001d00:	57                   	push   rdi
   140001d01:	56                   	push   rsi
   140001d02:	53                   	push   rbx
   140001d03:	48 83 ec 50          	sub    rsp,0x50
   140001d07:	48 63 35 b6 53 00 00 	movsxd rsi,DWORD PTR [rip+0x53b6]        # 1400070c4 <maxSections>
   140001d0e:	48 89 cb             	mov    rbx,rcx
   140001d11:	85 f6                	test   esi,esi
   140001d13:	0f 8e 17 01 00 00    	jle    140001e30 <mark_section_writable+0x130>
   140001d19:	48 8b 05 a8 53 00 00 	mov    rax,QWORD PTR [rip+0x53a8]        # 1400070c8 <the_secs>
   140001d20:	45 31 c9             	xor    r9d,r9d
   140001d23:	48 83 c0 18          	add    rax,0x18
   140001d27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001d2e:	00 00 
   140001d30:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   140001d33:	4c 39 c3             	cmp    rbx,r8
   140001d36:	72 13                	jb     140001d4b <mark_section_writable+0x4b>
   140001d38:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140001d3c:	8b 52 08             	mov    edx,DWORD PTR [rdx+0x8]
   140001d3f:	49 01 d0             	add    r8,rdx
   140001d42:	4c 39 c3             	cmp    rbx,r8
   140001d45:	0f 82 8a 00 00 00    	jb     140001dd5 <mark_section_writable+0xd5>
   140001d4b:	41 83 c1 01          	add    r9d,0x1
   140001d4f:	48 83 c0 28          	add    rax,0x28
   140001d53:	41 39 f1             	cmp    r9d,esi
   140001d56:	75 d8                	jne    140001d30 <mark_section_writable+0x30>
   140001d58:	48 89 d9             	mov    rcx,rbx
   140001d5b:	e8 90 0a 00 00       	call   1400027f0 <__mingw_GetSectionForAddress>
   140001d60:	48 89 c7             	mov    rdi,rax
   140001d63:	48 85 c0             	test   rax,rax
   140001d66:	0f 84 e6 00 00 00    	je     140001e52 <mark_section_writable+0x152>
   140001d6c:	48 8b 05 55 53 00 00 	mov    rax,QWORD PTR [rip+0x5355]        # 1400070c8 <the_secs>
   140001d73:	48 8d 1c b6          	lea    rbx,[rsi+rsi*4]
   140001d77:	48 c1 e3 03          	shl    rbx,0x3
   140001d7b:	48 01 d8             	add    rax,rbx
   140001d7e:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   140001d82:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001d88:	e8 a3 0b 00 00       	call   140002930 <_GetPEImageBase>
   140001d8d:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   140001d90:	41 b8 30 00 00 00    	mov    r8d,0x30
   140001d96:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   140001d9a:	48 8b 05 27 53 00 00 	mov    rax,QWORD PTR [rip+0x5327]        # 1400070c8 <the_secs>
   140001da1:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   140001da6:	48 89 4c 18 18       	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   140001dab:	ff 15 af 65 00 00    	call   QWORD PTR [rip+0x65af]        # 140008360 <__imp_VirtualQuery>
   140001db1:	48 85 c0             	test   rax,rax
   140001db4:	0f 84 7d 00 00 00    	je     140001e37 <mark_section_writable+0x137>
   140001dba:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   140001dbe:	8d 50 fc             	lea    edx,[rax-0x4]
   140001dc1:	83 e2 fb             	and    edx,0xfffffffb
   140001dc4:	74 08                	je     140001dce <mark_section_writable+0xce>
   140001dc6:	8d 50 c0             	lea    edx,[rax-0x40]
   140001dc9:	83 e2 bf             	and    edx,0xffffffbf
   140001dcc:	75 12                	jne    140001de0 <mark_section_writable+0xe0>
   140001dce:	83 05 ef 52 00 00 01 	add    DWORD PTR [rip+0x52ef],0x1        # 1400070c4 <maxSections>
   140001dd5:	48 83 c4 50          	add    rsp,0x50
   140001dd9:	5b                   	pop    rbx
   140001dda:	5e                   	pop    rsi
   140001ddb:	5f                   	pop    rdi
   140001ddc:	c3                   	ret
   140001ddd:	0f 1f 00             	nop    DWORD PTR [rax]
   140001de0:	83 f8 02             	cmp    eax,0x2
   140001de3:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   140001de8:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140001ded:	41 b8 40 00 00 00    	mov    r8d,0x40
   140001df3:	b8 04 00 00 00       	mov    eax,0x4
   140001df8:	44 0f 44 c0          	cmove  r8d,eax
   140001dfc:	48 03 1d c5 52 00 00 	add    rbx,QWORD PTR [rip+0x52c5]        # 1400070c8 <the_secs>
   140001e03:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   140001e07:	49 89 d9             	mov    r9,rbx
   140001e0a:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   140001e0e:	ff 15 44 65 00 00    	call   QWORD PTR [rip+0x6544]        # 140008358 <__imp_VirtualProtect>
   140001e14:	85 c0                	test   eax,eax
   140001e16:	75 b6                	jne    140001dce <mark_section_writable+0xce>
   140001e18:	ff 15 02 65 00 00    	call   QWORD PTR [rip+0x6502]        # 140008320 <__imp_GetLastError>
   140001e1e:	48 8d 0d 53 25 00 00 	lea    rcx,[rip+0x2553]        # 140004378 <.rdata+0x78>
   140001e25:	89 c2                	mov    edx,eax
   140001e27:	e8 74 fe ff ff       	call   140001ca0 <__report_error>
   140001e2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001e30:	31 f6                	xor    esi,esi
   140001e32:	e9 21 ff ff ff       	jmp    140001d58 <mark_section_writable+0x58>
   140001e37:	48 8b 05 8a 52 00 00 	mov    rax,QWORD PTR [rip+0x528a]        # 1400070c8 <the_secs>
   140001e3e:	8b 57 08             	mov    edx,DWORD PTR [rdi+0x8]
   140001e41:	48 8d 0d f8 24 00 00 	lea    rcx,[rip+0x24f8]        # 140004340 <.rdata+0x40>
   140001e48:	4c 8b 44 18 18       	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   140001e4d:	e8 4e fe ff ff       	call   140001ca0 <__report_error>
   140001e52:	48 89 da             	mov    rdx,rbx
   140001e55:	48 8d 0d c4 24 00 00 	lea    rcx,[rip+0x24c4]        # 140004320 <.rdata+0x20>
   140001e5c:	e8 3f fe ff ff       	call   140001ca0 <__report_error>
   140001e61:	90                   	nop
   140001e62:	0f 1f 00             	nop    DWORD PTR [rax]
   140001e65:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001e6c:	00 00 00 00 

0000000140001e70 <_pei386_runtime_relocator>:
   140001e70:	55                   	push   rbp
   140001e71:	41 57                	push   r15
   140001e73:	41 56                	push   r14
   140001e75:	41 55                	push   r13
   140001e77:	41 54                	push   r12
   140001e79:	57                   	push   rdi
   140001e7a:	56                   	push   rsi
   140001e7b:	53                   	push   rbx
   140001e7c:	48 83 ec 48          	sub    rsp,0x48
   140001e80:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140001e85:	8b 35 35 52 00 00    	mov    esi,DWORD PTR [rip+0x5235]        # 1400070c0 <was_init.0>
   140001e8b:	85 f6                	test   esi,esi
   140001e8d:	74 11                	je     140001ea0 <_pei386_runtime_relocator+0x30>
   140001e8f:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   140001e93:	5b                   	pop    rbx
   140001e94:	5e                   	pop    rsi
   140001e95:	5f                   	pop    rdi
   140001e96:	41 5c                	pop    r12
   140001e98:	41 5d                	pop    r13
   140001e9a:	41 5e                	pop    r14
   140001e9c:	41 5f                	pop    r15
   140001e9e:	5d                   	pop    rbp
   140001e9f:	c3                   	ret
   140001ea0:	c7 05 16 52 00 00 01 	mov    DWORD PTR [rip+0x5216],0x1        # 1400070c0 <was_init.0>
   140001ea7:	00 00 00 
   140001eaa:	e8 c1 09 00 00       	call   140002870 <__mingw_GetSectionCount>
   140001eaf:	48 98                	cdqe
   140001eb1:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140001eb5:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140001ebc:	00 
   140001ebd:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   140001ec1:	e8 fa 0b 00 00       	call   140002ac0 <___chkstk_ms>
   140001ec6:	48 8b 3d 23 26 00 00 	mov    rdi,QWORD PTR [rip+0x2623]        # 1400044f0 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
   140001ecd:	48 8b 1d 2c 26 00 00 	mov    rbx,QWORD PTR [rip+0x262c]        # 140004500 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
   140001ed4:	48 29 c4             	sub    rsp,rax
   140001ed7:	c7 05 e3 51 00 00 00 	mov    DWORD PTR [rip+0x51e3],0x0        # 1400070c4 <maxSections>
   140001ede:	00 00 00 
   140001ee1:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   140001ee6:	48 89 05 db 51 00 00 	mov    QWORD PTR [rip+0x51db],rax        # 1400070c8 <the_secs>
   140001eed:	48 89 f8             	mov    rax,rdi
   140001ef0:	48 29 d8             	sub    rax,rbx
   140001ef3:	48 83 f8 07          	cmp    rax,0x7
   140001ef7:	7e 96                	jle    140001e8f <_pei386_runtime_relocator+0x1f>
   140001ef9:	48 83 f8 0b          	cmp    rax,0xb
   140001efd:	0f 8f 85 01 00 00    	jg     140002088 <_pei386_runtime_relocator+0x218>
   140001f03:	8b 13                	mov    edx,DWORD PTR [rbx]
   140001f05:	85 d2                	test   edx,edx
   140001f07:	0f 85 90 01 00 00    	jne    14000209d <_pei386_runtime_relocator+0x22d>
   140001f0d:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140001f10:	85 c0                	test   eax,eax
   140001f12:	0f 85 85 01 00 00    	jne    14000209d <_pei386_runtime_relocator+0x22d>
   140001f18:	8b 53 08             	mov    edx,DWORD PTR [rbx+0x8]
   140001f1b:	83 fa 01             	cmp    edx,0x1
   140001f1e:	0f 85 cf 02 00 00    	jne    1400021f3 <_pei386_runtime_relocator+0x383>
   140001f24:	48 83 c3 0c          	add    rbx,0xc
   140001f28:	4c 8b 35 b1 25 00 00 	mov    r14,QWORD PTR [rip+0x25b1]        # 1400044e0 <.refptr.__ImageBase>
   140001f2f:	4c 8d 65 f8          	lea    r12,[rbp-0x8]
   140001f33:	48 39 fb             	cmp    rbx,rdi
   140001f36:	72 7c                	jb     140001fb4 <_pei386_runtime_relocator+0x144>
   140001f38:	e9 52 ff ff ff       	jmp    140001e8f <_pei386_runtime_relocator+0x1f>
   140001f3d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001f40:	83 fa 08             	cmp    edx,0x8
   140001f43:	0f 84 1f 02 00 00    	je     140002168 <_pei386_runtime_relocator+0x2f8>
   140001f49:	83 fa 10             	cmp    edx,0x10
   140001f4c:	0f 85 79 02 00 00    	jne    1400021cb <_pei386_runtime_relocator+0x35b>
   140001f52:	41 0f b7 07          	movzx  eax,WORD PTR [r15]
   140001f56:	66 85 c0             	test   ax,ax
   140001f59:	79 06                	jns    140001f61 <_pei386_runtime_relocator+0xf1>
   140001f5b:	48 0d 00 00 ff ff    	or     rax,0xffffffffffff0000
   140001f61:	4c 29 c0             	sub    rax,r8
   140001f64:	4c 01 c8             	add    rax,r9
   140001f67:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001f6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001f71:	75 18                	jne    140001f8b <_pei386_runtime_relocator+0x11b>
   140001f73:	48 3d ff ff 00 00    	cmp    rax,0xffff
   140001f79:	0f 8f 60 02 00 00    	jg     1400021df <_pei386_runtime_relocator+0x36f>
   140001f7f:	48 3d 00 80 ff ff    	cmp    rax,0xffffffffffff8000
   140001f85:	0f 8c 54 02 00 00    	jl     1400021df <_pei386_runtime_relocator+0x36f>
   140001f8b:	4c 89 f9             	mov    rcx,r15
   140001f8e:	4d 89 e5             	mov    r13,r12
   140001f91:	e8 6a fd ff ff       	call   140001d00 <mark_section_writable>
   140001f96:	41 b8 02 00 00 00    	mov    r8d,0x2
   140001f9c:	4c 89 e2             	mov    rdx,r12
   140001f9f:	4c 89 f9             	mov    rcx,r15
   140001fa2:	e8 61 0d 00 00       	call   140002d08 <memcpy>
   140001fa7:	48 83 c3 0c          	add    rbx,0xc
   140001fab:	48 39 fb             	cmp    rbx,rdi
   140001fae:	0f 83 7c 00 00 00    	jae    140002030 <_pei386_runtime_relocator+0x1c0>
   140001fb4:	44 8b 03             	mov    r8d,DWORD PTR [rbx]
   140001fb7:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   140001fba:	44 8b 7b 04          	mov    r15d,DWORD PTR [rbx+0x4]
   140001fbe:	4d 01 f0             	add    r8,r14
   140001fc1:	0f b6 d1             	movzx  edx,cl
   140001fc4:	4d 8b 08             	mov    r9,QWORD PTR [r8]
   140001fc7:	4d 01 f7             	add    r15,r14
   140001fca:	83 fa 20             	cmp    edx,0x20
   140001fcd:	0f 84 2d 01 00 00    	je     140002100 <_pei386_runtime_relocator+0x290>
   140001fd3:	0f 86 67 ff ff ff    	jbe    140001f40 <_pei386_runtime_relocator+0xd0>
   140001fd9:	83 fa 40             	cmp    edx,0x40
   140001fdc:	0f 85 e9 01 00 00    	jne    1400021cb <_pei386_runtime_relocator+0x35b>
   140001fe2:	49 8b 07             	mov    rax,QWORD PTR [r15]
   140001fe5:	4c 29 c0             	sub    rax,r8
   140001fe8:	4c 01 c8             	add    rax,r9
   140001feb:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001ff1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001ff5:	75 09                	jne    140002000 <_pei386_runtime_relocator+0x190>
   140001ff7:	48 85 c0             	test   rax,rax
   140001ffa:	0f 89 df 01 00 00    	jns    1400021df <_pei386_runtime_relocator+0x36f>
   140002000:	4c 89 f9             	mov    rcx,r15
   140002003:	48 83 c3 0c          	add    rbx,0xc
   140002007:	4d 89 e5             	mov    r13,r12
   14000200a:	e8 f1 fc ff ff       	call   140001d00 <mark_section_writable>
   14000200f:	41 b8 08 00 00 00    	mov    r8d,0x8
   140002015:	4c 89 e2             	mov    rdx,r12
   140002018:	4c 89 f9             	mov    rcx,r15
   14000201b:	e8 e8 0c 00 00       	call   140002d08 <memcpy>
   140002020:	48 39 fb             	cmp    rbx,rdi
   140002023:	72 8f                	jb     140001fb4 <_pei386_runtime_relocator+0x144>
   140002025:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000202c:	00 00 00 00 
   140002030:	8b 05 8e 50 00 00    	mov    eax,DWORD PTR [rip+0x508e]        # 1400070c4 <maxSections>
   140002036:	85 c0                	test   eax,eax
   140002038:	0f 8e 51 fe ff ff    	jle    140001e8f <_pei386_runtime_relocator+0x1f>
   14000203e:	48 8b 3d 13 63 00 00 	mov    rdi,QWORD PTR [rip+0x6313]        # 140008358 <__imp_VirtualProtect>
   140002045:	31 db                	xor    ebx,ebx
   140002047:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000204e:	00 00 
   140002050:	48 8b 05 71 50 00 00 	mov    rax,QWORD PTR [rip+0x5071]        # 1400070c8 <the_secs>
   140002057:	48 01 d8             	add    rax,rbx
   14000205a:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   14000205d:	45 85 c0             	test   r8d,r8d
   140002060:	74 0d                	je     14000206f <_pei386_runtime_relocator+0x1ff>
   140002062:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   140002066:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   14000206a:	4d 89 e9             	mov    r9,r13
   14000206d:	ff d7                	call   rdi
   14000206f:	83 c6 01             	add    esi,0x1
   140002072:	48 83 c3 28          	add    rbx,0x28
   140002076:	3b 35 48 50 00 00    	cmp    esi,DWORD PTR [rip+0x5048]        # 1400070c4 <maxSections>
   14000207c:	7c d2                	jl     140002050 <_pei386_runtime_relocator+0x1e0>
   14000207e:	e9 0c fe ff ff       	jmp    140001e8f <_pei386_runtime_relocator+0x1f>
   140002083:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002088:	44 8b 0b             	mov    r9d,DWORD PTR [rbx]
   14000208b:	45 85 c9             	test   r9d,r9d
   14000208e:	75 0d                	jne    14000209d <_pei386_runtime_relocator+0x22d>
   140002090:	44 8b 43 04          	mov    r8d,DWORD PTR [rbx+0x4]
   140002094:	45 85 c0             	test   r8d,r8d
   140002097:	0f 84 1a 01 00 00    	je     1400021b7 <_pei386_runtime_relocator+0x347>
   14000209d:	48 39 fb             	cmp    rbx,rdi
   1400020a0:	0f 83 e9 fd ff ff    	jae    140001e8f <_pei386_runtime_relocator+0x1f>
   1400020a6:	4c 8b 35 33 24 00 00 	mov    r14,QWORD PTR [rip+0x2433]        # 1400044e0 <.refptr.__ImageBase>
   1400020ad:	4c 8d 6d f8          	lea    r13,[rbp-0x8]
   1400020b1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400020b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400020bc:	00 00 00 00 
   1400020c0:	44 8b 63 04          	mov    r12d,DWORD PTR [rbx+0x4]
   1400020c4:	8b 03                	mov    eax,DWORD PTR [rbx]
   1400020c6:	48 83 c3 08          	add    rbx,0x8
   1400020ca:	43 03 04 26          	add    eax,DWORD PTR [r14+r12*1]
   1400020ce:	4b 8d 0c 34          	lea    rcx,[r12+r14*1]
   1400020d2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   1400020d5:	e8 26 fc ff ff       	call   140001d00 <mark_section_writable>
   1400020da:	41 b8 04 00 00 00    	mov    r8d,0x4
   1400020e0:	4c 89 ea             	mov    rdx,r13
   1400020e3:	4b 8d 0c 34          	lea    rcx,[r12+r14*1]
   1400020e7:	e8 1c 0c 00 00       	call   140002d08 <memcpy>
   1400020ec:	48 39 fb             	cmp    rbx,rdi
   1400020ef:	72 cf                	jb     1400020c0 <_pei386_runtime_relocator+0x250>
   1400020f1:	e9 3a ff ff ff       	jmp    140002030 <_pei386_runtime_relocator+0x1c0>
   1400020f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400020fd:	00 00 00 
   140002100:	41 8b 07             	mov    eax,DWORD PTR [r15]
   140002103:	85 c0                	test   eax,eax
   140002105:	79 0d                	jns    140002114 <_pei386_runtime_relocator+0x2a4>
   140002107:	49 bb 00 00 00 00 ff 	movabs r11,0xffffffff00000000
   14000210e:	ff ff ff 
   140002111:	4c 09 d8             	or     rax,r11
   140002114:	4c 29 c0             	sub    rax,r8
   140002117:	4c 01 c8             	add    rax,r9
   14000211a:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140002120:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002124:	75 1a                	jne    140002140 <_pei386_runtime_relocator+0x2d0>
   140002126:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   14000212b:	48 39 c8             	cmp    rax,rcx
   14000212e:	0f 8f ab 00 00 00    	jg     1400021df <_pei386_runtime_relocator+0x36f>
   140002134:	48 3d 00 00 00 80    	cmp    rax,0xffffffff80000000
   14000213a:	0f 8c 9f 00 00 00    	jl     1400021df <_pei386_runtime_relocator+0x36f>
   140002140:	4c 89 f9             	mov    rcx,r15
   140002143:	4d 89 e5             	mov    r13,r12
   140002146:	e8 b5 fb ff ff       	call   140001d00 <mark_section_writable>
   14000214b:	41 b8 04 00 00 00    	mov    r8d,0x4
   140002151:	4c 89 e2             	mov    rdx,r12
   140002154:	4c 89 f9             	mov    rcx,r15
   140002157:	e8 ac 0b 00 00       	call   140002d08 <memcpy>
   14000215c:	e9 46 fe ff ff       	jmp    140001fa7 <_pei386_runtime_relocator+0x137>
   140002161:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002168:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
   14000216c:	84 c0                	test   al,al
   14000216e:	79 06                	jns    140002176 <_pei386_runtime_relocator+0x306>
   140002170:	48 0d 00 ff ff ff    	or     rax,0xffffffffffffff00
   140002176:	4c 29 c0             	sub    rax,r8
   140002179:	4c 01 c8             	add    rax,r9
   14000217c:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140002182:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002186:	75 0e                	jne    140002196 <_pei386_runtime_relocator+0x326>
   140002188:	48 3d ff 00 00 00    	cmp    rax,0xff
   14000218e:	7f 4f                	jg     1400021df <_pei386_runtime_relocator+0x36f>
   140002190:	48 83 f8 80          	cmp    rax,0xffffffffffffff80
   140002194:	7c 49                	jl     1400021df <_pei386_runtime_relocator+0x36f>
   140002196:	4c 89 f9             	mov    rcx,r15
   140002199:	4d 89 e5             	mov    r13,r12
   14000219c:	e8 5f fb ff ff       	call   140001d00 <mark_section_writable>
   1400021a1:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400021a7:	4c 89 e2             	mov    rdx,r12
   1400021aa:	4c 89 f9             	mov    rcx,r15
   1400021ad:	e8 56 0b 00 00       	call   140002d08 <memcpy>
   1400021b2:	e9 f0 fd ff ff       	jmp    140001fa7 <_pei386_runtime_relocator+0x137>
   1400021b7:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   1400021ba:	85 c9                	test   ecx,ecx
   1400021bc:	0f 85 56 fd ff ff    	jne    140001f18 <_pei386_runtime_relocator+0xa8>
   1400021c2:	48 83 c3 0c          	add    rbx,0xc
   1400021c6:	e9 38 fd ff ff       	jmp    140001f03 <_pei386_runtime_relocator+0x93>
   1400021cb:	48 8d 0d 06 22 00 00 	lea    rcx,[rip+0x2206]        # 1400043d8 <.rdata+0xd8>
   1400021d2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   1400021d9:	00 
   1400021da:	e8 c1 fa ff ff       	call   140001ca0 <__report_error>
   1400021df:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400021e4:	4d 89 f8             	mov    r8,r15
   1400021e7:	48 8d 0d 1a 22 00 00 	lea    rcx,[rip+0x221a]        # 140004408 <.rdata+0x108>
   1400021ee:	e8 ad fa ff ff       	call   140001ca0 <__report_error>
   1400021f3:	48 8d 0d a6 21 00 00 	lea    rcx,[rip+0x21a6]        # 1400043a0 <.rdata+0xa0>
   1400021fa:	e8 a1 fa ff ff       	call   140001ca0 <__report_error>
   1400021ff:	90                   	nop

0000000140002200 <__mingw_raise_matherr>:
   140002200:	48 83 ec 58          	sub    rsp,0x58
   140002204:	48 8b 05 c5 4e 00 00 	mov    rax,QWORD PTR [rip+0x4ec5]        # 1400070d0 <stUserMathErr>
   14000220b:	48 85 c0             	test   rax,rax
   14000220e:	74 29                	je     140002239 <__mingw_raise_matherr+0x39>
   140002210:	f2 0f 10 84 24 80 00 	movsd  xmm0,QWORD PTR [rsp+0x80]
   140002217:	00 00 
   140002219:	66 0f 14 d3          	unpcklpd xmm2,xmm3
   14000221d:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   140002221:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140002226:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   14000222b:	0f 11 54 24 30       	movups XMMWORD PTR [rsp+0x30],xmm2
   140002230:	f2 0f 11 44 24 40    	movsd  QWORD PTR [rsp+0x40],xmm0
   140002236:	ff d0                	call   rax
   140002238:	90                   	nop
   140002239:	48 83 c4 58          	add    rsp,0x58
   14000223d:	c3                   	ret
   14000223e:	66 90                	xchg   ax,ax

0000000140002240 <__mingw_setusermatherr>:
   140002240:	48 89 0d 89 4e 00 00 	mov    QWORD PTR [rip+0x4e89],rcx        # 1400070d0 <stUserMathErr>
   140002247:	e9 d4 0a 00 00       	jmp    140002d20 <__setusermatherr>
   14000224c:	90                   	nop
   14000224d:	90                   	nop
   14000224e:	90                   	nop
   14000224f:	90                   	nop

0000000140002250 <_gnu_exception_handler>:
   140002250:	53                   	push   rbx
   140002251:	48 83 ec 20          	sub    rsp,0x20
   140002255:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140002258:	8b 02                	mov    eax,DWORD PTR [rdx]
   14000225a:	48 89 cb             	mov    rbx,rcx
   14000225d:	89 c1                	mov    ecx,eax
   14000225f:	81 e1 ff ff ff 20    	and    ecx,0x20ffffff
   140002265:	81 f9 43 43 47 20    	cmp    ecx,0x20474343
   14000226b:	0f 84 8f 00 00 00    	je     140002300 <_gnu_exception_handler+0xb0>
   140002271:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140002276:	77 47                	ja     1400022bf <_gnu_exception_handler+0x6f>
   140002278:	3d 8b 00 00 c0       	cmp    eax,0xc000008b
   14000227d:	76 61                	jbe    1400022e0 <_gnu_exception_handler+0x90>
   14000227f:	05 73 ff ff 3f       	add    eax,0x3fffff73
   140002284:	83 f8 09             	cmp    eax,0x9
   140002287:	77 6b                	ja     1400022f4 <_gnu_exception_handler+0xa4>
   140002289:	48 8d 15 d0 21 00 00 	lea    rdx,[rip+0x21d0]        # 140004460 <.rdata>
   140002290:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140002294:	48 01 d0             	add    rax,rdx
   140002297:	ff e0                	jmp    rax
   140002299:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400022a0:	31 d2                	xor    edx,edx
   1400022a2:	b9 08 00 00 00       	mov    ecx,0x8
   1400022a7:	e8 44 0a 00 00       	call   140002cf0 <signal>
   1400022ac:	48 83 f8 01          	cmp    rax,0x1
   1400022b0:	0f 84 3e 01 00 00    	je     1400023f4 <_gnu_exception_handler+0x1a4>
   1400022b6:	48 85 c0             	test   rax,rax
   1400022b9:	0f 85 01 01 00 00    	jne    1400023c0 <_gnu_exception_handler+0x170>
   1400022bf:	48 8b 05 2a 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e2a]        # 1400070f0 <__mingw_oldexcpt_handler>
   1400022c6:	48 85 c0             	test   rax,rax
   1400022c9:	74 45                	je     140002310 <_gnu_exception_handler+0xc0>
   1400022cb:	48 89 d9             	mov    rcx,rbx
   1400022ce:	48 83 c4 20          	add    rsp,0x20
   1400022d2:	5b                   	pop    rbx
   1400022d3:	48 ff e0             	rex.W jmp rax
   1400022d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400022dd:	00 00 00 
   1400022e0:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   1400022e5:	0f 84 a5 00 00 00    	je     140002390 <_gnu_exception_handler+0x140>
   1400022eb:	77 33                	ja     140002320 <_gnu_exception_handler+0xd0>
   1400022ed:	3d 02 00 00 80       	cmp    eax,0x80000002
   1400022f2:	75 cb                	jne    1400022bf <_gnu_exception_handler+0x6f>
   1400022f4:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400022f9:	48 83 c4 20          	add    rsp,0x20
   1400022fd:	5b                   	pop    rbx
   1400022fe:	c3                   	ret
   1400022ff:	90                   	nop
   140002300:	f6 42 04 01          	test   BYTE PTR [rdx+0x4],0x1
   140002304:	0f 85 67 ff ff ff    	jne    140002271 <_gnu_exception_handler+0x21>
   14000230a:	eb e8                	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   14000230c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002310:	31 c0                	xor    eax,eax
   140002312:	48 83 c4 20          	add    rsp,0x20
   140002316:	5b                   	pop    rbx
   140002317:	c3                   	ret
   140002318:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000231f:	00 
   140002320:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140002325:	74 cd                	je     1400022f4 <_gnu_exception_handler+0xa4>
   140002327:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   14000232c:	75 91                	jne    1400022bf <_gnu_exception_handler+0x6f>
   14000232e:	31 d2                	xor    edx,edx
   140002330:	b9 04 00 00 00       	mov    ecx,0x4
   140002335:	e8 b6 09 00 00       	call   140002cf0 <signal>
   14000233a:	48 83 f8 01          	cmp    rax,0x1
   14000233e:	0f 84 9c 00 00 00    	je     1400023e0 <_gnu_exception_handler+0x190>
   140002344:	48 85 c0             	test   rax,rax
   140002347:	0f 84 72 ff ff ff    	je     1400022bf <_gnu_exception_handler+0x6f>
   14000234d:	b9 04 00 00 00       	mov    ecx,0x4
   140002352:	ff d0                	call   rax
   140002354:	eb 9e                	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   140002356:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000235d:	00 00 00 
   140002360:	31 d2                	xor    edx,edx
   140002362:	b9 08 00 00 00       	mov    ecx,0x8
   140002367:	e8 84 09 00 00       	call   140002cf0 <signal>
   14000236c:	48 83 f8 01          	cmp    rax,0x1
   140002370:	0f 85 40 ff ff ff    	jne    1400022b6 <_gnu_exception_handler+0x66>
   140002376:	ba 01 00 00 00       	mov    edx,0x1
   14000237b:	b9 08 00 00 00       	mov    ecx,0x8
   140002380:	e8 6b 09 00 00       	call   140002cf0 <signal>
   140002385:	e9 6a ff ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   14000238a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002390:	31 d2                	xor    edx,edx
   140002392:	b9 0b 00 00 00       	mov    ecx,0xb
   140002397:	e8 54 09 00 00       	call   140002cf0 <signal>
   14000239c:	48 83 f8 01          	cmp    rax,0x1
   1400023a0:	74 2a                	je     1400023cc <_gnu_exception_handler+0x17c>
   1400023a2:	48 85 c0             	test   rax,rax
   1400023a5:	0f 84 14 ff ff ff    	je     1400022bf <_gnu_exception_handler+0x6f>
   1400023ab:	b9 0b 00 00 00       	mov    ecx,0xb
   1400023b0:	ff d0                	call   rax
   1400023b2:	e9 3d ff ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   1400023b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400023be:	00 00 
   1400023c0:	b9 08 00 00 00       	mov    ecx,0x8
   1400023c5:	ff d0                	call   rax
   1400023c7:	e9 28 ff ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   1400023cc:	ba 01 00 00 00       	mov    edx,0x1
   1400023d1:	b9 0b 00 00 00       	mov    ecx,0xb
   1400023d6:	e8 15 09 00 00       	call   140002cf0 <signal>
   1400023db:	e9 14 ff ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   1400023e0:	ba 01 00 00 00       	mov    edx,0x1
   1400023e5:	b9 04 00 00 00       	mov    ecx,0x4
   1400023ea:	e8 01 09 00 00       	call   140002cf0 <signal>
   1400023ef:	e9 00 ff ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   1400023f4:	ba 01 00 00 00       	mov    edx,0x1
   1400023f9:	b9 08 00 00 00       	mov    ecx,0x8
   1400023fe:	e8 ed 08 00 00       	call   140002cf0 <signal>
   140002403:	e8 b8 02 00 00       	call   1400026c0 <_fpreset>
   140002408:	e9 e7 fe ff ff       	jmp    1400022f4 <_gnu_exception_handler+0xa4>
   14000240d:	90                   	nop
   14000240e:	90                   	nop
   14000240f:	90                   	nop
   140002410:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140002417:	00 00 00 
   14000241a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140002420 <__mingwthr_run_key_dtors.part.0>:
   140002420:	55                   	push   rbp
   140002421:	57                   	push   rdi
   140002422:	56                   	push   rsi
   140002423:	53                   	push   rbx
   140002424:	48 83 ec 28          	sub    rsp,0x28
   140002428:	48 8d 0d f1 4c 00 00 	lea    rcx,[rip+0x4cf1]        # 140007120 <__mingwthr_cs>
   14000242f:	ff 15 e3 5e 00 00    	call   QWORD PTR [rip+0x5ee3]        # 140008318 <__imp_EnterCriticalSection>
   140002435:	48 8b 1d c4 4c 00 00 	mov    rbx,QWORD PTR [rip+0x4cc4]        # 140007100 <key_dtor_list>
   14000243c:	48 85 db             	test   rbx,rbx
   14000243f:	74 33                	je     140002474 <__mingwthr_run_key_dtors.part.0+0x54>
   140002441:	48 8b 2d 08 5f 00 00 	mov    rbp,QWORD PTR [rip+0x5f08]        # 140008350 <__imp_TlsGetValue>
   140002448:	48 8b 3d d1 5e 00 00 	mov    rdi,QWORD PTR [rip+0x5ed1]        # 140008320 <__imp_GetLastError>
   14000244f:	90                   	nop
   140002450:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140002452:	ff d5                	call   rbp
   140002454:	48 89 c6             	mov    rsi,rax
   140002457:	ff d7                	call   rdi
   140002459:	48 85 f6             	test   rsi,rsi
   14000245c:	74 0d                	je     14000246b <__mingwthr_run_key_dtors.part.0+0x4b>
   14000245e:	85 c0                	test   eax,eax
   140002460:	75 09                	jne    14000246b <__mingwthr_run_key_dtors.part.0+0x4b>
   140002462:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140002466:	48 89 f1             	mov    rcx,rsi
   140002469:	ff d0                	call   rax
   14000246b:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   14000246f:	48 85 db             	test   rbx,rbx
   140002472:	75 dc                	jne    140002450 <__mingwthr_run_key_dtors.part.0+0x30>
   140002474:	48 8d 0d a5 4c 00 00 	lea    rcx,[rip+0x4ca5]        # 140007120 <__mingwthr_cs>
   14000247b:	48 83 c4 28          	add    rsp,0x28
   14000247f:	5b                   	pop    rbx
   140002480:	5e                   	pop    rsi
   140002481:	5f                   	pop    rdi
   140002482:	5d                   	pop    rbp
   140002483:	48 ff 25 ae 5e 00 00 	rex.W jmp QWORD PTR [rip+0x5eae]        # 140008338 <__imp_LeaveCriticalSection>
   14000248a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140002490 <___w64_mingwthr_add_key_dtor>:
   140002490:	48 83 ec 38          	sub    rsp,0x38
   140002494:	8b 05 6e 4c 00 00    	mov    eax,DWORD PTR [rip+0x4c6e]        # 140007108 <__mingwthr_cs_init>
   14000249a:	41 89 c9             	mov    r9d,ecx
   14000249d:	85 c0                	test   eax,eax
   14000249f:	75 0f                	jne    1400024b0 <___w64_mingwthr_add_key_dtor+0x20>
   1400024a1:	31 c0                	xor    eax,eax
   1400024a3:	48 83 c4 38          	add    rsp,0x38
   1400024a7:	c3                   	ret
   1400024a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400024af:	00 
   1400024b0:	48 89 54 24 48       	mov    QWORD PTR [rsp+0x48],rdx
   1400024b5:	b9 01 00 00 00       	mov    ecx,0x1
   1400024ba:	ba 18 00 00 00       	mov    edx,0x18
   1400024bf:	44 89 4c 24 40       	mov    DWORD PTR [rsp+0x40],r9d
   1400024c4:	e8 7f 08 00 00       	call   140002d48 <calloc>
   1400024c9:	48 85 c0             	test   rax,rax
   1400024cc:	74 49                	je     140002517 <___w64_mingwthr_add_key_dtor+0x87>
   1400024ce:	44 8b 4c 24 40       	mov    r9d,DWORD PTR [rsp+0x40]
   1400024d3:	4c 8b 44 24 48       	mov    r8,QWORD PTR [rsp+0x48]
   1400024d8:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1400024dd:	48 8d 0d 3c 4c 00 00 	lea    rcx,[rip+0x4c3c]        # 140007120 <__mingwthr_cs>
   1400024e4:	44 89 08             	mov    DWORD PTR [rax],r9d
   1400024e7:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
   1400024eb:	ff 15 27 5e 00 00    	call   QWORD PTR [rip+0x5e27]        # 140008318 <__imp_EnterCriticalSection>
   1400024f1:	48 8b 15 08 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c08]        # 140007100 <key_dtor_list>
   1400024f8:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   1400024fd:	48 8d 0d 1c 4c 00 00 	lea    rcx,[rip+0x4c1c]        # 140007120 <__mingwthr_cs>
   140002504:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   140002508:	48 89 05 f1 4b 00 00 	mov    QWORD PTR [rip+0x4bf1],rax        # 140007100 <key_dtor_list>
   14000250f:	ff 15 23 5e 00 00    	call   QWORD PTR [rip+0x5e23]        # 140008338 <__imp_LeaveCriticalSection>
   140002515:	eb 8a                	jmp    1400024a1 <___w64_mingwthr_add_key_dtor+0x11>
   140002517:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000251c:	eb 85                	jmp    1400024a3 <___w64_mingwthr_add_key_dtor+0x13>
   14000251e:	66 90                	xchg   ax,ax

0000000140002520 <___w64_mingwthr_remove_key_dtor>:
   140002520:	48 83 ec 28          	sub    rsp,0x28
   140002524:	8b 05 de 4b 00 00    	mov    eax,DWORD PTR [rip+0x4bde]        # 140007108 <__mingwthr_cs_init>
   14000252a:	85 c0                	test   eax,eax
   14000252c:	75 0a                	jne    140002538 <___w64_mingwthr_remove_key_dtor+0x18>
   14000252e:	31 c0                	xor    eax,eax
   140002530:	48 83 c4 28          	add    rsp,0x28
   140002534:	c3                   	ret
   140002535:	0f 1f 00             	nop    DWORD PTR [rax]
   140002538:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14000253c:	48 8d 0d dd 4b 00 00 	lea    rcx,[rip+0x4bdd]        # 140007120 <__mingwthr_cs>
   140002543:	ff 15 cf 5d 00 00    	call   QWORD PTR [rip+0x5dcf]        # 140008318 <__imp_EnterCriticalSection>
   140002549:	48 8b 0d b0 4b 00 00 	mov    rcx,QWORD PTR [rip+0x4bb0]        # 140007100 <key_dtor_list>
   140002550:	48 85 c9             	test   rcx,rcx
   140002553:	74 2e                	je     140002583 <___w64_mingwthr_remove_key_dtor+0x63>
   140002555:	8b 54 24 30          	mov    edx,DWORD PTR [rsp+0x30]
   140002559:	45 31 c0             	xor    r8d,r8d
   14000255c:	eb 0d                	jmp    14000256b <___w64_mingwthr_remove_key_dtor+0x4b>
   14000255e:	66 90                	xchg   ax,ax
   140002560:	49 89 c8             	mov    r8,rcx
   140002563:	48 85 c0             	test   rax,rax
   140002566:	74 1b                	je     140002583 <___w64_mingwthr_remove_key_dtor+0x63>
   140002568:	48 89 c1             	mov    rcx,rax
   14000256b:	8b 01                	mov    eax,DWORD PTR [rcx]
   14000256d:	39 d0                	cmp    eax,edx
   14000256f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140002573:	75 eb                	jne    140002560 <___w64_mingwthr_remove_key_dtor+0x40>
   140002575:	4d 85 c0             	test   r8,r8
   140002578:	74 26                	je     1400025a0 <___w64_mingwthr_remove_key_dtor+0x80>
   14000257a:	49 89 40 10          	mov    QWORD PTR [r8+0x10],rax
   14000257e:	e8 cd 07 00 00       	call   140002d50 <free>
   140002583:	48 8d 0d 96 4b 00 00 	lea    rcx,[rip+0x4b96]        # 140007120 <__mingwthr_cs>
   14000258a:	ff 15 a8 5d 00 00    	call   QWORD PTR [rip+0x5da8]        # 140008338 <__imp_LeaveCriticalSection>
   140002590:	31 c0                	xor    eax,eax
   140002592:	48 83 c4 28          	add    rsp,0x28
   140002596:	c3                   	ret
   140002597:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000259e:	00 00 
   1400025a0:	48 89 05 59 4b 00 00 	mov    QWORD PTR [rip+0x4b59],rax        # 140007100 <key_dtor_list>
   1400025a7:	eb d5                	jmp    14000257e <___w64_mingwthr_remove_key_dtor+0x5e>
   1400025a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000001400025b0 <__mingw_TLScallback>:
   1400025b0:	48 83 ec 38          	sub    rsp,0x38
   1400025b4:	83 fa 02             	cmp    edx,0x2
   1400025b7:	0f 84 bb 00 00 00    	je     140002678 <__mingw_TLScallback+0xc8>
   1400025bd:	77 29                	ja     1400025e8 <__mingw_TLScallback+0x38>
   1400025bf:	85 d2                	test   edx,edx
   1400025c1:	74 3d                	je     140002600 <__mingw_TLScallback+0x50>
   1400025c3:	8b 05 3f 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b3f]        # 140007108 <__mingwthr_cs_init>
   1400025c9:	85 c0                	test   eax,eax
   1400025cb:	0f 84 cf 00 00 00    	je     1400026a0 <__mingw_TLScallback+0xf0>
   1400025d1:	c7 05 2d 4b 00 00 01 	mov    DWORD PTR [rip+0x4b2d],0x1        # 140007108 <__mingwthr_cs_init>
   1400025d8:	00 00 00 
   1400025db:	b8 01 00 00 00       	mov    eax,0x1
   1400025e0:	48 83 c4 38          	add    rsp,0x38
   1400025e4:	c3                   	ret
   1400025e5:	0f 1f 00             	nop    DWORD PTR [rax]
   1400025e8:	83 fa 03             	cmp    edx,0x3
   1400025eb:	75 ee                	jne    1400025db <__mingw_TLScallback+0x2b>
   1400025ed:	8b 05 15 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b15]        # 140007108 <__mingwthr_cs_init>
   1400025f3:	85 c0                	test   eax,eax
   1400025f5:	74 e4                	je     1400025db <__mingw_TLScallback+0x2b>
   1400025f7:	e8 24 fe ff ff       	call   140002420 <__mingwthr_run_key_dtors.part.0>
   1400025fc:	eb dd                	jmp    1400025db <__mingw_TLScallback+0x2b>
   1400025fe:	66 90                	xchg   ax,ax
   140002600:	8b 05 02 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b02]        # 140007108 <__mingwthr_cs_init>
   140002606:	85 c0                	test   eax,eax
   140002608:	0f 85 82 00 00 00    	jne    140002690 <__mingw_TLScallback+0xe0>
   14000260e:	8b 05 f4 4a 00 00    	mov    eax,DWORD PTR [rip+0x4af4]        # 140007108 <__mingwthr_cs_init>
   140002614:	83 f8 01             	cmp    eax,0x1
   140002617:	75 c2                	jne    1400025db <__mingw_TLScallback+0x2b>
   140002619:	48 8b 05 e0 4a 00 00 	mov    rax,QWORD PTR [rip+0x4ae0]        # 140007100 <key_dtor_list>
   140002620:	48 85 c0             	test   rax,rax
   140002623:	74 26                	je     14000264b <__mingw_TLScallback+0x9b>
   140002625:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000262c:	00 00 00 00 
   140002630:	48 89 c1             	mov    rcx,rax
   140002633:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140002637:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   14000263c:	e8 0f 07 00 00       	call   140002d50 <free>
   140002641:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002646:	48 85 c0             	test   rax,rax
   140002649:	75 e5                	jne    140002630 <__mingw_TLScallback+0x80>
   14000264b:	48 8d 0d ce 4a 00 00 	lea    rcx,[rip+0x4ace]        # 140007120 <__mingwthr_cs>
   140002652:	48 c7 05 a3 4a 00 00 	mov    QWORD PTR [rip+0x4aa3],0x0        # 140007100 <key_dtor_list>
   140002659:	00 00 00 00 
   14000265d:	c7 05 a1 4a 00 00 00 	mov    DWORD PTR [rip+0x4aa1],0x0        # 140007108 <__mingwthr_cs_init>
   140002664:	00 00 00 
   140002667:	ff 15 a3 5c 00 00    	call   QWORD PTR [rip+0x5ca3]        # 140008310 <__IAT_start__>
   14000266d:	e9 69 ff ff ff       	jmp    1400025db <__mingw_TLScallback+0x2b>
   140002672:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002678:	e8 43 00 00 00       	call   1400026c0 <_fpreset>
   14000267d:	b8 01 00 00 00       	mov    eax,0x1
   140002682:	48 83 c4 38          	add    rsp,0x38
   140002686:	c3                   	ret
   140002687:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000268e:	00 00 
   140002690:	e8 8b fd ff ff       	call   140002420 <__mingwthr_run_key_dtors.part.0>
   140002695:	e9 74 ff ff ff       	jmp    14000260e <__mingw_TLScallback+0x5e>
   14000269a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400026a0:	48 8d 0d 79 4a 00 00 	lea    rcx,[rip+0x4a79]        # 140007120 <__mingwthr_cs>
   1400026a7:	ff 15 83 5c 00 00    	call   QWORD PTR [rip+0x5c83]        # 140008330 <__imp_InitializeCriticalSection>
   1400026ad:	e9 1f ff ff ff       	jmp    1400025d1 <__mingw_TLScallback+0x21>
   1400026b2:	90                   	nop
   1400026b3:	90                   	nop
   1400026b4:	90                   	nop
   1400026b5:	90                   	nop
   1400026b6:	90                   	nop
   1400026b7:	90                   	nop
   1400026b8:	90                   	nop
   1400026b9:	90                   	nop
   1400026ba:	90                   	nop
   1400026bb:	90                   	nop
   1400026bc:	90                   	nop
   1400026bd:	90                   	nop
   1400026be:	90                   	nop
   1400026bf:	90                   	nop

00000001400026c0 <_fpreset>:
   1400026c0:	db e3                	fninit
   1400026c2:	c3                   	ret
   1400026c3:	90                   	nop
   1400026c4:	90                   	nop
   1400026c5:	90                   	nop
   1400026c6:	90                   	nop
   1400026c7:	90                   	nop
   1400026c8:	90                   	nop
   1400026c9:	90                   	nop
   1400026ca:	90                   	nop
   1400026cb:	90                   	nop
   1400026cc:	90                   	nop
   1400026cd:	90                   	nop
   1400026ce:	90                   	nop
   1400026cf:	90                   	nop

00000001400026d0 <_ValidateImageBase>:
   1400026d0:	31 c0                	xor    eax,eax
   1400026d2:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   1400026d7:	75 0f                	jne    1400026e8 <_ValidateImageBase+0x18>
   1400026d9:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400026dd:	48 01 d1             	add    rcx,rdx
   1400026e0:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400026e6:	74 08                	je     1400026f0 <_ValidateImageBase+0x20>
   1400026e8:	c3                   	ret
   1400026e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400026f0:	31 c0                	xor    eax,eax
   1400026f2:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   1400026f8:	0f 94 c0             	sete   al
   1400026fb:	c3                   	ret
   1400026fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140002700 <_FindPESection>:
   140002700:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   140002704:	48 01 c8             	add    rax,rcx
   140002707:	0f b7 48 06          	movzx  ecx,WORD PTR [rax+0x6]
   14000270b:	66 85 c9             	test   cx,cx
   14000270e:	74 3d                	je     14000274d <_FindPESection+0x4d>
   140002710:	44 0f b7 40 14       	movzx  r8d,WORD PTR [rax+0x14]
   140002715:	83 e9 01             	sub    ecx,0x1
   140002718:	48 8d 0c 89          	lea    rcx,[rcx+rcx*4]
   14000271c:	4a 8d 44 00 18       	lea    rax,[rax+r8*1+0x18]
   140002721:	4c 8d 4c c8 28       	lea    r9,[rax+rcx*8+0x28]
   140002726:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000272d:	00 00 00 
   140002730:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002734:	4c 89 c1             	mov    rcx,r8
   140002737:	4c 39 c2             	cmp    rdx,r8
   14000273a:	72 08                	jb     140002744 <_FindPESection+0x44>
   14000273c:	03 48 08             	add    ecx,DWORD PTR [rax+0x8]
   14000273f:	48 39 ca             	cmp    rdx,rcx
   140002742:	72 0b                	jb     14000274f <_FindPESection+0x4f>
   140002744:	48 83 c0 28          	add    rax,0x28
   140002748:	4c 39 c8             	cmp    rax,r9
   14000274b:	75 e3                	jne    140002730 <_FindPESection+0x30>
   14000274d:	31 c0                	xor    eax,eax
   14000274f:	c3                   	ret

0000000140002750 <_FindPESectionByName>:
   140002750:	55                   	push   rbp
   140002751:	57                   	push   rdi
   140002752:	56                   	push   rsi
   140002753:	53                   	push   rbx
   140002754:	48 83 ec 28          	sub    rsp,0x28
   140002758:	48 89 cf             	mov    rdi,rcx
   14000275b:	e8 e8 04 00 00       	call   140002c48 <strlen>
   140002760:	48 83 f8 08          	cmp    rax,0x8
   140002764:	77 0e                	ja     140002774 <_FindPESectionByName+0x24>
   140002766:	48 8b 05 73 1d 00 00 	mov    rax,QWORD PTR [rip+0x1d73]        # 1400044e0 <.refptr.__ImageBase>
   14000276d:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   140002772:	74 14                	je     140002788 <_FindPESectionByName+0x38>
   140002774:	31 db                	xor    ebx,ebx
   140002776:	48 89 d8             	mov    rax,rbx
   140002779:	48 83 c4 28          	add    rsp,0x28
   14000277d:	5b                   	pop    rbx
   14000277e:	5e                   	pop    rsi
   14000277f:	5f                   	pop    rdi
   140002780:	5d                   	pop    rbp
   140002781:	c3                   	ret
   140002782:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002788:	48 63 68 3c          	movsxd rbp,DWORD PTR [rax+0x3c]
   14000278c:	48 01 c5             	add    rbp,rax
   14000278f:	81 7d 00 50 45 00 00 	cmp    DWORD PTR [rbp+0x0],0x4550
   140002796:	75 dc                	jne    140002774 <_FindPESectionByName+0x24>
   140002798:	66 81 7d 18 0b 02    	cmp    WORD PTR [rbp+0x18],0x20b
   14000279e:	75 d4                	jne    140002774 <_FindPESectionByName+0x24>
   1400027a0:	66 83 7d 06 00       	cmp    WORD PTR [rbp+0x6],0x0
   1400027a5:	74 cd                	je     140002774 <_FindPESectionByName+0x24>
   1400027a7:	0f b7 45 14          	movzx  eax,WORD PTR [rbp+0x14]
   1400027ab:	31 f6                	xor    esi,esi
   1400027ad:	48 8d 5c 05 18       	lea    rbx,[rbp+rax*1+0x18]
   1400027b2:	0f 1f 00             	nop    DWORD PTR [rax]
   1400027b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400027bc:	00 00 00 00 
   1400027c0:	41 b8 08 00 00 00    	mov    r8d,0x8
   1400027c6:	48 89 fa             	mov    rdx,rdi
   1400027c9:	48 89 d9             	mov    rcx,rbx
   1400027cc:	e8 7f 04 00 00       	call   140002c50 <strncmp>
   1400027d1:	85 c0                	test   eax,eax
   1400027d3:	74 a1                	je     140002776 <_FindPESectionByName+0x26>
   1400027d5:	0f b7 45 06          	movzx  eax,WORD PTR [rbp+0x6]
   1400027d9:	83 c6 01             	add    esi,0x1
   1400027dc:	48 83 c3 28          	add    rbx,0x28
   1400027e0:	39 c6                	cmp    esi,eax
   1400027e2:	72 dc                	jb     1400027c0 <_FindPESectionByName+0x70>
   1400027e4:	eb 8e                	jmp    140002774 <_FindPESectionByName+0x24>
   1400027e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400027ed:	00 00 00 

00000001400027f0 <__mingw_GetSectionForAddress>:
   1400027f0:	48 8b 15 e9 1c 00 00 	mov    rdx,QWORD PTR [rip+0x1ce9]        # 1400044e0 <.refptr.__ImageBase>
   1400027f7:	31 c0                	xor    eax,eax
   1400027f9:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   1400027fe:	75 10                	jne    140002810 <__mingw_GetSectionForAddress+0x20>
   140002800:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   140002804:	49 01 d0             	add    r8,rdx
   140002807:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   14000280e:	74 08                	je     140002818 <__mingw_GetSectionForAddress+0x28>
   140002810:	c3                   	ret
   140002811:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002818:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   14000281f:	75 ef                	jne    140002810 <__mingw_GetSectionForAddress+0x20>
   140002821:	45 0f b7 48 06       	movzx  r9d,WORD PTR [r8+0x6]
   140002826:	66 45 85 c9          	test   r9w,r9w
   14000282a:	74 e4                	je     140002810 <__mingw_GetSectionForAddress+0x20>
   14000282c:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   140002831:	48 29 d1             	sub    rcx,rdx
   140002834:	41 8d 51 ff          	lea    edx,[r9-0x1]
   140002838:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   14000283c:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   140002841:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002846:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000284d:	00 00 00 
   140002850:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002854:	4c 89 c2             	mov    rdx,r8
   140002857:	4c 39 c1             	cmp    rcx,r8
   14000285a:	72 08                	jb     140002864 <__mingw_GetSectionForAddress+0x74>
   14000285c:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   14000285f:	48 39 d1             	cmp    rcx,rdx
   140002862:	72 ac                	jb     140002810 <__mingw_GetSectionForAddress+0x20>
   140002864:	48 83 c0 28          	add    rax,0x28
   140002868:	4c 39 c8             	cmp    rax,r9
   14000286b:	75 e3                	jne    140002850 <__mingw_GetSectionForAddress+0x60>
   14000286d:	31 c0                	xor    eax,eax
   14000286f:	c3                   	ret

0000000140002870 <__mingw_GetSectionCount>:
   140002870:	48 8b 05 69 1c 00 00 	mov    rax,QWORD PTR [rip+0x1c69]        # 1400044e0 <.refptr.__ImageBase>
   140002877:	31 c9                	xor    ecx,ecx
   140002879:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000287e:	75 0f                	jne    14000288f <__mingw_GetSectionCount+0x1f>
   140002880:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002884:	48 01 d0             	add    rax,rdx
   140002887:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   14000288d:	74 09                	je     140002898 <__mingw_GetSectionCount+0x28>
   14000288f:	89 c8                	mov    eax,ecx
   140002891:	c3                   	ret
   140002892:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002898:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000289e:	75 ef                	jne    14000288f <__mingw_GetSectionCount+0x1f>
   1400028a0:	0f b7 48 06          	movzx  ecx,WORD PTR [rax+0x6]
   1400028a4:	89 c8                	mov    eax,ecx
   1400028a6:	c3                   	ret
   1400028a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400028ae:	00 00 

00000001400028b0 <_FindPESectionExec>:
   1400028b0:	4c 8b 05 29 1c 00 00 	mov    r8,QWORD PTR [rip+0x1c29]        # 1400044e0 <.refptr.__ImageBase>
   1400028b7:	31 c0                	xor    eax,eax
   1400028b9:	66 41 81 38 4d 5a    	cmp    WORD PTR [r8],0x5a4d
   1400028bf:	75 0f                	jne    1400028d0 <_FindPESectionExec+0x20>
   1400028c1:	49 63 50 3c          	movsxd rdx,DWORD PTR [r8+0x3c]
   1400028c5:	4c 01 c2             	add    rdx,r8
   1400028c8:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   1400028ce:	74 08                	je     1400028d8 <_FindPESectionExec+0x28>
   1400028d0:	c3                   	ret
   1400028d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400028d8:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   1400028de:	75 f0                	jne    1400028d0 <_FindPESectionExec+0x20>
   1400028e0:	44 0f b7 42 06       	movzx  r8d,WORD PTR [rdx+0x6]
   1400028e5:	66 45 85 c0          	test   r8w,r8w
   1400028e9:	74 e5                	je     1400028d0 <_FindPESectionExec+0x20>
   1400028eb:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   1400028ef:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   1400028f4:	41 8d 50 ff          	lea    edx,[r8-0x1]
   1400028f8:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400028fc:	48 8d 54 d0 28       	lea    rdx,[rax+rdx*8+0x28]
   140002901:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002905:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000290c:	00 00 00 00 
   140002910:	f6 40 27 20          	test   BYTE PTR [rax+0x27],0x20
   140002914:	74 09                	je     14000291f <_FindPESectionExec+0x6f>
   140002916:	48 85 c9             	test   rcx,rcx
   140002919:	74 b5                	je     1400028d0 <_FindPESectionExec+0x20>
   14000291b:	48 83 e9 01          	sub    rcx,0x1
   14000291f:	48 83 c0 28          	add    rax,0x28
   140002923:	48 39 c2             	cmp    rdx,rax
   140002926:	75 e8                	jne    140002910 <_FindPESectionExec+0x60>
   140002928:	31 c0                	xor    eax,eax
   14000292a:	c3                   	ret
   14000292b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000140002930 <_GetPEImageBase>:
   140002930:	48 8b 05 a9 1b 00 00 	mov    rax,QWORD PTR [rip+0x1ba9]        # 1400044e0 <.refptr.__ImageBase>
   140002937:	31 d2                	xor    edx,edx
   140002939:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000293e:	75 0f                	jne    14000294f <_GetPEImageBase+0x1f>
   140002940:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   140002944:	48 01 c1             	add    rcx,rax
   140002947:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   14000294d:	74 09                	je     140002958 <_GetPEImageBase+0x28>
   14000294f:	48 89 d0             	mov    rax,rdx
   140002952:	c3                   	ret
   140002953:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002958:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   14000295e:	48 0f 44 d0          	cmove  rdx,rax
   140002962:	48 89 d0             	mov    rax,rdx
   140002965:	c3                   	ret
   140002966:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000296d:	00 00 00 

0000000140002970 <_IsNonwritableInCurrentImage>:
   140002970:	48 8b 15 69 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b69]        # 1400044e0 <.refptr.__ImageBase>
   140002977:	31 c0                	xor    eax,eax
   140002979:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   14000297e:	75 10                	jne    140002990 <_IsNonwritableInCurrentImage+0x20>
   140002980:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   140002984:	49 01 d0             	add    r8,rdx
   140002987:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   14000298e:	74 08                	je     140002998 <_IsNonwritableInCurrentImage+0x28>
   140002990:	c3                   	ret
   140002991:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002998:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   14000299f:	75 ef                	jne    140002990 <_IsNonwritableInCurrentImage+0x20>
   1400029a1:	45 0f b7 48 06       	movzx  r9d,WORD PTR [r8+0x6]
   1400029a6:	66 45 85 c9          	test   r9w,r9w
   1400029aa:	74 e4                	je     140002990 <_IsNonwritableInCurrentImage+0x20>
   1400029ac:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   1400029b1:	48 29 d1             	sub    rcx,rdx
   1400029b4:	41 8d 51 ff          	lea    edx,[r9-0x1]
   1400029b8:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400029bc:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   1400029c1:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   1400029c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400029cd:	00 00 00 
   1400029d0:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   1400029d4:	4c 89 c2             	mov    rdx,r8
   1400029d7:	4c 39 c1             	cmp    rcx,r8
   1400029da:	72 08                	jb     1400029e4 <_IsNonwritableInCurrentImage+0x74>
   1400029dc:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   1400029df:	48 39 d1             	cmp    rcx,rdx
   1400029e2:	72 0c                	jb     1400029f0 <_IsNonwritableInCurrentImage+0x80>
   1400029e4:	48 83 c0 28          	add    rax,0x28
   1400029e8:	49 39 c1             	cmp    r9,rax
   1400029eb:	75 e3                	jne    1400029d0 <_IsNonwritableInCurrentImage+0x60>
   1400029ed:	31 c0                	xor    eax,eax
   1400029ef:	c3                   	ret
   1400029f0:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   1400029f3:	f7 d0                	not    eax
   1400029f5:	c1 e8 1f             	shr    eax,0x1f
   1400029f8:	c3                   	ret
   1400029f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000140002a00 <__mingw_enum_import_library_names>:
   140002a00:	4c 8b 1d d9 1a 00 00 	mov    r11,QWORD PTR [rip+0x1ad9]        # 1400044e0 <.refptr.__ImageBase>
   140002a07:	45 31 c0             	xor    r8d,r8d
   140002a0a:	66 41 81 3b 4d 5a    	cmp    WORD PTR [r11],0x5a4d
   140002a10:	75 0f                	jne    140002a21 <__mingw_enum_import_library_names+0x21>
   140002a12:	49 63 53 3c          	movsxd rdx,DWORD PTR [r11+0x3c]
   140002a16:	4c 01 da             	add    rdx,r11
   140002a19:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   140002a1f:	74 07                	je     140002a28 <__mingw_enum_import_library_names+0x28>
   140002a21:	4c 89 c0             	mov    rax,r8
   140002a24:	c3                   	ret
   140002a25:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a28:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   140002a2e:	75 f1                	jne    140002a21 <__mingw_enum_import_library_names+0x21>
   140002a30:	8b 82 90 00 00 00    	mov    eax,DWORD PTR [rdx+0x90]
   140002a36:	85 c0                	test   eax,eax
   140002a38:	74 e7                	je     140002a21 <__mingw_enum_import_library_names+0x21>
   140002a3a:	44 0f b7 4a 06       	movzx  r9d,WORD PTR [rdx+0x6]
   140002a3f:	66 45 85 c9          	test   r9w,r9w
   140002a43:	74 dc                	je     140002a21 <__mingw_enum_import_library_names+0x21>
   140002a45:	44 0f b7 42 14       	movzx  r8d,WORD PTR [rdx+0x14]
   140002a4a:	4a 8d 54 02 18       	lea    rdx,[rdx+r8*1+0x18]
   140002a4f:	45 8d 41 ff          	lea    r8d,[r9-0x1]
   140002a53:	4f 8d 04 80          	lea    r8,[r8+r8*4]
   140002a57:	4e 8d 54 c2 28       	lea    r10,[rdx+r8*8+0x28]
   140002a5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002a60:	44 8b 4a 0c          	mov    r9d,DWORD PTR [rdx+0xc]
   140002a64:	4d 89 c8             	mov    r8,r9
   140002a67:	4c 39 c8             	cmp    rax,r9
   140002a6a:	72 09                	jb     140002a75 <__mingw_enum_import_library_names+0x75>
   140002a6c:	44 03 42 08          	add    r8d,DWORD PTR [rdx+0x8]
   140002a70:	4c 39 c0             	cmp    rax,r8
   140002a73:	72 13                	jb     140002a88 <__mingw_enum_import_library_names+0x88>
   140002a75:	48 83 c2 28          	add    rdx,0x28
   140002a79:	49 39 d2             	cmp    r10,rdx
   140002a7c:	75 e2                	jne    140002a60 <__mingw_enum_import_library_names+0x60>
   140002a7e:	45 31 c0             	xor    r8d,r8d
   140002a81:	4c 89 c0             	mov    rax,r8
   140002a84:	c3                   	ret
   140002a85:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a88:	4c 01 d8             	add    rax,r11
   140002a8b:	eb 0a                	jmp    140002a97 <__mingw_enum_import_library_names+0x97>
   140002a8d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a90:	83 e9 01             	sub    ecx,0x1
   140002a93:	48 83 c0 14          	add    rax,0x14
   140002a97:	44 8b 40 04          	mov    r8d,DWORD PTR [rax+0x4]
   140002a9b:	45 85 c0             	test   r8d,r8d
   140002a9e:	75 07                	jne    140002aa7 <__mingw_enum_import_library_names+0xa7>
   140002aa0:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140002aa3:	85 d2                	test   edx,edx
   140002aa5:	74 d7                	je     140002a7e <__mingw_enum_import_library_names+0x7e>
   140002aa7:	85 c9                	test   ecx,ecx
   140002aa9:	7f e5                	jg     140002a90 <__mingw_enum_import_library_names+0x90>
   140002aab:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002aaf:	4d 01 d8             	add    r8,r11
   140002ab2:	4c 89 c0             	mov    rax,r8
   140002ab5:	c3                   	ret
   140002ab6:	90                   	nop
   140002ab7:	90                   	nop
   140002ab8:	90                   	nop
   140002ab9:	90                   	nop
   140002aba:	90                   	nop
   140002abb:	90                   	nop
   140002abc:	90                   	nop
   140002abd:	90                   	nop
   140002abe:	90                   	nop
   140002abf:	90                   	nop

0000000140002ac0 <___chkstk_ms>:
   140002ac0:	51                   	push   rcx
   140002ac1:	50                   	push   rax
   140002ac2:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002ac8:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   140002acd:	72 19                	jb     140002ae8 <___chkstk_ms+0x28>
   140002acf:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   140002ad6:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002ada:	48 2d 00 10 00 00    	sub    rax,0x1000
   140002ae0:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002ae6:	77 e7                	ja     140002acf <___chkstk_ms+0xf>
   140002ae8:	48 29 c1             	sub    rcx,rax
   140002aeb:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002aef:	58                   	pop    rax
   140002af0:	59                   	pop    rcx
   140002af1:	c3                   	ret
   140002af2:	90                   	nop
   140002af3:	90                   	nop
   140002af4:	90                   	nop
   140002af5:	90                   	nop
   140002af6:	90                   	nop
   140002af7:	90                   	nop
   140002af8:	90                   	nop
   140002af9:	90                   	nop
   140002afa:	90                   	nop
   140002afb:	90                   	nop
   140002afc:	90                   	nop
   140002afd:	90                   	nop
   140002afe:	90                   	nop
   140002aff:	90                   	nop

0000000140002b00 <vfprintf>:
   140002b00:	57                   	push   rdi
   140002b01:	56                   	push   rsi
   140002b02:	53                   	push   rbx
   140002b03:	48 83 ec 30          	sub    rsp,0x30
   140002b07:	48 89 cb             	mov    rbx,rcx
   140002b0a:	48 89 d6             	mov    rsi,rdx
   140002b0d:	4c 89 c7             	mov    rdi,r8
   140002b10:	e8 7b 00 00 00       	call   140002b90 <__local_stdio_printf_options>
   140002b15:	45 31 c9             	xor    r9d,r9d
   140002b18:	49 89 f0             	mov    r8,rsi
   140002b1b:	48 89 da             	mov    rdx,rbx
   140002b1e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140002b21:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140002b26:	e8 4d 01 00 00       	call   140002c78 <__stdio_common_vfprintf>
   140002b2b:	48 83 c4 30          	add    rsp,0x30
   140002b2f:	5b                   	pop    rbx
   140002b30:	5e                   	pop    rsi
   140002b31:	5f                   	pop    rdi
   140002b32:	c3                   	ret
   140002b33:	90                   	nop
   140002b34:	90                   	nop
   140002b35:	90                   	nop
   140002b36:	90                   	nop
   140002b37:	90                   	nop
   140002b38:	90                   	nop
   140002b39:	90                   	nop
   140002b3a:	90                   	nop
   140002b3b:	90                   	nop
   140002b3c:	90                   	nop
   140002b3d:	90                   	nop
   140002b3e:	90                   	nop
   140002b3f:	90                   	nop

0000000140002b40 <fprintf>:
   140002b40:	57                   	push   rdi
   140002b41:	56                   	push   rsi
   140002b42:	53                   	push   rbx
   140002b43:	48 83 ec 40          	sub    rsp,0x40
   140002b47:	48 8d 7c 24 70       	lea    rdi,[rsp+0x70]
   140002b4c:	48 89 cb             	mov    rbx,rcx
   140002b4f:	48 89 d6             	mov    rsi,rdx
   140002b52:	4c 89 44 24 70       	mov    QWORD PTR [rsp+0x70],r8
   140002b57:	4c 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],r9
   140002b5c:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140002b61:	e8 2a 00 00 00       	call   140002b90 <__local_stdio_printf_options>
   140002b66:	45 31 c9             	xor    r9d,r9d
   140002b69:	49 89 f0             	mov    r8,rsi
   140002b6c:	48 89 da             	mov    rdx,rbx
   140002b6f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140002b72:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140002b77:	e8 fc 00 00 00       	call   140002c78 <__stdio_common_vfprintf>
   140002b7c:	48 83 c4 40          	add    rsp,0x40
   140002b80:	5b                   	pop    rbx
   140002b81:	5e                   	pop    rsi
   140002b82:	5f                   	pop    rdi
   140002b83:	c3                   	ret
   140002b84:	90                   	nop
   140002b85:	90                   	nop
   140002b86:	90                   	nop
   140002b87:	90                   	nop
   140002b88:	90                   	nop
   140002b89:	90                   	nop
   140002b8a:	90                   	nop
   140002b8b:	90                   	nop
   140002b8c:	90                   	nop
   140002b8d:	90                   	nop
   140002b8e:	90                   	nop
   140002b8f:	90                   	nop

0000000140002b90 <__local_stdio_printf_options>:
   140002b90:	48 8d 05 c9 04 00 00 	lea    rax,[rip+0x4c9]        # 140003060 <options>
   140002b97:	c3                   	ret
   140002b98:	90                   	nop
   140002b99:	90                   	nop
   140002b9a:	90                   	nop
   140002b9b:	90                   	nop
   140002b9c:	90                   	nop
   140002b9d:	90                   	nop
   140002b9e:	90                   	nop
   140002b9f:	90                   	nop

0000000140002ba0 <__p___initenv>:
   140002ba0:	48 8b 05 89 19 00 00 	mov    rax,QWORD PTR [rip+0x1989]        # 140004530 <.refptr.__imp___initenv>
   140002ba7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002baa:	c3                   	ret
   140002bab:	90                   	nop
   140002bac:	90                   	nop
   140002bad:	90                   	nop
   140002bae:	90                   	nop
   140002baf:	90                   	nop

0000000140002bb0 <_amsg_exit>:
   140002bb0:	53                   	push   rbx
   140002bb1:	48 83 ec 20          	sub    rsp,0x20
   140002bb5:	89 cb                	mov    ebx,ecx
   140002bb7:	b9 02 00 00 00       	mov    ecx,0x2
   140002bbc:	e8 9f 00 00 00       	call   140002c60 <__acrt_iob_func>
   140002bc1:	41 89 d8             	mov    r8d,ebx
   140002bc4:	48 8d 15 c5 18 00 00 	lea    rdx,[rip+0x18c5]        # 140004490 <.rdata>
   140002bcb:	48 89 c1             	mov    rcx,rax
   140002bce:	e8 6d ff ff ff       	call   140002b40 <fprintf>
   140002bd3:	b9 ff 00 00 00       	mov    ecx,0xff
   140002bd8:	e8 d3 00 00 00       	call   140002cb0 <_exit>
   140002bdd:	90                   	nop
   140002bde:	90                   	nop
   140002bdf:	90                   	nop

0000000140002be0 <__getmainargs>:
   140002be0:	55                   	push   rbp
   140002be1:	57                   	push   rdi
   140002be2:	56                   	push   rsi
   140002be3:	53                   	push   rbx
   140002be4:	48 83 ec 28          	sub    rsp,0x28
   140002be8:	44 89 cd             	mov    ebp,r9d
   140002beb:	48 89 d6             	mov    rsi,rdx
   140002bee:	4c 89 c3             	mov    rbx,r8
   140002bf1:	48 89 cf             	mov    rdi,rcx
   140002bf4:	e8 bf 00 00 00       	call   140002cb8 <_initialize_narrow_environment>
   140002bf9:	83 fd 01             	cmp    ebp,0x1
   140002bfc:	b9 01 00 00 00       	mov    ecx,0x1
   140002c01:	83 d9 ff             	sbb    ecx,0xffffffff
   140002c04:	e8 97 00 00 00       	call   140002ca0 <_configure_narrow_argv>
   140002c09:	e8 72 00 00 00       	call   140002c80 <__p___argc>
   140002c0e:	8b 00                	mov    eax,DWORD PTR [rax]
   140002c10:	89 07                	mov    DWORD PTR [rdi],eax
   140002c12:	e8 71 00 00 00       	call   140002c88 <__p___argv>
   140002c17:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002c1a:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002c1d:	e8 3e 01 00 00       	call   140002d60 <__p__environ>
   140002c22:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002c25:	48 89 03             	mov    QWORD PTR [rbx],rax
   140002c28:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140002c2d:	8b 08                	mov    ecx,DWORD PTR [rax]
   140002c2f:	e8 0c 01 00 00       	call   140002d40 <_set_new_mode>
   140002c34:	31 c0                	xor    eax,eax
   140002c36:	48 83 c4 28          	add    rsp,0x28
   140002c3a:	5b                   	pop    rbx
   140002c3b:	5e                   	pop    rsi
   140002c3c:	5f                   	pop    rdi
   140002c3d:	5d                   	pop    rbp
   140002c3e:	c3                   	ret
   140002c3f:	90                   	nop

0000000140002c40 <strcmp>:
   140002c40:	ff 25 52 58 00 00    	jmp    QWORD PTR [rip+0x5852]        # 140008498 <__imp_strcmp>
   140002c46:	90                   	nop
   140002c47:	90                   	nop

0000000140002c48 <strlen>:
   140002c48:	ff 25 52 58 00 00    	jmp    QWORD PTR [rip+0x5852]        # 1400084a0 <__imp_strlen>
   140002c4e:	90                   	nop
   140002c4f:	90                   	nop

0000000140002c50 <strncmp>:
   140002c50:	ff 25 52 58 00 00    	jmp    QWORD PTR [rip+0x5852]        # 1400084a8 <__imp_strncmp>
   140002c56:	90                   	nop
   140002c57:	90                   	nop
   140002c58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002c5f:	00 

0000000140002c60 <__acrt_iob_func>:
   140002c60:	ff 25 0a 58 00 00    	jmp    QWORD PTR [rip+0x580a]        # 140008470 <__imp___acrt_iob_func>
   140002c66:	90                   	nop
   140002c67:	90                   	nop

0000000140002c68 <__p__commode>:
   140002c68:	ff 25 0a 58 00 00    	jmp    QWORD PTR [rip+0x580a]        # 140008478 <__imp___p__commode>
   140002c6e:	90                   	nop
   140002c6f:	90                   	nop

0000000140002c70 <__p__fmode>:
   140002c70:	ff 25 0a 58 00 00    	jmp    QWORD PTR [rip+0x580a]        # 140008480 <__imp___p__fmode>
   140002c76:	90                   	nop
   140002c77:	90                   	nop

0000000140002c78 <__stdio_common_vfprintf>:
   140002c78:	ff 25 0a 58 00 00    	jmp    QWORD PTR [rip+0x580a]        # 140008488 <__imp___stdio_common_vfprintf>
   140002c7e:	90                   	nop
   140002c7f:	90                   	nop

0000000140002c80 <__p___argc>:
   140002c80:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 1400083f0 <__imp___p___argc>
   140002c86:	90                   	nop
   140002c87:	90                   	nop

0000000140002c88 <__p___argv>:
   140002c88:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 1400083f8 <__imp___p___argv>
   140002c8e:	90                   	nop
   140002c8f:	90                   	nop

0000000140002c90 <__p__acmdln>:
   140002c90:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008400 <__imp___p__acmdln>
   140002c96:	90                   	nop
   140002c97:	90                   	nop

0000000140002c98 <_cexit>:
   140002c98:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008408 <__imp__cexit>
   140002c9e:	90                   	nop
   140002c9f:	90                   	nop

0000000140002ca0 <_configure_narrow_argv>:
   140002ca0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008410 <__imp__configure_narrow_argv>
   140002ca6:	90                   	nop
   140002ca7:	90                   	nop

0000000140002ca8 <_crt_atexit>:
   140002ca8:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008418 <__imp__crt_atexit>
   140002cae:	90                   	nop
   140002caf:	90                   	nop

0000000140002cb0 <_exit>:
   140002cb0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008420 <__imp__exit>
   140002cb6:	90                   	nop
   140002cb7:	90                   	nop

0000000140002cb8 <_initialize_narrow_environment>:
   140002cb8:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008428 <__imp__initialize_narrow_environment>
   140002cbe:	90                   	nop
   140002cbf:	90                   	nop

0000000140002cc0 <__set_app_type>:
   140002cc0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008430 <__imp___set_app_type>
   140002cc6:	90                   	nop
   140002cc7:	90                   	nop

0000000140002cc8 <_initterm>:
   140002cc8:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008438 <__imp__initterm>
   140002cce:	90                   	nop
   140002ccf:	90                   	nop

0000000140002cd0 <_initterm_e>:
   140002cd0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008440 <__imp__initterm_e>
   140002cd6:	90                   	nop
   140002cd7:	90                   	nop

0000000140002cd8 <_set_invalid_parameter_handler>:
   140002cd8:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008448 <__imp__set_invalid_parameter_handler>
   140002cde:	90                   	nop
   140002cdf:	90                   	nop

0000000140002ce0 <abort>:
   140002ce0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008450 <__imp_abort>
   140002ce6:	90                   	nop
   140002ce7:	90                   	nop

0000000140002ce8 <exit>:
   140002ce8:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008458 <__imp_exit>
   140002cee:	90                   	nop
   140002cef:	90                   	nop

0000000140002cf0 <signal>:
   140002cf0:	ff 25 6a 57 00 00    	jmp    QWORD PTR [rip+0x576a]        # 140008460 <__imp_signal>
   140002cf6:	90                   	nop
   140002cf7:	90                   	nop
   140002cf8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002cff:	00 

0000000140002d00 <__C_specific_handler>:
   140002d00:	ff 25 d2 56 00 00    	jmp    QWORD PTR [rip+0x56d2]        # 1400083d8 <__imp___C_specific_handler>
   140002d06:	90                   	nop
   140002d07:	90                   	nop

0000000140002d08 <memcpy>:
   140002d08:	ff 25 d2 56 00 00    	jmp    QWORD PTR [rip+0x56d2]        # 1400083e0 <__imp_memcpy>
   140002d0e:	90                   	nop
   140002d0f:	90                   	nop

0000000140002d10 <_ismbblead>:
   140002d10:	ff 25 b2 56 00 00    	jmp    QWORD PTR [rip+0x56b2]        # 1400083c8 <__imp__ismbblead>
   140002d16:	90                   	nop
   140002d17:	90                   	nop
   140002d18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002d1f:	00 

0000000140002d20 <__setusermatherr>:
   140002d20:	ff 25 92 56 00 00    	jmp    QWORD PTR [rip+0x5692]        # 1400083b8 <__imp___setusermatherr>
   140002d26:	90                   	nop
   140002d27:	90                   	nop
   140002d28:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002d2f:	00 

0000000140002d30 <_configthreadlocale>:
   140002d30:	ff 25 72 56 00 00    	jmp    QWORD PTR [rip+0x5672]        # 1400083a8 <__imp__configthreadlocale>
   140002d36:	90                   	nop
   140002d37:	90                   	nop
   140002d38:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002d3f:	00 

0000000140002d40 <_set_new_mode>:
   140002d40:	ff 25 3a 56 00 00    	jmp    QWORD PTR [rip+0x563a]        # 140008380 <__imp__set_new_mode>
   140002d46:	90                   	nop
   140002d47:	90                   	nop

0000000140002d48 <calloc>:
   140002d48:	ff 25 3a 56 00 00    	jmp    QWORD PTR [rip+0x563a]        # 140008388 <__imp_calloc>
   140002d4e:	90                   	nop
   140002d4f:	90                   	nop

0000000140002d50 <free>:
   140002d50:	ff 25 3a 56 00 00    	jmp    QWORD PTR [rip+0x563a]        # 140008390 <__imp_free>
   140002d56:	90                   	nop
   140002d57:	90                   	nop

0000000140002d58 <malloc>:
   140002d58:	ff 25 3a 56 00 00    	jmp    QWORD PTR [rip+0x563a]        # 140008398 <__imp_malloc>
   140002d5e:	90                   	nop
   140002d5f:	90                   	nop

0000000140002d60 <__p__environ>:
   140002d60:	ff 25 0a 56 00 00    	jmp    QWORD PTR [rip+0x560a]        # 140008370 <__imp___p__environ>
   140002d66:	90                   	nop
   140002d67:	90                   	nop
   140002d68:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002d6f:	00 

0000000140002d70 <VirtualQuery>:
   140002d70:	ff 25 ea 55 00 00    	jmp    QWORD PTR [rip+0x55ea]        # 140008360 <__imp_VirtualQuery>
   140002d76:	90                   	nop
   140002d77:	90                   	nop

0000000140002d78 <VirtualProtect>:
   140002d78:	ff 25 da 55 00 00    	jmp    QWORD PTR [rip+0x55da]        # 140008358 <__imp_VirtualProtect>
   140002d7e:	90                   	nop
   140002d7f:	90                   	nop

0000000140002d80 <TlsGetValue>:
   140002d80:	ff 25 ca 55 00 00    	jmp    QWORD PTR [rip+0x55ca]        # 140008350 <__imp_TlsGetValue>
   140002d86:	90                   	nop
   140002d87:	90                   	nop

0000000140002d88 <Sleep>:
   140002d88:	ff 25 ba 55 00 00    	jmp    QWORD PTR [rip+0x55ba]        # 140008348 <__imp_Sleep>
   140002d8e:	90                   	nop
   140002d8f:	90                   	nop

0000000140002d90 <SetUnhandledExceptionFilter>:
   140002d90:	ff 25 aa 55 00 00    	jmp    QWORD PTR [rip+0x55aa]        # 140008340 <__imp_SetUnhandledExceptionFilter>
   140002d96:	90                   	nop
   140002d97:	90                   	nop

0000000140002d98 <LeaveCriticalSection>:
   140002d98:	ff 25 9a 55 00 00    	jmp    QWORD PTR [rip+0x559a]        # 140008338 <__imp_LeaveCriticalSection>
   140002d9e:	90                   	nop
   140002d9f:	90                   	nop

0000000140002da0 <InitializeCriticalSection>:
   140002da0:	ff 25 8a 55 00 00    	jmp    QWORD PTR [rip+0x558a]        # 140008330 <__imp_InitializeCriticalSection>
   140002da6:	90                   	nop
   140002da7:	90                   	nop

0000000140002da8 <GetStartupInfoA>:
   140002da8:	ff 25 7a 55 00 00    	jmp    QWORD PTR [rip+0x557a]        # 140008328 <__imp_GetStartupInfoA>
   140002dae:	90                   	nop
   140002daf:	90                   	nop

0000000140002db0 <GetLastError>:
   140002db0:	ff 25 6a 55 00 00    	jmp    QWORD PTR [rip+0x556a]        # 140008320 <__imp_GetLastError>
   140002db6:	90                   	nop
   140002db7:	90                   	nop

0000000140002db8 <EnterCriticalSection>:
   140002db8:	ff 25 5a 55 00 00    	jmp    QWORD PTR [rip+0x555a]        # 140008318 <__imp_EnterCriticalSection>
   140002dbe:	90                   	nop
   140002dbf:	90                   	nop

0000000140002dc0 <DeleteCriticalSection>:
   140002dc0:	ff 25 4a 55 00 00    	jmp    QWORD PTR [rip+0x554a]        # 140008310 <__IAT_start__>
   140002dc6:	90                   	nop
   140002dc7:	90                   	nop
   140002dc8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002dcf:	00 

0000000140002dd0 <UpdateWindow>:
   140002dd0:	ff 25 4a 57 00 00    	jmp    QWORD PTR [rip+0x574a]        # 140008520 <__imp_UpdateWindow>
   140002dd6:	90                   	nop
   140002dd7:	90                   	nop

0000000140002dd8 <TranslateMessage>:
   140002dd8:	ff 25 3a 57 00 00    	jmp    QWORD PTR [rip+0x573a]        # 140008518 <__imp_TranslateMessage>
   140002dde:	90                   	nop
   140002ddf:	90                   	nop

0000000140002de0 <ShowWindow>:
   140002de0:	ff 25 2a 57 00 00    	jmp    QWORD PTR [rip+0x572a]        # 140008510 <__imp_ShowWindow>
   140002de6:	90                   	nop
   140002de7:	90                   	nop

0000000140002de8 <SetWindowTextA>:
   140002de8:	ff 25 1a 57 00 00    	jmp    QWORD PTR [rip+0x571a]        # 140008508 <__imp_SetWindowTextA>
   140002dee:	90                   	nop
   140002def:	90                   	nop

0000000140002df0 <RegisterClassExA>:
   140002df0:	ff 25 0a 57 00 00    	jmp    QWORD PTR [rip+0x570a]        # 140008500 <__imp_RegisterClassExA>
   140002df6:	90                   	nop
   140002df7:	90                   	nop

0000000140002df8 <PostQuitMessage>:
   140002df8:	ff 25 fa 56 00 00    	jmp    QWORD PTR [rip+0x56fa]        # 1400084f8 <__imp_PostQuitMessage>
   140002dfe:	90                   	nop
   140002dff:	90                   	nop

0000000140002e00 <MessageBoxA>:
   140002e00:	ff 25 ea 56 00 00    	jmp    QWORD PTR [rip+0x56ea]        # 1400084f0 <__imp_MessageBoxA>
   140002e06:	90                   	nop
   140002e07:	90                   	nop

0000000140002e08 <LoadCursorA>:
   140002e08:	ff 25 da 56 00 00    	jmp    QWORD PTR [rip+0x56da]        # 1400084e8 <__imp_LoadCursorA>
   140002e0e:	90                   	nop
   140002e0f:	90                   	nop

0000000140002e10 <GetWindowTextA>:
   140002e10:	ff 25 ca 56 00 00    	jmp    QWORD PTR [rip+0x56ca]        # 1400084e0 <__imp_GetWindowTextA>
   140002e16:	90                   	nop
   140002e17:	90                   	nop

0000000140002e18 <GetMessageA>:
   140002e18:	ff 25 ba 56 00 00    	jmp    QWORD PTR [rip+0x56ba]        # 1400084d8 <__imp_GetMessageA>
   140002e1e:	90                   	nop
   140002e1f:	90                   	nop

0000000140002e20 <DispatchMessageA>:
   140002e20:	ff 25 aa 56 00 00    	jmp    QWORD PTR [rip+0x56aa]        # 1400084d0 <__imp_DispatchMessageA>
   140002e26:	90                   	nop
   140002e27:	90                   	nop

0000000140002e28 <DestroyWindow>:
   140002e28:	ff 25 9a 56 00 00    	jmp    QWORD PTR [rip+0x569a]        # 1400084c8 <__imp_DestroyWindow>
   140002e2e:	90                   	nop
   140002e2f:	90                   	nop

0000000140002e30 <DefWindowProcA>:
   140002e30:	ff 25 8a 56 00 00    	jmp    QWORD PTR [rip+0x568a]        # 1400084c0 <__imp_DefWindowProcA>
   140002e36:	90                   	nop
   140002e37:	90                   	nop

0000000140002e38 <CreateWindowExA>:
   140002e38:	ff 25 7a 56 00 00    	jmp    QWORD PTR [rip+0x567a]        # 1400084b8 <__imp_CreateWindowExA>
   140002e3e:	90                   	nop
   140002e3f:	90                   	nop

0000000140002e40 <main>:
   140002e40:	56                   	push   rsi
   140002e41:	53                   	push   rbx
   140002e42:	48 81 ec 98 00 00 00 	sub    rsp,0x98
   140002e49:	31 f6                	xor    esi,esi
   140002e4b:	e8 70 ec ff ff       	call   140001ac0 <__main>
   140002e50:	e8 3b fe ff ff       	call   140002c90 <__p__acmdln>
   140002e55:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140002e58:	48 85 db             	test   rbx,rbx
   140002e5b:	75 2e                	jne    140002e8b <main+0x4b>
   140002e5d:	e9 97 00 00 00       	jmp    140002ef9 <main+0xb9>
   140002e62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002e68:	84 c9                	test   cl,cl
   140002e6a:	74 54                	je     140002ec0 <main+0x80>
   140002e6c:	83 e6 01             	and    esi,0x1
   140002e6f:	74 2f                	je     140002ea0 <main+0x60>
   140002e71:	be 01 00 00 00       	mov    esi,0x1
   140002e76:	e8 95 fe ff ff       	call   140002d10 <_ismbblead>
   140002e7b:	85 c0                	test   eax,eax
   140002e7d:	74 08                	je     140002e87 <main+0x47>
   140002e7f:	80 7b 01 01          	cmp    BYTE PTR [rbx+0x1],0x1
   140002e83:	48 83 db ff          	sbb    rbx,0xffffffffffffffff
   140002e87:	48 83 c3 01          	add    rbx,0x1
   140002e8b:	0f be 0b             	movsx  ecx,BYTE PTR [rbx]
   140002e8e:	80 f9 20             	cmp    cl,0x20
   140002e91:	7e d5                	jle    140002e68 <main+0x28>
   140002e93:	89 f0                	mov    eax,esi
   140002e95:	83 f0 01             	xor    eax,0x1
   140002e98:	80 f9 22             	cmp    cl,0x22
   140002e9b:	0f 44 f0             	cmove  esi,eax
   140002e9e:	eb d6                	jmp    140002e76 <main+0x36>
   140002ea0:	84 c9                	test   cl,cl
   140002ea2:	74 1c                	je     140002ec0 <main+0x80>
   140002ea4:	90                   	nop
   140002ea5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002eac:	00 00 00 00 
   140002eb0:	0f b6 43 01          	movzx  eax,BYTE PTR [rbx+0x1]
   140002eb4:	48 83 c3 01          	add    rbx,0x1
   140002eb8:	84 c0                	test   al,al
   140002eba:	74 04                	je     140002ec0 <main+0x80>
   140002ebc:	3c 20                	cmp    al,0x20
   140002ebe:	7e f0                	jle    140002eb0 <main+0x70>
   140002ec0:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140002ec5:	ff 15 5d 54 00 00    	call   QWORD PTR [rip+0x545d]        # 140008328 <__imp_GetStartupInfoA>
   140002ecb:	44 0f b7 4c 24 60    	movzx  r9d,WORD PTR [rsp+0x60]
   140002ed1:	49 89 d8             	mov    r8,rbx
   140002ed4:	f6 44 24 5c 01       	test   BYTE PTR [rsp+0x5c],0x1
   140002ed9:	b8 0a 00 00 00       	mov    eax,0xa
   140002ede:	48 8b 0d fb 15 00 00 	mov    rcx,QWORD PTR [rip+0x15fb]        # 1400044e0 <.refptr.__ImageBase>
   140002ee5:	44 0f 44 c8          	cmove  r9d,eax
   140002ee9:	31 d2                	xor    edx,edx
   140002eeb:	48 81 c4 98 00 00 00 	add    rsp,0x98
   140002ef2:	5b                   	pop    rbx
   140002ef3:	5e                   	pop    rsi
   140002ef4:	e9 07 e9 ff ff       	jmp    140001800 <WinMain>
   140002ef9:	48 8d 1d 50 12 00 00 	lea    rbx,[rip+0x1250]        # 140004150 <.rdata>
   140002f00:	eb be                	jmp    140002ec0 <main+0x80>
   140002f02:	90                   	nop
   140002f03:	90                   	nop
   140002f04:	90                   	nop
   140002f05:	90                   	nop
   140002f06:	90                   	nop
   140002f07:	90                   	nop
   140002f08:	90                   	nop
   140002f09:	90                   	nop
   140002f0a:	90                   	nop
   140002f0b:	90                   	nop
   140002f0c:	90                   	nop
   140002f0d:	90                   	nop
   140002f0e:	90                   	nop
   140002f0f:	90                   	nop

0000000140002f10 <register_frame_ctor>:
   140002f10:	e9 1b e5 ff ff       	jmp    140001430 <__gcc_register_frame>
   140002f15:	90                   	nop
   140002f16:	90                   	nop
   140002f17:	90                   	nop
   140002f18:	90                   	nop
   140002f19:	90                   	nop
   140002f1a:	90                   	nop
   140002f1b:	90                   	nop
   140002f1c:	90                   	nop
   140002f1d:	90                   	nop
   140002f1e:	90                   	nop
   140002f1f:	90                   	nop
