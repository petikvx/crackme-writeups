using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using Un4seen.BassMOD;
using spaghettime.Properties;

namespace spaghettime;

public class mainForm : Form
{
	private IContainer components;

	private TextBox txtName;

	private TextBox txtKey;

	private Label lblName;

	private Label lblKey;

	private Button btnRegister;

	private Button btnAbout;

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
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected O, but got Unknown
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Expected O, but got Unknown
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected O, but got Unknown
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Expected O, but got Unknown
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected O, but got Unknown
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected O, but got Unknown
		//IL_0341: Unknown result type (might be due to invalid IL or missing references)
		//IL_034b: Expected O, but got Unknown
		//IL_0390: Unknown result type (might be due to invalid IL or missing references)
		//IL_039a: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(mainForm));
		txtName = new TextBox();
		txtKey = new TextBox();
		lblName = new Label();
		lblKey = new Label();
		btnRegister = new Button();
		btnAbout = new Button();
		((Control)this).SuspendLayout();
		((Control)txtName).Location = new Point(56, 12);
		((Control)txtName).Name = "txtName";
		((Control)txtName).Size = new Size(259, 20);
		((Control)txtName).TabIndex = 0;
		((Control)txtKey).Location = new Point(56, 38);
		((Control)txtKey).Name = "txtKey";
		((Control)txtKey).Size = new Size(259, 20);
		((Control)txtKey).TabIndex = 1;
		((Control)lblName).AutoSize = true;
		((Control)lblName).Location = new Point(9, 15);
		((Control)lblName).Name = "lblName";
		((Control)lblName).Size = new Size(38, 13);
		((Control)lblName).TabIndex = 2;
		((Control)lblName).Text = "Name:";
		((Control)lblKey).AutoSize = true;
		((Control)lblKey).Location = new Point(9, 41);
		((Control)lblKey).Name = "lblKey";
		((Control)lblKey).Size = new Size(28, 13);
		((Control)lblKey).TabIndex = 3;
		((Control)lblKey).Text = "Key:";
		((Control)btnRegister).Location = new Point(321, 39);
		((Control)btnRegister).Name = "btnRegister";
		((Control)btnRegister).Size = new Size(67, 20);
		((Control)btnRegister).TabIndex = 4;
		((Control)btnRegister).Text = "Register";
		((ButtonBase)btnRegister).UseVisualStyleBackColor = true;
		((Control)btnRegister).Click += btnRegister_Click;
		((Control)btnAbout).Location = new Point(321, 11);
		((Control)btnAbout).Name = "btnAbout";
		((Control)btnAbout).Size = new Size(67, 20);
		((Control)btnAbout).TabIndex = 5;
		((Control)btnAbout).Text = "About";
		((ButtonBase)btnAbout).UseVisualStyleBackColor = true;
		((Control)btnAbout).Click += btnAbout_Click;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(400, 71);
		((Control)this).Controls.Add((Control)(object)btnAbout);
		((Control)this).Controls.Add((Control)(object)btnRegister);
		((Control)this).Controls.Add((Control)(object)lblKey);
		((Control)this).Controls.Add((Control)(object)lblName);
		((Control)this).Controls.Add((Control)(object)txtKey);
		((Control)this).Controls.Add((Control)(object)txtName);
		((Form)this).FormBorderStyle = (FormBorderStyle)1;
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Form)this).MaximizeBox = false;
		((Form)this).MinimizeBox = false;
		((Control)this).Name = "mainForm";
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).Text = "SpaghettiMe";
		((Form)this).Load += mainForm_Load;
		((Form)this).FormClosed += new FormClosedEventHandler(mainForm_FormClosed);
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public mainForm()
	{
		InitializeComponent();
	}

	private void mainForm_Load(object sender, EventArgs e)
	{
		startDatMusic();
	}

	private void startDatMusic()
	{
		BassMOD.BASSMOD_Init(-1, 44100, 0);
		BassMOD.BASSMOD_MusicLoad(Resources.cerror_ode_to_maktone, 0, 0, (BASSMusic)4);
		BassMOD.BASSMOD_MusicPlay();
	}

	private void mainForm_FormClosed(object sender, FormClosedEventArgs e)
	{
		BassMOD.BASSMOD_Free();
	}

	private void btnAbout_Click(object sender, EventArgs e)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		((Form)new frmAbout()).ShowDialog();
	}

	private void btnRegister_Click(object sender, EventArgs e)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		if (!(((Control)txtName).Text == "") && ((Control)txtKey).Text.Length == 40 && overloaded())
		{
			((Control)txtName).Text = "REGISTERED!";
			((Control)txtKey).Text = "Now show me a keygen :3";
			((Control)txtName).Enabled = false;
			((Control)txtKey).Enabled = false;
		}
		else
		{
			MessageBox.Show("The key you entered is not valid.");
		}
	}

	private bool overloaded()
	{
		byte[] array = Convert.FromBase64String(((Control)txtKey).Text);
		int[] array2 = new int[array.Length];
		for (int i = 0; i < array.Length; i++)
		{
			array2[i] = Convert.ToInt32(array[i]);
		}
		return overloaded(((Control)txtName).Text) % 255 == overloaded(array2)[0];
	}

	private int overloaded(string str)
	{
		return overloaded(str.GetHashCode() / 100000);
	}

	private int[] overloaded(int[] chr)
	{
		if (chr.Length > 1)
		{
			int num = chr[^1];
			int[] array = new int[chr.Length - 1];
			for (int i = 0; i < chr.Length - 1; i++)
			{
				array[i] = (num + chr[i]) % 255;
			}
			return overloaded(array);
		}
		return chr;
	}

	private int overloaded(int num)
	{
		if (num > 0)
		{
			if (num % 2 == 0)
			{
				return 3 + overloaded(num - 1);
			}
			return overloaded(num - 1) - 2;
		}
		if (num < 0)
		{
			if (num % 2 == 0)
			{
				return 3 + overloaded(num + 1);
			}
			return overloaded(num + 1) - 2;
		}
		return 1337;
	}
}
