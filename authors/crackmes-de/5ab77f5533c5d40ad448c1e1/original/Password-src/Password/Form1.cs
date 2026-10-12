using System;
using System.Collections;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;
using Password.My;

namespace Password;

[DesignerGenerated]
public class Form1 : Form
{
	private static ArrayList __ENCList = new ArrayList();

	private IContainer components;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

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

	[DebuggerNonUserCode]
	public Form1()
	{
		__ENCList.Add(new WeakReference(this));
		InitializeComponent();
	}

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		if ((disposing && components != null) ? true : false)
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
		Label1 = new Label();
		TextBox1 = new TextBox();
		Button1 = new Button();
		((Control)this).SuspendLayout();
		Label1.AutoSize = true;
		Label label = Label1;
		Point location = new Point(13, 13);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		Size size = new Size(33, 13);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 0;
		Label1.Text = "Serial";
		TextBox textBox = TextBox1;
		location = new Point(16, 29);
		((Control)textBox).Location = location;
		((TextBoxBase)TextBox1).MaxLength = 5;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		size = new Size(100, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 1;
		Button button = Button1;
		location = new Point(16, 55);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		size = new Size(58, 23);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 2;
		((ButtonBase)Button1).Text = "Check It";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		size = new Size(191, 84);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Name = "Form1";
		((Form)this).Text = "Serial Checker";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		((ServerComputer)MyProject.Computer).FileSystem.WriteAllText("C:\\Real.txt", "11223", false);
		((ServerComputer)MyProject.Computer).FileSystem.WriteAllText("C:\\This.txt", TextBox1.Text, false);
		if (Conversions.ToDouble(TextBox1.Text) == 11223.0)
		{
			Interaction.MsgBox((object)"Congrats You Did It!!", (MsgBoxStyle)64, (object)"Test");
		}
		else
		{
			Interaction.MsgBox((object)"Try Again", (MsgBoxStyle)64, (object)"Test");
		}
	}
}
