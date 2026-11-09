using System;
using System.Security.Cryptography;
using System.Text;

namespace ZOS;

public static class GameState
{
	private enum ChallengeField
	{
		Address,
		Port,
		Algorithm,
		WinAddress
	}

	private static class ReverseChallenge
	{
		private static readonly int[] switchTable = new int[7] { 2, 0, 3, 1, 4, 6, 5 };

		private static readonly byte[][] records = new byte[4][]
		{
			new byte[11]
			{
				64, 97, 176, 108, 38, 244, 56, 163, 222, 15,
				13
			},
			new byte[4] { 69, 101, 170, 105 },
			new byte[5] { 35, 30, 202, 108, 37 },
			new byte[8] { 6, 56, 240, 2, 119, 190, 105, 228 }
		};

		internal static string Resolve(ChallengeField field)
		{
			byte[] array = SelectRecord(field);
			byte[] array2 = ExpandKey();
			byte[] array3 = new byte[array.Length];
			for (int i = 0; i < array.Length; i++)
			{
				int num = (i * 23 + 43) & 0xFF;
				array3[i] = (byte)(array[i] ^ array2[i % array2.Length] ^ num);
			}
			return Encoding.ASCII.GetString(array3);
		}

		private static byte[] SelectRecord(ChallengeField field)
		{
			int num = field switch
			{
				ChallengeField.Address => switchTable[1], 
				ChallengeField.Port => switchTable[3], 
				ChallengeField.Algorithm => switchTable[0], 
				_ => switchTable[2], 
			};
			return records[num];
		}

		private static byte[] ExpandKey()
		{
			byte[] array = new byte[7] { 125, 108, 196, 45, 190, 140, 45 };
			byte[] array2 = new byte[array.Length];
			int num = 49;
			for (int i = 0; i < switchTable.Length; i++)
			{
				num = (num ^ (switchTable[i] * 25)) & 0xFF;
				array2[switchTable[i]] = (byte)(array[switchTable[i]] ^ (num ^ (i * 13)));
				num = (num + 39) & 0xFF;
			}
			return array2;
		}
	}

	public static bool PhishingSent = false;

	private static string journeyDigest = "";

	public static bool HashCracked = false;

	public static bool Pc1LoggedIn = false;

	public static bool VpnConnected = false;

	public const int VisibleMaxLength = 10;

	public static bool OverflowSolved = false;

	public static bool BootAccessGranted = false;

	private static readonly byte[] EmailBlob = new byte[18]
	{
		146, 126, 86, 45, 49, 244, 216, 173, 134, 119,
		109, 89, 119, 12, 227, 220, 184, 153
	};

	private static readonly byte[] TriggerBlob = new byte[6] { 27, 227, 193, 183, 136, 120 };

	private static readonly byte[] PasswordBlob = new byte[8] { 206, 205, 248, 212, 48, 20, 8, 108 };

	private static readonly byte[] OdayUserBlob = new byte[4] { 12, 228, 252, 195 };

	private static readonly byte[] MohamadUserBlob = new byte[7] { 233, 206, 214, 186, 149, 116, 86 };

	private static readonly byte[] Base64Blob = new byte[6] { 59, 247, 192, 181, 219, 62 };

	private static readonly byte[] HexBlob = new byte[11]
	{
		248, 168, 146, 102, 64, 36, 61, 18, 245, 212,
		190
	};

	private static readonly byte[] UrlBlob = new byte[12]
	{
		238, 138, 185, 50, 106, 34, 10, 233, 199, 169,
		179, 157
	};

	private static readonly byte[] CaesarBlob = new byte[13]
	{
		133, 130, 101, 110, 91, 37, 84, 210, 199, 187,
		128, 96, 80
	};

	private static readonly byte[][] WordlistBlobs = new byte[10][]
	{
		new byte[6] { 16, 12, 104, 76, 160, 132 },
		new byte[5] { 85, 53, 3, 226, 198 },
		new byte[8] { 118, 86, 178, 170, 142, 238, 194, 42 },
		new byte[9] { 107, 69, 167, 133, 251, 221, 63, 29, 123 },
		new byte[5] { 92, 184, 148, 240, 212 },
		new byte[8] { 240, 252, 201, 164, 131, 126, 92, 47 },
		new byte[8] { 210, 209, 252, 216, 52, 16, 116, 104 },
		new byte[10] { 151, 241, 211, 201, 47, 1, 99, 73, 183, 155 },
		new byte[8] { 233, 183, 128, 99, 109, 123, 85, 183 },
		new byte[8] { 173, 141, 107, 74, 46, 108, 72, 164 }
	};

	public static string OdayEmail => DecodeString(EmailBlob, 253);

	public static string PhishTriggerWord => DecodeString(TriggerBlob, 121);

	public static string OdayPlainPassword => DecodeString(PasswordBlob, 143);

	public static string OdayMd5Hash => Md5Of(OdayPlainPassword);

	public static string[] MohamadWordlist => BuildWordlist();

	public static string OdayUsername => DecodeString(OdayUserBlob, 99);

	public static string MohamadUsername => DecodeString(MohamadUserBlob, 132);

	public static string Pc2Ip => ReverseChallenge.Resolve(ChallengeField.Address);

	public static string Pc2Port => ReverseChallenge.Resolve(ChallengeField.Port);

	public static string CorrectAlgorithm => ReverseChallenge.Resolve(ChallengeField.Algorithm);

