using System;
using System.Collections.Generic;
using System.Text;

namespace aOHhXzjqVuPWkNDz;

public class fDQKcKxlXNggQrcWJKGdlYnnbCT
{
	[Attribute("Skip")]
	public static string luluGMoeF(byte[] P_0, int P_1)
	{
		string text = string.Empty;
		if (global::_003CModule_003E.xDKvAmCJFC == null)
		{
			global::_003CModule_003E.xDKvAmCJFC = new Dictionary<string, string>();
		}
		Dictionary<string, string> xDKvAmCJFC = global::_003CModule_003E.xDKvAmCJFC;
		string key = Convert.ToBase64String(P_0) + P_1;
		lock (xDKvAmCJFC)
		{
			if (global::_003CModule_003E.xDKvAmCJFC.ContainsKey(key))
			{
				text = global::_003CModule_003E.xDKvAmCJFC[key];
			}
			else
			{
				byte[] array = new byte[P_0.Length];
				for (int i = 0; i < P_0.Length; i++)
				{
					array[i] = (byte)(P_0[i] ^ (P_1 >> i % 4 * 8));
				}
				text = Encoding.UTF8.GetString(array);
				global::_003CModule_003E.xDKvAmCJFC[key] = text;
			}
		}
		return text;
	}
}
