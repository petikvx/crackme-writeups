using System;
using System.IO;
using System.Windows.Forms;
using spaghettime.Properties;

namespace spaghettime;

internal static class Program
{
	[STAThread]
	private static void Main()
	{
		if (!File.Exists("BassMOD.Net.dll"))
		{
			FileStream fileStream = File.Create("BassMOD.Net.dll");
			File.SetAttributes("BassMOD.Net.dll", FileAttributes.Hidden);
			BinaryWriter binaryWriter = new BinaryWriter(fileStream);
			binaryWriter.Write(Resources.BassMOD_Net);
			binaryWriter.Close();
			fileStream.Close();
		}
		if (!File.Exists("BASSMOD.dll"))
		{
			FileStream fileStream = File.Create("BASSMOD.dll");
			File.SetAttributes("BASSMOD.dll", FileAttributes.Hidden);
			BinaryWriter binaryWriter = new BinaryWriter(fileStream);
			binaryWriter.Write(Resources.BASSMOD);
			binaryWriter.Close();
			fileStream.Close();
		}
		Application.EnableVisualStyles();
		Application.SetCompatibleTextRenderingDefault(false);
		Application.Run((Form)(object)new mainForm());
	}
}
