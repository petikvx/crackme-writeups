using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace KRAKK_v._10_SHA_1_edition;

public class Form2 : Form
{
	private IContainer components;

	private Button button1;

	public Form2()
	{
		InitializeComponent();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		Process.Start("http://crackmes.de/users/CrackR");
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
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Expected O, but got Unknown
		button1 = new Button();
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(-1, -1);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(492, 255);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "CrackR";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(487, 251);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).Name = "Form2";
		((Control)this).Text = "Form2";
		((Control)this).ResumeLayout(false);
	}
}
