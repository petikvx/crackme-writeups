0000000000499d20 <main.buildRealFlag>:
  499d20:	lea    r12,[rsp-0x10]
  499d25:	cmp    r12,QWORD PTR [r14+0x10]
  499d29:	jbe    499e28 <main.buildRealFlag+0x108>
  499d2f:	push   rbp
  499d30:	mov    rbp,rsp
  499d33:	sub    rsp,0x88
  499d3a:	lea    rax,[rip+0x3ac1e]        # 4d495f <go:string.*+0xb1f>
  499d41:	mov    ebx,0xa
  499d46:	mov    rcx,rbx
  499d49:	mov    edi,0x40
  499d4e:	call   476fa0 <strconv.ParseInt>
  499d53:	xor    rax,0x1337
  499d59:	mov    ebx,0xa
  499d5e:	xchg   ax,ax
  499d60:	call   47b160 <strconv.FormatInt>
  499d65:	lea    rdi,[rsp+0x28]
  499d6a:	lea    rdi,[rdi-0x20]
  499d6e:	nop    WORD PTR [rax+rax*1+0x0]
  499d77:	nop    WORD PTR [rax+rax*1+0x0]
  499d80:	mov    QWORD PTR [rsp-0x10],rbp
  499d85:	lea    rbp,[rsp-0x10]
  499d8a:	call   46fe8b <runtime.duffzero+0x14b>
  499d8f:	mov    rbp,QWORD PTR [rbp+0x0]
  499d93:	mov    QWORD PTR [rsp+0x30],0x4
  499d9c:	lea    rdx,[rip+0x3a157]        # 4d3efa <go:string.*+0xba>
  499da3:	mov    QWORD PTR [rsp+0x28],rdx
  499da8:	mov    QWORD PTR [rsp+0x40],0x3
  499db1:	lea    rdx,[rip+0x3a0d3]        # 4d3e8b <go:string.*+0x4b>
  499db8:	mov    QWORD PTR [rsp+0x38],rdx
  499dbd:	mov    QWORD PTR [rsp+0x50],0x8
  499dc6:	lea    rdx,[rip+0x3a66f]        # 4d443c <go:string.*+0x5fc>
  499dcd:	mov    QWORD PTR [rsp+0x48],rdx
  499dd2:	mov    QWORD PTR [rsp+0x60],0x7
  499ddb:	lea    rdx,[rip+0x3a446]        # 4d4228 <go:string.*+0x3e8>
  499de2:	mov    QWORD PTR [rsp+0x58],rdx
  499de7:	mov    QWORD PTR [rsp+0x70],rbx
  499dec:	mov    QWORD PTR [rsp+0x68],rax
  499df1:	mov    QWORD PTR [rsp+0x80],0x1
  499dfd:	lea    rdx,[rip+0x3a03c]        # 4d3e40 <go:string.*>
  499e04:	mov    QWORD PTR [rsp+0x78],rdx
  499e09:	lea    rax,[rsp+0x28]
  499e0e:	mov    ebx,0x6
  499e13:	mov    rcx,rbx
  499e16:	xor    edi,edi
  499e18:	xor    esi,esi
  499e1a:	call   480160 <strings.Join>
  499e1f:	add    rsp,0x88
  499e26:	pop    rbp
  499e27:	ret
  499e28:	call   46daa0 <runtime.morestack_noctxt.abi0>
  499e2d:	jmp    499d20 <main.buildRealFlag>
  499e32:	int3
  499e33:	int3
  499e34:	int3
  499e35:	int3
  499e36:	int3
  499e37:	int3
  499e38:	int3
  499e39:	int3
  499e3a:	int3
  499e3b:	int3
  499e3c:	int3
  499e3d:	int3
  499e3e:	int3
  499e3f:	int3

