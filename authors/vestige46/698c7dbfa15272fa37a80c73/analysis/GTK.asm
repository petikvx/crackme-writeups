
GTK-v0.1.exe:     file format pei-x86-64


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
   14000102e:	48 8b 1d 3b 34 00 00 	mov    rbx,QWORD PTR [rip+0x343b]        # 140004470 <.refptr.__native_startup_lock>
   140001035:	48 8b 3d 5c 72 00 00 	mov    rdi,QWORD PTR [rip+0x725c]        # 140008298 <__imp_Sleep>
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
   14000105c:	48 8b 2d 1d 34 00 00 	mov    rbp,QWORD PTR [rip+0x341d]        # 140004480 <.refptr.__native_startup_state>
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
   14000108d:	48 8b 05 5c 33 00 00 	mov    rax,QWORD PTR [rip+0x335c]        # 1400043f0 <.refptr.__dyn_tls_init_callback>
   140001094:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001097:	48 85 c0             	test   rax,rax
   14000109a:	74 0c                	je     1400010a8 <__tmainCRTStartup+0x98>
   14000109c:	45 31 c0             	xor    r8d,r8d
   14000109f:	ba 02 00 00 00       	mov    edx,0x2
   1400010a4:	31 c9                	xor    ecx,ecx
   1400010a6:	ff d0                	call   rax
   1400010a8:	e8 53 16 00 00       	call   140002700 <__p___initenv>
   1400010ad:	4c 8b 05 5c 5f 00 00 	mov    r8,QWORD PTR [rip+0x5f5c]        # 140007010 <envp>
   1400010b4:	8b 0d 66 5f 00 00    	mov    ecx,DWORD PTR [rip+0x5f66]        # 140007020 <argc>
   1400010ba:	4c 89 00             	mov    QWORD PTR [rax],r8
   1400010bd:	48 8b 15 54 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5f54]        # 140007018 <argv>
   1400010c4:	e8 87 03 00 00       	call   140001450 <main>
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
   140001117:	e8 64 08 00 00       	call   140001980 <_pei386_runtime_relocator>
   14000111c:	48 8d 0d 3d 0c 00 00 	lea    rcx,[rip+0xc3d]        # 140001d60 <_gnu_exception_handler>
   140001123:	ff 15 67 71 00 00    	call   QWORD PTR [rip+0x7167]        # 140008290 <__imp_SetUnhandledExceptionFilter>
   140001129:	48 8b 15 30 33 00 00 	mov    rdx,QWORD PTR [rip+0x3330]        # 140004460 <.refptr.__mingw_oldexcpt_handler>
   140001130:	48 8d 0d c9 fe ff ff 	lea    rcx,[rip+0xfffffffffffffec9]        # 140001000 <__mingw_invalidParameterHandler>
   140001137:	48 89 02             	mov    QWORD PTR [rdx],rax
   14000113a:	e8 01 17 00 00       	call   140002840 <_set_invalid_parameter_handler>
   14000113f:	e8 7c 10 00 00       	call   1400021c0 <_fpreset>
   140001144:	48 8b 05 e5 32 00 00 	mov    rax,QWORD PTR [rip+0x32e5]        # 140004430 <.refptr.__mingw_initltsdrot_force>
   14000114b:	31 c9                	xor    ecx,ecx
   14000114d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001153:	48 8b 05 e6 32 00 00 	mov    rax,QWORD PTR [rip+0x32e6]        # 140004440 <.refptr.__mingw_initltsdyn_force>
   14000115a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001160:	48 8b 05 e9 32 00 00 	mov    rax,QWORD PTR [rip+0x32e9]        # 140004450 <.refptr.__mingw_initltssuo_force>
   140001167:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000116d:	48 8b 05 4c 32 00 00 	mov    rax,QWORD PTR [rip+0x324c]        # 1400043c0 <.refptr.__ImageBase>
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
   1400011c0:	48 8b 05 59 32 00 00 	mov    rax,QWORD PTR [rip+0x3259]        # 140004420 <.refptr.__mingw_app_type>
   1400011c7:	89 0d 3b 5e 00 00    	mov    DWORD PTR [rip+0x5e3b],ecx        # 140007008 <managedapp>
   1400011cd:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   1400011d0:	45 85 c0             	test   r8d,r8d
   1400011d3:	0f 85 5f 01 00 00    	jne    140001338 <__tmainCRTStartup+0x328>
   1400011d9:	b9 01 00 00 00       	mov    ecx,0x1
   1400011de:	e8 45 16 00 00       	call   140002828 <__set_app_type>
   1400011e3:	e8 e8 15 00 00       	call   1400027d0 <__p__fmode>
   1400011e8:	48 8b 15 01 33 00 00 	mov    rdx,QWORD PTR [rip+0x3301]        # 1400044f0 <.refptr._fmode>
   1400011ef:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400011f1:	89 10                	mov    DWORD PTR [rax],edx
   1400011f3:	e8 d0 15 00 00       	call   1400027c8 <__p__commode>
   1400011f8:	48 8b 15 d1 32 00 00 	mov    rdx,QWORD PTR [rip+0x32d1]        # 1400044d0 <.refptr._commode>
   1400011ff:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001201:	89 10                	mov    DWORD PTR [rax],edx
   140001203:	e8 e8 03 00 00       	call   1400015f0 <_setargv>
   140001208:	85 c0                	test   eax,eax
   14000120a:	0f 88 f1 00 00 00    	js     140001301 <__tmainCRTStartup+0x2f1>
   140001210:	48 8b 05 89 31 00 00 	mov    rax,QWORD PTR [rip+0x3189]        # 1400043a0 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
   140001217:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14000121a:	0f 84 79 01 00 00    	je     140001399 <__tmainCRTStartup+0x389>
   140001220:	48 8b 05 d9 31 00 00 	mov    rax,QWORD PTR [rip+0x31d9]        # 140004400 <.refptr.__globallocalestatus>
   140001227:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
   14000122a:	0f 84 5a 01 00 00    	je     14000138a <__tmainCRTStartup+0x37a>
   140001230:	48 8b 15 89 32 00 00 	mov    rdx,QWORD PTR [rip+0x3289]        # 1400044c0 <.refptr.__xi_z>
   140001237:	48 8b 0d 72 32 00 00 	mov    rcx,QWORD PTR [rip+0x3272]        # 1400044b0 <.refptr.__xi_a>
   14000123e:	e8 f5 15 00 00       	call   140002838 <_initterm_e>
   140001243:	85 c0                	test   eax,eax
   140001245:	0f 85 35 01 00 00    	jne    140001380 <__tmainCRTStartup+0x370>
   14000124b:	48 8b 05 ce 32 00 00 	mov    rax,QWORD PTR [rip+0x32ce]        # 140004520 <.refptr._newmode>
   140001252:	4c 8d 05 b7 5d 00 00 	lea    r8,[rip+0x5db7]        # 140007010 <envp>
   140001259:	48 8d 15 b8 5d 00 00 	lea    rdx,[rip+0x5db8]        # 140007018 <argv>
   140001260:	48 8d 0d b9 5d 00 00 	lea    rcx,[rip+0x5db9]        # 140007020 <argc>
   140001267:	8b 00                	mov    eax,DWORD PTR [rax]
   140001269:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
   14000126d:	48 8b 05 6c 32 00 00 	mov    rax,QWORD PTR [rip+0x326c]        # 1400044e0 <.refptr._dowildcard>
   140001274:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   140001277:	48 8d 44 24 4c       	lea    rax,[rsp+0x4c]
   14000127c:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140001281:	e8 ba 14 00 00       	call   140002740 <__getmainargs>
   140001286:	85 c0                	test   eax,eax
   140001288:	78 77                	js     140001301 <__tmainCRTStartup+0x2f1>
   14000128a:	4c 63 25 8f 5d 00 00 	movsxd r12,DWORD PTR [rip+0x5d8f]        # 140007020 <argc>
   140001291:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
   140001296:	48 63 c9             	movsxd rcx,ecx
   140001299:	48 c1 e1 03          	shl    rcx,0x3
   14000129d:	e8 16 16 00 00       	call   1400028b8 <malloc>
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
   1400012d3:	e8 a0 15 00 00       	call   140002878 <memcpy>
   1400012d8:	49 39 f4             	cmp    r12,rsi
   1400012db:	74 6a                	je     140001347 <__tmainCRTStartup+0x337>
   1400012dd:	48 83 c6 01          	add    rsi,0x1
   1400012e1:	49 8b 4c f7 f8       	mov    rcx,QWORD PTR [r15+rsi*8-0x8]
   1400012e6:	e8 bd 14 00 00       	call   1400027a8 <strlen>
   1400012eb:	48 8d 78 01          	lea    rdi,[rax+0x1]
   1400012ef:	48 89 f9             	mov    rcx,rdi
   1400012f2:	e8 c1 15 00 00       	call   1400028b8 <malloc>
   1400012f7:	49 89 44 f5 f8       	mov    QWORD PTR [r13+rsi*8-0x8],rax
   1400012fc:	48 85 c0             	test   rax,rax
   1400012ff:	75 c7                	jne    1400012c8 <__tmainCRTStartup+0x2b8>
   140001301:	b9 08 00 00 00       	mov    ecx,0x8
   140001306:	e8 05 14 00 00       	call   140002710 <_amsg_exit>
   14000130b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001310:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   140001314:	e8 e7 14 00 00       	call   140002800 <_cexit>
   140001319:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   14000131d:	e9 c3 fd ff ff       	jmp    1400010e5 <__tmainCRTStartup+0xd5>
   140001322:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001328:	31 c0                	xor    eax,eax
   14000132a:	48 87 03             	xchg   QWORD PTR [rbx],rax
   14000132d:	e9 5b fd ff ff       	jmp    14000108d <__tmainCRTStartup+0x7d>
   140001332:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001338:	b9 02 00 00 00       	mov    ecx,0x2
   14000133d:	e8 e6 14 00 00       	call   140002828 <__set_app_type>
   140001342:	e9 9c fe ff ff       	jmp    1400011e3 <__tmainCRTStartup+0x1d3>
   140001347:	4b 8d 44 e5 00       	lea    rax,[r13+r12*8+0x0]
   14000134c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   140001353:	48 8b 15 46 31 00 00 	mov    rdx,QWORD PTR [rip+0x3146]        # 1400044a0 <.refptr.__xc_z>
   14000135a:	48 8b 0d 2f 31 00 00 	mov    rcx,QWORD PTR [rip+0x312f]        # 140004490 <.refptr.__xc_a>
   140001361:	4c 89 2d b0 5c 00 00 	mov    QWORD PTR [rip+0x5cb0],r13        # 140007018 <argv>
   140001368:	e8 c3 14 00 00       	call   140002830 <_initterm>
   14000136d:	e8 5e 02 00 00       	call   1400015d0 <__main>
   140001372:	c7 45 00 02 00 00 00 	mov    DWORD PTR [rbp+0x0],0x2
   140001379:	e9 06 fd ff ff       	jmp    140001084 <__tmainCRTStartup+0x74>
   14000137e:	66 90                	xchg   ax,ax
   140001380:	b8 ff 00 00 00       	mov    eax,0xff
   140001385:	e9 5b fd ff ff       	jmp    1400010e5 <__tmainCRTStartup+0xd5>
   14000138a:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   14000138f:	e8 fc 14 00 00       	call   140002890 <_configthreadlocale>
   140001394:	e9 97 fe ff ff       	jmp    140001230 <__tmainCRTStartup+0x220>
   140001399:	48 8d 0d 10 03 00 00 	lea    rcx,[rip+0x310]        # 1400016b0 <_matherr>
   1400013a0:	e8 ab 09 00 00       	call   140001d50 <__mingw_setusermatherr>
   1400013a5:	e9 76 fe ff ff       	jmp    140001220 <__tmainCRTStartup+0x210>
   1400013aa:	83 78 74 0e          	cmp    DWORD PTR [rax+0x74],0xe
   1400013ae:	0f 86 0c fe ff ff    	jbe    1400011c0 <__tmainCRTStartup+0x1b0>
   1400013b4:	44 8b 90 e8 00 00 00 	mov    r10d,DWORD PTR [rax+0xe8]
   1400013bb:	31 c9                	xor    ecx,ecx
   1400013bd:	45 85 d2             	test   r10d,r10d
   1400013c0:	0f 95 c1             	setne  cl
   1400013c3:	e9 f8 fd ff ff       	jmp    1400011c0 <__tmainCRTStartup+0x1b0>
   1400013c8:	b9 1f 00 00 00       	mov    ecx,0x1f
   1400013cd:	e8 3e 13 00 00       	call   140002710 <_amsg_exit>
   1400013d2:	89 c1                	mov    ecx,eax
   1400013d4:	e8 77 14 00 00       	call   140002850 <exit>
   1400013d9:	90                   	nop
   1400013da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000001400013e0 <WinMainCRTStartup>:
   1400013e0:	48 83 ec 28          	sub    rsp,0x28

00000001400013e4 <.l_startw>:
   1400013e4:	48 8b 05 35 30 00 00 	mov    rax,QWORD PTR [rip+0x3035]        # 140004420 <.refptr.__mingw_app_type>
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
   140001404:	48 8b 05 15 30 00 00 	mov    rax,QWORD PTR [rip+0x3015]        # 140004420 <.refptr.__mingw_app_type>
   14000140b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001411:	e8 fa fb ff ff       	call   140001010 <__tmainCRTStartup>
   140001416:	90                   	nop

0000000140001417 <.l_end>:
   140001417:	90                   	nop
   140001418:	48 83 c4 28          	add    rsp,0x28
   14000141c:	c3                   	ret
   14000141d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000140001420 <atexit>:
   140001420:	e9 eb 13 00 00       	jmp    140002810 <_crt_atexit>
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

