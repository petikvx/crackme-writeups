		public static string getHash(string value)
		{
			byte[] bytes = Encoding.ASCII.GetBytes(value);
			byte[] array = new SHA512Managed().ComputeHash(bytes);
			string text = string.Empty;
			byte[] array2 = array;
			foreach (byte b in array2)
			{
				text += b.ToString("X2");
			}
			return text;
		}
