using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace ZOS.Forms;

public class VirtualDesktopForm : Form
{
	private sealed class DesktopTile : Panel
	{
		private readonly string title;

		private readonly string glyph;

		private bool hovered;

		public DesktopTile(string title, string glyph)
		{
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009f: Expected O, but got Unknown
			this.title = title;
			this.glyph = glyph;
			((Control)this).Size = new Size(178, 142);
			((Control)this).Margin = new Padding(10);
			((Control)this).BackColor = Color.Transparent;
			((Control)this).Cursor = Cursors.Hand;
			((Panel)this).TabStop = true;
			new ToolTip().SetToolTip((Control)(object)this, "Open " + title);
			((Control)this).MouseEnter += delegate
			{
				hovered = true;
				((Control)this).Invalidate();
			};
			((Control)this).MouseLeave += delegate
			{
				hovered = false;
				((Control)this).Invalidate();
			};
			((Control)this).MouseUp += (MouseEventHandler)delegate(object s, MouseEventArgs e)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Invalid comparison between Unknown and I4
				if ((int)e.Button == 1048576)
				{
					((Control)this).OnClick(EventArgs.Empty);
				}
			};
			((Control)this).SetStyle((ControlStyles)139266, true);
		}

		protected override void OnPaint(PaintEventArgs e)
		{
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_0101: Unknown result type (might be due to invalid IL or missing references)
			//IL_0108: Expected O, but got Unknown
			//IL_012f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0136: Expected O, but got Unknown
			//IL_0140: Unknown result type (might be due to invalid IL or missing references)
			//IL_0147: Expected O, but got Unknown
			//IL_01da: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e1: Expected O, but got Unknown
			//IL_01eb: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f2: Expected O, but got Unknown
			//IL_0263: Unknown result type (might be due to invalid IL or missing references)
			//IL_026a: Expected O, but got Unknown
			//IL_0274: Unknown result type (might be due to invalid IL or missing references)
			//IL_027b: Expected O, but got Unknown
			((Control)this).OnPaint(e);
			e.Graphics.SmoothingMode = (SmoothingMode)4;
			GraphicsPath val = RoundedRectangle(new Rectangle(1, 1, ((Control)this).Width - 3, ((Control)this).Height - 3), 12);
			try
			{
				SolidBrush val2 = new SolidBrush(hovered ? Color.FromArgb(235, 35, 91, 112) : Color.FromArgb(210, 21, 67, 87));
				try
				{
					Pen val3 = new Pen(hovered ? ColorTranslator.FromHtml("#8ce4d2") : ColorTranslator.FromHtml("#3f8498"), hovered ? 2f : 1f);
					try
					{
						e.Graphics.FillPath((Brush)(object)val2, val);
						e.Graphics.DrawPath(val3, val);
					}
					finally
					{
						((IDisposable)val3)?.Dispose();
					}
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
			Rectangle rectangle = new Rectangle(54, 16, 70, 70);
			SolidBrush val4 = new SolidBrush(hovered ? ColorTranslator.FromHtml("#2b8b96") : ColorTranslator.FromHtml("#216777"));
			try
			{
				e.Graphics.FillEllipse((Brush)(object)val4, rectangle);
			}
			finally
			{
				((IDisposable)val4)?.Dispose();
			}
			Font val5 = new Font("Segoe UI", 14f, (FontStyle)1);
			try
			{
				SolidBrush val6 = new SolidBrush(ColorTranslator.FromHtml("#eafff8"));
				try
				{
					SizeF sizeF = e.Graphics.MeasureString(glyph, val5);
					e.Graphics.DrawString(glyph, val5, (Brush)(object)val6, (float)rectangle.X + ((float)rectangle.Width - sizeF.Width) / 2f, (float)rectangle.Y + ((float)rectangle.Height - sizeF.Height) / 2f + 1f);
				}
				finally
				{
					((IDisposable)val6)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val5)?.Dispose();
			}
			Font val7 = new Font("Segoe UI", 10f, (FontStyle)1);
			try
			{
				SolidBrush val8 = new SolidBrush(ColorTranslator.FromHtml("#f2fbf8"));
				try
				{
					SizeF sizeF2 = e.Graphics.MeasureString(title, val7, ((Control)this).Width - 24);
					e.Graphics.DrawString(title, val7, (Brush)(object)val8, ((float)((Control)this).Width - sizeF2.Width) / 2f, 101f);
				}
				finally
				{
					((IDisposable)val8)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val7)?.Dispose();
			}
			Font val9 = new Font("Consolas", 8f);
			try
			{
				SolidBrush val10 = new SolidBrush(ColorTranslator.FromHtml("#9bc7c7"));
				try
				{
					string text = "CLICK TO OPEN";
					SizeF sizeF3 = e.Graphics.MeasureString(text, val9);
					e.Graphics.DrawString(text, val9, (Brush)(object)val10, ((float)((Control)this).Width - sizeF3.Width) / 2f, 124f);
				}
				finally
				{
					((IDisposable)val10)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val9)?.Dispose();
			}
		}

		private static GraphicsPath RoundedRectangle(Rectangle bounds, int radius)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			GraphicsPath val = new GraphicsPath();
			int num = radius * 2;
			val.AddArc(bounds.X, bounds.Y, num, num, 180f, 90f);
			val.AddArc(bounds.Right - num, bounds.Y, num, num, 270f, 90f);
			val.AddArc(bounds.Right - num, bounds.Bottom - num, num, num, 0f, 90f);
			val.AddArc(bounds.X, bounds.Bottom - num, num, num, 90f, 90f);
			val.CloseFigure();
			return val;
		}
	}

