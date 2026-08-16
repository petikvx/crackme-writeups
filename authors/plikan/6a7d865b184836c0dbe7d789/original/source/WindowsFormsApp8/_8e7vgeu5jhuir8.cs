using System.Security.Cryptography;
using System.Text;

namespace WindowsFormsApp8;

internal class _8e7vgeu5jhuir8
{
	public static string GeneratePassword()
	{
		string pcHash = gwaog4a8gpjsr89r5.GetPcHash();
		string rawData = pcHash + "plikan";
		return ComputeSha256(rawData);
	}

	public static string GeneratePasswordFromCustomHash(string inputHash)
	{
		string rawData = inputHash + "plikan";
		return ComputeSha256(rawData);
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
