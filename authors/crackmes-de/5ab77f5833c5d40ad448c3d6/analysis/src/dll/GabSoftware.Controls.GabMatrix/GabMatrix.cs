using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace GabSoftware.Controls.GabMatrix;

[DesignerGenerated]
public class GabMatrix : UserControl
{
	public enum eMoveType
	{
		None = 1,
		LeftToRight = 2,
		RightToLeft = 4
	}

	private static List<WeakReference> __ENCList = new List<WeakReference>();

	private IContainer components;

	[AccessedThroughProperty("MainTimer")]
	private Timer _MainTimer;

	private Color _gridColor;

	private string _text;

	private int _transformedTextWidth;

	private int _xPosition;

	private eMoveType _moveType;

	private Thread _thread;

	private bool _loaded;

	private Graphics bgmodel;

	private Graphics bgfond;

	private Graphics bgtext;

	private Bitmap btmodel;

	private Bitmap bttext;

	private Bitmap btfond;

	internal virtual Timer MainTimer
	{
		[DebuggerNonUserCode]
		get
		{
			return _MainTimer;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler eventHandler = MainTimer_Tick;
			if (_MainTimer != null)
			{
				_MainTimer.Tick -= eventHandler;
			}
			_MainTimer = value;
			if (_MainTimer != null)
			{
				_MainTimer.Tick += eventHandler;
			}
		}
	}

	[Browsable(true)]
	public string MyText
	{
		get
		{
			return _text;
		}
		set
		{
			_text = value;
			_loaded = false;
			Refresh();
		}
	}

	[Browsable(true)]
	public override Color ForeColor
	{
		get
		{
			return ((Control)this).ForeColor;
		}
		set
		{
			_loaded = false;
			((Control)this).ForeColor = value;
		}
	}

	[Browsable(true)]
	public Color GridColor
	{
		get
		{
			return _gridColor;
		}
		set
		{
			_gridColor = value;
			_loaded = false;
			Refresh();
		}
	}

	[Browsable(true)]
	public eMoveType MoveType
	{
		get
		{
			return _moveType;
		}
		set
		{
			_moveType = value;
			if (value != eMoveType.None)
			{
				MainTimer.Enabled = true;
			}
			else
			{
				MainTimer.Enabled = false;
			}
		}
	}

	[Browsable(true)]
	public override Font Font
	{
		get
		{
			return ((Control)this).Font;
		}
		set
		{
			_loaded = false;
			((Control)this).Font = value;
		}
	}

