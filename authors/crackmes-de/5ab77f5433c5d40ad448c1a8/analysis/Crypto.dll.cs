using System;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;

[assembly: AssemblyTitle("Crypto")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Farshide")]
[assembly: AssemblyProduct("Crypto")]
[assembly: AssemblyCopyright("Copyright © Farshide 2010")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("46cecd4d-c904-4937-9f13-726bb7b71bc3")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyVersion("1.0.0.0")]
namespace Crypto;

public class Crypto
{
	private string Key = "!@#$%^&*(){}?/>.<,\"':;][/*-+~`";

	private Rijndael RJ = Rijndael.Create();

	private MD5CryptoServiceProvider MD = new MD5CryptoServiceProvider();

	private byte[] Md5Hash(string Value)
	{
		return MD.ComputeHash(Encoding.ASCII.GetBytes(Value));
	}

	public string EncryptText(string TextToEncrypt)
	{
		RJ.Key = Md5Hash(Key);
		RJ.Mode = CipherMode.ECB;
		byte[] bytes = Encoding.ASCII.GetBytes(TextToEncrypt);
		return Convert.ToBase64String(RJ.CreateEncryptor().TransformFinalBlock(bytes, 0, bytes.Length));
	}

	public string DecryptText(string EncryptedText)
	{
		try
		{
			RJ.Key = Md5Hash(Key);
			RJ.Mode = CipherMode.ECB;
			byte[] array = Convert.FromBase64String(EncryptedText);
			return Encoding.ASCII.GetString(RJ.CreateDecryptor().TransformFinalBlock(array, 0, array.Length));
		}
		catch
		{
			return null;
		}
	}
}
