using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using Microsoft.Win32;

namespace Obnoxious2;

public class Form1 : Form
{
	private IContainer components = null;

	private Label label1;

	private Label label2;

	private Button button1;

	private TextBox textBox1;

	private TextBox textBox2;

	private Label label3;

	private Button button2;

	private Timer timer1;

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
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Expected O, but got Unknown
		components = new Container();
		label1 = new Label();
		label2 = new Label();
		button1 = new Button();
		textBox1 = new TextBox();
		textBox2 = new TextBox();
		label3 = new Label();
		button2 = new Button();
		timer1 = new Timer(components);
		((Control)this).SuspendLayout();
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 23);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(38, 13);
		((Control)label1).TabIndex = 0;
		((Control)label1).Text = "Name:";
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(12, 52);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(36, 13);
		((Control)label2).TabIndex = 1;
		((Control)label2).Text = "Serial:";
		((Control)button1).Location = new Point(214, 89);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(52, 23);
		((Control)button1).TabIndex = 2;
		((Control)button1).Text = "Check!";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)textBox1).Location = new Point(53, 20);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(213, 20);
		((Control)textBox1).TabIndex = 3;
		((Control)textBox2).Location = new Point(53, 49);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(213, 20);
		((Control)textBox2).TabIndex = 4;
		((Control)label3).AutoSize = true;
		((Control)label3).Location = new Point(76, 94);
		((Control)label3).Name = "label3";
		((Control)label3).Size = new Size(0, 13);
		((Control)label3).TabIndex = 5;
		((Control)button2).Location = new Point(161, 89);
		((Control)button2).Name = "button2";
		((Control)button2).Size = new Size(47, 23);
		((Control)button2).TabIndex = 6;
		((Control)button2).Text = "About!";
		((ButtonBase)button2).UseVisualStyleBackColor = true;
		((Control)button2).Click += button2_Click;
		timer1.Tick += timer1_Tick;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(278, 124);
		((Control)this).Controls.Add((Control)(object)button2);
		((Control)this).Controls.Add((Control)(object)label3);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)label1);
		((Form)this).FormBorderStyle = (FormBorderStyle)5;
		((Control)this).ImeMode = (ImeMode)2;
		((Control)this).Name = "Form1";
		((Control)this).Text = "Obnoxious!";
		((Form)this).Load += Form1_Load;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public Form1()
	{
		InitializeComponent();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_012f: Unknown result type (might be due to invalid IL or missing references)
		RegistryKey registryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\\crackmes\\User");
		if (registryKey == null)
		{
			MessageBox.Show("You have'nt registered my Previous crackme yet?", "Shame on you!");
			((Form)this).Close();
		}
		else if (!File.Exists("C:\\windows\\key.txt"))
		{
			MessageBox.Show("KeyFile not found!", "Error!");
			((Control)label3).Text = "::Unregistered::";
			timer1.Interval = 5000;
			timer1.Start();
		}
		else
		{
			string text = File.ReadAllText("c:\\windows\\key.txt");
			int length = Convert.ToString(SystemInformation.UserName).Length;
			int num = length;
			string md5str = Convert.ToString(SystemInformation.UserName + SystemInformation.DoubleClickTime);
			md5str = Convert.ToString(getmd5(md5str));
			string text2 = md5str.Substring(length, 20).ToUpper();
			for (length = 4; length < text2.Length; length += num)
			{
				text2 = text2.Insert(length, "-");
			}
			if (text != text2)
			{
				MessageBox.Show("Possibly Incorrect Registration Data.", "Error!");
				((Control)label3).Text = "Plz Re-Register!";
				((Control)textBox2).Text = "Incorrect or Corrupt Registration Data";
			}
			else
			{
				((Control)textBox2).Text = "Welcome crackmes.de User!";
				((Control)label3).Text = "::Registered::";
			}
		}
		TextBox obj = textBox1;
		string text4 = (((Control)textBox1).Text = Convert.ToString(SystemInformation.UserName));
		((Control)obj).Text = text4;
	}

	private void button2_Click(object sender, EventArgs e)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		MessageBox.Show("Coded By Obnoxious\nBy the n00b\nOf the n00b\nFor the n00b.", "Obnoxious'sKGM#2");
	}

	private void timer1_Tick(object sender, EventArgs e)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		MessageBox.Show("KeyFile not found!", "Error!");
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0131: Unknown result type (might be due to invalid IL or missing references)
		int length = Convert.ToString(SystemInformation.UserName).Length;
		int num = length;
		string md5str = Convert.ToString(SystemInformation.UserName + SystemInformation.DoubleClickTime);
		md5str = Convert.ToString(getmd5(md5str));
		string text = md5str.Substring(length, 20).ToUpper();
		for (length = 4; length < text.Length; length += num)
		{
			text = text.Insert(length, "-");
		}
		if (((Control)textBox2).Text == text)
		{
			((Control)label3).Text = "::Registered::";
			timer1.Stop();
			if (!File.Exists("c:\\windows\\key.txt"))
			{
				File.Create("c:\\windows\\key.txt").Close();
				File.WriteAllText("c:\\windows\\key.txt", text);
				File.SetAttributes("c:\\windows\\key.txt", FileAttributes.Hidden);
			}
			else
			{
				File.SetAttributes("c:\\windows\\key.txt", FileAttributes.Normal);
				File.WriteAllText("c:\\windows\\key.txt", text);
				File.SetAttributes("c:\\windows\\key.txt", FileAttributes.Hidden);
			}
		}
		else
		{
			((Control)label3).Text = "::Unregistered::";
			MessageBox.Show("No! No! No! No!", "No!");
		}
	}

	private string getmd5(string md5str)
	{
		MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
		byte[] bytes = Encoding.ASCII.GetBytes(md5str);
		bytes = mD5CryptoServiceProvider.ComputeHash(bytes);
		string text = "";
		byte[] array = bytes;
		foreach (byte b in array)
		{
			text += b.ToString("");
		}
		return text;
	}
}
