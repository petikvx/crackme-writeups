using System.Windows.Forms;

namespace ZOS.Forms;

public class Pc2DesktopForm : VirtualDesktopForm
{
	private const string SaraMessage = "Message from Sara:\r\n\r\nHi Omar, I wish you could try the new feature we added to the DBM. It's a memory boundary simulation. The textbox below says 10 chars maximum... but does it actually stop you? There's a function called win_addr somewhere. Good luck.";

	public Pc2DesktopForm()
		: base("PC2 - Mohamad's desktop")
	{
		AddDesktopIcon("DBM Tool", "DBM", delegate
		{
			((Control)new DbmForm()).Show();
		});
		AddDesktopIcon("Message from Sara", "MAIL", delegate
		{
			((Control)new TextFileForm("Message from Sara", "Message from Sara:\r\n\r\nHi Omar, I wish you could try the new feature we added to the DBM. It's a memory boundary simulation. The textbox below says 10 chars maximum... but does it actually stop you? There's a function called win_addr somewhere. Good luck.")).Show();
		});
		AddDesktopIcon("readme.tmp", "FILE", delegate
		{
			((Control)new TextFileForm("readme.tmp", "Temporary file. Nothing useful here.")).Show();
		});
	}
}
