using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using FilterControls;

namespace SerialBox;

public class SerialBox : UserControl
{
	private IContainer components = null;

	private Label lbl1;

	private Label lbl2;

	private Label lbl3;

	private Label lbl4;

	private FilterTextBox Box1;

	private FilterTextBox Box2;

	private FilterTextBox Box3;

	private FilterTextBox Box4;

	private FilterTextBox Box5;

	private FilterTextBox[] _Boxes = new FilterTextBox[5];

	[Category("Behavior")]
	[DefaultValue(FilterTextBox.AcceptableCharacters.All)]
	[Description("Indicate wich type of characters are acceptable")]
	public FilterTextBox.AcceptableCharacters AcceptableChars
	{
		get
		{
			return _Boxes[0].AcceptableChars;
		}
		set
		{
			FilterTextBox[] boxes = _Boxes;
			foreach (FilterTextBox filterTextBox in boxes)
			{
				filterTextBox.AcceptableChars = value;
			}
		}
	}

	[Description("Indicate Wich characters can't insert in texboxes")]
	[Category("Behavior")]
	[DefaultValue("")]
	public string ForbidenChars
	{
		get
		{
			return _Boxes[0].ForbidenChars;
		}
		set
		{
			FilterTextBox[] boxes = _Boxes;
			foreach (FilterTextBox filterTextBox in boxes)
			{
				filterTextBox.ForbidenChars = value;
			}
		}
	}

	[Category("Behavior")]
	[Description("Only captle letters can insert")]
	[DefaultValue(false)]
	public bool CaptleLettersOnly
	{
		get
		{
			return _Boxes[0].CaptleLettersOnly;
		}
		set
		{
			FilterTextBox[] boxes = _Boxes;
			foreach (FilterTextBox filterTextBox in boxes)
			{
				filterTextBox.CaptleLettersOnly = value;
			}
		}
	}

	[Category("Behavior")]
	[DefaultValue(false)]
	[Description("The text is Readonly")]
	public bool ReadOnly
	{
		get
		{
			return ((TextBoxBase)_Boxes[0]).ReadOnly;
		}
		set
		{
			FilterTextBox[] boxes = _Boxes;
			foreach (FilterTextBox filterTextBox in boxes)
			{
				((TextBoxBase)filterTextBox).ReadOnly = value;
			}
		}
	}

