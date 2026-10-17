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
using System.Runtime.Versioning;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.ApplicationServices;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;

[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("WindowsApplication1")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyTitle("WindowsApplication1")]
[assembly: TargetFramework(".NETFramework,Version=v4.0,Profile=Client", FrameworkDisplayName = ".NET Framework 4 Client Profile")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Guid("2132f4de-2918-46c7-b494-b61d03955523")]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: ComVisible(false)]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCopyright("Copyright ©  2010")]
[assembly: AssemblyVersion("1.0.0.0")]
namespace crackme.My
{
	[EditorBrowsable(EditorBrowsableState.Never)]
	[GeneratedCode("MyTemplate", "10.0.0.0")]
	internal class MyApplication : WindowsFormsApplicationBase
	{
		[MethodImpl(MethodImplOptions.NoInlining | MethodImplOptions.NoOptimization)]
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		[DebuggerHidden]
		[STAThread]
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
	[EditorBrowsable(EditorBrowsableState.Never)]
	[GeneratedCode("MyTemplate", "10.0.0.0")]
	internal class MyComputer : Computer
	{
		[DebuggerHidden]
		[EditorBrowsable(EditorBrowsableState.Never)]
		public MyComputer()
		{
		}
	}
	[GeneratedCode("MyTemplate", "10.0.0.0")]
	[HideModuleName]
	[StandardModule]
	internal sealed class MyProject
	{
		[EditorBrowsable(EditorBrowsableState.Never)]
		[MyGroupCollection("System.Windows.Forms.Form", "Create__Instance__", "Dispose__Instance__", "My.MyProject.Forms")]
		internal sealed class MyForms
		{
			public Form1 m_Form1;

			[ThreadStatic]
			private static Hashtable m_FormBeingCreated;

			public Form1 Form1
			{
				get
				{
					m_Form1 = Create__Instance__(m_Form1);
					return m_Form1;
				}
				set
				{
					if (value != m_Form1)
					{
						if (value != null)
						{
							throw new ArgumentException("Property can only be set to Nothing");
						}
						Dispose__Instance__(ref m_Form1);
					}
				}
			}

			[DebuggerHidden]
			private static T Create__Instance__<T>(T Instance) where T : Form, new()
			{
				if (Instance == null || ((Control)Instance).IsDisposed)
				{
					if (m_FormBeingCreated != null)
					{
						if (m_FormBeingCreated.ContainsKey(typeof(T)))
						{
							throw new InvalidOperationException(Utils.GetResourceString("WinForms_RecursiveFormCreate", new string[0]));
						}
					}
					else
					{
						m_FormBeingCreated = new Hashtable();
					}
					m_FormBeingCreated.Add(typeof(T), null);
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
						m_FormBeingCreated.Remove(typeof(T));
					}
				}
				return Instance;
			}

