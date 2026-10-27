using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace CrackMe;

public class Form1 : Form
{
	private bool isTrial;

	private IContainer components;

	private Label label1;

	private Label label2;

	public Form1(bool isTrial)
	{
		InitializeComponent();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		((Control)label1).Hide();
		((Control)label2).Hide();
		if (isTrial)
		{
			((Control)label1).Show();
		}
		else
		{
			((Control)label2).Show();
		}
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
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Expected O, but got Unknown
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Expected O, but got Unknown
		label1 = new Label();
		label2 = new Label();
		((Control)this).SuspendLayout();
		label1.AutoEllipsis = true;
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 9);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(218, 39);
		((Control)label1).TabIndex = 0;
		((Control)label1).Text = "Congratulations\r\n\r\nYou have sucessfully Cracked this Crack Me";
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(12, 9);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(170, 39);
		((Control)label2).TabIndex = 1;
		((Control)label2).Text = "Sorry\r\n\r\nThis Crack Me is still in Trial Mode.";
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(250, 57);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)label1);
		((Form)this).MaximizeBox = false;
		((Form)this).MinimizeBox = false;
		((Control)this).Name = "Form1";
		((Form)this).ShowIcon = false;
		((Form)this).ShowInTaskbar = false;
		((Control)this).Text = "Crack Me - Jammmie999";
		((Form)this).Load += Form1_Load;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
