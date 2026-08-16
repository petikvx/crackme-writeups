using System.Security.Cryptography;
using System.Text;

namespace WindowsFormsApp8;

internal class ae4u9gae89g489
{
	public static string GetFinalStrongHash()
	{
		string rawData = _8e7vgeu5jhuir8.GeneratePassword();
		return ComputeSha512(rawData);
	}

	public static string GetFinalStrongHashCustom(string previousPassword)
	{
		return ComputeSha512(previousPassword);
	}

	private static string ComputeSha512(string rawData)
	{
		using SHA512 sHA = SHA512.Create();
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
