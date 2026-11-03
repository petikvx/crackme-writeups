using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Crackme.My;
using Crackme.My.Resources;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;

namespace Crackme;

[DesignerGenerated]
public class MainForm : Form
{
	private IContainer components;

	[AccessedThroughProperty("CheckBox1")]
	private CheckBox _CheckBox1;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("GroupBox1")]
	private GroupBox _GroupBox1;

	[AccessedThroughProperty("GroupBox2")]
	private GroupBox _GroupBox2;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

	[AccessedThroughProperty("Button3")]
	private Button _Button3;

	private long td;

	private long sl;

	private const long mi = 6L;

	private const long dv = 3L;

	private const int TextTimerInterval = 15;

	protected int currentGradientShift;

	protected int gradiantStep;

	internal virtual CheckBox CheckBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _CheckBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_CheckBox1 = value;
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

	internal virtual GroupBox GroupBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _GroupBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_GroupBox1 = value;
		}
	}

	internal virtual GroupBox GroupBox2
	{
		[DebuggerNonUserCode]
		get
		{
			return _GroupBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_GroupBox2 = value;
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

	public MainForm()
	{
		((Form)this).Load += MainForm_Load;
		td = 0L;
		sl = 0L;
		currentGradientShift = 20;
		gradiantStep = 20;
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
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Expected O, but got Unknown
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Expected O, but got Unknown
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Expected O, but got Unknown
		//IL_0228: Unknown result type (might be due to invalid IL or missing references)
		//IL_0232: Expected O, but got Unknown
		//IL_02e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ee: Expected O, but got Unknown
		components = new Container();
		CheckBox1 = new CheckBox();
		TextBox1 = new TextBox();
		TextBox2 = new TextBox();
		GroupBox1 = new GroupBox();
		GroupBox2 = new GroupBox();
		Button1 = new Button();
		Button2 = new Button();
		Button3 = new Button();
		Timer val = new Timer(components);
		((Control)GroupBox1).SuspendLayout();
		((Control)GroupBox2).SuspendLayout();
		((Control)this).SuspendLayout();
		val.Enabled = true;
		val.Tick += animtime_Tick;
		((ButtonBase)CheckBox1).AutoSize = true;
		CheckBox1.Checked = true;
		CheckBox1.CheckState = (CheckState)1;
		CheckBox checkBox = CheckBox1;
		Point location = new Point(548, 0);
		((Control)checkBox).Location = location;
		((Control)CheckBox1).Name = "CheckBox1";
		CheckBox checkBox2 = CheckBox1;
		Size size = new Size(15, 14);
		((Control)checkBox2).Size = size;
		((Control)CheckBox1).TabIndex = 2;
		((ButtonBase)CheckBox1).UseVisualStyleBackColor = true;
		((Control)CheckBox1).Visible = false;
		((TextBoxBase)TextBox1).BackColor = Color.White;
		TextBox textBox = TextBox1;
		location = new Point(15, 19);
		((Control)textBox).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		size = new Size(211, 21);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 3;
		TextBox1.TextAlign = (HorizontalAlignment)2;
		TextBox textBox3 = TextBox2;
		location = new Point(12, 19);
		((Control)textBox3).Location = location;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(211, 22);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 4;
		TextBox2.TextAlign = (HorizontalAlignment)2;
		((Control)GroupBox1).BackColor = Color.Transparent;
		((Control)GroupBox1).Controls.Add((Control)(object)TextBox1);
		((Control)GroupBox1).Font = new Font("Microsoft Sans Serif", 9f, (FontStyle)3, (GraphicsUnit)3, (byte)0);
		((Control)GroupBox1).ForeColor = Color.White;
		GroupBox groupBox = GroupBox1;
		location = new Point(38, 58);
		((Control)groupBox).Location = location;
		((Control)GroupBox1).Name = "GroupBox1";
		GroupBox groupBox2 = GroupBox1;
		size = new Size(237, 53);
		((Control)groupBox2).Size = size;
		((Control)GroupBox1).TabIndex = 5;
		GroupBox1.TabStop = false;
		GroupBox1.Text = "Name";
		((Control)GroupBox2).BackColor = Color.Transparent;
		((Control)GroupBox2).Controls.Add((Control)(object)TextBox2);
		((Control)GroupBox2).Font = new Font("Microsoft Sans Serif", 9.75f, (FontStyle)3, (GraphicsUnit)3, (byte)0);
		((Control)GroupBox2).ForeColor = Color.White;
		GroupBox groupBox3 = GroupBox2;
		location = new Point(41, 124);
		((Control)groupBox3).Location = location;
		((Control)GroupBox2).Name = "GroupBox2";
		GroupBox groupBox4 = GroupBox2;
		size = new Size(233, 53);
		((Control)groupBox4).Size = size;
		((Control)GroupBox2).TabIndex = 6;
		GroupBox2.TabStop = false;
		GroupBox2.Text = "Sérial";
		((ButtonBase)Button1).FlatStyle = (FlatStyle)1;
		((ButtonBase)Button1).Image = (Image)(object)Resources.ok2;
		Button button = Button1;
		location = new Point(41, 192);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		size = new Size(60, 25);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 7;
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		((ButtonBase)Button2).FlatStyle = (FlatStyle)1;
		((ButtonBase)Button2).Image = (Image)(object)Resources.about1;
		Button button3 = Button2;
		location = new Point(126, 192);
		((Control)button3).Location = location;
		((Control)Button2).Name = "Button2";
		Button button4 = Button2;
		size = new Size(60, 25);
		((Control)button4).Size = size;
		((Control)Button2).TabIndex = 8;
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		((Control)Button3).BackgroundImage = (Image)(object)Resources.exit2;
		((ButtonBase)Button3).FlatStyle = (FlatStyle)1;
		Button button5 = Button3;
		location = new Point(204, 192);
		((Control)button5).Location = location;
		((Control)Button3).Name = "Button3";
		Button button6 = Button3;
		size = new Size(60, 25);
		((Control)button6).Size = size;
		((Control)Button3).TabIndex = 9;
		((ButtonBase)Button3).UseVisualStyleBackColor = true;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).BackColor = SystemColors.ActiveCaption;
		((Control)this).BackgroundImage = (Image)(object)Resources.fond1;
		((Control)this).BackgroundImageLayout = (ImageLayout)0;
		size = new Size(307, 229);
		((Form)this).ClientSize = size;
		((Form)this).ControlBox = false;
		((Control)this).Controls.Add((Control)(object)Button3);
		((Control)this).Controls.Add((Control)(object)Button2);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Controls.Add((Control)(object)GroupBox2);
		((Control)this).Controls.Add((Control)(object)GroupBox1);
		((Control)this).Controls.Add((Control)(object)CheckBox1);
		((Control)this).DoubleBuffered = true;
		size = new Size(315, 261);
		((Form)this).MaximumSize = size;
		((Form)this).MinimizeBox = false;
		size = new Size(315, 261);
		((Form)this).MinimumSize = size;
		((Control)this).Name = "MainForm";
		((Form)this).ShowIcon = false;
		((Form)this).ShowInTaskbar = false;
		((Form)this).Text = "NewKeygenMe  by Bikers80";
		((Control)GroupBox1).ResumeLayout(false);
		((Control)GroupBox1).PerformLayout();
		((Control)GroupBox2).ResumeLayout(false);
		((Control)GroupBox2).PerformLayout();
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public object sd()
	{
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		sl = 0L;
		object text = TextBox1.Text;
		if (Operators.ConditionalCompareObjectEqual(text, (object)"", false))
		{
			if (sl == 0)
			{
				MessageBox.Show("Please enter a name", "Error", (MessageBoxButtons)0, (MessageBoxIcon)16);
				sl = 1L;
				return 0;
			}
			return text;
		}
		text = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(text, (Type)null, "ToUpper", new object[0], (string[])null, (Type[])null, (bool[])null));
		sl = 0L;
		return text;
	}

	public object ld()
	{
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		object text = TextBox2.Text;
		if (Operators.ConditionalCompareObjectEqual(text, (object)"", false))
		{
			if (sl == 0)
			{
				MessageBox.Show("Please enter a sérial", "Error", (MessageBoxButtons)0, (MessageBoxIcon)16);
				sl = 1L;
				return "0";
			}
			return text;
		}
		sl = 0L;
		return text;
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		Module2.clo();
		tst();
	}

	private void animtime_Tick(object sender, EventArgs e)
	{
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Expected O, but got Unknown
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Expected O, but got Unknown
		//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Expected O, but got Unknown
		string text = ((td != 0) ? "registered" : "Unregistered");
		Graphics val = ((Control)this).CreateGraphics();
		Font val2 = new Font("Microsoft Sans Serif", 26f, (FontStyle)1, (GraphicsUnit)3);
		string text2 = text;
		SizeF sizeF = new SizeF(val.MeasureString(text2, val2));
		PointF pointF = new PointF(((float)((Form)this).ClientSize.Width - sizeF.Width) / 2f, 15f);
		PointF pointF2 = new PointF(10f, 6f);
		PointF pointF3 = new PointF(currentGradientShift, 10f);
		if (td > 0)
		{
			LinearGradientBrush val3 = new LinearGradientBrush(pointF2, pointF3, Color.Goldenrod, Color.LightYellow);
			val.DrawString(text2, val2, (Brush)(object)val3, pointF);
			val.Dispose();
		}
		else
		{
			LinearGradientBrush val4 = new LinearGradientBrush(pointF2, pointF3, Color.Red, Color.Navy);
			val.DrawString(text2, val2, (Brush)(object)val4, pointF);
			val.Dispose();
		}
		checked
		{
			currentGradientShift += gradiantStep;
			if (currentGradientShift == 500)
			{
				gradiantStep = -10;
			}
			else if (currentGradientShift == -50)
			{
				gradiantStep = 5;
			}
		}
	}

	public object var8()
	{
		long num = Conversions.ToLong(Module2.var5());
		long num2 = Conversions.ToLong(var7());
		checked
		{
			long num3 = (long)Math.Round(Conversion.Val((object)(num * 6)));
			long num4 = (long)Math.Round(Conversion.Val((object)((double)num2 / 3.0)));
			long num5 = num3 + num4;
			return num5;
		}
	}

	public object var7()
	{
		string text = Conversions.ToString(sd());
		string text2 = "";
		if (Operators.CompareString(text, "", false) == 0)
		{
			return 0;
		}
		text2 = Conversions.ToString(Module1.var(text));
		text2 = Conversions.ToString(Module1.var1(text2));
		text2 = Conversions.ToString(Module1.var2(text2));
		text2 = Conversions.ToString(Module2.var6(text2));
		return Conversions.ToString(Module2.var10(text2));
	}

	private void Button3_Click(object sender, EventArgs e)
	{
		((Form)this).Close();
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		((Control)this).Hide();
		((Control)MyProject.Forms.Form2).Show();
	}

	public object tst()
	{
		UnmanagedMemoryStream good = Resources.Good;
		UnmanagedMemoryStream bad = Resources.bad;
		if (Conversions.ToBoolean(LikeOperator.LikeObject(var8(), ld(), (CompareMethod)0)))
		{
			td = 1L;
			((Computer)MyProject.Computer).Audio.Play((Stream)good, (AudioPlayMode)1);
			((Control)this).Refresh();
			return td;
		}
		td = 0L;
		if (sl == 0)
		{
			((Computer)MyProject.Computer).Audio.Play((Stream)bad, (AudioPlayMode)1);
		}
		((Control)this).Refresh();
		return td;
	}

	private void MainForm_Load(object sender, EventArgs e)
	{
		Module2.clo();
		((Form)this).Opacity = 0.0;
		((Control)MyProject.Forms.Form3).Show();
	}
}
