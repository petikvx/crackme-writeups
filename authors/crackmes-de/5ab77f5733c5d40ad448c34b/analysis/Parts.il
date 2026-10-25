// IL code: Parts
.class private auto ansi '<Module>'
{
} // end of class <Module>

.class private auto ansi beforefieldinit WindowsFormsApplication1.Properties.Resources
	extends [mscorlib]System.Object
{
	.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 33 53 79 73 74 65 6d 2e 52 65 73 6f 75 72
		63 65 73 2e 54 6f 6f 6c 73 2e 53 74 72 6f 6e 67
		6c 79 54 79 70 65 64 52 65 73 6f 75 72 63 65 42
		75 69 6c 64 65 72 07 34 2e 30 2e 30 2e 30 00 00
	)
	// Fields
	.field private static class [mscorlib]System.Resources.ResourceManager resourceMan
	.field private static class [mscorlib]System.Globalization.CultureInfo resourceCulture

	// Methods
	.method assembly hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2050
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: ret
	} // end of method Resources::.ctor

	.method assembly hidebysig specialname static 
		class [mscorlib]System.Resources.ResourceManager get_ResourceManager () cil managed 
	{
		// Method begins at RVA 0x2058
		// Header size: 12
		// Code size: 51 (0x33)
		.maxstack 3
		.locals init (
			[0] class [mscorlib]System.Resources.ResourceManager
		)

		IL_0000: ldsfld class [mscorlib]System.Resources.ResourceManager WindowsFormsApplication1.Properties.Resources::resourceMan
		IL_0005: ldnull
		IL_0006: call bool [mscorlib]System.Object::ReferenceEquals(object, object)
		IL_000b: brfalse.s IL_002d

		IL_000d: ldstr "WindowsFormsApplication1.Properties.Resources"
		IL_0012: ldtoken WindowsFormsApplication1.Properties.Resources
		IL_0017: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_001c: callvirt instance class [mscorlib]System.Reflection.Assembly [mscorlib]System.Type::get_Assembly()
		IL_0021: newobj instance void [mscorlib]System.Resources.ResourceManager::.ctor(string, class [mscorlib]System.Reflection.Assembly)
		IL_0026: stloc.0
		IL_0027: ldloc.0
		IL_0028: stsfld class [mscorlib]System.Resources.ResourceManager WindowsFormsApplication1.Properties.Resources::resourceMan

		IL_002d: ldsfld class [mscorlib]System.Resources.ResourceManager WindowsFormsApplication1.Properties.Resources::resourceMan
		IL_0032: ret
	} // end of method Resources::get_ResourceManager

	.method assembly hidebysig specialname static 
		class [mscorlib]System.Globalization.CultureInfo get_Culture () cil managed 
	{
		// Method begins at RVA 0x2097
		// Header size: 1
		// Code size: 6 (0x6)
		.maxstack 8

		IL_0000: ldsfld class [mscorlib]System.Globalization.CultureInfo WindowsFormsApplication1.Properties.Resources::resourceCulture
		IL_0005: ret
	} // end of method Resources::get_Culture

	.method assembly hidebysig specialname static 
		void set_Culture (
			class [mscorlib]System.Globalization.CultureInfo 'value'
		) cil managed 
	{
		// Method begins at RVA 0x209e
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: stsfld class [mscorlib]System.Globalization.CultureInfo WindowsFormsApplication1.Properties.Resources::resourceCulture
		IL_0006: ret
	} // end of method Resources::set_Culture

	// Properties
	.property class [mscorlib]System.Resources.ResourceManager ResourceManager()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Resources.ResourceManager WindowsFormsApplication1.Properties.Resources::get_ResourceManager()
	}
	.property class [mscorlib]System.Globalization.CultureInfo Culture()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Globalization.CultureInfo WindowsFormsApplication1.Properties.Resources::get_Culture()
		.set void WindowsFormsApplication1.Properties.Resources::set_Culture(class [mscorlib]System.Globalization.CultureInfo)
	}

} // end of class WindowsFormsApplication1.Properties.Resources

