using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class Pc1LoginForm : Form
{
	private TextBox userBox;

	private TextBox passBox;

	private Button loginButton;

	private Label statusLabel;

	private TextBox noteBox;

	public Pc1LoginForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		((Control)this).Text = "PC1 - Login (oday's workstation)";
		((Form)this).Size = new Size(600, 500);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		BuildLoginPanel();
	}

	private void BuildLoginPanel()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Expected O, but got Unknown
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Expected O, but got Unknown
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Expected O, but got Unknown
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Expected O, but got Unknown
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f5: Expected O, but got Unknown
		//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0115: Unknown result type (might be due to invalid IL or missing references)
		//IL_0125: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_0141: Expected O, but got Unknown
		//IL_0159: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0165: Unknown result type (might be due to invalid IL or missing references)
		//IL_016d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0178: Unknown result type (might be due to invalid IL or missing references)
		//IL_0188: Expected O, but got Unknown
		//IL_01e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0206: Unknown result type (might be due to invalid IL or missing references)
		//IL_0216: Unknown result type (might be due to invalid IL or missing references)
		//IL_0226: Unknown result type (might be due to invalid IL or missing references)
		//IL_022d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0239: Expected O, but got Unknown
		TableLayoutPanel val = new TableLayoutPanel
		{
			Dock = (DockStyle)1,
			Height = 180,
			ColumnCount = 1,
			Padding = new Padding(20)
		};
		Label val2 = new Label
		{
			Text = "Username:",
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		userBox = new TextBox
		{
			Dock = (DockStyle)1,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		Label val3 = new Label
		{
			Text = "Password:",
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		passBox = new TextBox
		{
			Dock = (DockStyle)1,
			UseSystemPasswordChar = true,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		loginButton = new Button
		{
			Text = "Log In",
			Dock = (DockStyle)1,
			Height = 32,
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#0a192f"),
			FlatStyle = (FlatStyle)0
		};
		((Control)loginButton).Click += LoginButton_Click;
		statusLabel = new Label
		{
			Dock = (DockStyle)1,
			Height = 30,
			ForeColor = Color.OrangeRed,
			Text = ""
		};
		((ControlCollection)val.Controls).Add((Control)(object)val2);
		((ControlCollection)val.Controls).Add((Control)(object)userBox);
		((ControlCollection)val.Controls).Add((Control)(object)val3);
		((ControlCollection)val.Controls).Add((Control)(object)passBox);
		((ControlCollection)val.Controls).Add((Control)(object)loginButton);
		((ControlCollection)val.Controls).Add((Control)(object)statusLabel);
		noteBox = new TextBox
		{
			Multiline = true,
			Dock = (DockStyle)5,
			ReadOnly = true,
			Visible = false,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1,
			ScrollBars = (ScrollBars)2
		};
		((Control)this).Controls.Add((Control)(object)noteBox);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void LoginButton_Click(object sender, EventArgs e)
	{
		if (GameState.ValidatePc1(((Control)userBox).Text, ((Control)passBox).Text))
		{
			GameState.HashCracked = true;
			GameState.Pc1LoggedIn = true;
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#64ffda");
			((Control)statusLabel).Text = "Login successful. Opening Oday's desktop...";
			((Control)new Pc1DesktopForm()).Show();
			((Control)this).Hide();
		}
		else
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "Invalid username or password.";
		}
	}
}
