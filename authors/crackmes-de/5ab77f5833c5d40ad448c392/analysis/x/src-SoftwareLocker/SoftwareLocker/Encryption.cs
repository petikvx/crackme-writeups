using System;
using System.Text;

namespace SoftwareLocker;

internal static class Encryption
{
	public static string InverseByBase(string st, int MoveBase)
	{
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < st.Length; i += MoveBase)
		{
			int length = ((i + MoveBase <= st.Length - 1) ? MoveBase : (st.Length - i));
			stringBuilder.Append(InverseString(st.Substring(i, length)));
		}
		return stringBuilder.ToString();
	}

	public static string InverseString(string st)
	{
		StringBuilder stringBuilder = new StringBuilder();
		for (int num = st.Length - 1; num >= 0; num--)
		{
			stringBuilder.Append(st[num]);
		}
		return stringBuilder.ToString();
	}

	public static string ConvertToLetterDigit(string st)
	{
		StringBuilder stringBuilder = new StringBuilder();
		foreach (char c in st)
		{
			if (!char.IsLetterOrDigit(c))
			{
				stringBuilder.Append(Convert.ToInt16(c).ToString());
			}
			else
			{
				stringBuilder.Append(c);
			}
		}
		return stringBuilder.ToString();
	}

	public static string Boring(string st)
	{
		for (int i = 0; i < st.Length; i++)
		{
			int num = i * Convert.ToUInt16(st[i]);
			num %= st.Length;
			char c = st[i];
			st = st.Remove(i, 1);
			st = st.Insert(num, c.ToString());
		}
		return st;
	}

	public static string MakePassword(string st, string Identifier)
	{
		if (Identifier.Length != 3)
		{
			throw new ArgumentException("Identifier must be 3 character length");
		}
		int[] array = new int[3]
		{
			Convert.ToInt32(Identifier[0].ToString(), 10),
			Convert.ToInt32(Identifier[1].ToString(), 10),
			Convert.ToInt32(Identifier[2].ToString(), 10)
		};
		st = Boring(st);
		st = InverseByBase(st, array[0]);
		st = InverseByBase(st, array[1]);
		st = InverseByBase(st, array[2]);
		StringBuilder stringBuilder = new StringBuilder();
		string text = st;
		foreach (char ch in text)
		{
			stringBuilder.Append(ChangeChar(ch, array));
		}
		return stringBuilder.ToString();
	}

	private static char ChangeChar(char ch, int[] EnCode)
	{
		ch = char.ToUpper(ch);
		if (ch >= 'A' && ch <= 'H')
		{
			return Convert.ToChar(Convert.ToInt16(ch) + 2 * EnCode[0]);
		}
		if (ch >= 'I' && ch <= 'P')
		{
			return Convert.ToChar(Convert.ToInt16(ch) - EnCode[2]);
		}
		if (ch >= 'Q' && ch <= 'Z')
		{
			return Convert.ToChar(Convert.ToInt16(ch) - EnCode[1]);
		}
		if (ch >= '0' && ch <= '4')
		{
			return Convert.ToChar(Convert.ToInt16(ch) + 5);
		}
		if (ch >= '5' && ch <= '9')
		{
			return Convert.ToChar(Convert.ToInt16(ch) - 5);
		}
		return '0';
	}
}
