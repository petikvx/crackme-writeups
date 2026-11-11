using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApp10;

public class Form1 : Form
{
	private IContainer components = null;

	private Button button1;

	private TextBox textBox1;

	public Form1()
	{
		InitializeComponent();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		DateTime today = DateTime.Today;
		string text = "sobaka=pidoras1499";
		string s = today.ToString("yyyyMMdd");
		int num = int.Parse(s);
		int num2 = num + 2777;
		int num3 = num + 4777;
		int num4 = num + 3777;
		int num5 = int.Parse(((Control)textBox1).Text);
		if (num5 == num3)
		{
			MessageBox.Show("поздравляю, вы пидорас!");
		}
		else
		{
			MessageBox.Show("к сожалению, вы не пидорас((");
		}
	}

	public void textBox1_TextChanged(object sender, EventArgs e)
	{
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
		button1 = new Button();
		textBox1 = new TextBox();
		((Control)this).SuspendLayout();
		((Control)button1).ForeColor = SystemColors.ActiveCaptionText;
		((Control)button1).Location = new Point(94, 114);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(194, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "проверить свою ориентацию";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)textBox1).Location = new Point(94, 54);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(194, 20);
		((Control)textBox1).TabIndex = 1;
		((Control)textBox1).Text = "жёсткий_пароль_2001";
		((Control)textBox1).TextChanged += textBox1_TextChanged;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackColor = SystemColors.ActiveCaptionText;
		((Form)this).ClientSize = new Size(401, 175);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).ForeColor = SystemColors.ButtonHighlight;
		((Control)this).Name = "Form1";
		((Control)this).Text = "Very Ez Crackme By plikan";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
