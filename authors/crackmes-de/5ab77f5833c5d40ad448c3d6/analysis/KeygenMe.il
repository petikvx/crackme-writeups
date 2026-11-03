// IL code: KeygenMe
.class private auto ansi '<Module>'
{
} // end of class <Module>

.class private auto ansi KeygenMe.My.MyApplication
	extends [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase
{
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 0a 4d 79 54 65 6d 70 6c 61 74 65 07 38 2e
		30 2e 30 2e 30 00 00
	)
	.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
		01 00 01 00 00 00 00 00
	)
	// Methods
	.method assembly static 
		void Main (
			string[] Args
		) cil managed 
	{
		.custom instance void [mscorlib]System.STAThreadAttribute::.ctor() = (
			01 00 00 00
		)
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53ed4
		// Header size: 12
		// Code size: 25 (0x19)
		.maxstack 2
		.entrypoint

		.try
		{
			IL_0000: call bool [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::get_UseCompatibleTextRendering()
			IL_0005: call void [System.Windows.Forms]System.Windows.Forms.Application::SetCompatibleTextRenderingDefault(bool)
			IL_000a: leave.s IL_000d
		} // end .try
		finally
		{
			IL_000c: endfinally
		} // end handler

		IL_000d: call class KeygenMe.My.MyApplication KeygenMe.My.MyProject::get_Application()
		IL_0012: ldarg.0
		IL_0013: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::Run(string[])
		IL_0018: ret
	} // end of method MyApplication::Main

	.method public specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f0c
		// Header size: 1
		// Code size: 36 (0x24)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldc.i4.0
		IL_0002: call instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::.ctor(valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.AuthenticationMode)
		IL_0007: ldarg.0
		IL_0008: ldc.i4.0
		IL_0009: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::set_IsSingleInstance(bool)
		IL_000e: ldarg.0
		IL_000f: ldc.i4.1
		IL_0010: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::set_EnableVisualStyles(bool)
		IL_0015: ldarg.0
		IL_0016: ldc.i4.1
		IL_0017: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::set_SaveMySettingsOnExit(bool)
		IL_001c: ldarg.0
		IL_001d: ldc.i4.0
		IL_001e: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::set_ShutdownStyle(valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.ShutdownMode)
		IL_0023: ret
	} // end of method MyApplication::.ctor

	.method family strict virtual 
		instance void OnCreateMainForm () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f34
		// Header size: 1
		// Code size: 17 (0x11)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call class KeygenMe.My.MyProject/MyForms KeygenMe.My.MyProject::get_Forms()
		IL_0006: callvirt instance class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::get_Form1()
		IL_000b: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::set_MainForm(class [System.Windows.Forms]System.Windows.Forms.Form)
		IL_0010: ret
	} // end of method MyApplication::OnCreateMainForm

} // end of class KeygenMe.My.MyApplication

.class private auto ansi KeygenMe.My.MyComputer
	extends [Microsoft.VisualBasic]Microsoft.VisualBasic.Devices.Computer
{
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 0a 4d 79 54 65 6d 70 6c 61 74 65 07 38 2e
		30 2e 30 2e 30 00 00
	)
	.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
		01 00 01 00 00 00 00 00
	)
	// Methods
	.method public specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 01 00 00 00 00 00
		)
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f48
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.Devices.Computer::.ctor()
		IL_0006: ret
	} // end of method MyComputer::.ctor

} // end of class KeygenMe.My.MyComputer

