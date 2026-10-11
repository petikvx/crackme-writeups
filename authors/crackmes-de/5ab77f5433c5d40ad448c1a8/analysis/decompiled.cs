using System;
using System.Diagnostics;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

[assembly: AssemblyCopyright("© Microsoft Corporation. All rights reserved.")]
[assembly: ComVisible(false)]
[assembly: CLSCompliant(true)]
[assembly: AssemblyTitle("vshost.exe")]
[assembly: AssemblyDescription("vshost.exe")]
[assembly: AssemblyDefaultAlias("vshost.exe")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft (R) Visual Studio (R) 2008")]
[assembly: NeutralResourcesLanguage("en-US")]
[assembly: AssemblyFileVersion("9.0.21022.8")]
[assembly: AssemblyInformationalVersion("9.0.21022.8")]
[assembly: SatelliteContractVersion("9.0.0.0")]
[assembly: AssemblyKeyFile("f:\\dd\\tools\\devdiv\\FinalPublicKey.snk")]
[assembly: AssemblyDelaySign(true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyVersion("9.0.0.0")]
namespace Microsoft.VisualStudio.HostingProcess;

public sealed class EntryPoint
{
	private EntryPoint()
	{
	}

	[DebuggerNonUserCode]
	public static void Main()
	{
		if (Synchronize.HostingProcessInitialized != null)
		{
			Synchronize.HostingProcessInitialized.Set();
			if (Synchronize.StartRunningUsersAssembly != null)
			{
				Synchronize.StartRunningUsersAssembly.WaitOne();
			}
		}
	}
}
using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using RunTime;
using SerialNumber;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyTitle("Game")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyDescription("abfa2005@gmail.com")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("Game")]
[assembly: AssemblyCopyright("Copyright © 2010")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("47aba0e9-926c-4294-b615-e504a54a729d")]
[assembly: AssemblyFileVersion("2.1.1.2")]
[assembly: AssemblyVersion("1.0.1.9")]
namespace Game
{
	public class Game110 : Form
	{
		private int[,] tab_min = new int[4, 4];

		private int bomb = 5;

		private int c_bomb;

		private int c_open;

		private TimeSpan time;

		private IContainer components;

		private Panel panel1;

		private Button button9;

		private Button button8;

		private Button button7;

		private Button button6;

		private Button button5;

		private Button button4;

		private Button button3;

		private Button button2;

		private Button button1;

		private Button button17;

		private Button button16;

		private Button button15;

		private Button button14;

		private Button button13;

		private Button button12;

		private Button button11;

		private MenuStrip menuStrip1;

		private ToolStripMenuItem helpToolStripMenuItem;

		private ToolStripMenuItem registerToolStripMenuItem;

		private ToolStripMenuItem aboutToolStripMenuItem;

		private Label L1;

		public Game110()
		{
			InitializeComponent();
		}

		private void button10_Click(object sender, EventArgs e)
		{
			Random random = new Random();
			int num = 0;
			int num2 = 0;
			int num3 = 0;
			c_bomb = 0;
			c_open = 0;
			for (num = 0; num < 4; num++)
			{
				for (num2 = 0; num2 < 4; num2++)
				{
					tab_min[num, num2] = 0;
				}
			}
			num = 0;
			num2 = 0;
			num3 = 0;
			while (num3 < 5)
			{
				num = random.Next(0, 4);
				num2 = random.Next(0, 4);
				if (tab_min[num, num2] != -1)
				{
					tab_min[num, num2] = -1;
					if (num < 3 && tab_min[num + 1, num2] != -1)
					{
						tab_min[num + 1, num2]++;
					}
					if (num > 0 && tab_min[num - 1, num2] != -1)
					{
						tab_min[num - 1, num2]++;
					}
					if (num2 < 3 && tab_min[num, num2 + 1] != -1)
					{
						tab_min[num, num2 + 1]++;
					}
					if (num2 > 0 && tab_min[num, num2 - 1] != -1)
					{
						tab_min[num, num2 - 1]++;
					}
					if (num + 1 < 4 && num2 - 1 >= 0 && tab_min[num + 1, num2 - 1] != -1)
					{
						tab_min[num + 1, num2 - 1]++;
					}
					if (num - 1 >= 0 && num2 - 1 >= 0 && tab_min[num - 1, num2 - 1] != -1)
					{
						tab_min[num - 1, num2 - 1]++;
					}
					if (num + 1 < 4 && num2 + 1 < 4 && tab_min[num + 1, num2 + 1] != -1)
					{
						tab_min[num + 1, num2 + 1]++;
					}
					if (num - 1 >= 0 && num2 + 1 < 4 && tab_min[num - 1, num2 + 1] != -1)
					{
						tab_min[num - 1, num2 + 1]++;
					}
					num3++;
				}
			}
			((Control)button1).Text = "";
			((Control)button2).Text = "";
			((Control)button3).Text = "";
			((Control)button4).Text = "";
			((Control)button5).Text = "";
			((Control)button6).Text = "";
			((Control)button7).Text = "";
			((Control)button8).Text = "";
			((Control)button9).Text = "";
			((Control)button11).Text = "";
			((Control)button12).Text = "";
			((Control)button13).Text = "";
			((Control)button14).Text = "";
			((Control)button15).Text = "";
			((Control)button16).Text = "";
			((Control)button17).Text = "";
			time = new TimeSpan(DateTime.Now.Ticks);
			((Control)panel1).Enabled = true;
		}

		private void Form1_Load(object sender, EventArgs e)
		{
		}

		private void button1_Click(object sender, EventArgs e)
		{
			if (!(((Control)button1).Text == "۩"))
			{
				if (tab_min[0, 0] == -1)
				{
					((Control)button1).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button1).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button1).Text = tab_min[0, 0].ToString();
			}
		}

		private void button2_Click(object sender, EventArgs e)
		{
			if (!(((Control)button2).Text == "۩"))
			{
				if (tab_min[0, 1] == -1)
				{
					((Control)button2).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button2).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button2).Text = tab_min[0, 1].ToString();
			}
		}

		private void button3_Click(object sender, EventArgs e)
		{
			if (!(((Control)button3).Text == "۩"))
			{
				if (tab_min[0, 2] == -1)
				{
					((Control)button3).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button3).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button3).Text = tab_min[0, 2].ToString();
			}
		}

		private void button4_Click(object sender, EventArgs e)
		{
			if (!(((Control)button4).Text == "۩"))
			{
				if (tab_min[0, 3] == -1)
				{
					((Control)button4).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button4).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button4).Text = tab_min[0, 3].ToString();
			}
		}

		private void button5_Click(object sender, EventArgs e)
		{
			if (!(((Control)button5).Text == "۩"))
			{
				if (tab_min[1, 0] == -1)
				{
					((Control)button5).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button5).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button5).Text = tab_min[1, 0].ToString();
			}
		}

		private void button6_Click(object sender, EventArgs e)
		{
			if (!(((Control)button6).Text == "۩"))
			{
				if (tab_min[1, 1] == -1)
				{
					((Control)button6).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button6).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button6).Text = tab_min[1, 1].ToString();
			}
		}

		private void button7_Click(object sender, EventArgs e)
		{
			if (!(((Control)button7).Text == "۩"))
			{
				if (tab_min[1, 2] == -1)
				{
					((Control)button7).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button7).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button7).Text = tab_min[1, 2].ToString();
			}
		}

		private void button8_Click(object sender, EventArgs e)
		{
			if (!(((Control)button8).Text == "۩"))
			{
				if (tab_min[1, 3] == -1)
				{
					((Control)button8).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button8).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button8).Text = tab_min[1, 3].ToString();
			}
		}

		private void button9_Click(object sender, EventArgs e)
		{
			if (!(((Control)button9).Text == "۩"))
			{
				if (tab_min[2, 0] == -1)
				{
					((Control)button9).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button9).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button9).Text = tab_min[2, 0].ToString();
			}
		}

		private void button11_Click(object sender, EventArgs e)
		{
			if (!(((Control)button11).Text == "۩"))
			{
				if (tab_min[2, 1] == -1)
				{
					((Control)button11).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button11).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button11).Text = tab_min[2, 1].ToString();
			}
		}

		private void button12_Click(object sender, EventArgs e)
		{
			if (!(((Control)button12).Text == "۩"))
			{
				if (tab_min[2, 2] == -1)
				{
					((Control)button12).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button12).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button12).Text = tab_min[2, 2].ToString();
			}
		}

		private void button13_Click(object sender, EventArgs e)
		{
			if (!(((Control)button13).Text == "۩"))
			{
				if (tab_min[2, 3] == -1)
				{
					((Control)button13).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button13).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button13).Text = tab_min[2, 3].ToString();
			}
		}

		private void button14_Click(object sender, EventArgs e)
		{
			if (!(((Control)button14).Text == "۩"))
			{
				if (tab_min[3, 0] == -1)
				{
					((Control)button14).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button14).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button14).Text = tab_min[3, 0].ToString();
			}
		}

		private void button15_Click(object sender, EventArgs e)
		{
			if (!(((Control)button15).Text == "۩"))
			{
				if (tab_min[3, 1] == -1)
				{
					((Control)button15).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button15).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button15).Text = tab_min[3, 1].ToString();
			}
		}

		private void button16_Click(object sender, EventArgs e)
		{
			if (!(((Control)button16).Text == "۩"))
			{
				if (tab_min[3, 2] == -1)
				{
					((Control)button16).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button16).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button16).Text = tab_min[3, 2].ToString();
			}
		}

		private void button17_Click(object sender, EventArgs e)
		{
			if (!(((Control)button17).Text == "۩"))
			{
				if (tab_min[3, 3] == -1)
				{
					((Control)button17).BackColor = Color.Red;
					loss();
					return;
				}
				((Control)button17).BackColor = Color.Teal;
				c_open++;
				WINNER();
				((Control)button17).Text = tab_min[3, 3].ToString();
			}
		}

		private void button1_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button1).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button1).Text == "")
			{
				if (P_bomb())
				{
					((Control)button1).Text = "۩";
				}
			}
			else if (((Control)button1).Text == "۩" && M_bomb())
			{
				((Control)button1).Text = "";
			}
		}

		private void button2_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button2).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button2).Text == "")
			{
				if (P_bomb())
				{
					((Control)button2).Text = "۩";
				}
			}
			else if (((Control)button2).Text == "۩" && M_bomb())
			{
				((Control)button2).Text = "";
			}
		}

		private void button3_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button3).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button3).Text == "")
			{
				if (P_bomb())
				{
					((Control)button3).Text = "۩";
				}
			}
			else if (((Control)button3).Text == "۩" && M_bomb())
			{
				((Control)button3).Text = "";
			}
		}

		private void button4_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button4).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button4).Text == "")
			{
				if (P_bomb())
				{
					((Control)button4).Text = "۩";
				}
			}
			else if (((Control)button4).Text == "۩" && M_bomb())
			{
				((Control)button4).Text = "";
			}
		}

		private void button5_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button5).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button5).Text == "")
			{
				if (P_bomb())
				{
					((Control)button5).Text = "۩";
				}
			}
			else if (((Control)button5).Text == "۩" && M_bomb())
			{
				((Control)button5).Text = "";
			}
		}

		private void button6_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button6).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button6).Text == "")
			{
				if (P_bomb())
				{
					((Control)button6).Text = "۩";
				}
			}
			else if (((Control)button6).Text == "۩" && M_bomb())
			{
				((Control)button6).Text = "";
			}
		}

		private void button7_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button7).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button7).Text == "")
			{
				if (P_bomb())
				{
					((Control)button7).Text = "۩";
				}
			}
			else if (((Control)button7).Text == "۩" && M_bomb())
			{
				((Control)button7).Text = "";
			}
		}

		private void button8_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button8).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button8).Text == "")
			{
				if (P_bomb())
				{
					((Control)button8).Text = "۩";
				}
			}
			else if (((Control)button8).Text == "۩" && M_bomb())
			{
				((Control)button8).Text = "";
			}
		}

		private void button9_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button9).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button9).Text == "")
			{
				if (P_bomb())
				{
					((Control)button9).Text = "۩";
				}
			}
			else if (((Control)button9).Text == "۩" && M_bomb())
			{
				((Control)button9).Text = "";
			}
		}

		private void button11_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button11).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button11).Text == "")
			{
				if (P_bomb())
				{
					((Control)button11).Text = "۩";
				}
			}
			else if (((Control)button11).Text == "۩" && M_bomb())
			{
				((Control)button11).Text = "";
			}
		}

		private void button12_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button12).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button12).Text == "")
			{
				if (P_bomb())
				{
					((Control)button12).Text = "۩";
				}
			}
			else if (((Control)button12).Text == "۩" && M_bomb())
			{
				((Control)button12).Text = "";
			}
		}

		private void button13_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button13).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button13).Text == "")
			{
				if (P_bomb())
				{
					((Control)button13).Text = "۩";
				}
			}
			else if (((Control)button13).Text == "۩" && M_bomb())
			{
				((Control)button13).Text = "";
			}
		}

		private void button14_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button14).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button14).Text == "")
			{
				if (P_bomb())
				{
					((Control)button14).Text = "۩";
				}
			}
			else if (((Control)button14).Text == "۩" && M_bomb())
			{
				((Control)button14).Text = "";
			}
		}

		private void button15_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button15).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button15).Text == "")
			{
				if (P_bomb())
				{
					((Control)button15).Text = "۩";
				}
			}
			else if (((Control)button15).Text == "۩" && M_bomb())
			{
				((Control)button15).Text = "";
			}
		}

		private void button16_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button16).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button16).Text == "")
			{
				if (P_bomb())
				{
					((Control)button16).Text = "۩";
				}
			}
			else if (((Control)button16).Text == "۩" && M_bomb())
			{
				((Control)button16).Text = "";
			}
		}

		private void button17_MouseDown(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			if ((int)e.Button != 2097152 || ((Control)button17).BackColor == Color.Red)
			{
				return;
			}
			if (((Control)button17).Text == "")
			{
				if (P_bomb())
				{
					((Control)button17).Text = "۩";
				}
			}
			else if (((Control)button17).Text == "۩" && M_bomb())
			{
				((Control)button17).Text = "";
			}
		}

		private bool P_bomb()
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			if (c_bomb + 1 <= bomb)
			{
				c_bomb++;
				WINNER();
				return true;
			}
			MessageBox.Show("شما پرچم ندارید");
			return false;
		}

		private bool M_bomb()
		{
			if (c_bomb - 1 >= 0)
			{
				c_bomb--;
				WINNER();
				return true;
			}
			return false;
		}

		private void loss()
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			MessageBox.Show("شما باختید");
			TimeSpan timeSpan = new TimeSpan(DateTime.Now.Ticks);
			_ = timeSpan - time;
			((Control)panel1).Enabled = false;
		}

		private void WINNER()
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			if (c_open + c_bomb == 16)
			{
				MessageBox.Show("شما برنده شدید");
				TimeSpan timeSpan = new TimeSpan(DateTime.Now.Ticks);
				_ = timeSpan - time;
				((Control)panel1).Enabled = false;
			}
		}

		private void registerToolStripMenuItem_Click(object sender, EventArgs e)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			Register register = new Register();
			((Form)register).ShowDialog();
		}

		private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			AboutBox aboutBox = new AboutBox();
			((Form)aboutBox).ShowDialog();
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
			((Form)this).Dispose(disposing);
		}

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
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Expected O, but got Unknown
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0085: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Expected O, but got Unknown
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Expected O, but got Unknown
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b0: Expected O, but got Unknown
			//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d1: Expected O, but got Unknown
			//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dc: Expected O, but got Unknown
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Expected O, but got Unknown
			//IL_0336: Unknown result type (might be due to invalid IL or missing references)
			//IL_0340: Expected O, but got Unknown
			//IL_03b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_03bf: Expected O, but got Unknown
			//IL_0434: Unknown result type (might be due to invalid IL or missing references)
			//IL_043e: Expected O, but got Unknown
			//IL_04b3: Unknown result type (might be due to invalid IL or missing references)
			//IL_04bd: Expected O, but got Unknown
			//IL_0532: Unknown result type (might be due to invalid IL or missing references)
			//IL_053c: Expected O, but got Unknown
			//IL_05b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_05bb: Expected O, but got Unknown
			//IL_0630: Unknown result type (might be due to invalid IL or missing references)
			//IL_063a: Expected O, but got Unknown
			//IL_06af: Unknown result type (might be due to invalid IL or missing references)
			//IL_06b9: Expected O, but got Unknown
			//IL_072e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0738: Expected O, but got Unknown
			//IL_07ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_07b7: Expected O, but got Unknown
			//IL_082c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0836: Expected O, but got Unknown
			//IL_08ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_08b5: Expected O, but got Unknown
			//IL_0929: Unknown result type (might be due to invalid IL or missing references)
			//IL_0933: Expected O, but got Unknown
			//IL_09a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_09b1: Expected O, but got Unknown
			//IL_0a25: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a2f: Expected O, but got Unknown
			//IL_0aa3: Unknown result type (might be due to invalid IL or missing references)
			//IL_0aad: Expected O, but got Unknown
			//IL_0c2f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0c39: Expected O, but got Unknown
			panel1 = new Panel();
			button17 = new Button();
			button16 = new Button();
			button15 = new Button();
			button14 = new Button();
			button13 = new Button();
			button12 = new Button();
			button11 = new Button();
			button9 = new Button();
			button8 = new Button();
			button7 = new Button();
			button6 = new Button();
			button5 = new Button();
			button4 = new Button();
			button3 = new Button();
			button2 = new Button();
			button1 = new Button();
			menuStrip1 = new MenuStrip();
			helpToolStripMenuItem = new ToolStripMenuItem();
			registerToolStripMenuItem = new ToolStripMenuItem();
			aboutToolStripMenuItem = new ToolStripMenuItem();
			L1 = new Label();
			((Control)panel1).SuspendLayout();
			((Control)menuStrip1).SuspendLayout();
			((Control)this).SuspendLayout();
			((Control)panel1).Controls.Add((Control)(object)button17);
			((Control)panel1).Controls.Add((Control)(object)button16);
			((Control)panel1).Controls.Add((Control)(object)button15);
			((Control)panel1).Controls.Add((Control)(object)button14);
			((Control)panel1).Controls.Add((Control)(object)button13);
			((Control)panel1).Controls.Add((Control)(object)button12);
			((Control)panel1).Controls.Add((Control)(object)button11);
			((Control)panel1).Controls.Add((Control)(object)button9);
			((Control)panel1).Controls.Add((Control)(object)button8);
			((Control)panel1).Controls.Add((Control)(object)button7);
			((Control)panel1).Controls.Add((Control)(object)button6);
			((Control)panel1).Controls.Add((Control)(object)button5);
			((Control)panel1).Controls.Add((Control)(object)button4);
			((Control)panel1).Controls.Add((Control)(object)button3);
			((Control)panel1).Controls.Add((Control)(object)button2);
			((Control)panel1).Controls.Add((Control)(object)button1);
			((Control)panel1).Enabled = false;
			((Control)panel1).Location = new Point(2, 37);
			((Control)panel1).Name = "panel1";
			((Control)panel1).Size = new Size(159, 127);
			((Control)panel1).TabIndex = 9;
			((Control)button17).Location = new Point(110, 95);
			((Control)button17).Name = "button17";
			((Control)button17).Size = new Size(27, 23);
			((Control)button17).TabIndex = 24;
			((ButtonBase)button17).UseVisualStyleBackColor = true;
			((Control)button17).Click += button17_Click;
			((Control)button17).MouseDown += new MouseEventHandler(button17_MouseDown);
			((Control)button16).Location = new Point(77, 95);
			((Control)button16).Name = "button16";
			((Control)button16).Size = new Size(27, 23);
			((Control)button16).TabIndex = 23;
			((ButtonBase)button16).UseVisualStyleBackColor = true;
			((Control)button16).Click += button16_Click;
			((Control)button16).MouseDown += new MouseEventHandler(button16_MouseDown);
			((Control)button15).Location = new Point(44, 95);
			((Control)button15).Name = "button15";
			((Control)button15).Size = new Size(27, 23);
			((Control)button15).TabIndex = 22;
			((ButtonBase)button15).UseVisualStyleBackColor = true;
			((Control)button15).Click += button15_Click;
			((Control)button15).MouseDown += new MouseEventHandler(button15_MouseDown);
			((Control)button14).Location = new Point(10, 95);
			((Control)button14).Name = "button14";
			((Control)button14).Size = new Size(27, 23);
			((Control)button14).TabIndex = 21;
			((ButtonBase)button14).UseVisualStyleBackColor = true;
			((Control)button14).Click += button14_Click;
			((Control)button14).MouseDown += new MouseEventHandler(button14_MouseDown);
			((Control)button13).Location = new Point(110, 66);
			((Control)button13).Name = "button13";
			((Control)button13).Size = new Size(27, 23);
			((Control)button13).TabIndex = 20;
			((ButtonBase)button13).UseVisualStyleBackColor = true;
			((Control)button13).Click += button13_Click;
			((Control)button13).MouseDown += new MouseEventHandler(button13_MouseDown);
			((Control)button12).Location = new Point(77, 66);
			((Control)button12).Name = "button12";
			((Control)button12).Size = new Size(27, 23);
			((Control)button12).TabIndex = 19;
			((ButtonBase)button12).UseVisualStyleBackColor = true;
			((Control)button12).Click += button12_Click;
			((Control)button12).MouseDown += new MouseEventHandler(button12_MouseDown);
			((Control)button11).Location = new Point(44, 66);
			((Control)button11).Name = "button11";
			((Control)button11).Size = new Size(27, 23);
			((Control)button11).TabIndex = 18;
			((ButtonBase)button11).UseVisualStyleBackColor = true;
			((Control)button11).Click += button11_Click;
			((Control)button11).MouseDown += new MouseEventHandler(button11_MouseDown);
			((Control)button9).Location = new Point(11, 66);
			((Control)button9).Name = "button9";
			((Control)button9).Size = new Size(27, 23);
			((Control)button9).TabIndex = 17;
			((ButtonBase)button9).UseVisualStyleBackColor = true;
			((Control)button9).Click += button9_Click;
			((Control)button9).MouseDown += new MouseEventHandler(button9_MouseDown);
			((Control)button8).Location = new Point(110, 37);
			((Control)button8).Name = "button8";
			((Control)button8).Size = new Size(27, 23);
			((Control)button8).TabIndex = 16;
			((ButtonBase)button8).UseVisualStyleBackColor = true;
			((Control)button8).Click += button8_Click;
			((Control)button8).MouseDown += new MouseEventHandler(button8_MouseDown);
			((Control)button7).Location = new Point(77, 37);
			((Control)button7).Name = "button7";
			((Control)button7).Size = new Size(27, 23);
			((Control)button7).TabIndex = 15;
			((ButtonBase)button7).UseVisualStyleBackColor = true;
			((Control)button7).Click += button7_Click;
			((Control)button7).MouseDown += new MouseEventHandler(button7_MouseDown);
			((Control)button6).Location = new Point(44, 37);
			((Control)button6).Name = "button6";
			((Control)button6).Size = new Size(27, 23);
			((Control)button6).TabIndex = 14;
			((ButtonBase)button6).UseVisualStyleBackColor = true;
			((Control)button6).Click += button6_Click;
			((Control)button6).MouseDown += new MouseEventHandler(button6_MouseDown);
			((Control)button5).Location = new Point(11, 37);
			((Control)button5).Name = "button5";
			((Control)button5).Size = new Size(27, 23);
			((Control)button5).TabIndex = 13;
			((ButtonBase)button5).UseVisualStyleBackColor = true;
			((Control)button5).Click += button5_Click;
			((Control)button5).MouseDown += new MouseEventHandler(button5_MouseDown);
			((Control)button4).Location = new Point(110, 8);
			((Control)button4).Name = "button4";
			((Control)button4).Size = new Size(27, 23);
			((Control)button4).TabIndex = 12;
			((ButtonBase)button4).UseVisualStyleBackColor = true;
			((Control)button4).Click += button4_Click;
			((Control)button4).MouseDown += new MouseEventHandler(button4_MouseDown);
			((Control)button3).Location = new Point(77, 8);
			((Control)button3).Name = "button3";
			((Control)button3).Size = new Size(27, 23);
			((Control)button3).TabIndex = 11;
			((ButtonBase)button3).UseVisualStyleBackColor = true;
			((Control)button3).Click += button3_Click;
			((Control)button3).MouseDown += new MouseEventHandler(button3_MouseDown);
			((Control)button2).Location = new Point(44, 8);
			((Control)button2).Name = "button2";
			((Control)button2).Size = new Size(27, 23);
			((Control)button2).TabIndex = 10;
			((ButtonBase)button2).UseVisualStyleBackColor = true;
			((Control)button2).Click += button2_Click;
			((Control)button2).MouseDown += new MouseEventHandler(button2_MouseDown);
			((Control)button1).Location = new Point(11, 8);
			((Control)button1).Name = "button1";
			((Control)button1).Size = new Size(27, 23);
			((Control)button1).TabIndex = 9;
			((ButtonBase)button1).UseVisualStyleBackColor = true;
			((Control)button1).Click += button1_Click;
			((Control)button1).MouseDown += new MouseEventHandler(button1_MouseDown);
			((ToolStrip)menuStrip1).Items.AddRange((ToolStripItem[])(object)new ToolStripItem[1] { (ToolStripItem)helpToolStripMenuItem });
			((Control)menuStrip1).Location = new Point(0, 0);
			((Control)menuStrip1).Name = "menuStrip1";
			((Control)menuStrip1).Size = new Size(326, 24);
			((Control)menuStrip1).TabIndex = 13;
			((Control)menuStrip1).Text = "menuStrip1";
			((ToolStripDropDownItem)helpToolStripMenuItem).DropDownItems.AddRange((ToolStripItem[])(object)new ToolStripItem[2]
			{
				(ToolStripItem)registerToolStripMenuItem,
				(ToolStripItem)aboutToolStripMenuItem
			});
			((ToolStripItem)helpToolStripMenuItem).Name = "helpToolStripMenuItem";
			((ToolStripItem)helpToolStripMenuItem).Size = new Size(40, 20);
			((ToolStripItem)helpToolStripMenuItem).Text = "&Help";
			((ToolStripItem)registerToolStripMenuItem).Name = "registerToolStripMenuItem";
			((ToolStripItem)registerToolStripMenuItem).Size = new Size(114, 22);
			((ToolStripItem)registerToolStripMenuItem).Text = "&Register";
			((ToolStripItem)registerToolStripMenuItem).Click += registerToolStripMenuItem_Click;
			((ToolStripItem)aboutToolStripMenuItem).Name = "aboutToolStripMenuItem";
			((ToolStripItem)aboutToolStripMenuItem).Size = new Size(114, 22);
			((ToolStripItem)aboutToolStripMenuItem).Text = "&About";
			((ToolStripItem)aboutToolStripMenuItem).Click += aboutToolStripMenuItem_Click;
			((Control)L1).Font = new Font("Microsoft Sans Serif", 9f, (FontStyle)1, (GraphicsUnit)3, (byte)178);
			((Control)L1).Location = new Point(167, 37);
			((Control)L1).Name = "L1";
			((Control)L1).RightToLeft = (RightToLeft)1;
			((Control)L1).Size = new Size(147, 127);
			((Control)L1).TabIndex = 25;
			((Control)L1).Text = "با عرض سلام\r\nلطفا برای خرید با برنامه نویس ارتباط برقرار کنید\r\nabfa2005@gmail.com\r\n09141046830";
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(326, 189);
			((Control)this).Controls.Add((Control)(object)L1);
			((Control)this).Controls.Add((Control)(object)panel1);
			((Control)this).Controls.Add((Control)(object)menuStrip1);
			((Form)this).MainMenuStrip = menuStrip1;
			((Control)this).Name = "Game110";
			((Control)this).Text = "Game";
			((Form)this).Load += Form1_Load;
			((Control)panel1).ResumeLayout(false);
			((Control)menuStrip1).ResumeLayout(false);
			((Control)menuStrip1).PerformLayout();
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}
	}
	public class Register : Form
	{
		private IContainer components;

		private TextBox t1;

		private TextBox t2;

		private TextBox t3;

		private TextBox t4;

		private Label l1;

		private Label l2;

		private Label label3;

		private Label label4;

		private Button bu11;

		private TextBox t5;

		private Button but2;

		private Button but3;

		protected override void Dispose(bool disposing)
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
			((Form)this).Dispose(disposing);
		}

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
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Expected O, but got Unknown
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			t1 = new TextBox();
			t2 = new TextBox();
			t3 = new TextBox();
			t4 = new TextBox();
			l1 = new Label();
			l2 = new Label();
			label3 = new Label();
			label4 = new Label();
			bu11 = new Button();
			t5 = new TextBox();
			but2 = new Button();
			but3 = new Button();
			((Control)this).SuspendLayout();
			((Control)t1).Location = new Point(12, 150);
			((Control)t1).Name = "t1";
			((Control)t1).Size = new Size(100, 20);
			((Control)t1).TabIndex = 0;
			((Control)t2).Location = new Point(118, 150);
			((Control)t2).Name = "t2";
			((Control)t2).Size = new Size(100, 20);
			((Control)t2).TabIndex = 1;
			((Control)t3).Location = new Point(224, 150);
			((Control)t3).Name = "t3";
			((Control)t3).Size = new Size(100, 20);
			((Control)t3).TabIndex = 2;
			((Control)t4).Location = new Point(330, 150);
			((Control)t4).Name = "t4";
			((Control)t4).Size = new Size(100, 20);
			((Control)t4).TabIndex = 3;
			((Control)l1).Location = new Point(12, 31);
			((Control)l1).Name = "l1";
			((Control)l1).Size = new Size(425, 23);
			((Control)l1).TabIndex = 4;
			((Control)l2).Location = new Point(12, 83);
			((Control)l2).Name = "l2";
			((Control)l2).Size = new Size(425, 23);
			((Control)l2).TabIndex = 5;
			((Control)label3).AutoSize = true;
			((Control)label3).Location = new Point(12, 9);
			((Control)label3).Name = "label3";
			((Control)label3).Size = new Size(41, 13);
			((Control)label3).TabIndex = 6;
			((Control)label3).Text = "IDHard";
			((Control)label4).AutoSize = true;
			((Control)label4).Location = new Point(12, 54);
			((Control)label4).Name = "label4";
			((Control)label4).Size = new Size(37, 13);
			((Control)label4).TabIndex = 7;
			((Control)label4).Text = "IDCpu";
			((Control)bu11).Location = new Point(155, 195);
			((Control)bu11).Name = "bu11";
			((Control)bu11).Size = new Size(75, 23);
			((Control)bu11).TabIndex = 8;
			((Control)bu11).Text = "&Cancel";
			((ButtonBase)bu11).UseVisualStyleBackColor = true;
			((Control)bu11).Click += bu11_Click;
			((Control)t5).Location = new Point(436, 150);
			((Control)t5).Name = "t5";
			((Control)t5).Size = new Size(100, 20);
			((Control)t5).TabIndex = 9;
			((Control)but2).Location = new Point(236, 195);
			((Control)but2).Name = "but2";
			((Control)but2).Size = new Size(75, 23);
			((Control)but2).TabIndex = 10;
			((Control)but2).Text = "&Register";
			((ButtonBase)but2).UseVisualStyleBackColor = true;
			((Control)but2).Click += but2_Click;
			((Control)but3).Location = new Point(317, 195);
			((Control)but3).Name = "but3";
			((Control)but3).Size = new Size(75, 23);
			((Control)but3).TabIndex = 11;
			((Control)but3).Text = "&Buy";
			((ButtonBase)but3).UseVisualStyleBackColor = true;
			((Control)but3).Click += but3_Click;
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(550, 230);
			((Control)this).Controls.Add((Control)(object)but3);
			((Control)this).Controls.Add((Control)(object)but2);
			((Control)this).Controls.Add((Control)(object)t5);
			((Control)this).Controls.Add((Control)(object)bu11);
			((Control)this).Controls.Add((Control)(object)label4);
			((Control)this).Controls.Add((Control)(object)label3);
			((Control)this).Controls.Add((Control)(object)l2);
			((Control)this).Controls.Add((Control)(object)l1);
			((Control)this).Controls.Add((Control)(object)t4);
			((Control)this).Controls.Add((Control)(object)t3);
			((Control)this).Controls.Add((Control)(object)t2);
			((Control)this).Controls.Add((Control)(object)t1);
			((Control)this).Name = "Register";
			((Control)this).Text = "Register";
			((Form)this).Load += Register_Load;
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}

		public Register()
		{
			InitializeComponent();
		}

		private void but3_Click(object sender, EventArgs e)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			MessageBox.Show("Sorry IS Diable Buy Internet ...");
		}

		private void bu11_Click(object sender, EventArgs e)
		{
			((Form)this).Close();
		}

		private void Register_Load(object sender, EventArgs e)
		{
			SerialNumber.Cls1 cls = new SerialNumber.Cls1();
			((Control)l1).Text = cls.IDHard();
			((Control)l2).Text = cls.IDCpu();
		}

		private void but2_Click(object sender, EventArgs e)
		{
			Reg reg = new Reg();
			reg.Enter(((Control)t1).Text + "-" + ((Control)t2).Text + "-" + ((Control)t3).Text + "-" + ((Control)t4).Text + "-" + ((Control)t5).Text, ((Control)l1).Text, ((Control)l2).Text);
			((Form)this).Close();
		}
	}
	internal class Reg
	{
		public void Enter(string id, string hard, string cpu)
		{
			SerialNumber.Cls1 cls = new SerialNumber.Cls1();
			cls.Check(id, hard, cpu);
			RunTime.Cls1 cls2 = new RunTime.Cls1();
			cls2.Enter(id);
		}
	}
	internal static class Program
	{
		[STAThread]
		private static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			Application.Run((Form)(object)new Game110());
		}
	}
	internal class AboutBox : Form
	{
		private IContainer components;

		private TableLayoutPanel tableLayoutPanel;

		private PictureBox logoPictureBox;

		private Label labelProductName;

		private Label labelVersion;

		private Label labelCopyright;

		private Label labelCompanyName;

		private TextBox textBoxDescription;

		private Button okButton;

		public string AssemblyTitle
		{
			get
			{
				object[] customAttributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), inherit: false);
				if (customAttributes.Length > 0)
				{
					AssemblyTitleAttribute assemblyTitleAttribute = (AssemblyTitleAttribute)customAttributes[0];
					if (assemblyTitleAttribute.Title != "")
					{
						return assemblyTitleAttribute.Title;
					}
				}
				return Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
			}
		}

		public string AssemblyVersion => Assembly.GetExecutingAssembly().GetName().Version.ToString();

		public string AssemblyDescription
		{
			get
			{
				object[] customAttributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyDescriptionAttribute), inherit: false);
				if (customAttributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyDescriptionAttribute)customAttributes[0]).Description;
			}
		}

		public string AssemblyProduct
		{
			get
			{
				object[] customAttributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyProductAttribute), inherit: false);
				if (customAttributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyProductAttribute)customAttributes[0]).Product;
			}
		}

		public string AssemblyCopyright
		{
			get
			{
				object[] customAttributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCopyrightAttribute), inherit: false);
				if (customAttributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyCopyrightAttribute)customAttributes[0]).Copyright;
			}
		}

		public string AssemblyCompany
		{
			get
			{
				object[] customAttributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCompanyAttribute), inherit: false);
				if (customAttributes.Length == 0)
				{
					return "";
				}
				return ((AssemblyCompanyAttribute)customAttributes[0]).Company;
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
			((Form)this).Dispose(disposing);
		}

		private void InitializeComponent()
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Expected O, but got Unknown
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_01bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c7: Expected O, but got Unknown
			//IL_01d9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e3: Expected O, but got Unknown
			//IL_01f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ff: Expected O, but got Unknown
			//IL_0211: Unknown result type (might be due to invalid IL or missing references)
			//IL_021b: Expected O, but got Unknown
			//IL_022d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0237: Expected O, but got Unknown
			//IL_0249: Unknown result type (might be due to invalid IL or missing references)
			//IL_0253: Expected O, but got Unknown
			//IL_0297: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a1: Expected O, but got Unknown
			//IL_0340: Unknown result type (might be due to invalid IL or missing references)
			//IL_03db: Unknown result type (might be due to invalid IL or missing references)
			//IL_0475: Unknown result type (might be due to invalid IL or missing references)
			//IL_0510: Unknown result type (might be due to invalid IL or missing references)
			//IL_05ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_070e: Unknown result type (might be due to invalid IL or missing references)
			ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(AboutBox));
			tableLayoutPanel = new TableLayoutPanel();
			logoPictureBox = new PictureBox();
			labelProductName = new Label();
			labelVersion = new Label();
			labelCopyright = new Label();
			labelCompanyName = new Label();
			textBoxDescription = new TextBox();
			okButton = new Button();
			((Control)tableLayoutPanel).SuspendLayout();
			((ISupportInitialize)logoPictureBox).BeginInit();
			((Control)this).SuspendLayout();
			tableLayoutPanel.ColumnCount = 2;
			tableLayoutPanel.ColumnStyles.Add(new ColumnStyle((SizeType)2, 33f));
			tableLayoutPanel.ColumnStyles.Add(new ColumnStyle((SizeType)2, 67f));
			tableLayoutPanel.Controls.Add((Control)(object)logoPictureBox, 0, 0);
			tableLayoutPanel.Controls.Add((Control)(object)labelProductName, 1, 0);
			tableLayoutPanel.Controls.Add((Control)(object)labelVersion, 1, 1);
			tableLayoutPanel.Controls.Add((Control)(object)labelCopyright, 1, 2);
			tableLayoutPanel.Controls.Add((Control)(object)labelCompanyName, 1, 3);
			tableLayoutPanel.Controls.Add((Control)(object)textBoxDescription, 1, 4);
			tableLayoutPanel.Controls.Add((Control)(object)okButton, 1, 5);
			((Control)tableLayoutPanel).Dock = (DockStyle)5;
			((Control)tableLayoutPanel).Location = new Point(9, 9);
			((Control)tableLayoutPanel).Name = "tableLayoutPanel";
			tableLayoutPanel.RowCount = 6;
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 10f));
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 10f));
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 10f));
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 10f));
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 50f));
			tableLayoutPanel.RowStyles.Add(new RowStyle((SizeType)2, 10f));
			((Control)tableLayoutPanel).Size = new Size(417, 265);
			((Control)tableLayoutPanel).TabIndex = 0;
			((Control)logoPictureBox).Dock = (DockStyle)5;
			logoPictureBox.Image = (Image)componentResourceManager.GetObject("logoPictureBox.Image");
			((Control)logoPictureBox).Location = new Point(3, 3);
			((Control)logoPictureBox).Name = "logoPictureBox";
			tableLayoutPanel.SetRowSpan((Control)(object)logoPictureBox, 6);
			((Control)logoPictureBox).Size = new Size(131, 259);
			logoPictureBox.SizeMode = (PictureBoxSizeMode)1;
			logoPictureBox.TabIndex = 12;
			logoPictureBox.TabStop = false;
			((Control)labelProductName).Dock = (DockStyle)5;
			((Control)labelProductName).Location = new Point(143, 0);
			((Control)labelProductName).Margin = new Padding(6, 0, 3, 0);
			((Control)labelProductName).MaximumSize = new Size(0, 17);
			((Control)labelProductName).Name = "labelProductName";
			((Control)labelProductName).Size = new Size(271, 17);
			((Control)labelProductName).TabIndex = 19;
			((Control)labelProductName).Text = "Product Name";
			labelProductName.TextAlign = (ContentAlignment)16;
			((Control)labelVersion).Dock = (DockStyle)5;
			((Control)labelVersion).Location = new Point(143, 26);
			((Control)labelVersion).Margin = new Padding(6, 0, 3, 0);
			((Control)labelVersion).MaximumSize = new Size(0, 17);
			((Control)labelVersion).Name = "labelVersion";
			((Control)labelVersion).Size = new Size(271, 17);
			((Control)labelVersion).TabIndex = 0;
			((Control)labelVersion).Text = "Version";
			labelVersion.TextAlign = (ContentAlignment)16;
			((Control)labelCopyright).Dock = (DockStyle)5;
			((Control)labelCopyright).Location = new Point(143, 52);
			((Control)labelCopyright).Margin = new Padding(6, 0, 3, 0);
			((Control)labelCopyright).MaximumSize = new Size(0, 17);
			((Control)labelCopyright).Name = "labelCopyright";
			((Control)labelCopyright).Size = new Size(271, 17);
			((Control)labelCopyright).TabIndex = 21;
			((Control)labelCopyright).Text = "Copyright";
			labelCopyright.TextAlign = (ContentAlignment)16;
			((Control)labelCompanyName).Dock = (DockStyle)5;
			((Control)labelCompanyName).Location = new Point(143, 78);
			((Control)labelCompanyName).Margin = new Padding(6, 0, 3, 0);
			((Control)labelCompanyName).MaximumSize = new Size(0, 17);
			((Control)labelCompanyName).Name = "labelCompanyName";
			((Control)labelCompanyName).Size = new Size(271, 17);
			((Control)labelCompanyName).TabIndex = 22;
			((Control)labelCompanyName).Text = "Company Name";
			labelCompanyName.TextAlign = (ContentAlignment)16;
			((Control)textBoxDescription).Dock = (DockStyle)5;
			((Control)textBoxDescription).Location = new Point(143, 107);
			((Control)textBoxDescription).Margin = new Padding(6, 3, 3, 3);
			((TextBoxBase)textBoxDescription).Multiline = true;
			((Control)textBoxDescription).Name = "textBoxDescription";
			((TextBoxBase)textBoxDescription).ReadOnly = true;
			textBoxDescription.ScrollBars = (ScrollBars)3;
			((Control)textBoxDescription).Size = new Size(271, 126);
			((Control)textBoxDescription).TabIndex = 23;
			((Control)textBoxDescription).TabStop = false;
			((Control)textBoxDescription).Text = "Description";
			((Control)okButton).Anchor = (AnchorStyles)10;
			okButton.DialogResult = (DialogResult)2;
			((Control)okButton).Location = new Point(339, 239);
			((Control)okButton).Name = "okButton";
			((Control)okButton).Size = new Size(75, 23);
			((Control)okButton).TabIndex = 24;
			((Control)okButton).Text = "&OK";
			((Form)this).AcceptButton = (IButtonControl)(object)okButton;
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(435, 283);
			((Control)this).Controls.Add((Control)(object)tableLayoutPanel);
			((Form)this).FormBorderStyle = (FormBorderStyle)3;
			((Form)this).MaximizeBox = false;
			((Form)this).MinimizeBox = false;
			((Control)this).Name = "AboutBox";
			((Control)this).Padding = new Padding(9);
			((Form)this).ShowIcon = false;
			((Form)this).ShowInTaskbar = false;
			((Form)this).StartPosition = (FormStartPosition)4;
			((Control)this).Text = "AboutBox";
			((Control)tableLayoutPanel).ResumeLayout(false);
			((Control)tableLayoutPanel).PerformLayout();
			((ISupportInitialize)logoPictureBox).EndInit();
			((Control)this).ResumeLayout(false);
		}

		public AboutBox()
		{
			InitializeComponent();
			((Control)this).Text = string.Format("About {0} {0}", AssemblyTitle);
			((Control)labelProductName).Text = AssemblyProduct;
			((Control)labelVersion).Text = string.Format("Version {0} {0}", AssemblyVersion);
			((Control)labelCopyright).Text = AssemblyCopyright;
			((Control)labelCompanyName).Text = AssemblyCompany;
			((Control)textBoxDescription).Text = AssemblyDescription;
		}
	}
	[CompilerGenerated]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
	[DebuggerNonUserCode]
	internal class Resource1
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
					ResourceManager resourceManager = new ResourceManager("Game.Resource1", typeof(Resource1).Assembly);
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

		internal static byte[] Game
		{
			get
			{
				object @object = ResourceManager.GetObject("Game", resourceCulture);
				return (byte[])@object;
			}
		}

		internal Resource1()
		{
		}
	}
}
namespace Game.Properties
{
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "9.0.0.0")]
	[CompilerGenerated]
	internal sealed class Settings : ApplicationSettingsBase
	{
		private static Settings defaultInstance = (Settings)(object)SettingsBase.Synchronized((SettingsBase)(object)new Settings());

		public static Settings Default => defaultInstance;
	}
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
					ResourceManager resourceManager = new ResourceManager("Game.Properties.Resources", typeof(Resources).Assembly);
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

		internal static Bitmap Start
		{
			get
			{
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				//IL_001c: Expected O, but got Unknown
				object @object = ResourceManager.GetObject("Start", resourceCulture);
				return (Bitmap)@object;
			}
		}

		internal Resources()
		{
		}
	}
}
