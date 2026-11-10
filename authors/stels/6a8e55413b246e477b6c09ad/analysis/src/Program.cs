using System;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using ThemidaPlus;

namespace CrackMe;

internal static class Program
{
	private static readonly byte[] _pwShare0 = Convert.FromHexString(Runtime.LoadEncString(1879048203));

	private static readonly byte[] _pwShare1 = Convert.FromHexString(Runtime.LoadEncString(1879048204));

	private static readonly byte[] _pwShare2 = Convert.FromHexString(Runtime.LoadEncString(1879048205));

	private static readonly byte[] _pwIv = Convert.FromHexString(Runtime.LoadEncString(1879048206));

	private static readonly byte[] _pwCt = Convert.FromHexString(Runtime.LoadEncString(1879048207));

	private static readonly byte[] _saltCt = Convert.FromHexString(Runtime.LoadEncString(1879048208));

	private const int ExpectedLength = 30;

	private static readonly byte[] ExpectedHash = Convert.FromHexString(Runtime.LoadEncString(1879048209));

	private static readonly byte[] ExpectedMac = Convert.FromHexString(Runtime.LoadEncString(1879048210));

	public static int Main(string[] args)
	{
		Console.Write(Runtime.LoadEncString(1879048193));
		string text = Console.ReadLine();
		if (string.IsNullOrEmpty(text))
		{
			PrintGarbage(Runtime.LoadEncString(1879048194));
			return 1;
		}
		if (CheckPassword(text))
		{
			Console.WriteLine(Flag());
			Console.WriteLine(Runtime.LoadEncString(1879048195));
			Console.ReadLine();
			return 0;
		}
		PrintGarbage(text);
		Console.WriteLine(Runtime.LoadEncString(1879048195));
		Console.ReadLine();
		return 1;
	}

	private static bool CheckPassword(string input)
	{
		return (long)Runtime.Dispatch(76, new object[1] { input }) != 0;
	}

	private static byte[] ComputeSha256(byte[] data)
	{
		SHA256 sHA = SHA256.Create();
		byte[] result = sHA.ComputeHash(data);
		sHA.Dispose();
		return result;
	}

	private static byte[] ComputeHmac(byte[] key, byte[] data)
	{
		HMACSHA256 hMACSHA = new HMACSHA256(key);
		byte[] result = hMACSHA.ComputeHash(data);
		hMACSHA.Dispose();
		return result;
	}

	private static byte[] AesDecrypt(byte[] key, byte[] iv, byte[] ct)
	{
		Aes aes = Aes.Create();
		aes.Key = key;
		aes.IV = iv;
		aes.Mode = CipherMode.CBC;
		aes.Padding = PaddingMode.PKCS7;
		ICryptoTransform cryptoTransform = aes.CreateDecryptor();
		byte[] result = cryptoTransform.TransformFinalBlock(ct, 0, ct.Length);
		cryptoTransform.Dispose();
		aes.Dispose();
		return result;
	}

	private static byte[] GetUtf8Bytes(string s)
	{
		return Encoding.UTF8.GetBytes(s);
	}

	private static byte[] DecryptExpectedPassword()
	{
		byte[] array = new byte[32];
		for (int i = 0; i < 32; i++)
		{
			array[i] = (byte)(_pwShare0[i] ^ _pwShare1[i] ^ _pwShare2[i]);
		}
		Aes aes = Aes.Create();
		aes.Key = array;
		aes.IV = _pwIv;
		aes.Mode = CipherMode.CBC;
		aes.Padding = PaddingMode.PKCS7;
		ICryptoTransform cryptoTransform = aes.CreateDecryptor();
		byte[] result = cryptoTransform.TransformFinalBlock(_pwCt, 0, _pwCt.Length);
		cryptoTransform.Dispose();
		aes.Dispose();
		return result;
	}

	private static byte[] DecryptSalt()
	{
		byte[] array = new byte[16];
		for (int i = 0; i < 16; i++)
		{
			array[i] = (byte)(_saltCt[i] ^ 0x5Au);
		}
		return array;
	}

