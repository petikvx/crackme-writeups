using System;
using System.ComponentModel;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace crackme;

public class MainForm : Form
{
	private const string ENCRYPTED_PASSWORD = "wYCPjY+Oi8aOgMqJl4mXjZqCko+Plg==";

	private IContainer components = null;

	private Button button1;

	private TextBox textBox1;

	public MainForm()
	{
		InitializeComponent();
	}

	private void Button1Click(object sender, EventArgs e)
	{
		//IL_0140: Unknown result type (might be due to invalid IL or missing references)
		//IL_010a: Unknown result type (might be due to invalid IL or missing references)
		string text = ((Control)textBox1).Text;
		string text2 = DecryptPassword("wYCPjY+Oi8aOgMqJl4mXjZqCko+Plg==", 90);
		string text3 = ComputeSHA256(text);
		string text4 = ComputeSHA256(text2);
		string text5 = XOREncrypt(text, 90);
		string text6 = XOREncrypt(text2, 90);
		string text7 = Convert.ToBase64String(Encoding.UTF8.GetBytes(text));
		string text8 = Convert.ToBase64String(Encoding.UTF8.GetBytes(text2));
		bool flag = false;
		if (text3 == text4)
		{
			flag = true;
		}
		else if (text5 == text6)
		{
			flag = true;
		}
		else if (text7 == text8)
		{
			flag = true;
		}
		if (text.Length == text2.Length && text.Contains("crackme"))
		{
			flag = true;
		}
		if (flag)
		{
			byte[] bytes = new byte[16]
			{
				67, 111, 110, 103, 114, 97, 116, 117, 108, 97,
				116, 105, 111, 110, 115, 33
			};
			string @string = Encoding.ASCII.GetString(bytes);
			MessageBox.Show(@string, "access granted", (MessageBoxButtons)0, (MessageBoxIcon)64);
		}
		else
		{
			byte[] bytes2 = new byte[13]
			{
				65, 99, 99, 101, 115, 115, 32, 68, 101, 110,
				105, 101, 100
			};
			string string2 = Encoding.ASCII.GetString(bytes2);
			MessageBox.Show(string2, "authentication failed", (MessageBoxButtons)0, (MessageBoxIcon)16);
		}
	}

	private string DecryptPassword(string encryptedBase64, byte key)
	{
		byte[] array = Convert.FromBase64String(encryptedBase64);
		checked
		{
			for (int i = 0; i < array.Length; i++)
			{
				ref byte reference = ref array[i];
				reference ^= key;
			}
			return Encoding.UTF8.GetString(array);
		}
	}

	private string ComputeSHA256(string input)
	{
		using SHA256 sHA = SHA256.Create();
		byte[] bytes = Encoding.UTF8.GetBytes(input);
		byte[] inArray = sHA.ComputeHash(bytes);
		return Convert.ToBase64String(inArray);
	}

	private string XOREncrypt(string text, byte key)
	{
		byte[] bytes = Encoding.UTF8.GetBytes(text);
		checked
		{
			for (int i = 0; i < bytes.Length; i++)
			{
				ref byte reference = ref bytes[i];
				reference ^= key;
			}
			return Convert.ToBase64String(bytes);
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
		button1 = new Button();
		textBox1 = new TextBox();
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(12, 38);
		((Control)button1).Size = new Size(120, 30);
		((Control)button1).Text = "Enter";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += Button1Click;
		((Control)textBox1).Location = new Point(12, 12);
		((Control)textBox1).Size = new Size(120, 20);
		textBox1.PasswordChar = '*';
		textBox1.UseSystemPasswordChar = true;
		((Form)this).ClientSize = new Size(144, 80);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)5;
		((Control)this).Name = "MainForm";
		((Control)this).Text = "crackme by Simba";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