			[DebuggerHidden]
			private void Dispose__Instance__<T>(ref T instance) where T : Form
			{
				((Component)instance).Dispose();
				instance = default(T);
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public MyForms()
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
			internal new Type GetType()
			{
				return typeof(MyForms);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			public override string ToString()
			{
				return base.ToString();
			}
		}

		[MyGroupCollection("System.Web.Services.Protocols.SoapHttpClientProtocol", "Create__Instance__", "Dispose__Instance__", "")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		internal sealed class MyWebServices
		{
			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public override bool Equals(object o)
			{
				return base.Equals(RuntimeHelpers.GetObjectValue(o));
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public override int GetHashCode()
			{
				return base.GetHashCode();
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			internal new Type GetType()
			{
				return typeof(MyWebServices);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public override string ToString()
			{
				return base.ToString();
			}

			[DebuggerHidden]
			private static T Create__Instance__<T>(T instance) where T : new()
			{
				if (instance == null)
				{
					return new T();
				}
				return instance;
			}

			[DebuggerHidden]
			private void Dispose__Instance__<T>(ref T instance)
			{
				instance = default(T);
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public MyWebServices()
			{
			}
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		[ComVisible(false)]
		internal sealed class ThreadSafeObjectProvider<T> where T : new()
		{
			[ThreadStatic]
			[CompilerGenerated]
			private static T m_ThreadStaticValue;

			internal T GetInstance
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

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public ThreadSafeObjectProvider()
			{
			}
		}

		private static readonly ThreadSafeObjectProvider<MyComputer> m_ComputerObjectProvider = new ThreadSafeObjectProvider<MyComputer>();

		private static readonly ThreadSafeObjectProvider<MyApplication> m_AppObjectProvider = new ThreadSafeObjectProvider<MyApplication>();

		private static readonly ThreadSafeObjectProvider<User> m_UserObjectProvider = new ThreadSafeObjectProvider<User>();

		private static ThreadSafeObjectProvider<MyForms> m_MyFormsObjectProvider = new ThreadSafeObjectProvider<MyForms>();

		private static readonly ThreadSafeObjectProvider<MyWebServices> m_MyWebServicesObjectProvider = new ThreadSafeObjectProvider<MyWebServices>();

		[HelpKeyword("My.Computer")]
		internal static MyComputer Computer
		{
			[DebuggerHidden]
			get
			{
				return m_ComputerObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.Application")]
		internal static MyApplication Application
		{
			[DebuggerHidden]
			get
			{
				return m_AppObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.User")]
		internal static User User
		{
			[DebuggerHidden]
			get
			{
				return m_UserObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.Forms")]
		internal static MyForms Forms
		{
			[DebuggerHidden]
			get
			{
				return m_MyFormsObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.WebServices")]
		internal static MyWebServices WebServices
		{
			[DebuggerHidden]
			get
			{
				return m_MyWebServicesObjectProvider.GetInstance;
			}
		}
	}
}
namespace crackme
{
	[DesignerGenerated]
	public class Form1 : Form
	{
		private IContainer components;

		[AccessedThroughProperty("user")]
		private TextBox _user;

		[AccessedThroughProperty("Label1")]
		private Label _Label1;

		[AccessedThroughProperty("Label2")]
		private Label _Label2;

		[AccessedThroughProperty("serial")]
		private TextBox _serial;

		[AccessedThroughProperty("check_btn")]
		private Button _check_btn;

		internal virtual TextBox user
		{
			get
			{
				return _user;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			set
			{
				_user = value;
			}
		}

		internal virtual Label Label1
		{
			get
			{
				return _Label1;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			set
			{
				_Label1 = value;
			}
		}

		internal virtual Label Label2
		{
			get
			{
				return _Label2;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			set
			{
				_Label2 = value;
			}
		}

		internal virtual TextBox serial
		{
			get
			{
				return _serial;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			set
			{
				_serial = value;
			}
		}

		internal virtual Button check_btn
		{
			get
			{
				return _check_btn;
			}
			[MethodImpl(MethodImplOptions.Synchronized)]
			set
			{
				EventHandler eventHandler = check_btn_Click;
				if (_check_btn != null)
				{
					((Control)_check_btn).Click -= eventHandler;
				}
				_check_btn = value;
				if (_check_btn != null)
				{
					((Control)_check_btn).Click += eventHandler;
				}
			}
		}

		public Form1()
		{
			((Form)this).Load += Form1_Load;
			InitializeComponent();
		}

		[DebuggerNonUserCode]
		protected override void Dispose(bool disposing)
		{
			try
			{
				if (disposing && components != null)
				{
					components.Dispose();
				}
			}
			finally
			{
				((Form)this).Dispose(disposing);
			}
		}

		[DebuggerStepThrough]
		private void InitializeComponent()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Expected O, but got Unknown
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Expected O, but got Unknown
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			user = new TextBox();
			Label1 = new Label();
			Label2 = new Label();
			serial = new TextBox();
			check_btn = new Button();
			((Control)this).SuspendLayout();
			TextBox obj = user;
			Point location = new Point(69, 12);
			((Control)obj).Location = location;
			((Control)user).Name = "user";
			TextBox obj2 = user;
			Size size = new Size(428, 20);
			((Control)obj2).Size = size;
			((Control)user).TabIndex = 0;
			Label1.AutoSize = true;
			Label label = Label1;
			location = new Point(2, 18);
			((Control)label).Location = location;
			((Control)Label1).Name = "Label1";
			Label label2 = Label1;
			size = new Size(61, 13);
			((Control)label2).Size = size;
			((Control)Label1).TabIndex = 1;
			Label1.Text = "Enter name";
			Label2.AutoSize = true;
			Label label3 = Label2;
			location = new Point(2, 48);
			((Control)label3).Location = location;
			((Control)Label2).Name = "Label2";
			Label label4 = Label2;
			size = new Size(33, 13);
			((Control)label4).Size = size;
			((Control)Label2).TabIndex = 2;
			Label2.Text = "Serial";
			TextBox obj3 = serial;
			location = new Point(69, 41);
			((Control)obj3).Location = location;
			((Control)serial).Name = "serial";
			TextBox obj4 = serial;
			size = new Size(428, 20);
			((Control)obj4).Size = size;
			((Control)serial).TabIndex = 3;
			Button obj5 = check_btn;
			location = new Point(5, 79);
			((Control)obj5).Location = location;
			((Control)check_btn).Name = "check_btn";
			Button obj6 = check_btn;
			size = new Size(492, 33);
			((Control)obj6).Size = size;
			((Control)check_btn).TabIndex = 5;
			((ButtonBase)check_btn).Text = "Check Serial!";
			((ButtonBase)check_btn).UseVisualStyleBackColor = true;
			SizeF autoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			size = new Size(509, 124);
			((Form)this).ClientSize = size;
			((Control)this).Controls.Add((Control)(object)check_btn);
			((Control)this).Controls.Add((Control)(object)serial);
			((Control)this).Controls.Add((Control)(object)Label2);
			((Control)this).Controls.Add((Control)(object)Label1);
			((Control)this).Controls.Add((Control)(object)user);
			((Form)this).MaximizeBox = false;
			((Control)this).Name = "Form1";
			((Form)this).Text = "CrackMe2.0";
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
		}

		private void encrypt(string str)
		{
			//IL_010d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
			if (Operators.CompareString(user.Text, "", false) != 0)
			{
				object obj = 0;
				object obj2 = default(object);
				object obj3 = default(object);
				if (ForLoopControl.ForLoopInitObj(obj2, (object)0, (object)10000, (object)1, ref obj3, ref obj2))
				{
					do
					{
						obj = ((!Operators.ConditionalCompareObjectNotEqual(Operators.ModObject(obj2, (object)100), (object)0, false)) ? Operators.AddObject(obj, (object)1) : Operators.AddObject(Operators.MultiplyObject(obj, (object)9), (object)Strings.Len(user.Text)));
					}
					while (ForLoopControl.ForNextCheckObj(obj2, obj3, ref obj2));
				}
				object obj4 = Operators.AddObject(obj, (object)Strings.Len(user.Text));
				if (Operators.CompareString(serial.Text, obj4.ToString(), false) != 0)
				{
					Interaction.MsgBox((object)"That's very easy! Retry...", (MsgBoxStyle)48, (object)"CrackMe 2.0");
				}
				else
				{
					Interaction.MsgBox((object)"Nice Job! Now post your Keygen!", (MsgBoxStyle)64, (object)"CrackMe 2.0");
				}
			}
			else
			{
				Interaction.MsgBox((object)"You're kidding me.", (MsgBoxStyle)48, (object)"CrackMe 2.0");
			}
		}

		private void check_btn_Click(object sender, EventArgs e)
		{
			encrypt(user.Text);
		}
	}
}
namespace crackme.My.Resources
{
	[HideModuleName]
	[StandardModule]
	[DebuggerNonUserCode]
	[CompilerGenerated]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
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
	[EditorBrowsable(EditorBrowsableState.Advanced)]
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
	[CompilerGenerated]
	internal sealed class MySettings : ApplicationSettingsBase
	{
		private static MySettings defaultInstance = (MySettings)(object)SettingsBase.Synchronized((SettingsBase)(object)new MySettings());

		private static bool addedHandler;

		private static object addedHandlerLockObject = RuntimeHelpers.GetObjectValue(new object());

		public static MySettings Default
		{
			get
			{
				//IL_0030: Unknown result type (might be due to invalid IL or missing references)
				//IL_003a: Expected O, but got Unknown
				if (!addedHandler)
				{
					object obj = addedHandlerLockObject;
					ObjectFlowControl.CheckForSyncLockOnValueType(obj);
					bool lockTaken = false;
					try
					{
						Monitor.Enter(obj, ref lockTaken);
						if (!addedHandler)
						{
							((WindowsFormsApplicationBase)MyProject.Application).Shutdown += (ShutdownEventHandler)([DebuggerNonUserCode] [EditorBrowsable(EditorBrowsableState.Advanced)] (object sender, EventArgs e) =>
							{
								if (((WindowsFormsApplicationBase)MyProject.Application).SaveMySettingsOnExit)
								{
									((ApplicationSettingsBase)MySettingsProperty.Settings).Save();
								}
							});
							addedHandler = true;
						}
					}
					finally
					{
						if (lockTaken)
						{
							Monitor.Exit(obj);
						}
					}
				}
				return defaultInstance;
			}
		}

		[DebuggerNonUserCode]
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		private static void AutoSaveSettings(object sender, EventArgs e)
		{
			if (((WindowsFormsApplicationBase)MyProject.Application).SaveMySettingsOnExit)
			{
				((ApplicationSettingsBase)MySettingsProperty.Settings).Save();
			}
		}
	}
	[DebuggerNonUserCode]
	[HideModuleName]
	[CompilerGenerated]
	[StandardModule]
	internal sealed class MySettingsProperty
	{
		[HelpKeyword("My.Settings")]
		internal static MySettings Settings => MySettings.Default;
	}
}
You are not using the latest version of the tool, please update.
Latest version is '11.1.0.9782' (yours is '8.2.0.7535-95108c96')
