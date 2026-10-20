using System;

namespace Encrypter.Goodies;

internal class Engine
{
	private Random random = new Random();

	public string pump(string str, bool check)
	{
		char[] array = str.ToCharArray();
		string[] array2 = new string[array.Length];
		string text = "";
		if (check)
		{
			for (int i = 0; i < str.Length; i++)
			{
				array2[i] = Convert.ToString((double)(int)array[i] + ran(str.Length));
				text += array2[i];
			}
		}
		else
		{
			for (int i = 0; i < str.Length; i++)
			{
				array2[i] = Convert.ToString((int)array[i]);
				text += array2[i];
			}
		}
		return text;
	}

	private double ran(int l)
	{
		double num = 0.0;
		for (int i = 0; i < l * 2; i++)
		{
			num = ((i % 2 != 0) ? (num + (num * 2.0 + 0.0)) : (num + (num * 2.0 + (double)(random.Next(0, 2) * (i ^ 6)))));
		}
		return num;
	}
}
