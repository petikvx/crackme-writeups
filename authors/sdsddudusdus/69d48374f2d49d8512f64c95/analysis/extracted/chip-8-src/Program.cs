using System;

internal class Program
{
	private static void Main()
	{
		Console.Write("Enter Serial: ");
		string text = Console.ReadLine();
		if (text == "password")
		{
			Console.WriteLine("Correct!");
			Console.ReadLine();
		}
		else
		{
			Console.WriteLine("Try Again.");
			Console.ReadLine();
		}
	}
}
