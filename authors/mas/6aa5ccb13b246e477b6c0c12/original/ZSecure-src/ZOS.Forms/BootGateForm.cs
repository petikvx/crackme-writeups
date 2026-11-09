using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace ZOS.Forms;

public class BootGateForm : Form
{
	private TextBox keyBox;

	private Label statusLabel;

	public BootGateForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		((Control)this).Text = "ZOS Secure Boot";
		((Form)this).Size = new Size(900, 620);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#102b43");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#e8f1f5");
		((Control)this).Font = new Font("Segoe UI", 16f);
		((Form)this).FormBorderStyle = (FormBorderStyle)1;
		((Form)this).MaximizeBox = false;
		((Form)this).MinimizeBox = false;
		((Control)this).DoubleBuffered = true;
		BuildLayout();
	}

	private void BuildLayout()
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Expected O, but got Unknown
		//IL_005c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Expected O, but got Unknown
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Expected O, but got Unknown
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Expected O, but got Unknown
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Expected O, but got Unknown
		//IL_0110: Unknown result type (might be due to invalid IL or missing references)
		//IL_011d: Expected O, but got Unknown
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0123: Unknown result type (might be due to invalid IL or missing references)
		//IL_0138: Unknown result type (might be due to invalid IL or missing references)
		//IL_014e: Unknown result type (might be due to invalid IL or missing references)
		//IL_015a: Expected O, but got Unknown
		//IL_0167: Unknown result type (might be due to invalid IL or missing references)
		//IL_0171: Expected O, but got Unknown
		//IL_0171: Unknown result type (might be due to invalid IL or missing references)
		//IL_0176: Unknown result type (might be due to invalid IL or missing references)
		//IL_0181: Unknown result type (might be due to invalid IL or missing references)
		//IL_0190: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01be: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c8: Expected O, but got Unknown
		//IL_01c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d1: Expected O, but got Unknown
		//IL_01d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_0202: Unknown result type (might be due to invalid IL or missing references)
		//IL_0212: Unknown result type (might be due to invalid IL or missing references)
		//IL_021b: Expected O, but got Unknown
		//IL_021b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0220: Unknown result type (might be due to invalid IL or missing references)
		//IL_022b: Unknown result type (might be due to invalid IL or missing references)
		//IL_023a: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Unknown result type (might be due to invalid IL or missing references)
		//IL_025c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0268: Unknown result type (might be due to invalid IL or missing references)
		//IL_0272: Expected O, but got Unknown
		//IL_0272: Unknown result type (might be due to invalid IL or missing references)
		//IL_027b: Expected O, but got Unknown
		//IL_027c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0281: Unknown result type (might be due to invalid IL or missing references)
		//IL_0293: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e2: Expected O, but got Unknown
		//IL_02e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_02fd: Expected O, but got Unknown
		//IL_030a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0314: Expected O, but got Unknown
		//IL_0314: Unknown result type (might be due to invalid IL or missing references)
		//IL_0319: Unknown result type (might be due to invalid IL or missing references)
		//IL_0324: Unknown result type (might be due to invalid IL or missing references)
		//IL_0336: Unknown result type (might be due to invalid IL or missing references)
		//IL_0348: Unknown result type (might be due to invalid IL or missing references)
		//IL_0358: Unknown result type (might be due to invalid IL or missing references)
		//IL_0368: Unknown result type (might be due to invalid IL or missing references)
		//IL_036f: Unknown result type (might be due to invalid IL or missing references)
		//IL_037b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0385: Expected O, but got Unknown
		//IL_0385: Unknown result type (might be due to invalid IL or missing references)
		//IL_0392: Expected O, but got Unknown
		//IL_03b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_03b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_03c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_03d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_03e7: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0404: Expected O, but got Unknown
		//IL_0476: Unknown result type (might be due to invalid IL or missing references)
		//IL_047b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0482: Unknown result type (might be due to invalid IL or missing references)
		//IL_0492: Expected O, but got Unknown
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
			Pen val7 = new Pen(Color.FromArgb(75, 166, 184));
			try
			{
				e.Graphics.DrawLine(val7, 24, ((Control)header).Height - 1, ((Control)header).Width - 24, ((Control)header).Height - 1);
			}
			finally
			{
				((IDisposable)val7)?.Dispose();
			}
		};
		((Control)header).Controls.Add((Control)new Label
		{
			Text = "ZOS SECURE BOOT",
			Dock = (DockStyle)3,
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#dff7f4"),
			Font = new Font("Segoe UI", 14f, (FontStyle)1),
			TextAlign = (ContentAlignment)16
		});
		((Control)header).Controls.Add((Control)new Label
		{
			Text = "PRE-OS ACCESS CONTROL  /  OFFLINE",
			Dock = (DockStyle)4,
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#73d5c5"),
			Font = new Font("Consolas", 12f),
			TextAlign = (ContentAlignment)64
		});
		Panel card = new Panel
		{
			Size = new Size(620, 330),
			BackColor = Color.FromArgb(235, 17, 52, 70),
			Anchor = (AnchorStyles)0
		};
		((Control)card).Paint += (PaintEventHandler)delegate(object s, PaintEventArgs e)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			e.Graphics.SmoothingMode = (SmoothingMode)4;
			Pen val5 = new Pen(Color.FromArgb(100, 140, 211, 202), 1.5f);
			try
			{
				GraphicsPath val6 = RoundedRectangle(new Rectangle(1, 1, ((Control)card).Width - 3, ((Control)card).Height - 3), 14);
				try
				{
					e.Graphics.DrawPath(val5, val6);
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
		};
		Label val = new Label
		{
			Text = "SYSTEM ACCESS REQUIRED",
			Location = new Point(42, 32),
			Size = new Size(536, 36),
			ForeColor = ColorTranslator.FromHtml("#eafff8"),
			Font = new Font("Segoe UI", 18f, (FontStyle)1),
			TextAlign = (ContentAlignment)32
		};
		Label val2 = new Label
		{
			Text = "Enter the recovered boot key to initialize the corporate OS.",
			Location = new Point(42, 78),
			Size = new Size(536, 30),
			ForeColor = ColorTranslator.FromHtml("#9bc7c7"),
			TextAlign = (ContentAlignment)32
		};
		Label val3 = new Label
		{
			Text = "KEY FORMAT   XXX-XXX-XXX-XXX",
			Location = new Point(42, 124),
			Size = new Size(536, 28),
			ForeColor = ColorTranslator.FromHtml("#73d5c5"),
			Font = new Font("Consolas", 10f, (FontStyle)1),
			TextAlign = (ContentAlignment)32
		};
		keyBox = new TextBox
		{
			Location = new Point(72, 168),
			Size = new Size(476, 42),
			BackColor = ColorTranslator.FromHtml("#0d2236"),
			ForeColor = ColorTranslator.FromHtml("#eafff8"),
			BorderStyle = (BorderStyle)1,
			Font = new Font("Consolas", 18f, (FontStyle)1),
			CharacterCasing = (CharacterCasing)1,
			MaxLength = 19,
			TextAlign = (HorizontalAlignment)2
		};
		((Control)keyBox).KeyDown += new KeyEventHandler(KeyBox_KeyDown);
		Button val4 = new Button
		{
			Text = "UNLOCK OS",
			Location = new Point(72, 226),
			Size = new Size(476, 44),
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#102b43"),
			FlatStyle = (FlatStyle)0,
			Font = new Font("Segoe UI", 14f, (FontStyle)1),
			Cursor = Cursors.Hand
		};
		((ButtonBase)val4).FlatAppearance.BorderSize = 0;
		((Control)val4).Click += delegate
		{
			TryUnlock();
		};
		statusLabel = new Label
		{
			Text = "",
			Location = new Point(42, 282),
			Size = new Size(536, 30),
			ForeColor = ColorTranslator.FromHtml("#ff9e9e"),
			TextAlign = (ContentAlignment)32
		};
		((Control)card).Controls.Add((Control)(object)val);
		((Control)card).Controls.Add((Control)(object)val2);
		((Control)card).Controls.Add((Control)(object)val3);
		((Control)card).Controls.Add((Control)(object)keyBox);
		((Control)card).Controls.Add((Control)(object)val4);
		((Control)card).Controls.Add((Control)(object)statusLabel);
		Panel center = new Panel
		{
			Dock = (DockStyle)5,
			BackColor = Color.Transparent
		};
		((Control)center).Controls.Add((Control)(object)card);
		((Control)center).Resize += delegate
		{
			((Control)card).Left = (((Control)center).ClientSize.Width - ((Control)card).Width) / 2;
			((Control)card).Top = (((Control)center).ClientSize.Height - ((Control)card).Height) / 2;
		};
		((Control)this).Controls.Add((Control)(object)center);
		((Control)this).Controls.Add((Control)(object)header);
	}

	private void KeyBox_KeyDown(object sender, KeyEventArgs e)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Invalid comparison between Unknown and I4
		if ((int)e.KeyCode == 13)
		{
			e.SuppressKeyPress = true;
			TryUnlock();
		}
	}

	private void TryUnlock()
	{
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		if (GameState.ValidateBootKey(((Control)keyBox).Text))
		{
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#73d5c5");
			((Control)statusLabel).Text = "Access accepted. Initializing ZOS...";
			MainForm mainForm = new MainForm();
			((Form)mainForm).FormClosed += (FormClosedEventHandler)delegate
			{
				((Form)this).Close();
			};
			((Control)mainForm).Show();
			((Control)this).Hide();
		}
		else
		{
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#ff9e9e");
			((Control)statusLabel).Text = "Access denied. Key structure or checksum is invalid.";
			((TextBoxBase)keyBox).SelectAll();
			((Control)keyBox).Focus();
		}
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
