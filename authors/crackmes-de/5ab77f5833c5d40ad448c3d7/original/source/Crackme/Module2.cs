using System;
using System.Diagnostics;
using System.Windows.Forms;
using Crackme.My;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace Crackme;

[StandardModule]
internal sealed class Module2
{
	public static object var4()
	{
		return Interaction.Environ("UserName");
	}

	public static object var5()
	{
		string vr = Conversions.ToString(var4());
		vr = Conversions.ToString(Module1.var(vr));
		vr = Conversions.ToString(Module1.var1(vr));
		vr = Conversions.ToString(Module1.var2(vr));
		vr = Conversions.ToString(var6(vr));
		return Conversions.ToString(var10(vr));
	}

	public static object var6(string vr6)
	{
		if (vr6.Contains("A"))
		{
			vr6 = vr6.Replace("A", "");
		}
		if (vr6.Contains("B"))
		{
			vr6 = vr6.Replace("B", "");
		}
		if (vr6.Contains("C"))
		{
			vr6 = vr6.Replace("C", "");
		}
		if (vr6.Contains("D"))
		{
			vr6 = vr6.Replace("D", "");
		}
		if (vr6.Contains("E"))
		{
			vr6 = vr6.Replace("E", "");
		}
		if (vr6.Contains("F"))
		{
			vr6 = vr6.Replace("F", "");
		}
		return vr6;
	}

	public static object var10(string vr10)
	{
		string text = Conversions.ToString(Strings.Len(vr10));
		if (Conversions.ToDouble(text) > 10.0)
		{
			return Strings.Mid(vr10, 1, 10);
		}
		return vr10;
	}

	public static object clo()
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		if (Information.UBound((Array)Process.GetProcessesByName("Reflector"), 1) == 0)
		{
			MessageBox.Show("Close Reflector Please and Try again", "Error", (MessageBoxButtons)0, (MessageBoxIcon)64);
			((Form)MyProject.Forms.MainForm).Close();
			ProjectData.EndApp();
			return 0;
		}
		return 0;
	}
}
