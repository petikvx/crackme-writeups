using System;
using System.Windows.Forms;
using SoftwareLocker;

namespace CrackMe;

internal static class Program
{
	[STAThread]
	private static void Main()
	{
		Application.EnableVisualStyles();
		Application.SetCompatibleTextRenderingDefault(false);
		TrialMaker trialMaker = new TrialMaker("CrackMe", Application.StartupPath + "\\RegFile.reg", Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\TMSetp.dbf", "CrackMe - Jammmie999", 5, 10, "999");
		byte[] tripleDESKey = new byte[24]
		{
			97, 250, 1, 5, 84, 21, 7, 63, 4, 54,
			87, 56, 123, 10, 3, 62, 7, 9, 20, 36,
			37, 21, 101, 57
		};
		trialMaker.TripleDESKey = tripleDESKey;
		bool isTrial;
		switch (trialMaker.ShowDialog())
		{
		case TrialMaker.RunTypes.Full:
			isTrial = false;
			break;
		default:
			isTrial = true;
			break;
		case TrialMaker.RunTypes.Expired:
			return;
		}
		Application.Run((Form)(object)new Form1(isTrial));
	}
}
