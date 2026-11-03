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

	[AccessedThroughProperty("TextBox4")]
	private TextBox _TextBox4;

	[AccessedThroughProperty("TextBox5")]
	private TextBox _TextBox5;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

	[AccessedThroughProperty("Button3")]
	private Button _Button3;

	[AccessedThroughProperty("Label3")]
	private Label _Label3;

	private int g;

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

	internal virtual TextBox TextBox4
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox4;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox4 = value;
		}
	}

	internal virtual TextBox TextBox5
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox5;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox5 = value;
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
			EventHandler eventHandler = Label3_TextAlignChanged;
			EventHandler eventHandler2 = Label3_TextChanged;
			if (_Label3 != null)
			{
				_Label3.TextAlignChanged -= eventHandler;
				((Control)_Label3).TextChanged -= eventHandler2;
			}
			_Label3 = value;
			if (_Label3 != null)
			{
				_Label3.TextAlignChanged += eventHandler;
				((Control)_Label3).TextChanged += eventHandler2;
			}
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
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected O, but got Unknown
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
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Expected O, but got Unknown
		//IL_0283: Unknown result type (might be due to invalid IL or missing references)
		//IL_028d: Expected O, but got Unknown
		//IL_0326: Unknown result type (might be due to invalid IL or missing references)
		//IL_0330: Expected O, but got Unknown
		//IL_0502: Unknown result type (might be due to invalid IL or missing references)
		//IL_050c: Expected O, but got Unknown
		//IL_05a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_05af: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		TextBox1 = new TextBox();
		TextBox2 = new TextBox();
		TextBox3 = new TextBox();
		TextBox4 = new TextBox();
		TextBox5 = new TextBox();
		Label1 = new Label();
		Label2 = new Label();
		Button1 = new Button();
		Button2 = new Button();
		Button3 = new Button();
		Label3 = new Label();
		((Control)this).SuspendLayout();
		((Control)TextBox1).Enabled = false;
		TextBox textBox = TextBox1;
		Point location = new Point(68, 21);
		((Control)textBox).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		Size size = new Size(241, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 0;
		TextBox1.TextAlign = (HorizontalAlignment)2;
		TextBox textBox3 = TextBox2;
		location = new Point(68, 63);
		((Control)textBox3).Location = location;
		((TextBoxBase)TextBox2).MaxLength = 5;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(44, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 1;
		TextBox textBox5 = TextBox3;
		location = new Point(118, 63);
		((Control)textBox5).Location = location;
		((TextBoxBase)TextBox3).MaxLength = 10;
		((Control)TextBox3).Name = "TextBox3";
		TextBox textBox6 = TextBox3;
		size = new Size(70, 20);
		((Control)textBox6).Size = size;
		((Control)TextBox3).TabIndex = 2;
		TextBox textBox7 = TextBox4;
		location = new Point(194, 63);
		((Control)textBox7).Location = location;
		((TextBoxBase)TextBox4).MaxLength = 10;
		((Control)TextBox4).Name = "TextBox4";
		TextBox textBox8 = TextBox4;
		size = new Size(67, 20);
		((Control)textBox8).Size = size;
		((Control)TextBox4).TabIndex = 3;
		TextBox textBox9 = TextBox5;
		location = new Point(265, 63);
		((Control)textBox9).Location = location;
		((TextBoxBase)TextBox5).MaxLength = 6;
		((Control)TextBox5).Name = "TextBox5";
		TextBox textBox10 = TextBox5;
		size = new Size(44, 20);
		((Control)textBox10).Size = size;
		((Control)TextBox5).TabIndex = 4;
		Label1.AutoSize = true;
		((Control)Label1).BackColor = Color.Transparent;
		((Control)Label1).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label1).ForeColor = Color.Red;
		Label label = Label1;
		location = new Point(12, 28);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(39, 13);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 5;
		Label1.Text = "Name";
		Label2.AutoSize = true;
		((Control)Label2).BackColor = Color.Transparent;
		((Control)Label2).Font = new Font("Microsoft Sans Serif", 8.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label2).ForeColor = Color.Red;
		Label label3 = Label2;
		location = new Point(12, 70);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(39, 13);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 6;
		Label2.Text = "Sérial";
		((Control)Button1).Enabled = false;
		Button button = Button1;
		location = new Point(68, 101);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		size = new Size(75, 35);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 7;
		((ButtonBase)Button1).Text = "Validez";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		Button button3 = Button2;
		location = new Point(230, 101);
		((Control)button3).Location = location;
		((Control)Button2).Name = "Button2";
		Button button4 = Button2;
		size = new Size(73, 35);
		((Control)button4).Size = size;
		((Control)Button2).TabIndex = 8;
		((ButtonBase)Button2).Text = "Exit";
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		Button button5 = Button3;
		location = new Point(149, 101);
		((Control)button5).Location = location;
		((Control)Button3).Name = "Button3";
		Button button6 = Button3;
		size = new Size(75, 35);
		((Control)button6).Size = size;
		((Control)Button3).TabIndex = 10;
		((ButtonBase)Button3).Text = "Effacer";
		((ButtonBase)Button3).UseVisualStyleBackColor = true;
		((Control)Label3).BackColor = Color.Transparent;
		((Control)Label3).Font = new Font("Microsoft Sans Serif", 20.25f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label3).ForeColor = Color.Red;
		Label label5 = Label3;
		location = new Point(16, 148);
		((Control)label5).Location = location;
		((Control)Label3).Name = "Label3";
		Label label6 = Label3;
		size = new Size(300, 31);
		((Control)label6).Size = size;
		((Control)Label3).TabIndex = 11;
		Label3.TextAlign = (ContentAlignment)32;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackgroundImage = (Image)componentResourceManager.GetObject("$this.BackgroundImage");
		size = new Size(328, 188);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Label3);
		((Control)this).Controls.Add((Control)(object)Button3);
		((Control)this).Controls.Add((Control)(object)Button2);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)TextBox5);
		((Control)this).Controls.Add((Control)(object)TextBox4);
		((Control)this).Controls.Add((Control)(object)TextBox3);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Form)this).MaximizeBox = false;
		((Form)this).MinimizeBox = false;
		((Control)this).Name = "Form1";
		((Form)this).ShowIcon = false;
		((Form)this).Text = "KeygenME BY THE BIKERS80";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		string text = Interaction.Environ("ComputerName");
		int num = Strings.Len(text);
		checked
		{
			string text2 = default(string);
			string text3 = default(string);
			string text5 = default(string);
			string text7 = default(string);
			string text10 = default(string);
			string text12 = default(string);
			string text14 = default(string);
			string text15 = default(string);
			for (int i = 1; i <= num; i++)
			{
				text2 = text2 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text, i, 1)));
				text3 = Strings.Mid(text2, 1, 5);
				string text4 = TextBox1.Text;
				int num2 = Strings.Len(text4);
				for (int j = 1; j <= num2; j++)
				{
					text5 = text5 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text4, j, 1)));
					string text6 = Strings.StrReverse(text5);
					text7 = Strings.Mid(text6, 3, 10);
					string text8 = Strings.StrReverse(text);
					string text9 = Strings.StrReverse(text4);
					text10 = text10 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text8, i, 1)));
					string text11 = Strings.Mid(text10, 1, 5);
					text12 = text12 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text9, j, 1)));
					string text13 = Strings.Mid(text12, 5, 5);
					text14 = text13 + text11;
					double num3 = Conversion.Val(TextBox1.Text);
					text15 = Conversions.ToString(Conversion.Int((double)(Conversion.Int(TextBox1.Text.Length) * 68 + 401016)));
				}
			}
			if (Operators.CompareString(TextBox2.Text, "", false) == 0)
			{
				TextBox2.Text = " ";
				Label3.Text = "Veuillez entrer votre nom";
			}
			if (Operators.CompareString(TextBox3.Text, "", false) == 0)
			{
				TextBox3.Text = " ";
				Label3.Text = "Veuillez entrer votre nom";
			}
			if (Operators.CompareString(TextBox4.Text, "", false) == 0)
			{
				TextBox4.Text = " ";
				Label3.Text = "Veuillez entrer votre nom";
			}
			if (Operators.CompareString(TextBox5.Text, "", false) == 0)
			{
				Label3.Text = " ";
				Label3.Text = "Veuillez entrer votre nom";
			}
			string text16 = TextBox2.Text;
			string text17 = TextBox3.Text;
			string text18 = TextBox4.Text;
			string text19 = TextBox5.Text;
			if ((Operators.CompareString(text16, text3, false) != 0) | (Operators.CompareString(text17, text7, false) != 0) | (Operators.CompareString(text18, text14, false) != 0) | (Operators.CompareString(text19, text15, false) != 0))
			{
				Label3.Text = "Essaye encore :|";
				TextBox1.Text = "";
			}
			else
			{
				Label3.Text = "Bravo :)!!!";
			}
		}
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		((Form)this).Close();
	}

	private void TextBox1_TextChanged(object sender, EventArgs e)
	{
		if (Operators.CompareString(TextBox1.Text, "", false) != 0)
		{
			((Control)Button1).Enabled = true;
		}
		if (Operators.CompareString(TextBox1.Text, "", false) == 0)
		{
			((Control)Button1).Enabled = false;
		}
		if (Operators.CompareString(TextBox1.Text, "", false) != 0)
		{
			Label3.Text = " ";
		}
		if (Operators.CompareString(TextBox1.Text, "", false) == 0)
		{
			TextBox2.Text = "";
			TextBox3.Text = "";
			TextBox4.Text = "";
			TextBox5.Text = "";
		}
	}

	private void Button3_Click(object sender, EventArgs e)
	{
		TextBox1.Text = "";
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		((Control)TextBox1).Enabled = true;
	}

	private void Label3_TextAlignChanged(object sender, EventArgs e)
	{
	}

	private void Label3_TextChanged(object sender, EventArgs e)
	{
		checked
		{
			if (Operators.CompareString(Label3.Text, "Essaye encore :|", false) == 0)
			{
				g++;
				if (g == 3)
				{
					((Control)TextBox1).Enabled = false;
					Label3.Text = "Désolé :(!!!!!";
				}
			}
		}
	}
}
