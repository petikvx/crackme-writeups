using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.ApplicationServices;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;
using crackme;
using ohM=;

[assembly: AssemblyProduct("crackme")]
[assembly: CompilationRelaxations(8)]
[assembly: AssemblyDescription("")]
[assembly: AssemblyTitle("crackme")]
[assembly: AssemblyCompany("ELPE")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: Guid("817fd2fd-0a9a-4b59-9d5b-3f53043943d6")]
[assembly: AssemblyCopyright("Copyright © ELPE 2008")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: ComVisible(false)]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyVersion("1.0.0.0")]
namespace ohM=
{
	[EditorBrowsable(EditorBrowsableState.Never)]
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	internal class oRM= : WindowsFormsApplicationBase
	{
		[STAThread]
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		[DebuggerHidden]
		internal static void oxM=(string[] pBM=)
		{
			try
			{
				Application.SetCompatibleTextRenderingDefault(WindowsFormsApplicationBase.UseCompatibleTextRendering);
			}
			finally
			{
			}
			((WindowsFormsApplicationBase)phM=.sBM=).Run(pBM=);
		}

		[DebuggerStepThrough]
		public oRM=()
			: base((AuthenticationMode)0)
		{
			((WindowsFormsApplicationBase)this).IsSingleInstance = false;
			((WindowsFormsApplicationBase)this).EnableVisualStyles = true;
			((WindowsFormsApplicationBase)this).SaveMySettingsOnExit = true;
			((WindowsFormsApplicationBase)this).ShutdownStyle = (ShutdownMode)0;
		}

		[DebuggerStepThrough]
		protected override void OnCreateMainForm()
		{
			((WindowsFormsApplicationBase)this).MainForm = (Form)(object)phM=.thM=.wRM=;
		}
	}
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	internal class pRM= : Computer
	{
		[EditorBrowsable(EditorBrowsableState.Never)]
		[DebuggerHidden]
		public pRM=()
		{
		}
	}
	[StandardModule]
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	[HideModuleName]
	internal sealed class phM=
	{
		[EditorBrowsable(EditorBrowsableState.Never)]
		[MyGroupCollection("System.Windows.Forms.Form", "Create__Instance__", "Dispose__Instance__", "My.MyProject.Forms")]
		internal sealed class uxM=
		{
			public Form1 vBM=;

			[ThreadStatic]
			private static Hashtable vRM=;

			public Form1 wRM=
			{
				[DebuggerNonUserCode]
				get
				{
					vBM= = xRM=(vBM=);
					return vBM=;
				}
				[DebuggerNonUserCode]
				set
				{
					if (value != vBM=)
					{
						if (value != null)
						{
							throw new ArgumentException("Property can only be set to Nothing");
						}
						xxM=(ref vBM=);
					}
				}
			}

			[DebuggerHidden]
			private static T xRM=<T>(T xhM=) where T : Form, new()
			{
				if (xhM= == null || ((Control)xhM=).IsDisposed)
				{
					if (vRM= != null)
					{
						if (vRM=.ContainsKey(typeof(T)))
						{
							throw new InvalidOperationException(Utils.GetResourceString("WinForms_RecursiveFormCreate", new string[0]));
						}
					}
					else
					{
						vRM= = new Hashtable();
					}
					vRM=.Add(typeof(T), null);
					try
					{
						return new T();
					}
					catch (TargetInvocationException ex) when (((Func<bool>)delegate
					{
						// Could not convert BlockContainer to single expression
						ProjectData.SetProjectError((Exception)ex);
						return ex.InnerException != null;
					}).Invoke())
					{
						string resourceString = Utils.GetResourceString("WinForms_SeeInnerException", new string[1] { ex.InnerException.Message });
						throw new InvalidOperationException(resourceString, ex.InnerException);
					}
					finally
					{
						vRM=.Remove(typeof(T));
					}
				}
				return xhM=;
			}

