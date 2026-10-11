using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;

[assembly: AssemblyCopyright("Copyright © Microsoft 2008")]
[assembly: AssemblyTitle("ConsoleApplication3")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft")]
[assembly: AssemblyProduct("ConsoleApplication3")]
[assembly: Guid("d78e10b0-28c4-4f52-8587-c18c8b7a10bf")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: CompilationRelaxations(8)]
[assembly: AssemblyVersion("1.0.0.0")]
public class RijndaelSimple
{
	public static string Encrypt(string plainText, string passPhrase, string saltValue, string hashAlgorithm, int passwordIterations, string initVector, int keySize)
	{
		byte[] bytes = Encoding.ASCII.GetBytes(initVector);
		byte[] bytes2 = Encoding.ASCII.GetBytes(saltValue);
		byte[] bytes3 = Encoding.UTF8.GetBytes(plainText);
		PasswordDeriveBytes passwordDeriveBytes = new PasswordDeriveBytes(passPhrase, bytes2, hashAlgorithm, passwordIterations);
		byte[] bytes4 = passwordDeriveBytes.GetBytes(keySize / 8);
		RijndaelManaged rijndaelManaged = new RijndaelManaged();
		rijndaelManaged.Mode = CipherMode.CBC;
		ICryptoTransform transform = rijndaelManaged.CreateEncryptor(bytes4, bytes);
		MemoryStream memoryStream = new MemoryStream();
		CryptoStream cryptoStream = new CryptoStream(memoryStream, transform, CryptoStreamMode.Write);
		cryptoStream.Write(bytes3, 0, bytes3.Length);
		cryptoStream.FlushFinalBlock();
		byte[] inArray = memoryStream.ToArray();
		memoryStream.Close();
		cryptoStream.Close();
		return Convert.ToBase64String(inArray);
	}

	public static string Decrypt(string cipherText, string passPhrase, string saltValue, string hashAlgorithm, int passwordIterations, string initVector, int keySize)
	{
		byte[] bytes = Encoding.ASCII.GetBytes(initVector);
		byte[] bytes2 = Encoding.ASCII.GetBytes(saltValue);
		byte[] array = Convert.FromBase64String(cipherText);
		PasswordDeriveBytes passwordDeriveBytes = new PasswordDeriveBytes(passPhrase, bytes2, hashAlgorithm, passwordIterations);
		byte[] bytes3 = passwordDeriveBytes.GetBytes(keySize / 8);
		RijndaelManaged rijndaelManaged = new RijndaelManaged();
		rijndaelManaged.Mode = CipherMode.CBC;
		ICryptoTransform transform = rijndaelManaged.CreateDecryptor(bytes3, bytes);
		MemoryStream memoryStream = new MemoryStream(array);
		CryptoStream cryptoStream = new CryptoStream(memoryStream, transform, CryptoStreamMode.Read);
		byte[] array2 = new byte[array.Length];
		int count = cryptoStream.Read(array2, 0, array2.Length);
		memoryStream.Close();
		cryptoStream.Close();
		return Encoding.UTF8.GetString(array2, 0, count);
	}
}
public class RijndaelSimpleTest
{
	[STAThread]
	private static void Main(string[] args)
	{
		string plainText = "";
		string cipherText = "BnCxGiN4aJDE+qUe2yIm8Q==";
		string passPhrase = "^F79ejk56$£";
		string saltValue = "DHj47&*)$h";
		string hashAlgorithm = "MD5";
		int passwordIterations = 1024;
		string initVector = "&!£$%^&*()CvHgE!";
		int keySize = 256;
		RijndaelSimple.Encrypt(plainText, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
		plainText = RijndaelSimple.Decrypt(cipherText, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
		while (true)
		{
			Console.WriteLine("Please enter the password: ");
			string text = Console.ReadLine();
			if (text == plainText)
			{
				break;
			}
			Console.WriteLine("Bad Luck! Try again!");
		}
		Console.WriteLine("Well Done! You cracked it!");
		Console.ReadLine();
	}
}
