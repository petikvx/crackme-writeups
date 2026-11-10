using System;

namespace crackme;

internal class crackmebro
{
	private static void Main()
	{
		Console.Title = "Crackme by Simba";
		Console.ForegroundColor = ConsoleColor.Cyan;
		Console.WriteLine("========================================");
		Console.WriteLine("       SIMPLE CRACKME CHALLENGE        ");
		Console.WriteLine("========================================");
		Console.ResetColor();
		Console.WriteLine();
		Console.Write("Enter password: ");
		string text = Console.ReadLine();
		Console.WriteLine();
		if (text == "crackme12345ez")
		{
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine("[+] CORRECT! You cracked it!");
			Console.ResetColor();
		}
		else
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine("[-] WRONG! Try again.");
			Console.ResetColor();
		}
		Console.WriteLine();
		Console.WriteLine("Press any key to exit...");
		Console.ReadKey();
	}
}
