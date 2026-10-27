using System;
using System.ComponentModel;
using System.Windows.Forms;

namespace FilterControls;

public class FilterTextBox : TextBox
{
	public enum AcceptableCharacters
	{
		LetterOnly,
		DigitOnly,
		LetterOrDigit,
		All
	}

	private string _ForbidenChars;

	private bool _InternalEditing;

	private bool _CaptleLetterOnly;

	private AcceptableCharacters _AcceptableChar;

	[Category("Behavior")]
	[DefaultValue("")]
	[Description("Indicate wich characters can't be in string")]
	public string ForbidenChars
	{
		get
		{
			return _ForbidenChars;
		}
		set
		{
			_ForbidenChars = value;
			((Control)this).Text = ((Control)this).Text;
		}
	}

	[Browsable(true)]
	[DefaultValue(false)]
	[Description("Indicate only Captle characters can write")]
	[Category("Behavior")]
	public bool CaptleLettersOnly
	{
		get
		{
			return _CaptleLetterOnly;
		}
		set
		{
			_CaptleLetterOnly = value;
			((Control)this).Text = ((Control)this).Text;
		}
	}

	[Browsable(true)]
	[Category("Behavior")]
	[DefaultValue(AcceptableCharacters.All)]
	[Description("Indicate wich type of characters are acceptable")]
	public AcceptableCharacters AcceptableChars
	{
		get
		{
			return _AcceptableChar;
		}
		set
		{
			_AcceptableChar = value;
			((Control)this).Text = ((Control)this).Text;
		}
	}

	public override string Text
	{
		get
		{
			return ((TextBox)this).Text;
		}
		set
		{
			if (_InternalEditing)
			{
				((TextBox)this).Text = value;
			}
			else
			{
				((TextBox)this).Text = RemoveForbidens(value);
			}
		}
	}

	public FilterTextBox()
	{
		_ForbidenChars = string.Empty;
		_InternalEditing = false;
		_CaptleLetterOnly = false;
		_AcceptableChar = AcceptableCharacters.All;
	}

	protected override void OnTextChanged(EventArgs e)
	{
		((TextBoxBase)this).OnTextChanged(e);
		int SelStart = ((TextBoxBase)this).SelectionStart;
		_InternalEditing = true;
		((Control)this).Text = RemoveForbidens(((Control)this).Text, ref SelStart);
		_InternalEditing = false;
		((TextBoxBase)this).SelectionStart = SelStart;
	}

	private string RemoveForbidens(string st, ref int SelStart)
	{
		if (_CaptleLetterOnly)
		{
			st = st.ToUpper();
		}
		for (int num = st.Length - 1; num >= 0; num--)
		{
			if (_ForbidenChars.IndexOf(st[num]) != -1)
			{
				st = st.Remove(num, 1);
				if (num < SelStart)
				{
					SelStart--;
				}
			}
			else if (_AcceptableChar == AcceptableCharacters.DigitOnly && !char.IsDigit(st[num]))
			{
				st = st.Remove(num, 1);
				if (num < SelStart)
				{
					SelStart--;
				}
			}
			else if (_AcceptableChar == AcceptableCharacters.LetterOnly && !char.IsLetter(st[num]))
			{
				st = st.Remove(num, 1);
				if (num < SelStart)
				{
					SelStart--;
				}
			}
			else if (_AcceptableChar == AcceptableCharacters.LetterOrDigit && !char.IsLetterOrDigit(st[num]))
			{
				st = st.Remove(num, 1);
				if (num < SelStart)
				{
					SelStart--;
				}
			}
		}
		return st;
	}

	private string RemoveForbidens(string st)
	{
		int SelStart = st.Length;
		return RemoveForbidens(st, ref SelStart);
	}
}
