using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Reflection;
using System.Reflection.Emit;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Windows.Forms;

[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyTrademark("")]
[assembly: CompilationRelaxations(8)]
[assembly: AssemblyDescription("")]
[assembly: AssemblyProduct("CrakMe")]
[assembly: AssemblyCopyright("Copyright © s4tan 2009")]
[assembly: AssemblyTitle("CrakMe")]
[assembly: ComVisible(false)]
[assembly: Guid("3c8cbc84-2a38-489a-a22f-59352aeda330")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyVersion("1.0.0.0")]
namespace CrakMe
{
	public class Form1 : Form
	{
		private const string KO = "Incorrect Key";

		private const string OK = "Product is now registered!! : )";

		private IContainer components;

		private Label label1;

		private Label label2;

		private TextBox nameTextBox;

		private TextBox keyTextBox;

		private Button button1;

		private Button button2;

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
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			label1 = new Label();
			label2 = new Label();
			nameTextBox = new TextBox();
			keyTextBox = new TextBox();
			button1 = new Button();
			button2 = new Button();
			((Control)this).SuspendLayout();
			((Control)label1).AutoSize = true;
			((Control)label1).Location = new Point(12, 33);
			((Control)label1).Name = "label1";
			((Control)label1).Size = new Size(35, 13);
			((Control)label1).TabIndex = 0;
			((Control)label1).Text = "Name";
			((Control)label2).AutoSize = true;
			((Control)label2).Location = new Point(12, 82);
			((Control)label2).Name = "label2";
			((Control)label2).Size = new Size(25, 13);
			((Control)label2).TabIndex = 1;
			((Control)label2).Text = "Key";
			((Control)nameTextBox).Location = new Point(53, 30);
			((Control)nameTextBox).Name = "nameTextBox";
			((Control)nameTextBox).Size = new Size(263, 20);
			((Control)nameTextBox).TabIndex = 2;
			((Control)keyTextBox).Location = new Point(53, 79);
			((Control)keyTextBox).Name = "keyTextBox";
			((Control)keyTextBox).Size = new Size(263, 20);
			((Control)keyTextBox).TabIndex = 3;
			((Control)button1).Location = new Point(160, 117);
			((Control)button1).Name = "button1";
			((Control)button1).Size = new Size(75, 23);
			((Control)button1).TabIndex = 4;
			((Control)button1).Text = "Active";
			((ButtonBase)button1).UseVisualStyleBackColor = true;
			((Control)button1).Click += ActiveButton_Click;
			((Control)button2).Location = new Point(241, 117);
			((Control)button2).Name = "button2";
			((Control)button2).Size = new Size(75, 23);
			((Control)button2).TabIndex = 5;
			((Control)button2).Text = "Exit";
			((ButtonBase)button2).UseVisualStyleBackColor = true;
			((Control)button2).Click += ExitButton_Click;
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(328, 159);
			((Control)this).Controls.Add((Control)(object)button2);
			((Control)this).Controls.Add((Control)(object)button1);
			((Control)this).Controls.Add((Control)(object)keyTextBox);
			((Control)this).Controls.Add((Control)(object)nameTextBox);
			((Control)this).Controls.Add((Control)(object)label2);
			((Control)this).Controls.Add((Control)(object)label1);
			((Form)this).FormBorderStyle = (FormBorderStyle)2;
			((Form)this).MaximizeBox = false;
			((Control)this).Name = "Form1";
			((Form)this).ShowIcon = false;
			((Form)this).SizeGripStyle = (SizeGripStyle)2;
			((Control)this).Text = "CrackMe#1 by s4tan";
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}

		public Form1()
		{
			InitializeComponent();
		}

		private void ExitButton_Click(object sender, EventArgs e)
		{
			((Form)this).Close();
		}