	[Browsable(true)]
	public int TimeInterval
	{
		get
		{
			return MainTimer.Interval;
		}
		set
		{
			MainTimer.Interval = value;
		}
	}

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		if ((disposing && components != null) ? true : false)
		{
			components.Dispose();
		}
		((ContainerControl)this).Dispose(disposing);
	}

	[DebuggerStepThrough]
	private void InitializeComponent()
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Expected O, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Expected O, but got Unknown
		components = new Container();
		MainTimer = new Timer(components);
		((Control)this).SuspendLayout();
		SizeF autoScaleDimensions = new SizeF(7f, 13f);
		((ContainerControl)this).AutoScaleDimensions = autoScaleDimensions;
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Control)this).BackColor = Color.MidnightBlue;
		((Control)this).DoubleBuffered = true;
		Font = new Font("Verdana", 8.25f);
		((Control)this).Name = "GabMatrix";
		Size size = new Size(408, 114);
		((Control)this).Size = size;
		((Control)this).ResumeLayout(false);
	}

	public GabMatrix()
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected O, but got Unknown
		((Control)this).Paint += new PaintEventHandler(GabMatrix_Paint);
		((UserControl)this).Load += GabMatrix_Load;
		((Control)this).SizeChanged += GabMatrix_SizeChanged;
		lock (__ENCList)
		{
			__ENCList.Add(new WeakReference(this));
		}
		InitializeComponent();
		((Control)this).SetStyle((ControlStyles)8192, true);
		((Control)this).SetStyle((ControlStyles)131072, true);
		((Control)this).SetStyle((ControlStyles)2, true);
		((Control)this).SetStyle((ControlStyles)16, true);
		((Control)this).SetStyle((ControlStyles)512, true);
		_loaded = false;
		_xPosition = 0;
		MoveType = eMoveType.RightToLeft;
		if (Operators.CompareString(MyText, "", false) == 0)
		{
			MyText = "This is a demo text";
		}
		ForeColor = Color.DodgerBlue;
		GridColor = Color.Black;
		((Control)this).BackColor = Color.MidnightBlue;
	}

	private void ThreadedPaint(object data)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Expected O, but got Unknown
		PaintEventArgs val = (PaintEventArgs)data;
		Graphics graphics = val.Graphics;
		graphics.SmoothingMode = (SmoothingMode)3;
		if (!_loaded)
		{
			Initialisation();
		}
		graphics.DrawImage((Image)(object)btfond, 0, 0);
		graphics.DrawImage((Image)(object)bttext, checked(_xPosition + 1), 0);
	}

	private void Initialisation()
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Expected O, but got Unknown
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Expected O, but got Unknown
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Expected O, but got Unknown
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Expected O, but got Unknown
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Expected O, but got Unknown
		//IL_0165: Unknown result type (might be due to invalid IL or missing references)
		//IL_016f: Expected O, but got Unknown
		//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c9: Expected O, but got Unknown
		SolidBrush val = new SolidBrush(ForeColor);
		btfond = new Bitmap(((Control)this).Width, ((Control)this).Height);
		bgfond = Graphics.FromImage((Image)(object)btfond);
		checked
		{
			int num = ((Control)this).Width - 1;
			int num2 = 0;
			while (true)
			{
				int num3 = num2;
				int num4 = num;
				if (num3 > num4)
				{
					break;
				}
				bgfond.DrawLine(new Pen(GridColor), num2, 0, num2, ((Control)this).Height);
				num2 += 3;
			}
			int num5 = ((Control)this).Height - 1;
			num2 = 0;
			while (true)
			{
				int num6 = num2;
				int num4 = num5;
				if (num6 > num4)
				{
					break;
				}
				bgfond.DrawLine(new Pen(GridColor), 0, num2, ((Control)this).Width, num2);
				num2 += 3;
			}
			btmodel = new Bitmap(((Control)this).Width, ((Control)this).Height);
			bgmodel = Graphics.FromImage((Image)(object)btmodel);
			SizeF sizeF = bgmodel.MeasureString(MyText, Font, 1000000);
			btmodel = new Bitmap(Convert.ToInt32(sizeF.Width), ((Control)this).Height);
			bgmodel = Graphics.FromImage((Image)(object)btmodel);
			bgmodel.DrawString(MyText, Font, (Brush)(object)val, 0f, 0f);
			_transformedTextWidth = Convert.ToInt32(sizeF.Width) * 3;
			bttext = new Bitmap(_transformedTextWidth, ((Control)this).Height);
			bgtext = Graphics.FromImage((Image)(object)bttext);
			int num7 = (int)Math.Round(sizeF.Width - 1f);
			num2 = 0;
			while (true)
			{
				int num8 = num2;
				int num4 = num7;
				if (num8 > num4)
				{
					break;
				}
				int num9 = (int)Math.Round(sizeF.Height - 1f);
				int num10 = 0;
				while (true)
				{
					int num11 = num10;
					num4 = num9;
					if (num11 > num4)
					{
						break;
					}
					Pen val2 = new Pen(btmodel.GetPixel(num2, num10));
					bgtext.DrawRectangle(val2, num2 * 3 + 1, num10 * 3 + 1, 1, 1);
					num10++;
				}
				num2++;
			}
			_loaded = true;
		}
	}

	private void GabMatrix_Paint(object sender, PaintEventArgs e)
	{
		if (_thread != null && _thread.IsAlive)
		{
			_thread.Abort();
		}
		_thread = new Thread(ThreadedPaint);
		_thread.IsBackground = true;
		_thread.Start(e);
		_thread.Join();
	}

	public override void Refresh()
	{
		((Control)this).Refresh();
	}

	private void GabMatrix_Load(object sender, EventArgs e)
	{
		Refresh();
	}

	private void MainTimer_Tick(object sender, EventArgs e)
	{
		checked
		{
			if (MoveType == eMoveType.LeftToRight)
			{
				_xPosition += 3;
				if (_xPosition > ((Control)this).Width)
				{
					_xPosition = -_transformedTextWidth;
				}
			}
			if (MoveType == eMoveType.RightToLeft)
			{
				_xPosition -= 3;
				if (_xPosition < -_transformedTextWidth)
				{
					_xPosition = ((Control)this).Width;
				}
			}
			Refresh();
		}
	}

	private void GabMatrix_SizeChanged(object sender, EventArgs e)
	{
		_loaded = false;
		Refresh();
	}
}