0000000140001450 <main>:
   140001450:	55                   	push   rbp
   140001451:	48 89 e5             	mov    rbp,rsp
   140001454:	48 83 c4 80          	add    rsp,0xffffffffffffff80
   140001458:	e8 73 01 00 00       	call   1400015d0 <__main>
   14000145d:	48 b8 31 6d 4e 30 54 	movabs rax,0x33685454304e6d31
   140001464:	54 68 33 
   140001467:	48 ba 50 77 54 72 75 	movabs rdx,0x4d74357572547750
   14000146e:	35 74 4d 
   140001471:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140001475:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
   140001479:	66 c7 45 f0 33 00    	mov    WORD PTR [rbp-0x10],0x33
   14000147f:	48 8d 05 7a 2b 00 00 	lea    rax,[rip+0x2b7a]        # 140004000 <.rdata>
   140001486:	48 89 c1             	mov    rcx,rax
   140001489:	e8 5a 13 00 00       	call   1400027e8 <puts>
   14000148e:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   140001492:	48 8d 0d 78 2b 00 00 	lea    rcx,[rip+0x2b78]        # 140004011 <.rdata+0x11>
   140001499:	48 89 c2             	mov    rdx,rax
   14000149c:	e8 9f 11 00 00       	call   140002640 <scanf>
   1400014a1:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400014a5:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   1400014a9:	48 89 c1             	mov    rcx,rax
   1400014ac:	e8 ef 12 00 00       	call   1400027a0 <strcmp>
   1400014b1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400014b4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400014b8:	75 11                	jne    1400014cb <main+0x7b>
   1400014ba:	48 8d 05 53 2b 00 00 	lea    rax,[rip+0x2b53]        # 140004014 <.rdata+0x14>
   1400014c1:	48 89 c1             	mov    rcx,rax
   1400014c4:	e8 1f 13 00 00       	call   1400027e8 <puts>
   1400014c9:	eb 0f                	jmp    1400014da <main+0x8a>
   1400014cb:	48 8d 05 58 2b 00 00 	lea    rax,[rip+0x2b58]        # 14000402a <.rdata+0x2a>
   1400014d2:	48 89 c1             	mov    rcx,rax
   1400014d5:	e8 0e 13 00 00       	call   1400027e8 <puts>
   1400014da:	48 8d 05 56 2b 00 00 	lea    rax,[rip+0x2b56]        # 140004037 <.rdata+0x37>
   1400014e1:	48 89 c1             	mov    rcx,rax
   1400014e4:	e8 77 13 00 00       	call   140002860 <system>
   1400014e9:	b8 00 00 00 00       	mov    eax,0x0
   1400014ee:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
   1400014f2:	5d                   	pop    rbp
   1400014f3:	c3                   	ret
   1400014f4:	90                   	nop
   1400014f5:	90                   	nop
   1400014f6:	90                   	nop
   1400014f7:	90                   	nop
   1400014f8:	90                   	nop
   1400014f9:	90                   	nop
   1400014fa:	90                   	nop
   1400014fb:	90                   	nop
   1400014fc:	90                   	nop
   1400014fd:	90                   	nop
   1400014fe:	90                   	nop
   1400014ff:	90                   	nop

0000000140001500 <__do_global_dtors>:
   140001500:	48 83 ec 28          	sub    rsp,0x28
   140001504:	48 8b 05 f5 1a 00 00 	mov    rax,QWORD PTR [rip+0x1af5]        # 140003000 <__data_start__>
   14000150b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000150e:	48 85 c0             	test   rax,rax
   140001511:	74 2a                	je     14000153d <__do_global_dtors+0x3d>
   140001513:	66 90                	xchg   ax,ax
   140001515:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000151c:	00 00 00 00 
   140001520:	ff d0                	call   rax
   140001522:	48 8b 05 d7 1a 00 00 	mov    rax,QWORD PTR [rip+0x1ad7]        # 140003000 <__data_start__>
   140001529:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000152d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001531:	48 89 15 c8 1a 00 00 	mov    QWORD PTR [rip+0x1ac8],rdx        # 140003000 <__data_start__>
   140001538:	48 85 c0             	test   rax,rax
   14000153b:	75 e3                	jne    140001520 <__do_global_dtors+0x20>
   14000153d:	48 83 c4 28          	add    rsp,0x28
   140001541:	c3                   	ret
   140001542:	0f 1f 00             	nop    DWORD PTR [rax]
   140001545:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000154c:	00 00 00 00 

0000000140001550 <__do_global_ctors>:
   140001550:	56                   	push   rsi
   140001551:	53                   	push   rbx
   140001552:	48 83 ec 28          	sub    rsp,0x28
   140001556:	48 8b 15 53 2e 00 00 	mov    rdx,QWORD PTR [rip+0x2e53]        # 1400043b0 <.refptr.__CTOR_LIST__>
   14000155d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001560:	89 c1                	mov    ecx,eax
   140001562:	83 f8 ff             	cmp    eax,0xffffffff
   140001565:	74 39                	je     1400015a0 <__do_global_ctors+0x50>
   140001567:	85 c9                	test   ecx,ecx
   140001569:	74 20                	je     14000158b <__do_global_ctors+0x3b>
   14000156b:	89 c8                	mov    eax,ecx
   14000156d:	83 e9 01             	sub    ecx,0x1
   140001570:	48 8d 1c c2          	lea    rbx,[rdx+rax*8]
   140001574:	48 29 c8             	sub    rax,rcx
   140001577:	48 8d 74 c2 f8       	lea    rsi,[rdx+rax*8-0x8]
   14000157c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001580:	ff 13                	call   QWORD PTR [rbx]
   140001582:	48 83 eb 08          	sub    rbx,0x8
   140001586:	48 39 f3             	cmp    rbx,rsi
   140001589:	75 f5                	jne    140001580 <__do_global_ctors+0x30>
   14000158b:	48 8d 0d 6e ff ff ff 	lea    rcx,[rip+0xffffffffffffff6e]        # 140001500 <__do_global_dtors>
   140001592:	48 83 c4 28          	add    rsp,0x28
   140001596:	5b                   	pop    rbx
   140001597:	5e                   	pop    rsi
   140001598:	e9 83 fe ff ff       	jmp    140001420 <atexit>
   14000159d:	0f 1f 00             	nop    DWORD PTR [rax]
   1400015a0:	31 c0                	xor    eax,eax
   1400015a2:	0f 1f 00             	nop    DWORD PTR [rax]
   1400015a5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400015ac:	00 00 00 00 
   1400015b0:	44 8d 40 01          	lea    r8d,[rax+0x1]
   1400015b4:	89 c1                	mov    ecx,eax
   1400015b6:	4c 89 c0             	mov    rax,r8
   1400015b9:	4a 83 3c c2 00       	cmp    QWORD PTR [rdx+r8*8],0x0
   1400015be:	75 f0                	jne    1400015b0 <__do_global_ctors+0x60>
   1400015c0:	eb a5                	jmp    140001567 <__do_global_ctors+0x17>
   1400015c2:	0f 1f 00             	nop    DWORD PTR [rax]
   1400015c5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400015cc:	00 00 00 00 

00000001400015d0 <__main>:
   1400015d0:	8b 05 5a 5a 00 00    	mov    eax,DWORD PTR [rip+0x5a5a]        # 140007030 <initialized>
   1400015d6:	85 c0                	test   eax,eax
   1400015d8:	74 06                	je     1400015e0 <__main+0x10>
   1400015da:	c3                   	ret
   1400015db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400015e0:	c7 05 46 5a 00 00 01 	mov    DWORD PTR [rip+0x5a46],0x1        # 140007030 <initialized>
   1400015e7:	00 00 00 
   1400015ea:	e9 61 ff ff ff       	jmp    140001550 <__do_global_ctors>
   1400015ef:	90                   	nop

00000001400015f0 <_setargv>:
   1400015f0:	31 c0                	xor    eax,eax
   1400015f2:	c3                   	ret
   1400015f3:	90                   	nop
   1400015f4:	90                   	nop
   1400015f5:	90                   	nop
   1400015f6:	90                   	nop
   1400015f7:	90                   	nop
   1400015f8:	90                   	nop
   1400015f9:	90                   	nop
   1400015fa:	90                   	nop
   1400015fb:	90                   	nop
   1400015fc:	90                   	nop
   1400015fd:	90                   	nop
   1400015fe:	90                   	nop
   1400015ff:	90                   	nop

0000000140001600 <__dyn_tls_dtor>:
   140001600:	83 fa 03             	cmp    edx,0x3
   140001603:	74 0b                	je     140001610 <__dyn_tls_dtor+0x10>
   140001605:	85 d2                	test   edx,edx
   140001607:	74 07                	je     140001610 <__dyn_tls_dtor+0x10>
   140001609:	c3                   	ret
   14000160a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001610:	e9 9b 0a 00 00       	jmp    1400020b0 <__mingw_TLScallback>
   140001615:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000161c:	00 00 00 00 

0000000140001620 <__dyn_tls_init>:
   140001620:	56                   	push   rsi
   140001621:	53                   	push   rbx
   140001622:	48 83 ec 28          	sub    rsp,0x28
   140001626:	48 8b 05 63 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d63]        # 140004390 <.refptr._CRT_MT>
   14000162d:	83 38 02             	cmp    DWORD PTR [rax],0x2
   140001630:	74 06                	je     140001638 <__dyn_tls_init+0x18>
   140001632:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140001638:	83 fa 02             	cmp    edx,0x2
   14000163b:	74 13                	je     140001650 <__dyn_tls_init+0x30>
   14000163d:	83 fa 01             	cmp    edx,0x1
   140001640:	74 4e                	je     140001690 <__dyn_tls_init+0x70>
   140001642:	48 83 c4 28          	add    rsp,0x28
   140001646:	5b                   	pop    rbx
   140001647:	5e                   	pop    rsi
   140001648:	c3                   	ret
   140001649:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001650:	48 8d 1d d9 35 00 00 	lea    rbx,[rip+0x35d9]        # 140004c30 <__xd_z>
   140001657:	48 8d 35 d2 35 00 00 	lea    rsi,[rip+0x35d2]        # 140004c30 <__xd_z>
   14000165e:	48 39 f3             	cmp    rbx,rsi
   140001661:	74 df                	je     140001642 <__dyn_tls_init+0x22>
   140001663:	66 90                	xchg   ax,ax
   140001665:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000166c:	00 00 00 00 
   140001670:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001673:	48 85 c0             	test   rax,rax
   140001676:	74 02                	je     14000167a <__dyn_tls_init+0x5a>
   140001678:	ff d0                	call   rax
   14000167a:	48 83 c3 08          	add    rbx,0x8
   14000167e:	48 39 f3             	cmp    rbx,rsi
   140001681:	75 ed                	jne    140001670 <__dyn_tls_init+0x50>
   140001683:	48 83 c4 28          	add    rsp,0x28
   140001687:	5b                   	pop    rbx
   140001688:	5e                   	pop    rsi
   140001689:	c3                   	ret
   14000168a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001690:	48 83 c4 28          	add    rsp,0x28
   140001694:	5b                   	pop    rbx
   140001695:	5e                   	pop    rsi
   140001696:	e9 15 0a 00 00       	jmp    1400020b0 <__mingw_TLScallback>
   14000169b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000001400016a0 <__tlregdtor>:
   1400016a0:	31 c0                	xor    eax,eax
   1400016a2:	c3                   	ret
   1400016a3:	90                   	nop
   1400016a4:	90                   	nop
   1400016a5:	90                   	nop
   1400016a6:	90                   	nop
   1400016a7:	90                   	nop
   1400016a8:	90                   	nop
   1400016a9:	90                   	nop
   1400016aa:	90                   	nop
   1400016ab:	90                   	nop
   1400016ac:	90                   	nop
   1400016ad:	90                   	nop
   1400016ae:	90                   	nop
   1400016af:	90                   	nop

00000001400016b0 <_matherr>:
   1400016b0:	56                   	push   rsi
   1400016b1:	53                   	push   rbx
   1400016b2:	48 83 ec 78          	sub    rsp,0x78
   1400016b6:	0f 11 74 24 40       	movups XMMWORD PTR [rsp+0x40],xmm6
   1400016bb:	0f 11 7c 24 50       	movups XMMWORD PTR [rsp+0x50],xmm7
   1400016c0:	44 0f 11 44 24 60    	movups XMMWORD PTR [rsp+0x60],xmm8
   1400016c6:	83 39 06             	cmp    DWORD PTR [rcx],0x6
   1400016c9:	0f 87 cd 00 00 00    	ja     14000179c <_matherr+0xec>
   1400016cf:	8b 01                	mov    eax,DWORD PTR [rcx]
   1400016d1:	48 8d 15 ec 2a 00 00 	lea    rdx,[rip+0x2aec]        # 1400041c4 <.rdata+0x124>
   1400016d8:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   1400016dc:	48 01 d0             	add    rax,rdx
   1400016df:	ff e0                	jmp    rax
   1400016e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400016e8:	48 8d 1d d0 29 00 00 	lea    rbx,[rip+0x29d0]        # 1400040bf <.rdata+0x1f>
   1400016ef:	f2 44 0f 10 41 20    	movsd  xmm8,QWORD PTR [rcx+0x20]
   1400016f5:	f2 0f 10 79 18       	movsd  xmm7,QWORD PTR [rcx+0x18]
   1400016fa:	f2 0f 10 71 10       	movsd  xmm6,QWORD PTR [rcx+0x10]
   1400016ff:	48 8b 71 08          	mov    rsi,QWORD PTR [rcx+0x8]
   140001703:	b9 02 00 00 00       	mov    ecx,0x2
   140001708:	e8 b3 10 00 00       	call   1400027c0 <__acrt_iob_func>
   14000170d:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001714:	49 89 d8             	mov    r8,rbx
   140001717:	48 8d 15 7a 2a 00 00 	lea    rdx,[rip+0x2a7a]        # 140004198 <.rdata+0xf8>
   14000171e:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001724:	49 89 f1             	mov    r9,rsi
   140001727:	48 89 c1             	mov    rcx,rax
   14000172a:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001730:	e8 5b 0f 00 00       	call   140002690 <fprintf>
   140001735:	90                   	nop
   140001736:	0f 10 74 24 40       	movups xmm6,XMMWORD PTR [rsp+0x40]
   14000173b:	0f 10 7c 24 50       	movups xmm7,XMMWORD PTR [rsp+0x50]
   140001740:	31 c0                	xor    eax,eax
   140001742:	44 0f 10 44 24 60    	movups xmm8,XMMWORD PTR [rsp+0x60]
   140001748:	48 83 c4 78          	add    rsp,0x78
   14000174c:	5b                   	pop    rbx
   14000174d:	5e                   	pop    rsi
   14000174e:	c3                   	ret
   14000174f:	90                   	nop
   140001750:	48 8d 1d 49 29 00 00 	lea    rbx,[rip+0x2949]        # 1400040a0 <.rdata>
   140001757:	eb 96                	jmp    1400016ef <_matherr+0x3f>
   140001759:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001760:	48 8d 1d 99 29 00 00 	lea    rbx,[rip+0x2999]        # 140004100 <.rdata+0x60>
   140001767:	eb 86                	jmp    1400016ef <_matherr+0x3f>
   140001769:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001770:	48 8d 1d 69 29 00 00 	lea    rbx,[rip+0x2969]        # 1400040e0 <.rdata+0x40>
   140001777:	e9 73 ff ff ff       	jmp    1400016ef <_matherr+0x3f>
   14000177c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001780:	48 8d 1d c9 29 00 00 	lea    rbx,[rip+0x29c9]        # 140004150 <.rdata+0xb0>
   140001787:	e9 63 ff ff ff       	jmp    1400016ef <_matherr+0x3f>
   14000178c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001790:	48 8d 1d 91 29 00 00 	lea    rbx,[rip+0x2991]        # 140004128 <.rdata+0x88>
   140001797:	e9 53 ff ff ff       	jmp    1400016ef <_matherr+0x3f>
   14000179c:	48 8d 1d e3 29 00 00 	lea    rbx,[rip+0x29e3]        # 140004186 <.rdata+0xe6>
   1400017a3:	e9 47 ff ff ff       	jmp    1400016ef <_matherr+0x3f>
   1400017a8:	90                   	nop
   1400017a9:	90                   	nop
   1400017aa:	90                   	nop
   1400017ab:	90                   	nop
   1400017ac:	90                   	nop
   1400017ad:	90                   	nop
   1400017ae:	90                   	nop
   1400017af:	90                   	nop

