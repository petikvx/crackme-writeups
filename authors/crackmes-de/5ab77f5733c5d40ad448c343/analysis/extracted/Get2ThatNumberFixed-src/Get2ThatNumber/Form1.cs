using System;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Get2ThatNumber;

public class Form1 : Form
{
	private IContainer components = null;

	private Button button1;

	private GroupBox groupBox1;

	private TextBox textBox1;

	private GroupBox groupBox2;

	private RichTextBox richTextBox1;

	private GroupBox groupBox3;

	private Label label2;

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
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Expected O, but got Unknown
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Expected O, but got Unknown
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected O, but got Unknown
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected O, but got Unknown
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected O, but got Unknown
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Expected O, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		//IL_0354: Unknown result type (might be due to invalid IL or missing references)
		//IL_035e: Expected O, but got Unknown
		button1 = new Button();
		groupBox1 = new GroupBox();
		textBox1 = new TextBox();
		groupBox2 = new GroupBox();
		richTextBox1 = new RichTextBox();
		groupBox3 = new GroupBox();
		label2 = new Label();
		((Control)groupBox1).SuspendLayout();
		((Control)groupBox2).SuspendLayout();
		((Control)groupBox3).SuspendLayout();
		((Control)this).SuspendLayout();
		((Control)button1).Location = new Point(214, 12);
		((Control)button1).Name = "button1";
		((Control)button1).Size = new Size(224, 23);
		((Control)button1).TabIndex = 0;
		((Control)button1).Text = "Check Registration Status";
		((ButtonBase)button1).UseVisualStyleBackColor = true;
		((Control)button1).Click += button1_Click;
		((Control)groupBox1).Controls.Add((Control)(object)textBox1);
		((Control)groupBox1).Location = new Point(8, 12);
		((Control)groupBox1).Name = "groupBox1";
		((Control)groupBox1).Size = new Size(200, 47);
		((Control)groupBox1).TabIndex = 1;
		groupBox1.TabStop = false;
		((Control)groupBox1).Text = "Name:";
		((Control)textBox1).Location = new Point(10, 19);
		((Control)textBox1).Name = "textBox1";
		((Control)textBox1).Size = new Size(184, 20);
		((Control)textBox1).TabIndex = 0;
		textBox1.TextAlign = (HorizontalAlignment)2;
		((Control)groupBox2).Controls.Add((Control)(object)richTextBox1);
		((Control)groupBox2).Location = new Point(8, 65);
		((Control)groupBox2).Name = "groupBox2";
		((Control)groupBox2).Size = new Size(200, 121);
		((Control)groupBox2).TabIndex = 2;
		groupBox2.TabStop = false;
		((Control)groupBox2).Text = "Key:";
		((Control)richTextBox1).Location = new Point(6, 19);
		((Control)richTextBox1).Name = "richTextBox1";
		((Control)richTextBox1).Size = new Size(188, 96);
		((Control)richTextBox1).TabIndex = 3;
		((Control)richTextBox1).Text = "";
		((Control)groupBox3).Controls.Add((Control)(object)label2);
		((Control)groupBox3).Location = new Point(214, 41);
		((Control)groupBox3).Name = "groupBox3";
		((Control)groupBox3).Size = new Size(224, 145);
		((Control)groupBox3).TabIndex = 3;
		groupBox3.TabStop = false;
		((Control)groupBox3).Text = "Registration Status:";
		((Control)label2).AutoSize = true;
		((Control)label2).Font = new Font("Monotype Corsiva", 29.25f, (FontStyle)2, (GraphicsUnit)3, (byte)0);
		((Control)label2).Location = new Point(6, 43);
		((Control)label2).Name = "label2";
		((Control)label2).Size = new Size(207, 47);
		((Control)label2).TabIndex = 2;
		((Control)label2).Text = "UnRegistered";
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(450, 195);
		((Control)this).Controls.Add((Control)(object)groupBox3);
		((Control)this).Controls.Add((Control)(object)groupBox2);
		((Control)this).Controls.Add((Control)(object)groupBox1);
		((Control)this).Controls.Add((Control)(object)button1);
		((Form)this).FormBorderStyle = (FormBorderStyle)5;
		((Control)this).Name = "Form1";
		((Control)this).Text = "obnoxious";
		((Control)groupBox1).ResumeLayout(false);
		((Control)groupBox1).PerformLayout();
		((Control)groupBox2).ResumeLayout(false);
		((Control)groupBox3).ResumeLayout(false);
		((Control)groupBox3).PerformLayout();
		((Control)this).ResumeLayout(false);
	}

	public Form1()
	{
		InitializeComponent();
	}

	private void button1_Click(object sender, EventArgs e)
	{
		chk();
	}

	private void chk()
	{
		if (((Control)textBox1).Text == "")
		{
			((Control)textBox1).Text = "Where is the name?";
			return;
		}
		string text = ((Control)richTextBox1).Text;
		int lt = function_one();
		int num = function_two(lt);
		int num2 = 0;
		int num3 = 0;
		string[] array = new string[num];
		byte[] bytes = Encoding.ASCII.GetBytes(text);
		byte[] array2 = bytes;
		foreach (byte value in array2)
		{
			if (Convert.ToChar(value).ToString() == lt.ToString())
			{
				array[num2] = text.Substring(0, num3 + 1);
				text = text.Remove(0, num3 + 1);
				num2++;
				num3 = 0;
			}
			else
			{
				num3++;
			}
		}
		if (num2 < num)
		{
			fail();
			return;
		}
		for (int j = 0; j < num; j++)
		{
			for (int k = j + 1; k < num; k++)
			{
				if (array[j] == array[k])
				{
					fail();
					return;
				}
			}
		}
		string text2 = "";
		for (int j = 0; j < num; j++)
		{
			text2 = array[j];
			string text3 = text2.Substring(0, 1);
			if (text3 != "1" && text3 != "2")
			{
				fail();
				return;
			}
			for (int k = 0; k < text2.Length - 1; k++)
			{
				int num4 = Convert.ToInt32(text2.Substring(k + 1, 1)) - Convert.ToInt32(text2.Substring(k, 1));
				if (num4 != 1 && num4 != 2)
				{
					fail();
					return;
				}
			}
		}
		pass();
	}

	private int function_one()
	{
		string text = ((Control)textBox1).Text;
		byte[] bytes = Encoding.ASCII.GetBytes(text);
		int num = 0;
		byte[] array = bytes;
		foreach (byte b in array)
		{
			num += b;
		}
		num &= 0xF;
		if (num == 7)
		{
			return 6;
		}
		if (num == 9)
		{
			return 8;
		}
		if (num >= 10)
		{
			num -= 5;
			switch (num)
			{
			case 10:
				return 8;
			case 7:
				num = 6;
				break;
			}
			if (num == 9)
			{
				num = 8;
			}
			return num;
		}
		if (num < 5)
		{
			num += 5;
			if (num == 7)
			{
				num = 6;
			}
			if (num == 9)
			{
				num = 8;
			}
			return num;
		}
		return num;
	}

	private int function_two(int lt)
	{
		return lt switch
		{
			5 => 8, 
			6 => 13, 
			_ => 34, 
		};
	}

	private void fail()
	{
		((Control)label2).Text = "UnRegistered";
	}

	private void pass()
	{
		((Control)label2).Text = "   Registered";
	}
}