0000000000499e40 <main.decoyChecker>:
  499e40:	cmp    rsp,QWORD PTR [r14+0x10]
  499e44:	jbe    499f2d <main.decoyChecker+0xed>
  499e4a:	push   rbp
  499e4b:	mov    rbp,rsp
  499e4e:	sub    rsp,0x78
  499e52:	mov    QWORD PTR [rsp+0x88],rax
  499e5a:	mov    rcx,rbx
  499e5d:	mov    rbx,rax
  499e60:	lea    rax,[rsp+0x58]
  499e65:	call   452cc0 <runtime.stringtoslicebyte>
  499e6a:	call   486e40 <crypto/md5.Sum>
  499e6f:	movups xmm0,XMMWORD PTR [rsp]
  499e73:	movups XMMWORD PTR [rsp+0x28],xmm0
  499e78:	nop
  499e79:	lea    rax,[rip+0x1fe40]        # 4b9cc0 <type:*+0x9cc0>
  499e80:	mov    ebx,0x20
  499e85:	mov    rcx,rbx
  499e88:	call   46aca0 <runtime.makeslice>
  499e8d:	xor    ecx,ecx
  499e8f:	xor    edx,edx
  499e91:	jmp    499ea0 <main.decoyChecker+0x60>
  499e93:	mov    BYTE PTR [rdx+rax*1+0x1],dil
  499e98:	inc    rcx
  499e9b:	add    rdx,0x2
  499e9f:	nop
  499ea0:	cmp    rcx,0x10
  499ea4:	jge    499edf <main.decoyChecker+0x9f>
  499ea6:	movzx  esi,BYTE PTR [rsp+rcx*1+0x28]
  499eab:	mov    edi,esi
  499ead:	shr    sil,0x4
  499eb1:	movzx  esi,sil
  499eb5:	lea    r8,[rip+0x3bb7b]        # 4d5a37 <go:string.*+0x1bf7>
  499ebc:	movzx  esi,BYTE PTR [r8+rsi*1]
  499ec1:	cmp    rdx,0x20
  499ec5:	jae    499f1f <main.decoyChecker+0xdf>
  499ec7:	mov    BYTE PTR [rax+rdx*1],sil
  499ecb:	lea    rsi,[rdx+0x1]
  499ecf:	and    edi,0xf
  499ed2:	movzx  edi,BYTE PTR [rdi+r8*1]
  499ed7:	cmp    rsi,0x20
  499edb:	jb     499e93 <main.decoyChecker+0x53>
  499edd:	jmp    499f12 <main.decoyChecker+0xd2>
  499edf:	mov    rbx,rax
  499ee2:	mov    ecx,0x20
  499ee7:	lea    rax,[rsp+0x38]
  499eec:	call   452b00 <runtime.slicebytetostring>
  499ef1:	cmp    rbx,0x30
  499ef5:	je     499efb <main.decoyChecker+0xbb>
  499ef7:	xor    eax,eax
  499ef9:	jmp    499f0c <main.decoyChecker+0xcc>
  499efb:	lea    rbx,[rip+0x42724]        # 4dc626 <go:string.*+0x87e6>
  499f02:	mov    ecx,0x30
  499f07:	call   4030c0 <runtime.memequal>
  499f0c:	add    rsp,0x78
  499f10:	pop    rbp
  499f11:	ret
  499f12:	mov    eax,0x20
  499f17:	mov    rcx,rax
  499f1a:	call   46fbc0 <runtime.panicIndex>
  499f1f:	mov    rax,rdx
  499f22:	mov    ecx,0x20
  499f27:	call   46fbc0 <runtime.panicIndex>
  499f2c:	nop
  499f2d:	mov    QWORD PTR [rsp+0x8],rax
  499f32:	mov    QWORD PTR [rsp+0x10],rbx
  499f37:	call   46daa0 <runtime.morestack_noctxt.abi0>
  499f3c:	mov    rax,QWORD PTR [rsp+0x8]
  499f41:	mov    rbx,QWORD PTR [rsp+0x10]
  499f46:	jmp    499e40 <main.decoyChecker>
  499f4b:	int3
  499f4c:	int3
  499f4d:	int3
  499f4e:	int3
  499f4f:	int3
  499f50:	int3
  499f51:	int3
  499f52:	int3
  499f53:	int3
  499f54:	int3
  499f55:	int3
  499f56:	int3
  499f57:	int3
  499f58:	int3
  499f59:	int3
  499f5a:	int3
  499f5b:	int3
  499f5c:	int3
  499f5d:	int3
  499f5e:	int3
  499f5f:	int3

