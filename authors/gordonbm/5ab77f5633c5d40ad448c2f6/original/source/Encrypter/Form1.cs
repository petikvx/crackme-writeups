using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using Encrypter.Goodies;

namespace Encrypter;

public class Form1 : Form
{
	private Engine en = new Engine();

	private IContainer components = null;

	private Button button1;

	private Label label1;

	private TextBox textBox1;

	private Label label2;

	private TextBox textBox2;

	private CheckBox checkBox1;

	public Form1()
	{
		InitializeComponent();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		bool @checked = checkBox1.Checked;
		((Control)textBox2).Text = en.pump(((Control)textBox1).Text, @checked);
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
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected O, but got Unknown
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected O, but got Unknown
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected O, but got Unknown
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Expected O, but got Unknown
		button1 = new Button();
		label1 = new Label();
		textBox1 = new TextBox();
		label2 = new Label();
		textBox2 = new TextBox();
		checkBox1 = new CheckBox();
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(188, 6);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(99, 20);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Go";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 9);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(50, 13);
		((Control)label1).TabIndex = 1;
		((Control)label1).Text = "Message";
		((Control)textBox1).Location = new Point(68, 6);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(100, 20);
		((Control)textBox1).TabIndex = 2;
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(12, 35);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(55, 13);
		((Control)label2).TabIndex = 3;
		((Control)label2).Text = "Encrypted";
		((Control)textBox2).Location = new Point(68, 32);
		((TextBoxBase)textBox2).Multiline = true;
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(100, 116);
		((Control)textBox2).TabIndex = 4;
		((Control)checkBox1).AutoSize = true;
		((Control)checkBox1).Location = new Point(188, 35);
		((Control)checkBox1).Name = "checkBox1";
		((Control)checkBox1).Size = new Size(99, 17);
		((Control)checkBox1).TabIndex = 5;
		((Control)checkBox1).Text = "Hardcore mode";
		((ButtonBase)checkBox1).UseVisualStyleBackColor = true;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(299, 162);
		((Control)this).Controls.Add((Control)(object)checkBox1);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)1;
		((Control)this).Name = "Form1";
		((Control)this).Text = "Encrypter by GordonBM";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
