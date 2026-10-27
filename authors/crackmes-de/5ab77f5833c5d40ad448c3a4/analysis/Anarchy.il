// IL code: Anarchy
.class private auto ansi '<Module>'
{
} // end of class <Module>

.class private auto ansi beforefieldinit ConsoleApplication4.Program
	extends [mscorlib]System.Object
{
	// Nested Types
	.class nested public auto ansi sealed NETAnarchyFun
		extends [mscorlib]System.MulticastDelegate
	{
		// Methods
		.method public hidebysig specialname rtspecialname 
			instance void .ctor (
				object 'object',
				native int 'method'
			) runtime managed 
		{
		} // end of method NETAnarchyFun::.ctor

		.method public hidebysig newslot virtual 
			instance int32 Invoke (
				int32 a1,
				int32 a2
			) runtime managed 
		{
		} // end of method NETAnarchyFun::Invoke

		.method public hidebysig newslot virtual 
			instance class [mscorlib]System.IAsyncResult BeginInvoke (
				int32 a1,
				int32 a2,
				class [mscorlib]System.AsyncCallback callback,
				object 'object'
			) runtime managed 
		{
		} // end of method NETAnarchyFun::BeginInvoke

		.method public hidebysig newslot virtual 
			instance int32 EndInvoke (
				class [mscorlib]System.IAsyncResult result
			) runtime managed 
		{
		} // end of method NETAnarchyFun::EndInvoke

	} // end of class NETAnarchyFun


	// Methods
	.method private hidebysig static 
		void Main (
			string[] args
		) cil managed 
	{
		// Method begins at RVA 0x2050
		// Header size: 12
		// Code size: 659 (0x293)
		.maxstack 6
		.entrypoint
		.locals init (
			[0] string,
			[1] string,
			[2] string,
			[3] string[],
			[4] string,
			[5] uint32,
			[6] int32,
			[7] int32,
			[8] uint8[],
			[9] string,
			[10] string[],
			[11] uint32,
			[12] int32,
			[13] class ConsoleApplication4.Program/NETAnarchyFun[],
			[14] int32,
			[15] class [mscorlib]System.Exception,
			[16] string[]
		)

		IL_0000: ldstr "===[ .NET Anarchy by |sas0| ]===\n\nEnter code: "
		IL_0005: stloc.0
		IL_0006: ldstr "\nCode is invalid"
		IL_000b: stloc.1
		IL_000c: ldstr "\nCongratulation, the code is right"
		IL_0011: stloc.2
		IL_0012: ldc.i4.1
		IL_0013: newarr [mscorlib]System.String
		IL_0018: stloc.s 16
		IL_001a: ldloc.s 16
		IL_001c: ldc.i4.0
		IL_001d: ldstr "-"
		IL_0022: stelem.ref
		IL_0023: ldloc.s 16
		IL_0025: stloc.3
		IL_0026: ldstr "\n\nException accured:\n\nMessage: {0}\n\nSource: {1}\n\nStacktrace:\n{2}"
		IL_002b: stloc.s 4
		IL_002d: ldc.i4.0
		IL_002e: stloc.s 5
		IL_0030: ldc.i4.0
		IL_0031: stloc.s 6
		IL_0033: ldc.i4.0
		IL_0034: stloc.s 7
		IL_0036: ldc.i4.4
		IL_0037: newarr [mscorlib]System.Byte
		IL_003c: stloc.s 8
		.try
		{
			IL_003e: ldloc.0
			IL_003f: call void [mscorlib]System.Console::Write(string)
			IL_0044: call string [mscorlib]System.Console::ReadLine()
			IL_0049: stloc.s 9
			IL_004b: ldloc.s 9
			IL_004d: ldloc.3
			IL_004e: ldc.i4.1
			IL_004f: callvirt instance string[] [mscorlib]System.String::Split(string[], valuetype [mscorlib]System.StringSplitOptions)
			IL_0054: stloc.s 10
			IL_0056: ldloc.s 10
			IL_0058: ldlen
			IL_0059: conv.i4
			IL_005a: ldc.i4.5
			IL_005b: xor
			IL_005c: ldc.i4.7
			IL_005d: xor
			IL_005e: brfalse.s IL_006b

			IL_0060: ldloc.1
			IL_0061: call void [mscorlib]System.Console::WriteLine(string)
			IL_0066: leave IL_0292

			IL_006b: ldloc.s 10
			IL_006d: ldc.i4.0
			IL_006e: ldelem.ref
			IL_006f: callvirt instance int32 [mscorlib]System.String::get_Length()
			IL_0074: ldc.i4.4
			IL_0075: shl
			IL_0076: not
			IL_0077: ldc.i4 191
			IL_007c: xor
			IL_007d: conv.u1
			IL_007e: brfalse.s IL_008b

			IL_0080: ldloc.1
			IL_0081: call void [mscorlib]System.Console::WriteLine(string)
			IL_0086: leave IL_0292

			IL_008b: call class [mscorlib]System.Text.Encoding [mscorlib]System.Text.Encoding::get_ASCII()
			IL_0090: ldloc.s 10
			IL_0092: ldc.i4.0
			IL_0093: ldelem.ref
			IL_0094: callvirt instance uint8[] [mscorlib]System.Text.Encoding::GetBytes(string)
			IL_0099: ldc.i4.0
			IL_009a: call uint32 [mscorlib]System.BitConverter::ToUInt32(uint8[], int32)
			IL_009f: stloc.s 11
			IL_00a1: ldc.i4.1
			IL_00a2: stloc.s 12
			IL_00a4: br.s IL_00c8
			// loop start (head: IL_00c8)
				IL_00a6: ldc.i4.1
				IL_00a7: ldloc.s 11
				IL_00a9: ldc.i4.1
				IL_00aa: and
				IL_00ab: bne.un.s IL_00bc

				IL_00ad: ldloc.s 5
				IL_00af: ldc.i4.1
				IL_00b0: ldc.i4.s 32
				IL_00b2: ldloc.s 12
				IL_00b4: sub
				IL_00b5: ldc.i4.s 31
				IL_00b7: and
				IL_00b8: shl
				IL_00b9: or
				IL_00ba: stloc.s 5

				IL_00bc: ldloc.s 11
				IL_00be: ldc.i4.1
				IL_00bf: shr.un
				IL_00c0: stloc.s 11
				IL_00c2: ldloc.s 12
				IL_00c4: ldc.i4.1
				IL_00c5: add
				IL_00c6: stloc.s 12

				IL_00c8: ldloc.s 12
				IL_00ca: ldc.i4.s 32
				IL_00cc: ble.s IL_00a6
			// end loop

			IL_00ce: ldc.i4 -1953669675
			IL_00d3: ldloc.s 5
			IL_00d5: xor
			IL_00d6: ldc.i4.1
			IL_00d7: add
			IL_00d8: brfalse.s IL_00e5

			IL_00da: ldloc.1
			IL_00db: call void [mscorlib]System.Console::WriteLine(string)
			IL_00e0: leave IL_0292

			IL_00e5: ldloc.s 10
			IL_00e7: ldc.i4.1
			IL_00e8: ldelem.ref
			IL_00e9: callvirt instance int32 [mscorlib]System.String::get_Length()
			IL_00ee: ldc.i4.4
			IL_00ef: rem
			IL_00f0: brfalse.s IL_00fd

			IL_00f2: ldloc.1
			IL_00f3: call void [mscorlib]System.Console::WriteLine(string)
			IL_00f8: leave IL_0292

			IL_00fd: ldloc.s 10
			IL_00ff: ldc.i4.1
			IL_0100: ldelem.ref
			IL_0101: callvirt instance int32 [mscorlib]System.String::get_Length()
			IL_0106: ldc.i4.4
			IL_0107: div
			IL_0108: stloc.s 6
			IL_010a: call class ConsoleApplication4.Program/NETAnarchyFun[] ConsoleApplication4.Program::CreateNa()
			IL_010f: stloc.s 13
			IL_0111: ldc.i4.0
			IL_0112: stloc.s 14
			IL_0114: br IL_0261
			// loop start (head: IL_0261)
				IL_0119: call class [mscorlib]System.Text.Encoding [mscorlib]System.Text.Encoding::get_ASCII()
				IL_011e: ldloc.s 10
				IL_0120: ldc.i4.1
				IL_0121: ldelem.ref
				IL_0122: ldloc.s 14
				IL_0124: ldc.i4.4
				IL_0125: mul
				IL_0126: ldc.i4.4
				IL_0127: ldloc.s 8
				IL_0129: ldc.i4.0
				IL_012a: callvirt instance int32 [mscorlib]System.Text.Encoding::GetBytes(string, int32, int32, uint8[], int32)
				IL_012f: pop
				IL_0130: ldloc.s 8
				IL_0132: ldc.i4.0
				IL_0133: call int32 [mscorlib]System.BitConverter::ToInt32(uint8[], int32)
				IL_0138: stloc.s 7
				IL_013a: ldc.i4.1
				IL_013b: ldloc.s 14
				IL_013d: ldc.i4.1
				IL_013e: and
				IL_013f: beq IL_01cd

				IL_0144: ldloc.s 13
				IL_0146: ldc.i4.5
				IL_0147: ldelem.ref
				IL_0148: ldloc.s 13
				IL_014a: ldc.i4.2
				IL_014b: ldelem.ref
				IL_014c: ldloc.s 13
				IL_014e: ldc.i4.0
				IL_014f: ldelem.ref
				IL_0150: ldloc.s 7
				IL_0152: ldc.i4.0
				IL_0153: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0158: ldloc.s 13
				IL_015a: ldc.i4.1
				IL_015b: ldelem.ref
				IL_015c: ldloc.s 7
				IL_015e: ldc.i4.0
				IL_015f: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0164: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0169: ldc.i4.0
				IL_016a: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_016f: ldloc.s 13
				IL_0171: ldc.i4.3
				IL_0172: ldelem.ref
				IL_0173: ldloc.s 7
				IL_0175: ldc.i4.0
				IL_0176: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_017b: beq.s IL_0188

				IL_017d: ldloc.1
				IL_017e: call void [mscorlib]System.Console::WriteLine(string)
				IL_0183: leave IL_0292

				IL_0188: ldloc.s 13
				IL_018a: ldc.i4.0
				IL_018b: ldelem.ref
				IL_018c: ldloc.s 7
				IL_018e: ldc.i4.0
				IL_018f: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0194: ldloc.s 13
				IL_0196: ldc.i4.1
				IL_0197: ldelem.ref
				IL_0198: ldloc.s 7
				IL_019a: ldc.i4.0
				IL_019b: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01a0: add
				IL_01a1: ldloc.s 13
				IL_01a3: ldc.i4.3
				IL_01a4: ldelem.ref
				IL_01a5: ldloc.s 7
				IL_01a7: ldc.i4.0
				IL_01a8: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01ad: add
				IL_01ae: ldc.i4.s 127
				IL_01b0: rem
				IL_01b1: ldloc.s 13
				IL_01b3: ldc.i4.4
				IL_01b4: ldelem.ref
				IL_01b5: ldloc.s 7
				IL_01b7: ldc.i4.0
				IL_01b8: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01bd: beq IL_025b

				IL_01c2: ldloc.1
				IL_01c3: call void [mscorlib]System.Console::WriteLine(string)
				IL_01c8: leave IL_0292

				IL_01cd: ldloc.s 13
				IL_01cf: ldc.i4.0
				IL_01d0: ldelem.ref
				IL_01d1: ldloc.s 7
				IL_01d3: ldc.i4.0
				IL_01d4: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01d9: pop
				IL_01da: ldloc.s 13
				IL_01dc: ldc.i4.3
				IL_01dd: ldelem.ref
				IL_01de: ldloc.s 7
				IL_01e0: ldc.i4.0
				IL_01e1: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01e6: pop
				IL_01e7: ldc.i4.s 48
				IL_01e9: ldloc.s 13
				IL_01eb: ldc.i4.2
				IL_01ec: ldelem.ref
				IL_01ed: ldloc.s 13
				IL_01ef: ldc.i4.0
				IL_01f0: ldelem.ref
				IL_01f1: ldloc.s 7
				IL_01f3: ldc.i4.0
				IL_01f4: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_01f9: ldloc.s 13
				IL_01fb: ldc.i4.3
				IL_01fc: ldelem.ref
				IL_01fd: ldloc.s 7
				IL_01ff: ldc.i4.0
				IL_0200: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0205: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_020a: beq.s IL_0214

				IL_020c: ldloc.1
				IL_020d: call void [mscorlib]System.Console::WriteLine(string)
				IL_0212: leave.s IL_0292

				IL_0214: ldloc.s 13
				IL_0216: ldc.i4.1
				IL_0217: ldelem.ref
				IL_0218: ldloc.s 7
				IL_021a: ldc.i4.0
				IL_021b: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0220: pop
				IL_0221: ldloc.s 13
				IL_0223: ldc.i4.4
				IL_0224: ldelem.ref
				IL_0225: ldloc.s 7
				IL_0227: ldc.i4.0
				IL_0228: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_022d: pop
				IL_022e: ldc.i4.s 57
				IL_0230: ldloc.s 13
				IL_0232: ldc.i4.2
				IL_0233: ldelem.ref
				IL_0234: ldloc.s 13
				IL_0236: ldc.i4.1
				IL_0237: ldelem.ref
				IL_0238: ldloc.s 7
				IL_023a: ldc.i4.0
				IL_023b: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0240: ldloc.s 13
				IL_0242: ldc.i4.4
				IL_0243: ldelem.ref
				IL_0244: ldloc.s 7
				IL_0246: ldc.i4.0
				IL_0247: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_024c: callvirt instance int32 ConsoleApplication4.Program/NETAnarchyFun::Invoke(int32, int32)
				IL_0251: beq.s IL_025b

				IL_0253: ldloc.1
				IL_0254: call void [mscorlib]System.Console::WriteLine(string)
				IL_0259: leave.s IL_0292

				IL_025b: ldloc.s 14
				IL_025d: ldc.i4.1
				IL_025e: add
				IL_025f: stloc.s 14

				IL_0261: ldloc.s 14
				IL_0263: ldloc.s 6
				IL_0265: blt IL_0119
			// end loop

			IL_026a: ldloc.2
			IL_026b: call void [mscorlib]System.Console::WriteLine(string)
			IL_0270: leave.s IL_0292
		} // end .try
		catch [mscorlib]System.Exception
		{
			IL_0272: stloc.s 15
			IL_0274: ldloc.s 4
			IL_0276: ldloc.s 15
			IL_0278: callvirt instance string [mscorlib]System.Exception::get_Message()
			IL_027d: ldloc.s 15
			IL_027f: callvirt instance string [mscorlib]System.Exception::get_Source()
			IL_0284: ldloc.s 15
			IL_0286: callvirt instance string [mscorlib]System.Exception::get_StackTrace()
			IL_028b: call void [mscorlib]System.Console::WriteLine(string, object, object, object)
			IL_0290: leave.s IL_0292
		} // end handler

		IL_0292: ret
	} // end of method Program::Main

	.method private hidebysig static 
		class ConsoleApplication4.Program/NETAnarchyFun[] CreateNa () cil managed 
	{
		// Method begins at RVA 0x230c
		// Header size: 12
		// Code size: 891 (0x37b)
		.maxstack 5
		.locals init (
			[0] class [mscorlib]System.Reflection.Emit.DynamicMethod,
			[1] class [mscorlib]System.Reflection.Emit.DynamicILInfo,
			[2] uint8[],
			[3] class ConsoleApplication4.Program/NETAnarchyFun[],
			[4] uint8[],
			[5] class [mscorlib]System.Reflection.Emit.SignatureHelper,
			[6] class [mscorlib]System.Type[],
			[7] class ConsoleApplication4.Program/NETAnarchyFun,
			[8] class ConsoleApplication4.Program/NETAnarchyFun,
			[9] class ConsoleApplication4.Program/NETAnarchyFun,
			[10] class ConsoleApplication4.Program/NETAnarchyFun,
			[11] class ConsoleApplication4.Program/NETAnarchyFun,
			[12] class ConsoleApplication4.Program/NETAnarchyFun,
			[13] class [mscorlib]System.Type[]
		)

		IL_0000: ldc.i4.6
		IL_0001: newarr ConsoleApplication4.Program/NETAnarchyFun
		IL_0006: stloc.3
		IL_0007: ldc.i4.1
		IL_0008: newarr [mscorlib]System.Byte
		IL_000d: stloc.s 4
		IL_000f: call class [mscorlib]System.Reflection.Emit.SignatureHelper [mscorlib]System.Reflection.Emit.SignatureHelper::GetLocalVarSigHelper()
		IL_0014: stloc.s 5
		IL_0016: ldc.i4.2
		IL_0017: newarr [mscorlib]System.Type
		IL_001c: stloc.s 13
		IL_001e: ldloc.s 13
		IL_0020: ldc.i4.0
		IL_0021: ldtoken [mscorlib]System.Int32
		IL_0026: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_002b: stelem.ref
		IL_002c: ldloc.s 13
		IL_002e: ldc.i4.1
		IL_002f: ldtoken [mscorlib]System.Int32
		IL_0034: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0039: stelem.ref
		IL_003a: ldloc.s 13
		IL_003c: stloc.s 6
		IL_003e: ldloca.s 4
		IL_0040: ldc.i4.s 11
		IL_0042: call void [mscorlib]System.Array::Resize<uint8>(!!0[]&, int32)
		IL_0047: ldc.i4 8194
		IL_004c: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0051: stloc.2
		IL_0052: ldloc.2
		IL_0053: ldc.i4.0
		IL_0054: ldloc.s 4
		IL_0056: ldc.i4.0
		IL_0057: ldc.i4.4
		IL_0058: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_005d: ldc.i4 526384896
		IL_0062: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0067: stloc.2
		IL_0068: ldloc.2
		IL_0069: ldc.i4.0
		IL_006a: ldloc.s 4
		IL_006c: ldc.i4.4
		IL_006d: ldc.i4.4
		IL_006e: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0073: ldc.i4 2778136
		IL_0078: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_007d: stloc.2
		IL_007e: ldloc.2
		IL_007f: ldc.i4.0
		IL_0080: ldloc.s 4
		IL_0082: ldc.i4.8
		IL_0083: ldc.i4.3
		IL_0084: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0089: ldstr "NETAnarchy"
		IL_008e: ldtoken [mscorlib]System.Int32
		IL_0093: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0098: ldloc.s 6
		IL_009a: ldc.i4.0
		IL_009b: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_00a0: stloc.0
		IL_00a1: ldloc.0
		IL_00a2: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_00a7: stloc.1
		IL_00a8: ldloc.1
		IL_00a9: ldloc.s 5
		IL_00ab: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_00b0: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_00b5: ldloc.1
		IL_00b6: ldloc.s 4
		IL_00b8: ldc.i4.2
		IL_00b9: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_00be: ldloc.0
		IL_00bf: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_00c4: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_00c9: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_00ce: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_00d3: stloc.s 7
		IL_00d5: ldloc.3
		IL_00d6: ldc.i4.0
		IL_00d7: ldloc.s 7
		IL_00d9: stelem.ref
		IL_00da: ldc.i4 8194
		IL_00df: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_00e4: stloc.2
		IL_00e5: ldloc.2
		IL_00e6: ldc.i4.0
		IL_00e7: ldloc.s 4
		IL_00e9: ldc.i4.0
		IL_00ea: ldc.i4.4
		IL_00eb: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_00f0: ldc.i4 526319871
		IL_00f5: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_00fa: stloc.2
		IL_00fb: ldloc.2
		IL_00fc: ldc.i4.0
		IL_00fd: ldloc.s 4
		IL_00ff: ldc.i4.4
		IL_0100: ldc.i4.4
		IL_0101: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0106: ldc.i4 2778128
		IL_010b: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0110: stloc.2
		IL_0111: ldloc.2
		IL_0112: ldc.i4.0
		IL_0113: ldloc.s 4
		IL_0115: ldc.i4.8
		IL_0116: ldc.i4.3
		IL_0117: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_011c: ldstr "NETAnarchy"
		IL_0121: ldtoken [mscorlib]System.Int32
		IL_0126: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_012b: ldloc.s 6
		IL_012d: ldc.i4.0
		IL_012e: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_0133: stloc.0
		IL_0134: ldloc.0
		IL_0135: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_013a: stloc.1
		IL_013b: ldloc.1
		IL_013c: ldloc.s 5
		IL_013e: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_0143: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_0148: ldloc.1
		IL_0149: ldloc.s 4
		IL_014b: ldc.i4.2
		IL_014c: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_0151: ldloc.0
		IL_0152: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_0157: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_015c: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_0161: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_0166: stloc.s 8
		IL_0168: ldloc.3
		IL_0169: ldc.i4.3
		IL_016a: ldloc.s 8
		IL_016c: stelem.ref
		IL_016d: ldc.i4 -16769022
		IL_0172: call uint8[] [mscorlib]System.BitConverter::GetBytes(uint32)
		IL_0177: stloc.2
		IL_0178: ldloc.2
		IL_0179: ldc.i4.0
		IL_017a: ldloc.s 4
		IL_017c: ldc.i4.0
		IL_017d: ldc.i4.4
		IL_017e: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0183: ldc.i4 526319616
		IL_0188: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_018d: stloc.2
		IL_018e: ldloc.2
		IL_018f: ldc.i4.0
		IL_0190: ldloc.s 4
		IL_0192: ldc.i4.4
		IL_0193: ldc.i4.4
		IL_0194: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0199: ldc.i4 2778120
		IL_019e: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_01a3: stloc.2
		IL_01a4: ldloc.2
		IL_01a5: ldc.i4.0
		IL_01a6: ldloc.s 4
		IL_01a8: ldc.i4.8
		IL_01a9: ldc.i4.3
		IL_01aa: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_01af: ldstr "NETAnarchy"
		IL_01b4: ldtoken [mscorlib]System.Int32
		IL_01b9: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_01be: ldloc.s 6
		IL_01c0: ldc.i4.0
		IL_01c1: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_01c6: stloc.0
		IL_01c7: ldloc.0
		IL_01c8: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_01cd: stloc.1
		IL_01ce: ldloc.1
		IL_01cf: ldloc.s 5
		IL_01d1: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_01d6: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_01db: ldloc.1
		IL_01dc: ldloc.s 4
		IL_01de: ldc.i4.2
		IL_01df: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_01e4: ldloc.0
		IL_01e5: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_01ea: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_01ef: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_01f4: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_01f9: stloc.s 9
		IL_01fb: ldloc.3
		IL_01fc: ldc.i4.4
		IL_01fd: ldloc.s 9
		IL_01ff: stelem.ref
		IL_0200: ldloca.s 4
		IL_0202: ldc.i4.8
		IL_0203: call void [mscorlib]System.Array::Resize<uint8>(!!0[]&, int32)
		IL_0208: ldc.i4 16719874
		IL_020d: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0212: stloc.2
		IL_0213: ldloc.2
		IL_0214: ldc.i4.0
		IL_0215: ldloc.s 4
		IL_0217: ldc.i4.0
		IL_0218: ldc.i4.4
		IL_0219: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_021e: ldc.i4 710868992
		IL_0223: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0228: stloc.2
		IL_0229: ldloc.2
		IL_022a: ldc.i4.0
		IL_022b: ldloc.s 4
		IL_022d: ldc.i4.4
		IL_022e: ldc.i4.4
		IL_022f: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0234: ldstr "NETAnarchy"
		IL_0239: ldtoken [mscorlib]System.Int32
		IL_023e: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0243: ldloc.s 6
		IL_0245: ldc.i4.0
		IL_0246: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_024b: stloc.0
		IL_024c: ldloc.0
		IL_024d: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_0252: stloc.1
		IL_0253: ldloc.1
		IL_0254: ldloc.s 5
		IL_0256: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_025b: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_0260: ldloc.1
		IL_0261: ldloc.s 4
		IL_0263: ldc.i4.2
		IL_0264: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_0269: ldloc.0
		IL_026a: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_026f: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0274: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_0279: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_027e: stloc.s 10
		IL_0280: ldloc.3
		IL_0281: ldc.i4.1
		IL_0282: ldloc.s 10
		IL_0284: stelem.ref
		IL_0285: ldloca.s 4
		IL_0287: ldc.i4.4
		IL_0288: call void [mscorlib]System.Array::Resize<uint8>(!!0[]&, int32)
		IL_028d: ldc.i4 711000834
		IL_0292: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0297: stloc.2
		IL_0298: ldloc.2
		IL_0299: ldc.i4.0
		IL_029a: ldloc.s 4
		IL_029c: ldc.i4.0
		IL_029d: ldc.i4.4
		IL_029e: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_02a3: ldstr "NETAnarchy"
		IL_02a8: ldtoken [mscorlib]System.Int32
		IL_02ad: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_02b2: ldloc.s 6
		IL_02b4: ldc.i4.0
		IL_02b5: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_02ba: stloc.0
		IL_02bb: ldloc.0
		IL_02bc: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_02c1: stloc.1
		IL_02c2: ldloc.1
		IL_02c3: ldloc.s 5
		IL_02c5: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_02ca: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_02cf: ldloc.1
		IL_02d0: ldloc.s 4
		IL_02d2: ldc.i4.2
		IL_02d3: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_02d8: ldloc.0
		IL_02d9: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_02de: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_02e3: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_02e8: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_02ed: stloc.s 11
		IL_02ef: ldloc.3
		IL_02f0: ldc.i4.2
		IL_02f1: ldloc.s 11
		IL_02f3: stelem.ref
		IL_02f4: ldloca.s 4
		IL_02f6: ldc.i4.7
		IL_02f7: call void [mscorlib]System.Array::Resize<uint8>(!!0[]&, int32)
		IL_02fc: ldc.i4 525998082
		IL_0301: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_0306: stloc.2
		IL_0307: ldloc.2
		IL_0308: ldc.i4.0
		IL_0309: ldloc.s 4
		IL_030b: ldc.i4.0
		IL_030c: ldc.i4.4
		IL_030d: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0312: ldc.i4 2776703
		IL_0317: call uint8[] [mscorlib]System.BitConverter::GetBytes(int32)
		IL_031c: stloc.2
		IL_031d: ldloc.2
		IL_031e: ldc.i4.0
		IL_031f: ldloc.s 4
		IL_0321: ldc.i4.4
		IL_0322: ldc.i4.3
		IL_0323: call void [mscorlib]System.Buffer::BlockCopy(class [mscorlib]System.Array, int32, class [mscorlib]System.Array, int32, int32)
		IL_0328: ldstr "NETAnarchy"
		IL_032d: ldtoken [mscorlib]System.Int32
		IL_0332: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0337: ldloc.s 6
		IL_0339: ldc.i4.0
		IL_033a: newobj instance void [mscorlib]System.Reflection.Emit.DynamicMethod::.ctor(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], bool)
		IL_033f: stloc.0
		IL_0340: ldloc.0
		IL_0341: callvirt instance class [mscorlib]System.Reflection.Emit.DynamicILInfo [mscorlib]System.Reflection.Emit.DynamicMethod::GetDynamicILInfo()
		IL_0346: stloc.1
		IL_0347: ldloc.1
		IL_0348: ldloc.s 5
		IL_034a: callvirt instance uint8[] [mscorlib]System.Reflection.Emit.SignatureHelper::GetSignature()
		IL_034f: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetLocalSignature(uint8[])
		IL_0354: ldloc.1
		IL_0355: ldloc.s 4
		IL_0357: ldc.i4.2
		IL_0358: callvirt instance void [mscorlib]System.Reflection.Emit.DynamicILInfo::SetCode(uint8[], int32)
		IL_035d: ldloc.0
		IL_035e: ldtoken ConsoleApplication4.Program/NETAnarchyFun
		IL_0363: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_0368: callvirt instance class [mscorlib]System.Delegate [mscorlib]System.Reflection.Emit.DynamicMethod::CreateDelegate(class [mscorlib]System.Type)
		IL_036d: castclass ConsoleApplication4.Program/NETAnarchyFun
		IL_0372: stloc.s 12
		IL_0374: ldloc.3
		IL_0375: ldc.i4.5
		IL_0376: ldloc.s 12
		IL_0378: stelem.ref
		IL_0379: ldloc.3
		IL_037a: ret
	} // end of method Program::CreateNa

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2693
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: ret
	} // end of method Program::.ctor

} // end of class ConsoleApplication4.Program

You are not using the latest version of the tool, please update.
Latest version is '11.2.0.10050' (yours is '8.2.0.7535-95108c96')
