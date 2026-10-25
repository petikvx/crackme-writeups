public class Crackme
{
	private static void Main(string[] args)
	{
		Check check = new Check();
		if (args.Length != 11)
		{
			check.fail();
		}
		string[] array = new string[11];
		for (int i = 0; i < args.Length; i++)
		{
			array[i] = args[i];
		}
		if (args.Length != 11)
		{
			check.fail();
		}
		else
		{
			check.chk(array);
		}
	}
}
