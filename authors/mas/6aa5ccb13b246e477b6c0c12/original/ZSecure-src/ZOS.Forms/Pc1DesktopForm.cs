using System.Windows.Forms;

namespace ZOS.Forms;

public class Pc1DesktopForm : VirtualDesktopForm
{
	private const string StickyNote = "sticky-note.txt\r\n\r\nReminder to self: pc2 is only reachable through the VPN. Connection details below are encrypted so nobody 'shoulder-surfing' can read them. You know which algorithm we always use for this.\r\n\r\nOpen the VPN app, decode this with the right algorithm, and connect.";

	public Pc1DesktopForm()
		: base("PC1 - Oday's desktop")
	{
		AddDesktopIcon("sticky-note.txt", "NOTE", delegate
		{
			((Control)new TextFileForm("sticky-note.txt", "sticky-note.txt\r\n\r\nReminder to self: pc2 is only reachable through the VPN. Connection details below are encrypted so nobody 'shoulder-surfing' can read them. You know which algorithm we always use for this.\r\n\r\nOpen the VPN app, decode this with the right algorithm, and connect.")).Show();
		});
		AddDesktopIcon("todo.tmp", "TODO", delegate
		{
			((Control)new TextFileForm("todo.tmp", "Buy coffee\r\nCheck mailbox\r\nFix VPN later")).Show();
		});
		AddDesktopIcon("photo.jpg", "PHOTO", delegate
		{
			((Control)new TextFileForm("photo.jpg", "[A random desktop file with no useful content]")).Show();
		});
	}
}
