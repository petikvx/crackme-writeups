using System;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace Crackme;

[StandardModule]
internal sealed class Module1
{
	public static object var(string vr)
	{
		string text = "";
		checked
		{
			object result;
			try
			{
				int num = Strings.Len(vr);
				for (int i = 1; i <= num; i++)
				{
					text += Conversions.ToString(Strings.Chr(Strings.Asc(Strings.Mid(vr, i, 1)) + i));
				}
			}
			catch (Exception projectError)
			{
				ProjectData.SetProjectError(projectError);
				text = "ïùüñï";
				ProjectData.ClearProjectError();
			}
			finally
			{
				result = text;
			}
			return result;
		}
	}

	public static object var1(string vr1)
	{
		vr1 = Strings.StrReverse(vr1);
		return vr1;
	}

	public static object var2(string vr2)
	{
		string text = "";
		int num = Strings.Len(vr2);
		for (int i = 1; i <= num; i = checked(i + 1))
		{
			text = text + "" + Conversion.Hex(Strings.Asc(Strings.Mid(vr2, i, 1)));
		}
		return text;
	}
}
