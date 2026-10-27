using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace spaghettime;

public class frmAbout : Form
{
	private IContainer components;

	private Label label1;

	private GroupBox groupBox1;

	public frmAbout()
	{
		InitializeComponent();
	}

	private void frmAbout_MouseClick(object sender, MouseEventArgs e)
	{
		((Form)this).Close();
	}

	private void label1_Click(object sender, EventArgs e)
	{
		((Form)this).Close();
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
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_0190: Expected O, but got Unknown
		label1 = new Label();
		groupBox1 = new GroupBox();
		((Control)groupBox1).SuspendLayout();
		((Control)this).SuspendLayout();
		((Control)label1).AutoSize = true;
		((Control)label1).Location = new Point(6, 16);
		((Control)label1).Name = "label1";
		((Control)label1).Size = new Size(179, 91);
		((Control)label1).TabIndex = 0;
		((Control)label1).Text = "Code:    JiM~\r\nAudio:   cerror-ode_to_maktone.mod\r\n\r\nHave fun analysing my recursion! \r\nPatching is not valid, as always. \r\n\r\nI look forward to your solutions :)\r\n";
		((Control)label1).Click += label1_Click;
		((Control)groupBox1).Controls.Add((Control)(object)label1);
		((Control)groupBox1).Location = new Point(12, 3);
		((Control)groupBox1).Name = "groupBox1";
		((Control)groupBox1).Size = new Size(192, 114);
		((Control)groupBox1).TabIndex = 1;
		groupBox1.TabStop = false;
		((Control)groupBox1).Text = "About";
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(216, 129);
		((Control)this).Controls.Add((Control)(object)groupBox1);
		((Form)this).FormBorderStyle = (FormBorderStyle)0;
		((Control)this).Name = "frmAbout";
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).Text = "About";
		((Control)this).MouseClick += new MouseEventHandler(frmAbout_MouseClick);
		((Control)groupBox1).ResumeLayout(false);
		((Control)groupBox1).PerformLayout();
		((Control)this).ResumeLayout(false);
	}
}
