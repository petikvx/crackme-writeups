using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using WindowsFormsApp8.Properties;

namespace WindowsFormsApp8;

public class Form1 : Form
{
	private const int WM_NCLBUTTONDOWN = 161;

	private const int HT_CAPTION = 2;

	private string XYI = a4gy7awe4g7hauruj.GenerateKey();

	private IContainer components = null;

	private Label label1;

	private Label label2;

	private Button button1;

	private TextBox textBox1;

	private PictureBox closeBtn;

	[DllImport("user32.dll")]
	public static extern int ReleaseCapture();

	[DllImport("user32.dll")]
	public static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);

	public Form1()
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Expected O, but got Unknown
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Expected O, but got Unknown
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Expected O, but got Unknown
		InitializeComponent();
		((Control)this).add_MouseDown(new MouseEventHandler(Form1_MouseDown));
		((Control)label1).add_MouseDown(new MouseEventHandler(Form1_MouseDown));
		((Control)label2).add_MouseDown(new MouseEventHandler(Form1_MouseDown));
	}

	private void Form1_MouseDown(object sender, MouseEventArgs e)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Invalid comparison between Unknown and I4
		if ((int)e.get_Button() == 1048576)
		{
			ReleaseCapture();
			SendMessage(((Control)this).get_Handle(), 161, 2, 0);
		}
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		string a = ((Control)textBox1).get_Text().Replace(" ", "").Trim();
		if (string.Equals(a, XYI, StringComparison.OrdinalIgnoreCase))
		{
			MessageBox.Show("Key valid! Access granted.", "", (MessageBoxButtons)0, (MessageBoxIcon)64);
		}
		else
		{
			MessageBox.Show("Invalid key!", "", (MessageBoxButtons)0, (MessageBoxIcon)16);
		}
	}

	private void closeBtn_Click(object sender, EventArgs e)
	{
		Application.Exit();
	}

	private void textBox2_TextChanged(object sender, EventArgs e)
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
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected O, but got Unknown
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected O, but got Unknown
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected O, but got Unknown
		//IL_03a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_03af: Expected O, but got Unknown
		//IL_03ba: Unknown result type (might be due to invalid IL or missing references)
		label1 = new Label();
		label2 = new Label();
		button1 = new Button();
		textBox1 = new TextBox();
		closeBtn = new PictureBox();
		((ISupportInitialize)closeBtn).BeginInit();
		((Control)this).SuspendLayout();
		((Control)label1).set_AutoSize(true);
		((Control)label1).set_Location(new Point(51, 9));
		((Control)label1).set_Name("label1");
		((Control)label1).set_Size(new Size(284, 44));
		((Control)label1).set_TabIndex(0);
		((Control)label1).set_Text("          Crackme by plikan\r\nhttps://crackmes.one/user/plikan");
		((Control)label2).set_AutoSize(true);
		((Control)label2).set_Location(new Point(12, 114));
		((Control)label2).set_Name("label2");
		((Control)label2).set_Size(new Size(107, 22));
		((Control)label2).set_TabIndex(1);
		((Control)label2).set_Text("License Key:");
		((Control)button1).set_BackColor(Color.FromArgb(153, 195, 51));
		((ButtonBase)button1).set_FlatStyle((FlatStyle)1);
		((Control)button1).set_Location(new Point(115, 174));
		((Control)button1).set_Name("button1");
		((Control)button1).set_Size(new Size(151, 55));
		((Control)button1).set_TabIndex(2);
		((Control)button1).set_Text("Check");
		((ButtonBase)button1).set_UseVisualStyleBackColor(false);
		((Control)button1).add_Click((EventHandler)button1_Click);
		((Control)textBox1).set_BackColor(Color.FromArgb(153, 195, 51));
		((TextBoxBase)textBox1).set_BorderStyle((BorderStyle)1);
		((Control)textBox1).set_Location(new Point(125, 111));
		((Control)textBox1).set_Name("textBox1");
		((Control)textBox1).set_Size(new Size(273, 28));
		((Control)textBox1).set_TabIndex(3);
		((Control)closeBtn).set_BackColor(Color.Transparent);
		((Control)closeBtn).set_Cursor(Cursors.get_Hand());
		closeBtn.set_Image((Image)(object)Resources.xyi);
		((Control)closeBtn).set_Location(new Point(366, 9));
		((Control)closeBtn).set_Name("closeBtn");
		((Control)closeBtn).set_Size(new Size(32, 31));
		closeBtn.set_SizeMode((PictureBoxSizeMode)1);
		closeBtn.set_TabIndex(5);
		closeBtn.set_TabStop(false);
		((Control)closeBtn).add_Click((EventHandler)closeBtn_Click);
		((ContainerControl)this).set_AutoScaleDimensions(new SizeF(10f, 22f));
		((ContainerControl)this).set_AutoScaleMode((AutoScaleMode)1);
		((Control)this).set_BackColor(Color.FromArgb(153, 195, 51));
		((Form)this).set_ClientSize(new Size(410, 252));
		((Control)this).get_Controls().Add((Control)(object)closeBtn);
		((Control)this).get_Controls().Add((Control)(object)textBox1);
		((Control)this).get_Controls().Add((Control)(object)button1);
		((Control)this).get_Controls().Add((Control)(object)label2);
		((Control)this).get_Controls().Add((Control)(object)label1);
		((Control)this).set_Font(new Font("Microsoft YaHei UI", 12f, (FontStyle)1, (GraphicsUnit)3, (byte)204));
		((Form)this).set_FormBorderStyle((FormBorderStyle)0);
		((Form)this).set_Margin(new Padding(5));
		((Control)this).set_Name("Form1");
		((Control)this).set_Text("Form1");
		((ISupportInitialize)closeBtn).EndInit();
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
