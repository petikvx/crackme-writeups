using System;
using System.ComponentModel;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace optimise;

public class Form1 : Form
{
	private IContainer components = null;

	private Button button1;

	private Label label1;

	private Label label2;

	private TextBox textBox1;

	private TextBox textBox2;

	private TextBox textBox3;

	private TextBox textBox4;

	private TextBox textBox5;

	private Timer timer1;

	public Form1()
	{
		InitializeComponent();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0138: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		if (((Control)textBox1).Text != "" && ((Control)textBox2).Text != "" && ((Control)textBox3).Text != "" && ((Control)textBox4).Text != "" && ((Control)textBox5).Text != "")
		{
			string text = ((Control)textBox1).Text;
			int num = Convert.ToInt32(getkey(text));
			try
			{
				int num2 = Convert.ToInt32(((Control)textBox2).Text);
				int num3 = Convert.ToInt32(((Control)textBox3).Text);
				int num4 = Convert.ToInt32(((Control)textBox4).Text);
				int num5 = Convert.ToInt32(((Control)textBox5).Text);
				if (checkkey() && num5 == num)
				{
					MessageBox.Show("Hurray....you did it!!!!", "Success");
				}
				else
				{
					MessageBox.Show("Try,Try,Try......and Try again!", "Noooooo...");
				}
				return;
			}
			catch
			{
				return;
			}
		}
		MessageBox.Show("Hummm.....How about filling in the details?????", "Ha Ha");
	}

	private string getkey(string str)
	{
		MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
		byte[] bytes = Encoding.ASCII.GetBytes(str);
		int num = 0;
		bytes = mD5CryptoServiceProvider.ComputeHash(bytes);
		byte[] array = bytes;
		foreach (byte b in array)
		{
			num += b;
		}
		return num.ToString();
	}

	private bool checkkey()
	{
		string text = "16171011420002113600122240013020625";
		try
		{
			int num = Convert.ToInt32(((Control)textBox2).Text);
			int num2 = Convert.ToInt32(((Control)textBox3).Text);
			int num3 = Convert.ToInt32(((Control)textBox4).Text);
			int num4 = Convert.ToInt32(((Control)textBox5).Text);
			int num5 = 0;
			if (Convert.ToInt32(text.Substring(0, 2)) * num + Convert.ToInt32(text.Substring(2, 2)) * num2 + Convert.ToInt32(text.Substring(4, 2)) * num3 == Convert.ToInt32(text.Substring(30, 5)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(5, 1)) * num + Convert.ToInt32(text.Substring(6, 1)) * num2 + Convert.ToInt32(text.Substring(8, 1)) * num3 <= Convert.ToInt32(text.Substring(9, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(13, 1)) * num + Convert.ToInt32(text.Substring(14, 1)) * num2 + Convert.ToInt32(text.Substring(15, 1)) * num3 <= Convert.ToInt32(text.Substring(16, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(20, 1)) * num + Convert.ToInt32(text.Substring(21, 1)) * num2 + Convert.ToInt32(text.Substring(22, 1)) * num3 <= Convert.ToInt32(text.Substring(23, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(27, 1)) <= Convert.ToInt32(text.Substring(28, 2)))
			{
				num5++;
			}
			if (num5 == 5)
			{
				return true;
			}
			return false;
		}
		catch
		{
			return false;
		}
	}

	private void timer1_Tick(object sender, EventArgs e)
	{
		if (((Form)this).Opacity < 1.0)
		{
			((Form)this).Opacity = ((Form)this).Opacity + 0.1;
		}
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		((Form)this).Opacity = 0.0;
		timer1.Start();
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
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Expected O, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Expected O, but got Unknown
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Expected O, but got Unknown
		components = new Container();
		button1 = new Button();
		label1 = new Label();
		label2 = new Label();
		textBox1 = new TextBox();
		textBox2 = new TextBox();
		textBox3 = new TextBox();
		textBox4 = new TextBox();
		textBox5 = new TextBox();
		timer1 = new Timer(components);
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(12, 56);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(345, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Check :P";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)label1).AutoSize = true;
		((Control)label1).BackColor = Color.White;
		((Control)label1).Location = new Point(12, 9);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(38, 13);
		((Control)label1).TabIndex = 1;
		((Control)label1).Text = "Name:";
		((Control)label2).AutoSize = true;
		((Control)label2).BackColor = Color.White;
		((Control)label2).Location = new Point(19, 32);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(28, 13);
		((Control)label2).TabIndex = 2;
		((Control)label2).Text = "Key:";
		((Control)textBox1).Location = new Point(53, 6);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(304, 20);
		((Control)textBox1).TabIndex = 3;
		textBox1.TextAlign = (HorizontalAlignment)2;
		((Control)textBox2).Location = new Point(53, 29);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(58, 20);
		((Control)textBox2).TabIndex = 4;
		textBox2.TextAlign = (HorizontalAlignment)2;
		((Control)textBox3).Location = new Point(117, 29);
		((Control)textBox3).Name = "textBox3";
		((Control)textBox3).Size = new Size(80, 20);
		((Control)textBox3).TabIndex = 5;
		textBox3.TextAlign = (HorizontalAlignment)2;
		((Control)textBox4).Location = new Point(203, 29);
		((Control)textBox4).Name = "textBox4";
		((Control)textBox4).Size = new Size(39, 20);
		((Control)textBox4).TabIndex = 6;
		textBox4.TextAlign = (HorizontalAlignment)2;
		((Control)textBox5).Location = new Point(248, 29);
		((Control)textBox5).Name = "textBox5";
		((Control)textBox5).Size = new Size(109, 20);
		((Control)textBox5).TabIndex = 7;
		textBox5.TextAlign = (HorizontalAlignment)2;
		timer1.Tick += timer1_Tick;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(369, 95);
		((Control)this).Controls.Add((Control)(object)textBox5);
		((Control)this).Controls.Add((Control)(object)textBox4);
		((Control)this).Controls.Add((Control)(object)textBox3);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)5;
		((Control)this).Name = "Form1";
		((Control)this).Text = "Optimise";
		((Form)this).Load += Form1_Load;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