			[DebuggerHidden]
			private void xxM=<T>(ref T yBM=) where T : Form
			{
				((Component)yBM=).Dispose();
				yBM= = default(T);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public uxM=()
			{
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			public override bool Equals(object o)
			{
				return base.Equals(RuntimeHelpers.GetObjectValue(o));
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			public override int GetHashCode()
			{
				return base.GetHashCode();
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			internal Type yRM=()
			{
				return typeof(uxM=);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			public override string ToString()
			{
				return base.ToString();
			}
		}

		[MyGroupCollection("System.Web.Services.Protocols.SoapHttpClientProtocol", "Create__Instance__", "Dispose__Instance__", "")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		internal sealed class yhM=
		{
			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public override bool Equals(object o)
			{
				return base.Equals(RuntimeHelpers.GetObjectValue(o));
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public override int GetHashCode()
			{
				return base.GetHashCode();
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			internal Type yRM=()
			{
				return typeof(yhM=);
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public override string ToString()
			{
				return base.ToString();
			}

			[DebuggerHidden]
			private static T xRM=<T>(T yxM=) where T : new()
			{
				if (yxM= == null)
				{
					return new T();
				}
				return yxM=;
			}

			[DebuggerHidden]
			private void xxM=<T>(ref T zBM=)
			{
				zBM= = default(T);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public yhM=()
			{
			}
		}

		[ComVisible(false)]
		[EditorBrowsable(EditorBrowsableState.Never)]
		internal sealed class zRM=<T> where T : new()
		{
			[ThreadStatic]
			[CompilerGenerated]
			private static T m_ThreadStaticValue;

			internal T zxM=
			{
				[DebuggerHidden]
				get
				{
					if (m_ThreadStaticValue == null)
					{
						m_ThreadStaticValue = new T();
					}
					return m_ThreadStaticValue;
				}
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public zRM=()
			{
			}
		}

		private static readonly zRM=<pRM=> pxM= = new zRM=<pRM=>();

		private static readonly zRM=<oRM=> qBM= = new zRM=<oRM=>();

		private static readonly zRM=<User> qRM= = new zRM=<User>();

		private static zRM=<uxM=> qhM= = new zRM=<uxM=>();

		private static readonly zRM=<yhM=> qxM= = new zRM=<yhM=>();

		[HelpKeyword("My.Computer")]
		internal static pRM= rRM=
		{
			[DebuggerHidden]
			get
			{
				return pxM=.zxM=;
			}
		}

		[HelpKeyword("My.Application")]
		internal static oRM= sBM=
		{
			[DebuggerHidden]
			get
			{
				return qBM=.zxM=;
			}
		}

		[HelpKeyword("My.User")]
		internal static User sxM=
		{
			[DebuggerHidden]
			get
			{
				return qRM=.zxM=;
			}
		}

		[HelpKeyword("My.Forms")]
		internal static uxM= thM=
		{
			[DebuggerHidden]
			get
			{
				return qhM=.zxM=;
			}
		}

		[HelpKeyword("My.WebServices")]
		internal static yhM= uRM=
		{
			[DebuggerHidden]
			get
			{
				return qxM=.zxM=;
			}
		}
	}
}
namespace crackme
{
	[DesignerGenerated]
	public class Form1 : Form
	{
		private IContainer 0RM=;

		[AccessedThroughProperty("Button1")]
		private Button 0hM=;

		[AccessedThroughProperty("TextBox1")]
		private TextBox 0xM=;

		[AccessedThroughProperty("TextBox2")]
		private TextBox 1BM=;

		[AccessedThroughProperty("Timer1")]
		private Timer 1RM=;

		private string 1hM=;

		private string 1xM=;

		private string 2BM=;

		private string 2RM=;

		internal virtual Button 3RM=
		{
			[DebuggerNonUserCode]
			get
			{
				return 0hM=;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			[DebuggerNonUserCode]
			set
			{
				EventHandler eventHandler = +xM=;
				if (0hM= != null)
				{
					((Control)0hM=).Click -= eventHandler;
				}
				0hM= = value;
				if (0hM= != null)
				{
					((Control)0hM=).Click += eventHandler;
				}
			}
		}

		internal virtual TextBox 5BM=
		{
			[DebuggerNonUserCode]
			get
			{
				return 0xM=;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			[DebuggerNonUserCode]
			set
			{
				0xM= = value;
			}
		}

		internal virtual TextBox 6xM=
		{
			[DebuggerNonUserCode]
			get
			{
				return 1BM=;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			[DebuggerNonUserCode]
			set
			{
				1BM= = value;
			}
		}

		internal virtual Timer 8hM=
		{
			[DebuggerNonUserCode]
			get
			{
				return 1RM=;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			[DebuggerNonUserCode]
			set
			{
				EventHandler eventHandler = /hM=;
				if (1RM= != null)
				{
					1RM=.Tick -= eventHandler;
				}
				1RM= = value;
				if (1RM= != null)
				{
					1RM=.Tick += eventHandler;
				}
			}
		}

		[DebuggerNonUserCode]
		public Form1()
		{
			9hM=();
		}

		[DebuggerNonUserCode]
		protected override void Dispose(bool disposing)
		{
			try
			{
				if (disposing && 0RM= != null)
				{
					0RM=.Dispose();
				}
			}
			finally
			{
				((Form)this).Dispose(disposing);
			}
		}

		[DebuggerStepThrough]
		private void 9hM=()
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Expected O, but got Unknown
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			0RM= = new Container();
			3RM= = new Button();
			5BM= = new TextBox();
			6xM= = new TextBox();
			8hM= = new Timer(0RM=);
			((Control)this).SuspendLayout();
			((Control)3RM=).Enabled = false;
			Button obj = 3RM=;
			Point location = new Point(12, 69);
			((Control)obj).Location = location;
			((Control)3RM=).Name = "Button1";
			Button obj2 = 3RM=;
			Size size = new Size(536, 23);
			((Control)obj2).Size = size;
			((Control)3RM=).TabIndex = 0;
			((ButtonBase)3RM=).Text = "Check";
			((ButtonBase)3RM=).UseVisualStyleBackColor = true;
			((Control)5BM=).Enabled = false;
			TextBox obj3 = 5BM=;
			location = new Point(12, 12);
			((Control)obj3).Location = location;
			((Control)5BM=).Name = "TextBox1";
			TextBox obj4 = 5BM=;
			size = new Size(536, 20);
			((Control)obj4).Size = size;
			((Control)5BM=).TabIndex = 1;
			5BM=.Text = "Name";
			((Control)6xM=).Enabled = false;
			TextBox obj5 = 6xM=;
			location = new Point(12, 43);
			((Control)obj5).Location = location;
			((Control)6xM=).Name = "TextBox2";
			TextBox obj6 = 6xM=;
			size = new Size(536, 20);
			((Control)obj6).Size = size;
			((Control)6xM=).TabIndex = 2;
			6xM=.Text = "Serial";
			8hM=.Enabled = true;
			8hM=.Interval = 5000;
			SizeF autoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			size = new Size(560, 96);
			((Form)this).ClientSize = size;
			((Control)this).Controls.Add((Control)(object)6xM=);
			((Control)this).Controls.Add((Control)(object)5BM=);
			((Control)this).Controls.Add((Control)(object)3RM=);
			((Control)this).Name = "Form1";
			((Form)this).Text = "Breaker's Crackme #4";
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}

		private string 9xM=(string +BM=)
		{
			UnicodeEncoding unicodeEncoding = new UnicodeEncoding();
			byte[] bytes = unicodeEncoding.GetBytes(+BM=);
			MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
			byte[] inArray = mD5CryptoServiceProvider.ComputeHash(bytes);
			return Convert.ToBase64String(inArray);
		}

		private string +RM=(string +hM=)
		{
			UnicodeEncoding unicodeEncoding = new UnicodeEncoding();
			byte[] bytes = unicodeEncoding.GetBytes(+hM=);
			MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
			byte[] inArray = mD5CryptoServiceProvider.ComputeHash(bytes);
			return Convert.ToBase64String(inArray) + Convert.ToBase64String(inArray) + Convert.ToBase64String(inArray);
		}

		private void +xM=(object /BM=, EventArgs /RM=)
		{
			//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			1hM= = 9xM=(5BM=.Text);
			1xM= = 9xM=(1hM=) + +RM=(5BM=.Text);
			2BM= = 9xM=(+RM=(1xM=));
			2RM= = +RM=(9xM=(+RM=(9xM=(2BM= + 1xM= + 1hM=))));
			if (Operators.CompareString(6xM=.Text, 2RM=, false) == 0)
			{
				Interaction.MsgBox((object)"Great Work!!Now write a tut!", (MsgBoxStyle)48, (object)"Great!");
			}
			else
			{
				Interaction.MsgBox((object)"Wrong try again!!", (MsgBoxStyle)64, (object)"Wrong");
			}
		}

		private void /hM=(object /xM=, EventArgs ABQ=)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			Interaction.MsgBox((object)"This is a nag that you have to disable!", (MsgBoxStyle)48, (object)"HaHa!!");
		}
	}
}
namespace crackme.My.Resources
{
	[DebuggerNonUserCode]
	[HideModuleName]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
	[StandardModule]
	[CompilerGenerated]
	internal sealed class Resources
	{
		private static ResourceManager resourceMan;

		private static CultureInfo resourceCulture;

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (object.ReferenceEquals(resourceMan, null))
				{
					ResourceManager resourceManager = new ResourceManager("crackme.Resources", typeof(Resources).Assembly);
					resourceMan = resourceManager;
				}
				return resourceMan;
			}
		}

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static CultureInfo Culture
		{
			get
			{
				return resourceCulture;
			}
			set
			{
				resourceCulture = value;
			}
		}
	}
}
namespace crackme.My
{
	[CompilerGenerated]
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "9.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Advanced)]
	internal sealed class MySettings : ApplicationSettingsBase
	{
		private static MySettings defaultInstance = (MySettings)(object)SettingsBase.Synchronized((SettingsBase)(object)new MySettings());

		private static bool addedHandler;

		private static object addedHandlerLockObject = RuntimeHelpers.GetObjectValue(new object());

		public static MySettings Default
		{
			get
			{
				//IL_002c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0036: Expected O, but got Unknown
				if (!addedHandler)
				{
					object obj = addedHandlerLockObject;
					ObjectFlowControl.CheckForSyncLockOnValueType(obj);
					Monitor.Enter(obj);
					try
					{
						if (!addedHandler)
						{
							((WindowsFormsApplicationBase)phM=.sBM=).Shutdown += (ShutdownEventHandler)([DebuggerNonUserCode] [EditorBrowsable(EditorBrowsableState.Advanced)] (object sender, EventArgs e) =>
							{
								if (((WindowsFormsApplicationBase)phM=.sBM=).SaveMySettingsOnExit)
								{
									((ApplicationSettingsBase)MySettingsProperty.Settings).Save();
								}
							});
							addedHandler = true;
						}
					}
					finally
					{
						Monitor.Exit(obj);
					}
				}
				return defaultInstance;
			}
		}

		[DebuggerNonUserCode]
		public MySettings()
		{
		}

		[DebuggerNonUserCode]
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		private static void AutoSaveSettings(object sender, EventArgs e)
		{
			if (((WindowsFormsApplicationBase)phM=.sBM=).SaveMySettingsOnExit)
			{
				((ApplicationSettingsBase)MySettingsProperty.Settings).Save();
			}
		}
	}
	[HideModuleName]
	[StandardModule]
	[CompilerGenerated]
	[DebuggerNonUserCode]
	internal sealed class MySettingsProperty
	{
		[HelpKeyword("My.Settings")]
		internal static MySettings Settings => MySettings.Default;
	}
}
You are not using the latest version of the tool, please update.
Latest version is '11.1.0.9782' (yours is '8.2.0.7535-95108c96')
