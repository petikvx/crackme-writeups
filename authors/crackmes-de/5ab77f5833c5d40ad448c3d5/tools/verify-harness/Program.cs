using System.Runtime.CompilerServices;
using System.Globalization;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
// Harnais : méthodes var1..var19 de Form1.cs (ilspycmd), TextBox/horloge remplacés par des champs.
class P {
 static string N,S1,S2,Result; static DateTime T;
	static object var1(string var1b)
	{
		string text = "";
		long num = 1L;
		long num2 = Strings.Len(var1b);
		checked
		{
			for (long num3 = num; num3 <= num2; num3++)
			{
				text += Conversions.ToString(Strings.Chr(Strings.Asc(Strings.Mid(var1b, (int)num3, 1)) + 6));
			}
			return text;
		}
	}

	static object var2()
	{
		return N;
	}

	static object var3()
	{
		return S1;
	}

	static object var4()
	{
		return S2;
	}

	static object var5()
	{
		string text = "";
		if (Operators.ConditionalCompareObjectNotEqual(var2(), (object)"", false))
		{
			string text2 = Conversions.ToString(var2());
			string text3 = Strings.Mid(text2, 1, 6);
			int num = Strings.Len(text3);
			for (int i = 1; i <= num; i = checked(i + 1))
			{
				text = text + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text3, i, 1)));
			}
			return text;
		}
		return 0;
	}

	static object var6()
	{
		string text = Conversions.ToString(var5());
		if (text.Contains("A"))
		{
			text = text.Replace("A", "");
		}
		if (text.Contains("B"))
		{
			text = text.Replace("B", "");
		}
		if (text.Contains("C"))
		{
			text = text.Replace("C", "");
		}
		if (text.Contains("D"))
		{
			text = text.Replace("D", "");
		}
		if (text.Contains("E"))
		{
			text = text.Replace("E", "");
		}
		if (text.Contains("F"))
		{
			text = text.Replace("F", "");
		}
		return text;
	}

	static object var7()
	{
		DateTime timeOfDay = T;
		return timeOfDay;
	}

	static object var8()
	{
		string text = Conversions.ToString(var7());
		return Strings.Mid(text, 1, 5);
	}

	static object var9()
	{
		string text = Conversions.ToString(var8());
		string text2 = text.Replace(":", "");
		int num = checked((int)Math.Round(Conversion.Val(text2)));
		return text2;
	}

	static object var10()
	{
		long num = checked((long)Math.Round(Conversion.Val(RuntimeHelpers.GetObjectValue(var6()))));
		return num;
	}

	static object var11()
	{
		string text = Conversions.ToLong(Operators.MultiplyObject(var10(), var9())).ToString();
		return Strings.Mid(text, 1, 11);
	}

	static object var12()
	{
		bool flag = Conversions.ToBoolean(LikeOperator.LikeObject(var3(), var11(), (CompareMethod)0));
		return flag;
	}

	static object var13()
	{
		string text = Conversions.ToString(NewLateBinding.LateGet(null, typeof(Interaction), "Environ", new object[1] { RuntimeHelpers.GetObjectValue(var1("]igjon_lH[g_")) }, (string[])null, (Type[])null, (bool[])null));
		if (Operators.CompareString(text, "", false) == 0)
		{
			text = "]igjon_ol";
		}
		return text;
	}

	static object var14()
	{
		string text = "";
		int num = Strings.Len(RuntimeHelpers.GetObjectValue(var13()));
		for (int i = 1; i <= num; i = checked(i + 1))
		{
			text = text + "" + Conversion.Hex(Strings.Asc(Strings.Mid(Conversions.ToString(var13()), i, 1)));
			string text2 = Strings.StrReverse(text);
		}
		return text;
	}

	static object var15()
	{
		string text = Conversions.ToString(var14());
		if (text.Contains("A"))
		{
			text = text.Replace("A", "");
		}
		if (text.Contains("B"))
		{
			text = text.Replace("B", "");
		}
		if (text.Contains("C"))
		{
			text = text.Replace("C", "");
		}
		if (text.Contains("D"))
		{
			text = text.Replace("D", "");
		}
		if (text.Contains("E"))
		{
			text = text.Replace("E", "");
		}
		if (text.Contains("F"))
		{
			text = text.Replace("F", "");
		}
		return text;
	}

	static object var16()
	{
		long num = checked((long)Math.Round(Conversion.Val(RuntimeHelpers.GetObjectValue(var15()))));
		string text = Conversions.ToLong(Operators.AddObject(Operators.AddObject((object)num, var10()), var9())).ToString();
		string text2 = Strings.StrReverse(text);
		string text3 = Strings.Mid(text2, 2, 12);
		return text2;
	}

	static object var17()
	{
		bool flag = Conversions.ToBoolean(LikeOperator.LikeObject(var4(), var16(), (CompareMethod)0));
		return flag;
	}

	static object var18()
	{
		if (Conversions.ToBoolean(Operators.AndObject(Operators.CompareObjectEqual(var12(), (object)true, false), Operators.CompareObjectEqual(var17(), (object)true, false))))
		{
			return 1;
		}
		return 0;
	}

	static object var19()
	{
		string text = Conversions.ToString(var1("L?ACMN?L?>"));
		string text2 = Conversions.ToString(var1("OHL?ACMN?L?>"));
		if (Operators.ConditionalCompareObjectEqual(var18(), (object)1, false))
		{
			Result = text;
			return 0;
		}
		Result = text2;
		return 0;
	}


 static void Main(string[] a){
  // args : name serial1 serial2 HH:MM culture
  CultureInfo.DefaultThreadCurrentCulture=CultureInfo.CurrentCulture=new CultureInfo(a[4]);
  N=a[0];S1=a[1];S2=a[2];var p=a[3].Split(':');
  T=new DateTime(1,1,1,int.Parse(p[0]),int.Parse(p[1]),0);
  var19(); Console.WriteLine(Result);
 }
}
