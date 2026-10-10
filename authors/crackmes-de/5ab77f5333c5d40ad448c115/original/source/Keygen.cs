using System;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

[assembly: AssemblyTitle("Crackme")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("Crackme")]
[assembly: AssemblyCopyright("Copyright ©  2011")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("2e1ea742-f298-46f5-b6b8-4bc32f15d674")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyVersion("1.0.0.0")]
namespace Crackme;

internal class Keygen
{
	private int UFlag;

	private int UserID;

	private int UserCode;

	private int ValidCode;

	private Keygen()
	{
		do
		{
			Console.Write("\nEnter User ID: ");
			UserID = Convert.ToInt32(Console.ReadLine());
			if (UserID > 0 && UserID < 10000)
			{
				UFlag = 1;
				continue;
			}
			UFlag = 0;
			Console.WriteLine("\nUser ID Is Out Of Range! Please Enter Number Less Than 4 Digits...");
		}
		while (UFlag == 0);
		Console.Write("\nEnter Code: ");
		UserCode = Convert.ToInt32(Console.ReadLine());
	}

	private void Generate()
	{
		int num = UserID * 786;
		ValidCode = num * 17;
		num = ValidCode / 12;
		ValidCode = num + 1991;
	}

	private void Check(ref int RFlag)
	{
		if (ValidCode == UserCode)
		{
			RFlag = 1;
		}
		else
		{
			RFlag = 0;
		}
	}

	~Keygen()
	{
		Console.WriteLine("\nProgrammed By HonestGamer\n");
	}

	private static void Main(string[] args)
	{
		Console.WriteLine("Crackme By HonestGamer");
		int RFlag = 0;
		char c;
		do
		{
			Keygen keygen = new Keygen();
			keygen.Generate();
			keygen.Check(ref RFlag);
			if (RFlag == 0)
			{
				Console.Write("\nInvalid Code, Try Again (Y/N)? ");
				c = Convert.ToChar(Console.ReadLine());
			}
			else
			{
				c = 'N';
				Console.WriteLine("\nValid Code, Well Done! Write A Keygen Now...");
			}
		}
		while (c == 'Y' || c == 'y');
		Console.WriteLine("\nHit The Enter Key To End...");
		Console.ReadLine();
	}
}