.class private auto ansi abstract sealed beforefieldinit WindowsFormsApplication1.Program
	extends [mscorlib]System.Object
{
	// Methods
	.method private hidebysig static 
		void Main () cil managed 
	{
		.custom instance void [mscorlib]System.STAThreadAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x20a6
		// Header size: 1
		// Code size: 22 (0x16)
		.maxstack 8
		.entrypoint

		IL_0000: call void [System.Windows.Forms]System.Windows.Forms.Application::EnableVisualStyles()
		IL_0005: ldc.i4.0
		IL_0006: call void [System.Windows.Forms]System.Windows.Forms.Application::SetCompatibleTextRenderingDefault(bool)
		IL_000b: newobj instance void WindowsFormsApplication1.Form1::.ctor()
		IL_0010: call void [System.Windows.Forms]System.Windows.Forms.Application::Run(class [System.Windows.Forms]System.Windows.Forms.Form)
		IL_0015: ret
	} // end of method Program::Main

} // end of class WindowsFormsApplication1.Program

.class public auto ansi beforefieldinit WindowsFormsApplication1.Form1
	extends [System.Windows.Forms]System.Windows.Forms.Form
{
	// Fields
	.field private class [System]System.ComponentModel.IContainer components
	.field private class [System.Windows.Forms]System.Windows.Forms.Button button1
	.field private class [System.Windows.Forms]System.Windows.Forms.Button button2
	.field private class [System.Windows.Forms]System.Windows.Forms.Button button3
	.field private class [System.Windows.Forms]System.Windows.Forms.Label label1
	.field private class [System.Windows.Forms]System.Windows.Forms.Label label2
	.field private class [System.Windows.Forms]System.Windows.Forms.TextBox textBox1
	.field private class [System.Windows.Forms]System.Windows.Forms.TextBox textBox2

	// Methods
	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x20bd
		// Header size: 1
		// Code size: 13 (0xd)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System.Windows.Forms]System.Windows.Forms.Form::.ctor()
		IL_0006: ldarg.0
		IL_0007: call instance void WindowsFormsApplication1.Form1::InitializeComponent()
		IL_000c: ret
	} // end of method Form1::.ctor

	.method private hidebysig static 
		string serial (
			string name,
			int32 key
		) cil managed 
	{
		// Method begins at RVA 0x20cc
		// Header size: 12
		// Code size: 54 (0x36)
		.maxstack 3
		.locals init (
			[0] string,
			[1] char,
			[2] string,
			[3] int32
		)

		IL_0000: ldsfld string [mscorlib]System.String::Empty
		IL_0005: stloc.0
		IL_0006: ldarg.0
		IL_0007: stloc.2
		IL_0008: ldc.i4.0
		IL_0009: stloc.3
		IL_000a: br.s IL_002b
		// loop start (head: IL_002b)
			IL_000c: ldloc.2
			IL_000d: ldloc.3
			IL_000e: callvirt instance char [mscorlib]System.String::get_Chars(int32)
			IL_0013: stloc.1
			IL_0014: ldloc.0
			IL_0015: ldloc.1
			IL_0016: box [mscorlib]System.Int32
			IL_001b: ldarg.1
			IL_001c: box [mscorlib]System.Int32
			IL_0021: call string [mscorlib]System.String::Concat(object, object, object)
			IL_0026: stloc.0
			IL_0027: ldloc.3
			IL_0028: ldc.i4.1
			IL_0029: add
			IL_002a: stloc.3

			IL_002b: ldloc.3
			IL_002c: ldloc.2
			IL_002d: callvirt instance int32 [mscorlib]System.String::get_Length()
			IL_0032: blt.s IL_000c
		// end loop

		IL_0034: ldloc.0
		IL_0035: ret
	} // end of method Form1::serial

	.method private hidebysig static 
		int32 key () cil managed 
	{
		// Method begins at RVA 0x2110
		// Header size: 12
		// Code size: 73 (0x49)
		.maxstack 3
		.locals init (
			[0] valuetype [mscorlib]System.DateTime,
			[1] int32,
			[2] int32,
			[3] int32,
			[4] class [mscorlib]System.Random,
			[5] int32,
			[6] int32
		)

		IL_0000: call valuetype [mscorlib]System.DateTime [mscorlib]System.DateTime::get_Now()
		IL_0005: stloc.0
		IL_0006: ldloca.s 0
		IL_0008: call instance int32 [mscorlib]System.DateTime::get_Second()
		IL_000d: call int32 [mscorlib]System.Convert::ToInt32(int32)
		IL_0012: stloc.1
		IL_0013: ldloca.s 0
		IL_0015: call instance int32 [mscorlib]System.DateTime::get_Minute()
		IL_001a: call int32 [mscorlib]System.Convert::ToInt32(int32)
		IL_001f: stloc.2
		IL_0020: ldloc.1
		IL_0021: ldloc.2
		IL_0022: add
		IL_0023: ldc.i4.2
		IL_0024: div
		IL_0025: stloc.3
		IL_0026: ldloc.3
		IL_0027: brtrue.s IL_002b

		IL_0029: ldloc.3
		IL_002a: ret

		IL_002b: newobj instance void [mscorlib]System.Random::.ctor()
		IL_0030: stloc.s 4
		IL_0032: ldloc.s 4
		IL_0034: ldc.i4.s 10
		IL_0036: ldc.i4.s 40
		IL_0038: callvirt instance int32 [mscorlib]System.Random::Next(int32, int32)
		IL_003d: stloc.s 5
		IL_003f: ldloc.s 5
		IL_0041: ldc.i4.s 40
		IL_0043: add
		IL_0044: stloc.s 6
		IL_0046: ldloc.s 6
		IL_0048: ret
	} // end of method Form1::key

	.method private hidebysig 
		instance void button1_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x2168
		// Header size: 12
		// Code size: 103 (0x67)
		.maxstack 2
		.locals init (
			[0] string
		)

		IL_0000: ldarg.0
		IL_0001: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0006: callvirt instance int32 [System.Windows.Forms]System.Windows.Forms.TextBoxBase::get_TextLength()
		IL_000b: ldc.i4.0
		IL_000c: ble.s IL_0066

		IL_000e: ldarg.0
		IL_000f: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_0014: callvirt instance int32 [System.Windows.Forms]System.Windows.Forms.TextBoxBase::get_TextLength()
		IL_0019: ldc.i4.0
		IL_001a: ble.s IL_0066

		IL_001c: ldarg.0
		IL_001d: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0022: callvirt instance string [System.Windows.Forms]System.Windows.Forms.Control::get_Text()
		IL_0027: call int32 WindowsFormsApplication1.Form1::key()
		IL_002c: call string WindowsFormsApplication1.Form1::serial(string, int32)
		IL_0031: stloc.0
		IL_0032: ldloc.0
		IL_0033: ldarg.0
		IL_0034: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_0039: callvirt instance string [System.Windows.Forms]System.Windows.Forms.Control::get_Text()
		IL_003e: call bool [mscorlib]System.String::op_Equality(string, string)
		IL_0043: brfalse.s IL_0056

		IL_0045: ldstr "Success!!"
		IL_004a: ldstr "Good!!"
		IL_004f: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string, string)
		IL_0054: pop
		IL_0055: ret

		IL_0056: ldstr "Try Again, don't worry you will get rid of it!!"
		IL_005b: ldstr "MMMM!!"
		IL_0060: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string, string)
		IL_0065: pop

		IL_0066: ret
	} // end of method Form1::button1_Click

	.method private hidebysig 
		instance void button2_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x21db
		// Header size: 1
		// Code size: 17 (0x11)
		.maxstack 8

		IL_0000: ldstr "Written by Axel.Net using C# you can use this button to make a self-keygen"
		IL_0005: ldstr "Info"
		IL_000a: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string, string)
		IL_000f: pop
		IL_0010: ret
	} // end of method Form1::button2_Click

	.method private hidebysig 
		instance void button3_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x21ed
		// Header size: 1
		// Code size: 17 (0x11)
		.maxstack 8

		IL_0000: ldstr "It has been written for beginners, first I have to say in this crackme you have 2 parts the first part you have to patch 3 instructions first instruction must be replaced with this opcode br (it's an absolute jump like Jmp in Assembly) and the other 2 are parameters you obviously will see, the second part is a classic request: WRITE  a keygen or a self keygen, finally you have to write a tutorial where you explain which instructions you have patched and why, Good Luck and Have fun"
		IL_0005: ldstr "Rules"
		IL_000a: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string, string)
		IL_000f: pop
		IL_0010: ret
	} // end of method Form1::button3_Click

	.method family hidebysig virtual 
		instance void Dispose (
			bool disposing
		) cil managed 
	{
		// Method begins at RVA 0x21ff
		// Header size: 1
		// Code size: 30 (0x1e)
		.maxstack 8

		IL_0000: ldarg.1
		IL_0001: brfalse.s IL_0016

		IL_0003: ldarg.0
		IL_0004: ldfld class [System]System.ComponentModel.IContainer WindowsFormsApplication1.Form1::components
		IL_0009: brfalse.s IL_0016

		IL_000b: ldarg.0
		IL_000c: ldfld class [System]System.ComponentModel.IContainer WindowsFormsApplication1.Form1::components
		IL_0011: callvirt instance void [mscorlib]System.IDisposable::Dispose()

		IL_0016: ldarg.0
		IL_0017: ldarg.1
		IL_0018: call instance void [System.Windows.Forms]System.Windows.Forms.Form::Dispose(bool)
		IL_001d: ret
	} // end of method Form1::Dispose

	.method private hidebysig 
		instance void InitializeComponent () cil managed 
	{
		// Method begins at RVA 0x2220
		// Header size: 12
		// Code size: 976 (0x3d0)
		.maxstack 4

		IL_0000: ldarg.0
		IL_0001: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_0006: stfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_000b: ldarg.0
		IL_000c: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_0011: stfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_0016: ldarg.0
		IL_0017: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_001c: stfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_0021: ldarg.0
		IL_0022: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0027: stfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_002c: ldarg.0
		IL_002d: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0032: stfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0037: ldarg.0
		IL_0038: newobj instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()
		IL_003d: stfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0042: ldarg.0
		IL_0043: newobj instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()
		IL_0048: stfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_004d: ldarg.0
		IL_004e: call instance void [System.Windows.Forms]System.Windows.Forms.Control::SuspendLayout()
		IL_0053: ldarg.0
		IL_0054: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_0059: ldc.i4.1
		IL_005a: ldc.i4.s 59
		IL_005c: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0061: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0066: ldarg.0
		IL_0067: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_006c: ldstr "button1"
		IL_0071: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0076: ldarg.0
		IL_0077: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_007c: ldc.i4.s 75
		IL_007e: ldc.i4.s 23
		IL_0080: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0085: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_008a: ldarg.0
		IL_008b: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_0090: ldc.i4.0
		IL_0091: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0096: ldarg.0
		IL_0097: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_009c: ldstr "Check"
		IL_00a1: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_00a6: ldarg.0
		IL_00a7: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_00ac: ldc.i4.1
		IL_00ad: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_00b2: ldarg.0
		IL_00b3: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_00b8: ldarg.0
		IL_00b9: ldftn instance void WindowsFormsApplication1.Form1::button1_Click(object, class [mscorlib]System.EventArgs)
		IL_00bf: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_00c4: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_00c9: ldarg.0
		IL_00ca: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_00cf: ldc.i4.s 82
		IL_00d1: ldc.i4.s 59
		IL_00d3: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_00d8: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_00dd: ldarg.0
		IL_00de: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_00e3: ldstr "button2"
		IL_00e8: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_00ed: ldarg.0
		IL_00ee: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_00f3: ldc.i4.s 75
		IL_00f5: ldc.i4.s 23
		IL_00f7: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_00fc: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0101: ldarg.0
		IL_0102: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_0107: ldc.i4.1
		IL_0108: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_010d: ldarg.0
		IL_010e: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_0113: ldstr "About"
		IL_0118: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_011d: ldarg.0
		IL_011e: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_0123: ldc.i4.1
		IL_0124: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_0129: ldarg.0
		IL_012a: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_012f: ldarg.0
		IL_0130: ldftn instance void WindowsFormsApplication1.Form1::button2_Click(object, class [mscorlib]System.EventArgs)
		IL_0136: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_013b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_0140: ldarg.0
		IL_0141: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_0146: ldc.i4 163
		IL_014b: ldc.i4.s 59
		IL_014d: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0152: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0157: ldarg.0
		IL_0158: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_015d: ldstr "button3"
		IL_0162: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0167: ldarg.0
		IL_0168: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_016d: ldc.i4.s 75
		IL_016f: ldc.i4.s 23
		IL_0171: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0176: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_017b: ldarg.0
		IL_017c: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_0181: ldc.i4.2
		IL_0182: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0187: ldarg.0
		IL_0188: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_018d: ldstr "Rules"
		IL_0192: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_0197: ldarg.0
		IL_0198: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_019d: ldc.i4.1
		IL_019e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_01a3: ldarg.0
		IL_01a4: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_01a9: ldarg.0
		IL_01aa: ldftn instance void WindowsFormsApplication1.Form1::button3_Click(object, class [mscorlib]System.EventArgs)
		IL_01b0: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_01b5: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_01ba: ldarg.0
		IL_01bb: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_01c0: ldc.i4.1
		IL_01c1: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_AutoSize(bool)
		IL_01c6: ldarg.0
		IL_01c7: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_01cc: ldc.i4.s 12
		IL_01ce: ldc.i4.s 9
		IL_01d0: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_01d5: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_01da: ldarg.0
		IL_01db: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_01e0: ldstr "label1"
		IL_01e5: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_01ea: ldarg.0
		IL_01eb: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_01f0: ldc.i4.s 38
		IL_01f2: ldc.i4.s 13
		IL_01f4: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_01f9: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_01fe: ldarg.0
		IL_01ff: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_0204: ldc.i4.3
		IL_0205: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_020a: ldarg.0
		IL_020b: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_0210: ldstr "Name:"
		IL_0215: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_021a: ldarg.0
		IL_021b: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0220: ldc.i4.1
		IL_0221: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_AutoSize(bool)
		IL_0226: ldarg.0
		IL_0227: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_022c: ldc.i4.s 12
		IL_022e: ldc.i4.s 34
		IL_0230: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0235: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_023a: ldarg.0
		IL_023b: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0240: ldstr "label2"
		IL_0245: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_024a: ldarg.0
		IL_024b: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0250: ldc.i4.s 36
		IL_0252: ldc.i4.s 13
		IL_0254: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0259: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_025e: ldarg.0
		IL_025f: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0264: ldc.i4.4
		IL_0265: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_026a: ldarg.0
		IL_026b: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0270: ldstr "Serial:"
		IL_0275: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_027a: ldarg.0
		IL_027b: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0280: ldc.i4.s 53
		IL_0282: ldc.i4.6
		IL_0283: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0288: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_028d: ldarg.0
		IL_028e: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0293: ldstr "textBox1"
		IL_0298: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_029d: ldarg.0
		IL_029e: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_02a3: ldc.i4 185
		IL_02a8: ldc.i4.s 20
		IL_02aa: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_02af: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_02b4: ldarg.0
		IL_02b5: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_02ba: ldc.i4.5
		IL_02bb: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_02c0: ldarg.0
		IL_02c1: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_02c6: ldc.i4.s 53
		IL_02c8: ldc.i4.s 31
		IL_02ca: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_02cf: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_02d4: ldarg.0
		IL_02d5: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_02da: ldstr "textBox2"
		IL_02df: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_02e4: ldarg.0
		IL_02e5: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_02ea: ldc.i4 185
		IL_02ef: ldc.i4.s 20
		IL_02f1: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_02f6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_02fb: ldarg.0
		IL_02fc: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_0301: ldc.i4.6
		IL_0302: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0307: ldarg.0
		IL_0308: ldc.r4 6
		IL_030d: ldc.r4 13
		IL_0312: newobj instance void [System.Drawing]System.Drawing.SizeF::.ctor(float32, float32)
		IL_0317: call instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleDimensions(valuetype [System.Drawing]System.Drawing.SizeF)
		IL_031c: ldarg.0
		IL_031d: ldc.i4.1
		IL_031e: call instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleMode(valuetype [System.Windows.Forms]System.Windows.Forms.AutoScaleMode)
		IL_0323: ldarg.0
		IL_0324: ldc.i4 249
		IL_0329: ldc.i4.s 84
		IL_032b: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0330: call instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ClientSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_0335: ldarg.0
		IL_0336: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_033b: ldarg.0
		IL_033c: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox2
		IL_0341: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0346: ldarg.0
		IL_0347: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_034c: ldarg.0
		IL_034d: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox WindowsFormsApplication1.Form1::textBox1
		IL_0352: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0357: ldarg.0
		IL_0358: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_035d: ldarg.0
		IL_035e: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label2
		IL_0363: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0368: ldarg.0
		IL_0369: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_036e: ldarg.0
		IL_036f: ldfld class [System.Windows.Forms]System.Windows.Forms.Label WindowsFormsApplication1.Form1::label1
		IL_0374: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0379: ldarg.0
		IL_037a: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_037f: ldarg.0
		IL_0380: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button3
		IL_0385: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_038a: ldarg.0
		IL_038b: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0390: ldarg.0
		IL_0391: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button2
		IL_0396: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_039b: ldarg.0
		IL_039c: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_03a1: ldarg.0
		IL_03a2: ldfld class [System.Windows.Forms]System.Windows.Forms.Button WindowsFormsApplication1.Form1::button1
		IL_03a7: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_03ac: ldarg.0
		IL_03ad: ldstr "Form1"
		IL_03b2: call instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_03b7: ldarg.0
		IL_03b8: ldstr "Parts"
		IL_03bd: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_03c2: ldarg.0
		IL_03c3: ldc.i4.0
		IL_03c4: call instance void [System.Windows.Forms]System.Windows.Forms.Control::ResumeLayout(bool)
		IL_03c9: ldarg.0
		IL_03ca: call instance void [System.Windows.Forms]System.Windows.Forms.Control::PerformLayout()
		IL_03cf: ret
	} // end of method Form1::InitializeComponent

} // end of class WindowsFormsApplication1.Form1

