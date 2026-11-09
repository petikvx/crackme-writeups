using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class Pc2LoginForm : Form
{
	private TextBox userBox;

	private TextBox passBox;

	private Label statusLabel;

	public Pc2LoginForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		//IL_0062: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_0083: Expected O, but got Unknown
		//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Unknown result type (might be due to invalid IL or missing references)
		//IL_0120: Unknown result type (might be due to invalid IL or missing references)
		//IL_0130: Unknown result type (might be due to invalid IL or missing references)
		//IL_0138: Expected O, but got Unknown
		//IL_0157: Unknown result type (might be due to invalid IL or missing references)
		//IL_015c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0163: Unknown result type (might be due to invalid IL or missing references)
		//IL_016b: Unknown result type (might be due to invalid IL or missing references)
		//IL_017b: Expected O, but got Unknown
		((Control)this).Text = "PC2 - Login (mohamad's workstation)";
		((Form)this).Size = new Size(620, 420);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		TableLayoutPanel val = new TableLayoutPanel
		{
			Dock = (DockStyle)5,
			ColumnCount = 1,
			Padding = new Padding(28)
		};
		AddLabel(val, "Username:");
		userBox = InputBox();
		((ControlCollection)val.Controls).Add((Control)(object)userBox);
		AddLabel(val, "Password:");
		passBox = InputBox();
		passBox.UseSystemPasswordChar = true;
		((ControlCollection)val.Controls).Add((Control)(object)passBox);
		Button val2 = new Button
		{
			Text = "Log In",
			Dock = (DockStyle)1,
			Height = 42,
			Margin = new Padding(0, 18, 0, 0),
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#0a192f"),
			FlatStyle = (FlatStyle)0
		};
		((Control)val2).Click += LoginButton_Click;
		((ControlCollection)val.Controls).Add((Control)(object)val2);
		statusLabel = new Label
		{
			Dock = (DockStyle)1,
			Height = 60,
			ForeColor = Color.OrangeRed
		};
		((ControlCollection)val.Controls).Add((Control)(object)statusLabel);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void AddLabel(TableLayoutPanel root, string text)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected O, but got Unknown
		((ControlCollection)root.Controls).Add((Control)new Label
		{
			Text = text,
			Dock = (DockStyle)1,
			Height = 28,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		});
	}

	private TextBox InputBox()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Expected O, but got Unknown
		return new TextBox
		{
			Dock = (DockStyle)1,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
	}

	private void LoginButton_Click(object sender, EventArgs e)
	{
		if (GameState.ValidatePc2(((Control)userBox).Text, ((Control)passBox).Text))
		{
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#64ffda");
			((Control)statusLabel).Text = "Login successful. Opening Mohamad's desktop...";
			((Control)new Pc2DesktopForm()).Show();
			((Control)this).Hide();
		}
		else
		{
			((Control)statusLabel).Text = "Invalid username or password.";
		}
	}
}
