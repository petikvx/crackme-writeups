using System;
using System.ComponentModel;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace KRAKK_v._10_SHA_1_edition;

public class Form1 : Form
{
	private bool firstclick;

	private bool firstclick2;

	private string sha1;

	private IContainer components;

	private TextBox textBox1;

	private TextBox textBox2;

	private Button button1;

	private Label label1;

	private Label label2;

	public Form1()
	{
		InitializeComponent();
	}

	private void textBox1_MouseDown(object sender, MouseEventArgs e)
	{
		if (!firstclick)
		{
			((Control)textBox1).Text = "";
			firstclick = true;
		}
	}

	private void textBox2_MouseDown(object sender, MouseEventArgs e)
	{
		if (!firstclick2)
		{
			((Control)textBox2).Text = "";
			firstclick2 = true;
		}
	}

	private void textBox1_TextChanged(object sender, EventArgs e)
	{
		sha1 = Hash(((Control)textBox1).Text);
	}

	private void textBox2_TextChanged(object sender, EventArgs e)
	{
	}

	private static string Hash(string input)
	{
		using SHA1Managed sHA1Managed = new SHA1Managed();
		byte[] array = sHA1Managed.ComputeHash(Encoding.UTF8.GetBytes(input));
		StringBuilder stringBuilder = new StringBuilder(array.Length * 2);
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			stringBuilder.Append(b.ToString("X2"));
		}
		return stringBuilder.ToString();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		if (sha1 == ((Control)textBox2).Text)
		{
			MessageBox.Show("Activation successful.");
			((Control)new Form2()).Show();
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
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Expected O, but got Unknown
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Expected O, but got Unknown
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected O, but got Unknown
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Expected O, but got Unknown
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Expected O, but got Unknown
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Expected O, but got Unknown
		//IL_013a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0144: Expected O, but got Unknown
		textBox1 = new TextBox();
		textBox2 = new TextBox();
		button1 = new Button();
		label1 = new Label();
		label2 = new Label();
		((Control)this).SuspendLayout();
		((Control)textBox1).Location = new Point(0, 0);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(308, 20);
		((Control)textBox1).TabIndex = 1;
		((Control)textBox1).Text = "Username";
		((Control)textBox1).TextChanged += textBox1_TextChanged;
		((Control)textBox1).MouseDown += new MouseEventHandler(textBox1_MouseDown);
		((Control)textBox2).Location = new Point(0, 26);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(308, 20);
		((Control)textBox2).TabIndex = 2;
		((Control)textBox2).Text = "Key";
		((Control)textBox2).TextChanged += textBox2_TextChanged;
		((Control)textBox2).MouseDown += new MouseEventHandler(textBox2_MouseDown);
		((Control)button1).Location = new Point(221, 43);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(87, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Validate";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(139, 108);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(20, 13);
		((Control)label1).TabIndex = 3;
		((Control)label1).Text = "X2";
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(12, 49);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(88, 13);
		((Control)label2).TabIndex = 4;
		((Control)label2).Text = "Maximize for hint!";
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(308, 71);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Name = "Form1";
		((Control)this).Text = "Form1";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
