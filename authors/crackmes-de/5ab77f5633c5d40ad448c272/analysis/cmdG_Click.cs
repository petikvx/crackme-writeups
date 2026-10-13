			((Control)cmdG).Click += cmdG_Click;
			((TextBoxBase)txtN).BorderStyle = (BorderStyle)1;
			((Control)txtN).Location = new Point(49, 12);
			((Control)txtN).Name = "txtN";
			((Control)txtN).Size = new Size(211, 20);
			((Control)txtN).TabIndex = 0;
			((TextBoxBase)txtS).BorderStyle = (BorderStyle)1;
			((Control)txtS).Location = new Point(49, 38);
			((Control)txtS).Name = "txtS";
			((Control)txtS).Size = new Size(211, 20);
			((Control)txtS).TabIndex = 1;
			((Control)T7ug7b78).AutoSize = true;
			((Control)T7ug7b78).Location = new Point(10, 15);
			((Control)T7ug7b78).Name = "T7ug7b78";
			((Control)T7ug7b78).Size = new Size(38, 13);
			((Control)T7ug7b78).TabIndex = 3;
			((Control)T7ug7b78).Text = "Name:";
			((Control)GH7u78gv).AutoSize = true;
			((Control)GH7u78gv).Location = new Point(10, 41);
			((Control)GH7u78gv).Name = "GH7u78gv";
			((Control)GH7u78gv).Size = new Size(36, 13);
			((Control)GH7u78gv).TabIndex = 4;
			((Control)GH7u78gv).Text = "Serial:";
			((ContainerControl)this).AutoScaleDimensions = new SizeF(6f, 13f);
			((ContainerControl)this).AutoScaleMode = (AutoScaleMode)1;
			((Form)this).ClientSize = new Size(272, 105);
			((Control)this).Controls.Add((Control)(object)GH7u78gv);
			((Control)this).Controls.Add((Control)(object)T7ug7b78);
			((Control)this).Controls.Add((Control)(object)txtS);
			((Control)this).Controls.Add((Control)(object)txtN);
			((Control)this).Controls.Add((Control)(object)cmdG);
			((Form)this).FormBorderStyle = (FormBorderStyle)1;
			((Form)this).MaximizeBox = false;
			((Control)this).Name = "frmMain";
			((Form)this).StartPosition = (FormStartPosition)1;
			((Control)this).Text = "frmMain";
			((Form)this).Load += frmMain_Load;
			((Control)this).ResumeLayout(false);
			((Control)this).PerformLayout();
		}
		private void cmdG_Click(object sender, EventArgs e)
		{
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
			if (((Control)txtN).Text.Length < 2)
			{
				MessageBox.Show(dc("VGhlIG5hbWUgeW91IGVudGVyZWQgaXMgdG9vIHNob3J0LCB0cnkgYWdhaW4u"), dc("RXJyb3IhIDpv"));
				return;
			}
			string text = ((Control)txtN).Text;
			string hash = getHash(text);
			int num = 0;
			int length = text.Length;
			int num2 = length * 8 + length + 63;
			for (int i = 0; i < hash.Length; i++)
			{
				num += hash[i];
			}
			string text2 = string.Concat((int)text[length - 1], num2, 63, num);
			if (((Control)txtS).Text == text2)
			{
				MessageBox.Show(dc("V2VsbCBkb25lISBOb3cgd3JpdGUgeW91ciB0dXRvcmlhbC9rZXlnZW4u"), dc("R29vZCBib3kh"));
			}
			else
			{
				MessageBox.Show(dc("U29ycnksIHdyb25nIHNlcmlhbC4gVHJ5IGFnYWluLg=="), dc("QmFkIGJvaSEgOm8="));
			}
		}