0000000000499f60 <main.validateFlag>:
  499f60:	cmp    rsp,QWORD PTR [r14+0x10]
  499f64:	jbe    499ff8 <main.validateFlag+0x98>
  499f6a:	push   rbp
  499f6b:	mov    rbp,rsp
  499f6e:	sub    rsp,0x18
  499f72:	mov    QWORD PTR [rsp+0x28],rax
  499f77:	mov    QWORD PTR [rsp+0x30],rbx
  499f7c:	nop    DWORD PTR [rax+0x0]
  499f80:	call   499d20 <main.buildRealFlag>
  499f85:	mov    rcx,QWORD PTR [rsp+0x30]
  499f8a:	cmp    rbx,rcx
  499f8d:	jne    499f9d <main.validateFlag+0x3d>
  499f8f:	mov    QWORD PTR [rsp+0x10],rax
  499f94:	mov    rdx,QWORD PTR [rsp+0x28]
  499f99:	xor    ebx,ebx
  499f9b:	jmp    499fd1 <main.validateFlag+0x71>
  499f9d:	xor    eax,eax
  499f9f:	add    rsp,0x18
  499fa3:	pop    rbp
  499fa4:	ret
  499fa5:	mov    QWORD PTR [rsp+0x8],rbx
  499faa:	mov    eax,0x3e8
  499faf:	call   46bb80 <time.Sleep>
  499fb4:	mov    rbx,QWORD PTR [rsp+0x8]
  499fb9:	inc    rbx
  499fbc:	mov    rcx,QWORD PTR [rsp+0x30]
  499fc1:	mov    rdx,QWORD PTR [rsp+0x10]
  499fc6:	mov    rsi,QWORD PTR [rsp+0x28]
  499fcb:	mov    rax,rdx
  499fce:	mov    rdx,rsi
  499fd1:	cmp    rcx,rbx
  499fd4:	jle    499fed <main.validateFlag+0x8d>
  499fd6:	movzx  esi,BYTE PTR [rdx+rbx*1]
  499fda:	movzx  edi,BYTE PTR [rax+rbx*1]
  499fde:	xchg   ax,ax
  499fe0:	cmp    dil,sil
  499fe3:	je     499fa5 <main.validateFlag+0x45>
  499fe5:	xor    eax,eax
  499fe7:	add    rsp,0x18
  499feb:	pop    rbp
  499fec:	ret
  499fed:	mov    eax,0x1
  499ff2:	add    rsp,0x18
  499ff6:	pop    rbp
  499ff7:	ret
  499ff8:	mov    QWORD PTR [rsp+0x8],rax
  499ffd:	mov    QWORD PTR [rsp+0x10],rbx
  49a002:	call   46daa0 <runtime.morestack_noctxt.abi0>
  49a007:	mov    rax,QWORD PTR [rsp+0x8]
  49a00c:	mov    rbx,QWORD PTR [rsp+0x10]
  49a011:	jmp    499f60 <main.validateFlag>
  49a016:	int3
  49a017:	int3
  49a018:	int3
  49a019:	int3
  49a01a:	int3
  49a01b:	int3
  49a01c:	int3
  49a01d:	int3
  49a01e:	int3
  49a01f:	int3

