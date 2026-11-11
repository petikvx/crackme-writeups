// IL code: gui_crackme
.class private auto ansi '<Module>'
{
} // end of class <Module>

.class public auto ansi beforefieldinit gui_crackme.Form1
	extends [System.Windows.Forms]System.Windows.Forms.Form
{
	// Fields
	.field private class [System]System.ComponentModel.IContainer components
	.field private class [System.Windows.Forms]System.Windows.Forms.Label label1
	.field private class [System.Windows.Forms]System.Windows.Forms.GroupBox groupBox1
	.field private class [System.Windows.Forms]System.Windows.Forms.TextBox FormName
	.field private class [System.Windows.Forms]System.Windows.Forms.Button button1
	.field private class [System.Windows.Forms]System.Windows.Forms.Label label2

	// Methods
	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2050
		// Header size: 1
		// Code size: 23 (0x17)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: ldnull
		IL_0002: stfld class [System]System.ComponentModel.IContainer gui_crackme.Form1::components
		IL_0007: ldarg.0
		IL_0008: call instance void [System.Windows.Forms]System.Windows.Forms.Form::.ctor()
		IL_000d: nop
		IL_000e: nop
		IL_000f: ldarg.0
		IL_0010: call instance void gui_crackme.Form1::InitializeComponent()
		IL_0015: nop
		IL_0016: ret
	} // end of method Form1::.ctor

	.method private hidebysig 
		instance void Form1_Load (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x2068
		// Header size: 1
		// Code size: 2 (0x2)
		.maxstack 8

		IL_0000: nop
		IL_0001: ret
	} // end of method Form1::Form1_Load

	.method private hidebysig 
		instance void button1_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x206c
		// Header size: 12
		// Code size: 55 (0x37)
		.maxstack 2
		.locals init (
			[0] bool,
			[1] valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult,
			[2] valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult
		)

		IL_0000: nop
		IL_0001: ldarg.0
		IL_0002: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_0007: callvirt instance string [System.Windows.Forms]System.Windows.Forms.Control::get_Text()
		IL_000c: ldstr "sk-189"
		IL_0011: call bool [mscorlib]System.String::op_Equality(string, string)
		IL_0016: stloc.0
		IL_0017: ldloc.0
		IL_0018: brfalse.s IL_0029

		IL_001a: nop
		IL_001b: ldstr "CORRECT!"
		IL_0020: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string)
		IL_0025: stloc.1
		IL_0026: nop
		IL_0027: br.s IL_0036

		IL_0029: nop
		IL_002a: ldstr "incorret :/"
		IL_002f: call valuetype [System.Windows.Forms]System.Windows.Forms.DialogResult [System.Windows.Forms]System.Windows.Forms.MessageBox::Show(string)
		IL_0034: stloc.2
		IL_0035: nop

		IL_0036: ret
	} // end of method Form1::button1_Click

	.method private hidebysig 
		instance void label1_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x20af
		// Header size: 1
		// Code size: 2 (0x2)
		.maxstack 8

		IL_0000: nop
		IL_0001: ret
	} // end of method Form1::label1_Click

	.method private hidebysig 
		instance void label2_Click (
			object sender,
			class [mscorlib]System.EventArgs e
		) cil managed 
	{
		// Method begins at RVA 0x20b2
		// Header size: 1
		// Code size: 2 (0x2)
		.maxstack 8

		IL_0000: nop
		IL_0001: ret
	} // end of method Form1::label2_Click

	.method family hidebysig virtual 
		instance void Dispose (
			bool disposing
		) cil managed 
	{
		// Method begins at RVA 0x20b8
		// Header size: 12
		// Code size: 43 (0x2b)
		.maxstack 2
		.locals init (
			[0] bool
		)

		IL_0000: nop
		IL_0001: ldarg.1
		IL_0002: brfalse.s IL_000f

		IL_0004: ldarg.0
		IL_0005: ldfld class [System]System.ComponentModel.IContainer gui_crackme.Form1::components
		IL_000a: ldnull
		IL_000b: cgt.un
		IL_000d: br.s IL_0010

		IL_000f: ldc.i4.0

		IL_0010: stloc.0
		IL_0011: ldloc.0
		IL_0012: brfalse.s IL_0022

		IL_0014: nop
		IL_0015: ldarg.0
		IL_0016: ldfld class [System]System.ComponentModel.IContainer gui_crackme.Form1::components
		IL_001b: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		IL_0020: nop
		IL_0021: nop

		IL_0022: ldarg.0
		IL_0023: ldarg.1
		IL_0024: call instance void [System.Windows.Forms]System.Windows.Forms.Form::Dispose(bool)
		IL_0029: nop
		IL_002a: ret
	} // end of method Form1::Dispose

	.method private hidebysig 
		instance void InitializeComponent () cil managed 
	{
		// Method begins at RVA 0x20f0
		// Header size: 12
		// Code size: 926 (0x39e)
		.maxstack 3
		.locals init (
			[0] class [System]System.ComponentModel.ComponentResourceManager
		)

		IL_0000: nop
		IL_0001: ldtoken gui_crackme.Form1
		IL_0006: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_000b: newobj instance void [System]System.ComponentModel.ComponentResourceManager::.ctor(class [mscorlib]System.Type)
		IL_0010: stloc.0
		IL_0011: ldarg.0
		IL_0012: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0017: stfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_001c: ldarg.0
		IL_001d: newobj instance void [System.Windows.Forms]System.Windows.Forms.GroupBox::.ctor()
		IL_0022: stfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0027: ldarg.0
		IL_0028: newobj instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()
		IL_002d: stfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_0032: ldarg.0
		IL_0033: newobj instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()
		IL_0038: stfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_003d: ldarg.0
		IL_003e: newobj instance void [System.Windows.Forms]System.Windows.Forms.Label::.ctor()
		IL_0043: stfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_0048: ldarg.0
		IL_0049: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_004e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::SuspendLayout()
		IL_0053: nop
		IL_0054: ldarg.0
		IL_0055: call instance void [System.Windows.Forms]System.Windows.Forms.Control::SuspendLayout()
		IL_005a: nop
		IL_005b: ldarg.0
		IL_005c: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_0061: ldc.i4.1
		IL_0062: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_AutoSize(bool)
		IL_0067: nop
		IL_0068: ldarg.0
		IL_0069: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_006e: ldc.i4.s 12
		IL_0070: ldc.i4.s 91
		IL_0072: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0077: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_007c: nop
		IL_007d: ldarg.0
		IL_007e: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_0083: ldstr "label1"
		IL_0088: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_008d: nop
		IL_008e: ldarg.0
		IL_008f: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_0094: ldc.i4.s 54
		IL_0096: ldc.i4.s 13
		IL_0098: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_009d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_00a2: nop
		IL_00a3: ldarg.0
		IL_00a4: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_00a9: ldc.i4.0
		IL_00aa: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_00af: nop
		IL_00b0: ldarg.0
		IL_00b1: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_00b6: ldstr "by NullerF"
		IL_00bb: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_00c0: nop
		IL_00c1: ldarg.0
		IL_00c2: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_00c7: ldarg.0
		IL_00c8: ldftn instance void gui_crackme.Form1::label1_Click(object, class [mscorlib]System.EventArgs)
		IL_00ce: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_00d3: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_00d8: nop
		IL_00d9: ldarg.0
		IL_00da: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_00df: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_00e4: ldarg.0
		IL_00e5: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_00ea: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_00ef: nop
		IL_00f0: ldarg.0
		IL_00f1: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_00f6: callvirt instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_00fb: ldarg.0
		IL_00fc: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_0101: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0106: nop
		IL_0107: ldarg.0
		IL_0108: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_010d: ldc.i4.s 13
		IL_010f: ldc.i4.s 13
		IL_0111: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0116: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_011b: nop
		IL_011c: ldarg.0
		IL_011d: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0122: ldstr "groupBox1"
		IL_0127: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_012c: nop
		IL_012d: ldarg.0
		IL_012e: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0133: ldc.i4 259
		IL_0138: ldc.i4.s 75
		IL_013a: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_013f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0144: nop
		IL_0145: ldarg.0
		IL_0146: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_014b: ldc.i4.1
		IL_014c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0151: nop
		IL_0152: ldarg.0
		IL_0153: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0158: ldc.i4.0
		IL_0159: callvirt instance void [System.Windows.Forms]System.Windows.Forms.GroupBox::set_TabStop(bool)
		IL_015e: nop
		IL_015f: ldarg.0
		IL_0160: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0165: ldstr "Activation"
		IL_016a: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_016f: nop
		IL_0170: ldarg.0
		IL_0171: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_0176: ldc.i4.7
		IL_0177: ldc.i4.s 46
		IL_0179: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_017e: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0183: nop
		IL_0184: ldarg.0
		IL_0185: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_018a: ldstr "button1"
		IL_018f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0194: nop
		IL_0195: ldarg.0
		IL_0196: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_019b: ldc.i4 246
		IL_01a0: ldc.i4.s 23
		IL_01a2: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_01a7: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_01ac: nop
		IL_01ad: ldarg.0
		IL_01ae: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_01b3: ldc.i4.0
		IL_01b4: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_01b9: nop
		IL_01ba: ldarg.0
		IL_01bb: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_01c0: ldstr "Activate"
		IL_01c5: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_01ca: nop
		IL_01cb: ldarg.0
		IL_01cc: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_01d1: ldc.i4.1
		IL_01d2: callvirt instance void [System.Windows.Forms]System.Windows.Forms.ButtonBase::set_UseVisualStyleBackColor(bool)
		IL_01d7: nop
		IL_01d8: ldarg.0
		IL_01d9: ldfld class [System.Windows.Forms]System.Windows.Forms.Button gui_crackme.Form1::button1
		IL_01de: ldarg.0
		IL_01df: ldftn instance void gui_crackme.Form1::button1_Click(object, class [mscorlib]System.EventArgs)
		IL_01e5: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_01ea: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_01ef: nop
		IL_01f0: ldarg.0
		IL_01f1: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_01f6: ldc.i4.7
		IL_01f7: ldc.i4.s 20
		IL_01f9: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_01fe: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_0203: nop
		IL_0204: ldarg.0
		IL_0205: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_020a: ldstr "FormName"
		IL_020f: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0214: nop
		IL_0215: ldarg.0
		IL_0216: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_021b: ldc.i4 246
		IL_0220: ldc.i4.s 20
		IL_0222: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0227: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_022c: nop
		IL_022d: ldarg.0
		IL_022e: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_0233: ldc.i4.1
		IL_0234: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_0239: nop
		IL_023a: ldarg.0
		IL_023b: ldfld class [System.Windows.Forms]System.Windows.Forms.TextBox gui_crackme.Form1::FormName
		IL_0240: ldstr "Maybe 123?"
		IL_0245: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_024a: nop
		IL_024b: ldarg.0
		IL_024c: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_0251: ldc.i4.1
		IL_0252: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_AutoSize(bool)
		IL_0257: nop
		IL_0258: ldarg.0
		IL_0259: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_025e: ldc.i4.s 118
		IL_0260: ldc.i4.s 91
		IL_0262: newobj instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		IL_0267: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Location(valuetype [System.Drawing]System.Drawing.Point)
		IL_026c: nop
		IL_026d: ldarg.0
		IL_026e: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_0273: ldstr "label2"
		IL_0278: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_027d: nop
		IL_027e: ldarg.0
		IL_027f: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_0284: ldc.i4 154
		IL_0289: ldc.i4.s 13
		IL_028b: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_0290: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Size(valuetype [System.Drawing]System.Drawing.Size)
		IL_0295: nop
		IL_0296: ldarg.0
		IL_0297: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_029c: ldc.i4.3
		IL_029d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_TabIndex(int32)
		IL_02a2: nop
		IL_02a3: ldarg.0
		IL_02a4: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_02a9: ldstr "enter the correct activation key"
		IL_02ae: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_02b3: nop
		IL_02b4: ldarg.0
		IL_02b5: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_02ba: ldarg.0
		IL_02bb: ldftn instance void gui_crackme.Form1::label2_Click(object, class [mscorlib]System.EventArgs)
		IL_02c1: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_02c6: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::add_Click(class [mscorlib]System.EventHandler)
		IL_02cb: nop
		IL_02cc: ldarg.0
		IL_02cd: ldc.r4 6
		IL_02d2: ldc.r4 13
		IL_02d7: newobj instance void [System.Drawing]System.Drawing.SizeF::.ctor(float32, float32)
		IL_02dc: call instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleDimensions(valuetype [System.Drawing]System.Drawing.SizeF)
		IL_02e1: nop
		IL_02e2: ldarg.0
		IL_02e3: ldc.i4.1
		IL_02e4: call instance void [System.Windows.Forms]System.Windows.Forms.ContainerControl::set_AutoScaleMode(valuetype [System.Windows.Forms]System.Windows.Forms.AutoScaleMode)
		IL_02e9: nop
		IL_02ea: ldarg.0
		IL_02eb: ldc.i4 283
		IL_02f0: ldc.i4.s 120
		IL_02f2: newobj instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		IL_02f7: call instance void [System.Windows.Forms]System.Windows.Forms.Form::set_ClientSize(valuetype [System.Drawing]System.Drawing.Size)
		IL_02fc: nop
		IL_02fd: ldarg.0
		IL_02fe: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0303: ldarg.0
		IL_0304: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label2
		IL_0309: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_030e: nop
		IL_030f: ldarg.0
		IL_0310: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0315: ldarg.0
		IL_0316: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_031b: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0320: nop
		IL_0321: ldarg.0
		IL_0322: call instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Control::get_Controls()
		IL_0327: ldarg.0
		IL_0328: ldfld class [System.Windows.Forms]System.Windows.Forms.Label gui_crackme.Form1::label1
		IL_032d: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)
		IL_0332: nop
		IL_0333: ldarg.0
		IL_0334: ldloc.0
		IL_0335: ldstr "$this.Icon"
		IL_033a: callvirt instance object [mscorlib]System.Resources.ResourceManager::GetObject(string)
		IL_033f: castclass [System.Drawing]System.Drawing.Icon
		IL_0344: call instance void [System.Windows.Forms]System.Windows.Forms.Form::set_Icon(class [System.Drawing]System.Drawing.Icon)
		IL_0349: nop
		IL_034a: ldarg.0
		IL_034b: ldstr "Form1"
		IL_0350: call instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Name(string)
		IL_0355: nop
		IL_0356: ldarg.0
		IL_0357: ldstr "Crackme"
		IL_035c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::set_Text(string)
		IL_0361: nop
		IL_0362: ldarg.0
		IL_0363: ldarg.0
		IL_0364: ldftn instance void gui_crackme.Form1::Form1_Load(object, class [mscorlib]System.EventArgs)
		IL_036a: newobj instance void [mscorlib]System.EventHandler::.ctor(object, native int)
		IL_036f: call instance void [System.Windows.Forms]System.Windows.Forms.Form::add_Load(class [mscorlib]System.EventHandler)
		IL_0374: nop
		IL_0375: ldarg.0
		IL_0376: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_037b: ldc.i4.0
		IL_037c: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::ResumeLayout(bool)
		IL_0381: nop
		IL_0382: ldarg.0
		IL_0383: ldfld class [System.Windows.Forms]System.Windows.Forms.GroupBox gui_crackme.Form1::groupBox1
		IL_0388: callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control::PerformLayout()
		IL_038d: nop
		IL_038e: ldarg.0
		IL_038f: ldc.i4.0
		IL_0390: call instance void [System.Windows.Forms]System.Windows.Forms.Control::ResumeLayout(bool)
		IL_0395: nop
		IL_0396: ldarg.0
		IL_0397: call instance void [System.Windows.Forms]System.Windows.Forms.Control::PerformLayout()
		IL_039c: nop
		IL_039d: ret
	} // end of method Form1::InitializeComponent

} // end of class gui_crackme.Form1

