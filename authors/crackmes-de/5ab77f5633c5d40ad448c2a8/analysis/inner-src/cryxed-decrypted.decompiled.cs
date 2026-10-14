using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

[assembly: Guid("B8E42BB1-86A8-42FA-8034-F76A9ED52CC4")]
[assembly: CLSCompliant(true)]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyDescription("")]
[assembly: Debuggable(true, true)]
[assembly: AssemblyTitle("")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyProduct("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyVersion("1.0.2790.17718")]
namespace UnpackMe;

public class Form1 : Form
{
	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("TextBox3")]
	private TextBox _TextBox3;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	private IContainer components;

	internal virtual Button Button1
	{
		get
		{
			return _Button1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		set
		{
			if (_Button1 != null)
			{
				((Control)_Button1).Click -= Button1_Click;
			}
			_Button1 = value;
			if (_Button1 != null)
			{
				((Control)_Button1).Click += Button1_Click;
			}
		}
	}

	internal virtual TextBox TextBox1
	{
		get
		{
			return _TextBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		set
		{
			if (_TextBox1 != null)
			{
			}
			_TextBox1 = value;
			if (_TextBox1 == null)
			{
			}
		}
	}

	internal virtual TextBox TextBox2
	{
		get
		{
			return _TextBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		set
		{
			if (_TextBox2 != null)
			{
			}
			_TextBox2 = value;
			if (_TextBox2 == null)
			{
			}
		}
	}

	internal virtual TextBox TextBox3
	{
		get
		{
			return _TextBox3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		set
		{
			if (_TextBox3 != null)
			{
			}
			_TextBox3 = value;
			if (_TextBox3 == null)
			{
			}
		}
	}

	[STAThread]
	public static void Main()
	{
		Application.Run((Form)(object)new Form1());
	}

	public Form1()
	{
		InitializeComponent();
	}

	protected override void Dispose(bool disposing)
	{
		if (disposing && components != null)
		{
			components.Dispose();
		}
		((Form)this).Dispose(disposing);
	}

	[DebuggerStepThrough]
	private void InitializeComponent()
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Expected O, but got Unknown
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected O, but got Unknown
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Expected O, but got Unknown
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected O, but got Unknown
		Button1 = new Button();
		TextBox1 = new TextBox();
		TextBox2 = new TextBox();
		TextBox3 = new TextBox();
		((Control)this).SuspendLayout();
		Button button = Button1;
		Point location = new Point(16, 80);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		Size size = new Size(216, 24);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 0;
		((Control)Button1).Text = "Check";
		TextBox textBox = TextBox1;
		location = new Point(8, 8);
		((Control)textBox).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		size = new Size(232, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 1;
		TextBox1.Text = "Enter name here";
		TextBox textBox3 = TextBox2;
		location = new Point(8, 32);
		((Control)textBox3).Location = location;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(232, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 2;
		TextBox2.Text = "Enter Customer ID here";
		TextBox textBox5 = TextBox3;
		location = new Point(8, 56);
		((Control)textBox5).Location = location;
		((Control)TextBox3).Name = "TextBox3";
		TextBox textBox6 = TextBox3;
		size = new Size(232, 20);
		((Control)textBox6).Size = size;
		((Control)TextBox3).TabIndex = 3;
		TextBox3.Text = "Enter serial here";
		size = new Size(5, 13);
		((Form)this).AutoScaleBaseSize = size;
		size = new Size(248, 108);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)TextBox3);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Name = "Form1";
		((Control)this).Text = "CryxeNet 0.01a Unpackme";
		((Control)this).ResumeLayout(false);
	}

	public string DecryptString128Bit(string vstrStringToBeDecrypted, string vstrDecryptionKey)
	{
		byte[] rgbIV = new byte[16]
		{
			121, 241, 10, 1, 132, 74, 11, 39, 255, 91,
			45, 78, 14, 211, 22, 62
		};
		RijndaelManaged rijndaelManaged = new RijndaelManaged();
		string empty = string.Empty;
		byte[] array = Convert.FromBase64String(vstrStringToBeDecrypted);
		int num = Strings.Len(vstrDecryptionKey);
		checked
		{
			if (num >= 32)
			{
				vstrDecryptionKey = Strings.Left(vstrDecryptionKey, 32);
			}
			else
			{
				num = Strings.Len(vstrDecryptionKey);
				int num2 = 32 - num;
				vstrDecryptionKey += Strings.StrDup(num2, "X");
			}
			byte[] bytes = Encoding.ASCII.GetBytes(vstrDecryptionKey.ToCharArray());
			byte[] array2 = new byte[array.Length + 1];
			MemoryStream memoryStream = new MemoryStream(array);
			try
			{
				CryptoStream cryptoStream = new CryptoStream(memoryStream, rijndaelManaged.CreateDecryptor(bytes, rgbIV), CryptoStreamMode.Read);
				cryptoStream.Read(array2, 0, array2.Length);
				cryptoStream.FlushFinalBlock();
				memoryStream.Close();
				cryptoStream.Close();
			}
			catch (Exception projectError)
			{
				ProjectData.SetProjectError(projectError);
				ProjectData.ClearProjectError();
			}
			return StripNullCharacters(Encoding.ASCII.GetString(array2));
		}
	}

	public string StripNullCharacters(string vstrStringWithNulls)
	{
		int num = 1;
		string text = vstrStringWithNulls;
		while (num > 0)
		{
			num = Strings.InStr(num, vstrStringWithNulls, "\0", (CompareMethod)0);
			if (num > 0)
			{
				text = checked(Strings.Left(text, num - 1) + Strings.Right(text, Strings.Len(text) - num));
			}
			if (num > text.Length)
			{
				break;
			}
		}
		return text;
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			if (StringType.StrCmp(TextBox1.Text, DecryptString128Bit(TextBox3.Text, TextBox2.Text), false) == 0)
			{
				MessageBox.Show("The serial is correct!");
			}
			else
			{
				MessageBox.Show("Serial is incorrect");
			}
		}
		catch (Exception ex)
		{
			ProjectData.SetProjectError(ex);
			Exception ex2 = ex;
			MessageBox.Show("Serial is incorrect");
			ProjectData.ClearProjectError();
		}
	}
}
