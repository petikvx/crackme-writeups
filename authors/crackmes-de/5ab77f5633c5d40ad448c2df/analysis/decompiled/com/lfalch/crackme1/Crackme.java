/*
 * Decompiled with CFR 0.152.
 */
package com.lfalch.crackme1;

import com.lfalch.crackme1.a;
import com.lfalch.crackme1.c;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Window;
import javax.swing.JFrame;
import javax.swing.UIManager;

public class Crackme
extends JFrame {
    public static void main(String[] object) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        }
        catch (Exception exception) {
            System.out.println("Couldn't get that look and feel");
        }
        object = new Crackme();
        ((Frame)object).setTitle("LFalch's 1st crackme");
        int n = 230;
        n = 250;
        Object object2 = object;
        String string = "password123";
        String string2 = "LFalch";
        c.b("LFalch", string);
        super.setPreferredSize(new Dimension(250, 230));
        ((Frame)object).setResizable(false);
        ((JFrame)object).setDefaultCloseOperation(3);
        object2 = new a();
        ((JFrame)object).getContentPane().add((Component)object2);
        ((Window)object).pack();
        ((Window)object).setVisible(true);
    }
}