		private void ActiveButton_Click(object sender, EventArgs e)
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_016f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0163: Unknown result type (might be due to invalid IL or missing references)
			string text = ((Control)nameTextBox).Text;
			string text2 = ((Control)keyTextBox).Text;
			if (text.Length == 0 || text2.Length == 0)
			{
				MessageBox.Show("You must specify a Name and a Key");
				return;
			}
			AssemblyName assemblyName = new AssemblyName("CrackMe1Assembly");
			AssemblyBuilder assemblyBuilder = AppDomain.CurrentDomain.DefineDynamicAssembly(assemblyName, (AssemblyBuilderAccess)3);
			ModuleBuilder moduleBuilder = assemblyBuilder.DefineDynamicModule(assemblyName.Name, assemblyName.Name + ".dll");
			TypeBuilder typeBuilder = moduleBuilder.DefineType("MyDynamicType", TypeAttributes.Public);
			ConstructorBuilder constructorBuilder = typeBuilder.DefineConstructor(MethodAttributes.Public, CallingConventions.Standard, Type.EmptyTypes);
			ILGenerator iLGenerator = constructorBuilder.GetILGenerator();
			iLGenerator.Emit(OpCodes.Ldarg_0);
			iLGenerator.Emit(OpCodes.Call, typeof(object).GetConstructor(Type.EmptyTypes));
			iLGenerator.Emit(OpCodes.Ret);
			MethodBuilder methodBuilder = typeBuilder.DefineMethod("ActivateProduct", MethodAttributes.Public, typeof(bool), new Type[2]
			{
				typeof(string),
				typeof(string)
			});
			GenerateOpcode(methodBuilder.GetILGenerator());
			Type type = typeBuilder.CreateType();
			MethodInfo method = type.GetMethod("ActivateProduct");
			object obj = Activator.CreateInstance(type);
			if ((bool)method.Invoke(obj, new object[2] { text, text2 }))
			{
				MessageBox.Show("Product is now registered!! : )");
			}
			else
			{
				MessageBox.Show("Incorrect Key");
			}
		}

		private void GenerateOpcode(ILGenerator ilGen)
		{
			Label label = ilGen.DefineLabel();
			Label label2 = ilGen.DefineLabel();
			Label label3 = ilGen.DefineLabel();
			Label label4 = ilGen.DefineLabel();
			ilGen.DeclareLocal(typeof(char[]));
			ilGen.DeclareLocal(typeof(char[]));
			ilGen.DeclareLocal(typeof(int));
			ilGen.DeclareLocal(typeof(int));
			ilGen.Emit(OpCodes.Ldarg_1);
			ilGen.EmitCall(OpCodes.Callvirt, typeof(string).GetMethod("ToCharArray", Type.EmptyTypes), Type.EmptyTypes);
			ilGen.Emit(OpCodes.Stloc_0);
			ilGen.Emit(OpCodes.Ldarg_2);
			ilGen.EmitCall(OpCodes.Callvirt, typeof(string).GetMethod("ToCharArray", Type.EmptyTypes), Type.EmptyTypes);
			ilGen.Emit(OpCodes.Stloc_1);
			ilGen.Emit(OpCodes.Ldloc_1);
			ilGen.Emit(OpCodes.Ldlen);
			ilGen.Emit(OpCodes.Conv_I4);
			ilGen.Emit(OpCodes.Ldloc_0);
			ilGen.Emit(OpCodes.Ldlen);
			ilGen.Emit(OpCodes.Conv_I4);
			ilGen.Emit(OpCodes.Ldc_I4_2);
			ilGen.Emit(OpCodes.Mul);
			ilGen.Emit(OpCodes.Beq_S, label);
			ilGen.Emit(OpCodes.Ldc_I4_0);
			ilGen.Emit(OpCodes.Ret);
			ilGen.MarkLabel(label);
			ilGen.Emit(OpCodes.Ldc_I4_0);
			ilGen.Emit(OpCodes.Stloc_2);
			ilGen.Emit(OpCodes.Ldc_I4_0);
			ilGen.Emit(OpCodes.Stloc_3);
			ilGen.Emit(OpCodes.Br_S, label2);
			ilGen.MarkLabel(label4);
			ilGen.Emit(OpCodes.Ldloc_1);
			ilGen.Emit(OpCodes.Ldloc_3);
			ilGen.Emit(OpCodes.Ldelem_U2);
			ilGen.Emit(OpCodes.Ldloc_0);
			ilGen.Emit(OpCodes.Ldloc_2);
			ilGen.Emit(OpCodes.Ldelem_U2);
			ilGen.Emit(OpCodes.Ldloc_3);
			ilGen.Emit(OpCodes.Add);
			ilGen.Emit(OpCodes.Beq_S, label3);
			ilGen.Emit(OpCodes.Ldc_I4_0);
			ilGen.Emit(OpCodes.Ret);
			ilGen.MarkLabel(label3);
			ilGen.Emit(OpCodes.Ldloc_2);
			ilGen.Emit(OpCodes.Ldc_I4_1);
			ilGen.Emit(OpCodes.Add);
			ilGen.Emit(OpCodes.Ldloc_0);
			ilGen.Emit(OpCodes.Ldlen);
			ilGen.Emit(OpCodes.Conv_I4);
			ilGen.Emit(OpCodes.Rem);
			ilGen.Emit(OpCodes.Stloc_2);
			ilGen.Emit(OpCodes.Ldloc_3);
			ilGen.Emit(OpCodes.Ldc_I4_1);
			ilGen.Emit(OpCodes.Add);
			ilGen.Emit(OpCodes.Stloc_3);
			ilGen.MarkLabel(label2);
			ilGen.Emit(OpCodes.Ldloc_3);
			ilGen.Emit(OpCodes.Ldloc_1);
			ilGen.Emit(OpCodes.Ldlen);
			ilGen.Emit(OpCodes.Conv_I4);
			ilGen.Emit(OpCodes.Blt_S, label4);
			ilGen.Emit(OpCodes.Ldc_I4_1);
			ilGen.Emit(OpCodes.Ret);
		}
	}
}
namespace CrakMe.Properties
{
	[DebuggerNonUserCode]
	[CompilerGenerated]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
	internal class Resources
	{
		private static ResourceManager resourceMan;

		private static CultureInfo resourceCulture;

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (resourceMan == null)
				{
					ResourceManager resourceManager = new ResourceManager("CrakMe.Properties.Resources", typeof(Resources).Assembly);
					resourceMan = resourceManager;
				}
				return resourceMan;
			}
		}

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static CultureInfo Culture
		{
			get
			{
				return resourceCulture;
			}
			set
			{
				resourceCulture = value;
			}
		}

		internal Resources()
		{
		}
	}
}
namespace CrakMe
{
	internal static class Program
	{
		[STAThread]
		private static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			Application.Run((Form)(object)new Form1());
		}
	}
}
namespace CrakMe.Properties
{
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "9.0.0.0")]
	[CompilerGenerated]
	internal sealed class Settings : ApplicationSettingsBase
	{
		private static Settings defaultInstance = (Settings)(object)SettingsBase.Synchronized((SettingsBase)(object)new Settings());

		public static Settings Default => defaultInstance;
	}
}