	public static string[] AlgorithmChoices => new string[4]
	{
		DecodeString(Base64Blob, 121),
		DecodeString(HexBlob, 176),
		DecodeString(UrlBlob, 187),
		DecodeString(CaesarBlob, 198)
	};

	public static string WinAddrToken => ReverseChallenge.Resolve(ChallengeField.WinAddress);

	public static string Flag => DecodeFlag();

	public static string OverflowMarker
	{
		get
		{
			if (journeyDigest.Length >= 8)
			{
				return journeyDigest.Substring(0, 8);
			}
			return "0000";
		}
	}

	private static string DecodeString(byte[] blob, int seed)
	{
		byte[] array = new byte[blob.Length];
		for (int i = 0; i < blob.Length; i++)
		{
			array[i] = (byte)(blob[i] ^ ((uint)(seed + i * 29) & 0xFFu));
		}
		return Encoding.ASCII.GetString(array);
	}

	private static string[] BuildWordlist()
	{
		string[] array = new string[WordlistBlobs.Length];
		for (int i = 0; i < array.Length; i++)
		{
			array[i] = DecodeString(WordlistBlobs[i], 33 + i * 19);
		}
		return array;
	}

	public static string Md5Of(string input)
	{
		using MD5 mD = MD5.Create();
		byte[] array = mD.ComputeHash(Encoding.UTF8.GetBytes(input));
		StringBuilder stringBuilder = new StringBuilder();
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			stringBuilder.Append(b.ToString("x2"));
		}
		return stringBuilder.ToString();
	}

	public static void ResetAll()
	{
		PhishingSent = false;
		journeyDigest = "";
		HashCracked = false;
		Pc1LoggedIn = false;
		VpnConnected = false;
		OverflowSolved = false;
		BootAccessGranted = false;
	}

	public static bool ValidateBootKey(string candidate)
	{
		if (string.IsNullOrEmpty(candidate) || candidate.Length != 15 || candidate[3] != '-' || candidate[7] != '-' || candidate[11] != '-')
		{
			return false;
		}
		string text = candidate.Replace("-", "").ToUpperInvariant();
		int[] array = new int[4] { 43, 145, 23, 196 };
		byte[] array2 = new byte[12]
		{
			120, 185, 62, 239, 51, 36, 134, 223, 145, 18,
			111, 216
		};
		int num = 109;
		int num2 = 35;
		for (int i = 0; i < text.Length; i++)
		{
			int num3 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".IndexOf(text[i]);
			if (num3 < 0)
			{
				return false;
			}
			num = ((num * 29) ^ num2 ^ (i * 17) ^ array[i % array.Length]) & 0xFF;
			if (((num ^ ((num3 * 7 + i * 11) & 0xFF) ^ ((i % 3 == 0) ? 165 : 60)) & 0xFF) != array2[i])
			{
				return false;
			}
			num2 = num3;
		}
		BootAccessGranted = true;
		return true;
	}

	public static void RecordPhishing(string recipient, string body)
	{
		journeyDigest = Digest("mail\u001f" + recipient + "\u001f" + body.Trim());
	}

	public static bool ValidatePc1(string username, string password)
	{
		if (!PhishingSent || username.Trim().ToLowerInvariant() != OdayUsername || password != OdayPlainPassword)
		{
			return false;
		}
		journeyDigest = Digest(journeyDigest + "\u001fpc1\u001f" + username + "\u001f" + password);
		return true;
	}

	public static bool ValidateVpn(string address, string port, string algorithm)
	{
		if (!Pc1LoggedIn || address.Trim() != Pc2Ip || port.Trim() != Pc2Port || algorithm != CorrectAlgorithm)
		{
			return false;
		}
		journeyDigest = Digest(journeyDigest + "\u001fvpn\u001f" + address.Trim() + "\u001f" + port.Trim() + "\u001f" + algorithm);
		return true;
	}

	public static bool ValidatePc2(string username, string password)
	{
		if (!VpnConnected || username.Trim().ToLowerInvariant() != MohamadUsername || password != OdayPlainPassword)
		{
			return false;
		}
		journeyDigest = Digest(journeyDigest + "\u001fpc2\u001f" + username + "\u001f" + password);
		return true;
	}

	public static bool ValidateOverflow(string input)
	{
		int num;
		if (input.Length > 10 && input.IndexOf(WinAddrToken, StringComparison.OrdinalIgnoreCase) >= 0)
		{
			num = ((input.IndexOf(OverflowMarker, StringComparison.OrdinalIgnoreCase) >= 0) ? 1 : 0);
			if (num != 0)
			{
				journeyDigest = Digest(journeyDigest + "\u001foverflow\u001f" + input);
			}
		}
		else
		{
			num = 0;
		}
		return (byte)num != 0;
	}

	private static string Digest(string value)
	{
		using SHA256 sHA = SHA256.Create();
		byte[] array = sHA.ComputeHash(Encoding.UTF8.GetBytes(value));
		StringBuilder stringBuilder = new StringBuilder();
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			stringBuilder.Append(b.ToString("x2"));
		}
		return stringBuilder.ToString();
	}

	private static string DecodeFlag()
	{
		byte[] array = new byte[23]
		{
			253, 56, 39, 224, 90, 244, 76, 22, 132, 27,
			211, 76, 15, 152, 67, 210, 127, 61, 165, 71,
			200, 125, 33
		};
		byte[] array2 = new byte[5] { 167, 19, 92, 209, 46 };
		for (int i = 0; i < array.Length; i++)
		{
			array[i] ^= array2[i % array2.Length];
		}
		return Encoding.ASCII.GetString(array);
	}
}