.class private auto ansi abstract sealed beforefieldinit gui_crackme.Program
	extends [mscorlib]System.Object
{
	// Methods
	.method private hidebysig static 
		void Main () cil managed 
	{
		.custom instance void [mscorlib]System.STAThreadAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0x249a
		// Header size: 1
		// Code size: 26 (0x1a)
		.maxstack 8
		.entrypoint

		IL_0000: nop
		IL_0001: call void [System.Windows.Forms]System.Windows.Forms.Application::EnableVisualStyles()
		IL_0006: nop
		IL_0007: ldc.i4.0
		IL_0008: call void [System.Windows.Forms]System.Windows.Forms.Application::SetCompatibleTextRenderingDefault(bool)
		IL_000d: nop
		IL_000e: newobj instance void gui_crackme.Form1::.ctor()
		IL_0013: call void [System.Windows.Forms]System.Windows.Forms.Application::Run(class [System.Windows.Forms]System.Windows.Forms.Form)
		IL_0018: nop
		IL_0019: ret
	} // end of method Program::Main

} // end of class gui_crackme.Program

.class private auto ansi beforefieldinit gui_crackme.Properties.Resources
	extends [mscorlib]System.Object
{
	.custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string, string) = (
		01 00 33 53 79 73 74 65 6d 2e 52 65 73 6f 75 72
		63 65 73 2e 54 6f 6f 6c 73 2e 53 74 72 6f 6e 67
		6c 79 54 79 70 65 64 52 65 73 6f 75 72 63 65 42
		75 69 6c 64 65 72 07 34 2e 30 2e 30 2e 30 00 00
	)
	.custom instance void [mscorlib]System.Diagnostics.DebuggerNonUserCodeAttribute::.ctor() = (
		01 00 00 00
	)
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Fields
	.field private static class [mscorlib]System.Resources.ResourceManager resourceMan
	.field private static class [mscorlib]System.Globalization.CultureInfo resourceCulture

	// Methods
	.method assembly hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x24b5
		// Header size: 1
		// Code size: 9 (0x9)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: nop
		IL_0007: nop
		IL_0008: ret
	} // end of method Resources::.ctor

	.method assembly hidebysig specialname static 
		class [mscorlib]System.Resources.ResourceManager get_ResourceManager () cil managed 
	{
		// Method begins at RVA 0x24c0
		// Header size: 12
		// Code size: 57 (0x39)
		.maxstack 2
		.locals init (
			[0] bool,
			[1] class [mscorlib]System.Resources.ResourceManager,
			[2] class [mscorlib]System.Resources.ResourceManager
		)

		IL_0000: nop
		IL_0001: ldsfld class [mscorlib]System.Resources.ResourceManager gui_crackme.Properties.Resources::resourceMan
		IL_0006: ldnull
		IL_0007: ceq
		IL_0009: stloc.0
		IL_000a: ldloc.0
		IL_000b: brfalse.s IL_002f

		IL_000d: nop
		IL_000e: ldstr "gui_crackme.Properties.Resources"
		IL_0013: ldtoken gui_crackme.Properties.Resources
		IL_0018: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
		IL_001d: callvirt instance class [mscorlib]System.Reflection.Assembly [mscorlib]System.Type::get_Assembly()
		IL_0022: newobj instance void [mscorlib]System.Resources.ResourceManager::.ctor(string, class [mscorlib]System.Reflection.Assembly)
		IL_0027: stloc.1
		IL_0028: ldloc.1
		IL_0029: stsfld class [mscorlib]System.Resources.ResourceManager gui_crackme.Properties.Resources::resourceMan
		IL_002e: nop

		IL_002f: ldsfld class [mscorlib]System.Resources.ResourceManager gui_crackme.Properties.Resources::resourceMan
		IL_0034: stloc.2
		IL_0035: br.s IL_0037

		IL_0037: ldloc.2
		IL_0038: ret
	} // end of method Resources::get_ResourceManager

	.method assembly hidebysig specialname static 
		class [mscorlib]System.Globalization.CultureInfo get_Culture () cil managed 
	{
		// Method begins at RVA 0x2508
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class [mscorlib]System.Globalization.CultureInfo
		)

		IL_0000: nop
		IL_0001: ldsfld class [mscorlib]System.Globalization.CultureInfo gui_crackme.Properties.Resources::resourceCulture
		IL_0006: stloc.0
		IL_0007: br.s IL_0009

		IL_0009: ldloc.0
		IL_000a: ret
	} // end of method Resources::get_Culture

	.method assembly hidebysig specialname static 
		void set_Culture (
			class [mscorlib]System.Globalization.CultureInfo 'value'
		) cil managed 
	{
		// Method begins at RVA 0x251f
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: nop
		IL_0001: ldarg.0
		IL_0002: stsfld class [mscorlib]System.Globalization.CultureInfo gui_crackme.Properties.Resources::resourceCulture
		IL_0007: ret
	} // end of method Resources::set_Culture

	// Properties
	.property class [mscorlib]System.Resources.ResourceManager ResourceManager()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Resources.ResourceManager gui_crackme.Properties.Resources::get_ResourceManager()
	}
	.property class [mscorlib]System.Globalization.CultureInfo Culture()
	{
		.custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = (
			01 00 02 00 00 00 00 00
		)
		.get class [mscorlib]System.Globalization.CultureInfo gui_crackme.Properties.Resources::get_Culture()
		.set void gui_crackme.Properties.Resources::set_Culture(class [mscorlib]System.Globalization.CultureInfo)
	}

} // end of class gui_crackme.Properties.Resources

