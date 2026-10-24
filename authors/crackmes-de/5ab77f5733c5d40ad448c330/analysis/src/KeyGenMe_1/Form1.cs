using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace KeyGenMe_1;

[DesignerGenerated]
public class Form1 : Form
{
	private IContainer components;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("nameBox")]
	private TextBox _nameBox;

	[AccessedThroughProperty("serialBox")]
	private TextBox _serialBox;

	[AccessedThroughProperty("Button1")]
	private Button _Button1;

	[AccessedThroughProperty("Panel1")]
	private Panel _Panel1;

	[AccessedThroughProperty("Button2")]
	private Button _Button2;

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

	internal virtual TextBox nameBox
	{
		[DebuggerNonUserCode]
		get
		{
			return _nameBox;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_nameBox = value;
		}
	}

	internal virtual TextBox serialBox
	{
		[DebuggerNonUserCode]
		get
		{
			return _serialBox;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_serialBox = value;
		}
	}

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
			EventHandler eventHandler = Button1_Click;
			if (_Button1 != null)
			{
				((Control)_Button1).Click -= eventHandler;
			}
			_Button1 = value;
			if (_Button1 != null)
			{
				((Control)_Button1).Click += eventHandler;
			}
		}
	}

	internal virtual Panel Panel1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Panel1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Panel1 = value;
		}
	}

	internal virtual Button Button2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Button2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = Button2_Click;
			if (_Button2 != null)
			{
				((Control)_Button2).Click -= eventHandler;
			}
			_Button2 = value;
			if (_Button2 != null)
			{
				((Control)_Button2).Click += eventHandler;
			}
		}
	}

	[DebuggerNonUserCode]
	public Form1()
	{
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
		//IL_0295: Unknown result type (might be due to invalid IL or missing references)
		//IL_029f: Expected O, but got Unknown
		//IL_042e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0438: Expected O, but got Unknown
		ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
		Label1 = new Label();
		Label2 = new Label();
		nameBox = new TextBox();
		serialBox = new TextBox();
		Button1 = new Button();
		Panel1 = new Panel();
		Button2 = new Button();
		((Control)this).SuspendLayout();
		Label1.AutoSize = true;
		((Control)Label1).ForeColor = SystemColors.ControlText;
		Label label = Label1;
		Point location = new Point(8, 83);
		((Control)label).Location = location;
		((Control)Label1).Name = "Label1";
		Label label2 = Label1;
		Size size = new Size(35, 13);
		((Control)label2).Size = size;
		((Control)Label1).TabIndex = 0;
		Label1.Text = "Name";
		Label2.AutoSize = true;
		((Control)Label2).ForeColor = SystemColors.ControlText;
		Label label3 = Label2;
		location = new Point(10, 112);
		((Control)label3).Location = location;
		((Control)Label2).Name = "Label2";
		Label label4 = Label2;
		size = new Size(33, 13);
		((Control)label4).Size = size;
		((Control)Label2).TabIndex = 1;
		Label2.Text = "Sérial";
		((TextBoxBase)nameBox).BackColor = Color.Honeydew;
		TextBox obj = nameBox;
		location = new Point(49, 80);
		((Control)obj).Location = location;
		((Control)nameBox).Name = "nameBox";
		TextBox obj2 = nameBox;
		size = new Size(300, 20);
		((Control)obj2).Size = size;
		((Control)nameBox).TabIndex = 2;
		((TextBoxBase)serialBox).BackColor = Color.Honeydew;
		TextBox obj3 = serialBox;
		location = new Point(49, 109);
		((Control)obj3).Location = location;
		((Control)serialBox).Name = "serialBox";
		TextBox obj4 = serialBox;
		size = new Size(300, 20);
		((Control)obj4).Size = size;
		((Control)serialBox).TabIndex = 3;
		((Control)Button1).ForeColor = SystemColors.ControlText;
		Button button = Button1;
		location = new Point(49, 134);
		((Control)button).Location = location;
		((Control)Button1).Name = "Button1";
		Button button2 = Button1;
		size = new Size(141, 24);
		((Control)button2).Size = size;
		((Control)Button1).TabIndex = 4;
		((ButtonBase)Button1).Text = "Valider";
		((ButtonBase)Button1).UseVisualStyleBackColor = true;
		((Control)Panel1).BackgroundImage = (Image)componentResourceManager.GetObject("Panel1.BackgroundImage");
		Panel panel = Panel1;
		location = new Point(1, 1);
		((Control)panel).Location = location;
		((Control)Panel1).Name = "Panel1";
		Panel panel2 = Panel1;
		size = new Size(361, 68);
		((Control)panel2).Size = size;
		((Control)Panel1).TabIndex = 5;
		((Control)Button2).ForeColor = SystemColors.ControlText;
		Button button3 = Button2;
		location = new Point(208, 134);
		((Control)button3).Location = location;
		((Control)Button2).Name = "Button2";
		Button button4 = Button2;
		size = new Size(141, 24);
		((Control)button4).Size = size;
		((Control)Button2).TabIndex = 6;
		((ButtonBase)Button2).Text = "Réinitialiser";
		((ButtonBase)Button2).UseVisualStyleBackColor = true;
		SizeF autoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).BackColor = Color.DarkGray;
		size = new Size(361, 170);
		((Form)this).ClientSize = size;
		((Control)this).Controls.Add((Control)(object)Button2);
		((Control)this).Controls.Add((Control)(object)Panel1);
		((Control)this).Controls.Add((Control)(object)Button1);
		((Control)this).Controls.Add((Control)(object)serialBox);
		((Control)this).Controls.Add((Control)(object)nameBox);
		((Control)this).Controls.Add((Control)(object)Label1);
		((Control)this).Controls.Add((Control)(object)Label2);
		((Form)this).Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
		((Control)this).Name = "Form1";
		((Form)this).Text = "KeyGenMe_1 By Toma6868";
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	private void Button1_Click(object sender, EventArgs e)
	{
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		string text = nameBox.Text;
		string text2 = serialBox.Text;
		int num = Strings.Len(text);
		if (num < 4)
		{
			nameBox.Text = "The Name is too short !";
			serialBox.Text = "Try Again...";
			return;
		}
		string str = Conversions.ToString(AscEncode(text));
		string text3 = Conversions.ToString(Envers(str));
		if (Operators.CompareString(text2, text3, false) == 0)
		{
			Interaction.MsgBox((object)"Bravo, tu as trouvé un bon sérial ! Maintenant il ne te reste plus qu'à faire un Keygen et rédiger un tutoriel...", (MsgBoxStyle)0, (object)"Bravo...");
		}
		else
		{
			Interaction.MsgBox((object)"Dommage... essaye encore une fois ! Tu peux y arriver...", (MsgBoxStyle)0, (object)"Dommage...");
		}
	}

	public object AscEncode(object str)
	{
		object obj = Strings.Len(RuntimeHelpers.GetObjectValue(str));
		object obj2 = "";
		object obj3 = default(object);
		object obj4 = default(object);
		if (ForLoopControl.ForLoopInitObj(obj3, (object)1, obj, (object)1, ref obj4, ref obj3))
		{
			do
			{
				obj2 = Operators.AddObject(obj2, (object)Conversion.Hex(Strings.Asc(Strings.Mid(Conversions.ToString(str), Conversions.ToInteger(obj3), 1))));
			}
			while (ForLoopControl.ForNextCheckObj(obj3, obj4, ref obj3));
		}
		return RuntimeHelpers.GetObjectValue(obj2);
	}

	public object Envers(object str)
	{
		object obj = Strings.Len(RuntimeHelpers.GetObjectValue(str));
		object obj2 = "";
		object obj3 = default(object);
		object obj4 = default(object);
		if (ForLoopControl.ForLoopInitObj(obj3, obj, (object)1, (object)(-1), ref obj4, ref obj3))
		{
			do
			{
				obj2 = Operators.AddObject(obj2, (object)Strings.Mid(Conversions.ToString(str), Conversions.ToInteger(obj3), 1));
			}
			while (ForLoopControl.ForNextCheckObj(obj3, obj4, ref obj3));
		}
		return RuntimeHelpers.GetObjectValue(obj2);
	}

	private void Button2_Click(object sender, EventArgs e)
	{
		nameBox.Text = "";
		serialBox.Text = "";
	}
}
