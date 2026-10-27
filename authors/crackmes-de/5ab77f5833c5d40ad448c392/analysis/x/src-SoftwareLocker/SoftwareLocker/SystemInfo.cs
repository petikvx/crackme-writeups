using System;
using System.Management;
using System.Windows.Forms;

namespace SoftwareLocker;

internal static class SystemInfo
{
	public static bool UseProcessorID;

	public static bool UseBaseBoardProduct;

	public static bool UseBaseBoardManufacturer;

	public static bool UseDiskDriveSignature;

	public static bool UseVideoControllerCaption;

	public static bool UsePhysicalMediaSerialNumber;

	public static bool UseBiosVersion;

	public static bool UseBiosManufacturer;

	public static bool UseWindowsSerialNumber;

	public static string GetSystemInfo(string SoftwareName)
	{
		if (UseProcessorID)
		{
			SoftwareName += RunQuery("Processor", "ProcessorId");
		}
		if (UseBaseBoardProduct)
		{
			SoftwareName += RunQuery("BaseBoard", "Product");
		}
		if (UseBaseBoardManufacturer)
		{
			SoftwareName += RunQuery("BaseBoard", "Manufacturer");
		}
		if (UseDiskDriveSignature)
		{
			SoftwareName += RunQuery("DiskDrive", "Signature");
		}
		if (UseVideoControllerCaption)
		{
			SoftwareName += RunQuery("VideoController", "Caption");
		}
		if (UsePhysicalMediaSerialNumber)
		{
			SoftwareName += RunQuery("PhysicalMedia", "SerialNumber");
		}
		if (UseBiosVersion)
		{
			SoftwareName += RunQuery("BIOS", "Version");
		}
		if (UseWindowsSerialNumber)
		{
			SoftwareName += RunQuery("OperatingSystem", "SerialNumber");
		}
		SoftwareName = RemoveUseLess(SoftwareName);
		if (SoftwareName.Length < 25)
		{
			return GetSystemInfo(SoftwareName);
		}
		return SoftwareName.Substring(0, 25).ToUpper();
	}

	private static string RemoveUseLess(string st)
	{
		for (int num = st.Length - 1; num >= 0; num--)
		{
			char c = char.ToUpper(st[num]);
			if ((c < 'A' || c > 'Z') && (c < '0' || c > '9'))
			{
				st = st.Remove(num, 1);
			}
		}
		return st;
	}

	private static string RunQuery(string TableName, string MethodName)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Expected O, but got Unknown
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Expected O, but got Unknown
		ManagementObjectSearcher val = new ManagementObjectSearcher("Select * from Win32_" + TableName);
		ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
		try
		{
			while (enumerator.MoveNext())
			{
				ManagementObject val2 = (ManagementObject)enumerator.Current;
				try
				{
					return ((ManagementBaseObject)val2)[MethodName].ToString();
				}
				catch (Exception ex)
				{
					MessageBox.Show(ex.Message);
				}
			}
		}
		finally
		{
			((IDisposable)enumerator)?.Dispose();
		}
		return "";
	}
}
