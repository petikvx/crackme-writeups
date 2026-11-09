using System.Drawing;
using System.Windows.Forms;

namespace ZOS.Forms;

public class TextFileForm : Form
{
	public TextFileForm(string fileName, string contents)
	{
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Expected O, but got Unknown
		((Control)this).Text = fileName;
		((Form)this).Size = new Size(720, 440);
		((Form)this).StartPosition = (FormStartPosition)1;
		((Control)this).BackColor = ColorTranslator.FromHtml("#102536");
		((Control)this).Font = new Font("Segoe UI", 13f);
		TextBox val = new TextBox
		{
			Dock = (DockStyle)5,
			Multiline = true,
			ReadOnly = true,
			ScrollBars = (ScrollBars)2,
			Text = contents,
			BackColor = ColorTranslator.FromHtml("#f5f0d8"),
			ForeColor = ColorTranslator.FromHtml("#17212b"),
			BorderStyle = (BorderStyle)0,
			Padding = new Padding(16)
		};
		((Control)this).Controls.Add((Control)(object)val);
	}
}
