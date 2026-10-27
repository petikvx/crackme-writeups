using System;
using System.Globalization;
using System.Text;

namespace _;

public class SuperString
{
	private string str;

	public SuperString(string s)
	{
		str = s;
	}

	public SuperString(SuperString s)
	{
		str = new SuperString(s.str.ToUpper()).str;
	}

	public void expand()
	{
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i <= str.Length - 2; i += 2)
		{
			stringBuilder.Append(Convert.ToString(Convert.ToChar(int.Parse(str.Substring(i, 2), NumberStyles.HexNumber))));
		}
		str = stringBuilder.ToString();
	}

	public bool Equals(SuperString s)
	{
		return str.Equals(s.str);
	}

	public SuperString Add(SuperString s)
	{
		return new SuperString(str + s.str);
	}

	public static SuperString operator +(SuperString a, SuperString b)
	{
		string text = a.str;
		string text2 = b.str;
		for (int i = 1; i < text.Length; i++)
		{
			text = text.Substring(i) + text.Substring(0, i);
		}
		for (int i = 1; i < text2.Length; i++)
		{
			text2 = text2.Substring(text2.Length - i) + text2.Substring(0, text2.Length - i);
		}
		return new SuperString(text2 + "X" + text);
	}

	public override string ToString()
	{
		return str;
	}
}
