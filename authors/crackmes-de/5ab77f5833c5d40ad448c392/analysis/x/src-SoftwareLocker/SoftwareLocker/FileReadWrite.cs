using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace SoftwareLocker;

internal class FileReadWrite
{
	public static byte[] key = new byte[24]
	{
		21, 10, 64, 10, 100, 40, 200, 4, 21, 54,
		65, 246, 5, 62, 1, 54, 54, 6, 8, 9,
		65, 4, 65, 9
	};

	private static byte[] iv;

	public static string ReadFile(string FilePath)
	{
		FileInfo fileInfo = new FileInfo(FilePath);
		if (!fileInfo.Exists)
		{
			return string.Empty;
		}
		FileStream fileStream = new FileStream(FilePath, FileMode.Open, FileAccess.Read);
		TripleDES tripleDES = new TripleDESCryptoServiceProvider();
		CryptoStream cryptoStream = new CryptoStream(fileStream, tripleDES.CreateDecryptor(key, iv), CryptoStreamMode.Read);
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < fileStream.Length; i++)
		{
			int num = cryptoStream.ReadByte();
			if (num == 0)
			{
				break;
			}
			stringBuilder.Append(Convert.ToChar(num));
		}
		cryptoStream.Close();
		fileStream.Close();
		return stringBuilder.ToString();
	}

	public static void WriteFile(string FilePath, string Data)
	{
		FileStream fileStream = new FileStream(FilePath, FileMode.OpenOrCreate, FileAccess.Write);
		TripleDES tripleDES = new TripleDESCryptoServiceProvider();
		CryptoStream cryptoStream = new CryptoStream(fileStream, tripleDES.CreateEncryptor(key, iv), CryptoStreamMode.Write);
		byte[] bytes = Encoding.ASCII.GetBytes(Data);
		cryptoStream.Write(bytes, 0, bytes.Length);
		cryptoStream.WriteByte(0);
		cryptoStream.Close();
		fileStream.Close();
	}

	static FileReadWrite()
	{
		byte[] array = new byte[8];
		iv = array;
	}
}
