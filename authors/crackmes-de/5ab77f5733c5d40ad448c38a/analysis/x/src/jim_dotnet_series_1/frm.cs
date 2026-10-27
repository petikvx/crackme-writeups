using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using _;

namespace jim_dotnet_series_1;

public class frm : Form
{
	private IContainer components = null;

	private TextBox textBox1;

	private Label lbl;

	private TextBox textBox2;

	private CheckBox cb1;

	private CheckBox cb2;

	private CheckBox cb3;

	private CheckBox cb4;

	private CheckBox cb5;

	private CheckBox cb6;

	private Button btnCheck;

	private Button btnAbout;

	private PictureBox pictureBox1;

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
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0074: Expected O, but got Unknown
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Expected O, but got Unknown
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Expected O, but got Unknown
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Expected O, but got Unknown
		//IL_0574: Unknown result type (might be due to invalid IL or missing references)
		//IL_057e: Expected O, but got Unknown
		//IL_06f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_06fc: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(frm));
		textBox1 = new TextBox();
		lbl = new Label();
		textBox2 = new TextBox();
		cb1 = new CheckBox();
		cb2 = new CheckBox();
		cb3 = new CheckBox();
		cb4 = new CheckBox();
		cb5 = new CheckBox();
		cb6 = new CheckBox();
		btnCheck = new Button();
		btnAbout = new Button();
		pictureBox1 = new PictureBox();
		((ISupportInitialize)pictureBox1).BeginInit();
		((Control)this).SuspendLayout();
		((Control)textBox1).Location = new Point(54, 12);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(222, 20);
		((Control)textBox1).TabIndex = 0;
		((Control)lbl).AutoSize = true;
		((Control)lbl).Location = new Point(12, 15);
		((Control)lbl).Name = "lbl";
		((Control)lbl).Size = new Size(36, 65);
		((Control)lbl).TabIndex = 1;
		((Control)lbl).Text = "name:\r\n\r\nkey:\r\n\r\ncode:";
		((Control)textBox2).Location = new Point(54, 38);
		((Control)textBox2).Name = "textBox2";
		((Control)textBox2).Size = new Size(222, 20);
		((Control)textBox2).TabIndex = 2;
		((Control)cb1).AutoSize = true;
		((Control)cb1).Location = new Point(54, 66);
		((Control)cb1).Name = "cb1";
		((Control)cb1).Size = new Size(33, 17);
		((Control)cb1).TabIndex = 3;
		((Control)cb1).Text = "A";
		((ButtonBase)cb1).UseVisualStyleBackColor = true;
		((Control)cb2).AutoSize = true;
		((Control)cb2).Location = new Point(93, 66);
		((Control)cb2).Name = "cb2";
		((Control)cb2).Size = new Size(33, 17);
		((Control)cb2).TabIndex = 4;
		((Control)cb2).Text = "B";
		((ButtonBase)cb2).UseVisualStyleBackColor = true;
		((Control)cb3).AutoSize = true;
		((Control)cb3).Location = new Point(132, 66);
		((Control)cb3).Name = "cb3";
		((Control)cb3).Size = new Size(33, 17);
		((Control)cb3).TabIndex = 5;
		((Control)cb3).Text = "C";
		((ButtonBase)cb3).UseVisualStyleBackColor = true;
		((Control)cb4).AutoSize = true;
		((Control)cb4).Location = new Point(171, 66);
		((Control)cb4).Name = "cb4";
		((Control)cb4).Size = new Size(34, 17);
		((Control)cb4).TabIndex = 6;
		((Control)cb4).Text = "D";
		((ButtonBase)cb4).UseVisualStyleBackColor = true;
		((Control)cb5).AutoSize = true;
		((Control)cb5).Location = new Point(211, 66);
		((Control)cb5).Name = "cb5";
		((Control)cb5).Size = new Size(33, 17);
		((Control)cb5).TabIndex = 7;
		((Control)cb5).Text = "E";
		((ButtonBase)cb5).UseVisualStyleBackColor = true;
		((Control)cb6).AutoSize = true;
		((Control)cb6).Location = new Point(250, 66);
		((Control)cb6).Name = "cb6";
		((Control)cb6).Size = new Size(32, 17);
		((Control)cb6).TabIndex = 8;
		((Control)cb6).Text = "F";
		((ButtonBase)cb6).UseVisualStyleBackColor = true;
		((Control)btnCheck).Location = new Point(54, 89);
		((Control)btnCheck).Name = "btnCheck";
		((Control)btnCheck).Size = new Size(102, 23);
		((Control)btnCheck).TabIndex = 9;
		((Control)btnCheck).Text = "Check";
		((ButtonBase)btnCheck).UseVisualStyleBackColor = true;
		((Control)btnCheck).Click += btnCheck_Click;
		((Control)btnAbout).Location = new Point(174, 89);
		((Control)btnAbout).Name = "btnAbout";
		((Control)btnAbout).Size = new Size(102, 23);
		((Control)btnAbout).TabIndex = 10;
		((Control)btnAbout).Text = "About";
		((ButtonBase)btnAbout).UseVisualStyleBackColor = true;
		((Control)btnAbout).Click += btnAbout_Click;
		pictureBox1.Image = (Image)componentResourceManager.GetObject("pictureBox1.Image");
		((Control)pictureBox1).Location = new Point(9, 83);
		((Control)pictureBox1).Name = "pictureBox1";
		((Control)pictureBox1).Size = new Size(32, 32);
		pictureBox1.TabIndex = 11;
		pictureBox1.TabStop = false;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(288, 122);
		((Control)this).Controls.Add((Control)(object)pictureBox1);
		((Control)this).Controls.Add((Control)(object)btnAbout);
		((Control)this).Controls.Add((Control)(object)btnCheck);
		((Control)this).Controls.Add((Control)(object)cb6);
		((Control)this).Controls.Add((Control)(object)cb5);
		((Control)this).Controls.Add((Control)(object)cb4);
		((Control)this).Controls.Add((Control)(object)cb3);
		((Control)this).Controls.Add((Control)(object)cb2);
		((Control)this).Controls.Add((Control)(object)cb1);
		((Control)this).Controls.Add((Control)(object)textBox2);
		((Control)this).Controls.Add((Control)(object)lbl);
		((Control)this).Controls.Add((Control)(object)textBox1);
		((Form)this).FormBorderStyle = (FormBorderStyle)1;
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Form)this).MaximizeBox = false;
		((Control)this).Name = "frm";
		((Control)this).Text = "JiM~ DotNet Series #1";
		((Form)this).Load += Form1_Load;
		((ISupportInitialize)pictureBox1).EndInit();
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public frm()
	{
		InitializeComponent();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
	}

	private void btnAbout_Click(object sender, EventArgs e)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		MessageBox.Show("DotNet Series #1\nby JiM~\n\nShow me a keygen ;D Have fun!\n\ncrackmes.de", "About");
	}

	private void btnCheck_Click(object sender, EventArgs e)
	{
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_015a: Unknown result type (might be due to invalid IL or missing references)
		//IL_014d: Unknown result type (might be due to invalid IL or missing references)
		if (((Control)textBox1).Text.Length == 0 || ((Control)textBox2).Text.Length == 0 || ((Control)textBox2).Text.Length % 2 != 0)
		{
			MessageBox.Show("Invalid. Try again.");
			return;
		}
		SuperString superString = new SuperString(((Control)textBox1).Text);
		SuperString superString2 = new SuperString(((Control)textBox2).Text);
		superString2.expand();
		SuperString superString3 = new SuperString(superString) + new SuperString(Environment.UserName);
		int num = (cb1.Checked ? 1 : 0);
		int num2 = (cb2.Checked ? 1 : 0);
		int num3 = (cb3.Checked ? 1 : 0);
		int num4 = (cb4.Checked ? 1 : 0);
		int num5 = (cb5.Checked ? 1 : 0);
		int num6 = (cb6.Checked ? 1 : 0);
		int num7 = num + num2 * 2 + num3 * 4 + num4 * 8 + num5 * 16 + num6 * 32;
		if (superString3.Equals(superString2) && num7 == superString.ToString().Length)
		{
			MessageBox.Show("Valid! Good work! Now show me a keygen ;)");
		}
		else
		{
			MessageBox.Show("Invalid. Try again.");
		}
	}
}
