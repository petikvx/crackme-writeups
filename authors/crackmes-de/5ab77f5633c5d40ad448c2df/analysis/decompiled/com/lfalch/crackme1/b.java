/*
 * Decompiled with CFR 0.152.
 */
package com.lfalch.crackme1;

import com.lfalch.crackme1.a;
import com.lfalch.crackme1.c;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;

final class b
implements ActionListener {
    private /* synthetic */ a a;

    b(a a2) {
        this.a = a2;
    }

    @Override
    public final void actionPerformed(ActionEvent actionEvent) {
        if (c.a(com.lfalch.crackme1.a.a(this.a).getText(), com.lfalch.crackme1.a.b(this.a).getText())) {
            JOptionPane.showMessageDialog(null, "You have entered a valid Serial!", "CRACKED", 1);
            return;
        }
        JOptionPane.showMessageDialog(null, "The information that you've entered is invalid", "Invalid", 2);
    }
}

