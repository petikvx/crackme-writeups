using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class VpnForm : Form
{
	private TextBox ipBox;

	private TextBox portBox;

	private ComboBox algoCombo;

	private Label statusLabel;

	public VpnForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Expected O, but got Unknown
		((Control)this).Text = "VPN Client";
		((Form)this).Size = new Size(560, 500);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		if (!GameState.Pc1LoggedIn)
		{
			((Control)this).Controls.Add((Control)new Label
			{
				Dock = (DockStyle)5,
				Text = "No connection details known yet. Log in to PC1 first.",
				TextAlign = (ContentAlignment)32,
				ForeColor = ColorTranslator.FromHtml("#8892b0")
			});
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
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected O, but got Unknown
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Expected O, but got Unknown
		//IL_0102: Unknown result type (might be due to invalid IL or missing references)
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_0112: Unknown result type (might be due to invalid IL or missing references)
		//IL_0119: Unknown result type (might be due to invalid IL or missing references)
		//IL_0121: Unknown result type (might be due to invalid IL or missing references)
		//IL_0127: Unknown result type (might be due to invalid IL or missing references)
		//IL_0131: Unknown result type (might be due to invalid IL or missing references)
		//IL_0141: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Unknown result type (might be due to invalid IL or missing references)
		//IL_0159: Expected O, but got Unknown
		//IL_0178: Unknown result type (might be due to invalid IL or missing references)
		//IL_017d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0184: Unknown result type (might be due to invalid IL or missing references)
		//IL_018c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a1: Expected O, but got Unknown
		TableLayoutPanel val = new TableLayoutPanel
		{
			Dock = (DockStyle)5,
			ColumnCount = 1,
			Padding = new Padding(20)
		};
		AddLabel(val, "IP address:");
		ipBox = InputBox();
		((ControlCollection)val.Controls).Add((Control)(object)ipBox);
		AddLabel(val, "Port:");
		portBox = InputBox();
		((ControlCollection)val.Controls).Add((Control)(object)portBox);
		AddLabel(val, "Encryption algorithm:");
		algoCombo = new ComboBox
		{
			Dock = (DockStyle)1,
			DropDownStyle = (ComboBoxStyle)2,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6")
		};
		ObjectCollection items = algoCombo.Items;
		object[] algorithmChoices = GameState.AlgorithmChoices;
		items.AddRange(algorithmChoices);
		algoCombo.Items.Add((object)GameState.CorrectAlgorithm);
		((ListControl)algoCombo).SelectedIndex = 0;
		((ControlCollection)val.Controls).Add((Control)(object)algoCombo);
		Button val2 = new Button
		{
			Text = "Connect",
			Dock = (DockStyle)1,
			Height = 42,
			Margin = new Padding(0, 18, 0, 0),
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#0a192f"),
			FlatStyle = (FlatStyle)0
		};
		((Control)val2).Click += ConnectButton_Click;
		((ControlCollection)val.Controls).Add((Control)(object)val2);
		statusLabel = new Label
		{
			Dock = (DockStyle)1,
			Height = 70,
			ForeColor = ColorTranslator.FromHtml("#8892b0")
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
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Expected O, but got Unknown
		((ControlCollection)root.Controls).Add((Control)new Label
		{
			Text = text,
			Dock = (DockStyle)1,
			Height = 28,
			ForeColor = ColorTranslator.FromHtml("#64ffda"),
			Margin = new Padding(0, 10, 0, 2)
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

	private void ConnectButton_Click(object sender, EventArgs e)
	{
		string algorithm = algoCombo.SelectedItem?.ToString() ?? "";
		if (GameState.ValidateVpn(((Control)ipBox).Text, ((Control)portBox).Text, algorithm))
		{
			GameState.VpnConnected = true;
			((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#64ffda");
			((Control)statusLabel).Text = "Connected to pc2. Open the new PC2 icon to continue.";
		}
		else
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "Connection refused. The IP, port, and algorithm must all match.";
		}
	}
}