000000000049a020 <main.main>:
  49a020:	lea    r12,[rsp-0x60]
  49a025:	cmp    r12,QWORD PTR [r14+0x10]
  49a029:	jbe    49a32c <main.main+0x30c>
  49a02f:	push   rbp
  49a030:	mov    rbp,rsp
  49a033:	sub    rsp,0xd8
  49a03a:	lea    rdx,[rip+0x1fbff]        # 4b9c40 <type:*+0x9c40>
  49a041:	mov    QWORD PTR [rsp+0xc8],rdx
  49a049:	lea    rdx,[rip+0x62558]        # 4fc5a8 <runtime.buildVersion.str+0x10>
  49a050:	mov    QWORD PTR [rsp+0xd0],rdx
  49a058:	mov    rbx,QWORD PTR [rip+0xfd609]        # 597668 <os.Stdout>
  49a05f:	lea    rax,[rip+0x62ca2]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a066:	lea    rcx,[rsp+0xc8]
  49a06e:	mov    edi,0x1
  49a073:	mov    rsi,rdi
  49a076:	call   4934a0 <fmt.Fprintln>
  49a07b:	lea    rdx,[rip+0x1fbbe]        # 4b9c40 <type:*+0x9c40>
  49a082:	mov    QWORD PTR [rsp+0xb8],rdx
  49a08a:	lea    rdx,[rip+0x62527]        # 4fc5b8 <runtime.buildVersion.str+0x20>
  49a091:	mov    QWORD PTR [rsp+0xc0],rdx
  49a099:	mov    rbx,QWORD PTR [rip+0xfd5c8]        # 597668 <os.Stdout>
  49a0a0:	lea    rax,[rip+0x62c61]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a0a7:	lea    rcx,[rsp+0xb8]
  49a0af:	mov    edi,0x1
  49a0b4:	mov    rsi,rdi
  49a0b7:	call   4934a0 <fmt.Fprintln>
  49a0bc:	mov    rbx,QWORD PTR [rip+0xfd5a5]        # 597668 <os.Stdout>
  49a0c3:	nop
  49a0c4:	lea    rax,[rip+0x62c3d]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a0cb:	xor    ecx,ecx
  49a0cd:	xor    edi,edi
  49a0cf:	mov    rsi,rdi
  49a0d2:	call   4934a0 <fmt.Fprintln>
  49a0d7:	cmp    QWORD PTR [rip+0xfd879],0x2        # 597958 <os.Args+0x8>
  49a0df:	nop
  49a0e0:	jge    49a12f <main.main+0x10f>
  49a0e2:	lea    rdx,[rip+0x1fb57]        # 4b9c40 <type:*+0x9c40>
  49a0e9:	mov    QWORD PTR [rsp+0xa8],rdx
  49a0f1:	lea    rdx,[rip+0x624d0]        # 4fc5c8 <runtime.buildVersion.str+0x30>
  49a0f8:	mov    QWORD PTR [rsp+0xb0],rdx
  49a100:	mov    rbx,QWORD PTR [rip+0xfd561]        # 597668 <os.Stdout>
  49a107:	lea    rax,[rip+0x62bfa]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a10e:	lea    rcx,[rsp+0xa8]
  49a116:	mov    edi,0x1
  49a11b:	mov    rsi,rdi
  49a11e:	xchg   ax,ax
  49a120:	call   4934a0 <fmt.Fprintln>
  49a125:	mov    eax,0x1
  49a12a:	call   485d20 <os.Exit>
  49a12f:	mov    rcx,QWORD PTR [rip+0xfd822]        # 597958 <os.Args+0x8>
  49a136:	nop    WORD PTR [rax+rax*1+0x0]
  49a13f:	nop
  49a140:	cmp    rcx,0x1
  49a144:	jbe    49a321 <main.main+0x301>
  49a14a:	mov    rcx,QWORD PTR [rip+0xfd7ff]        # 597950 <os.Args>
  49a151:	mov    rax,QWORD PTR [rcx+0x10]
  49a155:	mov    QWORD PTR [rsp+0x40],rax
  49a15a:	mov    rbx,QWORD PTR [rcx+0x18]
  49a15e:	mov    QWORD PTR [rsp+0x38],rbx
  49a163:	call   499e40 <main.decoyChecker>
  49a168:	test   al,al
  49a16a:	je     49a1f9 <main.main+0x1d9>
  49a170:	lea    rdx,[rip+0x1fac9]        # 4b9c40 <type:*+0x9c40>
  49a177:	mov    QWORD PTR [rsp+0x98],rdx
  49a17f:	lea    rdx,[rip+0x62452]        # 4fc5d8 <runtime.buildVersion.str+0x40>
  49a186:	mov    QWORD PTR [rsp+0xa0],rdx
  49a18e:	mov    rbx,QWORD PTR [rip+0xfd4d3]        # 597668 <os.Stdout>
  49a195:	lea    rax,[rip+0x62b6c]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a19c:	lea    rcx,[rsp+0x98]
  49a1a4:	mov    edi,0x1
  49a1a9:	mov    rsi,rdi
  49a1ac:	call   4934a0 <fmt.Fprintln>
  49a1b1:	lea    rdx,[rip+0x1fa88]        # 4b9c40 <type:*+0x9c40>
  49a1b8:	mov    QWORD PTR [rsp+0x88],rdx
  49a1c0:	lea    rdx,[rip+0x62421]        # 4fc5e8 <runtime.buildVersion.str+0x50>
  49a1c7:	mov    QWORD PTR [rsp+0x90],rdx
  49a1cf:	mov    rbx,QWORD PTR [rip+0xfd492]        # 597668 <os.Stdout>
  49a1d6:	lea    rax,[rip+0x62b2b]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a1dd:	lea    rcx,[rsp+0x88]
  49a1e5:	mov    edi,0x1
  49a1ea:	mov    rsi,rdi
  49a1ed:	call   4934a0 <fmt.Fprintln>
  49a1f2:	xor    eax,eax
  49a1f4:	call   485d20 <os.Exit>
  49a1f9:	mov    rax,QWORD PTR [rsp+0x40]
  49a1fe:	mov    rbx,QWORD PTR [rsp+0x38]
  49a203:	call   499f60 <main.validateFlag>
  49a208:	test   al,al
  49a20a:	je     49a2df <main.main+0x2bf>
  49a210:	lea    rdx,[rip+0x1fa29]        # 4b9c40 <type:*+0x9c40>
  49a217:	mov    QWORD PTR [rsp+0x78],rdx
  49a21c:	lea    rdx,[rip+0x623d5]        # 4fc5f8 <runtime.buildVersion.str+0x60>
  49a223:	mov    QWORD PTR [rsp+0x80],rdx
  49a22b:	mov    rbx,QWORD PTR [rip+0xfd436]        # 597668 <os.Stdout>
  49a232:	lea    rax,[rip+0x62acf]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a239:	lea    rcx,[rsp+0x78]
  49a23e:	mov    edi,0x1
  49a243:	mov    rsi,rdi
  49a246:	call   4934a0 <fmt.Fprintln>
  49a24b:	movups XMMWORD PTR [rsp+0x68],xmm15
  49a251:	mov    rax,QWORD PTR [rsp+0x40]
  49a256:	mov    rbx,QWORD PTR [rsp+0x38]
  49a25b:	nop    DWORD PTR [rax+rax*1+0x0]
  49a260:	call   468000 <runtime.convTstring>
  49a265:	lea    rdx,[rip+0x1f9d4]        # 4b9c40 <type:*+0x9c40>
  49a26c:	mov    QWORD PTR [rsp+0x68],rdx
  49a271:	mov    QWORD PTR [rsp+0x70],rax
  49a276:	mov    rbx,QWORD PTR [rip+0xfd3eb]        # 597668 <os.Stdout>
  49a27d:	lea    rax,[rip+0x62a84]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a284:	lea    rcx,[rip+0x3be65]        # 4d60f0 <go:string.*+0x22b0>
  49a28b:	mov    edi,0x12
  49a290:	lea    rsi,[rsp+0x68]
  49a295:	mov    r8d,0x1
  49a29b:	mov    r9,r8
  49a29e:	xchg   ax,ax
  49a2a0:	call   493380 <fmt.Fprintf>
  49a2a5:	lea    rdx,[rip+0x1f994]        # 4b9c40 <type:*+0x9c40>
  49a2ac:	mov    QWORD PTR [rsp+0x58],rdx
  49a2b1:	lea    rdx,[rip+0x62350]        # 4fc608 <runtime.buildVersion.str+0x70>
  49a2b8:	mov    QWORD PTR [rsp+0x60],rdx
  49a2bd:	mov    rbx,QWORD PTR [rip+0xfd3a4]        # 597668 <os.Stdout>
  49a2c4:	lea    rax,[rip+0x62a3d]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a2cb:	lea    rcx,[rsp+0x58]
  49a2d0:	mov    edi,0x1
  49a2d5:	mov    rsi,rdi
  49a2d8:	call   4934a0 <fmt.Fprintln>
  49a2dd:	jmp    49a317 <main.main+0x2f7>
  49a2df:	lea    rdx,[rip+0x1f95a]        # 4b9c40 <type:*+0x9c40>
  49a2e6:	mov    QWORD PTR [rsp+0x48],rdx
  49a2eb:	lea    rdx,[rip+0x62326]        # 4fc618 <runtime.buildVersion.str+0x80>
  49a2f2:	mov    QWORD PTR [rsp+0x50],rdx
  49a2f7:	mov    rbx,QWORD PTR [rip+0xfd36a]        # 597668 <os.Stdout>
  49a2fe:	lea    rax,[rip+0x62a03]        # 4fcd08 <go:itab.*os.File,io.Writer>
  49a305:	lea    rcx,[rsp+0x48]
  49a30a:	mov    edi,0x1
  49a30f:	mov    rsi,rdi
  49a312:	call   4934a0 <fmt.Fprintln>
  49a317:	add    rsp,0xd8
  49a31e:	pop    rbp
  49a31f:	nop
  49a320:	ret
  49a321:	mov    eax,0x1
  49a326:	call   46fbc0 <runtime.panicIndex>
  49a32b:	nop
  49a32c:	call   46daa0 <runtime.morestack_noctxt.abi0>
  49a331:	jmp    49a020 <main.main>
  49a336:	int3
  49a337:	int3
  49a338:	int3
  49a339:	int3
  49a33a:	int3
  49a33b:	int3
  49a33c:	int3
  49a33d:	int3
  49a33e:	int3
  49a33f:	int3

