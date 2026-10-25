using System;using System.Text;using System.Security.Cryptography;
class TB{public string Text="";}
class P{TB textBox1=new TB(),textBox2=new TB(),textBox3=new TB(),textBox4=new TB(),textBox5=new TB();

	private string getkey(string str)
	{
		MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
		byte[] bytes = Encoding.ASCII.GetBytes(str);
		int num = 0;
		bytes = mD5CryptoServiceProvider.ComputeHash(bytes);
		byte[] array = bytes;
		foreach (byte b in array)
		{
			num += b;
		}
		return num.ToString();
	}

	private bool checkkey()
	{
		string text = "16171011420002113600122240013020625";
		try
		{
			int num = Convert.ToInt32(textBox2.Text);
			int num2 = Convert.ToInt32(textBox3.Text);
			int num3 = Convert.ToInt32(textBox4.Text);
			int num4 = Convert.ToInt32(textBox5.Text);
			int num5 = 0;
			if (Convert.ToInt32(text.Substring(0, 2)) * num + Convert.ToInt32(text.Substring(2, 2)) * num2 + Convert.ToInt32(text.Substring(4, 2)) * num3 == Convert.ToInt32(text.Substring(30, 5)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(5, 1)) * num + Convert.ToInt32(text.Substring(6, 1)) * num2 + Convert.ToInt32(text.Substring(8, 1)) * num3 <= Convert.ToInt32(text.Substring(9, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(13, 1)) * num + Convert.ToInt32(text.Substring(14, 1)) * num2 + Convert.ToInt32(text.Substring(15, 1)) * num3 <= Convert.ToInt32(text.Substring(16, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(20, 1)) * num + Convert.ToInt32(text.Substring(21, 1)) * num2 + Convert.ToInt32(text.Substring(22, 1)) * num3 <= Convert.ToInt32(text.Substring(23, 4)))
			{
				num5++;
			}
			if (Convert.ToInt32(text.Substring(27, 1)) <= Convert.ToInt32(text.Substring(28, 2)))
			{
				num5++;
			}
			if (num5 == 5)
			{
				return true;
			}
			return false;
		}
		catch
		{
			return false;
		}
	}

	private void button1_Click(object sender, EventArgs e)
	{
		//IL_0138: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		if (textBox1.Text != "" && textBox2.Text != "" && textBox3.Text != "" && textBox4.Text != "" && textBox5.Text != "")
		{
			string text = textBox1.Text;
			int num = Convert.ToInt32(getkey(text));
			try
			{
				int num2 = Convert.ToInt32(textBox2.Text);
				int num3 = Convert.ToInt32(textBox3.Text);
				int num4 = Convert.ToInt32(textBox4.Text);
				int num5 = Convert.ToInt32(textBox5.Text);
				if (checkkey() && num5 == num)
				{
					Console.WriteLine("Hurray....you did it!!!!", "Success");
				}
				else
				{
					Console.WriteLine("Try,Try,Try......and Try again!", "Noooooo...");
				}
				return;
			}
			catch
			{
				return;
			}
		}
		Console.WriteLine("Hummm.....How about filling in the details?????", "Ha Ha");
	}

static void Main(string[] a){var p=new P();p.textBox1.Text=a[0];p.textBox2.Text=a[1];p.textBox3.Text=a[2];p.textBox4.Text=a[3];p.textBox5.Text=a[4];p.button1_Click(null,null);}}
