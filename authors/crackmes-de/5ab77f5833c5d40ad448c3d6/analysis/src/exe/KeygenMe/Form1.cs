using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using GabSoftware.Controls.GabMatrix;
using KeygenMe.My;
using KeygenMe.My.Resources;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace KeygenMe;

[DesignerGenerated]
public class Form1 : Form
{
	private IContainer components;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("GabMatrix1")]
	private GabMatrix _GabMatrix1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

	[AccessedThroughProperty("Button3")]
	private Button _Button3;

	private string esp;

	private string esp1;

	private string esp2;

	private string esp4;

	internal virtual Button Button1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button1_Click;
			if (_Button1 != null)
			{
				((Control)_Button1).Click -= eventHandler;
			}
			_Button1 = value;
			if (_Button1 != null)
			{
				((Control)_Button1).Click += eventHandler;
			}
		}
	}

	internal virtual GabMatrix GabMatrix1
	{
		[DebuggerNonUserCode]
		get
		{
			return _GabMatrix1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_GabMatrix1 = value;
		}
	}

	internal virtual TextBox TextBox2
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox2 = value;
		}
	}

	internal virtual TextBox TextBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox1 = value;
		}
	}

	internal virtual Label Label1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label1 = value;
		}
	}

	internal virtual Label Label2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label2 = value;
		}
	}

	internal virtual Button Button2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button2_Click;
			if (_Button2 != null)
			{
				((Control)_Button2).Click -= eventHandler;
			}
			_Button2 = value;
			if (_Button2 != null)
			{
				((Control)_Button2).Click += eventHandler;
			}
		}
	}

	internal virtual Button Button3
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button3_Click;
			if (_Button3 != null)
			{
				((Control)_Button3).Click -= eventHandler;
			}
			_Button3 = value;
			if (_Button3 != null)
			{
				((Control)_Button3).Click += eventHandler;
			}
		}
	}

	public Form1()
	{
		esp = "";
		esp1 = "";
		esp2 = "";
		esp4 = "";
		InitializeComponent();
	}

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		try
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
		}
		finally
		{
			((Form)this).Dispose(disposing);
		}
	}

	[DebuggerStepThrough]
	private void InitializeComponent()
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Expected O, but got Unknown
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected O, but got Unknown
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Expected O, but got Unknown
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Expected O, but got Unknown
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected O, but got Unknown
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Expected O, but got Unknown
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Expected O, but got Unknown
		//IL_0115: Unknown result type (might be due to invalid IL or missing references)
		//IL_011f: Expected O, but got Unknown
		//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e2: Expected O, but got Unknown
		//IL_026e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0278: Expected O, but got Unknown
		//IL_0310: Unknown result type (might be due to invalid IL or missing references)
		//IL_031a: Expected O, but got Unknown
		//IL_03c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_03cb: Expected O, but got Unknown
		Button1 = new Button();
		GabMatrix1 = new GabMatrix();
		TextBox2 = new TextBox();
		TextBox1 = new TextBox();
		Label1 = new Label();
		Label2 = new Label();
		Button2 = new Button();
		Button3 = new Button();
		((Control)this).SuspendLayout();
		((Control)Button1).BackgroundImage = (Image)(object)Resources.ok2;
		((Control)Button1).BackgroundImageLayout = (ImageLayout)3;
		((ButtonBase)Button1).FlatAppearance.BorderColor = Color.Black;
		((ButtonBase)Button1).FlatStyle = (FlatStyle)0;
		Button button = Button1;
		Point location = new Point(98, 136);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		Size size = new Size(67, 29);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 0;
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		((Control)GabMatrix1).BackColor = Color.MidnightBlue;
		GabMatrix1.Font = new Font("Verdana", 8.25f, (FontStyle)1);
		GabMatrix1.ForeColor = Color.Red;
		GabMatrix1.GridColor = Color.Black;
		GabMatrix gabMatrix = GabMatrix1;
		location = new Point(-1, -4);
		((Control)gabMatrix).Location = location;
		GabMatrix1.MoveType = GabMatrix.eMoveType.RightToLeft;
		GabMatrix1.MyText = "Unregistered :(";
		((Control)GabMatrix1).Name = "GabMatrix1";
		GabMatrix gabMatrix2 = GabMatrix1;
		size = new Size(354, 44);
		((Control)gabMatrix2).Size = size;
		((Control)GabMatrix1).TabIndex = 9;
		GabMatrix1.TimeInterval = 25;
		((TextBoxBase)TextBox2).BackColor = Color.BlueViolet;
		((Control)TextBox2).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((TextBoxBase)TextBox2).ForeColor = Color.White;
		TextBox textBox = TextBox2;
		location = new Point(79, 100);
		((Control)textBox).Location = location;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox2 = TextBox2;
		size = new Size(259, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox2).TabIndex = 1;
		TextBox2.TextAlign = (HorizontalAlignment)2;
		((TextBoxBase)TextBox1).BackColor = Color.BlueViolet;
		((Control)TextBox1).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((TextBoxBase)TextBox1).ForeColor = Color.White;
		TextBox textBox3 = TextBox1;
		location = new Point(79, 56);
		((Control)textBox3).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox4 = TextBox1;
		size = new Size(259, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox1).TabIndex = 2;
		TextBox1.TextAlign = (HorizontalAlignment)2;
		Label1.AutoSize = true;
		((Control)Label1).BackColor = Color.Transparent;
		((Control)Label1).Font = new Font("Microsoft Sans Serif", 9.75f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label1).ForeColor = Color.Red;
		Label label = Label1;
		location = new Point(12, 57);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(49, 16);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 13;
		Label1.Text = "Name";
		Label1.TextAlign = (ContentAlignment)32;
		Label2.AutoSize = true;
		((Control)Label2).BackColor = Color.Transparent;
		((Control)Label2).Font = new Font("Microsoft Sans Serif", 9.75f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label2).ForeColor = Color.Red;
		Label label3 = Label2;
		location = new Point(12, 101);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(49, 16);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 14;
		Label2.Text = "Sérial";
		((Control)Button2).BackgroundImage = (Image)(object)Resources.about;
		((Control)Button2).BackgroundImageLayout = (ImageLayout)3;
		((ButtonBase)Button2).FlatStyle = (FlatStyle)0;
		Button button3 = Button2;
		location = new Point(171, 136);
		((Control)button3).Location = location;
		((Control)Button2).Name = "Button2";
		Button button4 = Button2;
		size = new Size(67, 29);
		((Control)button4).Size = size;
		((Control)Button2).TabIndex = 15;
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		((Control)Button3).BackgroundImage = (Image)(object)Resources.exit2;
		((Control)Button3).BackgroundImageLayout = (ImageLayout)3;
		((ButtonBase)Button3).FlatStyle = (FlatStyle)0;
		Button button5 = Button3;
		location = new Point(244, 136);
		((Control)button5).Location = location;
		((Control)Button3).Name = "Button3";
		Button button6 = Button3;
		size = new Size(67, 29);
		((Control)button6).Size = size;
		((Control)Button3).TabIndex = 16;
		((ButtonBase)Button3).UseVisualStyleBackColor = true;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackgroundImage = (Image)(object)Resources._071206183156_85;
		((Control)this).BackgroundImageLayout = (ImageLayout)3;
		size = new Size(350, 174);
		((Form)this).ClientSize = size;
		((Form)this).ControlBox = false;
		((Control)this).Controls.Add((Control)(object)Button3);
		((Control)this).Controls.Add((Control)(object)Button2);
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Control)this).Controls.Add((Control)(object)GabMatrix1);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).DoubleBuffered = true;
		((Form)this).MaximizeBox = false;
		size = new Size(358, 206);
		((Form)this).MaximumSize = size;
		((Form)this).MinimizeBox = false;
		size = new Size(358, 206);
		((Form)this).MinimumSize = size;
		((Control)this).Name = "Form1";
		((Form)this).ShowIcon = false;
		((Form)this).StartPosition = (FormStartPosition)1;
		((Form)this).Text = "KeygenMe";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public object var(string vr)
	{
		string text = "";
		int num = Strings.Len(vr);
		checked
		{
			for (int i = 1; i <= num; i++)
			{
				text += Conversions.ToString(Strings.Chr(Strings.Asc(Strings.Mid(vr, i, 1)) - 9));
			}
			return text;
		}
	}

	public object varb(string vr)
	{
		string text = "";
		int num = Strings.Len(vr);
		for (int i = 1; i <= num; i = checked(i + 3))
		{
			text = text + "" + Conversions.ToString(Strings.Chr(Conversions.ToInteger(Strings.Mid(vr, i, 3))));
		}
		return text;
	}

	public object varc()
	{
		string text = esp;
		int num = 0;
		text = Conversions.ToString(Conversion.Val(Strings.Mid(esp, 1, 4)) + Conversion.Val(Strings.Mid(esp, 5, 4)) + Conversion.Val(Strings.Mid(esp, 7, 4)));
		num = Conversions.ToInteger(Strings.Mid(text, 1, 4));
		return num;
	}

	private object Var1(string text)
	{
		string text2 = "";
		string text3 = "";
		int num = Strings.Len(text);
		checked
		{
			for (int i = 1; i <= num; i++)
			{
				text3 = text3 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text, i, 1)));
			}
			int num2 = text3.Length - 1;
			for (int j = 0; j <= num2; j++)
			{
				if (LikeOperator.LikeString(text3.Substring(j, 1), "[1-9]", (CompareMethod)0))
				{
					text2 += text3.Substring(j, 1);
				}
			}
			long num3 = Strings.Len(text2);
			if (num3 > 12)
			{
				long num4 = Conversions.ToLong(Strings.Mid(text2, 1, 12));
				return num4;
			}
			return text2;
		}
	}

	private object Var2(long nb1, long nb2)
	{
		double num = 0.0;
		string text = "";
		text = Conversion.Val((object)checked(nb1 + nb2)).ToString();
		text = Conversions.ToString(Operators.ConcatenateObject((object)text, varc()));
		string result = Strings.Mid(text, 1, 4) + "-" + Strings.Mid(text, 5, 4) + "-" + Strings.Mid(text, 9, 4) + "-" + Strings.Mid(text, 13, 4);
		bool flag = Information.UBound((Array)Process.GetProcessesByName(Conversions.ToString(var("[nounl}x{"))), 1) == 0;
		string text2 = Conversions.ToString(varb("075101121103101110077101"));
		if (flag | (Operators.CompareString(((Form)this).Text, text2, false) != 0))
		{
			return 0;
		}
		return result;
	}

	private object var2b()
	{
		string text = (esp = Conversions.ToString(Var1(esp4 = TextBox1.Text)));
		string text2 = Environment.Version.ToString();
		text2 = Conversions.ToString(Var1(text2));
		return esp1 = Conversions.ToString(Var2(Conversions.ToLong(text), Conversions.ToLong(text2)));
	}

	private object var3()
	{
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		string text = TextBox2.Text;
		string text2 = "";
		bool flag = false;
		string text3 = TextBox1.Text;
		if (Operators.CompareString(text3, "", false) != 0)
		{
			string text4 = Conversions.ToString(var2b());
			var4(esp1);
			int num = Strings.Len(text4);
			if (num == 1)
			{
				flag = false;
			}
			else
			{
				text2 = Conversions.ToString(O1.var01(esp1, esp2));
				flag = LikeOperator.LikeString(text, text2, (CompareMethod)0);
			}
			return flag;
		}
		Interaction.MsgBox((object)"Enter your Name", (MsgBoxStyle)0, (object)null);
		return false;
	}

	private object var4(string str)
	{
		SHA256Managed sHA256Managed = new SHA256Managed();
		UnicodeEncoding unicodeEncoding = new UnicodeEncoding();
		byte[] bytes = unicodeEncoding.GetBytes(str);
		string text = Convert.ToBase64String(sHA256Managed.ComputeHash(bytes));
		string text2 = Conversions.ToString(var6(text.ToUpper()));
		text2 = Strings.Mid(text2, 1, 16);
		return esp2 = Strings.Mid(text2, 1, 4) + "-" + Strings.Mid(text2, 5, 4) + "-" + Strings.Mid(text2, 9, 4) + "-" + Strings.Mid(text2, 13, 4);
	}

	public object var6(string str)
	{
		string text = "";
		checked
		{
			int num = str.Length - 1;
			for (int i = 0; i <= num; i++)
			{
				if (LikeOperator.LikeString(str.Substring(i, 1), "[1-Z]", (CompareMethod)0))
				{
					text += str.Substring(i, 1);
				}
			}
			return text;
		}
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		if (Operators.ConditionalCompareObjectEqual(var3(), (object)true, false))
		{
			GabMatrix1.Refresh();
			GabMatrix1.ForeColor = Color.Gold;
			GabMatrix1.MyText = "Registered :)";
			Interaction.MsgBox((object)("Good Job " + esp4 + " Now Créate a keygen"), (MsgBoxStyle)0, (object)null);
		}
		else
		{
			GabMatrix1.Refresh();
			GabMatrix1.ForeColor = Color.Red;
			GabMatrix1.MyText = "Unregistered :(";
		}
	}

	private void Button3_Click(object sender, EventArgs e)
	{
		((Component)(object)this).Dispose();
		((Form)this).Close();
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		((Control)MyProject.Forms.Form2).Show();
		((Form)this).Opacity = 0.0;
	}
}