000000000049a340 <go:textfipsstart>:
  49a340:	int3
  49a341:	int3
  49a342:	int3
  49a343:	int3
  49a344:	int3
  49a345:	int3
  49a346:	int3
  49a347:	int3
  49a348:	int3
  49a349:	int3
  49a34a:	int3
  49a34b:	int3
  49a34c:	int3
  49a34d:	int3
  49a34e:	int3
  49a34f:	int3
  49a350:	int3
  49a351:	int3
  49a352:	int3
  49a353:	int3
  49a354:	int3
  49a355:	int3
  49a356:	int3
  49a357:	int3
  49a358:	int3
  49a359:	int3
  49a35a:	int3
  49a35b:	int3
  49a35c:	int3
  49a35d:	int3
  49a35e:	int3
  49a35f:	int3

000000000049a360 <crypto/internal/fips140.fatal>:
  49a360:	cmp    rsp,QWORD PTR [r14+0x10]
  49a364:	jbe    49a37e <crypto/internal/fips140.fatal+0x1e>
  49a366:	push   rbp
  49a367:	mov    rbp,rsp
  49a36a:	sub    rsp,0x10
  49a36e:	mov    QWORD PTR [rsp+0x20],rax
  49a373:	call   436a40 <runtime.fatal>
  49a378:	add    rsp,0x10
  49a37c:	pop    rbp
  49a37d:	ret
  49a37e:	mov    QWORD PTR [rsp+0x8],rax
  49a383:	mov    QWORD PTR [rsp+0x10],rbx
  49a388:	call   46daa0 <runtime.morestack_noctxt.abi0>
  49a38d:	mov    rax,QWORD PTR [rsp+0x8]
  49a392:	mov    rbx,QWORD PTR [rsp+0x10]
  49a397:	jmp    49a360 <crypto/internal/fips140.fatal>
  49a399:	int3
  49a39a:	int3
  49a39b:	int3
  49a39c:	int3
  49a39d:	int3
  49a39e:	int3
  49a39f:	int3

