using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Reflection;
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
[assembly: AssemblyProduct("")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTitle("crackme")]
[assembly: ComVisible(false)]
[assembly: Guid("8d659494-469b-4110-aae3-ace4a283bdcc")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]
[assembly: AssemblyVersion("1.0.0.0")]
namespace WindowsFormsApplication4
{
	public class Form2 : Form
	{
		private IContainer components = null;

		private Label label1;

		private Label label2;

		private Label label3;

		private Label label4;

		private TextBox textBox1;

		private TextBox textBox2;

		private TextBox textBox3;

		private ComboBox comboBox1;

		private Button button1;

		private Button button2;

		private Label label5;

		private Label label6;

		private TextBox textBox4;

		private TextBox textBox5;

		private TextBox textBox6;

		private Label label7;

		private Label label8;

		private Label label9;

		public Form2()
		{
			InitializeComponent();
		}

		private void button1_Click(object sender, EventArgs e)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			MessageBox.Show("Error!!!\n\n Unable to validate card. \nTry again until it works", "Error", (MessageBoxButtons)0, (MessageBoxIcon)16);
		}

		private void button2_Click(object sender, EventArgs e)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			((Control)this).Hide();
			Form1 form = new Form1();
			((Form)form).ShowDialog();
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
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Expected O, but got Unknown
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0085: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Expected O, but got Unknown
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Expected O, but got Unknown
			//IL_009c: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Expected O, but got Unknown
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Expected O, but got Unknown
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_07b6: Unknown result type (might be due to invalid IL or missing references)
			//IL_07c0: Expected O, but got Unknown
			label1 = new Label();
			label2 = new Label();
			label3 = new Label();
			label4 = new Label();
			textBox1 = new TextBox();
			textBox2 = new TextBox();
			textBox3 = new TextBox();
			comboBox1 = new ComboBox();
			button1 = new Button();
			button2 = new Button();
			label5 = new Label();
			label6 = new Label();
			textBox4 = new TextBox();
			textBox5 = new TextBox();
			textBox6 = new TextBox();
			label7 = new Label();
			label8 = new Label();
			label9 = new Label();
			((Control)this).SuspendLayout();
			((Control)label1).AutoSize = true;
			((Control)label1).Location = new Point(39, 43);
			((Control)label1).Name = "label1";
			((Control)label1).Size = new Size(182, 13);
			((Control)label1).TabIndex = 0;
			((Control)label1).Text = "Name (as appears on the credit card)";
			((Control)label2).AutoSize = true;
			((Control)label2).Location = new Point(39, 108);
			((Control)label2).Name = "label2";
			((Control)label2).Size = new Size(56, 13);
			((Control)label2).TabIndex = 1;
			((Control)label2).Text = "Card Type";
			((Control)label3).AutoSize = true;
			((Control)label3).Location = new Point(39, 239);
			((Control)label3).Name = "label3";
			((Control)label3).Size = new Size(49, 13);
			((Control)label3).TabIndex = 2;
			((Control)label3).Text = "Valid Tru";
			((Control)label4).AutoSize = true;
			((Control)label4).Location = new Point(39, 175);
			((Control)label4).Name = "label4";
			((Control)label4).Size = new Size(69, 13);
			((Control)label4).TabIndex = 3;
			((Control)label4).Text = "Card Number";
			((Control)textBox1).Location = new Point(42, 59);
			((Control)textBox1).Name = "textBox1";
			((Control)textBox1).Size = new Size(230, 20);
			((Control)textBox1).TabIndex = 4;
			((Control)textBox2).Location = new Point(42, 191);
			((Control)textBox2).Name = "textBox2";
			((Control)textBox2).Size = new Size(94, 20);
			((Control)textBox2).TabIndex = 5;
			((Control)textBox3).Location = new Point(42, 255);
			((Control)textBox3).Name = "textBox3";
			((Control)textBox3).Size = new Size(36, 20);
			((Control)textBox3).TabIndex = 6;
			comboBox1.FlatStyle = (FlatStyle)1;
			((ListControl)comboBox1).FormattingEnabled = true;
			comboBox1.Items.AddRange(new object[4] { "LameCard", "MegaPay", "MoneyXpress", "PayUpBuddy" });
			((Control)comboBox1).Location = new Point(42, 124);
			((Control)comboBox1).Name = "comboBox1";
			((Control)comboBox1).Size = new Size(200, 21);
			((Control)comboBox1).TabIndex = 7;
			((Control)button1).Location = new Point(21, 340);
			((Control)button1).Name = "button1";
			((Control)button1).Size = new Size(382, 39);
			((Control)button1).TabIndex = 8;
			((Control)button1).Text = "PAY!";
			((ButtonBase)button1).UseVisualStyleBackColor = true;
			((Control)button1).Click += button1_Click;
			((Control)button2).Location = new Point(409, 358);
			((Control)button2).Name = "button2";
			((Control)button2).Size = new Size(65, 21);
			((Control)button2).TabIndex = 9;
			((Control)button2).Text = "Cancel";
			((ButtonBase)button2).UseVisualStyleBackColor = true;
			((Control)button2).Click += button2_Click;
			((Control)label5).AutoSize = true;
			((Control)label5).Location = new Point(27, 300);
			((Control)label5).Name = "label5";
			((Control)label5).Size = new Size(326, 13);
			((Control)label5).TabIndex = 10;
			((Control)label5).Text = "Your card will be charged for 5,000$ + lametax + delivery + lamefee.";
			((Control)label6).AutoSize = true;
			((Control)label6).Location = new Point(84, 258);
			((Control)label6).Name = "label6";
			((Control)label6).Size = new Size(10, 13);
			((Control)label6).TabIndex = 11;
			((Control)label6).Text = "-";
			((Control)textBox4).Location = new Point(100, 255);
			((Control)textBox4).Name = "textBox4";
			((Control)textBox4).Size = new Size(36, 20);
			((Control)textBox4).TabIndex = 12;
			((Control)textBox5).Location = new Point(159, 191);
			((Control)textBox5).Name = "textBox5";
			((Control)textBox5).Size = new Size(94, 20);
			((Control)textBox5).TabIndex = 13;
			((Control)textBox6).Location = new Point(277, 191);
			((Control)textBox6).Name = "textBox6";
			((Control)textBox6).Size = new Size(94, 20);
			((Control)textBox6).TabIndex = 14;
			((Control)label7).AutoSize = true;
			((Control)label7).Location = new Point(142, 194);
			((Control)label7).Name = "label7";
			((Control)label7).Size = new Size(10, 13);
			((Control)label7).TabIndex = 15;
			((Control)label7).Text = "-";
			((Control)label8).AutoSize = true;
			((Control)label8).Location = new Point(261, 194);
			((Control)label8).Name = "label8";
			((Control)label8).Size = new Size(10, 13);
			((Control)label8).TabIndex = 16;
			((Control)label8).Text = "-";
			((Control)label9).AutoSize = true;
			((Control)label9).Font = new Font("Microsoft Sans Serif", 12f, (FontStyle)0, (GraphicsUnit)3, (byte)238);
			((Control)label9).Location = new Point(22, 11);
			((Control)label9).Name = "label9";
			((Control)label9).Size = new Size(273, 20);
			((Control)label9).TabIndex = 17;
			((Control)label9).Text = "ENTER YOUR DATA AND PAY UP!!!";
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(486, 389);
			((Control)this).Controls.Add((Control)(object)label9);
			((Control)this).Controls.Add((Control)(object)label8);
			((Control)this).Controls.Add((Control)(object)label7);
			((Control)this).Controls.Add((Control)(object)textBox6);
			((Control)this).Controls.Add((Control)(object)textBox5);
			((Control)this).Controls.Add((Control)(object)textBox4);
			((Control)this).Controls.Add((Control)(object)label6);
			((Control)this).Controls.Add((Control)(object)label5);
			((Control)this).Controls.Add((Control)(object)button2);
			((Control)this).Controls.Add((Control)(object)button1);
			((Control)this).Controls.Add((Control)(object)comboBox1);
			((Control)this).Controls.Add((Control)(object)textBox3);
			((Control)this).Controls.Add((Control)(object)textBox2);
			((Control)this).Controls.Add((Control)(object)textBox1);
			((Control)this).Controls.Add((Control)(object)label4);
			((Control)this).Controls.Add((Control)(object)label3);
			((Control)this).Controls.Add((Control)(object)label2);
			((Control)this).Controls.Add((Control)(object)label1);
			((Control)this).Name = "Form2";
			((Control)this).Text = "Register";
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}
	}
	public class Form1 : Form
	{
		private IContainer components = null;

		private Button button1;

		private Button button2;

		private Button button3;

		private TextBox label2;

		private TextBox textBox2;

		private Label label1;

		private Label textBox1;

		public Form1()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			MessageBox.Show("Your trial for notepad.exe has expired. Please register.", "Error");
		}

		private void button2_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}

		private void button3_Click(object sender, EventArgs e)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			((Control)this).Hide();
			Form2 form = new Form2();
			((Form)form).ShowDialog();
		}

		private void asd(object sender, EventArgs e)
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cf: Unknown result type (might be due to invalid IL or missing references)
			if (((Control)label2).Text.Length < 4)
			{
				MessageBox.Show("Name must be at least 4 characters", "Fail", (MessageBoxButtons)0, (MessageBoxIcon)16);
				return;
			}
			if (((Control)textBox2).Text.Length < 1)
			{
				MessageBox.Show("Invalid Code", "Fail", (MessageBoxButtons)0, (MessageBoxIcon)16);
				return;
			}
			string s = ((Control)textBox2).Text.Trim();
			if (!double.TryParse(s, out var _))
			{
				MessageBox.Show("Invalid Code", "Fail", (MessageBoxButtons)0, (MessageBoxIcon)16);
				return;
			}
			string text = ((Control)label2).Text;
			string text2 = "";
			char[] array = text.ToCharArray();
			string text3 = text;
			foreach (char value in text3)
			{
				int num = Convert.ToInt32(value);
				string text4 = $"{num:X}";
				text2 += text4;
			}
			char[] array2 = text2.ToCharArray();
			Array.Reverse((Array)array2);
			string text5 = new string(array2);
			if (text5.Length > 9)
			{
				text5 = text5.Remove(9, text5.Length - 9);
			}
			int value2 = Convert.ToInt32(text5);
			decimal num2 = Convert.ToDecimal(value2);
			double value3 = Math.Pow(((Control)label2).Text.Length, 3.0);
			decimal num3 = Math.Round(num2 * Convert.ToDecimal(value3), 0);
			if (Convert.ToDecimal(Convert.ToDouble(((Control)textBox2).Text)) == num3)
			{
				MessageBox.Show("Thank you for registering notepad.exe!", "Success", (MessageBoxButtons)0, (MessageBoxIcon)64);
				Process process = Process.Start("notepad.exe");
				Application.Exit();
			}
			else
			{
				MessageBox.Show("Invalid Code", "Fail", (MessageBoxButtons)0, (MessageBoxIcon)16);
			}
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
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			button1 = new Button();
			button2 = new Button();
			button3 = new Button();
			label2 = new TextBox();
			textBox2 = new TextBox();
			label1 = new Label();
			textBox1 = new Label();
			((Control)this).SuspendLayout();
			((Control)button1).Location = new Point(26, 136);
			((Control)button1).Name = "button1";
			((Control)button1).Size = new Size(112, 24);
			((Control)button1).TabIndex = 0;
			((Control)button1).Text = "Register";
			((ButtonBase)button1).UseVisualStyleBackColor = true;
			((Control)button1).Click += asd;
			((Control)button2).Location = new Point(167, 137);
			((Control)button2).Name = "button2";
			((Control)button2).Size = new Size(75, 23);
			((Control)button2).TabIndex = 1;
			((Control)button2).Text = "Exit";
			((ButtonBase)button2).UseVisualStyleBackColor = true;
			((Control)button2).Click += button2_Click;
			((Control)button3).Location = new Point(269, 137);
			((Control)button3).Name = "button3";
			((Control)button3).Size = new Size(75, 23);
			((Control)button3).TabIndex = 2;
			((Control)button3).Text = "Buy";
			((ButtonBase)button3).UseVisualStyleBackColor = true;
			((Control)button3).Click += button3_Click;
			((Control)label2).Location = new Point(72, 21);
			((Control)label2).Name = "label2";
			((Control)label2).Size = new Size(272, 20);
			((Control)label2).TabIndex = 3;
			((Control)textBox2).Location = new Point(72, 47);
			((TextBoxBase)textBox2).Multiline = true;
			((Control)textBox2).Name = "textBox2";
			((Control)textBox2).Size = new Size(272, 72);
			((Control)textBox2).TabIndex = 4;
			((Control)label1).AutoSize = true;
			((Control)label1).Location = new Point(34, 24);
			((Control)label1).Name = "label1";
			((Control)label1).Size = new Size(35, 13);
			((Control)label1).TabIndex = 5;
			((Control)label1).Text = "Name";
			((Control)textBox1).AutoSize = true;
			((Control)textBox1).Location = new Point(34, 50);
			((Control)textBox1).Name = "textBox1";
			((Control)textBox1).Size = new Size(32, 13);
			((Control)textBox1).TabIndex = 6;
			((Control)textBox1).Text = "Code";
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(356, 165);
			((Control)this).Controls.Add((Control)(object)textBox1);
			((Control)this).Controls.Add((Control)(object)label1);
			((Control)this).Controls.Add((Control)(object)textBox2);
			((Control)this).Controls.Add((Control)(object)label2);
			((Control)this).Controls.Add((Control)(object)button3);
			((Control)this).Controls.Add((Control)(object)button2);
			((Control)this).Controls.Add((Control)(object)button1);
			((Control)this).Name = "Form1";
			((Control)this).Text = "Register";
			((Form)this).Load += Form1_Load;
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}
	}
}
namespace crackme.Properties
{
	[DebuggerNonUserCode]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
	[CompilerGenerated]
	internal class Resources
	{
		private static ResourceManager resourceMan;

		private static CultureInfo resourceCulture;

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (object.ReferenceEquals(resourceMan, null))
				{
					ResourceManager resourceManager = new ResourceManager("crackme.Properties.Resources", typeof(Resources).Assembly);
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
	[CompilerGenerated]
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
	internal sealed class Settings : ApplicationSettingsBase
	{
		private static Settings defaultInstance = (Settings)(object)SettingsBase.Synchronized((SettingsBase)(object)new Settings());

		public static Settings Default => defaultInstance;
	}
}
namespace WindowsFormsApplication4
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
