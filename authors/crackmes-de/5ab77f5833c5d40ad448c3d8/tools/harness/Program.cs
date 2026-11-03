// Harness : exécute l'IL d'origine de Form1 (var3/var5/var10/var11...) sans WinForms (stub minimal).
// usage: h.dll Keygenme2.exe <name> [<serial>]   (variable d env minuscule "computername" : Environ est sensible à la casse sous Linux)
using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
class P {
  static void Main(string[] a) {
    System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
    var asm = Assembly.LoadFrom(a[0]);
    var t = asm.GetType("WindowsApplication1.Form1");
    var f = RuntimeHelpers.GetUninitializedObject(t);
    void Set(string n, string v) { t.GetField(n, BindingFlags.NonPublic | BindingFlags.Instance).SetValue(f, new TextBox { Text = v }); }
    object Call(string n) => t.GetMethod(n).Invoke(f, null);
    Set("_TextBox1", a[1]);
    Set("_TextBox2", a.Length > 2 ? a[2] : "");
    Console.WriteLine("serial attendu (var11) = " + Call("var11"));
    Console.WriteLine("verdict (var10)       = " + Call("var10"));
  }
}
