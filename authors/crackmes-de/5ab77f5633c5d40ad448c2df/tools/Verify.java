public class Verify { public static void main(String[] a) {
  com.lfalch.crackme1.c.b("LFalch","password123");
  for (int i=0;i<a.length;i+=2) System.out.println(a[i]+" "+a[i+1]+" -> "+com.lfalch.crackme1.c.a(a[i],a[i+1]));
}}
