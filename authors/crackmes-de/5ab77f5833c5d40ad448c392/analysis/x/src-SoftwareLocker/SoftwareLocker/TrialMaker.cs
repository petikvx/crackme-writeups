using System;
using System.IO;
using System.Windows.Forms;
using Microsoft.VisualBasic;

namespace SoftwareLocker;

public class TrialMaker
{
	public enum RunTypes
	{
		Trial,
		Full,
		Expired,
		UnKnown
	}

	private string _BaseString;

	private string _Password;

	private string _SoftName;

	private string _RegFilePath;

	private string _HideFilePath;

	private int _DefDays;

	private int _Runed;

	private string _Text;

	private string _Identifier;

	public string RegFilePath
	{
		get
		{
			return _RegFilePath;
		}
		set
		{
			_RegFilePath = value;
		}
	}

	public string HideFilePath
	{
		get
		{
			return _HideFilePath;
		}
		set
		{
			_HideFilePath = value;
		}
	}

	public int TrialPeriodDays => _DefDays;

	public byte[] TripleDESKey
	{
		get
		{
			return FileReadWrite.key;
		}
		set
		{
			FileReadWrite.key = value;
		}
	}

	public bool UseProcessorID
	{
		get
		{
			return SystemInfo.UseProcessorID;
		}
		set
		{
			SystemInfo.UseProcessorID = value;
		}
	}

	public bool UseBaseBoardProduct
	{
		get
		{
			return SystemInfo.UseBaseBoardProduct;
		}
		set
		{
			SystemInfo.UseBaseBoardProduct = value;
		}
	}

	public bool UseBaseBoardManufacturer
	{
		get
		{
			return SystemInfo.UseBiosManufacturer;
		}
		set
		{
			SystemInfo.UseBiosManufacturer = value;
		}
	}

	public bool UseDiskDriveSignature
	{
		get
		{
			return SystemInfo.UseDiskDriveSignature;
		}
		set
		{
			SystemInfo.UseDiskDriveSignature = value;
		}
	}

	public bool UseVideoControllerCaption
	{
		get
		{
			return SystemInfo.UseVideoControllerCaption;
		}
		set
		{
			SystemInfo.UseVideoControllerCaption = value;
		}
	}

	public bool UsePhysicalMediaSerialNumber
	{
		get
		{
			return SystemInfo.UsePhysicalMediaSerialNumber;
		}
		set
		{
			SystemInfo.UsePhysicalMediaSerialNumber = value;
		}
	}

	public bool UseBiosVersion
	{
		get
		{
			return SystemInfo.UseBiosVersion;
		}
		set
		{
			SystemInfo.UseBiosVersion = value;
		}
	}

	public bool UseBiosManufacturer
	{
		get
		{
			return SystemInfo.UseBiosManufacturer;
		}
		set
		{
			SystemInfo.UseBiosManufacturer = value;
		}
	}

	public bool UseWindowsSerialNumber
	{
		get
		{
			return SystemInfo.UseWindowsSerialNumber;
		}
		set
		{
			SystemInfo.UseWindowsSerialNumber = value;
		}
	}

	public TrialMaker(string SoftwareName, string RegFilePath, string HideFilePath, string Text, int TrialDays, int TrialRunTimes, string Identifier)
	{
		_SoftName = SoftwareName;
		_Identifier = Identifier;
		SetDefaults();
		_DefDays = TrialDays;
		_Runed = TrialRunTimes;
		_RegFilePath = RegFilePath;
		_HideFilePath = HideFilePath;
		_Text = Text;
	}

	private void SetDefaults()
	{
		SystemInfo.UseBaseBoardManufacturer = false;
		SystemInfo.UseBaseBoardProduct = true;
		SystemInfo.UseBiosManufacturer = false;
		SystemInfo.UseBiosVersion = true;
		SystemInfo.UseDiskDriveSignature = true;
		SystemInfo.UsePhysicalMediaSerialNumber = false;
		SystemInfo.UseProcessorID = true;
		SystemInfo.UseVideoControllerCaption = false;
		SystemInfo.UseWindowsSerialNumber = false;
		MakeBaseString();
		MakePassword();
	}

	private void MakeBaseString()
	{
		_BaseString = Encryption.Boring(Encryption.InverseByBase(SystemInfo.GetSystemInfo(_SoftName), 10));
	}

	private void MakePassword()
	{
		_Password = Encryption.MakePassword(_BaseString, _Identifier);
	}

	public RunTypes ShowDialog()
	{
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Invalid comparison between Unknown and I4
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Invalid comparison between Unknown and I4
		if (CheckRegister())
		{
			return RunTypes.Full;
		}
		frmDialog frmDialog2 = new frmDialog(_BaseString, _Password, DaysToEnd(), _Runed, _Text);
		MakeHideFile();
		DialogResult val = ((Form)frmDialog2).ShowDialog();
		if ((int)val == 1)
		{
			MakeRegFile();
			return RunTypes.Full;
		}
		if ((int)val == 4)
		{
			return RunTypes.Trial;
		}
		return RunTypes.Expired;
	}

	private void MakeRegFile()
	{
		FileReadWrite.WriteFile(_RegFilePath, _Password);
	}

	private bool CheckRegister()
	{
		string text = FileReadWrite.ReadFile(_RegFilePath);
		if (_Password == text)
		{
			return true;
		}
		return false;
	}

	private int DaysToEnd()
	{
		FileInfo fileInfo = new FileInfo(_HideFilePath);
		if (!fileInfo.Exists)
		{
			MakeHideFile();
			return _DefDays;
		}
		return CheckHideFile();
	}

	private void MakeHideFile()
	{
		string text = DateTime.Now.Ticks + ";";
		object obj = text;
		text = string.Concat(obj, _DefDays, ";", _Runed, ";", _BaseString);
		FileReadWrite.WriteFile(_HideFilePath, text);
	}

	private int CheckHideFile()
	{
		string[] array = FileReadWrite.ReadFile(_HideFilePath).Split(new char[1] { ';' });
		if (_BaseString == array[3])
		{
			int num = Convert.ToInt32(array[1]);
			if (num <= 0)
			{
				_Runed = 0;
				_DefDays = 0;
				return 0;
			}
			long value = DateAndTime.DateDiff((DateInterval)4, new DateTime(Convert.ToInt64(array[0])).Date, DateTime.Now.Date, (FirstDayOfWeek)7, (FirstWeekOfYear)3);
			num = Convert.ToInt32(array[1]);
			_Runed = Convert.ToInt32(array[2]);
			_Runed--;
			value = Math.Abs(value);
			_DefDays = num - Convert.ToInt32(value);
		}
		return _DefDays;
	}
}
