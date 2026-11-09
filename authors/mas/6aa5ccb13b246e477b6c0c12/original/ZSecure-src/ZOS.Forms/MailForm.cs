using System;
using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class MailForm : Form
{
	private ListBox inboxList;

	private TextBox bodyPreview;

	private TextBox toField;

	private TextBox composeBody;

	private Button sendButton;

	private Label statusLabel;

	private readonly (string from, string subject, string body)[] inboxMessages = new(string, string, string)[2]
	{
		("IT Helpdesk", "Welcome to ZSecure Mail", "Welcome! Use this client to communicate with ZSecure staff.\n\nTip: employees respond better to messages that reference something personal about them. Check the public team page for ideas."),
		("Security Awareness Bot", "Reminder: Phishing Training", "ZSecure takes security seriously. All staff have been trained to recognize phishing... allegedly.\n\nRemember: a well-crafted, personalized message is far more convincing than a generic one.")
	};

	public MailForm()
	{
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Expected O, but got Unknown
		((Control)this).Text = "ZMail - Corporate Mail Client";
		((Form)this).Size = new Size(1100, 620);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		BuildLayout();
	}

	private void BuildLayout()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Expected O, but got Unknown
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Expected O, but got Unknown
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0119: Expected O, but got Unknown
		//IL_0119: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0126: Expected O, but got Unknown
		//IL_0159: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0165: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0173: Unknown result type (might be due to invalid IL or missing references)
		//IL_0176: Unknown result type (might be due to invalid IL or missing references)
		//IL_0181: Expected O, but got Unknown
		//IL_0188: Unknown result type (might be due to invalid IL or missing references)
		//IL_0192: Expected O, but got Unknown
		//IL_019a: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a4: Expected O, but got Unknown
		//IL_01ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b6: Expected O, but got Unknown
		//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cd: Expected O, but got Unknown
		//IL_01d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01df: Expected O, but got Unknown
		//IL_01e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0208: Expected O, but got Unknown
		//IL_0209: Unknown result type (might be due to invalid IL or missing references)
		//IL_020e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0215: Unknown result type (might be due to invalid IL or missing references)
		//IL_0220: Unknown result type (might be due to invalid IL or missing references)
		//IL_0230: Unknown result type (might be due to invalid IL or missing references)
		//IL_0240: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Expected O, but got Unknown
		//IL_024c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0251: Unknown result type (might be due to invalid IL or missing references)
		//IL_025c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0263: Unknown result type (might be due to invalid IL or missing references)
		//IL_0275: Expected O, but got Unknown
		//IL_0276: Unknown result type (might be due to invalid IL or missing references)
		//IL_027b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0282: Unknown result type (might be due to invalid IL or missing references)
		//IL_0289: Unknown result type (might be due to invalid IL or missing references)
		//IL_0299: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b5: Expected O, but got Unknown
		//IL_02b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0301: Expected O, but got Unknown
		//IL_0319: Unknown result type (might be due to invalid IL or missing references)
		//IL_031e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0325: Unknown result type (might be due to invalid IL or missing references)
		//IL_032c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0334: Unknown result type (might be due to invalid IL or missing references)
		//IL_0344: Unknown result type (might be due to invalid IL or missing references)
		//IL_0354: Expected O, but got Unknown
		//IL_0397: Unknown result type (might be due to invalid IL or missing references)
		//IL_039c: Unknown result type (might be due to invalid IL or missing references)
		//IL_03a5: Expected O, but got Unknown
		SplitContainer val = new SplitContainer
		{
			Dock = (DockStyle)5,
			SplitterDistance = 260,
			BackColor = ColorTranslator.FromHtml("#0a192f")
		};
		inboxList = new ListBox
		{
			Dock = (DockStyle)5,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)0
		};
		(string, string, string)[] array = inboxMessages;
		for (int i = 0; i < array.Length; i++)
		{
			(string, string, string) tuple = array[i];
			inboxList.Items.Add((object)(tuple.Item1 + ": " + tuple.Item2));
		}
		inboxList.SelectedIndexChanged += delegate
		{
			if (((ListControl)inboxList).SelectedIndex >= 0)
			{
				((Control)bodyPreview).Text = inboxMessages[((ListControl)inboxList).SelectedIndex].body;
			}
		};
		bodyPreview = new TextBox
		{
			Multiline = true,
			Dock = (DockStyle)2,
			Height = 220,
			ReadOnly = true,
			BackColor = ColorTranslator.FromHtml("#0a192f"),
			ForeColor = ColorTranslator.FromHtml("#8892b0"),
			BorderStyle = (BorderStyle)1
		};
		Panel val2 = new Panel
		{
			Dock = (DockStyle)5
		};
		((Control)val2).Controls.Add((Control)(object)inboxList);
		((Control)val2).Controls.Add((Control)(object)bodyPreview);
		((Control)val.Panel1).Controls.Add((Control)(object)val2);
		TableLayoutPanel val3 = new TableLayoutPanel
		{
			Dock = (DockStyle)5,
			ColumnCount = 1,
			RowCount = 5,
			Padding = new Padding(15)
		};
		val3.RowStyles.Add(new RowStyle((SizeType)0));
		val3.RowStyles.Add(new RowStyle((SizeType)0));
		val3.RowStyles.Add(new RowStyle((SizeType)0));
		val3.RowStyles.Add(new RowStyle((SizeType)2, 100f));
		val3.RowStyles.Add(new RowStyle((SizeType)0));
		Label val4 = new Label
		{
			Text = "To:",
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		toField = new TextBox
		{
			Dock = (DockStyle)1,
			Text = "",
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		Label val5 = new Label
		{
			Text = "Message:",
			AutoSize = true,
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		composeBody = new TextBox
		{
			Multiline = true,
			Dock = (DockStyle)5,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		sendButton = new Button
		{
			Text = "Send",
			Dock = (DockStyle)1,
			Height = 36,
			BackColor = ColorTranslator.FromHtml("#64ffda"),
			ForeColor = ColorTranslator.FromHtml("#0a192f"),
			FlatStyle = (FlatStyle)0
		};
		((Control)sendButton).Click += SendButton_Click;
		statusLabel = new Label
		{
			Dock = (DockStyle)1,
			AutoSize = false,
			Height = 40,
			ForeColor = ColorTranslator.FromHtml("#8892b0"),
			Text = ""
		};
		val3.Controls.Add((Control)(object)val4, 0, 0);
		val3.Controls.Add((Control)(object)toField, 0, 1);
		val3.Controls.Add((Control)(object)val5, 0, 2);
		val3.Controls.Add((Control)(object)composeBody, 0, 3);
		Panel val6 = new Panel
		{
			Dock = (DockStyle)5
		};
		((Control)val6).Controls.Add((Control)(object)statusLabel);
		((Control)val6).Controls.Add((Control)(object)sendButton);
		((Control)statusLabel).Dock = (DockStyle)2;
		((Control)sendButton).Dock = (DockStyle)2;
		val3.Controls.Add((Control)(object)val6, 0, 4);
		((Control)val.Panel2).Controls.Add((Control)(object)val3);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void SendButton_Click(object sender, EventArgs e)
	{
		string text = ((Control)toField).Text.Trim().ToLowerInvariant();
		string text2 = ((Control)composeBody).Text ?? "";
		if (text != GameState.OdayEmail)
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "Delivery failed: unknown recipient. Try Oday's email from the team page.";
			return;
		}
		if (text2.IndexOf(GameState.PhishTriggerWord, StringComparison.OrdinalIgnoreCase) < 0)
		{
			((Control)statusLabel).ForeColor = Color.OrangeRed;
			((Control)statusLabel).Text = "Oday ignored the message. Maybe reference something he actually cares about?";
			return;
		}
		GameState.PhishingSent = true;
		GameState.RecordPhishing(text, text2);
		((Control)statusLabel).ForeColor = ColorTranslator.FromHtml("#64ffda");
		((Control)statusLabel).Text = "Message sent! Oday clicked the link. Check the new 'Fisher' app on your desktop.";
		((Control)sendButton).Enabled = false;
		((Control)toField).Enabled = false;
		((Control)composeBody).Enabled = false;
	}
}
