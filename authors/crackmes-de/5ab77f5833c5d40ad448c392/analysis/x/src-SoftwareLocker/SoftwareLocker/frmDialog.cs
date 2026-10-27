using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using SerialBox;

namespace SoftwareLocker;

public class frmDialog : Form
{
	private string _Pass;

	private IContainer components = null;

	private global::SerialBox.SerialBox sebBaseString;

	private global::SerialBox.SerialBox sebPassword;

	private Button btnOK;

	private Button btnTrial;

	private GroupBox grbRegister;

	private Label lblCallPhone;

	private Label lblComment;

	private Label lblSerial;

	private Label lblID;

	private Label lblDaysToEnd;

	private Label lblDays;

	private Label lblRunTimesLeft;

	private Label lblTimes;

	private GroupBox grbTrialRunning;

	private Label lblText;

	public frmDialog(string BaseString, string Password, int DaysToEnd, int Runed, string info)
	{
		InitializeComponent();
		((Control)sebBaseString).Text = BaseString;
		_Pass = Password;
		((Control)lblDays).Text = DaysToEnd + " Day(s)";
		((Control)lblTimes).Text = Runed + " Time(s)";
		((Control)lblText).Text = info;
		if (DaysToEnd <= 0 || Runed <= 0)
		{
			((Control)lblDays).Text = "Finished";
			((Control)lblTimes).Text = "Finished";
			((Control)btnTrial).Enabled = false;
		}
		((Control)sebPassword).Select();
	}

	private void btnOK_Click(object sender, EventArgs e)
	{
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		if (_Pass == ((Control)sebPassword).Text)
		{
			MessageBox.Show("Password is correct", "Password", (MessageBoxButtons)0, (MessageBoxIcon)64);
			((Form)this).DialogResult = (DialogResult)1;
		}
		else
		{
			MessageBox.Show("Password is incorrect", "Password", (MessageBoxButtons)0, (MessageBoxIcon)16);
		}
	}

	private void btnTrial_Click(object sender, EventArgs e)
	{
		((Form)this).DialogResult = (DialogResult)4;
	}

	protected override void Dispose(bool disposing)
	{
		if (disposing && components != null)
		{
			components.Dispose();
		}
		((Form)this).Dispose(disposing);
	}