.class private auto ansi sealed beforefieldinit WindowsFormsApplication1.Properties.Settings
	extends [System]System.Configuration.ApplicationSettingsBase
{
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 4b 4d 69 63 72 6f 73 6f 66 74 2e 56 69 73
		75 61 6c 53 74 75 64 69 6f 2e 45 64 69 74 6f 72
		73 2e 53 65 74 74 69 6e 67 73 44 65 73 69 67 6e
		65 72 2e 53 65 74 74 69 6e 67 73 53 69 6e 67 6c
		65 46 69 6c 65 47 65 6e 65 72 61 74 6f 72 08 31
		30 2e 30 2e 30 2e 30 00 00
	)
	// Fields
	.field private static class WindowsFormsApplication1.Properties.Settings defaultInstance

	// Methods
	.method public hidebysig specialname static 
		class WindowsFormsApplication1.Properties.Settings get_Default () cil managed 
	{
		// Method begins at RVA 0x25fc
		// Header size: 1
		// Code size: 6 (0x6)
		.maxstack 8

		IL_0000: ldsfld class WindowsFormsApplication1.Properties.Settings WindowsFormsApplication1.Properties.Settings::defaultInstance
		IL_0005: ret
	} // end of method Settings::get_Default

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2619
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System]System.Configuration.ApplicationSettingsBase::.ctor()
		IL_0006: ret
	} // end of method Settings::.ctor

	.method private hidebysig specialname rtspecialname static 
		void .cctor () cil managed 
	{
		// Method begins at RVA 0x2603
		// Header size: 1
		// Code size: 21 (0x15)
		.maxstack 8

		IL_0000: newobj instance void WindowsFormsApplication1.Properties.Settings::.ctor()
		IL_0005: call class [System]System.Configuration.SettingsBase [System]System.Configuration.SettingsBase::Synchronized(class [System]System.Configuration.SettingsBase)
		IL_000a: castclass WindowsFormsApplication1.Properties.Settings
		IL_000f: stsfld class WindowsFormsApplication1.Properties.Settings WindowsFormsApplication1.Properties.Settings::defaultInstance
		IL_0014: ret
	} // end of method Settings::.cctor

	// Properties
	.property class WindowsFormsApplication1.Properties.Settings Default()
	{
		.get class WindowsFormsApplication1.Properties.Settings WindowsFormsApplication1.Properties.Settings::get_Default()
	}

} // end of class WindowsFormsApplication1.Properties.Settings

You are not using the latest version of the tool, please update.
Latest version is '11.1.0.9782' (yours is '8.2.0.7535-95108c96')