00000001400017b0 <__report_error>:
   1400017b0:	56                   	push   rsi
   1400017b1:	53                   	push   rbx
   1400017b2:	48 83 ec 38          	sub    rsp,0x38
   1400017b6:	48 89 cb             	mov    rbx,rcx
   1400017b9:	48 8d 44 24 58       	lea    rax,[rsp+0x58]
   1400017be:	b9 02 00 00 00       	mov    ecx,0x2
   1400017c3:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   1400017c8:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   1400017cd:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   1400017d2:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1400017d7:	e8 e4 0f 00 00       	call   1400027c0 <__acrt_iob_func>
   1400017dc:	48 8d 15 fd 29 00 00 	lea    rdx,[rip+0x29fd]        # 1400041e0 <.rdata>
   1400017e3:	48 89 c1             	mov    rcx,rax
   1400017e6:	e8 a5 0e 00 00       	call   140002690 <fprintf>
   1400017eb:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   1400017f0:	b9 02 00 00 00       	mov    ecx,0x2
   1400017f5:	e8 c6 0f 00 00       	call   1400027c0 <__acrt_iob_func>
   1400017fa:	48 89 da             	mov    rdx,rbx
   1400017fd:	49 89 f0             	mov    r8,rsi
   140001800:	48 89 c1             	mov    rcx,rax
   140001803:	e8 f8 0d 00 00       	call   140002600 <vfprintf>
   140001808:	e8 3b 10 00 00       	call   140002848 <abort>
   14000180d:	90                   	nop
   14000180e:	66 90                	xchg   ax,ax

0000000140001810 <mark_section_writable>:
   140001810:	57                   	push   rdi
   140001811:	56                   	push   rsi
   140001812:	53                   	push   rbx
   140001813:	48 83 ec 50          	sub    rsp,0x50
   140001817:	48 63 35 86 58 00 00 	movsxd rsi,DWORD PTR [rip+0x5886]        # 1400070a4 <maxSections>
   14000181e:	48 89 cb             	mov    rbx,rcx
   140001821:	85 f6                	test   esi,esi
   140001823:	0f 8e 17 01 00 00    	jle    140001940 <mark_section_writable+0x130>
   140001829:	48 8b 05 78 58 00 00 	mov    rax,QWORD PTR [rip+0x5878]        # 1400070a8 <the_secs>
   140001830:	45 31 c9             	xor    r9d,r9d
   140001833:	48 83 c0 18          	add    rax,0x18
   140001837:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000183e:	00 00 
   140001840:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   140001843:	4c 39 c3             	cmp    rbx,r8
   140001846:	72 13                	jb     14000185b <mark_section_writable+0x4b>
   140001848:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   14000184c:	8b 52 08             	mov    edx,DWORD PTR [rdx+0x8]
   14000184f:	49 01 d0             	add    r8,rdx
   140001852:	4c 39 c3             	cmp    rbx,r8
   140001855:	0f 82 8a 00 00 00    	jb     1400018e5 <mark_section_writable+0xd5>
   14000185b:	41 83 c1 01          	add    r9d,0x1
   14000185f:	48 83 c0 28          	add    rax,0x28
   140001863:	41 39 f1             	cmp    r9d,esi
   140001866:	75 d8                	jne    140001840 <mark_section_writable+0x30>
   140001868:	48 89 d9             	mov    rcx,rbx
   14000186b:	e8 80 0a 00 00       	call   1400022f0 <__mingw_GetSectionForAddress>
   140001870:	48 89 c7             	mov    rdi,rax
   140001873:	48 85 c0             	test   rax,rax
   140001876:	0f 84 e6 00 00 00    	je     140001962 <mark_section_writable+0x152>
   14000187c:	48 8b 05 25 58 00 00 	mov    rax,QWORD PTR [rip+0x5825]        # 1400070a8 <the_secs>
   140001883:	48 8d 1c b6          	lea    rbx,[rsi+rsi*4]
   140001887:	48 c1 e3 03          	shl    rbx,0x3
   14000188b:	48 01 d8             	add    rax,rbx
   14000188e:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   140001892:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001898:	e8 93 0b 00 00       	call   140002430 <_GetPEImageBase>
   14000189d:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   1400018a0:	41 b8 30 00 00 00    	mov    r8d,0x30
   1400018a6:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   1400018aa:	48 8b 05 f7 57 00 00 	mov    rax,QWORD PTR [rip+0x57f7]        # 1400070a8 <the_secs>
   1400018b1:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   1400018b6:	48 89 4c 18 18       	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   1400018bb:	ff 15 ef 69 00 00    	call   QWORD PTR [rip+0x69ef]        # 1400082b0 <__imp_VirtualQuery>
   1400018c1:	48 85 c0             	test   rax,rax
   1400018c4:	0f 84 7d 00 00 00    	je     140001947 <mark_section_writable+0x137>
   1400018ca:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   1400018ce:	8d 50 fc             	lea    edx,[rax-0x4]
   1400018d1:	83 e2 fb             	and    edx,0xfffffffb
   1400018d4:	74 08                	je     1400018de <mark_section_writable+0xce>
   1400018d6:	8d 50 c0             	lea    edx,[rax-0x40]
   1400018d9:	83 e2 bf             	and    edx,0xffffffbf
   1400018dc:	75 12                	jne    1400018f0 <mark_section_writable+0xe0>
   1400018de:	83 05 bf 57 00 00 01 	add    DWORD PTR [rip+0x57bf],0x1        # 1400070a4 <maxSections>
   1400018e5:	48 83 c4 50          	add    rsp,0x50
   1400018e9:	5b                   	pop    rbx
   1400018ea:	5e                   	pop    rsi
   1400018eb:	5f                   	pop    rdi
   1400018ec:	c3                   	ret
   1400018ed:	0f 1f 00             	nop    DWORD PTR [rax]
   1400018f0:	83 f8 02             	cmp    eax,0x2
   1400018f3:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   1400018f8:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   1400018fd:	41 b8 40 00 00 00    	mov    r8d,0x40
   140001903:	b8 04 00 00 00       	mov    eax,0x4
   140001908:	44 0f 44 c0          	cmove  r8d,eax
   14000190c:	48 03 1d 95 57 00 00 	add    rbx,QWORD PTR [rip+0x5795]        # 1400070a8 <the_secs>
   140001913:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   140001917:	49 89 d9             	mov    r9,rbx
   14000191a:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   14000191e:	ff 15 84 69 00 00    	call   QWORD PTR [rip+0x6984]        # 1400082a8 <__imp_VirtualProtect>
   140001924:	85 c0                	test   eax,eax
   140001926:	75 b6                	jne    1400018de <mark_section_writable+0xce>
   140001928:	ff 15 4a 69 00 00    	call   QWORD PTR [rip+0x694a]        # 140008278 <__imp_GetLastError>
   14000192e:	48 8d 0d 23 29 00 00 	lea    rcx,[rip+0x2923]        # 140004258 <.rdata+0x78>
   140001935:	89 c2                	mov    edx,eax
   140001937:	e8 74 fe ff ff       	call   1400017b0 <__report_error>
   14000193c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001940:	31 f6                	xor    esi,esi
   140001942:	e9 21 ff ff ff       	jmp    140001868 <mark_section_writable+0x58>
   140001947:	48 8b 05 5a 57 00 00 	mov    rax,QWORD PTR [rip+0x575a]        # 1400070a8 <the_secs>
   14000194e:	8b 57 08             	mov    edx,DWORD PTR [rdi+0x8]
   140001951:	48 8d 0d c8 28 00 00 	lea    rcx,[rip+0x28c8]        # 140004220 <.rdata+0x40>
   140001958:	4c 8b 44 18 18       	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   14000195d:	e8 4e fe ff ff       	call   1400017b0 <__report_error>
   140001962:	48 89 da             	mov    rdx,rbx
   140001965:	48 8d 0d 94 28 00 00 	lea    rcx,[rip+0x2894]        # 140004200 <.rdata+0x20>
   14000196c:	e8 3f fe ff ff       	call   1400017b0 <__report_error>
   140001971:	90                   	nop
   140001972:	0f 1f 00             	nop    DWORD PTR [rax]
   140001975:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000197c:	00 00 00 00 

