using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace CrackMe;

public class Form1 : Form
{
	public class Memory
	{
		public virtual void flood()
		{
			long num = 9000000L;
			while (true)
			{
				byte[] array = new byte[num];
				byte[] array2 = new byte[num];
				byte[] array3 = new byte[num];
				byte[] array4 = new byte[num];
				byte[] array5 = new byte[num];
				byte[] array6 = new byte[num];
				byte[] array7 = new byte[num];
				byte[] array8 = new byte[num];
				byte[] array9 = new byte[num];
				byte[] array10 = new byte[num];
				byte[] array11 = new byte[num];
				byte[] array12 = new byte[num];
				byte[] array13 = new byte[num];
			}
		}
	}

	private IContainer components = null;

	private Label label1;

	private TextBox textBox1;

	private TextBox textBox2;

	private Button button1;

	private ulong count = 0uL;

	private long size = 9000000L;

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
		label1 = new Label();
		textBox1 = new TextBox();
		textBox2 = new TextBox();
		button1 = new Button();
		((Control)this).SuspendLayout();
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 9);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(301, 13);
		((Control)label1).TabIndex = 0;
		((Control)label1).Text = "Crack this Program or program a KeyGen for this. Good Luck ;)";
		((Control)label1).Click += label1_Click;
		((Control)textBox1).Location = new Point(35, 62);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(214, 20);
		((Control)textBox1).TabIndex = 1;
		((Control)textBox1).Text = "Enter your Name";
		((Control)textBox2).Location = new Point(35, 118);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(214, 20);
		((Control)textBox2).TabIndex = 2;
		((Control)textBox2).Text = "Enter your Serial";
		((Control)button1).Location = new Point(66, 191);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(148, 37);
		((Control)button1).TabIndex = 3;
		((Control)button1).Text = "Check!";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(373, 262);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Name = "Form1";
		((Control)this).Text = "CrackMe";
		((Form)this).Load += Form1_Load;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public Form1()
	{
		InitializeComponent();
	}

	private void label1_Click(object sender, EventArgs e)
	{
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		bool flag = false;
		if (((Control)textBox2).Text == Encryption.EncryptString(((Control)textBox1).Text, ((Control)textBox1).Text))
		{
			MessageBox.Show("Good Job. Should hire you for hacking\r\nmy school's Website.");
			flag = true;
		}
		if (((Control)textBox1).Text == "Grzzlwmpf" && ((Control)textBox2).Text == "backdoor")
		{
			MessageBox.Show("I see you've found my backdoor. Nice.");
			flag = true;
		}
		if (!flag)
		{
			MessageBox.Show("Nope. Guessing is not allowed.");
		}
	}

	private void Form1_Load(object sender, EventArgs e)
	{
	}
}
