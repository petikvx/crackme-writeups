using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace Crack_me;

[DesignerGenerated]
public class Form1 : Form
{
	private IContainer components;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("TextBox1")]
	private TextBox _TextBox1;

	[AccessedThroughProperty("TextBox2")]
	private TextBox _TextBox2;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	private int a;

	internal virtual Button Button1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			if (_Button1 != null)
			{
				((Control)_Button1).Click -= Button1_Click;
			}
			_Button1 = value;
			if (_Button1 != null)
			{
				((Control)_Button1).Click += Button1_Click;
			}
		}
	}

	internal virtual TextBox TextBox1
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox1 = value;
		}
	}

	internal virtual TextBox TextBox2
	{
		[DebuggerNonUserCode]
		get
		{
			return _TextBox2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_TextBox2 = value;
		}
	}

	internal virtual Label Label1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label1 = value;
		}
	}

	internal virtual Label Label2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label2 = value;
		}
	}

	[DebuggerNonUserCode]
	public Form1()
	{
		((Form)this).Load += Form1_Load;
		InitializeComponent();
	}

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		if (disposing && components != null)
		{
			components.Dispose();
		}
		((Form)this).Dispose(disposing);
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
		Button1 = new Button();
		TextBox1 = new TextBox();
		TextBox2 = new TextBox();
		Label1 = new Label();
		Label2 = new Label();
		((Control)this).SuspendLayout();
		Button button = Button1;
		Point location = new Point(109, 177);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		Size size = new Size(75, 23);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 0;
		((ButtonBase)Button1).Text = "Button1";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		TextBox textBox = TextBox1;
		location = new Point(80, 122);
		((Control)textBox).Location = location;
		((Control)TextBox1).Name = "TextBox1";
		TextBox textBox2 = TextBox1;
		size = new Size(144, 20);
		((Control)textBox2).Size = size;
		((Control)TextBox1).TabIndex = 1;
		TextBox textBox3 = TextBox2;
		location = new Point(80, 61);
		((Control)textBox3).Location = location;
		((Control)TextBox2).Name = "TextBox2";
		TextBox textBox4 = TextBox2;
		size = new Size(144, 20);
		((Control)textBox4).Size = size;
		((Control)TextBox2).TabIndex = 2;
		Label1.AutoSize = true;
		Label label = Label1;
		location = new Point(132, 45);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		size = new Size(29, 13);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 3;
		Label1.Text = "User";
		Label2.AutoSize = true;
		Label label3 = Label2;
		location = new Point(132, 106);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(30, 13);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 4;
		Label2.Text = "Pass";
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		size = new Size(292, 273);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Label2);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)TextBox2);
		((Control)this).Controls.Add((Control)(object)TextBox1);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Name = "Form1";
		((Form)this).Text = "Form1";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		int try0000_dispatch = -1;
		int num = default(int);
		int num2 = default(int);
		int num3 = default(int);
		while (true)
		{
			try
			{
				/*Note: ILSpy has introduced the following switch to emulate a goto from catch-block to try-block*/;
				checked
				{
					switch (try0000_dispatch)
					{
					default:
						num = 1;
						if ((Operators.CompareString(TextBox1.Text, "aharli", false) != 0) & (Operators.CompareString(TextBox2.Text, "1368", false) != 0))
						{
							goto IL_003d;
						}
						goto IL_0071;
					case 297:
						{
							num2 = num;
							switch ((num3 <= -2) ? 1 : num3)
							{
							case 1:
								break;
							default:
								goto end_IL_0000;
							}
							int num4 = unchecked(num2 + 1);
							num2 = 0;
							switch (num4)
							{
							case 1:
								break;
							case 2:
								goto IL_003d;
							case 3:
								goto IL_004d;
							case 4:
								goto IL_0058;
							case 8:
								goto IL_0071;
							case 9:
								goto IL_0073;
							case 10:
								goto IL_00ab;
							case 12:
								goto IL_00bd;
							case 13:
								goto IL_00c0;
							case 14:
								goto end_IL_0000_2;
							default:
								goto end_IL_0000;
							case 5:
							case 6:
							case 7:
							case 11:
							case 15:
							case 16:
							case 17:
								goto end_IL_0000_3;
							}
							goto default;
						}
						IL_00ab:
						num = 10;
						Interaction.MsgBox((object)"Cracked", (MsgBoxStyle)0, (object)null);
						goto end_IL_0000_3;
						IL_00bd:
						num = 12;
						goto IL_00c0;
						IL_0073:
						num = 9;
						if ((Operators.CompareString(TextBox1.Text, "aharli", false) == 0) & (Operators.CompareString(TextBox2.Text, "1368", false) == 0))
						{
							goto IL_00ab;
						}
						goto IL_00bd;
						IL_00c0:
						ProjectData.ClearProjectError();
						num3 = -2;
						break;
						IL_003d:
						num = 2;
						a++;
						goto IL_004d;
						IL_004d:
						num = 3;
						if (a < 3)
						{
							goto end_IL_0000_3;
						}
						goto IL_0058;
						IL_0058:
						num = 4;
						Interaction.MsgBox((object)"Can not Cracked", (MsgBoxStyle)0, (object)null);
						ProjectData.EndApp();
						goto end_IL_0000_3;
						IL_0071:
						num = 8;
						goto IL_0073;
						end_IL_0000_2:
						break;
					}
					ProjectData.ClearProjectError();
					num3 = -3;
					break;
				}
				end_IL_0000:;
			}
			catch (object obj) when (obj is Exception && num3 != 0 && num2 == 0)
			{
				ProjectData.SetProjectError((Exception)obj);
				try0000_dispatch = 297;
				continue;
			}
			throw ProjectData.CreateProjectError(-2146828237);
			continue;
			end_IL_0000_3:
			break;
		}
		if (num2 != 0)
		{
			ProjectData.ClearProjectError();
		}
	}

	private void Form1_Load(object sender, EventArgs e)
	{
		a = 1;
	}
}