0000000140001980 <_pei386_runtime_relocator>:
   140001980:	55                   	push   rbp
   140001981:	41 57                	push   r15
   140001983:	41 56                	push   r14
   140001985:	41 55                	push   r13
   140001987:	41 54                	push   r12
   140001989:	57                   	push   rdi
   14000198a:	56                   	push   rsi
   14000198b:	53                   	push   rbx
   14000198c:	48 83 ec 48          	sub    rsp,0x48
   140001990:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140001995:	8b 35 05 57 00 00    	mov    esi,DWORD PTR [rip+0x5705]        # 1400070a0 <was_init.0>
   14000199b:	85 f6                	test   esi,esi
   14000199d:	74 11                	je     1400019b0 <_pei386_runtime_relocator+0x30>
   14000199f:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   1400019a3:	5b                   	pop    rbx
   1400019a4:	5e                   	pop    rsi
   1400019a5:	5f                   	pop    rdi
   1400019a6:	41 5c                	pop    r12
   1400019a8:	41 5d                	pop    r13
   1400019aa:	41 5e                	pop    r14
   1400019ac:	41 5f                	pop    r15
   1400019ae:	5d                   	pop    rbp
   1400019af:	c3                   	ret
   1400019b0:	c7 05 e6 56 00 00 01 	mov    DWORD PTR [rip+0x56e6],0x1        # 1400070a0 <was_init.0>
   1400019b7:	00 00 00 
   1400019ba:	e8 b1 09 00 00       	call   140002370 <__mingw_GetSectionCount>
   1400019bf:	48 98                	cdqe
   1400019c1:	48 8d 04 80          	lea    rax,[rax+rax*4]
   1400019c5:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400019cc:	00 
   1400019cd:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   1400019d1:	e8 ea 0b 00 00       	call   1400025c0 <___chkstk_ms>
   1400019d6:	48 8b 3d f3 29 00 00 	mov    rdi,QWORD PTR [rip+0x29f3]        # 1400043d0 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
   1400019dd:	48 8b 1d fc 29 00 00 	mov    rbx,QWORD PTR [rip+0x29fc]        # 1400043e0 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
   1400019e4:	48 29 c4             	sub    rsp,rax
   1400019e7:	c7 05 b3 56 00 00 00 	mov    DWORD PTR [rip+0x56b3],0x0        # 1400070a4 <maxSections>
   1400019ee:	00 00 00 
   1400019f1:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   1400019f6:	48 89 05 ab 56 00 00 	mov    QWORD PTR [rip+0x56ab],rax        # 1400070a8 <the_secs>
   1400019fd:	48 89 f8             	mov    rax,rdi
   140001a00:	48 29 d8             	sub    rax,rbx
   140001a03:	48 83 f8 07          	cmp    rax,0x7
   140001a07:	7e 96                	jle    14000199f <_pei386_runtime_relocator+0x1f>
   140001a09:	48 83 f8 0b          	cmp    rax,0xb
   140001a0d:	0f 8f 85 01 00 00    	jg     140001b98 <_pei386_runtime_relocator+0x218>
   140001a13:	8b 13                	mov    edx,DWORD PTR [rbx]
   140001a15:	85 d2                	test   edx,edx
   140001a17:	0f 85 90 01 00 00    	jne    140001bad <_pei386_runtime_relocator+0x22d>
   140001a1d:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140001a20:	85 c0                	test   eax,eax
   140001a22:	0f 85 85 01 00 00    	jne    140001bad <_pei386_runtime_relocator+0x22d>
   140001a28:	8b 53 08             	mov    edx,DWORD PTR [rbx+0x8]
   140001a2b:	83 fa 01             	cmp    edx,0x1
   140001a2e:	0f 85 cf 02 00 00    	jne    140001d03 <_pei386_runtime_relocator+0x383>
   140001a34:	48 83 c3 0c          	add    rbx,0xc
   140001a38:	4c 8b 35 81 29 00 00 	mov    r14,QWORD PTR [rip+0x2981]        # 1400043c0 <.refptr.__ImageBase>
   140001a3f:	4c 8d 65 f8          	lea    r12,[rbp-0x8]
   140001a43:	48 39 fb             	cmp    rbx,rdi
   140001a46:	72 7c                	jb     140001ac4 <_pei386_runtime_relocator+0x144>
   140001a48:	e9 52 ff ff ff       	jmp    14000199f <_pei386_runtime_relocator+0x1f>
   140001a4d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001a50:	83 fa 08             	cmp    edx,0x8
   140001a53:	0f 84 1f 02 00 00    	je     140001c78 <_pei386_runtime_relocator+0x2f8>
   140001a59:	83 fa 10             	cmp    edx,0x10
   140001a5c:	0f 85 79 02 00 00    	jne    140001cdb <_pei386_runtime_relocator+0x35b>
   140001a62:	41 0f b7 07          	movzx  eax,WORD PTR [r15]
   140001a66:	66 85 c0             	test   ax,ax
   140001a69:	79 06                	jns    140001a71 <_pei386_runtime_relocator+0xf1>
   140001a6b:	48 0d 00 00 ff ff    	or     rax,0xffffffffffff0000
   140001a71:	4c 29 c0             	sub    rax,r8
   140001a74:	4c 01 c8             	add    rax,r9
   140001a77:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001a7d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a81:	75 18                	jne    140001a9b <_pei386_runtime_relocator+0x11b>
   140001a83:	48 3d ff ff 00 00    	cmp    rax,0xffff
   140001a89:	0f 8f 60 02 00 00    	jg     140001cef <_pei386_runtime_relocator+0x36f>
   140001a8f:	48 3d 00 80 ff ff    	cmp    rax,0xffffffffffff8000
   140001a95:	0f 8c 54 02 00 00    	jl     140001cef <_pei386_runtime_relocator+0x36f>
   140001a9b:	4c 89 f9             	mov    rcx,r15
   140001a9e:	4d 89 e5             	mov    r13,r12
   140001aa1:	e8 6a fd ff ff       	call   140001810 <mark_section_writable>
   140001aa6:	41 b8 02 00 00 00    	mov    r8d,0x2
   140001aac:	4c 89 e2             	mov    rdx,r12
   140001aaf:	4c 89 f9             	mov    rcx,r15
   140001ab2:	e8 c1 0d 00 00       	call   140002878 <memcpy>
   140001ab7:	48 83 c3 0c          	add    rbx,0xc
   140001abb:	48 39 fb             	cmp    rbx,rdi
   140001abe:	0f 83 7c 00 00 00    	jae    140001b40 <_pei386_runtime_relocator+0x1c0>
   140001ac4:	44 8b 03             	mov    r8d,DWORD PTR [rbx]
   140001ac7:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   140001aca:	44 8b 7b 04          	mov    r15d,DWORD PTR [rbx+0x4]
   140001ace:	4d 01 f0             	add    r8,r14
   140001ad1:	0f b6 d1             	movzx  edx,cl
   140001ad4:	4d 8b 08             	mov    r9,QWORD PTR [r8]
   140001ad7:	4d 01 f7             	add    r15,r14
   140001ada:	83 fa 20             	cmp    edx,0x20
   140001add:	0f 84 2d 01 00 00    	je     140001c10 <_pei386_runtime_relocator+0x290>
   140001ae3:	0f 86 67 ff ff ff    	jbe    140001a50 <_pei386_runtime_relocator+0xd0>
   140001ae9:	83 fa 40             	cmp    edx,0x40
   140001aec:	0f 85 e9 01 00 00    	jne    140001cdb <_pei386_runtime_relocator+0x35b>
   140001af2:	49 8b 07             	mov    rax,QWORD PTR [r15]
   140001af5:	4c 29 c0             	sub    rax,r8
   140001af8:	4c 01 c8             	add    rax,r9
   140001afb:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001b01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b05:	75 09                	jne    140001b10 <_pei386_runtime_relocator+0x190>
   140001b07:	48 85 c0             	test   rax,rax
   140001b0a:	0f 89 df 01 00 00    	jns    140001cef <_pei386_runtime_relocator+0x36f>
   140001b10:	4c 89 f9             	mov    rcx,r15
   140001b13:	48 83 c3 0c          	add    rbx,0xc
   140001b17:	4d 89 e5             	mov    r13,r12
   140001b1a:	e8 f1 fc ff ff       	call   140001810 <mark_section_writable>
   140001b1f:	41 b8 08 00 00 00    	mov    r8d,0x8
   140001b25:	4c 89 e2             	mov    rdx,r12
   140001b28:	4c 89 f9             	mov    rcx,r15
   140001b2b:	e8 48 0d 00 00       	call   140002878 <memcpy>
   140001b30:	48 39 fb             	cmp    rbx,rdi
   140001b33:	72 8f                	jb     140001ac4 <_pei386_runtime_relocator+0x144>
   140001b35:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001b3c:	00 00 00 00 
   140001b40:	8b 05 5e 55 00 00    	mov    eax,DWORD PTR [rip+0x555e]        # 1400070a4 <maxSections>
   140001b46:	85 c0                	test   eax,eax
   140001b48:	0f 8e 51 fe ff ff    	jle    14000199f <_pei386_runtime_relocator+0x1f>
   140001b4e:	48 8b 3d 53 67 00 00 	mov    rdi,QWORD PTR [rip+0x6753]        # 1400082a8 <__imp_VirtualProtect>
   140001b55:	31 db                	xor    ebx,ebx
   140001b57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001b5e:	00 00 
   140001b60:	48 8b 05 41 55 00 00 	mov    rax,QWORD PTR [rip+0x5541]        # 1400070a8 <the_secs>
   140001b67:	48 01 d8             	add    rax,rbx
   140001b6a:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   140001b6d:	45 85 c0             	test   r8d,r8d
   140001b70:	74 0d                	je     140001b7f <_pei386_runtime_relocator+0x1ff>
   140001b72:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   140001b76:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140001b7a:	4d 89 e9             	mov    r9,r13
   140001b7d:	ff d7                	call   rdi
   140001b7f:	83 c6 01             	add    esi,0x1
   140001b82:	48 83 c3 28          	add    rbx,0x28
   140001b86:	3b 35 18 55 00 00    	cmp    esi,DWORD PTR [rip+0x5518]        # 1400070a4 <maxSections>
   140001b8c:	7c d2                	jl     140001b60 <_pei386_runtime_relocator+0x1e0>
   140001b8e:	e9 0c fe ff ff       	jmp    14000199f <_pei386_runtime_relocator+0x1f>
   140001b93:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001b98:	44 8b 0b             	mov    r9d,DWORD PTR [rbx]
   140001b9b:	45 85 c9             	test   r9d,r9d
   140001b9e:	75 0d                	jne    140001bad <_pei386_runtime_relocator+0x22d>
   140001ba0:	44 8b 43 04          	mov    r8d,DWORD PTR [rbx+0x4]
   140001ba4:	45 85 c0             	test   r8d,r8d
   140001ba7:	0f 84 1a 01 00 00    	je     140001cc7 <_pei386_runtime_relocator+0x347>
   140001bad:	48 39 fb             	cmp    rbx,rdi
   140001bb0:	0f 83 e9 fd ff ff    	jae    14000199f <_pei386_runtime_relocator+0x1f>
   140001bb6:	4c 8b 35 03 28 00 00 	mov    r14,QWORD PTR [rip+0x2803]        # 1400043c0 <.refptr.__ImageBase>
   140001bbd:	4c 8d 6d f8          	lea    r13,[rbp-0x8]
   140001bc1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001bc5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001bcc:	00 00 00 00 
   140001bd0:	44 8b 63 04          	mov    r12d,DWORD PTR [rbx+0x4]
   140001bd4:	8b 03                	mov    eax,DWORD PTR [rbx]
   140001bd6:	48 83 c3 08          	add    rbx,0x8
   140001bda:	43 03 04 26          	add    eax,DWORD PTR [r14+r12*1]
   140001bde:	4b 8d 0c 34          	lea    rcx,[r12+r14*1]
   140001be2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140001be5:	e8 26 fc ff ff       	call   140001810 <mark_section_writable>
   140001bea:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001bf0:	4c 89 ea             	mov    rdx,r13
   140001bf3:	4b 8d 0c 34          	lea    rcx,[r12+r14*1]
   140001bf7:	e8 7c 0c 00 00       	call   140002878 <memcpy>
   140001bfc:	48 39 fb             	cmp    rbx,rdi
   140001bff:	72 cf                	jb     140001bd0 <_pei386_runtime_relocator+0x250>
   140001c01:	e9 3a ff ff ff       	jmp    140001b40 <_pei386_runtime_relocator+0x1c0>
   140001c06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140001c0d:	00 00 00 
   140001c10:	41 8b 07             	mov    eax,DWORD PTR [r15]
   140001c13:	85 c0                	test   eax,eax
   140001c15:	79 0d                	jns    140001c24 <_pei386_runtime_relocator+0x2a4>
   140001c17:	49 bb 00 00 00 00 ff 	movabs r11,0xffffffff00000000
   140001c1e:	ff ff ff 
   140001c21:	4c 09 d8             	or     rax,r11
   140001c24:	4c 29 c0             	sub    rax,r8
   140001c27:	4c 01 c8             	add    rax,r9
   140001c2a:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001c30:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001c34:	75 1a                	jne    140001c50 <_pei386_runtime_relocator+0x2d0>
   140001c36:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   140001c3b:	48 39 c8             	cmp    rax,rcx
   140001c3e:	0f 8f ab 00 00 00    	jg     140001cef <_pei386_runtime_relocator+0x36f>
   140001c44:	48 3d 00 00 00 80    	cmp    rax,0xffffffff80000000
   140001c4a:	0f 8c 9f 00 00 00    	jl     140001cef <_pei386_runtime_relocator+0x36f>
   140001c50:	4c 89 f9             	mov    rcx,r15
   140001c53:	4d 89 e5             	mov    r13,r12
   140001c56:	e8 b5 fb ff ff       	call   140001810 <mark_section_writable>
   140001c5b:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001c61:	4c 89 e2             	mov    rdx,r12
   140001c64:	4c 89 f9             	mov    rcx,r15
   140001c67:	e8 0c 0c 00 00       	call   140002878 <memcpy>
   140001c6c:	e9 46 fe ff ff       	jmp    140001ab7 <_pei386_runtime_relocator+0x137>
   140001c71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001c78:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
   140001c7c:	84 c0                	test   al,al
   140001c7e:	79 06                	jns    140001c86 <_pei386_runtime_relocator+0x306>
   140001c80:	48 0d 00 ff ff ff    	or     rax,0xffffffffffffff00
   140001c86:	4c 29 c0             	sub    rax,r8
   140001c89:	4c 01 c8             	add    rax,r9
   140001c8c:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001c92:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001c96:	75 0e                	jne    140001ca6 <_pei386_runtime_relocator+0x326>
   140001c98:	48 3d ff 00 00 00    	cmp    rax,0xff
   140001c9e:	7f 4f                	jg     140001cef <_pei386_runtime_relocator+0x36f>
   140001ca0:	48 83 f8 80          	cmp    rax,0xffffffffffffff80
   140001ca4:	7c 49                	jl     140001cef <_pei386_runtime_relocator+0x36f>
   140001ca6:	4c 89 f9             	mov    rcx,r15
   140001ca9:	4d 89 e5             	mov    r13,r12
   140001cac:	e8 5f fb ff ff       	call   140001810 <mark_section_writable>
   140001cb1:	41 b8 01 00 00 00    	mov    r8d,0x1
   140001cb7:	4c 89 e2             	mov    rdx,r12
   140001cba:	4c 89 f9             	mov    rcx,r15
   140001cbd:	e8 b6 0b 00 00       	call   140002878 <memcpy>
   140001cc2:	e9 f0 fd ff ff       	jmp    140001ab7 <_pei386_runtime_relocator+0x137>
   140001cc7:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   140001cca:	85 c9                	test   ecx,ecx
   140001ccc:	0f 85 56 fd ff ff    	jne    140001a28 <_pei386_runtime_relocator+0xa8>
   140001cd2:	48 83 c3 0c          	add    rbx,0xc
   140001cd6:	e9 38 fd ff ff       	jmp    140001a13 <_pei386_runtime_relocator+0x93>
   140001cdb:	48 8d 0d d6 25 00 00 	lea    rcx,[rip+0x25d6]        # 1400042b8 <.rdata+0xd8>
   140001ce2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   140001ce9:	00 
   140001cea:	e8 c1 fa ff ff       	call   1400017b0 <__report_error>
   140001cef:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140001cf4:	4d 89 f8             	mov    r8,r15
   140001cf7:	48 8d 0d ea 25 00 00 	lea    rcx,[rip+0x25ea]        # 1400042e8 <.rdata+0x108>
   140001cfe:	e8 ad fa ff ff       	call   1400017b0 <__report_error>
   140001d03:	48 8d 0d 76 25 00 00 	lea    rcx,[rip+0x2576]        # 140004280 <.rdata+0xa0>
   140001d0a:	e8 a1 fa ff ff       	call   1400017b0 <__report_error>
   140001d0f:	90                   	nop

0000000140001d10 <__mingw_raise_matherr>:
   140001d10:	48 83 ec 58          	sub    rsp,0x58
   140001d14:	48 8b 05 95 53 00 00 	mov    rax,QWORD PTR [rip+0x5395]        # 1400070b0 <stUserMathErr>
   140001d1b:	48 85 c0             	test   rax,rax
   140001d1e:	74 29                	je     140001d49 <__mingw_raise_matherr+0x39>
   140001d20:	f2 0f 10 84 24 80 00 	movsd  xmm0,QWORD PTR [rsp+0x80]
   140001d27:	00 00 
   140001d29:	66 0f 14 d3          	unpcklpd xmm2,xmm3
   140001d2d:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   140001d31:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001d36:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   140001d3b:	0f 11 54 24 30       	movups XMMWORD PTR [rsp+0x30],xmm2
   140001d40:	f2 0f 11 44 24 40    	movsd  QWORD PTR [rsp+0x40],xmm0
   140001d46:	ff d0                	call   rax
   140001d48:	90                   	nop
   140001d49:	48 83 c4 58          	add    rsp,0x58
   140001d4d:	c3                   	ret
   140001d4e:	66 90                	xchg   ax,ax

0000000140001d50 <__mingw_setusermatherr>:
   140001d50:	48 89 0d 59 53 00 00 	mov    QWORD PTR [rip+0x5359],rcx        # 1400070b0 <stUserMathErr>
   140001d57:	e9 24 0b 00 00       	jmp    140002880 <__setusermatherr>
   140001d5c:	90                   	nop
   140001d5d:	90                   	nop
   140001d5e:	90                   	nop
   140001d5f:	90                   	nop