	private void InitializeComponent()
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected O, but got Unknown
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected O, but got Unknown
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected O, but got Unknown
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Expected O, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected O, but got Unknown
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Expected O, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Expected O, but got Unknown
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Expected O, but got Unknown
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Expected O, but got Unknown
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Expected O, but got Unknown
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Expected O, but got Unknown
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_009b: Expected O, but got Unknown
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Expected O, but got Unknown
		//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ec: Expected O, but got Unknown
		//IL_0162: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Expected O, but got Unknown
		sebBaseString = new global::SerialBox.SerialBox();
		sebPassword = new global::SerialBox.SerialBox();
		btnOK = new Button();
		btnTrial = new Button();
		grbRegister = new GroupBox();
		lblText = new Label();
		lblSerial = new Label();
		lblID = new Label();
		lblCallPhone = new Label();
		lblComment = new Label();
		lblDaysToEnd = new Label();
		lblDays = new Label();
		lblRunTimesLeft = new Label();
		lblTimes = new Label();
		grbTrialRunning = new GroupBox();
		((Control)grbRegister).SuspendLayout();
		((Control)grbTrialRunning).SuspendLayout();
		((Control)this).SuspendLayout();
		sebBaseString.CaptleLettersOnly = true;
		((Control)sebBaseString).Font = new Font("Microsoft Sans Serif", 7.25f);
		((Control)sebBaseString).Location = new Point(12, 74);
		((Control)sebBaseString).Name = "sebBaseString";
		sebBaseString.ReadOnly = true;
		((Control)sebBaseString).Size = new Size(293, 18);
		((Control)sebBaseString).TabIndex = 2;
		sebPassword.CaptleLettersOnly = true;
		((Control)sebPassword).Font = new Font("Microsoft Sans Serif", 7.25f);
		((Control)sebPassword).Location = new Point(12, 117);
		((Control)sebPassword).Name = "sebPassword";
		((Control)sebPassword).Size = new Size(293, 18);
		((Control)sebPassword).TabIndex = 4;
		((Control)btnOK).Location = new Point(121, 154);
		((Control)btnOK).Name = "btnOK";
		((Control)btnOK).Size = new Size(75, 23);
		((Control)btnOK).TabIndex = 5;
		((Control)btnOK).Text = "&OK";
		((ButtonBase)btnOK).UseVisualStyleBackColor = true;
		((Control)btnOK).Click += btnOK_Click;
		((Control)btnTrial).Location = new Point(206, 26);
		((Control)btnTrial).Name = "btnTrial";
		((Control)btnTrial).Size = new Size(99, 23);
		((Control)btnTrial).TabIndex = 2;
		((Control)btnTrial).Text = "Trial Run";
		((ButtonBase)btnTrial).UseVisualStyleBackColor = true;
		((Control)btnTrial).Click += btnTrial_Click;
		((Control)grbRegister).Anchor = (AnchorStyles)13;
		((Control)grbRegister).Controls.Add((Control)(object)lblText);
		((Control)grbRegister).Controls.Add((Control)(object)lblSerial);
		((Control)grbRegister).Controls.Add((Control)(object)lblID);
		((Control)grbRegister).Controls.Add((Control)(object)lblCallPhone);
		((Control)grbRegister).Controls.Add((Control)(object)sebBaseString);
		((Control)grbRegister).Controls.Add((Control)(object)btnOK);
		((Control)grbRegister).Controls.Add((Control)(object)sebPassword);
		((Control)grbRegister).Location = new Point(12, 57);
		((Control)grbRegister).Name = "grbRegister";
		((Control)grbRegister).Size = new Size(317, 232);
		((Control)grbRegister).TabIndex = 1;
		grbRegister.TabStop = false;
		((Control)grbRegister).Text = "Registration Info";
		((Control)lblText).Location = new Point(9, 184);
		((Control)lblText).Name = "lblText";
		((Control)lblText).Size = new Size(296, 35);
		((Control)lblText).TabIndex = 6;
		((Control)lblSerial).AutoSize = true;
		((Control)lblSerial).Location = new Point(9, 101);
		((Control)lblSerial).Name = "lblSerial";
		((Control)lblSerial).Size = new Size(36, 13);
		((Control)lblSerial).TabIndex = 3;
		((Control)lblSerial).Text = "Serial:";
		((Control)lblID).AutoSize = true;
		((Control)lblID).Location = new Point(9, 58);
		((Control)lblID).Name = "lblID";
		((Control)lblID).Size = new Size(21, 13);
		((Control)lblID).TabIndex = 1;
		((Control)lblID).Text = "ID:";
		((Control)lblCallPhone).AutoSize = true;
		((Control)lblCallPhone).Location = new Point(6, 21);
		((Control)lblCallPhone).Name = "lblCallPhone";
		((Control)lblCallPhone).Size = new Size(210, 26);
		((Control)lblCallPhone).TabIndex = 0;
		((Control)lblCallPhone).Text = "Call shoping part and read you ID.\r\nThey will give you serial for your application";
		((Control)lblComment).Location = new Point(12, 9);
		((Control)lblComment).Name = "lblComment";
		((Control)lblComment).Size = new Size(317, 43);
		((Control)lblComment).TabIndex = 0;
		((Control)lblComment).Text = "To use this application, you must buy it.\r\nBefore buying, you can run application as trial. in trial mode some parts may be inactive and after buying they will be active";
		((Control)lblDaysToEnd).AutoSize = true;
		((Control)lblDaysToEnd).Location = new Point(9, 22);
		((Control)lblDaysToEnd).Name = "lblDaysToEnd";
		((Control)lblDaysToEnd).Size = new Size(118, 13);
		((Control)lblDaysToEnd).TabIndex = 3;
		((Control)lblDaysToEnd).Text = "Days to end trial period:";
		((Control)lblDays).AutoSize = true;
		((Control)lblDays).ForeColor = Color.Red;
		((Control)lblDays).Location = new Point(132, 22);
		((Control)lblDays).Name = "lblDays";
		((Control)lblDays).Size = new Size(37, 13);
		((Control)lblDays).TabIndex = 4;
		((Control)lblDays).Text = "[Days]";
		((Control)lblRunTimesLeft).AutoSize = true;
		((Control)lblRunTimesLeft).Location = new Point(9, 48);
		((Control)lblRunTimesLeft).Name = "lblRunTimesLeft";
		((Control)lblRunTimesLeft).Size = new Size(74, 13);
		((Control)lblRunTimesLeft).TabIndex = 5;
		((Control)lblRunTimesLeft).Text = "Run times left:";
		((Control)lblTimes).AutoSize = true;
		((Control)lblTimes).ForeColor = Color.Red;
		((Control)lblTimes).Location = new Point(132, 48);
		((Control)lblTimes).Name = "lblTimes";
		((Control)lblTimes).Size = new Size(41, 13);
		((Control)lblTimes).TabIndex = 6;
		((Control)lblTimes).Text = "[Times]";
		((Control)grbTrialRunning).Controls.Add((Control)(object)lblDaysToEnd);
		((Control)grbTrialRunning).Controls.Add((Control)(object)lblRunTimesLeft);
		((Control)grbTrialRunning).Controls.Add((Control)(object)lblDays);
		((Control)grbTrialRunning).Controls.Add((Control)(object)lblTimes);
		((Control)grbTrialRunning).Controls.Add((Control)(object)btnTrial);
		((Control)grbTrialRunning).Location = new Point(12, 295);
		((Control)grbTrialRunning).Name = "grbTrialRunning";
		((Control)grbTrialRunning).Size = new Size(317, 74);
		((Control)grbTrialRunning).TabIndex = 8;
		grbTrialRunning.TabStop = false;
		((Control)grbTrialRunning).Text = "Trial Running";
		((Form)this).AcceptButton = (IButtonControl)(object)btnOK;
		((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
		((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
		((Form)this).ClientSize = new Size(341, 379);
		((Control)this).Controls.Add((Control)(object)lblComment);
		((Control)this).Controls.Add((Control)(object)grbTrialRunning);
		((Control)this).Controls.Add((Control)(object)grbRegister);
		((Form)this).FormBorderStyle = (FormBorderStyle)3;
		((Form)this).MaximizeBox = false;
		((Form)this).MinimizeBox = false;
		((Control)this).Name = "frmDialog";
		((Control)this).Text = "Regitration Dialog";
		((Control)grbRegister).ResumeLayout(false);
		((Control)grbRegister).PerformLayout();
		((Control)grbTrialRunning).ResumeLayout(false);
		((Control)grbTrialRunning).PerformLayout();
		((Control)this).ResumeLayout(false);
	}
}
