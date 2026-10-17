/*
 * Decompiled with CFR 0.152.
 */
package com.lfalch.crackme1;

import com.lfalch.crackme1.b;
import java.awt.Font;
import javax.swing.AbstractButton;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public final class a
extends JPanel {
    private JTextField a;
    private JTextField b;

    public a() {
        this.setLayout(null);
        JComponent jComponent = new JLabel("LFalch 1st CRACKME");
        jComponent.setBounds(10, 11, 228, 27);
        jComponent.setFont(new Font("Tahoma", 1, 22));
        this.add(jComponent);
        jComponent = new JLabel("Name:");
        jComponent.setBounds(10, 79, 46, 14);
        this.add(jComponent);
        jComponent = new JLabel("Serial:");
        jComponent.setBounds(10, 117, 46, 14);
        this.add(jComponent);
        this.a = new JTextField();
        this.a.setBounds(45, 76, 180, 20);
        this.add(this.a);
        this.a.setColumns(10);
        this.b = new JTextField();
        this.b.setColumns(10);
        this.b.setBounds(45, 114, 180, 20);
        this.add(this.b);
        jComponent = new JButton("Verify");
        jComponent.setFont(new Font("Tahoma", 1, 16));
        ((AbstractButton)jComponent).addActionListener(new b(this));
        jComponent.setBounds(10, 145, 215, 50);
        this.add(jComponent);
    }

    static /* synthetic */ JTextField a(a a2) {
        return a2.a;
    }

    static /* synthetic */ JTextField b(a a2) {
        return a2.b;
    }
}

