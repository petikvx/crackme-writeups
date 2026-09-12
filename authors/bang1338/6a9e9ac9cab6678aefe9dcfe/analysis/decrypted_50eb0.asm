
/tmp/dec.bin:     file format binary


Disassembly of section .data:

0000000140050eb0 <.data>:
   140050eb0:	41 57                	push   %r15
   140050eb2:	41 56                	push   %r14
   140050eb4:	41 55                	push   %r13
   140050eb6:	41 54                	push   %r12
   140050eb8:	56                   	push   %rsi
   140050eb9:	57                   	push   %rdi
   140050eba:	55                   	push   %rbp
   140050ebb:	53                   	push   %rbx
   140050ebc:	50                   	push   %rax
   140050ebd:	9c                   	pushf
   140050ebe:	41 52                	push   %r10
   140050ec0:	41 53                	push   %r11
   140050ec2:	49 ba 55 1a 65 29 dd 	movabs $0x197812dd29651a55,%r10
   140050ec9:	12 78 19 
   140050ecc:	4d 89 d3             	mov    %r10,%r11
   140050ecf:	49 c1 fb 1f          	sar    $0x1f,%r11
   140050ed3:	49 d1 fb             	sar    $1,%r11
   140050ed6:	49 c1 fa 03          	sar    $0x3,%r10
   140050eda:	49 c1 fb 0d          	sar    $0xd,%r11
   140050ede:	49 c1 fa 09          	sar    $0x9,%r10
   140050ee2:	49 c1 fb 03          	sar    $0x3,%r11
   140050ee6:	49 c1 fa 1f          	sar    $0x1f,%r10
   140050eea:	49 d1 fb             	sar    $1,%r11
   140050eed:	49 c1 fb 04          	sar    $0x4,%r11
   140050ef1:	49 c1 fb 1f          	sar    $0x1f,%r11
   140050ef5:	49 d1 fb             	sar    $1,%r11
   140050ef8:	49 c1 fb 15          	sar    $0x15,%r11
   140050efc:	49 c1 fa 1f          	sar    $0x1f,%r10
   140050f00:	49 c1 fb 1b          	sar    $0x1b,%r11
   140050f04:	49 c1 fa 07          	sar    $0x7,%r10
   140050f08:	49 c1 fa 11          	sar    $0x11,%r10
   140050f0c:	49 d1 fb             	sar    $1,%r11
   140050f0f:	49 c1 fb 04          	sar    $0x4,%r11
   140050f13:	49 c1 fb 1f          	sar    $0x1f,%r11
   140050f17:	49 c1 fb 02          	sar    $0x2,%r11
   140050f1b:	49 c1 fb 0b          	sar    $0xb,%r11
   140050f1f:	49 c1 fa 11          	sar    $0x11,%r10
   140050f23:	49 c1 fb 02          	sar    $0x2,%r11
   140050f27:	49 c1 fa 0b          	sar    $0xb,%r10
   140050f2b:	49 c1 fb 0b          	sar    $0xb,%r11
   140050f2f:	49 c1 fa 09          	sar    $0x9,%r10
   140050f33:	49 c1 fa 0d          	sar    $0xd,%r10
   140050f37:	49 c1 fb 1f          	sar    $0x1f,%r11
   140050f3b:	49 c1 fb 03          	sar    $0x3,%r11
   140050f3f:	49 d1 fa             	sar    $1,%r10
   140050f42:	49 c1 fa 07          	sar    $0x7,%r10
   140050f46:	49 c1 fa 04          	sar    $0x4,%r10
   140050f4a:	49 c1 fa 09          	sar    $0x9,%r10
   140050f4e:	49 c1 fa 04          	sar    $0x4,%r10
   140050f52:	4d 31 da             	xor    %r11,%r10
   140050f55:	49 bb 0c bb 56 12 69 	movabs $0x54798c691256bb0c,%r11
   140050f5c:	8c 79 54 
   140050f5f:	4d 31 da             	xor    %r11,%r10
   140050f62:	49 c1 fa 3f          	sar    $0x3f,%r10
   140050f66:	4d 89 d3             	mov    %r10,%r11
   140050f69:	49 ff c3             	inc    %r11
   140050f6c:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
   140050f70:	4d 85 db             	test   %r11,%r11
   140050f73:	75 09                	jne    0x140050f7e
   140050f75:	49 0f cb             	bswap  %r11
   140050f78:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140050f7c:	eb 11                	jmp    0x140050f8f
   140050f7e:	49 c1 fa 11          	sar    $0x11,%r10
   140050f82:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140050f89:	01 00 00 
   140050f8c:	4d 8b 13             	mov    (%r11),%r10
   140050f8f:	41 5b                	pop    %r11
   140050f91:	41 5a                	pop    %r10
   140050f93:	9d                   	popf
   140050f94:	49 89 d0             	mov    %rdx,%r8
   140050f97:	48 85 c9             	test   %rcx,%rcx
   140050f9a:	0f 95 c0             	setne  %al
   140050f9d:	48 85 d2             	test   %rdx,%rdx
   140050fa0:	0f 95 c2             	setne  %dl
   140050fa3:	84 d0                	test   %dl,%al
   140050fa5:	0f 84 97 6d 00 00    	je     0x140057d42
   140050fab:	9c                   	pushf
   140050fac:	50                   	push   %rax
   140050fad:	51                   	push   %rcx
   140050fae:	b8 30 c2 a1 2d       	mov    $0x2da1c230,%eax
   140050fb3:	89 c1                	mov    %eax,%ecx
   140050fb5:	c1 f9 11             	sar    $0x11,%ecx
   140050fb8:	d1 f9                	sar    $1,%ecx
   140050fba:	c1 f8 07             	sar    $0x7,%eax
   140050fbd:	c1 f8 0f             	sar    $0xf,%eax
   140050fc0:	d1 f8                	sar    $1,%eax
   140050fc2:	c1 f9 09             	sar    $0x9,%ecx
   140050fc5:	c1 f9 08             	sar    $0x8,%ecx
   140050fc8:	c1 f8 04             	sar    $0x4,%eax
   140050fcb:	c1 f8 0d             	sar    $0xd,%eax
   140050fce:	c1 f9 09             	sar    $0x9,%ecx
   140050fd1:	c1 f8 05             	sar    $0x5,%eax
   140050fd4:	c1 f9 1f             	sar    $0x1f,%ecx
   140050fd7:	c1 f9 04             	sar    $0x4,%ecx
   140050fda:	c1 f8 05             	sar    $0x5,%eax
   140050fdd:	c1 f9 04             	sar    $0x4,%ecx
   140050fe0:	c1 f8 03             	sar    $0x3,%eax
   140050fe3:	d1 f9                	sar    $1,%ecx
   140050fe5:	c1 f8 03             	sar    $0x3,%eax
   140050fe8:	c1 f8 08             	sar    $0x8,%eax
   140050feb:	c1 f8 09             	sar    $0x9,%eax
   140050fee:	c1 f8 02             	sar    $0x2,%eax
   140050ff1:	c1 f8 07             	sar    $0x7,%eax
   140050ff4:	c1 f9 02             	sar    $0x2,%ecx
   140050ff7:	c1 f9 05             	sar    $0x5,%ecx
   140050ffa:	d1 f9                	sar    $1,%ecx
   140050ffc:	c1 f8 1f             	sar    $0x1f,%eax
   140050fff:	c1 f8 02             	sar    $0x2,%eax
   140051002:	d1 f8                	sar    $1,%eax
   140051004:	c1 f8 09             	sar    $0x9,%eax
   140051007:	c1 f8 07             	sar    $0x7,%eax
   14005100a:	c1 f8 0d             	sar    $0xd,%eax
   14005100d:	31 c8                	xor    %ecx,%eax
   14005100f:	35 e3 51 b2 3e       	xor    $0x3eb251e3,%eax
   140051014:	c1 f8 1f             	sar    $0x1f,%eax
   140051017:	89 c1                	mov    %eax,%ecx
   140051019:	d1 f9                	sar    $1,%ecx
   14005101b:	31 c1                	xor    %eax,%ecx
   14005101d:	85 c9                	test   %ecx,%ecx
   14005101f:	75 08                	jne    0x140051029
   140051021:	48 0f c9             	bswap  %rcx
   140051024:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   140051027:	eb 0f                	jmp    0x140051038
   140051029:	c1 f8 0d             	sar    $0xd,%eax
   14005102c:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140051033:	01 00 00 
   140051036:	8b 01                	mov    (%rcx),%eax
   140051038:	59                   	pop    %rcx
   140051039:	58                   	pop    %rax
   14005103a:	9d                   	popf
   14005103b:	c7 44 24 04 a1 10 00 	movl   $0x10a1,0x4(%rsp)
   140051042:	00 
   140051043:	9c                   	pushf
   140051044:	50                   	push   %rax
   140051045:	51                   	push   %rcx
   140051046:	48 b8 1e a6 24 ce 16 	movabs $0x4d6d2516ce24a61e,%rax
   14005104d:	25 6d 4d 
   140051050:	48 89 c1             	mov    %rax,%rcx
   140051053:	48 c1 f9 11          	sar    $0x11,%rcx
   140051057:	48 c1 f8 15          	sar    $0x15,%rax
   14005105b:	48 c1 f8 05          	sar    $0x5,%rax
   14005105f:	48 c1 f8 11          	sar    $0x11,%rax
   140051063:	48 c1 f8 0b          	sar    $0xb,%rax
   140051067:	48 c1 f9 1b          	sar    $0x1b,%rcx
   14005106b:	48 c1 f9 11          	sar    $0x11,%rcx
   14005106f:	48 d1 f9             	sar    $1,%rcx
   140051072:	48 c1 f9 11          	sar    $0x11,%rcx
   140051076:	48 c1 f8 07          	sar    $0x7,%rax
   14005107a:	48 c1 f9 0b          	sar    $0xb,%rcx
   14005107e:	48 c1 f8 15          	sar    $0x15,%rax
   140051082:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140051086:	48 c1 f8 04          	sar    $0x4,%rax
   14005108a:	48 c1 f9 02          	sar    $0x2,%rcx
   14005108e:	48 c1 f9 07          	sar    $0x7,%rcx
   140051092:	48 c1 f8 04          	sar    $0x4,%rax
   140051096:	48 c1 f9 0d          	sar    $0xd,%rcx
   14005109a:	48 c1 f9 0b          	sar    $0xb,%rcx
   14005109e:	48 d1 f8             	sar    $1,%rax
   1400510a1:	48 c1 f8 0b          	sar    $0xb,%rax
   1400510a5:	48 c1 f8 11          	sar    $0x11,%rax
   1400510a9:	48 c1 f8 0d          	sar    $0xd,%rax
   1400510ad:	48 c1 f9 1b          	sar    $0x1b,%rcx
   1400510b1:	48 c1 f8 05          	sar    $0x5,%rax
   1400510b5:	48 c1 f8 09          	sar    $0x9,%rax
   1400510b9:	48 31 c8             	xor    %rcx,%rax
   1400510bc:	48 b9 c0 46 60 a8 90 	movabs $0x564fab90a86046c0,%rcx
   1400510c3:	ab 4f 56 
   1400510c6:	48 31 c8             	xor    %rcx,%rax
   1400510c9:	48 c1 f8 3f          	sar    $0x3f,%rax
   1400510cd:	48 8d 48 01          	lea    0x1(%rax),%rcx
   1400510d1:	48 0f af c8          	imul   %rax,%rcx
   1400510d5:	48 85 c9             	test   %rcx,%rcx
   1400510d8:	75 0a                	jne    0x1400510e4
   1400510da:	48 c1 e1 26          	shl    $0x26,%rcx
   1400510de:	48 8b 04 cc          	mov    (%rsp,%rcx,8),%rax
   1400510e2:	eb 11                	jmp    0x1400510f5
   1400510e4:	48 c1 f8 11          	sar    $0x11,%rax
   1400510e8:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400510ef:	01 00 00 
   1400510f2:	48 8b 01             	mov    (%rcx),%rax
   1400510f5:	59                   	pop    %rcx
   1400510f6:	58                   	pop    %rax
   1400510f7:	9d                   	popf
   1400510f8:	8b 44 24 04          	mov    0x4(%rsp),%eax
   1400510fc:	9c                   	pushf
   1400510fd:	41 52                	push   %r10
   1400510ff:	41 53                	push   %r11
   140051101:	41 ba e3 e2 a3 67    	mov    $0x67a3e2e3,%r10d
   140051107:	45 89 d3             	mov    %r10d,%r11d
   14005110a:	41 c1 fb 0f          	sar    $0xf,%r11d
   14005110e:	41 c1 fa 04          	sar    $0x4,%r10d
   140051112:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051116:	41 c1 fa 08          	sar    $0x8,%r10d
   14005111a:	41 c1 fb 07          	sar    $0x7,%r11d
   14005111e:	41 c1 fb 02          	sar    $0x2,%r11d
   140051122:	41 c1 fb 05          	sar    $0x5,%r11d
   140051126:	41 d1 fb             	sar    $1,%r11d
   140051129:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005112d:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051131:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051135:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051139:	41 c1 fa 09          	sar    $0x9,%r10d
   14005113d:	41 c1 fa 09          	sar    $0x9,%r10d
   140051141:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051145:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051149:	41 c1 fb 08          	sar    $0x8,%r11d
   14005114d:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051151:	41 d1 fb             	sar    $1,%r11d
   140051154:	41 c1 fb 07          	sar    $0x7,%r11d
   140051158:	41 c1 fa 09          	sar    $0x9,%r10d
   14005115c:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051160:	41 c1 fa 02          	sar    $0x2,%r10d
   140051164:	41 c1 fb 08          	sar    $0x8,%r11d
   140051168:	41 c1 fb 0d          	sar    $0xd,%r11d
   14005116c:	41 c1 fb 04          	sar    $0x4,%r11d
   140051170:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051174:	41 c1 fa 02          	sar    $0x2,%r10d
   140051178:	41 c1 fb 04          	sar    $0x4,%r11d
   14005117c:	41 c1 fb 09          	sar    $0x9,%r11d
   140051180:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051184:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051188:	41 c1 fa 05          	sar    $0x5,%r10d
   14005118c:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051190:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051194:	45 31 da             	xor    %r11d,%r10d
   140051197:	41 81 f2 38 fc d0 23 	xor    $0x23d0fc38,%r10d
   14005119e:	41 c1 fa 1f          	sar    $0x1f,%r10d
   1400511a2:	45 89 d3             	mov    %r10d,%r11d
   1400511a5:	41 ff c3             	inc    %r11d
   1400511a8:	41 83 e3 fe          	and    $0xfffffffe,%r11d
   1400511ac:	45 85 db             	test   %r11d,%r11d
   1400511af:	75 0a                	jne    0x1400511bb
   1400511b1:	49 c1 cb 20          	ror    $0x20,%r11
   1400511b5:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   1400511b9:	eb 11                	jmp    0x1400511cc
   1400511bb:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400511bf:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   1400511c6:	01 00 00 
   1400511c9:	45 8b 13             	mov    (%r11),%r10d
   1400511cc:	41 5b                	pop    %r11
   1400511ce:	41 5a                	pop    %r10
   1400511d0:	9d                   	popf
   1400511d1:	45 31 c9             	xor    %r9d,%r9d
   1400511d4:	3d 18 8b 00 00       	cmp    $0x8b18,%eax
   1400511d9:	0f 84 00 6d 00 00    	je     0x140057edf
   1400511df:	9c                   	pushf
   1400511e0:	57                   	push   %rdi
   1400511e1:	53                   	push   %rbx
   1400511e2:	bf 06 a1 25 13       	mov    $0x1325a106,%edi
   1400511e7:	89 fb                	mov    %edi,%ebx
   1400511e9:	c1 fb 0d             	sar    $0xd,%ebx
   1400511ec:	c1 fb 09             	sar    $0x9,%ebx
   1400511ef:	c1 ff 04             	sar    $0x4,%edi
   1400511f2:	c1 fb 02             	sar    $0x2,%ebx
   1400511f5:	c1 ff 11             	sar    $0x11,%edi
   1400511f8:	d1 fb                	sar    $1,%ebx
   1400511fa:	c1 ff 1f             	sar    $0x1f,%edi
   1400511fd:	c1 ff 1f             	sar    $0x1f,%edi
   140051200:	c1 ff 11             	sar    $0x11,%edi
   140051203:	d1 ff                	sar    $1,%edi
   140051205:	c1 ff 04             	sar    $0x4,%edi
   140051208:	d1 ff                	sar    $1,%edi
   14005120a:	c1 ff 03             	sar    $0x3,%edi
   14005120d:	c1 ff 04             	sar    $0x4,%edi
   140051210:	c1 fb 05             	sar    $0x5,%ebx
   140051213:	c1 ff 08             	sar    $0x8,%edi
   140051216:	c1 fb 04             	sar    $0x4,%ebx
   140051219:	c1 fb 0f             	sar    $0xf,%ebx
   14005121c:	c1 ff 1f             	sar    $0x1f,%edi
   14005121f:	c1 fb 0b             	sar    $0xb,%ebx
   140051222:	c1 ff 08             	sar    $0x8,%edi
   140051225:	c1 ff 11             	sar    $0x11,%edi
   140051228:	c1 fb 04             	sar    $0x4,%ebx
   14005122b:	c1 ff 05             	sar    $0x5,%edi
   14005122e:	c1 fb 1f             	sar    $0x1f,%ebx
   140051231:	c1 fb 11             	sar    $0x11,%ebx
   140051234:	c1 fb 08             	sar    $0x8,%ebx
   140051237:	c1 fb 1f             	sar    $0x1f,%ebx
   14005123a:	c1 ff 0f             	sar    $0xf,%edi
   14005123d:	c1 fb 1f             	sar    $0x1f,%ebx
   140051240:	c1 fb 15             	sar    $0x15,%ebx
   140051243:	c1 ff 08             	sar    $0x8,%edi
   140051246:	31 df                	xor    %ebx,%edi
   140051248:	81 f7 1b 0a 93 53    	xor    $0x53930a1b,%edi
   14005124e:	c1 ff 1f             	sar    $0x1f,%edi
   140051251:	89 fb                	mov    %edi,%ebx
   140051253:	d1 fb                	sar    $1,%ebx
   140051255:	31 fb                	xor    %edi,%ebx
   140051257:	85 db                	test   %ebx,%ebx
   140051259:	75 08                	jne    0x140051263
   14005125b:	48 0f cb             	bswap  %rbx
   14005125e:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   140051261:	eb 0f                	jmp    0x140051272
   140051263:	c1 ff 0d             	sar    $0xd,%edi
   140051266:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   14005126d:	01 00 00 
   140051270:	8b 3b                	mov    (%rbx),%edi
   140051272:	5b                   	pop    %rbx
   140051273:	5f                   	pop    %rdi
   140051274:	9d                   	popf
   140051275:	bd 56 34 12 5a       	mov    $0x5a123456,%ebp
   14005127a:	9c                   	pushf
   14005127b:	51                   	push   %rcx
   14005127c:	41 50                	push   %r8
   14005127e:	b9 58 70 18 37       	mov    $0x37187058,%ecx
   140051283:	41 89 c8             	mov    %ecx,%r8d
   140051286:	c1 f9 09             	sar    $0x9,%ecx
   140051289:	41 c1 f8 11          	sar    $0x11,%r8d
   14005128d:	41 c1 f8 03          	sar    $0x3,%r8d
   140051291:	c1 f9 05             	sar    $0x5,%ecx
   140051294:	41 c1 f8 09          	sar    $0x9,%r8d
   140051298:	c1 f9 0d             	sar    $0xd,%ecx
   14005129b:	41 c1 f8 02          	sar    $0x2,%r8d
   14005129f:	c1 f9 08             	sar    $0x8,%ecx
   1400512a2:	c1 f9 04             	sar    $0x4,%ecx
   1400512a5:	c1 f9 0b             	sar    $0xb,%ecx
   1400512a8:	c1 f9 04             	sar    $0x4,%ecx
   1400512ab:	41 c1 f8 05          	sar    $0x5,%r8d
   1400512af:	c1 f9 05             	sar    $0x5,%ecx
   1400512b2:	c1 f9 0b             	sar    $0xb,%ecx
   1400512b5:	c1 f9 03             	sar    $0x3,%ecx
   1400512b8:	d1 f9                	sar    $1,%ecx
   1400512ba:	c1 f9 02             	sar    $0x2,%ecx
   1400512bd:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400512c1:	c1 f9 0b             	sar    $0xb,%ecx
   1400512c4:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400512c8:	c1 f9 0f             	sar    $0xf,%ecx
   1400512cb:	41 d1 f8             	sar    $1,%r8d
   1400512ce:	c1 f9 09             	sar    $0x9,%ecx
   1400512d1:	41 c1 f8 09          	sar    $0x9,%r8d
   1400512d5:	41 d1 f8             	sar    $1,%r8d
   1400512d8:	c1 f9 02             	sar    $0x2,%ecx
   1400512db:	41 c1 f8 03          	sar    $0x3,%r8d
   1400512df:	41 c1 f8 08          	sar    $0x8,%r8d
   1400512e3:	41 c1 f8 07          	sar    $0x7,%r8d
   1400512e7:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400512eb:	44 31 c1             	xor    %r8d,%ecx
   1400512ee:	81 f1 76 3a 82 2f    	xor    $0x2f823a76,%ecx
   1400512f4:	c1 f9 1f             	sar    $0x1f,%ecx
   1400512f7:	41 89 c8             	mov    %ecx,%r8d
   1400512fa:	41 d1 f8             	sar    $1,%r8d
   1400512fd:	41 31 c8             	xor    %ecx,%r8d
   140051300:	45 85 c0             	test   %r8d,%r8d
   140051303:	75 09                	jne    0x14005130e
   140051305:	49 0f c8             	bswap  %r8
   140051308:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   14005130c:	eb 10                	jmp    0x14005131e
   14005130e:	c1 f9 0d             	sar    $0xd,%ecx
   140051311:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140051318:	01 00 00 
   14005131b:	41 8b 08             	mov    (%r8),%ecx
   14005131e:	41 58                	pop    %r8
   140051320:	59                   	pop    %rcx
   140051321:	9d                   	popf
   140051322:	45 31 f6             	xor    %r14d,%r14d
   140051325:	9c                   	pushf
   140051326:	50                   	push   %rax
   140051327:	52                   	push   %rdx
   140051328:	b8 52 ed 14 29       	mov    $0x2914ed52,%eax
   14005132d:	89 c2                	mov    %eax,%edx
   14005132f:	c1 fa 02             	sar    $0x2,%edx
   140051332:	c1 fa 15             	sar    $0x15,%edx
   140051335:	c1 f8 0f             	sar    $0xf,%eax
   140051338:	c1 f8 11             	sar    $0x11,%eax
   14005133b:	c1 fa 03             	sar    $0x3,%edx
   14005133e:	c1 f8 07             	sar    $0x7,%eax
   140051341:	c1 f8 02             	sar    $0x2,%eax
   140051344:	c1 fa 08             	sar    $0x8,%edx
   140051347:	c1 fa 1f             	sar    $0x1f,%edx
   14005134a:	c1 fa 0f             	sar    $0xf,%edx
   14005134d:	c1 fa 15             	sar    $0x15,%edx
   140051350:	c1 f8 0f             	sar    $0xf,%eax
   140051353:	c1 fa 04             	sar    $0x4,%edx
   140051356:	c1 fa 08             	sar    $0x8,%edx
   140051359:	c1 f8 0b             	sar    $0xb,%eax
   14005135c:	c1 f8 15             	sar    $0x15,%eax
   14005135f:	c1 f8 02             	sar    $0x2,%eax
   140051362:	c1 f8 02             	sar    $0x2,%eax
   140051365:	c1 fa 0f             	sar    $0xf,%edx
   140051368:	c1 fa 05             	sar    $0x5,%edx
   14005136b:	c1 f8 03             	sar    $0x3,%eax
   14005136e:	c1 fa 0b             	sar    $0xb,%edx
   140051371:	d1 fa                	sar    $1,%edx
   140051373:	c1 f8 0f             	sar    $0xf,%eax
   140051376:	c1 f8 02             	sar    $0x2,%eax
   140051379:	c1 f8 02             	sar    $0x2,%eax
   14005137c:	d1 f8                	sar    $1,%eax
   14005137e:	c1 fa 02             	sar    $0x2,%edx
   140051381:	c1 fa 15             	sar    $0x15,%edx
   140051384:	c1 f8 11             	sar    $0x11,%eax
   140051387:	d1 f8                	sar    $1,%eax
   140051389:	c1 fa 02             	sar    $0x2,%edx
   14005138c:	c1 f8 04             	sar    $0x4,%eax
   14005138f:	c1 fa 05             	sar    $0x5,%edx
   140051392:	c1 fa 15             	sar    $0x15,%edx
   140051395:	c1 fa 0d             	sar    $0xd,%edx
   140051398:	c1 f8 03             	sar    $0x3,%eax
   14005139b:	c1 f8 07             	sar    $0x7,%eax
   14005139e:	31 d0                	xor    %edx,%eax
   1400513a0:	35 49 78 a2 6f       	xor    $0x6fa27849,%eax
   1400513a5:	c1 f8 1f             	sar    $0x1f,%eax
   1400513a8:	89 c2                	mov    %eax,%edx
   1400513aa:	ff c2                	inc    %edx
   1400513ac:	83 e2 fe             	and    $0xfffffffe,%edx
   1400513af:	85 d2                	test   %edx,%edx
   1400513b1:	75 08                	jne    0x1400513bb
   1400513b3:	48 0f ca             	bswap  %rdx
   1400513b6:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   1400513b9:	eb 0f                	jmp    0x1400513ca
   1400513bb:	c1 f8 0d             	sar    $0xd,%eax
   1400513be:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400513c5:	01 00 00 
   1400513c8:	8b 02                	mov    (%rdx),%eax
   1400513ca:	5a                   	pop    %rdx
   1400513cb:	58                   	pop    %rax
   1400513cc:	9d                   	popf
   1400513cd:	be d4 4c 00 00       	mov    $0x4cd4,%esi
   1400513d2:	9c                   	pushf
   1400513d3:	57                   	push   %rdi
   1400513d4:	53                   	push   %rbx
   1400513d5:	48 bf 9b cc e7 cf 1d 	movabs $0x6eeb7f1dcfe7cc9b,%rdi
   1400513dc:	7f eb 6e 
   1400513df:	48 89 fb             	mov    %rdi,%rbx
   1400513e2:	48 c1 fb 1b          	sar    $0x1b,%rbx
   1400513e6:	48 c1 fb 15          	sar    $0x15,%rbx
   1400513ea:	48 c1 ff 0d          	sar    $0xd,%rdi
   1400513ee:	48 c1 fb 11          	sar    $0x11,%rbx
   1400513f2:	48 c1 ff 0d          	sar    $0xd,%rdi
   1400513f6:	48 c1 fb 05          	sar    $0x5,%rbx
   1400513fa:	48 c1 ff 1f          	sar    $0x1f,%rdi
   1400513fe:	48 d1 fb             	sar    $1,%rbx
   140051401:	48 c1 fb 0d          	sar    $0xd,%rbx
   140051405:	48 c1 ff 09          	sar    $0x9,%rdi
   140051409:	48 c1 fb 11          	sar    $0x11,%rbx
   14005140d:	48 c1 ff 1b          	sar    $0x1b,%rdi
   140051411:	48 c1 fb 1b          	sar    $0x1b,%rbx
   140051415:	48 d1 fb             	sar    $1,%rbx
   140051418:	48 c1 fb 11          	sar    $0x11,%rbx
   14005141c:	48 c1 fb 02          	sar    $0x2,%rbx
   140051420:	48 c1 ff 0d          	sar    $0xd,%rdi
   140051424:	48 c1 fb 0b          	sar    $0xb,%rbx
   140051428:	48 c1 ff 09          	sar    $0x9,%rdi
   14005142c:	48 c1 ff 0b          	sar    $0xb,%rdi
   140051430:	48 c1 fb 07          	sar    $0x7,%rbx
   140051434:	48 c1 fb 04          	sar    $0x4,%rbx
   140051438:	48 c1 fb 0d          	sar    $0xd,%rbx
   14005143c:	48 c1 ff 03          	sar    $0x3,%rdi
   140051440:	48 c1 ff 11          	sar    $0x11,%rdi
   140051444:	48 c1 fb 0b          	sar    $0xb,%rbx
   140051448:	48 31 df             	xor    %rbx,%rdi
   14005144b:	48 bb 09 7c 1b c7 3d 	movabs $0x7aad753dc71b7c09,%rbx
   140051452:	75 ad 7a 
   140051455:	48 31 df             	xor    %rbx,%rdi
   140051458:	48 c1 ff 3f          	sar    $0x3f,%rdi
   14005145c:	48 89 fb             	mov    %rdi,%rbx
   14005145f:	48 ff c3             	inc    %rbx
   140051462:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
   140051466:	48 85 db             	test   %rbx,%rbx
   140051469:	75 0a                	jne    0x140051475
   14005146b:	48 c1 cb 20          	ror    $0x20,%rbx
   14005146f:	48 8b 3c dc          	mov    (%rsp,%rbx,8),%rdi
   140051473:	eb 11                	jmp    0x140051486
   140051475:	48 c1 ff 11          	sar    $0x11,%rdi
   140051479:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140051480:	01 00 00 
   140051483:	48 8b 3b             	mov    (%rbx),%rdi
   140051486:	5b                   	pop    %rbx
   140051487:	5f                   	pop    %rdi
   140051488:	9d                   	popf
   140051489:	48 8d 3d e0 ae 00 00 	lea    0xaee0(%rip),%rdi        # 0x14005c370
   140051490:	9c                   	pushf
   140051491:	51                   	push   %rcx
   140051492:	41 50                	push   %r8
   140051494:	b9 3e 7a 5a 20       	mov    $0x205a7a3e,%ecx
   140051499:	41 89 c8             	mov    %ecx,%r8d
   14005149c:	c1 f9 02             	sar    $0x2,%ecx
   14005149f:	41 c1 f8 05          	sar    $0x5,%r8d
   1400514a3:	c1 f9 07             	sar    $0x7,%ecx
   1400514a6:	41 c1 f8 03          	sar    $0x3,%r8d
   1400514aa:	41 c1 f8 05          	sar    $0x5,%r8d
   1400514ae:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400514b2:	c1 f9 1f             	sar    $0x1f,%ecx
   1400514b5:	c1 f9 15             	sar    $0x15,%ecx
   1400514b8:	c1 f9 15             	sar    $0x15,%ecx
   1400514bb:	d1 f9                	sar    $1,%ecx
   1400514bd:	c1 f9 09             	sar    $0x9,%ecx
   1400514c0:	c1 f9 05             	sar    $0x5,%ecx
   1400514c3:	c1 f9 02             	sar    $0x2,%ecx
   1400514c6:	c1 f9 09             	sar    $0x9,%ecx
   1400514c9:	d1 f9                	sar    $1,%ecx
   1400514cb:	41 c1 f8 09          	sar    $0x9,%r8d
   1400514cf:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400514d3:	d1 f9                	sar    $1,%ecx
   1400514d5:	41 c1 f8 03          	sar    $0x3,%r8d
   1400514d9:	c1 f9 15             	sar    $0x15,%ecx
   1400514dc:	c1 f9 04             	sar    $0x4,%ecx
   1400514df:	c1 f9 11             	sar    $0x11,%ecx
   1400514e2:	c1 f9 04             	sar    $0x4,%ecx
   1400514e5:	c1 f9 0d             	sar    $0xd,%ecx
   1400514e8:	c1 f9 07             	sar    $0x7,%ecx
   1400514eb:	c1 f9 04             	sar    $0x4,%ecx
   1400514ee:	41 d1 f8             	sar    $1,%r8d
   1400514f1:	c1 f9 0d             	sar    $0xd,%ecx
   1400514f4:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400514f8:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400514fc:	41 c1 f8 0b          	sar    $0xb,%r8d
   140051500:	41 c1 f8 04          	sar    $0x4,%r8d
   140051504:	41 c1 f8 03          	sar    $0x3,%r8d
   140051508:	41 c1 f8 04          	sar    $0x4,%r8d
   14005150c:	41 c1 f8 0f          	sar    $0xf,%r8d
   140051510:	44 31 c1             	xor    %r8d,%ecx
   140051513:	81 f1 73 e7 0e 40    	xor    $0x400ee773,%ecx
   140051519:	c1 f9 1f             	sar    $0x1f,%ecx
   14005151c:	44 8d 41 01          	lea    0x1(%rcx),%r8d
   140051520:	44 0f af c1          	imul   %ecx,%r8d
   140051524:	45 85 c0             	test   %r8d,%r8d
   140051527:	75 09                	jne    0x140051532
   140051529:	49 0f c8             	bswap  %r8
   14005152c:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   140051530:	eb 10                	jmp    0x140051542
   140051532:	c1 f9 0d             	sar    $0xd,%ecx
   140051535:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   14005153c:	01 00 00 
   14005153f:	41 8b 08             	mov    (%r8),%ecx
   140051542:	41 58                	pop    %r8
   140051544:	59                   	pop    %rcx
   140051545:	9d                   	popf
   140051546:	45 31 ff             	xor    %r15d,%r15d
   140051549:	9c                   	pushf
   14005154a:	41 50                	push   %r8
   14005154c:	41 51                	push   %r9
   14005154e:	41 b8 d1 e0 10 34    	mov    $0x3410e0d1,%r8d
   140051554:	45 89 c1             	mov    %r8d,%r9d
   140051557:	41 c1 f8 0b          	sar    $0xb,%r8d
   14005155b:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005155f:	41 c1 f8 15          	sar    $0x15,%r8d
   140051563:	41 c1 f9 0f          	sar    $0xf,%r9d
   140051567:	41 c1 f8 15          	sar    $0x15,%r8d
   14005156b:	41 c1 f8 09          	sar    $0x9,%r8d
   14005156f:	41 c1 f8 15          	sar    $0x15,%r8d
   140051573:	41 c1 f8 05          	sar    $0x5,%r8d
   140051577:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005157b:	41 c1 f8 05          	sar    $0x5,%r8d
   14005157f:	41 c1 f8 03          	sar    $0x3,%r8d
   140051583:	41 c1 f9 09          	sar    $0x9,%r9d
   140051587:	41 c1 f8 03          	sar    $0x3,%r8d
   14005158b:	41 d1 f8             	sar    $1,%r8d
   14005158e:	41 c1 f8 04          	sar    $0x4,%r8d
   140051592:	41 c1 f8 11          	sar    $0x11,%r8d
   140051596:	41 c1 f9 03          	sar    $0x3,%r9d
   14005159a:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005159e:	41 c1 f8 07          	sar    $0x7,%r8d
   1400515a2:	41 c1 f8 15          	sar    $0x15,%r8d
   1400515a6:	41 d1 f8             	sar    $1,%r8d
   1400515a9:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400515ad:	41 c1 f8 05          	sar    $0x5,%r8d
   1400515b1:	41 c1 f9 0f          	sar    $0xf,%r9d
   1400515b5:	41 c1 f8 04          	sar    $0x4,%r8d
   1400515b9:	41 c1 f9 07          	sar    $0x7,%r9d
   1400515bd:	41 c1 f8 11          	sar    $0x11,%r8d
   1400515c1:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400515c5:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400515c9:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400515cd:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400515d1:	41 c1 f9 02          	sar    $0x2,%r9d
   1400515d5:	41 c1 f9 07          	sar    $0x7,%r9d
   1400515d9:	41 c1 f8 03          	sar    $0x3,%r8d
   1400515dd:	41 d1 f8             	sar    $1,%r8d
   1400515e0:	45 31 c8             	xor    %r9d,%r8d
   1400515e3:	41 81 f0 9b 9b ee 53 	xor    $0x53ee9b9b,%r8d
   1400515ea:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400515ee:	45 89 c1             	mov    %r8d,%r9d
   1400515f1:	41 ff c1             	inc    %r9d
   1400515f4:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   1400515f8:	45 85 c9             	test   %r9d,%r9d
   1400515fb:	75 09                	jne    0x140051606
   1400515fd:	49 0f c9             	bswap  %r9
   140051600:	46 8b 04 4c          	mov    (%rsp,%r9,2),%r8d
   140051604:	eb 11                	jmp    0x140051617
   140051606:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005160a:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140051611:	01 00 00 
   140051614:	45 8b 01             	mov    (%r9),%r8d
   140051617:	41 59                	pop    %r9
   140051619:	41 58                	pop    %r8
   14005161b:	9d                   	popf
   14005161c:	31 db                	xor    %ebx,%ebx
   14005161e:	9c                   	pushf
   14005161f:	57                   	push   %rdi
   140051620:	53                   	push   %rbx
   140051621:	48 bf 44 91 34 68 e8 	movabs $0x5d5b14e868349144,%rdi
   140051628:	14 5b 5d 
   14005162b:	48 89 fb             	mov    %rdi,%rbx
   14005162e:	48 c1 fb 0d          	sar    $0xd,%rbx
   140051632:	48 c1 fb 1f          	sar    $0x1f,%rbx
   140051636:	48 c1 fb 15          	sar    $0x15,%rbx
   14005163a:	48 c1 ff 11          	sar    $0x11,%rdi
   14005163e:	48 c1 fb 1b          	sar    $0x1b,%rbx
   140051642:	48 c1 ff 03          	sar    $0x3,%rdi
   140051646:	48 c1 ff 11          	sar    $0x11,%rdi
   14005164a:	48 c1 fb 15          	sar    $0x15,%rbx
   14005164e:	48 c1 fb 1f          	sar    $0x1f,%rbx
   140051652:	48 c1 fb 09          	sar    $0x9,%rbx
   140051656:	48 c1 fb 07          	sar    $0x7,%rbx
   14005165a:	48 d1 ff             	sar    $1,%rdi
   14005165d:	48 c1 ff 0b          	sar    $0xb,%rdi
   140051661:	48 c1 fb 02          	sar    $0x2,%rbx
   140051665:	48 c1 ff 07          	sar    $0x7,%rdi
   140051669:	48 c1 fb 1b          	sar    $0x1b,%rbx
   14005166d:	48 c1 fb 11          	sar    $0x11,%rbx
   140051671:	48 c1 fb 07          	sar    $0x7,%rbx
   140051675:	48 d1 fb             	sar    $1,%rbx
   140051678:	48 c1 ff 11          	sar    $0x11,%rdi
   14005167c:	48 c1 fb 03          	sar    $0x3,%rbx
   140051680:	48 c1 ff 07          	sar    $0x7,%rdi
   140051684:	48 d1 ff             	sar    $1,%rdi
   140051687:	48 c1 ff 09          	sar    $0x9,%rdi
   14005168b:	48 c1 ff 07          	sar    $0x7,%rdi
   14005168f:	48 c1 ff 0b          	sar    $0xb,%rdi
   140051693:	48 31 df             	xor    %rbx,%rdi
   140051696:	48 bb 62 2a 61 db 9f 	movabs $0x43187b9fdb612a62,%rbx
   14005169d:	7b 18 43 
   1400516a0:	48 31 df             	xor    %rbx,%rdi
   1400516a3:	48 c1 ff 3f          	sar    $0x3f,%rdi
   1400516a7:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
   1400516ab:	48 0f af df          	imul   %rdi,%rbx
   1400516af:	48 85 db             	test   %rbx,%rbx
   1400516b2:	75 0a                	jne    0x1400516be
   1400516b4:	48 c1 e3 2a          	shl    $0x2a,%rbx
   1400516b8:	48 8b 3c 1c          	mov    (%rsp,%rbx,1),%rdi
   1400516bc:	eb 11                	jmp    0x1400516cf
   1400516be:	48 c1 ff 11          	sar    $0x11,%rdi
   1400516c2:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400516c9:	01 00 00 
   1400516cc:	48 8b 3b             	mov    (%rbx),%rdi
   1400516cf:	5b                   	pop    %rbx
   1400516d0:	5f                   	pop    %rdi
   1400516d1:	9d                   	popf
   1400516d2:	45 31 ed             	xor    %r13d,%r13d
   1400516d5:	9c                   	pushf
   1400516d6:	52                   	push   %rdx
   1400516d7:	56                   	push   %rsi
   1400516d8:	ba 7e a9 1d 3c       	mov    $0x3c1da97e,%edx
   1400516dd:	89 d6                	mov    %edx,%esi
   1400516df:	c1 fa 08             	sar    $0x8,%edx
   1400516e2:	c1 fa 1f             	sar    $0x1f,%edx
   1400516e5:	c1 fa 03             	sar    $0x3,%edx
   1400516e8:	c1 fe 0d             	sar    $0xd,%esi
   1400516eb:	c1 fa 04             	sar    $0x4,%edx
   1400516ee:	c1 fa 1f             	sar    $0x1f,%edx
   1400516f1:	c1 fa 11             	sar    $0x11,%edx
   1400516f4:	c1 fe 05             	sar    $0x5,%esi
   1400516f7:	c1 fe 1f             	sar    $0x1f,%esi
   1400516fa:	c1 fa 05             	sar    $0x5,%edx
   1400516fd:	c1 fe 03             	sar    $0x3,%esi
   140051700:	c1 fa 15             	sar    $0x15,%edx
   140051703:	c1 fa 03             	sar    $0x3,%edx
   140051706:	c1 fe 1f             	sar    $0x1f,%esi
   140051709:	c1 fe 15             	sar    $0x15,%esi
   14005170c:	c1 fe 07             	sar    $0x7,%esi
   14005170f:	c1 fe 08             	sar    $0x8,%esi
   140051712:	c1 fa 09             	sar    $0x9,%edx
   140051715:	c1 fa 04             	sar    $0x4,%edx
   140051718:	c1 fa 1f             	sar    $0x1f,%edx
   14005171b:	c1 fe 11             	sar    $0x11,%esi
   14005171e:	d1 fe                	sar    $1,%esi
   140051720:	d1 fa                	sar    $1,%edx
   140051722:	c1 fe 09             	sar    $0x9,%esi
   140051725:	c1 fa 1f             	sar    $0x1f,%edx
   140051728:	c1 fa 0b             	sar    $0xb,%edx
   14005172b:	c1 fe 02             	sar    $0x2,%esi
   14005172e:	c1 fe 0f             	sar    $0xf,%esi
   140051731:	c1 fe 0b             	sar    $0xb,%esi
   140051734:	c1 fe 02             	sar    $0x2,%esi
   140051737:	c1 fa 02             	sar    $0x2,%edx
   14005173a:	c1 fe 0f             	sar    $0xf,%esi
   14005173d:	c1 fe 11             	sar    $0x11,%esi
   140051740:	31 f2                	xor    %esi,%edx
   140051742:	81 f2 26 58 2d 6d    	xor    $0x6d2d5826,%edx
   140051748:	c1 fa 1f             	sar    $0x1f,%edx
   14005174b:	89 d6                	mov    %edx,%esi
   14005174d:	d1 fe                	sar    $1,%esi
   14005174f:	31 d6                	xor    %edx,%esi
   140051751:	85 f6                	test   %esi,%esi
   140051753:	75 08                	jne    0x14005175d
   140051755:	48 0f ce             	bswap  %rsi
   140051758:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   14005175b:	eb 0f                	jmp    0x14005176c
   14005175d:	c1 fa 0d             	sar    $0xd,%edx
   140051760:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140051767:	01 00 00 
   14005176a:	8b 16                	mov    (%rsi),%edx
   14005176c:	5e                   	pop    %rsi
   14005176d:	5a                   	pop    %rdx
   14005176e:	9d                   	popf
   14005176f:	45 31 d2             	xor    %r10d,%r10d
   140051772:	9c                   	pushf
   140051773:	41 52                	push   %r10
   140051775:	41 53                	push   %r11
   140051777:	49 ba a7 88 53 62 b1 	movabs $0x3f79a1b1625388a7,%r10
   14005177e:	a1 79 3f 
   140051781:	4d 89 d3             	mov    %r10,%r11
   140051784:	49 d1 fa             	sar    $1,%r10
   140051787:	49 c1 fa 09          	sar    $0x9,%r10
   14005178b:	49 c1 fb 04          	sar    $0x4,%r11
   14005178f:	49 c1 fb 11          	sar    $0x11,%r11
   140051793:	49 c1 fa 03          	sar    $0x3,%r10
   140051797:	49 c1 fa 05          	sar    $0x5,%r10
   14005179b:	49 d1 fa             	sar    $1,%r10
   14005179e:	49 c1 fb 04          	sar    $0x4,%r11
   1400517a2:	49 c1 fa 15          	sar    $0x15,%r10
   1400517a6:	49 c1 fa 05          	sar    $0x5,%r10
   1400517aa:	49 c1 fa 11          	sar    $0x11,%r10
   1400517ae:	49 c1 fb 1b          	sar    $0x1b,%r11
   1400517b2:	49 c1 fa 11          	sar    $0x11,%r10
   1400517b6:	49 c1 fb 02          	sar    $0x2,%r11
   1400517ba:	49 c1 fb 09          	sar    $0x9,%r11
   1400517be:	49 c1 fb 1f          	sar    $0x1f,%r11
   1400517c2:	49 c1 fb 07          	sar    $0x7,%r11
   1400517c6:	49 c1 fa 0b          	sar    $0xb,%r10
   1400517ca:	49 c1 fb 03          	sar    $0x3,%r11
   1400517ce:	49 c1 fb 04          	sar    $0x4,%r11
   1400517d2:	49 c1 fb 15          	sar    $0x15,%r11
   1400517d6:	49 c1 fa 09          	sar    $0x9,%r10
   1400517da:	49 c1 fb 1f          	sar    $0x1f,%r11
   1400517de:	49 c1 fb 05          	sar    $0x5,%r11
   1400517e2:	49 c1 fa 0d          	sar    $0xd,%r10
   1400517e6:	49 c1 fb 15          	sar    $0x15,%r11
   1400517ea:	4d 31 da             	xor    %r11,%r10
   1400517ed:	49 bb 71 d6 21 b0 af 	movabs $0x581e95afb021d671,%r11
   1400517f4:	95 1e 58 
   1400517f7:	4d 31 da             	xor    %r11,%r10
   1400517fa:	49 c1 fa 3f          	sar    $0x3f,%r10
   1400517fe:	4d 8d 5a 01          	lea    0x1(%r10),%r11
   140051802:	4d 0f af da          	imul   %r10,%r11
   140051806:	4d 85 db             	test   %r11,%r11
   140051809:	75 09                	jne    0x140051814
   14005180b:	49 0f cb             	bswap  %r11
   14005180e:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140051812:	eb 11                	jmp    0x140051825
   140051814:	49 c1 fa 11          	sar    $0x11,%r10
   140051818:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   14005181f:	01 00 00 
   140051822:	4d 8b 13             	mov    (%r11),%r10
   140051825:	41 5b                	pop    %r11
   140051827:	41 5a                	pop    %r10
   140051829:	9d                   	popf
   14005182a:	45 31 e4             	xor    %r12d,%r12d
   14005182d:	9c                   	pushf
   14005182e:	52                   	push   %rdx
   14005182f:	56                   	push   %rsi
   140051830:	ba 2d df 4c 25       	mov    $0x254cdf2d,%edx
   140051835:	89 d6                	mov    %edx,%esi
   140051837:	c1 fa 0b             	sar    $0xb,%edx
   14005183a:	c1 fa 02             	sar    $0x2,%edx
   14005183d:	c1 fe 02             	sar    $0x2,%esi
   140051840:	c1 fe 0f             	sar    $0xf,%esi
   140051843:	c1 fe 07             	sar    $0x7,%esi
   140051846:	d1 fa                	sar    $1,%edx
   140051848:	c1 fe 02             	sar    $0x2,%esi
   14005184b:	d1 fe                	sar    $1,%esi
   14005184d:	c1 fe 02             	sar    $0x2,%esi
   140051850:	c1 fe 07             	sar    $0x7,%esi
   140051853:	c1 fe 0b             	sar    $0xb,%esi
   140051856:	c1 fe 15             	sar    $0x15,%esi
   140051859:	c1 fe 07             	sar    $0x7,%esi
   14005185c:	c1 fe 1f             	sar    $0x1f,%esi
   14005185f:	d1 fa                	sar    $1,%edx
   140051861:	d1 fa                	sar    $1,%edx
   140051863:	c1 fe 05             	sar    $0x5,%esi
   140051866:	c1 fa 08             	sar    $0x8,%edx
   140051869:	c1 fa 0b             	sar    $0xb,%edx
   14005186c:	c1 fe 04             	sar    $0x4,%esi
   14005186f:	c1 fa 03             	sar    $0x3,%edx
   140051872:	c1 fa 02             	sar    $0x2,%edx
   140051875:	c1 fe 0f             	sar    $0xf,%esi
   140051878:	c1 fe 09             	sar    $0x9,%esi
   14005187b:	c1 fe 02             	sar    $0x2,%esi
   14005187e:	c1 fa 04             	sar    $0x4,%edx
   140051881:	c1 fe 15             	sar    $0x15,%esi
   140051884:	d1 fa                	sar    $1,%edx
   140051886:	c1 fe 08             	sar    $0x8,%esi
   140051889:	d1 fa                	sar    $1,%edx
   14005188b:	c1 fa 07             	sar    $0x7,%edx
   14005188e:	c1 fe 0b             	sar    $0xb,%esi
   140051891:	c1 fe 15             	sar    $0x15,%esi
   140051894:	c1 fe 05             	sar    $0x5,%esi
   140051897:	31 f2                	xor    %esi,%edx
   140051899:	81 f2 a1 64 0b 1f    	xor    $0x1f0b64a1,%edx
   14005189f:	c1 fa 1f             	sar    $0x1f,%edx
   1400518a2:	89 d6                	mov    %edx,%esi
   1400518a4:	d1 fe                	sar    $1,%esi
   1400518a6:	31 d6                	xor    %edx,%esi
   1400518a8:	85 f6                	test   %esi,%esi
   1400518aa:	75 09                	jne    0x1400518b5
   1400518ac:	48 c1 e6 28          	shl    $0x28,%rsi
   1400518b0:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   1400518b3:	eb 0f                	jmp    0x1400518c4
   1400518b5:	c1 fa 0d             	sar    $0xd,%edx
   1400518b8:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   1400518bf:	01 00 00 
   1400518c2:	8b 16                	mov    (%rsi),%edx
   1400518c4:	5e                   	pop    %rsi
   1400518c5:	5a                   	pop    %rdx
   1400518c6:	9d                   	popf
   1400518c7:	45 31 c9             	xor    %r9d,%r9d
   1400518ca:	9c                   	pushf
   1400518cb:	41 50                	push   %r8
   1400518cd:	41 51                	push   %r9
   1400518cf:	41 b8 b3 25 7a 48    	mov    $0x487a25b3,%r8d
   1400518d5:	45 89 c1             	mov    %r8d,%r9d
   1400518d8:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400518dc:	41 d1 f9             	sar    $1,%r9d
   1400518df:	41 c1 f9 08          	sar    $0x8,%r9d
   1400518e3:	41 c1 f8 03          	sar    $0x3,%r8d
   1400518e7:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400518eb:	41 c1 f9 11          	sar    $0x11,%r9d
   1400518ef:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400518f3:	41 c1 f9 08          	sar    $0x8,%r9d
   1400518f7:	41 c1 f9 05          	sar    $0x5,%r9d
   1400518fb:	41 d1 f8             	sar    $1,%r8d
   1400518fe:	41 c1 f9 0f          	sar    $0xf,%r9d
   140051902:	41 c1 f9 0b          	sar    $0xb,%r9d
   140051906:	41 d1 f9             	sar    $1,%r9d
   140051909:	41 c1 f8 09          	sar    $0x9,%r8d
   14005190d:	41 c1 f9 04          	sar    $0x4,%r9d
   140051911:	41 c1 f9 04          	sar    $0x4,%r9d
   140051915:	41 c1 f9 04          	sar    $0x4,%r9d
   140051919:	41 c1 f8 0f          	sar    $0xf,%r8d
   14005191d:	41 c1 f8 11          	sar    $0x11,%r8d
   140051921:	41 c1 f8 02          	sar    $0x2,%r8d
   140051925:	41 c1 f8 02          	sar    $0x2,%r8d
   140051929:	41 c1 f9 03          	sar    $0x3,%r9d
   14005192d:	41 c1 f9 03          	sar    $0x3,%r9d
   140051931:	41 c1 f8 15          	sar    $0x15,%r8d
   140051935:	41 c1 f8 08          	sar    $0x8,%r8d
   140051939:	41 c1 f8 03          	sar    $0x3,%r8d
   14005193d:	41 c1 f9 03          	sar    $0x3,%r9d
   140051941:	41 c1 f8 03          	sar    $0x3,%r8d
   140051945:	41 c1 f8 07          	sar    $0x7,%r8d
   140051949:	41 c1 f9 15          	sar    $0x15,%r9d
   14005194d:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140051951:	45 31 c8             	xor    %r9d,%r8d
   140051954:	41 81 f0 73 3e ef 63 	xor    $0x63ef3e73,%r8d
   14005195b:	41 c1 f8 1f          	sar    $0x1f,%r8d
   14005195f:	45 89 c1             	mov    %r8d,%r9d
   140051962:	41 d1 f9             	sar    $1,%r9d
   140051965:	45 31 c1             	xor    %r8d,%r9d
   140051968:	45 85 c9             	test   %r9d,%r9d
   14005196b:	75 0a                	jne    0x140051977
   14005196d:	49 c1 e1 2a          	shl    $0x2a,%r9
   140051971:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140051975:	eb 11                	jmp    0x140051988
   140051977:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005197b:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140051982:	01 00 00 
   140051985:	45 8b 01             	mov    (%r9),%r8d
   140051988:	41 59                	pop    %r9
   14005198a:	41 58                	pop    %r8
   14005198c:	9d                   	popf
   14005198d:	e9 aa 0c 00 00       	jmp    0x14005263c
   140051992:	9c                   	pushf
   140051993:	41 52                	push   %r10
   140051995:	41 53                	push   %r11
   140051997:	41 ba ca 97 9d 73    	mov    $0x739d97ca,%r10d
   14005199d:	45 89 d3             	mov    %r10d,%r11d
   1400519a0:	41 c1 fa 1f          	sar    $0x1f,%r10d
   1400519a4:	41 c1 fb 15          	sar    $0x15,%r11d
   1400519a8:	41 c1 fb 05          	sar    $0x5,%r11d
   1400519ac:	41 c1 fa 07          	sar    $0x7,%r10d
   1400519b0:	41 c1 fb 03          	sar    $0x3,%r11d
   1400519b4:	41 c1 fb 11          	sar    $0x11,%r11d
   1400519b8:	41 c1 fb 08          	sar    $0x8,%r11d
   1400519bc:	41 c1 fa 05          	sar    $0x5,%r10d
   1400519c0:	41 d1 fb             	sar    $1,%r11d
   1400519c3:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400519c7:	41 c1 fa 02          	sar    $0x2,%r10d
   1400519cb:	41 c1 fb 1f          	sar    $0x1f,%r11d
   1400519cf:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400519d3:	41 c1 fb 03          	sar    $0x3,%r11d
   1400519d7:	41 c1 fb 08          	sar    $0x8,%r11d
   1400519db:	41 c1 fa 09          	sar    $0x9,%r10d
   1400519df:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400519e3:	41 c1 fb 0f          	sar    $0xf,%r11d
   1400519e7:	41 d1 fa             	sar    $1,%r10d
   1400519ea:	41 c1 fb 0b          	sar    $0xb,%r11d
   1400519ee:	41 c1 fb 0d          	sar    $0xd,%r11d
   1400519f2:	41 c1 fa 11          	sar    $0x11,%r10d
   1400519f6:	41 c1 fa 11          	sar    $0x11,%r10d
   1400519fa:	41 c1 fa 0f          	sar    $0xf,%r10d
   1400519fe:	41 c1 fb 15          	sar    $0x15,%r11d
   140051a02:	41 c1 fa 04          	sar    $0x4,%r10d
   140051a06:	41 c1 fb 08          	sar    $0x8,%r11d
   140051a0a:	41 c1 fb 04          	sar    $0x4,%r11d
   140051a0e:	41 c1 fa 07          	sar    $0x7,%r10d
   140051a12:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051a16:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051a1a:	45 31 da             	xor    %r11d,%r10d
   140051a1d:	41 81 f2 3e bc a6 7f 	xor    $0x7fa6bc3e,%r10d
   140051a24:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051a28:	45 89 d3             	mov    %r10d,%r11d
   140051a2b:	41 d1 fb             	sar    $1,%r11d
   140051a2e:	45 31 d3             	xor    %r10d,%r11d
   140051a31:	45 85 db             	test   %r11d,%r11d
   140051a34:	75 0a                	jne    0x140051a40
   140051a36:	49 c1 e3 26          	shl    $0x26,%r11
   140051a3a:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140051a3e:	eb 11                	jmp    0x140051a51
   140051a40:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051a44:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140051a4b:	01 00 00 
   140051a4e:	45 8b 13             	mov    (%r11),%r10d
   140051a51:	41 5b                	pop    %r11
   140051a53:	41 5a                	pop    %r10
   140051a55:	9d                   	popf
   140051a56:	c7 04 24 56 34 12 5a 	movl   $0x5a123456,(%rsp)
   140051a5d:	9c                   	pushf
   140051a5e:	57                   	push   %rdi
   140051a5f:	53                   	push   %rbx
   140051a60:	bf 71 ce de 3f       	mov    $0x3fdece71,%edi
   140051a65:	89 fb                	mov    %edi,%ebx
   140051a67:	c1 ff 05             	sar    $0x5,%edi
   140051a6a:	c1 ff 15             	sar    $0x15,%edi
   140051a6d:	d1 fb                	sar    $1,%ebx
   140051a6f:	c1 fb 1f             	sar    $0x1f,%ebx
   140051a72:	c1 fb 15             	sar    $0x15,%ebx
   140051a75:	c1 fb 09             	sar    $0x9,%ebx
   140051a78:	c1 ff 11             	sar    $0x11,%edi
   140051a7b:	c1 ff 02             	sar    $0x2,%edi
   140051a7e:	c1 ff 02             	sar    $0x2,%edi
   140051a81:	c1 ff 0b             	sar    $0xb,%edi
   140051a84:	c1 fb 1f             	sar    $0x1f,%ebx
   140051a87:	c1 ff 07             	sar    $0x7,%edi
   140051a8a:	c1 ff 1f             	sar    $0x1f,%edi
   140051a8d:	c1 ff 11             	sar    $0x11,%edi
   140051a90:	c1 fb 11             	sar    $0x11,%ebx
   140051a93:	c1 ff 0f             	sar    $0xf,%edi
   140051a96:	c1 ff 07             	sar    $0x7,%edi
   140051a99:	c1 ff 07             	sar    $0x7,%edi
   140051a9c:	c1 fb 07             	sar    $0x7,%ebx
   140051a9f:	c1 fb 05             	sar    $0x5,%ebx
   140051aa2:	c1 ff 15             	sar    $0x15,%edi
   140051aa5:	c1 ff 02             	sar    $0x2,%edi
   140051aa8:	c1 fb 0b             	sar    $0xb,%ebx
   140051aab:	c1 ff 0f             	sar    $0xf,%edi
   140051aae:	c1 fb 04             	sar    $0x4,%ebx
   140051ab1:	c1 fb 0b             	sar    $0xb,%ebx
   140051ab4:	c1 ff 08             	sar    $0x8,%edi
   140051ab7:	c1 fb 15             	sar    $0x15,%ebx
   140051aba:	c1 fb 09             	sar    $0x9,%ebx
   140051abd:	c1 ff 09             	sar    $0x9,%edi
   140051ac0:	c1 ff 11             	sar    $0x11,%edi
   140051ac3:	c1 fb 1f             	sar    $0x1f,%ebx
   140051ac6:	d1 ff                	sar    $1,%edi
   140051ac8:	31 df                	xor    %ebx,%edi
   140051aca:	81 f7 89 56 f6 65    	xor    $0x65f65689,%edi
   140051ad0:	c1 ff 1f             	sar    $0x1f,%edi
   140051ad3:	8d 5f 01             	lea    0x1(%rdi),%ebx
   140051ad6:	0f af df             	imul   %edi,%ebx
   140051ad9:	85 db                	test   %ebx,%ebx
   140051adb:	75 08                	jne    0x140051ae5
   140051add:	48 0f cb             	bswap  %rbx
   140051ae0:	8b 3c 5c             	mov    (%rsp,%rbx,2),%edi
   140051ae3:	eb 0f                	jmp    0x140051af4
   140051ae5:	c1 ff 0d             	sar    $0xd,%edi
   140051ae8:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140051aef:	01 00 00 
   140051af2:	8b 3b                	mov    (%rbx),%edi
   140051af4:	5b                   	pop    %rbx
   140051af5:	5f                   	pop    %rdi
   140051af6:	9d                   	popf
   140051af7:	8b 04 24             	mov    (%rsp),%eax
   140051afa:	9c                   	pushf
   140051afb:	41 52                	push   %r10
   140051afd:	41 53                	push   %r11
   140051aff:	41 ba 90 18 d6 7f    	mov    $0x7fd61890,%r10d
   140051b05:	45 89 d3             	mov    %r10d,%r11d
   140051b08:	41 c1 fb 03          	sar    $0x3,%r11d
   140051b0c:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051b10:	41 c1 fa 11          	sar    $0x11,%r10d
   140051b14:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051b18:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051b1c:	41 d1 fa             	sar    $1,%r10d
   140051b1f:	41 c1 fa 15          	sar    $0x15,%r10d
   140051b23:	41 c1 fb 15          	sar    $0x15,%r11d
   140051b27:	41 c1 fa 05          	sar    $0x5,%r10d
   140051b2b:	41 c1 fa 07          	sar    $0x7,%r10d
   140051b2f:	41 c1 fa 04          	sar    $0x4,%r10d
   140051b33:	41 c1 fa 04          	sar    $0x4,%r10d
   140051b37:	41 c1 fa 05          	sar    $0x5,%r10d
   140051b3b:	41 c1 fb 15          	sar    $0x15,%r11d
   140051b3f:	41 c1 fa 09          	sar    $0x9,%r10d
   140051b43:	41 c1 fb 07          	sar    $0x7,%r11d
   140051b47:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051b4b:	41 d1 fb             	sar    $1,%r11d
   140051b4e:	41 c1 fa 15          	sar    $0x15,%r10d
   140051b52:	41 c1 fb 11          	sar    $0x11,%r11d
   140051b56:	41 c1 fa 05          	sar    $0x5,%r10d
   140051b5a:	41 d1 fb             	sar    $1,%r11d
   140051b5d:	41 c1 fa 03          	sar    $0x3,%r10d
   140051b61:	41 c1 fb 02          	sar    $0x2,%r11d
   140051b65:	41 c1 fb 09          	sar    $0x9,%r11d
   140051b69:	41 c1 fb 1f          	sar    $0x1f,%r11d
   140051b6d:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051b71:	41 c1 fb 08          	sar    $0x8,%r11d
   140051b75:	41 d1 fa             	sar    $1,%r10d
   140051b78:	41 c1 fb 09          	sar    $0x9,%r11d
   140051b7c:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051b80:	41 c1 fa 07          	sar    $0x7,%r10d
   140051b84:	41 c1 fb 15          	sar    $0x15,%r11d
   140051b88:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051b8c:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051b90:	41 c1 fb 07          	sar    $0x7,%r11d
   140051b94:	41 c1 fb 11          	sar    $0x11,%r11d
   140051b98:	45 31 da             	xor    %r11d,%r10d
   140051b9b:	41 81 f2 1f be d3 35 	xor    $0x35d3be1f,%r10d
   140051ba2:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051ba6:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140051baa:	45 0f af da          	imul   %r10d,%r11d
   140051bae:	45 85 db             	test   %r11d,%r11d
   140051bb1:	75 0a                	jne    0x140051bbd
   140051bb3:	49 c1 e3 26          	shl    $0x26,%r11
   140051bb7:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140051bbb:	eb 11                	jmp    0x140051bce
   140051bbd:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051bc1:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140051bc8:	01 00 00 
   140051bcb:	45 8b 13             	mov    (%r11),%r10d
   140051bce:	41 5b                	pop    %r11
   140051bd0:	41 5a                	pop    %r10
   140051bd2:	9d                   	popf
   140051bd3:	8b 1c 24             	mov    (%rsp),%ebx
   140051bd6:	9c                   	pushf
   140051bd7:	41 52                	push   %r10
   140051bd9:	41 53                	push   %r11
   140051bdb:	41 ba fe 3a a5 43    	mov    $0x43a53afe,%r10d
   140051be1:	45 89 d3             	mov    %r10d,%r11d
   140051be4:	41 d1 fb             	sar    $1,%r11d
   140051be7:	41 c1 fa 02          	sar    $0x2,%r10d
   140051beb:	41 c1 fb 09          	sar    $0x9,%r11d
   140051bef:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051bf3:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051bf7:	41 c1 fb 07          	sar    $0x7,%r11d
   140051bfb:	41 c1 fa 03          	sar    $0x3,%r10d
   140051bff:	41 c1 fb 02          	sar    $0x2,%r11d
   140051c03:	41 c1 fa 02          	sar    $0x2,%r10d
   140051c07:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051c0b:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051c0f:	41 c1 fb 03          	sar    $0x3,%r11d
   140051c13:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051c17:	41 c1 fb 04          	sar    $0x4,%r11d
   140051c1b:	41 c1 fa 09          	sar    $0x9,%r10d
   140051c1f:	41 c1 fa 08          	sar    $0x8,%r10d
   140051c23:	41 c1 fb 15          	sar    $0x15,%r11d
   140051c27:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051c2b:	41 c1 fb 09          	sar    $0x9,%r11d
   140051c2f:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051c33:	41 c1 fa 11          	sar    $0x11,%r10d
   140051c37:	41 c1 fb 03          	sar    $0x3,%r11d
   140051c3b:	41 d1 fb             	sar    $1,%r11d
   140051c3e:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051c42:	41 c1 fb 0f          	sar    $0xf,%r11d
   140051c46:	41 c1 fa 11          	sar    $0x11,%r10d
   140051c4a:	41 c1 fa 08          	sar    $0x8,%r10d
   140051c4e:	41 c1 fb 1f          	sar    $0x1f,%r11d
   140051c52:	41 c1 fa 07          	sar    $0x7,%r10d
   140051c56:	41 c1 fb 03          	sar    $0x3,%r11d
   140051c5a:	41 c1 fb 11          	sar    $0x11,%r11d
   140051c5e:	45 31 da             	xor    %r11d,%r10d
   140051c61:	41 81 f2 a3 37 b4 10 	xor    $0x10b437a3,%r10d
   140051c68:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051c6c:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140051c70:	45 0f af da          	imul   %r10d,%r11d
   140051c74:	45 85 db             	test   %r11d,%r11d
   140051c77:	75 0a                	jne    0x140051c83
   140051c79:	49 c1 e3 2a          	shl    $0x2a,%r11
   140051c7d:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140051c81:	eb 11                	jmp    0x140051c94
   140051c83:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051c87:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140051c8e:	01 00 00 
   140051c91:	45 8b 13             	mov    (%r11),%r10d
   140051c94:	41 5b                	pop    %r11
   140051c96:	41 5a                	pop    %r10
   140051c98:	9d                   	popf
   140051c99:	f7 d3                	not    %ebx
   140051c9b:	9c                   	pushf
   140051c9c:	41 52                	push   %r10
   140051c9e:	41 53                	push   %r11
   140051ca0:	41 ba 10 c8 c2 12    	mov    $0x12c2c810,%r10d
   140051ca6:	45 89 d3             	mov    %r10d,%r11d
   140051ca9:	41 c1 fb 15          	sar    $0x15,%r11d
   140051cad:	41 c1 fb 03          	sar    $0x3,%r11d
   140051cb1:	41 d1 fa             	sar    $1,%r10d
   140051cb4:	41 c1 fb 11          	sar    $0x11,%r11d
   140051cb8:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051cbc:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051cc0:	41 c1 fa 0f          	sar    $0xf,%r10d
   140051cc4:	41 c1 fb 15          	sar    $0x15,%r11d
   140051cc8:	41 c1 fa 04          	sar    $0x4,%r10d
   140051ccc:	41 c1 fa 05          	sar    $0x5,%r10d
   140051cd0:	41 c1 fb 04          	sar    $0x4,%r11d
   140051cd4:	41 d1 fa             	sar    $1,%r10d
   140051cd7:	41 c1 fb 05          	sar    $0x5,%r11d
   140051cdb:	41 c1 fb 02          	sar    $0x2,%r11d
   140051cdf:	41 c1 fb 08          	sar    $0x8,%r11d
   140051ce3:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051ce7:	41 c1 fa 05          	sar    $0x5,%r10d
   140051ceb:	41 c1 fb 15          	sar    $0x15,%r11d
   140051cef:	41 c1 fb 08          	sar    $0x8,%r11d
   140051cf3:	41 c1 fa 11          	sar    $0x11,%r10d
   140051cf7:	41 c1 fb 03          	sar    $0x3,%r11d
   140051cfb:	41 c1 fa 0b          	sar    $0xb,%r10d
   140051cff:	41 c1 fb 09          	sar    $0x9,%r11d
   140051d03:	41 c1 fa 07          	sar    $0x7,%r10d
   140051d07:	41 c1 fb 0d          	sar    $0xd,%r11d
   140051d0b:	41 c1 fb 08          	sar    $0x8,%r11d
   140051d0f:	41 c1 fb 08          	sar    $0x8,%r11d
   140051d13:	41 c1 fb 0b          	sar    $0xb,%r11d
   140051d17:	41 c1 fa 07          	sar    $0x7,%r10d
   140051d1b:	41 d1 fa             	sar    $1,%r10d
   140051d1e:	45 31 da             	xor    %r11d,%r10d
   140051d21:	41 81 f2 5c ff a5 13 	xor    $0x13a5ff5c,%r10d
   140051d28:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140051d2c:	45 89 d3             	mov    %r10d,%r11d
   140051d2f:	41 d1 fb             	sar    $1,%r11d
   140051d32:	45 31 d3             	xor    %r10d,%r11d
   140051d35:	45 85 db             	test   %r11d,%r11d
   140051d38:	75 0a                	jne    0x140051d44
   140051d3a:	49 c1 e3 2a          	shl    $0x2a,%r11
   140051d3e:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140051d42:	eb 11                	jmp    0x140051d55
   140051d44:	41 c1 fa 0d          	sar    $0xd,%r10d
   140051d48:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140051d4f:	01 00 00 
   140051d52:	45 8b 13             	mov    (%r11),%r10d
   140051d55:	41 5b                	pop    %r11
   140051d57:	41 5a                	pop    %r10
   140051d59:	9d                   	popf
   140051d5a:	0f af d8             	imul   %eax,%ebx
   140051d5d:	9c                   	pushf
   140051d5e:	41 50                	push   %r8
   140051d60:	41 51                	push   %r9
   140051d62:	49 b8 67 22 76 fd 47 	movabs $0x2a8a4a47fd762267,%r8
   140051d69:	4a 8a 2a 
   140051d6c:	4d 89 c1             	mov    %r8,%r9
   140051d6f:	49 c1 f8 02          	sar    $0x2,%r8
   140051d73:	49 c1 f8 09          	sar    $0x9,%r8
   140051d77:	49 d1 f8             	sar    $1,%r8
   140051d7a:	49 d1 f8             	sar    $1,%r8
   140051d7d:	49 c1 f9 04          	sar    $0x4,%r9
   140051d81:	49 c1 f8 02          	sar    $0x2,%r8
   140051d85:	49 c1 f8 09          	sar    $0x9,%r8
   140051d89:	49 c1 f9 09          	sar    $0x9,%r9
   140051d8d:	49 c1 f8 11          	sar    $0x11,%r8
   140051d91:	49 c1 f8 1b          	sar    $0x1b,%r8
   140051d95:	49 c1 f8 1f          	sar    $0x1f,%r8
   140051d99:	49 c1 f9 1b          	sar    $0x1b,%r9
   140051d9d:	49 c1 f9 02          	sar    $0x2,%r9
   140051da1:	49 c1 f9 15          	sar    $0x15,%r9
   140051da5:	49 c1 f9 0d          	sar    $0xd,%r9
   140051da9:	49 c1 f9 11          	sar    $0x11,%r9
   140051dad:	49 c1 f9 0d          	sar    $0xd,%r9
   140051db1:	49 c1 f9 1f          	sar    $0x1f,%r9
   140051db5:	49 c1 f9 1b          	sar    $0x1b,%r9
   140051db9:	49 c1 f8 0b          	sar    $0xb,%r8
   140051dbd:	49 c1 f9 0d          	sar    $0xd,%r9
   140051dc1:	49 c1 f8 05          	sar    $0x5,%r8
   140051dc5:	49 c1 f8 05          	sar    $0x5,%r8
   140051dc9:	49 c1 f8 0d          	sar    $0xd,%r8
   140051dcd:	49 d1 f9             	sar    $1,%r9
   140051dd0:	4d 31 c8             	xor    %r9,%r8
   140051dd3:	49 b9 ea eb 22 8e 26 	movabs $0x771f1d268e22ebea,%r9
   140051dda:	1d 1f 77 
   140051ddd:	4d 31 c8             	xor    %r9,%r8
   140051de0:	49 c1 f8 3f          	sar    $0x3f,%r8
   140051de4:	4d 89 c1             	mov    %r8,%r9
   140051de7:	49 d1 f9             	sar    $1,%r9
   140051dea:	4d 31 c1             	xor    %r8,%r9
   140051ded:	4d 85 c9             	test   %r9,%r9
   140051df0:	75 0a                	jne    0x140051dfc
   140051df2:	49 c1 e1 28          	shl    $0x28,%r9
   140051df6:	4e 8b 04 cc          	mov    (%rsp,%r9,8),%r8
   140051dfa:	eb 11                	jmp    0x140051e0d
   140051dfc:	49 c1 f8 11          	sar    $0x11,%r8
   140051e00:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140051e07:	01 00 00 
   140051e0a:	4d 8b 01             	mov    (%r9),%r8
   140051e0d:	41 59                	pop    %r9
   140051e0f:	41 58                	pop    %r8
   140051e11:	9d                   	popf
   140051e12:	83 e3 01             	and    $0x1,%ebx
   140051e15:	9c                   	pushf
   140051e16:	52                   	push   %rdx
   140051e17:	56                   	push   %rsi
   140051e18:	ba 16 f4 b5 34       	mov    $0x34b5f416,%edx
   140051e1d:	89 d6                	mov    %edx,%esi
   140051e1f:	c1 fe 0b             	sar    $0xb,%esi
   140051e22:	c1 fe 11             	sar    $0x11,%esi
   140051e25:	c1 fa 1f             	sar    $0x1f,%edx
   140051e28:	c1 fa 03             	sar    $0x3,%edx
   140051e2b:	c1 fa 0f             	sar    $0xf,%edx
   140051e2e:	c1 fa 02             	sar    $0x2,%edx
   140051e31:	c1 fa 03             	sar    $0x3,%edx
   140051e34:	c1 fe 05             	sar    $0x5,%esi
   140051e37:	c1 fe 04             	sar    $0x4,%esi
   140051e3a:	c1 fe 09             	sar    $0x9,%esi
   140051e3d:	c1 fe 02             	sar    $0x2,%esi
   140051e40:	c1 fa 02             	sar    $0x2,%edx
   140051e43:	c1 fa 15             	sar    $0x15,%edx
   140051e46:	c1 fe 1f             	sar    $0x1f,%esi
   140051e49:	c1 fe 0f             	sar    $0xf,%esi
   140051e4c:	c1 fe 09             	sar    $0x9,%esi
   140051e4f:	c1 fe 1f             	sar    $0x1f,%esi
   140051e52:	c1 fa 04             	sar    $0x4,%edx
   140051e55:	c1 fa 05             	sar    $0x5,%edx
   140051e58:	c1 fa 0b             	sar    $0xb,%edx
   140051e5b:	c1 fe 08             	sar    $0x8,%esi
   140051e5e:	c1 fe 04             	sar    $0x4,%esi
   140051e61:	c1 fa 03             	sar    $0x3,%edx
   140051e64:	c1 fe 0d             	sar    $0xd,%esi
   140051e67:	c1 fa 0d             	sar    $0xd,%edx
   140051e6a:	c1 fe 15             	sar    $0x15,%esi
   140051e6d:	d1 fa                	sar    $1,%edx
   140051e6f:	c1 fa 04             	sar    $0x4,%edx
   140051e72:	c1 fe 11             	sar    $0x11,%esi
   140051e75:	c1 fa 11             	sar    $0x11,%edx
   140051e78:	c1 fe 02             	sar    $0x2,%esi
   140051e7b:	c1 fa 08             	sar    $0x8,%edx
   140051e7e:	c1 fa 15             	sar    $0x15,%edx
   140051e81:	c1 fa 04             	sar    $0x4,%edx
   140051e84:	c1 fe 15             	sar    $0x15,%esi
   140051e87:	c1 fe 08             	sar    $0x8,%esi
   140051e8a:	c1 fe 11             	sar    $0x11,%esi
   140051e8d:	c1 fa 0d             	sar    $0xd,%edx
   140051e90:	31 f2                	xor    %esi,%edx
   140051e92:	81 f2 2b 15 50 37    	xor    $0x3750152b,%edx
   140051e98:	c1 fa 1f             	sar    $0x1f,%edx
   140051e9b:	8d 72 01             	lea    0x1(%rdx),%esi
   140051e9e:	0f af f2             	imul   %edx,%esi
   140051ea1:	85 f6                	test   %esi,%esi
   140051ea3:	75 09                	jne    0x140051eae
   140051ea5:	48 c1 e6 26          	shl    $0x26,%rsi
   140051ea9:	8b 14 74             	mov    (%rsp,%rsi,2),%edx
   140051eac:	eb 0f                	jmp    0x140051ebd
   140051eae:	c1 fa 0d             	sar    $0xd,%edx
   140051eb1:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140051eb8:	01 00 00 
   140051ebb:	8b 16                	mov    (%rsi),%edx
   140051ebd:	5e                   	pop    %rsi
   140051ebe:	5a                   	pop    %rdx
   140051ebf:	9d                   	popf
   140051ec0:	f7 db                	neg    %ebx
   140051ec2:	9c                   	pushf
   140051ec3:	50                   	push   %rax
   140051ec4:	52                   	push   %rdx
   140051ec5:	48 b8 7b e9 c2 77 b8 	movabs $0x3f244db877c2e97b,%rax
   140051ecc:	4d 24 3f 
   140051ecf:	48 89 c2             	mov    %rax,%rdx
   140051ed2:	48 c1 f8 0d          	sar    $0xd,%rax
   140051ed6:	48 c1 f8 15          	sar    $0x15,%rax
   140051eda:	48 c1 fa 0b          	sar    $0xb,%rdx
   140051ede:	48 c1 f8 04          	sar    $0x4,%rax
   140051ee2:	48 c1 f8 15          	sar    $0x15,%rax
   140051ee6:	48 c1 f8 0d          	sar    $0xd,%rax
   140051eea:	48 c1 fa 05          	sar    $0x5,%rdx
   140051eee:	48 c1 f8 03          	sar    $0x3,%rax
   140051ef2:	48 c1 f8 03          	sar    $0x3,%rax
   140051ef6:	48 c1 f8 03          	sar    $0x3,%rax
   140051efa:	48 c1 f8 1b          	sar    $0x1b,%rax
   140051efe:	48 c1 fa 09          	sar    $0x9,%rdx
   140051f02:	48 c1 fa 05          	sar    $0x5,%rdx
   140051f06:	48 c1 f8 15          	sar    $0x15,%rax
   140051f0a:	48 c1 f8 07          	sar    $0x7,%rax
   140051f0e:	48 c1 fa 07          	sar    $0x7,%rdx
   140051f12:	48 c1 fa 05          	sar    $0x5,%rdx
   140051f16:	48 c1 fa 0d          	sar    $0xd,%rdx
   140051f1a:	48 c1 fa 02          	sar    $0x2,%rdx
   140051f1e:	48 c1 fa 0b          	sar    $0xb,%rdx
   140051f22:	48 c1 fa 03          	sar    $0x3,%rdx
   140051f26:	48 c1 fa 11          	sar    $0x11,%rdx
   140051f2a:	48 c1 fa 0b          	sar    $0xb,%rdx
   140051f2e:	48 c1 f8 02          	sar    $0x2,%rax
   140051f32:	48 31 d0             	xor    %rdx,%rax
   140051f35:	48 ba b7 83 48 0d c1 	movabs $0x47d506c10d4883b7,%rdx
   140051f3c:	06 d5 47 
   140051f3f:	48 31 d0             	xor    %rdx,%rax
   140051f42:	48 c1 f8 3f          	sar    $0x3f,%rax
   140051f46:	48 89 c2             	mov    %rax,%rdx
   140051f49:	48 ff c2             	inc    %rdx
   140051f4c:	48 83 e2 fe          	and    $0xfffffffffffffffe,%rdx
   140051f50:	48 85 d2             	test   %rdx,%rdx
   140051f53:	75 0a                	jne    0x140051f5f
   140051f55:	48 c1 e2 26          	shl    $0x26,%rdx
   140051f59:	48 8b 04 d4          	mov    (%rsp,%rdx,8),%rax
   140051f5d:	eb 11                	jmp    0x140051f70
   140051f5f:	48 c1 f8 11          	sar    $0x11,%rax
   140051f63:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140051f6a:	01 00 00 
   140051f6d:	48 8b 02             	mov    (%rdx),%rax
   140051f70:	5a                   	pop    %rdx
   140051f71:	58                   	pop    %rax
   140051f72:	9d                   	popf
   140051f73:	81 e3 ef be ad de    	and    $0xdeadbeef,%ebx
   140051f79:	9c                   	pushf
   140051f7a:	50                   	push   %rax
   140051f7b:	52                   	push   %rdx
   140051f7c:	b8 91 1e b1 2f       	mov    $0x2fb11e91,%eax
   140051f81:	89 c2                	mov    %eax,%edx
   140051f83:	c1 f8 05             	sar    $0x5,%eax
   140051f86:	c1 f8 08             	sar    $0x8,%eax
   140051f89:	c1 f8 0b             	sar    $0xb,%eax
   140051f8c:	c1 fa 05             	sar    $0x5,%edx
   140051f8f:	c1 f8 05             	sar    $0x5,%eax
   140051f92:	c1 fa 02             	sar    $0x2,%edx
   140051f95:	c1 fa 02             	sar    $0x2,%edx
   140051f98:	c1 fa 09             	sar    $0x9,%edx
   140051f9b:	c1 fa 03             	sar    $0x3,%edx
   140051f9e:	c1 fa 0b             	sar    $0xb,%edx
   140051fa1:	c1 f8 0f             	sar    $0xf,%eax
   140051fa4:	c1 fa 04             	sar    $0x4,%edx
   140051fa7:	c1 fa 04             	sar    $0x4,%edx
   140051faa:	c1 f8 1f             	sar    $0x1f,%eax
   140051fad:	c1 f8 15             	sar    $0x15,%eax
   140051fb0:	c1 f8 0d             	sar    $0xd,%eax
   140051fb3:	c1 fa 03             	sar    $0x3,%edx
   140051fb6:	d1 fa                	sar    $1,%edx
   140051fb8:	c1 fa 09             	sar    $0x9,%edx
   140051fbb:	c1 fa 0b             	sar    $0xb,%edx
   140051fbe:	c1 f8 05             	sar    $0x5,%eax
   140051fc1:	c1 fa 04             	sar    $0x4,%edx
   140051fc4:	c1 fa 08             	sar    $0x8,%edx
   140051fc7:	c1 fa 11             	sar    $0x11,%edx
   140051fca:	c1 f8 02             	sar    $0x2,%eax
   140051fcd:	c1 fa 04             	sar    $0x4,%edx
   140051fd0:	31 d0                	xor    %edx,%eax
   140051fd2:	35 2d 9a 2b 16       	xor    $0x162b9a2d,%eax
   140051fd7:	c1 f8 1f             	sar    $0x1f,%eax
   140051fda:	89 c2                	mov    %eax,%edx
   140051fdc:	d1 fa                	sar    $1,%edx
   140051fde:	31 c2                	xor    %eax,%edx
   140051fe0:	85 d2                	test   %edx,%edx
   140051fe2:	75 09                	jne    0x140051fed
   140051fe4:	48 c1 ca 20          	ror    $0x20,%rdx
   140051fe8:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   140051feb:	eb 0f                	jmp    0x140051ffc
   140051fed:	c1 f8 0d             	sar    $0xd,%eax
   140051ff0:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140051ff7:	01 00 00 
   140051ffa:	8b 02                	mov    (%rdx),%eax
   140051ffc:	5a                   	pop    %rdx
   140051ffd:	58                   	pop    %rax
   140051ffe:	9d                   	popf
   140051fff:	bd 56 34 12 5a       	mov    $0x5a123456,%ebp
   140052004:	9c                   	pushf
   140052005:	57                   	push   %rdi
   140052006:	53                   	push   %rbx
   140052007:	48 bf 3f 0e 87 9e e7 	movabs $0x7393f1e79e870e3f,%rdi
   14005200e:	f1 93 73 
   140052011:	48 89 fb             	mov    %rdi,%rbx
   140052014:	48 c1 ff 09          	sar    $0x9,%rdi
   140052018:	48 c1 fb 15          	sar    $0x15,%rbx
   14005201c:	48 c1 fb 04          	sar    $0x4,%rbx
   140052020:	48 c1 ff 05          	sar    $0x5,%rdi
   140052024:	48 c1 ff 15          	sar    $0x15,%rdi
   140052028:	48 c1 ff 1b          	sar    $0x1b,%rdi
   14005202c:	48 c1 fb 0b          	sar    $0xb,%rbx
   140052030:	48 c1 ff 07          	sar    $0x7,%rdi
   140052034:	48 c1 fb 03          	sar    $0x3,%rbx
   140052038:	48 c1 ff 09          	sar    $0x9,%rdi
   14005203c:	48 c1 ff 11          	sar    $0x11,%rdi
   140052040:	48 c1 fb 1f          	sar    $0x1f,%rbx
   140052044:	48 c1 fb 03          	sar    $0x3,%rbx
   140052048:	48 c1 ff 07          	sar    $0x7,%rdi
   14005204c:	48 c1 ff 07          	sar    $0x7,%rdi
   140052050:	48 c1 fb 1b          	sar    $0x1b,%rbx
   140052054:	48 c1 ff 0d          	sar    $0xd,%rdi
   140052058:	48 c1 fb 11          	sar    $0x11,%rbx
   14005205c:	48 c1 ff 0b          	sar    $0xb,%rdi
   140052060:	48 c1 fb 05          	sar    $0x5,%rbx
   140052064:	48 c1 fb 02          	sar    $0x2,%rbx
   140052068:	48 c1 fb 02          	sar    $0x2,%rbx
   14005206c:	48 c1 fb 05          	sar    $0x5,%rbx
   140052070:	48 c1 fb 03          	sar    $0x3,%rbx
   140052074:	48 c1 fb 0b          	sar    $0xb,%rbx
   140052078:	48 c1 ff 0b          	sar    $0xb,%rdi
   14005207c:	48 c1 ff 03          	sar    $0x3,%rdi
   140052080:	48 c1 fb 0d          	sar    $0xd,%rbx
   140052084:	48 c1 ff 1b          	sar    $0x1b,%rdi
   140052088:	48 c1 fb 04          	sar    $0x4,%rbx
   14005208c:	48 d1 fb             	sar    $1,%rbx
   14005208f:	48 c1 fb 0b          	sar    $0xb,%rbx
   140052093:	48 c1 ff 04          	sar    $0x4,%rdi
   140052097:	48 c1 ff 15          	sar    $0x15,%rdi
   14005209b:	48 c1 fb 04          	sar    $0x4,%rbx
   14005209f:	48 31 df             	xor    %rbx,%rdi
   1400520a2:	48 bb 95 f6 4f 16 04 	movabs $0x140aa004164ff695,%rbx
   1400520a9:	a0 0a 14 
   1400520ac:	48 31 df             	xor    %rbx,%rdi
   1400520af:	48 c1 ff 3f          	sar    $0x3f,%rdi
   1400520b3:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
   1400520b7:	48 0f af df          	imul   %rdi,%rbx
   1400520bb:	48 85 db             	test   %rbx,%rbx
   1400520be:	75 0a                	jne    0x1400520ca
   1400520c0:	48 c1 e3 26          	shl    $0x26,%rbx
   1400520c4:	48 8b 3c dc          	mov    (%rsp,%rbx,8),%rdi
   1400520c8:	eb 11                	jmp    0x1400520db
   1400520ca:	48 c1 ff 11          	sar    $0x11,%rdi
   1400520ce:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400520d5:	01 00 00 
   1400520d8:	48 8b 3b             	mov    (%rbx),%rdi
   1400520db:	5b                   	pop    %rbx
   1400520dc:	5f                   	pop    %rdi
   1400520dd:	9d                   	popf
   1400520de:	45 31 e4             	xor    %r12d,%r12d
   1400520e1:	9c                   	pushf
   1400520e2:	50                   	push   %rax
   1400520e3:	52                   	push   %rdx
   1400520e4:	48 b8 f7 41 c8 44 b3 	movabs $0x67fcd2b344c841f7,%rax
   1400520eb:	d2 fc 67 
   1400520ee:	48 89 c2             	mov    %rax,%rdx
   1400520f1:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400520f5:	48 c1 f8 1f          	sar    $0x1f,%rax
   1400520f9:	48 c1 fa 02          	sar    $0x2,%rdx
   1400520fd:	48 c1 fa 02          	sar    $0x2,%rdx
   140052101:	48 c1 f8 02          	sar    $0x2,%rax
   140052105:	48 c1 fa 15          	sar    $0x15,%rdx
   140052109:	48 c1 f8 1b          	sar    $0x1b,%rax
   14005210d:	48 c1 f8 09          	sar    $0x9,%rax
   140052111:	48 c1 f8 02          	sar    $0x2,%rax
   140052115:	48 d1 fa             	sar    $1,%rdx
   140052118:	48 c1 fa 1f          	sar    $0x1f,%rdx
   14005211c:	48 c1 fa 0d          	sar    $0xd,%rdx
   140052120:	48 c1 fa 0d          	sar    $0xd,%rdx
   140052124:	48 c1 fa 15          	sar    $0x15,%rdx
   140052128:	48 d1 f8             	sar    $1,%rax
   14005212b:	48 c1 f8 03          	sar    $0x3,%rax
   14005212f:	48 c1 f8 0d          	sar    $0xd,%rax
   140052133:	48 c1 fa 0b          	sar    $0xb,%rdx
   140052137:	48 c1 fa 15          	sar    $0x15,%rdx
   14005213b:	48 c1 f8 0d          	sar    $0xd,%rax
   14005213f:	48 d1 f8             	sar    $1,%rax
   140052142:	48 d1 fa             	sar    $1,%rdx
   140052145:	48 c1 f8 05          	sar    $0x5,%rax
   140052149:	48 c1 fa 15          	sar    $0x15,%rdx
   14005214d:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052151:	48 c1 fa 0d          	sar    $0xd,%rdx
   140052155:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052159:	48 c1 fa 09          	sar    $0x9,%rdx
   14005215d:	48 c1 f8 0b          	sar    $0xb,%rax
   140052161:	48 c1 f8 1f          	sar    $0x1f,%rax
   140052165:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052169:	48 c1 f8 05          	sar    $0x5,%rax
   14005216d:	48 c1 fa 09          	sar    $0x9,%rdx
   140052171:	48 c1 fa 05          	sar    $0x5,%rdx
   140052175:	48 c1 f8 15          	sar    $0x15,%rax
   140052179:	48 c1 fa 02          	sar    $0x2,%rdx
   14005217d:	48 c1 f8 07          	sar    $0x7,%rax
   140052181:	48 c1 fa 03          	sar    $0x3,%rdx
   140052185:	48 31 d0             	xor    %rdx,%rax
   140052188:	48 ba c8 07 df bc 6c 	movabs $0x3ec4cf6cbcdf07c8,%rdx
   14005218f:	cf c4 3e 
   140052192:	48 31 d0             	xor    %rdx,%rax
   140052195:	48 c1 f8 3f          	sar    $0x3f,%rax
   140052199:	48 89 c2             	mov    %rax,%rdx
   14005219c:	48 ff c2             	inc    %rdx
   14005219f:	48 83 e2 fe          	and    $0xfffffffffffffffe,%rdx
   1400521a3:	48 85 d2             	test   %rdx,%rdx
   1400521a6:	75 0a                	jne    0x1400521b2
   1400521a8:	48 c1 e2 28          	shl    $0x28,%rdx
   1400521ac:	48 8b 04 14          	mov    (%rsp,%rdx,1),%rax
   1400521b0:	eb 11                	jmp    0x1400521c3
   1400521b2:	48 c1 f8 11          	sar    $0x11,%rax
   1400521b6:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400521bd:	01 00 00 
   1400521c0:	48 8b 02             	mov    (%rdx),%rax
   1400521c3:	5a                   	pop    %rdx
   1400521c4:	58                   	pop    %rax
   1400521c5:	9d                   	popf
   1400521c6:	b8 b2 24 00 00       	mov    $0x24b2,%eax
   1400521cb:	9c                   	pushf
   1400521cc:	51                   	push   %rcx
   1400521cd:	41 50                	push   %r8
   1400521cf:	b9 9b 3e dd 40       	mov    $0x40dd3e9b,%ecx
   1400521d4:	41 89 c8             	mov    %ecx,%r8d
   1400521d7:	41 c1 f8 05          	sar    $0x5,%r8d
   1400521db:	d1 f9                	sar    $1,%ecx
   1400521dd:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400521e1:	c1 f9 0d             	sar    $0xd,%ecx
   1400521e4:	41 c1 f8 08          	sar    $0x8,%r8d
   1400521e8:	41 c1 f8 08          	sar    $0x8,%r8d
   1400521ec:	41 c1 f8 02          	sar    $0x2,%r8d
   1400521f0:	41 c1 f8 04          	sar    $0x4,%r8d
   1400521f4:	41 c1 f8 08          	sar    $0x8,%r8d
   1400521f8:	41 d1 f8             	sar    $1,%r8d
   1400521fb:	c1 f9 15             	sar    $0x15,%ecx
   1400521fe:	41 d1 f8             	sar    $1,%r8d
   140052201:	41 c1 f8 15          	sar    $0x15,%r8d
   140052205:	41 d1 f8             	sar    $1,%r8d
   140052208:	d1 f9                	sar    $1,%ecx
   14005220a:	41 c1 f8 08          	sar    $0x8,%r8d
   14005220e:	c1 f9 08             	sar    $0x8,%ecx
   140052211:	c1 f9 03             	sar    $0x3,%ecx
   140052214:	c1 f9 02             	sar    $0x2,%ecx
   140052217:	41 c1 f8 08          	sar    $0x8,%r8d
   14005221b:	41 c1 f8 11          	sar    $0x11,%r8d
   14005221f:	41 c1 f8 0f          	sar    $0xf,%r8d
   140052223:	41 c1 f8 0b          	sar    $0xb,%r8d
   140052227:	41 d1 f8             	sar    $1,%r8d
   14005222a:	c1 f9 08             	sar    $0x8,%ecx
   14005222d:	41 c1 f8 02          	sar    $0x2,%r8d
   140052231:	c1 f9 03             	sar    $0x3,%ecx
   140052234:	41 c1 f8 0b          	sar    $0xb,%r8d
   140052238:	41 c1 f8 0f          	sar    $0xf,%r8d
   14005223c:	c1 f9 1f             	sar    $0x1f,%ecx
   14005223f:	c1 f9 03             	sar    $0x3,%ecx
   140052242:	44 31 c1             	xor    %r8d,%ecx
   140052245:	81 f1 c4 22 ae 4b    	xor    $0x4bae22c4,%ecx
   14005224b:	c1 f9 1f             	sar    $0x1f,%ecx
   14005224e:	41 89 c8             	mov    %ecx,%r8d
   140052251:	41 ff c0             	inc    %r8d
   140052254:	41 83 e0 fe          	and    $0xfffffffe,%r8d
   140052258:	45 85 c0             	test   %r8d,%r8d
   14005225b:	75 0a                	jne    0x140052267
   14005225d:	49 c1 e0 26          	shl    $0x26,%r8
   140052261:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   140052265:	eb 10                	jmp    0x140052277
   140052267:	c1 f9 0d             	sar    $0xd,%ecx
   14005226a:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140052271:	01 00 00 
   140052274:	41 8b 08             	mov    (%r8),%ecx
   140052277:	41 58                	pop    %r8
   140052279:	59                   	pop    %rcx
   14005227a:	9d                   	popf
   14005227b:	45 31 d2             	xor    %r10d,%r10d
   14005227e:	9c                   	pushf
   14005227f:	51                   	push   %rcx
   140052280:	41 50                	push   %r8
   140052282:	b9 d5 8e 10 1e       	mov    $0x1e108ed5,%ecx
   140052287:	41 89 c8             	mov    %ecx,%r8d
   14005228a:	41 d1 f8             	sar    $1,%r8d
   14005228d:	41 c1 f8 0b          	sar    $0xb,%r8d
   140052291:	c1 f9 09             	sar    $0x9,%ecx
   140052294:	c1 f9 02             	sar    $0x2,%ecx
   140052297:	c1 f9 15             	sar    $0x15,%ecx
   14005229a:	41 c1 f8 11          	sar    $0x11,%r8d
   14005229e:	c1 f9 07             	sar    $0x7,%ecx
   1400522a1:	c1 f9 11             	sar    $0x11,%ecx
   1400522a4:	41 c1 f8 07          	sar    $0x7,%r8d
   1400522a8:	c1 f9 03             	sar    $0x3,%ecx
   1400522ab:	c1 f9 05             	sar    $0x5,%ecx
   1400522ae:	41 c1 f8 15          	sar    $0x15,%r8d
   1400522b2:	c1 f9 04             	sar    $0x4,%ecx
   1400522b5:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400522b9:	41 c1 f8 09          	sar    $0x9,%r8d
   1400522bd:	c1 f9 0d             	sar    $0xd,%ecx
   1400522c0:	c1 f9 0f             	sar    $0xf,%ecx
   1400522c3:	41 c1 f8 03          	sar    $0x3,%r8d
   1400522c7:	41 c1 f8 04          	sar    $0x4,%r8d
   1400522cb:	c1 f9 0f             	sar    $0xf,%ecx
   1400522ce:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400522d2:	c1 f9 15             	sar    $0x15,%ecx
   1400522d5:	c1 f9 09             	sar    $0x9,%ecx
   1400522d8:	c1 f9 05             	sar    $0x5,%ecx
   1400522db:	41 c1 f8 07          	sar    $0x7,%r8d
   1400522df:	c1 f9 07             	sar    $0x7,%ecx
   1400522e2:	41 c1 f8 15          	sar    $0x15,%r8d
   1400522e6:	41 c1 f8 03          	sar    $0x3,%r8d
   1400522ea:	41 c1 f8 03          	sar    $0x3,%r8d
   1400522ee:	41 c1 f8 07          	sar    $0x7,%r8d
   1400522f2:	41 d1 f8             	sar    $1,%r8d
   1400522f5:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400522f9:	44 31 c1             	xor    %r8d,%ecx
   1400522fc:	81 f1 27 42 87 1e    	xor    $0x1e874227,%ecx
   140052302:	c1 f9 1f             	sar    $0x1f,%ecx
   140052305:	41 89 c8             	mov    %ecx,%r8d
   140052308:	41 d1 f8             	sar    $1,%r8d
   14005230b:	41 31 c8             	xor    %ecx,%r8d
   14005230e:	45 85 c0             	test   %r8d,%r8d
   140052311:	75 0a                	jne    0x14005231d
   140052313:	49 c1 e0 2a          	shl    $0x2a,%r8
   140052317:	42 8b 0c 44          	mov    (%rsp,%r8,2),%ecx
   14005231b:	eb 10                	jmp    0x14005232d
   14005231d:	c1 f9 0d             	sar    $0xd,%ecx
   140052320:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140052327:	01 00 00 
   14005232a:	41 8b 08             	mov    (%r8),%ecx
   14005232d:	41 58                	pop    %r8
   14005232f:	59                   	pop    %rcx
   140052330:	9d                   	popf
   140052331:	45 31 ed             	xor    %r13d,%r13d
   140052334:	9c                   	pushf
   140052335:	57                   	push   %rdi
   140052336:	53                   	push   %rbx
   140052337:	bf 30 d8 01 1b       	mov    $0x1b01d830,%edi
   14005233c:	89 fb                	mov    %edi,%ebx
   14005233e:	c1 ff 02             	sar    $0x2,%edi
   140052341:	c1 fb 03             	sar    $0x3,%ebx
   140052344:	c1 fb 09             	sar    $0x9,%ebx
   140052347:	c1 ff 04             	sar    $0x4,%edi
   14005234a:	c1 ff 0d             	sar    $0xd,%edi
   14005234d:	c1 ff 07             	sar    $0x7,%edi
   140052350:	c1 fb 0b             	sar    $0xb,%ebx
   140052353:	c1 fb 0f             	sar    $0xf,%ebx
   140052356:	c1 fb 09             	sar    $0x9,%ebx
   140052359:	c1 fb 15             	sar    $0x15,%ebx
   14005235c:	c1 fb 1f             	sar    $0x1f,%ebx
   14005235f:	c1 ff 02             	sar    $0x2,%edi
   140052362:	c1 fb 09             	sar    $0x9,%ebx
   140052365:	c1 fb 07             	sar    $0x7,%ebx
   140052368:	d1 fb                	sar    $1,%ebx
   14005236a:	c1 fb 07             	sar    $0x7,%ebx
   14005236d:	c1 fb 04             	sar    $0x4,%ebx
   140052370:	c1 fb 0f             	sar    $0xf,%ebx
   140052373:	c1 fb 0f             	sar    $0xf,%ebx
   140052376:	c1 ff 04             	sar    $0x4,%edi
   140052379:	c1 fb 0b             	sar    $0xb,%ebx
   14005237c:	d1 ff                	sar    $1,%edi
   14005237e:	c1 fb 0d             	sar    $0xd,%ebx
   140052381:	c1 ff 07             	sar    $0x7,%edi
   140052384:	c1 fb 05             	sar    $0x5,%ebx
   140052387:	d1 fb                	sar    $1,%ebx
   140052389:	c1 ff 04             	sar    $0x4,%edi
   14005238c:	c1 ff 04             	sar    $0x4,%edi
   14005238f:	c1 ff 15             	sar    $0x15,%edi
   140052392:	c1 ff 11             	sar    $0x11,%edi
   140052395:	31 df                	xor    %ebx,%edi
   140052397:	81 f7 4b b0 fc 11    	xor    $0x11fcb04b,%edi
   14005239d:	c1 ff 1f             	sar    $0x1f,%edi
   1400523a0:	89 fb                	mov    %edi,%ebx
   1400523a2:	ff c3                	inc    %ebx
   1400523a4:	83 e3 fe             	and    $0xfffffffe,%ebx
   1400523a7:	85 db                	test   %ebx,%ebx
   1400523a9:	75 09                	jne    0x1400523b4
   1400523ab:	48 c1 cb 20          	ror    $0x20,%rbx
   1400523af:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   1400523b2:	eb 0f                	jmp    0x1400523c3
   1400523b4:	c1 ff 0d             	sar    $0xd,%edi
   1400523b7:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400523be:	01 00 00 
   1400523c1:	8b 3b                	mov    (%rbx),%edi
   1400523c3:	5b                   	pop    %rbx
   1400523c4:	5f                   	pop    %rdi
   1400523c5:	9d                   	popf
   1400523c6:	45 31 ff             	xor    %r15d,%r15d
   1400523c9:	9c                   	pushf
   1400523ca:	41 51                	push   %r9
   1400523cc:	41 52                	push   %r10
   1400523ce:	41 b9 6d 53 6c 6e    	mov    $0x6e6c536d,%r9d
   1400523d4:	45 89 ca             	mov    %r9d,%r10d
   1400523d7:	41 c1 fa 08          	sar    $0x8,%r10d
   1400523db:	41 c1 f9 02          	sar    $0x2,%r9d
   1400523df:	41 c1 fa 0f          	sar    $0xf,%r10d
   1400523e3:	41 c1 fa 08          	sar    $0x8,%r10d
   1400523e7:	41 c1 f9 07          	sar    $0x7,%r9d
   1400523eb:	41 c1 f9 04          	sar    $0x4,%r9d
   1400523ef:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400523f3:	41 c1 fa 15          	sar    $0x15,%r10d
   1400523f7:	41 c1 fa 05          	sar    $0x5,%r10d
   1400523fb:	41 c1 f9 09          	sar    $0x9,%r9d
   1400523ff:	41 c1 f9 0d          	sar    $0xd,%r9d
   140052403:	41 c1 fa 15          	sar    $0x15,%r10d
   140052407:	41 c1 f9 05          	sar    $0x5,%r9d
   14005240b:	41 c1 fa 04          	sar    $0x4,%r10d
   14005240f:	41 c1 fa 0f          	sar    $0xf,%r10d
   140052413:	41 c1 f9 0b          	sar    $0xb,%r9d
   140052417:	41 c1 f9 09          	sar    $0x9,%r9d
   14005241b:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005241f:	41 c1 fa 11          	sar    $0x11,%r10d
   140052423:	41 c1 fa 0d          	sar    $0xd,%r10d
   140052427:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005242b:	41 c1 f9 04          	sar    $0x4,%r9d
   14005242f:	41 c1 f9 03          	sar    $0x3,%r9d
   140052433:	41 c1 fa 0f          	sar    $0xf,%r10d
   140052437:	41 c1 fa 05          	sar    $0x5,%r10d
   14005243b:	41 c1 fa 03          	sar    $0x3,%r10d
   14005243f:	41 c1 fa 07          	sar    $0x7,%r10d
   140052443:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140052447:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005244b:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005244f:	41 c1 fa 09          	sar    $0x9,%r10d
   140052453:	45 31 d1             	xor    %r10d,%r9d
   140052456:	41 81 f1 65 ca be 3b 	xor    $0x3bbeca65,%r9d
   14005245d:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052461:	45 89 ca             	mov    %r9d,%r10d
   140052464:	41 d1 fa             	sar    $1,%r10d
   140052467:	45 31 ca             	xor    %r9d,%r10d
   14005246a:	45 85 d2             	test   %r10d,%r10d
   14005246d:	75 0a                	jne    0x140052479
   14005246f:	49 c1 e2 2a          	shl    $0x2a,%r10
   140052473:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140052477:	eb 11                	jmp    0x14005248a
   140052479:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005247d:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140052484:	01 00 00 
   140052487:	45 8b 0a             	mov    (%r10),%r9d
   14005248a:	41 5a                	pop    %r10
   14005248c:	41 59                	pop    %r9
   14005248e:	9d                   	popf
   14005248f:	45 31 f6             	xor    %r14d,%r14d
   140052492:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   140052499:	00 00 00 
   14005249c:	0f 1f 40 00          	nopl   0x0(%rax)
   1400524a0:	9c                   	pushf
   1400524a1:	41 51                	push   %r9
   1400524a3:	41 52                	push   %r10
   1400524a5:	49 b9 c7 92 32 55 73 	movabs $0x7fc1d773553292c7,%r9
   1400524ac:	d7 c1 7f 
   1400524af:	4d 89 ca             	mov    %r9,%r10
   1400524b2:	49 c1 f9 1f          	sar    $0x1f,%r9
   1400524b6:	49 d1 fa             	sar    $1,%r10
   1400524b9:	49 c1 f9 0b          	sar    $0xb,%r9
   1400524bd:	49 c1 fa 0d          	sar    $0xd,%r10
   1400524c1:	49 d1 f9             	sar    $1,%r9
   1400524c4:	49 c1 fa 0b          	sar    $0xb,%r10
   1400524c8:	49 c1 fa 0b          	sar    $0xb,%r10
   1400524cc:	49 c1 f9 0d          	sar    $0xd,%r9
   1400524d0:	49 d1 fa             	sar    $1,%r10
   1400524d3:	49 c1 fa 15          	sar    $0x15,%r10
   1400524d7:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400524db:	49 c1 f9 09          	sar    $0x9,%r9
   1400524df:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400524e3:	49 c1 f9 04          	sar    $0x4,%r9
   1400524e7:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400524eb:	49 c1 f9 1f          	sar    $0x1f,%r9
   1400524ef:	49 c1 fa 15          	sar    $0x15,%r10
   1400524f3:	49 c1 fa 05          	sar    $0x5,%r10
   1400524f7:	49 c1 fa 0d          	sar    $0xd,%r10
   1400524fb:	49 c1 fa 03          	sar    $0x3,%r10
   1400524ff:	49 c1 f9 1b          	sar    $0x1b,%r9
   140052503:	49 c1 fa 0d          	sar    $0xd,%r10
   140052507:	49 c1 fa 1f          	sar    $0x1f,%r10
   14005250b:	49 c1 f9 05          	sar    $0x5,%r9
   14005250f:	49 c1 f9 11          	sar    $0x11,%r9
   140052513:	49 c1 fa 1b          	sar    $0x1b,%r10
   140052517:	49 c1 f9 07          	sar    $0x7,%r9
   14005251b:	49 c1 fa 07          	sar    $0x7,%r10
   14005251f:	49 c1 fa 02          	sar    $0x2,%r10
   140052523:	49 c1 fa 11          	sar    $0x11,%r10
   140052527:	49 c1 fa 04          	sar    $0x4,%r10
   14005252b:	49 c1 fa 1f          	sar    $0x1f,%r10
   14005252f:	49 c1 f9 1b          	sar    $0x1b,%r9
   140052533:	49 c1 fa 1f          	sar    $0x1f,%r10
   140052537:	49 c1 fa 0b          	sar    $0xb,%r10
   14005253b:	49 c1 f9 03          	sar    $0x3,%r9
   14005253f:	49 d1 fa             	sar    $1,%r10
   140052542:	49 c1 f9 1b          	sar    $0x1b,%r9
   140052546:	4d 31 d1             	xor    %r10,%r9
   140052549:	49 ba 02 12 b1 f3 61 	movabs $0x7f8cdf61f3b11202,%r10
   140052550:	df 8c 7f 
   140052553:	4d 31 d1             	xor    %r10,%r9
   140052556:	49 c1 f9 3f          	sar    $0x3f,%r9
   14005255a:	4d 89 ca             	mov    %r9,%r10
   14005255d:	49 ff c2             	inc    %r10
   140052560:	49 83 e2 fe          	and    $0xfffffffffffffffe,%r10
   140052564:	4d 85 d2             	test   %r10,%r10
   140052567:	75 09                	jne    0x140052572
   140052569:	49 0f ca             	bswap  %r10
   14005256c:	4e 8b 0c d4          	mov    (%rsp,%r10,8),%r9
   140052570:	eb 11                	jmp    0x140052583
   140052572:	49 c1 f9 11          	sar    $0x11,%r9
   140052576:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   14005257d:	01 00 00 
   140052580:	4d 8b 0a             	mov    (%r10),%r9
   140052583:	41 5a                	pop    %r10
   140052585:	41 59                	pop    %r9
   140052587:	9d                   	popf
   140052588:	89 44 24 04          	mov    %eax,0x4(%rsp)
   14005258c:	9c                   	pushf
   14005258d:	52                   	push   %rdx
   14005258e:	56                   	push   %rsi
   14005258f:	ba df 7d e4 6c       	mov    $0x6ce47ddf,%edx
   140052594:	89 d6                	mov    %edx,%esi
   140052596:	c1 fe 08             	sar    $0x8,%esi
   140052599:	c1 fe 04             	sar    $0x4,%esi
   14005259c:	c1 fa 08             	sar    $0x8,%edx
   14005259f:	c1 fe 02             	sar    $0x2,%esi
   1400525a2:	d1 fa                	sar    $1,%edx
   1400525a4:	c1 fe 03             	sar    $0x3,%esi
   1400525a7:	c1 fe 0b             	sar    $0xb,%esi
   1400525aa:	c1 fe 0f             	sar    $0xf,%esi
   1400525ad:	c1 fe 0d             	sar    $0xd,%esi
   1400525b0:	c1 fa 1f             	sar    $0x1f,%edx
   1400525b3:	c1 fe 05             	sar    $0x5,%esi
   1400525b6:	c1 fa 0f             	sar    $0xf,%edx
   1400525b9:	c1 fe 1f             	sar    $0x1f,%esi
   1400525bc:	c1 fa 03             	sar    $0x3,%edx
   1400525bf:	c1 fa 08             	sar    $0x8,%edx
   1400525c2:	c1 fa 0f             	sar    $0xf,%edx
   1400525c5:	d1 fe                	sar    $1,%esi
   1400525c7:	c1 fe 07             	sar    $0x7,%esi
   1400525ca:	c1 fe 11             	sar    $0x11,%esi
   1400525cd:	c1 fa 02             	sar    $0x2,%edx
   1400525d0:	c1 fe 0f             	sar    $0xf,%esi
   1400525d3:	c1 fa 07             	sar    $0x7,%edx
   1400525d6:	c1 fa 1f             	sar    $0x1f,%edx
   1400525d9:	c1 fe 0d             	sar    $0xd,%esi
   1400525dc:	c1 fa 02             	sar    $0x2,%edx
   1400525df:	c1 fa 05             	sar    $0x5,%edx
   1400525e2:	c1 fa 11             	sar    $0x11,%edx
   1400525e5:	c1 fa 11             	sar    $0x11,%edx
   1400525e8:	c1 fe 03             	sar    $0x3,%esi
   1400525eb:	c1 fa 0b             	sar    $0xb,%edx
   1400525ee:	c1 fa 0d             	sar    $0xd,%edx
   1400525f1:	c1 fa 0f             	sar    $0xf,%edx
   1400525f4:	c1 fe 07             	sar    $0x7,%esi
   1400525f7:	c1 fa 02             	sar    $0x2,%edx
   1400525fa:	c1 fa 02             	sar    $0x2,%edx
   1400525fd:	31 f2                	xor    %esi,%edx
   1400525ff:	81 f2 6b 4c 47 4b    	xor    $0x4b474c6b,%edx
   140052605:	c1 fa 1f             	sar    $0x1f,%edx
   140052608:	89 d6                	mov    %edx,%esi
   14005260a:	d1 fe                	sar    $1,%esi
   14005260c:	31 d6                	xor    %edx,%esi
   14005260e:	85 f6                	test   %esi,%esi
   140052610:	75 09                	jne    0x14005261b
   140052612:	48 c1 e6 2a          	shl    $0x2a,%rsi
   140052616:	8b 14 74             	mov    (%rsp,%rsi,2),%edx
   140052619:	eb 0f                	jmp    0x14005262a
   14005261b:	c1 fa 0d             	sar    $0xd,%edx
   14005261e:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140052625:	01 00 00 
   140052628:	8b 16                	mov    (%rsi),%edx
   14005262a:	5e                   	pop    %rsi
   14005262b:	5a                   	pop    %rdx
   14005262c:	9d                   	popf
   14005262d:	8b 44 24 04          	mov    0x4(%rsp),%eax
   140052631:	3d 18 8b 00 00       	cmp    $0x8b18,%eax
   140052636:	0f 84 a3 58 00 00    	je     0x140057edf
   14005263c:	9c                   	pushf
   14005263d:	50                   	push   %rax
   14005263e:	52                   	push   %rdx
   14005263f:	48 b8 7a f8 36 6e 44 	movabs $0x7a4ad5446e36f87a,%rax
   140052646:	d5 4a 7a 
   140052649:	48 89 c2             	mov    %rax,%rdx
   14005264c:	48 c1 fa 07          	sar    $0x7,%rdx
   140052650:	48 c1 f8 07          	sar    $0x7,%rax
   140052654:	48 d1 fa             	sar    $1,%rdx
   140052657:	48 c1 fa 05          	sar    $0x5,%rdx
   14005265b:	48 c1 f8 02          	sar    $0x2,%rax
   14005265f:	48 c1 fa 02          	sar    $0x2,%rdx
   140052663:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052667:	48 c1 f8 07          	sar    $0x7,%rax
   14005266b:	48 c1 f8 11          	sar    $0x11,%rax
   14005266f:	48 c1 f8 09          	sar    $0x9,%rax
   140052673:	48 c1 f8 07          	sar    $0x7,%rax
   140052677:	48 c1 fa 02          	sar    $0x2,%rdx
   14005267b:	48 c1 f8 15          	sar    $0x15,%rax
   14005267f:	48 d1 f8             	sar    $1,%rax
   140052682:	48 c1 f8 0d          	sar    $0xd,%rax
   140052686:	48 d1 f8             	sar    $1,%rax
   140052689:	48 d1 f8             	sar    $1,%rax
   14005268c:	48 c1 fa 03          	sar    $0x3,%rdx
   140052690:	48 d1 fa             	sar    $1,%rdx
   140052693:	48 c1 f8 0b          	sar    $0xb,%rax
   140052697:	48 c1 fa 0b          	sar    $0xb,%rdx
   14005269b:	48 c1 fa 02          	sar    $0x2,%rdx
   14005269f:	48 c1 f8 02          	sar    $0x2,%rax
   1400526a3:	48 c1 fa 04          	sar    $0x4,%rdx
   1400526a7:	48 c1 f8 07          	sar    $0x7,%rax
   1400526ab:	48 c1 fa 0b          	sar    $0xb,%rdx
   1400526af:	48 c1 f8 0d          	sar    $0xd,%rax
   1400526b3:	48 c1 fa 05          	sar    $0x5,%rdx
   1400526b7:	48 31 d0             	xor    %rdx,%rax
   1400526ba:	48 ba 59 68 ca fd fd 	movabs $0x18f427fdfdca6859,%rdx
   1400526c1:	27 f4 18 
   1400526c4:	48 31 d0             	xor    %rdx,%rax
   1400526c7:	48 c1 f8 3f          	sar    $0x3f,%rax
   1400526cb:	48 89 c2             	mov    %rax,%rdx
   1400526ce:	48 d1 fa             	sar    $1,%rdx
   1400526d1:	48 31 c2             	xor    %rax,%rdx
   1400526d4:	48 85 d2             	test   %rdx,%rdx
   1400526d7:	75 0a                	jne    0x1400526e3
   1400526d9:	48 c1 e2 26          	shl    $0x26,%rdx
   1400526dd:	48 8b 04 d4          	mov    (%rsp,%rdx,8),%rax
   1400526e1:	eb 11                	jmp    0x1400526f4
   1400526e3:	48 c1 f8 11          	sar    $0x11,%rax
   1400526e7:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400526ee:	01 00 00 
   1400526f1:	48 8b 02             	mov    (%rdx),%rax
   1400526f4:	5a                   	pop    %rdx
   1400526f5:	58                   	pop    %rax
   1400526f6:	9d                   	popf
   1400526f7:	8b 44 24 04          	mov    0x4(%rsp),%eax
   1400526fb:	3d d3 4c 00 00       	cmp    $0x4cd3,%eax
   140052700:	0f 8e da 04 00 00    	jle    0x140052be0
   140052706:	3d f5 65 00 00       	cmp    $0x65f5,%eax
   14005270b:	0f 8f 8f 0c 00 00    	jg     0x1400533a0
   140052711:	3d d4 4c 00 00       	cmp    $0x4cd4,%eax
   140052716:	0f 84 fb 19 00 00    	je     0x140054117
   14005271c:	3d e5 50 00 00       	cmp    $0x50e5,%eax
   140052721:	0f 85 d6 17 00 00    	jne    0x140053efd
   140052727:	45 31 d2             	xor    %r10d,%r10d
   14005272a:	89 d8                	mov    %ebx,%eax
   14005272c:	f7 d8                	neg    %eax
   14005272e:	b8 00 00 00 00       	mov    $0x0,%eax
   140052733:	19 c0                	sbb    %eax,%eax
   140052735:	9c                   	pushf
   140052736:	41 50                	push   %r8
   140052738:	41 51                	push   %r9
   14005273a:	49 b8 86 11 a5 cb 7f 	movabs $0x1715737fcba51186,%r8
   140052741:	73 15 17 
   140052744:	4d 89 c1             	mov    %r8,%r9
   140052747:	49 c1 f8 07          	sar    $0x7,%r8
   14005274b:	49 c1 f8 0b          	sar    $0xb,%r8
   14005274f:	49 c1 f8 0b          	sar    $0xb,%r8
   140052753:	49 c1 f8 15          	sar    $0x15,%r8
   140052757:	49 c1 f8 09          	sar    $0x9,%r8
   14005275b:	49 c1 f8 04          	sar    $0x4,%r8
   14005275f:	49 c1 f9 04          	sar    $0x4,%r9
   140052763:	49 c1 f9 02          	sar    $0x2,%r9
   140052767:	49 c1 f9 04          	sar    $0x4,%r9
   14005276b:	49 c1 f8 03          	sar    $0x3,%r8
   14005276f:	49 d1 f9             	sar    $1,%r9
   140052772:	49 c1 f9 0d          	sar    $0xd,%r9
   140052776:	49 d1 f9             	sar    $1,%r9
   140052779:	49 c1 f9 0b          	sar    $0xb,%r9
   14005277d:	49 c1 f8 05          	sar    $0x5,%r8
   140052781:	49 c1 f9 1b          	sar    $0x1b,%r9
   140052785:	49 c1 f9 05          	sar    $0x5,%r9
   140052789:	49 c1 f9 1f          	sar    $0x1f,%r9
   14005278d:	49 c1 f9 05          	sar    $0x5,%r9
   140052791:	49 c1 f8 05          	sar    $0x5,%r8
   140052795:	49 c1 f8 11          	sar    $0x11,%r8
   140052799:	49 c1 f8 05          	sar    $0x5,%r8
   14005279d:	49 c1 f8 04          	sar    $0x4,%r8
   1400527a1:	49 c1 f8 04          	sar    $0x4,%r8
   1400527a5:	49 c1 f9 07          	sar    $0x7,%r9
   1400527a9:	49 c1 f8 15          	sar    $0x15,%r8
   1400527ad:	49 c1 f9 1b          	sar    $0x1b,%r9
   1400527b1:	49 c1 f8 1f          	sar    $0x1f,%r8
   1400527b5:	49 c1 f8 02          	sar    $0x2,%r8
   1400527b9:	4d 31 c8             	xor    %r9,%r8
   1400527bc:	49 b9 ee 24 e8 33 92 	movabs $0x69ff0c9233e824ee,%r9
   1400527c3:	0c ff 69 
   1400527c6:	4d 31 c8             	xor    %r9,%r8
   1400527c9:	49 c1 f8 3f          	sar    $0x3f,%r8
   1400527cd:	4d 89 c1             	mov    %r8,%r9
   1400527d0:	49 ff c1             	inc    %r9
   1400527d3:	49 83 e1 fe          	and    $0xfffffffffffffffe,%r9
   1400527d7:	4d 85 c9             	test   %r9,%r9
   1400527da:	75 0a                	jne    0x1400527e6
   1400527dc:	49 c1 e1 28          	shl    $0x28,%r9
   1400527e0:	4e 8b 04 cc          	mov    (%rsp,%r9,8),%r8
   1400527e4:	eb 11                	jmp    0x1400527f7
   1400527e6:	49 c1 f8 11          	sar    $0x11,%r8
   1400527ea:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400527f1:	01 00 00 
   1400527f4:	4d 8b 01             	mov    (%r9),%r8
   1400527f7:	41 59                	pop    %r9
   1400527f9:	41 58                	pop    %r8
   1400527fb:	9d                   	popf
   1400527fc:	41 09 c7             	or     %eax,%r15d
   1400527ff:	9c                   	pushf
   140052800:	41 52                	push   %r10
   140052802:	41 53                	push   %r11
   140052804:	49 ba 37 dc d1 e5 95 	movabs $0x3781bb95e5d1dc37,%r10
   14005280b:	bb 81 37 
   14005280e:	4d 89 d3             	mov    %r10,%r11
   140052811:	49 c1 fa 1f          	sar    $0x1f,%r10
   140052815:	49 c1 fa 03          	sar    $0x3,%r10
   140052819:	49 c1 fa 1b          	sar    $0x1b,%r10
   14005281d:	49 c1 fa 05          	sar    $0x5,%r10
   140052821:	49 c1 fa 0b          	sar    $0xb,%r10
   140052825:	49 c1 fb 15          	sar    $0x15,%r11
   140052829:	49 c1 fa 09          	sar    $0x9,%r10
   14005282d:	49 c1 fb 09          	sar    $0x9,%r11
   140052831:	49 c1 fb 03          	sar    $0x3,%r11
   140052835:	49 c1 fa 0b          	sar    $0xb,%r10
   140052839:	49 c1 fa 07          	sar    $0x7,%r10
   14005283d:	49 c1 fa 03          	sar    $0x3,%r10
   140052841:	49 c1 fa 11          	sar    $0x11,%r10
   140052845:	49 c1 fb 05          	sar    $0x5,%r11
   140052849:	49 c1 fb 11          	sar    $0x11,%r11
   14005284d:	49 c1 fb 15          	sar    $0x15,%r11
   140052851:	49 c1 fa 0d          	sar    $0xd,%r10
   140052855:	49 c1 fb 0b          	sar    $0xb,%r11
   140052859:	49 c1 fa 11          	sar    $0x11,%r10
   14005285d:	49 c1 fa 15          	sar    $0x15,%r10
   140052861:	49 c1 fb 07          	sar    $0x7,%r11
   140052865:	49 c1 fa 09          	sar    $0x9,%r10
   140052869:	49 c1 fa 0b          	sar    $0xb,%r10
   14005286d:	49 c1 fb 1b          	sar    $0x1b,%r11
   140052871:	49 c1 fb 11          	sar    $0x11,%r11
   140052875:	49 c1 fa 09          	sar    $0x9,%r10
   140052879:	49 c1 fb 04          	sar    $0x4,%r11
   14005287d:	49 c1 fb 0b          	sar    $0xb,%r11
   140052881:	49 c1 fa 1f          	sar    $0x1f,%r10
   140052885:	49 c1 fa 11          	sar    $0x11,%r10
   140052889:	49 c1 fb 11          	sar    $0x11,%r11
   14005288d:	49 c1 fa 03          	sar    $0x3,%r10
   140052891:	49 c1 fb 02          	sar    $0x2,%r11
   140052895:	49 c1 fb 15          	sar    $0x15,%r11
   140052899:	49 c1 fa 07          	sar    $0x7,%r10
   14005289d:	4d 31 da             	xor    %r11,%r10
   1400528a0:	49 bb 65 3c 74 1b 13 	movabs $0x22c7f7131b743c65,%r11
   1400528a7:	f7 c7 22 
   1400528aa:	4d 31 da             	xor    %r11,%r10
   1400528ad:	49 c1 fa 3f          	sar    $0x3f,%r10
   1400528b1:	4d 89 d3             	mov    %r10,%r11
   1400528b4:	49 d1 fb             	sar    $1,%r11
   1400528b7:	4d 31 d3             	xor    %r10,%r11
   1400528ba:	4d 85 db             	test   %r11,%r11
   1400528bd:	75 0a                	jne    0x1400528c9
   1400528bf:	49 c1 e3 28          	shl    $0x28,%r11
   1400528c3:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   1400528c7:	eb 11                	jmp    0x1400528da
   1400528c9:	49 c1 fa 11          	sar    $0x11,%r10
   1400528cd:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   1400528d4:	01 00 00 
   1400528d7:	4d 8b 13             	mov    (%r11),%r10
   1400528da:	41 5b                	pop    %r11
   1400528dc:	41 5a                	pop    %r10
   1400528de:	9d                   	popf
   1400528df:	89 1c 24             	mov    %ebx,(%rsp)
   1400528e2:	9c                   	pushf
   1400528e3:	57                   	push   %rdi
   1400528e4:	53                   	push   %rbx
   1400528e5:	bf f0 0c 32 70       	mov    $0x70320cf0,%edi
   1400528ea:	89 fb                	mov    %edi,%ebx
   1400528ec:	c1 fb 07             	sar    $0x7,%ebx
   1400528ef:	c1 ff 04             	sar    $0x4,%edi
   1400528f2:	c1 fb 0f             	sar    $0xf,%ebx
   1400528f5:	c1 fb 0f             	sar    $0xf,%ebx
   1400528f8:	c1 fb 1f             	sar    $0x1f,%ebx
   1400528fb:	c1 fb 0d             	sar    $0xd,%ebx
   1400528fe:	c1 fb 08             	sar    $0x8,%ebx
   140052901:	c1 fb 07             	sar    $0x7,%ebx
   140052904:	c1 fb 11             	sar    $0x11,%ebx
   140052907:	c1 ff 07             	sar    $0x7,%edi
   14005290a:	c1 ff 03             	sar    $0x3,%edi
   14005290d:	c1 fb 0d             	sar    $0xd,%ebx
   140052910:	c1 fb 03             	sar    $0x3,%ebx
   140052913:	c1 fb 09             	sar    $0x9,%ebx
   140052916:	c1 ff 0b             	sar    $0xb,%edi
   140052919:	c1 fb 0f             	sar    $0xf,%ebx
   14005291c:	c1 ff 07             	sar    $0x7,%edi
   14005291f:	c1 ff 11             	sar    $0x11,%edi
   140052922:	c1 ff 0b             	sar    $0xb,%edi
   140052925:	c1 ff 02             	sar    $0x2,%edi
   140052928:	c1 fb 02             	sar    $0x2,%ebx
   14005292b:	c1 ff 08             	sar    $0x8,%edi
   14005292e:	c1 fb 03             	sar    $0x3,%ebx
   140052931:	c1 ff 15             	sar    $0x15,%edi
   140052934:	c1 ff 02             	sar    $0x2,%edi
   140052937:	c1 fb 04             	sar    $0x4,%ebx
   14005293a:	c1 fb 08             	sar    $0x8,%ebx
   14005293d:	c1 fb 07             	sar    $0x7,%ebx
   140052940:	31 df                	xor    %ebx,%edi
   140052942:	81 f7 01 ec 65 46    	xor    $0x4665ec01,%edi
   140052948:	c1 ff 1f             	sar    $0x1f,%edi
   14005294b:	8d 5f 01             	lea    0x1(%rdi),%ebx
   14005294e:	0f af df             	imul   %edi,%ebx
   140052951:	85 db                	test   %ebx,%ebx
   140052953:	75 09                	jne    0x14005295e
   140052955:	48 c1 e3 28          	shl    $0x28,%rbx
   140052959:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   14005295c:	eb 0f                	jmp    0x14005296d
   14005295e:	c1 ff 0d             	sar    $0xd,%edi
   140052961:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140052968:	01 00 00 
   14005296b:	8b 3b                	mov    (%rbx),%edi
   14005296d:	5b                   	pop    %rbx
   14005296e:	5f                   	pop    %rdi
   14005296f:	9d                   	popf
   140052970:	8b 04 24             	mov    (%rsp),%eax
   140052973:	9c                   	pushf
   140052974:	50                   	push   %rax
   140052975:	52                   	push   %rdx
   140052976:	48 b8 bd 4e f4 5a 18 	movabs $0x774c79185af44ebd,%rax
   14005297d:	79 4c 77 
   140052980:	48 89 c2             	mov    %rax,%rdx
   140052983:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052987:	48 c1 f8 03          	sar    $0x3,%rax
   14005298b:	48 c1 f8 07          	sar    $0x7,%rax
   14005298f:	48 c1 fa 03          	sar    $0x3,%rdx
   140052993:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140052997:	48 c1 fa 04          	sar    $0x4,%rdx
   14005299b:	48 d1 f8             	sar    $1,%rax
   14005299e:	48 c1 f8 11          	sar    $0x11,%rax
   1400529a2:	48 c1 fa 0d          	sar    $0xd,%rdx
   1400529a6:	48 c1 fa 07          	sar    $0x7,%rdx
   1400529aa:	48 d1 f8             	sar    $1,%rax
   1400529ad:	48 c1 fa 0b          	sar    $0xb,%rdx
   1400529b1:	48 c1 fa 02          	sar    $0x2,%rdx
   1400529b5:	48 c1 f8 0d          	sar    $0xd,%rax
   1400529b9:	48 c1 f8 1f          	sar    $0x1f,%rax
   1400529bd:	48 c1 fa 1b          	sar    $0x1b,%rdx
   1400529c1:	48 c1 fa 04          	sar    $0x4,%rdx
   1400529c5:	48 c1 f8 05          	sar    $0x5,%rax
   1400529c9:	48 c1 fa 0d          	sar    $0xd,%rdx
   1400529cd:	48 c1 fa 11          	sar    $0x11,%rdx
   1400529d1:	48 c1 fa 03          	sar    $0x3,%rdx
   1400529d5:	48 c1 f8 1f          	sar    $0x1f,%rax
   1400529d9:	48 c1 f8 09          	sar    $0x9,%rax
   1400529dd:	48 c1 fa 04          	sar    $0x4,%rdx
   1400529e1:	48 c1 f8 05          	sar    $0x5,%rax
   1400529e5:	48 c1 fa 0d          	sar    $0xd,%rdx
   1400529e9:	48 c1 f8 15          	sar    $0x15,%rax
   1400529ed:	48 31 d0             	xor    %rdx,%rax
   1400529f0:	48 ba 24 f0 e4 df d9 	movabs $0x72e291d9dfe4f024,%rdx
   1400529f7:	91 e2 72 
   1400529fa:	48 31 d0             	xor    %rdx,%rax
   1400529fd:	48 c1 f8 3f          	sar    $0x3f,%rax
   140052a01:	48 8d 50 01          	lea    0x1(%rax),%rdx
   140052a05:	48 0f af d0          	imul   %rax,%rdx
   140052a09:	48 85 d2             	test   %rdx,%rdx
   140052a0c:	75 0a                	jne    0x140052a18
   140052a0e:	48 c1 ca 20          	ror    $0x20,%rdx
   140052a12:	48 8b 04 d4          	mov    (%rsp,%rdx,8),%rax
   140052a16:	eb 11                	jmp    0x140052a29
   140052a18:	48 c1 f8 11          	sar    $0x11,%rax
   140052a1c:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140052a23:	01 00 00 
   140052a26:	48 8b 02             	mov    (%rdx),%rax
   140052a29:	5a                   	pop    %rdx
   140052a2a:	58                   	pop    %rax
   140052a2b:	9d                   	popf
   140052a2c:	8b 04 24             	mov    (%rsp),%eax
   140052a2f:	9c                   	pushf
   140052a30:	41 50                	push   %r8
   140052a32:	41 51                	push   %r9
   140052a34:	41 b8 38 aa ee 6c    	mov    $0x6ceeaa38,%r8d
   140052a3a:	45 89 c1             	mov    %r8d,%r9d
   140052a3d:	41 d1 f9             	sar    $1,%r9d
   140052a40:	41 c1 f9 0b          	sar    $0xb,%r9d
   140052a44:	41 c1 f9 15          	sar    $0x15,%r9d
   140052a48:	41 c1 f8 07          	sar    $0x7,%r8d
   140052a4c:	41 c1 f8 02          	sar    $0x2,%r8d
   140052a50:	41 c1 f9 0d          	sar    $0xd,%r9d
   140052a54:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140052a58:	41 c1 f8 0f          	sar    $0xf,%r8d
   140052a5c:	41 d1 f9             	sar    $1,%r9d
   140052a5f:	41 c1 f8 0d          	sar    $0xd,%r8d
   140052a63:	41 c1 f9 05          	sar    $0x5,%r9d
   140052a67:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052a6b:	41 d1 f8             	sar    $1,%r8d
   140052a6e:	41 c1 f9 05          	sar    $0x5,%r9d
   140052a72:	41 c1 f9 09          	sar    $0x9,%r9d
   140052a76:	41 c1 f8 08          	sar    $0x8,%r8d
   140052a7a:	41 c1 f9 15          	sar    $0x15,%r9d
   140052a7e:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140052a82:	41 c1 f9 0d          	sar    $0xd,%r9d
   140052a86:	41 c1 f8 0f          	sar    $0xf,%r8d
   140052a8a:	41 c1 f8 11          	sar    $0x11,%r8d
   140052a8e:	41 c1 f9 0b          	sar    $0xb,%r9d
   140052a92:	41 c1 f8 11          	sar    $0x11,%r8d
   140052a96:	41 c1 f8 07          	sar    $0x7,%r8d
   140052a9a:	41 c1 f9 11          	sar    $0x11,%r9d
   140052a9e:	41 c1 f8 07          	sar    $0x7,%r8d
   140052aa2:	41 c1 f9 08          	sar    $0x8,%r9d
   140052aa6:	41 c1 f8 0f          	sar    $0xf,%r8d
   140052aaa:	41 c1 f9 15          	sar    $0x15,%r9d
   140052aae:	45 31 c8             	xor    %r9d,%r8d
   140052ab1:	41 81 f0 42 0a 7d 50 	xor    $0x507d0a42,%r8d
   140052ab8:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140052abc:	45 89 c1             	mov    %r8d,%r9d
   140052abf:	41 d1 f9             	sar    $1,%r9d
   140052ac2:	45 31 c1             	xor    %r8d,%r9d
   140052ac5:	45 85 c9             	test   %r9d,%r9d
   140052ac8:	75 0a                	jne    0x140052ad4
   140052aca:	49 c1 e1 28          	shl    $0x28,%r9
   140052ace:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140052ad2:	eb 11                	jmp    0x140052ae5
   140052ad4:	41 c1 f8 0d          	sar    $0xd,%r8d
   140052ad8:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140052adf:	01 00 00 
   140052ae2:	45 8b 01             	mov    (%r9),%r8d
   140052ae5:	41 59                	pop    %r9
   140052ae7:	41 58                	pop    %r8
   140052ae9:	9d                   	popf
   140052aea:	b8 f6 65 00 00       	mov    $0x65f6,%eax
   140052aef:	9c                   	pushf
   140052af0:	51                   	push   %rcx
   140052af1:	41 50                	push   %r8
   140052af3:	48 b9 52 7a e2 a3 2f 	movabs $0x16cfe42fa3e27a52,%rcx
   140052afa:	e4 cf 16 
   140052afd:	49 89 c8             	mov    %rcx,%r8
   140052b00:	48 c1 f9 02          	sar    $0x2,%rcx
   140052b04:	49 c1 f8 15          	sar    $0x15,%r8
   140052b08:	48 c1 f9 0b          	sar    $0xb,%rcx
   140052b0c:	48 c1 f9 15          	sar    $0x15,%rcx
   140052b10:	49 c1 f8 1f          	sar    $0x1f,%r8
   140052b14:	48 c1 f9 04          	sar    $0x4,%rcx
   140052b18:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140052b1c:	48 c1 f9 02          	sar    $0x2,%rcx
   140052b20:	48 c1 f9 0b          	sar    $0xb,%rcx
   140052b24:	48 c1 f9 02          	sar    $0x2,%rcx
   140052b28:	48 c1 f9 0d          	sar    $0xd,%rcx
   140052b2c:	49 c1 f8 02          	sar    $0x2,%r8
   140052b30:	48 c1 f9 03          	sar    $0x3,%rcx
   140052b34:	48 c1 f9 07          	sar    $0x7,%rcx
   140052b38:	49 c1 f8 09          	sar    $0x9,%r8
   140052b3c:	48 c1 f9 04          	sar    $0x4,%rcx
   140052b40:	48 c1 f9 07          	sar    $0x7,%rcx
   140052b44:	48 c1 f9 09          	sar    $0x9,%rcx
   140052b48:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140052b4c:	48 c1 f9 11          	sar    $0x11,%rcx
   140052b50:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140052b54:	49 c1 f8 02          	sar    $0x2,%r8
   140052b58:	48 c1 f9 0b          	sar    $0xb,%rcx
   140052b5c:	49 c1 f8 04          	sar    $0x4,%r8
   140052b60:	49 c1 f8 07          	sar    $0x7,%r8
   140052b64:	49 c1 f8 1b          	sar    $0x1b,%r8
   140052b68:	49 c1 f8 0d          	sar    $0xd,%r8
   140052b6c:	48 c1 f9 03          	sar    $0x3,%rcx
   140052b70:	49 c1 f8 15          	sar    $0x15,%r8
   140052b74:	48 c1 f9 07          	sar    $0x7,%rcx
   140052b78:	49 c1 f8 1f          	sar    $0x1f,%r8
   140052b7c:	49 c1 f8 0b          	sar    $0xb,%r8
   140052b80:	48 c1 f9 02          	sar    $0x2,%rcx
   140052b84:	49 c1 f8 09          	sar    $0x9,%r8
   140052b88:	48 c1 f9 11          	sar    $0x11,%rcx
   140052b8c:	49 c1 f8 05          	sar    $0x5,%r8
   140052b90:	49 c1 f8 05          	sar    $0x5,%r8
   140052b94:	49 c1 f8 1b          	sar    $0x1b,%r8
   140052b98:	4c 31 c1             	xor    %r8,%rcx
   140052b9b:	49 b8 5a 5f 70 21 8f 	movabs $0x1393378f21705f5a,%r8
   140052ba2:	37 93 13 
   140052ba5:	4c 31 c1             	xor    %r8,%rcx
   140052ba8:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140052bac:	49 89 c8             	mov    %rcx,%r8
   140052baf:	49 ff c0             	inc    %r8
   140052bb2:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
   140052bb6:	4d 85 c0             	test   %r8,%r8
   140052bb9:	75 0a                	jne    0x140052bc5
   140052bbb:	49 c1 e0 28          	shl    $0x28,%r8
   140052bbf:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   140052bc3:	eb 11                	jmp    0x140052bd6
   140052bc5:	48 c1 f9 11          	sar    $0x11,%rcx
   140052bc9:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140052bd0:	01 00 00 
   140052bd3:	49 8b 08             	mov    (%r8),%rcx
   140052bd6:	41 58                	pop    %r8
   140052bd8:	59                   	pop    %rcx
   140052bd9:	9d                   	popf
   140052bda:	e9 c1 f8 ff ff       	jmp    0x1400524a0
   140052bdf:	90                   	nop
   140052be0:	3d a1 10 00 00       	cmp    $0x10a1,%eax
   140052be5:	0f 84 a7 ed ff ff    	je     0x140051992
   140052beb:	3d b2 24 00 00       	cmp    $0x24b2,%eax
   140052bf0:	0f 84 c4 2c 00 00    	je     0x1400558ba
   140052bf6:	3d c3 38 00 00       	cmp    $0x38c3,%eax
   140052bfb:	0f 85 fc 12 00 00    	jne    0x140053efd
   140052c01:	9c                   	pushf
   140052c02:	50                   	push   %rax
   140052c03:	52                   	push   %rdx
   140052c04:	b8 2a 9b c7 1d       	mov    $0x1dc79b2a,%eax
   140052c09:	89 c2                	mov    %eax,%edx
   140052c0b:	c1 fa 02             	sar    $0x2,%edx
   140052c0e:	c1 fa 11             	sar    $0x11,%edx
   140052c11:	c1 fa 11             	sar    $0x11,%edx
   140052c14:	c1 f8 09             	sar    $0x9,%eax
   140052c17:	c1 f8 07             	sar    $0x7,%eax
   140052c1a:	c1 fa 11             	sar    $0x11,%edx
   140052c1d:	c1 f8 04             	sar    $0x4,%eax
   140052c20:	c1 fa 11             	sar    $0x11,%edx
   140052c23:	c1 fa 09             	sar    $0x9,%edx
   140052c26:	c1 fa 04             	sar    $0x4,%edx
   140052c29:	c1 f8 09             	sar    $0x9,%eax
   140052c2c:	d1 fa                	sar    $1,%edx
   140052c2e:	c1 fa 04             	sar    $0x4,%edx
   140052c31:	c1 f8 04             	sar    $0x4,%eax
   140052c34:	c1 fa 07             	sar    $0x7,%edx
   140052c37:	c1 fa 15             	sar    $0x15,%edx
   140052c3a:	c1 f8 05             	sar    $0x5,%eax
   140052c3d:	c1 f8 07             	sar    $0x7,%eax
   140052c40:	c1 fa 04             	sar    $0x4,%edx
   140052c43:	c1 fa 09             	sar    $0x9,%edx
   140052c46:	c1 f8 08             	sar    $0x8,%eax
   140052c49:	c1 f8 1f             	sar    $0x1f,%eax
   140052c4c:	c1 fa 0d             	sar    $0xd,%edx
   140052c4f:	c1 fa 03             	sar    $0x3,%edx
   140052c52:	d1 f8                	sar    $1,%eax
   140052c54:	c1 fa 11             	sar    $0x11,%edx
   140052c57:	c1 fa 03             	sar    $0x3,%edx
   140052c5a:	c1 fa 07             	sar    $0x7,%edx
   140052c5d:	c1 fa 0d             	sar    $0xd,%edx
   140052c60:	c1 fa 02             	sar    $0x2,%edx
   140052c63:	c1 f8 15             	sar    $0x15,%eax
   140052c66:	c1 f8 0f             	sar    $0xf,%eax
   140052c69:	c1 f8 02             	sar    $0x2,%eax
   140052c6c:	c1 fa 04             	sar    $0x4,%edx
   140052c6f:	31 d0                	xor    %edx,%eax
   140052c71:	35 f2 06 92 3f       	xor    $0x3f9206f2,%eax
   140052c76:	c1 f8 1f             	sar    $0x1f,%eax
   140052c79:	89 c2                	mov    %eax,%edx
   140052c7b:	d1 fa                	sar    $1,%edx
   140052c7d:	31 c2                	xor    %eax,%edx
   140052c7f:	85 d2                	test   %edx,%edx
   140052c81:	75 09                	jne    0x140052c8c
   140052c83:	48 c1 e2 26          	shl    $0x26,%rdx
   140052c87:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   140052c8a:	eb 0f                	jmp    0x140052c9b
   140052c8c:	c1 f8 0d             	sar    $0xd,%eax
   140052c8f:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140052c96:	01 00 00 
   140052c99:	8b 02                	mov    (%rdx),%eax
   140052c9b:	5a                   	pop    %rdx
   140052c9c:	58                   	pop    %rax
   140052c9d:	9d                   	popf
   140052c9e:	45 89 f7             	mov    %r14d,%r15d
   140052ca1:	9c                   	pushf
   140052ca2:	52                   	push   %rdx
   140052ca3:	56                   	push   %rsi
   140052ca4:	ba 14 fa a0 4b       	mov    $0x4ba0fa14,%edx
   140052ca9:	89 d6                	mov    %edx,%esi
   140052cab:	c1 fa 11             	sar    $0x11,%edx
   140052cae:	c1 fe 05             	sar    $0x5,%esi
   140052cb1:	c1 fa 07             	sar    $0x7,%edx
   140052cb4:	c1 fe 1f             	sar    $0x1f,%esi
   140052cb7:	c1 fa 05             	sar    $0x5,%edx
   140052cba:	c1 fa 0d             	sar    $0xd,%edx
   140052cbd:	c1 fe 02             	sar    $0x2,%esi
   140052cc0:	c1 fa 03             	sar    $0x3,%edx
   140052cc3:	c1 fa 0d             	sar    $0xd,%edx
   140052cc6:	c1 fe 04             	sar    $0x4,%esi
   140052cc9:	c1 fa 07             	sar    $0x7,%edx
   140052ccc:	c1 fa 05             	sar    $0x5,%edx
   140052ccf:	c1 fa 0d             	sar    $0xd,%edx
   140052cd2:	c1 fe 04             	sar    $0x4,%esi
   140052cd5:	c1 fe 03             	sar    $0x3,%esi
   140052cd8:	c1 fa 08             	sar    $0x8,%edx
   140052cdb:	d1 fa                	sar    $1,%edx
   140052cdd:	c1 fa 03             	sar    $0x3,%edx
   140052ce0:	c1 fa 08             	sar    $0x8,%edx
   140052ce3:	c1 fa 11             	sar    $0x11,%edx
   140052ce6:	c1 fa 07             	sar    $0x7,%edx
   140052ce9:	c1 fe 0f             	sar    $0xf,%esi
   140052cec:	c1 fa 09             	sar    $0x9,%edx
   140052cef:	c1 fa 1f             	sar    $0x1f,%edx
   140052cf2:	c1 fa 05             	sar    $0x5,%edx
   140052cf5:	31 f2                	xor    %esi,%edx
   140052cf7:	81 f2 02 bc 29 2d    	xor    $0x2d29bc02,%edx
   140052cfd:	c1 fa 1f             	sar    $0x1f,%edx
   140052d00:	8d 72 01             	lea    0x1(%rdx),%esi
   140052d03:	0f af f2             	imul   %edx,%esi
   140052d06:	85 f6                	test   %esi,%esi
   140052d08:	75 08                	jne    0x140052d12
   140052d0a:	48 0f ce             	bswap  %rsi
   140052d0d:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   140052d10:	eb 0f                	jmp    0x140052d21
   140052d12:	c1 fa 0d             	sar    $0xd,%edx
   140052d15:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140052d1c:	01 00 00 
   140052d1f:	8b 16                	mov    (%rsi),%edx
   140052d21:	5e                   	pop    %rsi
   140052d22:	5a                   	pop    %rdx
   140052d23:	9d                   	popf
   140052d24:	41 83 f7 e2          	xor    $0xffffffe2,%r15d
   140052d28:	9c                   	pushf
   140052d29:	57                   	push   %rdi
   140052d2a:	53                   	push   %rbx
   140052d2b:	bf 1a c9 c4 30       	mov    $0x30c4c91a,%edi
   140052d30:	89 fb                	mov    %edi,%ebx
   140052d32:	c1 fb 11             	sar    $0x11,%ebx
   140052d35:	c1 fb 0f             	sar    $0xf,%ebx
   140052d38:	c1 fb 03             	sar    $0x3,%ebx
   140052d3b:	c1 ff 04             	sar    $0x4,%edi
   140052d3e:	c1 fb 0f             	sar    $0xf,%ebx
   140052d41:	d1 ff                	sar    $1,%edi
   140052d43:	c1 ff 15             	sar    $0x15,%edi
   140052d46:	c1 ff 1f             	sar    $0x1f,%edi
   140052d49:	c1 fb 0f             	sar    $0xf,%ebx
   140052d4c:	c1 ff 09             	sar    $0x9,%edi
   140052d4f:	c1 ff 08             	sar    $0x8,%edi
   140052d52:	c1 fb 0b             	sar    $0xb,%ebx
   140052d55:	c1 fb 0f             	sar    $0xf,%ebx
   140052d58:	c1 ff 03             	sar    $0x3,%edi
   140052d5b:	c1 fb 0d             	sar    $0xd,%ebx
   140052d5e:	d1 ff                	sar    $1,%edi
   140052d60:	c1 ff 0d             	sar    $0xd,%edi
   140052d63:	c1 fb 04             	sar    $0x4,%ebx
   140052d66:	c1 fb 0b             	sar    $0xb,%ebx
   140052d69:	c1 fb 0f             	sar    $0xf,%ebx
   140052d6c:	c1 ff 11             	sar    $0x11,%edi
   140052d6f:	c1 fb 0b             	sar    $0xb,%ebx
   140052d72:	c1 fb 03             	sar    $0x3,%ebx
   140052d75:	d1 fb                	sar    $1,%ebx
   140052d77:	c1 ff 04             	sar    $0x4,%edi
   140052d7a:	c1 ff 15             	sar    $0x15,%edi
   140052d7d:	c1 fb 03             	sar    $0x3,%ebx
   140052d80:	c1 ff 0b             	sar    $0xb,%edi
   140052d83:	c1 fb 11             	sar    $0x11,%ebx
   140052d86:	c1 fb 0f             	sar    $0xf,%ebx
   140052d89:	c1 ff 09             	sar    $0x9,%edi
   140052d8c:	c1 fb 03             	sar    $0x3,%ebx
   140052d8f:	c1 fb 09             	sar    $0x9,%ebx
   140052d92:	31 df                	xor    %ebx,%edi
   140052d94:	81 f7 24 9c c2 75    	xor    $0x75c29c24,%edi
   140052d9a:	c1 ff 1f             	sar    $0x1f,%edi
   140052d9d:	89 fb                	mov    %edi,%ebx
   140052d9f:	ff c3                	inc    %ebx
   140052da1:	83 e3 fe             	and    $0xfffffffe,%ebx
   140052da4:	85 db                	test   %ebx,%ebx
   140052da6:	75 09                	jne    0x140052db1
   140052da8:	48 c1 e3 28          	shl    $0x28,%rbx
   140052dac:	8b 3c 5c             	mov    (%rsp,%rbx,2),%edi
   140052daf:	eb 0f                	jmp    0x140052dc0
   140052db1:	c1 ff 0d             	sar    $0xd,%edi
   140052db4:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140052dbb:	01 00 00 
   140052dbe:	8b 3b                	mov    (%rbx),%edi
   140052dc0:	5b                   	pop    %rbx
   140052dc1:	5f                   	pop    %rdi
   140052dc2:	9d                   	popf
   140052dc3:	41 ff c7             	inc    %r15d
   140052dc6:	9c                   	pushf
   140052dc7:	50                   	push   %rax
   140052dc8:	51                   	push   %rcx
   140052dc9:	48 b8 93 d0 93 3e 16 	movabs $0x106ace163e93d093,%rax
   140052dd0:	ce 6a 10 
   140052dd3:	48 89 c1             	mov    %rax,%rcx
   140052dd6:	48 c1 f8 15          	sar    $0x15,%rax
   140052dda:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140052dde:	48 c1 f9 11          	sar    $0x11,%rcx
   140052de2:	48 c1 f8 0d          	sar    $0xd,%rax
   140052de6:	48 d1 f8             	sar    $1,%rax
   140052de9:	48 c1 f8 0b          	sar    $0xb,%rax
   140052ded:	48 c1 f9 09          	sar    $0x9,%rcx
   140052df1:	48 c1 f9 09          	sar    $0x9,%rcx
   140052df5:	48 c1 f8 09          	sar    $0x9,%rax
   140052df9:	48 c1 f8 09          	sar    $0x9,%rax
   140052dfd:	48 c1 f8 11          	sar    $0x11,%rax
   140052e01:	48 c1 f9 03          	sar    $0x3,%rcx
   140052e05:	48 c1 f9 07          	sar    $0x7,%rcx
   140052e09:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140052e0d:	48 c1 f9 09          	sar    $0x9,%rcx
   140052e11:	48 c1 f8 04          	sar    $0x4,%rax
   140052e15:	48 c1 f9 11          	sar    $0x11,%rcx
   140052e19:	48 c1 f8 04          	sar    $0x4,%rax
   140052e1d:	48 c1 f9 15          	sar    $0x15,%rcx
   140052e21:	48 c1 f8 1b          	sar    $0x1b,%rax
   140052e25:	48 c1 f8 07          	sar    $0x7,%rax
   140052e29:	48 c1 f9 03          	sar    $0x3,%rcx
   140052e2d:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140052e31:	48 c1 f9 02          	sar    $0x2,%rcx
   140052e35:	48 c1 f8 15          	sar    $0x15,%rax
   140052e39:	48 c1 f9 0b          	sar    $0xb,%rcx
   140052e3d:	48 c1 f8 0d          	sar    $0xd,%rax
   140052e41:	48 c1 f8 1b          	sar    $0x1b,%rax
   140052e45:	48 c1 f8 03          	sar    $0x3,%rax
   140052e49:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140052e4d:	48 c1 f8 07          	sar    $0x7,%rax
   140052e51:	48 d1 f9             	sar    $1,%rcx
   140052e54:	48 c1 f8 02          	sar    $0x2,%rax
   140052e58:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140052e5c:	48 c1 f9 0b          	sar    $0xb,%rcx
   140052e60:	48 c1 f8 11          	sar    $0x11,%rax
   140052e64:	48 c1 f8 03          	sar    $0x3,%rax
   140052e68:	48 c1 f9 09          	sar    $0x9,%rcx
   140052e6c:	48 31 c8             	xor    %rcx,%rax
   140052e6f:	48 b9 fd 51 95 6b 76 	movabs $0x1a6abe766b9551fd,%rcx
   140052e76:	be 6a 1a 
   140052e79:	48 31 c8             	xor    %rcx,%rax
   140052e7c:	48 c1 f8 3f          	sar    $0x3f,%rax
   140052e80:	48 8d 48 01          	lea    0x1(%rax),%rcx
   140052e84:	48 0f af c8          	imul   %rax,%rcx
   140052e88:	48 85 c9             	test   %rcx,%rcx
   140052e8b:	75 0a                	jne    0x140052e97
   140052e8d:	48 c1 e1 26          	shl    $0x26,%rcx
   140052e91:	48 8b 04 cc          	mov    (%rsp,%rcx,8),%rax
   140052e95:	eb 11                	jmp    0x140052ea8
   140052e97:	48 c1 f8 11          	sar    $0x11,%rax
   140052e9b:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140052ea2:	01 00 00 
   140052ea5:	48 8b 01             	mov    (%rcx),%rax
   140052ea8:	59                   	pop    %rcx
   140052ea9:	58                   	pop    %rax
   140052eaa:	9d                   	popf
   140052eab:	45 09 f7             	or     %r14d,%r15d
   140052eae:	9c                   	pushf
   140052eaf:	52                   	push   %rdx
   140052eb0:	56                   	push   %rsi
   140052eb1:	ba fe f3 66 61       	mov    $0x6166f3fe,%edx
   140052eb6:	89 d6                	mov    %edx,%esi
   140052eb8:	c1 fe 07             	sar    $0x7,%esi
   140052ebb:	c1 fe 15             	sar    $0x15,%esi
   140052ebe:	c1 fa 0b             	sar    $0xb,%edx
   140052ec1:	c1 fe 03             	sar    $0x3,%esi
   140052ec4:	d1 fa                	sar    $1,%edx
   140052ec6:	c1 fe 05             	sar    $0x5,%esi
   140052ec9:	c1 fe 04             	sar    $0x4,%esi
   140052ecc:	c1 fe 09             	sar    $0x9,%esi
   140052ecf:	c1 fe 09             	sar    $0x9,%esi
   140052ed2:	c1 fe 02             	sar    $0x2,%esi
   140052ed5:	c1 fa 05             	sar    $0x5,%edx
   140052ed8:	c1 fe 0d             	sar    $0xd,%esi
   140052edb:	c1 fa 11             	sar    $0x11,%edx
   140052ede:	c1 fa 08             	sar    $0x8,%edx
   140052ee1:	c1 fa 1f             	sar    $0x1f,%edx
   140052ee4:	c1 fa 08             	sar    $0x8,%edx
   140052ee7:	c1 fe 15             	sar    $0x15,%esi
   140052eea:	c1 fe 05             	sar    $0x5,%esi
   140052eed:	c1 fe 15             	sar    $0x15,%esi
   140052ef0:	c1 fa 08             	sar    $0x8,%edx
   140052ef3:	c1 fe 03             	sar    $0x3,%esi
   140052ef6:	c1 fa 03             	sar    $0x3,%edx
   140052ef9:	c1 fa 02             	sar    $0x2,%edx
   140052efc:	c1 fe 0f             	sar    $0xf,%esi
   140052eff:	31 f2                	xor    %esi,%edx
   140052f01:	81 f2 20 b6 6d 70    	xor    $0x706db620,%edx
   140052f07:	c1 fa 1f             	sar    $0x1f,%edx
   140052f0a:	8d 72 01             	lea    0x1(%rdx),%esi
   140052f0d:	0f af f2             	imul   %edx,%esi
   140052f10:	85 f6                	test   %esi,%esi
   140052f12:	75 09                	jne    0x140052f1d
   140052f14:	48 c1 e6 26          	shl    $0x26,%rsi
   140052f18:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   140052f1b:	eb 0f                	jmp    0x140052f2c
   140052f1d:	c1 fa 0d             	sar    $0xd,%edx
   140052f20:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140052f27:	01 00 00 
   140052f2a:	8b 16                	mov    (%rsi),%edx
   140052f2c:	5e                   	pop    %rsi
   140052f2d:	5a                   	pop    %rdx
   140052f2e:	9d                   	popf
   140052f2f:	41 c1 ff 1f          	sar    $0x1f,%r15d
   140052f33:	9c                   	pushf
   140052f34:	41 50                	push   %r8
   140052f36:	41 51                	push   %r9
   140052f38:	41 b8 7f 0a cd 5d    	mov    $0x5dcd0a7f,%r8d
   140052f3e:	45 89 c1             	mov    %r8d,%r9d
   140052f41:	41 c1 f9 05          	sar    $0x5,%r9d
   140052f45:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052f49:	41 c1 f9 11          	sar    $0x11,%r9d
   140052f4d:	41 d1 f9             	sar    $1,%r9d
   140052f50:	41 c1 f9 11          	sar    $0x11,%r9d
   140052f54:	41 c1 f9 09          	sar    $0x9,%r9d
   140052f58:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052f5c:	41 c1 f8 03          	sar    $0x3,%r8d
   140052f60:	41 c1 f8 07          	sar    $0x7,%r8d
   140052f64:	41 c1 f9 04          	sar    $0x4,%r9d
   140052f68:	41 c1 f8 0b          	sar    $0xb,%r8d
   140052f6c:	41 c1 f9 0b          	sar    $0xb,%r9d
   140052f70:	41 c1 f9 0f          	sar    $0xf,%r9d
   140052f74:	41 c1 f8 09          	sar    $0x9,%r8d
   140052f78:	41 c1 f8 08          	sar    $0x8,%r8d
   140052f7c:	41 c1 f9 0f          	sar    $0xf,%r9d
   140052f80:	41 c1 f8 09          	sar    $0x9,%r8d
   140052f84:	41 c1 f8 15          	sar    $0x15,%r8d
   140052f88:	41 c1 f9 08          	sar    $0x8,%r9d
   140052f8c:	41 c1 f8 15          	sar    $0x15,%r8d
   140052f90:	41 c1 f9 03          	sar    $0x3,%r9d
   140052f94:	41 c1 f8 09          	sar    $0x9,%r8d
   140052f98:	41 c1 f8 05          	sar    $0x5,%r8d
   140052f9c:	41 c1 f9 02          	sar    $0x2,%r9d
   140052fa0:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052fa4:	41 c1 f8 0f          	sar    $0xf,%r8d
   140052fa8:	41 c1 f9 04          	sar    $0x4,%r9d
   140052fac:	41 c1 f8 03          	sar    $0x3,%r8d
   140052fb0:	41 c1 f8 0d          	sar    $0xd,%r8d
   140052fb4:	41 c1 f9 0b          	sar    $0xb,%r9d
   140052fb8:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140052fbc:	41 d1 f8             	sar    $1,%r8d
   140052fbf:	41 c1 f9 04          	sar    $0x4,%r9d
   140052fc3:	41 c1 f8 05          	sar    $0x5,%r8d
   140052fc7:	45 31 c8             	xor    %r9d,%r8d
   140052fca:	41 81 f0 08 11 21 39 	xor    $0x39211108,%r8d
   140052fd1:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140052fd5:	45 89 c1             	mov    %r8d,%r9d
   140052fd8:	41 ff c1             	inc    %r9d
   140052fdb:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   140052fdf:	45 85 c9             	test   %r9d,%r9d
   140052fe2:	75 0a                	jne    0x140052fee
   140052fe4:	49 c1 e1 28          	shl    $0x28,%r9
   140052fe8:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140052fec:	eb 11                	jmp    0x140052fff
   140052fee:	41 c1 f8 0d          	sar    $0xd,%r8d
   140052ff2:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140052ff9:	01 00 00 
   140052ffc:	45 8b 01             	mov    (%r9),%r8d
   140052fff:	41 59                	pop    %r9
   140053001:	41 58                	pop    %r8
   140053003:	9d                   	popf
   140053004:	44 89 3c 24          	mov    %r15d,(%rsp)
   140053008:	9c                   	pushf
   140053009:	57                   	push   %rdi
   14005300a:	53                   	push   %rbx
   14005300b:	48 bf 6c df 0d b6 fd 	movabs $0x6a56edfdb60ddf6c,%rdi
   140053012:	ed 56 6a 
   140053015:	48 89 fb             	mov    %rdi,%rbx
   140053018:	48 c1 ff 11          	sar    $0x11,%rdi
   14005301c:	48 c1 fb 15          	sar    $0x15,%rbx
   140053020:	48 c1 fb 1b          	sar    $0x1b,%rbx
   140053024:	48 c1 ff 02          	sar    $0x2,%rdi
   140053028:	48 c1 fb 1f          	sar    $0x1f,%rbx
   14005302c:	48 c1 ff 15          	sar    $0x15,%rdi
   140053030:	48 c1 fb 09          	sar    $0x9,%rbx
   140053034:	48 c1 fb 05          	sar    $0x5,%rbx
   140053038:	48 c1 ff 04          	sar    $0x4,%rdi
   14005303c:	48 c1 fb 07          	sar    $0x7,%rbx
   140053040:	48 c1 ff 04          	sar    $0x4,%rdi
   140053044:	48 d1 fb             	sar    $1,%rbx
   140053047:	48 c1 fb 03          	sar    $0x3,%rbx
   14005304b:	48 c1 ff 04          	sar    $0x4,%rdi
   14005304f:	48 c1 fb 0b          	sar    $0xb,%rbx
   140053053:	48 c1 ff 1b          	sar    $0x1b,%rdi
   140053057:	48 c1 fb 05          	sar    $0x5,%rbx
   14005305b:	48 c1 ff 03          	sar    $0x3,%rdi
   14005305f:	48 c1 ff 09          	sar    $0x9,%rdi
   140053063:	48 c1 fb 0d          	sar    $0xd,%rbx
   140053067:	48 c1 ff 07          	sar    $0x7,%rdi
   14005306b:	48 c1 ff 09          	sar    $0x9,%rdi
   14005306f:	48 c1 fb 07          	sar    $0x7,%rbx
   140053073:	48 d1 fb             	sar    $1,%rbx
   140053076:	48 c1 ff 04          	sar    $0x4,%rdi
   14005307a:	48 c1 ff 1f          	sar    $0x1f,%rdi
   14005307e:	48 c1 ff 09          	sar    $0x9,%rdi
   140053082:	48 c1 fb 15          	sar    $0x15,%rbx
   140053086:	48 31 df             	xor    %rbx,%rdi
   140053089:	48 bb 7a d8 7e f9 a2 	movabs $0x44bf1ea2f97ed87a,%rbx
   140053090:	1e bf 44 
   140053093:	48 31 df             	xor    %rbx,%rdi
   140053096:	48 c1 ff 3f          	sar    $0x3f,%rdi
   14005309a:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
   14005309e:	48 0f af df          	imul   %rdi,%rbx
   1400530a2:	48 85 db             	test   %rbx,%rbx
   1400530a5:	75 0a                	jne    0x1400530b1
   1400530a7:	48 c1 e3 26          	shl    $0x26,%rbx
   1400530ab:	48 8b 3c 1c          	mov    (%rsp,%rbx,1),%rdi
   1400530af:	eb 11                	jmp    0x1400530c2
   1400530b1:	48 c1 ff 11          	sar    $0x11,%rdi
   1400530b5:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400530bc:	01 00 00 
   1400530bf:	48 8b 3b             	mov    (%rbx),%rdi
   1400530c2:	5b                   	pop    %rbx
   1400530c3:	5f                   	pop    %rdi
   1400530c4:	9d                   	popf
   1400530c5:	8b 04 24             	mov    (%rsp),%eax
   1400530c8:	9c                   	pushf
   1400530c9:	50                   	push   %rax
   1400530ca:	52                   	push   %rdx
   1400530cb:	b8 3e 2c e1 4c       	mov    $0x4ce12c3e,%eax
   1400530d0:	89 c2                	mov    %eax,%edx
   1400530d2:	c1 fa 09             	sar    $0x9,%edx
   1400530d5:	c1 f8 0b             	sar    $0xb,%eax
   1400530d8:	c1 fa 03             	sar    $0x3,%edx
   1400530db:	c1 fa 15             	sar    $0x15,%edx
   1400530de:	c1 fa 11             	sar    $0x11,%edx
   1400530e1:	c1 fa 08             	sar    $0x8,%edx
   1400530e4:	c1 fa 05             	sar    $0x5,%edx
   1400530e7:	c1 fa 07             	sar    $0x7,%edx
   1400530ea:	c1 fa 0f             	sar    $0xf,%edx
   1400530ed:	c1 fa 03             	sar    $0x3,%edx
   1400530f0:	c1 f8 09             	sar    $0x9,%eax
   1400530f3:	c1 f8 04             	sar    $0x4,%eax
   1400530f6:	d1 fa                	sar    $1,%edx
   1400530f8:	c1 f8 0b             	sar    $0xb,%eax
   1400530fb:	c1 fa 15             	sar    $0x15,%edx
   1400530fe:	c1 f8 11             	sar    $0x11,%eax
   140053101:	c1 fa 0d             	sar    $0xd,%edx
   140053104:	c1 fa 04             	sar    $0x4,%edx
   140053107:	d1 fa                	sar    $1,%edx
   140053109:	c1 fa 05             	sar    $0x5,%edx
   14005310c:	c1 fa 08             	sar    $0x8,%edx
   14005310f:	c1 f8 15             	sar    $0x15,%eax
   140053112:	c1 f8 1f             	sar    $0x1f,%eax
   140053115:	c1 f8 07             	sar    $0x7,%eax
   140053118:	c1 f8 05             	sar    $0x5,%eax
   14005311b:	c1 fa 03             	sar    $0x3,%edx
   14005311e:	31 d0                	xor    %edx,%eax
   140053120:	35 8b 6b 18 66       	xor    $0x66186b8b,%eax
   140053125:	c1 f8 1f             	sar    $0x1f,%eax
   140053128:	89 c2                	mov    %eax,%edx
   14005312a:	d1 fa                	sar    $1,%edx
   14005312c:	31 c2                	xor    %eax,%edx
   14005312e:	85 d2                	test   %edx,%edx
   140053130:	75 09                	jne    0x14005313b
   140053132:	48 c1 e2 28          	shl    $0x28,%rdx
   140053136:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   140053139:	eb 0f                	jmp    0x14005314a
   14005313b:	c1 f8 0d             	sar    $0xd,%eax
   14005313e:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140053145:	01 00 00 
   140053148:	8b 02                	mov    (%rdx),%eax
   14005314a:	5a                   	pop    %rdx
   14005314b:	58                   	pop    %rax
   14005314c:	9d                   	popf
   14005314d:	8b 04 24             	mov    (%rsp),%eax
   140053150:	9c                   	pushf
   140053151:	41 51                	push   %r9
   140053153:	41 52                	push   %r10
   140053155:	41 b9 1a d9 fa 7c    	mov    $0x7cfad91a,%r9d
   14005315b:	45 89 ca             	mov    %r9d,%r10d
   14005315e:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053162:	41 c1 f9 04          	sar    $0x4,%r9d
   140053166:	41 d1 fa             	sar    $1,%r10d
   140053169:	41 d1 f9             	sar    $1,%r9d
   14005316c:	41 c1 f9 08          	sar    $0x8,%r9d
   140053170:	41 c1 f9 03          	sar    $0x3,%r9d
   140053174:	41 c1 f9 04          	sar    $0x4,%r9d
   140053178:	41 c1 f9 15          	sar    $0x15,%r9d
   14005317c:	41 c1 f9 05          	sar    $0x5,%r9d
   140053180:	41 c1 fa 08          	sar    $0x8,%r10d
   140053184:	41 c1 fa 02          	sar    $0x2,%r10d
   140053188:	41 c1 fa 09          	sar    $0x9,%r10d
   14005318c:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053190:	41 c1 f9 02          	sar    $0x2,%r9d
   140053194:	41 c1 fa 07          	sar    $0x7,%r10d
   140053198:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005319c:	41 c1 fa 09          	sar    $0x9,%r10d
   1400531a0:	41 c1 fa 02          	sar    $0x2,%r10d
   1400531a4:	41 c1 fa 11          	sar    $0x11,%r10d
   1400531a8:	41 c1 f9 07          	sar    $0x7,%r9d
   1400531ac:	41 c1 fa 1f          	sar    $0x1f,%r10d
   1400531b0:	41 c1 f9 07          	sar    $0x7,%r9d
   1400531b4:	41 c1 fa 08          	sar    $0x8,%r10d
   1400531b8:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400531bc:	41 c1 fa 08          	sar    $0x8,%r10d
   1400531c0:	41 c1 fa 15          	sar    $0x15,%r10d
   1400531c4:	41 c1 f9 07          	sar    $0x7,%r9d
   1400531c8:	41 c1 f9 07          	sar    $0x7,%r9d
   1400531cc:	41 c1 f9 03          	sar    $0x3,%r9d
   1400531d0:	45 31 d1             	xor    %r10d,%r9d
   1400531d3:	41 81 f1 41 4b 73 2f 	xor    $0x2f734b41,%r9d
   1400531da:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400531de:	45 89 ca             	mov    %r9d,%r10d
   1400531e1:	41 ff c2             	inc    %r10d
   1400531e4:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   1400531e8:	45 85 d2             	test   %r10d,%r10d
   1400531eb:	75 09                	jne    0x1400531f6
   1400531ed:	49 0f ca             	bswap  %r10
   1400531f0:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   1400531f4:	eb 11                	jmp    0x140053207
   1400531f6:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400531fa:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140053201:	01 00 00 
   140053204:	45 8b 0a             	mov    (%r10),%r9d
   140053207:	41 5a                	pop    %r10
   140053209:	41 59                	pop    %r9
   14005320b:	9d                   	popf
   14005320c:	45 31 ed             	xor    %r13d,%r13d
   14005320f:	9c                   	pushf
   140053210:	41 50                	push   %r8
   140053212:	41 51                	push   %r9
   140053214:	41 b8 92 48 e3 77    	mov    $0x77e34892,%r8d
   14005321a:	45 89 c1             	mov    %r8d,%r9d
   14005321d:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140053221:	41 c1 f8 04          	sar    $0x4,%r8d
   140053225:	41 c1 f8 0f          	sar    $0xf,%r8d
   140053229:	41 c1 f9 05          	sar    $0x5,%r9d
   14005322d:	41 c1 f9 09          	sar    $0x9,%r9d
   140053231:	41 c1 f8 02          	sar    $0x2,%r8d
   140053235:	41 c1 f8 0d          	sar    $0xd,%r8d
   140053239:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005323d:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053241:	41 c1 f8 08          	sar    $0x8,%r8d
   140053245:	41 c1 f9 0d          	sar    $0xd,%r9d
   140053249:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005324d:	41 c1 f8 0b          	sar    $0xb,%r8d
   140053251:	41 c1 f9 03          	sar    $0x3,%r9d
   140053255:	41 c1 f8 03          	sar    $0x3,%r8d
   140053259:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005325d:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140053261:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053265:	41 c1 f9 02          	sar    $0x2,%r9d
   140053269:	41 c1 f8 0b          	sar    $0xb,%r8d
   14005326d:	41 c1 f8 04          	sar    $0x4,%r8d
   140053271:	41 c1 f8 02          	sar    $0x2,%r8d
   140053275:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053279:	41 c1 f9 04          	sar    $0x4,%r9d
   14005327d:	41 c1 f8 07          	sar    $0x7,%r8d
   140053281:	41 d1 f9             	sar    $1,%r9d
   140053284:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140053288:	45 31 c8             	xor    %r9d,%r8d
   14005328b:	41 81 f0 78 1b 79 5d 	xor    $0x5d791b78,%r8d
   140053292:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140053296:	45 8d 48 01          	lea    0x1(%r8),%r9d
   14005329a:	45 0f af c8          	imul   %r8d,%r9d
   14005329e:	45 85 c9             	test   %r9d,%r9d
   1400532a1:	75 0a                	jne    0x1400532ad
   1400532a3:	49 c1 e1 26          	shl    $0x26,%r9
   1400532a7:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   1400532ab:	eb 11                	jmp    0x1400532be
   1400532ad:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400532b1:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400532b8:	01 00 00 
   1400532bb:	45 8b 01             	mov    (%r9),%r8d
   1400532be:	41 59                	pop    %r9
   1400532c0:	41 58                	pop    %r8
   1400532c2:	9d                   	popf
   1400532c3:	b8 d4 4c 00 00       	mov    $0x4cd4,%eax
   1400532c8:	9c                   	pushf
   1400532c9:	50                   	push   %rax
   1400532ca:	52                   	push   %rdx
   1400532cb:	48 b8 55 7a 8d 66 a6 	movabs $0x4a2b25a6668d7a55,%rax
   1400532d2:	25 2b 4a 
   1400532d5:	48 89 c2             	mov    %rax,%rdx
   1400532d8:	48 c1 fa 05          	sar    $0x5,%rdx
   1400532dc:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400532e0:	48 c1 fa 02          	sar    $0x2,%rdx
   1400532e4:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400532e8:	48 c1 fa 05          	sar    $0x5,%rdx
   1400532ec:	48 c1 f8 0b          	sar    $0xb,%rax
   1400532f0:	48 c1 fa 15          	sar    $0x15,%rdx
   1400532f4:	48 c1 f8 0d          	sar    $0xd,%rax
   1400532f8:	48 c1 fa 0d          	sar    $0xd,%rdx
   1400532fc:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140053300:	48 c1 f8 0b          	sar    $0xb,%rax
   140053304:	48 c1 f8 09          	sar    $0x9,%rax
   140053308:	48 d1 f8             	sar    $1,%rax
   14005330b:	48 c1 f8 11          	sar    $0x11,%rax
   14005330f:	48 c1 f8 07          	sar    $0x7,%rax
   140053313:	48 c1 f8 1f          	sar    $0x1f,%rax
   140053317:	48 c1 f8 09          	sar    $0x9,%rax
   14005331b:	48 c1 f8 1b          	sar    $0x1b,%rax
   14005331f:	48 c1 fa 04          	sar    $0x4,%rdx
   140053323:	48 c1 fa 07          	sar    $0x7,%rdx
   140053327:	48 d1 fa             	sar    $1,%rdx
   14005332a:	48 c1 fa 09          	sar    $0x9,%rdx
   14005332e:	48 c1 fa 02          	sar    $0x2,%rdx
   140053332:	48 c1 f8 1b          	sar    $0x1b,%rax
   140053336:	48 c1 fa 1f          	sar    $0x1f,%rdx
   14005333a:	48 c1 f8 09          	sar    $0x9,%rax
   14005333e:	48 c1 f8 03          	sar    $0x3,%rax
   140053342:	48 c1 fa 15          	sar    $0x15,%rdx
   140053346:	48 c1 fa 09          	sar    $0x9,%rdx
   14005334a:	48 c1 f8 0d          	sar    $0xd,%rax
   14005334e:	48 c1 fa 05          	sar    $0x5,%rdx
   140053352:	48 31 d0             	xor    %rdx,%rax
   140053355:	48 ba 8e 38 7b 51 e6 	movabs $0x7f67b0e6517b388e,%rdx
   14005335c:	b0 67 7f 
   14005335f:	48 31 d0             	xor    %rdx,%rax
   140053362:	48 c1 f8 3f          	sar    $0x3f,%rax
   140053366:	48 89 c2             	mov    %rax,%rdx
   140053369:	48 d1 fa             	sar    $1,%rdx
   14005336c:	48 31 c2             	xor    %rax,%rdx
   14005336f:	48 85 d2             	test   %rdx,%rdx
   140053372:	75 0a                	jne    0x14005337e
   140053374:	48 c1 e2 2a          	shl    $0x2a,%rdx
   140053378:	48 8b 04 14          	mov    (%rsp,%rdx,1),%rax
   14005337c:	eb 11                	jmp    0x14005338f
   14005337e:	48 c1 f8 11          	sar    $0x11,%rax
   140053382:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140053389:	01 00 00 
   14005338c:	48 8b 02             	mov    (%rdx),%rax
   14005338f:	5a                   	pop    %rdx
   140053390:	58                   	pop    %rax
   140053391:	9d                   	popf
   140053392:	e9 09 f1 ff ff       	jmp    0x1400524a0
   140053397:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   14005339e:	00 00 
   1400533a0:	3d f6 65 00 00       	cmp    $0x65f6,%eax
   1400533a5:	0f 84 16 21 00 00    	je     0x1400554c1
   1400533ab:	3d 07 7a 00 00       	cmp    $0x7a07,%eax
   1400533b0:	0f 85 47 0b 00 00    	jne    0x140053efd
   1400533b6:	9c                   	pushf
   1400533b7:	41 51                	push   %r9
   1400533b9:	41 52                	push   %r10
   1400533bb:	49 b9 39 63 da df 6f 	movabs $0x4e390b6fdfda6339,%r9
   1400533c2:	0b 39 4e 
   1400533c5:	4d 89 ca             	mov    %r9,%r10
   1400533c8:	49 c1 fa 1b          	sar    $0x1b,%r10
   1400533cc:	49 c1 fa 09          	sar    $0x9,%r10
   1400533d0:	49 c1 f9 15          	sar    $0x15,%r9
   1400533d4:	49 c1 f9 05          	sar    $0x5,%r9
   1400533d8:	49 c1 fa 05          	sar    $0x5,%r10
   1400533dc:	49 c1 f9 04          	sar    $0x4,%r9
   1400533e0:	49 c1 f9 05          	sar    $0x5,%r9
   1400533e4:	49 c1 fa 05          	sar    $0x5,%r10
   1400533e8:	49 c1 fa 07          	sar    $0x7,%r10
   1400533ec:	49 c1 f9 1b          	sar    $0x1b,%r9
   1400533f0:	49 c1 f9 1b          	sar    $0x1b,%r9
   1400533f4:	49 c1 f9 09          	sar    $0x9,%r9
   1400533f8:	49 d1 fa             	sar    $1,%r10
   1400533fb:	49 c1 f9 05          	sar    $0x5,%r9
   1400533ff:	49 c1 f9 1f          	sar    $0x1f,%r9
   140053403:	49 d1 f9             	sar    $1,%r9
   140053406:	49 c1 fa 04          	sar    $0x4,%r10
   14005340a:	49 d1 fa             	sar    $1,%r10
   14005340d:	49 c1 f9 09          	sar    $0x9,%r9
   140053411:	49 c1 fa 04          	sar    $0x4,%r10
   140053415:	49 c1 fa 03          	sar    $0x3,%r10
   140053419:	49 c1 fa 0d          	sar    $0xd,%r10
   14005341d:	49 c1 f9 05          	sar    $0x5,%r9
   140053421:	49 c1 f9 02          	sar    $0x2,%r9
   140053425:	49 d1 fa             	sar    $1,%r10
   140053428:	49 c1 fa 02          	sar    $0x2,%r10
   14005342c:	49 c1 f9 09          	sar    $0x9,%r9
   140053430:	49 c1 f9 0d          	sar    $0xd,%r9
   140053434:	4d 31 d1             	xor    %r10,%r9
   140053437:	49 ba 4f 0d 3f 14 ea 	movabs $0x6163f0ea143f0d4f,%r10
   14005343e:	f0 63 61 
   140053441:	4d 31 d1             	xor    %r10,%r9
   140053444:	49 c1 f9 3f          	sar    $0x3f,%r9
   140053448:	4d 8d 51 01          	lea    0x1(%r9),%r10
   14005344c:	4d 0f af d1          	imul   %r9,%r10
   140053450:	4d 85 d2             	test   %r10,%r10
   140053453:	75 09                	jne    0x14005345e
   140053455:	49 0f ca             	bswap  %r10
   140053458:	4e 8b 0c 14          	mov    (%rsp,%r10,1),%r9
   14005345c:	eb 11                	jmp    0x14005346f
   14005345e:	49 c1 f9 11          	sar    $0x11,%r9
   140053462:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140053469:	01 00 00 
   14005346c:	4d 8b 0a             	mov    (%r10),%r9
   14005346f:	41 5a                	pop    %r10
   140053471:	41 59                	pop    %r9
   140053473:	9d                   	popf
   140053474:	49 63 c4             	movslq %r12d,%rax
   140053477:	9c                   	pushf
   140053478:	41 50                	push   %r8
   14005347a:	41 51                	push   %r9
   14005347c:	41 b8 65 72 4b 70    	mov    $0x704b7265,%r8d
   140053482:	45 89 c1             	mov    %r8d,%r9d
   140053485:	41 c1 f9 04          	sar    $0x4,%r9d
   140053489:	41 c1 f9 07          	sar    $0x7,%r9d
   14005348d:	41 c1 f9 07          	sar    $0x7,%r9d
   140053491:	41 c1 f9 15          	sar    $0x15,%r9d
   140053495:	41 d1 f9             	sar    $1,%r9d
   140053498:	41 c1 f8 08          	sar    $0x8,%r8d
   14005349c:	41 c1 f9 04          	sar    $0x4,%r9d
   1400534a0:	41 c1 f9 07          	sar    $0x7,%r9d
   1400534a4:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400534a8:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400534ac:	41 c1 f8 04          	sar    $0x4,%r8d
   1400534b0:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400534b4:	41 c1 f9 0f          	sar    $0xf,%r9d
   1400534b8:	41 d1 f8             	sar    $1,%r8d
   1400534bb:	41 c1 f9 09          	sar    $0x9,%r9d
   1400534bf:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400534c3:	41 c1 f8 02          	sar    $0x2,%r8d
   1400534c7:	41 c1 f9 04          	sar    $0x4,%r9d
   1400534cb:	41 c1 f9 02          	sar    $0x2,%r9d
   1400534cf:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400534d3:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400534d7:	41 c1 f8 02          	sar    $0x2,%r8d
   1400534db:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400534df:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400534e3:	41 c1 f9 0f          	sar    $0xf,%r9d
   1400534e7:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400534eb:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400534ef:	45 31 c8             	xor    %r9d,%r8d
   1400534f2:	41 81 f0 74 84 c4 5c 	xor    $0x5cc48474,%r8d
   1400534f9:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400534fd:	45 8d 48 01          	lea    0x1(%r8),%r9d
   140053501:	45 0f af c8          	imul   %r8d,%r9d
   140053505:	45 85 c9             	test   %r9d,%r9d
   140053508:	75 0a                	jne    0x140053514
   14005350a:	49 c1 c9 20          	ror    $0x20,%r9
   14005350e:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140053512:	eb 11                	jmp    0x140053525
   140053514:	41 c1 f8 0d          	sar    $0xd,%r8d
   140053518:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   14005351f:	01 00 00 
   140053522:	45 8b 01             	mov    (%r9),%r8d
   140053525:	41 59                	pop    %r9
   140053527:	41 58                	pop    %r8
   140053529:	9d                   	popf
   14005352a:	44 89 fa             	mov    %r15d,%edx
   14005352d:	9c                   	pushf
   14005352e:	41 50                	push   %r8
   140053530:	41 51                	push   %r9
   140053532:	41 b8 7d 0c 8f 20    	mov    $0x208f0c7d,%r8d
   140053538:	45 89 c1             	mov    %r8d,%r9d
   14005353b:	41 c1 f9 05          	sar    $0x5,%r9d
   14005353f:	41 c1 f9 15          	sar    $0x15,%r9d
   140053543:	41 c1 f8 03          	sar    $0x3,%r8d
   140053547:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005354b:	41 c1 f8 07          	sar    $0x7,%r8d
   14005354f:	41 c1 f9 08          	sar    $0x8,%r9d
   140053553:	41 c1 f9 07          	sar    $0x7,%r9d
   140053557:	41 d1 f9             	sar    $1,%r9d
   14005355a:	41 d1 f8             	sar    $1,%r8d
   14005355d:	41 c1 f8 05          	sar    $0x5,%r8d
   140053561:	41 c1 f8 09          	sar    $0x9,%r8d
   140053565:	41 c1 f8 07          	sar    $0x7,%r8d
   140053569:	41 d1 f8             	sar    $1,%r8d
   14005356c:	41 c1 f9 05          	sar    $0x5,%r9d
   140053570:	41 c1 f8 0b          	sar    $0xb,%r8d
   140053574:	41 c1 f9 15          	sar    $0x15,%r9d
   140053578:	41 c1 f8 0f          	sar    $0xf,%r8d
   14005357c:	41 c1 f8 04          	sar    $0x4,%r8d
   140053580:	41 c1 f9 05          	sar    $0x5,%r9d
   140053584:	41 c1 f9 03          	sar    $0x3,%r9d
   140053588:	41 d1 f8             	sar    $1,%r8d
   14005358b:	41 c1 f9 09          	sar    $0x9,%r9d
   14005358f:	41 c1 f9 08          	sar    $0x8,%r9d
   140053593:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053597:	41 d1 f8             	sar    $1,%r8d
   14005359a:	45 31 c8             	xor    %r9d,%r8d
   14005359d:	41 81 f0 69 97 6c 6b 	xor    $0x6b6c9769,%r8d
   1400535a4:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400535a8:	45 89 c1             	mov    %r8d,%r9d
   1400535ab:	41 ff c1             	inc    %r9d
   1400535ae:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   1400535b2:	45 85 c9             	test   %r9d,%r9d
   1400535b5:	75 0a                	jne    0x1400535c1
   1400535b7:	49 c1 e1 28          	shl    $0x28,%r9
   1400535bb:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   1400535bf:	eb 11                	jmp    0x1400535d2
   1400535c1:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400535c5:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400535cc:	01 00 00 
   1400535cf:	45 8b 01             	mov    (%r9),%r8d
   1400535d2:	41 59                	pop    %r9
   1400535d4:	41 58                	pop    %r8
   1400535d6:	9d                   	popf
   1400535d7:	f6 d2                	not    %dl
   1400535d9:	9c                   	pushf
   1400535da:	41 52                	push   %r10
   1400535dc:	41 53                	push   %r11
   1400535de:	41 ba 72 d4 78 16    	mov    $0x1678d472,%r10d
   1400535e4:	45 89 d3             	mov    %r10d,%r11d
   1400535e7:	41 c1 fa 15          	sar    $0x15,%r10d
   1400535eb:	41 c1 fa 11          	sar    $0x11,%r10d
   1400535ef:	41 c1 fb 08          	sar    $0x8,%r11d
   1400535f3:	41 c1 fb 05          	sar    $0x5,%r11d
   1400535f7:	41 c1 fb 15          	sar    $0x15,%r11d
   1400535fb:	41 c1 fa 04          	sar    $0x4,%r10d
   1400535ff:	41 c1 fa 11          	sar    $0x11,%r10d
   140053603:	41 c1 fb 04          	sar    $0x4,%r11d
   140053607:	41 c1 fb 05          	sar    $0x5,%r11d
   14005360b:	41 c1 fa 03          	sar    $0x3,%r10d
   14005360f:	41 c1 fa 15          	sar    $0x15,%r10d
   140053613:	41 d1 fa             	sar    $1,%r10d
   140053616:	41 c1 fb 02          	sar    $0x2,%r11d
   14005361a:	41 c1 fb 11          	sar    $0x11,%r11d
   14005361e:	41 c1 fb 0f          	sar    $0xf,%r11d
   140053622:	41 c1 fb 08          	sar    $0x8,%r11d
   140053626:	41 c1 fb 11          	sar    $0x11,%r11d
   14005362a:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005362e:	41 c1 fb 09          	sar    $0x9,%r11d
   140053632:	41 c1 fb 03          	sar    $0x3,%r11d
   140053636:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005363a:	41 c1 fa 11          	sar    $0x11,%r10d
   14005363e:	41 c1 fa 04          	sar    $0x4,%r10d
   140053642:	41 c1 fb 08          	sar    $0x8,%r11d
   140053646:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005364a:	41 c1 fb 11          	sar    $0x11,%r11d
   14005364e:	45 31 da             	xor    %r11d,%r10d
   140053651:	41 81 f2 05 9d ef 31 	xor    $0x31ef9d05,%r10d
   140053658:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005365c:	45 89 d3             	mov    %r10d,%r11d
   14005365f:	41 d1 fb             	sar    $1,%r11d
   140053662:	45 31 d3             	xor    %r10d,%r11d
   140053665:	45 85 db             	test   %r11d,%r11d
   140053668:	75 0a                	jne    0x140053674
   14005366a:	49 c1 e3 28          	shl    $0x28,%r11
   14005366e:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140053672:	eb 11                	jmp    0x140053685
   140053674:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053678:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   14005367f:	01 00 00 
   140053682:	45 8b 13             	mov    (%r11),%r10d
   140053685:	41 5b                	pop    %r11
   140053687:	41 5a                	pop    %r10
   140053689:	9d                   	popf
   14005368a:	41 20 14 00          	and    %dl,(%r8,%rax,1)
   14005368e:	9c                   	pushf
   14005368f:	41 50                	push   %r8
   140053691:	41 51                	push   %r9
   140053693:	41 b8 74 21 f5 76    	mov    $0x76f52174,%r8d
   140053699:	45 89 c1             	mov    %r8d,%r9d
   14005369c:	41 c1 f8 04          	sar    $0x4,%r8d
   1400536a0:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400536a4:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400536a8:	41 d1 f8             	sar    $1,%r8d
   1400536ab:	41 c1 f9 08          	sar    $0x8,%r9d
   1400536af:	41 c1 f9 03          	sar    $0x3,%r9d
   1400536b3:	41 c1 f8 04          	sar    $0x4,%r8d
   1400536b7:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400536bb:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400536bf:	41 c1 f9 05          	sar    $0x5,%r9d
   1400536c3:	41 c1 f8 08          	sar    $0x8,%r8d
   1400536c7:	41 c1 f8 07          	sar    $0x7,%r8d
   1400536cb:	41 c1 f8 11          	sar    $0x11,%r8d
   1400536cf:	41 c1 f9 15          	sar    $0x15,%r9d
   1400536d3:	41 c1 f9 09          	sar    $0x9,%r9d
   1400536d7:	41 c1 f9 03          	sar    $0x3,%r9d
   1400536db:	41 d1 f9             	sar    $1,%r9d
   1400536de:	41 c1 f9 08          	sar    $0x8,%r9d
   1400536e2:	41 d1 f8             	sar    $1,%r8d
   1400536e5:	41 d1 f8             	sar    $1,%r8d
   1400536e8:	41 c1 f8 02          	sar    $0x2,%r8d
   1400536ec:	41 c1 f8 07          	sar    $0x7,%r8d
   1400536f0:	41 c1 f9 11          	sar    $0x11,%r9d
   1400536f4:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400536f8:	41 c1 f8 03          	sar    $0x3,%r8d
   1400536fc:	41 d1 f9             	sar    $1,%r9d
   1400536ff:	41 c1 f9 0b          	sar    $0xb,%r9d
   140053703:	41 c1 f9 09          	sar    $0x9,%r9d
   140053707:	45 31 c8             	xor    %r9d,%r8d
   14005370a:	41 81 f0 0b 53 a1 7e 	xor    $0x7ea1530b,%r8d
   140053711:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140053715:	45 89 c1             	mov    %r8d,%r9d
   140053718:	41 ff c1             	inc    %r9d
   14005371b:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   14005371f:	45 85 c9             	test   %r9d,%r9d
   140053722:	75 0a                	jne    0x14005372e
   140053724:	49 c1 e1 28          	shl    $0x28,%r9
   140053728:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   14005372c:	eb 11                	jmp    0x14005373f
   14005372e:	41 c1 f8 0d          	sar    $0xd,%r8d
   140053732:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140053739:	01 00 00 
   14005373c:	45 8b 01             	mov    (%r9),%r8d
   14005373f:	41 59                	pop    %r9
   140053741:	41 58                	pop    %r8
   140053743:	9d                   	popf
   140053744:	89 c2                	mov    %eax,%edx
   140053746:	9c                   	pushf
   140053747:	50                   	push   %rax
   140053748:	52                   	push   %rdx
   140053749:	48 b8 ce f7 0b 0e d5 	movabs $0x3b204ed50e0bf7ce,%rax
   140053750:	4e 20 3b 
   140053753:	48 89 c2             	mov    %rax,%rdx
   140053756:	48 c1 fa 02          	sar    $0x2,%rdx
   14005375a:	48 c1 fa 03          	sar    $0x3,%rdx
   14005375e:	48 c1 f8 11          	sar    $0x11,%rax
   140053762:	48 c1 f8 04          	sar    $0x4,%rax
   140053766:	48 c1 fa 02          	sar    $0x2,%rdx
   14005376a:	48 c1 f8 1f          	sar    $0x1f,%rax
   14005376e:	48 c1 fa 03          	sar    $0x3,%rdx
   140053772:	48 c1 f8 0d          	sar    $0xd,%rax
   140053776:	48 c1 f8 04          	sar    $0x4,%rax
   14005377a:	48 c1 f8 1f          	sar    $0x1f,%rax
   14005377e:	48 c1 f8 11          	sar    $0x11,%rax
   140053782:	48 c1 f8 07          	sar    $0x7,%rax
   140053786:	48 d1 fa             	sar    $1,%rdx
   140053789:	48 c1 f8 11          	sar    $0x11,%rax
   14005378d:	48 c1 fa 07          	sar    $0x7,%rdx
   140053791:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140053795:	48 c1 fa 0d          	sar    $0xd,%rdx
   140053799:	48 d1 fa             	sar    $1,%rdx
   14005379c:	48 c1 f8 15          	sar    $0x15,%rax
   1400537a0:	48 c1 fa 1b          	sar    $0x1b,%rdx
   1400537a4:	48 c1 fa 15          	sar    $0x15,%rdx
   1400537a8:	48 c1 fa 02          	sar    $0x2,%rdx
   1400537ac:	48 c1 fa 07          	sar    $0x7,%rdx
   1400537b0:	48 d1 fa             	sar    $1,%rdx
   1400537b3:	48 c1 f8 15          	sar    $0x15,%rax
   1400537b7:	48 c1 f8 07          	sar    $0x7,%rax
   1400537bb:	48 c1 fa 15          	sar    $0x15,%rdx
   1400537bf:	48 c1 f8 1b          	sar    $0x1b,%rax
   1400537c3:	48 c1 fa 07          	sar    $0x7,%rdx
   1400537c7:	48 c1 f8 05          	sar    $0x5,%rax
   1400537cb:	48 c1 fa 1b          	sar    $0x1b,%rdx
   1400537cf:	48 31 d0             	xor    %rdx,%rax
   1400537d2:	48 ba 52 1d 7d 28 eb 	movabs $0x45921deb287d1d52,%rdx
   1400537d9:	1d 92 45 
   1400537dc:	48 31 d0             	xor    %rdx,%rax
   1400537df:	48 c1 f8 3f          	sar    $0x3f,%rax
   1400537e3:	48 89 c2             	mov    %rax,%rdx
   1400537e6:	48 d1 fa             	sar    $1,%rdx
   1400537e9:	48 31 c2             	xor    %rax,%rdx
   1400537ec:	48 85 d2             	test   %rdx,%rdx
   1400537ef:	75 0a                	jne    0x1400537fb
   1400537f1:	48 c1 e2 26          	shl    $0x26,%rdx
   1400537f5:	48 8b 04 d4          	mov    (%rsp,%rdx,8),%rax
   1400537f9:	eb 11                	jmp    0x14005380c
   1400537fb:	48 c1 f8 11          	sar    $0x11,%rax
   1400537ff:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140053806:	01 00 00 
   140053809:	48 8b 02             	mov    (%rdx),%rax
   14005380c:	5a                   	pop    %rdx
   14005380d:	58                   	pop    %rax
   14005380e:	9d                   	popf
   14005380f:	83 f2 01             	xor    $0x1,%edx
   140053812:	9c                   	pushf
   140053813:	57                   	push   %rdi
   140053814:	53                   	push   %rbx
   140053815:	bf 5f 09 67 59       	mov    $0x5967095f,%edi
   14005381a:	89 fb                	mov    %edi,%ebx
   14005381c:	c1 ff 11             	sar    $0x11,%edi
   14005381f:	c1 fb 02             	sar    $0x2,%ebx
   140053822:	c1 ff 04             	sar    $0x4,%edi
   140053825:	c1 ff 08             	sar    $0x8,%edi
   140053828:	c1 fb 15             	sar    $0x15,%ebx
   14005382b:	c1 fb 04             	sar    $0x4,%ebx
   14005382e:	c1 fb 07             	sar    $0x7,%ebx
   140053831:	c1 ff 0f             	sar    $0xf,%edi
   140053834:	c1 ff 0b             	sar    $0xb,%edi
   140053837:	c1 ff 04             	sar    $0x4,%edi
   14005383a:	c1 fb 11             	sar    $0x11,%ebx
   14005383d:	d1 ff                	sar    $1,%edi
   14005383f:	d1 ff                	sar    $1,%edi
   140053841:	d1 ff                	sar    $1,%edi
   140053843:	c1 ff 1f             	sar    $0x1f,%edi
   140053846:	c1 ff 04             	sar    $0x4,%edi
   140053849:	c1 fb 15             	sar    $0x15,%ebx
   14005384c:	c1 fb 05             	sar    $0x5,%ebx
   14005384f:	c1 fb 1f             	sar    $0x1f,%ebx
   140053852:	c1 fb 11             	sar    $0x11,%ebx
   140053855:	c1 fb 05             	sar    $0x5,%ebx
   140053858:	c1 ff 05             	sar    $0x5,%edi
   14005385b:	c1 ff 09             	sar    $0x9,%edi
   14005385e:	c1 ff 09             	sar    $0x9,%edi
   140053861:	c1 fb 0d             	sar    $0xd,%ebx
   140053864:	c1 fb 0b             	sar    $0xb,%ebx
   140053867:	c1 ff 05             	sar    $0x5,%edi
   14005386a:	c1 fb 0d             	sar    $0xd,%ebx
   14005386d:	c1 ff 11             	sar    $0x11,%edi
   140053870:	c1 ff 05             	sar    $0x5,%edi
   140053873:	c1 ff 0d             	sar    $0xd,%edi
   140053876:	c1 ff 0b             	sar    $0xb,%edi
   140053879:	c1 ff 0d             	sar    $0xd,%edi
   14005387c:	c1 ff 05             	sar    $0x5,%edi
   14005387f:	31 df                	xor    %ebx,%edi
   140053881:	81 f7 a4 a5 3c 6e    	xor    $0x6e3ca5a4,%edi
   140053887:	c1 ff 1f             	sar    $0x1f,%edi
   14005388a:	89 fb                	mov    %edi,%ebx
   14005388c:	ff c3                	inc    %ebx
   14005388e:	83 e3 fe             	and    $0xfffffffe,%ebx
   140053891:	85 db                	test   %ebx,%ebx
   140053893:	75 08                	jne    0x14005389d
   140053895:	48 0f cb             	bswap  %rbx
   140053898:	8b 3c 5c             	mov    (%rsp,%rbx,2),%edi
   14005389b:	eb 0f                	jmp    0x1400538ac
   14005389d:	c1 ff 0d             	sar    $0xd,%edi
   1400538a0:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400538a7:	01 00 00 
   1400538aa:	8b 3b                	mov    (%rbx),%edi
   1400538ac:	5b                   	pop    %rbx
   1400538ad:	5f                   	pop    %rdi
   1400538ae:	9d                   	popf
   1400538af:	83 e0 01             	and    $0x1,%eax
   1400538b2:	9c                   	pushf
   1400538b3:	52                   	push   %rdx
   1400538b4:	56                   	push   %rsi
   1400538b5:	ba 58 2f 3c 27       	mov    $0x273c2f58,%edx
   1400538ba:	89 d6                	mov    %edx,%esi
   1400538bc:	c1 fa 1f             	sar    $0x1f,%edx
   1400538bf:	c1 fe 0b             	sar    $0xb,%esi
   1400538c2:	d1 fe                	sar    $1,%esi
   1400538c4:	c1 fe 15             	sar    $0x15,%esi
   1400538c7:	c1 fe 0b             	sar    $0xb,%esi
   1400538ca:	c1 fe 09             	sar    $0x9,%esi
   1400538cd:	d1 fe                	sar    $1,%esi
   1400538cf:	c1 fe 09             	sar    $0x9,%esi
   1400538d2:	c1 fa 11             	sar    $0x11,%edx
   1400538d5:	c1 fe 04             	sar    $0x4,%esi
   1400538d8:	c1 fe 11             	sar    $0x11,%esi
   1400538db:	c1 fe 15             	sar    $0x15,%esi
   1400538de:	c1 fe 04             	sar    $0x4,%esi
   1400538e1:	c1 fe 0d             	sar    $0xd,%esi
   1400538e4:	c1 fa 09             	sar    $0x9,%edx
   1400538e7:	c1 fa 0f             	sar    $0xf,%edx
   1400538ea:	c1 fe 09             	sar    $0x9,%esi
   1400538ed:	c1 fe 02             	sar    $0x2,%esi
   1400538f0:	c1 fa 08             	sar    $0x8,%edx
   1400538f3:	c1 fa 03             	sar    $0x3,%edx
   1400538f6:	c1 fa 02             	sar    $0x2,%edx
   1400538f9:	c1 fe 02             	sar    $0x2,%esi
   1400538fc:	c1 fe 07             	sar    $0x7,%esi
   1400538ff:	d1 fe                	sar    $1,%esi
   140053901:	c1 fe 03             	sar    $0x3,%esi
   140053904:	c1 fe 09             	sar    $0x9,%esi
   140053907:	c1 fa 11             	sar    $0x11,%edx
   14005390a:	c1 fe 08             	sar    $0x8,%esi
   14005390d:	c1 fa 15             	sar    $0x15,%edx
   140053910:	c1 fa 09             	sar    $0x9,%edx
   140053913:	d1 fe                	sar    $1,%esi
   140053915:	31 f2                	xor    %esi,%edx
   140053917:	81 f2 b1 9d 25 63    	xor    $0x63259db1,%edx
   14005391d:	c1 fa 1f             	sar    $0x1f,%edx
   140053920:	8d 72 01             	lea    0x1(%rdx),%esi
   140053923:	0f af f2             	imul   %edx,%esi
   140053926:	85 f6                	test   %esi,%esi
   140053928:	75 08                	jne    0x140053932
   14005392a:	48 0f ce             	bswap  %rsi
   14005392d:	8b 14 74             	mov    (%rsp,%rsi,2),%edx
   140053930:	eb 0f                	jmp    0x140053941
   140053932:	c1 fa 0d             	sar    $0xd,%edx
   140053935:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   14005393c:	01 00 00 
   14005393f:	8b 16                	mov    (%rsi),%edx
   140053941:	5e                   	pop    %rsi
   140053942:	5a                   	pop    %rdx
   140053943:	9d                   	popf
   140053944:	44 8d 24 42          	lea    (%rdx,%rax,2),%r12d
   140053948:	9c                   	pushf
   140053949:	41 51                	push   %r9
   14005394b:	41 52                	push   %r10
   14005394d:	41 b9 b0 20 53 17    	mov    $0x175320b0,%r9d
   140053953:	45 89 ca             	mov    %r9d,%r10d
   140053956:	41 c1 fa 02          	sar    $0x2,%r10d
   14005395a:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005395e:	41 c1 fa 09          	sar    $0x9,%r10d
   140053962:	41 d1 f9             	sar    $1,%r9d
   140053965:	41 c1 fa 0b          	sar    $0xb,%r10d
   140053969:	41 c1 f9 02          	sar    $0x2,%r9d
   14005396d:	41 c1 f9 05          	sar    $0x5,%r9d
   140053971:	41 c1 f9 11          	sar    $0x11,%r9d
   140053975:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053979:	41 c1 f9 08          	sar    $0x8,%r9d
   14005397d:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053981:	41 c1 fa 02          	sar    $0x2,%r10d
   140053985:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140053989:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005398d:	41 c1 f9 0b          	sar    $0xb,%r9d
   140053991:	41 d1 f9             	sar    $1,%r9d
   140053994:	41 c1 fa 11          	sar    $0x11,%r10d
   140053998:	41 c1 f9 08          	sar    $0x8,%r9d
   14005399c:	41 c1 f9 07          	sar    $0x7,%r9d
   1400539a0:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400539a4:	41 c1 f9 03          	sar    $0x3,%r9d
   1400539a8:	41 c1 fa 11          	sar    $0x11,%r10d
   1400539ac:	41 c1 f9 05          	sar    $0x5,%r9d
   1400539b0:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400539b4:	41 c1 f9 04          	sar    $0x4,%r9d
   1400539b8:	41 c1 f9 04          	sar    $0x4,%r9d
   1400539bc:	41 c1 fa 15          	sar    $0x15,%r10d
   1400539c0:	41 c1 fa 02          	sar    $0x2,%r10d
   1400539c4:	41 c1 fa 1f          	sar    $0x1f,%r10d
   1400539c8:	41 c1 fa 15          	sar    $0x15,%r10d
   1400539cc:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400539d0:	41 c1 fa 05          	sar    $0x5,%r10d
   1400539d4:	41 c1 f9 04          	sar    $0x4,%r9d
   1400539d8:	45 31 d1             	xor    %r10d,%r9d
   1400539db:	41 81 f1 33 d3 9d 11 	xor    $0x119dd333,%r9d
   1400539e2:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400539e6:	45 8d 51 01          	lea    0x1(%r9),%r10d
   1400539ea:	45 0f af d1          	imul   %r9d,%r10d
   1400539ee:	45 85 d2             	test   %r10d,%r10d
   1400539f1:	75 0a                	jne    0x1400539fd
   1400539f3:	49 c1 e2 28          	shl    $0x28,%r10
   1400539f7:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   1400539fb:	eb 11                	jmp    0x140053a0e
   1400539fd:	41 c1 f9 0d          	sar    $0xd,%r9d
   140053a01:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140053a08:	01 00 00 
   140053a0b:	45 8b 0a             	mov    (%r10),%r9d
   140053a0e:	41 5a                	pop    %r10
   140053a10:	41 59                	pop    %r9
   140053a12:	9d                   	popf
   140053a13:	b8 07 7a 00 00       	mov    $0x7a07,%eax
   140053a18:	41 83 fc 23          	cmp    $0x23,%r12d
   140053a1c:	0f 8c 7e ea ff ff    	jl     0x1400524a0
   140053a22:	9c                   	pushf
   140053a23:	41 52                	push   %r10
   140053a25:	41 53                	push   %r11
   140053a27:	41 ba 25 e8 8a 70    	mov    $0x708ae825,%r10d
   140053a2d:	45 89 d3             	mov    %r10d,%r11d
   140053a30:	41 c1 fb 02          	sar    $0x2,%r11d
   140053a34:	41 c1 fb 11          	sar    $0x11,%r11d
   140053a38:	41 c1 fb 08          	sar    $0x8,%r11d
   140053a3c:	41 c1 fb 11          	sar    $0x11,%r11d
   140053a40:	41 c1 fa 04          	sar    $0x4,%r10d
   140053a44:	41 c1 fb 07          	sar    $0x7,%r11d
   140053a48:	41 c1 fb 07          	sar    $0x7,%r11d
   140053a4c:	41 c1 fa 07          	sar    $0x7,%r10d
   140053a50:	41 c1 fa 11          	sar    $0x11,%r10d
   140053a54:	41 c1 fb 04          	sar    $0x4,%r11d
   140053a58:	41 c1 fa 08          	sar    $0x8,%r10d
   140053a5c:	41 c1 fa 09          	sar    $0x9,%r10d
   140053a60:	41 c1 fb 05          	sar    $0x5,%r11d
   140053a64:	41 c1 fa 0b          	sar    $0xb,%r10d
   140053a68:	41 c1 fb 04          	sar    $0x4,%r11d
   140053a6c:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053a70:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053a74:	41 c1 fb 15          	sar    $0x15,%r11d
   140053a78:	41 c1 fb 05          	sar    $0x5,%r11d
   140053a7c:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053a80:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053a84:	41 c1 fb 0b          	sar    $0xb,%r11d
   140053a88:	41 c1 fb 15          	sar    $0x15,%r11d
   140053a8c:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053a90:	41 c1 fa 07          	sar    $0x7,%r10d
   140053a94:	41 c1 fb 03          	sar    $0x3,%r11d
   140053a98:	41 c1 fa 04          	sar    $0x4,%r10d
   140053a9c:	41 c1 fa 09          	sar    $0x9,%r10d
   140053aa0:	41 c1 fb 04          	sar    $0x4,%r11d
   140053aa4:	41 c1 fb 09          	sar    $0x9,%r11d
   140053aa8:	41 c1 fa 15          	sar    $0x15,%r10d
   140053aac:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053ab0:	41 c1 fa 07          	sar    $0x7,%r10d
   140053ab4:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053ab8:	41 c1 fb 09          	sar    $0x9,%r11d
   140053abc:	41 c1 fb 09          	sar    $0x9,%r11d
   140053ac0:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053ac4:	41 d1 fb             	sar    $1,%r11d
   140053ac7:	45 31 da             	xor    %r11d,%r10d
   140053aca:	41 81 f2 d4 5e 1a 50 	xor    $0x501a5ed4,%r10d
   140053ad1:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053ad5:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140053ad9:	45 0f af da          	imul   %r10d,%r11d
   140053add:	45 85 db             	test   %r11d,%r11d
   140053ae0:	75 0a                	jne    0x140053aec
   140053ae2:	49 c1 e3 28          	shl    $0x28,%r11
   140053ae6:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140053aea:	eb 11                	jmp    0x140053afd
   140053aec:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053af0:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140053af7:	01 00 00 
   140053afa:	45 8b 13             	mov    (%r11),%r10d
   140053afd:	41 5b                	pop    %r11
   140053aff:	41 5a                	pop    %r10
   140053b01:	9d                   	popf
   140053b02:	44 89 f8             	mov    %r15d,%eax
   140053b05:	9c                   	pushf
   140053b06:	41 52                	push   %r10
   140053b08:	41 53                	push   %r11
   140053b0a:	49 ba a7 9d b7 0b d2 	movabs $0x782e7ad20bb79da7,%r10
   140053b11:	7a 2e 78 
   140053b14:	4d 89 d3             	mov    %r10,%r11
   140053b17:	49 c1 fb 07          	sar    $0x7,%r11
   140053b1b:	49 c1 fb 15          	sar    $0x15,%r11
   140053b1f:	49 c1 fb 0b          	sar    $0xb,%r11
   140053b23:	49 c1 fa 04          	sar    $0x4,%r10
   140053b27:	49 d1 fa             	sar    $1,%r10
   140053b2a:	49 c1 fa 11          	sar    $0x11,%r10
   140053b2e:	49 c1 fb 11          	sar    $0x11,%r11
   140053b32:	49 c1 fa 02          	sar    $0x2,%r10
   140053b36:	49 c1 fb 1b          	sar    $0x1b,%r11
   140053b3a:	49 c1 fb 0b          	sar    $0xb,%r11
   140053b3e:	49 c1 fa 11          	sar    $0x11,%r10
   140053b42:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053b46:	49 c1 fa 05          	sar    $0x5,%r10
   140053b4a:	49 c1 fb 04          	sar    $0x4,%r11
   140053b4e:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053b52:	49 c1 fb 03          	sar    $0x3,%r11
   140053b56:	49 c1 fa 05          	sar    $0x5,%r10
   140053b5a:	49 c1 fb 0b          	sar    $0xb,%r11
   140053b5e:	49 c1 fa 11          	sar    $0x11,%r10
   140053b62:	49 c1 fb 15          	sar    $0x15,%r11
   140053b66:	49 c1 fa 0b          	sar    $0xb,%r10
   140053b6a:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053b6e:	49 c1 fb 04          	sar    $0x4,%r11
   140053b72:	49 d1 fa             	sar    $1,%r10
   140053b75:	49 c1 fa 09          	sar    $0x9,%r10
   140053b79:	49 c1 fb 11          	sar    $0x11,%r11
   140053b7d:	4d 31 da             	xor    %r11,%r10
   140053b80:	49 bb 79 4f dd 30 e8 	movabs $0x2f3654e830dd4f79,%r11
   140053b87:	54 36 2f 
   140053b8a:	4d 31 da             	xor    %r11,%r10
   140053b8d:	49 c1 fa 3f          	sar    $0x3f,%r10
   140053b91:	4d 89 d3             	mov    %r10,%r11
   140053b94:	49 ff c3             	inc    %r11
   140053b97:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
   140053b9b:	4d 85 db             	test   %r11,%r11
   140053b9e:	75 09                	jne    0x140053ba9
   140053ba0:	49 0f cb             	bswap  %r11
   140053ba3:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140053ba7:	eb 11                	jmp    0x140053bba
   140053ba9:	49 c1 fa 11          	sar    $0x11,%r10
   140053bad:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140053bb4:	01 00 00 
   140053bb7:	4d 8b 13             	mov    (%r11),%r10
   140053bba:	41 5b                	pop    %r11
   140053bbc:	41 5a                	pop    %r10
   140053bbe:	9d                   	popf
   140053bbf:	83 f0 01             	xor    $0x1,%eax
   140053bc2:	9c                   	pushf
   140053bc3:	41 50                	push   %r8
   140053bc5:	41 51                	push   %r9
   140053bc7:	49 b8 f9 f1 c2 0c 83 	movabs $0x638dae830cc2f1f9,%r8
   140053bce:	ae 8d 63 
   140053bd1:	4d 89 c1             	mov    %r8,%r9
   140053bd4:	49 c1 f8 11          	sar    $0x11,%r8
   140053bd8:	49 c1 f8 11          	sar    $0x11,%r8
   140053bdc:	49 c1 f9 15          	sar    $0x15,%r9
   140053be0:	49 c1 f8 11          	sar    $0x11,%r8
   140053be4:	49 c1 f8 0b          	sar    $0xb,%r8
   140053be8:	49 c1 f8 1b          	sar    $0x1b,%r8
   140053bec:	49 c1 f9 09          	sar    $0x9,%r9
   140053bf0:	49 c1 f9 1f          	sar    $0x1f,%r9
   140053bf4:	49 c1 f8 04          	sar    $0x4,%r8
   140053bf8:	49 c1 f9 1f          	sar    $0x1f,%r9
   140053bfc:	49 c1 f9 09          	sar    $0x9,%r9
   140053c00:	49 c1 f9 1f          	sar    $0x1f,%r9
   140053c04:	49 c1 f9 05          	sar    $0x5,%r9
   140053c08:	49 c1 f9 03          	sar    $0x3,%r9
   140053c0c:	49 c1 f8 11          	sar    $0x11,%r8
   140053c10:	49 c1 f8 1f          	sar    $0x1f,%r8
   140053c14:	49 c1 f9 1b          	sar    $0x1b,%r9
   140053c18:	49 c1 f9 0d          	sar    $0xd,%r9
   140053c1c:	49 c1 f9 0b          	sar    $0xb,%r9
   140053c20:	49 c1 f9 05          	sar    $0x5,%r9
   140053c24:	49 c1 f8 0b          	sar    $0xb,%r8
   140053c28:	49 d1 f8             	sar    $1,%r8
   140053c2b:	49 c1 f9 11          	sar    $0x11,%r9
   140053c2f:	49 c1 f8 0b          	sar    $0xb,%r8
   140053c33:	49 c1 f9 07          	sar    $0x7,%r9
   140053c37:	49 c1 f9 1f          	sar    $0x1f,%r9
   140053c3b:	49 c1 f8 04          	sar    $0x4,%r8
   140053c3f:	49 c1 f8 07          	sar    $0x7,%r8
   140053c43:	4d 31 c8             	xor    %r9,%r8
   140053c46:	49 b9 dc 3a 55 ba 18 	movabs $0x5c630418ba553adc,%r9
   140053c4d:	04 63 5c 
   140053c50:	4d 31 c8             	xor    %r9,%r8
   140053c53:	49 c1 f8 3f          	sar    $0x3f,%r8
   140053c57:	4d 8d 48 01          	lea    0x1(%r8),%r9
   140053c5b:	4d 0f af c8          	imul   %r8,%r9
   140053c5f:	4d 85 c9             	test   %r9,%r9
   140053c62:	75 0a                	jne    0x140053c6e
   140053c64:	49 c1 e1 28          	shl    $0x28,%r9
   140053c68:	4e 8b 04 cc          	mov    (%rsp,%r9,8),%r8
   140053c6c:	eb 11                	jmp    0x140053c7f
   140053c6e:	49 c1 f8 11          	sar    $0x11,%r8
   140053c72:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140053c79:	01 00 00 
   140053c7c:	4d 8b 01             	mov    (%r9),%r8
   140053c7f:	41 59                	pop    %r9
   140053c81:	41 58                	pop    %r8
   140053c83:	9d                   	popf
   140053c84:	44 89 fa             	mov    %r15d,%edx
   140053c87:	9c                   	pushf
   140053c88:	41 52                	push   %r10
   140053c8a:	41 53                	push   %r11
   140053c8c:	41 ba 24 a2 4e 51    	mov    $0x514ea224,%r10d
   140053c92:	45 89 d3             	mov    %r10d,%r11d
   140053c95:	41 c1 fb 07          	sar    $0x7,%r11d
   140053c99:	41 c1 fb 04          	sar    $0x4,%r11d
   140053c9d:	41 d1 fb             	sar    $1,%r11d
   140053ca0:	41 c1 fb 11          	sar    $0x11,%r11d
   140053ca4:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053ca8:	41 c1 fa 07          	sar    $0x7,%r10d
   140053cac:	41 c1 fb 02          	sar    $0x2,%r11d
   140053cb0:	41 c1 fb 05          	sar    $0x5,%r11d
   140053cb4:	41 d1 fb             	sar    $1,%r11d
   140053cb7:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053cbb:	41 c1 fb 04          	sar    $0x4,%r11d
   140053cbf:	41 c1 fa 04          	sar    $0x4,%r10d
   140053cc3:	41 c1 fb 02          	sar    $0x2,%r11d
   140053cc7:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053ccb:	41 c1 fa 09          	sar    $0x9,%r10d
   140053ccf:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053cd3:	41 c1 fa 04          	sar    $0x4,%r10d
   140053cd7:	41 c1 fa 04          	sar    $0x4,%r10d
   140053cdb:	41 c1 fb 02          	sar    $0x2,%r11d
   140053cdf:	41 c1 fb 15          	sar    $0x15,%r11d
   140053ce3:	41 c1 fa 07          	sar    $0x7,%r10d
   140053ce7:	41 c1 fa 02          	sar    $0x2,%r10d
   140053ceb:	41 c1 fa 02          	sar    $0x2,%r10d
   140053cef:	41 c1 fa 09          	sar    $0x9,%r10d
   140053cf3:	41 c1 fa 08          	sar    $0x8,%r10d
   140053cf7:	41 c1 fb 0f          	sar    $0xf,%r11d
   140053cfb:	41 c1 fa 08          	sar    $0x8,%r10d
   140053cff:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053d03:	41 d1 fb             	sar    $1,%r11d
   140053d06:	41 c1 fb 08          	sar    $0x8,%r11d
   140053d0a:	41 c1 fa 03          	sar    $0x3,%r10d
   140053d0e:	41 c1 fb 05          	sar    $0x5,%r11d
   140053d12:	41 c1 fb 0d          	sar    $0xd,%r11d
   140053d16:	41 c1 fa 15          	sar    $0x15,%r10d
   140053d1a:	45 31 da             	xor    %r11d,%r10d
   140053d1d:	41 81 f2 16 d9 6f 68 	xor    $0x686fd916,%r10d
   140053d24:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053d28:	45 89 d3             	mov    %r10d,%r11d
   140053d2b:	41 ff c3             	inc    %r11d
   140053d2e:	41 83 e3 fe          	and    $0xfffffffe,%r11d
   140053d32:	45 85 db             	test   %r11d,%r11d
   140053d35:	75 0a                	jne    0x140053d41
   140053d37:	49 c1 cb 20          	ror    $0x20,%r11
   140053d3b:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140053d3f:	eb 11                	jmp    0x140053d52
   140053d41:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053d45:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140053d4c:	01 00 00 
   140053d4f:	45 8b 13             	mov    (%r11),%r10d
   140053d52:	41 5b                	pop    %r11
   140053d54:	41 5a                	pop    %r10
   140053d56:	9d                   	popf
   140053d57:	83 e2 01             	and    $0x1,%edx
   140053d5a:	9c                   	pushf
   140053d5b:	41 51                	push   %r9
   140053d5d:	41 52                	push   %r10
   140053d5f:	41 b9 51 96 ac 6a    	mov    $0x6aac9651,%r9d
   140053d65:	45 89 ca             	mov    %r9d,%r10d
   140053d68:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053d6c:	41 c1 fa 04          	sar    $0x4,%r10d
   140053d70:	41 c1 f9 04          	sar    $0x4,%r9d
   140053d74:	41 c1 fa 05          	sar    $0x5,%r10d
   140053d78:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053d7c:	41 c1 fa 08          	sar    $0x8,%r10d
   140053d80:	41 c1 fa 08          	sar    $0x8,%r10d
   140053d84:	41 c1 fa 04          	sar    $0x4,%r10d
   140053d88:	41 c1 f9 04          	sar    $0x4,%r9d
   140053d8c:	41 c1 f9 11          	sar    $0x11,%r9d
   140053d90:	41 d1 f9             	sar    $1,%r9d
   140053d93:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053d97:	41 c1 fa 05          	sar    $0x5,%r10d
   140053d9b:	41 c1 f9 07          	sar    $0x7,%r9d
   140053d9f:	41 c1 fa 07          	sar    $0x7,%r10d
   140053da3:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140053da7:	41 c1 fa 15          	sar    $0x15,%r10d
   140053dab:	41 c1 fa 02          	sar    $0x2,%r10d
   140053daf:	41 c1 f9 0f          	sar    $0xf,%r9d
   140053db3:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053db7:	41 c1 f9 15          	sar    $0x15,%r9d
   140053dbb:	41 c1 f9 03          	sar    $0x3,%r9d
   140053dbf:	41 c1 fa 0f          	sar    $0xf,%r10d
   140053dc3:	41 d1 f9             	sar    $1,%r9d
   140053dc6:	41 c1 fa 07          	sar    $0x7,%r10d
   140053dca:	41 c1 f9 02          	sar    $0x2,%r9d
   140053dce:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053dd2:	41 c1 f9 04          	sar    $0x4,%r9d
   140053dd6:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053dda:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053dde:	41 d1 fa             	sar    $1,%r10d
   140053de1:	41 c1 f9 07          	sar    $0x7,%r9d
   140053de5:	45 31 d1             	xor    %r10d,%r9d
   140053de8:	41 81 f1 0a cf 66 2c 	xor    $0x2c66cf0a,%r9d
   140053def:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140053df3:	45 8d 51 01          	lea    0x1(%r9),%r10d
   140053df7:	45 0f af d1          	imul   %r9d,%r10d
   140053dfb:	45 85 d2             	test   %r10d,%r10d
   140053dfe:	75 0a                	jne    0x140053e0a
   140053e00:	49 c1 e2 26          	shl    $0x26,%r10
   140053e04:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140053e08:	eb 11                	jmp    0x140053e1b
   140053e0a:	41 c1 f9 0d          	sar    $0xd,%r9d
   140053e0e:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140053e15:	01 00 00 
   140053e18:	45 8b 0a             	mov    (%r10),%r9d
   140053e1b:	41 5a                	pop    %r10
   140053e1d:	41 59                	pop    %r9
   140053e1f:	9d                   	popf
   140053e20:	44 8d 0c 50          	lea    (%rax,%rdx,2),%r9d
   140053e24:	9c                   	pushf
   140053e25:	41 52                	push   %r10
   140053e27:	41 53                	push   %r11
   140053e29:	49 ba 3b 86 6c 9a 86 	movabs $0x2c844c869a6c863b,%r10
   140053e30:	4c 84 2c 
   140053e33:	4d 89 d3             	mov    %r10,%r11
   140053e36:	49 c1 fb 02          	sar    $0x2,%r11
   140053e3a:	49 c1 fa 0d          	sar    $0xd,%r10
   140053e3e:	49 c1 fb 02          	sar    $0x2,%r11
   140053e42:	49 c1 fb 03          	sar    $0x3,%r11
   140053e46:	49 c1 fb 03          	sar    $0x3,%r11
   140053e4a:	49 c1 fa 15          	sar    $0x15,%r10
   140053e4e:	49 c1 fb 11          	sar    $0x11,%r11
   140053e52:	49 c1 fa 15          	sar    $0x15,%r10
   140053e56:	49 c1 fb 11          	sar    $0x11,%r11
   140053e5a:	49 c1 fa 03          	sar    $0x3,%r10
   140053e5e:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053e62:	49 c1 fb 03          	sar    $0x3,%r11
   140053e66:	49 c1 fa 05          	sar    $0x5,%r10
   140053e6a:	49 d1 fa             	sar    $1,%r10
   140053e6d:	49 c1 fb 11          	sar    $0x11,%r11
   140053e71:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053e75:	49 c1 fa 1b          	sar    $0x1b,%r10
   140053e79:	49 c1 fa 04          	sar    $0x4,%r10
   140053e7d:	49 c1 fa 07          	sar    $0x7,%r10
   140053e81:	49 c1 fa 1f          	sar    $0x1f,%r10
   140053e85:	49 c1 fa 03          	sar    $0x3,%r10
   140053e89:	49 c1 fb 02          	sar    $0x2,%r11
   140053e8d:	49 c1 fb 1b          	sar    $0x1b,%r11
   140053e91:	49 c1 fb 04          	sar    $0x4,%r11
   140053e95:	49 c1 fa 02          	sar    $0x2,%r10
   140053e99:	49 c1 fa 15          	sar    $0x15,%r10
   140053e9d:	49 c1 fa 07          	sar    $0x7,%r10
   140053ea1:	49 c1 fa 03          	sar    $0x3,%r10
   140053ea5:	49 c1 fb 15          	sar    $0x15,%r11
   140053ea9:	49 c1 fb 05          	sar    $0x5,%r11
   140053ead:	49 c1 fb 15          	sar    $0x15,%r11
   140053eb1:	49 c1 fb 15          	sar    $0x15,%r11
   140053eb5:	4d 31 da             	xor    %r11,%r10
   140053eb8:	49 bb 25 79 ed b8 af 	movabs $0x2095ecafb8ed7925,%r11
   140053ebf:	ec 95 20 
   140053ec2:	4d 31 da             	xor    %r11,%r10
   140053ec5:	49 c1 fa 3f          	sar    $0x3f,%r10
   140053ec9:	4d 89 d3             	mov    %r10,%r11
   140053ecc:	49 ff c3             	inc    %r11
   140053ecf:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
   140053ed3:	4d 85 db             	test   %r11,%r11
   140053ed6:	75 0a                	jne    0x140053ee2
   140053ed8:	49 c1 e3 2a          	shl    $0x2a,%r11
   140053edc:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140053ee0:	eb 11                	jmp    0x140053ef3
   140053ee2:	49 c1 fa 11          	sar    $0x11,%r10
   140053ee6:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140053eed:	01 00 00 
   140053ef0:	4d 8b 13             	mov    (%r11),%r10
   140053ef3:	41 5b                	pop    %r11
   140053ef5:	41 5a                	pop    %r10
   140053ef7:	9d                   	popf
   140053ef8:	e9 a6 00 00 00       	jmp    0x140053fa3
   140053efd:	9c                   	pushf
   140053efe:	57                   	push   %rdi
   140053eff:	53                   	push   %rbx
   140053f00:	bf 8c 2e 96 6f       	mov    $0x6f962e8c,%edi
   140053f05:	89 fb                	mov    %edi,%ebx
   140053f07:	c1 ff 09             	sar    $0x9,%edi
   140053f0a:	c1 ff 0f             	sar    $0xf,%edi
   140053f0d:	c1 fb 08             	sar    $0x8,%ebx
   140053f10:	c1 ff 03             	sar    $0x3,%edi
   140053f13:	c1 fb 0f             	sar    $0xf,%ebx
   140053f16:	c1 ff 0d             	sar    $0xd,%edi
   140053f19:	c1 ff 0f             	sar    $0xf,%edi
   140053f1c:	c1 ff 0f             	sar    $0xf,%edi
   140053f1f:	c1 fb 0f             	sar    $0xf,%ebx
   140053f22:	c1 fb 0d             	sar    $0xd,%ebx
   140053f25:	c1 ff 11             	sar    $0x11,%edi
   140053f28:	c1 fb 15             	sar    $0x15,%ebx
   140053f2b:	c1 fb 15             	sar    $0x15,%ebx
   140053f2e:	c1 fb 15             	sar    $0x15,%ebx
   140053f31:	c1 fb 05             	sar    $0x5,%ebx
   140053f34:	c1 fb 0f             	sar    $0xf,%ebx
   140053f37:	c1 fb 02             	sar    $0x2,%ebx
   140053f3a:	c1 ff 04             	sar    $0x4,%edi
   140053f3d:	c1 fb 04             	sar    $0x4,%ebx
   140053f40:	c1 fb 1f             	sar    $0x1f,%ebx
   140053f43:	c1 fb 02             	sar    $0x2,%ebx
   140053f46:	c1 fb 0b             	sar    $0xb,%ebx
   140053f49:	c1 fb 11             	sar    $0x11,%ebx
   140053f4c:	c1 ff 02             	sar    $0x2,%edi
   140053f4f:	d1 ff                	sar    $1,%edi
   140053f51:	c1 ff 09             	sar    $0x9,%edi
   140053f54:	c1 ff 09             	sar    $0x9,%edi
   140053f57:	c1 fb 05             	sar    $0x5,%ebx
   140053f5a:	c1 fb 1f             	sar    $0x1f,%ebx
   140053f5d:	c1 fb 02             	sar    $0x2,%ebx
   140053f60:	d1 fb                	sar    $1,%ebx
   140053f62:	c1 ff 05             	sar    $0x5,%edi
   140053f65:	c1 ff 15             	sar    $0x15,%edi
   140053f68:	31 df                	xor    %ebx,%edi
   140053f6a:	81 f7 89 28 ad 5b    	xor    $0x5bad2889,%edi
   140053f70:	c1 ff 1f             	sar    $0x1f,%edi
   140053f73:	8d 5f 01             	lea    0x1(%rdi),%ebx
   140053f76:	0f af df             	imul   %edi,%ebx
   140053f79:	85 db                	test   %ebx,%ebx
   140053f7b:	75 09                	jne    0x140053f86
   140053f7d:	48 c1 e3 2a          	shl    $0x2a,%rbx
   140053f81:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   140053f84:	eb 0f                	jmp    0x140053f95
   140053f86:	c1 ff 0d             	sar    $0xd,%edi
   140053f89:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140053f90:	01 00 00 
   140053f93:	8b 3b                	mov    (%rbx),%edi
   140053f95:	5b                   	pop    %rbx
   140053f96:	5f                   	pop    %rdi
   140053f97:	9d                   	popf
   140053f98:	c7 04 25 00 00 00 00 	movl   $0xdead,0x0
   140053f9f:	ad de 00 00 
   140053fa3:	9c                   	pushf
   140053fa4:	41 51                	push   %r9
   140053fa6:	41 52                	push   %r10
   140053fa8:	41 b9 59 b4 fc 1b    	mov    $0x1bfcb459,%r9d
   140053fae:	45 89 ca             	mov    %r9d,%r10d
   140053fb1:	41 c1 fa 04          	sar    $0x4,%r10d
   140053fb5:	41 c1 f9 0d          	sar    $0xd,%r9d
   140053fb9:	41 c1 fa 04          	sar    $0x4,%r10d
   140053fbd:	41 c1 f9 11          	sar    $0x11,%r9d
   140053fc1:	41 c1 fa 07          	sar    $0x7,%r10d
   140053fc5:	41 c1 f9 0b          	sar    $0xb,%r9d
   140053fc9:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053fcd:	41 c1 fa 0d          	sar    $0xd,%r10d
   140053fd1:	41 d1 fa             	sar    $1,%r10d
   140053fd4:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053fd8:	41 d1 fa             	sar    $1,%r10d
   140053fdb:	41 c1 fa 04          	sar    $0x4,%r10d
   140053fdf:	41 c1 f9 15          	sar    $0x15,%r9d
   140053fe3:	41 c1 f9 04          	sar    $0x4,%r9d
   140053fe7:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140053feb:	41 c1 fa 04          	sar    $0x4,%r10d
   140053fef:	41 c1 f9 02          	sar    $0x2,%r9d
   140053ff3:	41 c1 fa 02          	sar    $0x2,%r10d
   140053ff7:	41 c1 fa 03          	sar    $0x3,%r10d
   140053ffb:	41 c1 f9 08          	sar    $0x8,%r9d
   140053fff:	41 c1 f9 0f          	sar    $0xf,%r9d
   140054003:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140054007:	41 c1 f9 05          	sar    $0x5,%r9d
   14005400b:	41 c1 f9 11          	sar    $0x11,%r9d
   14005400f:	41 c1 f9 0f          	sar    $0xf,%r9d
   140054013:	41 c1 fa 04          	sar    $0x4,%r10d
   140054017:	41 c1 fa 02          	sar    $0x2,%r10d
   14005401b:	41 c1 f9 15          	sar    $0x15,%r9d
   14005401f:	41 c1 f9 0b          	sar    $0xb,%r9d
   140054023:	41 c1 f9 0d          	sar    $0xd,%r9d
   140054027:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005402b:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005402f:	45 31 d1             	xor    %r10d,%r9d
   140054032:	41 81 f1 d4 55 e7 2c 	xor    $0x2ce755d4,%r9d
   140054039:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005403d:	45 8d 51 01          	lea    0x1(%r9),%r10d
   140054041:	45 0f af d1          	imul   %r9d,%r10d
   140054045:	45 85 d2             	test   %r10d,%r10d
   140054048:	75 09                	jne    0x140054053
   14005404a:	49 0f ca             	bswap  %r10
   14005404d:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   140054051:	eb 11                	jmp    0x140054064
   140054053:	41 c1 f9 0d          	sar    $0xd,%r9d
   140054057:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   14005405e:	01 00 00 
   140054061:	45 8b 0a             	mov    (%r10),%r9d
   140054064:	41 5a                	pop    %r10
   140054066:	41 59                	pop    %r9
   140054068:	9d                   	popf
   140054069:	b8 18 8b 00 00       	mov    $0x8b18,%eax
   14005406e:	9c                   	pushf
   14005406f:	50                   	push   %rax
   140054070:	51                   	push   %rcx
   140054071:	b8 ee b1 4d 7d       	mov    $0x7d4db1ee,%eax
   140054076:	89 c1                	mov    %eax,%ecx
   140054078:	c1 f9 11             	sar    $0x11,%ecx
   14005407b:	c1 f8 15             	sar    $0x15,%eax
   14005407e:	c1 f9 07             	sar    $0x7,%ecx
   140054081:	c1 f9 08             	sar    $0x8,%ecx
   140054084:	c1 f8 0b             	sar    $0xb,%eax
   140054087:	c1 f8 1f             	sar    $0x1f,%eax
   14005408a:	c1 f8 15             	sar    $0x15,%eax
   14005408d:	c1 f8 1f             	sar    $0x1f,%eax
   140054090:	c1 f9 04             	sar    $0x4,%ecx
   140054093:	c1 f8 11             	sar    $0x11,%eax
   140054096:	c1 f8 02             	sar    $0x2,%eax
   140054099:	c1 f8 1f             	sar    $0x1f,%eax
   14005409c:	c1 f9 04             	sar    $0x4,%ecx
   14005409f:	c1 f9 09             	sar    $0x9,%ecx
   1400540a2:	c1 f9 03             	sar    $0x3,%ecx
   1400540a5:	c1 f8 03             	sar    $0x3,%eax
   1400540a8:	c1 f8 07             	sar    $0x7,%eax
   1400540ab:	c1 f9 08             	sar    $0x8,%ecx
   1400540ae:	c1 f9 04             	sar    $0x4,%ecx
   1400540b1:	c1 f9 0d             	sar    $0xd,%ecx
   1400540b4:	c1 f9 15             	sar    $0x15,%ecx
   1400540b7:	c1 f9 03             	sar    $0x3,%ecx
   1400540ba:	c1 f8 05             	sar    $0x5,%eax
   1400540bd:	c1 f8 03             	sar    $0x3,%eax
   1400540c0:	c1 f9 05             	sar    $0x5,%ecx
   1400540c3:	c1 f9 0f             	sar    $0xf,%ecx
   1400540c6:	c1 f9 0d             	sar    $0xd,%ecx
   1400540c9:	c1 f9 04             	sar    $0x4,%ecx
   1400540cc:	c1 f9 09             	sar    $0x9,%ecx
   1400540cf:	c1 f9 1f             	sar    $0x1f,%ecx
   1400540d2:	c1 f9 07             	sar    $0x7,%ecx
   1400540d5:	c1 f9 07             	sar    $0x7,%ecx
   1400540d8:	c1 f9 07             	sar    $0x7,%ecx
   1400540db:	d1 f9                	sar    $1,%ecx
   1400540dd:	c1 f9 0b             	sar    $0xb,%ecx
   1400540e0:	d1 f8                	sar    $1,%eax
   1400540e2:	31 c8                	xor    %ecx,%eax
   1400540e4:	35 71 d1 19 65       	xor    $0x6519d171,%eax
   1400540e9:	c1 f8 1f             	sar    $0x1f,%eax
   1400540ec:	89 c1                	mov    %eax,%ecx
   1400540ee:	ff c1                	inc    %ecx
   1400540f0:	83 e1 fe             	and    $0xfffffffe,%ecx
   1400540f3:	85 c9                	test   %ecx,%ecx
   1400540f5:	75 09                	jne    0x140054100
   1400540f7:	48 c1 e1 28          	shl    $0x28,%rcx
   1400540fb:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   1400540fe:	eb 0f                	jmp    0x14005410f
   140054100:	c1 f8 0d             	sar    $0xd,%eax
   140054103:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   14005410a:	01 00 00 
   14005410d:	8b 01                	mov    (%rcx),%eax
   14005410f:	59                   	pop    %rcx
   140054110:	58                   	pop    %rax
   140054111:	9d                   	popf
   140054112:	e9 89 e3 ff ff       	jmp    0x1400524a0
   140054117:	9c                   	pushf
   140054118:	50                   	push   %rax
   140054119:	51                   	push   %rcx
   14005411a:	b8 6d 2a 89 41       	mov    $0x41892a6d,%eax
   14005411f:	89 c1                	mov    %eax,%ecx
   140054121:	d1 f9                	sar    $1,%ecx
   140054123:	c1 f8 04             	sar    $0x4,%eax
   140054126:	c1 f8 0d             	sar    $0xd,%eax
   140054129:	c1 f9 07             	sar    $0x7,%ecx
   14005412c:	c1 f8 0f             	sar    $0xf,%eax
   14005412f:	d1 f9                	sar    $1,%ecx
   140054131:	c1 f9 11             	sar    $0x11,%ecx
   140054134:	c1 f8 0b             	sar    $0xb,%eax
   140054137:	c1 f8 0b             	sar    $0xb,%eax
   14005413a:	c1 f8 03             	sar    $0x3,%eax
   14005413d:	c1 f8 11             	sar    $0x11,%eax
   140054140:	c1 f9 07             	sar    $0x7,%ecx
   140054143:	c1 f9 09             	sar    $0x9,%ecx
   140054146:	c1 f9 07             	sar    $0x7,%ecx
   140054149:	c1 f9 02             	sar    $0x2,%ecx
   14005414c:	c1 f9 05             	sar    $0x5,%ecx
   14005414f:	c1 f8 02             	sar    $0x2,%eax
   140054152:	c1 f8 11             	sar    $0x11,%eax
   140054155:	c1 f9 02             	sar    $0x2,%ecx
   140054158:	c1 f8 11             	sar    $0x11,%eax
   14005415b:	d1 f9                	sar    $1,%ecx
   14005415d:	c1 f9 0f             	sar    $0xf,%ecx
   140054160:	c1 f8 08             	sar    $0x8,%eax
   140054163:	c1 f8 09             	sar    $0x9,%eax
   140054166:	c1 f8 0f             	sar    $0xf,%eax
   140054169:	c1 f9 09             	sar    $0x9,%ecx
   14005416c:	c1 f8 11             	sar    $0x11,%eax
   14005416f:	c1 f9 03             	sar    $0x3,%ecx
   140054172:	c1 f9 07             	sar    $0x7,%ecx
   140054175:	d1 f9                	sar    $1,%ecx
   140054177:	c1 f8 0f             	sar    $0xf,%eax
   14005417a:	c1 f9 0b             	sar    $0xb,%ecx
   14005417d:	c1 f8 0d             	sar    $0xd,%eax
   140054180:	31 c8                	xor    %ecx,%eax
   140054182:	35 97 ea 16 26       	xor    $0x2616ea97,%eax
   140054187:	c1 f8 1f             	sar    $0x1f,%eax
   14005418a:	8d 48 01             	lea    0x1(%rax),%ecx
   14005418d:	0f af c8             	imul   %eax,%ecx
   140054190:	85 c9                	test   %ecx,%ecx
   140054192:	75 09                	jne    0x14005419d
   140054194:	48 c1 e1 26          	shl    $0x26,%rcx
   140054198:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   14005419b:	eb 0f                	jmp    0x1400541ac
   14005419d:	c1 f8 0d             	sar    $0xd,%eax
   1400541a0:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400541a7:	01 00 00 
   1400541aa:	8b 01                	mov    (%rcx),%eax
   1400541ac:	59                   	pop    %rcx
   1400541ad:	58                   	pop    %rax
   1400541ae:	9d                   	popf
   1400541af:	31 d2                	xor    %edx,%edx
   1400541b1:	9c                   	pushf
   1400541b2:	51                   	push   %rcx
   1400541b3:	41 50                	push   %r8
   1400541b5:	b9 dd b6 79 56       	mov    $0x5679b6dd,%ecx
   1400541ba:	41 89 c8             	mov    %ecx,%r8d
   1400541bd:	41 c1 f8 08          	sar    $0x8,%r8d
   1400541c1:	41 c1 f8 02          	sar    $0x2,%r8d
   1400541c5:	d1 f9                	sar    $1,%ecx
   1400541c7:	41 c1 f8 15          	sar    $0x15,%r8d
   1400541cb:	c1 f9 1f             	sar    $0x1f,%ecx
   1400541ce:	c1 f9 0f             	sar    $0xf,%ecx
   1400541d1:	41 c1 f8 02          	sar    $0x2,%r8d
   1400541d5:	c1 f9 05             	sar    $0x5,%ecx
   1400541d8:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400541dc:	c1 f9 02             	sar    $0x2,%ecx
   1400541df:	c1 f9 09             	sar    $0x9,%ecx
   1400541e2:	c1 f9 0f             	sar    $0xf,%ecx
   1400541e5:	41 c1 f8 15          	sar    $0x15,%r8d
   1400541e9:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400541ed:	41 c1 f8 15          	sar    $0x15,%r8d
   1400541f1:	41 c1 f8 09          	sar    $0x9,%r8d
   1400541f5:	41 d1 f8             	sar    $1,%r8d
   1400541f8:	41 c1 f8 15          	sar    $0x15,%r8d
   1400541fc:	c1 f9 04             	sar    $0x4,%ecx
   1400541ff:	41 c1 f8 07          	sar    $0x7,%r8d
   140054203:	41 c1 f8 0f          	sar    $0xf,%r8d
   140054207:	d1 f9                	sar    $1,%ecx
   140054209:	41 c1 f8 0b          	sar    $0xb,%r8d
   14005420d:	c1 f9 03             	sar    $0x3,%ecx
   140054210:	41 c1 f8 02          	sar    $0x2,%r8d
   140054214:	c1 f9 03             	sar    $0x3,%ecx
   140054217:	44 31 c1             	xor    %r8d,%ecx
   14005421a:	81 f1 d9 3c 0c 74    	xor    $0x740c3cd9,%ecx
   140054220:	c1 f9 1f             	sar    $0x1f,%ecx
   140054223:	44 8d 41 01          	lea    0x1(%rcx),%r8d
   140054227:	44 0f af c1          	imul   %ecx,%r8d
   14005422b:	45 85 c0             	test   %r8d,%r8d
   14005422e:	75 0a                	jne    0x14005423a
   140054230:	49 c1 c8 20          	ror    $0x20,%r8
   140054234:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   140054238:	eb 10                	jmp    0x14005424a
   14005423a:	c1 f9 0d             	sar    $0xd,%ecx
   14005423d:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140054244:	01 00 00 
   140054247:	41 8b 08             	mov    (%r8),%ecx
   14005424a:	41 58                	pop    %r8
   14005424c:	59                   	pop    %rcx
   14005424d:	9d                   	popf
   14005424e:	49 63 c5             	movslq %r13d,%rax
   140054251:	45 39 f5             	cmp    %r14d,%r13d
   140054254:	0f 8d 87 00 00 00    	jge    0x1400542e1
   14005425a:	9c                   	pushf
   14005425b:	50                   	push   %rax
   14005425c:	52                   	push   %rdx
   14005425d:	b8 94 81 88 2e       	mov    $0x2e888194,%eax
   140054262:	89 c2                	mov    %eax,%edx
   140054264:	c1 fa 04             	sar    $0x4,%edx
   140054267:	c1 fa 15             	sar    $0x15,%edx
   14005426a:	c1 f8 15             	sar    $0x15,%eax
   14005426d:	c1 fa 15             	sar    $0x15,%edx
   140054270:	c1 f8 02             	sar    $0x2,%eax
   140054273:	c1 fa 05             	sar    $0x5,%edx
   140054276:	c1 fa 07             	sar    $0x7,%edx
   140054279:	c1 fa 0f             	sar    $0xf,%edx
   14005427c:	c1 f8 15             	sar    $0x15,%eax
   14005427f:	c1 f8 07             	sar    $0x7,%eax
   140054282:	c1 fa 1f             	sar    $0x1f,%edx
   140054285:	c1 f8 02             	sar    $0x2,%eax
   140054288:	c1 fa 05             	sar    $0x5,%edx
   14005428b:	c1 fa 02             	sar    $0x2,%edx
   14005428e:	c1 f8 02             	sar    $0x2,%eax
   140054291:	c1 f8 04             	sar    $0x4,%eax
   140054294:	d1 f8                	sar    $1,%eax
   140054296:	c1 fa 05             	sar    $0x5,%edx
   140054299:	d1 fa                	sar    $1,%edx
   14005429b:	c1 f8 04             	sar    $0x4,%eax
   14005429e:	c1 fa 0f             	sar    $0xf,%edx
   1400542a1:	c1 f8 1f             	sar    $0x1f,%eax
   1400542a4:	c1 f8 15             	sar    $0x15,%eax
   1400542a7:	c1 fa 1f             	sar    $0x1f,%edx
   1400542aa:	c1 fa 09             	sar    $0x9,%edx
   1400542ad:	31 d0                	xor    %edx,%eax
   1400542af:	35 46 ab 72 61       	xor    $0x6172ab46,%eax
   1400542b4:	c1 f8 1f             	sar    $0x1f,%eax
   1400542b7:	89 c2                	mov    %eax,%edx
   1400542b9:	ff c2                	inc    %edx
   1400542bb:	83 e2 fe             	and    $0xfffffffe,%edx
   1400542be:	85 d2                	test   %edx,%edx
   1400542c0:	75 09                	jne    0x1400542cb
   1400542c2:	48 c1 e2 28          	shl    $0x28,%rdx
   1400542c6:	8b 04 54             	mov    (%rsp,%rdx,2),%eax
   1400542c9:	eb 0f                	jmp    0x1400542da
   1400542cb:	c1 f8 0d             	sar    $0xd,%eax
   1400542ce:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400542d5:	01 00 00 
   1400542d8:	8b 02                	mov    (%rdx),%eax
   1400542da:	5a                   	pop    %rdx
   1400542db:	58                   	pop    %rax
   1400542dc:	9d                   	popf
   1400542dd:	0f b6 14 01          	movzbl (%rcx,%rax,1),%edx
   1400542e1:	9c                   	pushf
   1400542e2:	41 51                	push   %r9
   1400542e4:	41 52                	push   %r10
   1400542e6:	49 b9 c1 17 8b 59 a4 	movabs $0x242d21a4598b17c1,%r9
   1400542ed:	21 2d 24 
   1400542f0:	4d 89 ca             	mov    %r9,%r10
   1400542f3:	49 d1 fa             	sar    $1,%r10
   1400542f6:	49 c1 f9 11          	sar    $0x11,%r9
   1400542fa:	49 c1 fa 09          	sar    $0x9,%r10
   1400542fe:	49 c1 f9 05          	sar    $0x5,%r9
   140054302:	49 c1 f9 04          	sar    $0x4,%r9
   140054306:	49 c1 fa 07          	sar    $0x7,%r10
   14005430a:	49 d1 fa             	sar    $1,%r10
   14005430d:	49 c1 f9 04          	sar    $0x4,%r9
   140054311:	49 d1 f9             	sar    $1,%r9
   140054314:	49 c1 f9 03          	sar    $0x3,%r9
   140054318:	49 c1 fa 0d          	sar    $0xd,%r10
   14005431c:	49 c1 f9 0d          	sar    $0xd,%r9
   140054320:	49 c1 fa 0b          	sar    $0xb,%r10
   140054324:	49 c1 f9 11          	sar    $0x11,%r9
   140054328:	49 c1 f9 0d          	sar    $0xd,%r9
   14005432c:	49 c1 fa 1b          	sar    $0x1b,%r10
   140054330:	49 c1 fa 03          	sar    $0x3,%r10
   140054334:	49 c1 fa 03          	sar    $0x3,%r10
   140054338:	49 c1 f9 0d          	sar    $0xd,%r9
   14005433c:	49 c1 fa 04          	sar    $0x4,%r10
   140054340:	49 c1 fa 1b          	sar    $0x1b,%r10
   140054344:	49 c1 f9 05          	sar    $0x5,%r9
   140054348:	49 c1 fa 04          	sar    $0x4,%r10
   14005434c:	49 c1 fa 07          	sar    $0x7,%r10
   140054350:	49 c1 fa 04          	sar    $0x4,%r10
   140054354:	49 d1 fa             	sar    $1,%r10
   140054357:	49 c1 f9 0d          	sar    $0xd,%r9
   14005435b:	49 c1 f9 0d          	sar    $0xd,%r9
   14005435f:	4d 31 d1             	xor    %r10,%r9
   140054362:	49 ba e8 83 40 4e 3e 	movabs $0x5f21073e4e4083e8,%r10
   140054369:	07 21 5f 
   14005436c:	4d 31 d1             	xor    %r10,%r9
   14005436f:	49 c1 f9 3f          	sar    $0x3f,%r9
   140054373:	4d 89 ca             	mov    %r9,%r10
   140054376:	49 ff c2             	inc    %r10
   140054379:	49 83 e2 fe          	and    $0xfffffffffffffffe,%r10
   14005437d:	4d 85 d2             	test   %r10,%r10
   140054380:	75 0a                	jne    0x14005438c
   140054382:	49 c1 ca 20          	ror    $0x20,%r10
   140054386:	4e 8b 0c 14          	mov    (%rsp,%r10,1),%r9
   14005438a:	eb 11                	jmp    0x14005439d
   14005438c:	49 c1 f9 11          	sar    $0x11,%r9
   140054390:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140054397:	01 00 00 
   14005439a:	4d 8b 0a             	mov    (%r10),%r9
   14005439d:	41 5a                	pop    %r10
   14005439f:	41 59                	pop    %r9
   1400543a1:	9d                   	popf
   1400543a2:	41 89 ed             	mov    %ebp,%r13d
   1400543a5:	9c                   	pushf
   1400543a6:	41 50                	push   %r8
   1400543a8:	41 51                	push   %r9
   1400543aa:	41 b8 64 c4 86 2d    	mov    $0x2d86c464,%r8d
   1400543b0:	45 89 c1             	mov    %r8d,%r9d
   1400543b3:	41 c1 f9 15          	sar    $0x15,%r9d
   1400543b7:	41 d1 f9             	sar    $1,%r9d
   1400543ba:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400543be:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400543c2:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400543c6:	41 c1 f9 09          	sar    $0x9,%r9d
   1400543ca:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400543ce:	41 c1 f9 15          	sar    $0x15,%r9d
   1400543d2:	41 c1 f8 04          	sar    $0x4,%r8d
   1400543d6:	41 c1 f8 15          	sar    $0x15,%r8d
   1400543da:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400543de:	41 c1 f9 03          	sar    $0x3,%r9d
   1400543e2:	41 c1 f8 08          	sar    $0x8,%r8d
   1400543e6:	41 c1 f8 05          	sar    $0x5,%r8d
   1400543ea:	41 c1 f8 05          	sar    $0x5,%r8d
   1400543ee:	41 c1 f9 15          	sar    $0x15,%r9d
   1400543f2:	41 d1 f8             	sar    $1,%r8d
   1400543f5:	41 c1 f9 09          	sar    $0x9,%r9d
   1400543f9:	41 c1 f9 08          	sar    $0x8,%r9d
   1400543fd:	41 c1 f9 05          	sar    $0x5,%r9d
   140054401:	41 c1 f9 0b          	sar    $0xb,%r9d
   140054405:	41 c1 f8 09          	sar    $0x9,%r8d
   140054409:	41 d1 f8             	sar    $1,%r8d
   14005440c:	41 c1 f8 0f          	sar    $0xf,%r8d
   140054410:	41 c1 f8 15          	sar    $0x15,%r8d
   140054414:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140054418:	41 c1 f9 04          	sar    $0x4,%r9d
   14005441c:	41 c1 f8 0b          	sar    $0xb,%r8d
   140054420:	41 c1 f9 0b          	sar    $0xb,%r9d
   140054424:	41 c1 f8 0b          	sar    $0xb,%r8d
   140054428:	41 c1 f9 09          	sar    $0x9,%r9d
   14005442c:	41 c1 f8 03          	sar    $0x3,%r8d
   140054430:	41 c1 f8 02          	sar    $0x2,%r8d
   140054434:	41 c1 f8 04          	sar    $0x4,%r8d
   140054438:	41 c1 f8 03          	sar    $0x3,%r8d
   14005443c:	41 c1 f9 09          	sar    $0x9,%r9d
   140054440:	45 31 c8             	xor    %r9d,%r8d
   140054443:	41 81 f0 27 47 a3 15 	xor    $0x15a34727,%r8d
   14005444a:	41 c1 f8 1f          	sar    $0x1f,%r8d
   14005444e:	45 89 c1             	mov    %r8d,%r9d
   140054451:	41 d1 f9             	sar    $1,%r9d
   140054454:	45 31 c1             	xor    %r8d,%r9d
   140054457:	45 85 c9             	test   %r9d,%r9d
   14005445a:	75 0a                	jne    0x140054466
   14005445c:	49 c1 c9 20          	ror    $0x20,%r9
   140054460:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140054464:	eb 11                	jmp    0x140054477
   140054466:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005446a:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140054471:	01 00 00 
   140054474:	45 8b 01             	mov    (%r9),%r8d
   140054477:	41 59                	pop    %r9
   140054479:	41 58                	pop    %r8
   14005447b:	9d                   	popf
   14005447c:	41 c1 fd 05          	sar    $0x5,%r13d
   140054480:	9c                   	pushf
   140054481:	51                   	push   %rcx
   140054482:	41 50                	push   %r8
   140054484:	b9 29 b0 57 51       	mov    $0x5157b029,%ecx
   140054489:	41 89 c8             	mov    %ecx,%r8d
   14005448c:	41 c1 f8 07          	sar    $0x7,%r8d
   140054490:	41 c1 f8 05          	sar    $0x5,%r8d
   140054494:	41 c1 f8 02          	sar    $0x2,%r8d
   140054498:	c1 f9 1f             	sar    $0x1f,%ecx
   14005449b:	c1 f9 07             	sar    $0x7,%ecx
   14005449e:	41 c1 f8 11          	sar    $0x11,%r8d
   1400544a2:	c1 f9 0f             	sar    $0xf,%ecx
   1400544a5:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400544a9:	41 c1 f8 03          	sar    $0x3,%r8d
   1400544ad:	c1 f9 03             	sar    $0x3,%ecx
   1400544b0:	c1 f9 07             	sar    $0x7,%ecx
   1400544b3:	41 c1 f8 05          	sar    $0x5,%r8d
   1400544b7:	c1 f9 0f             	sar    $0xf,%ecx
   1400544ba:	c1 f9 09             	sar    $0x9,%ecx
   1400544bd:	c1 f9 11             	sar    $0x11,%ecx
   1400544c0:	c1 f9 05             	sar    $0x5,%ecx
   1400544c3:	c1 f9 02             	sar    $0x2,%ecx
   1400544c6:	c1 f9 08             	sar    $0x8,%ecx
   1400544c9:	c1 f9 1f             	sar    $0x1f,%ecx
   1400544cc:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400544d0:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400544d4:	c1 f9 09             	sar    $0x9,%ecx
   1400544d7:	c1 f9 08             	sar    $0x8,%ecx
   1400544da:	c1 f9 05             	sar    $0x5,%ecx
   1400544dd:	41 d1 f8             	sar    $1,%r8d
   1400544e0:	c1 f9 09             	sar    $0x9,%ecx
   1400544e3:	41 c1 f8 08          	sar    $0x8,%r8d
   1400544e7:	44 31 c1             	xor    %r8d,%ecx
   1400544ea:	81 f1 00 0b 73 2c    	xor    $0x2c730b00,%ecx
   1400544f0:	c1 f9 1f             	sar    $0x1f,%ecx
   1400544f3:	44 8d 41 01          	lea    0x1(%rcx),%r8d
   1400544f7:	44 0f af c1          	imul   %ecx,%r8d
   1400544fb:	45 85 c0             	test   %r8d,%r8d
   1400544fe:	75 0a                	jne    0x14005450a
   140054500:	49 c1 e0 2a          	shl    $0x2a,%r8
   140054504:	42 8b 0c 44          	mov    (%rsp,%r8,2),%ecx
   140054508:	eb 10                	jmp    0x14005451a
   14005450a:	c1 f9 0d             	sar    $0xd,%ecx
   14005450d:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140054514:	01 00 00 
   140054517:	41 8b 08             	mov    (%r8),%ecx
   14005451a:	41 58                	pop    %r8
   14005451c:	59                   	pop    %rcx
   14005451d:	9d                   	popf
   14005451e:	c1 e5 03             	shl    $0x3,%ebp
   140054521:	9c                   	pushf
   140054522:	52                   	push   %rdx
   140054523:	56                   	push   %rsi
   140054524:	48 ba 75 c8 69 f3 74 	movabs $0x333d2374f369c875,%rdx
   14005452b:	23 3d 33 
   14005452e:	48 89 d6             	mov    %rdx,%rsi
   140054531:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140054535:	48 c1 fa 04          	sar    $0x4,%rdx
   140054539:	48 c1 fa 05          	sar    $0x5,%rdx
   14005453d:	48 c1 fa 0b          	sar    $0xb,%rdx
   140054541:	48 c1 fa 07          	sar    $0x7,%rdx
   140054545:	48 c1 fe 07          	sar    $0x7,%rsi
   140054549:	48 c1 fe 0d          	sar    $0xd,%rsi
   14005454d:	48 d1 fa             	sar    $1,%rdx
   140054550:	48 c1 fe 1f          	sar    $0x1f,%rsi
   140054554:	48 d1 fa             	sar    $1,%rdx
   140054557:	48 c1 fe 1b          	sar    $0x1b,%rsi
   14005455b:	48 c1 fa 09          	sar    $0x9,%rdx
   14005455f:	48 c1 fe 09          	sar    $0x9,%rsi
   140054563:	48 c1 fe 1b          	sar    $0x1b,%rsi
   140054567:	48 c1 fe 1f          	sar    $0x1f,%rsi
   14005456b:	48 c1 fa 03          	sar    $0x3,%rdx
   14005456f:	48 c1 fa 11          	sar    $0x11,%rdx
   140054573:	48 c1 fe 0b          	sar    $0xb,%rsi
   140054577:	48 c1 fe 0b          	sar    $0xb,%rsi
   14005457b:	48 c1 fa 15          	sar    $0x15,%rdx
   14005457f:	48 c1 fe 09          	sar    $0x9,%rsi
   140054583:	48 c1 fe 05          	sar    $0x5,%rsi
   140054587:	48 c1 fe 0d          	sar    $0xd,%rsi
   14005458b:	48 c1 fa 0d          	sar    $0xd,%rdx
   14005458f:	48 d1 fa             	sar    $1,%rdx
   140054592:	48 c1 fa 02          	sar    $0x2,%rdx
   140054596:	48 c1 fa 0b          	sar    $0xb,%rdx
   14005459a:	48 d1 fe             	sar    $1,%rsi
   14005459d:	48 c1 fe 11          	sar    $0x11,%rsi
   1400545a1:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400545a5:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400545a9:	48 31 f2             	xor    %rsi,%rdx
   1400545ac:	48 be 7f d3 77 c1 1e 	movabs $0x6c544d1ec177d37f,%rsi
   1400545b3:	4d 54 6c 
   1400545b6:	48 31 f2             	xor    %rsi,%rdx
   1400545b9:	48 c1 fa 3f          	sar    $0x3f,%rdx
   1400545bd:	48 8d 72 01          	lea    0x1(%rdx),%rsi
   1400545c1:	48 0f af f2          	imul   %rdx,%rsi
   1400545c5:	48 85 f6             	test   %rsi,%rsi
   1400545c8:	75 09                	jne    0x1400545d3
   1400545ca:	48 0f ce             	bswap  %rsi
   1400545cd:	48 8b 14 f4          	mov    (%rsp,%rsi,8),%rdx
   1400545d1:	eb 11                	jmp    0x1400545e4
   1400545d3:	48 c1 fa 11          	sar    $0x11,%rdx
   1400545d7:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   1400545de:	01 00 00 
   1400545e1:	48 8b 16             	mov    (%rsi),%rdx
   1400545e4:	5e                   	pop    %rsi
   1400545e5:	5a                   	pop    %rdx
   1400545e6:	9d                   	popf
   1400545e7:	44 31 ed             	xor    %r13d,%ebp
   1400545ea:	9c                   	pushf
   1400545eb:	50                   	push   %rax
   1400545ec:	51                   	push   %rcx
   1400545ed:	b8 79 5d 7f 6b       	mov    $0x6b7f5d79,%eax
   1400545f2:	89 c1                	mov    %eax,%ecx
   1400545f4:	c1 f8 09             	sar    $0x9,%eax
   1400545f7:	c1 f9 0b             	sar    $0xb,%ecx
   1400545fa:	d1 f8                	sar    $1,%eax
   1400545fc:	c1 f8 08             	sar    $0x8,%eax
   1400545ff:	d1 f8                	sar    $1,%eax
   140054601:	c1 f8 11             	sar    $0x11,%eax
   140054604:	d1 f9                	sar    $1,%ecx
   140054606:	c1 f8 05             	sar    $0x5,%eax
   140054609:	c1 f9 0d             	sar    $0xd,%ecx
   14005460c:	c1 f8 0f             	sar    $0xf,%eax
   14005460f:	d1 f9                	sar    $1,%ecx
   140054611:	c1 f9 11             	sar    $0x11,%ecx
   140054614:	c1 f8 04             	sar    $0x4,%eax
   140054617:	d1 f8                	sar    $1,%eax
   140054619:	c1 f8 05             	sar    $0x5,%eax
   14005461c:	c1 f9 0f             	sar    $0xf,%ecx
   14005461f:	c1 f9 0f             	sar    $0xf,%ecx
   140054622:	c1 f8 0d             	sar    $0xd,%eax
   140054625:	c1 f8 08             	sar    $0x8,%eax
   140054628:	c1 f9 05             	sar    $0x5,%ecx
   14005462b:	c1 f8 04             	sar    $0x4,%eax
   14005462e:	c1 f8 07             	sar    $0x7,%eax
   140054631:	c1 f9 05             	sar    $0x5,%ecx
   140054634:	c1 f8 15             	sar    $0x15,%eax
   140054637:	d1 f8                	sar    $1,%eax
   140054639:	c1 f8 08             	sar    $0x8,%eax
   14005463c:	c1 f8 15             	sar    $0x15,%eax
   14005463f:	d1 f8                	sar    $1,%eax
   140054641:	c1 f8 0d             	sar    $0xd,%eax
   140054644:	31 c8                	xor    %ecx,%eax
   140054646:	35 6a 24 57 23       	xor    $0x2357246a,%eax
   14005464b:	c1 f8 1f             	sar    $0x1f,%eax
   14005464e:	89 c1                	mov    %eax,%ecx
   140054650:	d1 f9                	sar    $1,%ecx
   140054652:	31 c1                	xor    %eax,%ecx
   140054654:	85 c9                	test   %ecx,%ecx
   140054656:	75 09                	jne    0x140054661
   140054658:	48 c1 c9 20          	ror    $0x20,%rcx
   14005465c:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   14005465f:	eb 0f                	jmp    0x140054670
   140054661:	c1 f8 0d             	sar    $0xd,%eax
   140054664:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   14005466b:	01 00 00 
   14005466e:	8b 01                	mov    (%rcx),%eax
   140054670:	59                   	pop    %rcx
   140054671:	58                   	pop    %rax
   140054672:	9d                   	popf
   140054673:	31 d5                	xor    %edx,%ebp
   140054675:	9c                   	pushf
   140054676:	51                   	push   %rcx
   140054677:	41 50                	push   %r8
   140054679:	48 b9 86 cc c4 f3 31 	movabs $0x5c31c431f3c4cc86,%rcx
   140054680:	c4 31 5c 
   140054683:	49 89 c8             	mov    %rcx,%r8
   140054686:	48 c1 f9 0d          	sar    $0xd,%rcx
   14005468a:	49 c1 f8 05          	sar    $0x5,%r8
   14005468e:	49 c1 f8 07          	sar    $0x7,%r8
   140054692:	49 c1 f8 0d          	sar    $0xd,%r8
   140054696:	49 d1 f8             	sar    $1,%r8
   140054699:	49 c1 f8 0d          	sar    $0xd,%r8
   14005469d:	49 c1 f8 1f          	sar    $0x1f,%r8
   1400546a1:	48 c1 f9 1f          	sar    $0x1f,%rcx
   1400546a5:	48 c1 f9 0b          	sar    $0xb,%rcx
   1400546a9:	49 c1 f8 02          	sar    $0x2,%r8
   1400546ad:	48 c1 f9 15          	sar    $0x15,%rcx
   1400546b1:	49 c1 f8 05          	sar    $0x5,%r8
   1400546b5:	48 c1 f9 07          	sar    $0x7,%rcx
   1400546b9:	49 d1 f8             	sar    $1,%r8
   1400546bc:	48 c1 f9 1f          	sar    $0x1f,%rcx
   1400546c0:	49 c1 f8 03          	sar    $0x3,%r8
   1400546c4:	48 c1 f9 04          	sar    $0x4,%rcx
   1400546c8:	49 c1 f8 15          	sar    $0x15,%r8
   1400546cc:	49 c1 f8 03          	sar    $0x3,%r8
   1400546d0:	49 c1 f8 11          	sar    $0x11,%r8
   1400546d4:	48 d1 f9             	sar    $1,%rcx
   1400546d7:	48 c1 f9 1f          	sar    $0x1f,%rcx
   1400546db:	49 c1 f8 11          	sar    $0x11,%r8
   1400546df:	49 c1 f8 15          	sar    $0x15,%r8
   1400546e3:	48 c1 f9 15          	sar    $0x15,%rcx
   1400546e7:	49 c1 f8 03          	sar    $0x3,%r8
   1400546eb:	4c 31 c1             	xor    %r8,%rcx
   1400546ee:	49 b8 2d 36 9d da 6d 	movabs $0x6f12706dda9d362d,%r8
   1400546f5:	70 12 6f 
   1400546f8:	4c 31 c1             	xor    %r8,%rcx
   1400546fb:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1400546ff:	49 89 c8             	mov    %rcx,%r8
   140054702:	49 ff c0             	inc    %r8
   140054705:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
   140054709:	4d 85 c0             	test   %r8,%r8
   14005470c:	75 0a                	jne    0x140054718
   14005470e:	49 c1 e0 28          	shl    $0x28,%r8
   140054712:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   140054716:	eb 11                	jmp    0x140054729
   140054718:	48 c1 f9 11          	sar    $0x11,%rcx
   14005471c:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140054723:	01 00 00 
   140054726:	49 8b 08             	mov    (%r8),%rcx
   140054729:	41 58                	pop    %r8
   14005472b:	59                   	pop    %rcx
   14005472c:	9d                   	popf
   14005472d:	83 f5 37             	xor    $0x37,%ebp
   140054730:	9c                   	pushf
   140054731:	41 50                	push   %r8
   140054733:	41 51                	push   %r9
   140054735:	41 b8 a2 27 5f 7d    	mov    $0x7d5f27a2,%r8d
   14005473b:	45 89 c1             	mov    %r8d,%r9d
   14005473e:	41 c1 f8 0d          	sar    $0xd,%r8d
   140054742:	41 c1 f8 0b          	sar    $0xb,%r8d
   140054746:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005474a:	41 c1 f9 02          	sar    $0x2,%r9d
   14005474e:	41 c1 f9 0d          	sar    $0xd,%r9d
   140054752:	41 d1 f8             	sar    $1,%r8d
   140054755:	41 c1 f8 15          	sar    $0x15,%r8d
   140054759:	41 c1 f9 11          	sar    $0x11,%r9d
   14005475d:	41 c1 f9 09          	sar    $0x9,%r9d
   140054761:	41 c1 f9 08          	sar    $0x8,%r9d
   140054765:	41 c1 f8 0b          	sar    $0xb,%r8d
   140054769:	41 c1 f8 07          	sar    $0x7,%r8d
   14005476d:	41 c1 f8 08          	sar    $0x8,%r8d
   140054771:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140054775:	41 d1 f9             	sar    $1,%r9d
   140054778:	41 c1 f9 0b          	sar    $0xb,%r9d
   14005477c:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140054780:	41 c1 f9 11          	sar    $0x11,%r9d
   140054784:	41 d1 f8             	sar    $1,%r8d
   140054787:	41 c1 f9 0f          	sar    $0xf,%r9d
   14005478b:	41 c1 f8 05          	sar    $0x5,%r8d
   14005478f:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140054793:	41 c1 f9 03          	sar    $0x3,%r9d
   140054797:	41 c1 f8 0b          	sar    $0xb,%r8d
   14005479b:	41 c1 f9 03          	sar    $0x3,%r9d
   14005479f:	41 c1 f9 05          	sar    $0x5,%r9d
   1400547a3:	45 31 c8             	xor    %r9d,%r8d
   1400547a6:	41 81 f0 13 2e 1c 1b 	xor    $0x1b1c2e13,%r8d
   1400547ad:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400547b1:	45 8d 48 01          	lea    0x1(%r8),%r9d
   1400547b5:	45 0f af c8          	imul   %r8d,%r9d
   1400547b9:	45 85 c9             	test   %r9d,%r9d
   1400547bc:	75 0a                	jne    0x1400547c8
   1400547be:	49 c1 c9 20          	ror    $0x20,%r9
   1400547c2:	46 8b 04 4c          	mov    (%rsp,%r9,2),%r8d
   1400547c6:	eb 11                	jmp    0x1400547d9
   1400547c8:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400547cc:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400547d3:	01 00 00 
   1400547d6:	45 8b 01             	mov    (%r9),%r8d
   1400547d9:	41 59                	pop    %r9
   1400547db:	41 58                	pop    %r8
   1400547dd:	9d                   	popf
   1400547de:	48 8d 15 6b 7b 00 00 	lea    0x7b6b(%rip),%rdx        # 0x14005c350
   1400547e5:	9c                   	pushf
   1400547e6:	57                   	push   %rdi
   1400547e7:	53                   	push   %rbx
   1400547e8:	bf 61 b6 71 17       	mov    $0x1771b661,%edi
   1400547ed:	89 fb                	mov    %edi,%ebx
   1400547ef:	c1 fb 04             	sar    $0x4,%ebx
   1400547f2:	c1 ff 02             	sar    $0x2,%edi
   1400547f5:	c1 ff 04             	sar    $0x4,%edi
   1400547f8:	c1 ff 03             	sar    $0x3,%edi
   1400547fb:	c1 fb 03             	sar    $0x3,%ebx
   1400547fe:	c1 fb 1f             	sar    $0x1f,%ebx
   140054801:	c1 fb 03             	sar    $0x3,%ebx
   140054804:	c1 ff 04             	sar    $0x4,%edi
   140054807:	d1 ff                	sar    $1,%edi
   140054809:	c1 ff 07             	sar    $0x7,%edi
   14005480c:	c1 ff 1f             	sar    $0x1f,%edi
   14005480f:	c1 ff 09             	sar    $0x9,%edi
   140054812:	c1 ff 08             	sar    $0x8,%edi
   140054815:	c1 ff 04             	sar    $0x4,%edi
   140054818:	c1 ff 09             	sar    $0x9,%edi
   14005481b:	c1 ff 1f             	sar    $0x1f,%edi
   14005481e:	c1 ff 11             	sar    $0x11,%edi
   140054821:	d1 fb                	sar    $1,%ebx
   140054823:	c1 ff 0f             	sar    $0xf,%edi
   140054826:	d1 fb                	sar    $1,%ebx
   140054828:	c1 ff 1f             	sar    $0x1f,%edi
   14005482b:	d1 ff                	sar    $1,%edi
   14005482d:	c1 ff 0b             	sar    $0xb,%edi
   140054830:	c1 ff 04             	sar    $0x4,%edi
   140054833:	c1 fb 09             	sar    $0x9,%ebx
   140054836:	c1 ff 02             	sar    $0x2,%edi
   140054839:	d1 fb                	sar    $1,%ebx
   14005483b:	c1 fb 0b             	sar    $0xb,%ebx
   14005483e:	c1 ff 04             	sar    $0x4,%edi
   140054841:	c1 ff 09             	sar    $0x9,%edi
   140054844:	c1 fb 11             	sar    $0x11,%ebx
   140054847:	31 df                	xor    %ebx,%edi
   140054849:	81 f7 88 ca 18 63    	xor    $0x6318ca88,%edi
   14005484f:	c1 ff 1f             	sar    $0x1f,%edi
   140054852:	89 fb                	mov    %edi,%ebx
   140054854:	d1 fb                	sar    $1,%ebx
   140054856:	31 fb                	xor    %edi,%ebx
   140054858:	85 db                	test   %ebx,%ebx
   14005485a:	75 09                	jne    0x140054865
   14005485c:	48 c1 e3 26          	shl    $0x26,%rbx
   140054860:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   140054863:	eb 0f                	jmp    0x140054874
   140054865:	c1 ff 0d             	sar    $0xd,%edi
   140054868:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   14005486f:	01 00 00 
   140054872:	8b 3b                	mov    (%rbx),%edi
   140054874:	5b                   	pop    %rbx
   140054875:	5f                   	pop    %rdi
   140054876:	9d                   	popf
   140054877:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
   14005487b:	9c                   	pushf
   14005487c:	50                   	push   %rax
   14005487d:	52                   	push   %rdx
   14005487e:	48 b8 34 65 e6 35 92 	movabs $0x4edd969235e66534,%rax
   140054885:	96 dd 4e 
   140054888:	48 89 c2             	mov    %rax,%rdx
   14005488b:	48 c1 fa 02          	sar    $0x2,%rdx
   14005488f:	48 c1 fa 03          	sar    $0x3,%rdx
   140054893:	48 c1 f8 11          	sar    $0x11,%rax
   140054897:	48 c1 f8 02          	sar    $0x2,%rax
   14005489b:	48 c1 fa 02          	sar    $0x2,%rdx
   14005489f:	48 c1 fa 02          	sar    $0x2,%rdx
   1400548a3:	48 c1 fa 0b          	sar    $0xb,%rdx
   1400548a7:	48 d1 f8             	sar    $1,%rax
   1400548aa:	48 c1 f8 0b          	sar    $0xb,%rax
   1400548ae:	48 c1 f8 1f          	sar    $0x1f,%rax
   1400548b2:	48 c1 fa 15          	sar    $0x15,%rdx
   1400548b6:	48 c1 f8 03          	sar    $0x3,%rax
   1400548ba:	48 c1 f8 0d          	sar    $0xd,%rax
   1400548be:	48 c1 f8 05          	sar    $0x5,%rax
   1400548c2:	48 d1 f8             	sar    $1,%rax
   1400548c5:	48 c1 fa 04          	sar    $0x4,%rdx
   1400548c9:	48 c1 f8 07          	sar    $0x7,%rax
   1400548cd:	48 c1 f8 03          	sar    $0x3,%rax
   1400548d1:	48 c1 f8 04          	sar    $0x4,%rax
   1400548d5:	48 c1 fa 1b          	sar    $0x1b,%rdx
   1400548d9:	48 c1 f8 04          	sar    $0x4,%rax
   1400548dd:	48 c1 fa 09          	sar    $0x9,%rdx
   1400548e1:	48 d1 fa             	sar    $1,%rdx
   1400548e4:	48 c1 fa 1f          	sar    $0x1f,%rdx
   1400548e8:	48 c1 f8 1f          	sar    $0x1f,%rax
   1400548ec:	48 c1 f8 03          	sar    $0x3,%rax
   1400548f0:	48 c1 fa 09          	sar    $0x9,%rdx
   1400548f4:	48 c1 fa 02          	sar    $0x2,%rdx
   1400548f8:	48 c1 f8 15          	sar    $0x15,%rax
   1400548fc:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140054900:	48 c1 f8 1f          	sar    $0x1f,%rax
   140054904:	48 d1 f8             	sar    $1,%rax
   140054907:	48 d1 fa             	sar    $1,%rdx
   14005490a:	48 c1 fa 1b          	sar    $0x1b,%rdx
   14005490e:	48 c1 fa 03          	sar    $0x3,%rdx
   140054912:	48 31 d0             	xor    %rdx,%rax
   140054915:	48 ba 41 df 2a e4 9f 	movabs $0x53a8fa9fe42adf41,%rdx
   14005491c:	fa a8 53 
   14005491f:	48 31 d0             	xor    %rdx,%rax
   140054922:	48 c1 f8 3f          	sar    $0x3f,%rax
   140054926:	48 8d 50 01          	lea    0x1(%rax),%rdx
   14005492a:	48 0f af d0          	imul   %rax,%rdx
   14005492e:	48 85 d2             	test   %rdx,%rdx
   140054931:	75 0a                	jne    0x14005493d
   140054933:	48 c1 e2 26          	shl    $0x26,%rdx
   140054937:	48 8b 04 14          	mov    (%rsp,%rdx,1),%rax
   14005493b:	eb 11                	jmp    0x14005494e
   14005493d:	48 c1 f8 11          	sar    $0x11,%rax
   140054941:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140054948:	01 00 00 
   14005494b:	48 8b 02             	mov    (%rdx),%rax
   14005494e:	5a                   	pop    %rdx
   14005494f:	58                   	pop    %rax
   140054950:	9d                   	popf
   140054951:	44 0f b6 ed          	movzbl %bpl,%r13d
   140054955:	9c                   	pushf
   140054956:	50                   	push   %rax
   140054957:	51                   	push   %rcx
   140054958:	b8 d4 bd 4f 60       	mov    $0x604fbdd4,%eax
   14005495d:	89 c1                	mov    %eax,%ecx
   14005495f:	c1 f9 0d             	sar    $0xd,%ecx
   140054962:	c1 f8 09             	sar    $0x9,%eax
   140054965:	c1 f9 0b             	sar    $0xb,%ecx
   140054968:	c1 f9 08             	sar    $0x8,%ecx
   14005496b:	c1 f9 11             	sar    $0x11,%ecx
   14005496e:	d1 f9                	sar    $1,%ecx
   140054970:	c1 f9 11             	sar    $0x11,%ecx
   140054973:	c1 f9 0b             	sar    $0xb,%ecx
   140054976:	c1 f9 11             	sar    $0x11,%ecx
   140054979:	c1 f8 0b             	sar    $0xb,%eax
   14005497c:	c1 f9 08             	sar    $0x8,%ecx
   14005497f:	c1 f8 0f             	sar    $0xf,%eax
   140054982:	c1 f9 02             	sar    $0x2,%ecx
   140054985:	c1 f8 0d             	sar    $0xd,%eax
   140054988:	c1 f9 11             	sar    $0x11,%ecx
   14005498b:	d1 f9                	sar    $1,%ecx
   14005498d:	c1 f9 02             	sar    $0x2,%ecx
   140054990:	c1 f8 05             	sar    $0x5,%eax
   140054993:	c1 f8 0d             	sar    $0xd,%eax
   140054996:	c1 f9 11             	sar    $0x11,%ecx
   140054999:	c1 f9 08             	sar    $0x8,%ecx
   14005499c:	c1 f8 08             	sar    $0x8,%eax
   14005499f:	c1 f8 04             	sar    $0x4,%eax
   1400549a2:	c1 f9 04             	sar    $0x4,%ecx
   1400549a5:	c1 f8 15             	sar    $0x15,%eax
   1400549a8:	c1 f9 02             	sar    $0x2,%ecx
   1400549ab:	c1 f8 05             	sar    $0x5,%eax
   1400549ae:	c1 f9 11             	sar    $0x11,%ecx
   1400549b1:	c1 f9 15             	sar    $0x15,%ecx
   1400549b4:	c1 f9 15             	sar    $0x15,%ecx
   1400549b7:	c1 f8 0f             	sar    $0xf,%eax
   1400549ba:	31 c8                	xor    %ecx,%eax
   1400549bc:	35 7a 67 bf 11       	xor    $0x11bf677a,%eax
   1400549c1:	c1 f8 1f             	sar    $0x1f,%eax
   1400549c4:	8d 48 01             	lea    0x1(%rax),%ecx
   1400549c7:	0f af c8             	imul   %eax,%ecx
   1400549ca:	85 c9                	test   %ecx,%ecx
   1400549cc:	75 09                	jne    0x1400549d7
   1400549ce:	48 c1 e1 26          	shl    $0x26,%rcx
   1400549d2:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   1400549d5:	eb 0f                	jmp    0x1400549e6
   1400549d7:	c1 f8 0d             	sar    $0xd,%eax
   1400549da:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400549e1:	01 00 00 
   1400549e4:	8b 01                	mov    (%rcx),%eax
   1400549e6:	59                   	pop    %rcx
   1400549e7:	58                   	pop    %rax
   1400549e8:	9d                   	popf
   1400549e9:	41 09 d5             	or     %edx,%r13d
   1400549ec:	9c                   	pushf
   1400549ed:	51                   	push   %rcx
   1400549ee:	41 50                	push   %r8
   1400549f0:	b9 a7 e6 5b 6e       	mov    $0x6e5be6a7,%ecx
   1400549f5:	41 89 c8             	mov    %ecx,%r8d
   1400549f8:	c1 f9 03             	sar    $0x3,%ecx
   1400549fb:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400549ff:	c1 f9 05             	sar    $0x5,%ecx
   140054a02:	c1 f9 04             	sar    $0x4,%ecx
   140054a05:	c1 f9 08             	sar    $0x8,%ecx
   140054a08:	c1 f9 03             	sar    $0x3,%ecx
   140054a0b:	c1 f9 15             	sar    $0x15,%ecx
   140054a0e:	c1 f9 05             	sar    $0x5,%ecx
   140054a11:	c1 f9 09             	sar    $0x9,%ecx
   140054a14:	41 c1 f8 02          	sar    $0x2,%r8d
   140054a18:	41 c1 f8 03          	sar    $0x3,%r8d
   140054a1c:	c1 f9 07             	sar    $0x7,%ecx
   140054a1f:	41 c1 f8 03          	sar    $0x3,%r8d
   140054a23:	41 c1 f8 08          	sar    $0x8,%r8d
   140054a27:	c1 f9 05             	sar    $0x5,%ecx
   140054a2a:	c1 f9 0f             	sar    $0xf,%ecx
   140054a2d:	c1 f9 15             	sar    $0x15,%ecx
   140054a30:	41 c1 f8 08          	sar    $0x8,%r8d
   140054a34:	c1 f9 1f             	sar    $0x1f,%ecx
   140054a37:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140054a3b:	c1 f9 0d             	sar    $0xd,%ecx
   140054a3e:	41 c1 f8 07          	sar    $0x7,%r8d
   140054a42:	41 c1 f8 15          	sar    $0x15,%r8d
   140054a46:	c1 f9 1f             	sar    $0x1f,%ecx
   140054a49:	41 c1 f8 0f          	sar    $0xf,%r8d
   140054a4d:	41 c1 f8 05          	sar    $0x5,%r8d
   140054a51:	c1 f9 0b             	sar    $0xb,%ecx
   140054a54:	c1 f9 05             	sar    $0x5,%ecx
   140054a57:	c1 f9 09             	sar    $0x9,%ecx
   140054a5a:	c1 f9 0f             	sar    $0xf,%ecx
   140054a5d:	41 c1 f8 09          	sar    $0x9,%r8d
   140054a61:	c1 f9 15             	sar    $0x15,%ecx
   140054a64:	c1 f9 0f             	sar    $0xf,%ecx
   140054a67:	44 31 c1             	xor    %r8d,%ecx
   140054a6a:	81 f1 18 33 27 78    	xor    $0x78273318,%ecx
   140054a70:	c1 f9 1f             	sar    $0x1f,%ecx
   140054a73:	41 89 c8             	mov    %ecx,%r8d
   140054a76:	41 d1 f8             	sar    $1,%r8d
   140054a79:	41 31 c8             	xor    %ecx,%r8d
   140054a7c:	45 85 c0             	test   %r8d,%r8d
   140054a7f:	75 09                	jne    0x140054a8a
   140054a81:	49 0f c8             	bswap  %r8
   140054a84:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   140054a88:	eb 10                	jmp    0x140054a9a
   140054a8a:	c1 f9 0d             	sar    $0xd,%ecx
   140054a8d:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140054a94:	01 00 00 
   140054a97:	41 8b 08             	mov    (%r8),%ecx
   140054a9a:	41 58                	pop    %r8
   140054a9c:	59                   	pop    %rcx
   140054a9d:	9d                   	popf
   140054a9e:	21 ea                	and    %ebp,%edx
   140054aa0:	9c                   	pushf
   140054aa1:	50                   	push   %rax
   140054aa2:	52                   	push   %rdx
   140054aa3:	b8 dc 85 7e 32       	mov    $0x327e85dc,%eax
   140054aa8:	89 c2                	mov    %eax,%edx
   140054aaa:	c1 f8 15             	sar    $0x15,%eax
   140054aad:	c1 fa 1f             	sar    $0x1f,%edx
   140054ab0:	c1 f8 03             	sar    $0x3,%eax
   140054ab3:	c1 f8 0f             	sar    $0xf,%eax
   140054ab6:	c1 f8 09             	sar    $0x9,%eax
   140054ab9:	c1 f8 0d             	sar    $0xd,%eax
   140054abc:	c1 fa 08             	sar    $0x8,%edx
   140054abf:	c1 fa 09             	sar    $0x9,%edx
   140054ac2:	c1 f8 1f             	sar    $0x1f,%eax
   140054ac5:	c1 f8 15             	sar    $0x15,%eax
   140054ac8:	c1 f8 0b             	sar    $0xb,%eax
   140054acb:	c1 fa 09             	sar    $0x9,%edx
   140054ace:	c1 f8 08             	sar    $0x8,%eax
   140054ad1:	c1 fa 07             	sar    $0x7,%edx
   140054ad4:	c1 f8 05             	sar    $0x5,%eax
   140054ad7:	c1 fa 05             	sar    $0x5,%edx
   140054ada:	c1 f8 04             	sar    $0x4,%eax
   140054add:	c1 f8 1f             	sar    $0x1f,%eax
   140054ae0:	c1 f8 03             	sar    $0x3,%eax
   140054ae3:	c1 fa 09             	sar    $0x9,%edx
   140054ae6:	c1 f8 0f             	sar    $0xf,%eax
   140054ae9:	c1 fa 05             	sar    $0x5,%edx
   140054aec:	c1 f8 11             	sar    $0x11,%eax
   140054aef:	c1 fa 08             	sar    $0x8,%edx
   140054af2:	c1 f8 03             	sar    $0x3,%eax
   140054af5:	c1 f8 09             	sar    $0x9,%eax
   140054af8:	c1 f8 0b             	sar    $0xb,%eax
   140054afb:	d1 fa                	sar    $1,%edx
   140054afd:	c1 fa 04             	sar    $0x4,%edx
   140054b00:	c1 f8 1f             	sar    $0x1f,%eax
   140054b03:	c1 fa 08             	sar    $0x8,%edx
   140054b06:	31 d0                	xor    %edx,%eax
   140054b08:	35 f1 a8 b2 51       	xor    $0x51b2a8f1,%eax
   140054b0d:	c1 f8 1f             	sar    $0x1f,%eax
   140054b10:	8d 50 01             	lea    0x1(%rax),%edx
   140054b13:	0f af d0             	imul   %eax,%edx
   140054b16:	85 d2                	test   %edx,%edx
   140054b18:	75 09                	jne    0x140054b23
   140054b1a:	48 c1 e2 26          	shl    $0x26,%rdx
   140054b1e:	8b 04 54             	mov    (%rsp,%rdx,2),%eax
   140054b21:	eb 0f                	jmp    0x140054b32
   140054b23:	c1 f8 0d             	sar    $0xd,%eax
   140054b26:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140054b2d:	01 00 00 
   140054b30:	8b 02                	mov    (%rdx),%eax
   140054b32:	5a                   	pop    %rdx
   140054b33:	58                   	pop    %rax
   140054b34:	9d                   	popf
   140054b35:	41 29 d5             	sub    %edx,%r13d
   140054b38:	9c                   	pushf
   140054b39:	41 52                	push   %r10
   140054b3b:	41 53                	push   %r11
   140054b3d:	49 ba 42 cd 5f 9f 1a 	movabs $0x499bff1a9f5fcd42,%r10
   140054b44:	ff 9b 49 
   140054b47:	4d 89 d3             	mov    %r10,%r11
   140054b4a:	49 c1 fb 09          	sar    $0x9,%r11
   140054b4e:	49 d1 fa             	sar    $1,%r10
   140054b51:	49 c1 fb 02          	sar    $0x2,%r11
   140054b55:	49 c1 fa 03          	sar    $0x3,%r10
   140054b59:	49 c1 fa 11          	sar    $0x11,%r10
   140054b5d:	49 c1 fa 04          	sar    $0x4,%r10
   140054b61:	49 c1 fa 04          	sar    $0x4,%r10
   140054b65:	49 c1 fa 1f          	sar    $0x1f,%r10
   140054b69:	49 c1 fb 1f          	sar    $0x1f,%r11
   140054b6d:	49 c1 fa 05          	sar    $0x5,%r10
   140054b71:	49 c1 fb 05          	sar    $0x5,%r11
   140054b75:	49 d1 fa             	sar    $1,%r10
   140054b78:	49 c1 fb 05          	sar    $0x5,%r11
   140054b7c:	49 c1 fa 11          	sar    $0x11,%r10
   140054b80:	49 c1 fb 04          	sar    $0x4,%r11
   140054b84:	49 c1 fa 07          	sar    $0x7,%r10
   140054b88:	49 c1 fa 11          	sar    $0x11,%r10
   140054b8c:	49 c1 fa 02          	sar    $0x2,%r10
   140054b90:	49 c1 fa 0b          	sar    $0xb,%r10
   140054b94:	49 c1 fb 11          	sar    $0x11,%r11
   140054b98:	49 c1 fa 09          	sar    $0x9,%r10
   140054b9c:	49 c1 fb 07          	sar    $0x7,%r11
   140054ba0:	49 c1 fb 0d          	sar    $0xd,%r11
   140054ba4:	49 c1 fb 07          	sar    $0x7,%r11
   140054ba8:	49 c1 fb 04          	sar    $0x4,%r11
   140054bac:	49 c1 fa 03          	sar    $0x3,%r10
   140054bb0:	4d 31 da             	xor    %r11,%r10
   140054bb3:	49 bb 55 89 65 34 c6 	movabs $0x4b3da5c634658955,%r11
   140054bba:	a5 3d 4b 
   140054bbd:	4d 31 da             	xor    %r11,%r10
   140054bc0:	49 c1 fa 3f          	sar    $0x3f,%r10
   140054bc4:	4d 89 d3             	mov    %r10,%r11
   140054bc7:	49 ff c3             	inc    %r11
   140054bca:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
   140054bce:	4d 85 db             	test   %r11,%r11
   140054bd1:	75 0a                	jne    0x140054bdd
   140054bd3:	49 c1 cb 20          	ror    $0x20,%r11
   140054bd7:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140054bdb:	eb 11                	jmp    0x140054bee
   140054bdd:	49 c1 fa 11          	sar    $0x11,%r10
   140054be1:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140054be8:	01 00 00 
   140054beb:	4d 8b 13             	mov    (%r11),%r10
   140054bee:	41 5b                	pop    %r11
   140054bf0:	41 5a                	pop    %r10
   140054bf2:	9d                   	popf
   140054bf3:	44 09 eb             	or     %r13d,%ebx
   140054bf6:	9c                   	pushf
   140054bf7:	41 51                	push   %r9
   140054bf9:	41 52                	push   %r10
   140054bfb:	49 b9 6c a7 be 6c 4d 	movabs $0x7ef4c44d6cbea76c,%r9
   140054c02:	c4 f4 7e 
   140054c05:	4d 89 ca             	mov    %r9,%r10
   140054c08:	49 c1 f9 15          	sar    $0x15,%r9
   140054c0c:	49 c1 fa 02          	sar    $0x2,%r10
   140054c10:	49 d1 fa             	sar    $1,%r10
   140054c13:	49 c1 fa 05          	sar    $0x5,%r10
   140054c17:	49 c1 fa 02          	sar    $0x2,%r10
   140054c1b:	49 c1 fa 04          	sar    $0x4,%r10
   140054c1f:	49 c1 fa 1b          	sar    $0x1b,%r10
   140054c23:	49 c1 fa 11          	sar    $0x11,%r10
   140054c27:	49 c1 fa 05          	sar    $0x5,%r10
   140054c2b:	49 c1 f9 15          	sar    $0x15,%r9
   140054c2f:	49 c1 f9 09          	sar    $0x9,%r9
   140054c33:	49 c1 f9 11          	sar    $0x11,%r9
   140054c37:	49 c1 fa 11          	sar    $0x11,%r10
   140054c3b:	49 c1 f9 1f          	sar    $0x1f,%r9
   140054c3f:	49 c1 fa 03          	sar    $0x3,%r10
   140054c43:	49 d1 f9             	sar    $1,%r9
   140054c46:	49 c1 f9 02          	sar    $0x2,%r9
   140054c4a:	49 c1 f9 1f          	sar    $0x1f,%r9
   140054c4e:	49 c1 f9 03          	sar    $0x3,%r9
   140054c52:	49 c1 f9 1f          	sar    $0x1f,%r9
   140054c56:	49 c1 f9 0d          	sar    $0xd,%r9
   140054c5a:	49 c1 fa 05          	sar    $0x5,%r10
   140054c5e:	49 c1 f9 1b          	sar    $0x1b,%r9
   140054c62:	49 c1 fa 09          	sar    $0x9,%r10
   140054c66:	49 d1 f9             	sar    $1,%r9
   140054c69:	49 c1 f9 11          	sar    $0x11,%r9
   140054c6d:	49 c1 fa 02          	sar    $0x2,%r10
   140054c71:	49 c1 fa 02          	sar    $0x2,%r10
   140054c75:	49 c1 fa 0d          	sar    $0xd,%r10
   140054c79:	49 c1 fa 0b          	sar    $0xb,%r10
   140054c7d:	49 c1 fa 07          	sar    $0x7,%r10
   140054c81:	49 c1 fa 04          	sar    $0x4,%r10
   140054c85:	49 c1 f9 15          	sar    $0x15,%r9
   140054c89:	4d 31 d1             	xor    %r10,%r9
   140054c8c:	49 ba db 03 d9 3d e0 	movabs $0x10d4cae03dd903db,%r10
   140054c93:	ca d4 10 
   140054c96:	4d 31 d1             	xor    %r10,%r9
   140054c99:	49 c1 f9 3f          	sar    $0x3f,%r9
   140054c9d:	4d 89 ca             	mov    %r9,%r10
   140054ca0:	49 d1 fa             	sar    $1,%r10
   140054ca3:	4d 31 ca             	xor    %r9,%r10
   140054ca6:	4d 85 d2             	test   %r10,%r10
   140054ca9:	75 0a                	jne    0x140054cb5
   140054cab:	49 c1 e2 28          	shl    $0x28,%r10
   140054caf:	4e 8b 0c 14          	mov    (%rsp,%r10,1),%r9
   140054cb3:	eb 11                	jmp    0x140054cc6
   140054cb5:	49 c1 f9 11          	sar    $0x11,%r9
   140054cb9:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140054cc0:	01 00 00 
   140054cc3:	4d 8b 0a             	mov    (%r10),%r9
   140054cc6:	41 5a                	pop    %r10
   140054cc8:	41 59                	pop    %r9
   140054cca:	9d                   	popf
   140054ccb:	89 2c 24             	mov    %ebp,(%rsp)
   140054cce:	9c                   	pushf
   140054ccf:	52                   	push   %rdx
   140054cd0:	56                   	push   %rsi
   140054cd1:	ba 21 56 d5 74       	mov    $0x74d55621,%edx
   140054cd6:	89 d6                	mov    %edx,%esi
   140054cd8:	c1 fe 09             	sar    $0x9,%esi
   140054cdb:	c1 fa 0d             	sar    $0xd,%edx
   140054cde:	c1 fa 11             	sar    $0x11,%edx
   140054ce1:	c1 fe 11             	sar    $0x11,%esi
   140054ce4:	c1 fa 09             	sar    $0x9,%edx
   140054ce7:	c1 fe 11             	sar    $0x11,%esi
   140054cea:	c1 fe 0b             	sar    $0xb,%esi
   140054ced:	c1 fa 07             	sar    $0x7,%edx
   140054cf0:	c1 fa 1f             	sar    $0x1f,%edx
   140054cf3:	c1 fe 0d             	sar    $0xd,%esi
   140054cf6:	c1 fa 07             	sar    $0x7,%edx
   140054cf9:	c1 fa 07             	sar    $0x7,%edx
   140054cfc:	c1 fe 07             	sar    $0x7,%esi
   140054cff:	c1 fe 09             	sar    $0x9,%esi
   140054d02:	c1 fe 0d             	sar    $0xd,%esi
   140054d05:	c1 fa 11             	sar    $0x11,%edx
   140054d08:	c1 fe 11             	sar    $0x11,%esi
   140054d0b:	c1 fa 03             	sar    $0x3,%edx
   140054d0e:	c1 fa 05             	sar    $0x5,%edx
   140054d11:	c1 fe 1f             	sar    $0x1f,%esi
   140054d14:	c1 fa 1f             	sar    $0x1f,%edx
   140054d17:	c1 fa 1f             	sar    $0x1f,%edx
   140054d1a:	c1 fa 15             	sar    $0x15,%edx
   140054d1d:	d1 fe                	sar    $1,%esi
   140054d1f:	c1 fa 1f             	sar    $0x1f,%edx
   140054d22:	c1 fe 1f             	sar    $0x1f,%esi
   140054d25:	31 f2                	xor    %esi,%edx
   140054d27:	81 f2 80 b4 87 6a    	xor    $0x6a87b480,%edx
   140054d2d:	c1 fa 1f             	sar    $0x1f,%edx
   140054d30:	8d 72 01             	lea    0x1(%rdx),%esi
   140054d33:	0f af f2             	imul   %edx,%esi
   140054d36:	85 f6                	test   %esi,%esi
   140054d38:	75 09                	jne    0x140054d43
   140054d3a:	48 c1 e6 2a          	shl    $0x2a,%rsi
   140054d3e:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   140054d41:	eb 0f                	jmp    0x140054d52
   140054d43:	c1 fa 0d             	sar    $0xd,%edx
   140054d46:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140054d4d:	01 00 00 
   140054d50:	8b 16                	mov    (%rsi),%edx
   140054d52:	5e                   	pop    %rsi
   140054d53:	5a                   	pop    %rdx
   140054d54:	9d                   	popf
   140054d55:	8b 14 24             	mov    (%rsp),%edx
   140054d58:	9c                   	pushf
   140054d59:	41 50                	push   %r8
   140054d5b:	41 51                	push   %r9
   140054d5d:	49 b8 b8 f7 5b 31 b1 	movabs $0x74af43b1315bf7b8,%r8
   140054d64:	43 af 74 
   140054d67:	4d 89 c1             	mov    %r8,%r9
   140054d6a:	49 c1 f8 03          	sar    $0x3,%r8
   140054d6e:	49 c1 f8 11          	sar    $0x11,%r8
   140054d72:	49 c1 f9 02          	sar    $0x2,%r9
   140054d76:	49 c1 f9 03          	sar    $0x3,%r9
   140054d7a:	49 c1 f8 02          	sar    $0x2,%r8
   140054d7e:	49 c1 f9 11          	sar    $0x11,%r9
   140054d82:	49 c1 f9 02          	sar    $0x2,%r9
   140054d86:	49 c1 f9 11          	sar    $0x11,%r9
   140054d8a:	49 c1 f8 1f          	sar    $0x1f,%r8
   140054d8e:	49 c1 f9 05          	sar    $0x5,%r9
   140054d92:	49 c1 f8 1b          	sar    $0x1b,%r8
   140054d96:	49 d1 f8             	sar    $1,%r8
   140054d99:	49 c1 f9 03          	sar    $0x3,%r9
   140054d9d:	49 c1 f9 15          	sar    $0x15,%r9
   140054da1:	49 d1 f9             	sar    $1,%r9
   140054da4:	49 c1 f9 0b          	sar    $0xb,%r9
   140054da8:	49 c1 f9 04          	sar    $0x4,%r9
   140054dac:	49 c1 f8 04          	sar    $0x4,%r8
   140054db0:	49 c1 f9 1b          	sar    $0x1b,%r9
   140054db4:	49 c1 f9 04          	sar    $0x4,%r9
   140054db8:	49 c1 f9 02          	sar    $0x2,%r9
   140054dbc:	49 c1 f9 05          	sar    $0x5,%r9
   140054dc0:	49 c1 f8 07          	sar    $0x7,%r8
   140054dc4:	49 c1 f9 09          	sar    $0x9,%r9
   140054dc8:	49 c1 f8 03          	sar    $0x3,%r8
   140054dcc:	49 d1 f8             	sar    $1,%r8
   140054dcf:	49 c1 f9 03          	sar    $0x3,%r9
   140054dd3:	49 c1 f8 05          	sar    $0x5,%r8
   140054dd7:	49 c1 f8 03          	sar    $0x3,%r8
   140054ddb:	49 c1 f9 02          	sar    $0x2,%r9
   140054ddf:	49 c1 f9 05          	sar    $0x5,%r9
   140054de3:	49 c1 f8 09          	sar    $0x9,%r8
   140054de7:	49 c1 f9 03          	sar    $0x3,%r9
   140054deb:	49 c1 f9 07          	sar    $0x7,%r9
   140054def:	49 c1 f9 0d          	sar    $0xd,%r9
   140054df3:	49 c1 f9 15          	sar    $0x15,%r9
   140054df7:	49 c1 f9 02          	sar    $0x2,%r9
   140054dfb:	49 c1 f9 11          	sar    $0x11,%r9
   140054dff:	4d 31 c8             	xor    %r9,%r8
   140054e02:	49 b9 23 1e 3f 12 c5 	movabs $0x3941d4c5123f1e23,%r9
   140054e09:	d4 41 39 
   140054e0c:	4d 31 c8             	xor    %r9,%r8
   140054e0f:	49 c1 f8 3f          	sar    $0x3f,%r8
   140054e13:	4d 89 c1             	mov    %r8,%r9
   140054e16:	49 d1 f9             	sar    $1,%r9
   140054e19:	4d 31 c1             	xor    %r8,%r9
   140054e1c:	4d 85 c9             	test   %r9,%r9
   140054e1f:	75 0a                	jne    0x140054e2b
   140054e21:	49 c1 c9 20          	ror    $0x20,%r9
   140054e25:	4e 8b 04 0c          	mov    (%rsp,%r9,1),%r8
   140054e29:	eb 11                	jmp    0x140054e3c
   140054e2b:	49 c1 f8 11          	sar    $0x11,%r8
   140054e2f:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140054e36:	01 00 00 
   140054e39:	4d 8b 01             	mov    (%r9),%r8
   140054e3c:	41 59                	pop    %r9
   140054e3e:	41 58                	pop    %r8
   140054e40:	9d                   	popf
   140054e41:	44 8b 2c 24          	mov    (%rsp),%r13d
   140054e45:	9c                   	pushf
   140054e46:	41 52                	push   %r10
   140054e48:	41 53                	push   %r11
   140054e4a:	41 ba 95 8f 94 75    	mov    $0x75948f95,%r10d
   140054e50:	45 89 d3             	mov    %r10d,%r11d
   140054e53:	41 c1 fb 11          	sar    $0x11,%r11d
   140054e57:	41 d1 fb             	sar    $1,%r11d
   140054e5a:	41 c1 fa 04          	sar    $0x4,%r10d
   140054e5e:	41 c1 fb 08          	sar    $0x8,%r11d
   140054e62:	41 c1 fb 03          	sar    $0x3,%r11d
   140054e66:	41 c1 fb 07          	sar    $0x7,%r11d
   140054e6a:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140054e6e:	41 c1 fa 0f          	sar    $0xf,%r10d
   140054e72:	41 c1 fb 11          	sar    $0x11,%r11d
   140054e76:	41 c1 fa 03          	sar    $0x3,%r10d
   140054e7a:	41 c1 fa 09          	sar    $0x9,%r10d
   140054e7e:	41 c1 fa 03          	sar    $0x3,%r10d
   140054e82:	41 c1 fb 02          	sar    $0x2,%r11d
   140054e86:	41 c1 fb 08          	sar    $0x8,%r11d
   140054e8a:	41 c1 fa 02          	sar    $0x2,%r10d
   140054e8e:	41 d1 fb             	sar    $1,%r11d
   140054e91:	41 c1 fa 07          	sar    $0x7,%r10d
   140054e95:	41 c1 fb 09          	sar    $0x9,%r11d
   140054e99:	41 c1 fb 09          	sar    $0x9,%r11d
   140054e9d:	41 c1 fa 08          	sar    $0x8,%r10d
   140054ea1:	41 c1 fa 0f          	sar    $0xf,%r10d
   140054ea5:	41 c1 fa 05          	sar    $0x5,%r10d
   140054ea9:	41 c1 fa 0d          	sar    $0xd,%r10d
   140054ead:	41 c1 fa 07          	sar    $0x7,%r10d
   140054eb1:	41 c1 fb 0d          	sar    $0xd,%r11d
   140054eb5:	41 d1 fb             	sar    $1,%r11d
   140054eb8:	41 c1 fa 11          	sar    $0x11,%r10d
   140054ebc:	41 c1 fa 0b          	sar    $0xb,%r10d
   140054ec0:	41 c1 fb 11          	sar    $0x11,%r11d
   140054ec4:	41 d1 fa             	sar    $1,%r10d
   140054ec7:	41 c1 fb 03          	sar    $0x3,%r11d
   140054ecb:	45 31 da             	xor    %r11d,%r10d
   140054ece:	41 81 f2 d8 1b 98 30 	xor    $0x30981bd8,%r10d
   140054ed5:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140054ed9:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140054edd:	45 0f af da          	imul   %r10d,%r11d
   140054ee1:	45 85 db             	test   %r11d,%r11d
   140054ee4:	75 09                	jne    0x140054eef
   140054ee6:	49 0f cb             	bswap  %r11
   140054ee9:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140054eed:	eb 11                	jmp    0x140054f00
   140054eef:	41 c1 fa 0d          	sar    $0xd,%r10d
   140054ef3:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140054efa:	01 00 00 
   140054efd:	45 8b 13             	mov    (%r11),%r10d
   140054f00:	41 5b                	pop    %r11
   140054f02:	41 5a                	pop    %r10
   140054f04:	9d                   	popf
   140054f05:	41 f7 d5             	not    %r13d
   140054f08:	9c                   	pushf
   140054f09:	41 51                	push   %r9
   140054f0b:	41 52                	push   %r10
   140054f0d:	41 b9 84 49 c6 4d    	mov    $0x4dc64984,%r9d
   140054f13:	45 89 ca             	mov    %r9d,%r10d
   140054f16:	41 c1 fa 05          	sar    $0x5,%r10d
   140054f1a:	41 c1 fa 07          	sar    $0x7,%r10d
   140054f1e:	41 c1 fa 02          	sar    $0x2,%r10d
   140054f22:	41 c1 f9 0f          	sar    $0xf,%r9d
   140054f26:	41 c1 f9 15          	sar    $0x15,%r9d
   140054f2a:	41 c1 fa 07          	sar    $0x7,%r10d
   140054f2e:	41 c1 fa 07          	sar    $0x7,%r10d
   140054f32:	41 c1 fa 0d          	sar    $0xd,%r10d
   140054f36:	41 c1 f9 05          	sar    $0x5,%r9d
   140054f3a:	41 c1 fa 05          	sar    $0x5,%r10d
   140054f3e:	41 d1 fa             	sar    $1,%r10d
   140054f41:	41 c1 f9 0f          	sar    $0xf,%r9d
   140054f45:	41 c1 fa 02          	sar    $0x2,%r10d
   140054f49:	41 c1 fa 07          	sar    $0x7,%r10d
   140054f4d:	41 d1 f9             	sar    $1,%r9d
   140054f50:	41 d1 f9             	sar    $1,%r9d
   140054f53:	41 c1 f9 0d          	sar    $0xd,%r9d
   140054f57:	41 c1 fa 05          	sar    $0x5,%r10d
   140054f5b:	41 c1 f9 11          	sar    $0x11,%r9d
   140054f5f:	41 d1 f9             	sar    $1,%r9d
   140054f62:	41 c1 fa 07          	sar    $0x7,%r10d
   140054f66:	41 c1 fa 15          	sar    $0x15,%r10d
   140054f6a:	41 c1 f9 05          	sar    $0x5,%r9d
   140054f6e:	41 c1 fa 0b          	sar    $0xb,%r10d
   140054f72:	41 c1 f9 07          	sar    $0x7,%r9d
   140054f76:	41 c1 fa 0d          	sar    $0xd,%r10d
   140054f7a:	41 c1 fa 11          	sar    $0x11,%r10d
   140054f7e:	41 c1 f9 0b          	sar    $0xb,%r9d
   140054f82:	41 c1 fa 05          	sar    $0x5,%r10d
   140054f86:	41 c1 f9 15          	sar    $0x15,%r9d
   140054f8a:	41 c1 fa 11          	sar    $0x11,%r10d
   140054f8e:	41 c1 f9 07          	sar    $0x7,%r9d
   140054f92:	45 31 d1             	xor    %r10d,%r9d
   140054f95:	41 81 f1 5d 33 b6 3a 	xor    $0x3ab6335d,%r9d
   140054f9c:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140054fa0:	45 89 ca             	mov    %r9d,%r10d
   140054fa3:	41 ff c2             	inc    %r10d
   140054fa6:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   140054faa:	45 85 d2             	test   %r10d,%r10d
   140054fad:	75 0a                	jne    0x140054fb9
   140054faf:	49 c1 e2 28          	shl    $0x28,%r10
   140054fb3:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   140054fb7:	eb 11                	jmp    0x140054fca
   140054fb9:	41 c1 f9 0d          	sar    $0xd,%r9d
   140054fbd:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140054fc4:	01 00 00 
   140054fc7:	45 8b 0a             	mov    (%r10),%r9d
   140054fca:	41 5a                	pop    %r10
   140054fcc:	41 59                	pop    %r9
   140054fce:	9d                   	popf
   140054fcf:	44 0f af ea          	imul   %edx,%r13d
   140054fd3:	9c                   	pushf
   140054fd4:	50                   	push   %rax
   140054fd5:	51                   	push   %rcx
   140054fd6:	b8 7c e9 46 31       	mov    $0x3146e97c,%eax
   140054fdb:	89 c1                	mov    %eax,%ecx
   140054fdd:	c1 f9 09             	sar    $0x9,%ecx
   140054fe0:	c1 f9 11             	sar    $0x11,%ecx
   140054fe3:	c1 f9 03             	sar    $0x3,%ecx
   140054fe6:	c1 f8 0d             	sar    $0xd,%eax
   140054fe9:	c1 f8 02             	sar    $0x2,%eax
   140054fec:	c1 f8 04             	sar    $0x4,%eax
   140054fef:	c1 f8 1f             	sar    $0x1f,%eax
   140054ff2:	c1 f9 11             	sar    $0x11,%ecx
   140054ff5:	c1 f9 0f             	sar    $0xf,%ecx
   140054ff8:	c1 f8 02             	sar    $0x2,%eax
   140054ffb:	c1 f9 08             	sar    $0x8,%ecx
   140054ffe:	c1 f9 09             	sar    $0x9,%ecx
   140055001:	c1 f8 1f             	sar    $0x1f,%eax
   140055004:	c1 f9 0b             	sar    $0xb,%ecx
   140055007:	d1 f8                	sar    $1,%eax
   140055009:	c1 f8 1f             	sar    $0x1f,%eax
   14005500c:	c1 f8 03             	sar    $0x3,%eax
   14005500f:	c1 f8 07             	sar    $0x7,%eax
   140055012:	c1 f8 09             	sar    $0x9,%eax
   140055015:	c1 f8 11             	sar    $0x11,%eax
   140055018:	c1 f9 02             	sar    $0x2,%ecx
   14005501b:	d1 f9                	sar    $1,%ecx
   14005501d:	c1 f9 09             	sar    $0x9,%ecx
   140055020:	c1 f9 0f             	sar    $0xf,%ecx
   140055023:	d1 f8                	sar    $1,%eax
   140055025:	c1 f9 0b             	sar    $0xb,%ecx
   140055028:	c1 f8 05             	sar    $0x5,%eax
   14005502b:	c1 f9 07             	sar    $0x7,%ecx
   14005502e:	c1 f8 1f             	sar    $0x1f,%eax
   140055031:	c1 f9 04             	sar    $0x4,%ecx
   140055034:	c1 f9 05             	sar    $0x5,%ecx
   140055037:	c1 f9 0f             	sar    $0xf,%ecx
   14005503a:	c1 f8 05             	sar    $0x5,%eax
   14005503d:	d1 f9                	sar    $1,%ecx
   14005503f:	c1 f8 07             	sar    $0x7,%eax
   140055042:	c1 f8 15             	sar    $0x15,%eax
   140055045:	c1 f8 08             	sar    $0x8,%eax
   140055048:	31 c8                	xor    %ecx,%eax
   14005504a:	35 bc 9b 45 27       	xor    $0x27459bbc,%eax
   14005504f:	c1 f8 1f             	sar    $0x1f,%eax
   140055052:	8d 48 01             	lea    0x1(%rax),%ecx
   140055055:	0f af c8             	imul   %eax,%ecx
   140055058:	85 c9                	test   %ecx,%ecx
   14005505a:	75 09                	jne    0x140055065
   14005505c:	48 c1 c9 20          	ror    $0x20,%rcx
   140055060:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   140055063:	eb 0f                	jmp    0x140055074
   140055065:	c1 f8 0d             	sar    $0xd,%eax
   140055068:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   14005506f:	01 00 00 
   140055072:	8b 01                	mov    (%rcx),%eax
   140055074:	59                   	pop    %rcx
   140055075:	58                   	pop    %rax
   140055076:	9d                   	popf
   140055077:	44 89 fa             	mov    %r15d,%edx
   14005507a:	9c                   	pushf
   14005507b:	41 51                	push   %r9
   14005507d:	41 52                	push   %r10
   14005507f:	49 b9 05 90 9e 7e fe 	movabs $0x2e8aa2fe7e9e9005,%r9
   140055086:	a2 8a 2e 
   140055089:	4d 89 ca             	mov    %r9,%r10
   14005508c:	49 c1 f9 1b          	sar    $0x1b,%r9
   140055090:	49 c1 f9 15          	sar    $0x15,%r9
   140055094:	49 c1 fa 15          	sar    $0x15,%r10
   140055098:	49 c1 f9 02          	sar    $0x2,%r9
   14005509c:	49 c1 fa 0d          	sar    $0xd,%r10
   1400550a0:	49 d1 f9             	sar    $1,%r9
   1400550a3:	49 c1 fa 04          	sar    $0x4,%r10
   1400550a7:	49 c1 fa 15          	sar    $0x15,%r10
   1400550ab:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400550af:	49 c1 fa 0b          	sar    $0xb,%r10
   1400550b3:	49 c1 fa 07          	sar    $0x7,%r10
   1400550b7:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400550bb:	49 c1 f9 03          	sar    $0x3,%r9
   1400550bf:	49 c1 f9 07          	sar    $0x7,%r9
   1400550c3:	49 d1 fa             	sar    $1,%r10
   1400550c6:	49 c1 f9 03          	sar    $0x3,%r9
   1400550ca:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400550ce:	49 c1 fa 0d          	sar    $0xd,%r10
   1400550d2:	49 c1 f9 03          	sar    $0x3,%r9
   1400550d6:	49 c1 fa 07          	sar    $0x7,%r10
   1400550da:	49 c1 f9 09          	sar    $0x9,%r9
   1400550de:	49 c1 fa 04          	sar    $0x4,%r10
   1400550e2:	49 c1 fa 09          	sar    $0x9,%r10
   1400550e6:	49 c1 fa 0d          	sar    $0xd,%r10
   1400550ea:	49 c1 fa 0b          	sar    $0xb,%r10
   1400550ee:	49 c1 fa 02          	sar    $0x2,%r10
   1400550f2:	49 c1 fa 1b          	sar    $0x1b,%r10
   1400550f6:	49 c1 fa 09          	sar    $0x9,%r10
   1400550fa:	4d 31 d1             	xor    %r10,%r9
   1400550fd:	49 ba aa 17 1e 40 84 	movabs $0x488cf484401e17aa,%r10
   140055104:	f4 8c 48 
   140055107:	4d 31 d1             	xor    %r10,%r9
   14005510a:	49 c1 f9 3f          	sar    $0x3f,%r9
   14005510e:	4d 89 ca             	mov    %r9,%r10
   140055111:	49 d1 fa             	sar    $1,%r10
   140055114:	4d 31 ca             	xor    %r9,%r10
   140055117:	4d 85 d2             	test   %r10,%r10
   14005511a:	75 09                	jne    0x140055125
   14005511c:	49 0f ca             	bswap  %r10
   14005511f:	4e 8b 0c d4          	mov    (%rsp,%r10,8),%r9
   140055123:	eb 11                	jmp    0x140055136
   140055125:	49 c1 f9 11          	sar    $0x11,%r9
   140055129:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140055130:	01 00 00 
   140055133:	4d 8b 0a             	mov    (%r10),%r9
   140055136:	41 5a                	pop    %r10
   140055138:	41 59                	pop    %r9
   14005513a:	9d                   	popf
   14005513b:	81 f2 ef be ad de    	xor    $0xdeadbeef,%edx
   140055141:	41 f6 c5 01          	test   $0x1,%r13b
   140055145:	44 0f 45 fa          	cmovne %edx,%r15d
   140055149:	9c                   	pushf
   14005514a:	57                   	push   %rdi
   14005514b:	53                   	push   %rbx
   14005514c:	bf 1c f1 d2 71       	mov    $0x71d2f11c,%edi
   140055151:	89 fb                	mov    %edi,%ebx
   140055153:	c1 fb 1f             	sar    $0x1f,%ebx
   140055156:	c1 fb 04             	sar    $0x4,%ebx
   140055159:	c1 ff 0b             	sar    $0xb,%edi
   14005515c:	c1 ff 07             	sar    $0x7,%edi
   14005515f:	c1 ff 1f             	sar    $0x1f,%edi
   140055162:	c1 ff 04             	sar    $0x4,%edi
   140055165:	c1 ff 04             	sar    $0x4,%edi
   140055168:	c1 ff 11             	sar    $0x11,%edi
   14005516b:	c1 fb 15             	sar    $0x15,%ebx
   14005516e:	c1 fb 0f             	sar    $0xf,%ebx
   140055171:	c1 fb 15             	sar    $0x15,%ebx
   140055174:	c1 fb 0d             	sar    $0xd,%ebx
   140055177:	c1 ff 1f             	sar    $0x1f,%edi
   14005517a:	c1 fb 03             	sar    $0x3,%ebx
   14005517d:	c1 ff 05             	sar    $0x5,%edi
   140055180:	c1 ff 0d             	sar    $0xd,%edi
   140055183:	c1 ff 08             	sar    $0x8,%edi
   140055186:	c1 fb 07             	sar    $0x7,%ebx
   140055189:	c1 fb 0d             	sar    $0xd,%ebx
   14005518c:	c1 fb 03             	sar    $0x3,%ebx
   14005518f:	d1 ff                	sar    $1,%edi
   140055191:	c1 fb 0d             	sar    $0xd,%ebx
   140055194:	c1 ff 04             	sar    $0x4,%edi
   140055197:	c1 fb 08             	sar    $0x8,%ebx
   14005519a:	31 df                	xor    %ebx,%edi
   14005519c:	81 f7 df 5b 2a 19    	xor    $0x192a5bdf,%edi
   1400551a2:	c1 ff 1f             	sar    $0x1f,%edi
   1400551a5:	89 fb                	mov    %edi,%ebx
   1400551a7:	ff c3                	inc    %ebx
   1400551a9:	83 e3 fe             	and    $0xfffffffe,%ebx
   1400551ac:	85 db                	test   %ebx,%ebx
   1400551ae:	75 09                	jne    0x1400551b9
   1400551b0:	48 c1 e3 2a          	shl    $0x2a,%rbx
   1400551b4:	8b 3c 5c             	mov    (%rsp,%rbx,2),%edi
   1400551b7:	eb 0f                	jmp    0x1400551c8
   1400551b9:	c1 ff 0d             	sar    $0xd,%edi
   1400551bc:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400551c3:	01 00 00 
   1400551c6:	8b 3b                	mov    (%rbx),%edi
   1400551c8:	5b                   	pop    %rbx
   1400551c9:	5f                   	pop    %rdi
   1400551ca:	9d                   	popf
   1400551cb:	89 c2                	mov    %eax,%edx
   1400551cd:	9c                   	pushf
   1400551ce:	41 51                	push   %r9
   1400551d0:	41 52                	push   %r10
   1400551d2:	41 b9 47 90 4f 6e    	mov    $0x6e4f9047,%r9d
   1400551d8:	45 89 ca             	mov    %r9d,%r10d
   1400551db:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400551df:	41 c1 f9 09          	sar    $0x9,%r9d
   1400551e3:	41 c1 f9 02          	sar    $0x2,%r9d
   1400551e7:	41 c1 fa 11          	sar    $0x11,%r10d
   1400551eb:	41 c1 f9 0f          	sar    $0xf,%r9d
   1400551ef:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400551f3:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400551f7:	41 c1 fa 03          	sar    $0x3,%r10d
   1400551fb:	41 c1 f9 05          	sar    $0x5,%r9d
   1400551ff:	41 c1 f9 08          	sar    $0x8,%r9d
   140055203:	41 c1 f9 11          	sar    $0x11,%r9d
   140055207:	41 c1 f9 03          	sar    $0x3,%r9d
   14005520b:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005520f:	41 c1 f9 0f          	sar    $0xf,%r9d
   140055213:	41 c1 fa 05          	sar    $0x5,%r10d
   140055217:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005521b:	41 c1 fa 07          	sar    $0x7,%r10d
   14005521f:	41 c1 f9 04          	sar    $0x4,%r9d
   140055223:	41 c1 f9 05          	sar    $0x5,%r9d
   140055227:	41 c1 f9 03          	sar    $0x3,%r9d
   14005522b:	41 c1 fa 11          	sar    $0x11,%r10d
   14005522f:	41 c1 f9 11          	sar    $0x11,%r9d
   140055233:	41 c1 f9 02          	sar    $0x2,%r9d
   140055237:	41 c1 fa 15          	sar    $0x15,%r10d
   14005523b:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005523f:	41 c1 f9 09          	sar    $0x9,%r9d
   140055243:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055247:	41 c1 f9 03          	sar    $0x3,%r9d
   14005524b:	41 c1 f9 04          	sar    $0x4,%r9d
   14005524f:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055253:	41 c1 f9 05          	sar    $0x5,%r9d
   140055257:	45 31 d1             	xor    %r10d,%r9d
   14005525a:	41 81 f1 7a 8a 9c 49 	xor    $0x499c8a7a,%r9d
   140055261:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140055265:	45 8d 51 01          	lea    0x1(%r9),%r10d
   140055269:	45 0f af d1          	imul   %r9d,%r10d
   14005526d:	45 85 d2             	test   %r10d,%r10d
   140055270:	75 09                	jne    0x14005527b
   140055272:	49 0f ca             	bswap  %r10
   140055275:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140055279:	eb 11                	jmp    0x14005528c
   14005527b:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005527f:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140055286:	01 00 00 
   140055289:	45 8b 0a             	mov    (%r10),%r9d
   14005528c:	41 5a                	pop    %r10
   14005528e:	41 59                	pop    %r9
   140055290:	9d                   	popf
   140055291:	83 f2 01             	xor    $0x1,%edx
   140055294:	9c                   	pushf
   140055295:	57                   	push   %rdi
   140055296:	53                   	push   %rbx
   140055297:	bf 5c 2e a6 58       	mov    $0x58a62e5c,%edi
   14005529c:	89 fb                	mov    %edi,%ebx
   14005529e:	c1 ff 0b             	sar    $0xb,%edi
   1400552a1:	c1 ff 03             	sar    $0x3,%edi
   1400552a4:	c1 fb 03             	sar    $0x3,%ebx
   1400552a7:	c1 fb 0b             	sar    $0xb,%ebx
   1400552aa:	c1 ff 15             	sar    $0x15,%edi
   1400552ad:	c1 fb 0f             	sar    $0xf,%ebx
   1400552b0:	c1 ff 0f             	sar    $0xf,%edi
   1400552b3:	c1 ff 09             	sar    $0x9,%edi
   1400552b6:	c1 fb 07             	sar    $0x7,%ebx
   1400552b9:	c1 ff 03             	sar    $0x3,%edi
   1400552bc:	c1 ff 08             	sar    $0x8,%edi
   1400552bf:	c1 fb 0b             	sar    $0xb,%ebx
   1400552c2:	c1 ff 0b             	sar    $0xb,%edi
   1400552c5:	c1 fb 15             	sar    $0x15,%ebx
   1400552c8:	c1 fb 0b             	sar    $0xb,%ebx
   1400552cb:	c1 ff 07             	sar    $0x7,%edi
   1400552ce:	d1 fb                	sar    $1,%ebx
   1400552d0:	c1 ff 09             	sar    $0x9,%edi
   1400552d3:	c1 ff 03             	sar    $0x3,%edi
   1400552d6:	d1 fb                	sar    $1,%ebx
   1400552d8:	c1 fb 09             	sar    $0x9,%ebx
   1400552db:	c1 ff 1f             	sar    $0x1f,%edi
   1400552de:	c1 ff 02             	sar    $0x2,%edi
   1400552e1:	c1 ff 08             	sar    $0x8,%edi
   1400552e4:	31 df                	xor    %ebx,%edi
   1400552e6:	81 f7 0d 1c cb 66    	xor    $0x66cb1c0d,%edi
   1400552ec:	c1 ff 1f             	sar    $0x1f,%edi
   1400552ef:	89 fb                	mov    %edi,%ebx
   1400552f1:	d1 fb                	sar    $1,%ebx
   1400552f3:	31 fb                	xor    %edi,%ebx
   1400552f5:	85 db                	test   %ebx,%ebx
   1400552f7:	75 09                	jne    0x140055302
   1400552f9:	48 c1 e3 28          	shl    $0x28,%rbx
   1400552fd:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   140055300:	eb 0f                	jmp    0x140055311
   140055302:	c1 ff 0d             	sar    $0xd,%edi
   140055305:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   14005530c:	01 00 00 
   14005530f:	8b 3b                	mov    (%rbx),%edi
   140055311:	5b                   	pop    %rbx
   140055312:	5f                   	pop    %rdi
   140055313:	9d                   	popf
   140055314:	83 e0 01             	and    $0x1,%eax
   140055317:	9c                   	pushf
   140055318:	41 50                	push   %r8
   14005531a:	41 51                	push   %r9
   14005531c:	41 b8 6b f5 24 3f    	mov    $0x3f24f56b,%r8d
   140055322:	45 89 c1             	mov    %r8d,%r9d
   140055325:	41 c1 f8 08          	sar    $0x8,%r8d
   140055329:	41 c1 f8 1f          	sar    $0x1f,%r8d
   14005532d:	41 c1 f9 08          	sar    $0x8,%r9d
   140055331:	41 d1 f8             	sar    $1,%r8d
   140055334:	41 c1 f9 15          	sar    $0x15,%r9d
   140055338:	41 c1 f9 0f          	sar    $0xf,%r9d
   14005533c:	41 c1 f8 15          	sar    $0x15,%r8d
   140055340:	41 c1 f9 08          	sar    $0x8,%r9d
   140055344:	41 c1 f9 0d          	sar    $0xd,%r9d
   140055348:	41 c1 f8 07          	sar    $0x7,%r8d
   14005534c:	41 c1 f9 0b          	sar    $0xb,%r9d
   140055350:	41 c1 f9 15          	sar    $0x15,%r9d
   140055354:	41 c1 f9 04          	sar    $0x4,%r9d
   140055358:	41 c1 f8 11          	sar    $0x11,%r8d
   14005535c:	41 c1 f9 15          	sar    $0x15,%r9d
   140055360:	41 c1 f8 07          	sar    $0x7,%r8d
   140055364:	41 c1 f8 08          	sar    $0x8,%r8d
   140055368:	41 c1 f9 08          	sar    $0x8,%r9d
   14005536c:	41 c1 f8 11          	sar    $0x11,%r8d
   140055370:	41 c1 f9 03          	sar    $0x3,%r9d
   140055374:	41 c1 f8 04          	sar    $0x4,%r8d
   140055378:	41 c1 f8 02          	sar    $0x2,%r8d
   14005537c:	41 c1 f9 04          	sar    $0x4,%r9d
   140055380:	41 c1 f9 08          	sar    $0x8,%r9d
   140055384:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140055388:	41 c1 f8 03          	sar    $0x3,%r8d
   14005538c:	41 c1 f9 05          	sar    $0x5,%r9d
   140055390:	41 c1 f9 08          	sar    $0x8,%r9d
   140055394:	41 c1 f8 11          	sar    $0x11,%r8d
   140055398:	45 31 c8             	xor    %r9d,%r8d
   14005539b:	41 81 f0 22 f5 1b 19 	xor    $0x191bf522,%r8d
   1400553a2:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400553a6:	45 8d 48 01          	lea    0x1(%r8),%r9d
   1400553aa:	45 0f af c8          	imul   %r8d,%r9d
   1400553ae:	45 85 c9             	test   %r9d,%r9d
   1400553b1:	75 0a                	jne    0x1400553bd
   1400553b3:	49 c1 e1 26          	shl    $0x26,%r9
   1400553b7:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   1400553bb:	eb 11                	jmp    0x1400553ce
   1400553bd:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400553c1:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400553c8:	01 00 00 
   1400553cb:	45 8b 01             	mov    (%r9),%r8d
   1400553ce:	41 59                	pop    %r9
   1400553d0:	41 58                	pop    %r8
   1400553d2:	9d                   	popf
   1400553d3:	44 8d 2c 42          	lea    (%rdx,%rax,2),%r13d
   1400553d7:	41 83 fd 1d          	cmp    $0x1d,%r13d
   1400553db:	b8 e5 50 00 00       	mov    $0x50e5,%eax
   1400553e0:	0f 4c c6             	cmovl  %esi,%eax
   1400553e3:	9c                   	pushf
   1400553e4:	50                   	push   %rax
   1400553e5:	52                   	push   %rdx
   1400553e6:	48 b8 f5 f1 8d a2 91 	movabs $0x7c8b7c91a28df1f5,%rax
   1400553ed:	7c 8b 7c 
   1400553f0:	48 89 c2             	mov    %rax,%rdx
   1400553f3:	48 c1 f8 11          	sar    $0x11,%rax
   1400553f7:	48 c1 fa 0b          	sar    $0xb,%rdx
   1400553fb:	48 c1 f8 04          	sar    $0x4,%rax
   1400553ff:	48 c1 fa 11          	sar    $0x11,%rdx
   140055403:	48 c1 f8 02          	sar    $0x2,%rax
   140055407:	48 c1 fa 07          	sar    $0x7,%rdx
   14005540b:	48 c1 f8 04          	sar    $0x4,%rax
   14005540f:	48 c1 fa 07          	sar    $0x7,%rdx
   140055413:	48 c1 fa 07          	sar    $0x7,%rdx
   140055417:	48 c1 fa 0b          	sar    $0xb,%rdx
   14005541b:	48 c1 f8 0d          	sar    $0xd,%rax
   14005541f:	48 c1 fa 04          	sar    $0x4,%rdx
   140055423:	48 c1 fa 05          	sar    $0x5,%rdx
   140055427:	48 c1 fa 09          	sar    $0x9,%rdx
   14005542b:	48 c1 fa 0b          	sar    $0xb,%rdx
   14005542f:	48 c1 f8 1b          	sar    $0x1b,%rax
   140055433:	48 c1 f8 11          	sar    $0x11,%rax
   140055437:	48 c1 fa 11          	sar    $0x11,%rdx
   14005543b:	48 d1 fa             	sar    $1,%rdx
   14005543e:	48 c1 f8 1f          	sar    $0x1f,%rax
   140055442:	48 c1 fa 02          	sar    $0x2,%rdx
   140055446:	48 c1 f8 0d          	sar    $0xd,%rax
   14005544a:	48 d1 f8             	sar    $1,%rax
   14005544d:	48 c1 fa 0b          	sar    $0xb,%rdx
   140055451:	48 c1 fa 05          	sar    $0x5,%rdx
   140055455:	48 d1 f8             	sar    $1,%rax
   140055458:	48 c1 f8 03          	sar    $0x3,%rax
   14005545c:	48 c1 fa 05          	sar    $0x5,%rdx
   140055460:	48 c1 f8 1b          	sar    $0x1b,%rax
   140055464:	48 c1 f8 05          	sar    $0x5,%rax
   140055468:	48 c1 fa 1f          	sar    $0x1f,%rdx
   14005546c:	48 c1 f8 11          	sar    $0x11,%rax
   140055470:	48 c1 f8 07          	sar    $0x7,%rax
   140055474:	48 c1 f8 0d          	sar    $0xd,%rax
   140055478:	48 c1 f8 07          	sar    $0x7,%rax
   14005547c:	48 31 d0             	xor    %rdx,%rax
   14005547f:	48 ba 07 3e fa bf 48 	movabs $0x2a242148bffa3e07,%rdx
   140055486:	21 24 2a 
   140055489:	48 31 d0             	xor    %rdx,%rax
   14005548c:	48 c1 f8 3f          	sar    $0x3f,%rax
   140055490:	48 89 c2             	mov    %rax,%rdx
   140055493:	48 d1 fa             	sar    $1,%rdx
   140055496:	48 31 c2             	xor    %rax,%rdx
   140055499:	48 85 d2             	test   %rdx,%rdx
   14005549c:	75 0a                	jne    0x1400554a8
   14005549e:	48 c1 e2 26          	shl    $0x26,%rdx
   1400554a2:	48 8b 04 d4          	mov    (%rsp,%rdx,8),%rax
   1400554a6:	eb 11                	jmp    0x1400554b9
   1400554a8:	48 c1 f8 11          	sar    $0x11,%rax
   1400554ac:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400554b3:	01 00 00 
   1400554b6:	48 8b 02             	mov    (%rdx),%rax
   1400554b9:	5a                   	pop    %rdx
   1400554ba:	58                   	pop    %rax
   1400554bb:	9d                   	popf
   1400554bc:	e9 df cf ff ff       	jmp    0x1400524a0
   1400554c1:	45 85 f6             	test   %r14d,%r14d
   1400554c4:	0f 8e ef 0e 00 00    	jle    0x1400563b9
   1400554ca:	9c                   	pushf
   1400554cb:	41 52                	push   %r10
   1400554cd:	41 53                	push   %r11
   1400554cf:	41 ba a9 c3 67 29    	mov    $0x2967c3a9,%r10d
   1400554d5:	45 89 d3             	mov    %r10d,%r11d
   1400554d8:	41 c1 fb 0b          	sar    $0xb,%r11d
   1400554dc:	41 c1 fb 0d          	sar    $0xd,%r11d
   1400554e0:	41 c1 fa 09          	sar    $0x9,%r10d
   1400554e4:	41 c1 fa 05          	sar    $0x5,%r10d
   1400554e8:	41 c1 fb 04          	sar    $0x4,%r11d
   1400554ec:	41 c1 fb 07          	sar    $0x7,%r11d
   1400554f0:	41 c1 fb 09          	sar    $0x9,%r11d
   1400554f4:	41 d1 fb             	sar    $1,%r11d
   1400554f7:	41 c1 fb 0d          	sar    $0xd,%r11d
   1400554fb:	41 d1 fb             	sar    $1,%r11d
   1400554fe:	41 c1 fb 15          	sar    $0x15,%r11d
   140055502:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055506:	41 c1 fb 0b          	sar    $0xb,%r11d
   14005550a:	41 c1 fb 0d          	sar    $0xd,%r11d
   14005550e:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055512:	41 c1 fa 03          	sar    $0x3,%r10d
   140055516:	41 c1 fb 02          	sar    $0x2,%r11d
   14005551a:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005551e:	41 c1 fa 11          	sar    $0x11,%r10d
   140055522:	41 c1 fa 11          	sar    $0x11,%r10d
   140055526:	41 c1 fb 08          	sar    $0x8,%r11d
   14005552a:	41 c1 fb 09          	sar    $0x9,%r11d
   14005552e:	41 c1 fb 09          	sar    $0x9,%r11d
   140055532:	41 d1 fa             	sar    $1,%r10d
   140055535:	41 c1 fb 15          	sar    $0x15,%r11d
   140055539:	41 c1 fa 04          	sar    $0x4,%r10d
   14005553d:	41 c1 fb 11          	sar    $0x11,%r11d
   140055541:	41 c1 fa 15          	sar    $0x15,%r10d
   140055545:	41 c1 fb 09          	sar    $0x9,%r11d
   140055549:	41 c1 fb 07          	sar    $0x7,%r11d
   14005554d:	41 c1 fa 09          	sar    $0x9,%r10d
   140055551:	41 c1 fa 03          	sar    $0x3,%r10d
   140055555:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055559:	41 c1 fa 0f          	sar    $0xf,%r10d
   14005555d:	41 c1 fa 11          	sar    $0x11,%r10d
   140055561:	45 31 da             	xor    %r11d,%r10d
   140055564:	41 81 f2 c0 0b c7 78 	xor    $0x78c70bc0,%r10d
   14005556b:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005556f:	45 89 d3             	mov    %r10d,%r11d
   140055572:	41 d1 fb             	sar    $1,%r11d
   140055575:	45 31 d3             	xor    %r10d,%r11d
   140055578:	45 85 db             	test   %r11d,%r11d
   14005557b:	75 0a                	jne    0x140055587
   14005557d:	49 c1 e3 2a          	shl    $0x2a,%r11
   140055581:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140055585:	eb 11                	jmp    0x140055598
   140055587:	41 c1 fa 0d          	sar    $0xd,%r10d
   14005558b:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140055592:	01 00 00 
   140055595:	45 8b 13             	mov    (%r11),%r10d
   140055598:	41 5b                	pop    %r11
   14005559a:	41 5a                	pop    %r10
   14005559c:	9d                   	popf
   14005559d:	44 89 d0             	mov    %r10d,%eax
   1400555a0:	9c                   	pushf
   1400555a1:	41 52                	push   %r10
   1400555a3:	41 53                	push   %r11
   1400555a5:	49 ba f2 58 06 08 48 	movabs $0x5af14448080658f2,%r10
   1400555ac:	44 f1 5a 
   1400555af:	4d 89 d3             	mov    %r10,%r11
   1400555b2:	49 c1 fa 0d          	sar    $0xd,%r10
   1400555b6:	49 c1 fb 1b          	sar    $0x1b,%r11
   1400555ba:	49 c1 fa 0d          	sar    $0xd,%r10
   1400555be:	49 c1 fa 0d          	sar    $0xd,%r10
   1400555c2:	49 c1 fb 0b          	sar    $0xb,%r11
   1400555c6:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400555ca:	49 c1 fa 0b          	sar    $0xb,%r10
   1400555ce:	49 d1 fb             	sar    $1,%r11
   1400555d1:	49 c1 fa 11          	sar    $0x11,%r10
   1400555d5:	49 c1 fa 02          	sar    $0x2,%r10
   1400555d9:	49 c1 fb 02          	sar    $0x2,%r11
   1400555dd:	49 c1 fa 1b          	sar    $0x1b,%r10
   1400555e1:	49 c1 fb 02          	sar    $0x2,%r11
   1400555e5:	49 c1 fb 0b          	sar    $0xb,%r11
   1400555e9:	49 c1 fa 04          	sar    $0x4,%r10
   1400555ed:	49 c1 fa 04          	sar    $0x4,%r10
   1400555f1:	49 c1 fb 07          	sar    $0x7,%r11
   1400555f5:	49 c1 fb 1b          	sar    $0x1b,%r11
   1400555f9:	49 d1 fb             	sar    $1,%r11
   1400555fc:	49 c1 fb 07          	sar    $0x7,%r11
   140055600:	49 c1 fa 02          	sar    $0x2,%r10
   140055604:	49 c1 fa 07          	sar    $0x7,%r10
   140055608:	49 c1 fa 09          	sar    $0x9,%r10
   14005560c:	49 c1 fb 0d          	sar    $0xd,%r11
   140055610:	49 c1 fb 09          	sar    $0x9,%r11
   140055614:	49 c1 fb 09          	sar    $0x9,%r11
   140055618:	49 c1 fb 1b          	sar    $0x1b,%r11
   14005561c:	49 c1 fa 15          	sar    $0x15,%r10
   140055620:	49 c1 fa 07          	sar    $0x7,%r10
   140055624:	49 c1 fa 0b          	sar    $0xb,%r10
   140055628:	49 c1 fb 0b          	sar    $0xb,%r11
   14005562c:	49 c1 fa 0d          	sar    $0xd,%r10
   140055630:	49 c1 fb 09          	sar    $0x9,%r11
   140055634:	49 c1 fa 11          	sar    $0x11,%r10
   140055638:	49 c1 fa 0b          	sar    $0xb,%r10
   14005563c:	49 c1 fa 1b          	sar    $0x1b,%r10
   140055640:	49 c1 fa 03          	sar    $0x3,%r10
   140055644:	4d 31 da             	xor    %r11,%r10
   140055647:	49 bb 9e 52 51 d3 35 	movabs $0x14635a35d351529e,%r11
   14005564e:	5a 63 14 
   140055651:	4d 31 da             	xor    %r11,%r10
   140055654:	49 c1 fa 3f          	sar    $0x3f,%r10
   140055658:	4d 89 d3             	mov    %r10,%r11
   14005565b:	49 ff c3             	inc    %r11
   14005565e:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
   140055662:	4d 85 db             	test   %r11,%r11
   140055665:	75 0a                	jne    0x140055671
   140055667:	49 c1 e3 2a          	shl    $0x2a,%r11
   14005566b:	4e 8b 14 dc          	mov    (%rsp,%r11,8),%r10
   14005566f:	eb 11                	jmp    0x140055682
   140055671:	49 c1 fa 11          	sar    $0x11,%r10
   140055675:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   14005567c:	01 00 00 
   14005567f:	4d 8b 13             	mov    (%r11),%r10
   140055682:	41 5b                	pop    %r11
   140055684:	41 5a                	pop    %r10
   140055686:	9d                   	popf
   140055687:	99                   	cltd
   140055688:	9c                   	pushf
   140055689:	57                   	push   %rdi
   14005568a:	53                   	push   %rbx
   14005568b:	48 bf dd 43 6d 4b 22 	movabs $0x3522e8224b6d43dd,%rdi
   140055692:	e8 22 35 
   140055695:	48 89 fb             	mov    %rdi,%rbx
   140055698:	48 c1 ff 1b          	sar    $0x1b,%rdi
   14005569c:	48 c1 ff 15          	sar    $0x15,%rdi
   1400556a0:	48 c1 ff 11          	sar    $0x11,%rdi
   1400556a4:	48 c1 ff 0b          	sar    $0xb,%rdi
   1400556a8:	48 c1 ff 03          	sar    $0x3,%rdi
   1400556ac:	48 c1 fb 03          	sar    $0x3,%rbx
   1400556b0:	48 d1 ff             	sar    $1,%rdi
   1400556b3:	48 c1 fb 04          	sar    $0x4,%rbx
   1400556b7:	48 c1 ff 02          	sar    $0x2,%rdi
   1400556bb:	48 c1 fb 1f          	sar    $0x1f,%rbx
   1400556bf:	48 c1 fb 11          	sar    $0x11,%rbx
   1400556c3:	48 c1 fb 03          	sar    $0x3,%rbx
   1400556c7:	48 c1 fb 11          	sar    $0x11,%rbx
   1400556cb:	48 c1 fb 04          	sar    $0x4,%rbx
   1400556cf:	48 c1 fb 07          	sar    $0x7,%rbx
   1400556d3:	48 c1 fb 03          	sar    $0x3,%rbx
   1400556d7:	48 c1 ff 0d          	sar    $0xd,%rdi
   1400556db:	48 c1 ff 04          	sar    $0x4,%rdi
   1400556df:	48 c1 ff 1f          	sar    $0x1f,%rdi
   1400556e3:	48 c1 fb 0d          	sar    $0xd,%rbx
   1400556e7:	48 c1 fb 04          	sar    $0x4,%rbx
   1400556eb:	48 c1 ff 11          	sar    $0x11,%rdi
   1400556ef:	48 c1 ff 1f          	sar    $0x1f,%rdi
   1400556f3:	48 c1 fb 03          	sar    $0x3,%rbx
   1400556f7:	48 c1 ff 0d          	sar    $0xd,%rdi
   1400556fb:	48 d1 ff             	sar    $1,%rdi
   1400556fe:	48 c1 fb 11          	sar    $0x11,%rbx
   140055702:	48 d1 fb             	sar    $1,%rbx
   140055705:	48 c1 ff 1f          	sar    $0x1f,%rdi
   140055709:	48 c1 ff 0b          	sar    $0xb,%rdi
   14005570d:	48 31 df             	xor    %rbx,%rdi
   140055710:	48 bb 57 9f 5d 24 54 	movabs $0x1872a254245d9f57,%rbx
   140055717:	a2 72 18 
   14005571a:	48 31 df             	xor    %rbx,%rdi
   14005571d:	48 c1 ff 3f          	sar    $0x3f,%rdi
   140055721:	48 89 fb             	mov    %rdi,%rbx
   140055724:	48 d1 fb             	sar    $1,%rbx
   140055727:	48 31 fb             	xor    %rdi,%rbx
   14005572a:	48 85 db             	test   %rbx,%rbx
   14005572d:	75 0a                	jne    0x140055739
   14005572f:	48 c1 e3 28          	shl    $0x28,%rbx
   140055733:	48 8b 3c 1c          	mov    (%rsp,%rbx,1),%rdi
   140055737:	eb 11                	jmp    0x14005574a
   140055739:	48 c1 ff 11          	sar    $0x11,%rdi
   14005573d:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140055744:	01 00 00 
   140055747:	48 8b 3b             	mov    (%rbx),%rdi
   14005574a:	5b                   	pop    %rbx
   14005574b:	5f                   	pop    %rdi
   14005574c:	9d                   	popf
   14005574d:	41 f7 fe             	idiv   %r14d
   140055750:	9c                   	pushf
   140055751:	50                   	push   %rax
   140055752:	51                   	push   %rcx
   140055753:	b8 ee 39 2a 57       	mov    $0x572a39ee,%eax
   140055758:	89 c1                	mov    %eax,%ecx
   14005575a:	c1 f9 0d             	sar    $0xd,%ecx
   14005575d:	c1 f8 1f             	sar    $0x1f,%eax
   140055760:	c1 f8 05             	sar    $0x5,%eax
   140055763:	c1 f9 02             	sar    $0x2,%ecx
   140055766:	c1 f8 11             	sar    $0x11,%eax
   140055769:	c1 f9 02             	sar    $0x2,%ecx
   14005576c:	c1 f8 0d             	sar    $0xd,%eax
   14005576f:	c1 f9 09             	sar    $0x9,%ecx
   140055772:	c1 f9 05             	sar    $0x5,%ecx
   140055775:	c1 f9 08             	sar    $0x8,%ecx
   140055778:	c1 f8 04             	sar    $0x4,%eax
   14005577b:	c1 f9 11             	sar    $0x11,%ecx
   14005577e:	c1 f8 04             	sar    $0x4,%eax
   140055781:	c1 f9 05             	sar    $0x5,%ecx
   140055784:	c1 f8 0b             	sar    $0xb,%eax
   140055787:	c1 f9 07             	sar    $0x7,%ecx
   14005578a:	c1 f8 03             	sar    $0x3,%eax
   14005578d:	c1 f8 08             	sar    $0x8,%eax
   140055790:	c1 f8 07             	sar    $0x7,%eax
   140055793:	c1 f8 07             	sar    $0x7,%eax
   140055796:	c1 f8 1f             	sar    $0x1f,%eax
   140055799:	c1 f9 11             	sar    $0x11,%ecx
   14005579c:	d1 f8                	sar    $1,%eax
   14005579e:	c1 f8 1f             	sar    $0x1f,%eax
   1400557a1:	c1 f8 05             	sar    $0x5,%eax
   1400557a4:	c1 f8 04             	sar    $0x4,%eax
   1400557a7:	c1 f8 0f             	sar    $0xf,%eax
   1400557aa:	c1 f9 1f             	sar    $0x1f,%ecx
   1400557ad:	c1 f8 03             	sar    $0x3,%eax
   1400557b0:	31 c8                	xor    %ecx,%eax
   1400557b2:	35 cc bc 6b 17       	xor    $0x176bbccc,%eax
   1400557b7:	c1 f8 1f             	sar    $0x1f,%eax
   1400557ba:	89 c1                	mov    %eax,%ecx
   1400557bc:	ff c1                	inc    %ecx
   1400557be:	83 e1 fe             	and    $0xfffffffe,%ecx
   1400557c1:	85 c9                	test   %ecx,%ecx
   1400557c3:	75 09                	jne    0x1400557ce
   1400557c5:	48 c1 e1 2a          	shl    $0x2a,%rcx
   1400557c9:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   1400557cc:	eb 0f                	jmp    0x1400557dd
   1400557ce:	c1 f8 0d             	sar    $0xd,%eax
   1400557d1:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400557d8:	01 00 00 
   1400557db:	8b 01                	mov    (%rcx),%eax
   1400557dd:	59                   	pop    %rcx
   1400557de:	58                   	pop    %rax
   1400557df:	9d                   	popf
   1400557e0:	48 63 c2             	movslq %edx,%rax
   1400557e3:	9c                   	pushf
   1400557e4:	41 50                	push   %r8
   1400557e6:	41 51                	push   %r9
   1400557e8:	41 b8 4d 8c 63 6f    	mov    $0x6f638c4d,%r8d
   1400557ee:	45 89 c1             	mov    %r8d,%r9d
   1400557f1:	41 c1 f9 08          	sar    $0x8,%r9d
   1400557f5:	41 c1 f9 09          	sar    $0x9,%r9d
   1400557f9:	41 c1 f9 07          	sar    $0x7,%r9d
   1400557fd:	41 c1 f8 09          	sar    $0x9,%r8d
   140055801:	41 c1 f8 0d          	sar    $0xd,%r8d
   140055805:	41 c1 f8 02          	sar    $0x2,%r8d
   140055809:	41 c1 f9 04          	sar    $0x4,%r9d
   14005580d:	41 c1 f9 15          	sar    $0x15,%r9d
   140055811:	41 c1 f8 02          	sar    $0x2,%r8d
   140055815:	41 c1 f8 08          	sar    $0x8,%r8d
   140055819:	41 c1 f8 03          	sar    $0x3,%r8d
   14005581d:	41 c1 f8 03          	sar    $0x3,%r8d
   140055821:	41 d1 f9             	sar    $1,%r9d
   140055824:	41 c1 f8 08          	sar    $0x8,%r8d
   140055828:	41 c1 f8 04          	sar    $0x4,%r8d
   14005582c:	41 c1 f8 0f          	sar    $0xf,%r8d
   140055830:	41 c1 f9 03          	sar    $0x3,%r9d
   140055834:	41 c1 f9 08          	sar    $0x8,%r9d
   140055838:	41 c1 f8 15          	sar    $0x15,%r8d
   14005583c:	41 c1 f9 15          	sar    $0x15,%r9d
   140055840:	41 c1 f9 0b          	sar    $0xb,%r9d
   140055844:	41 c1 f9 03          	sar    $0x3,%r9d
   140055848:	41 c1 f9 04          	sar    $0x4,%r9d
   14005584c:	41 c1 f9 03          	sar    $0x3,%r9d
   140055850:	41 c1 f8 15          	sar    $0x15,%r8d
   140055854:	41 c1 f8 11          	sar    $0x11,%r8d
   140055858:	41 c1 f9 05          	sar    $0x5,%r9d
   14005585c:	41 c1 f9 0b          	sar    $0xb,%r9d
   140055860:	41 c1 f9 0b          	sar    $0xb,%r9d
   140055864:	41 c1 f8 08          	sar    $0x8,%r8d
   140055868:	41 c1 f8 02          	sar    $0x2,%r8d
   14005586c:	41 c1 f9 04          	sar    $0x4,%r9d
   140055870:	41 c1 f8 05          	sar    $0x5,%r8d
   140055874:	41 c1 f8 09          	sar    $0x9,%r8d
   140055878:	45 31 c8             	xor    %r9d,%r8d
   14005587b:	41 81 f0 a3 ec 19 6e 	xor    $0x6e19eca3,%r8d
   140055882:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140055886:	45 89 c1             	mov    %r8d,%r9d
   140055889:	41 ff c1             	inc    %r9d
   14005588c:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   140055890:	45 85 c9             	test   %r9d,%r9d
   140055893:	75 0a                	jne    0x14005589f
   140055895:	49 c1 c9 20          	ror    $0x20,%r9
   140055899:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   14005589d:	eb 11                	jmp    0x1400558b0
   14005589f:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400558a3:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400558aa:	01 00 00 
   1400558ad:	45 8b 01             	mov    (%r9),%r8d
   1400558b0:	41 59                	pop    %r9
   1400558b2:	41 58                	pop    %r8
   1400558b4:	9d                   	popf
   1400558b5:	e9 a4 0b 00 00       	jmp    0x14005645e
   1400558ba:	9c                   	pushf
   1400558bb:	51                   	push   %rcx
   1400558bc:	41 50                	push   %r8
   1400558be:	48 b9 df bb 30 41 c0 	movabs $0x4433d9c04130bbdf,%rcx
   1400558c5:	d9 33 44 
   1400558c8:	49 89 c8             	mov    %rcx,%r8
   1400558cb:	49 c1 f8 1f          	sar    $0x1f,%r8
   1400558cf:	49 c1 f8 07          	sar    $0x7,%r8
   1400558d3:	49 d1 f8             	sar    $1,%r8
   1400558d6:	49 d1 f8             	sar    $1,%r8
   1400558d9:	49 c1 f8 0d          	sar    $0xd,%r8
   1400558dd:	49 c1 f8 03          	sar    $0x3,%r8
   1400558e1:	49 c1 f8 09          	sar    $0x9,%r8
   1400558e5:	49 c1 f8 04          	sar    $0x4,%r8
   1400558e9:	48 c1 f9 15          	sar    $0x15,%rcx
   1400558ed:	49 c1 f8 15          	sar    $0x15,%r8
   1400558f1:	49 c1 f8 04          	sar    $0x4,%r8
   1400558f5:	48 c1 f9 1b          	sar    $0x1b,%rcx
   1400558f9:	49 c1 f8 11          	sar    $0x11,%r8
   1400558fd:	48 c1 f9 07          	sar    $0x7,%rcx
   140055901:	48 c1 f9 04          	sar    $0x4,%rcx
   140055905:	49 c1 f8 07          	sar    $0x7,%r8
   140055909:	49 c1 f8 15          	sar    $0x15,%r8
   14005590d:	48 c1 f9 07          	sar    $0x7,%rcx
   140055911:	48 c1 f9 04          	sar    $0x4,%rcx
   140055915:	48 c1 f9 09          	sar    $0x9,%rcx
   140055919:	48 c1 f9 02          	sar    $0x2,%rcx
   14005591d:	49 c1 f8 0d          	sar    $0xd,%r8
   140055921:	48 c1 f9 03          	sar    $0x3,%rcx
   140055925:	49 c1 f8 09          	sar    $0x9,%r8
   140055929:	48 c1 f9 02          	sar    $0x2,%rcx
   14005592d:	49 c1 f8 1f          	sar    $0x1f,%r8
   140055931:	48 c1 f9 04          	sar    $0x4,%rcx
   140055935:	49 c1 f8 15          	sar    $0x15,%r8
   140055939:	49 c1 f8 07          	sar    $0x7,%r8
   14005593d:	49 d1 f8             	sar    $1,%r8
   140055940:	48 c1 f9 04          	sar    $0x4,%rcx
   140055944:	49 c1 f8 03          	sar    $0x3,%r8
   140055948:	48 c1 f9 04          	sar    $0x4,%rcx
   14005594c:	49 c1 f8 07          	sar    $0x7,%r8
   140055950:	49 c1 f8 03          	sar    $0x3,%r8
   140055954:	48 c1 f9 15          	sar    $0x15,%rcx
   140055958:	48 d1 f9             	sar    $1,%rcx
   14005595b:	4c 31 c1             	xor    %r8,%rcx
   14005595e:	49 b8 e7 73 40 98 ef 	movabs $0x7157ffef984073e7,%r8
   140055965:	ff 57 71 
   140055968:	4c 31 c1             	xor    %r8,%rcx
   14005596b:	48 c1 f9 3f          	sar    $0x3f,%rcx
   14005596f:	49 89 c8             	mov    %rcx,%r8
   140055972:	49 d1 f8             	sar    $1,%r8
   140055975:	49 31 c8             	xor    %rcx,%r8
   140055978:	4d 85 c0             	test   %r8,%r8
   14005597b:	75 0a                	jne    0x140055987
   14005597d:	49 c1 e0 2a          	shl    $0x2a,%r8
   140055981:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   140055985:	eb 11                	jmp    0x140055998
   140055987:	48 c1 f9 11          	sar    $0x11,%rcx
   14005598b:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140055992:	01 00 00 
   140055995:	49 8b 08             	mov    (%r8),%rcx
   140055998:	41 58                	pop    %r8
   14005599a:	59                   	pop    %rcx
   14005599b:	9d                   	popf
   14005599c:	49 63 c6             	movslq %r14d,%rax
   14005599f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
   1400559a3:	0f 84 e1 1d 00 00    	je     0x14005778a
   1400559a9:	9c                   	pushf
   1400559aa:	41 51                	push   %r9
   1400559ac:	41 52                	push   %r10
   1400559ae:	49 b9 d3 64 04 f6 bb 	movabs $0x2cd7f6bbf60464d3,%r9
   1400559b5:	f6 d7 2c 
   1400559b8:	4d 89 ca             	mov    %r9,%r10
   1400559bb:	49 c1 f9 1b          	sar    $0x1b,%r9
   1400559bf:	49 c1 fa 07          	sar    $0x7,%r10
   1400559c3:	49 c1 f9 1b          	sar    $0x1b,%r9
   1400559c7:	49 c1 fa 02          	sar    $0x2,%r10
   1400559cb:	49 c1 f9 05          	sar    $0x5,%r9
   1400559cf:	49 c1 fa 0b          	sar    $0xb,%r10
   1400559d3:	49 c1 f9 04          	sar    $0x4,%r9
   1400559d7:	49 c1 f9 11          	sar    $0x11,%r9
   1400559db:	49 c1 f9 05          	sar    $0x5,%r9
   1400559df:	49 c1 f9 0d          	sar    $0xd,%r9
   1400559e3:	49 c1 f9 11          	sar    $0x11,%r9
   1400559e7:	49 c1 fa 05          	sar    $0x5,%r10
   1400559eb:	49 c1 fa 11          	sar    $0x11,%r10
   1400559ef:	49 c1 fa 0b          	sar    $0xb,%r10
   1400559f3:	49 c1 f9 11          	sar    $0x11,%r9
   1400559f7:	49 c1 fa 0b          	sar    $0xb,%r10
   1400559fb:	49 c1 f9 1f          	sar    $0x1f,%r9
   1400559ff:	49 c1 f9 05          	sar    $0x5,%r9
   140055a03:	49 c1 f9 04          	sar    $0x4,%r9
   140055a07:	49 c1 f9 11          	sar    $0x11,%r9
   140055a0b:	49 c1 fa 11          	sar    $0x11,%r10
   140055a0f:	49 c1 f9 0b          	sar    $0xb,%r9
   140055a13:	49 d1 fa             	sar    $1,%r10
   140055a16:	49 d1 fa             	sar    $1,%r10
   140055a19:	49 c1 fa 11          	sar    $0x11,%r10
   140055a1d:	49 c1 f9 09          	sar    $0x9,%r9
   140055a21:	49 c1 fa 15          	sar    $0x15,%r10
   140055a25:	49 c1 f9 05          	sar    $0x5,%r9
   140055a29:	49 c1 f9 11          	sar    $0x11,%r9
   140055a2d:	49 c1 fa 11          	sar    $0x11,%r10
   140055a31:	4d 31 d1             	xor    %r10,%r9
   140055a34:	49 ba 92 60 5d 81 e4 	movabs $0x46bf9de4815d6092,%r10
   140055a3b:	9d bf 46 
   140055a3e:	4d 31 d1             	xor    %r10,%r9
   140055a41:	49 c1 f9 3f          	sar    $0x3f,%r9
   140055a45:	4d 89 ca             	mov    %r9,%r10
   140055a48:	49 d1 fa             	sar    $1,%r10
   140055a4b:	4d 31 ca             	xor    %r9,%r10
   140055a4e:	4d 85 d2             	test   %r10,%r10
   140055a51:	75 0a                	jne    0x140055a5d
   140055a53:	49 c1 ca 20          	ror    $0x20,%r10
   140055a57:	4e 8b 0c d4          	mov    (%rsp,%r10,8),%r9
   140055a5b:	eb 11                	jmp    0x140055a6e
   140055a5d:	49 c1 f9 11          	sar    $0x11,%r9
   140055a61:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140055a68:	01 00 00 
   140055a6b:	4d 8b 0a             	mov    (%r10),%r9
   140055a6e:	41 5a                	pop    %r10
   140055a70:	41 59                	pop    %r9
   140055a72:	9d                   	popf
   140055a73:	44 89 f0             	mov    %r14d,%eax
   140055a76:	9c                   	pushf
   140055a77:	50                   	push   %rax
   140055a78:	51                   	push   %rcx
   140055a79:	b8 2c 6b ba 1a       	mov    $0x1aba6b2c,%eax
   140055a7e:	89 c1                	mov    %eax,%ecx
   140055a80:	c1 f9 08             	sar    $0x8,%ecx
   140055a83:	c1 f8 05             	sar    $0x5,%eax
   140055a86:	c1 f8 08             	sar    $0x8,%eax
   140055a89:	c1 f8 08             	sar    $0x8,%eax
   140055a8c:	c1 f8 08             	sar    $0x8,%eax
   140055a8f:	c1 f8 03             	sar    $0x3,%eax
   140055a92:	d1 f9                	sar    $1,%ecx
   140055a94:	d1 f9                	sar    $1,%ecx
   140055a96:	c1 f8 08             	sar    $0x8,%eax
   140055a99:	c1 f8 04             	sar    $0x4,%eax
   140055a9c:	c1 f9 03             	sar    $0x3,%ecx
   140055a9f:	c1 f8 1f             	sar    $0x1f,%eax
   140055aa2:	c1 f8 15             	sar    $0x15,%eax
   140055aa5:	c1 f9 09             	sar    $0x9,%ecx
   140055aa8:	c1 f9 07             	sar    $0x7,%ecx
   140055aab:	c1 f9 08             	sar    $0x8,%ecx
   140055aae:	c1 f9 03             	sar    $0x3,%ecx
   140055ab1:	c1 f9 0f             	sar    $0xf,%ecx
   140055ab4:	c1 f8 09             	sar    $0x9,%eax
   140055ab7:	c1 f8 03             	sar    $0x3,%eax
   140055aba:	c1 f9 07             	sar    $0x7,%ecx
   140055abd:	c1 f8 0b             	sar    $0xb,%eax
   140055ac0:	c1 f8 0d             	sar    $0xd,%eax
   140055ac3:	c1 f9 03             	sar    $0x3,%ecx
   140055ac6:	c1 f8 03             	sar    $0x3,%eax
   140055ac9:	c1 f9 08             	sar    $0x8,%ecx
   140055acc:	c1 f9 11             	sar    $0x11,%ecx
   140055acf:	c1 f9 15             	sar    $0x15,%ecx
   140055ad2:	d1 f9                	sar    $1,%ecx
   140055ad4:	c1 f9 0b             	sar    $0xb,%ecx
   140055ad7:	31 c8                	xor    %ecx,%eax
   140055ad9:	35 29 6a c3 25       	xor    $0x25c36a29,%eax
   140055ade:	c1 f8 1f             	sar    $0x1f,%eax
   140055ae1:	89 c1                	mov    %eax,%ecx
   140055ae3:	ff c1                	inc    %ecx
   140055ae5:	83 e1 fe             	and    $0xfffffffe,%ecx
   140055ae8:	85 c9                	test   %ecx,%ecx
   140055aea:	75 09                	jne    0x140055af5
   140055aec:	48 c1 e1 28          	shl    $0x28,%rcx
   140055af0:	8b 04 4c             	mov    (%rsp,%rcx,2),%eax
   140055af3:	eb 0f                	jmp    0x140055b04
   140055af5:	c1 f8 0d             	sar    $0xd,%eax
   140055af8:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140055aff:	01 00 00 
   140055b02:	8b 01                	mov    (%rcx),%eax
   140055b04:	59                   	pop    %rcx
   140055b05:	58                   	pop    %rax
   140055b06:	9d                   	popf
   140055b07:	83 f0 01             	xor    $0x1,%eax
   140055b0a:	9c                   	pushf
   140055b0b:	41 51                	push   %r9
   140055b0d:	41 52                	push   %r10
   140055b0f:	41 b9 e9 38 05 68    	mov    $0x680538e9,%r9d
   140055b15:	45 89 ca             	mov    %r9d,%r10d
   140055b18:	41 c1 fa 09          	sar    $0x9,%r10d
   140055b1c:	41 c1 f9 15          	sar    $0x15,%r9d
   140055b20:	41 c1 f9 04          	sar    $0x4,%r9d
   140055b24:	41 c1 fa 05          	sar    $0x5,%r10d
   140055b28:	41 c1 f9 03          	sar    $0x3,%r9d
   140055b2c:	41 c1 f9 0d          	sar    $0xd,%r9d
   140055b30:	41 c1 f9 08          	sar    $0x8,%r9d
   140055b34:	41 c1 f9 08          	sar    $0x8,%r9d
   140055b38:	41 c1 fa 07          	sar    $0x7,%r10d
   140055b3c:	41 c1 f9 09          	sar    $0x9,%r9d
   140055b40:	41 c1 fa 03          	sar    $0x3,%r10d
   140055b44:	41 c1 fa 09          	sar    $0x9,%r10d
   140055b48:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055b4c:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055b50:	41 c1 fa 02          	sar    $0x2,%r10d
   140055b54:	41 c1 fa 05          	sar    $0x5,%r10d
   140055b58:	41 c1 fa 0b          	sar    $0xb,%r10d
   140055b5c:	41 c1 fa 11          	sar    $0x11,%r10d
   140055b60:	41 c1 f9 0f          	sar    $0xf,%r9d
   140055b64:	41 d1 fa             	sar    $1,%r10d
   140055b67:	41 c1 f9 02          	sar    $0x2,%r9d
   140055b6b:	41 c1 fa 0b          	sar    $0xb,%r10d
   140055b6f:	41 c1 f9 03          	sar    $0x3,%r9d
   140055b73:	41 c1 f9 02          	sar    $0x2,%r9d
   140055b77:	41 c1 f9 05          	sar    $0x5,%r9d
   140055b7b:	41 c1 fa 11          	sar    $0x11,%r10d
   140055b7f:	41 c1 fa 08          	sar    $0x8,%r10d
   140055b83:	41 d1 f9             	sar    $1,%r9d
   140055b86:	41 c1 f9 0d          	sar    $0xd,%r9d
   140055b8a:	41 c1 fa 03          	sar    $0x3,%r10d
   140055b8e:	41 c1 fa 0b          	sar    $0xb,%r10d
   140055b92:	41 c1 f9 11          	sar    $0x11,%r9d
   140055b96:	41 c1 f9 11          	sar    $0x11,%r9d
   140055b9a:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055b9e:	41 c1 f9 07          	sar    $0x7,%r9d
   140055ba2:	41 d1 fa             	sar    $1,%r10d
   140055ba5:	41 c1 fa 15          	sar    $0x15,%r10d
   140055ba9:	41 c1 fa 03          	sar    $0x3,%r10d
   140055bad:	45 31 d1             	xor    %r10d,%r9d
   140055bb0:	41 81 f1 03 07 b0 78 	xor    $0x78b00703,%r9d
   140055bb7:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140055bbb:	45 89 ca             	mov    %r9d,%r10d
   140055bbe:	41 ff c2             	inc    %r10d
   140055bc1:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   140055bc5:	45 85 d2             	test   %r10d,%r10d
   140055bc8:	75 0a                	jne    0x140055bd4
   140055bca:	49 c1 e2 26          	shl    $0x26,%r10
   140055bce:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140055bd2:	eb 11                	jmp    0x140055be5
   140055bd4:	41 c1 f9 0d          	sar    $0xd,%r9d
   140055bd8:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140055bdf:	01 00 00 
   140055be2:	45 8b 0a             	mov    (%r10),%r9d
   140055be5:	41 5a                	pop    %r10
   140055be7:	41 59                	pop    %r9
   140055be9:	9d                   	popf
   140055bea:	41 83 e6 01          	and    $0x1,%r14d
   140055bee:	9c                   	pushf
   140055bef:	41 52                	push   %r10
   140055bf1:	41 53                	push   %r11
   140055bf3:	41 ba d1 c2 15 27    	mov    $0x2715c2d1,%r10d
   140055bf9:	45 89 d3             	mov    %r10d,%r11d
   140055bfc:	41 c1 fb 11          	sar    $0x11,%r11d
   140055c00:	41 c1 fb 1f          	sar    $0x1f,%r11d
   140055c04:	41 c1 fa 15          	sar    $0x15,%r10d
   140055c08:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055c0c:	41 c1 fb 0d          	sar    $0xd,%r11d
   140055c10:	41 c1 fb 1f          	sar    $0x1f,%r11d
   140055c14:	41 c1 fa 15          	sar    $0x15,%r10d
   140055c18:	41 c1 fb 08          	sar    $0x8,%r11d
   140055c1c:	41 c1 fa 15          	sar    $0x15,%r10d
   140055c20:	41 c1 fb 07          	sar    $0x7,%r11d
   140055c24:	41 c1 fb 05          	sar    $0x5,%r11d
   140055c28:	41 c1 fa 02          	sar    $0x2,%r10d
   140055c2c:	41 c1 fa 04          	sar    $0x4,%r10d
   140055c30:	41 c1 fb 0b          	sar    $0xb,%r11d
   140055c34:	41 c1 fb 02          	sar    $0x2,%r11d
   140055c38:	41 c1 fb 08          	sar    $0x8,%r11d
   140055c3c:	41 c1 fb 08          	sar    $0x8,%r11d
   140055c40:	41 c1 fb 11          	sar    $0x11,%r11d
   140055c44:	41 c1 fb 0d          	sar    $0xd,%r11d
   140055c48:	41 c1 fb 15          	sar    $0x15,%r11d
   140055c4c:	41 d1 fb             	sar    $1,%r11d
   140055c4f:	41 c1 fa 05          	sar    $0x5,%r10d
   140055c53:	41 c1 fb 0f          	sar    $0xf,%r11d
   140055c57:	41 c1 fa 02          	sar    $0x2,%r10d
   140055c5b:	41 c1 fb 08          	sar    $0x8,%r11d
   140055c5f:	41 c1 fb 1f          	sar    $0x1f,%r11d
   140055c63:	41 c1 fb 02          	sar    $0x2,%r11d
   140055c67:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055c6b:	41 c1 fa 09          	sar    $0x9,%r10d
   140055c6f:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055c73:	41 c1 fb 08          	sar    $0x8,%r11d
   140055c77:	41 c1 fb 0d          	sar    $0xd,%r11d
   140055c7b:	45 31 da             	xor    %r11d,%r10d
   140055c7e:	41 81 f2 77 cf 51 64 	xor    $0x6451cf77,%r10d
   140055c85:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055c89:	45 89 d3             	mov    %r10d,%r11d
   140055c8c:	41 d1 fb             	sar    $1,%r11d
   140055c8f:	45 31 d3             	xor    %r10d,%r11d
   140055c92:	45 85 db             	test   %r11d,%r11d
   140055c95:	75 0a                	jne    0x140055ca1
   140055c97:	49 c1 e3 28          	shl    $0x28,%r11
   140055c9b:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140055c9f:	eb 11                	jmp    0x140055cb2
   140055ca1:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055ca5:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140055cac:	01 00 00 
   140055caf:	45 8b 13             	mov    (%r11),%r10d
   140055cb2:	41 5b                	pop    %r11
   140055cb4:	41 5a                	pop    %r10
   140055cb6:	9d                   	popf
   140055cb7:	46 8d 34 70          	lea    (%rax,%r14,2),%r14d
   140055cbb:	9c                   	pushf
   140055cbc:	50                   	push   %rax
   140055cbd:	52                   	push   %rdx
   140055cbe:	b8 1d 56 97 3b       	mov    $0x3b97561d,%eax
   140055cc3:	89 c2                	mov    %eax,%edx
   140055cc5:	c1 fa 02             	sar    $0x2,%edx
   140055cc8:	c1 fa 02             	sar    $0x2,%edx
   140055ccb:	c1 fa 0d             	sar    $0xd,%edx
   140055cce:	c1 f8 0d             	sar    $0xd,%eax
   140055cd1:	d1 f8                	sar    $1,%eax
   140055cd3:	c1 fa 02             	sar    $0x2,%edx
   140055cd6:	c1 f8 09             	sar    $0x9,%eax
   140055cd9:	c1 f8 07             	sar    $0x7,%eax
   140055cdc:	c1 fa 02             	sar    $0x2,%edx
   140055cdf:	c1 fa 09             	sar    $0x9,%edx
   140055ce2:	c1 f8 05             	sar    $0x5,%eax
   140055ce5:	c1 fa 04             	sar    $0x4,%edx
   140055ce8:	c1 f8 11             	sar    $0x11,%eax
   140055ceb:	c1 f8 05             	sar    $0x5,%eax
   140055cee:	c1 fa 02             	sar    $0x2,%edx
   140055cf1:	c1 fa 0b             	sar    $0xb,%edx
   140055cf4:	c1 f8 0b             	sar    $0xb,%eax
   140055cf7:	c1 fa 0b             	sar    $0xb,%edx
   140055cfa:	c1 fa 03             	sar    $0x3,%edx
   140055cfd:	c1 f8 07             	sar    $0x7,%eax
   140055d00:	c1 fa 03             	sar    $0x3,%edx
   140055d03:	c1 fa 0b             	sar    $0xb,%edx
   140055d06:	c1 fa 05             	sar    $0x5,%edx
   140055d09:	c1 fa 08             	sar    $0x8,%edx
   140055d0c:	c1 fa 02             	sar    $0x2,%edx
   140055d0f:	c1 fa 11             	sar    $0x11,%edx
   140055d12:	c1 fa 08             	sar    $0x8,%edx
   140055d15:	c1 fa 09             	sar    $0x9,%edx
   140055d18:	c1 f8 03             	sar    $0x3,%eax
   140055d1b:	c1 fa 15             	sar    $0x15,%edx
   140055d1e:	c1 f8 05             	sar    $0x5,%eax
   140055d21:	c1 fa 02             	sar    $0x2,%edx
   140055d24:	c1 fa 0d             	sar    $0xd,%edx
   140055d27:	c1 fa 05             	sar    $0x5,%edx
   140055d2a:	c1 f8 03             	sar    $0x3,%eax
   140055d2d:	c1 f8 07             	sar    $0x7,%eax
   140055d30:	c1 fa 07             	sar    $0x7,%edx
   140055d33:	31 d0                	xor    %edx,%eax
   140055d35:	35 89 46 94 60       	xor    $0x60944689,%eax
   140055d3a:	c1 f8 1f             	sar    $0x1f,%eax
   140055d3d:	89 c2                	mov    %eax,%edx
   140055d3f:	d1 fa                	sar    $1,%edx
   140055d41:	31 c2                	xor    %eax,%edx
   140055d43:	85 d2                	test   %edx,%edx
   140055d45:	75 09                	jne    0x140055d50
   140055d47:	48 c1 e2 2a          	shl    $0x2a,%rdx
   140055d4b:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   140055d4e:	eb 0f                	jmp    0x140055d5f
   140055d50:	c1 f8 0d             	sar    $0xd,%eax
   140055d53:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140055d5a:	01 00 00 
   140055d5d:	8b 02                	mov    (%rdx),%eax
   140055d5f:	5a                   	pop    %rdx
   140055d60:	58                   	pop    %rax
   140055d61:	9d                   	popf
   140055d62:	44 89 34 24          	mov    %r14d,(%rsp)
   140055d66:	9c                   	pushf
   140055d67:	52                   	push   %rdx
   140055d68:	56                   	push   %rsi
   140055d69:	48 ba b5 37 c0 2f 00 	movabs $0x20adbc002fc037b5,%rdx
   140055d70:	bc ad 20 
   140055d73:	48 89 d6             	mov    %rdx,%rsi
   140055d76:	48 c1 fe 0d          	sar    $0xd,%rsi
   140055d7a:	48 c1 fe 0b          	sar    $0xb,%rsi
   140055d7e:	48 c1 fa 03          	sar    $0x3,%rdx
   140055d82:	48 d1 fe             	sar    $1,%rsi
   140055d85:	48 c1 fa 0b          	sar    $0xb,%rdx
   140055d89:	48 c1 fa 02          	sar    $0x2,%rdx
   140055d8d:	48 c1 fe 04          	sar    $0x4,%rsi
   140055d91:	48 c1 fe 1b          	sar    $0x1b,%rsi
   140055d95:	48 c1 fe 15          	sar    $0x15,%rsi
   140055d99:	48 c1 fe 09          	sar    $0x9,%rsi
   140055d9d:	48 c1 fa 04          	sar    $0x4,%rdx
   140055da1:	48 c1 fa 03          	sar    $0x3,%rdx
   140055da5:	48 c1 fa 1b          	sar    $0x1b,%rdx
   140055da9:	48 c1 fa 15          	sar    $0x15,%rdx
   140055dad:	48 c1 fe 02          	sar    $0x2,%rsi
   140055db1:	48 d1 fe             	sar    $1,%rsi
   140055db4:	48 c1 fa 09          	sar    $0x9,%rdx
   140055db8:	48 c1 fa 03          	sar    $0x3,%rdx
   140055dbc:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140055dc0:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140055dc4:	48 c1 fe 05          	sar    $0x5,%rsi
   140055dc8:	48 c1 fe 07          	sar    $0x7,%rsi
   140055dcc:	48 c1 fe 0d          	sar    $0xd,%rsi
   140055dd0:	48 c1 fa 0d          	sar    $0xd,%rdx
   140055dd4:	48 c1 fa 0d          	sar    $0xd,%rdx
   140055dd8:	48 c1 fa 0d          	sar    $0xd,%rdx
   140055ddc:	48 c1 fe 05          	sar    $0x5,%rsi
   140055de0:	48 c1 fe 02          	sar    $0x2,%rsi
   140055de4:	48 c1 fa 04          	sar    $0x4,%rdx
   140055de8:	48 c1 fa 03          	sar    $0x3,%rdx
   140055dec:	48 c1 fe 15          	sar    $0x15,%rsi
   140055df0:	48 c1 fa 0d          	sar    $0xd,%rdx
   140055df4:	48 d1 fa             	sar    $1,%rdx
   140055df7:	48 d1 fa             	sar    $1,%rdx
   140055dfa:	48 c1 fe 15          	sar    $0x15,%rsi
   140055dfe:	48 c1 fa 05          	sar    $0x5,%rdx
   140055e02:	48 d1 fe             	sar    $1,%rsi
   140055e05:	48 c1 fe 1b          	sar    $0x1b,%rsi
   140055e09:	48 31 f2             	xor    %rsi,%rdx
   140055e0c:	48 be 4a 69 98 32 37 	movabs $0x473110373298694a,%rsi
   140055e13:	10 31 47 
   140055e16:	48 31 f2             	xor    %rsi,%rdx
   140055e19:	48 c1 fa 3f          	sar    $0x3f,%rdx
   140055e1d:	48 8d 72 01          	lea    0x1(%rdx),%rsi
   140055e21:	48 0f af f2          	imul   %rdx,%rsi
   140055e25:	48 85 f6             	test   %rsi,%rsi
   140055e28:	75 0a                	jne    0x140055e34
   140055e2a:	48 c1 e6 2a          	shl    $0x2a,%rsi
   140055e2e:	48 8b 14 f4          	mov    (%rsp,%rsi,8),%rdx
   140055e32:	eb 11                	jmp    0x140055e45
   140055e34:	48 c1 fa 11          	sar    $0x11,%rdx
   140055e38:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140055e3f:	01 00 00 
   140055e42:	48 8b 16             	mov    (%rsi),%rdx
   140055e45:	5e                   	pop    %rsi
   140055e46:	5a                   	pop    %rdx
   140055e47:	9d                   	popf
   140055e48:	8b 04 24             	mov    (%rsp),%eax
   140055e4b:	9c                   	pushf
   140055e4c:	41 52                	push   %r10
   140055e4e:	41 53                	push   %r11
   140055e50:	41 ba 2c 85 70 42    	mov    $0x4270852c,%r10d
   140055e56:	45 89 d3             	mov    %r10d,%r11d
   140055e59:	41 c1 fa 11          	sar    $0x11,%r10d
   140055e5d:	41 c1 fb 08          	sar    $0x8,%r11d
   140055e61:	41 c1 fa 07          	sar    $0x7,%r10d
   140055e65:	41 c1 fb 11          	sar    $0x11,%r11d
   140055e69:	41 c1 fa 15          	sar    $0x15,%r10d
   140055e6d:	41 c1 fa 11          	sar    $0x11,%r10d
   140055e71:	41 c1 fb 04          	sar    $0x4,%r11d
   140055e75:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055e79:	41 c1 fa 11          	sar    $0x11,%r10d
   140055e7d:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055e81:	41 c1 fb 08          	sar    $0x8,%r11d
   140055e85:	41 c1 fa 08          	sar    $0x8,%r10d
   140055e89:	41 c1 fa 08          	sar    $0x8,%r10d
   140055e8d:	41 c1 fa 08          	sar    $0x8,%r10d
   140055e91:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055e95:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055e99:	41 c1 fb 02          	sar    $0x2,%r11d
   140055e9d:	41 c1 fb 05          	sar    $0x5,%r11d
   140055ea1:	41 c1 fb 03          	sar    $0x3,%r11d
   140055ea5:	41 c1 fa 0f          	sar    $0xf,%r10d
   140055ea9:	41 c1 fa 08          	sar    $0x8,%r10d
   140055ead:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055eb1:	41 d1 fa             	sar    $1,%r10d
   140055eb4:	41 c1 fa 0b          	sar    $0xb,%r10d
   140055eb8:	41 c1 fb 0d          	sar    $0xd,%r11d
   140055ebc:	41 c1 fb 09          	sar    $0x9,%r11d
   140055ec0:	41 c1 fb 03          	sar    $0x3,%r11d
   140055ec4:	41 d1 fb             	sar    $1,%r11d
   140055ec7:	41 c1 fb 02          	sar    $0x2,%r11d
   140055ecb:	41 d1 fb             	sar    $1,%r11d
   140055ece:	41 c1 fb 15          	sar    $0x15,%r11d
   140055ed2:	41 c1 fa 08          	sar    $0x8,%r10d
   140055ed6:	41 c1 fb 02          	sar    $0x2,%r11d
   140055eda:	41 c1 fa 04          	sar    $0x4,%r10d
   140055ede:	41 d1 fa             	sar    $1,%r10d
   140055ee1:	41 c1 fb 0f          	sar    $0xf,%r11d
   140055ee5:	45 31 da             	xor    %r11d,%r10d
   140055ee8:	41 81 f2 c6 54 32 6d 	xor    $0x6d3254c6,%r10d
   140055eef:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140055ef3:	45 89 d3             	mov    %r10d,%r11d
   140055ef6:	41 ff c3             	inc    %r11d
   140055ef9:	41 83 e3 fe          	and    $0xfffffffe,%r11d
   140055efd:	45 85 db             	test   %r11d,%r11d
   140055f00:	75 0a                	jne    0x140055f0c
   140055f02:	49 c1 cb 20          	ror    $0x20,%r11
   140055f06:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140055f0a:	eb 11                	jmp    0x140055f1d
   140055f0c:	41 c1 fa 0d          	sar    $0xd,%r10d
   140055f10:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140055f17:	01 00 00 
   140055f1a:	45 8b 13             	mov    (%r11),%r10d
   140055f1d:	41 5b                	pop    %r11
   140055f1f:	41 5a                	pop    %r10
   140055f21:	9d                   	popf
   140055f22:	8b 14 24             	mov    (%rsp),%edx
   140055f25:	9c                   	pushf
   140055f26:	41 52                	push   %r10
   140055f28:	41 53                	push   %r11
   140055f2a:	49 ba fb f0 3e e7 22 	movabs $0x2e377722e73ef0fb,%r10
   140055f31:	77 37 2e 
   140055f34:	4d 89 d3             	mov    %r10,%r11
   140055f37:	49 c1 fb 09          	sar    $0x9,%r11
   140055f3b:	49 c1 fa 04          	sar    $0x4,%r10
   140055f3f:	49 c1 fb 02          	sar    $0x2,%r11
   140055f43:	49 c1 fb 15          	sar    $0x15,%r11
   140055f47:	49 c1 fa 0b          	sar    $0xb,%r10
   140055f4b:	49 c1 fa 1b          	sar    $0x1b,%r10
   140055f4f:	49 c1 fb 02          	sar    $0x2,%r11
   140055f53:	49 c1 fa 04          	sar    $0x4,%r10
   140055f57:	49 c1 fa 0b          	sar    $0xb,%r10
   140055f5b:	49 c1 fb 11          	sar    $0x11,%r11
   140055f5f:	49 c1 fb 15          	sar    $0x15,%r11
   140055f63:	49 c1 fb 02          	sar    $0x2,%r11
   140055f67:	49 d1 fb             	sar    $1,%r11
   140055f6a:	49 c1 fb 04          	sar    $0x4,%r11
   140055f6e:	49 c1 fb 15          	sar    $0x15,%r11
   140055f72:	49 c1 fb 0b          	sar    $0xb,%r11
   140055f76:	49 c1 fa 1f          	sar    $0x1f,%r10
   140055f7a:	49 c1 fb 09          	sar    $0x9,%r11
   140055f7e:	49 c1 fa 0b          	sar    $0xb,%r10
   140055f82:	49 c1 fb 0d          	sar    $0xd,%r11
   140055f86:	49 c1 fb 11          	sar    $0x11,%r11
   140055f8a:	49 c1 fa 09          	sar    $0x9,%r10
   140055f8e:	49 d1 fa             	sar    $1,%r10
   140055f91:	49 c1 fb 1f          	sar    $0x1f,%r11
   140055f95:	49 c1 fa 02          	sar    $0x2,%r10
   140055f99:	49 c1 fb 11          	sar    $0x11,%r11
   140055f9d:	49 c1 fa 05          	sar    $0x5,%r10
   140055fa1:	49 c1 fa 03          	sar    $0x3,%r10
   140055fa5:	49 d1 fb             	sar    $1,%r11
   140055fa8:	49 c1 fb 15          	sar    $0x15,%r11
   140055fac:	49 c1 fb 04          	sar    $0x4,%r11
   140055fb0:	49 c1 fa 1f          	sar    $0x1f,%r10
   140055fb4:	49 c1 fb 05          	sar    $0x5,%r11
   140055fb8:	49 c1 fb 04          	sar    $0x4,%r11
   140055fbc:	49 c1 fa 1b          	sar    $0x1b,%r10
   140055fc0:	49 c1 fa 02          	sar    $0x2,%r10
   140055fc4:	49 c1 fb 05          	sar    $0x5,%r11
   140055fc8:	49 c1 fa 1f          	sar    $0x1f,%r10
   140055fcc:	4d 31 da             	xor    %r11,%r10
   140055fcf:	49 bb cc 34 2a 58 dc 	movabs $0x78e97edc582a34cc,%r11
   140055fd6:	7e e9 78 
   140055fd9:	4d 31 da             	xor    %r11,%r10
   140055fdc:	49 c1 fa 3f          	sar    $0x3f,%r10
   140055fe0:	4d 89 d3             	mov    %r10,%r11
   140055fe3:	49 d1 fb             	sar    $1,%r11
   140055fe6:	4d 31 d3             	xor    %r10,%r11
   140055fe9:	4d 85 db             	test   %r11,%r11
   140055fec:	75 0a                	jne    0x140055ff8
   140055fee:	49 c1 e3 28          	shl    $0x28,%r11
   140055ff2:	4e 8b 14 1c          	mov    (%rsp,%r11,1),%r10
   140055ff6:	eb 11                	jmp    0x140056009
   140055ff8:	49 c1 fa 11          	sar    $0x11,%r10
   140055ffc:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140056003:	01 00 00 
   140056006:	4d 8b 13             	mov    (%r11),%r10
   140056009:	41 5b                	pop    %r11
   14005600b:	41 5a                	pop    %r10
   14005600d:	9d                   	popf
   14005600e:	f7 d2                	not    %edx
   140056010:	9c                   	pushf
   140056011:	41 51                	push   %r9
   140056013:	41 52                	push   %r10
   140056015:	41 b9 ab c3 ef 46    	mov    $0x46efc3ab,%r9d
   14005601b:	45 89 ca             	mov    %r9d,%r10d
   14005601e:	41 c1 fa 07          	sar    $0x7,%r10d
   140056022:	41 d1 f9             	sar    $1,%r9d
   140056025:	41 c1 fa 08          	sar    $0x8,%r10d
   140056029:	41 c1 f9 07          	sar    $0x7,%r9d
   14005602d:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056031:	41 c1 fa 11          	sar    $0x11,%r10d
   140056035:	41 c1 fa 05          	sar    $0x5,%r10d
   140056039:	41 c1 f9 09          	sar    $0x9,%r9d
   14005603d:	41 c1 fa 03          	sar    $0x3,%r10d
   140056041:	41 c1 fa 11          	sar    $0x11,%r10d
   140056045:	41 c1 fa 11          	sar    $0x11,%r10d
   140056049:	41 c1 f9 05          	sar    $0x5,%r9d
   14005604d:	41 c1 fa 08          	sar    $0x8,%r10d
   140056051:	41 c1 f9 07          	sar    $0x7,%r9d
   140056055:	41 c1 fa 02          	sar    $0x2,%r10d
   140056059:	41 c1 f9 05          	sar    $0x5,%r9d
   14005605d:	41 c1 fa 0f          	sar    $0xf,%r10d
   140056061:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056065:	41 c1 fa 04          	sar    $0x4,%r10d
   140056069:	41 c1 fa 08          	sar    $0x8,%r10d
   14005606d:	41 c1 fa 07          	sar    $0x7,%r10d
   140056071:	41 c1 f9 09          	sar    $0x9,%r9d
   140056075:	41 c1 fa 03          	sar    $0x3,%r10d
   140056079:	41 c1 f9 02          	sar    $0x2,%r9d
   14005607d:	41 c1 f9 15          	sar    $0x15,%r9d
   140056081:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056085:	41 c1 fa 02          	sar    $0x2,%r10d
   140056089:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005608d:	41 c1 fa 08          	sar    $0x8,%r10d
   140056091:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056095:	41 c1 f9 0b          	sar    $0xb,%r9d
   140056099:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005609d:	45 31 d1             	xor    %r10d,%r9d
   1400560a0:	41 81 f1 6f af 34 63 	xor    $0x6334af6f,%r9d
   1400560a7:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400560ab:	45 89 ca             	mov    %r9d,%r10d
   1400560ae:	41 ff c2             	inc    %r10d
   1400560b1:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   1400560b5:	45 85 d2             	test   %r10d,%r10d
   1400560b8:	75 0a                	jne    0x1400560c4
   1400560ba:	49 c1 e2 26          	shl    $0x26,%r10
   1400560be:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   1400560c2:	eb 11                	jmp    0x1400560d5
   1400560c4:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400560c8:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   1400560cf:	01 00 00 
   1400560d2:	45 8b 0a             	mov    (%r10),%r9d
   1400560d5:	41 5a                	pop    %r10
   1400560d7:	41 59                	pop    %r9
   1400560d9:	9d                   	popf
   1400560da:	0f af d0             	imul   %eax,%edx
   1400560dd:	9c                   	pushf
   1400560de:	41 50                	push   %r8
   1400560e0:	41 51                	push   %r9
   1400560e2:	41 b8 7a 60 21 7c    	mov    $0x7c21607a,%r8d
   1400560e8:	45 89 c1             	mov    %r8d,%r9d
   1400560eb:	41 c1 f8 08          	sar    $0x8,%r8d
   1400560ef:	41 d1 f8             	sar    $1,%r8d
   1400560f2:	41 d1 f8             	sar    $1,%r8d
   1400560f5:	41 c1 f8 11          	sar    $0x11,%r8d
   1400560f9:	41 c1 f8 0f          	sar    $0xf,%r8d
   1400560fd:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056101:	41 c1 f8 03          	sar    $0x3,%r8d
   140056105:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056109:	41 c1 f8 09          	sar    $0x9,%r8d
   14005610d:	41 c1 f8 02          	sar    $0x2,%r8d
   140056111:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056115:	41 c1 f8 08          	sar    $0x8,%r8d
   140056119:	41 c1 f9 07          	sar    $0x7,%r9d
   14005611d:	41 c1 f9 03          	sar    $0x3,%r9d
   140056121:	41 c1 f9 08          	sar    $0x8,%r9d
   140056125:	41 c1 f9 04          	sar    $0x4,%r9d
   140056129:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005612d:	41 c1 f8 07          	sar    $0x7,%r8d
   140056131:	41 c1 f9 07          	sar    $0x7,%r9d
   140056135:	41 c1 f9 09          	sar    $0x9,%r9d
   140056139:	41 c1 f9 03          	sar    $0x3,%r9d
   14005613d:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056141:	41 c1 f8 15          	sar    $0x15,%r8d
   140056145:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056149:	41 c1 f8 05          	sar    $0x5,%r8d
   14005614d:	41 c1 f8 03          	sar    $0x3,%r8d
   140056151:	41 c1 f8 0d          	sar    $0xd,%r8d
   140056155:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056159:	45 31 c8             	xor    %r9d,%r8d
   14005615c:	41 81 f0 97 12 cb 54 	xor    $0x54cb1297,%r8d
   140056163:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140056167:	45 8d 48 01          	lea    0x1(%r8),%r9d
   14005616b:	45 0f af c8          	imul   %r8d,%r9d
   14005616f:	45 85 c9             	test   %r9d,%r9d
   140056172:	75 0a                	jne    0x14005617e
   140056174:	49 c1 e1 28          	shl    $0x28,%r9
   140056178:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   14005617c:	eb 11                	jmp    0x14005618f
   14005617e:	41 c1 f8 0d          	sar    $0xd,%r8d
   140056182:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140056189:	01 00 00 
   14005618c:	45 8b 01             	mov    (%r9),%r8d
   14005618f:	41 59                	pop    %r9
   140056191:	41 58                	pop    %r8
   140056193:	9d                   	popf
   140056194:	89 d8                	mov    %ebx,%eax
   140056196:	9c                   	pushf
   140056197:	52                   	push   %rdx
   140056198:	56                   	push   %rsi
   140056199:	ba 58 88 c5 23       	mov    $0x23c58858,%edx
   14005619e:	89 d6                	mov    %edx,%esi
   1400561a0:	c1 fe 1f             	sar    $0x1f,%esi
   1400561a3:	c1 fa 03             	sar    $0x3,%edx
   1400561a6:	c1 fe 09             	sar    $0x9,%esi
   1400561a9:	c1 fe 1f             	sar    $0x1f,%esi
   1400561ac:	c1 fa 09             	sar    $0x9,%edx
   1400561af:	c1 fa 11             	sar    $0x11,%edx
   1400561b2:	d1 fe                	sar    $1,%esi
   1400561b4:	c1 fa 02             	sar    $0x2,%edx
   1400561b7:	c1 fa 07             	sar    $0x7,%edx
   1400561ba:	c1 fe 1f             	sar    $0x1f,%esi
   1400561bd:	c1 fe 11             	sar    $0x11,%esi
   1400561c0:	c1 fa 07             	sar    $0x7,%edx
   1400561c3:	c1 fe 04             	sar    $0x4,%esi
   1400561c6:	c1 fe 11             	sar    $0x11,%esi
   1400561c9:	c1 fa 1f             	sar    $0x1f,%edx
   1400561cc:	c1 fe 1f             	sar    $0x1f,%esi
   1400561cf:	c1 fe 15             	sar    $0x15,%esi
   1400561d2:	c1 fa 09             	sar    $0x9,%edx
   1400561d5:	c1 fe 08             	sar    $0x8,%esi
   1400561d8:	c1 fa 04             	sar    $0x4,%edx
   1400561db:	c1 fa 0d             	sar    $0xd,%edx
   1400561de:	c1 fa 05             	sar    $0x5,%edx
   1400561e1:	c1 fa 08             	sar    $0x8,%edx
   1400561e4:	c1 fa 07             	sar    $0x7,%edx
   1400561e7:	c1 fa 0d             	sar    $0xd,%edx
   1400561ea:	c1 fa 02             	sar    $0x2,%edx
   1400561ed:	c1 fe 02             	sar    $0x2,%esi
   1400561f0:	c1 fe 07             	sar    $0x7,%esi
   1400561f3:	c1 fe 09             	sar    $0x9,%esi
   1400561f6:	c1 fa 05             	sar    $0x5,%edx
   1400561f9:	c1 fa 0b             	sar    $0xb,%edx
   1400561fc:	c1 fe 02             	sar    $0x2,%esi
   1400561ff:	31 f2                	xor    %esi,%edx
   140056201:	81 f2 8f 5c e5 2a    	xor    $0x2ae55c8f,%edx
   140056207:	c1 fa 1f             	sar    $0x1f,%edx
   14005620a:	89 d6                	mov    %edx,%esi
   14005620c:	d1 fe                	sar    $1,%esi
   14005620e:	31 d6                	xor    %edx,%esi
   140056210:	85 f6                	test   %esi,%esi
   140056212:	75 09                	jne    0x14005621d
   140056214:	48 c1 ce 20          	ror    $0x20,%rsi
   140056218:	8b 14 74             	mov    (%rsp,%rsi,2),%edx
   14005621b:	eb 0f                	jmp    0x14005622c
   14005621d:	c1 fa 0d             	sar    $0xd,%edx
   140056220:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140056227:	01 00 00 
   14005622a:	8b 16                	mov    (%rsi),%edx
   14005622c:	5e                   	pop    %rsi
   14005622d:	5a                   	pop    %rdx
   14005622e:	9d                   	popf
   14005622f:	35 ef be ad de       	xor    $0xdeadbeef,%eax
   140056234:	f6 c2 01             	test   $0x1,%dl
   140056237:	0f 45 d8             	cmovne %eax,%ebx
   14005623a:	9c                   	pushf
   14005623b:	50                   	push   %rax
   14005623c:	51                   	push   %rcx
   14005623d:	b8 87 65 35 38       	mov    $0x38356587,%eax
   140056242:	89 c1                	mov    %eax,%ecx
   140056244:	c1 f8 1f             	sar    $0x1f,%eax
   140056247:	c1 f8 02             	sar    $0x2,%eax
   14005624a:	c1 f9 0f             	sar    $0xf,%ecx
   14005624d:	c1 f9 02             	sar    $0x2,%ecx
   140056250:	c1 f9 0d             	sar    $0xd,%ecx
   140056253:	c1 f8 07             	sar    $0x7,%eax
   140056256:	c1 f8 09             	sar    $0x9,%eax
   140056259:	c1 f9 08             	sar    $0x8,%ecx
   14005625c:	c1 f9 1f             	sar    $0x1f,%ecx
   14005625f:	c1 f8 03             	sar    $0x3,%eax
   140056262:	c1 f8 03             	sar    $0x3,%eax
   140056265:	c1 f9 04             	sar    $0x4,%ecx
   140056268:	c1 f8 02             	sar    $0x2,%eax
   14005626b:	c1 f8 08             	sar    $0x8,%eax
   14005626e:	c1 f8 05             	sar    $0x5,%eax
   140056271:	c1 f9 1f             	sar    $0x1f,%ecx
   140056274:	c1 f9 11             	sar    $0x11,%ecx
   140056277:	c1 f8 07             	sar    $0x7,%eax
   14005627a:	c1 f9 0f             	sar    $0xf,%ecx
   14005627d:	c1 f8 0d             	sar    $0xd,%eax
   140056280:	c1 f8 0d             	sar    $0xd,%eax
   140056283:	c1 f8 05             	sar    $0x5,%eax
   140056286:	d1 f9                	sar    $1,%ecx
   140056288:	c1 f9 0f             	sar    $0xf,%ecx
   14005628b:	c1 f9 11             	sar    $0x11,%ecx
   14005628e:	c1 f9 1f             	sar    $0x1f,%ecx
   140056291:	c1 f9 05             	sar    $0x5,%ecx
   140056294:	d1 f8                	sar    $1,%eax
   140056296:	31 c8                	xor    %ecx,%eax
   140056298:	35 17 58 8a 55       	xor    $0x558a5817,%eax
   14005629d:	c1 f8 1f             	sar    $0x1f,%eax
   1400562a0:	8d 48 01             	lea    0x1(%rax),%ecx
   1400562a3:	0f af c8             	imul   %eax,%ecx
   1400562a6:	85 c9                	test   %ecx,%ecx
   1400562a8:	75 09                	jne    0x1400562b3
   1400562aa:	48 c1 e1 2a          	shl    $0x2a,%rcx
   1400562ae:	8b 04 4c             	mov    (%rsp,%rcx,2),%eax
   1400562b1:	eb 0f                	jmp    0x1400562c2
   1400562b3:	c1 f8 0d             	sar    $0xd,%eax
   1400562b6:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400562bd:	01 00 00 
   1400562c0:	8b 01                	mov    (%rcx),%eax
   1400562c2:	59                   	pop    %rcx
   1400562c3:	58                   	pop    %rax
   1400562c4:	9d                   	popf
   1400562c5:	b8 b2 24 00 00       	mov    $0x24b2,%eax
   1400562ca:	9c                   	pushf
   1400562cb:	51                   	push   %rcx
   1400562cc:	41 50                	push   %r8
   1400562ce:	48 b9 27 3e 86 d8 be 	movabs $0x4c84a4bed8863e27,%rcx
   1400562d5:	a4 84 4c 
   1400562d8:	49 89 c8             	mov    %rcx,%r8
   1400562db:	49 c1 f8 09          	sar    $0x9,%r8
   1400562df:	48 c1 f9 15          	sar    $0x15,%rcx
   1400562e3:	48 c1 f9 07          	sar    $0x7,%rcx
   1400562e7:	49 c1 f8 15          	sar    $0x15,%r8
   1400562eb:	49 c1 f8 1b          	sar    $0x1b,%r8
   1400562ef:	49 c1 f8 09          	sar    $0x9,%r8
   1400562f3:	48 d1 f9             	sar    $1,%rcx
   1400562f6:	49 c1 f8 04          	sar    $0x4,%r8
   1400562fa:	48 c1 f9 0d          	sar    $0xd,%rcx
   1400562fe:	48 c1 f9 05          	sar    $0x5,%rcx
   140056302:	49 c1 f8 15          	sar    $0x15,%r8
   140056306:	49 c1 f8 15          	sar    $0x15,%r8
   14005630a:	48 c1 f9 04          	sar    $0x4,%rcx
   14005630e:	48 c1 f9 11          	sar    $0x11,%rcx
   140056312:	49 c1 f8 02          	sar    $0x2,%r8
   140056316:	48 c1 f9 04          	sar    $0x4,%rcx
   14005631a:	48 c1 f9 02          	sar    $0x2,%rcx
   14005631e:	49 c1 f8 0b          	sar    $0xb,%r8
   140056322:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056326:	48 c1 f9 1b          	sar    $0x1b,%rcx
   14005632a:	48 c1 f9 15          	sar    $0x15,%rcx
   14005632e:	49 c1 f8 11          	sar    $0x11,%r8
   140056332:	49 c1 f8 0b          	sar    $0xb,%r8
   140056336:	49 c1 f8 04          	sar    $0x4,%r8
   14005633a:	48 c1 f9 11          	sar    $0x11,%rcx
   14005633e:	48 c1 f9 0d          	sar    $0xd,%rcx
   140056342:	49 c1 f8 0b          	sar    $0xb,%r8
   140056346:	49 c1 f8 02          	sar    $0x2,%r8
   14005634a:	49 c1 f8 03          	sar    $0x3,%r8
   14005634e:	48 c1 f9 03          	sar    $0x3,%rcx
   140056352:	48 c1 f9 15          	sar    $0x15,%rcx
   140056356:	49 c1 f8 09          	sar    $0x9,%r8
   14005635a:	49 c1 f8 09          	sar    $0x9,%r8
   14005635e:	48 c1 f9 02          	sar    $0x2,%rcx
   140056362:	48 c1 f9 09          	sar    $0x9,%rcx
   140056366:	49 c1 f8 04          	sar    $0x4,%r8
   14005636a:	48 c1 f9 02          	sar    $0x2,%rcx
   14005636e:	49 c1 f8 1b          	sar    $0x1b,%r8
   140056372:	4c 31 c1             	xor    %r8,%rcx
   140056375:	49 b8 77 62 60 f6 18 	movabs $0x56990018f6606277,%r8
   14005637c:	00 99 56 
   14005637f:	4c 31 c1             	xor    %r8,%rcx
   140056382:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140056386:	49 89 c8             	mov    %rcx,%r8
   140056389:	49 ff c0             	inc    %r8
   14005638c:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
   140056390:	4d 85 c0             	test   %r8,%r8
   140056393:	75 0a                	jne    0x14005639f
   140056395:	49 c1 e0 26          	shl    $0x26,%r8
   140056399:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   14005639d:	eb 11                	jmp    0x1400563b0
   14005639f:	48 c1 f9 11          	sar    $0x11,%rcx
   1400563a3:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   1400563aa:	01 00 00 
   1400563ad:	49 8b 08             	mov    (%r8),%rcx
   1400563b0:	41 58                	pop    %r8
   1400563b2:	59                   	pop    %rcx
   1400563b3:	9d                   	popf
   1400563b4:	e9 e7 c0 ff ff       	jmp    0x1400524a0
   1400563b9:	9c                   	pushf
   1400563ba:	52                   	push   %rdx
   1400563bb:	56                   	push   %rsi
   1400563bc:	ba 0e b8 6e 36       	mov    $0x366eb80e,%edx
   1400563c1:	89 d6                	mov    %edx,%esi
   1400563c3:	c1 fe 15             	sar    $0x15,%esi
   1400563c6:	d1 fe                	sar    $1,%esi
   1400563c8:	d1 fa                	sar    $1,%edx
   1400563ca:	c1 fe 0b             	sar    $0xb,%esi
   1400563cd:	c1 fe 04             	sar    $0x4,%esi
   1400563d0:	c1 fa 0f             	sar    $0xf,%edx
   1400563d3:	c1 fe 07             	sar    $0x7,%esi
   1400563d6:	c1 fe 0d             	sar    $0xd,%esi
   1400563d9:	c1 fa 1f             	sar    $0x1f,%edx
   1400563dc:	c1 fa 0b             	sar    $0xb,%edx
   1400563df:	c1 fa 07             	sar    $0x7,%edx
   1400563e2:	c1 fa 0d             	sar    $0xd,%edx
   1400563e5:	c1 fe 08             	sar    $0x8,%esi
   1400563e8:	c1 fa 07             	sar    $0x7,%edx
   1400563eb:	c1 fe 09             	sar    $0x9,%esi
   1400563ee:	c1 fa 04             	sar    $0x4,%edx
   1400563f1:	c1 fa 02             	sar    $0x2,%edx
   1400563f4:	c1 fe 07             	sar    $0x7,%esi
   1400563f7:	c1 fa 15             	sar    $0x15,%edx
   1400563fa:	c1 fa 03             	sar    $0x3,%edx
   1400563fd:	c1 fe 15             	sar    $0x15,%esi
   140056400:	c1 fe 1f             	sar    $0x1f,%esi
   140056403:	c1 fe 05             	sar    $0x5,%esi
   140056406:	c1 fe 0f             	sar    $0xf,%esi
   140056409:	c1 fa 0f             	sar    $0xf,%edx
   14005640c:	c1 fe 07             	sar    $0x7,%esi
   14005640f:	c1 fe 08             	sar    $0x8,%esi
   140056412:	c1 fe 05             	sar    $0x5,%esi
   140056415:	d1 fa                	sar    $1,%edx
   140056417:	c1 fe 04             	sar    $0x4,%esi
   14005641a:	c1 fa 08             	sar    $0x8,%edx
   14005641d:	c1 fe 05             	sar    $0x5,%esi
   140056420:	c1 fe 09             	sar    $0x9,%esi
   140056423:	c1 fa 11             	sar    $0x11,%edx
   140056426:	c1 fe 0d             	sar    $0xd,%esi
   140056429:	c1 fa 0d             	sar    $0xd,%edx
   14005642c:	31 f2                	xor    %esi,%edx
   14005642e:	81 f2 5a 11 f6 57    	xor    $0x57f6115a,%edx
   140056434:	c1 fa 1f             	sar    $0x1f,%edx
   140056437:	89 d6                	mov    %edx,%esi
   140056439:	d1 fe                	sar    $1,%esi
   14005643b:	31 d6                	xor    %edx,%esi
   14005643d:	85 f6                	test   %esi,%esi
   14005643f:	75 09                	jne    0x14005644a
   140056441:	48 c1 e6 26          	shl    $0x26,%rsi
   140056445:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   140056448:	eb 0f                	jmp    0x140056459
   14005644a:	c1 fa 0d             	sar    $0xd,%edx
   14005644d:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140056454:	01 00 00 
   140056457:	8b 16                	mov    (%rsi),%edx
   140056459:	5e                   	pop    %rsi
   14005645a:	5a                   	pop    %rdx
   14005645b:	9d                   	popf
   14005645c:	31 c0                	xor    %eax,%eax
   14005645e:	9c                   	pushf
   14005645f:	51                   	push   %rcx
   140056460:	41 50                	push   %r8
   140056462:	b9 83 c1 08 58       	mov    $0x5808c183,%ecx
   140056467:	41 89 c8             	mov    %ecx,%r8d
   14005646a:	c1 f9 0d             	sar    $0xd,%ecx
   14005646d:	41 c1 f8 0f          	sar    $0xf,%r8d
   140056471:	41 c1 f8 08          	sar    $0x8,%r8d
   140056475:	41 c1 f8 11          	sar    $0x11,%r8d
   140056479:	41 d1 f8             	sar    $1,%r8d
   14005647c:	c1 f9 07             	sar    $0x7,%ecx
   14005647f:	c1 f9 0f             	sar    $0xf,%ecx
   140056482:	41 c1 f8 07          	sar    $0x7,%r8d
   140056486:	c1 f9 04             	sar    $0x4,%ecx
   140056489:	41 c1 f8 07          	sar    $0x7,%r8d
   14005648d:	c1 f9 0b             	sar    $0xb,%ecx
   140056490:	c1 f9 04             	sar    $0x4,%ecx
   140056493:	41 c1 f8 03          	sar    $0x3,%r8d
   140056497:	c1 f9 05             	sar    $0x5,%ecx
   14005649a:	41 c1 f8 05          	sar    $0x5,%r8d
   14005649e:	41 c1 f8 05          	sar    $0x5,%r8d
   1400564a2:	c1 f9 0d             	sar    $0xd,%ecx
   1400564a5:	c1 f9 1f             	sar    $0x1f,%ecx
   1400564a8:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400564ac:	c1 f9 07             	sar    $0x7,%ecx
   1400564af:	41 c1 f8 09          	sar    $0x9,%r8d
   1400564b3:	c1 f9 04             	sar    $0x4,%ecx
   1400564b6:	c1 f9 03             	sar    $0x3,%ecx
   1400564b9:	41 c1 f8 04          	sar    $0x4,%r8d
   1400564bd:	c1 f9 1f             	sar    $0x1f,%ecx
   1400564c0:	c1 f9 0f             	sar    $0xf,%ecx
   1400564c3:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400564c7:	41 c1 f8 11          	sar    $0x11,%r8d
   1400564cb:	d1 f9                	sar    $1,%ecx
   1400564cd:	c1 f9 0b             	sar    $0xb,%ecx
   1400564d0:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400564d4:	c1 f9 11             	sar    $0x11,%ecx
   1400564d7:	41 c1 f8 15          	sar    $0x15,%r8d
   1400564db:	c1 f9 05             	sar    $0x5,%ecx
   1400564de:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400564e2:	c1 f9 1f             	sar    $0x1f,%ecx
   1400564e5:	c1 f9 09             	sar    $0x9,%ecx
   1400564e8:	41 c1 f8 07          	sar    $0x7,%r8d
   1400564ec:	44 31 c1             	xor    %r8d,%ecx
   1400564ef:	81 f1 99 01 e3 4f    	xor    $0x4fe30199,%ecx
   1400564f5:	c1 f9 1f             	sar    $0x1f,%ecx
   1400564f8:	41 89 c8             	mov    %ecx,%r8d
   1400564fb:	41 ff c0             	inc    %r8d
   1400564fe:	41 83 e0 fe          	and    $0xfffffffe,%r8d
   140056502:	45 85 c0             	test   %r8d,%r8d
   140056505:	75 0a                	jne    0x140056511
   140056507:	49 c1 e0 26          	shl    $0x26,%r8
   14005650b:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   14005650f:	eb 10                	jmp    0x140056521
   140056511:	c1 f9 0d             	sar    $0xd,%ecx
   140056514:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   14005651b:	01 00 00 
   14005651e:	41 8b 08             	mov    (%r8),%ecx
   140056521:	41 58                	pop    %r8
   140056523:	59                   	pop    %rcx
   140056524:	9d                   	popf
   140056525:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
   140056529:	9c                   	pushf
   14005652a:	57                   	push   %rdi
   14005652b:	53                   	push   %rbx
   14005652c:	bf a2 af 5e 46       	mov    $0x465eafa2,%edi
   140056531:	89 fb                	mov    %edi,%ebx
   140056533:	c1 ff 03             	sar    $0x3,%edi
   140056536:	c1 ff 02             	sar    $0x2,%edi
   140056539:	d1 fb                	sar    $1,%ebx
   14005653b:	c1 ff 05             	sar    $0x5,%edi
   14005653e:	c1 ff 15             	sar    $0x15,%edi
   140056541:	c1 fb 07             	sar    $0x7,%ebx
   140056544:	c1 fb 07             	sar    $0x7,%ebx
   140056547:	c1 ff 04             	sar    $0x4,%edi
   14005654a:	d1 fb                	sar    $1,%ebx
   14005654c:	c1 ff 05             	sar    $0x5,%edi
   14005654f:	c1 fb 0f             	sar    $0xf,%ebx
   140056552:	c1 fb 04             	sar    $0x4,%ebx
   140056555:	c1 fb 0b             	sar    $0xb,%ebx
   140056558:	c1 fb 0d             	sar    $0xd,%ebx
   14005655b:	c1 fb 02             	sar    $0x2,%ebx
   14005655e:	d1 ff                	sar    $1,%edi
   140056560:	c1 ff 04             	sar    $0x4,%edi
   140056563:	c1 fb 05             	sar    $0x5,%ebx
   140056566:	c1 ff 0b             	sar    $0xb,%edi
   140056569:	c1 ff 0d             	sar    $0xd,%edi
   14005656c:	d1 ff                	sar    $1,%edi
   14005656e:	c1 fb 0d             	sar    $0xd,%ebx
   140056571:	c1 ff 1f             	sar    $0x1f,%edi
   140056574:	d1 fb                	sar    $1,%ebx
   140056576:	c1 fb 1f             	sar    $0x1f,%ebx
   140056579:	c1 fb 0d             	sar    $0xd,%ebx
   14005657c:	c1 fb 07             	sar    $0x7,%ebx
   14005657f:	c1 ff 05             	sar    $0x5,%edi
   140056582:	c1 ff 11             	sar    $0x11,%edi
   140056585:	31 df                	xor    %ebx,%edi
   140056587:	81 f7 cf 7a f4 5e    	xor    $0x5ef47acf,%edi
   14005658d:	c1 ff 1f             	sar    $0x1f,%edi
   140056590:	89 fb                	mov    %edi,%ebx
   140056592:	ff c3                	inc    %ebx
   140056594:	83 e3 fe             	and    $0xfffffffe,%ebx
   140056597:	85 db                	test   %ebx,%ebx
   140056599:	75 09                	jne    0x1400565a4
   14005659b:	48 c1 e3 2a          	shl    $0x2a,%rbx
   14005659f:	8b 3c 1c             	mov    (%rsp,%rbx,1),%edi
   1400565a2:	eb 0f                	jmp    0x1400565b3
   1400565a4:	c1 ff 0d             	sar    $0xd,%edi
   1400565a7:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   1400565ae:	01 00 00 
   1400565b1:	8b 3b                	mov    (%rbx),%edi
   1400565b3:	5b                   	pop    %rbx
   1400565b4:	5f                   	pop    %rdi
   1400565b5:	9d                   	popf
   1400565b6:	89 c2                	mov    %eax,%edx
   1400565b8:	9c                   	pushf
   1400565b9:	57                   	push   %rdi
   1400565ba:	53                   	push   %rbx
   1400565bb:	bf a4 f6 e6 63       	mov    $0x63e6f6a4,%edi
   1400565c0:	89 fb                	mov    %edi,%ebx
   1400565c2:	c1 fb 05             	sar    $0x5,%ebx
   1400565c5:	c1 fb 0f             	sar    $0xf,%ebx
   1400565c8:	c1 fb 02             	sar    $0x2,%ebx
   1400565cb:	d1 ff                	sar    $1,%edi
   1400565cd:	c1 fb 02             	sar    $0x2,%ebx
   1400565d0:	c1 ff 09             	sar    $0x9,%edi
   1400565d3:	c1 fb 09             	sar    $0x9,%ebx
   1400565d6:	c1 ff 11             	sar    $0x11,%edi
   1400565d9:	c1 fb 02             	sar    $0x2,%ebx
   1400565dc:	c1 fb 09             	sar    $0x9,%ebx
   1400565df:	c1 ff 08             	sar    $0x8,%edi
   1400565e2:	c1 fb 0d             	sar    $0xd,%ebx
   1400565e5:	c1 fb 07             	sar    $0x7,%ebx
   1400565e8:	c1 fb 07             	sar    $0x7,%ebx
   1400565eb:	c1 fb 0f             	sar    $0xf,%ebx
   1400565ee:	c1 fb 0b             	sar    $0xb,%ebx
   1400565f1:	d1 ff                	sar    $1,%edi
   1400565f3:	c1 ff 1f             	sar    $0x1f,%edi
   1400565f6:	c1 ff 0d             	sar    $0xd,%edi
   1400565f9:	d1 fb                	sar    $1,%ebx
   1400565fb:	c1 fb 05             	sar    $0x5,%ebx
   1400565fe:	d1 fb                	sar    $1,%ebx
   140056600:	c1 ff 0d             	sar    $0xd,%edi
   140056603:	c1 fb 03             	sar    $0x3,%ebx
   140056606:	c1 fb 15             	sar    $0x15,%ebx
   140056609:	d1 fb                	sar    $1,%ebx
   14005660b:	c1 fb 15             	sar    $0x15,%ebx
   14005660e:	c1 fb 05             	sar    $0x5,%ebx
   140056611:	d1 ff                	sar    $1,%edi
   140056613:	d1 fb                	sar    $1,%ebx
   140056615:	d1 ff                	sar    $1,%edi
   140056617:	d1 fb                	sar    $1,%ebx
   140056619:	c1 ff 08             	sar    $0x8,%edi
   14005661c:	c1 ff 0d             	sar    $0xd,%edi
   14005661f:	c1 fb 0f             	sar    $0xf,%ebx
   140056622:	c1 fb 1f             	sar    $0x1f,%ebx
   140056625:	c1 ff 04             	sar    $0x4,%edi
   140056628:	c1 fb 0b             	sar    $0xb,%ebx
   14005662b:	31 df                	xor    %ebx,%edi
   14005662d:	81 f7 45 04 81 4c    	xor    $0x4c810445,%edi
   140056633:	c1 ff 1f             	sar    $0x1f,%edi
   140056636:	89 fb                	mov    %edi,%ebx
   140056638:	ff c3                	inc    %ebx
   14005663a:	83 e3 fe             	and    $0xfffffffe,%ebx
   14005663d:	85 db                	test   %ebx,%ebx
   14005663f:	75 08                	jne    0x140056649
   140056641:	48 0f cb             	bswap  %rbx
   140056644:	8b 3c 5c             	mov    (%rsp,%rbx,2),%edi
   140056647:	eb 0f                	jmp    0x140056658
   140056649:	c1 ff 0d             	sar    $0xd,%edi
   14005664c:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   140056653:	01 00 00 
   140056656:	8b 3b                	mov    (%rbx),%edi
   140056658:	5b                   	pop    %rbx
   140056659:	5f                   	pop    %rdi
   14005665a:	9d                   	popf
   14005665b:	c0 ea 03             	shr    $0x3,%dl
   14005665e:	9c                   	pushf
   14005665f:	52                   	push   %rdx
   140056660:	56                   	push   %rsi
   140056661:	ba 51 83 4b 7f       	mov    $0x7f4b8351,%edx
   140056666:	89 d6                	mov    %edx,%esi
   140056668:	c1 fe 0d             	sar    $0xd,%esi
   14005666b:	c1 fa 0b             	sar    $0xb,%edx
   14005666e:	c1 fa 08             	sar    $0x8,%edx
   140056671:	d1 fe                	sar    $1,%esi
   140056673:	c1 fe 1f             	sar    $0x1f,%esi
   140056676:	c1 fa 0b             	sar    $0xb,%edx
   140056679:	c1 fe 04             	sar    $0x4,%esi
   14005667c:	c1 fe 0b             	sar    $0xb,%esi
   14005667f:	c1 fe 0d             	sar    $0xd,%esi
   140056682:	c1 fe 11             	sar    $0x11,%esi
   140056685:	c1 fe 0d             	sar    $0xd,%esi
   140056688:	c1 fa 0f             	sar    $0xf,%edx
   14005668b:	c1 fa 07             	sar    $0x7,%edx
   14005668e:	c1 fe 08             	sar    $0x8,%esi
   140056691:	c1 fe 04             	sar    $0x4,%esi
   140056694:	c1 fa 04             	sar    $0x4,%edx
   140056697:	c1 fa 15             	sar    $0x15,%edx
   14005669a:	c1 fe 04             	sar    $0x4,%esi
   14005669d:	c1 fa 0b             	sar    $0xb,%edx
   1400566a0:	c1 fe 03             	sar    $0x3,%esi
   1400566a3:	c1 fa 07             	sar    $0x7,%edx
   1400566a6:	c1 fe 04             	sar    $0x4,%esi
   1400566a9:	c1 fa 15             	sar    $0x15,%edx
   1400566ac:	c1 fa 05             	sar    $0x5,%edx
   1400566af:	c1 fe 04             	sar    $0x4,%esi
   1400566b2:	c1 fa 0d             	sar    $0xd,%edx
   1400566b5:	d1 fe                	sar    $1,%esi
   1400566b7:	c1 fa 15             	sar    $0x15,%edx
   1400566ba:	31 f2                	xor    %esi,%edx
   1400566bc:	81 f2 36 9e 8b 68    	xor    $0x688b9e36,%edx
   1400566c2:	c1 fa 1f             	sar    $0x1f,%edx
   1400566c5:	89 d6                	mov    %edx,%esi
   1400566c7:	ff c6                	inc    %esi
   1400566c9:	83 e6 fe             	and    $0xfffffffe,%esi
   1400566cc:	85 f6                	test   %esi,%esi
   1400566ce:	75 08                	jne    0x1400566d8
   1400566d0:	48 0f ce             	bswap  %rsi
   1400566d3:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   1400566d6:	eb 0f                	jmp    0x1400566e7
   1400566d8:	c1 fa 0d             	sar    $0xd,%edx
   1400566db:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   1400566e2:	01 00 00 
   1400566e5:	8b 16                	mov    (%rsi),%edx
   1400566e7:	5e                   	pop    %rsi
   1400566e8:	5a                   	pop    %rdx
   1400566e9:	9d                   	popf
   1400566ea:	c0 e0 02             	shl    $0x2,%al
   1400566ed:	9c                   	pushf
   1400566ee:	51                   	push   %rcx
   1400566ef:	41 50                	push   %r8
   1400566f1:	b9 de 23 73 37       	mov    $0x377323de,%ecx
   1400566f6:	41 89 c8             	mov    %ecx,%r8d
   1400566f9:	d1 f9                	sar    $1,%ecx
   1400566fb:	c1 f9 08             	sar    $0x8,%ecx
   1400566fe:	41 c1 f8 0f          	sar    $0xf,%r8d
   140056702:	c1 f9 11             	sar    $0x11,%ecx
   140056705:	41 c1 f8 05          	sar    $0x5,%r8d
   140056709:	41 c1 f8 07          	sar    $0x7,%r8d
   14005670d:	41 c1 f8 15          	sar    $0x15,%r8d
   140056711:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056715:	41 c1 f8 0d          	sar    $0xd,%r8d
   140056719:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005671d:	41 c1 f8 08          	sar    $0x8,%r8d
   140056721:	41 c1 f8 11          	sar    $0x11,%r8d
   140056725:	41 d1 f8             	sar    $1,%r8d
   140056728:	c1 f9 08             	sar    $0x8,%ecx
   14005672b:	c1 f9 03             	sar    $0x3,%ecx
   14005672e:	c1 f9 1f             	sar    $0x1f,%ecx
   140056731:	c1 f9 15             	sar    $0x15,%ecx
   140056734:	41 c1 f8 07          	sar    $0x7,%r8d
   140056738:	41 c1 f8 0f          	sar    $0xf,%r8d
   14005673c:	c1 f9 0d             	sar    $0xd,%ecx
   14005673f:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140056743:	c1 f9 03             	sar    $0x3,%ecx
   140056746:	41 c1 f8 05          	sar    $0x5,%r8d
   14005674a:	c1 f9 0d             	sar    $0xd,%ecx
   14005674d:	44 31 c1             	xor    %r8d,%ecx
   140056750:	81 f1 a5 56 c6 45    	xor    $0x45c656a5,%ecx
   140056756:	c1 f9 1f             	sar    $0x1f,%ecx
   140056759:	41 89 c8             	mov    %ecx,%r8d
   14005675c:	41 d1 f8             	sar    $1,%r8d
   14005675f:	41 31 c8             	xor    %ecx,%r8d
   140056762:	45 85 c0             	test   %r8d,%r8d
   140056765:	75 0a                	jne    0x140056771
   140056767:	49 c1 c8 20          	ror    $0x20,%r8
   14005676b:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   14005676f:	eb 10                	jmp    0x140056781
   140056771:	c1 f9 0d             	sar    $0xd,%ecx
   140056774:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   14005677b:	01 00 00 
   14005677e:	41 8b 08             	mov    (%r8),%ecx
   140056781:	41 58                	pop    %r8
   140056783:	59                   	pop    %rcx
   140056784:	9d                   	popf
   140056785:	46 8d 1c d5 00 00 00 	lea    0x0(,%r10,8),%r11d
   14005678c:	00 
   14005678d:	9c                   	pushf
   14005678e:	50                   	push   %rax
   14005678f:	52                   	push   %rdx
   140056790:	b8 4d 80 16 7e       	mov    $0x7e16804d,%eax
   140056795:	89 c2                	mov    %eax,%edx
   140056797:	c1 f8 07             	sar    $0x7,%eax
   14005679a:	c1 fa 03             	sar    $0x3,%edx
   14005679d:	c1 fa 0d             	sar    $0xd,%edx
   1400567a0:	c1 fa 11             	sar    $0x11,%edx
   1400567a3:	c1 f8 08             	sar    $0x8,%eax
   1400567a6:	c1 fa 04             	sar    $0x4,%edx
   1400567a9:	d1 f8                	sar    $1,%eax
   1400567ab:	c1 f8 05             	sar    $0x5,%eax
   1400567ae:	c1 fa 07             	sar    $0x7,%edx
   1400567b1:	c1 f8 02             	sar    $0x2,%eax
   1400567b4:	c1 f8 04             	sar    $0x4,%eax
   1400567b7:	c1 f8 04             	sar    $0x4,%eax
   1400567ba:	c1 fa 05             	sar    $0x5,%edx
   1400567bd:	c1 f8 0f             	sar    $0xf,%eax
   1400567c0:	c1 fa 03             	sar    $0x3,%edx
   1400567c3:	d1 f8                	sar    $1,%eax
   1400567c5:	c1 f8 02             	sar    $0x2,%eax
   1400567c8:	c1 f8 1f             	sar    $0x1f,%eax
   1400567cb:	c1 f8 0b             	sar    $0xb,%eax
   1400567ce:	c1 fa 0b             	sar    $0xb,%edx
   1400567d1:	c1 fa 09             	sar    $0x9,%edx
   1400567d4:	c1 f8 0d             	sar    $0xd,%eax
   1400567d7:	c1 fa 15             	sar    $0x15,%edx
   1400567da:	c1 fa 0d             	sar    $0xd,%edx
   1400567dd:	d1 f8                	sar    $1,%eax
   1400567df:	31 d0                	xor    %edx,%eax
   1400567e1:	35 a8 b5 6c 79       	xor    $0x796cb5a8,%eax
   1400567e6:	c1 f8 1f             	sar    $0x1f,%eax
   1400567e9:	89 c2                	mov    %eax,%edx
   1400567eb:	ff c2                	inc    %edx
   1400567ed:	83 e2 fe             	and    $0xfffffffe,%edx
   1400567f0:	85 d2                	test   %edx,%edx
   1400567f2:	75 09                	jne    0x1400567fd
   1400567f4:	48 c1 e2 28          	shl    $0x28,%rdx
   1400567f8:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   1400567fb:	eb 0f                	jmp    0x14005680c
   1400567fd:	c1 f8 0d             	sar    $0xd,%eax
   140056800:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140056807:	01 00 00 
   14005680a:	8b 02                	mov    (%rdx),%eax
   14005680c:	5a                   	pop    %rdx
   14005680d:	58                   	pop    %rax
   14005680e:	9d                   	popf
   14005680f:	45 29 d3             	sub    %r10d,%r11d
   140056812:	9c                   	pushf
   140056813:	51                   	push   %rcx
   140056814:	41 50                	push   %r8
   140056816:	48 b9 d8 3e 74 67 1b 	movabs $0x74c41d1b67743ed8,%rcx
   14005681d:	1d c4 74 
   140056820:	49 89 c8             	mov    %rcx,%r8
   140056823:	48 c1 f9 03          	sar    $0x3,%rcx
   140056827:	49 c1 f8 09          	sar    $0x9,%r8
   14005682b:	48 c1 f9 1f          	sar    $0x1f,%rcx
   14005682f:	48 c1 f9 04          	sar    $0x4,%rcx
   140056833:	49 c1 f8 03          	sar    $0x3,%r8
   140056837:	49 c1 f8 02          	sar    $0x2,%r8
   14005683b:	48 c1 f9 0b          	sar    $0xb,%rcx
   14005683f:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056843:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056847:	49 c1 f8 1f          	sar    $0x1f,%r8
   14005684b:	48 c1 f9 1b          	sar    $0x1b,%rcx
   14005684f:	48 c1 f9 04          	sar    $0x4,%rcx
   140056853:	48 c1 f9 02          	sar    $0x2,%rcx
   140056857:	49 c1 f8 11          	sar    $0x11,%r8
   14005685b:	48 c1 f9 0d          	sar    $0xd,%rcx
   14005685f:	49 c1 f8 1b          	sar    $0x1b,%r8
   140056863:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140056867:	49 c1 f8 05          	sar    $0x5,%r8
   14005686b:	48 c1 f9 11          	sar    $0x11,%rcx
   14005686f:	49 c1 f8 05          	sar    $0x5,%r8
   140056873:	49 c1 f8 05          	sar    $0x5,%r8
   140056877:	49 c1 f8 0b          	sar    $0xb,%r8
   14005687b:	48 d1 f9             	sar    $1,%rcx
   14005687e:	49 c1 f8 11          	sar    $0x11,%r8
   140056882:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056886:	49 c1 f8 1b          	sar    $0x1b,%r8
   14005688a:	48 c1 f9 04          	sar    $0x4,%rcx
   14005688e:	49 c1 f8 11          	sar    $0x11,%r8
   140056892:	49 c1 f8 09          	sar    $0x9,%r8
   140056896:	4c 31 c1             	xor    %r8,%rcx
   140056899:	49 b8 ed 16 61 f7 26 	movabs $0x6ed10326f76116ed,%r8
   1400568a0:	03 d1 6e 
   1400568a3:	4c 31 c1             	xor    %r8,%rcx
   1400568a6:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1400568aa:	49 89 c8             	mov    %rcx,%r8
   1400568ad:	49 ff c0             	inc    %r8
   1400568b0:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
   1400568b4:	4d 85 c0             	test   %r8,%r8
   1400568b7:	75 09                	jne    0x1400568c2
   1400568b9:	49 0f c8             	bswap  %r8
   1400568bc:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   1400568c0:	eb 11                	jmp    0x1400568d3
   1400568c2:	48 c1 f9 11          	sar    $0x11,%rcx
   1400568c6:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   1400568cd:	01 00 00 
   1400568d0:	49 8b 08             	mov    (%r8),%rcx
   1400568d3:	41 58                	pop    %r8
   1400568d5:	59                   	pop    %rcx
   1400568d6:	9d                   	popf
   1400568d7:	41 80 c3 4b          	add    $0x4b,%r11b
   1400568db:	9c                   	pushf
   1400568dc:	50                   	push   %rax
   1400568dd:	51                   	push   %rcx
   1400568de:	b8 5d 51 62 67       	mov    $0x6762515d,%eax
   1400568e3:	89 c1                	mov    %eax,%ecx
   1400568e5:	c1 f8 05             	sar    $0x5,%eax
   1400568e8:	c1 f9 0b             	sar    $0xb,%ecx
   1400568eb:	c1 f8 0b             	sar    $0xb,%eax
   1400568ee:	c1 f9 07             	sar    $0x7,%ecx
   1400568f1:	c1 f8 03             	sar    $0x3,%eax
   1400568f4:	c1 f9 0f             	sar    $0xf,%ecx
   1400568f7:	c1 f8 04             	sar    $0x4,%eax
   1400568fa:	c1 f9 1f             	sar    $0x1f,%ecx
   1400568fd:	c1 f9 0f             	sar    $0xf,%ecx
   140056900:	c1 f9 03             	sar    $0x3,%ecx
   140056903:	d1 f8                	sar    $1,%eax
   140056905:	c1 f9 02             	sar    $0x2,%ecx
   140056908:	c1 f9 02             	sar    $0x2,%ecx
   14005690b:	c1 f8 0b             	sar    $0xb,%eax
   14005690e:	c1 f8 04             	sar    $0x4,%eax
   140056911:	c1 f9 03             	sar    $0x3,%ecx
   140056914:	c1 f9 0f             	sar    $0xf,%ecx
   140056917:	c1 f9 15             	sar    $0x15,%ecx
   14005691a:	c1 f8 0b             	sar    $0xb,%eax
   14005691d:	c1 f8 11             	sar    $0x11,%eax
   140056920:	c1 f9 0f             	sar    $0xf,%ecx
   140056923:	c1 f8 0b             	sar    $0xb,%eax
   140056926:	c1 f9 07             	sar    $0x7,%ecx
   140056929:	c1 f8 0b             	sar    $0xb,%eax
   14005692c:	c1 f9 15             	sar    $0x15,%ecx
   14005692f:	c1 f9 02             	sar    $0x2,%ecx
   140056932:	c1 f8 1f             	sar    $0x1f,%eax
   140056935:	c1 f9 03             	sar    $0x3,%ecx
   140056938:	c1 f9 05             	sar    $0x5,%ecx
   14005693b:	c1 f8 09             	sar    $0x9,%eax
   14005693e:	c1 f9 08             	sar    $0x8,%ecx
   140056941:	c1 f9 04             	sar    $0x4,%ecx
   140056944:	c1 f8 02             	sar    $0x2,%eax
   140056947:	31 c8                	xor    %ecx,%eax
   140056949:	35 f0 b8 45 74       	xor    $0x7445b8f0,%eax
   14005694e:	c1 f8 1f             	sar    $0x1f,%eax
   140056951:	89 c1                	mov    %eax,%ecx
   140056953:	ff c1                	inc    %ecx
   140056955:	83 e1 fe             	and    $0xfffffffe,%ecx
   140056958:	85 c9                	test   %ecx,%ecx
   14005695a:	75 09                	jne    0x140056965
   14005695c:	48 c1 e1 2a          	shl    $0x2a,%rcx
   140056960:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   140056963:	eb 0f                	jmp    0x140056974
   140056965:	c1 f8 0d             	sar    $0xd,%eax
   140056968:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   14005696f:	01 00 00 
   140056972:	8b 01                	mov    (%rcx),%eax
   140056974:	59                   	pop    %rcx
   140056975:	58                   	pop    %rax
   140056976:	9d                   	popf
   140056977:	41 30 d3             	xor    %dl,%r11b
   14005697a:	9c                   	pushf
   14005697b:	41 51                	push   %r9
   14005697d:	41 52                	push   %r10
   14005697f:	41 b9 4a fe 6d 74    	mov    $0x746dfe4a,%r9d
   140056985:	45 89 ca             	mov    %r9d,%r10d
   140056988:	41 c1 f9 15          	sar    $0x15,%r9d
   14005698c:	41 c1 f9 07          	sar    $0x7,%r9d
   140056990:	41 c1 fa 08          	sar    $0x8,%r10d
   140056994:	41 c1 f9 0b          	sar    $0xb,%r9d
   140056998:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005699c:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400569a0:	41 c1 f9 15          	sar    $0x15,%r9d
   1400569a4:	41 c1 f9 04          	sar    $0x4,%r9d
   1400569a8:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400569ac:	41 c1 fa 0d          	sar    $0xd,%r10d
   1400569b0:	41 c1 fa 04          	sar    $0x4,%r10d
   1400569b4:	41 c1 f9 07          	sar    $0x7,%r9d
   1400569b8:	41 c1 f9 05          	sar    $0x5,%r9d
   1400569bc:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400569c0:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400569c4:	41 c1 fa 0f          	sar    $0xf,%r10d
   1400569c8:	41 c1 f9 09          	sar    $0x9,%r9d
   1400569cc:	41 c1 f9 15          	sar    $0x15,%r9d
   1400569d0:	41 c1 f9 15          	sar    $0x15,%r9d
   1400569d4:	41 c1 fa 09          	sar    $0x9,%r10d
   1400569d8:	41 c1 fa 0b          	sar    $0xb,%r10d
   1400569dc:	41 c1 f9 03          	sar    $0x3,%r9d
   1400569e0:	41 c1 f9 03          	sar    $0x3,%r9d
   1400569e4:	41 c1 fa 0b          	sar    $0xb,%r10d
   1400569e8:	41 c1 f9 11          	sar    $0x11,%r9d
   1400569ec:	41 c1 fa 08          	sar    $0x8,%r10d
   1400569f0:	41 c1 f9 11          	sar    $0x11,%r9d
   1400569f4:	41 c1 fa 0b          	sar    $0xb,%r10d
   1400569f8:	41 c1 fa 04          	sar    $0x4,%r10d
   1400569fc:	41 c1 fa 05          	sar    $0x5,%r10d
   140056a00:	41 d1 f9             	sar    $1,%r9d
   140056a03:	41 c1 fa 05          	sar    $0x5,%r10d
   140056a07:	41 c1 f9 11          	sar    $0x11,%r9d
   140056a0b:	41 c1 f9 0b          	sar    $0xb,%r9d
   140056a0f:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056a13:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056a17:	41 c1 f9 05          	sar    $0x5,%r9d
   140056a1b:	41 c1 fa 04          	sar    $0x4,%r10d
   140056a1f:	45 31 d1             	xor    %r10d,%r9d
   140056a22:	41 81 f1 84 fc 88 6a 	xor    $0x6a88fc84,%r9d
   140056a29:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056a2d:	45 89 ca             	mov    %r9d,%r10d
   140056a30:	41 ff c2             	inc    %r10d
   140056a33:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   140056a37:	45 85 d2             	test   %r10d,%r10d
   140056a3a:	75 0a                	jne    0x140056a46
   140056a3c:	49 c1 ca 20          	ror    $0x20,%r10
   140056a40:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   140056a44:	eb 11                	jmp    0x140056a57
   140056a46:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056a4a:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140056a51:	01 00 00 
   140056a54:	45 8b 0a             	mov    (%r10),%r9d
   140056a57:	41 5a                	pop    %r10
   140056a59:	41 59                	pop    %r9
   140056a5b:	9d                   	popf
   140056a5c:	41 30 c3             	xor    %al,%r11b
   140056a5f:	9c                   	pushf
   140056a60:	51                   	push   %rcx
   140056a61:	41 50                	push   %r8
   140056a63:	b9 7c fa 8a 76       	mov    $0x768afa7c,%ecx
   140056a68:	41 89 c8             	mov    %ecx,%r8d
   140056a6b:	41 c1 f8 04          	sar    $0x4,%r8d
   140056a6f:	c1 f9 0b             	sar    $0xb,%ecx
   140056a72:	41 c1 f8 0f          	sar    $0xf,%r8d
   140056a76:	41 c1 f8 11          	sar    $0x11,%r8d
   140056a7a:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140056a7e:	c1 f9 09             	sar    $0x9,%ecx
   140056a81:	c1 f9 11             	sar    $0x11,%ecx
   140056a84:	41 c1 f8 02          	sar    $0x2,%r8d
   140056a88:	c1 f9 05             	sar    $0x5,%ecx
   140056a8b:	c1 f9 11             	sar    $0x11,%ecx
   140056a8e:	41 c1 f8 0d          	sar    $0xd,%r8d
   140056a92:	c1 f9 0b             	sar    $0xb,%ecx
   140056a95:	41 c1 f8 04          	sar    $0x4,%r8d
   140056a99:	c1 f9 15             	sar    $0x15,%ecx
   140056a9c:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140056aa0:	41 c1 f8 07          	sar    $0x7,%r8d
   140056aa4:	c1 f9 11             	sar    $0x11,%ecx
   140056aa7:	41 c1 f8 04          	sar    $0x4,%r8d
   140056aab:	c1 f9 09             	sar    $0x9,%ecx
   140056aae:	41 c1 f8 11          	sar    $0x11,%r8d
   140056ab2:	c1 f9 04             	sar    $0x4,%ecx
   140056ab5:	41 c1 f8 0f          	sar    $0xf,%r8d
   140056ab9:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056abd:	c1 f9 02             	sar    $0x2,%ecx
   140056ac0:	44 31 c1             	xor    %r8d,%ecx
   140056ac3:	81 f1 d5 90 08 69    	xor    $0x690890d5,%ecx
   140056ac9:	c1 f9 1f             	sar    $0x1f,%ecx
   140056acc:	41 89 c8             	mov    %ecx,%r8d
   140056acf:	41 d1 f8             	sar    $1,%r8d
   140056ad2:	41 31 c8             	xor    %ecx,%r8d
   140056ad5:	45 85 c0             	test   %r8d,%r8d
   140056ad8:	75 0a                	jne    0x140056ae4
   140056ada:	49 c1 e0 28          	shl    $0x28,%r8
   140056ade:	42 8b 0c 04          	mov    (%rsp,%r8,1),%ecx
   140056ae2:	eb 10                	jmp    0x140056af4
   140056ae4:	c1 f9 0d             	sar    $0xd,%ecx
   140056ae7:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140056aee:	01 00 00 
   140056af1:	41 8b 08             	mov    (%r8),%ecx
   140056af4:	41 58                	pop    %r8
   140056af6:	59                   	pop    %rcx
   140056af7:	9d                   	popf
   140056af8:	49 63 c2             	movslq %r10d,%rax
   140056afb:	9c                   	pushf
   140056afc:	51                   	push   %rcx
   140056afd:	41 50                	push   %r8
   140056aff:	48 b9 03 63 f8 12 f8 	movabs $0x46cde5f812f86303,%rcx
   140056b06:	e5 cd 46 
   140056b09:	49 89 c8             	mov    %rcx,%r8
   140056b0c:	48 c1 f9 04          	sar    $0x4,%rcx
   140056b10:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056b14:	49 c1 f8 0b          	sar    $0xb,%r8
   140056b18:	49 c1 f8 03          	sar    $0x3,%r8
   140056b1c:	49 d1 f8             	sar    $1,%r8
   140056b1f:	48 c1 f9 09          	sar    $0x9,%rcx
   140056b23:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056b27:	49 c1 f8 04          	sar    $0x4,%r8
   140056b2b:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056b2f:	48 c1 f9 02          	sar    $0x2,%rcx
   140056b33:	49 c1 f8 11          	sar    $0x11,%r8
   140056b37:	48 c1 f9 15          	sar    $0x15,%rcx
   140056b3b:	48 c1 f9 05          	sar    $0x5,%rcx
   140056b3f:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056b43:	49 c1 f8 1b          	sar    $0x1b,%r8
   140056b47:	48 c1 f9 11          	sar    $0x11,%rcx
   140056b4b:	49 c1 f8 0b          	sar    $0xb,%r8
   140056b4f:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056b53:	49 c1 f8 07          	sar    $0x7,%r8
   140056b57:	49 c1 f8 03          	sar    $0x3,%r8
   140056b5b:	48 c1 f9 02          	sar    $0x2,%rcx
   140056b5f:	48 c1 f9 11          	sar    $0x11,%rcx
   140056b63:	49 c1 f8 11          	sar    $0x11,%r8
   140056b67:	48 c1 f9 09          	sar    $0x9,%rcx
   140056b6b:	49 c1 f8 11          	sar    $0x11,%r8
   140056b6f:	48 c1 f9 07          	sar    $0x7,%rcx
   140056b73:	49 c1 f8 11          	sar    $0x11,%r8
   140056b77:	49 c1 f8 09          	sar    $0x9,%r8
   140056b7b:	49 d1 f8             	sar    $1,%r8
   140056b7e:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056b82:	49 c1 f8 09          	sar    $0x9,%r8
   140056b86:	48 c1 f9 09          	sar    $0x9,%rcx
   140056b8a:	4c 31 c1             	xor    %r8,%rcx
   140056b8d:	49 b8 c5 f7 eb 3d 66 	movabs $0x764574663debf7c5,%r8
   140056b94:	74 45 76 
   140056b97:	4c 31 c1             	xor    %r8,%rcx
   140056b9a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140056b9e:	49 89 c8             	mov    %rcx,%r8
   140056ba1:	49 d1 f8             	sar    $1,%r8
   140056ba4:	49 31 c8             	xor    %rcx,%r8
   140056ba7:	4d 85 c0             	test   %r8,%r8
   140056baa:	75 09                	jne    0x140056bb5
   140056bac:	49 0f c8             	bswap  %r8
   140056baf:	4a 8b 0c c4          	mov    (%rsp,%r8,8),%rcx
   140056bb3:	eb 11                	jmp    0x140056bc6
   140056bb5:	48 c1 f9 11          	sar    $0x11,%rcx
   140056bb9:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140056bc0:	01 00 00 
   140056bc3:	49 8b 08             	mov    (%r8),%rcx
   140056bc6:	41 58                	pop    %r8
   140056bc8:	59                   	pop    %rcx
   140056bc9:	9d                   	popf
   140056bca:	44 32 1c 38          	xor    (%rax,%rdi,1),%r11b
   140056bce:	9c                   	pushf
   140056bcf:	50                   	push   %rax
   140056bd0:	52                   	push   %rdx
   140056bd1:	48 b8 08 8d fd 16 dd 	movabs $0x569231dd16fd8d08,%rax
   140056bd8:	31 92 56 
   140056bdb:	48 89 c2             	mov    %rax,%rdx
   140056bde:	48 c1 f8 15          	sar    $0x15,%rax
   140056be2:	48 c1 fa 09          	sar    $0x9,%rdx
   140056be6:	48 c1 f8 1f          	sar    $0x1f,%rax
   140056bea:	48 c1 f8 1f          	sar    $0x1f,%rax
   140056bee:	48 c1 f8 07          	sar    $0x7,%rax
   140056bf2:	48 d1 f8             	sar    $1,%rax
   140056bf5:	48 c1 fa 1f          	sar    $0x1f,%rdx
   140056bf9:	48 c1 fa 07          	sar    $0x7,%rdx
   140056bfd:	48 c1 fa 07          	sar    $0x7,%rdx
   140056c01:	48 c1 f8 15          	sar    $0x15,%rax
   140056c05:	48 c1 f8 05          	sar    $0x5,%rax
   140056c09:	48 c1 f8 15          	sar    $0x15,%rax
   140056c0d:	48 d1 f8             	sar    $1,%rax
   140056c10:	48 c1 f8 15          	sar    $0x15,%rax
   140056c14:	48 c1 fa 04          	sar    $0x4,%rdx
   140056c18:	48 c1 f8 1f          	sar    $0x1f,%rax
   140056c1c:	48 c1 f8 04          	sar    $0x4,%rax
   140056c20:	48 c1 fa 11          	sar    $0x11,%rdx
   140056c24:	48 c1 f8 1b          	sar    $0x1b,%rax
   140056c28:	48 c1 f8 03          	sar    $0x3,%rax
   140056c2c:	48 c1 fa 0d          	sar    $0xd,%rdx
   140056c30:	48 c1 fa 09          	sar    $0x9,%rdx
   140056c34:	48 c1 fa 0d          	sar    $0xd,%rdx
   140056c38:	48 c1 f8 07          	sar    $0x7,%rax
   140056c3c:	48 c1 f8 03          	sar    $0x3,%rax
   140056c40:	48 31 d0             	xor    %rdx,%rax
   140056c43:	48 ba 7e 29 f8 9c 66 	movabs $0x7cb757669cf8297e,%rdx
   140056c4a:	57 b7 7c 
   140056c4d:	48 31 d0             	xor    %rdx,%rax
   140056c50:	48 c1 f8 3f          	sar    $0x3f,%rax
   140056c54:	48 8d 50 01          	lea    0x1(%rax),%rdx
   140056c58:	48 0f af d0          	imul   %rax,%rdx
   140056c5c:	48 85 d2             	test   %rdx,%rdx
   140056c5f:	75 0a                	jne    0x140056c6b
   140056c61:	48 c1 e2 2a          	shl    $0x2a,%rdx
   140056c65:	48 8b 04 14          	mov    (%rsp,%rdx,1),%rax
   140056c69:	eb 11                	jmp    0x140056c7c
   140056c6b:	48 c1 f8 11          	sar    $0x11,%rax
   140056c6f:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140056c76:	01 00 00 
   140056c79:	48 8b 02             	mov    (%rdx),%rax
   140056c7c:	5a                   	pop    %rdx
   140056c7d:	58                   	pop    %rax
   140056c7e:	9d                   	popf
   140056c7f:	45 88 1c 00          	mov    %r11b,(%r8,%rax,1)
   140056c83:	9c                   	pushf
   140056c84:	41 52                	push   %r10
   140056c86:	41 53                	push   %r11
   140056c88:	41 ba 24 82 69 4c    	mov    $0x4c698224,%r10d
   140056c8e:	45 89 d3             	mov    %r10d,%r11d
   140056c91:	41 c1 fb 04          	sar    $0x4,%r11d
   140056c95:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056c99:	41 d1 fb             	sar    $1,%r11d
   140056c9c:	41 c1 fa 07          	sar    $0x7,%r10d
   140056ca0:	41 c1 fa 05          	sar    $0x5,%r10d
   140056ca4:	41 c1 fa 0f          	sar    $0xf,%r10d
   140056ca8:	41 c1 fb 0f          	sar    $0xf,%r11d
   140056cac:	41 c1 fb 0f          	sar    $0xf,%r11d
   140056cb0:	41 c1 fb 03          	sar    $0x3,%r11d
   140056cb4:	41 c1 fb 09          	sar    $0x9,%r11d
   140056cb8:	41 c1 fa 03          	sar    $0x3,%r10d
   140056cbc:	41 c1 fb 0d          	sar    $0xd,%r11d
   140056cc0:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056cc4:	41 c1 fb 03          	sar    $0x3,%r11d
   140056cc8:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056ccc:	41 c1 fb 11          	sar    $0x11,%r11d
   140056cd0:	41 d1 fa             	sar    $1,%r10d
   140056cd3:	41 c1 fb 04          	sar    $0x4,%r11d
   140056cd7:	41 c1 fb 05          	sar    $0x5,%r11d
   140056cdb:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056cdf:	41 c1 fa 09          	sar    $0x9,%r10d
   140056ce3:	41 c1 fa 11          	sar    $0x11,%r10d
   140056ce7:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056ceb:	41 c1 fa 04          	sar    $0x4,%r10d
   140056cef:	41 c1 fb 03          	sar    $0x3,%r11d
   140056cf3:	45 31 da             	xor    %r11d,%r10d
   140056cf6:	41 81 f2 fb bb 7c 71 	xor    $0x717cbbfb,%r10d
   140056cfd:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056d01:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140056d05:	45 0f af da          	imul   %r10d,%r11d
   140056d09:	45 85 db             	test   %r11d,%r11d
   140056d0c:	75 0a                	jne    0x140056d18
   140056d0e:	49 c1 e3 2a          	shl    $0x2a,%r11
   140056d12:	46 8b 14 5c          	mov    (%rsp,%r11,2),%r10d
   140056d16:	eb 11                	jmp    0x140056d29
   140056d18:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056d1c:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140056d23:	01 00 00 
   140056d26:	45 8b 13             	mov    (%r11),%r10d
   140056d29:	41 5b                	pop    %r11
   140056d2b:	41 5a                	pop    %r10
   140056d2d:	9d                   	popf
   140056d2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
   140056d35:	83 3c 24 00          	cmpl   $0x0,(%rsp)
   140056d39:	0f 84 f6 03 00 00    	je     0x140057135
   140056d3f:	9c                   	pushf
   140056d40:	41 51                	push   %r9
   140056d42:	41 52                	push   %r10
   140056d44:	41 b9 3b 49 48 23    	mov    $0x2348493b,%r9d
   140056d4a:	45 89 ca             	mov    %r9d,%r10d
   140056d4d:	41 c1 f9 11          	sar    $0x11,%r9d
   140056d51:	41 c1 fa 15          	sar    $0x15,%r10d
   140056d55:	41 d1 fa             	sar    $1,%r10d
   140056d58:	41 c1 f9 03          	sar    $0x3,%r9d
   140056d5c:	41 c1 fa 11          	sar    $0x11,%r10d
   140056d60:	41 c1 f9 09          	sar    $0x9,%r9d
   140056d64:	41 c1 f9 15          	sar    $0x15,%r9d
   140056d68:	41 c1 fa 09          	sar    $0x9,%r10d
   140056d6c:	41 c1 fa 04          	sar    $0x4,%r10d
   140056d70:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056d74:	41 c1 fa 08          	sar    $0x8,%r10d
   140056d78:	41 c1 f9 08          	sar    $0x8,%r9d
   140056d7c:	41 c1 f9 04          	sar    $0x4,%r9d
   140056d80:	41 c1 fa 15          	sar    $0x15,%r10d
   140056d84:	41 c1 f9 07          	sar    $0x7,%r9d
   140056d88:	41 c1 f9 15          	sar    $0x15,%r9d
   140056d8c:	41 d1 fa             	sar    $1,%r10d
   140056d8f:	41 c1 f9 04          	sar    $0x4,%r9d
   140056d93:	41 d1 fa             	sar    $1,%r10d
   140056d96:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056d9a:	41 c1 f9 0f          	sar    $0xf,%r9d
   140056d9e:	41 c1 f9 05          	sar    $0x5,%r9d
   140056da2:	41 c1 f9 09          	sar    $0x9,%r9d
   140056da6:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056daa:	41 c1 fa 03          	sar    $0x3,%r10d
   140056dae:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056db2:	41 c1 f9 11          	sar    $0x11,%r9d
   140056db6:	41 d1 f9             	sar    $1,%r9d
   140056db9:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056dbd:	41 c1 fa 07          	sar    $0x7,%r10d
   140056dc1:	41 c1 f9 11          	sar    $0x11,%r9d
   140056dc5:	41 c1 f9 09          	sar    $0x9,%r9d
   140056dc9:	41 c1 f9 0f          	sar    $0xf,%r9d
   140056dcd:	45 31 d1             	xor    %r10d,%r9d
   140056dd0:	41 81 f1 53 61 9a 1a 	xor    $0x1a9a6153,%r9d
   140056dd7:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056ddb:	45 8d 51 01          	lea    0x1(%r9),%r10d
   140056ddf:	45 0f af d1          	imul   %r9d,%r10d
   140056de3:	45 85 d2             	test   %r10d,%r10d
   140056de6:	75 0a                	jne    0x140056df2
   140056de8:	49 c1 ca 20          	ror    $0x20,%r10
   140056dec:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140056df0:	eb 11                	jmp    0x140056e03
   140056df2:	41 c1 f9 0d          	sar    $0xd,%r9d
   140056df6:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140056dfd:	01 00 00 
   140056e00:	45 8b 0a             	mov    (%r10),%r9d
   140056e03:	41 5a                	pop    %r10
   140056e05:	41 59                	pop    %r9
   140056e07:	9d                   	popf
   140056e08:	8b 04 24             	mov    (%rsp),%eax
   140056e0b:	83 f8 ff             	cmp    $0xffffffff,%eax
   140056e0e:	0f 84 21 03 00 00    	je     0x140057135
   140056e14:	9c                   	pushf
   140056e15:	51                   	push   %rcx
   140056e16:	41 50                	push   %r8
   140056e18:	48 b9 96 0e c6 1e 9d 	movabs $0x69347b9d1ec60e96,%rcx
   140056e1f:	7b 34 69 
   140056e22:	49 89 c8             	mov    %rcx,%r8
   140056e25:	48 c1 f9 09          	sar    $0x9,%rcx
   140056e29:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056e2d:	49 c1 f8 0d          	sar    $0xd,%r8
   140056e31:	49 c1 f8 04          	sar    $0x4,%r8
   140056e35:	48 c1 f9 09          	sar    $0x9,%rcx
   140056e39:	48 c1 f9 02          	sar    $0x2,%rcx
   140056e3d:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056e41:	49 c1 f8 04          	sar    $0x4,%r8
   140056e45:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056e49:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056e4d:	48 c1 f9 04          	sar    $0x4,%rcx
   140056e51:	48 c1 f9 15          	sar    $0x15,%rcx
   140056e55:	48 c1 f9 0b          	sar    $0xb,%rcx
   140056e59:	49 c1 f8 1f          	sar    $0x1f,%r8
   140056e5d:	48 c1 f9 03          	sar    $0x3,%rcx
   140056e61:	49 c1 f8 0b          	sar    $0xb,%r8
   140056e65:	49 c1 f8 0d          	sar    $0xd,%r8
   140056e69:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056e6d:	49 c1 f8 0d          	sar    $0xd,%r8
   140056e71:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140056e75:	48 c1 f9 0d          	sar    $0xd,%rcx
   140056e79:	49 c1 f8 03          	sar    $0x3,%r8
   140056e7d:	49 c1 f8 11          	sar    $0x11,%r8
   140056e81:	48 d1 f9             	sar    $1,%rcx
   140056e84:	48 c1 f9 0d          	sar    $0xd,%rcx
   140056e88:	49 c1 f8 1b          	sar    $0x1b,%r8
   140056e8c:	48 c1 f9 03          	sar    $0x3,%rcx
   140056e90:	48 c1 f9 04          	sar    $0x4,%rcx
   140056e94:	4c 31 c1             	xor    %r8,%rcx
   140056e97:	49 b8 f0 d2 42 0d 55 	movabs $0x2ad961550d42d2f0,%r8
   140056e9e:	61 d9 2a 
   140056ea1:	4c 31 c1             	xor    %r8,%rcx
   140056ea4:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140056ea8:	4c 8d 41 01          	lea    0x1(%rcx),%r8
   140056eac:	4c 0f af c1          	imul   %rcx,%r8
   140056eb0:	4d 85 c0             	test   %r8,%r8
   140056eb3:	75 0a                	jne    0x140056ebf
   140056eb5:	49 c1 e0 28          	shl    $0x28,%r8
   140056eb9:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   140056ebd:	eb 11                	jmp    0x140056ed0
   140056ebf:	48 c1 f9 11          	sar    $0x11,%rcx
   140056ec3:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140056eca:	01 00 00 
   140056ecd:	49 8b 08             	mov    (%r8),%rcx
   140056ed0:	41 58                	pop    %r8
   140056ed2:	59                   	pop    %rcx
   140056ed3:	9d                   	popf
   140056ed4:	89 d8                	mov    %ebx,%eax
   140056ed6:	9c                   	pushf
   140056ed7:	41 52                	push   %r10
   140056ed9:	41 53                	push   %r11
   140056edb:	41 ba e5 21 02 29    	mov    $0x290221e5,%r10d
   140056ee1:	45 89 d3             	mov    %r10d,%r11d
   140056ee4:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056ee8:	41 c1 fb 04          	sar    $0x4,%r11d
   140056eec:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056ef0:	41 c1 fb 09          	sar    $0x9,%r11d
   140056ef4:	41 c1 fa 09          	sar    $0x9,%r10d
   140056ef8:	41 c1 fa 09          	sar    $0x9,%r10d
   140056efc:	41 c1 fa 03          	sar    $0x3,%r10d
   140056f00:	41 d1 fa             	sar    $1,%r10d
   140056f03:	41 c1 fb 0d          	sar    $0xd,%r11d
   140056f07:	41 c1 fa 03          	sar    $0x3,%r10d
   140056f0b:	41 c1 fa 11          	sar    $0x11,%r10d
   140056f0f:	41 c1 fb 0f          	sar    $0xf,%r11d
   140056f13:	41 c1 fa 0b          	sar    $0xb,%r10d
   140056f17:	41 c1 fa 07          	sar    $0x7,%r10d
   140056f1b:	41 c1 fb 0d          	sar    $0xd,%r11d
   140056f1f:	41 c1 fa 02          	sar    $0x2,%r10d
   140056f23:	41 d1 fb             	sar    $1,%r11d
   140056f26:	41 c1 fb 11          	sar    $0x11,%r11d
   140056f2a:	41 d1 fb             	sar    $1,%r11d
   140056f2d:	41 c1 fa 02          	sar    $0x2,%r10d
   140056f31:	41 d1 fa             	sar    $1,%r10d
   140056f34:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056f38:	41 c1 fb 11          	sar    $0x11,%r11d
   140056f3c:	41 c1 fa 03          	sar    $0x3,%r10d
   140056f40:	41 c1 fa 07          	sar    $0x7,%r10d
   140056f44:	41 c1 fb 04          	sar    $0x4,%r11d
   140056f48:	41 c1 fa 07          	sar    $0x7,%r10d
   140056f4c:	41 c1 fa 03          	sar    $0x3,%r10d
   140056f50:	45 31 da             	xor    %r11d,%r10d
   140056f53:	41 81 f2 1c c4 62 55 	xor    $0x5562c41c,%r10d
   140056f5a:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140056f5e:	45 8d 5a 01          	lea    0x1(%r10),%r11d
   140056f62:	45 0f af da          	imul   %r10d,%r11d
   140056f66:	45 85 db             	test   %r11d,%r11d
   140056f69:	75 09                	jne    0x140056f74
   140056f6b:	49 0f cb             	bswap  %r11
   140056f6e:	46 8b 14 1c          	mov    (%rsp,%r11,1),%r10d
   140056f72:	eb 11                	jmp    0x140056f85
   140056f74:	41 c1 fa 0d          	sar    $0xd,%r10d
   140056f78:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   140056f7f:	01 00 00 
   140056f82:	45 8b 13             	mov    (%r11),%r10d
   140056f85:	41 5b                	pop    %r11
   140056f87:	41 5a                	pop    %r10
   140056f89:	9d                   	popf
   140056f8a:	35 37 13 00 00       	xor    $0x1337,%eax
   140056f8f:	9c                   	pushf
   140056f90:	41 50                	push   %r8
   140056f92:	41 51                	push   %r9
   140056f94:	41 b8 f5 1f cd 78    	mov    $0x78cd1ff5,%r8d
   140056f9a:	45 89 c1             	mov    %r8d,%r9d
   140056f9d:	41 c1 f8 09          	sar    $0x9,%r8d
   140056fa1:	41 c1 f9 07          	sar    $0x7,%r9d
   140056fa5:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056fa9:	41 c1 f9 08          	sar    $0x8,%r9d
   140056fad:	41 d1 f8             	sar    $1,%r8d
   140056fb0:	41 c1 f8 15          	sar    $0x15,%r8d
   140056fb4:	41 c1 f9 03          	sar    $0x3,%r9d
   140056fb8:	41 c1 f8 15          	sar    $0x15,%r8d
   140056fbc:	41 c1 f8 11          	sar    $0x11,%r8d
   140056fc0:	41 d1 f9             	sar    $1,%r9d
   140056fc3:	41 c1 f9 08          	sar    $0x8,%r9d
   140056fc7:	41 c1 f9 11          	sar    $0x11,%r9d
   140056fcb:	41 c1 f8 11          	sar    $0x11,%r8d
   140056fcf:	41 c1 f9 11          	sar    $0x11,%r9d
   140056fd3:	41 c1 f9 0f          	sar    $0xf,%r9d
   140056fd7:	41 c1 f8 08          	sar    $0x8,%r8d
   140056fdb:	41 c1 f9 09          	sar    $0x9,%r9d
   140056fdf:	41 c1 f8 0d          	sar    $0xd,%r8d
   140056fe3:	41 c1 f8 07          	sar    $0x7,%r8d
   140056fe7:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140056feb:	41 d1 f8             	sar    $1,%r8d
   140056fee:	41 c1 f9 15          	sar    $0x15,%r9d
   140056ff2:	41 c1 f8 09          	sar    $0x9,%r8d
   140056ff6:	41 c1 f8 0b          	sar    $0xb,%r8d
   140056ffa:	41 c1 f9 05          	sar    $0x5,%r9d
   140056ffe:	41 c1 f9 15          	sar    $0x15,%r9d
   140057002:	41 c1 f8 0d          	sar    $0xd,%r8d
   140057006:	41 c1 f8 04          	sar    $0x4,%r8d
   14005700a:	41 c1 f9 07          	sar    $0x7,%r9d
   14005700e:	41 c1 f8 02          	sar    $0x2,%r8d
   140057012:	41 c1 f8 0b          	sar    $0xb,%r8d
   140057016:	41 c1 f8 0f          	sar    $0xf,%r8d
   14005701a:	41 c1 f8 08          	sar    $0x8,%r8d
   14005701e:	41 c1 f9 05          	sar    $0x5,%r9d
   140057022:	45 31 c8             	xor    %r9d,%r8d
   140057025:	41 81 f0 ac 21 44 7a 	xor    $0x7a4421ac,%r8d
   14005702c:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057030:	45 89 c1             	mov    %r8d,%r9d
   140057033:	41 ff c1             	inc    %r9d
   140057036:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   14005703a:	45 85 c9             	test   %r9d,%r9d
   14005703d:	75 0a                	jne    0x140057049
   14005703f:	49 c1 e1 2a          	shl    $0x2a,%r9
   140057043:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140057047:	eb 11                	jmp    0x14005705a
   140057049:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005704d:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140057054:	01 00 00 
   140057057:	45 8b 01             	mov    (%r9),%r8d
   14005705a:	41 59                	pop    %r9
   14005705c:	41 58                	pop    %r8
   14005705e:	9d                   	popf
   14005705f:	81 e3 37 13 00 00    	and    $0x1337,%ebx
   140057065:	9c                   	pushf
   140057066:	41 50                	push   %r8
   140057068:	41 51                	push   %r9
   14005706a:	41 b8 56 7a 58 34    	mov    $0x34587a56,%r8d
   140057070:	45 89 c1             	mov    %r8d,%r9d
   140057073:	41 c1 f8 0d          	sar    $0xd,%r8d
   140057077:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005707b:	41 c1 f8 09          	sar    $0x9,%r8d
   14005707f:	41 c1 f8 03          	sar    $0x3,%r8d
   140057083:	41 c1 f9 15          	sar    $0x15,%r9d
   140057087:	41 c1 f8 09          	sar    $0x9,%r8d
   14005708b:	41 c1 f9 08          	sar    $0x8,%r9d
   14005708f:	41 c1 f9 07          	sar    $0x7,%r9d
   140057093:	41 d1 f9             	sar    $1,%r9d
   140057096:	41 c1 f8 08          	sar    $0x8,%r8d
   14005709a:	41 c1 f9 0f          	sar    $0xf,%r9d
   14005709e:	41 c1 f8 15          	sar    $0x15,%r8d
   1400570a2:	41 c1 f9 02          	sar    $0x2,%r9d
   1400570a6:	41 c1 f9 08          	sar    $0x8,%r9d
   1400570aa:	41 c1 f8 15          	sar    $0x15,%r8d
   1400570ae:	41 c1 f9 11          	sar    $0x11,%r9d
   1400570b2:	41 c1 f9 09          	sar    $0x9,%r9d
   1400570b6:	41 c1 f8 03          	sar    $0x3,%r8d
   1400570ba:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400570be:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400570c2:	41 c1 f9 09          	sar    $0x9,%r9d
   1400570c6:	41 c1 f9 09          	sar    $0x9,%r9d
   1400570ca:	41 c1 f8 05          	sar    $0x5,%r8d
   1400570ce:	41 c1 f9 05          	sar    $0x5,%r9d
   1400570d2:	41 c1 f8 0d          	sar    $0xd,%r8d
   1400570d6:	41 c1 f8 03          	sar    $0x3,%r8d
   1400570da:	41 c1 f9 05          	sar    $0x5,%r9d
   1400570de:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400570e2:	41 c1 f8 11          	sar    $0x11,%r8d
   1400570e6:	41 c1 f9 0f          	sar    $0xf,%r9d
   1400570ea:	41 c1 f9 15          	sar    $0x15,%r9d
   1400570ee:	41 c1 f9 0d          	sar    $0xd,%r9d
   1400570f2:	41 c1 f8 07          	sar    $0x7,%r8d
   1400570f6:	45 31 c8             	xor    %r9d,%r8d
   1400570f9:	41 81 f0 43 c7 d2 17 	xor    $0x17d2c743,%r8d
   140057100:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057104:	45 89 c1             	mov    %r8d,%r9d
   140057107:	41 d1 f9             	sar    $1,%r9d
   14005710a:	45 31 c1             	xor    %r8d,%r9d
   14005710d:	45 85 c9             	test   %r9d,%r9d
   140057110:	75 0a                	jne    0x14005711c
   140057112:	49 c1 e1 26          	shl    $0x26,%r9
   140057116:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   14005711a:	eb 11                	jmp    0x14005712d
   14005711c:	41 c1 f8 0d          	sar    $0xd,%r8d
   140057120:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140057127:	01 00 00 
   14005712a:	45 8b 01             	mov    (%r9),%r8d
   14005712d:	41 59                	pop    %r9
   14005712f:	41 58                	pop    %r8
   140057131:	9d                   	popf
   140057132:	8d 1c 58             	lea    (%rax,%rbx,2),%ebx
   140057135:	9c                   	pushf
   140057136:	41 50                	push   %r8
   140057138:	41 51                	push   %r9
   14005713a:	41 b8 92 61 19 76    	mov    $0x76196192,%r8d
   140057140:	45 89 c1             	mov    %r8d,%r9d
   140057143:	41 c1 f9 02          	sar    $0x2,%r9d
   140057147:	41 c1 f9 03          	sar    $0x3,%r9d
   14005714b:	41 c1 f8 05          	sar    $0x5,%r8d
   14005714f:	41 c1 f9 11          	sar    $0x11,%r9d
   140057153:	41 c1 f9 02          	sar    $0x2,%r9d
   140057157:	41 c1 f9 0f          	sar    $0xf,%r9d
   14005715b:	41 c1 f8 0d          	sar    $0xd,%r8d
   14005715f:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057163:	41 c1 f9 0f          	sar    $0xf,%r9d
   140057167:	41 c1 f8 0b          	sar    $0xb,%r8d
   14005716b:	41 d1 f8             	sar    $1,%r8d
   14005716e:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057172:	41 c1 f9 11          	sar    $0x11,%r9d
   140057176:	41 c1 f8 09          	sar    $0x9,%r8d
   14005717a:	41 c1 f9 03          	sar    $0x3,%r9d
   14005717e:	41 c1 f8 07          	sar    $0x7,%r8d
   140057182:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057186:	41 c1 f9 0b          	sar    $0xb,%r9d
   14005718a:	41 c1 f9 11          	sar    $0x11,%r9d
   14005718e:	41 c1 f8 11          	sar    $0x11,%r8d
   140057192:	41 c1 f8 04          	sar    $0x4,%r8d
   140057196:	41 c1 f8 11          	sar    $0x11,%r8d
   14005719a:	41 c1 f8 05          	sar    $0x5,%r8d
   14005719e:	41 c1 f8 07          	sar    $0x7,%r8d
   1400571a2:	41 c1 f8 08          	sar    $0x8,%r8d
   1400571a6:	41 c1 f8 0b          	sar    $0xb,%r8d
   1400571aa:	41 c1 f9 02          	sar    $0x2,%r9d
   1400571ae:	41 d1 f9             	sar    $1,%r9d
   1400571b1:	41 c1 f8 02          	sar    $0x2,%r8d
   1400571b5:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400571b9:	41 c1 f9 0b          	sar    $0xb,%r9d
   1400571bd:	41 c1 f8 07          	sar    $0x7,%r8d
   1400571c1:	41 c1 f8 03          	sar    $0x3,%r8d
   1400571c5:	41 c1 f9 04          	sar    $0x4,%r9d
   1400571c9:	41 c1 f9 08          	sar    $0x8,%r9d
   1400571cd:	41 d1 f9             	sar    $1,%r9d
   1400571d0:	41 c1 f8 11          	sar    $0x11,%r8d
   1400571d4:	41 c1 f8 09          	sar    $0x9,%r8d
   1400571d8:	45 31 c8             	xor    %r9d,%r8d
   1400571db:	41 81 f0 98 61 e4 6d 	xor    $0x6de46198,%r8d
   1400571e2:	41 c1 f8 1f          	sar    $0x1f,%r8d
   1400571e6:	45 89 c1             	mov    %r8d,%r9d
   1400571e9:	41 ff c1             	inc    %r9d
   1400571ec:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   1400571f0:	45 85 c9             	test   %r9d,%r9d
   1400571f3:	75 0a                	jne    0x1400571ff
   1400571f5:	49 c1 e1 26          	shl    $0x26,%r9
   1400571f9:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   1400571fd:	eb 11                	jmp    0x140057210
   1400571ff:	41 c1 f8 0d          	sar    $0xd,%r8d
   140057203:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   14005720a:	01 00 00 
   14005720d:	45 8b 01             	mov    (%r9),%r8d
   140057210:	41 59                	pop    %r9
   140057212:	41 58                	pop    %r8
   140057214:	9d                   	popf
   140057215:	44 89 d0             	mov    %r10d,%eax
   140057218:	9c                   	pushf
   140057219:	50                   	push   %rax
   14005721a:	52                   	push   %rdx
   14005721b:	b8 80 74 63 76       	mov    $0x76637480,%eax
   140057220:	89 c2                	mov    %eax,%edx
   140057222:	c1 f8 03             	sar    $0x3,%eax
   140057225:	c1 fa 0b             	sar    $0xb,%edx
   140057228:	c1 f8 09             	sar    $0x9,%eax
   14005722b:	c1 f8 15             	sar    $0x15,%eax
   14005722e:	c1 fa 09             	sar    $0x9,%edx
   140057231:	c1 f8 15             	sar    $0x15,%eax
   140057234:	c1 f8 05             	sar    $0x5,%eax
   140057237:	c1 f8 11             	sar    $0x11,%eax
   14005723a:	c1 fa 02             	sar    $0x2,%edx
   14005723d:	c1 fa 0b             	sar    $0xb,%edx
   140057240:	c1 f8 15             	sar    $0x15,%eax
   140057243:	c1 fa 0d             	sar    $0xd,%edx
   140057246:	d1 fa                	sar    $1,%edx
   140057248:	c1 fa 0b             	sar    $0xb,%edx
   14005724b:	c1 fa 0b             	sar    $0xb,%edx
   14005724e:	c1 f8 03             	sar    $0x3,%eax
   140057251:	c1 f8 03             	sar    $0x3,%eax
   140057254:	c1 f8 08             	sar    $0x8,%eax
   140057257:	c1 fa 0b             	sar    $0xb,%edx
   14005725a:	c1 fa 08             	sar    $0x8,%edx
   14005725d:	c1 fa 0f             	sar    $0xf,%edx
   140057260:	c1 fa 1f             	sar    $0x1f,%edx
   140057263:	c1 fa 05             	sar    $0x5,%edx
   140057266:	c1 f8 0f             	sar    $0xf,%eax
   140057269:	31 d0                	xor    %edx,%eax
   14005726b:	35 b2 c1 a0 19       	xor    $0x19a0c1b2,%eax
   140057270:	c1 f8 1f             	sar    $0x1f,%eax
   140057273:	89 c2                	mov    %eax,%edx
   140057275:	d1 fa                	sar    $1,%edx
   140057277:	31 c2                	xor    %eax,%edx
   140057279:	85 d2                	test   %edx,%edx
   14005727b:	75 09                	jne    0x140057286
   14005727d:	48 c1 e2 28          	shl    $0x28,%rdx
   140057281:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   140057284:	eb 0f                	jmp    0x140057295
   140057286:	c1 f8 0d             	sar    $0xd,%eax
   140057289:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140057290:	01 00 00 
   140057293:	8b 02                	mov    (%rdx),%eax
   140057295:	5a                   	pop    %rdx
   140057296:	58                   	pop    %rax
   140057297:	9d                   	popf
   140057298:	83 f0 01             	xor    $0x1,%eax
   14005729b:	9c                   	pushf
   14005729c:	50                   	push   %rax
   14005729d:	52                   	push   %rdx
   14005729e:	b8 75 99 84 2e       	mov    $0x2e849975,%eax
   1400572a3:	89 c2                	mov    %eax,%edx
   1400572a5:	c1 fa 15             	sar    $0x15,%edx
   1400572a8:	c1 fa 0d             	sar    $0xd,%edx
   1400572ab:	c1 fa 04             	sar    $0x4,%edx
   1400572ae:	c1 f8 0d             	sar    $0xd,%eax
   1400572b1:	c1 f8 07             	sar    $0x7,%eax
   1400572b4:	d1 fa                	sar    $1,%edx
   1400572b6:	c1 f8 1f             	sar    $0x1f,%eax
   1400572b9:	c1 fa 09             	sar    $0x9,%edx
   1400572bc:	c1 fa 02             	sar    $0x2,%edx
   1400572bf:	c1 f8 03             	sar    $0x3,%eax
   1400572c2:	c1 fa 04             	sar    $0x4,%edx
   1400572c5:	c1 fa 1f             	sar    $0x1f,%edx
   1400572c8:	c1 fa 05             	sar    $0x5,%edx
   1400572cb:	c1 f8 08             	sar    $0x8,%eax
   1400572ce:	c1 f8 0b             	sar    $0xb,%eax
   1400572d1:	c1 fa 08             	sar    $0x8,%edx
   1400572d4:	c1 fa 05             	sar    $0x5,%edx
   1400572d7:	c1 fa 15             	sar    $0x15,%edx
   1400572da:	c1 fa 04             	sar    $0x4,%edx
   1400572dd:	c1 fa 05             	sar    $0x5,%edx
   1400572e0:	c1 fa 03             	sar    $0x3,%edx
   1400572e3:	c1 f8 07             	sar    $0x7,%eax
   1400572e6:	c1 f8 15             	sar    $0x15,%eax
   1400572e9:	c1 f8 09             	sar    $0x9,%eax
   1400572ec:	c1 fa 02             	sar    $0x2,%edx
   1400572ef:	c1 f8 11             	sar    $0x11,%eax
   1400572f2:	c1 fa 1f             	sar    $0x1f,%edx
   1400572f5:	c1 f8 07             	sar    $0x7,%eax
   1400572f8:	d1 fa                	sar    $1,%edx
   1400572fa:	c1 fa 07             	sar    $0x7,%edx
   1400572fd:	31 d0                	xor    %edx,%eax
   1400572ff:	35 d9 4b f7 19       	xor    $0x19f74bd9,%eax
   140057304:	c1 f8 1f             	sar    $0x1f,%eax
   140057307:	8d 50 01             	lea    0x1(%rax),%edx
   14005730a:	0f af d0             	imul   %eax,%edx
   14005730d:	85 d2                	test   %edx,%edx
   14005730f:	75 09                	jne    0x14005731a
   140057311:	48 c1 e2 28          	shl    $0x28,%rdx
   140057315:	8b 04 54             	mov    (%rsp,%rdx,2),%eax
   140057318:	eb 0f                	jmp    0x140057329
   14005731a:	c1 f8 0d             	sar    $0xd,%eax
   14005731d:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   140057324:	01 00 00 
   140057327:	8b 02                	mov    (%rdx),%eax
   140057329:	5a                   	pop    %rdx
   14005732a:	58                   	pop    %rax
   14005732b:	9d                   	popf
   14005732c:	41 83 e2 01          	and    $0x1,%r10d
   140057330:	9c                   	pushf
   140057331:	50                   	push   %rax
   140057332:	52                   	push   %rdx
   140057333:	b8 df e5 a0 29       	mov    $0x29a0e5df,%eax
   140057338:	89 c2                	mov    %eax,%edx
   14005733a:	c1 fa 09             	sar    $0x9,%edx
   14005733d:	c1 fa 05             	sar    $0x5,%edx
   140057340:	c1 f8 11             	sar    $0x11,%eax
   140057343:	c1 f8 0f             	sar    $0xf,%eax
   140057346:	c1 fa 02             	sar    $0x2,%edx
   140057349:	c1 fa 07             	sar    $0x7,%edx
   14005734c:	c1 fa 0b             	sar    $0xb,%edx
   14005734f:	c1 f8 07             	sar    $0x7,%eax
   140057352:	c1 f8 03             	sar    $0x3,%eax
   140057355:	c1 f8 0f             	sar    $0xf,%eax
   140057358:	c1 fa 11             	sar    $0x11,%edx
   14005735b:	c1 fa 1f             	sar    $0x1f,%edx
   14005735e:	c1 fa 11             	sar    $0x11,%edx
   140057361:	c1 fa 11             	sar    $0x11,%edx
   140057364:	c1 fa 15             	sar    $0x15,%edx
   140057367:	c1 fa 11             	sar    $0x11,%edx
   14005736a:	c1 f8 15             	sar    $0x15,%eax
   14005736d:	c1 f8 02             	sar    $0x2,%eax
   140057370:	c1 f8 02             	sar    $0x2,%eax
   140057373:	c1 fa 15             	sar    $0x15,%edx
   140057376:	c1 f8 07             	sar    $0x7,%eax
   140057379:	c1 fa 04             	sar    $0x4,%edx
   14005737c:	c1 fa 0d             	sar    $0xd,%edx
   14005737f:	c1 f8 09             	sar    $0x9,%eax
   140057382:	c1 fa 09             	sar    $0x9,%edx
   140057385:	c1 f8 0d             	sar    $0xd,%eax
   140057388:	c1 fa 05             	sar    $0x5,%edx
   14005738b:	c1 fa 0b             	sar    $0xb,%edx
   14005738e:	c1 f8 0d             	sar    $0xd,%eax
   140057391:	c1 fa 0f             	sar    $0xf,%edx
   140057394:	31 d0                	xor    %edx,%eax
   140057396:	35 13 a7 4d 25       	xor    $0x254da713,%eax
   14005739b:	c1 f8 1f             	sar    $0x1f,%eax
   14005739e:	89 c2                	mov    %eax,%edx
   1400573a0:	d1 fa                	sar    $1,%edx
   1400573a2:	31 c2                	xor    %eax,%edx
   1400573a4:	85 d2                	test   %edx,%edx
   1400573a6:	75 09                	jne    0x1400573b1
   1400573a8:	48 c1 ca 20          	ror    $0x20,%rdx
   1400573ac:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   1400573af:	eb 0f                	jmp    0x1400573c0
   1400573b1:	c1 f8 0d             	sar    $0xd,%eax
   1400573b4:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400573bb:	01 00 00 
   1400573be:	8b 02                	mov    (%rdx),%eax
   1400573c0:	5a                   	pop    %rdx
   1400573c1:	58                   	pop    %rax
   1400573c2:	9d                   	popf
   1400573c3:	46 8d 14 50          	lea    (%rax,%r10,2),%r10d
   1400573c7:	9c                   	pushf
   1400573c8:	41 50                	push   %r8
   1400573ca:	41 51                	push   %r9
   1400573cc:	49 b8 29 64 68 2a aa 	movabs $0x2ed940aa2a686429,%r8
   1400573d3:	40 d9 2e 
   1400573d6:	4d 89 c1             	mov    %r8,%r9
   1400573d9:	49 c1 f9 1f          	sar    $0x1f,%r9
   1400573dd:	49 c1 f9 02          	sar    $0x2,%r9
   1400573e1:	49 c1 f8 09          	sar    $0x9,%r8
   1400573e5:	49 c1 f8 05          	sar    $0x5,%r8
   1400573e9:	49 c1 f8 1b          	sar    $0x1b,%r8
   1400573ed:	49 c1 f8 04          	sar    $0x4,%r8
   1400573f1:	49 d1 f9             	sar    $1,%r9
   1400573f4:	49 c1 f8 04          	sar    $0x4,%r8
   1400573f8:	49 c1 f8 0d          	sar    $0xd,%r8
   1400573fc:	49 c1 f9 07          	sar    $0x7,%r9
   140057400:	49 c1 f8 05          	sar    $0x5,%r8
   140057404:	49 c1 f9 07          	sar    $0x7,%r9
   140057408:	49 c1 f9 07          	sar    $0x7,%r9
   14005740c:	49 d1 f8             	sar    $1,%r8
   14005740f:	49 c1 f9 1f          	sar    $0x1f,%r9
   140057413:	49 c1 f8 04          	sar    $0x4,%r8
   140057417:	49 d1 f9             	sar    $1,%r9
   14005741a:	49 c1 f8 03          	sar    $0x3,%r8
   14005741e:	49 d1 f9             	sar    $1,%r9
   140057421:	49 c1 f8 0b          	sar    $0xb,%r8
   140057425:	49 d1 f8             	sar    $1,%r8
   140057428:	49 c1 f8 02          	sar    $0x2,%r8
   14005742c:	49 c1 f9 02          	sar    $0x2,%r9
   140057430:	49 c1 f9 1b          	sar    $0x1b,%r9
   140057434:	49 c1 f8 0b          	sar    $0xb,%r8
   140057438:	49 c1 f8 04          	sar    $0x4,%r8
   14005743c:	49 c1 f9 1f          	sar    $0x1f,%r9
   140057440:	49 c1 f8 02          	sar    $0x2,%r8
   140057444:	49 c1 f8 03          	sar    $0x3,%r8
   140057448:	49 c1 f9 0d          	sar    $0xd,%r9
   14005744c:	49 c1 f8 11          	sar    $0x11,%r8
   140057450:	49 d1 f8             	sar    $1,%r8
   140057453:	49 c1 f8 1f          	sar    $0x1f,%r8
   140057457:	49 c1 f9 15          	sar    $0x15,%r9
   14005745b:	49 c1 f9 1b          	sar    $0x1b,%r9
   14005745f:	49 c1 f9 0d          	sar    $0xd,%r9
   140057463:	49 c1 f9 11          	sar    $0x11,%r9
   140057467:	49 c1 f8 09          	sar    $0x9,%r8
   14005746b:	4d 31 c8             	xor    %r9,%r8
   14005746e:	49 b9 f7 55 92 c4 37 	movabs $0x4ce45237c49255f7,%r9
   140057475:	52 e4 4c 
   140057478:	4d 31 c8             	xor    %r9,%r8
   14005747b:	49 c1 f8 3f          	sar    $0x3f,%r8
   14005747f:	4d 89 c1             	mov    %r8,%r9
   140057482:	49 ff c1             	inc    %r9
   140057485:	49 83 e1 fe          	and    $0xfffffffffffffffe,%r9
   140057489:	4d 85 c9             	test   %r9,%r9
   14005748c:	75 0a                	jne    0x140057498
   14005748e:	49 c1 c9 20          	ror    $0x20,%r9
   140057492:	4e 8b 04 cc          	mov    (%rsp,%r9,8),%r8
   140057496:	eb 11                	jmp    0x1400574a9
   140057498:	49 c1 f8 11          	sar    $0x11,%r8
   14005749c:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   1400574a3:	01 00 00 
   1400574a6:	4d 8b 01             	mov    (%r9),%r8
   1400574a9:	41 59                	pop    %r9
   1400574ab:	41 58                	pop    %r8
   1400574ad:	9d                   	popf
   1400574ae:	b8 f6 65 00 00       	mov    $0x65f6,%eax
   1400574b3:	41 83 fa 22          	cmp    $0x22,%r10d
   1400574b7:	0f 8c e3 af ff ff    	jl     0x1400524a0
   1400574bd:	9c                   	pushf
   1400574be:	50                   	push   %rax
   1400574bf:	51                   	push   %rcx
   1400574c0:	b8 db b5 ec 21       	mov    $0x21ecb5db,%eax
   1400574c5:	89 c1                	mov    %eax,%ecx
   1400574c7:	d1 f8                	sar    $1,%eax
   1400574c9:	c1 f9 03             	sar    $0x3,%ecx
   1400574cc:	d1 f9                	sar    $1,%ecx
   1400574ce:	c1 f8 11             	sar    $0x11,%eax
   1400574d1:	c1 f8 0b             	sar    $0xb,%eax
   1400574d4:	c1 f9 03             	sar    $0x3,%ecx
   1400574d7:	c1 f9 08             	sar    $0x8,%ecx
   1400574da:	c1 f8 1f             	sar    $0x1f,%eax
   1400574dd:	d1 f8                	sar    $1,%eax
   1400574df:	c1 f8 07             	sar    $0x7,%eax
   1400574e2:	c1 f9 0d             	sar    $0xd,%ecx
   1400574e5:	c1 f8 0d             	sar    $0xd,%eax
   1400574e8:	c1 f9 0d             	sar    $0xd,%ecx
   1400574eb:	c1 f8 15             	sar    $0x15,%eax
   1400574ee:	c1 f9 02             	sar    $0x2,%ecx
   1400574f1:	c1 f8 08             	sar    $0x8,%eax
   1400574f4:	c1 f9 0f             	sar    $0xf,%ecx
   1400574f7:	c1 f8 08             	sar    $0x8,%eax
   1400574fa:	c1 f8 0d             	sar    $0xd,%eax
   1400574fd:	c1 f9 1f             	sar    $0x1f,%ecx
   140057500:	c1 f8 07             	sar    $0x7,%eax
   140057503:	c1 f9 15             	sar    $0x15,%ecx
   140057506:	c1 f8 0d             	sar    $0xd,%eax
   140057509:	d1 f9                	sar    $1,%ecx
   14005750b:	c1 f8 07             	sar    $0x7,%eax
   14005750e:	c1 f8 09             	sar    $0x9,%eax
   140057511:	c1 f9 03             	sar    $0x3,%ecx
   140057514:	c1 f8 1f             	sar    $0x1f,%eax
   140057517:	31 c8                	xor    %ecx,%eax
   140057519:	35 06 96 1d 2d       	xor    $0x2d1d9606,%eax
   14005751e:	c1 f8 1f             	sar    $0x1f,%eax
   140057521:	89 c1                	mov    %eax,%ecx
   140057523:	ff c1                	inc    %ecx
   140057525:	83 e1 fe             	and    $0xfffffffe,%ecx
   140057528:	85 c9                	test   %ecx,%ecx
   14005752a:	75 09                	jne    0x140057535
   14005752c:	48 c1 e1 2a          	shl    $0x2a,%rcx
   140057530:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   140057533:	eb 0f                	jmp    0x140057544
   140057535:	c1 f8 0d             	sar    $0xd,%eax
   140057538:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   14005753f:	01 00 00 
   140057542:	8b 01                	mov    (%rcx),%eax
   140057544:	59                   	pop    %rcx
   140057545:	58                   	pop    %rax
   140057546:	9d                   	popf
   140057547:	41 c6 40 22 00       	movb   $0x0,0x22(%r8)
   14005754c:	9c                   	pushf
   14005754d:	50                   	push   %rax
   14005754e:	51                   	push   %rcx
   14005754f:	b8 2e 14 78 42       	mov    $0x4278142e,%eax
   140057554:	89 c1                	mov    %eax,%ecx
   140057556:	d1 f9                	sar    $1,%ecx
   140057558:	c1 f8 0b             	sar    $0xb,%eax
   14005755b:	c1 f8 05             	sar    $0x5,%eax
   14005755e:	c1 f8 15             	sar    $0x15,%eax
   140057561:	c1 f8 0b             	sar    $0xb,%eax
   140057564:	c1 f8 11             	sar    $0x11,%eax
   140057567:	c1 f9 1f             	sar    $0x1f,%ecx
   14005756a:	c1 f9 04             	sar    $0x4,%ecx
   14005756d:	c1 f8 02             	sar    $0x2,%eax
   140057570:	c1 f8 1f             	sar    $0x1f,%eax
   140057573:	c1 f8 04             	sar    $0x4,%eax
   140057576:	c1 f9 05             	sar    $0x5,%ecx
   140057579:	c1 f8 05             	sar    $0x5,%eax
   14005757c:	c1 f8 11             	sar    $0x11,%eax
   14005757f:	c1 f9 02             	sar    $0x2,%ecx
   140057582:	c1 f8 08             	sar    $0x8,%eax
   140057585:	c1 f8 03             	sar    $0x3,%eax
   140057588:	c1 f8 04             	sar    $0x4,%eax
   14005758b:	c1 f9 02             	sar    $0x2,%ecx
   14005758e:	c1 f8 08             	sar    $0x8,%eax
   140057591:	c1 f8 15             	sar    $0x15,%eax
   140057594:	c1 f9 04             	sar    $0x4,%ecx
   140057597:	c1 f9 0b             	sar    $0xb,%ecx
   14005759a:	c1 f8 11             	sar    $0x11,%eax
   14005759d:	c1 f8 0b             	sar    $0xb,%eax
   1400575a0:	c1 f9 11             	sar    $0x11,%ecx
   1400575a3:	c1 f9 04             	sar    $0x4,%ecx
   1400575a6:	d1 f9                	sar    $1,%ecx
   1400575a8:	c1 f8 02             	sar    $0x2,%eax
   1400575ab:	c1 f9 08             	sar    $0x8,%ecx
   1400575ae:	31 c8                	xor    %ecx,%eax
   1400575b0:	35 65 18 43 6a       	xor    $0x6a431865,%eax
   1400575b5:	c1 f8 1f             	sar    $0x1f,%eax
   1400575b8:	89 c1                	mov    %eax,%ecx
   1400575ba:	d1 f9                	sar    $1,%ecx
   1400575bc:	31 c1                	xor    %eax,%ecx
   1400575be:	85 c9                	test   %ecx,%ecx
   1400575c0:	75 08                	jne    0x1400575ca
   1400575c2:	48 0f c9             	bswap  %rcx
   1400575c5:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   1400575c8:	eb 0f                	jmp    0x1400575d9
   1400575ca:	c1 f8 0d             	sar    $0xd,%eax
   1400575cd:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   1400575d4:	01 00 00 
   1400575d7:	8b 01                	mov    (%rcx),%eax
   1400575d9:	59                   	pop    %rcx
   1400575da:	58                   	pop    %rax
   1400575db:	9d                   	popf
   1400575dc:	45 31 e4             	xor    %r12d,%r12d
   1400575df:	9c                   	pushf
   1400575e0:	41 51                	push   %r9
   1400575e2:	41 52                	push   %r10
   1400575e4:	41 b9 d5 cf b7 11    	mov    $0x11b7cfd5,%r9d
   1400575ea:	45 89 ca             	mov    %r9d,%r10d
   1400575ed:	41 c1 f9 02          	sar    $0x2,%r9d
   1400575f1:	41 c1 f9 1f          	sar    $0x1f,%r9d
   1400575f5:	41 d1 f9             	sar    $1,%r9d
   1400575f8:	41 c1 f9 04          	sar    $0x4,%r9d
   1400575fc:	41 c1 f9 02          	sar    $0x2,%r9d
   140057600:	41 c1 f9 04          	sar    $0x4,%r9d
   140057604:	41 c1 f9 11          	sar    $0x11,%r9d
   140057608:	41 c1 f9 04          	sar    $0x4,%r9d
   14005760c:	41 c1 f9 07          	sar    $0x7,%r9d
   140057610:	41 c1 fa 0f          	sar    $0xf,%r10d
   140057614:	41 d1 fa             	sar    $1,%r10d
   140057617:	41 c1 f9 07          	sar    $0x7,%r9d
   14005761b:	41 c1 fa 0b          	sar    $0xb,%r10d
   14005761f:	41 c1 fa 0d          	sar    $0xd,%r10d
   140057623:	41 c1 fa 02          	sar    $0x2,%r10d
   140057627:	41 c1 fa 0f          	sar    $0xf,%r10d
   14005762b:	41 c1 fa 15          	sar    $0x15,%r10d
   14005762f:	41 c1 fa 07          	sar    $0x7,%r10d
   140057633:	41 c1 f9 05          	sar    $0x5,%r9d
   140057637:	41 c1 fa 09          	sar    $0x9,%r10d
   14005763b:	41 c1 fa 02          	sar    $0x2,%r10d
   14005763f:	41 c1 f9 05          	sar    $0x5,%r9d
   140057643:	41 c1 f9 02          	sar    $0x2,%r9d
   140057647:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005764b:	41 d1 fa             	sar    $1,%r10d
   14005764e:	41 c1 fa 0b          	sar    $0xb,%r10d
   140057652:	41 c1 f9 07          	sar    $0x7,%r9d
   140057656:	41 c1 f9 04          	sar    $0x4,%r9d
   14005765a:	41 c1 fa 1f          	sar    $0x1f,%r10d
   14005765e:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140057662:	41 c1 f9 09          	sar    $0x9,%r9d
   140057666:	41 c1 f9 04          	sar    $0x4,%r9d
   14005766a:	41 d1 fa             	sar    $1,%r10d
   14005766d:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057671:	45 31 d1             	xor    %r10d,%r9d
   140057674:	41 81 f1 fb 8c 66 7c 	xor    $0x7c668cfb,%r9d
   14005767b:	41 c1 f9 1f          	sar    $0x1f,%r9d
   14005767f:	45 8d 51 01          	lea    0x1(%r9),%r10d
   140057683:	45 0f af d1          	imul   %r9d,%r10d
   140057687:	45 85 d2             	test   %r10d,%r10d
   14005768a:	75 0a                	jne    0x140057696
   14005768c:	49 c1 ca 20          	ror    $0x20,%r10
   140057690:	46 8b 0c 14          	mov    (%rsp,%r10,1),%r9d
   140057694:	eb 11                	jmp    0x1400576a7
   140057696:	41 c1 f9 0d          	sar    $0xd,%r9d
   14005769a:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   1400576a1:	01 00 00 
   1400576a4:	45 8b 0a             	mov    (%r10),%r9d
   1400576a7:	41 5a                	pop    %r10
   1400576a9:	41 59                	pop    %r9
   1400576ab:	9d                   	popf
   1400576ac:	b8 07 7a 00 00       	mov    $0x7a07,%eax
   1400576b1:	9c                   	pushf
   1400576b2:	41 52                	push   %r10
   1400576b4:	41 53                	push   %r11
   1400576b6:	49 ba 04 87 2f 78 40 	movabs $0x39d53440782f8704,%r10
   1400576bd:	34 d5 39 
   1400576c0:	4d 89 d3             	mov    %r10,%r11
   1400576c3:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400576c7:	49 c1 fb 05          	sar    $0x5,%r11
   1400576cb:	49 c1 fb 1b          	sar    $0x1b,%r11
   1400576cf:	49 c1 fa 11          	sar    $0x11,%r10
   1400576d3:	49 c1 fa 04          	sar    $0x4,%r10
   1400576d7:	49 c1 fa 15          	sar    $0x15,%r10
   1400576db:	49 c1 fb 0b          	sar    $0xb,%r11
   1400576df:	49 c1 fb 0b          	sar    $0xb,%r11
   1400576e3:	49 c1 fb 03          	sar    $0x3,%r11
   1400576e7:	49 c1 fb 09          	sar    $0x9,%r11
   1400576eb:	49 c1 fa 0d          	sar    $0xd,%r10
   1400576ef:	49 c1 fb 02          	sar    $0x2,%r11
   1400576f3:	49 c1 fb 0d          	sar    $0xd,%r11
   1400576f7:	49 c1 fb 1b          	sar    $0x1b,%r11
   1400576fb:	49 c1 fa 1f          	sar    $0x1f,%r10
   1400576ff:	49 c1 fa 1b          	sar    $0x1b,%r10
   140057703:	49 d1 fb             	sar    $1,%r11
   140057706:	49 c1 fa 03          	sar    $0x3,%r10
   14005770a:	49 d1 fb             	sar    $1,%r11
   14005770d:	49 c1 fb 1b          	sar    $0x1b,%r11
   140057711:	49 c1 fb 1b          	sar    $0x1b,%r11
   140057715:	49 d1 fb             	sar    $1,%r11
   140057718:	49 c1 fa 04          	sar    $0x4,%r10
   14005771c:	49 c1 fa 1b          	sar    $0x1b,%r10
   140057720:	49 c1 fb 1f          	sar    $0x1f,%r11
   140057724:	49 c1 fb 02          	sar    $0x2,%r11
   140057728:	49 c1 fa 1f          	sar    $0x1f,%r10
   14005772c:	49 c1 fa 0b          	sar    $0xb,%r10
   140057730:	49 c1 fb 03          	sar    $0x3,%r11
   140057734:	49 c1 fa 0b          	sar    $0xb,%r10
   140057738:	49 c1 fb 0d          	sar    $0xd,%r11
   14005773c:	49 c1 fb 0b          	sar    $0xb,%r11
   140057740:	49 c1 fb 15          	sar    $0x15,%r11
   140057744:	4d 31 da             	xor    %r11,%r10
   140057747:	49 bb 15 ae 70 d9 81 	movabs $0x27ae6d81d970ae15,%r11
   14005774e:	6d ae 27 
   140057751:	4d 31 da             	xor    %r11,%r10
   140057754:	49 c1 fa 3f          	sar    $0x3f,%r10
   140057758:	4d 8d 5a 01          	lea    0x1(%r10),%r11
   14005775c:	4d 0f af da          	imul   %r10,%r11
   140057760:	4d 85 db             	test   %r11,%r11
   140057763:	75 0a                	jne    0x14005776f
   140057765:	49 c1 e3 26          	shl    $0x26,%r11
   140057769:	4e 8b 14 dc          	mov    (%rsp,%r11,8),%r10
   14005776d:	eb 11                	jmp    0x140057780
   14005776f:	49 c1 fa 11          	sar    $0x11,%r10
   140057773:	49 bb 00 00 00 00 00 	movabs $0x10000000000,%r11
   14005777a:	01 00 00 
   14005777d:	4d 8b 13             	mov    (%r11),%r10
   140057780:	41 5b                	pop    %r11
   140057782:	41 5a                	pop    %r10
   140057784:	9d                   	popf
   140057785:	e9 16 ad ff ff       	jmp    0x1400524a0
   14005778a:	9c                   	pushf
   14005778b:	57                   	push   %rdi
   14005778c:	53                   	push   %rbx
   14005778d:	48 bf 22 c9 df 2b a2 	movabs $0x2452ada22bdfc922,%rdi
   140057794:	ad 52 24 
   140057797:	48 89 fb             	mov    %rdi,%rbx
   14005779a:	48 c1 fb 1f          	sar    $0x1f,%rbx
   14005779e:	48 d1 ff             	sar    $1,%rdi
   1400577a1:	48 c1 fb 02          	sar    $0x2,%rbx
   1400577a5:	48 c1 fb 02          	sar    $0x2,%rbx
   1400577a9:	48 c1 ff 11          	sar    $0x11,%rdi
   1400577ad:	48 c1 ff 02          	sar    $0x2,%rdi
   1400577b1:	48 d1 ff             	sar    $1,%rdi
   1400577b4:	48 c1 fb 15          	sar    $0x15,%rbx
   1400577b8:	48 c1 fb 09          	sar    $0x9,%rbx
   1400577bc:	48 c1 fb 15          	sar    $0x15,%rbx
   1400577c0:	48 d1 ff             	sar    $1,%rdi
   1400577c3:	48 c1 ff 1b          	sar    $0x1b,%rdi
   1400577c7:	48 c1 ff 07          	sar    $0x7,%rdi
   1400577cb:	48 c1 fb 04          	sar    $0x4,%rbx
   1400577cf:	48 c1 fb 09          	sar    $0x9,%rbx
   1400577d3:	48 d1 ff             	sar    $1,%rdi
   1400577d6:	48 c1 fb 05          	sar    $0x5,%rbx
   1400577da:	48 c1 ff 15          	sar    $0x15,%rdi
   1400577de:	48 c1 fb 03          	sar    $0x3,%rbx
   1400577e2:	48 c1 fb 05          	sar    $0x5,%rbx
   1400577e6:	48 d1 fb             	sar    $1,%rbx
   1400577e9:	48 d1 fb             	sar    $1,%rbx
   1400577ec:	48 c1 ff 03          	sar    $0x3,%rdi
   1400577f0:	48 c1 ff 09          	sar    $0x9,%rdi
   1400577f4:	48 c1 ff 1f          	sar    $0x1f,%rdi
   1400577f8:	48 c1 fb 11          	sar    $0x11,%rbx
   1400577fc:	48 c1 fb 02          	sar    $0x2,%rbx
   140057800:	48 c1 ff 02          	sar    $0x2,%rdi
   140057804:	48 c1 fb 02          	sar    $0x2,%rbx
   140057808:	48 c1 fb 0d          	sar    $0xd,%rbx
   14005780c:	48 c1 ff 04          	sar    $0x4,%rdi
   140057810:	48 c1 fb 1f          	sar    $0x1f,%rbx
   140057814:	48 d1 fb             	sar    $1,%rbx
   140057817:	48 c1 ff 02          	sar    $0x2,%rdi
   14005781b:	48 c1 ff 02          	sar    $0x2,%rdi
   14005781f:	48 c1 ff 15          	sar    $0x15,%rdi
   140057823:	48 c1 fb 1b          	sar    $0x1b,%rbx
   140057827:	48 31 df             	xor    %rbx,%rdi
   14005782a:	48 bb a7 47 c3 c3 9d 	movabs $0x459bd79dc3c347a7,%rbx
   140057831:	d7 9b 45 
   140057834:	48 31 df             	xor    %rbx,%rdi
   140057837:	48 c1 ff 3f          	sar    $0x3f,%rdi
   14005783b:	48 89 fb             	mov    %rdi,%rbx
   14005783e:	48 ff c3             	inc    %rbx
   140057841:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
   140057845:	48 85 db             	test   %rbx,%rbx
   140057848:	75 0a                	jne    0x140057854
   14005784a:	48 c1 e3 28          	shl    $0x28,%rbx
   14005784e:	48 8b 3c 1c          	mov    (%rsp,%rbx,1),%rdi
   140057852:	eb 11                	jmp    0x140057865
   140057854:	48 c1 ff 11          	sar    $0x11,%rdi
   140057858:	48 bb 00 00 00 00 00 	movabs $0x10000000000,%rbx
   14005785f:	01 00 00 
   140057862:	48 8b 3b             	mov    (%rbx),%rdi
   140057865:	5b                   	pop    %rbx
   140057866:	5f                   	pop    %rdi
   140057867:	9d                   	popf
   140057868:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
   14005786f:	83 3c 24 00          	cmpl   $0x0,(%rsp)
   140057873:	0f 84 49 03 00 00    	je     0x140057bc2
   140057879:	9c                   	pushf
   14005787a:	52                   	push   %rdx
   14005787b:	56                   	push   %rsi
   14005787c:	ba 6e 5d 0a 3b       	mov    $0x3b0a5d6e,%edx
   140057881:	89 d6                	mov    %edx,%esi
   140057883:	c1 fe 07             	sar    $0x7,%esi
   140057886:	c1 fe 0f             	sar    $0xf,%esi
   140057889:	c1 fe 0b             	sar    $0xb,%esi
   14005788c:	c1 fa 1f             	sar    $0x1f,%edx
   14005788f:	c1 fa 04             	sar    $0x4,%edx
   140057892:	c1 fe 05             	sar    $0x5,%esi
   140057895:	c1 fa 15             	sar    $0x15,%edx
   140057898:	c1 fa 0f             	sar    $0xf,%edx
   14005789b:	c1 fa 0d             	sar    $0xd,%edx
   14005789e:	c1 fe 15             	sar    $0x15,%esi
   1400578a1:	c1 fe 04             	sar    $0x4,%esi
   1400578a4:	c1 fa 11             	sar    $0x11,%edx
   1400578a7:	c1 fa 09             	sar    $0x9,%edx
   1400578aa:	c1 fe 1f             	sar    $0x1f,%esi
   1400578ad:	c1 fe 05             	sar    $0x5,%esi
   1400578b0:	c1 fe 0b             	sar    $0xb,%esi
   1400578b3:	c1 fa 08             	sar    $0x8,%edx
   1400578b6:	c1 fa 0b             	sar    $0xb,%edx
   1400578b9:	c1 fe 15             	sar    $0x15,%esi
   1400578bc:	c1 fe 02             	sar    $0x2,%esi
   1400578bf:	c1 fa 15             	sar    $0x15,%edx
   1400578c2:	c1 fa 02             	sar    $0x2,%edx
   1400578c5:	c1 fa 09             	sar    $0x9,%edx
   1400578c8:	c1 fe 0d             	sar    $0xd,%esi
   1400578cb:	c1 fe 11             	sar    $0x11,%esi
   1400578ce:	c1 fe 11             	sar    $0x11,%esi
   1400578d1:	c1 fe 07             	sar    $0x7,%esi
   1400578d4:	c1 fe 05             	sar    $0x5,%esi
   1400578d7:	c1 fe 0d             	sar    $0xd,%esi
   1400578da:	d1 fa                	sar    $1,%edx
   1400578dc:	c1 fa 0f             	sar    $0xf,%edx
   1400578df:	d1 fa                	sar    $1,%edx
   1400578e1:	c1 fe 15             	sar    $0x15,%esi
   1400578e4:	c1 fe 04             	sar    $0x4,%esi
   1400578e7:	c1 fa 09             	sar    $0x9,%edx
   1400578ea:	c1 fe 0f             	sar    $0xf,%esi
   1400578ed:	c1 fa 0d             	sar    $0xd,%edx
   1400578f0:	c1 fe 09             	sar    $0x9,%esi
   1400578f3:	31 f2                	xor    %esi,%edx
   1400578f5:	81 f2 68 c1 ae 52    	xor    $0x52aec168,%edx
   1400578fb:	c1 fa 1f             	sar    $0x1f,%edx
   1400578fe:	8d 72 01             	lea    0x1(%rdx),%esi
   140057901:	0f af f2             	imul   %edx,%esi
   140057904:	85 f6                	test   %esi,%esi
   140057906:	75 09                	jne    0x140057911
   140057908:	48 c1 ce 20          	ror    $0x20,%rsi
   14005790c:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   14005790f:	eb 0f                	jmp    0x140057920
   140057911:	c1 fa 0d             	sar    $0xd,%edx
   140057914:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   14005791b:	01 00 00 
   14005791e:	8b 16                	mov    (%rsi),%edx
   140057920:	5e                   	pop    %rsi
   140057921:	5a                   	pop    %rdx
   140057922:	9d                   	popf
   140057923:	8b 04 24             	mov    (%rsp),%eax
   140057926:	83 f8 ff             	cmp    $0xffffffff,%eax
   140057929:	0f 84 93 02 00 00    	je     0x140057bc2
   14005792f:	9c                   	pushf
   140057930:	50                   	push   %rax
   140057931:	52                   	push   %rdx
   140057932:	b8 8a 9f 95 6f       	mov    $0x6f959f8a,%eax
   140057937:	89 c2                	mov    %eax,%edx
   140057939:	c1 fa 15             	sar    $0x15,%edx
   14005793c:	c1 fa 04             	sar    $0x4,%edx
   14005793f:	c1 f8 05             	sar    $0x5,%eax
   140057942:	c1 fa 15             	sar    $0x15,%edx
   140057945:	d1 f8                	sar    $1,%eax
   140057947:	c1 f8 1f             	sar    $0x1f,%eax
   14005794a:	c1 fa 04             	sar    $0x4,%edx
   14005794d:	c1 fa 04             	sar    $0x4,%edx
   140057950:	c1 f8 0f             	sar    $0xf,%eax
   140057953:	c1 f8 1f             	sar    $0x1f,%eax
   140057956:	c1 f8 0f             	sar    $0xf,%eax
   140057959:	c1 f8 1f             	sar    $0x1f,%eax
   14005795c:	d1 f8                	sar    $1,%eax
   14005795e:	c1 fa 15             	sar    $0x15,%edx
   140057961:	c1 f8 07             	sar    $0x7,%eax
   140057964:	c1 f8 11             	sar    $0x11,%eax
   140057967:	c1 f8 1f             	sar    $0x1f,%eax
   14005796a:	c1 fa 08             	sar    $0x8,%edx
   14005796d:	c1 f8 09             	sar    $0x9,%eax
   140057970:	c1 fa 08             	sar    $0x8,%edx
   140057973:	c1 f8 04             	sar    $0x4,%eax
   140057976:	c1 fa 0f             	sar    $0xf,%edx
   140057979:	c1 f8 0d             	sar    $0xd,%eax
   14005797c:	c1 fa 0d             	sar    $0xd,%edx
   14005797f:	c1 f8 08             	sar    $0x8,%eax
   140057982:	d1 f8                	sar    $1,%eax
   140057984:	c1 fa 0d             	sar    $0xd,%edx
   140057987:	c1 fa 02             	sar    $0x2,%edx
   14005798a:	c1 f8 15             	sar    $0x15,%eax
   14005798d:	c1 f8 08             	sar    $0x8,%eax
   140057990:	c1 f8 0d             	sar    $0xd,%eax
   140057993:	c1 fa 0b             	sar    $0xb,%edx
   140057996:	d1 fa                	sar    $1,%edx
   140057998:	c1 fa 02             	sar    $0x2,%edx
   14005799b:	31 d0                	xor    %edx,%eax
   14005799d:	35 1c b7 9a 7c       	xor    $0x7c9ab71c,%eax
   1400579a2:	c1 f8 1f             	sar    $0x1f,%eax
   1400579a5:	89 c2                	mov    %eax,%edx
   1400579a7:	d1 fa                	sar    $1,%edx
   1400579a9:	31 c2                	xor    %eax,%edx
   1400579ab:	85 d2                	test   %edx,%edx
   1400579ad:	75 09                	jne    0x1400579b8
   1400579af:	48 c1 e2 28          	shl    $0x28,%rdx
   1400579b3:	8b 04 14             	mov    (%rsp,%rdx,1),%eax
   1400579b6:	eb 0f                	jmp    0x1400579c7
   1400579b8:	c1 f8 0d             	sar    $0xd,%eax
   1400579bb:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
   1400579c2:	01 00 00 
   1400579c5:	8b 02                	mov    (%rdx),%eax
   1400579c7:	5a                   	pop    %rdx
   1400579c8:	58                   	pop    %rax
   1400579c9:	9d                   	popf
   1400579ca:	89 d8                	mov    %ebx,%eax
   1400579cc:	9c                   	pushf
   1400579cd:	51                   	push   %rcx
   1400579ce:	41 50                	push   %r8
   1400579d0:	48 b9 65 62 81 6b 4b 	movabs $0x3a65104b6b816265,%rcx
   1400579d7:	10 65 3a 
   1400579da:	49 89 c8             	mov    %rcx,%r8
   1400579dd:	49 d1 f8             	sar    $1,%r8
   1400579e0:	49 c1 f8 04          	sar    $0x4,%r8
   1400579e4:	48 c1 f9 1f          	sar    $0x1f,%rcx
   1400579e8:	49 c1 f8 09          	sar    $0x9,%r8
   1400579ec:	49 c1 f8 07          	sar    $0x7,%r8
   1400579f0:	48 c1 f9 15          	sar    $0x15,%rcx
   1400579f4:	48 c1 f9 0b          	sar    $0xb,%rcx
   1400579f8:	48 c1 f9 09          	sar    $0x9,%rcx
   1400579fc:	49 c1 f8 02          	sar    $0x2,%r8
   140057a00:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140057a04:	49 c1 f8 0d          	sar    $0xd,%r8
   140057a08:	49 c1 f8 0d          	sar    $0xd,%r8
   140057a0c:	49 c1 f8 04          	sar    $0x4,%r8
   140057a10:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140057a14:	48 c1 f9 15          	sar    $0x15,%rcx
   140057a18:	48 d1 f9             	sar    $1,%rcx
   140057a1b:	49 d1 f8             	sar    $1,%r8
   140057a1e:	48 c1 f9 0d          	sar    $0xd,%rcx
   140057a22:	48 c1 f9 11          	sar    $0x11,%rcx
   140057a26:	49 c1 f8 0d          	sar    $0xd,%r8
   140057a2a:	49 d1 f8             	sar    $1,%r8
   140057a2d:	48 d1 f9             	sar    $1,%rcx
   140057a30:	49 c1 f8 0b          	sar    $0xb,%r8
   140057a34:	48 c1 f9 04          	sar    $0x4,%rcx
   140057a38:	4c 31 c1             	xor    %r8,%rcx
   140057a3b:	49 b8 17 93 74 db 8c 	movabs $0x50e36c8cdb749317,%r8
   140057a42:	6c e3 50 
   140057a45:	4c 31 c1             	xor    %r8,%rcx
   140057a48:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140057a4c:	49 89 c8             	mov    %rcx,%r8
   140057a4f:	49 ff c0             	inc    %r8
   140057a52:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
   140057a56:	4d 85 c0             	test   %r8,%r8
   140057a59:	75 0a                	jne    0x140057a65
   140057a5b:	49 c1 e0 2a          	shl    $0x2a,%r8
   140057a5f:	4a 8b 0c 04          	mov    (%rsp,%r8,1),%rcx
   140057a63:	eb 11                	jmp    0x140057a76
   140057a65:	48 c1 f9 11          	sar    $0x11,%rcx
   140057a69:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140057a70:	01 00 00 
   140057a73:	49 8b 08             	mov    (%r8),%rcx
   140057a76:	41 58                	pop    %r8
   140057a78:	59                   	pop    %rcx
   140057a79:	9d                   	popf
   140057a7a:	35 37 13 00 00       	xor    $0x1337,%eax
   140057a7f:	9c                   	pushf
   140057a80:	50                   	push   %rax
   140057a81:	51                   	push   %rcx
   140057a82:	48 b8 87 20 55 e3 88 	movabs $0x4e701588e3552087,%rax
   140057a89:	15 70 4e 
   140057a8c:	48 89 c1             	mov    %rax,%rcx
   140057a8f:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140057a93:	48 c1 f9 11          	sar    $0x11,%rcx
   140057a97:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140057a9b:	48 c1 f8 04          	sar    $0x4,%rax
   140057a9f:	48 d1 f9             	sar    $1,%rcx
   140057aa2:	48 c1 f9 05          	sar    $0x5,%rcx
   140057aa6:	48 c1 f8 09          	sar    $0x9,%rax
   140057aaa:	48 c1 f8 11          	sar    $0x11,%rax
   140057aae:	48 c1 f8 05          	sar    $0x5,%rax
   140057ab2:	48 d1 f8             	sar    $1,%rax
   140057ab5:	48 c1 f9 09          	sar    $0x9,%rcx
   140057ab9:	48 c1 f9 05          	sar    $0x5,%rcx
   140057abd:	48 c1 f9 15          	sar    $0x15,%rcx
   140057ac1:	48 c1 f9 02          	sar    $0x2,%rcx
   140057ac5:	48 c1 f9 02          	sar    $0x2,%rcx
   140057ac9:	48 c1 f8 0d          	sar    $0xd,%rax
   140057acd:	48 c1 f8 11          	sar    $0x11,%rax
   140057ad1:	48 c1 f8 1f          	sar    $0x1f,%rax
   140057ad5:	48 d1 f8             	sar    $1,%rax
   140057ad8:	48 c1 f8 02          	sar    $0x2,%rax
   140057adc:	48 c1 f8 1f          	sar    $0x1f,%rax
   140057ae0:	48 c1 f9 15          	sar    $0x15,%rcx
   140057ae4:	48 c1 f8 1b          	sar    $0x1b,%rax
   140057ae8:	48 c1 f9 15          	sar    $0x15,%rcx
   140057aec:	48 c1 f8 0d          	sar    $0xd,%rax
   140057af0:	48 31 c8             	xor    %rcx,%rax
   140057af3:	48 b9 9a dd e9 c6 49 	movabs $0x3cccb649c6e9dd9a,%rcx
   140057afa:	b6 cc 3c 
   140057afd:	48 31 c8             	xor    %rcx,%rax
   140057b00:	48 c1 f8 3f          	sar    $0x3f,%rax
   140057b04:	48 8d 48 01          	lea    0x1(%rax),%rcx
   140057b08:	48 0f af c8          	imul   %rax,%rcx
   140057b0c:	48 85 c9             	test   %rcx,%rcx
   140057b0f:	75 0a                	jne    0x140057b1b
   140057b11:	48 c1 e1 28          	shl    $0x28,%rcx
   140057b15:	48 8b 04 0c          	mov    (%rsp,%rcx,1),%rax
   140057b19:	eb 11                	jmp    0x140057b2c
   140057b1b:	48 c1 f8 11          	sar    $0x11,%rax
   140057b1f:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140057b26:	01 00 00 
   140057b29:	48 8b 01             	mov    (%rcx),%rax
   140057b2c:	59                   	pop    %rcx
   140057b2d:	58                   	pop    %rax
   140057b2e:	9d                   	popf
   140057b2f:	81 e3 37 13 00 00    	and    $0x1337,%ebx
   140057b35:	9c                   	pushf
   140057b36:	52                   	push   %rdx
   140057b37:	56                   	push   %rsi
   140057b38:	ba 83 9e 65 15       	mov    $0x15659e83,%edx
   140057b3d:	89 d6                	mov    %edx,%esi
   140057b3f:	c1 fe 09             	sar    $0x9,%esi
   140057b42:	c1 fa 09             	sar    $0x9,%edx
   140057b45:	c1 fe 04             	sar    $0x4,%esi
   140057b48:	c1 fe 0f             	sar    $0xf,%esi
   140057b4b:	c1 fe 04             	sar    $0x4,%esi
   140057b4e:	c1 fe 08             	sar    $0x8,%esi
   140057b51:	c1 fe 05             	sar    $0x5,%esi
   140057b54:	c1 fe 05             	sar    $0x5,%esi
   140057b57:	c1 fa 02             	sar    $0x2,%edx
   140057b5a:	c1 fe 08             	sar    $0x8,%esi
   140057b5d:	c1 fa 03             	sar    $0x3,%edx
   140057b60:	c1 fa 0b             	sar    $0xb,%edx
   140057b63:	c1 fe 0f             	sar    $0xf,%esi
   140057b66:	c1 fe 04             	sar    $0x4,%esi
   140057b69:	c1 fa 07             	sar    $0x7,%edx
   140057b6c:	c1 fa 0f             	sar    $0xf,%edx
   140057b6f:	c1 fe 04             	sar    $0x4,%esi
   140057b72:	c1 fe 08             	sar    $0x8,%esi
   140057b75:	c1 fe 03             	sar    $0x3,%esi
   140057b78:	c1 fe 11             	sar    $0x11,%esi
   140057b7b:	c1 fa 04             	sar    $0x4,%edx
   140057b7e:	c1 fe 07             	sar    $0x7,%esi
   140057b81:	c1 fa 02             	sar    $0x2,%edx
   140057b84:	c1 fe 03             	sar    $0x3,%esi
   140057b87:	c1 fa 07             	sar    $0x7,%edx
   140057b8a:	c1 fe 07             	sar    $0x7,%esi
   140057b8d:	c1 fa 11             	sar    $0x11,%edx
   140057b90:	31 f2                	xor    %esi,%edx
   140057b92:	81 f2 d8 72 41 3c    	xor    $0x3c4172d8,%edx
   140057b98:	c1 fa 1f             	sar    $0x1f,%edx
   140057b9b:	89 d6                	mov    %edx,%esi
   140057b9d:	d1 fe                	sar    $1,%esi
   140057b9f:	31 d6                	xor    %edx,%esi
   140057ba1:	85 f6                	test   %esi,%esi
   140057ba3:	75 08                	jne    0x140057bad
   140057ba5:	48 0f ce             	bswap  %rsi
   140057ba8:	8b 14 34             	mov    (%rsp,%rsi,1),%edx
   140057bab:	eb 0f                	jmp    0x140057bbc
   140057bad:	c1 fa 0d             	sar    $0xd,%edx
   140057bb0:	48 be 00 00 00 00 00 	movabs $0x10000000000,%rsi
   140057bb7:	01 00 00 
   140057bba:	8b 16                	mov    (%rsi),%edx
   140057bbc:	5e                   	pop    %rsi
   140057bbd:	5a                   	pop    %rdx
   140057bbe:	9d                   	popf
   140057bbf:	8d 1c 58             	lea    (%rax,%rbx,2),%ebx
   140057bc2:	9c                   	pushf
   140057bc3:	50                   	push   %rax
   140057bc4:	51                   	push   %rcx
   140057bc5:	b8 bb d6 d7 1e       	mov    $0x1ed7d6bb,%eax
   140057bca:	89 c1                	mov    %eax,%ecx
   140057bcc:	d1 f8                	sar    $1,%eax
   140057bce:	c1 f9 07             	sar    $0x7,%ecx
   140057bd1:	c1 f9 0d             	sar    $0xd,%ecx
   140057bd4:	c1 f8 15             	sar    $0x15,%eax
   140057bd7:	c1 f8 05             	sar    $0x5,%eax
   140057bda:	c1 f8 1f             	sar    $0x1f,%eax
   140057bdd:	c1 f9 09             	sar    $0x9,%ecx
   140057be0:	c1 f9 09             	sar    $0x9,%ecx
   140057be3:	c1 f9 07             	sar    $0x7,%ecx
   140057be6:	c1 f8 0f             	sar    $0xf,%eax
   140057be9:	c1 f8 07             	sar    $0x7,%eax
   140057bec:	c1 f8 0d             	sar    $0xd,%eax
   140057bef:	c1 f9 03             	sar    $0x3,%ecx
   140057bf2:	c1 f9 07             	sar    $0x7,%ecx
   140057bf5:	c1 f8 15             	sar    $0x15,%eax
   140057bf8:	c1 f9 11             	sar    $0x11,%ecx
   140057bfb:	c1 f9 1f             	sar    $0x1f,%ecx
   140057bfe:	d1 f9                	sar    $1,%ecx
   140057c00:	c1 f9 15             	sar    $0x15,%ecx
   140057c03:	c1 f8 08             	sar    $0x8,%eax
   140057c06:	c1 f9 0d             	sar    $0xd,%ecx
   140057c09:	c1 f8 0d             	sar    $0xd,%eax
   140057c0c:	c1 f9 07             	sar    $0x7,%ecx
   140057c0f:	c1 f8 0b             	sar    $0xb,%eax
   140057c12:	c1 f9 08             	sar    $0x8,%ecx
   140057c15:	c1 f9 07             	sar    $0x7,%ecx
   140057c18:	c1 f9 05             	sar    $0x5,%ecx
   140057c1b:	c1 f9 11             	sar    $0x11,%ecx
   140057c1e:	c1 f8 1f             	sar    $0x1f,%eax
   140057c21:	c1 f8 1f             	sar    $0x1f,%eax
   140057c24:	c1 f8 11             	sar    $0x11,%eax
   140057c27:	c1 f8 0d             	sar    $0xd,%eax
   140057c2a:	c1 f9 0f             	sar    $0xf,%ecx
   140057c2d:	c1 f9 0d             	sar    $0xd,%ecx
   140057c30:	c1 f8 0f             	sar    $0xf,%eax
   140057c33:	d1 f9                	sar    $1,%ecx
   140057c35:	c1 f9 1f             	sar    $0x1f,%ecx
   140057c38:	31 c8                	xor    %ecx,%eax
   140057c3a:	35 fd de 31 7e       	xor    $0x7e31defd,%eax
   140057c3f:	c1 f8 1f             	sar    $0x1f,%eax
   140057c42:	8d 48 01             	lea    0x1(%rax),%ecx
   140057c45:	0f af c8             	imul   %eax,%ecx
   140057c48:	85 c9                	test   %ecx,%ecx
   140057c4a:	75 09                	jne    0x140057c55
   140057c4c:	48 c1 e1 28          	shl    $0x28,%rcx
   140057c50:	8b 04 0c             	mov    (%rsp,%rcx,1),%eax
   140057c53:	eb 0f                	jmp    0x140057c64
   140057c55:	c1 f8 0d             	sar    $0xd,%eax
   140057c58:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140057c5f:	01 00 00 
   140057c62:	8b 01                	mov    (%rcx),%eax
   140057c64:	59                   	pop    %rcx
   140057c65:	58                   	pop    %rax
   140057c66:	9d                   	popf
   140057c67:	b8 c3 38 00 00       	mov    $0x38c3,%eax
   140057c6c:	9c                   	pushf
   140057c6d:	50                   	push   %rax
   140057c6e:	51                   	push   %rcx
   140057c6f:	48 b8 85 23 0e 51 b1 	movabs $0x7b34a6b1510e2385,%rax
   140057c76:	a6 34 7b 
   140057c79:	48 89 c1             	mov    %rax,%rcx
   140057c7c:	48 c1 f8 1f          	sar    $0x1f,%rax
   140057c80:	48 c1 f9 0b          	sar    $0xb,%rcx
   140057c84:	48 c1 f9 04          	sar    $0x4,%rcx
   140057c88:	48 c1 f9 15          	sar    $0x15,%rcx
   140057c8c:	48 c1 f9 15          	sar    $0x15,%rcx
   140057c90:	48 c1 f8 02          	sar    $0x2,%rax
   140057c94:	48 d1 f8             	sar    $1,%rax
   140057c97:	48 c1 f9 15          	sar    $0x15,%rcx
   140057c9b:	48 c1 f8 04          	sar    $0x4,%rax
   140057c9f:	48 c1 f9 09          	sar    $0x9,%rcx
   140057ca3:	48 c1 f9 11          	sar    $0x11,%rcx
   140057ca7:	48 c1 f9 03          	sar    $0x3,%rcx
   140057cab:	48 d1 f8             	sar    $1,%rax
   140057cae:	48 c1 f8 1f          	sar    $0x1f,%rax
   140057cb2:	48 c1 f8 07          	sar    $0x7,%rax
   140057cb6:	48 c1 f8 03          	sar    $0x3,%rax
   140057cba:	48 d1 f9             	sar    $1,%rcx
   140057cbd:	48 c1 f8 02          	sar    $0x2,%rax
   140057cc1:	48 c1 f8 11          	sar    $0x11,%rax
   140057cc5:	48 c1 f9 09          	sar    $0x9,%rcx
   140057cc9:	48 c1 f9 09          	sar    $0x9,%rcx
   140057ccd:	48 c1 f9 03          	sar    $0x3,%rcx
   140057cd1:	48 c1 f8 1b          	sar    $0x1b,%rax
   140057cd5:	48 c1 f9 03          	sar    $0x3,%rcx
   140057cd9:	48 c1 f8 11          	sar    $0x11,%rax
   140057cdd:	48 c1 f9 03          	sar    $0x3,%rcx
   140057ce1:	48 c1 f9 0d          	sar    $0xd,%rcx
   140057ce5:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140057ce9:	48 c1 f9 05          	sar    $0x5,%rcx
   140057ced:	48 c1 f8 03          	sar    $0x3,%rax
   140057cf1:	48 c1 f8 11          	sar    $0x11,%rax
   140057cf5:	48 c1 f8 04          	sar    $0x4,%rax
   140057cf9:	48 c1 f9 04          	sar    $0x4,%rcx
   140057cfd:	48 31 c8             	xor    %rcx,%rax
   140057d00:	48 b9 04 95 02 1a c9 	movabs $0x35fe20c91a029504,%rcx
   140057d07:	20 fe 35 
   140057d0a:	48 31 c8             	xor    %rcx,%rax
   140057d0d:	48 c1 f8 3f          	sar    $0x3f,%rax
   140057d11:	48 89 c1             	mov    %rax,%rcx
   140057d14:	48 d1 f9             	sar    $1,%rcx
   140057d17:	48 31 c1             	xor    %rax,%rcx
   140057d1a:	48 85 c9             	test   %rcx,%rcx
   140057d1d:	75 0a                	jne    0x140057d29
   140057d1f:	48 c1 e1 2a          	shl    $0x2a,%rcx
   140057d23:	48 8b 04 0c          	mov    (%rsp,%rcx,1),%rax
   140057d27:	eb 11                	jmp    0x140057d3a
   140057d29:	48 c1 f8 11          	sar    $0x11,%rax
   140057d2d:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
   140057d34:	01 00 00 
   140057d37:	48 8b 01             	mov    (%rcx),%rax
   140057d3a:	59                   	pop    %rcx
   140057d3b:	58                   	pop    %rax
   140057d3c:	9d                   	popf
   140057d3d:	e9 5e a7 ff ff       	jmp    0x1400524a0
   140057d42:	9c                   	pushf
   140057d43:	41 51                	push   %r9
   140057d45:	41 52                	push   %r10
   140057d47:	41 b9 50 90 4e 42    	mov    $0x424e9050,%r9d
   140057d4d:	45 89 ca             	mov    %r9d,%r10d
   140057d50:	41 c1 fa 08          	sar    $0x8,%r10d
   140057d54:	41 c1 f9 02          	sar    $0x2,%r9d
   140057d58:	41 c1 fa 09          	sar    $0x9,%r10d
   140057d5c:	41 c1 f9 03          	sar    $0x3,%r9d
   140057d60:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140057d64:	41 c1 fa 15          	sar    $0x15,%r10d
   140057d68:	41 c1 fa 08          	sar    $0x8,%r10d
   140057d6c:	41 d1 f9             	sar    $1,%r9d
   140057d6f:	41 c1 fa 02          	sar    $0x2,%r10d
   140057d73:	41 c1 f9 03          	sar    $0x3,%r9d
   140057d77:	41 c1 fa 03          	sar    $0x3,%r10d
   140057d7b:	41 c1 f9 04          	sar    $0x4,%r9d
   140057d7f:	41 c1 fa 11          	sar    $0x11,%r10d
   140057d83:	41 c1 fa 08          	sar    $0x8,%r10d
   140057d87:	41 c1 fa 09          	sar    $0x9,%r10d
   140057d8b:	41 c1 f9 15          	sar    $0x15,%r9d
   140057d8f:	41 c1 f9 0d          	sar    $0xd,%r9d
   140057d93:	41 c1 f9 03          	sar    $0x3,%r9d
   140057d97:	41 c1 f9 08          	sar    $0x8,%r9d
   140057d9b:	41 c1 f9 0f          	sar    $0xf,%r9d
   140057d9f:	41 c1 fa 02          	sar    $0x2,%r10d
   140057da3:	41 c1 f9 02          	sar    $0x2,%r9d
   140057da7:	41 c1 fa 0f          	sar    $0xf,%r10d
   140057dab:	41 c1 fa 07          	sar    $0x7,%r10d
   140057daf:	41 c1 f9 02          	sar    $0x2,%r9d
   140057db3:	41 c1 fa 04          	sar    $0x4,%r10d
   140057db7:	41 c1 fa 1f          	sar    $0x1f,%r10d
   140057dbb:	41 c1 f9 05          	sar    $0x5,%r9d
   140057dbf:	41 c1 fa 15          	sar    $0x15,%r10d
   140057dc3:	41 c1 f9 0f          	sar    $0xf,%r9d
   140057dc7:	41 c1 f9 0d          	sar    $0xd,%r9d
   140057dcb:	41 c1 f9 07          	sar    $0x7,%r9d
   140057dcf:	41 c1 f9 15          	sar    $0x15,%r9d
   140057dd3:	41 c1 fa 09          	sar    $0x9,%r10d
   140057dd7:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057ddb:	45 31 d1             	xor    %r10d,%r9d
   140057dde:	41 81 f1 dc 42 b2 1a 	xor    $0x1ab242dc,%r9d
   140057de5:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140057de9:	45 89 ca             	mov    %r9d,%r10d
   140057dec:	41 ff c2             	inc    %r10d
   140057def:	41 83 e2 fe          	and    $0xfffffffe,%r10d
   140057df3:	45 85 d2             	test   %r10d,%r10d
   140057df6:	75 0a                	jne    0x140057e02
   140057df8:	49 c1 e2 26          	shl    $0x26,%r10
   140057dfc:	46 8b 0c 54          	mov    (%rsp,%r10,2),%r9d
   140057e00:	eb 11                	jmp    0x140057e13
   140057e02:	41 c1 f9 0d          	sar    $0xd,%r9d
   140057e06:	49 ba 00 00 00 00 00 	movabs $0x10000000000,%r10
   140057e0d:	01 00 00 
   140057e10:	45 8b 0a             	mov    (%r10),%r9d
   140057e13:	41 5a                	pop    %r10
   140057e15:	41 59                	pop    %r9
   140057e17:	9d                   	popf
   140057e18:	c7 04 25 00 00 00 00 	movl   $0xdead,0x0
   140057e1f:	ad de 00 00 
   140057e23:	9c                   	pushf
   140057e24:	51                   	push   %rcx
   140057e25:	41 50                	push   %r8
   140057e27:	48 b9 61 69 1e 49 57 	movabs $0x425dd657491e6961,%rcx
   140057e2e:	d6 5d 42 
   140057e31:	49 89 c8             	mov    %rcx,%r8
   140057e34:	49 c1 f8 0b          	sar    $0xb,%r8
   140057e38:	48 c1 f9 09          	sar    $0x9,%rcx
   140057e3c:	49 c1 f8 0d          	sar    $0xd,%r8
   140057e40:	48 c1 f9 03          	sar    $0x3,%rcx
   140057e44:	48 c1 f9 0d          	sar    $0xd,%rcx
   140057e48:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140057e4c:	48 c1 f9 15          	sar    $0x15,%rcx
   140057e50:	49 d1 f8             	sar    $1,%r8
   140057e53:	48 c1 f9 0d          	sar    $0xd,%rcx
   140057e57:	49 c1 f8 09          	sar    $0x9,%r8
   140057e5b:	49 c1 f8 02          	sar    $0x2,%r8
   140057e5f:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140057e63:	48 c1 f9 1b          	sar    $0x1b,%rcx
   140057e67:	48 c1 f9 04          	sar    $0x4,%rcx
   140057e6b:	49 c1 f8 09          	sar    $0x9,%r8
   140057e6f:	49 c1 f8 15          	sar    $0x15,%r8
   140057e73:	49 c1 f8 03          	sar    $0x3,%r8
   140057e77:	48 c1 f9 09          	sar    $0x9,%rcx
   140057e7b:	49 c1 f8 09          	sar    $0x9,%r8
   140057e7f:	48 c1 f9 1f          	sar    $0x1f,%rcx
   140057e83:	48 c1 f9 07          	sar    $0x7,%rcx
   140057e87:	48 d1 f9             	sar    $1,%rcx
   140057e8a:	48 d1 f9             	sar    $1,%rcx
   140057e8d:	49 c1 f8 1b          	sar    $0x1b,%r8
   140057e91:	48 c1 f9 03          	sar    $0x3,%rcx
   140057e95:	48 c1 f9 05          	sar    $0x5,%rcx
   140057e99:	48 c1 f9 0d          	sar    $0xd,%rcx
   140057e9d:	4c 31 c1             	xor    %r8,%rcx
   140057ea0:	49 b8 1b b6 90 08 24 	movabs $0x336edf240890b61b,%r8
   140057ea7:	df 6e 33 
   140057eaa:	4c 31 c1             	xor    %r8,%rcx
   140057ead:	48 c1 f9 3f          	sar    $0x3f,%rcx
   140057eb1:	4c 8d 41 01          	lea    0x1(%rcx),%r8
   140057eb5:	4c 0f af c1          	imul   %rcx,%r8
   140057eb9:	4d 85 c0             	test   %r8,%r8
   140057ebc:	75 09                	jne    0x140057ec7
   140057ebe:	49 0f c8             	bswap  %r8
   140057ec1:	4a 8b 0c c4          	mov    (%rsp,%r8,8),%rcx
   140057ec5:	eb 11                	jmp    0x140057ed8
   140057ec7:	48 c1 f9 11          	sar    $0x11,%rcx
   140057ecb:	49 b8 00 00 00 00 00 	movabs $0x10000000000,%r8
   140057ed2:	01 00 00 
   140057ed5:	49 8b 08             	mov    (%r8),%rcx
   140057ed8:	41 58                	pop    %r8
   140057eda:	59                   	pop    %rcx
   140057edb:	9d                   	popf
   140057edc:	45 31 c9             	xor    %r9d,%r9d
   140057edf:	9c                   	pushf
   140057ee0:	41 50                	push   %r8
   140057ee2:	41 51                	push   %r9
   140057ee4:	41 b8 08 36 b9 52    	mov    $0x52b93608,%r8d
   140057eea:	45 89 c1             	mov    %r8d,%r9d
   140057eed:	41 c1 f9 11          	sar    $0x11,%r9d
   140057ef1:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057ef5:	41 c1 f8 05          	sar    $0x5,%r8d
   140057ef9:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057efd:	41 c1 f9 05          	sar    $0x5,%r9d
   140057f01:	41 c1 f9 09          	sar    $0x9,%r9d
   140057f05:	41 c1 f8 02          	sar    $0x2,%r8d
   140057f09:	41 c1 f9 1f          	sar    $0x1f,%r9d
   140057f0d:	41 c1 f9 04          	sar    $0x4,%r9d
   140057f11:	41 c1 f8 11          	sar    $0x11,%r8d
   140057f15:	41 c1 f9 08          	sar    $0x8,%r9d
   140057f19:	41 c1 f9 09          	sar    $0x9,%r9d
   140057f1d:	41 c1 f9 0f          	sar    $0xf,%r9d
   140057f21:	41 c1 f9 07          	sar    $0x7,%r9d
   140057f25:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057f29:	41 d1 f9             	sar    $1,%r9d
   140057f2c:	41 c1 f8 08          	sar    $0x8,%r8d
   140057f30:	41 d1 f8             	sar    $1,%r8d
   140057f33:	41 c1 f9 05          	sar    $0x5,%r9d
   140057f37:	41 c1 f8 05          	sar    $0x5,%r8d
   140057f3b:	41 c1 f8 09          	sar    $0x9,%r8d
   140057f3f:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057f43:	41 d1 f9             	sar    $1,%r9d
   140057f46:	41 c1 f8 02          	sar    $0x2,%r8d
   140057f4a:	41 c1 f9 0f          	sar    $0xf,%r9d
   140057f4e:	41 c1 f9 11          	sar    $0x11,%r9d
   140057f52:	41 c1 f9 09          	sar    $0x9,%r9d
   140057f56:	41 c1 f9 05          	sar    $0x5,%r9d
   140057f5a:	41 c1 f8 0f          	sar    $0xf,%r8d
   140057f5e:	41 c1 f9 11          	sar    $0x11,%r9d
   140057f62:	41 c1 f8 0f          	sar    $0xf,%r8d
   140057f66:	41 c1 f9 0b          	sar    $0xb,%r9d
   140057f6a:	45 31 c8             	xor    %r9d,%r8d
   140057f6d:	41 81 f0 b1 96 21 79 	xor    $0x792196b1,%r8d
   140057f74:	41 c1 f8 1f          	sar    $0x1f,%r8d
   140057f78:	45 89 c1             	mov    %r8d,%r9d
   140057f7b:	41 ff c1             	inc    %r9d
   140057f7e:	41 83 e1 fe          	and    $0xfffffffe,%r9d
   140057f82:	45 85 c9             	test   %r9d,%r9d
   140057f85:	75 0a                	jne    0x140057f91
   140057f87:	49 c1 e1 28          	shl    $0x28,%r9
   140057f8b:	46 8b 04 0c          	mov    (%rsp,%r9,1),%r8d
   140057f8f:	eb 11                	jmp    0x140057fa2
   140057f91:	41 c1 f8 0d          	sar    $0xd,%r8d
   140057f95:	49 b9 00 00 00 00 00 	movabs $0x10000000000,%r9
   140057f9c:	01 00 00 
   140057f9f:	45 8b 01             	mov    (%r9),%r8d
   140057fa2:	41 59                	pop    %r9
   140057fa4:	41 58                	pop    %r8
   140057fa6:	9d                   	popf
   140057fa7:	44 89 c8             	mov    %r9d,%eax
   140057faa:	48 83 c4 08          	add    $0x8,%rsp
   140057fae:	5b                   	pop    %rbx
   140057faf:	5d                   	pop    %rbp
   140057fb0:	5f                   	pop    %rdi
   140057fb1:	5e                   	pop    %rsi
   140057fb2:	41 5c                	pop    %r12
   140057fb4:	41 5d                	pop    %r13
   140057fb6:	41 5e                	pop    %r14
   140057fb8:	41 5f                	pop    %r15
   140057fba:	c3                   	ret
   140057fbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