.class private auto ansi sealed beforefieldinit gui_crackme.Properties.Settings
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
		31 2e 30 2e 30 2e 30 00 00
	)
	// Fields
	.field private static class gui_crackme.Properties.Settings defaultInstance

	// Methods
	.method public hidebysig specialname static 
		class gui_crackme.Properties.Settings get_Default () cil managed 
	{
		// Method begins at RVA 0x2528
		// Header size: 12
		// Code size: 11 (0xb)
		.maxstack 1
		.locals init (
			[0] class gui_crackme.Properties.Settings
		)

		IL_0000: nop
		IL_0001: ldsfld class gui_crackme.Properties.Settings gui_crackme.Properties.Settings::defaultInstance
		IL_0006: stloc.0
		IL_0007: br.s IL_0009

		IL_0009: ldloc.0
		IL_000a: ret
	} // end of method Settings::get_Default

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x253f
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System]System.Configuration.ApplicationSettingsBase::.ctor()
		IL_0006: nop
		IL_0007: ret
	} // end of method Settings::.ctor

	.method private hidebysig specialname rtspecialname static 
		void .cctor () cil managed 
	{
		// Method begins at RVA 0x2548
		// Header size: 1
		// Code size: 21 (0x15)
		.maxstack 8

		IL_0000: newobj instance void gui_crackme.Properties.Settings::.ctor()
		IL_0005: call class [System]System.Configuration.SettingsBase [System]System.Configuration.SettingsBase::Synchronized(class [System]System.Configuration.SettingsBase)
		IL_000a: castclass gui_crackme.Properties.Settings
		IL_000f: stsfld class gui_crackme.Properties.Settings gui_crackme.Properties.Settings::defaultInstance
		IL_0014: ret
	} // end of method Settings::.cctor

	// Properties
	.property class gui_crackme.Properties.Settings Default()
	{
		.get class gui_crackme.Properties.Settings gui_crackme.Properties.Settings::get_Default()
	}

} // end of class gui_crackme.Properties.Settings

You are not using the latest version of the tool, please update.
Latest version is '11.2.0.10050' (yours is '8.2.0.7535-95108c96')