0000000140001d60 <_gnu_exception_handler>:
   140001d60:	53                   	push   rbx
   140001d61:	48 83 ec 20          	sub    rsp,0x20
   140001d65:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001d68:	8b 02                	mov    eax,DWORD PTR [rdx]
   140001d6a:	48 89 cb             	mov    rbx,rcx
   140001d6d:	89 c1                	mov    ecx,eax
   140001d6f:	81 e1 ff ff ff 20    	and    ecx,0x20ffffff
   140001d75:	81 f9 43 43 47 20    	cmp    ecx,0x20474343
   140001d7b:	0f 84 8f 00 00 00    	je     140001e10 <_gnu_exception_handler+0xb0>
   140001d81:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140001d86:	77 47                	ja     140001dcf <_gnu_exception_handler+0x6f>
   140001d88:	3d 8b 00 00 c0       	cmp    eax,0xc000008b
   140001d8d:	76 61                	jbe    140001df0 <_gnu_exception_handler+0x90>
   140001d8f:	05 73 ff ff 3f       	add    eax,0x3fffff73
   140001d94:	83 f8 09             	cmp    eax,0x9
   140001d97:	77 6b                	ja     140001e04 <_gnu_exception_handler+0xa4>
   140001d99:	48 8d 15 a0 25 00 00 	lea    rdx,[rip+0x25a0]        # 140004340 <.rdata>
   140001da0:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001da4:	48 01 d0             	add    rax,rdx
   140001da7:	ff e0                	jmp    rax
   140001da9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001db0:	31 d2                	xor    edx,edx
   140001db2:	b9 08 00 00 00       	mov    ecx,0x8
   140001db7:	e8 9c 0a 00 00       	call   140002858 <signal>
   140001dbc:	48 83 f8 01          	cmp    rax,0x1
   140001dc0:	0f 84 3e 01 00 00    	je     140001f04 <_gnu_exception_handler+0x1a4>
   140001dc6:	48 85 c0             	test   rax,rax
   140001dc9:	0f 85 01 01 00 00    	jne    140001ed0 <_gnu_exception_handler+0x170>
   140001dcf:	48 8b 05 fa 52 00 00 	mov    rax,QWORD PTR [rip+0x52fa]        # 1400070d0 <__mingw_oldexcpt_handler>
   140001dd6:	48 85 c0             	test   rax,rax
   140001dd9:	74 45                	je     140001e20 <_gnu_exception_handler+0xc0>
   140001ddb:	48 89 d9             	mov    rcx,rbx
   140001dde:	48 83 c4 20          	add    rsp,0x20
   140001de2:	5b                   	pop    rbx
   140001de3:	48 ff e0             	rex.W jmp rax
   140001de6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140001ded:	00 00 00 
   140001df0:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   140001df5:	0f 84 a5 00 00 00    	je     140001ea0 <_gnu_exception_handler+0x140>
   140001dfb:	77 33                	ja     140001e30 <_gnu_exception_handler+0xd0>
   140001dfd:	3d 02 00 00 80       	cmp    eax,0x80000002
   140001e02:	75 cb                	jne    140001dcf <_gnu_exception_handler+0x6f>
   140001e04:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140001e09:	48 83 c4 20          	add    rsp,0x20
   140001e0d:	5b                   	pop    rbx
   140001e0e:	c3                   	ret
   140001e0f:	90                   	nop
   140001e10:	f6 42 04 01          	test   BYTE PTR [rdx+0x4],0x1
   140001e14:	0f 85 67 ff ff ff    	jne    140001d81 <_gnu_exception_handler+0x21>
   140001e1a:	eb e8                	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001e1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001e20:	31 c0                	xor    eax,eax
   140001e22:	48 83 c4 20          	add    rsp,0x20
   140001e26:	5b                   	pop    rbx
   140001e27:	c3                   	ret
   140001e28:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140001e2f:	00 
   140001e30:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140001e35:	74 cd                	je     140001e04 <_gnu_exception_handler+0xa4>
   140001e37:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   140001e3c:	75 91                	jne    140001dcf <_gnu_exception_handler+0x6f>
   140001e3e:	31 d2                	xor    edx,edx
   140001e40:	b9 04 00 00 00       	mov    ecx,0x4
   140001e45:	e8 0e 0a 00 00       	call   140002858 <signal>
   140001e4a:	48 83 f8 01          	cmp    rax,0x1
   140001e4e:	0f 84 9c 00 00 00    	je     140001ef0 <_gnu_exception_handler+0x190>
   140001e54:	48 85 c0             	test   rax,rax
   140001e57:	0f 84 72 ff ff ff    	je     140001dcf <_gnu_exception_handler+0x6f>
   140001e5d:	b9 04 00 00 00       	mov    ecx,0x4
   140001e62:	ff d0                	call   rax
   140001e64:	eb 9e                	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001e66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140001e6d:	00 00 00 
   140001e70:	31 d2                	xor    edx,edx
   140001e72:	b9 08 00 00 00       	mov    ecx,0x8
   140001e77:	e8 dc 09 00 00       	call   140002858 <signal>
   140001e7c:	48 83 f8 01          	cmp    rax,0x1
   140001e80:	0f 85 40 ff ff ff    	jne    140001dc6 <_gnu_exception_handler+0x66>
   140001e86:	ba 01 00 00 00       	mov    edx,0x1
   140001e8b:	b9 08 00 00 00       	mov    ecx,0x8
   140001e90:	e8 c3 09 00 00       	call   140002858 <signal>
   140001e95:	e9 6a ff ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001e9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001ea0:	31 d2                	xor    edx,edx
   140001ea2:	b9 0b 00 00 00       	mov    ecx,0xb
   140001ea7:	e8 ac 09 00 00       	call   140002858 <signal>
   140001eac:	48 83 f8 01          	cmp    rax,0x1
   140001eb0:	74 2a                	je     140001edc <_gnu_exception_handler+0x17c>
   140001eb2:	48 85 c0             	test   rax,rax
   140001eb5:	0f 84 14 ff ff ff    	je     140001dcf <_gnu_exception_handler+0x6f>
   140001ebb:	b9 0b 00 00 00       	mov    ecx,0xb
   140001ec0:	ff d0                	call   rax
   140001ec2:	e9 3d ff ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001ec7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001ece:	00 00 
   140001ed0:	b9 08 00 00 00       	mov    ecx,0x8
   140001ed5:	ff d0                	call   rax
   140001ed7:	e9 28 ff ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001edc:	ba 01 00 00 00       	mov    edx,0x1
   140001ee1:	b9 0b 00 00 00       	mov    ecx,0xb
   140001ee6:	e8 6d 09 00 00       	call   140002858 <signal>
   140001eeb:	e9 14 ff ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001ef0:	ba 01 00 00 00       	mov    edx,0x1
   140001ef5:	b9 04 00 00 00       	mov    ecx,0x4
   140001efa:	e8 59 09 00 00       	call   140002858 <signal>
   140001eff:	e9 00 ff ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001f04:	ba 01 00 00 00       	mov    edx,0x1
   140001f09:	b9 08 00 00 00       	mov    ecx,0x8
   140001f0e:	e8 45 09 00 00       	call   140002858 <signal>
   140001f13:	e8 a8 02 00 00       	call   1400021c0 <_fpreset>
   140001f18:	e9 e7 fe ff ff       	jmp    140001e04 <_gnu_exception_handler+0xa4>
   140001f1d:	90                   	nop
   140001f1e:	90                   	nop
   140001f1f:	90                   	nop

0000000140001f20 <__mingwthr_run_key_dtors.part.0>:
   140001f20:	55                   	push   rbp
   140001f21:	57                   	push   rdi
   140001f22:	56                   	push   rsi
   140001f23:	53                   	push   rbx
   140001f24:	48 83 ec 28          	sub    rsp,0x28
   140001f28:	48 8d 0d d1 51 00 00 	lea    rcx,[rip+0x51d1]        # 140007100 <__mingwthr_cs>
   140001f2f:	ff 15 3b 63 00 00    	call   QWORD PTR [rip+0x633b]        # 140008270 <__imp_EnterCriticalSection>
   140001f35:	48 8b 1d a4 51 00 00 	mov    rbx,QWORD PTR [rip+0x51a4]        # 1400070e0 <key_dtor_list>
   140001f3c:	48 85 db             	test   rbx,rbx
   140001f3f:	74 33                	je     140001f74 <__mingwthr_run_key_dtors.part.0+0x54>
   140001f41:	48 8b 2d 58 63 00 00 	mov    rbp,QWORD PTR [rip+0x6358]        # 1400082a0 <__imp_TlsGetValue>
   140001f48:	48 8b 3d 29 63 00 00 	mov    rdi,QWORD PTR [rip+0x6329]        # 140008278 <__imp_GetLastError>
   140001f4f:	90                   	nop
   140001f50:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140001f52:	ff d5                	call   rbp
   140001f54:	48 89 c6             	mov    rsi,rax
   140001f57:	ff d7                	call   rdi
   140001f59:	48 85 f6             	test   rsi,rsi
   140001f5c:	74 0d                	je     140001f6b <__mingwthr_run_key_dtors.part.0+0x4b>
   140001f5e:	85 c0                	test   eax,eax
   140001f60:	75 09                	jne    140001f6b <__mingwthr_run_key_dtors.part.0+0x4b>
   140001f62:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140001f66:	48 89 f1             	mov    rcx,rsi
   140001f69:	ff d0                	call   rax
   140001f6b:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   140001f6f:	48 85 db             	test   rbx,rbx
   140001f72:	75 dc                	jne    140001f50 <__mingwthr_run_key_dtors.part.0+0x30>
   140001f74:	48 8d 0d 85 51 00 00 	lea    rcx,[rip+0x5185]        # 140007100 <__mingwthr_cs>
   140001f7b:	48 83 c4 28          	add    rsp,0x28
   140001f7f:	5b                   	pop    rbx
   140001f80:	5e                   	pop    rsi
   140001f81:	5f                   	pop    rdi
   140001f82:	5d                   	pop    rbp
   140001f83:	48 ff 25 fe 62 00 00 	rex.W jmp QWORD PTR [rip+0x62fe]        # 140008288 <__imp_LeaveCriticalSection>
   140001f8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140001f90 <___w64_mingwthr_add_key_dtor>:
   140001f90:	48 83 ec 38          	sub    rsp,0x38
   140001f94:	8b 05 4e 51 00 00    	mov    eax,DWORD PTR [rip+0x514e]        # 1400070e8 <__mingwthr_cs_init>
   140001f9a:	41 89 c9             	mov    r9d,ecx
   140001f9d:	85 c0                	test   eax,eax
   140001f9f:	75 0f                	jne    140001fb0 <___w64_mingwthr_add_key_dtor+0x20>
   140001fa1:	31 c0                	xor    eax,eax
   140001fa3:	48 83 c4 38          	add    rsp,0x38
   140001fa7:	c3                   	ret
   140001fa8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140001faf:	00 
   140001fb0:	48 89 54 24 48       	mov    QWORD PTR [rsp+0x48],rdx
   140001fb5:	b9 01 00 00 00       	mov    ecx,0x1
   140001fba:	ba 18 00 00 00       	mov    edx,0x18
   140001fbf:	44 89 4c 24 40       	mov    DWORD PTR [rsp+0x40],r9d
   140001fc4:	e8 df 08 00 00       	call   1400028a8 <calloc>
   140001fc9:	48 85 c0             	test   rax,rax
   140001fcc:	74 49                	je     140002017 <___w64_mingwthr_add_key_dtor+0x87>
   140001fce:	44 8b 4c 24 40       	mov    r9d,DWORD PTR [rsp+0x40]
   140001fd3:	4c 8b 44 24 48       	mov    r8,QWORD PTR [rsp+0x48]
   140001fd8:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140001fdd:	48 8d 0d 1c 51 00 00 	lea    rcx,[rip+0x511c]        # 140007100 <__mingwthr_cs>
   140001fe4:	44 89 08             	mov    DWORD PTR [rax],r9d
   140001fe7:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
   140001feb:	ff 15 7f 62 00 00    	call   QWORD PTR [rip+0x627f]        # 140008270 <__imp_EnterCriticalSection>
   140001ff1:	48 8b 15 e8 50 00 00 	mov    rdx,QWORD PTR [rip+0x50e8]        # 1400070e0 <key_dtor_list>
   140001ff8:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140001ffd:	48 8d 0d fc 50 00 00 	lea    rcx,[rip+0x50fc]        # 140007100 <__mingwthr_cs>
   140002004:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   140002008:	48 89 05 d1 50 00 00 	mov    QWORD PTR [rip+0x50d1],rax        # 1400070e0 <key_dtor_list>
   14000200f:	ff 15 73 62 00 00    	call   QWORD PTR [rip+0x6273]        # 140008288 <__imp_LeaveCriticalSection>
   140002015:	eb 8a                	jmp    140001fa1 <___w64_mingwthr_add_key_dtor+0x11>
   140002017:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000201c:	eb 85                	jmp    140001fa3 <___w64_mingwthr_add_key_dtor+0x13>
   14000201e:	66 90                	xchg   ax,ax

