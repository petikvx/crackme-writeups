using System;
using System.Windows.Forms;

namespace BabyDotNet
{
	// Token: 0x02000003 RID: 3
	internal static class Program
	{
		// Token: 0x06000009 RID: 9 RVA: 0x00002544 File Offset: 0x00000744
		[STAThread]
		private static void Main()
		{
			ApplicationConfiguration.Initialize();
			Application.Run(new Form1());
		}
	}
}
