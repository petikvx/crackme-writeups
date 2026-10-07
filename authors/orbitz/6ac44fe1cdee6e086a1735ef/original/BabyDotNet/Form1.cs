using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;

namespace BabyDotNet
{
	// Token: 0x02000002 RID: 2
	public partial class Form1 : Form
	{
		// Token: 0x06000001 RID: 1 RVA: 0x00002050 File Offset: 0x00000250
		public Form1()
		{
			this.InitializeComponent();
			this.passwordtextbox.UseSystemPasswordChar = true;
		}

		// Token: 0x06000002 RID: 2 RVA: 0x00002075 File Offset: 0x00000275
		[NullableContext(1)]
		private void button1_Click(object sender, EventArgs e)
		{
		}

		// Token: 0x06000003 RID: 3 RVA: 0x00002078 File Offset: 0x00000278
		[NullableContext(1)]
		private void textBox2_TextChanged(object sender, EventArgs e)
		{
		}

		// Token: 0x06000004 RID: 4 RVA: 0x0000207C File Offset: 0x0000027C
		[NullableContext(1)]
		private void button1_Click_1(object sender, EventArgs e)
		{
			string text = this.usernamebox.Text;
			string text2 = this.passwordtextbox.Text;
			string text3 = this.PassEnc("\"@@F ");
			string text4 = this.NameEnc("JEsxTEw=");
			bool flag = text == text4 && text2 == text3;
			if (flag)
			{
				DefaultInterpolatedStringHandler defaultInterpolatedStringHandler;
				defaultInterpolatedStringHandler..ctor(6, 2);
				defaultInterpolatedStringHandler.AppendLiteral("CMO{");
				defaultInterpolatedStringHandler.AppendFormatted(text4);
				defaultInterpolatedStringHandler.AppendLiteral("_");
				defaultInterpolatedStringHandler.AppendFormatted(text3);
				defaultInterpolatedStringHandler.AppendLiteral("}");
				string str = defaultInterpolatedStringHandler.ToStringAndClear();
				MessageBox.Show("GG, YOU WIN!!\n\nFLAG: " + str);
			}
			else
			{
				MessageBox.Show("Invalid username or password.");
			}
		}

		// Token: 0x06000005 RID: 5 RVA: 0x00002144 File Offset: 0x00000344
		[NullableContext(1)]
		private string PassEnc(string password)
		{
			char[] array = password.ToCharArray();
			for (int i = 0; i < array.Length; i++)
			{
				array[i] ^= '\u0013';
			}
			return new string(array);
		}

		// Token: 0x06000006 RID: 6 RVA: 0x00002184 File Offset: 0x00000384
		[NullableContext(1)]
		private string NameEnc(string username)
		{
			byte[] array = Convert.FromBase64String(username);
			return Encoding.UTF8.GetString(array);
		}
	}
}