000000000049a3a0 <crypto/internal/fips140.getIndicator>:
  49a3a0:	movzx  eax,BYTE PTR [r14+0xe0]
  49a3a8:	ret
  49a3a9:	int3
  49a3aa:	int3
  49a3ab:	int3
  49a3ac:	int3
  49a3ad:	int3
  49a3ae:	int3
  49a3af:	int3
  49a3b0:	int3
  49a3b1:	int3
  49a3b2:	int3
  49a3b3:	int3
  49a3b4:	int3
  49a3b5:	int3
  49a3b6:	int3
  49a3b7:	int3
  49a3b8:	int3
  49a3b9:	int3
  49a3ba:	int3
  49a3bb:	int3
  49a3bc:	int3
  49a3bd:	int3
  49a3be:	int3
  49a3bf:	int3

000000000049a3c0 <crypto/internal/fips140.setIndicator>:
  49a3c0:	mov    BYTE PTR [r14+0xe0],al
  49a3c7:	ret
  49a3c8:	int3
  49a3c9:	int3
  49a3ca:	int3
  49a3cb:	int3
  49a3cc:	int3
  49a3cd:	int3
  49a3ce:	int3
  49a3cf:	int3
  49a3d0:	int3
  49a3d1:	int3
  49a3d2:	int3
  49a3d3:	int3
  49a3d4:	int3
  49a3d5:	int3
  49a3d6:	int3
  49a3d7:	int3
  49a3d8:	int3
  49a3d9:	int3
  49a3da:	int3
  49a3db:	int3
  49a3dc:	int3
  49a3dd:	int3
  49a3de:	int3
  49a3df:	int3

