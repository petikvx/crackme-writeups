using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Markup;

namespace Cr4ckM3;

public class MainWindow : Window, IComponentConnector
{
	private static readonly byte[] V01 = new byte[256]
	{
		15, 157, 173, 22, 121, 207, 118, 148, 192, 243,
		242, 81, 143, 246, 43, 113, 224, 231, 152, 83,
		55, 29, 91, 163, 162, 100, 137, 203, 171, 57,
		234, 244, 79, 62, 28, 209, 17, 146, 196, 175,
		161, 154, 227, 126, 82, 160, 201, 67, 14, 232,
		31, 202, 151, 112, 167, 206, 80, 210, 102, 247,
		36, 30, 116, 237, 8, 134, 172, 45, 11, 223,
		125, 115, 251, 211, 48, 64, 60, 144, 3, 111,
		205, 165, 169, 92, 186, 63, 108, 75, 178, 96,
		20, 228, 93, 129, 109, 135, 239, 133, 213, 132,
		59, 104, 13, 130, 240, 233, 37, 72, 122, 149,
		65, 181, 182, 142, 150, 6, 32, 51, 252, 183,
		88, 61, 248, 69, 54, 214, 245, 101, 225, 16,
		177, 164, 105, 187, 35, 170, 90, 76, 127, 218,
		71, 199, 238, 47, 249, 87, 216, 128, 78, 70,
		9, 74, 200, 50, 176, 38, 230, 42, 241, 235,
		124, 193, 221, 34, 53, 23, 212, 25, 123, 188,
		155, 179, 107, 184, 250, 219, 21, 73, 197, 156,
		5, 198, 114, 99, 85, 168, 56, 153, 18, 49,
		19, 136, 68, 222, 4, 86, 145, 254, 110, 117,
		66, 2, 7, 84, 139, 189, 159, 40, 94, 24,
		119, 180, 46, 229, 58, 77, 120, 208, 33, 220,
		217, 98, 39, 226, 41, 141, 190, 1, 204, 147,
		103, 44, 138, 194, 10, 26, 12, 95, 185, 0,
		97, 195, 191, 158, 215, 253, 52, 131, 89, 174,
		27, 140, 255, 106, 166, 236
	};

	private const string V02 = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

	internal TextBox V03;

	internal TextBox V04;

	private bool _contentLoaded;

	[STAThread]
	public static void Main()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		new Application().Run((Window)(object)new MainWindow());
	}

	public MainWindow()
	{
		InitializeComponent();
	}

	private static byte[] F02()
	{
		return new byte[1];
	}

	private void F04(object sender, RoutedEventArgs e)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		string text = V03.Text;
		string text2 = V04.Text.Trim().ToUpper();
		if (text.Length < 6)
		{
			MessageBox.Show("Username must be at least 6 characters long.", "Error", (MessageBoxButton)0, (MessageBoxImage)16);
			return;
		}
		string text3 = F06(text);
		if (text2 == text3)
		{
			MessageBox.Show("Activation successful!", "Success", (MessageBoxButton)0, (MessageBoxImage)64);
		}
		else
		{
			MessageBox.Show("The product key you entered didn't work. Check the key and try again.", "Activation Error", (MessageBoxButton)0, (MessageBoxImage)16);
		}
	}

	private void F05(object sender, RoutedEventArgs e)
	{
		Application.Current.Shutdown();
	}

	private void F07(object sender, TextChangedEventArgs e)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Expected O, but got Unknown
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Expected O, but got Unknown
		((TextBoxBase)V04).TextChanged -= new TextChangedEventHandler(F07);
		string text = V04.Text.Replace("-", "").ToUpper();
		if (text.Length > 25)
		{
			text = text.Substring(0, 25);
		}
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < text.Length; i++)
		{
			if (i > 0 && i % 5 == 0)
			{
				stringBuilder.Append("-");
			}
			stringBuilder.Append(text[i]);
		}
		V04.Text = stringBuilder.ToString();
		V04.CaretIndex = V04.Text.Length;
		((TextBoxBase)V04).TextChanged += new TextChangedEventHandler(F07);
	}

	private string F06(string V07)
	{
		using SHA256 sHA = SHA256.Create();
		byte[] array = sHA.ComputeHash(Encoding.UTF8.GetBytes(V07));
		for (int i = 0; i < array.Length; i++)
		{
			array[i] = V01[array[i]];
		}
		StringBuilder stringBuilder = new StringBuilder();
		int num = 0;
		int num2 = 0;
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			num = (num << 8) | b;
			num2 += 8;
			while (num2 >= 5)
			{
				num2 -= 5;
				int index = (num >> num2) & 0x1F;
				stringBuilder.Append("ABCDEFGHJKLMNPQRSTUVWXYZ23456789"[index]);
			}
		}
		if (num2 > 0)
		{
			int index2 = (num << 5 - num2) & 0x1F;
			stringBuilder.Append("ABCDEFGHJKLMNPQRSTUVWXYZ23456789"[index2]);
		}
		string text = stringBuilder.ToString().Substring(0, 25);
		StringBuilder stringBuilder2 = new StringBuilder();
		for (int k = 0; k < 25; k += 5)
		{
			stringBuilder2.Append(text.Substring(k, 5));
			if (k < 20)
			{
				stringBuilder2.Append("-");
			}
		}
		return stringBuilder2.ToString();
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "8.0.19.0")]
	public void InitializeComponent()
	{
		if (!_contentLoaded)
		{
			_contentLoaded = true;
			Uri uri = new Uri("/Cr4ckM3;component/mainwindow.xaml", UriKind.Relative);
			Application.LoadComponent((object)this, uri);
		}
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "8.0.19.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	void IComponentConnector.Connect(int connectionId, object target)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Expected O, but got Unknown
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Expected O, but got Unknown
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected O, but got Unknown
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Expected O, but got Unknown
		switch (connectionId)
		{
		case 1:
			V03 = (TextBox)target;
			break;
		case 2:
			V04 = (TextBox)target;
			((TextBoxBase)V04).TextChanged += new TextChangedEventHandler(F07);
			break;
		case 3:
			((ButtonBase)(Button)target).Click += new RoutedEventHandler(F04);
			break;
		case 4:
			((ButtonBase)(Button)target).Click += new RoutedEventHandler(F05);
			break;
		default:
			_contentLoaded = true;
			break;
		}
	}
}
