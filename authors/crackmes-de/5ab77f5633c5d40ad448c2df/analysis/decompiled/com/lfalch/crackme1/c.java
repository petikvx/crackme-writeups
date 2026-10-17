/*
 * Decompiled with CFR 0.152.
 */
package com.lfalch.crackme1;

import java.util.Random;

public final class c {
    private static char[] a = new char[]{'0', '1', '2', '3', '4', '5', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private static String b;
    private static String c;

    public static boolean a(String object, String string) {
        if ((string = string.toLowerCase()).length() != 16) {
            return false;
        }
        object = new Random(((String)object).hashCode() | b.hashCode());
        String string2 = "";
        int n = 0;
        while (n < 16) {
            string2 = String.valueOf(string2) + a[((Random)object).nextInt(a.length)];
            ++n;
        }
        byte[] byArray = c.getBytes();
        int n2 = 0;
        while (n2 < byArray.length) {
            int n3 = n2++;
            byArray[n3] = (byte)(byArray[n3] ^ 0x10);
        }
        c = new String(byArray);
        return string2.equals(string);
    }

    public static void b(String string, String string2) {
        b = string;
        c = string2;
    }
}