0000000140002020 <___w64_mingwthr_remove_key_dtor>:
   140002020:	48 83 ec 28          	sub    rsp,0x28
   140002024:	8b 05 be 50 00 00    	mov    eax,DWORD PTR [rip+0x50be]        # 1400070e8 <__mingwthr_cs_init>
   14000202a:	85 c0                	test   eax,eax
   14000202c:	75 0a                	jne    140002038 <___w64_mingwthr_remove_key_dtor+0x18>
   14000202e:	31 c0                	xor    eax,eax
   140002030:	48 83 c4 28          	add    rsp,0x28
   140002034:	c3                   	ret
   140002035:	0f 1f 00             	nop    DWORD PTR [rax]
   140002038:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14000203c:	48 8d 0d bd 50 00 00 	lea    rcx,[rip+0x50bd]        # 140007100 <__mingwthr_cs>
   140002043:	ff 15 27 62 00 00    	call   QWORD PTR [rip+0x6227]        # 140008270 <__imp_EnterCriticalSection>
   140002049:	48 8b 0d 90 50 00 00 	mov    rcx,QWORD PTR [rip+0x5090]        # 1400070e0 <key_dtor_list>
   140002050:	48 85 c9             	test   rcx,rcx
   140002053:	74 2e                	je     140002083 <___w64_mingwthr_remove_key_dtor+0x63>
   140002055:	8b 54 24 30          	mov    edx,DWORD PTR [rsp+0x30]
   140002059:	45 31 c0             	xor    r8d,r8d
   14000205c:	eb 0d                	jmp    14000206b <___w64_mingwthr_remove_key_dtor+0x4b>
   14000205e:	66 90                	xchg   ax,ax
   140002060:	49 89 c8             	mov    r8,rcx
   140002063:	48 85 c0             	test   rax,rax
   140002066:	74 1b                	je     140002083 <___w64_mingwthr_remove_key_dtor+0x63>
   140002068:	48 89 c1             	mov    rcx,rax
   14000206b:	8b 01                	mov    eax,DWORD PTR [rcx]
   14000206d:	39 d0                	cmp    eax,edx
   14000206f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140002073:	75 eb                	jne    140002060 <___w64_mingwthr_remove_key_dtor+0x40>
   140002075:	4d 85 c0             	test   r8,r8
   140002078:	74 26                	je     1400020a0 <___w64_mingwthr_remove_key_dtor+0x80>
   14000207a:	49 89 40 10          	mov    QWORD PTR [r8+0x10],rax
   14000207e:	e8 2d 08 00 00       	call   1400028b0 <free>
   140002083:	48 8d 0d 76 50 00 00 	lea    rcx,[rip+0x5076]        # 140007100 <__mingwthr_cs>
   14000208a:	ff 15 f8 61 00 00    	call   QWORD PTR [rip+0x61f8]        # 140008288 <__imp_LeaveCriticalSection>
   140002090:	31 c0                	xor    eax,eax
   140002092:	48 83 c4 28          	add    rsp,0x28
   140002096:	c3                   	ret
   140002097:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000209e:	00 00 
   1400020a0:	48 89 05 39 50 00 00 	mov    QWORD PTR [rip+0x5039],rax        # 1400070e0 <key_dtor_list>
   1400020a7:	eb d5                	jmp    14000207e <___w64_mingwthr_remove_key_dtor+0x5e>
   1400020a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000001400020b0 <__mingw_TLScallback>:
   1400020b0:	48 83 ec 38          	sub    rsp,0x38
   1400020b4:	83 fa 02             	cmp    edx,0x2
   1400020b7:	0f 84 bb 00 00 00    	je     140002178 <__mingw_TLScallback+0xc8>
   1400020bd:	77 29                	ja     1400020e8 <__mingw_TLScallback+0x38>
   1400020bf:	85 d2                	test   edx,edx
   1400020c1:	74 3d                	je     140002100 <__mingw_TLScallback+0x50>
   1400020c3:	8b 05 1f 50 00 00    	mov    eax,DWORD PTR [rip+0x501f]        # 1400070e8 <__mingwthr_cs_init>
   1400020c9:	85 c0                	test   eax,eax
   1400020cb:	0f 84 cf 00 00 00    	je     1400021a0 <__mingw_TLScallback+0xf0>
   1400020d1:	c7 05 0d 50 00 00 01 	mov    DWORD PTR [rip+0x500d],0x1        # 1400070e8 <__mingwthr_cs_init>
   1400020d8:	00 00 00 
   1400020db:	b8 01 00 00 00       	mov    eax,0x1
   1400020e0:	48 83 c4 38          	add    rsp,0x38
   1400020e4:	c3                   	ret
   1400020e5:	0f 1f 00             	nop    DWORD PTR [rax]
   1400020e8:	83 fa 03             	cmp    edx,0x3
   1400020eb:	75 ee                	jne    1400020db <__mingw_TLScallback+0x2b>
   1400020ed:	8b 05 f5 4f 00 00    	mov    eax,DWORD PTR [rip+0x4ff5]        # 1400070e8 <__mingwthr_cs_init>
   1400020f3:	85 c0                	test   eax,eax
   1400020f5:	74 e4                	je     1400020db <__mingw_TLScallback+0x2b>
   1400020f7:	e8 24 fe ff ff       	call   140001f20 <__mingwthr_run_key_dtors.part.0>
   1400020fc:	eb dd                	jmp    1400020db <__mingw_TLScallback+0x2b>
   1400020fe:	66 90                	xchg   ax,ax
   140002100:	8b 05 e2 4f 00 00    	mov    eax,DWORD PTR [rip+0x4fe2]        # 1400070e8 <__mingwthr_cs_init>
   140002106:	85 c0                	test   eax,eax
   140002108:	0f 85 82 00 00 00    	jne    140002190 <__mingw_TLScallback+0xe0>
   14000210e:	8b 05 d4 4f 00 00    	mov    eax,DWORD PTR [rip+0x4fd4]        # 1400070e8 <__mingwthr_cs_init>
   140002114:	83 f8 01             	cmp    eax,0x1
   140002117:	75 c2                	jne    1400020db <__mingw_TLScallback+0x2b>
   140002119:	48 8b 05 c0 4f 00 00 	mov    rax,QWORD PTR [rip+0x4fc0]        # 1400070e0 <key_dtor_list>
   140002120:	48 85 c0             	test   rax,rax
   140002123:	74 26                	je     14000214b <__mingw_TLScallback+0x9b>
   140002125:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000212c:	00 00 00 00 
   140002130:	48 89 c1             	mov    rcx,rax
   140002133:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140002137:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   14000213c:	e8 6f 07 00 00       	call   1400028b0 <free>
   140002141:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002146:	48 85 c0             	test   rax,rax
   140002149:	75 e5                	jne    140002130 <__mingw_TLScallback+0x80>
   14000214b:	48 8d 0d ae 4f 00 00 	lea    rcx,[rip+0x4fae]        # 140007100 <__mingwthr_cs>
   140002152:	48 c7 05 83 4f 00 00 	mov    QWORD PTR [rip+0x4f83],0x0        # 1400070e0 <key_dtor_list>
   140002159:	00 00 00 00 
   14000215d:	c7 05 81 4f 00 00 00 	mov    DWORD PTR [rip+0x4f81],0x0        # 1400070e8 <__mingwthr_cs_init>
   140002164:	00 00 00 
   140002167:	ff 15 fb 60 00 00    	call   QWORD PTR [rip+0x60fb]        # 140008268 <__IAT_start__>
   14000216d:	e9 69 ff ff ff       	jmp    1400020db <__mingw_TLScallback+0x2b>
   140002172:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002178:	e8 43 00 00 00       	call   1400021c0 <_fpreset>
   14000217d:	b8 01 00 00 00       	mov    eax,0x1
   140002182:	48 83 c4 38          	add    rsp,0x38
   140002186:	c3                   	ret
   140002187:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000218e:	00 00 
   140002190:	e8 8b fd ff ff       	call   140001f20 <__mingwthr_run_key_dtors.part.0>
   140002195:	e9 74 ff ff ff       	jmp    14000210e <__mingw_TLScallback+0x5e>
   14000219a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400021a0:	48 8d 0d 59 4f 00 00 	lea    rcx,[rip+0x4f59]        # 140007100 <__mingwthr_cs>
   1400021a7:	ff 15 d3 60 00 00    	call   QWORD PTR [rip+0x60d3]        # 140008280 <__imp_InitializeCriticalSection>
   1400021ad:	e9 1f ff ff ff       	jmp    1400020d1 <__mingw_TLScallback+0x21>
   1400021b2:	90                   	nop
   1400021b3:	90                   	nop
   1400021b4:	90                   	nop
   1400021b5:	90                   	nop
   1400021b6:	90                   	nop
   1400021b7:	90                   	nop
   1400021b8:	90                   	nop
   1400021b9:	90                   	nop
   1400021ba:	90                   	nop
   1400021bb:	90                   	nop
   1400021bc:	90                   	nop
   1400021bd:	90                   	nop
   1400021be:	90                   	nop
   1400021bf:	90                   	nop

00000001400021c0 <_fpreset>:
   1400021c0:	db e3                	fninit
   1400021c2:	c3                   	ret
   1400021c3:	90                   	nop
   1400021c4:	90                   	nop
   1400021c5:	90                   	nop
   1400021c6:	90                   	nop
   1400021c7:	90                   	nop
   1400021c8:	90                   	nop
   1400021c9:	90                   	nop
   1400021ca:	90                   	nop
   1400021cb:	90                   	nop
   1400021cc:	90                   	nop
   1400021cd:	90                   	nop
   1400021ce:	90                   	nop
   1400021cf:	90                   	nop

00000001400021d0 <_ValidateImageBase>:
   1400021d0:	31 c0                	xor    eax,eax
   1400021d2:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   1400021d7:	75 0f                	jne    1400021e8 <_ValidateImageBase+0x18>
   1400021d9:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400021dd:	48 01 d1             	add    rcx,rdx
   1400021e0:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400021e6:	74 08                	je     1400021f0 <_ValidateImageBase+0x20>
   1400021e8:	c3                   	ret
   1400021e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400021f0:	31 c0                	xor    eax,eax
   1400021f2:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   1400021f8:	0f 94 c0             	sete   al
   1400021fb:	c3                   	ret
   1400021fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140002200 <_FindPESection>:
   140002200:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   140002204:	48 01 c8             	add    rax,rcx
   140002207:	0f b7 48 06          	movzx  ecx,WORD PTR [rax+0x6]
   14000220b:	66 85 c9             	test   cx,cx
   14000220e:	74 3d                	je     14000224d <_FindPESection+0x4d>
   140002210:	44 0f b7 40 14       	movzx  r8d,WORD PTR [rax+0x14]
   140002215:	83 e9 01             	sub    ecx,0x1
   140002218:	48 8d 0c 89          	lea    rcx,[rcx+rcx*4]
   14000221c:	4a 8d 44 00 18       	lea    rax,[rax+r8*1+0x18]
   140002221:	4c 8d 4c c8 28       	lea    r9,[rax+rcx*8+0x28]
   140002226:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000222d:	00 00 00 
   140002230:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002234:	4c 89 c1             	mov    rcx,r8
   140002237:	4c 39 c2             	cmp    rdx,r8
   14000223a:	72 08                	jb     140002244 <_FindPESection+0x44>
   14000223c:	03 48 08             	add    ecx,DWORD PTR [rax+0x8]
   14000223f:	48 39 ca             	cmp    rdx,rcx
   140002242:	72 0b                	jb     14000224f <_FindPESection+0x4f>
   140002244:	48 83 c0 28          	add    rax,0x28
   140002248:	4c 39 c8             	cmp    rax,r9
   14000224b:	75 e3                	jne    140002230 <_FindPESection+0x30>
   14000224d:	31 c0                	xor    eax,eax
   14000224f:	c3                   	ret

0000000140002250 <_FindPESectionByName>:
   140002250:	55                   	push   rbp
   140002251:	57                   	push   rdi
   140002252:	56                   	push   rsi
   140002253:	53                   	push   rbx
   140002254:	48 83 ec 28          	sub    rsp,0x28
   140002258:	48 89 cf             	mov    rdi,rcx
   14000225b:	e8 48 05 00 00       	call   1400027a8 <strlen>
   140002260:	48 83 f8 08          	cmp    rax,0x8
   140002264:	77 0e                	ja     140002274 <_FindPESectionByName+0x24>
   140002266:	48 8b 05 53 21 00 00 	mov    rax,QWORD PTR [rip+0x2153]        # 1400043c0 <.refptr.__ImageBase>
   14000226d:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   140002272:	74 14                	je     140002288 <_FindPESectionByName+0x38>
   140002274:	31 db                	xor    ebx,ebx
   140002276:	48 89 d8             	mov    rax,rbx
   140002279:	48 83 c4 28          	add    rsp,0x28
   14000227d:	5b                   	pop    rbx
   14000227e:	5e                   	pop    rsi
   14000227f:	5f                   	pop    rdi
   140002280:	5d                   	pop    rbp
   140002281:	c3                   	ret
   140002282:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002288:	48 63 68 3c          	movsxd rbp,DWORD PTR [rax+0x3c]
   14000228c:	48 01 c5             	add    rbp,rax
   14000228f:	81 7d 00 50 45 00 00 	cmp    DWORD PTR [rbp+0x0],0x4550
   140002296:	75 dc                	jne    140002274 <_FindPESectionByName+0x24>
   140002298:	66 81 7d 18 0b 02    	cmp    WORD PTR [rbp+0x18],0x20b
   14000229e:	75 d4                	jne    140002274 <_FindPESectionByName+0x24>
   1400022a0:	66 83 7d 06 00       	cmp    WORD PTR [rbp+0x6],0x0
   1400022a5:	74 cd                	je     140002274 <_FindPESectionByName+0x24>
   1400022a7:	0f b7 45 14          	movzx  eax,WORD PTR [rbp+0x14]
   1400022ab:	31 f6                	xor    esi,esi
   1400022ad:	48 8d 5c 05 18       	lea    rbx,[rbp+rax*1+0x18]
   1400022b2:	0f 1f 00             	nop    DWORD PTR [rax]
   1400022b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400022bc:	00 00 00 00 
   1400022c0:	41 b8 08 00 00 00    	mov    r8d,0x8
   1400022c6:	48 89 fa             	mov    rdx,rdi
   1400022c9:	48 89 d9             	mov    rcx,rbx
   1400022cc:	e8 df 04 00 00       	call   1400027b0 <strncmp>
   1400022d1:	85 c0                	test   eax,eax
   1400022d3:	74 a1                	je     140002276 <_FindPESectionByName+0x26>
   1400022d5:	0f b7 45 06          	movzx  eax,WORD PTR [rbp+0x6]
   1400022d9:	83 c6 01             	add    esi,0x1
   1400022dc:	48 83 c3 28          	add    rbx,0x28
   1400022e0:	39 c6                	cmp    esi,eax
   1400022e2:	72 dc                	jb     1400022c0 <_FindPESectionByName+0x70>
   1400022e4:	eb 8e                	jmp    140002274 <_FindPESectionByName+0x24>
   1400022e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400022ed:	00 00 00 

00000001400022f0 <__mingw_GetSectionForAddress>:
   1400022f0:	48 8b 15 c9 20 00 00 	mov    rdx,QWORD PTR [rip+0x20c9]        # 1400043c0 <.refptr.__ImageBase>
   1400022f7:	31 c0                	xor    eax,eax
   1400022f9:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   1400022fe:	75 10                	jne    140002310 <__mingw_GetSectionForAddress+0x20>
   140002300:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   140002304:	49 01 d0             	add    r8,rdx
   140002307:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   14000230e:	74 08                	je     140002318 <__mingw_GetSectionForAddress+0x28>
   140002310:	c3                   	ret
   140002311:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002318:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   14000231f:	75 ef                	jne    140002310 <__mingw_GetSectionForAddress+0x20>
   140002321:	45 0f b7 48 06       	movzx  r9d,WORD PTR [r8+0x6]
   140002326:	66 45 85 c9          	test   r9w,r9w
   14000232a:	74 e4                	je     140002310 <__mingw_GetSectionForAddress+0x20>
   14000232c:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   140002331:	48 29 d1             	sub    rcx,rdx
   140002334:	41 8d 51 ff          	lea    edx,[r9-0x1]
   140002338:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   14000233c:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   140002341:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002346:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000234d:	00 00 00 
   140002350:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002354:	4c 89 c2             	mov    rdx,r8
   140002357:	4c 39 c1             	cmp    rcx,r8
   14000235a:	72 08                	jb     140002364 <__mingw_GetSectionForAddress+0x74>
   14000235c:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   14000235f:	48 39 d1             	cmp    rcx,rdx
   140002362:	72 ac                	jb     140002310 <__mingw_GetSectionForAddress+0x20>
   140002364:	48 83 c0 28          	add    rax,0x28
   140002368:	4c 39 c8             	cmp    rax,r9
   14000236b:	75 e3                	jne    140002350 <__mingw_GetSectionForAddress+0x60>
   14000236d:	31 c0                	xor    eax,eax
   14000236f:	c3                   	ret

0000000140002370 <__mingw_GetSectionCount>:
   140002370:	48 8b 05 49 20 00 00 	mov    rax,QWORD PTR [rip+0x2049]        # 1400043c0 <.refptr.__ImageBase>
   140002377:	31 c9                	xor    ecx,ecx
   140002379:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000237e:	75 0f                	jne    14000238f <__mingw_GetSectionCount+0x1f>
   140002380:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002384:	48 01 d0             	add    rax,rdx
   140002387:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   14000238d:	74 09                	je     140002398 <__mingw_GetSectionCount+0x28>
   14000238f:	89 c8                	mov    eax,ecx
   140002391:	c3                   	ret
   140002392:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002398:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000239e:	75 ef                	jne    14000238f <__mingw_GetSectionCount+0x1f>
   1400023a0:	0f b7 48 06          	movzx  ecx,WORD PTR [rax+0x6]
   1400023a4:	89 c8                	mov    eax,ecx
   1400023a6:	c3                   	ret
   1400023a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400023ae:	00 00 

