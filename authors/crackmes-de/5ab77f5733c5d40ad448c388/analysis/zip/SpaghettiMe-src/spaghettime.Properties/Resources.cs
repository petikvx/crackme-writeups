using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Resources;
using System.Runtime.CompilerServices;

namespace spaghettime.Properties;

[DebuggerNonUserCode]
[CompilerGenerated]
[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
internal class Resources
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
				ResourceManager resourceManager = new ResourceManager("spaghettime.Properties.Resources", typeof(Resources).Assembly);
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

	internal static byte[] BASSMOD
	{
		get
		{
			object @object = ResourceManager.GetObject("BASSMOD", resourceCulture);
			return (byte[])@object;
		}
	}

	internal static byte[] BassMOD_Net
	{
		get
		{
			object @object = ResourceManager.GetObject("BassMOD_Net", resourceCulture);
			return (byte[])@object;
		}
	}

	internal static byte[] cerror_ode_to_maktone
	{
		get
		{
			object @object = ResourceManager.GetObject("cerror_ode_to_maktone", resourceCulture);
			return (byte[])@object;
		}
	}

	internal Resources()
	{
	}
}
