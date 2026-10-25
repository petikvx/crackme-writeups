using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Media;
using System.Windows.Forms;
using Microsoft.Win32;
using Obnoxious.Properties;

namespace Obnoxious;

public class Form1 : Form
{
	private IContainer components = null;

	private Button button1;

	private Button button2;

	private Label label1;

	private Label label2;

	private Label xxxx;

	private TextBox textBox1;

	private TextBox textBox2;

	private Label label3;

	public Form1()
	{
		InitializeComponent();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Expected O, but got Unknown
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		SoundPlayer val = new SoundPlayer((Stream)Resources.breach);
		val.PlayLooping();
		File.Create("c:\\windows\\time_data.txt").Close();
		RegistryKey registryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\\crackmes\\User");
		if (registryKey == null)
		{
			MessageBox.Show("Not A Crackmes.de User?", "Get Cracking");
			((Form)this).Close();
			return;
		}
		string text = Convert.ToString(registryKey.GetValue("MyKey"));
		if (text == "user@crackmes.de")
		{
			((Control)xxxx).Text = Convert.ToString(DateTime.Now.TimeOfDay.GetHashCode());
			File.WriteAllText("c:\\windows\\time_data.txt", ((Control)xxxx).Text);
		}
		else
		{
			MessageBox.Show("Not A Valid Crackmes.de User.", "Get Cracking");
			((Form)this).Close();
		}
	}

	private void button2_Click(object sender, EventArgs e)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		MessageBox.Show("Obnoxious's KeygenMe#1\nBy the n00b,\nfor the n00b\nof the n00b!!!!", "About ;)");
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		string text = ((Control)textBox1).Text;
		string text2 = ((Control)textBox1).Text;
		if (text.Length < 6)
		{
			MessageBox.Show("Name Length Not Valid!", "Not Right");
			((Control)textBox1).Text = "";
			return;
		}
		if (((Control)textBox2).Text == "")
		{
			MessageBox.Show("Enter A Serial NitWit!", "NitWit");
			((Control)textBox2).Text = "";
			return;
		}
		if (((Control)textBox2).Text == Convert.ToString(get(text2)))
		{
			((Control)label3).Text = "::Registered::";
			return;
		}
		TextBox obj = textBox1;
		string text4 = (((Control)textBox2).Text = "");
		((Control)obj).Text = text4;
		((Control)label3).Text = "::Unregistered::";
	}

	private string get(string serial)
	{
		serial = "Obnoxious-" + ((Control)xxxx).Text.Substring(1, 8) + "-" + DateTime.Today.Day + "-" + serial.Substring(2, 2);
		return serial;
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
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Expected O, but got Unknown
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Expected O, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Expected O, but got Unknown
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Expected O, but got Unknown
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Expected O, but got Unknown
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected O, but got Unknown
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Expected O, but got Unknown
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Expected O, but got Unknown
		//IL_0482: Unknown result type (might be due to invalid IL or missing references)
		//IL_048c: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		button1 = new Button();
		button2 = new Button();
		label1 = new Label();
		label2 = new Label();
		xxxx = new Label();
		textBox1 = new TextBox();
		textBox2 = new TextBox();
		label3 = new Label();
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(250, 66);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(49, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Check!";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)button2).Location = new Point(195, 66);
		((Control)button2).Name = "button2";
		((Control)button2).Size = new Size(49, 23);
		((Control)button2).TabIndex = 1;
		((Control)button2).Text = "About!";
		((ButtonBase)button2).UseVisualStyleBackColor = true;
		((Control)button2).Click += button2_Click;
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 44);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(36, 13);
		((Control)label1).TabIndex = 2;
		((Control)label1).Text = "Serial:";
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(12, 15);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(38, 13);
		((Control)label2).TabIndex = 3;
		((Control)label2).Text = "Name:";
		((Control)xxxx).AutoSize = true;
		((Control)xxxx).Location = new Point(12, 71);
		((Control)xxxx).Name = "xxxx";
		((Control)xxxx).Size = new Size(27, 13);
		((Control)xxxx).TabIndex = 4;
		((Control)xxxx).Text = "xxxx";
		((Control)xxxx).Visible = false;
		((Control)textBox1).Location = new Point(53, 12);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(246, 20);
		((Control)textBox1).TabIndex = 5;
		((Control)textBox2).Location = new Point(53, 40);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(246, 20);
		((Control)textBox2).TabIndex = 6;
		((Control)label3).AutoSize = true;
		((Control)label3).Location = new Point(110, 71);
		((Control)label3).Name = "label3";
		((Control)label3).Size = new Size(79, 13);
		((Control)label3).TabIndex = 7;
		((Control)label3).Text = "::Unregistered::";
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(311, 101);
		((Control)this).Controls.Add((Control)(object)label3);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)xxxx);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)label1);
		((Control)this).Controls.Add((Control)(object)button2);
		((Control)this).Controls.Add((Control)(object)button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)5;
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Control)this).Name = "Form1";
		((Control)this).Text = "Obnoxious!";
		((Form)this).TransparencyKey = Color.Red;
		((Form)this).Load += Form1_Load;
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