00000001400023b0 <_FindPESectionExec>:
   1400023b0:	4c 8b 05 09 20 00 00 	mov    r8,QWORD PTR [rip+0x2009]        # 1400043c0 <.refptr.__ImageBase>
   1400023b7:	31 c0                	xor    eax,eax
   1400023b9:	66 41 81 38 4d 5a    	cmp    WORD PTR [r8],0x5a4d
   1400023bf:	75 0f                	jne    1400023d0 <_FindPESectionExec+0x20>
   1400023c1:	49 63 50 3c          	movsxd rdx,DWORD PTR [r8+0x3c]
   1400023c5:	4c 01 c2             	add    rdx,r8
   1400023c8:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   1400023ce:	74 08                	je     1400023d8 <_FindPESectionExec+0x28>
   1400023d0:	c3                   	ret
   1400023d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400023d8:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   1400023de:	75 f0                	jne    1400023d0 <_FindPESectionExec+0x20>
   1400023e0:	44 0f b7 42 06       	movzx  r8d,WORD PTR [rdx+0x6]
   1400023e5:	66 45 85 c0          	test   r8w,r8w
   1400023e9:	74 e5                	je     1400023d0 <_FindPESectionExec+0x20>
   1400023eb:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   1400023ef:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   1400023f4:	41 8d 50 ff          	lea    edx,[r8-0x1]
   1400023f8:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400023fc:	48 8d 54 d0 28       	lea    rdx,[rax+rdx*8+0x28]
   140002401:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002405:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000240c:	00 00 00 00 
   140002410:	f6 40 27 20          	test   BYTE PTR [rax+0x27],0x20
   140002414:	74 09                	je     14000241f <_FindPESectionExec+0x6f>
   140002416:	48 85 c9             	test   rcx,rcx
   140002419:	74 b5                	je     1400023d0 <_FindPESectionExec+0x20>
   14000241b:	48 83 e9 01          	sub    rcx,0x1
   14000241f:	48 83 c0 28          	add    rax,0x28
   140002423:	48 39 c2             	cmp    rdx,rax
   140002426:	75 e8                	jne    140002410 <_FindPESectionExec+0x60>
   140002428:	31 c0                	xor    eax,eax
   14000242a:	c3                   	ret
   14000242b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000140002430 <_GetPEImageBase>:
   140002430:	48 8b 05 89 1f 00 00 	mov    rax,QWORD PTR [rip+0x1f89]        # 1400043c0 <.refptr.__ImageBase>
   140002437:	31 d2                	xor    edx,edx
   140002439:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000243e:	75 0f                	jne    14000244f <_GetPEImageBase+0x1f>
   140002440:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   140002444:	48 01 c1             	add    rcx,rax
   140002447:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   14000244d:	74 09                	je     140002458 <_GetPEImageBase+0x28>
   14000244f:	48 89 d0             	mov    rax,rdx
   140002452:	c3                   	ret
   140002453:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002458:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   14000245e:	48 0f 44 d0          	cmove  rdx,rax
   140002462:	48 89 d0             	mov    rax,rdx
   140002465:	c3                   	ret
   140002466:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000246d:	00 00 00 

0000000140002470 <_IsNonwritableInCurrentImage>:
   140002470:	48 8b 15 49 1f 00 00 	mov    rdx,QWORD PTR [rip+0x1f49]        # 1400043c0 <.refptr.__ImageBase>
   140002477:	31 c0                	xor    eax,eax
   140002479:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   14000247e:	75 10                	jne    140002490 <_IsNonwritableInCurrentImage+0x20>
   140002480:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   140002484:	49 01 d0             	add    r8,rdx
   140002487:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   14000248e:	74 08                	je     140002498 <_IsNonwritableInCurrentImage+0x28>
   140002490:	c3                   	ret
   140002491:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002498:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   14000249f:	75 ef                	jne    140002490 <_IsNonwritableInCurrentImage+0x20>
   1400024a1:	45 0f b7 48 06       	movzx  r9d,WORD PTR [r8+0x6]
   1400024a6:	66 45 85 c9          	test   r9w,r9w
   1400024aa:	74 e4                	je     140002490 <_IsNonwritableInCurrentImage+0x20>
   1400024ac:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   1400024b1:	48 29 d1             	sub    rcx,rdx
   1400024b4:	41 8d 51 ff          	lea    edx,[r9-0x1]
   1400024b8:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400024bc:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   1400024c1:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   1400024c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400024cd:	00 00 00 
   1400024d0:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   1400024d4:	4c 89 c2             	mov    rdx,r8
   1400024d7:	4c 39 c1             	cmp    rcx,r8
   1400024da:	72 08                	jb     1400024e4 <_IsNonwritableInCurrentImage+0x74>
   1400024dc:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   1400024df:	48 39 d1             	cmp    rcx,rdx
   1400024e2:	72 0c                	jb     1400024f0 <_IsNonwritableInCurrentImage+0x80>
   1400024e4:	48 83 c0 28          	add    rax,0x28
   1400024e8:	49 39 c1             	cmp    r9,rax
   1400024eb:	75 e3                	jne    1400024d0 <_IsNonwritableInCurrentImage+0x60>
   1400024ed:	31 c0                	xor    eax,eax
   1400024ef:	c3                   	ret
   1400024f0:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   1400024f3:	f7 d0                	not    eax
   1400024f5:	c1 e8 1f             	shr    eax,0x1f
   1400024f8:	c3                   	ret
   1400024f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000140002500 <__mingw_enum_import_library_names>:
   140002500:	4c 8b 1d b9 1e 00 00 	mov    r11,QWORD PTR [rip+0x1eb9]        # 1400043c0 <.refptr.__ImageBase>
   140002507:	45 31 c0             	xor    r8d,r8d
   14000250a:	66 41 81 3b 4d 5a    	cmp    WORD PTR [r11],0x5a4d
   140002510:	75 0f                	jne    140002521 <__mingw_enum_import_library_names+0x21>
   140002512:	49 63 53 3c          	movsxd rdx,DWORD PTR [r11+0x3c]
   140002516:	4c 01 da             	add    rdx,r11
   140002519:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   14000251f:	74 07                	je     140002528 <__mingw_enum_import_library_names+0x28>
   140002521:	4c 89 c0             	mov    rax,r8
   140002524:	c3                   	ret
   140002525:	0f 1f 00             	nop    DWORD PTR [rax]
   140002528:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   14000252e:	75 f1                	jne    140002521 <__mingw_enum_import_library_names+0x21>
   140002530:	8b 82 90 00 00 00    	mov    eax,DWORD PTR [rdx+0x90]
   140002536:	85 c0                	test   eax,eax
   140002538:	74 e7                	je     140002521 <__mingw_enum_import_library_names+0x21>
   14000253a:	44 0f b7 4a 06       	movzx  r9d,WORD PTR [rdx+0x6]
   14000253f:	66 45 85 c9          	test   r9w,r9w
   140002543:	74 dc                	je     140002521 <__mingw_enum_import_library_names+0x21>
   140002545:	44 0f b7 42 14       	movzx  r8d,WORD PTR [rdx+0x14]
   14000254a:	4a 8d 54 02 18       	lea    rdx,[rdx+r8*1+0x18]
   14000254f:	45 8d 41 ff          	lea    r8d,[r9-0x1]
   140002553:	4f 8d 04 80          	lea    r8,[r8+r8*4]
   140002557:	4e 8d 54 c2 28       	lea    r10,[rdx+r8*8+0x28]
   14000255c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002560:	44 8b 4a 0c          	mov    r9d,DWORD PTR [rdx+0xc]
   140002564:	4d 89 c8             	mov    r8,r9
   140002567:	4c 39 c8             	cmp    rax,r9
   14000256a:	72 09                	jb     140002575 <__mingw_enum_import_library_names+0x75>
   14000256c:	44 03 42 08          	add    r8d,DWORD PTR [rdx+0x8]
   140002570:	4c 39 c0             	cmp    rax,r8
   140002573:	72 13                	jb     140002588 <__mingw_enum_import_library_names+0x88>
   140002575:	48 83 c2 28          	add    rdx,0x28
   140002579:	49 39 d2             	cmp    r10,rdx
   14000257c:	75 e2                	jne    140002560 <__mingw_enum_import_library_names+0x60>
   14000257e:	45 31 c0             	xor    r8d,r8d
   140002581:	4c 89 c0             	mov    rax,r8
   140002584:	c3                   	ret
   140002585:	0f 1f 00             	nop    DWORD PTR [rax]
   140002588:	4c 01 d8             	add    rax,r11
   14000258b:	eb 0a                	jmp    140002597 <__mingw_enum_import_library_names+0x97>
   14000258d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002590:	83 e9 01             	sub    ecx,0x1
   140002593:	48 83 c0 14          	add    rax,0x14
   140002597:	44 8b 40 04          	mov    r8d,DWORD PTR [rax+0x4]
   14000259b:	45 85 c0             	test   r8d,r8d
   14000259e:	75 07                	jne    1400025a7 <__mingw_enum_import_library_names+0xa7>
   1400025a0:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   1400025a3:	85 d2                	test   edx,edx
   1400025a5:	74 d7                	je     14000257e <__mingw_enum_import_library_names+0x7e>
   1400025a7:	85 c9                	test   ecx,ecx
   1400025a9:	7f e5                	jg     140002590 <__mingw_enum_import_library_names+0x90>
   1400025ab:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   1400025af:	4d 01 d8             	add    r8,r11
   1400025b2:	4c 89 c0             	mov    rax,r8
   1400025b5:	c3                   	ret
   1400025b6:	90                   	nop
   1400025b7:	90                   	nop
   1400025b8:	90                   	nop
   1400025b9:	90                   	nop
   1400025ba:	90                   	nop
   1400025bb:	90                   	nop
   1400025bc:	90                   	nop
   1400025bd:	90                   	nop
   1400025be:	90                   	nop
   1400025bf:	90                   	nop

00000001400025c0 <___chkstk_ms>:
   1400025c0:	51                   	push   rcx
   1400025c1:	50                   	push   rax
   1400025c2:	48 3d 00 10 00 00    	cmp    rax,0x1000
   1400025c8:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   1400025cd:	72 19                	jb     1400025e8 <___chkstk_ms+0x28>
   1400025cf:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   1400025d6:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   1400025da:	48 2d 00 10 00 00    	sub    rax,0x1000
   1400025e0:	48 3d 00 10 00 00    	cmp    rax,0x1000
   1400025e6:	77 e7                	ja     1400025cf <___chkstk_ms+0xf>
   1400025e8:	48 29 c1             	sub    rcx,rax
   1400025eb:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   1400025ef:	58                   	pop    rax
   1400025f0:	59                   	pop    rcx
   1400025f1:	c3                   	ret
   1400025f2:	90                   	nop
   1400025f3:	90                   	nop
   1400025f4:	90                   	nop
   1400025f5:	90                   	nop
   1400025f6:	90                   	nop
   1400025f7:	90                   	nop
   1400025f8:	90                   	nop
   1400025f9:	90                   	nop
   1400025fa:	90                   	nop
   1400025fb:	90                   	nop
   1400025fc:	90                   	nop
   1400025fd:	90                   	nop
   1400025fe:	90                   	nop
   1400025ff:	90                   	nop

0000000140002600 <vfprintf>:
   140002600:	57                   	push   rdi
   140002601:	56                   	push   rsi
   140002602:	53                   	push   rbx
   140002603:	48 83 ec 30          	sub    rsp,0x30
   140002607:	48 89 cb             	mov    rbx,rcx
   14000260a:	48 89 d6             	mov    rsi,rdx
   14000260d:	4c 89 c7             	mov    rdi,r8
   140002610:	e8 db 00 00 00       	call   1400026f0 <__local_stdio_printf_options>
   140002615:	45 31 c9             	xor    r9d,r9d
   140002618:	49 89 f0             	mov    r8,rsi
   14000261b:	48 89 da             	mov    rdx,rbx
   14000261e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140002621:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140002626:	e8 ad 01 00 00       	call   1400027d8 <__stdio_common_vfprintf>
   14000262b:	48 83 c4 30          	add    rsp,0x30
   14000262f:	5b                   	pop    rbx
   140002630:	5e                   	pop    rsi
   140002631:	5f                   	pop    rdi
   140002632:	c3                   	ret
   140002633:	90                   	nop
   140002634:	90                   	nop
   140002635:	90                   	nop
   140002636:	90                   	nop
   140002637:	90                   	nop
   140002638:	90                   	nop
   140002639:	90                   	nop
   14000263a:	90                   	nop
   14000263b:	90                   	nop
   14000263c:	90                   	nop
   14000263d:	90                   	nop
   14000263e:	90                   	nop
   14000263f:	90                   	nop

0000000140002640 <scanf>:
   140002640:	57                   	push   rdi
   140002641:	56                   	push   rsi
   140002642:	53                   	push   rbx
   140002643:	48 83 ec 40          	sub    rsp,0x40
   140002647:	48 89 cb             	mov    rbx,rcx
   14000264a:	48 8d 74 24 68       	lea    rsi,[rsp+0x68]
   14000264f:	31 c9                	xor    ecx,ecx
   140002651:	48 89 54 24 68       	mov    QWORD PTR [rsp+0x68],rdx
   140002656:	4c 89 44 24 70       	mov    QWORD PTR [rsp+0x70],r8
   14000265b:	4c 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],r9
   140002660:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   140002665:	e8 56 01 00 00       	call   1400027c0 <__acrt_iob_func>
   14000266a:	48 89 c7             	mov    rdi,rax
   14000266d:	e8 6e 00 00 00       	call   1400026e0 <__local_stdio_scanf_options>
   140002672:	45 31 c9             	xor    r9d,r9d
   140002675:	49 89 d8             	mov    r8,rbx
   140002678:	48 89 fa             	mov    rdx,rdi
   14000267b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14000267e:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140002683:	e8 58 01 00 00       	call   1400027e0 <__stdio_common_vfscanf>
   140002688:	48 83 c4 40          	add    rsp,0x40
   14000268c:	5b                   	pop    rbx
   14000268d:	5e                   	pop    rsi
   14000268e:	5f                   	pop    rdi
   14000268f:	c3                   	ret

0000000140002690 <fprintf>:
   140002690:	57                   	push   rdi
   140002691:	56                   	push   rsi
   140002692:	53                   	push   rbx
   140002693:	48 83 ec 40          	sub    rsp,0x40
   140002697:	48 8d 7c 24 70       	lea    rdi,[rsp+0x70]
   14000269c:	48 89 cb             	mov    rbx,rcx
   14000269f:	48 89 d6             	mov    rsi,rdx
   1400026a2:	4c 89 44 24 70       	mov    QWORD PTR [rsp+0x70],r8
   1400026a7:	4c 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],r9
   1400026ac:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   1400026b1:	e8 3a 00 00 00       	call   1400026f0 <__local_stdio_printf_options>
   1400026b6:	45 31 c9             	xor    r9d,r9d
   1400026b9:	49 89 f0             	mov    r8,rsi
   1400026bc:	48 89 da             	mov    rdx,rbx
   1400026bf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1400026c2:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   1400026c7:	e8 0c 01 00 00       	call   1400027d8 <__stdio_common_vfprintf>
   1400026cc:	48 83 c4 40          	add    rsp,0x40
   1400026d0:	5b                   	pop    rbx
   1400026d1:	5e                   	pop    rsi
   1400026d2:	5f                   	pop    rdi
   1400026d3:	c3                   	ret
   1400026d4:	90                   	nop
   1400026d5:	90                   	nop
   1400026d6:	90                   	nop
   1400026d7:	90                   	nop
   1400026d8:	90                   	nop
   1400026d9:	90                   	nop
   1400026da:	90                   	nop
   1400026db:	90                   	nop
   1400026dc:	90                   	nop
   1400026dd:	90                   	nop
   1400026de:	90                   	nop
   1400026df:	90                   	nop

