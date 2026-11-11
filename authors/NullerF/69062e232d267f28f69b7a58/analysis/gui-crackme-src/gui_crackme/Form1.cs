using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace gui_crackme;

public class Form1 : Form
{
	private IContainer components = null;

	private Label label1;

	private GroupBox groupBox1;

	private TextBox FormName;

	private Button button1;

	private Label label2;

	public Form1()
	{
		InitializeComponent();
	}

	private void Form1_Load(object sender, EventArgs e)
	{
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		if (((Control)FormName).Text == "sk-189")
		{
			DialogResult val = MessageBox.Show("CORRECT!");
		}
		else
		{
			DialogResult val2 = MessageBox.Show("incorret :/");
		}
	}

	private void label1_Click(object sender, EventArgs e)
	{
	}

	private void label2_Click(object sender, EventArgs e)
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
		//IL_033f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0349: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		label1 = new Label();
		groupBox1 = new GroupBox();
		button1 = new Button();
		FormName = new TextBox();
		label2 = new Label();
		((Control)groupBox1).SuspendLayout();
		((Control)this).SuspendLayout();
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(12, 91);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(54, 13);
		((Control)label1).TabIndex = 0;
		((Control)label1).Text = "by NullerF";
		((Control)label1).Click += label1_Click;
		((Control)groupBox1).Controls.Add((Control)(object)FormName);
		((Control)groupBox1).Controls.Add((Control)(object)button1);
		((Control)groupBox1).Location = new Point(13, 13);
		((Control)groupBox1).Name = "groupBox1";
		((Control)groupBox1).Size = new Size(259, 75);
		((Control)groupBox1).TabIndex = 1;
		groupBox1.TabStop = false;
		((Control)groupBox1).Text = "Activation";
		((Control)button1).Location = new Point(7, 46);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(246, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Activate";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)FormName).Location = new Point(7, 20);
		((Control)FormName).Name = "FormName";
		((Control)FormName).Size = new Size(246, 20);
		((Control)FormName).TabIndex = 1;
		((Control)FormName).Text = "Maybe 123?";
		((Control)label2).AutoSize = true;
		((Control)label2).Location = new Point(118, 91);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(154, 13);
		((Control)label2).TabIndex = 3;
		((Control)label2).Text = "enter the correct activation key";
		((Control)label2).Click += label2_Click;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(283, 120);
		((Control)this).Controls.Add((Control)(object)label2);
		((Control)this).Controls.Add((Control)(object)groupBox1);
		((Control)this).Controls.Add((Control)(object)label1);
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Control)this).Name = "Form1";
		((Control)this).Text = "Crackme";
		((Form)this).Load += Form1_Load;
		((Control)groupBox1).ResumeLayout(false);
		((Control)groupBox1).PerformLayout();
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}
}
