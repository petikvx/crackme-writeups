using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Win32;

namespace WindowsFormsApp8;

internal class gwaog4a8gpjsr89r5
{
	[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
	private static extern bool GetVolumeInformation(string rootPathName, StringBuilder volumeNameBuffer, int volumeNameSize, out uint volumeSerialNumber, out uint maximumComponentLength, out uint fileSystemFlags, StringBuilder fileSystemNameBuffer, int fileSystemNameSize);

	public static string GetPcHash()
	{
		string rawData = GetMachineGuid() + GetVolumeSerial();
		return ComputeSha256(rawData);
	}

	private static string GetMachineGuid()
	{
		try
		{
			using RegistryKey registryKey = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64);
			using RegistryKey registryKey2 = registryKey.OpenSubKey("SOFTWARE\\Microsoft\\Cryptography");
			if (registryKey2 != null)
			{
				return registryKey2.GetValue("MachineGuid")?.ToString() ?? "";
			}
		}
		catch
		{
		}
		return "";
	}

	private static string GetVolumeSerial()
	{
		try
		{
			if (GetVolumeInformation("C:\\", null, 0, out var volumeSerialNumber, out var _, out var _, null, 0))
			{
				return volumeSerialNumber.ToString("X");
			}
		}
		catch
		{
		}
		return "";
	}

	private static string ComputeSha256(string rawData)
	{
		using SHA256 sHA = SHA256.Create();
		byte[] array = sHA.ComputeHash(Encoding.UTF8.GetBytes(rawData));
		StringBuilder stringBuilder = new StringBuilder();
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			stringBuilder.Append(b.ToString("x2"));
		}
		return stringBuilder.ToString();
	}
}
