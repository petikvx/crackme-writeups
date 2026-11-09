using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class MainForm : Form
{
	private class DesktopIcon : Panel
	{
		private readonly Label glyph;

		private readonly Label caption;

		private bool locked;

		public event EventHandler Click2
		{
			add
			{
				Click += value;
				((Control)glyph).Click += value;
				((Control)caption).Click += value;
			}
			remove
			{
				Click -= value;
				((Control)glyph).Click -= value;
				((Control)caption).Click -= value;
			}
		}

		public event EventHandler Click;

		public DesktopIcon(string label, string emoji, Point location)
		{
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Unknown result type (might be due to invalid IL or missing references)
			//IL_0080: Expected O, but got Unknown
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Expected O, but got Unknown
			//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f8: Expected O, but got Unknown
			((Control)this).Size = new Size(90, 90);
			((Control)this).Location = location;
			((Control)this).BackColor = Color.Transparent;
			((Control)this).Cursor = Cursors.Hand;
			glyph = new Label
			{
				Text = emoji,
				Font = new Font("Segoe UI Emoji", 28f),
				ForeColor = ColorTranslator.FromHtml("#64ffda"),
				TextAlign = (ContentAlignment)32,
				Dock = (DockStyle)1,
				Height = 55
			};
			caption = new Label
			{
				Text = label,
				ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
				TextAlign = (ContentAlignment)2,
				Dock = (DockStyle)2,
				Height = 30
			};
			((Control)glyph).Click += delegate(object s, EventArgs e)
			{
				if (!locked)
				{
					this.Click?.Invoke(this, e);
				}
			};
			((Control)caption).Click += delegate(object s, EventArgs e)
			{
				if (!locked)
				{
					this.Click?.Invoke(this, e);
				}
			};
			((Control)this).MouseClick += (MouseEventHandler)delegate(object s, MouseEventArgs e)
			{
				if (!locked)
				{
					this.Click?.Invoke(this, (EventArgs)(object)e);
				}
			};
			((Control)this).Controls.Add((Control)(object)glyph);
			((Control)this).Controls.Add((Control)(object)caption);
		}

		public void SetLocked(bool isLocked)
		{
			locked = isLocked;
			((Control)glyph).Visible = !isLocked;
			((Control)caption).Visible = !isLocked;
			((Control)this).Cursor = (isLocked ? Cursors.No : Cursors.Hand);
		}
	}

	private DesktopIcon iconBrowser;

	private DesktopIcon iconMail;

	private DesktopIcon iconFisher;

	private DesktopIcon iconPc1;

	private DesktopIcon iconVpn;

	private DesktopIcon iconPc2;

	private Timer refreshTimer;

	private Label taskbarClock;

	public MainForm()
	{
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Expected O, but got Unknown
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Expected O, but got Unknown
		((Control)this).Text = "ZOS - Corporate Network Simulation";
		((Form)this).WindowState = (FormWindowState)2;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).Font = new Font("Segoe UI", 16f);
		((Form)this).FormBorderStyle = (FormBorderStyle)0;
		BuildDesktop();
		BuildTaskbar();
		refreshTimer = new Timer
		{
			Interval = 500
		};
		refreshTimer.Tick += delegate
		{
			RefreshIconStates();
		};
		refreshTimer.Start();
		RefreshIconStates();
	}

	private void BuildDesktop()
	{
		iconBrowser = new DesktopIcon("Browser", "\ud83c\udf10", new Point(40, 40));
		iconBrowser.Click += delegate
		{
			((Control)new BrowserForm()).Show();
		};
		iconMail = new DesktopIcon("Mail", "✉", new Point(40, 150));
		iconMail.Click += delegate
		{
			((Control)new MailForm()).Show();
		};
		iconFisher = new DesktopIcon("Fisher", "\ud83c\udfa3", new Point(40, 260));
		iconFisher.Click += delegate
		{
			((Control)new FisherForm()).Show();
		};
		iconPc1 = new DesktopIcon("PC1", "\ud83d\udcbb", new Point(40, 370));
		iconPc1.Click += delegate
		{
			((Control)new Pc1LoginForm()).Show();
		};
		iconVpn = new DesktopIcon("VPN Client", "\ud83d\udd12", new Point(40, 480));
		iconVpn.Click += delegate
		{
			((Control)new VpnForm()).Show();
		};
		iconPc2 = new DesktopIcon("PC2", "\ud83d\udcbb", new Point(40, 590));
		iconPc2.Click += delegate
		{
			((Control)new Pc2LoginForm()).Show();
		};
		((Control)this).Controls.Add((Control)(object)iconBrowser);
		((Control)this).Controls.Add((Control)(object)iconMail);
		((Control)this).Controls.Add((Control)(object)iconFisher);
		((Control)this).Controls.Add((Control)(object)iconPc1);
		((Control)this).Controls.Add((Control)(object)iconVpn);
		((Control)this).Controls.Add((Control)(object)iconPc2);
	}

	private void BuildTaskbar()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Expected O, but got Unknown
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Expected O, but got Unknown
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Expected O, but got Unknown
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_0079: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Expected O, but got Unknown
		Panel val = new Panel
		{
			Dock = (DockStyle)2,
			Height = 36,
			BackColor = ColorTranslator.FromHtml("#020c1b")
		};
		Label val2 = new Label
		{
			Text = "  ZOS",
			ForeColor = ColorTranslator.FromHtml("#64ffda"),
			Font = new Font("Segoe UI", 12f, (FontStyle)1),
			TextAlign = (ContentAlignment)16,
			Dock = (DockStyle)3,
			Width = 100
		};
		taskbarClock = new Label
		{
			Text = DateTime.Now.ToShortTimeString(),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			TextAlign = (ContentAlignment)64,
			Dock = (DockStyle)4,
			Width = 100
		};
		((Control)val).Controls.Add((Control)(object)val2);
		((Control)val).Controls.Add((Control)(object)taskbarClock);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void RefreshIconStates()
	{
		((Control)taskbarClock).Text = DateTime.Now.ToShortTimeString();
		iconBrowser.SetLocked(isLocked: false);
		iconMail.SetLocked(isLocked: false);
		iconFisher.SetLocked(!GameState.PhishingSent);
		iconPc1.SetLocked(!GameState.PhishingSent);
		iconVpn.SetLocked(!GameState.Pc1LoggedIn);
		iconPc2.SetLocked(!GameState.VpnConnected);
	}
}
