using System;

public class Check
{
	public void chk(string[] arr)
	{
		try
		{
			string[] array = new string[6];
			string[] array2 = new string[5];
			int num = 0;
			for (int i = 0; i < 6; i++)
			{
				array[i] = arr[i];
			}
			for (int i = 0; i < 5; i++)
			{
				array2[i] = arr[i + 6];
			}
			for (int i = 0; i < 6; i += 2)
			{
				if (Convert.ToInt32(array[i]) > Convert.ToInt32(array[i + 1]))
				{
					fail();
				}
			}
			for (int i = 0; i < 6; i++)
			{
				if (array[i].Length != 2)
				{
					fail();
				}
			}
			if (Convert.ToInt32(array[0]) * Convert.ToInt32(array[1]) != 240 || Convert.ToInt32(array[0]) * Convert.ToInt32(array[1]) / gcfact(Convert.ToInt32(array[0]), Convert.ToInt32(array[1])) != 60)
			{
				fail();
			}
			if (Convert.ToInt32(array[2]) * Convert.ToInt32(array[3]) != 140 || gcfact(Convert.ToInt32(array[2]), Convert.ToInt32(array[3])) != 2)
			{
				fail();
			}
			if (gcfact(Convert.ToInt32(array[4]), Convert.ToInt32(array[5])) != 35 || Convert.ToInt32(array[4]) * Convert.ToInt32(array[5]) / gcfact(Convert.ToInt32(array[4]), Convert.ToInt32(array[5])) != 35)
			{
				fail();
			}
			for (int i = 0; i < 5; i++)
			{
				for (int j = 0; j < 6; j++)
				{
					if (array2[i] == array[j])
					{
						num++;
					}
				}
			}
			if (num != 6)
			{
				fail();
			}
			for (int i = 0; i < 3; i++)
			{
				if (gcfact(Convert.ToInt32(array2[i]), Convert.ToInt32(array2[i + 1])) >= gcfact(Convert.ToInt32(array2[i + 1]), Convert.ToInt32(array2[i + 2])))
				{
					fail();
				}
			}
			Console.WriteLine("\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tSuccess!!!!");
			Console.Read();
		}
		catch
		{
			fail();
		}
	}

	public void fail()
	{
		Console.WriteLine("\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tInvalid Arguements!");
		Console.Read();
	}

	public int gcfact(int p, int q)
	{
		int result = 0;
		for (int i = 1; i <= q; i++)
		{
			if (p % i == 0 && q % i == 0)
			{
				result = i;
			}
		}
		return result;
	}
}
