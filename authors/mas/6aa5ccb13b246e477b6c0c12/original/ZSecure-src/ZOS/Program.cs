using System;
using System.Windows.Forms;
using ZOS.Forms;

namespace ZOS;

internal static class Program
{
	[STAThread]
	private static void Main()
	{
		Application.EnableVisualStyles();
		Application.SetCompatibleTextRenderingDefault(false);
		Application.Run((Form)(object)new BootGateForm());
	}
}
