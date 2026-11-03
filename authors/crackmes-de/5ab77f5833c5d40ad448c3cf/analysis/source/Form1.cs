using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using KeyWizard.My;
using KeyWizard.My.Resources;
using Microsoft.VisualBasic.CompilerServices;

namespace KeyWizard;

[DesignerGenerated]
public class Form1 : Form
{
	private static List<WeakReference> __ENCList = new List<WeakReference>();

	private IContainer components;

	[AccessedThroughProperty("Panel1")]
	private Panel _Panel1;

	[AccessedThroughProperty("PictureBox1")]
	private PictureBox _PictureBox1;

	[AccessedThroughProperty("PictureBox2")]
	private PictureBox _PictureBox2;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("Label3")]
	private Label _Label3;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	private string nstr;

	private string sstr;

	private string wstr;

	private object currchar;

	private Point ptMouseDownLocation;

	private int m;

	private static byte[] Salt = new byte[32]
	{
		100, 86, 34, 53, 11, 224, 145, 123, 237, 213,
		12, 124, 45, 65, 71, 127, 135, 165, 234, 164,
		127, 234, 231, 211, 10, 9, 114, 234, 44, 63,
		75, 12
	};

	internal virtual Panel Panel1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Panel1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Panel1 = value;
		}
	}

	internal virtual PictureBox PictureBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _PictureBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = PictureBox1_Click;
			if (_PictureBox1 != null)
			{
				((Control)_PictureBox1).Click -= eventHandler;
			}
			_PictureBox1 = value;
			if (_PictureBox1 != null)
			{
				((Control)_PictureBox1).Click += eventHandler;
			}
		}
	}

	internal virtual PictureBox PictureBox2
	{
		[DebuggerNonUserCode]
		get
		{
			return _PictureBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = PictureBox2_Click;
			if (_PictureBox2 != null)
			{
				((Control)_PictureBox2).Click -= eventHandler;
			}
			_PictureBox2 = value;
			if (_PictureBox2 != null)
			{
				((Control)_PictureBox2).Click += eventHandler;
			}
		}
	}

	internal virtual Button Button2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button2_Click;
			if (_Button2 != null)
			{
				((Control)_Button2).Click -= eventHandler;
			}
			_Button2 = value;
			if (_Button2 != null)
			{
				((Control)_Button2).Click += eventHandler;
			}
		}
	}

	internal virtual Button Button1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button1_Click;
			if (_Button1 != null)
			{
				((Control)_Button1).Click -= eventHandler;
			}
			_Button1 = value;
			if (_Button1 != null)
			{
				((Control)_Button1).Click += eventHandler;
			}
		}
	}

	internal virtual TextBox TextBox2
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox2 = value;
		}
	}

	internal virtual TextBox TextBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox1 = value;
		}
	}

	internal virtual Label Label3
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label3 = value;
		}
	}

	internal virtual Label Label2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label2 = value;
		}
	}

	internal virtual Label Label1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label1 = value;
		}
	}

	[DebuggerNonUserCode]
	public Form1()
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected O, but got Unknown
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected O, but got Unknown
		((Control)this).MouseDown += new MouseEventHandler(Form1_MouseDown);
		((Control)this).MouseMove += new MouseEventHandler(Form1_MouseMove);
		((Form)this).Load += Form1_Load;
		lock (__ENCList)
		{
			__ENCList.Add(new WeakReference(this));
		}
		InitializeComponent();
	}

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		try
		{
			if ((disposing && components != null) ? true : false)
			{
				components.Dispose();
			}
		}
		finally
		{
			((Form)this).Dispose(disposing);
		}
	}

	[DebuggerStepThrough]
	private void InitializeComponent()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Expected O, but got Unknown
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Expected O, but got Unknown
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Expected O, but got Unknown
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Expected O, but got Unknown
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Expected O, but got Unknown
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Expected O, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Expected O, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Expected O, but got Unknown
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Expected O, but got Unknown
		//IL_007e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Expected O, but got Unknown
		//IL_04dc: Unknown result type (might be due to invalid IL or missing references)
		//IL_04e6: Expected O, but got Unknown
		//IL_0564: Unknown result type (might be due to invalid IL or missing references)
		//IL_056e: Expected O, but got Unknown
		//IL_066d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0677: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		Panel1 = new Panel();
		Button2 = new Button();
		Button1 = new Button();
		TextBox2 = new TextBox();
		TextBox1 = new TextBox();
		Label3 = new Label();
		Label2 = new Label();
		Label1 = new Label();
		PictureBox1 = new PictureBox();
		PictureBox2 = new PictureBox();
		((Control)Panel1).SuspendLayout();
		((ISupportInitialize)PictureBox1).BeginInit();
		((ISupportInitialize)PictureBox2).BeginInit();
		((Control)this).SuspendLayout();
		((Control)Panel1).BackColor = Color.FromArgb(241, 239, 235);
		((Control)Panel1).Controls.Add((Control)(object)Button2);
		((Control)Panel1).Controls.Add((Control)(object)Button1);
		((Control)Panel1).Controls.Add((Control)(object)TextBox2);
		((Control)Panel1).Controls.Add((Control)(object)TextBox1);
		((Control)Panel1).Controls.Add((Control)(object)Label3);
		((Control)Panel1).Controls.Add((Control)(object)Label2);
		((Control)Panel1).Controls.Add((Control)(object)Label1);
		Panel panel = Panel1;
		Point location = new Point(4, 23);
		((Control)panel).Location = location;
		((Control)Panel1).Name = "Panel1";
		Panel panel2 = Panel1;
		Size size = new Size(309, 117);
		((Control)panel2).Size = size;
		((Control)Panel1).TabIndex = 0;
		((ButtonBase)Button2).FlatStyle = (FlatStyle)1;
		Button button = Button2;
		location = new Point(11, 86);
		((Control)button).Location = location;
		((Control)Button2).Name = "Button2";
		Button button2 = Button2;
		size = new Size(75, 23);
		((Control)button2).Size = size;
		((Control)Button2).TabIndex = 6;
		((ButtonBase)Button2).Text = "About";
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		((ButtonBase)Button1).FlatStyle = (FlatStyle)1;
		Button button3 = Button1;
		location = new Point(226, 86);
		((Control)button3).Location = location;
		((Control)Button1).Name = "Button1";
		Button button4 = Button1;
		size = new Size(75, 23);
		((Control)button4).Size = size;
		((Control)Button1).TabIndex = 5;
		((ButtonBase)Button1).Text = "Register";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		((TextBoxBase)TextBox2).BorderStyle = (BorderStyle)1;
		TextBox textBox = TextBox2;
		location = new Point(52, 56);
		((Control)textBox).Location = location;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox2 = TextBox2;
		size = new Size(249, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox2).TabIndex = 4;
		((TextBoxBase)TextBox1).BorderStyle = (BorderStyle)1;
		TextBox textBox3 = TextBox1;
		location = new Point(52, 30);
		((Control)textBox3).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox4 = TextBox1;
		size = new Size(249, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox1).TabIndex = 3;
		Label3.AutoSize = true;
		Label label = Label3;
		location = new Point(10, 58);
		((Control)label).Location = location;
		((Control)Label3).Name = "Label3";
		Label label2 = Label3;
		size = new Size(36, 13);
		((Control)label2).Size = size;
		((Control)Label3).TabIndex = 2;
		Label3.Text = "Serial:";
		Label2.AutoSize = true;
		Label label3 = Label2;
		location = new Point(10, 32);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(38, 13);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 1;
		Label2.Text = "Name:";
		Label1.AutoSize = true;
		Label label5 = Label1;
		location = new Point(8, 7);
		((Control)label5).Location = location;
		((Control)Label1).Name = "Label1";
		Label label6 = Label1;
		size = new Size(156, 13);
		((Control)label6).Size = size;
		((Control)Label1).TabIndex = 0;
		Label1.Text = "Find a working name and serial.";
		PictureBox1.Image = (Image)componentResourceManager.GetObject("PictureBox1.Image");
		PictureBox pictureBox = PictureBox1;
		location = new Point(279, 5);
		((Control)pictureBox).Location = location;
		((Control)PictureBox1).Name = "PictureBox1";
		PictureBox pictureBox2 = PictureBox1;
		size = new Size(14, 14);
		((Control)pictureBox2).Size = size;
		PictureBox1.SizeMode = (PictureBoxSizeMode)2;
		PictureBox1.TabIndex = 1;
		PictureBox1.TabStop = false;
		PictureBox2.Image = (Image)componentResourceManager.GetObject("PictureBox2.Image");
		PictureBox pictureBox3 = PictureBox2;
		location = new Point(295, 5);
		((Control)pictureBox3).Location = location;
		((Control)PictureBox2).Name = "PictureBox2";
		PictureBox pictureBox4 = PictureBox2;
		size = new Size(14, 14);
		((Control)pictureBox4).Size = size;
		PictureBox2.SizeMode = (PictureBoxSizeMode)2;
		PictureBox2.TabIndex = 2;
		PictureBox2.TabStop = false;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackgroundImage = (Image)(object)Resources.backgroundwin;
		size = new Size(317, 144);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)PictureBox2);
		((Control)this).Controls.Add((Control)(object)PictureBox1);
		((Control)this).Controls.Add((Control)(object)Panel1);
		((Form)this).FormBorderStyle = (FormBorderStyle)0;
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Control)this).Name = "Form1";
		((Form)this).StartPosition = (FormStartPosition)1;
		((Form)this).Text = "KeyWizard 2 - Disasm Disease";
		((Control)Panel1).ResumeLayout(false);
		((Control)Panel1).PerformLayout();
		((ISupportInitialize)PictureBox1).EndInit();
		((ISupportInitialize)PictureBox2).EndInit();
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Form1_MouseDown(object sender, MouseEventArgs e)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Invalid comparison between Unknown and I4
		if ((int)e.Button == 1048576)
		{
			ptMouseDownLocation = e.Location;
		}
	}

	private void Form1_MouseMove(object sender, MouseEventArgs e)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Invalid comparison between Unknown and I4
		if ((int)e.Button == 1048576)
		{
			((Form)this).Location = e.Location - (Size)ptMouseDownLocation + (Size)((Form)this).Location;
		}
	}

	public void abrunden(object was, int x, int y, int width, int height, int radius)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Expected O, but got Unknown
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Expected O, but got Unknown
		GraphicsPath val = new GraphicsPath();
		checked
		{
			val.AddLine(x + radius, y, x + width - radius, y);
			val.AddArc(x + width - radius, y, radius, radius, 270f, 90f);
			val.AddLine(x + width, y, x + width, y + height);
			val.AddLine(x + width, y + height, x, y + height);
			val.AddLine(x, y + height - radius, x, y + radius);
			val.AddArc(x, y, radius, radius, 180f, 90f);
			val.CloseFigure();
			NewLateBinding.LateSet(was, (Type)null, "region", new object[1] { (object)new Region(val) }, (string[])null, (Type[])null);
			val.Dispose();
		}
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		abrunden(this, 0, 0, ((Control)this).Width, ((Control)this).Height, 10);
	}

	private void PictureBox2_Click(object sender, EventArgs e)
	{
		ProjectData.EndApp();
	}

	private void PictureBox1_Click(object sender, EventArgs e)
	{
		((Form)this).WindowState = (FormWindowState)1;
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0083: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
		if (((TextBoxBase)TextBox1).TextLength < 6)
		{
			((Form)MyProject.Forms.Form2).ShowDialog();
		}
		else if (((TextBoxBase)TextBox1).TextLength > 5)
		{
			wstr = Encrypt(TextBox1.Text, TextBox1.Text);
			if (Operators.CompareString(wstr, TextBox2.Text, false) == 0)
			{
				((Form)MyProject.Forms.Form4).ShowDialog();
			}
			else if (Operators.CompareString(wstr, sstr, false) != 0)
			{
				((Form)MyProject.Forms.Form3).ShowDialog();
			}
		}
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		((Form)MyProject.Forms.Form5).ShowDialog();
	}

	internal static string Encrypt(string Data, string Password)
	{
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		string result;
		try
		{
			Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(Password, Salt);
			Rijndael rijndael = Rijndael.Create();
			rijndael.Key = rfc2898DeriveBytes.GetBytes(32);
			rijndael.IV = rfc2898DeriveBytes.GetBytes(16);
			MemoryStream memoryStream = new MemoryStream();
			CryptoStream cryptoStream = new CryptoStream(memoryStream, rijndael.CreateEncryptor(), CryptoStreamMode.Write);
			cryptoStream.Write(Encoding.Default.GetBytes(Data), 0, Data.Length);
			cryptoStream.Close();
			memoryStream.Close();
			result = Convert.ToBase64String(memoryStream.ToArray());
		}
		catch (Exception ex)
		{
			ProjectData.SetProjectError(ex);
			Exception ex2 = ex;
			MessageBox.Show("Fehler bei der Verschlüsselung:\r\n" + ex2.Message);
			result = string.Empty;
			ProjectData.ClearProjectError();
		}
		return result;
	}

	internal static string Decrypt(string Data, string Password)
	{
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		string result;
		try
		{
			Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(Password, Salt);
			Rijndael rijndael = Rijndael.Create();
			rijndael.Key = rfc2898DeriveBytes.GetBytes(32);
			rijndael.IV = rfc2898DeriveBytes.GetBytes(16);
			MemoryStream memoryStream = new MemoryStream();
			CryptoStream cryptoStream = new CryptoStream(memoryStream, rijndael.CreateDecryptor(), CryptoStreamMode.Write);
			cryptoStream.Write(Convert.FromBase64String(Data), 0, Convert.FromBase64String(Data).Length);
			cryptoStream.Close();
			memoryStream.Close();
			result = Encoding.Default.GetString(memoryStream.ToArray());
		}
		catch (Exception ex)
		{
			ProjectData.SetProjectError(ex);
			Exception ex2 = ex;
			MessageBox.Show("Die Daten konnten nicht entschlüsselt werden:\r\n" + ex2.Message);
			result = string.Empty;
			ProjectData.ClearProjectError();
		}
		return result;
	}

	public string HashPassword(string Password)
	{
		SHA1Managed sHA1Managed = (SHA1Managed)SHA1.Create();
		return Convert.ToBase64String(sHA1Managed.ComputeHash(Encoding.UTF8.GetBytes(Password)));
	}
}
