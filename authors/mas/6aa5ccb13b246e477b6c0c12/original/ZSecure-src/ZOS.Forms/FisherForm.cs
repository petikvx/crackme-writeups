using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class FisherForm : Form
{
	public FisherForm()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected O, but got Unknown
		((Control)this).Text = "Fisher - Captured Credentials";
		((Form)this).Size = new Size(700, 560);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).ForeColor = ColorTranslator.FromHtml("#ccd6f6");
		((Control)this).Font = new Font("Segoe UI", 16f);
		if (!GameState.PhishingSent)
		{
			BuildLockedMessage();
		}
		else
		{
			BuildLayout();
		}
	}

	private void BuildLockedMessage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Expected O, but got Unknown
		//IL_0045: Expected O, but got Unknown
		Label val = new Label
		{
			Dock = (DockStyle)5,
			Text = "No catch yet. Send a convincing phishing email to Oday first.",
			TextAlign = (ContentAlignment)32,
			ForeColor = ColorTranslator.FromHtml("#8892b0"),
			Font = new Font("Segoe UI", 16f)
		};
		((Control)this).Controls.Add((Control)(object)val);
	}

	private void BuildLayout()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Expected O, but got Unknown
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Expected O, but got Unknown
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Expected O, but got Unknown
		Label val = new Label
		{
			Dock = (DockStyle)1,
			Height = 40,
			Text = "\ud83c\udfa3 Phishing successful - Oday clicked the link",
			Font = new Font("Segoe UI", 12f, (FontStyle)1),
			ForeColor = ColorTranslator.FromHtml("#64ffda"),
			TextAlign = (ContentAlignment)16,
			Padding = new Padding(10, 0, 0, 0)
		};
		Panel val2 = GroupBox("Captured credentials (pc1 / oday)", "Username: oday\nMD5 Hash: " + GameState.OdayMd5Hash);
		Panel val3 = GroupBox("Intercepted message from Mohamad", "\"Hi Oday, I have heard that you have a problem with the very strong hash algorithms and you want to use a fast one, how about using MD5?\"\n\n");
		Label val4 = new Label
		{
			Dock = (DockStyle)1,
			Height = 40,
			ForeColor = ColorTranslator.FromHtml("#8892b0"),
			Text = "Use the captured hash and wordlist with your own tools, then open PC1."
		};
		((Control)this).Controls.Add((Control)(object)val4);
		((Control)this).Controls.Add((Control)(object)val3);
		((Control)this).Controls.Add((Control)(object)val2);
		((Control)this).Controls.Add((Control)(object)val);
	}

	private Panel GroupBox(string title, string body)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Expected O, but got Unknown
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Expected O, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0079: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b6: Expected O, but got Unknown
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cf: Expected O, but got Unknown
		Panel val = new Panel
		{
			Dock = (DockStyle)1,
			Height = 160,
			Padding = new Padding(10)
		};
		Label val2 = new Label
		{
			Text = title,
			Dock = (DockStyle)1,
			Height = 24,
			Font = new Font("Segoe UI", 12f, (FontStyle)1),
			ForeColor = ColorTranslator.FromHtml("#64ffda")
		};
		TextBox val3 = new TextBox
		{
			Text = body,
			Multiline = true,
			ReadOnly = true,
			Dock = (DockStyle)5,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1,
			ScrollBars = (ScrollBars)2
		};
		((Control)val).Controls.Add((Control)(object)val3);
		((Control)val).Controls.Add((Control)(object)val2);
		return val;
	}
}
