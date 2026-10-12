using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.ComponentModel;
using System.Diagnostics;
using System.Windows.Forms;
using Microsoft.VisualBasic.ApplicationServices;

namespace Password.My;

[GeneratedCode("MyTemplate", "8.0.0.0")]
[EditorBrowsable(EditorBrowsableState.Never)]
internal class MyApplication : WindowsFormsApplicationBase
{
	private static ArrayList __ENCList = new ArrayList();

	[STAThread]
	[EditorBrowsable(EditorBrowsableState.Advanced)]
	[DebuggerHidden]
	internal static void Main(string[] Args)
	{
		try
		{
			Application.SetCompatibleTextRenderingDefault(WindowsFormsApplicationBase.UseCompatibleTextRendering);
		}
		finally
		{
		}
		((WindowsFormsApplicationBase)MyProject.Application).Run(Args);
	}

	[DebuggerStepThrough]
	public MyApplication()
		: base((AuthenticationMode)0)
	{
		__ENCList.Add(new WeakReference(this));
		((WindowsFormsApplicationBase)this).IsSingleInstance = false;
		((WindowsFormsApplicationBase)this).EnableVisualStyles = true;
		((WindowsFormsApplicationBase)this).SaveMySettingsOnExit = true;
		((WindowsFormsApplicationBase)this).ShutdownStyle = (ShutdownMode)0;
	}

	[DebuggerStepThrough]
	protected override void OnCreateMainForm()
	{
		((WindowsFormsApplicationBase)this).MainForm = (Form)(object)MyProject.Forms.Form1;
	}
}