.class private auto ansi sealed beforefieldinit KeygenMe.My.MyProject
	extends [mscorlib]System.Object
{
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.StandardModuleAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 0a 4d 79 54 65 6d 70 6c 61 74 65 07 38 2e
		30 2e 30 2e 30 00 00
	)
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.HideModuleNameAttribute::.ctor() = (
		01 00 00 00
	)
	// Nested Types
	.class nested assembly auto ansi sealed MyForms
		extends [mscorlib]System.Object
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 01 00 00 00 00 00
		)
		.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.MyGroupCollectionAttribute::.ctor(string, string, string, string) = (
			01 00 19 53 79 73 74 65 6d 2e 57 69 6e 64 6f 77
			73 2e 46 6f 72 6d 73 2e 46 6f 72 6d 12 43 72 65
			61 74 65 5f 5f 49 6e 73 74 61 6e 63 65 5f 5f 13
			44 69 73 70 6f 73 65 5f 5f 49 6e 73 74 61 6e 63
			65 5f 5f 12 4d 79 2e 4d 79 50 72 6f 6a 65 63 74
			2e 46 6f 72 6d 73 00 00
		)
		// Fields
		.field public class KeygenMe.Form1 m_Form1
		.field public class KeygenMe.Form2 m_Form2
		.field private static class [mscorlib]System.Collections.Hashtable m_FormBeingCreated
		.custom instance void [mscorlib]System.ThreadStaticAttribute::.ctor() = (
			01 00 00 00
		)

		// Methods
		.method public specialname 
			instance class KeygenMe.Form1 get_Form1 () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x53ffc
			// Header size: 12
			// Code size: 24 (0x18)
			.maxstack 2
			.locals init (
				[0] class KeygenMe.Form1
			)

			IL_0000: ldarg.0
			IL_0001: ldarg.0
			IL_0002: ldfld class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::m_Form1
			IL_0007: call !!0 KeygenMe.My.MyProject/MyForms::Create__Instance__<class KeygenMe.Form1>(!!0)
			IL_000c: stfld class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::m_Form1
			IL_0011: ldarg.0
			IL_0012: ldfld class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::m_Form1
			IL_0017: ret
		} // end of method MyForms::get_Form1

		.method public specialname 
			instance class KeygenMe.Form2 get_Form2 () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x54020
			// Header size: 12
			// Code size: 24 (0x18)
			.maxstack 2
			.locals init (
				[0] class KeygenMe.Form2
			)

			IL_0000: ldarg.0
			IL_0001: ldarg.0
			IL_0002: ldfld class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::m_Form2
			IL_0007: call !!0 KeygenMe.My.MyProject/MyForms::Create__Instance__<class KeygenMe.Form2>(!!0)
			IL_000c: stfld class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::m_Form2
			IL_0011: ldarg.0
			IL_0012: ldfld class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::m_Form2
			IL_0017: ret
		} // end of method MyForms::get_Form2

		.method public specialname 
			instance void set_Form1 (
				class KeygenMe.Form1 Value
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x54044
			// Header size: 1
			// Code size: 37 (0x25)
			.maxstack 8

			IL_0000: ldarg.1
			IL_0001: ldarg.0
			IL_0002: ldfld class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::m_Form1
			IL_0007: bne.un.s IL_000a

			IL_0009: ret

			IL_000a: ldarg.1
			IL_000b: brfalse.s IL_0018

			IL_000d: ldstr "Property can only be set to Nothing"
			IL_0012: newobj instance void [mscorlib]System.ArgumentException::.ctor(string)
			IL_0017: throw

			IL_0018: ldarg.0
			IL_0019: ldarg.0
			IL_001a: ldflda class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::m_Form1
			IL_001f: callvirt instance void KeygenMe.My.MyProject/MyForms::Dispose__Instance__<class KeygenMe.Form1>(!!0&)
			IL_0024: ret
		} // end of method MyForms::set_Form1

		.method public specialname 
			instance void set_Form2 (
				class KeygenMe.Form2 Value
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x5406c
			// Header size: 1
			// Code size: 37 (0x25)
			.maxstack 8

			IL_0000: ldarg.1
			IL_0001: ldarg.0
			IL_0002: ldfld class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::m_Form2
			IL_0007: bne.un.s IL_000a

			IL_0009: ret

			IL_000a: ldarg.1
			IL_000b: brfalse.s IL_0018

			IL_000d: ldstr "Property can only be set to Nothing"
			IL_0012: newobj instance void [mscorlib]System.ArgumentException::.ctor(string)
			IL_0017: throw

			IL_0018: ldarg.0
			IL_0019: ldarg.0
			IL_001a: ldflda class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::m_Form2
			IL_001f: callvirt instance void KeygenMe.My.MyProject/MyForms::Dispose__Instance__<class KeygenMe.Form2>(!!0&)
			IL_0024: ret
		} // end of method MyForms::set_Form2

		.method private static 
			!!T Create__Instance__<.ctor ([System.Windows.Forms]System.Windows.Forms.Form) T> (
				!!T Instance
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x54094
			// Header size: 12
			// Code size: 226 (0xe2)
			.maxstack 4
			.locals init (
				[0] !!T,
				[1] string,
				[2] class [mscorlib]System.Reflection.TargetInvocationException,
				[3] string[]
			)

			IL_0000: ldarg.0
			IL_0001: box !!T
			IL_0006: brfalse.s IL_001a

			IL_0008: ldarga.s Instance
			IL_000a: constrained. !!T
			IL_0010: callvirt instance bool [System.Windows.Forms]System.Windows.Forms.Control::get_IsDisposed()
			IL_0015: brfalse IL_00de

			IL_001a: ldsfld class [mscorlib]System.Collections.Hashtable KeygenMe.My.MyProject/MyForms::m_FormBeingCreated
			IL_001f: brfalse.s IL_004d

			IL_0021: ldsfld class [mscorlib]System.Collections.Hashtable KeygenMe.My.MyProject/MyForms::m_FormBeingCreated
			IL_0026: ldtoken !!T
			IL_002b: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
			IL_0030: callvirt instance bool [mscorlib]System.Collections.Hashtable::ContainsKey(object)
			IL_0035: brfalse.s IL_0057

			IL_0037: ldstr "WinForms_RecursiveFormCreate"
			IL_003c: ldc.i4.0
			IL_003d: newarr [mscorlib]System.String
			IL_0042: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Utils::GetResourceString(string, string[])
			IL_0047: newobj instance void [mscorlib]System.InvalidOperationException::.ctor(string)
			IL_004c: throw

			IL_004d: newobj instance void [mscorlib]System.Collections.Hashtable::.ctor()
			IL_0052: stsfld class [mscorlib]System.Collections.Hashtable KeygenMe.My.MyProject/MyForms::m_FormBeingCreated

			IL_0057: ldsfld class [mscorlib]System.Collections.Hashtable KeygenMe.My.MyProject/MyForms::m_FormBeingCreated
			IL_005c: ldtoken !!T
			IL_0061: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
			IL_0066: ldnull
			IL_0067: callvirt instance void [mscorlib]System.Collections.Hashtable::Add(object, object)
			.try
			{
				.try
				{
					IL_006c: call !!0 [mscorlib]System.Activator::CreateInstance<!!T>()
					IL_0071: stloc.0
					IL_0072: leave.s IL_00e0
				} // end .try
				filter
				{
					IL_0074: isinst [mscorlib]System.Reflection.TargetInvocationException
					IL_0079: dup
					IL_007a: brtrue.s IL_0080

					IL_007c: pop
					IL_007d: ldc.i4.0
					IL_007e: br.s IL_0096

					IL_0080: dup
					IL_0081: stloc.2
					IL_0082: call void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.ProjectData::SetProjectError(class [mscorlib]System.Exception)
					IL_0087: ldloc.2
					IL_0088: callvirt instance class [mscorlib]System.Exception [mscorlib]System.Exception::get_InnerException()
					IL_008d: ldnull
					IL_008e: ceq
					IL_0090: ldc.i4.0
					IL_0091: ceq
					IL_0093: ldc.i4.0
					IL_0094: cgt.un

					IL_0096: endfilter
				} // end filter
				{
					IL_0098: pop
					IL_0099: ldstr "WinForms_SeeInnerException"
					IL_009e: ldc.i4.1
					IL_009f: newarr [mscorlib]System.String
					IL_00a4: stloc.3
					IL_00a5: ldloc.3
					IL_00a6: ldc.i4.0
					IL_00a7: ldloc.2
					IL_00a8: callvirt instance class [mscorlib]System.Exception [mscorlib]System.Exception::get_InnerException()
					IL_00ad: callvirt instance string [mscorlib]System.Exception::get_Message()
					IL_00b2: stelem.ref
					IL_00b3: ldloc.3
					IL_00b4: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Utils::GetResourceString(string, string[])
					IL_00b9: stloc.1
					IL_00ba: ldloc.1
					IL_00bb: ldloc.2
					IL_00bc: callvirt instance class [mscorlib]System.Exception [mscorlib]System.Exception::get_InnerException()
					IL_00c1: newobj instance void [mscorlib]System.InvalidOperationException::.ctor(string, class [mscorlib]System.Exception)
					IL_00c6: throw
				} // end handler
			} // end .try
			finally
			{
				IL_00c7: ldsfld class [mscorlib]System.Collections.Hashtable KeygenMe.My.MyProject/MyForms::m_FormBeingCreated
				IL_00cc: ldtoken !!T
				IL_00d1: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
				IL_00d6: callvirt instance void [mscorlib]System.Collections.Hashtable::Remove(object)
				IL_00db: endfinally
			} // end handler
			IL_00dc: br.s IL_00e0

			IL_00de: ldarg.0
			IL_00df: ret

			IL_00e0: ldloc.0
			IL_00e1: ret
		} // end of method MyForms::Create__Instance__

		.method private 
			instance void Dispose__Instance__<([System.Windows.Forms]System.Windows.Forms.Form) T> (
				!!T& 'instance'
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x541a0
			// Header size: 12
			// Code size: 28 (0x1c)
			.maxstack 2
			.locals init (
				[0] !!T
			)

			IL_0000: ldarg.1
			IL_0001: constrained. !!T
			IL_0007: callvirt instance void [System]System.ComponentModel.Component::Dispose()
			IL_000c: ldarg.1
			IL_000d: ldloca.s 0
			IL_000f: initobj !!T
			IL_0015: ldloc.0
			IL_0016: stobj !!T
			IL_001b: ret
		} // end of method MyForms::Dispose__Instance__

		.method public specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x541c8
			// Header size: 1
			// Code size: 7 (0x7)
			.maxstack 8

			IL_0000: ldarg.0
			IL_0001: call instance void [mscorlib]System.Object::.ctor()
			IL_0006: ret
		} // end of method MyForms::.ctor

		.method public strict virtual 
			instance bool Equals (
				object o
			) cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x541d0
			// Header size: 12
			// Code size: 13 (0xd)
			.maxstack 2
			.locals init (
				[0] bool
			)

			IL_0000: ldarg.0
			IL_0001: ldarg.1
			IL_0002: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
			IL_0007: call instance bool [mscorlib]System.Object::Equals(object)
			IL_000c: ret
		} // end of method MyForms::Equals

		.method public strict virtual 
			instance int32 GetHashCode () cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x541ec
			// Header size: 12
			// Code size: 7 (0x7)
			.maxstack 1
			.locals init (
				[0] int32
			)

			IL_0000: ldarg.0
			IL_0001: call instance int32 [mscorlib]System.Object::GetHashCode()
			IL_0006: ret
		} // end of method MyForms::GetHashCode

		.method assembly hidebysig 
			instance class [mscorlib]System.Type GetType () cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x54200
			// Header size: 12
			// Code size: 11 (0xb)
			.maxstack 1
			.locals init (
				[0] class [mscorlib]System.Type
			)

			IL_0000: ldtoken KeygenMe.My.MyProject/MyForms
			IL_0005: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
			IL_000a: ret
		} // end of method MyForms::GetType

		.method public strict virtual 
			instance string ToString () cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x54218
			// Header size: 12
			// Code size: 7 (0x7)
			.maxstack 1
			.locals init (
				[0] string
			)

			IL_0000: ldarg.0
			IL_0001: call instance string [mscorlib]System.Object::ToString()
			IL_0006: ret
		} // end of method MyForms::ToString

		// Properties
		.property instance class KeygenMe.Form1 Form1()
		{
			.get instance class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::get_Form1()
			.set instance void KeygenMe.My.MyProject/MyForms::set_Form1(class KeygenMe.Form1)
		}
		.property instance class KeygenMe.Form2 Form2()
		{
			.get instance class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::get_Form2()
			.set instance void KeygenMe.My.MyProject/MyForms::set_Form2(class KeygenMe.Form2)
		}

	} // end of class MyForms

	.class nested assembly auto ansi sealed MyWebServices
		extends [mscorlib]System.Object
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 01 00 00 00 00 00
		)
		.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.MyGroupCollectionAttribute::.ctor(string, string, string, string) = (
			01 00 34 53 79 73 74 65 6d 2e 57 65 62 2e 53 65
			72 76 69 63 65 73 2e 50 72 6f 74 6f 63 6f 6c 73
			2e 53 6f 61 70 48 74 74 70 43 6c 69 65 6e 74 50
			72 6f 74 6f 63 6f 6c 12 43 72 65 61 74 65 5f 5f
			49 6e 73 74 61 6e 63 65 5f 5f 13 44 69 73 70 6f
			73 65 5f 5f 49 6e 73 74 61 6e 63 65 5f 5f 00 00 00
		)
		// Methods
		.method public strict virtual 
			instance bool Equals (
				object o
			) cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x5422c
			// Header size: 12
			// Code size: 13 (0xd)
			.maxstack 2
			.locals init (
				[0] bool
			)

			IL_0000: ldarg.0
			IL_0001: ldarg.1
			IL_0002: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
			IL_0007: call instance bool [mscorlib]System.Object::Equals(object)
			IL_000c: ret
		} // end of method MyWebServices::Equals

		.method public strict virtual 
			instance int32 GetHashCode () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x54248
			// Header size: 12
			// Code size: 7 (0x7)
			.maxstack 1
			.locals init (
				[0] int32
			)

			IL_0000: ldarg.0
			IL_0001: call instance int32 [mscorlib]System.Object::GetHashCode()
			IL_0006: ret
		} // end of method MyWebServices::GetHashCode

		.method assembly hidebysig 
			instance class [mscorlib]System.Type GetType () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x5425c
			// Header size: 12
			// Code size: 11 (0xb)
			.maxstack 1
			.locals init (
				[0] class [mscorlib]System.Type
			)

			IL_0000: ldtoken KeygenMe.My.MyProject/MyWebServices
			IL_0005: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
			IL_000a: ret
		} // end of method MyWebServices::GetType

		.method public strict virtual 
			instance string ToString () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x54274
			// Header size: 12
			// Code size: 7 (0x7)
			.maxstack 1
			.locals init (
				[0] string
			)

			IL_0000: ldarg.0
			IL_0001: call instance string [mscorlib]System.Object::ToString()
			IL_0006: ret
		} // end of method MyWebServices::ToString

		.method private static 
			!!T Create__Instance__<.ctor T> (
				!!T 'instance'
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x54288
			// Header size: 12
			// Code size: 16 (0x10)
			.maxstack 1
			.locals init (
				[0] !!T
			)

			IL_0000: ldarg.0
			IL_0001: box !!T
			IL_0006: brtrue.s IL_000e

			IL_0008: call !!0 [mscorlib]System.Activator::CreateInstance<!!T>()
			IL_000d: ret

			IL_000e: ldarg.0
			IL_000f: ret
		} // end of method MyWebServices::Create__Instance__

		.method private 
			instance void Dispose__Instance__<T> (
				!!T& 'instance'
			) cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x542a4
			// Header size: 12
			// Code size: 16 (0x10)
			.maxstack 2
			.locals init (
				[0] !!T
			)

			IL_0000: ldarg.1
			IL_0001: ldloca.s 0
			IL_0003: initobj !!T
			IL_0009: ldloc.0
			IL_000a: stobj !!T
			IL_000f: ret
		} // end of method MyWebServices::Dispose__Instance__

		.method public specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x542c0
			// Header size: 1
			// Code size: 7 (0x7)
			.maxstack 8

			IL_0000: ldarg.0
			IL_0001: call instance void [mscorlib]System.Object::.ctor()
			IL_0006: ret
		} // end of method MyWebServices::.ctor

	} // end of class MyWebServices

	.class nested assembly auto ansi sealed ThreadSafeObjectProvider`1<.ctor T>
		extends [mscorlib]System.Object
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 01 00 00 00 00 00
		)
		.custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = (
			01 00 00 00 00
		)
		// Fields
		.field private static !T m_ThreadStaticValue
		.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
			01 00 00 00
		)
		.custom instance void [mscorlib]System.ThreadStaticAttribute::.ctor() = (
			01 00 00 00
		)

		// Methods
		.method assembly specialname 
			instance !T get_GetInstance () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			// Method begins at RVA 0x542c8
			// Header size: 12
			// Code size: 28 (0x1c)
			.maxstack 1
			.locals init (
				[0] !T
			)

			IL_0000: ldsfld !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<!T>::m_ThreadStaticValue
			IL_0005: box !T
			IL_000a: brtrue.s IL_0016

			IL_000c: call !!0 [mscorlib]System.Activator::CreateInstance<!T>()
			IL_0011: stsfld !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<!T>::m_ThreadStaticValue

			IL_0016: ldsfld !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<!T>::m_ThreadStaticValue
			IL_001b: ret
		} // end of method ThreadSafeObjectProvider`1::get_GetInstance

		.method public specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
				01 00 00 00
			)
			.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
				01 00 01 00 00 00 00 00
			)
			// Method begins at RVA 0x542f0
			// Header size: 1
			// Code size: 7 (0x7)
			.maxstack 8

			IL_0000: ldarg.0
			IL_0001: call instance void [mscorlib]System.Object::.ctor()
			IL_0006: ret
		} // end of method ThreadSafeObjectProvider`1::.ctor

		// Properties
		.property instance !T GetInstance()
		{
			.get instance !0 KeygenMe.My.MyProject/ThreadSafeObjectProvider`1::get_GetInstance()
		}

	} // end of class ThreadSafeObjectProvider`1


	// Fields
	.field private static initonly class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyComputer> m_ComputerObjectProvider
	.field private static initonly class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyApplication> m_AppObjectProvider
	.field private static initonly class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User> m_UserObjectProvider
	.field private static class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyForms> m_MyFormsObjectProvider
	.field private static initonly class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyWebServices> m_MyWebServicesObjectProvider

	// Methods
	.method private specialname rtspecialname static 
		void .cctor () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f50
		// Header size: 1
		// Code size: 51 (0x33)
		.maxstack 8

		IL_0000: newobj instance void class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyComputer>::.ctor()
		IL_0005: stsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyComputer> KeygenMe.My.MyProject::m_ComputerObjectProvider
		IL_000a: newobj instance void class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyApplication>::.ctor()
		IL_000f: stsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyApplication> KeygenMe.My.MyProject::m_AppObjectProvider
		IL_0014: newobj instance void class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User>::.ctor()
		IL_0019: stsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User> KeygenMe.My.MyProject::m_UserObjectProvider
		IL_001e: newobj instance void class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyForms>::.ctor()
		IL_0023: stsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyForms> KeygenMe.My.MyProject::m_MyFormsObjectProvider
		IL_0028: newobj instance void class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyWebServices>::.ctor()
		IL_002d: stsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyWebServices> KeygenMe.My.MyProject::m_MyWebServicesObjectProvider
		IL_0032: ret
	} // end of method MyProject::.cctor

	.method assembly specialname static 
		class KeygenMe.My.MyComputer get_Computer () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f84
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class KeygenMe.My.MyComputer
		)

		IL_0000: ldsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyComputer> KeygenMe.My.MyProject::m_ComputerObjectProvider
		IL_0005: callvirt instance !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyComputer>::get_GetInstance()
		IL_000a: ret
	} // end of method MyProject::get_Computer

	.method assembly specialname static 
		class KeygenMe.My.MyApplication get_Application () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53f9c
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class KeygenMe.My.MyApplication
		)

		IL_0000: ldsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyApplication> KeygenMe.My.MyProject::m_AppObjectProvider
		IL_0005: callvirt instance !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyApplication>::get_GetInstance()
		IL_000a: ret
	} // end of method MyProject::get_Application

	.method assembly specialname static 
		class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User get_User () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53fb4
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User
		)

		IL_0000: ldsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User> KeygenMe.My.MyProject::m_UserObjectProvider
		IL_0005: callvirt instance !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User>::get_GetInstance()
		IL_000a: ret
	} // end of method MyProject::get_User

	.method assembly specialname static 
		class KeygenMe.My.MyProject/MyForms get_Forms () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53fcc
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class KeygenMe.My.MyProject/MyForms
		)

		IL_0000: ldsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyForms> KeygenMe.My.MyProject::m_MyFormsObjectProvider
		IL_0005: callvirt instance !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyForms>::get_GetInstance()
		IL_000a: ret
	} // end of method MyProject::get_Forms

	.method assembly specialname static 
		class KeygenMe.My.MyProject/MyWebServices get_WebServices () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53fe4
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class KeygenMe.My.MyProject/MyWebServices
		)

		IL_0000: ldsfld class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyWebServices> KeygenMe.My.MyProject::m_MyWebServicesObjectProvider
		IL_0005: callvirt instance !0 class KeygenMe.My.MyProject/ThreadSafeObjectProvider`1<class KeygenMe.My.MyProject/MyWebServices>::get_GetInstance()
		IL_000a: ret
	} // end of method MyProject::get_WebServices

	// Properties
	.property class KeygenMe.My.MyComputer Computer()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 0b 4d 79 2e 43 6f 6d 70 75 74 65 72 00 00
		)
		.get class KeygenMe.My.MyComputer KeygenMe.My.MyProject::get_Computer()
	}
	.property class KeygenMe.My.MyApplication Application()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 0e 4d 79 2e 41 70 70 6c 69 63 61 74 69 6f
			6e 00 00
		)
		.get class KeygenMe.My.MyApplication KeygenMe.My.MyProject::get_Application()
	}
	.property class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User User()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 07 4d 79 2e 55 73 65 72 00 00
		)
		.get class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.User KeygenMe.My.MyProject::get_User()
	}
	.property class KeygenMe.My.MyProject/MyForms Forms()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 08 4d 79 2e 46 6f 72 6d 73 00 00
		)
		.get class KeygenMe.My.MyProject/MyForms KeygenMe.My.MyProject::get_Forms()
	}
	.property class KeygenMe.My.MyProject/MyWebServices WebServices()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 0e 4d 79 2e 57 65 62 53 65 72 76 69 63 65
			73 00 00
		)
		.get class KeygenMe.My.MyProject/MyWebServices KeygenMe.My.MyProject::get_WebServices()
	}

} // end of class KeygenMe.My.MyProject

.class public auto ansi KeygenMe.Form1
	extends [System.Windows.Forms]System.Windows.Forms.Form
{
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.DesignerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private class [System]System.ComponentModel.IContainer components
	.field private class [System.Windows.Forms]System.Windows.Forms.Button _Button1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 07 42 75 74 74 6f 6e 31 00 00
	)
	.field private class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix _GabMatrix1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 0a 47 61 62 4d 61 74 72 69 78 31 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.TextBox _TextBox2
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 08 54 65 78 74 42 6f 78 32 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.TextBox _TextBox1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 08 54 65 78 74 42 6f 78 31 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Label _Label1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 06 4c 61 62 65 6c 31 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Label _Label2
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 06 4c 61 62 65 6c 32 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Button _Button2
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 07 42 75 74 74 6f 6e 32 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Button _Button3
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 07 42 75 74 74 6f 6e 33 00 00
	)
	.field private string esp
	.field private string esp1
	.field private string esp2
	.field private string esp4

	// Methods
	.method public specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x542f8
		// Header size: 1
		// Code size: 57 (0x39)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System.Windows.Forms]System.Windows.Forms.Form::.ctor()
		IL_0006: ldarg.0
		IL_0007: ldstr ""
		IL_000c: stfld string KeygenMe.Form1::esp
		IL_0011: ldarg.0
		IL_0012: ldstr ""
		IL_0017: stfld string KeygenMe.Form1::esp1
		IL_001c: ldarg.0
		IL_001d: ldstr ""
		IL_0022: stfld string KeygenMe.Form1::esp2
		IL_0027: ldarg.0
		IL_0028: ldstr ""
		IL_002d: stfld string KeygenMe.Form1::esp4
		IL_0032: ldarg.0
		IL_0033: callvirt instance void KeygenMe.Form1::InitializeComponent()
		IL_0038: ret
	} // end of method Form1::.ctor

	.method family strict virtual 
		instance void Dispose (
			bool disposing
		) cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54334
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 2

		.try
		{
			IL_0000: ldarg.1
			IL_0001: brfalse.s IL_0016

			IL_0003: ldarg.0
			IL_0004: ldfld class [System]System.ComponentModel.IContainer KeygenMe.Form1::components
			IL_0009: brfalse.s IL_0016

			IL_000b: ldarg.0
			IL_000c: ldfld class [System]System.ComponentModel.IContainer KeygenMe.Form1::components
			IL_0011: callvirt instance void [mscorlib]System.IDisposable::Dispose()

			IL_0016: leave.s IL_0020
		} // end .try
		finally
		{
			IL_0018: ldarg.0
			IL_0019: ldarg.1
			IL_001a: call instance void [System.Windows.Forms]System.Windows.Forms.Form::Dispose(bool)
			IL_001f: endfinally
		} // end handler

		IL_0020: ret
	} // end of method Form1::Dispose

	.method private 
		instance void InitializeComponent () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54374
		// Header size: 12
		// Code size: 1679 (0x68f)
		.maxstack 6
		.locals init (
			[0] valuetype [System.Drawing]System.Drawing.Point,
			[1] valuetype [System.Drawing]System.Drawing.Size,
			[2] valuetype [System.Drawing]System.Drawing.SizeF
		)

		IL_0000: ldarg.0
		IL_0001: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_0006: callvirt instance void KeygenMe.Form1::set_Button1(class [System.Windows.Forms]System.Windows.Forms.Button)
		IL_000b: ldarg.0
		IL_000c: newobj instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::.ctor()
		IL_0011: callvirt instance void KeygenMe.Form1::set_GabMatrix1(class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix)
		IL_0016: ldarg.0
		IL_0017: newobj instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()
		IL_001c: callvirt instance void KeygenMe.Form1::set_TextBox2(class [System.Windows.Forms]System.Windows.Forms.TextBox)
		IL_0021: ldarg.0
		IL_0022: newobj instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()
		IL_0027: callvirt instance void KeygenMe.Form1::set_TextBox1(class [System.Windows.Forms]System.Windows.Forms.TextBox)
		IL_002c: ldarg.0
		IL_002d: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0032: callvirt instance void KeygenMe.Form1::set_Label1(class [System.Windows.Forms]System.Windows.Forms.Label)
		IL_0037: ldarg.0
		IL_0038: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_003d: callvirt instance void KeygenMe.Form1::set_Label2(class [System.Windows.Forms]System.Windows.Forms.Label)
		IL_0042: ldarg.0
		IL_0043: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_0048: callvirt instance void KeygenMe.Form1::set_Button2(class [System.Windows.Forms]System.Windows.Forms.Button)
		IL_004d: ldarg.0
		IL_004e: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_0053: callvirt instance void KeygenMe.Form1::set_Button3(class [System.Windows.Forms]System.Windows.Forms.Button)
		IL_0058: ldarg.0
		IL_0059: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::SuspendLayout()
		IL_005e: ldarg.0
		IL_005f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_0064: call class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_ok2()
		IL_0069: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImage(class [System.Drawing]System.Drawing.Image)
		IL_006e: ldarg.0
		IL_006f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_0074: ldc.i4.3
		IL_0075: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImageLayout(valuetype [System.Windows.Forms]System.Windows.Forms.ImageLayout)
		IL_007a: ldarg.0
		IL_007b: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_0080: callvirt instance class [System.Windows.Forms]System.Windows.Forms.FlatButtonAppearance [System.Windows.Forms]System.Windows.Forms.ButtonBase::get_FlatAppearance()
		IL_0085: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Black()
		IL_008a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.FlatButtonAppearance::set_BorderColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_008f: ldarg.0
		IL_0090: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_0095: ldc.i4.0
		IL_0096: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_FlatStyle(valuetype [System.Windows.Forms]System.Windows.Forms.FlatStyle)
		IL_009b: ldarg.0
		IL_009c: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_00a1: ldloca.s 0
		IL_00a3: ldc.i4.s 98
		IL_00a5: ldc.i4 136
		IL_00aa: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_00af: ldloc.0
		IL_00b0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_00b5: ldarg.0
		IL_00b6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_00bb: ldstr "Button1"
		IL_00c0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_00c5: ldarg.0
		IL_00c6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_00cb: ldloca.s 1
		IL_00cd: ldc.i4.s 67
		IL_00cf: ldc.i4.s 29
		IL_00d1: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_00d6: ldloc.1
		IL_00d7: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_00dc: ldarg.0
		IL_00dd: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_00e2: ldc.i4.0
		IL_00e3: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_00e8: ldarg.0
		IL_00e9: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_00ee: ldc.i4.1
		IL_00ef: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_00f4: ldarg.0
		IL_00f5: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_00fa: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_MidnightBlue()
		IL_00ff: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_0104: ldarg.0
		IL_0105: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_010a: ldstr "Verdana"
		IL_010f: ldc.r4 8.25
		IL_0114: ldc.i4.1
		IL_0115: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle)
		IL_011a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_011f: ldarg.0
		IL_0120: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0125: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Red()
		IL_012a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_012f: ldarg.0
		IL_0130: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0135: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Black()
		IL_013a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_GridColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_013f: ldarg.0
		IL_0140: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0145: ldloca.s 0
		IL_0147: ldc.i4.m1
		IL_0148: ldc.i4.s -4
		IL_014a: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_014f: ldloc.0
		IL_0150: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0155: ldarg.0
		IL_0156: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_015b: ldc.i4.4
		IL_015c: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_MoveType(valuetype [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix/eMoveType)
		IL_0161: ldarg.0
		IL_0162: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0167: ldstr "Unregistered :("
		IL_016c: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_MyText(string)
		IL_0171: ldarg.0
		IL_0172: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0177: ldstr "GabMatrix1"
		IL_017c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0181: ldarg.0
		IL_0182: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0187: ldloca.s 1
		IL_0189: ldc.i4 354
		IL_018e: ldc.i4.s 44
		IL_0190: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0195: ldloc.1
		IL_0196: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_019b: ldarg.0
		IL_019c: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_01a1: ldc.i4.s 9
		IL_01a3: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_01a8: ldarg.0
		IL_01a9: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_01ae: ldc.i4.s 25
		IL_01b0: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_TimeInterval(int32)
		IL_01b5: ldarg.0
		IL_01b6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_01bb: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_BlueViolet()
		IL_01c0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBoxBase::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_01c5: ldarg.0
		IL_01c6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_01cb: ldstr "Microsoft Sans Serif"
		IL_01d0: ldc.r4 8.25
		IL_01d5: ldc.i4.1
		IL_01d6: ldc.i4.3
		IL_01d7: ldc.i4.0
		IL_01d8: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_01dd: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_01e2: ldarg.0
		IL_01e3: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_01e8: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_White()
		IL_01ed: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBoxBase::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_01f2: ldarg.0
		IL_01f3: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_01f8: ldloca.s 0
		IL_01fa: ldc.i4.s 79
		IL_01fc: ldc.i4.s 100
		IL_01fe: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0203: ldloc.0
		IL_0204: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0209: ldarg.0
		IL_020a: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_020f: ldstr "TextBox2"
		IL_0214: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0219: ldarg.0
		IL_021a: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_021f: ldloca.s 1
		IL_0221: ldc.i4 259
		IL_0226: ldc.i4.s 20
		IL_0228: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_022d: ldloc.1
		IL_022e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0233: ldarg.0
		IL_0234: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_0239: ldc.i4.1
		IL_023a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_023f: ldarg.0
		IL_0240: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_0245: ldc.i4.2
		IL_0246: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_TextAlign(valuetype [System.Windows.Forms]System.Windows.Forms.HorizontalAlignment)
		IL_024b: ldarg.0
		IL_024c: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_0251: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_BlueViolet()
		IL_0256: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBoxBase::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_025b: ldarg.0
		IL_025c: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_0261: ldstr "Microsoft Sans Serif"
		IL_0266: ldc.r4 8.25
		IL_026b: ldc.i4.1
		IL_026c: ldc.i4.3
		IL_026d: ldc.i4.0
		IL_026e: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_0273: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_0278: ldarg.0
		IL_0279: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_027e: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_White()
		IL_0283: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBoxBase::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_0288: ldarg.0
		IL_0289: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_028e: ldloca.s 0
		IL_0290: ldc.i4.s 79
		IL_0292: ldc.i4.s 56
		IL_0294: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0299: ldloc.0
		IL_029a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_029f: ldarg.0
		IL_02a0: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_02a5: ldstr "TextBox1"
		IL_02aa: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_02af: ldarg.0
		IL_02b0: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_02b5: ldloca.s 1
		IL_02b7: ldc.i4 259
		IL_02bc: ldc.i4.s 20
		IL_02be: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_02c3: ldloc.1
		IL_02c4: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_02c9: ldarg.0
		IL_02ca: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_02cf: ldc.i4.2
		IL_02d0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_02d5: ldarg.0
		IL_02d6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_02db: ldc.i4.2
		IL_02dc: callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_TextAlign(valuetype [System.Windows.Forms]System.Windows.Forms.HorizontalAlignment)
		IL_02e1: ldarg.0
		IL_02e2: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_02e7: ldc.i4.1
		IL_02e8: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_AutoSize(bool)
		IL_02ed: ldarg.0
		IL_02ee: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_02f3: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Transparent()
		IL_02f8: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_02fd: ldarg.0
		IL_02fe: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_0303: ldstr "Microsoft Sans Serif"
		IL_0308: ldc.r4 9.75
		IL_030d: ldc.i4.1
		IL_030e: ldc.i4.3
		IL_030f: ldc.i4.0
		IL_0310: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_0315: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_031a: ldarg.0
		IL_031b: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_0320: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Red()
		IL_0325: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_032a: ldarg.0
		IL_032b: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_0330: ldloca.s 0
		IL_0332: ldc.i4.s 12
		IL_0334: ldc.i4.s 57
		IL_0336: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_033b: ldloc.0
		IL_033c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0341: ldarg.0
		IL_0342: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_0347: ldstr "Label1"
		IL_034c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0351: ldarg.0
		IL_0352: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_0357: ldloca.s 1
		IL_0359: ldc.i4.s 49
		IL_035b: ldc.i4.s 16
		IL_035d: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0362: ldloc.1
		IL_0363: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0368: ldarg.0
		IL_0369: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_036e: ldc.i4.s 13
		IL_0370: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0375: ldarg.0
		IL_0376: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_037b: ldstr "Name"
		IL_0380: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_Text(string)
		IL_0385: ldarg.0
		IL_0386: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_038b: ldc.i4.s 32
		IL_038d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_TextAlign(valuetype [System.Drawing]System.Drawing.ContentAlignment)
		IL_0392: ldarg.0
		IL_0393: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_0398: ldc.i4.1
		IL_0399: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_AutoSize(bool)
		IL_039e: ldarg.0
		IL_039f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_03a4: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Transparent()
		IL_03a9: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_03ae: ldarg.0
		IL_03af: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_03b4: ldstr "Microsoft Sans Serif"
		IL_03b9: ldc.r4 9.75
		IL_03be: ldc.i4.1
		IL_03bf: ldc.i4.3
		IL_03c0: ldc.i4.0
		IL_03c1: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_03c6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_03cb: ldarg.0
		IL_03cc: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_03d1: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Red()
		IL_03d6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_03db: ldarg.0
		IL_03dc: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_03e1: ldloca.s 0
		IL_03e3: ldc.i4.s 12
		IL_03e5: ldc.i4.s 101
		IL_03e7: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_03ec: ldloc.0
		IL_03ed: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_03f2: ldarg.0
		IL_03f3: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_03f8: ldstr "Label2"
		IL_03fd: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0402: ldarg.0
		IL_0403: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_0408: ldloca.s 1
		IL_040a: ldc.i4.s 49
		IL_040c: ldc.i4.s 16
		IL_040e: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0413: ldloc.1
		IL_0414: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0419: ldarg.0
		IL_041a: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_041f: ldc.i4.s 14
		IL_0421: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0426: ldarg.0
		IL_0427: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_042c: ldstr "Sérial"
		IL_0431: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_Text(string)
		IL_0436: ldarg.0
		IL_0437: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_043c: call class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_about()
		IL_0441: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImage(class [System.Drawing]System.Drawing.Image)
		IL_0446: ldarg.0
		IL_0447: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_044c: ldc.i4.3
		IL_044d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImageLayout(valuetype [System.Windows.Forms]System.Windows.Forms.ImageLayout)
		IL_0452: ldarg.0
		IL_0453: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_0458: ldc.i4.0
		IL_0459: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_FlatStyle(valuetype [System.Windows.Forms]System.Windows.Forms.FlatStyle)
		IL_045e: ldarg.0
		IL_045f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_0464: ldloca.s 0
		IL_0466: ldc.i4 171
		IL_046b: ldc.i4 136
		IL_0470: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0475: ldloc.0
		IL_0476: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_047b: ldarg.0
		IL_047c: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_0481: ldstr "Button2"
		IL_0486: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_048b: ldarg.0
		IL_048c: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_0491: ldloca.s 1
		IL_0493: ldc.i4.s 67
		IL_0495: ldc.i4.s 29
		IL_0497: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_049c: ldloc.1
		IL_049d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_04a2: ldarg.0
		IL_04a3: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_04a8: ldc.i4.s 15
		IL_04aa: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_04af: ldarg.0
		IL_04b0: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_04b5: ldc.i4.1
		IL_04b6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_04bb: ldarg.0
		IL_04bc: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_04c1: call class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_exit2()
		IL_04c6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImage(class [System.Drawing]System.Drawing.Image)
		IL_04cb: ldarg.0
		IL_04cc: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_04d1: ldc.i4.3
		IL_04d2: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImageLayout(valuetype [System.Windows.Forms]System.Windows.Forms.ImageLayout)
		IL_04d7: ldarg.0
		IL_04d8: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_04dd: ldc.i4.0
		IL_04de: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_FlatStyle(valuetype [System.Windows.Forms]System.Windows.Forms.FlatStyle)
		IL_04e3: ldarg.0
		IL_04e4: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_04e9: ldloca.s 0
		IL_04eb: ldc.i4 244
		IL_04f0: ldc.i4 136
		IL_04f5: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_04fa: ldloc.0
		IL_04fb: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0500: ldarg.0
		IL_0501: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_0506: ldstr "Button3"
		IL_050b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0510: ldarg.0
		IL_0511: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_0516: ldloca.s 1
		IL_0518: ldc.i4.s 67
		IL_051a: ldc.i4.s 29
		IL_051c: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0521: ldloc.1
		IL_0522: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0527: ldarg.0
		IL_0528: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_052d: ldc.i4.s 16
		IL_052f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0534: ldarg.0
		IL_0535: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_053a: ldc.i4.1
		IL_053b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_0540: ldarg.0
		IL_0541: ldloca.s 2
		IL_0543: ldc.r4 6
		IL_0548: ldc.r4 13
		IL_054d: call instance void [System.Drawing]System.Drawing.SizeF::.ctor(float32, float32)
		IL_0552: ldloc.2
		IL_0553: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleDimensions(valuetype [System.Drawing]System.Drawing.SizeF)
		IL_0558: ldarg.0
		IL_0559: ldc.i4.1
		IL_055a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleMode(valuetype [System.Windows.Forms]System.Windows.Forms.AutoScaleMode)
		IL_055f: ldarg.0
		IL_0560: call class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get__071206183156_85()
		IL_0565: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImage(class [System.Drawing]System.Drawing.Image)
		IL_056a: ldarg.0
		IL_056b: ldc.i4.3
		IL_056c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImageLayout(valuetype [System.Windows.Forms]System.Windows.Forms.ImageLayout)
		IL_0571: ldarg.0
		IL_0572: ldloca.s 1
		IL_0574: ldc.i4 350
		IL_0579: ldc.i4 174
		IL_057e: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0583: ldloc.1
		IL_0584: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ClientSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_0589: ldarg.0
		IL_058a: ldc.i4.0
		IL_058b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ControlBox(bool)
		IL_0590: ldarg.0
		IL_0591: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0596: ldarg.0
		IL_0597: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		IL_059c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05a1: ldarg.0
		IL_05a2: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05a7: ldarg.0
		IL_05a8: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		IL_05ad: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05b2: ldarg.0
		IL_05b3: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05b8: ldarg.0
		IL_05b9: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		IL_05be: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05c3: ldarg.0
		IL_05c4: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05c9: ldarg.0
		IL_05ca: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		IL_05cf: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05d4: ldarg.0
		IL_05d5: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05da: ldarg.0
		IL_05db: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_05e0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05e5: ldarg.0
		IL_05e6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05eb: ldarg.0
		IL_05ec: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_05f1: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_05f6: ldarg.0
		IL_05f7: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_05fc: ldarg.0
		IL_05fd: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0602: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0607: ldarg.0
		IL_0608: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_060d: ldarg.0
		IL_060e: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		IL_0613: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0618: ldarg.0
		IL_0619: ldc.i4.1
		IL_061a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_DoubleBuffered(bool)
		IL_061f: ldarg.0
		IL_0620: ldc.i4.0
		IL_0621: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_MaximizeBox(bool)
		IL_0626: ldarg.0
		IL_0627: ldloca.s 1
		IL_0629: ldc.i4 358
		IL_062e: ldc.i4 206
		IL_0633: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0638: ldloc.1
		IL_0639: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_MaximumSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_063e: ldarg.0
		IL_063f: ldc.i4.0
		IL_0640: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_MinimizeBox(bool)
		IL_0645: ldarg.0
		IL_0646: ldloca.s 1
		IL_0648: ldc.i4 358
		IL_064d: ldc.i4 206
		IL_0652: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0657: ldloc.1
		IL_0658: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_MinimumSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_065d: ldarg.0
		IL_065e: ldstr "Form1"
		IL_0663: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0668: ldarg.0
		IL_0669: ldc.i4.0
		IL_066a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ShowIcon(bool)
		IL_066f: ldarg.0
		IL_0670: ldc.i4.1
		IL_0671: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_StartPosition(valuetype [System.Windows.Forms]System.Windows.Forms.FormStartPosition)
		IL_0676: ldarg.0
		IL_0677: ldstr "KeygenMe"
		IL_067c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_Text(string)
		IL_0681: ldarg.0
		IL_0682: ldc.i4.0
		IL_0683: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::ResumeLayout(bool)
		IL_0688: ldarg.0
		IL_0689: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::PerformLayout()
		IL_068e: ret
	} // end of method Form1::InitializeComponent

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Button get_Button1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54a10
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Button
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_0006: ret
	} // end of method Form1::get_Button1

	.method assembly specialname newslot strict virtual 
		instance void set_Button1 (
			class [System.Windows.Forms]System.Windows.Forms.Button WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54a24
		// Header size: 12
		// Code size: 62 (0x3e)
		.maxstack 2
		.locals init (
			[0] class [mscorlib]System.EventHandler
		)

		IL_0000: ldarg.0
		IL_0001: dup
		IL_0002: ldvirtftn instance void KeygenMe.Form1::Button1_Click(object, class [mscorlib]System.EventArgs)
		IL_0008: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_000d: stloc.0
		IL_000e: ldarg.0
		IL_000f: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_0014: brfalse.s IL_0022

		IL_0016: ldarg.0
		IL_0017: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_001c: ldloc.0
		IL_001d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::remove_Click(class [mscorlib]System.EventHandler)

		IL_0022: ldarg.0
		IL_0023: ldarg.1
		IL_0024: stfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_0029: ldarg.0
		IL_002a: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_002f: brfalse.s IL_003d

		IL_0031: ldarg.0
		IL_0032: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button1
		IL_0037: ldloc.0
		IL_0038: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)

		IL_003d: ret
	} // end of method Form1::set_Button1

	.method assembly specialname newslot strict virtual 
		instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix get_GabMatrix1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54a70
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::_GabMatrix1
		IL_0006: ret
	} // end of method Form1::get_GabMatrix1

	.method assembly specialname newslot strict virtual 
		instance void set_GabMatrix1 (
			class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54a84
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::_GabMatrix1
		IL_0007: ret
	} // end of method Form1::set_GabMatrix1

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.TextBox get_TextBox2 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54a90
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.TextBox
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::_TextBox2
		IL_0006: ret
	} // end of method Form1::get_TextBox2

	.method assembly specialname newslot strict virtual 
		instance void set_TextBox2 (
			class [System.Windows.Forms]System.Windows.Forms.TextBox WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54aa4
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::_TextBox2
		IL_0007: ret
	} // end of method Form1::set_TextBox2

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.TextBox get_TextBox1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54ab0
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.TextBox
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::_TextBox1
		IL_0006: ret
	} // end of method Form1::get_TextBox1

	.method assembly specialname newslot strict virtual 
		instance void set_TextBox1 (
			class [System.Windows.Forms]System.Windows.Forms.TextBox WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54ac4
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::_TextBox1
		IL_0007: ret
	} // end of method Form1::set_TextBox1

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Label get_Label1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54ad0
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Label
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::_Label1
		IL_0006: ret
	} // end of method Form1::get_Label1

	.method assembly specialname newslot strict virtual 
		instance void set_Label1 (
			class [System.Windows.Forms]System.Windows.Forms.Label WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54ae4
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::_Label1
		IL_0007: ret
	} // end of method Form1::set_Label1

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Label get_Label2 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54af0
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Label
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::_Label2
		IL_0006: ret
	} // end of method Form1::get_Label2

	.method assembly specialname newslot strict virtual 
		instance void set_Label2 (
			class [System.Windows.Forms]System.Windows.Forms.Label WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54b04
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::_Label2
		IL_0007: ret
	} // end of method Form1::set_Label2

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Button get_Button2 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54b10
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Button
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_0006: ret
	} // end of method Form1::get_Button2

	.method assembly specialname newslot strict virtual 
		instance void set_Button2 (
			class [System.Windows.Forms]System.Windows.Forms.Button WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54b24
		// Header size: 12
		// Code size: 62 (0x3e)
		.maxstack 2
		.locals init (
			[0] class [mscorlib]System.EventHandler
		)

		IL_0000: ldarg.0
		IL_0001: dup
		IL_0002: ldvirtftn instance void KeygenMe.Form1::Button2_Click(object, class [mscorlib]System.EventArgs)
		IL_0008: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_000d: stloc.0
		IL_000e: ldarg.0
		IL_000f: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_0014: brfalse.s IL_0022

		IL_0016: ldarg.0
		IL_0017: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_001c: ldloc.0
		IL_001d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::remove_Click(class [mscorlib]System.EventHandler)

		IL_0022: ldarg.0
		IL_0023: ldarg.1
		IL_0024: stfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_0029: ldarg.0
		IL_002a: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_002f: brfalse.s IL_003d

		IL_0031: ldarg.0
		IL_0032: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button2
		IL_0037: ldloc.0
		IL_0038: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)

		IL_003d: ret
	} // end of method Form1::set_Button2

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Button get_Button3 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54b70
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Button
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_0006: ret
	} // end of method Form1::get_Button3

	.method assembly specialname newslot strict virtual 
		instance void set_Button3 (
			class [System.Windows.Forms]System.Windows.Forms.Button WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x54b84
		// Header size: 12
		// Code size: 62 (0x3e)
		.maxstack 2
		.locals init (
			[0] class [mscorlib]System.EventHandler
		)

		IL_0000: ldarg.0
		IL_0001: dup
		IL_0002: ldvirtftn instance void KeygenMe.Form1::Button3_Click(object, class [mscorlib]System.EventArgs)
		IL_0008: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_000d: stloc.0
		IL_000e: ldarg.0
		IL_000f: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_0014: brfalse.s IL_0022

		IL_0016: ldarg.0
		IL_0017: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_001c: ldloc.0
		IL_001d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::remove_Click(class [mscorlib]System.EventHandler)

		IL_0022: ldarg.0
		IL_0023: ldarg.1
		IL_0024: stfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_0029: ldarg.0
		IL_002a: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_002f: brfalse.s IL_003d

		IL_0031: ldarg.0
		IL_0032: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::_Button3
		IL_0037: ldloc.0
		IL_0038: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)

		IL_003d: ret
	} // end of method Form1::set_Button3

	.method public 
		instance object var (
			string vr
		) cil managed 
	{
		// Method begins at RVA 0x54bd0
		// Header size: 12
		// Code size: 60 (0x3c)
		.maxstack 4
		.locals init (
			[0] string,
			[1] object,
			[2] int32,
			[3] int32
		)

		IL_0000: ldstr ""
		IL_0005: stloc.0
		IL_0006: ldc.i4.1
		IL_0007: ldarg.1
		IL_0008: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Len(string)
		IL_000d: stloc.3
		IL_000e: stloc.2
		IL_000f: br.s IL_0036
		// loop start (head: IL_0036)
			IL_0011: ldloc.0
			IL_0012: ldarg.1
			IL_0013: ldloc.2
			IL_0014: ldc.i4.1
			IL_0015: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
			IL_001a: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Asc(string)
			IL_001f: ldc.i4.s 9
			IL_0021: sub.ovf
			IL_0022: call char [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Chr(int32)
			IL_0027: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(char)
			IL_002c: call string [mscorlib]System.String::Concat(string, string)
			IL_0031: stloc.0
			IL_0032: ldloc.2
			IL_0033: ldc.i4.1
			IL_0034: add.ovf
			IL_0035: stloc.2

			IL_0036: ldloc.2
			IL_0037: ldloc.3
			IL_0038: ble.s IL_0011
		// end loop

		IL_003a: ldloc.0
		IL_003b: ret
	} // end of method Form1::var

	.method public 
		instance object varb (
			string vr
		) cil managed 
	{
		// Method begins at RVA 0x54c18
		// Header size: 12
		// Code size: 62 (0x3e)
		.maxstack 5
		.locals init (
			[0] string,
			[1] object,
			[2] int32,
			[3] int32
		)

		IL_0000: ldstr ""
		IL_0005: stloc.0
		IL_0006: ldc.i4.1
		IL_0007: ldarg.1
		IL_0008: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Len(string)
		IL_000d: stloc.3
		IL_000e: stloc.2
		IL_000f: br.s IL_0038
		// loop start (head: IL_0038)
			IL_0011: ldloc.0
			IL_0012: ldstr ""
			IL_0017: ldarg.1
			IL_0018: ldloc.2
			IL_0019: ldc.i4.3
			IL_001a: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
			IL_001f: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToInteger(string)
			IL_0024: call char [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Chr(int32)
			IL_0029: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(char)
			IL_002e: call string [mscorlib]System.String::Concat(string, string, string)
			IL_0033: stloc.0
			IL_0034: ldloc.2
			IL_0035: ldc.i4.3
			IL_0036: add.ovf
			IL_0037: stloc.2

			IL_0038: ldloc.2
			IL_0039: ldloc.3
			IL_003a: ble.s IL_0011
		// end loop

		IL_003c: ldloc.0
		IL_003d: ret
	} // end of method Form1::varb

	.method public 
		instance object varc () cil managed 
	{
		// Method begins at RVA 0x54c64
		// Header size: 12
		// Code size: 92 (0x5c)
		.maxstack 4
		.locals init (
			[0] int32,
			[1] string,
			[2] object
		)

		IL_0000: ldarg.0
		IL_0001: ldfld string KeygenMe.Form1::esp
		IL_0006: stloc.1
		IL_0007: ldc.i4.0
		IL_0008: stloc.0
		IL_0009: ldarg.0
		IL_000a: ldfld string KeygenMe.Form1::esp
		IL_000f: ldc.i4.1
		IL_0010: ldc.i4.4
		IL_0011: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0016: call float64 [Microsoft.VisualBasic]Microsoft.VisualBasic.Conversion::Val(string)
		IL_001b: ldarg.0
		IL_001c: ldfld string KeygenMe.Form1::esp
		IL_0021: ldc.i4.5
		IL_0022: ldc.i4.4
		IL_0023: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0028: call float64 [Microsoft.VisualBasic]Microsoft.VisualBasic.Conversion::Val(string)
		IL_002d: add
		IL_002e: ldarg.0
		IL_002f: ldfld string KeygenMe.Form1::esp
		IL_0034: ldc.i4.7
		IL_0035: ldc.i4.4
		IL_0036: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_003b: call float64 [Microsoft.VisualBasic]Microsoft.VisualBasic.Conversion::Val(string)
		IL_0040: add
		IL_0041: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(float64)
		IL_0046: stloc.1
		IL_0047: ldloc.1
		IL_0048: ldc.i4.1
		IL_0049: ldc.i4.4
		IL_004a: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_004f: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToInteger(string)
		IL_0054: stloc.0
		IL_0055: ldloc.0
		IL_0056: box [mscorlib]System.Int32
		IL_005b: ret
	} // end of method Form1::varc

	.method private 
		instance object Var1 (
			string text
		) cil managed 
	{
		// Method begins at RVA 0x54ccc
		// Header size: 12
		// Code size: 175 (0xaf)
		.maxstack 5
		.locals init (
			[0] int32,
			[1] int32,
			[2] string,
			[3] string,
			[4] string,
			[5] int64,
			[6] int64,
			[7] object,
			[8] int32,
			[9] int32
		)

		IL_0000: ldarg.1
		IL_0001: stloc.2
		IL_0002: ldstr ""
		IL_0007: stloc.3
		IL_0008: ldstr ""
		IL_000d: stloc.s 4
		IL_000f: ldc.i4.1
		IL_0010: ldloc.2
		IL_0011: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Len(string)
		IL_0016: stloc.s 9
		IL_0018: stloc.s 8
		IL_001a: br.s IL_0043
		// loop start (head: IL_0043)
			IL_001c: ldloc.s 4
			IL_001e: ldstr ""
			IL_0023: ldarg.1
			IL_0024: ldloc.s 8
			IL_0026: ldc.i4.1
			IL_0027: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
			IL_002c: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Asc(string)
			IL_0031: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Conversion::Hex(int32)
			IL_0036: call string [mscorlib]System.String::Concat(string, string, string)
			IL_003b: stloc.s 4
			IL_003d: ldloc.s 8
			IL_003f: ldc.i4.1
			IL_0040: add.ovf
			IL_0041: stloc.s 8

			IL_0043: ldloc.s 8
			IL_0045: ldloc.s 9
			IL_0047: ble.s IL_001c
		// end loop

		IL_0049: ldloc.s 4
		IL_004b: callvirt instance int32 [mscorlib]System.String::get_Length()
		IL_0050: ldc.i4.1
		IL_0051: sub.ovf
		IL_0052: stloc.0
		IL_0053: ldc.i4.0
		IL_0054: stloc.1
		IL_0055: br.s IL_0081
		// loop start (head: IL_0081)
			IL_0057: ldloc.s 4
			IL_0059: ldloc.1
			IL_005a: ldc.i4.1
			IL_005b: callvirt instance string [mscorlib]System.String::Substring(int32, int32)
			IL_0060: ldstr "[1-9]"
			IL_0065: ldc.i4.0
			IL_0066: call bool [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.LikeOperator::LikeString(string, string, valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.CompareMethod)
			IL_006b: brfalse.s IL_007d

			IL_006d: ldloc.3
			IL_006e: ldloc.s 4
			IL_0070: ldloc.1
			IL_0071: ldc.i4.1
			IL_0072: callvirt instance string [mscorlib]System.String::Substring(int32, int32)
			IL_0077: call string [mscorlib]System.String::Concat(string, string)
			IL_007c: stloc.3

			IL_007d: ldloc.1
			IL_007e: ldc.i4.1
			IL_007f: add.ovf
			IL_0080: stloc.1

			IL_0081: ldloc.1
			IL_0082: ldloc.0
			IL_0083: ble.s IL_0057
		// end loop

		IL_0085: ldloc.3
		IL_0086: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Len(string)
		IL_008b: conv.i8
		IL_008c: stloc.s 5
		IL_008e: ldloc.s 5
		IL_0090: ldc.i4.s 12
		IL_0092: conv.i8
		IL_0093: ble.s IL_00ad

		IL_0095: ldloc.3
		IL_0096: ldc.i4.1
		IL_0097: ldc.i4.s 12
		IL_0099: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_009e: call int64 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToLong(string)
		IL_00a3: stloc.s 6
		IL_00a5: ldloc.s 6
		IL_00a7: box [mscorlib]System.Int64
		IL_00ac: ret

		IL_00ad: ldloc.3
		IL_00ae: ret
	} // end of method Form1::Var1

	.method private 
		instance object Var2 (
			int64 nb1,
			int64 nb2
		) cil managed 
	{
		// Method begins at RVA 0x54d88
		// Header size: 12
		// Code size: 231 (0xe7)
		.maxstack 5
		.locals init (
			[0] float64,
			[1] string,
			[2] string,
			[3] string,
			[4] bool,
			[5] object,
			[6] string[]
		)

		IL_0000: ldc.r8 0.0
		IL_0009: stloc.0
		IL_000a: ldstr ""
		IL_000f: stloc.1
		IL_0010: ldarg.1
		IL_0011: ldarg.2
		IL_0012: add.ovf
		IL_0013: box [mscorlib]System.Int64
		IL_0018: call float64 [Microsoft.VisualBasic]Microsoft.VisualBasic.Conversion::Val(object)
		IL_001d: stloc.0
		IL_001e: ldloca.s 0
		IL_0020: call instance string [mscorlib]System.Double::ToString()
		IL_0025: stloc.1
		IL_0026: ldloc.1
		IL_0027: ldarg.0
		IL_0028: callvirt instance object KeygenMe.Form1::varc()
		IL_002d: call object [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Operators::ConcatenateObject(object, object)
		IL_0032: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_0037: stloc.1
		IL_0038: ldc.i4.7
		IL_0039: newarr [mscorlib]System.String
		IL_003e: stloc.s 6
		IL_0040: ldloc.s 6
		IL_0042: ldc.i4.0
		IL_0043: ldloc.1
		IL_0044: ldc.i4.1
		IL_0045: ldc.i4.4
		IL_0046: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_004b: stelem.ref
		IL_004c: ldloc.s 6
		IL_004e: ldc.i4.1
		IL_004f: ldstr "-"
		IL_0054: stelem.ref
		IL_0055: ldloc.s 6
		IL_0057: ldc.i4.2
		IL_0058: ldloc.1
		IL_0059: ldc.i4.5
		IL_005a: ldc.i4.4
		IL_005b: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0060: stelem.ref
		IL_0061: ldloc.s 6
		IL_0063: ldc.i4.3
		IL_0064: ldstr "-"
		IL_0069: stelem.ref
		IL_006a: ldloc.s 6
		IL_006c: ldc.i4.4
		IL_006d: ldloc.1
		IL_006e: ldc.i4.s 9
		IL_0070: ldc.i4.4
		IL_0071: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0076: stelem.ref
		IL_0077: ldloc.s 6
		IL_0079: ldc.i4.5
		IL_007a: ldstr "-"
		IL_007f: stelem.ref
		IL_0080: ldloc.s 6
		IL_0082: ldc.i4.6
		IL_0083: ldloc.1
		IL_0084: ldc.i4.s 13
		IL_0086: ldc.i4.4
		IL_0087: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_008c: stelem.ref
		IL_008d: ldloc.s 6
		IL_008f: call string [mscorlib]System.String::Concat(string[])
		IL_0094: stloc.2
		IL_0095: ldarg.0
		IL_0096: ldstr "[nounl}x{"
		IL_009b: callvirt instance object KeygenMe.Form1::var(string)
		IL_00a0: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_00a5: call class [System]System.Diagnostics.Process[] [System]System.Diagnostics.Process::GetProcessesByName(string)
		IL_00aa: ldc.i4.1
		IL_00ab: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Information::UBound(class [mscorlib]System.Array, int32)
		IL_00b0: ldc.i4.0
		IL_00b1: ceq
		IL_00b3: stloc.s 4
		IL_00b5: ldarg.0
		IL_00b6: ldstr "075101121103101110077101"
		IL_00bb: callvirt instance object KeygenMe.Form1::varb(string)
		IL_00c0: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_00c5: stloc.3
		IL_00c6: ldloc.s 4
		IL_00c8: ldarg.0
		IL_00c9: callvirt instance string [System.Windows.Forms]System.Windows.Forms.Form::get_Text()
		IL_00ce: ldloc.3
		IL_00cf: ldc.i4.0
		IL_00d0: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Operators::CompareString(string, string, bool)
		IL_00d5: ldc.i4.0
		IL_00d6: ceq
		IL_00d8: ldc.i4.0
		IL_00d9: ceq
		IL_00db: or
		IL_00dc: brfalse.s IL_00e5

		IL_00de: ldc.i4.0
		IL_00df: box [mscorlib]System.Int32
		IL_00e4: ret

		IL_00e5: ldloc.2
		IL_00e6: ret
	} // end of method Form1::Var2

	.method private 
		instance object var2b () cil managed 
	{
		// Method begins at RVA 0x54e7c
		// Header size: 12
		// Code size: 96 (0x60)
		.maxstack 3
		.locals init (
			[0] string,
			[1] string,
			[2] string,
			[3] string,
			[4] object
		)

		IL_0000: ldarg.0
		IL_0001: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_0006: callvirt instance string [System.Windows.Forms]System.Windows.Forms.TextBox::get_Text()
		IL_000b: stloc.0
		IL_000c: ldarg.0
		IL_000d: ldloc.0
		IL_000e: stfld string KeygenMe.Form1::esp4
		IL_0013: ldarg.0
		IL_0014: ldloc.0
		IL_0015: callvirt instance object KeygenMe.Form1::Var1(string)
		IL_001a: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_001f: stloc.1
		IL_0020: ldarg.0
		IL_0021: ldloc.1
		IL_0022: stfld string KeygenMe.Form1::esp
		IL_0027: call class [mscorlib]System.Version [mscorlib]System.Environment::get_Version()
		IL_002c: callvirt instance string [mscorlib]System.Version::ToString()
		IL_0031: stloc.2
		IL_0032: ldarg.0
		IL_0033: ldloc.2
		IL_0034: callvirt instance object KeygenMe.Form1::Var1(string)
		IL_0039: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_003e: stloc.2
		IL_003f: ldarg.0
		IL_0040: ldloc.1
		IL_0041: call int64 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToLong(string)
		IL_0046: ldloc.2
		IL_0047: call int64 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToLong(string)
		IL_004c: callvirt instance object KeygenMe.Form1::Var2(int64, int64)
		IL_0051: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_0056: stloc.3
		IL_0057: ldarg.0
		IL_0058: ldloc.3
		IL_0059: stfld string KeygenMe.Form1::esp1
		IL_005e: ldloc.3
		IL_005f: ret
	} // end of method Form1::var2b

	.method private 
		instance object var3 () cil managed 
	{
		// Method begins at RVA 0x54ee8
		// Header size: 12
		// Code size: 150 (0x96)
		.maxstack 3
		.locals init (
			[0] bool,
			[1] int32,
			[2] string,
			[3] string,
			[4] string,
			[5] object,
			[6] string
		)

		IL_0000: ldarg.0
		IL_0001: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		IL_0006: callvirt instance string [System.Windows.Forms]System.Windows.Forms.TextBox::get_Text()
		IL_000b: stloc.2
		IL_000c: ldstr ""
		IL_0011: stloc.3
		IL_0012: ldc.i4.0
		IL_0013: stloc.0
		IL_0014: ldarg.0
		IL_0015: callvirt instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		IL_001a: callvirt instance string [System.Windows.Forms]System.Windows.Forms.TextBox::get_Text()
		IL_001f: stloc.s 4
		IL_0021: ldloc.s 4
		IL_0023: ldstr ""
		IL_0028: ldc.i4.0
		IL_0029: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Operators::CompareString(string, string, bool)
		IL_002e: ldc.i4.0
		IL_002f: beq.s IL_0082

		IL_0031: ldarg.0
		IL_0032: callvirt instance object KeygenMe.Form1::var2b()
		IL_0037: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_003c: stloc.s 6
		IL_003e: ldarg.0
		IL_003f: ldarg.0
		IL_0040: ldfld string KeygenMe.Form1::esp1
		IL_0045: callvirt instance object KeygenMe.Form1::var4(string)
		IL_004a: pop
		IL_004b: ldloc.s 6
		IL_004d: call int32 [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Len(string)
		IL_0052: stloc.1
		IL_0053: ldloc.1
		IL_0054: ldc.i4.1
		IL_0055: bne.un.s IL_005b

		IL_0057: ldc.i4.0
		IL_0058: stloc.0
		IL_0059: br.s IL_007b

		IL_005b: ldarg.0
		IL_005c: ldfld string KeygenMe.Form1::esp1
		IL_0061: ldarg.0
		IL_0062: ldfld string KeygenMe.Form1::esp2
		IL_0067: call object KeygenMe.O1::var01(string, string)
		IL_006c: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_0071: stloc.3
		IL_0072: ldloc.2
		IL_0073: ldloc.3
		IL_0074: ldc.i4.0
		IL_0075: call bool [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.LikeOperator::LikeString(string, string, valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.CompareMethod)
		IL_007a: stloc.0

		IL_007b: ldloc.0
		IL_007c: box [mscorlib]System.Boolean
		IL_0081: ret

		IL_0082: ldstr "Enter your Name"
		IL_0087: ldc.i4.0
		IL_0088: ldnull
		IL_0089: call valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.MsgBoxResult [Microsoft.VisualBasic]Microsoft.VisualBasic.Interaction::MsgBox(object, valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.MsgBoxStyle, object)
		IL_008e: pop
		IL_008f: ldc.i4.0
		IL_0090: box [mscorlib]System.Boolean
		IL_0095: ret
	} // end of method Form1::var3

	.method private 
		instance object var4 (
			string str
		) cil managed 
	{
		// Method begins at RVA 0x54f8c
		// Header size: 12
		// Code size: 167 (0xa7)
		.maxstack 5
		.locals init (
			[0] uint8[],
			[1] class [mscorlib]System.Security.Cryptography.SHA256Managed,
			[2] string,
			[3] string,
			[4] string,
			[5] class [mscorlib]System.Text.UnicodeEncoding,
			[6] object,
			[7] string[]
		)

		IL_0000: newobj instance void [mscorlib]System.Security.Cryptography.SHA256Managed::.ctor()
		IL_0005: stloc.1
		IL_0006: newobj instance void [mscorlib]System.Text.UnicodeEncoding::.ctor()
		IL_000b: stloc.s 5
		IL_000d: ldloc.s 5
		IL_000f: ldarg.1
		IL_0010: callvirt instance uint8[] [mscorlib]System.Text.Encoding::GetBytes(string)
		IL_0015: stloc.0
		IL_0016: ldloc.1
		IL_0017: ldloc.0
		IL_0018: callvirt instance uint8[] [mscorlib]System.Security.Cryptography.HashAlgorithm::ComputeHash(uint8[])
		IL_001d: call string [mscorlib]System.Convert::ToBase64String(uint8[])
		IL_0022: stloc.s 4
		IL_0024: ldarg.0
		IL_0025: ldloc.s 4
		IL_0027: callvirt instance string [mscorlib]System.String::ToUpper()
		IL_002c: callvirt instance object KeygenMe.Form1::var6(string)
		IL_0031: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Conversions::ToString(object)
		IL_0036: stloc.2
		IL_0037: ldloc.2
		IL_0038: ldc.i4.1
		IL_0039: ldc.i4.s 16
		IL_003b: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0040: stloc.2
		IL_0041: ldc.i4.7
		IL_0042: newarr [mscorlib]System.String
		IL_0047: stloc.s 7
		IL_0049: ldloc.s 7
		IL_004b: ldc.i4.0
		IL_004c: ldloc.2
		IL_004d: ldc.i4.1
		IL_004e: ldc.i4.4
		IL_004f: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0054: stelem.ref
		IL_0055: ldloc.s 7
		IL_0057: ldc.i4.1
		IL_0058: ldstr "-"
		IL_005d: stelem.ref
		IL_005e: ldloc.s 7
		IL_0060: ldc.i4.2
		IL_0061: ldloc.2
		IL_0062: ldc.i4.5
		IL_0063: ldc.i4.4
		IL_0064: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0069: stelem.ref
		IL_006a: ldloc.s 7
		IL_006c: ldc.i4.3
		IL_006d: ldstr "-"
		IL_0072: stelem.ref
		IL_0073: ldloc.s 7
		IL_0075: ldc.i4.4
		IL_0076: ldloc.2
		IL_0077: ldc.i4.s 9
		IL_0079: ldc.i4.4
		IL_007a: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_007f: stelem.ref
		IL_0080: ldloc.s 7
		IL_0082: ldc.i4.5
		IL_0083: ldstr "-"
		IL_0088: stelem.ref
		IL_0089: ldloc.s 7
		IL_008b: ldc.i4.6
		IL_008c: ldloc.2
		IL_008d: ldc.i4.s 13
		IL_008f: ldc.i4.4
		IL_0090: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0095: stelem.ref
		IL_0096: ldloc.s 7
		IL_0098: call string [mscorlib]System.String::Concat(string[])
		IL_009d: stloc.3
		IL_009e: ldarg.0
		IL_009f: ldloc.3
		IL_00a0: stfld string KeygenMe.Form1::esp2
		IL_00a5: ldloc.3
		IL_00a6: ret
	} // end of method Form1::var4

	.method public 
		instance object var6 (
			string str
		) cil managed 
	{
		// Method begins at RVA 0x55040
		// Header size: 12
		// Code size: 67 (0x43)
		.maxstack 4
		.locals init (
			[0] int32,
			[1] int32,
			[2] string,
			[3] string,
			[4] object
		)

		IL_0000: ldstr ""
		IL_0005: stloc.2
		IL_0006: ldarg.1
		IL_0007: stloc.3
		IL_0008: ldloc.3
		IL_0009: callvirt instance int32 [mscorlib]System.String::get_Length()
		IL_000e: ldc.i4.1
		IL_000f: sub.ovf
		IL_0010: stloc.0
		IL_0011: ldc.i4.0
		IL_0012: stloc.1
		IL_0013: br.s IL_003d
		// loop start (head: IL_003d)
			IL_0015: ldloc.3
			IL_0016: ldloc.1
			IL_0017: ldc.i4.1
			IL_0018: callvirt instance string [mscorlib]System.String::Substring(int32, int32)
			IL_001d: ldstr "[1-Z]"
			IL_0022: ldc.i4.0
			IL_0023: call bool [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.LikeOperator::LikeString(string, string, valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.CompareMethod)
			IL_0028: brfalse.s IL_0039

			IL_002a: ldloc.2
			IL_002b: ldloc.3
			IL_002c: ldloc.1
			IL_002d: ldc.i4.1
			IL_002e: callvirt instance string [mscorlib]System.String::Substring(int32, int32)
			IL_0033: call string [mscorlib]System.String::Concat(string, string)
			IL_0038: stloc.2

			IL_0039: ldloc.1
			IL_003a: ldc.i4.1
			IL_003b: add.ovf
			IL_003c: stloc.1

			IL_003d: ldloc.1
			IL_003e: ldloc.0
			IL_003f: ble.s IL_0015
		// end loop

		IL_0041: ldloc.2
		IL_0042: ret
	} // end of method Form1::var6

	.method private 
		instance void Button1_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x55090
		// Header size: 12
		// Code size: 138 (0x8a)
		.maxstack 3

		IL_0000: ldarg.0
		IL_0001: callvirt instance object KeygenMe.Form1::var3()
		IL_0006: ldc.i4.1
		IL_0007: box [mscorlib]System.Boolean
		IL_000c: ldc.i4.0
		IL_000d: call bool [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.Operators::ConditionalCompareObjectEqual(object, object, bool)
		IL_0012: brfalse.s IL_005e

		IL_0014: ldarg.0
		IL_0015: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_001a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::Refresh()
		IL_001f: ldarg.0
		IL_0020: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0025: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Gold()
		IL_002a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_002f: ldarg.0
		IL_0030: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0035: ldstr "Registered :)"
		IL_003a: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_MyText(string)
		IL_003f: ldstr "Good Job "
		IL_0044: ldarg.0
		IL_0045: ldfld string KeygenMe.Form1::esp4
		IL_004a: ldstr " Now Créate a keygen"
		IL_004f: call string [mscorlib]System.String::Concat(string, string, string)
		IL_0054: ldc.i4.0
		IL_0055: ldnull
		IL_0056: call valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.MsgBoxResult [Microsoft.VisualBasic]Microsoft.VisualBasic.Interaction::MsgBox(object, valuetype [Microsoft.VisualBasic]Microsoft.VisualBasic.MsgBoxStyle, object)
		IL_005b: pop
		IL_005c: br.s IL_0089

		IL_005e: ldarg.0
		IL_005f: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_0064: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::Refresh()
		IL_0069: ldarg.0
		IL_006a: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_006f: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Red()
		IL_0074: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_0079: ldarg.0
		IL_007a: callvirt instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		IL_007f: ldstr "Unregistered :("
		IL_0084: callvirt instance void [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix::set_MyText(string)

		IL_0089: ret
	} // end of method Form1::Button1_Click

	.method private 
		instance void Button3_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x55128
		// Header size: 1
		// Code size: 13 (0xd)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: callvirt instance void [System]System.ComponentModel.Component::Dispose()
		IL_0006: ldarg.0
		IL_0007: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::Close()
		IL_000c: ret
	} // end of method Form1::Button3_Click

	.method private 
		instance void Button2_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x55138
		// Header size: 1
		// Code size: 31 (0x1f)
		.maxstack 8

		IL_0000: call class KeygenMe.My.MyProject/MyForms KeygenMe.My.MyProject::get_Forms()
		IL_0005: callvirt instance class KeygenMe.Form2 KeygenMe.My.MyProject/MyForms::get_Form2()
		IL_000a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::Show()
		IL_000f: ldarg.0
		IL_0010: ldc.r8 0.0
		IL_0019: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_Opacity(float64)
		IL_001e: ret
	} // end of method Form1::Button2_Click

	// Properties
	.property instance class [System.Windows.Forms]System.Windows.Forms.Button Button1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button1()
		.set instance void KeygenMe.Form1::set_Button1(class [System.Windows.Forms]System.Windows.Forms.Button)
	}
	.property instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix GabMatrix1()
	{
		.get instance class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix KeygenMe.Form1::get_GabMatrix1()
		.set instance void KeygenMe.Form1::set_GabMatrix1(class [GabMatrix]GabSoftware.Controls.GabMatrix.GabMatrix)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.TextBox TextBox2()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox2()
		.set instance void KeygenMe.Form1::set_TextBox2(class [System.Windows.Forms]System.Windows.Forms.TextBox)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.TextBox TextBox1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.TextBox KeygenMe.Form1::get_TextBox1()
		.set instance void KeygenMe.Form1::set_TextBox1(class [System.Windows.Forms]System.Windows.Forms.TextBox)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Label Label1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label1()
		.set instance void KeygenMe.Form1::set_Label1(class [System.Windows.Forms]System.Windows.Forms.Label)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Label Label2()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form1::get_Label2()
		.set instance void KeygenMe.Form1::set_Label2(class [System.Windows.Forms]System.Windows.Forms.Label)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Button Button2()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button2()
		.set instance void KeygenMe.Form1::set_Button2(class [System.Windows.Forms]System.Windows.Forms.Button)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Button Button3()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form1::get_Button3()
		.set instance void KeygenMe.Form1::set_Button3(class [System.Windows.Forms]System.Windows.Forms.Button)
	}

} // end of class KeygenMe.Form1

.class public auto ansi KeygenMe.Form2
	extends [System.Windows.Forms]System.Windows.Forms.Form
{
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.DesignerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private class [System]System.ComponentModel.IContainer components
	.field private class [System.Windows.Forms]System.Windows.Forms.PictureBox _PictureBox1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 0b 50 69 63 74 75 72 65 42 6f 78 31 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Label _Label1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 06 4c 61 62 65 6c 31 00 00
	)
	.field private class [System.Windows.Forms]System.Windows.Forms.Button _Button1
	.custom instance void [mscorlib]System.Runtime.CompilerServices.AccessedThroughPropertyAttribute::.ctor(string) = (
		01 00 07 42 75 74 74 6f 6e 31 00 00
	)

	// Methods
	.method public specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x55158
		// Header size: 1
		// Code size: 13 (0xd)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System.Windows.Forms]System.Windows.Forms.Form::.ctor()
		IL_0006: ldarg.0
		IL_0007: callvirt instance void KeygenMe.Form2::InitializeComponent()
		IL_000c: ret
	} // end of method Form2::.ctor

	.method family strict virtual 
		instance void Dispose (
			bool disposing
		) cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x55168
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 2

		.try
		{
			IL_0000: ldarg.1
			IL_0001: brfalse.s IL_0016

			IL_0003: ldarg.0
			IL_0004: ldfld class [System]System.ComponentModel.IContainer KeygenMe.Form2::components
			IL_0009: brfalse.s IL_0016

			IL_000b: ldarg.0
			IL_000c: ldfld class [System]System.ComponentModel.IContainer KeygenMe.Form2::components
			IL_0011: callvirt instance void [mscorlib]System.IDisposable::Dispose()

			IL_0016: leave.s IL_0020
		} // end .try
		finally
		{
			IL_0018: ldarg.0
			IL_0019: ldarg.1
			IL_001a: call instance void [System.Windows.Forms]System.Windows.Forms.Form::Dispose(bool)
			IL_001f: endfinally
		} // end handler

		IL_0020: ret
	} // end of method Form2::Dispose

	.method private 
		instance void InitializeComponent () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x551a8
		// Header size: 12
		// Code size: 695 (0x2b7)
		.maxstack 6
		.locals init (
			[0] valuetype [System.Drawing]System.Drawing.Point,
			[1] valuetype [System.Drawing]System.Drawing.Size,
			[2] valuetype [System.Drawing]System.Drawing.SizeF
		)

		IL_0000: ldarg.0
		IL_0001: newobj instance void [System.Windows.Forms]System.Windows.Forms.PictureBox::.ctor()
		IL_0006: callvirt instance void KeygenMe.Form2::set_PictureBox1(class [System.Windows.Forms]System.Windows.Forms.PictureBox)
		IL_000b: ldarg.0
		IL_000c: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0011: callvirt instance void KeygenMe.Form2::set_Label1(class [System.Windows.Forms]System.Windows.Forms.Label)
		IL_0016: ldarg.0
		IL_0017: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_001c: callvirt instance void KeygenMe.Form2::set_Button1(class [System.Windows.Forms]System.Windows.Forms.Button)
		IL_0021: ldarg.0
		IL_0022: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0027: callvirt instance void [System]System.ComponentModel.ISupportInitialize::BeginInit()
		IL_002c: ldarg.0
		IL_002d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::SuspendLayout()
		IL_0032: ldarg.0
		IL_0033: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0038: call class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get__071206183156_85()
		IL_003d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImage(class [System.Drawing]System.Drawing.Image)
		IL_0042: ldarg.0
		IL_0043: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0048: ldc.i4.3
		IL_0049: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackgroundImageLayout(valuetype [System.Windows.Forms]System.Windows.Forms.ImageLayout)
		IL_004e: ldarg.0
		IL_004f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0054: ldloca.s 0
		IL_0056: ldc.i4.1
		IL_0057: ldc.i4.0
		IL_0058: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_005d: ldloc.0
		IL_005e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0063: ldarg.0
		IL_0064: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0069: ldstr "PictureBox1"
		IL_006e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0073: ldarg.0
		IL_0074: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0079: ldloca.s 1
		IL_007b: ldc.i4 294
		IL_0080: ldc.i4 219
		IL_0085: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_008a: ldloc.1
		IL_008b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0090: ldarg.0
		IL_0091: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_0096: ldc.i4.0
		IL_0097: callvirt instance void [System.Windows.Forms]System.Windows.Forms.PictureBox::set_TabIndex(int32)
		IL_009c: ldarg.0
		IL_009d: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_00a2: ldc.i4.0
		IL_00a3: callvirt instance void [System.Windows.Forms]System.Windows.Forms.PictureBox::set_TabStop(bool)
		IL_00a8: ldarg.0
		IL_00a9: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_00ae: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Transparent()
		IL_00b3: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_00b8: ldarg.0
		IL_00b9: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_00be: ldstr "Microsoft Sans Serif"
		IL_00c3: ldc.r4 8.25
		IL_00c8: ldc.i4.1
		IL_00c9: ldc.i4.3
		IL_00ca: ldc.i4.0
		IL_00cb: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_00d0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_00d5: ldarg.0
		IL_00d6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_00db: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_White()
		IL_00e0: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_00e5: ldarg.0
		IL_00e6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_00eb: ldloca.s 0
		IL_00ed: ldc.i4.3
		IL_00ee: ldc.i4 222
		IL_00f3: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_00f8: ldloc.0
		IL_00f9: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_00fe: ldarg.0
		IL_00ff: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_0104: ldstr "Label1"
		IL_0109: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_010e: ldarg.0
		IL_010f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_0114: ldloca.s 1
		IL_0116: ldc.i4 292
		IL_011b: ldc.i4.s 55
		IL_011d: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0122: ldloc.1
		IL_0123: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0128: ldarg.0
		IL_0129: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_012e: ldc.i4.1
		IL_012f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0134: ldarg.0
		IL_0135: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_013a: ldstr "Coder --> Bikers80\r\nFind a Sérial and créate a keygen \r\nhave fun \r\nBikers 80\r\n"
		IL_013f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_Text(string)
		IL_0144: ldarg.0
		IL_0145: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_014a: ldc.i4.s 32
		IL_014c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Label::set_TextAlign(valuetype [System.Drawing]System.Drawing.ContentAlignment)
		IL_0151: ldarg.0
		IL_0152: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_0157: callvirt instance class [System.Windows.Forms]System.Windows.Forms.FlatButtonAppearance [System.Windows.Forms]System.Windows.Forms.ButtonBase::get_FlatAppearance()
		IL_015c: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_White()
		IL_0161: callvirt instance void [System.Windows.Forms]System.Windows.Forms.FlatButtonAppearance::set_MouseDownBackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_0166: ldarg.0
		IL_0167: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_016c: ldc.i4.0
		IL_016d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_FlatStyle(valuetype [System.Windows.Forms]System.Windows.Forms.FlatStyle)
		IL_0172: ldarg.0
		IL_0173: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_0178: ldstr "Microsoft Sans Serif"
		IL_017d: ldc.r4 8.25
		IL_0182: ldc.i4.1
		IL_0183: ldc.i4.3
		IL_0184: ldc.i4.0
		IL_0185: newobj instance void [System.Drawing]System.Drawing.Font::.ctor(string, float32, valuetype [System.Drawing]System.Drawing.FontStyle, valuetype [System.Drawing]System.Drawing.GraphicsUnit, uint8)
		IL_018a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Font(class [System.Drawing]System.Drawing.Font)
		IL_018f: ldarg.0
		IL_0190: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_0195: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_White()
		IL_019a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_ForeColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_019f: ldarg.0
		IL_01a0: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_01a5: ldloca.s 0
		IL_01a7: ldc.i4 248
		IL_01ac: ldc.i4 255
		IL_01b1: call instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_01b6: ldloc.0
		IL_01b7: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_01bc: ldarg.0
		IL_01bd: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_01c2: ldstr "Button1"
		IL_01c7: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_01cc: ldarg.0
		IL_01cd: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_01d2: ldloca.s 1
		IL_01d4: ldc.i4.s 47
		IL_01d6: ldc.i4.s 22
		IL_01d8: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_01dd: ldloc.1
		IL_01de: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_01e3: ldarg.0
		IL_01e4: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_01e9: ldc.i4.2
		IL_01ea: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_01ef: ldarg.0
		IL_01f0: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_01f5: ldstr "Exit"
		IL_01fa: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_Text(string)
		IL_01ff: ldarg.0
		IL_0200: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_0205: ldc.i4.1
		IL_0206: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_020b: ldarg.0
		IL_020c: ldloca.s 2
		IL_020e: ldc.r4 6
		IL_0213: ldc.r4 13
		IL_0218: call instance void [System.Drawing]System.Drawing.SizeF::.ctor(float32, float32)
		IL_021d: ldloc.2
		IL_021e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleDimensions(valuetype [System.Drawing]System.Drawing.SizeF)
		IL_0223: ldarg.0
		IL_0224: ldc.i4.1
		IL_0225: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleMode(valuetype [System.Windows.Forms]System.Windows.Forms.AutoScaleMode)
		IL_022a: ldarg.0
		IL_022b: call valuetype [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Black()
		IL_0230: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_BackColor(valuetype [System.Drawing]System.Drawing.Color)
		IL_0235: ldarg.0
		IL_0236: ldloca.s 1
		IL_0238: ldc.i4 295
		IL_023d: ldc.i4 282
		IL_0242: call instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0247: ldloc.1
		IL_0248: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ClientSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_024d: ldarg.0
		IL_024e: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0253: ldarg.0
		IL_0254: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		IL_0259: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_025e: ldarg.0
		IL_025f: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0264: ldarg.0
		IL_0265: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		IL_026a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_026f: ldarg.0
		IL_0270: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0275: ldarg.0
		IL_0276: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_027b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0280: ldarg.0
		IL_0281: ldc.i4.0
		IL_0282: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_FormBorderStyle(valuetype [System.Windows.Forms]System.Windows.Forms.FormBorderStyle)
		IL_0287: ldarg.0
		IL_0288: ldstr "Form2"
		IL_028d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0292: ldarg.0
		IL_0293: ldc.i4.1
		IL_0294: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_StartPosition(valuetype [System.Windows.Forms]System.Windows.Forms.FormStartPosition)
		IL_0299: ldarg.0
		IL_029a: ldstr "Form2"
		IL_029f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_Text(string)
		IL_02a4: ldarg.0
		IL_02a5: callvirt instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		IL_02aa: callvirt instance void [System]System.ComponentModel.ISupportInitialize::EndInit()
		IL_02af: ldarg.0
		IL_02b0: ldc.i4.0
		IL_02b1: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::ResumeLayout(bool)
		IL_02b6: ret
	} // end of method Form2::InitializeComponent

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.PictureBox get_PictureBox1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x5546c
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.PictureBox
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::_PictureBox1
		IL_0006: ret
	} // end of method Form2::get_PictureBox1

	.method assembly specialname newslot strict virtual 
		instance void set_PictureBox1 (
			class [System.Windows.Forms]System.Windows.Forms.PictureBox WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x55480
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::_PictureBox1
		IL_0007: ret
	} // end of method Form2::set_PictureBox1

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Label get_Label1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x5548c
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Label
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::_Label1
		IL_0006: ret
	} // end of method Form2::get_Label1

	.method assembly specialname newslot strict virtual 
		instance void set_Label1 (
			class [System.Windows.Forms]System.Windows.Forms.Label WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x554a0
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::_Label1
		IL_0007: ret
	} // end of method Form2::set_Label1

	.method assembly specialname newslot strict virtual 
		instance class [System.Windows.Forms]System.Windows.Forms.Button get_Button1 () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x554ac
		// Header size: 12
		// Code size: 7 (0x7)
		.maxstack 1
		.locals init (
			[0] class [System.Windows.Forms]System.Windows.Forms.Button
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_0006: ret
	} // end of method Form2::get_Button1

	.method assembly specialname newslot strict virtual 
		instance void set_Button1 (
			class [System.Windows.Forms]System.Windows.Forms.Button WithEventsValue
		) cil managed synchronized 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x554c0
		// Header size: 12
		// Code size: 62 (0x3e)
		.maxstack 2
		.locals init (
			[0] class [mscorlib]System.EventHandler
		)

		IL_0000: ldarg.0
		IL_0001: dup
		IL_0002: ldvirtftn instance void KeygenMe.Form2::Button1_Click(object, class [mscorlib]System.EventArgs)
		IL_0008: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_000d: stloc.0
		IL_000e: ldarg.0
		IL_000f: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_0014: brfalse.s IL_0022

		IL_0016: ldarg.0
		IL_0017: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_001c: ldloc.0
		IL_001d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::remove_Click(class [mscorlib]System.EventHandler)

		IL_0022: ldarg.0
		IL_0023: ldarg.1
		IL_0024: stfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_0029: ldarg.0
		IL_002a: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_002f: brfalse.s IL_003d

		IL_0031: ldarg.0
		IL_0032: ldfld class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::_Button1
		IL_0037: ldloc.0
		IL_0038: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)

		IL_003d: ret
	} // end of method Form2::set_Button1

	.method private 
		instance void Button1_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x5550c
		// Header size: 1
		// Code size: 31 (0x1f)
		.maxstack 8

		IL_0000: call class KeygenMe.My.MyProject/MyForms KeygenMe.My.MyProject::get_Forms()
		IL_0005: callvirt instance class KeygenMe.Form1 KeygenMe.My.MyProject/MyForms::get_Form1()
		IL_000a: ldc.r8 100
		IL_0013: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::set_Opacity(float64)
		IL_0018: ldarg.0
		IL_0019: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Form::Close()
		IL_001e: ret
	} // end of method Form2::Button1_Click

	// Properties
	.property instance class [System.Windows.Forms]System.Windows.Forms.PictureBox PictureBox1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.PictureBox KeygenMe.Form2::get_PictureBox1()
		.set instance void KeygenMe.Form2::set_PictureBox1(class [System.Windows.Forms]System.Windows.Forms.PictureBox)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Label Label1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Label KeygenMe.Form2::get_Label1()
		.set instance void KeygenMe.Form2::set_Label1(class [System.Windows.Forms]System.Windows.Forms.Label)
	}
	.property instance class [System.Windows.Forms]System.Windows.Forms.Button Button1()
	{
		.get instance class [System.Windows.Forms]System.Windows.Forms.Button KeygenMe.Form2::get_Button1()
		.set instance void KeygenMe.Form2::set_Button1(class [System.Windows.Forms]System.Windows.Forms.Button)
	}

} // end of class KeygenMe.Form2

.class private auto ansi sealed KeygenMe.My.Resources.Resources
	extends [mscorlib]System.Object
{
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 33 53 79 73 74 65 6d 2e 52 65 73 6f 75 72
		63 65 73 2e 54 6f 6f 6c 73 2e 53 74 72 6f 6e 67
		6c 79 54 79 70 65 64 52 65 73 6f 75 72 63 65 42
		75 69 6c 64 65 72 07 32 2e 30 2e 30 2e 30 00 00
	)
	.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.StandardModuleAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.HideModuleNameAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private static class [mscorlib]System.Resources.ResourceManager resourceMan
	.field private static class [mscorlib]System.Globalization.CultureInfo resourceCulture

	// Methods
	.method assembly specialname static 
		class [mscorlib]System.Resources.ResourceManager get_ResourceManager () cil managed 
	{
		// Method begins at RVA 0x53c80
		// Header size: 12
		// Code size: 51 (0x33)
		.maxstack 2
		.locals init (
			[0] class [mscorlib]System.Resources.ResourceManager,
			[1] class [mscorlib]System.Resources.ResourceManager
		)

		IL_0000: ldsfld class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::resourceMan
		IL_0005: ldnull
		IL_0006: call bool [mscorlib]System.Object::ReferenceEquals(object, object)
		IL_000b: brfalse.s IL_002d

		IL_000d: ldstr "KeygenMe.Resources"
		IL_0012: ldtoken KeygenMe.My.Resources.Resources
		IL_0017: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_001c: callvirt instance class [mscorlib]System.Reflection.Assembly [mscorlib]System.Type::get_Assembly()
		IL_0021: newobj instance void [mscorlib]System.Resources.ResourceManager::.ctor(string, class [mscorlib]System.Reflection.Assembly)
		IL_0026: stloc.1
		IL_0027: ldloc.1
		IL_0028: stsfld class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::resourceMan

		IL_002d: ldsfld class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::resourceMan
		IL_0032: ret
	} // end of method Resources::get_ResourceManager

	.method assembly specialname static 
		class [mscorlib]System.Globalization.CultureInfo get_Culture () cil managed 
	{
		// Method begins at RVA 0x53cc0
		// Header size: 12
		// Code size: 6 (0x6)
		.maxstack 1
		.locals init (
			[0] class [mscorlib]System.Globalization.CultureInfo
		)

		IL_0000: ldsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_0005: ret
	} // end of method Resources::get_Culture

	.method assembly specialname static 
		void set_Culture (
			class [mscorlib]System.Globalization.CultureInfo Value
		) cil managed 
	{
		// Method begins at RVA 0x53cd4
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: stsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_0006: ret
	} // end of method Resources::set_Culture

	.method assembly specialname static 
		class [System.Drawing]System.Drawing.Bitmap get__071206183156_85 () cil managed 
	{
		// Method begins at RVA 0x53cdc
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 3
		.locals init (
			[0] class [System.Drawing]System.Drawing.Bitmap,
			[1] object
		)

		IL_0000: call class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::get_ResourceManager()
		IL_0005: ldstr "071206183156_85"
		IL_000a: ldsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_000f: callvirt instance object [mscorlib]System.Resources.ResourceManager::GetObject(string, class [mscorlib]System.Globalization.CultureInfo)
		IL_0014: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
		IL_0019: stloc.1
		IL_001a: ldloc.1
		IL_001b: castclass [System.Drawing]System.Drawing.Bitmap
		IL_0020: ret
	} // end of method Resources::get__071206183156_85

	.method assembly specialname static 
		class [System.Drawing]System.Drawing.Bitmap get_about () cil managed 
	{
		// Method begins at RVA 0x53d0c
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 3
		.locals init (
			[0] class [System.Drawing]System.Drawing.Bitmap,
			[1] object
		)

		IL_0000: call class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::get_ResourceManager()
		IL_0005: ldstr "about"
		IL_000a: ldsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_000f: callvirt instance object [mscorlib]System.Resources.ResourceManager::GetObject(string, class [mscorlib]System.Globalization.CultureInfo)
		IL_0014: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
		IL_0019: stloc.1
		IL_001a: ldloc.1
		IL_001b: castclass [System.Drawing]System.Drawing.Bitmap
		IL_0020: ret
	} // end of method Resources::get_about

	.method assembly specialname static 
		class [System.Drawing]System.Drawing.Bitmap get_exit2 () cil managed 
	{
		// Method begins at RVA 0x53d3c
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 3
		.locals init (
			[0] class [System.Drawing]System.Drawing.Bitmap,
			[1] object
		)

		IL_0000: call class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::get_ResourceManager()
		IL_0005: ldstr "exit2"
		IL_000a: ldsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_000f: callvirt instance object [mscorlib]System.Resources.ResourceManager::GetObject(string, class [mscorlib]System.Globalization.CultureInfo)
		IL_0014: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
		IL_0019: stloc.1
		IL_001a: ldloc.1
		IL_001b: castclass [System.Drawing]System.Drawing.Bitmap
		IL_0020: ret
	} // end of method Resources::get_exit2

	.method assembly specialname static 
		class [System.Drawing]System.Drawing.Bitmap get_ok2 () cil managed 
	{
		// Method begins at RVA 0x53d6c
		// Header size: 12
		// Code size: 33 (0x21)
		.maxstack 3
		.locals init (
			[0] object,
			[1] class [System.Drawing]System.Drawing.Bitmap
		)

		IL_0000: call class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::get_ResourceManager()
		IL_0005: ldstr "ok2"
		IL_000a: ldsfld class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::resourceCulture
		IL_000f: callvirt instance object [mscorlib]System.Resources.ResourceManager::GetObject(string, class [mscorlib]System.Globalization.CultureInfo)
		IL_0014: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
		IL_0019: stloc.0
		IL_001a: ldloc.0
		IL_001b: castclass [System.Drawing]System.Drawing.Bitmap
		IL_0020: ret
	} // end of method Resources::get_ok2

	// Properties
	.property class [mscorlib]System.Resources.ResourceManager ResourceManager()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Resources.ResourceManager KeygenMe.My.Resources.Resources::get_ResourceManager()
	}
	.property class [mscorlib]System.Globalization.CultureInfo Culture()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Globalization.CultureInfo KeygenMe.My.Resources.Resources::get_Culture()
		.set void KeygenMe.My.Resources.Resources::set_Culture(class [mscorlib]System.Globalization.CultureInfo)
	}
	.property class [System.Drawing]System.Drawing.Bitmap _071206183156_85()
	{
		.get class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get__071206183156_85()
	}
	.property class [System.Drawing]System.Drawing.Bitmap about()
	{
		.get class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_about()
	}
	.property class [System.Drawing]System.Drawing.Bitmap exit2()
	{
		.get class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_exit2()
	}
	.property class [System.Drawing]System.Drawing.Bitmap ok2()
	{
		.get class [System.Drawing]System.Drawing.Bitmap KeygenMe.My.Resources.Resources::get_ok2()
	}

} // end of class KeygenMe.My.Resources.Resources

.class private auto ansi sealed beforefieldinit KeygenMe.My.MySettings
	extends [System]System.Configuration.ApplicationSettingsBase
{
	.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
		01 00 02 00 00 00 00 00
	)
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 4b 4d 69 63 72 6f 73 6f 66 74 2e 56 69 73
		75 61 6c 53 74 75 64 69 6f 2e 45 64 69 74 6f 72
		73 2e 53 65 74 74 69 6e 67 73 44 65 73 69 67 6e
		65 72 2e 53 65 74 74 69 6e 67 73 53 69 6e 67 6c
		65 46 69 6c 65 47 65 6e 65 72 61 74 6f 72 07 39
		2e 30 2e 30 2e 30 00 00
	)
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private static class KeygenMe.My.MySettings defaultInstance
	.field private static bool addedHandler
	.field private static object addedHandlerLockObject

	// Methods
	.method private specialname rtspecialname static 
		void .cctor () cil managed 
	{
		// Method begins at RVA 0x53d9c
		// Header size: 1
		// Code size: 36 (0x24)
		.maxstack 8

		IL_0000: newobj instance void KeygenMe.My.MySettings::.ctor()
		IL_0005: call class [System]System.Configuration.SettingsBase [System]System.Configuration.SettingsBase::Synchronized(class [System]System.Configuration.SettingsBase)
		IL_000a: castclass KeygenMe.My.MySettings
		IL_000f: stsfld class KeygenMe.My.MySettings KeygenMe.My.MySettings::defaultInstance
		IL_0014: newobj instance void [mscorlib]System.Object::.ctor()
		IL_0019: call object [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::GetObjectValue(object)
		IL_001e: stsfld object KeygenMe.My.MySettings::addedHandlerLockObject
		IL_0023: ret
	} // end of method MySettings::.cctor

	.method public specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x53dc4
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System]System.Configuration.ApplicationSettingsBase::.ctor()
		IL_0006: ret
	} // end of method MySettings::.ctor

	.method private static 
		void AutoSaveSettings (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
			01 00 00 00
		)
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		// Method begins at RVA 0x53dcc
		// Header size: 1
		// Code size: 23 (0x17)
		.maxstack 8

		IL_0000: call class KeygenMe.My.MyApplication KeygenMe.My.MyProject::get_Application()
		IL_0005: callvirt instance bool [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::get_SaveMySettingsOnExit()
		IL_000a: brfalse.s IL_0016

		IL_000c: call class KeygenMe.My.MySettings KeygenMe.My.MySettingsProperty::get_Settings()
		IL_0011: callvirt instance void [System]System.Configuration.ApplicationSettingsBase::Save()

		IL_0016: ret
	} // end of method MySettings::AutoSaveSettings

	.method public specialname static 
		class KeygenMe.My.MySettings get_Default () cil managed 
	{
		// Method begins at RVA 0x53de4
		// Header size: 12
		// Code size: 75 (0x4b)
		.maxstack 3
		.locals init (
			[0] class KeygenMe.My.MySettings,
			[1] object
		)

		IL_0000: ldsfld bool KeygenMe.My.MySettings::addedHandler
		IL_0005: brtrue.s IL_0045

		IL_0007: ldsfld object KeygenMe.My.MySettings::addedHandlerLockObject
		IL_000c: stloc.1
		IL_000d: ldloc.1
		IL_000e: call void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.ObjectFlowControl::CheckForSyncLockOnValueType(object)
		IL_0013: ldloc.1
		IL_0014: call void [mscorlib]System.Threading.Monitor::Enter(object)
		.try
		{
			IL_0019: ldsfld bool KeygenMe.My.MySettings::addedHandler
			IL_001e: brtrue.s IL_003c

			IL_0020: call class KeygenMe.My.MyApplication KeygenMe.My.MyProject::get_Application()
			IL_0025: ldnull
			IL_0026: ldftn void KeygenMe.My.MySettings::AutoSaveSettings(object, class [mscorlib]System.EventArgs)
			IL_002c: newobj instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.ShutdownEventHandler::.ctor(object, native int)
			IL_0031: callvirt instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase::add_Shutdown(class [Microsoft.VisualBasic]Microsoft.VisualBasic.ApplicationServices.ShutdownEventHandler)
			IL_0036: ldc.i4.1
			IL_0037: stsfld bool KeygenMe.My.MySettings::addedHandler

			IL_003c: leave.s IL_0045
		} // end .try
		finally
		{
			IL_003e: ldloc.1
			IL_003f: call void [mscorlib]System.Threading.Monitor::Exit(object)
			IL_0044: endfinally
		} // end handler

		IL_0045: ldsfld class KeygenMe.My.MySettings KeygenMe.My.MySettings::defaultInstance
		IL_004a: ret
	} // end of method MySettings::get_Default

	// Properties
	.property class KeygenMe.My.MySettings Default()
	{
		.get class KeygenMe.My.MySettings KeygenMe.My.MySettings::get_Default()
	}

} // end of class KeygenMe.My.MySettings

.class private auto ansi sealed KeygenMe.My.MySettingsProperty
	extends [mscorlib]System.Object
{
	.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.StandardModuleAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.HideModuleNameAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Methods
	.method assembly specialname static 
		class KeygenMe.My.MySettings get_Settings () cil managed 
	{
		// Method begins at RVA 0x53e4c
		// Header size: 12
		// Code size: 6 (0x6)
		.maxstack 1
		.locals init (
			[0] class KeygenMe.My.MySettings
		)

		IL_0000: call class KeygenMe.My.MySettings KeygenMe.My.MySettings::get_Default()
		IL_0005: ret
	} // end of method MySettingsProperty::get_Settings

	// Properties
	.property class KeygenMe.My.MySettings Settings()
	{
		.custom instance void [System]System.ComponentModel.Design.HelpKeywordAttribute::.ctor(string) = (
			01 00 0b 4d 79 2e 53 65 74 74 69 6e 67 73 00 00
		)
		.get class KeygenMe.My.MySettings KeygenMe.My.MySettingsProperty::get_Settings()
	}

} // end of class KeygenMe.My.MySettingsProperty

.class private auto ansi sealed beforefieldinit KeygenMe.O1
	extends [mscorlib]System.Object
{
	.custom instance void [Microsoft.VisualBasic]Microsoft.VisualBasic.CompilerServices.StandardModuleAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private static string str8

	// Methods
	.method private specialname rtspecialname static 
		void .cctor () cil managed 
	{
		// Method begins at RVA 0x53e60
		// Header size: 1
		// Code size: 11 (0xb)
		.maxstack 8

		IL_0000: ldstr ""
		IL_0005: stsfld string KeygenMe.O1::str8
		IL_000a: ret
	} // end of method O1::.cctor

	.method public static 
		object var01 (
			string str,
			string str1
		) cil managed 
	{
		// Method begins at RVA 0x53e6c
		// Header size: 12
		// Code size: 92 (0x5c)
		.maxstack 5
		.locals init (
			[0] string,
			[1] object,
			[2] string[]
		)

		IL_0000: ldstr ""
		IL_0005: stloc.0
		IL_0006: ldc.i4.7
		IL_0007: newarr [mscorlib]System.String
		IL_000c: stloc.2
		IL_000d: ldloc.2
		IL_000e: ldc.i4.0
		IL_000f: ldarg.0
		IL_0010: ldc.i4.1
		IL_0011: ldc.i4.4
		IL_0012: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0017: stelem.ref
		IL_0018: ldloc.2
		IL_0019: ldc.i4.1
		IL_001a: ldstr "-"
		IL_001f: stelem.ref
		IL_0020: ldloc.2
		IL_0021: ldc.i4.2
		IL_0022: ldarg.1
		IL_0023: ldc.i4.6
		IL_0024: ldc.i4.4
		IL_0025: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_002a: stelem.ref
		IL_002b: ldloc.2
		IL_002c: ldc.i4.3
		IL_002d: ldstr "-"
		IL_0032: stelem.ref
		IL_0033: ldloc.2
		IL_0034: ldc.i4.4
		IL_0035: ldarg.0
		IL_0036: ldc.i4.s 11
		IL_0038: ldc.i4.4
		IL_0039: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_003e: stelem.ref
		IL_003f: ldloc.2
		IL_0040: ldc.i4.5
		IL_0041: ldstr "-"
		IL_0046: stelem.ref
		IL_0047: ldloc.2
		IL_0048: ldc.i4.6
		IL_0049: ldarg.1
		IL_004a: ldc.i4.s 16
		IL_004c: ldc.i4.4
		IL_004d: call string [Microsoft.VisualBasic]Microsoft.VisualBasic.Strings::Mid(string, int32, int32)
		IL_0052: stelem.ref
		IL_0053: ldloc.2
		IL_0054: call string [mscorlib]System.String::Concat(string[])
		IL_0059: stloc.0
		IL_005a: ldloc.0
		IL_005b: ret
	} // end of method O1::var01

} // end of class KeygenMe.O1

You are not using the latest version of the tool, please update.
Latest version is '11.2.0.10050' (yours is '8.2.0.7535-95108c96')
