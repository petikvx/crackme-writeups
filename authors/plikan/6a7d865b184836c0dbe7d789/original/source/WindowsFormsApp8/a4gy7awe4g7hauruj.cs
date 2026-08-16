namespace WindowsFormsApp8;

internal class a4gy7awe4g7hauruj
{
	public static string GenerateKey()
	{
		string text = ae4u9gae89g489.GetFinalStrongHash().ToUpper();
		string text2 = text.Substring(0, 5);
		string text3 = text.Substring(5, 5);
		string text4 = text.Substring(10, 5);
		string text5 = text.Substring(15, 5);
		string text6 = text.Substring(20, 5);
		return $"{text2}-{text3}-{text4}-{text5}-{text6}";
	}

	public static string GenerateKeyFromCustomHash(string inputHash)
	{
		if (string.IsNullOrEmpty(inputHash) || inputHash.Length < 25)
		{
			return "INVALID-HASH-LENGTH";
		}
		string text = inputHash.ToUpper();
		string text2 = text.Substring(0, 5);
		string text3 = text.Substring(5, 5);
		string text4 = text.Substring(10, 5);
		string text5 = text.Substring(15, 5);
		string text6 = text.Substring(20, 5);
		return $"{text2}-{text3}-{text4}-{text5}-{text6}";
	}
}
