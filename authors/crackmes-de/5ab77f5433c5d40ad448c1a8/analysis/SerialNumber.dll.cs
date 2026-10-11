using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

[assembly: AssemblyTitle("SerialNumber")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Farshide")]
[assembly: AssemblyProduct("SerialNumber")]
[assembly: AssemblyCopyright("Copyright © Farshide 2010")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("3e10848b-fbcf-4741-874d-e460ecaef74c")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyVersion("1.0.0.0")]
namespace SerialNumber;

public class Cls1
{
	private string[] ID = new string[2] { "E6-B7A98DF0F-C40BA820AAC3-706E9B0-4E", "D5-B57692529-447E9B633AC0-B0029CD-BA" };

	public string IDCpu()
	{
		return ID[0];
	}

	public string IDHard()
	{
		return ID[1];
	}

	public bool Check(string id, string idh, string idc)
	{
		return false;
	}
}
