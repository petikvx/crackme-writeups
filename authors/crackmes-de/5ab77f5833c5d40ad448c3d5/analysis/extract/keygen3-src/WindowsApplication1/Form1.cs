using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace WindowsApplication1;

[DesignerGenerated]
public class Form1 : Form
{
	private IContainer components;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("TextBox3")]
	private TextBox _TextBox3;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Label3")]
	private Label _Label3;

	[AccessedThroughProperty("fd")]
	private Button _fd;

	[AccessedThroughProperty("hf")]
	private Button _hf;

	[AccessedThroughProperty("lk")]
	private Button _lk;

	[AccessedThroughProperty("Timer1")]
	private Timer _Timer1;

	[AccessedThroughProperty("Label4")]
	private Label _Label4;

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

	internal virtual TextBox TextBox3
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox3 = value;
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

	internal virtual Label Label3
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label3 = value;
		}
	}

	internal virtual Button fd
	{
		[DebuggerNonUserCode]
		get
		{
			return _fd;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = fd_Click;
			if (_fd != null)
			{
				((Control)_fd).Click -= eventHandler;
			}
			_fd = value;
			if (_fd != null)
			{
				((Control)_fd).Click += eventHandler;
			}
		}
	}

	internal virtual Button hf
	{
		[DebuggerNonUserCode]
		get
		{
			return _hf;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = hf_Click;
			if (_hf != null)
			{
				((Control)_hf).Click -= eventHandler;
			}
			_hf = value;
			if (_hf != null)
			{
				((Control)_hf).Click += eventHandler;
			}
		}
	}

	internal virtual Button lk
	{
		[DebuggerNonUserCode]
		get
		{
			return _lk;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = lk_Click;
			if (_lk != null)
			{
				((Control)_lk).Click -= eventHandler;
			}
			_lk = value;
			if (_lk != null)
			{
				((Control)_lk).Click += eventHandler;
			}
		}
	}

	internal virtual Timer Timer1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Timer1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Timer1_Tick;
			if (_Timer1 != null)
			{
				_Timer1.Tick -= eventHandler;
			}
			_Timer1 = value;
			if (_Timer1 != null)
			{
				_Timer1.Tick += eventHandler;
			}
		}
	}

	internal virtual Label Label4
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label4;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label4 = value;
		}
	}

	[DebuggerNonUserCode]
	public Form1()
	{
		((Form)this).Load += Form1_Load;
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
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Expected O, but got Unknown
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected O, but got Unknown
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Expected O, but got Unknown
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected O, but got Unknown
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected O, but got Unknown
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Expected O, but got Unknown
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0068: Expected O, but got Unknown
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Expected O, but got Unknown
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_007e: Expected O, but got Unknown
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Expected O, but got Unknown
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Expected O, but got Unknown
		//IL_01f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fb: Expected O, but got Unknown
		//IL_0283: Unknown result type (might be due to invalid IL or missing references)
		//IL_028d: Expected O, but got Unknown
		//IL_0319: Unknown result type (might be due to invalid IL or missing references)
		//IL_0323: Expected O, but got Unknown
		//IL_04fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0505: Expected O, but got Unknown
		//IL_059a: Unknown result type (might be due to invalid IL or missing references)
		//IL_05a4: Expected O, but got Unknown
		components = new Container();
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		TextBox1 = new TextBox();
		TextBox2 = new TextBox();
		TextBox3 = new TextBox();
		Label1 = new Label();
		Label2 = new Label();
		Label3 = new Label();
		fd = new Button();
		hf = new Button();
		lk = new Button();
		Timer1 = new Timer(components);
		Label4 = new Label();
		((Control)this).SuspendLayout();
		TextBox textBox = TextBox1;
		Point location = new Point(57, 45);
		((Control)textBox).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		Size size = new Size(209, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 0;
		TextBox1.TextAlign = (HorizontalAlignment)2;
		TextBox textBox3 = TextBox2;
		location = new Point(57, 85);
		((Control)textBox3).Location = location;
		((TextBoxBase)TextBox2).MaxLength = 11;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(100, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 1;
		TextBox2.TextAlign = (HorizontalAlignment)2;
		TextBox textBox5 = TextBox3;
		location = new Point(163, 85);
		((Control)textBox5).Location = location;
		((TextBoxBase)TextBox3).MaxLength = 12;
		((Control)TextBox3).Name = "TextBox3";
		TextBox textBox6 = TextBox3;
		size = new Size(103, 20);
		((Control)textBox6).Size = size;
		((Control)TextBox3).TabIndex = 2;
		TextBox3.TextAlign = (HorizontalAlignment)2;
		Label1.AutoSize = true;
		((Control)Label1).BackColor = Color.Transparent;
		((Control)Label1).Font = new Font("Microsoft Sans Serif", 9.75f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		Label label = Label1;
		location = new Point(2, 46);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(49, 16);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 3;
		Label1.Text = "Name";
		Label2.AutoSize = true;
		((Control)Label2).BackColor = Color.Transparent;
		((Control)Label2).Font = new Font("Microsoft Sans Serif", 9.75f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label2).ForeColor = Color.Black;
		Label label3 = Label2;
		location = new Point(2, 86);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(49, 16);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 4;
		Label2.Text = "Sérial";
		((Control)Label3).BackColor = Color.Transparent;
		((Control)Label3).Font = new Font("Tahoma", 14.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label3).ForeColor = Color.Red;
		Label label5 = Label3;
		location = new Point(-3, 152);
		((Control)label5).Location = location;
		((Control)Label3).Name = "Label3";
		Label label6 = Label3;
		size = new Size(296, 30);
		((Control)label6).Size = size;
		((Control)Label3).TabIndex = 5;
		Label3.Text = "UNREGISTERED";
		Label3.TextAlign = (ContentAlignment)32;
		Button obj = fd;
		location = new Point(56, 120);
		((Control)obj).Location = location;
		((Control)fd).Name = "fd";
		Button obj2 = fd;
		size = new Size(66, 29);
		((Control)obj2).Size = size;
		((Control)fd).TabIndex = 6;
		((ButtonBase)fd).Text = "Ckeck";
		((ButtonBase)fd).UseVisualStyleBackColor = true;
		Button obj3 = hf;
		location = new Point(128, 120);
		((Control)obj3).Location = location;
		((Control)hf).Name = "hf";
		Button obj4 = hf;
		size = new Size(66, 29);
		((Control)obj4).Size = size;
		((Control)hf).TabIndex = 7;
		((ButtonBase)hf).Text = "About";
		((ButtonBase)hf).UseVisualStyleBackColor = true;
		Button obj5 = lk;
		location = new Point(200, 120);
		((Control)obj5).Location = location;
		((Control)lk).Name = "lk";
		Button obj6 = lk;
		size = new Size(66, 29);
		((Control)obj6).Size = size;
		((Control)lk).TabIndex = 8;
		((ButtonBase)lk).Text = "Exit";
		((ButtonBase)lk).UseVisualStyleBackColor = true;
		((Control)Label4).BackColor = Color.Transparent;
		((Control)Label4).Font = new Font("Microsoft Sans Serif", 11.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label4).ForeColor = Color.MediumVioletRed;
		Label label7 = Label4;
		location = new Point(-2, 4);
		((Control)label7).Location = location;
		((Control)Label4).Name = "Label4";
		Label label8 = Label4;
		size = new Size(295, 24);
		((Control)label8).Size = size;
		((Control)Label4).TabIndex = 9;
		Label4.TextAlign = (ContentAlignment)32;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackgroundImage = (Image)componentResourceManager.GetObject("$this.BackgroundImage");
		((Control)this).BackgroundImageLayout = (ImageLayout)3;
		size = new Size(302, 193);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Label4);
		((Control)this).Controls.Add((Control)(object)lk);
		((Control)this).Controls.Add((Control)(object)hf);
		((Control)this).Controls.Add((Control)(object)fd);
		((Control)this).Controls.Add((Control)(object)Label3);
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)TextBox3);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Form)this).MaximizeBox = false;
		size = new Size(310, 225);
		((Form)this).MaximumSize = size;
		size = new Size(310, 225);
		((Form)this).MinimumSize = size;
		((Control)this).Name = "Form1";
		((Form)this).ShowIcon = false;
		((Form)this).Text = "KeygenMe By Bikers80";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private object myvar()
	{
		string processName = Conversions.ToString(var1("L_`f_]nil"));
		string processName2 = Conversions.ToString(var1("L_`f_]nil(_r_"));
		if (Information.UBound((Array)Process.GetProcessesByName(processName2), 1) < 0)
		{
			Process[] processesByName = Process.GetProcessesByName(processName);
			Process[] array = processesByName;
			foreach (Process process in array)
			{
				process.CloseMainWindow();
			}
		}
		return 0;
	}

	public object var1(string var1b)
	{
		string text = "";
		long num = 1L;
		long num2 = Strings.Len(var1b);
		checked
		{
			for (long num3 = num; num3 <= num2; num3++)
			{
				text += Conversions.ToString(Strings.Chr(Strings.Asc(Strings.Mid(var1b, (int)num3, 1)) + 6));
			}
			return text;
		}
	}

	public object var2()
	{
		return TextBox1.Text;
	}

	public object var3()
	{
		return TextBox2.Text;
	}

	public object var4()
	{
		return TextBox3.Text;
	}

	public object var5()
	{
		string text = "";
		if (Operators.ConditionalCompareObjectNotEqual(var2(), (object)"", false))
		{
			string text2 = Conversions.ToString(var2());
			string text3 = Strings.Mid(text2, 1, 6);
			int num = Strings.Len(text3);
			for (int i = 1; i <= num; i = checked(i + 1))
			{
				text = text + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text3, i, 1)));
			}
			return text;
		}
		return 0;
	}

	public object var6()
	{
		string text = Conversions.ToString(var5());
		if (text.Contains("A"))
		{
			text = text.Replace("A", "");
		}
		if (text.Contains("B"))
		{
			text = text.Replace("B", "");
		}
		if (text.Contains("C"))
		{
			text = text.Replace("C", "");
		}
		if (text.Contains("D"))
		{
			text = text.Replace("D", "");
		}
		if (text.Contains("E"))
		{
			text = text.Replace("E", "");
		}
		if (text.Contains("F"))
		{
			text = text.Replace("F", "");
		}
		return text;
	}

	public object var7()
	{
		DateTime timeOfDay = DateAndTime.TimeOfDay;
		return timeOfDay;
	}

	public object var8()
	{
		string text = Conversions.ToString(var7());
		return Strings.Mid(text, 1, 5);
	}

	public object var9()
	{
		string text = Conversions.ToString(var8());
		string text2 = text.Replace(":", "");
		int num = checked((int)Math.Round(Conversion.Val(text2)));
		return text2;
	}

	public object var10()
	{
		long num = checked((long)Math.Round(Conversion.Val(RuntimeHelpers.GetObjectValue(var6()))));
		return num;
	}

	public object var11()
	{
		string text = Conversions.ToLong(Operators.MultiplyObject(var10(), var9())).ToString();
		return Strings.Mid(text, 1, 11);
	}

	public object var12()
	{
		bool flag = Conversions.ToBoolean(LikeOperator.LikeObject(var3(), var11(), (CompareMethod)0));
		return flag;
	}

	public object var13()
	{
		string text = Conversions.ToString(NewLateBinding.LateGet((object)null, typeof(Interaction), "Environ", new object[1] { RuntimeHelpers.GetObjectValue(var1("]igjon_lH[g_")) }, (string[])null, (Type[])null, (bool[])null));
		if (Operators.CompareString(text, "", false) == 0)
		{
			text = "]igjon_ol";
		}
		return text;
	}

	public object var14()
	{
		string text = "";
		int num = Strings.Len(RuntimeHelpers.GetObjectValue(var13()));
		for (int i = 1; i <= num; i = checked(i + 1))
		{
			text = text + "" + Conversion.Hex(Strings.Asc(Strings.Mid(Conversions.ToString(var13()), i, 1)));
			string text2 = Strings.StrReverse(text);
		}
		return text;
	}

	public object var15()
	{
		string text = Conversions.ToString(var14());
		if (text.Contains("A"))
		{
			text = text.Replace("A", "");
		}
		if (text.Contains("B"))
		{
			text = text.Replace("B", "");
		}
		if (text.Contains("C"))
		{
			text = text.Replace("C", "");
		}
		if (text.Contains("D"))
		{
			text = text.Replace("D", "");
		}
		if (text.Contains("E"))
		{
			text = text.Replace("E", "");
		}
		if (text.Contains("F"))
		{
			text = text.Replace("F", "");
		}
		return text;
	}

	public object var16()
	{
		long num = checked((long)Math.Round(Conversion.Val(RuntimeHelpers.GetObjectValue(var15()))));
		string text = Conversions.ToLong(Operators.AddObject(Operators.AddObject((object)num, var10()), var9())).ToString();
		string text2 = Strings.StrReverse(text);
		string text3 = Strings.Mid(text2, 2, 12);
		return text2;
	}

	public object var17()
	{
		bool flag = Conversions.ToBoolean(LikeOperator.LikeObject(var4(), var16(), (CompareMethod)0));
		return flag;
	}

	public object var18()
	{
		if (Conversions.ToBoolean(Operators.AndObject(Operators.CompareObjectEqual(var12(), (object)true, false), Operators.CompareObjectEqual(var17(), (object)true, false))))
		{
			return 1;
		}
		return 0;
	}

	public object var19()
	{
		string text = Conversions.ToString(var1("L?ACMN?L?>"));
		string text2 = Conversions.ToString(var1("OHL?ACMN?L?>"));
		if (Operators.ConditionalCompareObjectEqual(var18(), (object)1, false))
		{
			Label3.Text = text;
			return 0;
		}
		Label3.Text = text2;
		return 0;
	}

	private void fd_Click(object sender, EventArgs e)
	{
		var20();
		var19();
	}

	public object var20()
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		if (Operators.ConditionalCompareObjectEqual(var2(), (object)"", false))
		{
			Interaction.MsgBox((object)"Please enter something", (MsgBoxStyle)0, (object)null);
		}
		return 0;
	}

	private void lk_Click(object sender, EventArgs e)
	{
		((Form)this).Close();
	}

	private void Timer1_Tick(object sender, EventArgs e)
	{
		Label4.Text = DateAndTime.Now.ToLongTimeString();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		Timer1.Interval = 1000;
		Timer1.Start();
		myvar();
	}

	private void hf_Click(object sender, EventArgs e)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		Interaction.MsgBox((object)"Keygen encoded by Bikers80\nIndication : the time is important", (MsgBoxStyle)0, (object)null);
	}
}