00000001400026e0 <__local_stdio_scanf_options>:
   1400026e0:	48 8d 05 69 09 00 00 	lea    rax,[rip+0x969]        # 140003050 <options>
   1400026e7:	c3                   	ret
   1400026e8:	90                   	nop
   1400026e9:	90                   	nop
   1400026ea:	90                   	nop
   1400026eb:	90                   	nop
   1400026ec:	90                   	nop
   1400026ed:	90                   	nop
   1400026ee:	90                   	nop
   1400026ef:	90                   	nop

00000001400026f0 <__local_stdio_printf_options>:
   1400026f0:	48 8d 05 69 09 00 00 	lea    rax,[rip+0x969]        # 140003060 <options>
   1400026f7:	c3                   	ret
   1400026f8:	90                   	nop
   1400026f9:	90                   	nop
   1400026fa:	90                   	nop
   1400026fb:	90                   	nop
   1400026fc:	90                   	nop
   1400026fd:	90                   	nop
   1400026fe:	90                   	nop
   1400026ff:	90                   	nop

0000000140002700 <__p___initenv>:
   140002700:	48 8b 05 09 1d 00 00 	mov    rax,QWORD PTR [rip+0x1d09]        # 140004410 <.refptr.__imp___initenv>
   140002707:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000270a:	c3                   	ret
   14000270b:	90                   	nop
   14000270c:	90                   	nop
   14000270d:	90                   	nop
   14000270e:	90                   	nop
   14000270f:	90                   	nop

0000000140002710 <_amsg_exit>:
   140002710:	53                   	push   rbx
   140002711:	48 83 ec 20          	sub    rsp,0x20
   140002715:	89 cb                	mov    ebx,ecx
   140002717:	b9 02 00 00 00       	mov    ecx,0x2
   14000271c:	e8 9f 00 00 00       	call   1400027c0 <__acrt_iob_func>
   140002721:	41 89 d8             	mov    r8d,ebx
   140002724:	48 8d 15 45 1c 00 00 	lea    rdx,[rip+0x1c45]        # 140004370 <.rdata>
   14000272b:	48 89 c1             	mov    rcx,rax
   14000272e:	e8 5d ff ff ff       	call   140002690 <fprintf>
   140002733:	b9 ff 00 00 00       	mov    ecx,0xff
   140002738:	e8 db 00 00 00       	call   140002818 <_exit>
   14000273d:	90                   	nop
   14000273e:	90                   	nop
   14000273f:	90                   	nop

0000000140002740 <__getmainargs>:
   140002740:	55                   	push   rbp
   140002741:	57                   	push   rdi
   140002742:	56                   	push   rsi
   140002743:	53                   	push   rbx
   140002744:	48 83 ec 28          	sub    rsp,0x28
   140002748:	44 89 cd             	mov    ebp,r9d
   14000274b:	48 89 d6             	mov    rsi,rdx
   14000274e:	4c 89 c3             	mov    rbx,r8
   140002751:	48 89 cf             	mov    rdi,rcx
   140002754:	e8 c7 00 00 00       	call   140002820 <_initialize_narrow_environment>
   140002759:	83 fd 01             	cmp    ebp,0x1
   14000275c:	b9 01 00 00 00       	mov    ecx,0x1
   140002761:	83 d9 ff             	sbb    ecx,0xffffffff
   140002764:	e8 9f 00 00 00       	call   140002808 <_configure_narrow_argv>
   140002769:	e8 82 00 00 00       	call   1400027f0 <__p___argc>
   14000276e:	8b 00                	mov    eax,DWORD PTR [rax]
   140002770:	89 07                	mov    DWORD PTR [rdi],eax
   140002772:	e8 81 00 00 00       	call   1400027f8 <__p___argv>
   140002777:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000277a:	48 89 06             	mov    QWORD PTR [rsi],rax
   14000277d:	e8 3e 01 00 00       	call   1400028c0 <__p__environ>
   140002782:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002785:	48 89 03             	mov    QWORD PTR [rbx],rax
   140002788:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14000278d:	8b 08                	mov    ecx,DWORD PTR [rax]
   14000278f:	e8 0c 01 00 00       	call   1400028a0 <_set_new_mode>
   140002794:	31 c0                	xor    eax,eax
   140002796:	48 83 c4 28          	add    rsp,0x28
   14000279a:	5b                   	pop    rbx
   14000279b:	5e                   	pop    rsi
   14000279c:	5f                   	pop    rdi
   14000279d:	5d                   	pop    rbp
   14000279e:	c3                   	ret
   14000279f:	90                   	nop

00000001400027a0 <strcmp>:
   1400027a0:	ff 25 42 5c 00 00    	jmp    QWORD PTR [rip+0x5c42]        # 1400083e8 <__imp_strcmp>
   1400027a6:	90                   	nop
   1400027a7:	90                   	nop

00000001400027a8 <strlen>:
   1400027a8:	ff 25 42 5c 00 00    	jmp    QWORD PTR [rip+0x5c42]        # 1400083f0 <__imp_strlen>
   1400027ae:	90                   	nop
   1400027af:	90                   	nop

00000001400027b0 <strncmp>:
   1400027b0:	ff 25 42 5c 00 00    	jmp    QWORD PTR [rip+0x5c42]        # 1400083f8 <__imp_strncmp>
   1400027b6:	90                   	nop
   1400027b7:	90                   	nop
   1400027b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400027bf:	00 

00000001400027c0 <__acrt_iob_func>:
   1400027c0:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083b0 <__imp___acrt_iob_func>
   1400027c6:	90                   	nop
   1400027c7:	90                   	nop

00000001400027c8 <__p__commode>:
   1400027c8:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083b8 <__imp___p__commode>
   1400027ce:	90                   	nop
   1400027cf:	90                   	nop

00000001400027d0 <__p__fmode>:
   1400027d0:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083c0 <__imp___p__fmode>
   1400027d6:	90                   	nop
   1400027d7:	90                   	nop

00000001400027d8 <__stdio_common_vfprintf>:
   1400027d8:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083c8 <__imp___stdio_common_vfprintf>
   1400027de:	90                   	nop
   1400027df:	90                   	nop

00000001400027e0 <__stdio_common_vfscanf>:
   1400027e0:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083d0 <__imp___stdio_common_vfscanf>
   1400027e6:	90                   	nop
   1400027e7:	90                   	nop

00000001400027e8 <puts>:
   1400027e8:	ff 25 ea 5b 00 00    	jmp    QWORD PTR [rip+0x5bea]        # 1400083d8 <__imp_puts>
   1400027ee:	90                   	nop
   1400027ef:	90                   	nop

00000001400027f0 <__p___argc>:
   1400027f0:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008330 <__imp___p___argc>
   1400027f6:	90                   	nop
   1400027f7:	90                   	nop

00000001400027f8 <__p___argv>:
   1400027f8:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008338 <__imp___p___argv>
   1400027fe:	90                   	nop
   1400027ff:	90                   	nop

0000000140002800 <_cexit>:
   140002800:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008340 <__imp__cexit>
   140002806:	90                   	nop
   140002807:	90                   	nop

0000000140002808 <_configure_narrow_argv>:
   140002808:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008348 <__imp__configure_narrow_argv>
   14000280e:	90                   	nop
   14000280f:	90                   	nop

0000000140002810 <_crt_atexit>:
   140002810:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008350 <__imp__crt_atexit>
   140002816:	90                   	nop
   140002817:	90                   	nop

0000000140002818 <_exit>:
   140002818:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008358 <__imp__exit>
   14000281e:	90                   	nop
   14000281f:	90                   	nop

0000000140002820 <_initialize_narrow_environment>:
   140002820:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008360 <__imp__initialize_narrow_environment>
   140002826:	90                   	nop
   140002827:	90                   	nop

0000000140002828 <__set_app_type>:
   140002828:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008368 <__imp___set_app_type>
   14000282e:	90                   	nop
   14000282f:	90                   	nop

0000000140002830 <_initterm>:
   140002830:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008370 <__imp__initterm>
   140002836:	90                   	nop
   140002837:	90                   	nop

0000000140002838 <_initterm_e>:
   140002838:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008378 <__imp__initterm_e>
   14000283e:	90                   	nop
   14000283f:	90                   	nop

0000000140002840 <_set_invalid_parameter_handler>:
   140002840:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008380 <__imp__set_invalid_parameter_handler>
   140002846:	90                   	nop
   140002847:	90                   	nop

0000000140002848 <abort>:
   140002848:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008388 <__imp_abort>
   14000284e:	90                   	nop
   14000284f:	90                   	nop

0000000140002850 <exit>:
   140002850:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008390 <__imp_exit>
   140002856:	90                   	nop
   140002857:	90                   	nop

0000000140002858 <signal>:
   140002858:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 140008398 <__imp_signal>
   14000285e:	90                   	nop
   14000285f:	90                   	nop

0000000140002860 <system>:
   140002860:	ff 25 3a 5b 00 00    	jmp    QWORD PTR [rip+0x5b3a]        # 1400083a0 <__imp_system>
   140002866:	90                   	nop
   140002867:	90                   	nop
   140002868:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000286f:	00 

0000000140002870 <__C_specific_handler>:
   140002870:	ff 25 a2 5a 00 00    	jmp    QWORD PTR [rip+0x5aa2]        # 140008318 <__imp___C_specific_handler>
   140002876:	90                   	nop
   140002877:	90                   	nop

0000000140002878 <memcpy>:
   140002878:	ff 25 a2 5a 00 00    	jmp    QWORD PTR [rip+0x5aa2]        # 140008320 <__imp_memcpy>
   14000287e:	90                   	nop
   14000287f:	90                   	nop

0000000140002880 <__setusermatherr>:
   140002880:	ff 25 82 5a 00 00    	jmp    QWORD PTR [rip+0x5a82]        # 140008308 <__imp___setusermatherr>
   140002886:	90                   	nop
   140002887:	90                   	nop
   140002888:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000288f:	00 

0000000140002890 <_configthreadlocale>:
   140002890:	ff 25 62 5a 00 00    	jmp    QWORD PTR [rip+0x5a62]        # 1400082f8 <__imp__configthreadlocale>
   140002896:	90                   	nop
   140002897:	90                   	nop
   140002898:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000289f:	00 

00000001400028a0 <_set_new_mode>:
   1400028a0:	ff 25 2a 5a 00 00    	jmp    QWORD PTR [rip+0x5a2a]        # 1400082d0 <__imp__set_new_mode>
   1400028a6:	90                   	nop
   1400028a7:	90                   	nop

00000001400028a8 <calloc>:
   1400028a8:	ff 25 2a 5a 00 00    	jmp    QWORD PTR [rip+0x5a2a]        # 1400082d8 <__imp_calloc>
   1400028ae:	90                   	nop
   1400028af:	90                   	nop

00000001400028b0 <free>:
   1400028b0:	ff 25 2a 5a 00 00    	jmp    QWORD PTR [rip+0x5a2a]        # 1400082e0 <__imp_free>
   1400028b6:	90                   	nop
   1400028b7:	90                   	nop

00000001400028b8 <malloc>:
   1400028b8:	ff 25 2a 5a 00 00    	jmp    QWORD PTR [rip+0x5a2a]        # 1400082e8 <__imp_malloc>
   1400028be:	90                   	nop
   1400028bf:	90                   	nop

00000001400028c0 <__p__environ>:
   1400028c0:	ff 25 fa 59 00 00    	jmp    QWORD PTR [rip+0x59fa]        # 1400082c0 <__imp___p__environ>
   1400028c6:	90                   	nop
   1400028c7:	90                   	nop
   1400028c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400028cf:	00 

00000001400028d0 <VirtualQuery>:
   1400028d0:	ff 25 da 59 00 00    	jmp    QWORD PTR [rip+0x59da]        # 1400082b0 <__imp_VirtualQuery>
   1400028d6:	90                   	nop
   1400028d7:	90                   	nop

00000001400028d8 <VirtualProtect>:
   1400028d8:	ff 25 ca 59 00 00    	jmp    QWORD PTR [rip+0x59ca]        # 1400082a8 <__imp_VirtualProtect>
   1400028de:	90                   	nop
   1400028df:	90                   	nop

00000001400028e0 <TlsGetValue>:
   1400028e0:	ff 25 ba 59 00 00    	jmp    QWORD PTR [rip+0x59ba]        # 1400082a0 <__imp_TlsGetValue>
   1400028e6:	90                   	nop
   1400028e7:	90                   	nop

00000001400028e8 <Sleep>:
   1400028e8:	ff 25 aa 59 00 00    	jmp    QWORD PTR [rip+0x59aa]        # 140008298 <__imp_Sleep>
   1400028ee:	90                   	nop
   1400028ef:	90                   	nop

00000001400028f0 <SetUnhandledExceptionFilter>:
   1400028f0:	ff 25 9a 59 00 00    	jmp    QWORD PTR [rip+0x599a]        # 140008290 <__imp_SetUnhandledExceptionFilter>
   1400028f6:	90                   	nop
   1400028f7:	90                   	nop

00000001400028f8 <LeaveCriticalSection>:
   1400028f8:	ff 25 8a 59 00 00    	jmp    QWORD PTR [rip+0x598a]        # 140008288 <__imp_LeaveCriticalSection>
   1400028fe:	90                   	nop
   1400028ff:	90                   	nop

0000000140002900 <InitializeCriticalSection>:
   140002900:	ff 25 7a 59 00 00    	jmp    QWORD PTR [rip+0x597a]        # 140008280 <__imp_InitializeCriticalSection>
   140002906:	90                   	nop
   140002907:	90                   	nop

0000000140002908 <GetLastError>:
   140002908:	ff 25 6a 59 00 00    	jmp    QWORD PTR [rip+0x596a]        # 140008278 <__imp_GetLastError>
   14000290e:	90                   	nop
   14000290f:	90                   	nop

0000000140002910 <EnterCriticalSection>:
   140002910:	ff 25 5a 59 00 00    	jmp    QWORD PTR [rip+0x595a]        # 140008270 <__imp_EnterCriticalSection>
   140002916:	90                   	nop
   140002917:	90                   	nop

0000000140002918 <DeleteCriticalSection>:
   140002918:	ff 25 4a 59 00 00    	jmp    QWORD PTR [rip+0x594a]        # 140008268 <__IAT_start__>
   14000291e:	90                   	nop
   14000291f:	90                   	nop

0000000140002920 <register_frame_ctor>:
   140002920:	e9 0b eb ff ff       	jmp    140001430 <__gcc_register_frame>
   140002925:	90                   	nop
   140002926:	90                   	nop
   140002927:	90                   	nop
   140002928:	90                   	nop
   140002929:	90                   	nop
   14000292a:	90                   	nop
   14000292b:	90                   	nop
   14000292c:	90                   	nop
   14000292d:	90                   	nop
   14000292e:	90                   	nop
   14000292f:	90                   	nop