	private readonly FlowLayoutPanel iconPanel;

	protected VirtualDesktopForm(string title)
	{
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Expected O, but got Unknown
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Expected O, but got Unknown
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d2: Expected O, but got Unknown
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0101: Unknown result type (might be due to invalid IL or missing references)
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0117: Expected O, but got Unknown
		//IL_0117: Unknown result type (might be due to invalid IL or missing references)
		//IL_0120: Expected O, but got Unknown
		//IL_0120: Unknown result type (might be due to invalid IL or missing references)
		//IL_0125: Unknown result type (might be due to invalid IL or missing references)
		//IL_0130: Unknown result type (might be due to invalid IL or missing references)
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		//IL_013e: Unknown result type (might be due to invalid IL or missing references)
		//IL_014e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0159: Unknown result type (might be due to invalid IL or missing references)
		//IL_0163: Expected O, but got Unknown
		//IL_0163: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Expected O, but got Unknown
		//IL_018f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0194: Unknown result type (might be due to invalid IL or missing references)
		//IL_019b: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cc: Expected O, but got Unknown
		((Control)this).Text = title;
		((Form)this).Size = new Size(900, 620);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#12304a");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#e8f1f5");
		((Control)this).Font = new Font("Segoe UI", 16f);
		((Form)this).FormBorderStyle = (FormBorderStyle)1;
		((Form)this).MaximizeBox = false;
		((Control)this).DoubleBuffered = true;
		Panel header = new Panel
		{
			Dock = (DockStyle)1,
			Height = 58,
			Padding = new Padding(24, 10, 24, 8),
			BackColor = Color.FromArgb(210, 12, 36, 57)
		};
		((Control)header).Paint += (PaintEventHandler)delegate(object s, PaintEventArgs e)
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			Pen val3 = new Pen(Color.FromArgb(75, 166, 184));
			try
			{
				e.Graphics.DrawLine(val3, 24, ((Control)header).Height - 1, ((Control)header).Width - 24, ((Control)header).Height - 1);
			}
			finally
			{
				((IDisposable)val3)?.Dispose();
			}
		};
		Label val = new Label
		{
			Text = title.ToUpperInvariant(),
			Dock = (DockStyle)3,
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#dff7f4"),
			Font = new Font("Segoe UI", 14f, (FontStyle)1),
			TextAlign = (ContentAlignment)16
		};
		Label val2 = new Label
		{
			Text = "LOCAL SESSION  /  SECURE",
			Dock = (DockStyle)4,
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#73d5c5"),
			Font = new Font("Consolas", 12f),
			TextAlign = (ContentAlignment)64
		};
		((Control)header).Controls.Add((Control)(object)val2);
		((Control)header).Controls.Add((Control)(object)val);
		iconPanel = new FlowLayoutPanel
		{
			Dock = (DockStyle)5,
			Padding = new Padding(28, 24, 28, 28),
			BackColor = Color.Transparent,
			AutoScroll = true,
			WrapContents = true
		};
		((Control)this).Controls.Add((Control)(object)iconPanel);
		((Control)this).Controls.Add((Control)(object)header);
	}

	protected void AddDesktopIcon(string name, string glyph, EventHandler open)
	{
		DesktopTile desktopTile = new DesktopTile(name, glyph);
		((Control)desktopTile).Click += open;
		((Control)iconPanel).Controls.Add((Control)(object)desktopTile);
	}

	protected override void OnPaintBackground(PaintEventArgs e)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Expected O, but got Unknown
		LinearGradientBrush val = new LinearGradientBrush(((Control)this).ClientRectangle, ColorTranslator.FromHtml("#102b43"), ColorTranslator.FromHtml("#18506a"), 135f);
		try
		{
			e.Graphics.FillRectangle((Brush)(object)val, ((Control)this).ClientRectangle);
		}
		finally
		{
			((IDisposable)val)?.Dispose();
		}
	}
}