	public override RightToLeft RightToLeft
	{
		get
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			return ((Control)this).RightToLeft;
		}
		set
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Invalid comparison between Unknown and I4
			((Control)this).RightToLeft = value;
			if ((int)((Control)this).RightToLeft == 1)
			{
				((Control)Box5).TabIndex = 0;
				((Control)lbl4).TabIndex = 1;
				((Control)Box4).TabIndex = 2;
				((Control)lbl4).TabIndex = 3;
				((Control)Box3).TabIndex = 4;
				((Control)lbl4).TabIndex = 5;
				((Control)Box2).TabIndex = 6;
				((Control)lbl4).TabIndex = 7;
				((Control)Box1).TabIndex = 8;
			}
			else
			{
				((Control)Box5).TabIndex = 8;
				((Control)lbl1).TabIndex = 7;
				((Control)Box4).TabIndex = 6;
				((Control)lbl1).TabIndex = 5;
				((Control)Box3).TabIndex = 4;
				((Control)lbl1).TabIndex = 3;
				((Control)Box2).TabIndex = 2;
				((Control)lbl1).TabIndex = 1;
				((Control)Box1).TabIndex = 0;
			}
		}
	}

	[Browsable(true)]
	public override string Text
	{
		get
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Invalid comparison between Unknown and I4
			if ((int)((Control)this).RightToLeft == 1)
			{
				return ((Control)Box5).Text + ((Control)Box4).Text + ((Control)Box3).Text + ((Control)Box2).Text + ((Control)Box1).Text;
			}
			return ((Control)Box1).Text + ((Control)Box2).Text + ((Control)Box3).Text + ((Control)Box4).Text + ((Control)Box5).Text;
		}
		set
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Invalid comparison between Unknown and I4
			ClearBoxes();
			for (int i = 0; i < value.Length && i < 25; i += 5)
			{
				int length = ((i + 5 > value.Length) ? (value.Length - i) : 5);
				if ((int)((Control)this).RightToLeft == 0)
				{
					((Control)_Boxes[i / 5]).Text = value.Substring(i, length);
				}
				else
				{
					((Control)_Boxes[4 - i / 5]).Text = value.Substring(i, length);
				}
			}
		}
	}

	protected override void Dispose(bool disposing)
	{
		if (disposing && components != null)
		{
			components.Dispose();
		}
		((ContainerControl)this).Dispose(disposing);
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
		//IL_0581: Unknown result type (might be due to invalid IL or missing references)
		//IL_058b: Expected O, but got Unknown
		lbl1 = new Label();
		lbl2 = new Label();
		lbl4 = new Label();
		lbl3 = new Label();
		Box1 = new FilterTextBox();
		Box2 = new FilterTextBox();
		Box3 = new FilterTextBox();
		Box4 = new FilterTextBox();
		Box5 = new FilterTextBox();
		((Control)this).SuspendLayout();
		((Control)lbl1).AutoSize = true;
		((Control)lbl1).Location = new Point(53, 0);
		((Control)lbl1).Name = "lbl1";
		((Control)lbl1).Size = new Size(10, 13);
		((Control)lbl1).TabIndex = 1;
		((Control)lbl1).Text = "-";
		((Control)lbl2).AutoSize = true;
		((Control)lbl2).Location = new Point(113, 0);
		((Control)lbl2).Name = "lbl2";
		((Control)lbl2).Size = new Size(10, 13);
		((Control)lbl2).TabIndex = 3;
		((Control)lbl2).Text = "-";
		((Control)lbl4).AutoSize = true;
		((Control)lbl4).Location = new Point(233, 0);
		((Control)lbl4).Name = "lbl4";
		((Control)lbl4).Size = new Size(10, 13);
		((Control)lbl4).TabIndex = 7;
		((Control)lbl4).Text = "-";
		lbl4.TextAlign = (ContentAlignment)4;
		((Control)lbl3).AutoSize = true;
		((Control)lbl3).Location = new Point(173, 0);
		((Control)lbl3).Name = "lbl3";
		((Control)lbl3).Size = new Size(10, 13);
		((Control)lbl3).TabIndex = 5;
		((Control)lbl3).Text = "-";
		((Control)Box1).Location = new Point(0, 0);
		((TextBoxBase)Box1).MaxLength = 5;
		((Control)Box1).Name = "Box1";
		((Control)Box1).Size = new Size(53, 18);
		((Control)Box1).TabIndex = 8;
		((Control)Box1).Enter += TextBox_Enter;
		((Control)Box1).TextChanged += TextBox_TextChanged;
		((Control)Box2).Location = new Point(60, 0);
		((TextBoxBase)Box2).MaxLength = 5;
		((Control)Box2).Name = "Box2";
		((Control)Box2).Size = new Size(53, 18);
		((Control)Box2).TabIndex = 9;
		((Control)Box2).Enter += TextBox_Enter;
		((Control)Box2).TextChanged += TextBox_TextChanged;
		((Control)Box3).Location = new Point(120, 0);
		((TextBoxBase)Box3).MaxLength = 5;
		((Control)Box3).Name = "Box3";
		((Control)Box3).Size = new Size(53, 18);
		((Control)Box3).TabIndex = 10;
		((Control)Box3).Enter += TextBox_Enter;
		((Control)Box3).TextChanged += TextBox_TextChanged;
		((Control)Box4).Location = new Point(180, 0);
		((TextBoxBase)Box4).MaxLength = 5;
		((Control)Box4).Name = "Box4";
		((Control)Box4).Size = new Size(53, 18);
		((Control)Box4).TabIndex = 11;
		((Control)Box4).Enter += TextBox_Enter;
		((Control)Box4).TextChanged += TextBox_TextChanged;
		((Control)Box5).Location = new Point(240, 0);
		((TextBoxBase)Box5).MaxLength = 5;
		((Control)Box5).Name = "Box5";
		((Control)Box5).Size = new Size(53, 18);
		((Control)Box5).TabIndex = 12;
		((Control)Box5).Enter += TextBox_Enter;
		((Control)Box5).TextChanged += TextBox_TextChanged;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).Controls.Add((Control)(object)Box2);
		((Control)this).Controls.Add((Control)(object)Box3);
		((Control)this).Controls.Add((Control)(object)Box4);
		((Control)this).Controls.Add((Control)(object)Box5);
		((Control)this).Controls.Add((Control)(object)Box1);
		((Control)this).Controls.Add((Control)(object)lbl3);
		((Control)this).Controls.Add((Control)(object)lbl4);
		((Control)this).Controls.Add((Control)(object)lbl2);
		((Control)this).Controls.Add((Control)(object)lbl1);
		((Control)this).Font = new Font("Microsoft Sans Serif", 7.25f, (FontStyle)0, (GraphicsUnit)3, (byte)178);
		((Control)this).Name = "SerialBox";
		((Control)this).Size = new Size(293, 18);
		((Control)this).ResumeLayout(false);
		((Control)this).PerformLayout();
	}

	public SerialBox()
	{
		InitializeComponent();
		_Boxes[0] = Box1;
		_Boxes[1] = Box2;
		_Boxes[2] = Box3;
		_Boxes[3] = Box4;
		_Boxes[4] = Box5;
	}

	private void TextBox_Enter(object sender, EventArgs e)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Expected O, but got Unknown
		TextBox val = (TextBox)sender;
		((TextBoxBase)val).SelectAll();
	}

	private void TextBox_TextChanged(object sender, EventArgs e)
	{
		FilterTextBox filterTextBox = (FilterTextBox)sender;
		if (((Control)filterTextBox).Text.Length == 5)
		{
			((Control)this).SelectNextControl((Control)(object)filterTextBox, true, true, false, false);
		}
	}

	private void ClearBoxes()
	{
		FilterTextBox[] boxes = _Boxes;
		foreach (FilterTextBox filterTextBox in boxes)
		{
			((Control)filterTextBox).Text = string.Empty;
		}
	}
}
