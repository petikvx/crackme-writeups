using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class BrowserForm : Form
{
	private WebBrowser browser;

	public BrowserForm()
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected O, but got Unknown
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_0098: Expected O, but got Unknown
		//IL_0099: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b1: Expected O, but got Unknown
		((Control)this).Text = "ZSecure Corporate Portal - Browser";
		((Form)this).Size = new Size(1000, 700);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#0a192f");
		((Control)this).Font = new Font("Segoe UI", 16f);
		TextBox val = new TextBox
		{
			Dock = (DockStyle)1,
			Text = "https://intranet.zsecure.zplus/team",
			ReadOnly = true,
			BackColor = ColorTranslator.FromHtml("#112240"),
			ForeColor = ColorTranslator.FromHtml("#ccd6f6"),
			BorderStyle = (BorderStyle)1
		};
		browser = new WebBrowser
		{
			Dock = (DockStyle)5,
			ScriptErrorsSuppressed = true
		};
		((Control)this).Controls.Add((Control)(object)browser);
		((Control)this).Controls.Add((Control)(object)val);
		LoadTeamPage();
	}

	private void LoadTeamPage()
	{
		browser.DocumentText = Html.ZSecureTeamPage.Replace("[[PHISH_WORD]]", GameState.PhishTriggerWord).Replace("[[ODAY_EMAIL]]", GameState.OdayEmail);
	}
}