000000000049a3e0 <crypto/internal/fips140.init>:
  49a3e0:	cmp    rsp,QWORD PTR [r14+0x10]
  49a3e4:	jbe    49a442 <crypto/internal/fips140.init+0x62>
  49a3e6:	push   rbp
  49a3e7:	mov    rbp,rsp
  49a3ea:	sub    rsp,0x10
  49a3ee:	lea    rax,[rip+0x2da4b]        # 4c7e40 <type:*+0x17e40>
  49a3f5:	call   413c20 <runtime.newobject>
  49a3fa:	mov    QWORD PTR [rax+0x8],0xd
  49a402:	lea    rcx,[rip+0x3b07e]        # 4d5487 <go:string.*+0x1647>
  49a409:	mov    QWORD PTR [rax],rcx
  49a40c:	call   47ec20 <internal/godebug.(*Setting).Value>
  49a411:	mov    QWORD PTR [rip+0xfd520],rbx        # 597938 <crypto/internal/fips140.failfipscast+0x8>
  49a418:	cmp    DWORD PTR [rip+0x11d611],0x0        # 5b7a30 <runtime.writeBarrier>
  49a41f:	nop
  49a420:	je     49a435 <crypto/internal/fips140.init+0x55>
  49a422:	call   46f820 <runtime.gcWriteBarrier2>
  49a427:	mov    QWORD PTR [r11],rax
  49a42a:	mov    rcx,QWORD PTR [rip+0xfd4ff]        # 597930 <crypto/internal/fips140.failfipscast>
  49a431:	mov    QWORD PTR [r11+0x8],rcx
  49a435:	mov    QWORD PTR [rip+0xfd4f4],rax        # 597930 <crypto/internal/fips140.failfipscast>
  49a43c:	add    rsp,0x10
  49a440:	pop    rbp
  49a441:	ret
  49a442:	call   46daa0 <runtime.morestack_noctxt.abi0>
  49a447:	jmp    49a3e0 <crypto/internal/fips140.init>
  49a449:	int3
  49a44a:	int3
  49a44b:	int3
  49a44c:	int3
  49a44d:	int3
  49a44e:	int3
  49a44f:	int3
  49a450:	int3
  49a451:	int3
  49a452:	int3
  49a453:	int3
