using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace KrakkRSR;

public class Form1 : Form
{
	private string krakkey = "2968723465784783";

	private IContainer components = null;

	private TextBox textBox1;

	private Button button1;

	public Form1()
	{
		InitializeComponent();
	}

	private void textBox1_TextChanged(object sender, EventArgs e)
	{
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		if (((Control)textBox1).Text == krakkey)
		{
			MessageBox.Show("Product activated");
		}
		else
		{
			MessageBox.Show("Incorrect serial number");
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
		textBox1 = new TextBox();
		button1 = new Button();
		((Control)this).SuspendLayout();
		((Control)textBox1).Location = new Point(37, 27);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(385, 20);
		((Control)textBox1).TabIndex = 0;
		((Control)textBox1).TextChanged += textBox1_TextChanged;
		((Control)button1).Location = new Point(315, 53);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(75, 23);
		((Control)button1).TabIndex = 1;
		((Control)button1).Text = "Enter";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(463, 87);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Name = "Form1";
		((Control)this).Text = "Form1";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
