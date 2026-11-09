using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class DbmForm : Form
{
	private TextBox inputBox;

	private Button submitButton;

	private Label statusLabel;

	private Label counterLabel;

	private TextBox notesBox;

	public DbmForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ad: Expected O, but got Unknown
		//IL_00ae: Expected O, but got Unknown
		((Control)this).Text = "DBM - Database Manager (BETA)";
		((Form)this).Size = new Size(650, 480);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		if (!GameState.VpnConnected)
		{
			Label val = new Label
			{
				Dock = (DockStyle)5,
				Text = "Connect to pc2 via VPN before accessing the DBM beta.",
				TextAlign = (ContentAlignment)32,
				ForeColor = ColorTranslator.FromHtml("#8892b0"),
				Font = new Font("Segoe UI", 16f)
			};
			((Control)this).Controls.Add((Control)(object)val);
		}
		else
		{
			BuildLayout();
		}
	}

	private void BuildLayout()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected O, but got Unknown
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected O, but got Unknown
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_007e: Expected O, but got Unknown
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ca: Expected O, but got Unknown
		//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_010a: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0126: Expected O, but got Unknown
		//IL_013e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0143: Unknown result type (might be due to invalid IL or missing references)
		//IL_014a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0152: Unknown result type (might be due to invalid IL or missing references)
		//IL_0162: Unknown result type (might be due to invalid IL or missing references)
		//IL_0172: Expected O, but got Unknown
		//IL_0173: Unknown result type (might be due to invalid IL or missing references)
		//IL_0178: Unknown result type (might be due to invalid IL or missing references)
		//IL_017f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_018d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0194: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01aa: Expected O, but got Unknown
		//IL_01aa: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dd: Expected O, but got Unknown
		//IL_01dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0206: Expected O, but got Unknown
		Label val = new Label
		{
			Text = "Input (max 10 chars):",
			Dock = (DockStyle)1,
			Height = 24,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		inputBox = new TextBox
		{
			Dock = (DockStyle)1,
			Font = new Font("Consolas", 13f),
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		((Control)inputBox).TextChanged += delegate
		{
			((Control)counterLabel).Text = $"{((Control)inputBox).Text.Length} / 10 (displayed limit)";
		};
		counterLabel = new Label
		{
			Text = "0 / 10 (displayed limit)",
			Dock = (DockStyle)1,
			Height = 20,
			ForeColor = ColorTranslator.FromHtml("#8892b0")
		};
		submitButton = new Button
		{
			Text = "Submit",
			Dock = (DockStyle)1,
			Height = 34,
			Margin = new Padding(0, 10, 0, 0),
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#0a192f"),
			FlatStyle = (FlatStyle)0
		};
		((Control)submitButton).Click += SubmitButton_Click;
		statusLabel = new Label
		{
			Dock = (DockStyle)1,
			Height = 60,
			ForeColor = ColorTranslator.FromHtml("#8892b0"),
			Text = ""
		};
		notesBox = new TextBox
		{
			Multiline = true,
			ReadOnly = true,
			Dock = (DockStyle)5,
			Visible = false,
			Font = new Font("Consolas", 14f, (FontStyle)1),
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#64ffda"),
			BorderStyle = (BorderStyle)1,
			ScrollBars = (ScrollBars)2
		};
		Panel val2 = new Panel
		{
			Dock = (DockStyle)5,
			Padding = new Padding(8),
			BackColor = ColorTranslator.FromHtml("#0a192f")
		};
		((Control)val2).Controls.Add((Control)(object)notesBox);
		((Control)this).Controls.Add((Control)(object)val2);
		((Control)this).Controls.Add((Control)(object)statusLabel);
		((Control)this).Controls.Add((Control)(object)submitButton);
		((Control)this).Controls.Add((Control)(object)counterLabel);
		((Control)this).Controls.Add((Control)(object)inputBox);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void SubmitButton_Click(object sender, EventArgs e)
	{
		string text = ((Control)inputBox).Text;
		bool flag = text.Length > 10;
		bool flag2 = text.IndexOf(GameState.WinAddrToken, StringComparison.OrdinalIgnoreCase) >= 0;
		if (flag && flag2 && GameState.ValidateOverflow(text))
		{
			GameState.OverflowSolved = true;
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#64ffda");
			((Control)statusLabel).Text = "Segmentation... just kidding. You overwrote the return address with win_addr!\nThe protected notes.txt file is now readable below.";
			((Control)notesBox).Text = "Welcome to the -> Corporate Network Simulation.\r\n\r\nFLAG: " + GameState.Flag + "\r\n\r\nCongratulations, you claimed the $1,000,000 prize (simulated).";
			((Control)notesBox).Visible = true;
			((Control)notesBox).BringToFront();
		}
		else if (!flag)
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "Input accepted normally, nothing interesting happened. The field claims a 10 char max - is that actually enforced?";
		}
		else
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "You overflowed the buffer, but didn't land on anything useful. Sara mentioned a function name...";
		}
	}
}
