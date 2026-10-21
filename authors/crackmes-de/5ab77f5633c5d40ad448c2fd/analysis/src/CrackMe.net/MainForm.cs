using System;
using System.ComponentModel;
using System.Drawing;
using System.Globalization;
using System.Reflection;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace CrackMe.net;

public class MainForm : Form
{
	private Type checkSerial;

	private string checkSerialName;

	private IContainer components;

	private Button button_check;

	private Label label1;

	private Label label_Serial;

	private TextBox textBox_name;

	private TextBox textBox_serial;

	public MainForm()
	{
		InitializeComponent();
		checkSerialName = genRandomNames();
		checkSerial = genCode(checkSerialName);
	}

	private void button_check_Click(object sender, EventArgs e)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		string text = ((Control)textBox_name).Text;
		string text2 = ((Control)textBox_serial).Text;
		if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(text2))
		{
			MessageBox.Show("Please enter name and serial");
			return;
		}
		try
		{
			if (!(bool)checkSerial.InvokeMember(checkSerialName, BindingFlags.InvokeMethod, null, null, new object[2] { text, text2 }))
			{
				throw new Exception();
			}
		}
		catch
		{
			MessageBox.Show("Not this way!");
		}
	}

	private Type genCode(string methName)
	{
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			AppDomain domain = Thread.GetDomain();
			AssemblyName assemblyName = new AssemblyName();
			assemblyName.Name = genRandomNames();
			AssemblyBuilder assemblyBuilder = domain.DefineDynamicAssembly(assemblyName, AssemblyBuilderAccess.Run);
			ModuleBuilder moduleBuilder = assemblyBuilder.DefineDynamicModule(genRandomNames(), false);
			TypeBuilder typeBuilder = moduleBuilder.DefineType(genRandomNames(), TypeAttributes.Public);
			BuildMethod(typeBuilder, methName);
			return typeBuilder.CreateType();
		}
		catch
		{
			MessageBox.Show("Unknown Error!");
		}
		return null;
	}

	public MethodBuilder BuildMethod(TypeBuilder type, string methName)
	{
		MethodAttributes attributes = MethodAttributes.Public | MethodAttributes.Static | MethodAttributes.HideBySig;
		MethodBuilder methodBuilder = type.DefineMethod(methName, attributes);
		MethodInfo method = typeof(MD5).GetMethod("Create", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[0], null);
		MethodInfo method2 = typeof(Encoding).GetMethod("get_Default", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[0], null);
		MethodInfo method3 = typeof(Encoding).GetMethod("GetBytes", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[1] { typeof(string) }, null);
		MethodInfo method4 = typeof(HashAlgorithm).GetMethod("ComputeHash", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[1] { typeof(byte[]) }, null);
		MethodInfo method5 = typeof(string).GetMethod("Substring", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[2]
		{
			typeof(int),
			typeof(int)
		}, null);
		MethodInfo method6 = typeof(byte).GetMethod("Parse", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[2]
		{
			typeof(string),
			typeof(NumberStyles)
		}, null);
		MethodInfo method7 = typeof(string).GetMethod("get_Length", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[0], null);
		ConstructorInfo constructor = typeof(Exception).GetConstructor(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[1] { typeof(string) }, null);
		MethodInfo method8 = typeof(string).GetMethod("Concat", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[2]
		{
			typeof(string),
			typeof(string)
		}, null);
		MethodInfo method9 = typeof(MessageBox).GetMethod("Show", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[2]
		{
			typeof(string),
			typeof(string)
		}, null);
		MethodInfo method10 = typeof(MessageBox).GetMethod("Show", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic, null, new Type[1] { typeof(string) }, null);
		methodBuilder.SetReturnType(typeof(bool));
		methodBuilder.SetParameters(typeof(string), typeof(string));
		methodBuilder.DefineParameter(1, ParameterAttributes.None, "name");
		methodBuilder.DefineParameter(2, ParameterAttributes.None, "serial");
		ILGenerator iLGenerator = methodBuilder.GetILGenerator();
		iLGenerator.DeclareLocal(typeof(byte[]));
		iLGenerator.DeclareLocal(typeof(byte[]));
		iLGenerator.DeclareLocal(typeof(MD5));
		iLGenerator.DeclareLocal(typeof(byte[]));
		iLGenerator.DeclareLocal(typeof(byte[]));
		iLGenerator.DeclareLocal(typeof(int));
		iLGenerator.DeclareLocal(typeof(int));
		iLGenerator.DeclareLocal(typeof(int));
		iLGenerator.DeclareLocal(typeof(Exception));
		Label label = iLGenerator.DefineLabel();
		Label label2 = iLGenerator.DefineLabel();
		Label label3 = iLGenerator.DefineLabel();
		Label label4 = iLGenerator.DefineLabel();
		Label label5 = iLGenerator.DefineLabel();
		Label label6 = iLGenerator.DefineLabel();
		Label label7 = iLGenerator.DefineLabel();
		Label label8 = iLGenerator.DefineLabel();
		Label label9 = iLGenerator.DefineLabel();
		Label label10 = iLGenerator.DefineLabel();
		iLGenerator.Emit(OpCodes.Br, label);
		iLGenerator.Emit(OpCodes.Pop);
		iLGenerator.Emit(OpCodes.Ldc_I4_0);
		iLGenerator.MarkLabel(label);
		iLGenerator.BeginExceptionBlock();
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 16);
		iLGenerator.Emit(OpCodes.Newarr, typeof(byte));
		iLGenerator.Emit(OpCodes.Stloc_0);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 16);
		iLGenerator.Emit(OpCodes.Newarr, typeof(byte));
		iLGenerator.Emit(OpCodes.Stloc_1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_0);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 15);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 58);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_2);
		iLGenerator.Emit(OpCodes.Ldc_I4, 143);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_3);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 50);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_4);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 67);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_5);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 61);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_6);
		iLGenerator.Emit(OpCodes.Ldc_I4, 164);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_7);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 53);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_8);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 35);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 9);
		iLGenerator.Emit(OpCodes.Ldc_I4, 244);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 10);
		iLGenerator.Emit(OpCodes.Ldc_I4, 178);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 11);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 60);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 12);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 88);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Br, label2);
		iLGenerator.Emit(OpCodes.Not);
		iLGenerator.Emit(OpCodes.Nop);
		iLGenerator.Emit(OpCodes.Nop);
		iLGenerator.Emit(OpCodes.Starg_S, 19263);
		iLGenerator.Emit(OpCodes.Nop);
		iLGenerator.MarkLabel(label2);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 13);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 93);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 14);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 77);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 15);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 23);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Call, method);
		iLGenerator.Emit(OpCodes.Stloc_2);
		iLGenerator.Emit(OpCodes.Ldloc_2);
		iLGenerator.Emit(OpCodes.Call, method2);
		iLGenerator.Emit(OpCodes.Ldarg_0);
		iLGenerator.Emit(OpCodes.Callvirt, method3);
		iLGenerator.Emit(OpCodes.Callvirt, method4);
		iLGenerator.Emit(OpCodes.Stloc_3);
		iLGenerator.Emit(OpCodes.Ldc_I4_S, 16);
		iLGenerator.Emit(OpCodes.Newarr, typeof(byte));
		iLGenerator.Emit(OpCodes.Stloc_S, 4);
		iLGenerator.Emit(OpCodes.Ldc_I4_0);
		iLGenerator.Emit(OpCodes.Stloc_S, 5);
		iLGenerator.Emit(OpCodes.Br, label3);
		iLGenerator.MarkLabel(label4);
		iLGenerator.Emit(OpCodes.Ldloc_S, 4);
		iLGenerator.Emit(OpCodes.Ldloc_S, 5);
		iLGenerator.Emit(OpCodes.Ldc_I4_2);
		iLGenerator.Emit(OpCodes.Div);
		iLGenerator.Emit(OpCodes.Ldarg_1);
		iLGenerator.Emit(OpCodes.Ldloc_S, 5);
		iLGenerator.Emit(OpCodes.Ldc_I4_2);
		iLGenerator.Emit(OpCodes.Callvirt, method5);
		iLGenerator.Emit(OpCodes.Ldc_I4, 512);
		iLGenerator.Emit(OpCodes.Call, method6);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_S, 5);
		iLGenerator.Emit(OpCodes.Ldc_I4_2);
		iLGenerator.Emit(OpCodes.Add);
		iLGenerator.Emit(OpCodes.Stloc_S, 5);
		iLGenerator.MarkLabel(label3);
		iLGenerator.Emit(OpCodes.Ldloc_S, 5);
		iLGenerator.Emit(OpCodes.Ldarg_1);
		iLGenerator.Emit(OpCodes.Callvirt, method7);
		iLGenerator.Emit(OpCodes.Blt_S, label4);
		iLGenerator.Emit(OpCodes.Ldc_I4_0);
		iLGenerator.Emit(OpCodes.Stloc_S, 6);
		iLGenerator.Emit(OpCodes.Br, label5);
		iLGenerator.MarkLabel(label6);
		iLGenerator.Emit(OpCodes.Ldloc_0);
		iLGenerator.Emit(OpCodes.Ldloc_S, 6);
		iLGenerator.Emit(OpCodes.Ldloc_S, 4);
		iLGenerator.Emit(OpCodes.Ldloc_S, 6);
		iLGenerator.Emit(OpCodes.Ldelem_U1);
		iLGenerator.Emit(OpCodes.Ldloc_1);
		iLGenerator.Emit(OpCodes.Ldloc_S, 6);
		iLGenerator.Emit(OpCodes.Ldelem_U1);
		iLGenerator.Emit(OpCodes.Xor);
		iLGenerator.Emit(OpCodes.Conv_U1);
		iLGenerator.Emit(OpCodes.Stelem_I1);
		iLGenerator.Emit(OpCodes.Ldloc_S, 6);
		iLGenerator.Emit(OpCodes.Ldc_I4_1);
		iLGenerator.Emit(OpCodes.Add);
		iLGenerator.Emit(OpCodes.Stloc_S, 6);
		iLGenerator.MarkLabel(label5);
		iLGenerator.Emit(OpCodes.Ldloc_S, 6);
		iLGenerator.Emit(OpCodes.Ldloc_3);
		iLGenerator.Emit(OpCodes.Ldlen);
		iLGenerator.Emit(OpCodes.Conv_I4);
		iLGenerator.Emit(OpCodes.Blt_S, label6);
		iLGenerator.Emit(OpCodes.Ldc_I4_0);
		iLGenerator.Emit(OpCodes.Stloc_S, 7);
		iLGenerator.Emit(OpCodes.Br, label7);
		iLGenerator.MarkLabel(label9);
		iLGenerator.Emit(OpCodes.Ldloc_0);
		iLGenerator.Emit(OpCodes.Ldloc_S, 7);
		iLGenerator.Emit(OpCodes.Ldelem_U1);
		iLGenerator.Emit(OpCodes.Ldloc_3);
		iLGenerator.Emit(OpCodes.Ldloc_S, 7);
		iLGenerator.Emit(OpCodes.Ldelem_U1);
		iLGenerator.Emit(OpCodes.Beq_S, label8);
		iLGenerator.Emit(OpCodes.Ldstr, "Arrays not equal!");
		iLGenerator.Emit(OpCodes.Newobj, constructor);
		iLGenerator.Emit(OpCodes.Throw);
		iLGenerator.MarkLabel(label8);
		iLGenerator.Emit(OpCodes.Ldloc_S, 7);
		iLGenerator.Emit(OpCodes.Ldc_I4_1);
		iLGenerator.Emit(OpCodes.Add);
		iLGenerator.Emit(OpCodes.Stloc_S, 7);
		iLGenerator.MarkLabel(label7);
		iLGenerator.Emit(OpCodes.Ldloc_S, 7);
		iLGenerator.Emit(OpCodes.Ldloc_3);
		iLGenerator.Emit(OpCodes.Ldlen);
		iLGenerator.Emit(OpCodes.Conv_I4);
		iLGenerator.Emit(OpCodes.Blt_S, label9);
		iLGenerator.Emit(OpCodes.Ldstr, "Congratulation!\nGood job!\nRegisterd to: ");
		iLGenerator.Emit(OpCodes.Ldarg_0);
		iLGenerator.Emit(OpCodes.Call, method8);
		iLGenerator.Emit(OpCodes.Ldstr, "Nelix CrackMe");
		iLGenerator.Emit(OpCodes.Call, method9);
		iLGenerator.Emit(OpCodes.Pop);
		iLGenerator.Emit(OpCodes.Leave_S, label10);
		iLGenerator.BeginCatchBlock(typeof(Exception));
		iLGenerator.Emit(OpCodes.Pop);
		iLGenerator.Emit(OpCodes.Ldstr, "Try again!");
		iLGenerator.Emit(OpCodes.Call, method10);
		iLGenerator.Emit(OpCodes.Pop);
		iLGenerator.Emit(OpCodes.Leave_S, label10);
		iLGenerator.EndExceptionBlock();
		iLGenerator.MarkLabel(label10);
		iLGenerator.Emit(OpCodes.Ldc_I4_1);
		iLGenerator.Emit(OpCodes.Ret);
		return methodBuilder;
	}

	private string genRandomNames()
	{
		Random random = new Random(Guid.NewGuid().GetHashCode());
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.Append(genRandomLetter(random));
		for (int i = 0; i < random.Next(10, 30); i++)
		{
			if (random.Next(1, 3) == 1)
			{
				stringBuilder.Append(genRandomLetter(random));
			}
			else
			{
				stringBuilder.Append(random.Next(0, 9));
			}
		}
		return stringBuilder.ToString();
	}

	private char genRandomLetter(Random rand)
	{
		return (char)((rand.Next(1, 3) == 1) ? rand.Next(65, 90) : rand.Next(97, 122));
	}

	protected override void Dispose(bool disposing)
	{
		if (disposing && components != null)
		{
			components.Dispose();
		}
		((Form)this).Dispose(disposing);
	}

	private void InitializeComponent()
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Expected O, but got Unknown
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Expected O, but got Unknown
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected O, but got Unknown
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Expected O, but got Unknown
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Expected O, but got Unknown
		button_check = new Button();
		label1 = new Label();
		label_Serial = new Label();
		textBox_name = new TextBox();
		textBox_serial = new TextBox();
		((Control)this).SuspendLayout();
		((Control)button_check).Location = new Point(101, 124);
		((Control)button_check).Name = "button_check";
		((Control)button_check).Size = new Size(83, 23);
		((Control)button_check).TabIndex = 0;
		((Control)button_check).Text = "Check serial";
		((ButtonBase)button_check).UseVisualStyleBackColor = true;
		((Control)button_check).Click += button_check_Click;
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 21);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(38, 13);
		((Control)label1).TabIndex = 1;
		((Control)label1).Text = "Name:";
		((Control)label_Serial).AutoSize = true;
		((Control)label_Serial).Location = new Point(12, 78);
		((Control)label_Serial).Name = "label_Serial";
		((Control)label_Serial).Size = new Size(36, 13);
		((Control)label_Serial).TabIndex = 2;
		((Control)label_Serial).Text = "Serial:";
		((Control)textBox_name).Location = new Point(15, 37);
		((Control)textBox_name).Name = "textBox_name";
		((Control)textBox_name).Size = new Size(257, 20);
		((Control)textBox_name).TabIndex = 3;
		((Control)textBox_serial).Location = new Point(12, 94);
		((Control)textBox_serial).Name = "textBox_serial";
		((Control)textBox_serial).Size = new Size(260, 20);
		((Control)textBox_serial).TabIndex = 4;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(284, 162);
		((Control)this).Controls.Add((Control)(object)textBox_serial);
		((Control)this).Controls.Add((Control)(object)textBox_name);
		((Control)this).Controls.Add((Control)(object)label_Serial);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Controls.Add((Control)(object)button_check);
		((Control)this).Name = "MainForm";
		((Control)this).Text = "Nelix Crackme #1";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
