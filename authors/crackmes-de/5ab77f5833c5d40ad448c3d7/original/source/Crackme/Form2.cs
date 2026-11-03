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
public class Form2 : Form
{
	private IContainer components;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

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

	[DebuggerNonUserCode]
	public Form2()
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
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Expected O, but got Unknown
		Button1 = new Button();
		Label1 = new Label();
		((Control)this).SuspendLayout();
		((Control)Button1).BackgroundImage = (Image)(object)Resources.ok2;
		((Control)Button1).BackgroundImageLayout = (ImageLayout)3;
		((ButtonBase)Button1).FlatStyle = (FlatStyle)1;
		Button button = Button1;
		Point location = new Point(107, 312);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		Size size = new Size(69, 28);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 1;
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		((Control)Label1).Font = new Font("Microsoft Sans Serif", 9f, (FontStyle)0, (GraphicsUnit)3, (byte)0);
		((Control)Label1).ForeColor = SystemColors.ActiveCaptionText;
		Label label = Label1;
		location = new Point(2, 254);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(290, 55);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 2;
		Label1.Text = "                                Keygen by Bikers80\r\n                                   Remove the nag \r\n                       Find a sérial and create a Keygen\r\n";
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).BackColor = Color.Black;
		((Control)this).BackgroundImage = (Image)(object)Resources.fond1;
		((Control)this).BackgroundImageLayout = (ImageLayout)0;
		size = new Size(292, 336);
		((Form)this).ClientSize = size;
		((Form)this).ControlBox = false;
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)0;
		((Form)this).MinimizeBox = false;
		((Control)this).Name = "Form2";
		((Form)this).ShowInTaskbar = false;
		((Form)this).Text = "Form2";
		((Control)this).ResumeLayout(false);
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		((Control)MyProject.Forms.MainForm).Show();
		((Form)this).Close();
	}
}