	private static bool RollingXorCheck(string input)
	{
		uint num = 2779096485u;
		for (int i = 0; i < input.Length; i++)
		{
			uint num2 = input[i];
			uint num3 = ExpectedRollingByte(i, num);
			if (((num2 ^ num) & 0xFF) != num3)
			{
				return false;
			}
			num = RotateRight(num, 5);
			num = (num + num2) & 0xFFFFFFFFu;
		}
		return true;
	}

	private static uint ExpectedRollingByte(int i, uint key)
	{
		byte[] array = DecryptExpectedPassword();
		return array[i % array.Length] ^ (key & 0xFFu);
	}

	private static byte[] DeriveHmacKey(string input, byte[] salt)
	{
		byte[] array = new byte[16];
		for (int i = 0; i < 16; i++)
		{
			array[i] = (byte)(0x42u ^ (uint)i);
		}
		byte[] buffer = Concat(Concat(Encoding.UTF8.GetBytes(input), salt), array);
		SHA256 sHA = SHA256.Create();
		byte[] result = sHA.ComputeHash(buffer);
		sHA.Dispose();
		return result;
	}

	private static string Flag()
	{
		byte[] array = new byte[42]
		{
			35, 83, 27, 9, 45, 85, 0, 9, 47, 28,
			13, 72, 52, 28, 13, 70, 52, 72, 15, 74,
			46, 28, 3, 76, 122, 81, 23, 9, 62, 85,
			29, 74, 53, 78, 10, 19, 122, 82, 0, 70,
			44, 99
		};
		byte b = 90;
		byte b2 = 60;
		byte b3 = 110;
		byte b4 = 41;
		byte[] array2 = new byte[array.Length];
		for (int i = 0; i < array.Length; i++)
		{
			byte b5 = (((i & 3) == 0) ? b : (((i & 3) == 1) ? b2 : (((i & 3) == 2) ? b3 : b4)));
			array2[i] = (byte)(array[i] ^ b5);
		}
		return Encoding.UTF8.GetString(array2);
	}

	private static void PrintGarbage(string input)
	{
		long num = -7046029254386353131L;
		for (int i = 0; i < input.Length; i++)
		{
			num *= 1099511628211L;
			num ^= input[i];
		}
		ulong num2 = (ulong)num;
		Console.WriteLine(Runtime.LoadEncString(1879048196) + (num2 & 0xFFFFFFFFFFFFFFFFuL).ToString(Runtime.LoadEncString(1879048197)));
	}

	private static bool HoneypotA(string input)
	{
		if (Runtime.LoadEncString(1879048198) + input.Length == Runtime.LoadEncString(1879048199))
		{
			return input == Runtime.LoadEncString(1879048200);
		}
		return false;
	}

	private static bool HoneypotB()
	{
		string environmentVariable = Environment.GetEnvironmentVariable(Runtime.LoadEncString(1879048201));
		if (environmentVariable != null && environmentVariable == Runtime.LoadEncString(1879048202))
		{
			return false;
		}
		return false;
	}

	private static bool HoneypotC()
	{
		Stopwatch stopwatch = Stopwatch.StartNew();
		for (int i = 0; i < 1000; i++)
		{
		}
		stopwatch.Stop();
		return stopwatch.ElapsedTicks < 0;
	}

	private static byte[] Concat(byte[] a, byte[] b)
	{
		byte[] array = new byte[a.Length + b.Length];
		Buffer.BlockCopy(a, 0, array, 0, a.Length);
		Buffer.BlockCopy(b, 0, array, a.Length, b.Length);
		return array;
	}

	private static bool ConstantTimeEquals(byte[] a, byte[] b)
	{
		if (a.Length != b.Length)
		{
			return false;
		}
		int num = 0;
		for (int i = 0; i < a.Length; i++)
		{
			num |= a[i] ^ b[i];
		}
		return num == 0;
	}

	private static uint RotateRight(uint v, int n)
	{
		n &= 0x1F;
		return (v >> n) | (v << 32 - n);
	}
}
