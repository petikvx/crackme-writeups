using System;
using System.Windows.Forms;

namespace jim_dotnet_series_1;

internal static class Program
{
	[STAThread]
	private static void Main()
	{
		Application.EnableVisualStyles();
		Application.SetCompatibleTextRenderingDefault(false);
		Application.Run((Form)(object)new frm());
	}
}
