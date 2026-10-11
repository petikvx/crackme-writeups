  441a34:	55                   	push   %ebp
  441a35:	8b ec                	mov    %esp,%ebp
  441a37:	b9 04 00 00 00       	mov    $0x4,%ecx
  441a3c:	6a 00                	push   $0x0
  441a3e:	6a 00                	push   $0x0
  441a40:	49                   	dec    %ecx
  441a41:	75 f9                	jne    0x441a3c
  441a43:	51                   	push   %ecx
  441a44:	53                   	push   %ebx
  441a45:	56                   	push   %esi
  441a46:	57                   	push   %edi
  441a47:	89 45 fc             	mov    %eax,-0x4(%ebp)
  441a4a:	33 c0                	xor    %eax,%eax
  441a4c:	55                   	push   %ebp
  441a4d:	68 79 1b 44 00       	push   $0x441b79
  441a52:	64 ff 30             	push   %fs:(%eax)
  441a55:	64 89 20             	mov    %esp,%fs:(%eax)
  441a58:	8d 55 dc             	lea    -0x24(%ebp),%edx
  441a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  441a5e:	8b 80 c4 02 00 00    	mov    0x2c4(%eax),%eax
  441a64:	e8 5b 17 fe ff       	call   0x4231c4
  441a69:	8b 45 dc             	mov    -0x24(%ebp),%eax
  441a6c:	e8 db 1f fc ff       	call   0x403a4c
  441a71:	83 e8 02             	sub    $0x2,%eax
  441a74:	0f 8c dc 00 00 00    	jl     0x441b56
  441a7a:	40                   	inc    %eax
  441a7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  441a7e:	bb 02 00 00 00       	mov    $0x2,%ebx
  441a83:	8b f3                	mov    %ebx,%esi
  441a85:	0f af f3             	imul   %ebx,%esi
  441a88:	85 f6                	test   %esi,%esi
  441a8a:	79 03                	jns    0x441a8f
  441a8c:	83 c6 03             	add    $0x3,%esi
  441a8f:	c1 fe 02             	sar    $0x2,%esi
  441a92:	81 c6 26 09 00 00    	add    $0x926,%esi
  441a98:	8b c6                	mov    %esi,%eax
  441a9a:	f7 ee                	imul   %esi
  441a9c:	85 c0                	test   %eax,%eax
  441a9e:	79 03                	jns    0x441aa3
  441aa0:	83 c0 07             	add    $0x7,%eax
  441aa3:	c1 f8 03             	sar    $0x3,%eax
  441aa6:	2d 80 09 00 00       	sub    $0x980,%eax
  441aab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  441aae:	8b c3                	mov    %ebx,%eax
  441ab0:	f7 ee                	imul   %esi
  441ab2:	b9 0c 00 00 00       	mov    $0xc,%ecx
  441ab7:	99                   	cltd
  441ab8:	f7 f9                	idiv   %ecx
  441aba:	8b f8                	mov    %eax,%edi
  441abc:	81 c7 39 06 00 00    	add    $0x639,%edi
  441ac2:	83 ef 19             	sub    $0x19,%edi
  441ac5:	8b c3                	mov    %ebx,%eax
  441ac7:	99                   	cltd
  441ac8:	f7 ff                	idiv   %edi
  441aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  441acd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  441ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  441ad3:	03 c7                	add    %edi,%eax
  441ad5:	03 45 f8             	add    -0x8(%ebp),%eax
  441ad8:	03 c6                	add    %esi,%eax
  441ada:	03 45 f8             	add    -0x8(%ebp),%eax
  441add:	03 c7                	add    %edi,%eax
  441adf:	e8 64 5b fc ff       	call   0x407648
  441ae4:	8d 45 ec             	lea    -0x14(%ebp),%eax
  441ae7:	ba 90 1b 44 00       	mov    $0x441b90,%edx
  441aec:	e8 77 1d fc ff       	call   0x403868
  441af1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  441af4:	ba 9c 1b 44 00       	mov    $0x441b9c,%edx
  441af9:	e8 6a 1d fc ff       	call   0x403868
  441afe:	ff 75 ec             	push   -0x14(%ebp)
  441b01:	ff 75 f0             	push   -0x10(%ebp)
  441b04:	ff 75 e4             	push   -0x1c(%ebp)
  441b07:	8d 45 e8             	lea    -0x18(%ebp),%eax
  441b0a:	ba 03 00 00 00       	mov    $0x3,%edx
  441b0f:	e8 f8 1f fc ff       	call   0x403b0c
  441b14:	8d 55 dc             	lea    -0x24(%ebp),%edx
  441b17:	8b 45 fc             	mov    -0x4(%ebp),%eax
  441b1a:	8b 80 c8 02 00 00    	mov    0x2c8(%eax),%eax
  441b20:	e8 9f 16 fe ff       	call   0x4231c4
  441b25:	8b 45 dc             	mov    -0x24(%ebp),%eax
  441b28:	8b 55 e8             	mov    -0x18(%ebp),%edx
  441b2b:	e8 2c 20 fc ff       	call   0x403b5c
  441b30:	75 0a                	jne    0x441b3c
  441b32:	b8 a8 1b 44 00       	mov    $0x441ba8,%eax
  441b37:	e8 1c fb ff ff       	call   0x441658
  441b3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  441b3f:	8b 80 d8 02 00 00    	mov    0x2d8(%eax),%eax
  441b45:	33 d2                	xor    %edx,%edx
  441b47:	e8 24 f1 ff ff       	call   0x440c70
  441b4c:	43                   	inc    %ebx
  441b4d:	ff 4d e0             	decl   -0x20(%ebp)
  441b50:	0f 85 2d ff ff ff    	jne    0x441a83
  441b56:	33 c0                	xor    %eax,%eax
  441b58:	5a                   	pop    %edx
  441b59:	59                   	pop    %ecx
  441b5a:	59                   	pop    %ecx
  441b5b:	64 89 10             	mov    %edx,%fs:(%eax)
  441b5e:	68 80 1b 44 00       	push   $0x441b80
  441b63:	8d 45 dc             	lea    -0x24(%ebp),%eax
  441b66:	e8 65 1c fc ff       	call   0x4037d0
  441b6b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  441b6e:	ba 04 00 00 00       	mov    $0x4,%edx
  441b73:	e8 7c 1c fc ff       	call   0x4037f4
  441b78:	c3                   	ret
  441b79:	e9 12 17 fc ff       	jmp    0x403290
  441b7e:	eb e3                	jmp    0x441b63
  441b80:	5f                   	pop    %edi
  441b81:	5e                   	pop    %esi
  441b82:	5b                   	pop    %ebx
  441b83:	8b e5                	mov    %ebp,%esp
  441b85:	5d                   	pop    %ebp
  441b86:	c3                   	ret
	...
