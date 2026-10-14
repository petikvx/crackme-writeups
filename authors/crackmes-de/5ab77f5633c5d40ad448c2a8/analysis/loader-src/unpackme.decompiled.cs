using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

[assembly: CLSCompliant(true)]
[assembly: Guid("7A1368C6-1694-498F-BE80-8F59B099944A")]
[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("")]
[assembly: Dotfuscator(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("")]
[assembly: AssemblyVersion("1.0.2790.20295")]
public class a : Form
{
	[AccessedThroughProperty("Button1")]
	private Button m_a;

	[AccessedThroughProperty("Label1")]
	private Label m_b;

	private IContainer m_c;

	public byte[] d;

	public byte[] e;

	public byte[] f;

	[STAThread]
	public static void Main()
	{
		Application.Run((Form)(object)new a());
	}

	public a()
	{
		this.d = new byte[600001];
		e = new byte[600001];
		f = new byte[600001];
		a();
	}

	protected override void a(bool A_0)
	{
		if (A_0 && this.m_c != null)
		{
			this.m_c.Dispose();
		}
		base.Dispose(A_0);
	}

	[SpecialName]
	internal virtual Label d()
	{
		return this.m_b;
	}

	[MethodImpl(MethodImplOptions.Synchronized)]
	[SpecialName]
	internal virtual void a(Label A_0)
	{
		if (this.m_b != null)
		{
			((Control)(object)this.m_b).Click -= a;
		}
		this.m_b = A_0;
		if (this.m_b != null)
		{
			((Control)(object)this.m_b).Click += a;
		}
	}

	[SpecialName]
	internal virtual Button b()
	{
		return this.m_a;
	}

	[MethodImpl(MethodImplOptions.Synchronized)]
	[SpecialName]
	internal virtual void a(Button A_0)
	{
		if (this.m_a != null)
		{
			((Control)(object)this.m_a).Click -= b;
		}
		this.m_a = A_0;
		if (this.m_a != null)
		{
			((Control)(object)this.m_a).Click += b;
		}
	}

	[DebuggerStepThrough]
	private void a()
	{
		a(new Label());
		a(new Button());
		((Control)(object)this).SuspendLayout();
		d().BorderStyle = (BorderStyle)2;
		Label obj = d();
		Point location = new Point(8, 16);
		((Control)(object)obj).Location = location;
		((Control)(object)d()).Name = "Label1";
		Label obj2 = d();
		Size size = new Size(304, 96);
		((Control)(object)obj2).Size = size;
		((Control)(object)d()).TabIndex = 0;
		((Control)(object)d()).Text = "This is the first installment in what I hope to be a series of unpackmes about a little .NET protector I am writing that is currently in the works. This is a very simple shell of the protector in question, I plan to add more features later once I see how you guys handle it. This nag should not be present in the unpacked version of the protector, since it is part of the loader. Enjoy ;) ";
		Button obj3 = b();
		location = new Point(120, 120);
		((Control)(object)obj3).Location = location;
		((Control)(object)b()).Name = "Button1";
		((Control)(object)b()).TabIndex = 1;
		((Control)(object)b()).Text = "Open";
		size = new Size(5, 13);
		((Form)(object)this).AutoScaleBaseSize = size;
		size = new Size(320, 148);
		((Form)(object)this).ClientSize = size;
		((Control)(object)this).Controls.Add((Control)(object)b());
		((Control)(object)this).Controls.Add((Control)(object)d());
		((Control)(object)this).Name = "Form1";
		((Control)(object)this).Text = "Protected With Cryxe";
		((Control)(object)this).ResumeLayout(false);
	}

	private void a(object A_0, EventArgs A_1)
	{
	}

	public void b(object A_0, EventArgs A_1)
	{
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		object obj = 600000;
		int num = 0;
		int i = 0;
		object objectValue = RuntimeHelpers.GetObjectValue(new object());
		int num2 = 4;
		int num3 = 5;
		checked
		{
			num3 = num2 * num3;
			string text = "08w357djf30dfh+//dgjd=a";
			int num4 = 99;
			int num5 = IsDebuggerPresent() + num4;
			if (num5 == 99)
			{
				num4 = 99;
				int num6 = 89;
				int num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				int num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				int num9 = num4 + num6;
				num9 = num6 - 99;
				text = 37.ToString("x");
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				int num10 = int.Parse(text, NumberStyles.HexNumber);
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				FileStream fileStream;
				for (fileStream = new FileStream("cryxed.dll", FileMode.Open, FileAccess.Read, FileShare.Read, IntegerType.FromObject(obj)); i < fileStream.Length; i += num)
				{
					num = fileStream.Read(this.d, i, IntegerType.FromObject(obj));
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
				}
				fileStream.Close();
				int j;
				for (j = 0; j < i; j++)
				{
					num9 = this.d[j] - 1;
					num2 = 4;
					num3 = 5;
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					num9 ^= num10;
					num2 += num3;
					num3 = num2 * num3;
					if (num9 > 255)
					{
						num2 = 128;
						num3 = num2 * 2;
						num9 -= num3;
					}
					if (num9 < 0)
					{
						num3 = 128;
						num2 = num3 * 2;
						num4 = 99;
						num6 = 89;
						num7 = num4 * num6;
						if (num4 > num7)
						{
							num4 = 1171 + num6;
						}
						num8 = num7 - num4;
						num4 = 138 + num6;
						num8 = num4 + num6;
						num9 += num2;
					}
					e[j] = (byte)(num9 + f[j]);
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					this.d[j] = f[j];
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					this.d[j] = (byte)unchecked(e[j] - this.d[j]);
					e[j] = 98;
					f[j] = 55;
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					num7 = 89;
					e[j] = (byte)num7;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = 88;
					f[j] = (byte)num8;
					num8 = num4 + num6;
				}
				((Form)(object)this).Close();
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				Thread thread = new Thread(c);
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				thread.Start();
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				num4 = num6;
				j = num4 - num6;
				Thread.Sleep(1000);
				int num11 = j;
				int num12 = this.d[4];
				int num13 = this.d[1] + 968;
				num11 = num12 - num13;
				num12 *= 2;
				num13 = num12 + num11;
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				j = 0;
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				while (j < i)
				{
					num11 = j;
					num12 = this.d[4];
					num13 = this.d[1] + 968;
					num11 = num12 - num13;
					num12 *= 2;
					num13 = num12 + num11;
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					this.d[j] = 0;
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					num11 = j;
					num12 = this.d[4];
					num13 = this.d[1] + 968;
					num11 = num12 - num13;
					num12 *= 2;
					num13 = num12 + num11;
					num11 = j;
					num12 = this.d[4];
					num13 = this.d[1] + 968;
					num11 = num12 - num13;
					num12 *= 2;
					num13 = num12 + num11;
					j++;
					num4 = 99;
					num6 = 89;
					num7 = num4 * num6;
					if (num4 > num7)
					{
						num4 = 1171 + num6;
					}
					num8 = num7 - num4;
					num4 = 138 + num6;
					num8 = num4 + num6;
					num11 = j;
					num12 = this.d[4];
					num13 = this.d[1] + 968;
					num11 = num12 - num13;
					num12 *= 2;
					num13 = num12 + num11;
				}
				num11 = j;
				num12 = this.d[4];
				num13 = this.d[1] + 968;
				num11 = num12 - num13;
				num12 *= 2;
				num13 = num12 + num11;
				num4 = 99;
				num6 = 89;
				num7 = num4 * num6;
				if (num4 > num7)
				{
					num4 = 1171 + num6;
				}
				num8 = num7 - num4;
				num4 = 138 + num6;
				num8 = num4 + num6;
				num11 = j;
				num12 = this.d[4];
				num13 = this.d[1] + 968;
				num11 = num12 - num13;
				num12 *= 2;
				num13 = num12 + num11;
				num11 = j;
				num12 = this.d[4];
				num13 = this.d[1] + 968;
				num11 = num12 - num13;
				num12 *= 2;
				num13 = num12 + num11;
				num11 = j;
				num12 = this.d[4];
				num13 = this.d[1] + 968;
				num11 = num12 - num13;
				num12 *= 2;
				num13 = num12 + num11;
			}
			else
			{
				MessageBox.Show(a("kom/Wb1qG5J5yRbp+B54JwzltwjWSOeCJZF0EKYHe5lNTUgUJzy8JQkHkl/OaQpVDwC/vMPmj0f1b0YXPAtOsw==", "1357924680"));
			}
		}
	}

	public void c()
	{
		Assembly.Load(this.d).EntryPoint.Invoke(null, null);
	}

	[DllImport("kernel32", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
	public static extern int IsDebuggerPresent();

	public string a(string A_0, string A_1)
	{
		byte[] rgbIV = new byte[16]
		{
			121, 241, 10, 1, 132, 74, 11, 39, 255, 91,
			45, 78, 14, 211, 22, 62
		};
		RijndaelManaged rijndaelManaged = new RijndaelManaged();
		string empty = string.Empty;
		byte[] array = Convert.FromBase64String(A_0);
		int num = Strings.Len(A_1);
		checked
		{
			if (num >= 32)
			{
				A_1 = Strings.Left(A_1, 32);
			}
			else
			{
				num = Strings.Len(A_1);
				int num2 = 32 - num;
				A_1 += Strings.StrDup(num2, "X");
			}
			byte[] bytes = Encoding.ASCII.GetBytes(A_1.ToCharArray());
			byte[] array2 = new byte[array.Length + 1];
			MemoryStream memoryStream = new MemoryStream(array);
			try
			{
				CryptoStream cryptoStream = new CryptoStream(memoryStream, rijndaelManaged.CreateDecryptor(bytes, rgbIV), CryptoStreamMode.Read);
				cryptoStream.Read(array2, 0, array2.Length);
				cryptoStream.FlushFinalBlock();
				memoryStream.Close();
				cryptoStream.Close();
			}
			catch (Exception projectError)
			{
				ProjectData.SetProjectError(projectError);
				ProjectData.ClearProjectError();
			}
			return a(Encoding.ASCII.GetString(array2));
		}
	}

	public string a(string A_0)
	{
		int num = 1;
		string text = A_0;
		while (num > 0)
		{
			num = Strings.InStr(num, A_0, "\0", (CompareMethod)0);
			if (num > 0)
			{
				text = checked(Strings.Left(text, num - 1) + Strings.Right(text, Strings.Len(text) - num));
			}
			if (num > text.Length)
			{
				break;
			}
		}
		return text;
	}
}
[AttributeUsage(AttributeTargets.Assembly)]
public sealed class DotfuscatorAttribute : Attribute
{
	private string a;

	public string A => a;

	public DotfuscatorAttribute(string a)
	{
		this.a = a;
	}
}
