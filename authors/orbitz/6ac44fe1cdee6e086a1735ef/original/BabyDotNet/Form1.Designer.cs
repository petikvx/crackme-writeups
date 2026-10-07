namespace BabyDotNet
{
	// Token: 0x02000002 RID: 2
	public partial class Form1 : global::System.Windows.Forms.Form
	{
		// Token: 0x06000007 RID: 7 RVA: 0x000021A8 File Offset: 0x000003A8
		protected override void Dispose(bool disposing)
		{
			bool flag = disposing && this.components != null;
			if (flag)
			{
				this.components.Dispose();
			}
			base.Dispose(disposing);
		}

		// Token: 0x06000008 RID: 8 RVA: 0x000021E0 File Offset: 0x000003E0
		private void InitializeComponent()
		{
			this.usernamebox = new global::System.Windows.Forms.TextBox();
			this.passwordtextbox = new global::System.Windows.Forms.TextBox();
			this.username = new global::System.Windows.Forms.Label();
			this.label1 = new global::System.Windows.Forms.Label();
			this.button1 = new global::System.Windows.Forms.Button();
			base.SuspendLayout();
			this.usernamebox.BackColor = global::System.Drawing.SystemColors.ButtonHighlight;
			this.usernamebox.Cursor = global::System.Windows.Forms.Cursors.IBeam;
			this.usernamebox.Location = new global::System.Drawing.Point(193, 48);
			this.usernamebox.Multiline = true;
			this.usernamebox.Name = "usernamebox";
			this.usernamebox.RightToLeft = global::System.Windows.Forms.RightToLeft.No;
			this.usernamebox.Size = new global::System.Drawing.Size(509, 46);
			this.usernamebox.TabIndex = 0;
			this.passwordtextbox.Location = new global::System.Drawing.Point(193, 144);
			this.passwordtextbox.Multiline = true;
			this.passwordtextbox.Name = "passwordtextbox";
			this.passwordtextbox.Size = new global::System.Drawing.Size(509, 46);
			this.passwordtextbox.TabIndex = 1;
			this.passwordtextbox.UseSystemPasswordChar = true;
			this.passwordtextbox.TextChanged += new global::System.EventHandler(this.textBox2_TextChanged);
			this.username.AutoSize = true;
			this.username.Location = new global::System.Drawing.Point(74, 60);
			this.username.Name = "username";
			this.username.Size = new global::System.Drawing.Size(91, 25);
			this.username.TabIndex = 2;
			this.username.Text = "Username";
			this.label1.AutoSize = true;
			this.label1.Location = new global::System.Drawing.Point(74, 156);
			this.label1.Name = "label1";
			this.label1.Size = new global::System.Drawing.Size(87, 25);
			this.label1.TabIndex = 3;
			this.label1.Text = "Password";
			this.button1.Location = new global::System.Drawing.Point(305, 299);
			this.button1.Name = "button1";
			this.button1.Size = new global::System.Drawing.Size(184, 34);
			this.button1.TabIndex = 4;
			this.button1.Text = "Enter";
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new global::System.EventHandler(this.button1_Click_1);
			base.AutoScaleDimensions = new global::System.Drawing.SizeF(10f, 25f);
			base.AutoScaleMode = global::System.Windows.Forms.AutoScaleMode.Font;
			base.ClientSize = new global::System.Drawing.Size(800, 450);
			base.Controls.Add(this.button1);
			base.Controls.Add(this.label1);
			base.Controls.Add(this.username);
			base.Controls.Add(this.passwordtextbox);
			base.Controls.Add(this.usernamebox);
			base.Name = "Form1";
			this.Text = "Form1";
			base.ResumeLayout(false);
			base.PerformLayout();
		}

		// Token: 0x04000001 RID: 1
		private global::System.ComponentModel.IContainer components = null;

		// Token: 0x04000002 RID: 2
		private global::System.Windows.Forms.TextBox usernamebox;

		// Token: 0x04000003 RID: 3
		private global::System.Windows.Forms.TextBox passwordtextbox;

		// Token: 0x04000004 RID: 4
		private global::System.Windows.Forms.Label username;

		// Token: 0x04000005 RID: 5
		private global::System.Windows.Forms.Label label1;

		// Token: 0x04000006 RID: 6
		private global::System.Windows.Forms.Button button1;
	}
}
