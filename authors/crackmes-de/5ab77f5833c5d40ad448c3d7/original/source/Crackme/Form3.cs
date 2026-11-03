using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Crackme.My;
using Crackme.My.Resources;
using Microsoft.VisualBasic.CompilerServices;

namespace Crackme;

[DesignerGenerated]
public class Form3 : Form
{
	private IContainer components;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Timer1")]
	private Timer _Timer1;

	[AccessedThroughProperty("C1")]
	private CheckBox _C1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Timer2")]
	private Timer _Timer2;

	private string c;

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

	internal virtual CheckBox C1
	{
		[DebuggerNonUserCode]
		get
		{
			return _C1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = C1_CheckedChanged;
			if (_C1 != null)
			{
				_C1.CheckedChanged -= eventHandler;
			}
			_C1 = value;
			if (_C1 != null)
			{
				_C1.CheckedChanged += eventHandler;
			}
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

	internal virtual Timer Timer2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Timer2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Timer2_Tick_1;
			if (_Timer2 != null)
			{
				_Timer2.Tick -= eventHandler;
			}
			_Timer2 = value;
			if (_Timer2 != null)
			{
				_Timer2.Tick += eventHandler;
			}
		}
	}

	public Form3()
	{
		((Form)this).Load += Form3_Load;
		c = Conversions.ToString(10);
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
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Expected O, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Expected O, but got Unknown
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Expected O, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		//IL_0083: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Expected O, but got Unknown
		//IL_01b2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bc: Expected O, but got Unknown
		components = new Container();
		Label1 = new Label();
		Timer1 = new Timer(components);
		C1 = new CheckBox();
		Label2 = new Label();
		Timer2 = new Timer(components);
		((Control)this).SuspendLayout();
		Label1.AutoSize = true;
		((Control)Label1).BackColor = Color.Transparent;
		((Control)Label1).Font = new Font("Lucida Sans Unicode", 12f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label1).ForeColor = Color.Red;
		Label label = Label1;
		Point location = new Point(89, 109);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		Size size = new Size(111, 40);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 0;
		Label1.Text = "I am a nag\r\nRemove me\r\n";
		Timer1.Enabled = true;
		Timer1.Interval = 12000;
		((ButtonBase)C1).AutoSize = true;
		CheckBox c = C1;
		location = new Point(2, 5);
		((Control)c).Location = location;
		((Control)C1).Name = "C1";
		CheckBox c2 = C1;
		size = new Size(81, 17);
		((Control)c2).Size = size;
		((Control)C1).TabIndex = 1;
		((ButtonBase)C1).Text = "CheckBox1";
		((ButtonBase)C1).UseVisualStyleBackColor = true;
		((Control)C1).Visible = false;
		((Control)Label2).BackColor = Color.Transparent;
		((Control)Label2).Font = new Font("Microsoft Sans Serif", 12f, (FontStyle)1, (GraphicsUnit)3, (byte)0);
		((Control)Label2).ForeColor = Color.Red;
		Label label3 = Label2;
		location = new Point(1, 233);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(293, 35);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 2;
		Label2.TextAlign = (ContentAlignment)32;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).BackColor = SystemColors.ActiveCaption;
		((Control)this).BackgroundImage = (Image)(object)Resources.fond2;
		((Control)this).BackgroundImageLayout = (ImageLayout)3;
		size = new Size(292, 268);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)C1);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Form)this).FormBorderStyle = (FormBorderStyle)0;
		((Control)this).Name = "Form3";
		((Form)this).Text = "Form3";
		((Form)this).TopMost = true;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Timer1_Tick(object sender, EventArgs e)
	{
		C1.Checked = true;
	}

	private void C1_CheckedChanged(object sender, EventArgs e)
	{
		((Form)MyProject.Forms.MainForm).Opacity = 100.0;
		((Form)this).Close();
	}

	private void Timer2_Tick(object sender, EventArgs e)
	{
		string text = Conversions.ToString(10);
		Label2.Text = text;
		text = Conversions.ToString(Conversions.ToDouble(text) - 1.0);
		((Control)Label2).Refresh();
	}

	private void Form3_Load(object sender, EventArgs e)
	{
		Timer2.Interval = 1000;
		Timer2.Start();
	}

	private void Timer2_Tick_1(object sender, EventArgs e)
	{
		Label2.Text = c;
		c = Conversions.ToString(Conversions.ToDouble(c) - 1.0);
		if (Conversions.ToDouble(c) == -1.0)
		{
			Timer2.Stop();
		}
	}
}
