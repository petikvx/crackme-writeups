using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using WindowsApplication1.My.Resources;

namespace WindowsApplication1;

[DesignerGenerated]
public class Form1 : Form
{
	private IContainer components;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Label3")]
	private Label _Label3;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

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
			EventHandler eventHandler = TextBox1_TextChanged;
			if (_TextBox1 != null)
			{
				((Control)_TextBox1).TextChanged -= eventHandler;
			}
			_TextBox1 = value;
			if (_TextBox1 != null)
			{
				((Control)_TextBox1).TextChanged += eventHandler;
			}
		}
	}

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
			EventHandler eventHandler = TextBox2_TextChanged;
			if (_TextBox2 != null)
			{
				((Control)_TextBox2).TextChanged -= eventHandler;
			}
			_TextBox2 = value;
			if (_TextBox2 != null)
			{
				((Control)_TextBox2).TextChanged += eventHandler;
			}
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

	[DebuggerNonUserCode]
	public Form1()
	{
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
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Expected O, but got Unknown
		//IL_01b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01be: Expected O, but got Unknown
		//IL_0257: Unknown result type (might be due to invalid IL or missing references)
		//IL_0261: Expected O, but got Unknown
		//IL_02ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f4: Expected O, but got Unknown
		TextBox1 = new TextBox();
		Button1 = new Button();
		TextBox2 = new TextBox();
		Label1 = new Label();
		Label2 = new Label();
		Label3 = new Label();
		Button2 = new Button();
		((Control)this).SuspendLayout();
		TextBox textBox = TextBox1;
		Point location = new Point(58, 24);
		((Control)textBox).Location = location;
		((TextBoxBase)TextBox1).MaxLength = 60;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		Size size = new Size(194, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 0;
		TextBox1.TextAlign = (HorizontalAlignment)2;
		((Control)Button1).Enabled = false;
		Button button = Button1;
		location = new Point(86, 81);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		size = new Size(64, 25);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 1;
		((ButtonBase)Button1).Text = "Valider";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		TextBox textBox3 = TextBox2;
		location = new Point(60, 55);
		((Control)textBox3).Location = location;
		((TextBoxBase)TextBox2).MaxLength = 100;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(192, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 2;
		TextBox2.TextAlign = (HorizontalAlignment)2;
		((Control)Label1).BackColor = Color.Transparent;
		((Control)Label1).Font = new Font("Microsoft Sans Serif", 14.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label1).ForeColor = Color.Red;
		Label label = Label1;
		location = new Point(-2, 122);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(296, 24);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 3;
		Label1.TextAlign = (ContentAlignment)32;
		Label2.AutoSize = true;
		((Control)Label2).BackColor = Color.Transparent;
		((Control)Label2).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		Label label3 = Label2;
		location = new Point(12, 31);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(39, 13);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 4;
		Label2.Text = "Name";
		Label3.AutoSize = true;
		((Control)Label3).BackColor = Color.Transparent;
		((Control)Label3).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		Label label5 = Label3;
		location = new Point(12, 62);
		((Control)label5).Location = location;
		((Control)Label3).Name = "Label3";
		Label label6 = Label3;
		size = new Size(39, 13);
		((Control)label6).Size = size;
		((Control)Label3).TabIndex = 5;
		Label3.Text = "Sérial";
		Button button3 = Button2;
		location = new Point(166, 81);
		((Control)button3).Location = location;
		((Control)Button2).Name = "Button2";
		Button button4 = Button2;
		size = new Size(64, 25);
		((Control)button4).Size = size;
		((Control)Button2).TabIndex = 6;
		((ButtonBase)Button2).Text = "Exit";
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackgroundImage = (Image)(object)Resources.FOND;
		size = new Size(292, 153);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Button2);
		((Control)this).Controls.Add((Control)(object)Label3);
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Form)this).MaximizeBox = false;
		size = new Size(300, 185);
		((Form)this).MaximumSize = size;
		((Form)this).MinimizeBox = false;
		size = new Size(300, 185);
		((Form)this).MinimumSize = size;
		((Control)this).Name = "Form1";
		((Form)this).ShowIcon = false;
		((Form)this).Text = "KeygenMe 2 by bikers80";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public object DecodeASCII2(string strChaine)
	{
		long num = 1L;
		long num2 = Strings.Len(strChaine);
		checked
		{
			string text = default(string);
			for (long num3 = num; num3 <= num2; num3++)
			{
				text += Conversions.ToString(Strings.Chr(Strings.Asc(Strings.Mid(strChaine, (int)num3, 1)) + 3));
			}
			return text;
		}
	}

	public object var1()
	{
		string text = Conversions.ToString(DecodeASCII2("`ljmrqbok^jb"));
		return Interaction.Environ(text);
	}

	public object var2()
	{
		return Strings.StrReverse(Conversions.ToString(var1()));
	}

	public object var3()
	{
		return TextBox2.Text;
	}

	public object var4()
	{
		string text = Conversions.ToString(var2());
		int num = Strings.Len(text);
		string text2 = default(string);
		for (int i = 1; i <= num; i = checked(i + 1))
		{
			text2 = text2 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text, i, 1)));
		}
		return text2;
	}

	public object var5()
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		string text = TextBox1.Text;
		string text2 = Conversions.ToString(Strings.Len(text));
		if (Operators.CompareString(text2, "5", false) < 0)
		{
			Interaction.MsgBox((object)"Veuillez entrer 5 lettre minimum", (MsgBoxStyle)0, (object)null);
			TextBox1.Text = "";
			return text2;
		}
		return text;
	}

	public object var6()
	{
		string text = Conversions.ToString(var5());
		int num = Strings.Len(text);
		string text2 = default(string);
		for (int i = 1; i <= num; i = checked(i + 1))
		{
			text2 = text2 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text, i, 1)));
		}
		return text2;
	}

	public object var7()
	{
		string text = Conversions.ToString(var4());
		string text2 = Conversions.ToString(var6());
		return text + text2;
	}

	public object var8()
	{
		return Conversions.ToString(DecodeASCII2(Conversions.ToString(var7())));
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		Label1.Text = Conversions.ToString(var10());
	}

	public object var10()
	{
		string result = Conversions.ToString(DecodeASCII2("?o^sl\u001d7&"));
		string result2 = Conversions.ToString(DecodeASCII2("J^knræ\u001d7%"));
		if (Operators.ConditionalCompareObjectEqual(var3(), var11(), false))
		{
			return result;
		}
		return result2;
	}

	public object var11()
	{
		string text = Conversions.ToString(var8());
		return Strings.Mid(text, 5, 15);
	}

	private void TextBox1_TextChanged(object sender, EventArgs e)
	{
		((Control)Button1).Enabled = true;
		if (Operators.CompareString(TextBox1.Text, "", false) == 0)
		{
			TextBox2.Text = "";
			Label1.Text = "";
		}
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		((Form)this).Close();
	}

	private void TextBox2_TextChanged(object sender, EventArgs e)
	{
		Label1.Text = "";
	}
}
